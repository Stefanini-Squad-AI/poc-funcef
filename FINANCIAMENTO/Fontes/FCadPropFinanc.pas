unit FCadPropFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, TREdit, Math, CMProcura,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList;

type
  TFrmCadPropFinanc = class(TfrmCadMestreDetalheCS)
    TabCond: TTabSheet;
    TabDesc: TTabSheet;
    memDesc: TDBMemo;
    Panel1: TPanel;
    grdCondPag: TwwDBGrid;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    dsCondPag: TwwDataSource;
    updCondDet: TUpdateSQL;
    qryCondPag: TwwQuery;
    qryDetIDIMOVEL: TFloatField;
    qryDetIDCONTRATOIMOVEL: TFloatField;
    qryDetIMONOME: TStringField;
    Label1: TLabel;
    edNumCont: TDBEdit;
    Label2: TLabel;
    edNomeCont: TDBEdit;
    edDataProp: TCMDateTimePicker;
    Label3: TLabel;
    edDataAni: TCMDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    edDataIniParc: TCMDateTimePicker;
    Label9: TLabel;
    chkSinal: TDBCheckBox;
    edValParc: TDBRealEdit;
    Label10: TLabel;
    edPrazo: TDBRealEdit;
    Label11: TLabel;
    RgPeriodo: TDBRadioGroup;
    Label12: TLabel;
    edJuros: TDBRealEdit;
    Label13: TLabel;
    RgPerJuros: TDBRadioGroup;
    edTxJurMercFinanc: TDBRealEdit;
    Label14: TLabel;
    RgPercTxMF: TDBRadioGroup;
    edPercComiss: TDBRealEdit;
    Label15: TLabel;
    Label17: TLabel;
    edNumMes: TDBRealEdit;
    edPercIdeal: TDBRealEdit;
    Label18: TLabel;
    edValAvali: TDBRealEdit;
    Label19: TLabel;
    edValContab: TDBRealEdit;
    Label20: TLabel;
    edValPresente: TDBRealEdit;
    Label21: TLabel;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryCONNUMERO: TStringField;
    qryCONNOME: TStringField;
    qryCONDATAASSINATURA: TDateTimeField;
    qryCONDATAINICIO: TDateTimeField;
    qryFLGTIPOCONTRATO: TStringField;
    qryCONPERCENTMORA: TFloatField;
    qryCONPERMORA: TStringField;
    qryCONTAXAADMIN: TFloatField;
    qryCONVLRAJUSTADO: TFloatField;
    qryCONPERREAJUSTE: TFloatField;
    qryCONPERCENTMULTA: TFloatField;
    qryCONVLRTOTAL: TFloatField;
    qryCONDESCRICAO: TMemoField;
    qryVLRPROPOSTA: TFloatField;
    qryVLRPRESENTE: TFloatField;
    qryVLRCONTABIL: TFloatField;
    qryCONINDICEMORA: TFloatField;
    dblcIndCorret: TCMDBLookupCombo;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    btnCalcValContab: TSpeedButton;
    btnCalcValPresente: TSpeedButton;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagFLGSINAL: TStringField;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagSISTCORRECAO: TStringField;
    qryCondPagNUMPARCELAS: TFloatField;
    Label22: TLabel;
    edNumParc: TDBRealEdit;
    tabAlug: TTabSheet;
    Label16: TLabel;
    edValAluguel: TDBRealEdit;
    btnCalcValAluguel: TSpeedButton;
    qryMoeInd: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    dblcIndCorAlug: TCMDBLookupCombo;
    Label6: TLabel;
    edDataReajAlug: TCMDateTimePicker;
    Label7: TLabel;
    qryCONINDICEREAJUSTE: TFloatField;
    qryCONDATAREAJUSTE: TDateTimeField;
    dbrePrReajAlug: TDBRealEdit;
    Label8: TLabel;
    Label23: TLabel;
    qryCONDIASTOLERANCIA: TFloatField;
    qryDetMESTRE: TStringField;
    TabAnalIni: TTabSheet;
    btnCalcAnal: TSpeedButton;
    gbVende: TGroupBox;
    lbVende: TLabel;
    cmpImovel: TCMProcura;
    msImovel: TMontaSelect;
    Panel2: TPanel;
    Label24: TLabel;
    lbTxCorret: TDBText;
    Label26: TLabel;
    Label25: TLabel;
    lbPercAlug: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edValTotProp: TRealEdit;
    edValPresAnal: TRealEdit;
    edValorAlug: TRealEdit;
    edValorAvali: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCalcValAluguelClick(Sender: TObject);
    procedure btnCalcValContabClick(Sender: TObject);
    procedure btnCalcValPresenteClick(Sender: TObject);
    procedure btnCalcAnalClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure SelMestreDet(n : Double);
    Function  CalcValAluguel(var dDataReajuste : TDateTime; var iIndiceReajuste : LongInt; var iPrazoReajuste : Integer) : Double;
    Function  CalcValPresente : Double;
    //
  public
    { Public declarations }
  end;

var
  FrmCadPropFinanc: TFrmCadPropFinanc;

implementation

{$R *.DFM}
Uses uDataBase, uSistema, uMensErro, dBaseDados;

Procedure TFrmCadPropFinanc.SelMestreDet(n : Double);
Begin
  qry.Close;
  If Not qry.Prepared then qry.Prepare;
  qry.Params[0].AsFloat := n;
  qry.Open;
  //
  qryDet.Close;
  If Not qryDet.Prepared then qryDet.Prepare;
  qryDet.Params[0].AsFloat := n;
  qryDet.Open;
  //
  
  qryCondPag.Close;
  If Not qryCondPag.Prepared then qryCondPag.Prepare;
  qryCondPag.Params[0].AsFloat := n;
  qryCondPag.Open;
  //

End;

procedure TFrmCadPropFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;

Procedure TFrmCadPropFinanc.CmeCadastroInsert(Sender: TObject);
Begin
  SelMestreDet(-1);
  inherited;
  qryIDCONTRATOIMOVEL.AsFloat     := LeUltRegistro(nil,'CONTRATOIMOVEL');
  qryCONPERMORA.AsString          := 'A';
  RgPercTxMF.ItemIndex            := 2;
  qryCONDATAINICIO.AsDateTime     := Date;
  edDataAni.Text                  := DateToStr(Date);
  qryCONDATAASSINATURA.AsDateTime := Date;
  edDataProp.Text                 := DateToStr(Date);
  edNumCont.SetFocus;
End;

Procedure TFrmCadPropFinanc.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   edNumCont.SetFocus;
End;

Procedure TFrmCadPropFinanc.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;
   While Not qryDet.Eof Do
      qryDet.Delete;
   //
   qryCondPag.First;
   While Not qryCondPag.Eof Do
      qryCondPag.Delete;
   Inherited;
End;

Procedure TFrmCadPropFinanc.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   If MontaSelect.RetornouValor Then
      Begin
         SelMestreDet(StrToFloat(MontaSelect.ValoresChave[0]));
         btnCalcAnal.Click;
      End;
End;

Procedure TFrmCadPropFinanc.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edNumCont.Text) = '' Then
       Begin
           MsgDlg('Nº da Proposta não foi preenchido','Erro',mtError,[mbOK],0);
           edNumCont.SetFocus;
           Accept := False;
       End
   Else
   If Trim(edNomeCont.Text) = '' Then
       Begin
           MsgDlg('Nome da Proposta não foi preenchido','Erro',mtError,[mbOK],0);
           edNomeCont.SetFocus;
           Accept := False;
       End
   Else
   If Trim(edDataProp.Text) = '' Then
       Begin
           MsgDlg('Data da proposta não foi preenchida','Erro',mtError,[mbOK],0);
           edDataProp.SetFocus;
           Accept := False;
       End
     Else
   If Trim(edDataAni.Text) = '' Then
       Begin
           MsgDlg('Data de aniverssário não foi preenchida','Erro',mtError,[mbOK],0);
           edDataAni.SetFocus;
           Accept := False;
       End
     Else
   If qryDet.IsEmpty Then
       Begin
           MsgDlg('Não há imóveis cadastrados','Erro',mtError,[mbOK],0);
           Accept := False;
       End;
   If qryCondPag.IsEmpty Then
       Begin
           MsgDlg('Não há condições de pagamento cadastradas','Erro',mtError,[mbOK],0);
           Accept := False;
       End;
End;

Procedure TFrmCadPropFinanc.CmeCadastroConfirma(Sender: TObject);
Begin
   If qry.State in dsEditModes then
     Begin
        qryFLGTIPOCONTRATO.AsString := 'P';
        btnCalcValPresente.Click;
        AplicaAlteracoes([qry,qryDet,qryCondPag]);
     End
   Else
      AplicaAlteracoes([qryDet,qryCondPag,qry]);
   Inherited;
End;

Procedure TFrmCadPropFinanc.CmeDetalheInsert(Sender: TObject);
Begin
    inherited;
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       0 : Begin
              cmpImovel.SetFocus;
           End;
       1 : Begin
              qryCondPagIDCONDPAGIMOVEL.AsFloat := LeUltRegistro(nil,'CONDPAGIMOVEL');
              qryCondPagPRAZO.AsString       := 'M';
              RgPeriodo.ItemIndex := 1;
              qryCondPagPERIODOTAXA.AsString := 'M';
              qryCondPagFLGSINAL.AsString    := 'N';
              RgPerJuros.ItemIndex := 1;
              edDataIniParc.SetFocus;
           End;
    End;
End;

Procedure TFrmCadPropFinanc.CmeDetalheEdit(Sender: TObject);
Begin
    inherited;
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       0 : Begin
              cmpImovel.SetFocus;
           End;
       1 : Begin
              edDataIniParc.SetFocus;
           End;
    End;
End;

Procedure TFrmCadPropFinanc.CmeDetalheDelete(Sender: TObject);
Begin
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       0 : Begin
              If MsgDlg('Confirma a exclusão do Imóvel','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
                inherited;
           End;
       1 : Begin
              If MsgDlg('Confirma a exclusão da Condição de Pagamento','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
                inherited;
           End;
    End;
End;

Procedure TFrmCadPropFinanc.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in dsEditModes) or (qryCondPag.State in dsEditModes) Then
   Begin
       if pgctrlDetalhe.ActivePage.PageIndex = 0 Then
         Begin
            If trim(cmpImovel.Text) = '' Then
               Begin
                   MsgDlg('Imovel não foi preenchido','Erro',mtError,[mbOK],0);
                   cmpImovel.SetFocus
               End
            Else
               Begin
                  qryDetIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;
                  if msImovel.RetornouValor then begin
                     qryDetIMONOME.asString         := msImovel.ValoresChave[2];
                     qryDetMESTRE.asString          := msImovel.ValoresChave[1];
                  end else begin
                     qryDetIMONOME.asString         := '';
                     qryDetMESTRE.asString          := '';
                  end;
                  Inherited;
               End;

         End
       Else
       if pgctrlDetalhe.ActivePage.PageIndex = 1 Then
         Begin
            If trim(edDataIniParc.text) = '' Then
               Begin
                   MsgDlg('Data de inicio não foi preenchida','Erro',mtError,[mbOK],0);
                   edDataIniParc.SetFocus;
               End
            Else
            If edValParc.Value <= 0 Then
               Begin
                   MsgDlg('Valor Financiado não foi preenchido','Erro',mtError,[mbOK],0);
                   edValParc.SetFocus;
               End
            Else
            If edPrazo.Value <= 0 Then
               Begin
                   MsgDlg('Prazo não foi preenchido','Erro',mtError,[mbOK],0);
                   edPrazo.SetFocus;
               End
            Else
               Begin
                  qryCondPagIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;
                  Inherited;
               End;
         End;
   End
 Else
   inherited;
End;

Function TFrmCadPropFinanc.CalcValAluguel(var dDataReajuste : TDateTime; var iIndiceReajuste : LongInt; var iPrazoReajuste : Integer) : Double;
Var
  sCond : String;
  sSql  : String;
Begin
    Result := 0;
    sCond  := '(';
    qryDet.DisableControls;
    qryDet.First;
    While Not qryDet.EOF Do
       Begin
          sCond := sCond + FormatFloat('#0',qryDetIDIMOVEL.asFloat)+',';
          qryDet.Next;
       End;
    qryDet.EnableControls;
    sCond := Copy(sCond,1,Length(sCond)-1) + ')';
    sSql  := ' SELECT SUM(CI.CIMVLRAJUSTADO) AS VALOR '+
             ' FROM CONTRATOIMOVEL C,  '+
             '      CONTRATOXIMOVEL CI '+
             ' WHERE  (C.FLGTIPOCONTRATO = ''L'') '+
             '    AND (CI.IDIMOVEL IN '+ sCond +')'+
             '    AND (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) ';
    if FazQuery(DtmBaseDados.qry,sSql) Then
       Result := DtmBaseDados.qry.FieldByName('VALOR').AsFloat;
    //
    sSql  := ' SELECT C.CONPROXREAJUSTE, C.CONPERREAJUSTE, C.CONINDICEREAJUSTE '+
             ' FROM CONTRATOIMOVEL C,  '+
             '      CONTRATOXIMOVEL CI '+
             ' WHERE  (C.FLGTIPOCONTRATO = ''L'') '+
             '    AND (CI.IDIMOVEL IN '+ sCond +')'+
             '    AND (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) ';
    if FazQuery(DtmBaseDados.qry,sSql) Then
       Begin
          dDataReajuste   := DtmBaseDados.qry.FieldByName('CONPROXREAJUSTE').AsDateTime;
          iIndiceReajuste := DtmBaseDados.qry.FieldByName('CONINDICEREAJUSTE').AsInteger;
          iPrazoReajuste  := DtmBaseDados.qry.FieldByName('CONPERREAJUSTE').AsInteger;
       end;
end;

Function TFrmCadPropFinanc.CalcValPresente : Double;
Var
  rNumPeriodos : Double;
  rValorInd    : Double;
  rValorPre    : Double;
  rValFuturo   : Double;
  rValPresente : Double;
  rTxMercado   : Double;
  rTxFinanc    : Double;
  rNumDias     : Double;
Begin
    rValorPre  := 0;
    qryCondPag.DisableControls;
    qryCondPag.First;
    While Not qryCondPag.EOF Do
       Begin
          rValorInd    := (qryCondPagVLRFINANC.asFloat - (qryCondPagVLRFINANC.asFloat*(qryCONTAXAADMIN.AsFloat/100)));
          // Converte a taxa do mercado finaceiro para mes
          if qryCONPERMORA.AsString = 'D' then
             rTxMercado := Power(qryCONPERCENTMORA.AsFloat,30)
          else
          If qryCONPERMORA.AsString = 'A' then
             rTxMercado := Power(qryCONPERCENTMORA.AsFloat,(1/12))
          else
             rTxMercado := qryCONPERCENTMORA.AsFloat;
          // Converte a taxa de juros do financiamento para mes
          if qryCondPagPERIODOTAXA.AsString = 'D' then
             rTxFinanc    := Power(qryCondPagTAXAJUROS.AsFloat,30)
          else
             if qryCondPagPERIODOTAXA.AsString = 'A' then
                rTxFinanc    := Power(qryCondPagTAXAJUROS.AsFloat,(1/12))
             else
                rTxFinanc    := qryCondPagTAXAJUROS.AsFloat;
          // Converte as taxas para compatibilizar com o periodo da parcela
          rNumDias     := (qryCondPagDATAINI.asDateTime - qryCONDATAASSINATURA.asDateTime)/30;
          if qryCondPagPRAZO.AsString = 'D' then
             rNumPeriodos := ((qryCondPagNUMPARCELAS.AsInteger-1)/30)+rNumDias
          else
          if qryCondPagPRAZO.AsString = 'A' then
             rNumPeriodos := ((qryCondPagNUMPARCELAS.AsInteger-1)*12)+rNumDias
          else
             rNumPeriodos := qryCondPagNUMPARCELAS.AsInteger-1+rNumDias;
          //
          rValFuturo   := rValorInd * Power((1 + (rTxFinanc/100)),rNumPeriodos);
          rValPresente := rValFuturo/Power((1 + (rTxMercado/100)),rNumPeriodos);
          rValorPre := rValorPre + rValPresente;
          qryCondPag.Next;
       End;
    qryCondPag.EnableControls;
    Result := rValorPre;
end;

procedure TFrmCadPropFinanc.btnCalcValAluguelClick(Sender: TObject);
var dDataReajuste   : TDateTime;
    iIndiceReajuste : LongInt;
    iPrazoReajuste  : Integer;
begin
   inherited;
   If qryDet.IsEmpty Then
     Begin
         MsgDlg('Não há imóveis cadastrados','Erro',mtError,[mbOK],0);
     End
   Else
     Begin
        dDataReajuste   := Date;
        iIndiceReajuste := 0;
        iPrazoReajuste  := 0;
        qryCONVLRTOTAL.AsFloat        := CalcValAluguel(dDataReajuste,iIndiceReajuste,iPrazoReajuste);
        edValAluguel.Value            := qryCONVLRTOTAL.AsFloat;
        edDataReajAlug.Date           := dDataReajuste;
        edDataReajAlug.Text           := DateToStr(dDataReajuste);
        qryCONDATAREAJUSTE.AsDateTime := dDataReajuste;
        if iIndiceReajuste <> 0 then
           qryCONINDICEREAJUSTE.AsInteger:= iIndiceReajuste;
        qryCONDIASTOLERANCIA.AsInteger:= iPrazoReajuste;
        dbrePrReajAlug.Value          := iPrazoReajuste;
     End;
end;

procedure TFrmCadPropFinanc.btnCalcValContabClick(Sender: TObject);
begin
  inherited;
  MsgDlg('Em Desenvolvimento','Aviso',mtWarning,[mbOK],0);
end;

procedure TFrmCadPropFinanc.btnCalcValPresenteClick(Sender: TObject);
begin
   inherited;
   If qryCondPag.IsEmpty Then
     Begin
         MsgDlg('Não há condições de pagamentos cadastradas','Erro',mtError,[mbOK],0);
     End
   Else
     Begin
        qryVLRPRESENTE.AsFloat := CalcValPresente;
        edValPresente.Value    := qryVLRPRESENTE.AsFloat;
        edValPresAnal.Value    := qryVLRPRESENTE.AsFloat;
     End;
end;

procedure TFrmCadPropFinanc.btnCalcAnalClick(Sender: TObject);
Var
  rValTotProp : Double;
begin
  inherited;
  rValTotProp := 0;
  //
  edValorAvali.Value  := (qryCONVLRAJUSTADO.AsFloat / (1-(qryCONTAXAADMIN.AsFloat/100)));
  if qryCONPERCENTMULTA.AsFloat <> 0 then
     edValorAlug.Value   := (qryCONVLRTOTAL.AsFloat / (qryCONPERCENTMULTA.AsFloat/100))
  else
     edValorAlug.Value   := 0;
  edValPresAnal.Value := qryVLRPRESENTE.AsFloat;
  qryCondPag.DisableControls;
  qryCondPag.First;
  While Not qryCondPag.EOF Do
     Begin
        rValTotProp := rValTotProp + qryCondPagVLRFINANC.AsFloat;
        qryCondPag.Next;
     End;
  qryCondPag.EnableControls;
  edValTotProp.value := rValTotProp;
  If edValPresAnal.Value >= edValorAlug.Value Then
     Begin
        lbVende.Caption := 'VALE VENDER';
        lbVende.Color   := clNavy;
     End
  Else
    Begin
       lbVende.Caption := 'NÃO VALE VENDER';
       lbVende.Color   := clRed;
    End;

end;


// VALOR CONTABIL = ATIVO FIXO.CALCULA VALOR CONTABIL
{
=================================================================
 TABELA DE SINONIMOS DO CADASTRO
=================================================================
  . CONDATAASSINATURA = DATAANIVER
  . CONDATAINICIO     = DATAPROPOSTA
  . CONPERCENTMORA    = TXJURMERCFINANC
  . CONPERMORA        = PERTXJURMERCFINANC
  . CONTAXAADMIN      = PERCCOMISSCORRET
  . CONVLRAJUSTADO    = VLRAVALIACAO
  . CONPERREAJUSTE    = NUMMESLIMPROJ
  . CONPERCENTMULTA   = PERCIDEALALUG
  . CONVLRTOTAL       = VLRALUGUEL
  . CONDIASTOLERANCIA = PRAZOREAJUSTEALUGUEL
  . CONINDICEREAJUSTE = INDICEREAJUSTEALUGUEL
  . CONDATAREAJUSTE   = DATAREAJUSTEALUGUEL
 }

end.
