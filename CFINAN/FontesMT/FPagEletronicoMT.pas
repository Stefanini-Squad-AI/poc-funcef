(*
  17/09/2000 - Migração para o modelo 3 camadas
  23/01/2003 - Conclusão do processo
*******************************************************************************)
Unit
  FPagEletronicoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  Wwquery,   uAutorizacao, uSistema, Grids, Wwdbigrd, uIntegraBack,
  Wwdbgrid, DBCtrls, Wwdatsrc, uMensErro, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdblook, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra,
  uCtrlPagEletronico;

Type
  TFrmPagEletronicoMT = class(TfrmOkCancelar)
    SrcLabel: TLabel;
    SrcList: TListBox;
    ExcAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    IncludeBtn: TSpeedButton;
    DstLabel: TLabel;
    DstList: TListBox;
    PnlCodigodeBarras: TPanel;
    EdtBarras: TEdit;
    EdtRepBarras: TEdit;
    Label2: TLabel;
    wwDBGrid1: TwwDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator1: TDBNavigator;
    DsLoteDoc: TwwDataSource;
    ChkDoc: TCheckBox;
    LblRemessa: TLabel;
    BtnIncluiBarras: TBitBtn;
    CmbModeloCnab: TCMDBLookupCombo;
    RgEmisLote: TRadioGroup;
    DtEmis: TCMDateTimePicker;
    CdsLotePagto: TCMClientDataSet;
    CdsModelosCnab: TCMClientDataSet;
    CdsLoteDoc: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsPortadorForma: TCMClientDataSet;
    CdsDocumentos: TCMClientDataSet;
    CdsAtualizaBarras: TCMClientDataSet;
    cdsDocumentosIDPESSOA: TFloatField;
    cdsDocumentosNOME: TStringField;
    cdsDocumentosRAZAOSOCIAL: TStringField;
    cdsDocumentosNUMDOCUMENTO: TStringField;
    cdsDocumentosLOGRADOURO: TStringField;
    cdsDocumentosNUMERO: TStringField;
    cdsDocumentosCOMPLEMENTO: TStringField;
    cdsDocumentosBAIRRO: TStringField;
    cdsDocumentosCIDADE: TStringField;
    cdsDocumentosCODESTADO: TStringField;
    cdsDocumentosCEP: TStringField;
    cdsDocumentosIDFORCLI: TFloatField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsDocumentosVALOR: TFloatField;
    cdsDocumentosVALORDESCONTO: TFloatField;
    cdsDocumentosVALORJUROS: TFloatField;
    cdsDocumentosDATAVENCTO: TDateTimeField;
    cdsDocumentosDATAPROGRAMADA: TDateTimeField;
    cdsDocumentosTIPOMOEDA: TFloatField;
    cdsDocumentosNUMLOTE: TFloatField;
    cdsDocumentosCODPORTFORMA: TFloatField;
    cdsDocumentosCODFORMAPAGTO: TFloatField;
    cdsDocumentosCODTIPOPAGTO: TFloatField;
    cdsDocumentosFLGEMITEAVISO: TStringField;
    cdsDocumentosCODARQUIVOREMESSA: TFloatField;
    cdsDocumentosIDBANCO: TFloatField;
    cdsDocumentosNOCONTACORR: TStringField;
    cdsDocumentosCODBARRA: TStringField;
    cdsDocumentosCODBARRAVALOR: TStringField;
    cdsDocumentosNODOCUMENTO: TFloatField;
    cdsDocumentosCOMPLDOCUMENTO: TStringField;
    cdsDocumentosLIVRE: TStringField;
    cdsDocumentosTIPO: TStringField;
    cdsDocumentosNUMEMPRESABANCO: TStringField;
    cdsDocumentosCODPORTADOR: TFloatField;
    cdsDocumentosDEBCRE: TStringField;
    cdsDocumentosNOMEAGENCIA: TStringField;
    cdsDocumentosTIPOCONTA: TStringField;
    cdsDocumentosCONTACORRENTE: TStringField;
    cdsDocumentosCODBANCOFAVORECIDO: TStringField;
    cdsDocumentosNUMAGENCIA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure IncludeBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure SetItem(List: TListBox; Index: Integer);
    procedure SetButtons;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ChkDocClick(Sender: TObject);
    procedure DsLoteDocDataChange(Sender: TObject; Field: TField);
    procedure BtnIncluiBarrasClick(Sender: TObject);
    procedure CmbModeloCnabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure RgEmisLoteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CdsDocumentosCalcFields(DataSet: TDataSet);

  Private
    { Private declarations }
    CtrlPagEletronico : TCtrlPagEletronico;

    bExibeBarras      : Boolean;
    Procedure AtualizaBarras;
    Procedure MontaQueryBoletos;
  Public
    { Public declarations }
  End;

Var
  FrmPagEletronicoMT: TFrmPagEletronicoMT;

Implementation

Uses
  DBaseDados, uModulo, fAguarde, uFuncaoGeral, uDataBase, uLancFinanc,
  DDadosBancarios;

{$R *.DFM}
//***********************************************
Procedure TFrmPagEletronicoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlPagEletronico   := TCtrlPagEletronico.Create;

  CtrlPagEletronico.IdEmpresa    := Sistema.IdEmpresa;
  CtrlPagEletronico.IdModulo     := Sistema.IdModulo;
  CtrlPagEletronico.IdUsuario    := Sistema.IdUsuario;
  CtrlPagEletronico.UsaPlanoPatro:= Sistema.UsaPlanoPatro;
  CtrlPagEletronico.IdEspAcesso  := Sistema.IdEspAcesso;
  CtrlPagEletronico.PlanoConta   := ParamIntegra.Plano;
  CtrlPagEletronico.RecPag       := ParamIntegra.RecPag;
  CtrlPagEletronico.Financeiro   := ParamIntegra.IntegraFinanceiro;
  CtrlPagEletronico.EstornoDocum    := ParamIntegra.EstornaContab;
  CtrlPagEletronico.IntegraContabil := ParamIntegra.IntegraContab;

  CtrlPagEletronico.CdsLotePagto      := CdsLotePagto;
  CtrlPagEletronico.CdsModelosCnab    := CdsModelosCnab;
  CtrlPagEletronico.CdsLoteDoc        := CdsLoteDoc;
  CtrlPagEletronico.CdsAux            := CdsAux;
  CtrlPagEletronico.CdsPortadorForma  := CdsPortadorForma;
  CtrlPagEletronico.CdsDocumentos     := CdsDocumentos;
  CtrlPagEletronico.CdsAtualizaBarras := CdsAtualizaBarras;

  CtrlPagEletronico.OpenTransaction := False;
  CtrlPagEletronico.InitializeAs( ParamIntegra );

  bExibeBarras            := True;
  DtEmis.Date             := Date;
  PnlCodigodeBarras.Align := AlClient;
End;
//***********************************************
Procedure TFrmPagEletronicoMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  CdsLoteDoc.Close;
  CdsLotePagto.Close;

  CtrlPagEletronico.Free;
  Inherited;
End;
//***********************************************
Procedure TFrmPagEletronicoMT.IncludeBtnClick(Sender: TObject);
Var
  Index: Integer;
Begin
  If ( SrcList.selected[ SrcList.ItemIndex ] ) And
     ( Modulo.ProcessoRadLiberado( StrToInt( SrcList.Items[ SrcList.ItemIndex ] ) ) ) Then
  Begin
    Index := GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);
  End;
End;

procedure TFrmPagEletronicoMT.ExcludeBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TFrmPagEletronicoMT.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
  begin
    if not Modulo.ProcessoRadLiberado(StrToInt(SrcList.Items[I])) then
    begin
      MontaQueryBoletos;
      Break;
    end;
    DstList.Items.AddObject(SrcList.Items[I],SrcList.Items.Objects[I]);
  end;
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TFrmPagEletronicoMT.ExcAllBtnClick(Sender: TObject);
var
 // I: Integer;
 Index:  Integer;
begin
  //DF 04/07 Gustavo
  //Exclusão do Hint - Value assigned to 'index' never used
  //Index := GetFirstSelection(DstList);
  //Fim DF 04/07 Gustavo

  If ( DstList.selected[ DstList.ItemIndex ] ) And
     ( Modulo.ProcessoRadLiberado( StrToInt( DstList.Items[ DstList.ItemIndex ] ) ) ) Then Begin
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
    SetItem(DstList, Index);
  End;
  {for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0); }
end;


procedure TFrmPagEletronicoMT.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TFrmPagEletronicoMT.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExCAllBtn.Enabled  := not DstEmpty;
end;

function TFrmPagEletronicoMT.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TFrmPagEletronicoMT.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;
//************************************************
Procedure TFrmPagEletronicoMT.bbtnConfirmarClick(Sender: TObject);
Var
  x: Integer;       //iCodLancFinanc
  //sNumChq, sDoc, sDataEmissao: String;
Begin
  Inherited;
  If (DstList.Items.Count = 0) Then Exit;

  CtrlPagEletronico.sLostesSel := '';
  For x := 0 To DstList.Items.Count -1 Do
    CtrlPagEletronico.sLostesSel := CtrlPagEletronico.sLostesSel + DstList.Items[x] + ',';

  CtrlPagEletronico.sLostesSel := Copy( CtrlPagEletronico.sLostesSel,
                                        1,
                                        LengTh( CtrlPagEletronico.sLostesSel ) - 1 );
  Try
    CtrlPagEletronico.bbtnConfirmarClick( bExibeBarras,
                                          CmbModeloCnab.Text,
                                          CmbModeloCnab.LookupValue,
                                          DstList,
                                          RgEmisLote.ItemIndex,
                                          DtEmis.Text);
  Finally
    MsgDlg( CtrlPagEletronico.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );

    ExcAllBtnClick(Self);
    SrcList.Items.Clear;
    FuncaoGeral.TiraIcone;
    frmAguarde.Apaga;
    CdsDocumentos.Close;
 End;
End;

procedure TFrmPagEletronicoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iF PnlCodigodeBarras.Visible then
  begin
    PnlCodigodeBarras.Visible := False;
    bExibeBarras := True
  end
  else
    ExcAllBtnClick(Self);
end;
//************************************************
Procedure TFrmPagEletronicoMT.ChkDocClick(Sender: TObject);
Begin
  Inherited;
  CtrlPagEletronico.ChkDocClick( ChkDoc.Checked,
                                 CmbModeloCnab.LookupValue );
End;
//************************************************
Procedure TFrmPagEletronicoMT.AtualizaBarras;
Var
  Posicao: TBookMark;
Begin
  If Trim(EdtBarras.Text) <> '' Then
    If Not CtrlPagEletronico.CtrlIntBanco.ValidaCodBarrasSispag(EdtBarras.Text,11) then Exit;
  if Trim(EdtRepBarras.Text) <> '' Then
    if not CtrlPagEletronico.CtrlIntBanco.ValidaCodBarrasSispag(EdtRepBarras.Text,10) then Exit;

  if not CtrlPagEletronico.UpdateCodBarra(edtBarras.Text, edtRepBarras.Text,
                                cdsLoteDoc.FieldByName('NUMLOTE').AsString,
                                cdsLoteDoc.FieldByName('CODDOCUMENTO').AsString) then Exit;
  Posicao := cdsLoteDoc.GetBookMark;
  cdsLoteDoc.CLose;
  CtrlPagEletronico.sqlLoteDocOpen;

  if cdsLoteDoc.BookmarkValid(Posicao) then cdsLoteDoc.GotoBookMark(Posicao);
  cdsLoteDoc.FreeBookMark(Posicao);

  if not cdsLoteDoc.IsEmpty then
  begin
    if (not cdsLoteDoc.EOF) and (cdsLoteDoc.RecordCount > 1) then
      cdsLoteDoc.Next
    else
    if (not cdsLoteDoc.BOF) and (cdsLoteDoc.RecordCount > 1) then
      cdsLoteDoc.First;
  end
  else
    bExibeBarras := False;
end;

procedure TFrmPagEletronicoMT.DsLoteDocDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if PnlCodigodeBarras.Visible then
  begin
    if cdsLoteDoc.RecordCount = 0 then
    begin
      EdtBarras.Text    := '';
      EdtRepBarras.Text := '';
    end
    else
    begin
      EdtBarras.Text := cdsLoteDoc.FieldByName('CODBARRA').AsString;
      EdtRepBarras.Text := CdsLoteDoc.FieldByName('CODBARRAVALOR').AsString;
    end;
  end;
end;

procedure TFrmPagEletronicoMT.BtnIncluiBarrasClick(Sender: TObject);
begin
  inherited;
  AtualizaBarras;
end;

procedure TFrmPagEletronicoMT.CmbModeloCnabCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then MontaQueryBoletos;
  SetButtons;
end;

procedure TFrmPagEletronicoMT.RgEmisLoteClick(Sender: TObject);
begin
  inherited;
  if RgEmisLote.ItemIndex = 0 then
    DtEmis.Enabled := False
  else
    DtEmis.Enabled := True;
end;


procedure TFrmPagEletronicoMT.CdsDocumentosCalcFields(DataSet: TDataSet);
begin
  inherited;

  With DtmDadosBancarios Do
  Begin
     BuscaContaDoc(CdsDocumentos.FieldByName('CODDOCUMENTO' ).AsFloat);
     CdsDocumentos.FieldByName('CONTACORRENTE' ).AsString      := ContaBancaria.Numero;
     CdsDocumentos.FieldByName('CODBANCOFAVORECIDO' ).AsString := ContaBancaria.Banco;
     CdsDocumentos.FieldByName('NUMAGENCIA' ).AsString         := ContaBancaria.Agencia;
     CdsDocumentos.FieldByName('NOMEAGENCIA' ).AsString        := ContaBancaria.Nomeagencia;
     CdsDocumentos.FieldByName('TIPOCONTA' ).AsString          := ContaBancaria.Tipo;
  End;
end;
//************************************************
Procedure TFrmPagEletronicoMT.MontaQueryBoletos;
Begin
  DstList.Items.Clear;
  SrcList.Items.Clear;
  If ( CmbModeloCnab.Text <> '' ) Then Begin

    CtrlPagEletronico.CtrlIntBanco.IndiceDoBanco := cdsModelosCnab.FieldByName('IDMODELOSCNAB').AsInteger;
    If DstList.Items.Count <> 0 Then ExcAllBtnClick(Self);

    CtrlPageletronico.MontaQueryBoletos( bExibeBarras,
                                         CmbModeloCnab.Text,
                                         CmbModeloCnab.LookupValue,
                                         DstList,
                                         Sistema.PrefixoServidor );
    If Not cdsLotePagto.isEmpty Then Begin
      SrcList.Items.Clear;
      While Not cdsLotePagto.Eof Do Begin
        SrcList.Items.Add(cdsLotePagto.FieldByName('NUMLOTE').AsString);
        cdsLotePagto.Next;
      End;
    End;
    cdsLotePagto.First;
  End;
End;

{DF 24/08 - GUSTAVO VIEGAS
 Correção na seleção dos dados bancário referentes ao favorecido do documento:
 Passou a verificar a existência da conta bancária informado no lançamento do documento,
 caso não exista exibe a conta preferencial do favorecido;
 Otimização das Consultas;
FIM DF 24/08}

End.
