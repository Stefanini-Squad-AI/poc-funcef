{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL : 153702/5861 Kintana : 1372228
Responsável : Helen V. Bianchi
Função : MontaQueryoperacional
Data : 22/09/2011
Descrição : Data de corte 31/12/2011
--------------------------------------------------------------------------------
SOL : 152701
Responsável : Felipe de Oliveira
Função : MontaQueryoperacional
Data : 14/02/2011
Descrição : arruma a query e desfazer a alteração sol 144699
--------------------------------------------------------------------------------
SOL : 144699
Responsável : Felipe de Oliveira
Função : MontaQueryoperacional
Data : 13/12/2010
Descrição : Arrumar o campo TOT_CORRECAO do subselect do relatório para
            calcular o total com o campo certo
--------------------------------------------------------------------------------

Padrão      : 5.10.18 em diante...
Pendência   : 27508
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste dos Help Contexts...
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Exibe também o extrato das propostas.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelExtrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, mImovelMestre, uComunsImobiliarioDB, Wwdatsrc,
  DBClient, wwclient, wwdblook, uCtrlPlanPrevContabPatro, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, uCMClientDataSet, uCtrlPlanPrevContabil, uCtrlImovel;

type
  TRelExtrato = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    molResponsavel1: TmolResponsavel;
    GroupBox1: TGroupBox;
    cmdtFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molImovelMestre1: TmolImovelMestre;
    chkFormaGerencial: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    cdsPatro: TCMClientDataSet;
    cdsPatroIDPESSOA: TFloatField;
    cdsPatroNOME: TStringField;
    dbcboPlanPrev: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    cdsPlano: TCMClientDataSet;
    cdsPlanoNOME: TStringField;
    cdsPlanoIDPLANOPREV: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrev : TCtrlPlanPrevContabil;
    CtrlImovel : TCtrlImovel;
    procedure CorrigeResiduo;
    procedure CorrigeResiduoII;
    procedure MontaQueryGerencial(const dDtFim: TDateTime);
    procedure MontaQueryOperacional(const dDtFim: TDateTime);
    procedure AjustaOperacional;
  public
    { Public declarations }
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    dDataLimite           : TDateTime;
  end;

var
  RelExtrato: TRelExtrato;

implementation

uses DRelFinanc, uFuncoesImob, fAguarde, uDataBase, uMensErro, UFuncAlienacao,
     uComunsImobiliario, uVerificaPreenchimento, uCalcDocumento, uSistema,
     dBaseDados, uModuloImobiliario;

{$R *.DFM}

procedure TRelExtrato.FormShow(Sender: TObject);
begin
  inherited;
  cmdtFim.Date := Date;

  if ((ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0)  )  then begin
     chkFormaGerencial.Checked := False;
  end else begin
     chkFormaGerencial.Checked := True;
  end;

end;

procedure TRelExtrato.bbtnConfirmarClick(Sender: TObject);
var dDataBaixa,dUltAtual : TDateTime;
begin
   // Verifica Preenchimento
   if cmdtFim.Text = '' then begin
      MsgDlg('Informe a data final','Atenção',mtWarning, [mbOk],0);
      cmdtFim.SetFocus;
      Exit;
   end;
   //Helen - SOL : 153702/5861 KTN: 1372228
   if StrToDate(cmdtFim.Text) > StrToDate('31/12/2011') then begin
      MsgDlg('Utilização autorizada apenas para data menor que  01/01/2012 ','Atenção',mtWarning, [mbOk],0);
      cmdtFim.SetFocus;
      Exit;
   end;

  //Bruno Bastos - Sol: 126226 - Kintana: 657730 - Início
   if (trim(dbcboPlanPrev.Text) <> '') and (trim(dbcboPatro.Text) = '') then
   begin
     MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
            'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;
   //Bruno Bastos - Sol: 126226 - Kintana: 657730 - Fim
   
   if (trim(dbcboPlanPrev.Text) <> '') and (trim(dbcboPatro.Text) <> '') then
   begin
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                    StrToInt(dbcboPlanPrev.LookupValue)) then
    begin
      MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
      ModalResult := mrNone;
      dbcboPlanPrev.SetFocus;
      Exit;
    end;
   end;

   inherited;

   // atualiza parcelas em atraso
   if cmdtFim.Text = '' then
        dDataBaixa := -1
   else dDataBaixa := cmdtFim.Date;

   if chkFormaGerencial.Checked then begin
      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta,
                                           molComprador1.iComprador,
                                           molResponsavel1.iResponsavel, -1, -1,
                                           dDataBaixa) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;
      MontaQueryGerencial(dDataBaixa);
   end else begin
      MontaQueryOperacional(dDataBaixa);
   end;

   dtmRelFinanc.qryExtrato.SQL.SaveToFile(Sistema.TempDir + 'RelExtrato.txt');

   if chkFormaGerencial.Checked then begin
      LimpaParametros(dtmRelFinanc.qryExtrato);
      with dtmRelFinanc.qryExtrato do begin
         Open;
      end;
      dtmRelFinanc.ppTituloExtrato.Caption           := 'Extrato Contratual ( Gerencial )';
      dtmRelFinanc.relExtratolblDataCorrecao.Visible := False;
   end else begin

      dtmRelFinanc.qryExtrato.Open;

      dtmRelFinanc.ppTituloExtrato.Caption := 'Extrato Contratual ( Operacional )';
      dtmRelFinanc.relExtratolblDataCorrecao.Visible := True;
      dtmRelFinanc.relExtratolblDataCorrecao.Caption := '';
      dUltAtual := dtmRelFinanc.qryextratoDATA_CORRECAO.AsDateTime;
      while not dtmRelFinanc.qryExtrato.Eof do begin
         if not dtmRelFinanc.qryextratoDATA_CORRECAO.isNull then begin
            if dtmRelFinanc.qryextratoDATA_CORRECAO.AsDateTime >= dUltAtual then begin
               dUltAtual := dtmRelFinanc.qryextratoDATA_CORRECAO.AsDateTime;
               dtmRelFinanc.relExtratolblDataCorrecao.Caption := 'Valores corrigidos até: ' + FormatDateTime('dd/mm/yyyy', dUltAtual);
            end;
         end;

         if dtmRelFinanc.qryExtratoDATALIMITE.AsDateTime >= cmdtFim.Date then begin
            dtmRelFinanc.qryExtrato.Edit;
            dtmRelFinanc.qryExtratoVLRCORRIG.Clear;
            dtmRelFinanc.qryExtrato.Post;
         end;

         dtmRelFinanc.qryExtrato.Next;
      end;
      dtmRelFinanc.qryExtrato.First;
   end;


   if Sistema.TipoCliente = 19991 then begin   // FUNCEF
      if (cmdtFim.Text <> '') and (cmdtFim.Date < StrToDate('31/03/2005') ) then begin
         CorrigeResiduo;
      end else begin
         if ModuloImobiliario.Alienacao.iTipoOperAtualRes <= 0 then CorrigeResiduoII;
      end;
   end else begin
      CorrigeResiduoII;
   end;

   if cmdtFim.Text <> '' then begin
      dtmRelFinanc.dDataLimite := cmdtFim.Date;
   end else begin
      dtmRelFinanc.dDataLimite := Date();
   end;
   dtmRelFinanc.bSeparador := chkLinhas.Checked;
   // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
   dtmRelFinanc.bCorlinha   := chkCorLinha.Checked;
   dtmRelFinanc.CorLinha    := cboCorLinha.SelectedColor;
end;

procedure TRelExtrato.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;

procedure TRelExtrato.CorrigeResiduo;
var bEof : Boolean;
    fVlrTotal, fCM : Extended;
    dInicio, dLimite : TDateTime;
    iCondPag, iIndice, iMesRef : Integer;
    iRecAlt, iRecNo : TBookmark;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
begin
   try
      ComunsImobiliarioDB := TComunsImobiliarioDB.Create(1, 135, -1, -1, True);
      ComunsImobiliarioDB.Initialize(dtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType, Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer, True );

      // corrige resíduo em atraso até o dia...
      if cmdtFim.Text = '' then
           dLimite := Date()
      else dLimite := cmdtFim.Date;

      with dtmRelFinanc do begin
         qryExtrato.DisableControls;
         qryExtrato.First;
         while not qryExtrato.eof do begin
            fVlrTotal := 0;
            fCM       := 0;
            iCondPag  := qryExtratoIDCONDPAGIMOVEL.AsInteger;
            while (qryExtratoIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryExtrato.eof) do begin
               if qryExtratoFLGRESIDUOINCORP.AsString = 'N' then begin
                  fVlrTotal := fVlrTotal + qryExtratoVLRRESIDUO.AsFloat;
                  iIndice   := qryExtratoIDCORR_CONDPAG.AsInteger;
                  iMesRef   := qryExtratoMESREF_CONDPAG.AsInteger;
                  dInicio   := qryExtratoDATAVENCIMENTO.AsDateTime;
                  iRecAlt   := qryExtrato.GetBookmark;
               end;
               qryExtrato.Next;
               iRecNo := qryExtrato.GetBookmark;
               bEof   := qryExtrato.Eof;
            end;

            if (fVlrTotal > 0) and (dInicio < dLimite) then begin
               fCM := ComunsImobiliarioDB.CalcCM(fVlrTotal, iIndice,
                                                 dInicio + 1, dLimite, True,
                                                 iMesRef);

               if fCM > 0 then begin
                  qryExtrato.GotoBookmark(iRecAlt);
                  qryExtrato.Edit;
                  qryExtratoVLRRESIDUOCORRIG.AsFloat := fVlrTotal + fCM;
                  qryExtrato.Post;
                  qryExtrato.GotoBookmark(iRecNo);
               end;
            end;
            if bEof then Break;
         end;
         qryExtrato.First;
         qryExtrato.EnableControls;
      end;
   finally
      FreeAndNil( ComunsImobiliarioDB );
   end;
end;


procedure TRelExtrato.CorrigeResiduoII;
var bEof : Boolean;
    fVlrTotal, fCM : Extended;
    dInicio, dLimite : TDateTime;
    iCondPag, iIndice, iMesRef : Integer;
    iRecAlt, iRecNo : TBookmark;
    fTotRes, fTotResAtual : Extended;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
begin
   try
      ComunsImobiliarioDB := TComunsImobiliarioDB.Create(1, 135, -1, -1, True);
      ComunsImobiliarioDB.Initialize(dtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType, Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer, True );

      // corrige resíduo em atraso até o dia...
      if cmdtFim.Text = '' then
           dLimite := Date()
      else dLimite := cmdtFim.Date;

      fTotRes      := 0;
      fTotResAtual := 0;

      with dtmRelFinanc do begin
         qryExtrato.DisableControls;
         qryExtrato.First;
         while not qryExtrato.eof do begin
            fVlrTotal := 0;
            fCM       := 0;
            iCondPag  := qryExtratoIDCONDPAGIMOVEL.AsInteger;
            while (qryExtratoIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryExtrato.eof) do begin
               if ( (qryExtratoFLGRESIDUOINCORP.AsString = 'N') or
                    ((qryExtratoFLGRESIDUOINCORP.AsString = 'C') and
                     (qryExtratoDATACOBRES.AsDateTime > dLimite)) ) then begin
                  iIndice  := qryExtratoIDCORR_CONDPAG.AsInteger;
                  iMesRef  := qryExtratoMESREF_CONDPAG.AsInteger;
                  dInicio  := qryExtratoDATAVENCIMENTO.AsDateTime;

                  if (qryExtratoVLRRESIDUO.AsFloat > 0) and (dInicio < dLimite) then begin
                     fCM := ComunsImobiliario.Arredonda(
                            CalcDocumento.CalcCM(qryExtratoVLRRESIDUO.AsFloat, iIndice,
                                                 dInicio + 1, dLimite, iMesRef), 2);

                     qryExtrato.Edit;
                     if fCM > 0 then
                          qryExtratoVLRRESIDUOCORRIG.AsFloat := qryExtratoVLRRESIDUO.AsFloat + fCM
                     else qryExtratoVLRRESIDUOCORRIG.AsFloat := qryExtratoVLRRESIDUO.AsFloat;
                     qryExtrato.Post;
                     fTotRes := fTotRes + qryExtratoVLRRESIDUO.AsFloat;
                     fTotResAtual := fTotResAtual + qryExtratoVLRRESIDUOCORRIG.AsFloat;
                  end;
               end;
               qryExtrato.Next;
            end;
         end;
      end;
   finally
      FreeAndNil( ComunsImobiliarioDB );
   end;
end;



procedure TRelExtrato.MontaQueryGerencial(const dDtFim: TDateTime);
var sSql, sData : string;
begin
   sData := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') ';

   sSql := 'SELECT PF.IDPARCFINANCIMOV, '+#13+
           '       PF.IDCONDPAGIMOVEL,  '+#13+
           '       CI.IDCONTRATOIMOVEL, '+#13+
           '       CI.CONNUMERO,        '+#13+
           '       CI.CONNOME,          '+#13+
           '       CI.VLRPROPOSTA,      '+#13+
           '       CI.CONDATAINICIO,    '+#13+
           '       CI.IDCIDADES,        '+#13+
           '       CI.IDPAIS,           '+#13+
           '       CI.CODESTADO,        '+#13+
           '       P.RAZAOSOCIAL,       '+#13+
           '       IM.NOMEMESTRE,       '+#13+
           '       PF.CODDOCUMENTO,     '+#13+
           '       PF.PLNCODIGO,        '+#13+
           '       ALT.TOT_ALTERADOR,   '+#13+
           '       CPMF.TOT_CPMF,       '+#13+
           '       DECODE(NVL(PF.NUMPARCELA,0), 0, 0, '+#13+
           '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO) ) AS NUMDOC, '+#13+
           '       PF.NUMPARCELA AS NUMPARC, '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
           '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO, '+#13+
                   QuotedStr(FormatDateTime('MMYYYY', dDtFim )) + ' AS MESANO_CALCULO, '+#13+
           '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '+#13+
           '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '+#13+
           '       CPFINAL.TIPOCONDPAG, '+#13+
           '       CPFINAL.NUMPARCELAS, '+#13+
           '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '+#13+
           '       PF.VLRNOMINAL,       '+#13+
           '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) AS TOT_DEVIDO, '+#13+
           '       PF.VLRJUROS,         '+#13+
           '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO, '+#13+
           '       PF.VLRSALDODEVEDOR,    '+#13+
           '       PF.VLRSALDOATUAL,      '+#13+
           '       PF.VLRPRESTATUALIZADA, '+#13+
           '       PF.VLRRESIDUO,         '+#13+
           '       PF.VLRRESIDUOATUALI,   '+#13+
           '       0 AS VLRRESIDUOCORRIG, '+#13+
           '       CR.DATACOBRES,         '+#13+
           '       PF.IDINDCORRECAO,      '+#13+
           '       PF.VLRCORRIGIDOATRASO, '+#13+
           '       PF.VLRMULTAATRASO,     '+#13+
           '       PF.VLRMORAATRASO,      '+#13+
           '       NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP, '+#13+
           '       PF.FLGTIPOLANC,        '+#13+
           '       PF.FLGLANCINTEGRA,     '+#13+
           '       PF.DATALIMITE,         '+#13+
           '       PF.DATAPAGAMENTO,      '+#13+
           '       ROUND(PF.VLRPAGO,2) AS VLRPAGO, '+#13+
           '       PF.FLGCONCILIADO,      '+#13+
           '       PF.IDREPACTUA,         '+#13+
           '       CD.IDDOCDIVERGE,       '+#13+
           '       TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') AS DATA_BASE, '+#13+
           '       SYSDATE AS DATA_CORRECAO, '+#13;

   // Forma gerencial mostra atualização de baixas manuais que não foram contabilizadas
   if chkFormaGerencial.Checked then begin
      sSql := sSql +
           '      DECODE(PF.FLGCONCILIADO, ''S'', 0, ''C'', 0,  '+#13+
           '         DECODE(NVL(PF.VLRPAGO,0), 0, 0,            '+#13+
           '                NVL(PF.VLRCORRIGIDOATRASO,0) + NVL(PF.VLRMULTAATRASO,0) + NVL(PF.VLRMORAATRASO,0)) - NVL(PF.VLRPAGO,0) ) AS VLRDIF, '+#13+
           '      DECODE(CD.IDDOCDIVERGE, NULL, '+#13+
           '             NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0), NULL) AS VLRCORRIG '+#13;
   end else begin
      sSql := sSql +
           '       DECODE(PF.FLGCONCILIADO, ''S'', 0, ''C'', 0,  '+#13+
           '          DECODE(NVL(PF.VLRPAGO,0), 0, 0,            '+#13+
           '              DECODE(PF.CODDOCUMENTO, NULL,          '+#13+
           '                     NVL(PF.VLRPRESTACAO,0) - NVL(PF.VLRPAGO,0), '+#13+
           '                     NVL(PF.VLRCORRIGIDOATRASO,0) + NVL(PF.VLRMULTAATRASO,0) + NVL(PF.VLRMORAATRASO,0)) - NVL(PF.VLRPAGO,0) )) AS VLRDIF, '+#13+
           '       DECODE(CD.IDDOCDIVERGE, NULL,        '+#13+
           '              DECODE(PF.CODDOCUMENTO, NULL, '+#13+
           '                     DECODE(PF.FLGCONCILIADO, ''S'', 0, ''C'', 0, NVL(PF.VLRPRESTACAO,0) - NVL(PF.VLRPAGO,0) ), '+#13+
           '                     NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) ), '+#13+
           '              NULL) AS VLRCORRIG  '+#13;
   end;

      sSql := sSql +
           '  FROM  '+#13+
           '       PARCFINANCIMOV PF, '+#13+
           '       CONDPAGIMOVEL  CP, '+#13+
           '       CONTRATOIMOVEL CI, '+#13+
           '       PESSOA P,          '+#13+
           '       ( SELECT DISTINCT  '+#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVERGE '+#13+
           '           FROM CONCILIADOC '+#13+
           '          WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '            AND (IDDOCDIVERGE IS NOT NULL OR '+#13+
           '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPARCFINANCIMOV    '+#13+
           '                                             FROM CONCILIADOC                  '+#13+
           '                                            WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '                                              AND IDDOCDIVERGE IS NOT NULL ) ) '+#13+
           '       ) CD,  '+#13+
           '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '+#13+
           '                A.NUMPARCELAS    AS NUMPARCELAS,   '+#13+
           '                A.DATAINI,         '+#13+
           '                A.IDCONDPAGIMOVEL, '+#13+
           '                A.INDCORRECAO,     '+#13+
           '                A.MESREFREAJUSTE,  '+#13+
           '                DECODE(A.TIPOCONDPAG, ''V'', ''A Vista'', '+#13+
           '                                      ''S'', ''Sinal'',   '+#13+
           '                                      ''C'', ''Caução'',  '+#13+
           '                                      ''P'', ''Parcelamento'' ) AS TIPOCONDPAG '+#13+
           '         FROM   CONDPAGIMOVEL A,                  '+#13+
           '                (SELECT   IDCONDINICIAL,          '+#13+
           '                          MAX(DATAINI) AS DATAINI '+#13+
           '                 FROM     CONDPAGIMOVEL           '+#13+
           '                 GROUP BY IDCONDINICIAL) B        '+#13+
           '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '+#13+
           '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '+#13+
           '       ( SELECT DISTINCT                          '+#13+
           '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '+#13+
           '                M.IMONOME            AS NOMEMESTRE,       '+#13+
           '                M.IDIMOVEL           AS IDIMOVEL          '+#13+
           '           FROM CONTRATOXIMOVEL CXI, '+#13+
           '                IMOVEL I,            '+#13+
           '                IMOVEL M             '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL           '+#13+
           '            AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '+#13+
           '       ( SELECT LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
           '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
           '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
           '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
           '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
           '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
           '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+

           // Daniel - 18795
           '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'',''P'') ) TC '+#13+
           // Fim.

           '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
           '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13+
           // Marchetti - Pendencia 24019
           '            AND PA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '+#13+
           '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '+#13+
           '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '+#13+
           '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '+#13+
           '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '+#13+
           '            AND ( PA.IDOPERATUALCM IS NULL OR               '+#13+
           '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '+#13+
           '            AND D.IDMODULO = 135                            '+#13+
           '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+
           '       ( SELECT LD.CODDOCUMENTO,                            '+#13+
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_CPMF '+#13+
           '           FROM LANCTODOCUM LD,                  '+#13+
           '                DOCUMENTO D                      '+#13+
           '          WHERE RTRIM(LD.OPERACAO) = ''4''       '+#13+
           '            AND CODALTERADOR = 215               '+#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO '+#13+
           '            AND D.IDMODULO = 135                 '+#13+
           '          GROUP BY LD.CODDOCUMENTO  )  CPMF,     '+#13+
           // Vinicius - 11/11/2005 - Verificar data de Cobrança de resíduo
           '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
           '            FROM PARCEXTRAIMOV                             '+#13+
           '           WHERE FLGTIPOCOBRANCA = ''R''                   '+#13+
           '         ) CR                                              '+#13+
           // Vinicius - 11/11/2005
           '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12)) '+#13+
           '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)     '+#13+
           '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)   '+#13+
           '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL) '+#13+
           '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)              '+#13+
           '    AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'+#13+
           '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV)'+#13+
           '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'+#13+
           '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)       '+#13+
           '    AND (CPMF.CODDOCUMENTO(+) = PF.CODDOCUMENTO)      '+#13;

           // Marchetti - Pendencia 24019
           if molProposta1.iProposta > 0 then
              sSql := sSql + '    AND CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           if molComprador1.iComprador > 0 then
              sSql := sSql + '    AND CI.IDLOCATARIO = ' + IntToStr(molComprador1.iComprador) +#13;
           if molResponsavel1.iResponsavel > 0 then
              sSql := sSql + '    AND CI.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel) +#13;
           if molImovelMestre1.iMestre > 0 then
              sSql := sSql + '    AND IM.IDIMOVEL = ' + IntToStr(molImovelMestre1.iMestre) +#13;
           if cmdtFim.Text <> '' then
              // Marchetti - Pendencia 21541
              sSQL := sSQL +
              '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sData + ') )'  + #13;
              // Fim Marchetti - Pendencia 21541

           sSql := sSql + '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';

   dtmRelFinanc.qryExtrato.Sql.Text := sSql;
end;

procedure TRelExtrato.MontaQueryOperacional(const dDtFim: TDateTime);
var sSql, sData : string;
begin
   sData := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') ';
   sSql := 'SELECT PF.IDPARCFINANCIMOV, '+#13+
           '       PF.IDCONDPAGIMOVEL,  '+#13+
           '       CI.IDCONTRATOIMOVEL, '+#13+
           '       CI.CONNUMERO,        '+#13+
           '       CI.CONNOME,          '+#13+
           '       CI.VLRPROPOSTA,      '+#13+
           '       CI.CONDATAINICIO,    '+#13+
           '       CI.IDCIDADES,        '+#13+
           '       CI.IDPAIS,           '+#13+
           '       CI.CODESTADO,        '+#13+
           '       P.RAZAOSOCIAL,       '+#13+
           '       IM.NOMEMESTRE,       '+#13+
           '       PF.CODDOCUMENTO,     '+#13+
           '       PF.PLNCODIGO,        '+#13+
           '       ALT.TOT_ALTERADOR,   '+#13+
           '       CPMF.TOT_CPMF,       '+#13+
           '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0, '+#13+
           '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO) ) AS NUMDOC, '+#13+
           '       PF.NUMPARCELA AS NUMPARC, '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
           '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO, '+#13+
                   QuotedStr(FormatDateTime('MMYYYY', dDtFim )) + ' AS MESANO_CALCULO, '+#13+
           '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '+#13+
           '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '+#13+
           '       CPFINAL.TIPOCONDPAG, '+#13+
           '       CPFINAL.NUMPARCELAS, '+#13+
           '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '+#13+
           '       PF.VLRNOMINAL,       '+#13+
           '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) AS TOT_DEVIDO, '+#13+
           '       PF.VLRJUROS,         '+#13+
           '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO, '+#13+
           '       PF.VLRSALDODEVEDOR,    '+#13+
           '       PF.VLRSALDOATUAL,      '+#13+
           '       PF.VLRPRESTATUALIZADA, '+#13+
           '       PF.VLRRESIDUO,         '+#13+
           '       PF.VLRRESIDUOATUALI,   '+#13+

           '       (NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)) as VLRRESIDUOCORRIG,   '+#13+
           '       CR.DATACOBRES,         '+#13+

           '       PF.IDINDCORRECAO,      '+#13+
           '       PF.VLRCORRIGIDOATRASO, '+#13+
           '       PF.VLRMULTAATRASO,     '+#13+
           '       PF.VLRMORAATRASO,      '+#13+
           '       NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP,   '+#13+
           '       PF.FLGTIPOLANC,        '+#13+


           '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA, '+#13+
           '              DECODE(CD2.FLGTIPO, NULL,               '+#13+
           '                     DECODE(PF.CODDOCUMENTO, NULL,    '+#13+
           '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), 2), 5) ) AS FLGLANCINTEGRA, '+#13+

           '       PF.DATALIMITE,         '+#13+
           '       PP.DATAPAGAMENTO,      '+#13+
           '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '+#13+
           '       NVL(CD2.CONCILIADOC, ''N'') AS FLGCONCILIADO, '+#13+
           '       PF.IDREPACTUA,         '+#13+
           '       CD.IDDOCDIVERGE,       '+#13+
           '       TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') AS DATA_BASE, '+#13+
           '       CO2.DTAPUR AS DATA_CORRECAO, '+#13+
           '       ROUND(DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0,    '+#13+
           '             DECODE(NVL(PP.VLRPAGO,0), 0, 0,              '+#13+
           '                        NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) )),2) AS VLRDIF, '+#13+
           '       ROUND(DECODE(CD.IDDOCDIVERGE, NULL,                   '+#13+
           '             DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0, '+#13+
           '                    NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TOT_ABONO,0) ), NULL),2) AS VLRCORRIG '+#13+
           '  FROM  '+#13+
           '       PARCFINANCIMOV PF, '+#13+
           '       CONDPAGIMOVEL  CP, '+#13+
           '       CONTRATOIMOVEL CI, '+#13+
           '       PESSOA P,          '+#13+

           '       ( '+#13+
           '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '+#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
           '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
           '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
           '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
           '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
           '            AND ( (P.CODDOCUMENTO IS NULL) OR        '+#13+
           '                  (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '+#13+
           '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= ' + sData + ' ) OR '+#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
           '                                             AND LD.ESTORNO IS NULL                  '+#13+
           '                                             AND LD.DATALANCTO <= ' + sData + ' ) )  '+#13+
           '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                                  '+#13+
           '       ) PP, '+#13+

           '       ( SELECT DISTINCT  '+#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVERGE '+#13+
           '           FROM CONCILIADOC '+#13+
           '          WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '            AND DATA <= ' + sData +#13+
           '            AND (IDDOCDIVERGE IS NOT NULL OR '+#13+
           '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPARCFINANCIMOV    '+#13+
           '                                             FROM CONCILIADOC                  '+#13+
           '                                            WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '                                              AND DATA <= ' + sData +#13+
           '                                              AND IDDOCDIVERGE IS NOT NULL ) ) '+#13+
           '       ) CD,  '+#13+
           // Vinicius - 03/01/2006 - verifica ordem cronologica para abonos, repactuacoes e cobranças
           '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,                  '+#13+
           '                 DECODE(FLGTIPO,''M'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                                ''J'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                                ''C'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                                CONCILIADOC ) AS CONCILIADOC       '+#13+
           '            FROM '+#13+
           '                 ( SELECT C.IDPARCFINANCIMOV,                                   '+#13+
           '                          DECODE(C.FLGTIPO, NULL, NULL,                         '+#13+
           '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
           '                                 ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC,'+#13+
           '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS FLGTIPO, COUNT(*) AS QTDE '+#13+
           '                     FROM CONCILIADOC C, PARCFINANCIMOV P                       '+#13+
           '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV               '+#13+
           '                      AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'')    '+#13+
           '                      AND C.DATA <= ' + sData                                    +#13+
           
           // Vinicius - 23/03/2006 - ajuste abonos contrato 000023: abono total e de multa, estava duplicando o registro
           '                      AND ( C.FLGTIPO IN (''T'',''R'') OR                       '+#13+
           '                            NOT EXISTS ( SELECT 1 FROM CONCILIADOC              '+#13+
           '                                          WHERE FLGTIPO IN (''T'',''R'')        '+#13+
           '                                            AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) ) '+#13+
           // Vinicius - 23/03/2006 - Fim

           '                    GROUP BY C.IDPARCFINANCIMOV,                                '+#13+
           '                             DECODE(C.FLGTIPO, NULL, NULL,                      '+#13+
           '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
           '                                 ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2,       '+#13+
           // Vinicius - 03/01/2006 - fim
           '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '+#13+
           '                A.NUMPARCELAS    AS NUMPARCELAS,   '+#13+
           '                A.DATAINI,         '+#13+
           '                A.IDCONDPAGIMOVEL, '+#13+
           '                A.INDCORRECAO,     '+#13+
           '                A.MESREFREAJUSTE,  '+#13+
           '                DECODE(A.TIPOCONDPAG, ''V'', ''A Vista'', '+#13+
           '                                      ''S'', ''Sinal'',   '+#13+
           '                                      ''C'', ''Caução'',  '+#13+
           '                                      ''P'', ''Parcelamento'' ) AS TIPOCONDPAG '+#13+
           '         FROM   CONDPAGIMOVEL A,                  '+#13+
           '                (SELECT   IDCONDINICIAL,          '+#13+
           '                          MAX(DATAINI) AS DATAINI '+#13+
           '                 FROM     CONDPAGIMOVEL           '+#13+
           '                 GROUP BY IDCONDINICIAL) B        '+#13+
           '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '+#13+
           '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '+#13+
           '       ( SELECT DISTINCT                          '+#13+
           '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '+#13+
           '                M.IMONOME            AS NOMEMESTRE,       '+#13+
           '                M.IDIMOVEL           AS IDIMOVEL          '+#13+
           '           FROM CONTRATOXIMOVEL CXI, '+#13+
           '                IMOVEL I,            '+#13+
           '                IMOVEL M             '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL           '+#13+
           '            AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '+#13+
           '       ( SELECT /*+ INDEX(D) INDEX(LD)*/            '+#13+
           '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
           '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
           '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
           '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
           '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
           '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
           '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+

           // Daniel - 18795
           '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'',''P'') ) TC '+#13+
           // Fim.

           '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
           '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13;

           if Sistema.TipoCliente = 19991 then sSql := sSql +
              '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
              '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
              '                                                                 FROM CONCILIADOC ' + #13 +
              '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
              '                                                                 AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
              '                                                                 AND   DATA        <= ' + sData + ')) ' + #13;

           sSql := sSql +
           '            AND PA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '+#13+
           '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '+#13+
           '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '+#13+
           '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '+#13+
           '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '+#13+
           '            AND LD.DATALANCTO <= ' + sData +#13+
           '            AND ( PA.IDOPERATUALCM IS NULL OR               '+#13+
           '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '+#13+
           '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '+#13+
           '            AND D.IDMODULO = 135                            '+#13+
           '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+
           '       ( SELECT /*+ INDEX (D) INDEX(LD) */                  '+#13+
           '                LD.CODDOCUMENTO,                            '+#13+
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_CPMF '+#13+
           '           FROM LANCTODOCUM LD,                  '+#13+
           '                DOCUMENTO D                      '+#13+
           '          WHERE RTRIM(LD.OPERACAO) = ''4''       '+#13+
           '            AND CODALTERADOR = 215               '+#13+
           '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO '+#13+
           '            AND D.IDMODULO = 135                 '+#13+
           '          GROUP BY LD.CODDOCUMENTO  )  CPMF,     '+#13+

           // Marchetti - 09/11/2005
           '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOCORRIG                       '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                                   '+#13+
           '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRRESIDUOCORRIG '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                                '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                  '+#13+
//           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                   WHERE P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALRES )        '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,    '+#13+
           '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')        '+#13+
//           '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )    '+#13+
           '                     AND ( DATAOPER <= ' + sData + ')             '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV ) D2              '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV         '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                           '+#13+
           '        ) AR,                                                     '+#13+
           // Fim Marchetti - 09/11/2005

           // Vinicius - 11/11/2005 - Verificar data de Cobrança de resíduo
           '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
           '            FROM PARCEXTRAIMOV                             '+#13+
           '           WHERE FLGTIPOCOBRANCA = ''R''                   '+#13+
           '         ) CR,                                             '+#13+
           // Fim Vinicius - 11/11/2005

           '       ( SELECT D1.IDPARCFINANCIMOV, SUM(D1.TOT_CORRECAO) AS TOT_CORRECAO   '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                   '+#13+
           '                         L.IDPARCFINANCIMOV, L.DATAOPER, IDOPERACAO, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE L.DATABAIXA IS NOT NULL                            '+#13+
//           '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                  '+#13+
//           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, L.DATAOPER ) D1,'+#13+
           '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, IDOPERACAO, MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                           '+#13+
//           '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13 +
           '                     AND DATABAIXA IS NOT NULL                        '+#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALCM )        '+#13+
           '                     AND ( DATAOPER <= ' + sData + ')                '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV, IDOPERACAO ) D2 '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                   '+#13+
           '            AND D1.IDOPERACAO = D2.IDOPERACAO             '+#13+
           '          GROUP BY D1.IDPARCFINANCIMOV                    '+#13+
           '       ) CO1,                                             '+#13+
           '       ( SELECT D1.IDPARCFINANCIMOV, MAX(D2.DTAPUR) AS DTAPUR, SUM(D1.TOT_CORRECAO) AS TOT_CORRECAO '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                   '+#13;

// SOL144699  Felipe de oliveira Inicio
//           if dDtFim < StrToDate('01/12/2010') then
               sSql := sSql + '   L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13;
//           else
//              sSql := sSql +  '   L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER, SUM(L.VLRDIA) AS TOT_CORRECAO '+#13;
// SOL144699  Felipe de oliveira Fim


           sSql := sSql +
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                  '+#13+
//           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                   WHERE L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER ) D1,            '+#13;
// SOL144699  Felipe de oliveira Inicio
//           if dDtFim < StrToDate('01/12/2010') then
                sSql := sSql + '( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,IDOPERACAO, DATABAIXA, MAX(L2.DATAOPER) AS DTAPUR '+#13;
//           else
//                sSql := sSql + '( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,IDOPERACAO, DATABAIXA, MAX(L2.DATAOPER) AS DTAPUR, L2.DATAOPER '+#13;

           sSql := sSql +
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                           '+#13+
//           '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALCM )        '+#13+
           '                     AND ( DATAOPER <= ' + sData + ')                '+#13;
//           if dDtFim < StrToDate('01/12/2010') then
                sSql := sSql + '  GROUP BY L2.IDPARCFINANCIMOV, L2.IDOPERACAO, L2.DATABAIXA ) D2 '+#13;
//           else
//                sSql := sSql + '  GROUP BY L2.IDPARCFINANCIMOV, L2.IDOPERACAO, L2.DATABAIXA,L2.DATAOPER ) D2 '+#13;
// SOL144699  Felipe de oliveira Fim

           sSql := sSql +
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                   '+#13+
           '            AND D1.IDOPERACAO = D2.IDOPERACAO             '+#13+
           '            AND NVL(D1.DATABAIXA,SYSDATE+1000) = NVL(D2.DATABAIXA,SYSDATE+1000) '                + #13 +
           '          GROUP BY D1.IDPARCFINANCIMOV'+#13+
           '        ) CO2,                                            '+#13+
           '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO             '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                   '+#13+
           '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                 '+#13+
//           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                   WHERE L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,            '+#13+
           '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
//           '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                           '+#13+
//           '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERABONOJUROS OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERABONOCM )        '+#13+
           '                     AND ( DATAOPER <= ' + sData + ')                '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                   '+#13+
           '        ) ABONO                                          '+#13+
           '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12))  '+#13+
           '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '+#13+
           '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '+#13+
           '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '+#13+
           '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '+#13+
           '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (CO1.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'+#13+
           '    AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'+#13+
           '    AND (ABONO.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'+#13+
           '    AND (AR.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '+#13+
           '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
           '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)  '+#13+
           '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '+#13+
           '    AND (CPMF.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '+#13;

           if molProposta1.iProposta > 0 then
              sSql := sSql + '    AND CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           if molComprador1.iComprador > 0 then
              sSql := sSql + '    AND CI.IDLOCATARIO = ' + IntToStr(molComprador1.iComprador) +#13;
           if molResponsavel1.iResponsavel > 0 then
              sSql := sSql + '    AND CI.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel) +#13;
           if molImovelMestre1.iMestre > 0 then
              sSql := sSql + '    AND IM.IDIMOVEL = ' + IntToStr(molImovelMestre1.iMestre) +#13;
           if cmdtFim.Text <> '' then
              // Marchetti - Pendencia 21541
              sSQL := sSQL +
              '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sData + ') OR ' + #13 +
              '          (PP.DATAPAGAMENTO <= ' + sData + ') )' + #13;
              // Fim Marchetti - Pendencia 21541
           sSql := sSql + ' AND EXISTS (SELECT 1 ' + #13 +
                          '               FROM CONTRATOXIMOVEL CXI, ' + #13 +
                          '                    PLANOPATROXIMOVEL PPI ' + #13 +
                          '              WHERE CXI.IDCONTRATOIMOVEL(+) = IM.IDCONTRATOIMOVEL ' + #13 +
                          '                AND CXI.IDIMOVEL = PPI.IDIMOVEL ';
           if Trim(dbcboPatro.Text) <> ''  then
            sSql := sSql + ' AND PPI.IDPATRO = ' + dbcboPatro.LookupValue;

           if Trim(dbcboPlanPrev.Text) <> '' then
            sSql := sSql + ' AND PPI.IDPLANOPREV = ' + dbcboPlanPrev.LookupValue;

           sSql := sSql + ')';


           sSql := sSql + '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';

   dtmRelFinanc.qryExtrato.Sql.Text := sSql;
end;




procedure TRelExtrato.AjustaOperacional;
begin
   with dtmRelFinanc.qryExtrato do begin
      DisableControls;
      First;
      while not eof do begin
         if (FieldByName('VLRDIF').AsFloat < 0) or (FieldByName('VLRCORRIG').AsFloat < 0) then begin
            Edit;
            if (FieldByName('VLRDIF').AsFloat < 0)    then FieldByName('VLRDIF').AsFloat    := 0;
            if (FieldByName('VLRCORRIG').AsFloat < 0) then FieldByName('VLRCORRIG').AsFloat := 0;
            Post;
         end;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TRelExtrato.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImovel              := TCtrlImovel.Create;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrev            := TCtrlPlanPrevContabil.Create;

  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                       ComunsImobiliario.MensErroMT);
  CtrlPlanPrevContabPatro.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlPlanPrev.InitializeAs(CtrlImovel);

  cdsPatro.Data         := CtrlImovel.LookupPatro( Sistema.IdEmpresa );
  cdsPlano.Data         := CtrlPlanPrev.ListaPlanPrevContabil;   
end;

procedure TRelExtrato.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlPlanPrev);
end;

end.
