// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{




-------------------------------------------------------------------------------}

unit CRelInadAnaNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, db,
  DBTables, Wwquery, wwdblook, mAdministradora, uModuloImobiliario, uSistema,
  Mask, wwdbedit, Wwdbspin,uDiasInUteis;

type
  TRelInadAnaNovo = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    molResponsavel1: TmolResponsavel;
    rgOrdem: TRadioGroup;
    GroupBox2: TGroupBox;
    dblcbEstado: TwwDBLookupCombo;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoIDESTADO: TFloatField;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molAdministradora1: TmolAdministradora;
    chkFormaGerencial: TCheckBox;
    rgTipo: TRadioGroup;
    grpDatas: TGroupBox;
    Label2: TLabel;
    cmdtFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    qryParamOperDTULTFECH: TDateTimeField;
    dsParamOper: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdtFimExit(Sender: TObject);
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
    dDtAtualiza             : TDateTime;
  end;

var
  RelInadAnaNovo: TRelInadAnaNovo;
  DiasInUteis : TDiasInUteis; //Helen - SOL Nº141316 KINTANA Nº 894043

implementation

uses DRelFinanc, uFuncoesImob, uMensErro, UFuncAlienacao;

{$R *.DFM}

procedure TRelInadAnaNovo.AjustaGrupo;
begin
   case rgOrdem.ItemIndex of
      0 : dtmRelFinanc.rpInadAnaNovo.Groups[0].BreakName := 'RAZAOSOCIAL';
      1 : dtmRelFinanc.rpInadAnaNovo.Groups[0].BreakName := 'NOMECONTRATO';
   end;
end;



procedure TRelInadAnaNovo.bbtnConfirmarClick(Sender: TObject);
var dDataBaixa : TDateTime;
    dDataIni   : TDateTime; //Helen - SOL Nº141316 KINTANA Nº 894043
begin
   inherited;
   //Helen - SOL Nº141316 KINTANA Nº 894043
   if (length(trim(edDataAtualiza.Text)) = 0) then
   begin
      MsgDlg('Preencha a data de atualização.', 'Erro ',mtError,[mbOK],0);
      edDataAtualiza.SetFocus;
   end;
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
         dDataIni   := StrToDate('01/'+ IntToStr(cboMesCompetencia.ItemIndex+1)+'/'+(DBspnAnoCompetencia.EditText));
      end
      else
      begin
         dDataBaixa := cmdtFim.Date;
         dDataIni   := StrToDate('31/12/2004');///douglas.siqueira
//         dDataIni   := StrToDate('31/12/1990');
      end;

   end;
   // atualiza parcelas em atraso
   {if cmdtFim.Text = '' then
        dDataBaixa := -1
   else dDataBaixa := cmdtFim.Date; }
   //Helen - SOL Nº141316 KINTANA Nº 894043 - Fim

   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) and
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) then

      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta,
                                           molComprador1.iComprador,
                                           molResponsavel1.iResponsavel,
                                           molAdministradora1.iAdministradora, -1,
                                           dDataBaixa) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;

// Vinicius - 20/04/2005 - Funcionalidade alterada

   MontaQuery;

   LimpaParametros(dtmRelFinanc.qryInadAnaNovo);
   with dtmRelFinanc.qryInadAnaNovo do begin
      //Helen - SOL Nº141316 KINTANA Nº 894043
      {if molProposta1.iProposta > 0 then
         ParamByName('pIDCONTRATOIMOVEL').AsFloat := molProposta1.iProposta;
      if molComprador1.iComprador > 0 then
         ParamByName('pIDCOMPRADOR').AsFloat := molComprador1.iComprador;
      if molResponsavel1.iResponsavel > 0 then
         ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
      if molAdministradora1.iAdministradora > 0 then
         ParamByName('pIDADMINIMOVEL').AsFloat := molAdministradora1.iAdministradora;
      if cmdtFim.Text <> '' then
         ParamByName('pDTFIM').AsString := DateToStr(cmdtFim.Date);
      if dblcbEstado.Value <> '' then
         ParamByName('pUF').AsString  := dblcbEstado.Value; }

      ParamByName('pDTINI').AsString    := DateToStr(dDataIni);
      if cmdtFim.Text <> '' then
         ParamByName('pDTFIM').AsString := DateToStr(cmdtFim.Date)
      else
         ParamByName('pDTFIM').AsString := DateToStr(dDataBaixa);

      //Helen - SOL Nº141316 KINTANA Nº 894043 - Fim


      if rgTipo.ItemIndex = 0 then
         ParamByName('PFLGTIPOCONTRATO').AsString  := 'C'
      else
         ParamByName('PFLGTIPOCONTRATO').AsString  := 'A';
     try
      Open;
      except
       dtmRelFinanc.qryInadAnaNovo.SQL.SaveToFile('c:\1.txt');
      end;
   end;
   if cmdtFim.Text <> '' then
      dtmRelFinanc.ppDtInadAnaNovo.Caption := 'Data Limite: ' + DateToStr(cmDtFim.Date)
   else
      dtmRelFinanc.ppDtInadAna.Caption := 'Data Limite: ' + DateToStr(dDataBaixa);
   if chkFormaGerencial.Checked then begin
      dtmRelFinanc.ppTituloInadAnaNovo.Caption := 'Inadimplência de Alienação - Analítico ( Novo - Gerencial )';
   end else begin
      dtmRelFinanc.ppTituloInadAnaNovo.Caption := 'Inadimplência de Alienação - Analítico ( Novo - Operacional )';
   end;

   dtmRelFinanc.bSeparador := chkLinhas.Checked;
   // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
   dtmRelFinanc.bCorlinha  := chkCorLinha.Checked;
   dtmRelFinanc.CorLinha   := cboCorLinha.SelectedColor ;
end;

procedure TRelInadAnaNovo.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;


procedure TRelInadAnaNovo.FormShow(Sender: TObject);
begin
   inherited;
   //Helen - SOL Nº141316 KINTANA Nº 894043
   cboMesCompetencia.Enabled     := True;
   DBspnAnoCompetencia.Enabled   := True;
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);
   cmDtFim.Clear;
   //cmDtFim.Date      := Date();
   //Helen - SOL Nº141316 KINTANA Nº 894043 - Fim

   rgOrdem.ItemIndex := 0;
   qryLookEstado.Open;
end;

procedure TRelInadAnaNovo.MontaQuery;
var sSql : string;
    dDataLanc , edDataOper: TDateTime; //Helen - SOL Nº141316 KINTANA Nº 894043
begin
   //Higor Nayde Ferreira SOL 187177/11102 - KTN 1772768- Inicio
   edDataOper := edDataAtualiza.Date;
   sSql := 'SELECT PF.IDPARCFINANCIMOV, '+#13+
           '       PF.IDCONDPAGIMOVEL,  '+#13+
           '       CP.IDCONTRATOIMOVEL, '+#13+
           '       CI.CONNUMERO,        '+#13+
           '       CI.CONNOME,          '+#13+
           '       (CI.CONNUMERO || '' - '' || CI.CONNOME) AS NOMECONTRATO, '+#13+
           '       P.RAZAOSOCIAL,       '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO,  '+#13+
           '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO) + NVL(ALT.TOT_ALTERADOR,0) AS VLRPRESTACAO,    '+#13+
           '       PF.FLGTIPOLANC,        '+#13+
           '       PF.FLGLANCINTEGRA,     '+#13+

           '       PP.DATAPAGAMENTO,      '+#13+
           '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '+#13+

           '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '+#13;

   // Forma gerencial mostra atualização de baixas manuais que não foram contabilizadas
   if chkFormaGerencial.Checked then begin
      sSql := sSql +
           '       PF.VLRCORRIGIDOATRASO - PF.VLRPRESTACAO AS VLRCMATRASO, '+#13+
           '       NVL( PF.VLRMULTAATRASO, 0 ) AS VLRMULTAATRASO,          '+#13+
           '       NVL( PF.VLRMORAATRASO, 0 )  AS VLRMORAATRASO,           '+#13+
           '       ROUND( ( ( NVL( PF.VLRCORRIGIDOATRASO, 0 ) + NVL( PF.VLRMULTAATRASO, 0 ) + NVL( PF.VLRMORAATRASO, 0 ) ) - NVL( PF.VLRPAGO, 0 ) ), 2 ) AS VLRDIF, '+#13+
           '       ROUND( DECODE( PF.DATAPAGAMENTO, NULL, NVL( PF.VLRPRESTCORRIG, 0 ) - DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO), '+#13+
           '                    ( NVL( PF.VLRPRESTCORRIG, 0 ) ) - ( ( NVL( PF.VLRCORRIGIDOATRASO, 0 ) + NVL( PF.VLRMULTAATRASO, 0 ) + NVL( PF.VLRMORAATRASO,0) ) - NVL( PF.VLRPAGO, 0 ) ) ), 2) AS VLRCMCORRIG, '+#13+
           '       NVL( VLRMULTACORRIG, 0 )    AS VLRMULTACORRIG,          '+#13+
           '       NVL( PF.VLRJUROSCORRIG, 0 ) AS VLRJUROSCORRIG,          '+#13+
           '       NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) AS VLRDEVIDO '+#13;
   end else begin
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
           '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0) + NVL(ALT.TOT_ALTERADOR,0) ,2)  AS VLRDEVIDO  '+#13;

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
           '              NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) + NVL(ALT.TOT_ALTERADOR,0) ) AS VLRDEVIDO  '+#13;
      end;
   end;
      sSql := sSql +
           '  FROM PARCFINANCIMOV PF, '+#13+
           '       CONDPAGIMOVEL  CP, '+#13+
           '       CONTRATOIMOVEL CI, '+#13+
           '       PESSOA P,          '+#13+

           //Pendência 28049
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
           '            AND C.DATA >= :pDTINI                                      '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
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
           //Fim da Pendência 28049

           '       ( SELECT /*+ INDEX(D) INDEX(LD) PARALLEL(D 20)*/            '+#13+
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
           '                                                                 AND   DATA        >=  TO_DATE(:pDTINI,''DD/MM/YYYY'')   ' + #13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '                                                                 AND   DATA        <=  TO_DATE(:pDTFIM,''DD/MM/YYYY''))) ' + #13;

           sSql := sSql +
           '            AND PA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '+#13+
           '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '+#13+
           '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '+#13+
           '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '+#13+
           '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '+#13+
           '            AND LD.DATALANCTO >= :pDTINI                    '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '            AND LD.DATALANCTO <= :pDTFIM                    '+#13+
           '            AND ( PA.IDOPERATUALCM IS NULL OR               '+#13+
           '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '+#13+
           '            AND D.IDMODULO = 135                            '+#13+
           '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+

           '       ( '+#13+
           '         SELECT /*+ INDEX(LD) INDEX(RP) PARALLEL(LD 20)*/   '+#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
           '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
           '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
           '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
           '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
           '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO >= :pDTINI AND DATAPAGAMENTO <= :pDTFIM ) OR '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
           '                                             AND LD.ESTORNO IS NULL            '+#13+
           '                                             AND LD.DATALANCTO >= :pDTINI      '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '                                             AND LD.DATALANCTO <= :pDTFIM ) )  '+#13+
           '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                            '+#13+
           '       ) PP, '+#13+

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
           '         FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 20) */ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMA, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRASO '+#13+
           '         FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 4) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTAATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE L2.IDMODULO = 135 '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MA, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '+#13+
           '        FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 4) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORAATRASO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE L.IDMODULO = 135 '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NOT NULL '+#13+
           '               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE L2.IDMODULO = 135 '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '               AND L2.DATABAIXA IS NOT NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JA, '+#13+

//----------

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOSALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 4)*/ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOSALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND L.DATABAIXA IS NULL '+#13+
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMS, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 4) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTASALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND L.DATABAIXA IS NULL '+#13+
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '                AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MS, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '+#13+
           '        FROM ( SELECT /*+ INDEX (L XIE2LANCOPERDIAIMOB) PARALLEL(L 4) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORASALDO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE L.IDMODULO = 135 '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;
           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NULL '+#13+
           '               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2 XIE2LANCOPERDIAIMOB) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE L2.IDMODULO = 135 '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '         AND ( DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13 +
           '               AND L2.DATABAIXA IS NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JS, '+#13+

//----------- Abonos
           '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '+#13+
           '       FROM ( SELECT /*+ INDEX (L) PARALLEL(L 4) */ '+#13+
           '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '              WHERE L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '            AND(FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOCM ) '+#13+
           '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '           ( SELECT /*+ INDEX (L2) PARALLEL(L2 4) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '              WHERE L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '         AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
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
           '                C.UF        AS UF    '+#13+
           '           FROM CONTRATOXIMOVEL CXI, '+#13+
           '                IMOVEL I, '+#13+
           '                IMOVEL M, '+#13+
           '                CIDADES C '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL              '+#13+
           '           AND  M.IDCIDADES = C.IDCIDADES(+)           '+#13+
           '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM     '+#13+
           '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))          '+#13+

           //Pendência 28049

           {// Daniel - 18795
           '    AND (NVL(PF.FLGLANCINTEGRA,0) NOT IN (5,6)) '       +#13+
           // Fim.}
           '    AND (PF.IDPARCFINANCIMOV NOT IN( SELECT IDPARCFINANCIMOV '+#13+
           '                          FROM CONCILIADOC                   '+#13+
           '                WHERE FLGTIPO = ''R''                        '+#13+
           '                  AND DATA >= :pDTINI                        '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '                  AND DATA <= :pDTFIM))                      '+#13+

           //'    AND (NVL(PF.FLGCONCILIADO,''N'') IN (''N'',''P'')) '+#13+
           '    AND (NVL(CD2.CONCILIADOC, NVL(PF.FLGCONCILIADO, ''N'')) IN (''N'', ''P'')) '+#13+
        //Fim Pendência 28049


           '    AND (NVL(PF.FLGCONCILIADO,''N'') IN (''N'',''P'')) '+#13+
           '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '+#13+
           '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '+#13+
           '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '+#13+
           '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+

           '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))  '+#13+
           '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))  '+#13+

           //Pendência 28049
           '    AND (PF.IDPARCFINANCIMOV = CD2.IDPARCFINANCIMOV(+))    '+#13+
          //Fim Pendência 28049

           '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '+#13+

           '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '+#13+
           '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '+#13;
           // Helen - SOL: 141316 KTN: 894043 - Para melhorar a performace
           if molProposta1.iProposta > 0 then
              sSQL := sSQL +  ' AND (CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + ')'+#13;

           if molComprador1.iComprador > 0 then
              sSQL := sSQL +  ' AND (CI.IDLOCATARIO = ' + IntToStr(molComprador1.iComprador) + ')'+#13;

           if molResponsavel1.iResponsavel > 0 then
              sSQL := sSQL +  ' AND (CI.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel) + ')'+#13;

           if molAdministradora1.iAdministradora > 0 then
              sSQL := sSQL +  ' AND (CI.IDADMINIMOVEL = ' + IntToStr(molAdministradora1.iAdministradora) + ')'+#13;

           if dblcbEstado.Value <> '' then
              sSQL := sSQL + '(TRIM(IM.UF) = ''' + dblcbEstado.Value + '''))'+ #13;
           {
           '    AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL) ) '+#13+
           '    AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMPRADOR) )                '+#13+
           '    AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRESPONSAVEL) )          '+#13+
           '    AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADMINIMOVEL) )          '+#13+
           '    AND ( (:pDTINI IS NULL) OR (PF.DATAVENCIMENTO >= TO_DATE(:pDTINI,''DD/MM/YYYY'')) ) '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '    AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <= TO_DATE(:pDTFIM,''DD/MM/YYYY'')) ) '+#13+
           '    AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )                                     '+#13+
           }
           // Daniel - 18795
           sSQL := sSQL +
           '    AND ( (PF.DATAVENCIMENTO >= TO_DATE(:pDTINI,''DD/MM/YYYY'')) ) '+#13+ //Helen - SOL Nº141316 KINTANA Nº 894043
           '    AND ( (PF.DATAVENCIMENTO <= TO_DATE(:pDTFIM,''DD/MM/YYYY'')) ) '+#13+
           '    AND ( CI.FLGTIPOCONTRATO = ''P'' OR CI.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )        '+#13+
           // Fim.

           '  ORDER BY CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';

   dtmRelFinanc.qryInadAnaNovo.Sql.Text := sSql;
   //Jéssica  SOL 109421 KINTANA 496332
   //dtmRelFinanc.qryInadAna.Sql.savetofile('c:\relinadana.txt');
     dtmRelFinanc.qryInadAnaNovo.Sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\relinadanaNovo.txt');
   //Fim Jéssica
   //Higor Nayde Ferreira SOL 187177/11102 - KTN 1772768 Fim
end;


procedure TRelInadAnaNovo.AjustaOperacional;
begin
   with dtmRelFinanc.qryInadAnaNovo do begin
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


procedure TRelInadAnaNovo.cmdtFimExit(Sender: TObject);
begin
  inherited;
  //Helen - SOL Nº141316 KINTANA Nº 894043
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

procedure TRelInadAnaNovo.FormCreate(Sender: TObject);
begin
  inherited;
  //Helen - SOL Nº141316 KINTANA Nº 894043
  qryParamOper.Close;
  qryParamOper.Open;
  edDataAtualiza.Date := qryParamOper.FieldByName('DTULTFECH').AsDateTime;
  dDtAtualiza         := edDataAtualiza.Date;
end;

end.
