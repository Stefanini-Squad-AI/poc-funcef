{-------------------------------------------------------------------------------
---------------------ALTERAÇÕES / IMPLEMENTAÇÕES -------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: MontaQueryOperacional
//WO ................: 15334
//Data da Alteração..: 05/11/2024
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Corrigindo a forma de trazer o número de parcelas.
//***************************************************************************************
//Rotina.............: MontaQueryOperacional, bbtnConfirmarClick
//N. SIG.............: 115965
//Data da Alteração..: 04/06/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração no relatório de Extraro Contratual - Novo, alterando
//                     a recuperação de registros de resíduos contratuais.
//***************************************************************************************
//Rotina.............: MontaQueryOperacional
//N. SIG.............: 96396
//Data da Alteração..: 21/01/2020
//Alteração Form.....: CRelExtratoNovo
//Responsável........: Rafael Leite de Vasconcelos
//Descrição..........: Atualização do relatório de Ecxtrato Contratual para considerar
//					   movimentações de Abono.
//***************************************************************************************
//Rotina.............: MontaQueryOperacional  
//N. SIG.............: 87362
//Data da Alteração..: 10/06/2019
//Alteração Form.....: CRelExtratoNovo
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Atualização do relatório de Ecxtrato Contratual para considerar 
//					   movimentações de Abono.
//***************************************************************************************
Rotina..........: MontaQueryOperacional
N. Sol..........: 250901
N. PPM..........: 794777
Data............: 18/05/2015
Responsável.....: Wylliam Leite da Silva
Descrição.......: o campo "Divergências de pagamento" está sendo calculado incorretamente
--------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
N. Sol..........: 178419
N. Kintana......: 1638829
Data............: 15/06/2012
Responsável.....: Otacilio aquino
Descrição.......: Baixa performance para emissão do relatório Extrato
                  Contratual Novo
--------------------------------------------------------------------------------
Rotina..........:
N. Sol..........: 178478
N. Kintana......: 1639384
Data............: 18/04/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Os contratos com valor de Prestação = 0 foram adicionados
--------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
N. Sol..........: 174604
N. Kintana......: 1578809
Data............: 22/02/2012
Responsável.....: Eraldo Luis da Silva
Descrição.......: O planus está apresentando mensagem de "Insufficient memory"
                  ao retirar o relatório Extrato Contratual Novo.
--------------------------------------------------------------------------------
SOL : 174701 Kintana : 1583165
Responsável : Vinicius Eduardo N. Maciel
Data : 23/02/2012
--------------------------------------------------------------------------------
SOL : 153702/5861 Kintana : 1372228
Responsável : Helen V. Bianchi
Data : 22/09/2011
--------------------------------------------------------------------------------}

unit CRelExtratoNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, mImovelMestre, uComunsImobiliarioDB, Wwdatsrc,
  DBClient, wwclient, wwdblook, uCtrlPlanPrevContabPatro, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, uCMClientDataSet, uCtrlPlanPrevContabil, uCtrlImovel,
  uCMFileUtils;

type
  TRelExtratoNovo = class(TfrmOkCancelar)
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
  RelExtratoNovo: TRelExtratoNovo;

implementation

uses DRelFinanc, uFuncoesImob, fAguarde, uDataBase, uMensErro, UFuncAlienacao,
     uComunsImobiliario, uVerificaPreenchimento, uCalcDocumento, uSistema,
     dBaseDados, uModuloImobiliario;

{$R *.DFM}

procedure TRelExtratoNovo.FormShow(Sender: TObject);
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

procedure TRelExtratoNovo.bbtnConfirmarClick(Sender: TObject);
var dDataBaixa,dUltAtual : TDateTime;
begin
   // Verifica Preenchimento
   if cmdtFim.Text = '' then begin
      MsgDlg('Informe a data final','Atenção',mtWarning, [mbOk],0);
      cmdtFim.SetFocus;
      Exit;
   end;
   if StrToDate(cmdtFim.Text) < StrToDate('31/12/2011') then begin
      MsgDlg('Utilização autorizada apenas para data maior ou igual que  01/01/2012 ','Atenção',mtWarning, [mbOk],0);
      cmdtFim.SetFocus;
      Exit;
   end;
   if (trim(dbcboPlanPrev.Text) <> '') and (trim(dbcboPatro.Text) = '') then
   begin
     MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
            'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;
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

   dtmRelFinanc.qryExtratoNovo.SQL.SaveToFile(Sistema.TempDir + 'RelExtratoNovo.txt');

   if chkFormaGerencial.Checked then begin
      LimpaParametros(dtmRelFinanc.qryExtratoNovo);
      with dtmRelFinanc.qryExtratoNovo do begin
         Open;
      end;
      dtmRelFinanc.ppTituloExtratoNovo.Caption           := 'Extrato Contratual Novo( Gerencial )';
      dtmRelFinanc.relExtratoNovolblDataCorrecao.Visible := False;
   end else begin

      dtmRelFinanc.qryExtratoNovo.Open;

      dtmRelFinanc.ppTituloExtratoNovo.Caption := 'Extrato Contratual Novo( Operacional )';
      dtmRelFinanc.relExtratoNovolblDataCorrecao.Visible := True;
      dtmRelFinanc.relExtratoNovolblDataCorrecao.Caption := '';
      dUltAtual := dtmRelFinanc.qryExtratoNovoDATA_CORRECAO.AsDateTime;
      while not dtmRelFinanc.qryExtratoNovo.Eof do begin
         if not dtmRelFinanc.qryextratoNovoDATA_CORRECAO.isNull then begin
            if dtmRelFinanc.qryextratoNovoDATA_CORRECAO.AsDateTime >= dUltAtual then begin
               dUltAtual := dtmRelFinanc.qryExtratoNovoDATA_CORRECAO.AsDateTime;
               dtmRelFinanc.relExtratoNovolblDataCorrecao.Caption := 'Valores corrigidos até: ' + FormatDateTime('dd/mm/yyyy', dUltAtual);
            end;
         end;

         if dtmRelFinanc.qryExtratoNovoDATALIMITE.AsDateTime >= cmdtFim.Date then begin
            dtmRelFinanc.qryExtratoNovo.Edit;
            dtmRelFinanc.qryExtratoNovoVLRCORRIG.Clear;
            dtmRelFinanc.qryExtratoNovo.Post;
         end;

         dtmRelFinanc.qryExtratoNovo.Next;
      end;
      dtmRelFinanc.qryExtratoNovo.First;
   end;


   if Sistema.TipoCliente = 19991 then begin   // FUNCEF
      if (cmdtFim.Text <> '') and (cmdtFim.Date < StrToDate('31/03/2005') ) then begin
         CorrigeResiduo;
      end else begin
         //Cássio Rovaroto - SIG nº 115965 - Início
         //if ModuloImobiliario.Alienacao.iTipoOperAtualRes <= 0 then CorrigeResiduoII;
         if (ModuloImobiliario.Alienacao.iTipoOperAtualRes  <= 0) and (cmdtFim.Date < StrToDate('01/05/2021')) then CorrigeResiduoII;
         //Cássio Rovaroto - SIG nº 115965 - Fim

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

procedure TRelExtratoNovo.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;

procedure TRelExtratoNovo.CorrigeResiduo;
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
         qryExtratoNovo.DisableControls;
         qryExtratoNovo.First;
         while not qryExtratoNovo.eof do begin
            fVlrTotal := 0;
            fCM       := 0;
            iCondPag  := qryExtratoNovoIDCONDPAGIMOVEL.AsInteger;
            while (qryExtratoNovoIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryExtratoNovo.eof) do begin
               if qryExtratoNovoFLGRESIDUOINCORP.AsString = 'N' then begin
                  fVlrTotal := fVlrTotal + qryExtratoNovoVLRRESIDUO.AsFloat;
                  iIndice   := qryExtratoNovoIDCORR_CONDPAG.AsInteger;
                  iMesRef   := qryExtratoNovoMESREF_CONDPAG.AsInteger;
                  dInicio   := qryExtratoNovoDATAVENCIMENTO.AsDateTime;
                  iRecAlt   := qryExtratoNovo.GetBookmark;
               end;
               qryExtratoNovo.Next;
               iRecNo := qryExtratoNovo.GetBookmark;
               bEof   := qryExtratoNovo.Eof;
            end;

            if (fVlrTotal > 0) and (dInicio < dLimite) then begin
               fCM := ComunsImobiliarioDB.CalcCM(fVlrTotal, iIndice,
                                                 dInicio + 1, dLimite, True,
                                                 iMesRef);

               if fCM > 0 then begin
                  qryExtratoNovo.GotoBookmark(iRecAlt);
                  qryExtratoNovo.Edit;
                  qryExtratoNovoVLRRESIDUOCORRIG.AsFloat := fVlrTotal + fCM;
                  qryExtratoNovo.Post;
                  qryExtratoNovo.GotoBookmark(iRecNo);
               end;
            end;
            if bEof then Break;
         end;
         qryExtratoNovo.First;
         qryExtratoNovo.EnableControls;
      end;
   finally
      FreeAndNil( ComunsImobiliarioDB );
   end;
end;


procedure TRelExtratoNovo.CorrigeResiduoII;
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
         qryExtratoNovo.DisableControls;
         qryExtratoNovo.First;
         while not qryExtratoNovo.eof do begin
            fVlrTotal := 0;
            fCM       := 0;
            iCondPag  := qryExtratoNovoIDCONDPAGIMOVEL.AsInteger;
            while (qryExtratoNovoIDCONDPAGIMOVEL.AsInteger = iCondPag) and (not qryExtratoNovo.eof) do begin
               if ( (qryExtratoNovoFLGRESIDUOINCORP.AsString = 'N') or
                    ((qryExtratoNovoFLGRESIDUOINCORP.AsString = 'C') and
                     (qryExtratoNovoDATACOBRES.AsDateTime > dLimite)) ) then begin
                  iIndice  := qryExtratoNovoIDCORR_CONDPAG.AsInteger;
                  iMesRef  := qryExtratoNovoMESREF_CONDPAG.AsInteger;
                  dInicio  := qryExtratoNovoDATAVENCIMENTO.AsDateTime;

                  if (qryExtratoNovoVLRRESIDUO.AsFloat > 0) and (dInicio < dLimite) then begin
                     fCM := ComunsImobiliario.Arredonda(
                            CalcDocumento.CalcCM(qryExtratoNovoVLRRESIDUO.AsFloat, iIndice,
                                                 dInicio + 1, dLimite, iMesRef), 2);

                     qryExtratoNovo.Edit;
                     if fCM > 0 then
                          qryExtratoNovoVLRRESIDUOCORRIG.AsFloat := qryExtratoNovoVLRRESIDUO.AsFloat + fCM
                     else qryExtratoNovoVLRRESIDUOCORRIG.AsFloat := qryExtratoNovoVLRRESIDUO.AsFloat;
                     qryExtratoNovo.Post;
                     fTotRes := fTotRes + qryExtratoNovoVLRRESIDUO.AsFloat;
                     fTotResAtual := fTotResAtual + qryExtratoNovoVLRRESIDUOCORRIG.AsFloat;
                  end;
               end;
               qryExtratoNovo.Next;
            end;
         end;
      end;
   finally
      FreeAndNil( ComunsImobiliarioDB );
   end;
end;



procedure TRelExtratoNovo.MontaQueryGerencial(const dDtFim: TDateTime);
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
           '       CPMF.TOT_CPMF,       '+#13+
           '       (NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0)) AS TOT_ALTERADOR ,   '+#13+
           '       DECODE(NVL(PF.NUMPARCELA,0), 0, 0, '+#13+
           '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO) ) AS NUMDOC, '+#13+
           '       PF.NUMPARCELA AS NUMPARC, '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       NVL(DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || TO_CHAR(CPFINAL.NUMPARCELAS)),0) AS NUMPARCELAORDEM, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
           '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO, '+#13+
                   QuotedStr(FormatDateTime('MMYYYY', dDtFim )) + ' AS MESANO_CALCULO, '+#13+
           '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '+#13+
           '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '+#13+
           '       CPFINAL.TIPOCONDPAG, '+#13+
           '       CPFINAL.NUMPARCELAS, '+#13+
           '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '+#13+
           '       PF.VLRNOMINAL,       '+#13+
           '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0)  +  NVL(CPMF.TOT_CPMF,0)  AS TOT_DEVIDO, '+#13+
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
           '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'',''P'') ) TC '+#13+
           '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
           '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13+
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
           '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
           '            FROM PARCEXTRAIMOV                             '+#13+
           '           WHERE FLGTIPOCOBRANCA = ''R''                   '+#13+
           '         ) CR                                              '+#13+
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
                      
           if molProposta1.iProposta > 0 then
              sSql := sSql + '    AND CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           if molComprador1.iComprador > 0 then
              sSql := sSql + '    AND CI.IDLOCATARIO = ' + IntToStr(molComprador1.iComprador) +#13;
           if molResponsavel1.iResponsavel > 0 then
              sSql := sSql + '    AND CI.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel) +#13;
           if molImovelMestre1.iMestre > 0 then
              sSql := sSql + '    AND IM.IDIMOVEL = ' + IntToStr(molImovelMestre1.iMestre) +#13;
           if cmdtFim.Text <> '' then
              sSQL := sSQL +
              '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sData + ') )'  + #13;
           //Helen - SOL : 178478 KTN : 1639384
           //sSql := sSql + ' AND PF.VLRPRESTACAO > 0 ' ;

           sSql := sSql + ' ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL,PF.FLGTIPOLANC,to_number(NUMPARCELAORDEM),  DATAVENCIMENTO';

   CMDebugToFile(sSql,'c:\Planus\Temp\RelExtratoContratualNovo.txt');
   dtmRelFinanc.qryExtratoNovo.Sql.Text := sSql;
end;

procedure TRelExtratoNovo.MontaQueryOperacional(const dDtFim: TDateTime);
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
           '       '' ''as NOMEMESTRE,  '+#13+
           '       PF.CODDOCUMENTO,     '+#13+
           '       PF.PLNCODIGO,        '+#13+
           '       CPMF.TOT_CPMF,       '+#13+
           '       (NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0)) AS TOT_ALTERADOR,   '+#13+
           '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0, '+#13+
           '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO) ) AS NUMDOC, '+#13+
           '       PF.NUMPARCELA AS NUMPARC, '+#13+
           '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
           '       CAST(to_char(NVL(DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || TO_CHAR(CPFINAL.NUMPARCELAS)),0)) AS VARCHAR(50)) AS NUMPARCELAORDEM, '+#13+
           '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
           '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO, '+#13+
                   QuotedStr(FormatDateTime('MMYYYY', dDtFim )) + ' AS MESANO_CALCULO, '+#13+
           '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '+#13+
           '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '+#13+
           '       CPFINAL.TIPOCONDPAG, '+#13+
           '       CPFINAL.NUMPARCELAS, '+#13+
           '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '+#13+
           '       PF.VLRNOMINAL,       '+#13+
           '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0) AS TOT_DEVIDO, '+#13+
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
           '                        NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0) - NVL(PP.VLRPAGO,0) )),2) AS VLRDIF, '+#13+
           '       ROUND(DECODE(CD.IDDOCDIVERGE, NULL,                   '+#13+
           '             DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0, '+#13+
           '                    NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TOT_ABONO,0) ), NULL),2) AS VLRCORRIG, '+#13+
           // Otacilio SOL 178419 KTN 1638829 INICIO
           '       -- Consultas retiradas do campo OnCalcFields '+#13+
           '      (SELECT DECODE(D.STATUS, ''2'', ''Baixado'', ''Aberto'') FROM DOCUMENTO D WHERE (D.CODDOCUMENTO = PF.CODDOCUMENTO) ) STATUS_CS, '+#13+
           '      (SELECT NVL(SUM(L.VLRDIA), 0) FROM LANCOPERDIAIMOB L WHERE (L.CODDOCUMENTO  = PF.CODDOCUMENTO) AND (L.IDOPERACAO <> 166)) ATUALIZACAO_CS, '+#13+
           '      (SELECT NVL(SUM (DECODE(DEBCRE,''D'',L.VALOR,-L.VALOR)),0) FROM LANCTODOCUM L WHERE (L.CODDOCUMENTO = PF.CODDOCUMENTO) )  SALDO_DOCUMENTO_CS '+#13+
           // Otacilio SOL 178419 FIM
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
           //Vinicius Maciel - SOL 174701 - KINTANA 1583165
         //  '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'') '+#13+
           //Vinicius Maciel - SOL 174701- KINTANA 1583165 - FIM
           '                                             AND LD.ESTORNO IS NULL                  '+#13+
           '                                             AND LD.DATALANCTO <= ' + sData + ' ) )  '+#13+
           '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                                  '+#13+
           '       ) PP, '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '        -- Foi criado o indice XIE1CONCILIADOC ' + #13 +
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
           '                      AND ( C.FLGTIPO IN (''T'',''R'') OR                       '+#13+
           '                            NOT EXISTS ( SELECT 1 FROM CONCILIADOC              '+#13+
           '                                          WHERE FLGTIPO IN (''T'',''R'')        '+#13+
           '                                            AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) ) '+#13+
           '                    GROUP BY C.IDPARCFINANCIMOV,                                '+#13+
           '                             DECODE(C.FLGTIPO, NULL, NULL,                      '+#13+
           '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
           '                                 ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2,       '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE1CONDPAGIMOVEL ' + #13 +
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

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE1IMOVEL          ' + #13 +
           '  --     ( SELECT DISTINCT                          '+#13+
           '  --             CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '+#13+
           '  --              M.IMONOME            AS NOMEMESTRE,       '+#13+
           '  --              M.IDIMOVEL           AS IDIMOVEL          '+#13+
           '  --         FROM CONTRATOXIMOVEL CXI, '+#13+
           '  --              IMOVEL I,            '+#13+
           '  --              IMOVEL M             '+#13+
           '  --        WHERE CXI.IDIMOVEL = I.IDIMOVEL           '+#13+
           '  --          AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM  SIG 96396, '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE2CONCILIADOC       '+#13+
           '       ( SELECT --LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
           '                P.IDPARCFINANCIMOV, T.CODTIPIMOVEL,  ' + #13 +
           '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
           '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
           '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
           '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
           '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
           '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
           '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+
           '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'',''P'') ) TC '+#13+
           '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
           '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13;

           if Sistema.TipoCliente = 19991 then sSql := sSql +
              '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
              '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
              '                                                                 FROM CONCILIADOC ' + #13 +
              '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
              '                                                                -- AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
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
           '          GROUP BY P.IDPARCFINANCIMOV, T.CODTIPIMOVEL /* LD.CODDOCUMENTO, T.CODTIPIMOVEL */  )  ALT, '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE9LANCTODOCUM ' +#13+
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

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE7LANCOPERDIAIMOB ' + #13 +
           '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOCORRIG                       '+#13+
           '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRRESIDUOCORRIG '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                                '+#13+
           '                   WHERE P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           //Cássio Rovaroto - SIG nº 115965 - Início
           //'                     AND ( L.IDOPERACAO = P.IDOPERATUALRES )        '+#13+
           '                     AND ( L.IDOPERACAO = 166 )        '+#13+
           //Cássio Rovaroto - SIG nº 115965 - Fim
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,    '+#13+
           '                ( SELECT L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           //Cássio Rovaroto - SIG nº 115965 - Início
           //'                     AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )    '+#13+
           '                     AND ( L2.IDOPERACAO = 166 )    '+#13+
           //Cássio Rovaroto - SIG nº 115965 - Fim
           '                     AND ( DATAOPER <= ' + sData + ')             '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV ) D2              '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV         '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                           '+#13+
           '        ) AR, ' +#13+

           // Otacilio SOL 178419 KTN 1638829
           '        -- Foi criado o indice XIE1PARCEXTRAIMOV ' +#13+
           '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
           '            FROM PARCEXTRAIMOV                             '+#13+
           '           WHERE FLGTIPOCOBRANCA = ''R''                   '+#13+
           '         ) CR,                                             '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE7LANCOPERDIAIMOB          ' + #13 +
           '       ( SELECT D1.IDPARCFINANCIMOV, SUM(D1.TOT_CORRECAO) AS TOT_CORRECAO   '+#13+
           '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, IDOPERACAO, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE -- L.DATABAIXA IS NOT NULL  AND                          '+#13+
           '                      L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR             '+#13+
//Cássio Rovaroto - SIG 87362 - Início
//           '                           L.IDOPERACAO = P.IDOPERATUALCM )                 '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALCM OR                ' +#13+
           '                           L.IDOPERACAO = 266             OR                ' +#13+
           '                           L.IDOPERACAO = 268                )              '+#13+
//Cássio Rovaroto - SIG 87362 - Fim		  
           '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, L.DATAOPER ) D1,'+#13+
           '                ( SELECT L2.IDPARCFINANCIMOV, IDOPERACAO, MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13 +
           '                    -- AND DATABAIXA IS NOT NULL                        '+#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR    '+#13+
//Cássio Rovaroto - SIG 87362 - Início
           //           '                           L2.IDOPERACAO = P2.IDOPERATUALCM )        '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALCM OR       '+#13+
           '                           L2.IDOPERACAO = 266             OR        ' +#13+
           '                           L2.IDOPERACAO = 268                    )  '+#13+
//Cássio Rovaroto - SIG 87362 - Fim		   

           '                     AND ( DATAOPER <= ' + sData + ')                '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV, IDOPERACAO ) D2 '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                   '+#13+
           '            AND D1.IDOPERACAO = D2.IDOPERACAO             '+#13+
           '          GROUP BY D1.IDPARCFINANCIMOV                    '+#13+
           '       ) CO1,                                             '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE7LANCOPERDIAIMOB  ' + #13 +
           '       ( SELECT D1.IDPARCFINANCIMOV, MAX(D2.DTAPUR) AS DTAPUR, SUM(D1.TOT_CORRECAO) AS TOT_CORRECAO '+#13+
           '           FROM ( SELECT                                  '+#13;

           sSql := sSql + '   L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13;
           sSql := sSql +
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR             '+#13+
//           '                           L.IDOPERACAO = P.IDOPERATUALCM )                 '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALCM OR                '+#13+
           '                           L.IDOPERACAO = 266             OR                '+#13+
           '                           L.IDOPERACAO = 268                )              '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER ) D1,            '+#13;
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Início
           //Retirado o campo: DATABAIXA
           sSql := sSql + '( SELECT L2.IDPARCFINANCIMOV,IDOPERACAO, MAX(L2.DATAOPER) AS DTAPUR '+#13;
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Fim
           sSql := sSql +
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
           '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR    '+#13+
//           '                           L2.IDOPERACAO = P2.IDOPERATUALCM )        '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALCM OR       '+#13+
           '                           L2.IDOPERACAO = 266             OR        '+#13+
           '                           L2.IDOPERACAO = 268                )      '+#13+

           '                     AND ( DATAOPER <= ' + sData + ')                '+#13;
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Início
           //Retirado o campo: L2.DATABAIXA
           sSql := sSql + '  GROUP BY L2.IDPARCFINANCIMOV, L2.IDOPERACAO) D2 '+#13;
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Fim
           sSql := sSql +
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                   '+#13+
           '            AND D1.IDOPERACAO = D2.IDOPERACAO             '+#13+
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Início
           '          GROUP BY D1.IDPARCFINANCIMOV '+#13+
           //'            AND NVL(D1.DATABAIXA,SYSDATE+1000) = NVL(D2.DATABAIXA,SYSDATE+1000) '                + #13 +
           //'          GROUP BY D1.IDPARCFINANCIMOV'+#13+
           //Wylliam Leite da Silva - SOL: 250901 PPM: 794777 - Fim
           '        ) CO2,  '+#13+

           // Otacilio SOL 178419 KTN 1638829
           '       -- Foi criado o indice XIE7LANCOPERDIAIMOB ' + #13 +
           '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO             '+#13+
           '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE L.IDMODULO = ' + IntToStr(Sistema.IdModulo)         +#13+
           '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)        +#13;
           if molProposta1.iProposta > 0 then
              sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13;
           sSql := sSql +
           '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,            '+#13+
           '                ( SELECT L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2        '+#13+
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
           ' --   AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)  SIG 96396 '+#13+
           '--    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '+#13+
           '    AND (ALT.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) ' + #13 +
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
              sSQL := sSQL +
              '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sData + ') OR ' + #13 +
              '          (PP.DATAPAGAMENTO <= ' + sData + ') )' + #13;

           //Helen - SOL : 178478 KTN : 1639384
           //sSql := sSql + ' AND PF.VLRPRESTACAO > 0 ' ;

           sSql := sSql + ' AND EXISTS (SELECT 1 ' + #13 +
                          '               FROM CONTRATOXIMOVEL CXI, ' + #13 +
                          '                    PLANOPATROXIMOVEL PPI ' + #13 +
                          '              WHERE --CXI.IDCONTRATOIMOVEL(+) = IM.IDCONTRATOIMOVEL  SIG 96396  AND' + #13 +
                          '                CXI.IDIMOVEL = PPI.IDIMOVEL ';
           if Trim(dbcboPatro.Text) <> ''  then
            sSql := sSql + ' AND PPI.IDPATRO = ' + dbcboPatro.LookupValue;

           if Trim(dbcboPlanPrev.Text) <> '' then
            sSql := sSql + ' AND PPI.IDPLANOPREV = ' + dbcboPlanPrev.LookupValue;

           sSql := sSql + ')';


//         sSql := sSql + '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';
//         sSql := sSql + ' ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, to_number(NUMPARCELAORDEM) ';
           sSql := sSql + ' ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL,PF.FLGTIPOLANC,to_number(NUMPARCELAORDEM),  DATAVENCIMENTO ';

   CMDebugToFile(sSql,'c:\Planus\Temp\RelExtratoContratualNovo.txt');
   dtmRelFinanc.qryExtratoNovo.Sql.Text := sSql;

end;




procedure TRelExtratoNovo.AjustaOperacional;
begin
   with dtmRelFinanc.qryExtratoNovo do begin
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

procedure TRelExtratoNovo.FormCreate(Sender: TObject);
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

procedure TRelExtratoNovo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlPlanPrev);
end;

end.
