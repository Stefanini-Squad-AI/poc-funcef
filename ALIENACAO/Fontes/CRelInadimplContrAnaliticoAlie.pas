// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
Rotina......:
Nº SOL......: 141316
Nº KINTANA..: 894043
Data........: 11/03/2011
Responsável.: Helen V. Bianchi
Descrição...:
--------------------------------------------------------------------------------
}
unit CRelInadimplContrAnaliticoAlie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, db,
  DBTables, Wwquery, wwdblook, mAdministradora, uModuloImobiliario, uSistema,
  Mask, wwdbedit, Wwdbspin,uDiasInUteis;

type
  TRelInadimplContrAnalitico = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molResponsavel1: TmolResponsavel;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molAdministradora1: TmolAdministradora;
    grpDatas: TGroupBox;
    Label2: TLabel;
    cmdtIni: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    Label5: TLabel;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label1: TLabel;
    cmdtFim: TCMDateTimePicker;
    chkAgrupaSegmento: TCheckBox;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    qryParamOperDTULTFECH: TDateTimeField;
    dsParamOper: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdtIniExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AjustaGrupo;
    procedure MontaQuery;
    procedure AjustaOperacional;
  public
    { Public declarations }
    bSeparador, bCorLinha   : boolean;
    CorLinha, CorAtual      : TColor;
  end;

var
  RelInadimplContrAnalitico: TRelInadimplContrAnalitico;
  DiasInUteis : TDiasInUteis;

implementation

uses DRelFinanc, uFuncoesImob, uMensErro, UFuncAlienacao,dLookImobiliario;

{$R *.DFM}

procedure TRelInadimplContrAnalitico.AjustaGrupo;
begin

end;



procedure TRelInadimplContrAnalitico.bbtnConfirmarClick(Sender: TObject);
var dDataBaixa : TDateTime;
    dDataIni   : TDateTime;
begin
   inherited;
   if ( (length(trim(cmdtFim.Text)) = 0) and
       ( (cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0) ) ) then
   begin
      MsgDlg('É necessário indicar a Data ou o Mês de Competência!', 'Erro ',mtError,[mbOK],0);
      cmdtFim.SetFocus;
      Exit;
   end
   else
   begin
      if (length(trim(cmdtFim.Text)) = 0) then
      begin
         dDataBaixa := DiasInUteis.UltDiaMes(trunc(DBspnAnoCompetencia.Value),(cboMesCompetencia.ItemIndex + 1));
         dDataIni   := StrToDate('01/'+ IntToStr(cboMesCompetencia.ItemIndex + 1)+'/'+(DBspnAnoCompetencia.EditText));
      end
      else
      begin
         dDataBaixa := cmdtFim.Date;
         dDataIni   := StrToDate('31/12/1990');
      end;
   end;
   if (length(trim(edDataAtualiza.Text)) = 0) then
   begin
      MsgDlg('Preencha a data de atualização.', 'Erro ',mtError,[mbOK],0);
      edDataAtualiza.SetFocus;
   end;
   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) and
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) then

      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta,
                                           0,
                                           molResponsavel1.iResponsavel,
                                           molAdministradora1.iAdministradora, -1,
                                           dDataBaixa) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;
   MontaQuery;

   LimpaParametros(dtmRelFinanc.qryInadimplContrAnalitico);
   with dtmRelFinanc.qryInadimplContrAnalitico do
   begin
      ParamByName('pDTINI').AsString    := DateToStr(dDataIni);
      if cmdtIni.Text <> '' then
         ParamByName('pDTINI').AsString := DateToStr(cmdtIni.Date);
      if cmdtFim.Text <> '' then
         ParamByName('pDTFIM').AsString := DateToStr(cmdtFim.Date)
      else
         ParamByName('pDTFIM').AsString := DateToStr(dDataBaixa);
      Open;
   end;
   if cmdtFim.Text <> '' then
   begin
      if cmdtIni.Text <> '' then
         dtmRelFinanc.rptInadimplContrAnaliticolblDtInicio.Caption := DateToStr(cmdtIni.Date)
      else
         dtmRelFinanc.rptInadimplContrAnaliticolblDtInicio.Caption := '';
      dtmRelFinanc.rptInadimplContrAnaliticolblDataFim.Caption  := DateToStr(cmDtFim.Date);
      dtmRelFinanc.rptInadimplContrAnaliticolblMes.Caption      := '';
   end
   else
   begin
      dtmRelFinanc.rptInadimplContrAnaliticolblDtInicio.Caption := '';
      dtmRelFinanc.rptInadimplContrAnaliticolblDataFim.Caption  := '';
      dtmRelFinanc.rptInadimplContrAnaliticolblMes.Caption      :=  cboMesCompetencia.Text + '/' +DBspnAnoCompetencia.Text;
   end;
   if molResponsavel1.iResponsavel > 0 then
      dtmRelFinanc.rptInadimplContrAnaliticolblResponsavel.Caption    :=  molResponsavel1.edtResponsavel.text
   else
      dtmRelFinanc.rptInadimplContrAnaliticolblResponsavel.Caption    := '< Todos >';
   if molAdministradora1.iAdministradora > 0 then
      dtmRelFinanc.rptInadimplContrAnaliticolblAdministradora.Caption :=  molAdministradora1.edtAdministradora.Text
   else
      dtmRelFinanc.rptInadimplContrAnaliticolblAdministradora.Caption := '< Todos >';
   if DBcboTipoImovel.LookupValue <> '' then
      dtmRelFinanc.rptInadimplContrAnaliticolblSegmento.Caption        := DBcboTipoImovel.Text
   else
      dtmRelFinanc.rptInadimplContrAnaliticolblSegmento.Caption        :='< Todos >';

   dtmRelFinanc.bSeparador := chkLinhas.Checked;
   // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
   dtmRelFinanc.bCorlinha  := chkCorLinha.Checked;
   dtmRelFinanc.CorLinha   := cboCorLinha.SelectedColor ;
end;

procedure TRelInadimplContrAnalitico.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;


procedure TRelInadimplContrAnalitico.FormShow(Sender: TObject);
begin
   inherited;
   cboMesCompetencia.Enabled     := True;
   DBspnAnoCompetencia.Enabled   := True;
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);
   cmdtIni.Clear; cmDtFim.Clear;
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;

procedure TRelInadimplContrAnalitico.MontaQuery;
var sSql : string; edDataOper : TDateTime;
begin
   edDataOper  := edDataAtualiza.Date;
   sSql := 'SELECT PF.IDPARCFINANCIMOV, '+#13+
           '       PF.IDCONDPAGIMOVEL,  '+#13+
           '       CP.IDCONTRATOIMOVEL, '+#13+
           '       CI.CONNUMERO, CI.CONNUMERO AS NUMERO_CONTRATO,       '+#13+
           '       CI.CONNOME,          '+#13+
           '       T.DESCTIPOIMOVEL ,   '+#13+
           '       PF.CODDOCUMENTO,     '+#13+
           '       PA.NOME AS NOMEADMIN,'+#13+
           '       (CI.CONNUMERO || '' - '' || CI.CONNOME) AS NOMECONTRATO, '+#13+
           '       P.NOME,P.RAZAOSOCIAL,CI.CONDATAASSINATURA,       '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO,  '+#13+
           '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO) + NVL(ALT.TOT_ALTERADOR,0) AS VLRPRESTACAO,    '+#13+
           '       PF.FLGTIPOLANC,        '+#13+
           '       PF.FLGLANCINTEGRA,     '+#13+
           '       PP.DATAPAGAMENTO,TO_CHAR(PF.DATAVENCIMENTO,''mm/yyyy'') AS COMP,      '+#13+
           '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '+#13+
           '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '+#13;


      if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
         (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
         (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) then
      begin
         sSql := sSql +
           '       ROUND( ( ( NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) + NVL(ALT.TOT_ALTERADOR,0) ), 2 )  AS VLRDIF, '+#13+
           '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,  '+#13+
           '       MA.VLRMULTAATRASO AS VLRMULTAATRASO,  '+#13+
           '       JA.VLRMORAATRASO AS VLRMORAATRASO,  '+#13+
           '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,  '+#13+
           '       MS.VLRMULTASALDO   AS VLRMULTACORRIG,  '+#13+
           '       JS.VLRMORASALDO AS VLRJUROSCORRIG,  '+#13+
           '       ROUND(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 )  - NVL( PP.VLRPAGO, 0 ) +  '+#13+
           '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0) + NVL(ALT.TOT_ALTERADOR,0) ,2)  AS VLRDEVIDO,  '+#13+
           '       TO_CHAR(TT.DATALANCTO,''mm/yyyy'') AS COMPETENCIA                                                                                                       '+#13;

      end
      else
      begin
         sSql := sSql +
           '       DECODE(PF.FLGTIPOLANC,4,0,DECODE(PF.CODDOCUMENTO, NULL, NVL(PF.VLRPRESTACAO,0) - NVL(PP.VLRPAGO,0),                  '+#13+
           '              ROUND( ( ( NVL( PF.VLRCORRIGIDOATRASO, 0 ) + NVL( PF.VLRMULTAATRASO, 0 ) + NVL( PF.VLRMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) + NVL(ALT.TOT_ALTERADOR,0) ), 2 ) )) AS VLRDIF,  '+#13+

           '       DECODE(PF.CODDOCUMENTO, NULL, 0, DECODE(PF.FLGTIPOLANC,4,0,PF.VLRCORRIGIDOATRASO - PF.VLRPRESTACAO)) AS VLRCMATRASO,  '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, 0, DECODE(PF.FLGTIPOLANC,4,0,NVL( PF.VLRMULTAATRASO, 0 )) ) AS VLRMULTAATRASO,          '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, 0, DECODE(PF.FLGTIPOLANC,4,0,NVL( PF.VLRMORAATRASO, 0 ))  ) AS VLRMORAATRASO,           '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, 0,  '+#13+
           '              ROUND( DECODE( PF.DATAPAGAMENTO, NULL, NVL( PF.VLRPRESTCORRIG, 0 ) - DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO), '+#13+
           '                   ( NVL( PF.VLRPRESTCORRIG, 0 ) ) - ( ( NVL( PF.VLRCORRIGIDOATRASO, 0 ) + NVL( PF.VLRMULTAATRASO, 0 ) + NVL( PF.VLRMORAATRASO,0) ) - NVL( PP.VLRPAGO, 0 ) ) ), 2) ) AS VLRCMCORRIG,  '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, 0, NVL( VLRMULTACORRIG, 0 ) )    AS VLRMULTACORRIG,  '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, 0, NVL( PF.VLRJUROSCORRIG, 0 ) ) AS VLRJUROSCORRIG,  '+#13+
           '       DECODE(PF.CODDOCUMENTO, NULL, DECODE(PF.FLGCONCILIADO, ''S'', 0, ''C'', 0, NVL(PF.VLRPRESTACAO,0) - NVL(PP.VLRPAGO,0) ),  '+#13+
           '       NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) + NVL(ALT.TOT_ALTERADOR,0) ) AS VLRDEVIDO, '+#13+
           '       TO_CHAR(TT.DATALANCTO,''mm/yyyy'') AS COMPETENCIA                                                                         '+#13;
      end;

      sSql := sSql +
           '  FROM PARCFINANCIMOV PF, '+#13+
           '       CONDPAGIMOVEL  CP, '+#13+
           '       CONTRATOIMOVEL CI, '+#13+
           '       PESSOA P,          '+#13+
           '       PESSOA PA,         '+#13+
           '       TIPOIMOVEL T,      '+#13+
           '        (SELECT C.IDPARCFINANCIMOV,                                    '+#13+
           '                DECODE(C.FLGTIPO, NULL, NULL,                          '+#13+
           '                       ''R'', ''S'', ''T'', ''S'', ''M'',              '+#13+
           '                       ''P'',''J'',''P'',''C'',''P'',                  '+#13+
           '                       ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC, '+#13+
           '                MAX(C.DATA) AS DATA,                                   '+#13+
           '                MAX(C.FLGTIPO) AS FLGTIPO,                             '+#13+
           '                COUNT(*) AS QTDE                                       '+#13+
           '           FROM CONCILIADOC C, PARCFINANCIMOV P                        '+#13+
           '          WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV                '+#13+
           '            AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'')     '+#13+
           '            AND C.DATA >= :pDTINI                                      '+#13+ 
           '            AND C.DATA <= :pDTFIM                                      '+#13+
           '            AND ( C.FLGTIPO IN (''T'',''R'') OR                        '+#13+
           '                  NOT EXISTS ( SELECT 1                                '+#13+
           '                                 FROM CONCILIADOC                      '+#13+
           '                                WHERE FLGTIPO IN (''T'',''R'')         '+#13+
           '                                  AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ))'+#13+
           '         GROUP BY C.IDPARCFINANCIMOV,                                  '+#13+
           '                  DECODE(C.FLGTIPO, NULL, NULL,                        '+#13+
           '                  ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',       '+#13+
           '                  ''P'',''C'',''P'',                                   '+#13+
           '                  ''A'', ''C'', P.FLGCONCILIADO )) CD2,                '+#13+
           '       ( SELECT /*+ INDEX(D) INDEX(LD)*/            '+#13+
           '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
           '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
           '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
           '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
           '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
           '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
           '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+
           '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'') ) TC                  '+#13+
           '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
           '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13;

           if Sistema.TipoCliente = 19991 then sSql := sSql +
           '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
           '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
           '                                                                 FROM CONCILIADOC ' + #13 +
           '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
           '                                                                 AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
           '                                                                 AND   DATA        >=  TO_DATE(:pDTINI,''DD/MM/YYYY'')   ' + #13+
           '                                                                 AND   DATA        <=  TO_DATE(:pDTFIM,''DD/MM/YYYY''))) ' + #13;

           sSql := sSql +
           '            AND PA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '+#13+
           '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '+#13+
           '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '+#13+
           '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '+#13+
           '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '+#13+
           '            AND LD.DATALANCTO >= :pDTINI                    '+#13+ 
           '            AND LD.DATALANCTO <= :pDTFIM                    '+#13+
           '            AND ( PA.IDOPERATUALCM IS NULL OR               '+#13+
           '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '+#13+
           '            AND D.IDMODULO = 135                            '+#13+
           '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+

           '       ( '+#13+
           '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '+#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
           '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
           '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
           '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
           '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
           '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO >= :pDTINI AND DATAPAGAMENTO <= :pDTFIM ) OR '+#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
           '                                             AND LD.ESTORNO IS NULL            '+#13+
           '                                             AND LD.DATALANCTO >= :pDTINI      '+#13+
           '                                             AND LD.DATALANCTO <= :pDTFIM ) )  '+#13+
           '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                            '+#13+
           '       ) PP, '+#13+

           '       ( '+#13+
           '         SELECT IDPARCFINANCIMOV, LD.DATALANCTO'+#13+
           '         FROM PARCFINANCIMOV P, LANCTODOCUM LD '+#13+
           '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
           '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO >= :pDTINI AND DATAPAGAMENTO <= :pDTFIM ) OR '+#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''2'' OR LD.CODALTERADOR = 215 ) '+#13+
           '                                             AND LD.ESTORNO IS NULL            '+#13+
           '                                             AND LD.DATALANCTO >= :pDTINI      '+#13+
           '                                             AND LD.DATALANCTO <= :pDTFIM ) )  '+#13+
           '          GROUP BY IDPARCFINANCIMOV,LD.DATALANCTO                              '+#13+
           '       ) TT, '+#13+

           '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '+#13+
           '                A.NUMPARCELAS    AS NUMPARCELAS,   '+#13+
           '                A.DATAINI,                         '+#13+
           '                A.IDCONDPAGIMOVEL                  '+#13+
           '           FROM CONDPAGIMOVEL A,                   '+#13+
           '                (SELECT IDCONDINICIAL,             '+#13+
           '                        MAX(DATAINI) AS DATAINI    '+#13+
           '                   FROM CONDPAGIMOVEL              '+#13+
           '                  GROUP BY IDCONDINICIAL) B        '+#13+
           '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '+#13+
           '            AND B.DATAINI       = A.DATAINI ) CPFINAL,    '+#13+
//----------
           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOATRASO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '                AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMA, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRASO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTAATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '                AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MA, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '+#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORAATRASO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NOT NULL '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '                AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '               AND L2.DATABAIXA IS NOT NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JA, '+#13+

//----------

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOSALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOSALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND L.DATABAIXA IS NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '                AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMS, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTASALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND L.DATABAIXA IS NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '                AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MS, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '+#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORASALDO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NULL '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '               AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '               AND L2.DATABAIXA IS NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JS, '+#13+

//----------- Abonos
           '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '+#13+
           '       FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOCM ) '+#13+
           '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '+#13+
           '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '+#13+
           '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           'AND D1.DATAOPER = D2.DTAPUR '+#13+
           ') ABONO, '+#13 +

           '       ( SELECT DISTINCT                                  '+#13+
           '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '+#13+
           '                M.IMONOME   AS NOMEMESTRE,                '+#13+
           '                M.IDIMOVEL  AS IDIMOVELMESTRE,            '+#13+
           '                I.CODTIPIMOVEL ,                          '+#13+
           '                C.UF        AS UF    '+#13+
           '           FROM CONTRATOXIMOVEL CXI, '+#13+
           '                IMOVEL I, '+#13+
           '                IMOVEL M, '+#13+
           '                CIDADES C '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL              '+#13+
           '           AND  M.IDCIDADES = C.IDCIDADES(+)           '+#13+
           '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM     '+#13+
           '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))          '+#13+
           '    AND (PF.IDPARCFINANCIMOV NOT IN( SELECT IDPARCFINANCIMOV '+#13+
           '                          FROM CONCILIADOC                   '+#13+
           '                WHERE FLGTIPO = ''R''                        '+#13+
           '                  AND DATA >= :pDTINI                        '+#13+
           '                  AND DATA <= :pDTFIM))                      '+#13+


           '    AND (NVL(CD2.CONCILIADOC, NVL(PF.FLGCONCILIADO, ''N'')) IN (''N'', ''P'')) '+#13+

           '    AND (NVL(PF.FLGCONCILIADO,''N'') IN (''N'',''P'')) '+#13+
           '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '+#13+
           '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '+#13+
           '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '+#13+
           '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (TT.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))  '+#13+

           '    AND (PF.IDPARCFINANCIMOV = CD2.IDPARCFINANCIMOV(+))    '+#13+
           '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '+#13+

           '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '+#13+
           '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '+#13+
           '    AND (IM.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '+#13 +
           '    AND (CI.IDADMINIMOVEL = PA.IDPESSOA)        '+#13 ;
           if molProposta1.iProposta > 0 then
              sSQL := sSQL +  ' AND (CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + ')'+#13;

           if molResponsavel1.iResponsavel > 0 then
              sSQL := sSQL +  ' AND (CI.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel) + ')'+#13;

           if molAdministradora1.iAdministradora > 0 then
              sSQL := sSQL +  ' AND (CI.IDADMINIMOVEL = ' + IntToStr(molAdministradora1.iAdministradora) + ')'+#13;

           if DBcboTipoImovel.LookupValue <> '' then
              sSQL := sSQL +  ' AND ( IM.CODTIPIMOVEL = ' + QuotedStr(DBcboTipoImovel.LookupValue) + ' ) '+#13;

           sSQL := sSQL + '    AND (  (PF.DATAVENCIMENTO >= TO_DATE(:pDTINI,''DD/MM/YYYY'')) ) '+#13+
           '    AND (  (PF.DATAVENCIMENTO <= TO_DATE(:pDTFIM,''DD/MM/YYYY'')) ) '+#13+
           '    AND ( CI.FLGTIPOCONTRATO = ''P'' OR CI.FLGTIPOCONTRATO = ''C'' ) ' + #13 ;

           sSQL := sSQL + ' ORDER BY ' + #13;
           if (chkAgrupaSegmento.Checked) then
              sSQL := sSQL + ' T.DESCTIPOIMOVEL, CI.CONNUMERO, CI.CONNOME, PF.IDCONDPAGIMOVEL,PF.NUMPARCELA, PF.CODDOCUMENTO '
           else
              sSQL := sSQL + ' CI.CONNUMERO, CI.CONNOME, PF.IDCONDPAGIMOVEL,PF.NUMPARCELA , PF.CODDOCUMENTO';
   dtmRelFinanc.qryInadimplContrAnalitico.Sql.Text := sSql;
   dtmRelFinanc.qryInadimplContrAnalitico.Sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\relinadanaCont.txt');
end;


procedure TRelInadimplContrAnalitico.AjustaOperacional;
begin
   with dtmRelFinanc.qryInadimplContrAnalitico do begin
      DisableControls;
      First;
      while not eof do begin
         if (FieldByName('VLRDIF').AsFloat < 0) or (FieldByName('VLRDEVIDO').AsFloat < 0) then begin
            Edit;
            if (FieldByName('VLRDIF').AsFloat < 0)    then FieldByName('VLRDIF').AsFloat    := 0;
            if (FieldByName('VLRDEVIDO').AsFloat < 0) then FieldByName('VLRDEVIDO').AsFloat := 0;
            Post;
         end;
         Next;
      end;
      First;
      EnableControls;
   end;
end;


procedure TRelInadimplContrAnalitico.cmdtIniExit(Sender: TObject);
begin
  inherited;
  if not (length(trim(cmdtFim.Text)) = 0) then
  begin
     cboMesCompetencia.Enabled   := False;
     DBspnAnoCompetencia.Enabled := False;
  end
  else
  begin
     cboMesCompetencia.Enabled   := True;
     DBspnAnoCompetencia.Enabled := True;
  end;

end;

procedure TRelInadimplContrAnalitico.FormCreate(Sender: TObject);
begin
  inherited;
  qryParamOper.Close;
  qryParamOper.Open;
  edDataAtualiza.Date := qryParamOper.FieldByName('DTULTFECH').AsDateTime;
end;

end.
