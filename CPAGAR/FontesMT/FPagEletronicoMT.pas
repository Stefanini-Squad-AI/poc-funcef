//------------------------------------------------------------------------------
// Alterações:
//-----------------------------------------------------------------------------
// Rotinas   : Data da disponibilidade
// Data      : 17/05/2007
// Autor     : Marcus Oliveira
// Pendência : 25388
// Descrição : Corrigida a Mensagens que não era pra ser enviada quando não requeria
//             a data de disponibilidade.
//------------------------------------------------------------------------------
// Rotinas   : Data da disponibilidade
// Data      : 07/05/2007
// Autor     : Marcus Oliveira
// Pendência : 25094
// Descrição : Criado o campo datadisp para lançamento no Cfinan
//------------------------------------------------------------------------------
// Rotinas   : IncludeBtnClick
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Implementar processo RAD por lote ou por documento.
{ ------------------------------------------------------------------------------
Rotina    : AtualizaBarras
Data      : 09/07/2003
Pendência : 14015
Autor     : André Pontes
Descrição : Inclusão da chamada "ChkDocClick(self)" para reabrir o Cds que exibe os documentos
---------------------------------------------------------------------------------------------------}

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
  uCtrlPagEletronico, ComCtrls, Mask;

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
    Label2: TLabel;
    wwDBGrid1: TwwDBGrid;
    DBNavigator1: TDBNavigator;
    DsLoteDoc: TwwDataSource;
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
    PageControl1: TPageControl;
    titulos: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ChkDoc: TCheckBox;
    EdtCodBarrasArrecadacao: TEdit;
    Label1: TLabel;
    pnlDataDisp: TPanel;
    lblDataDisp: TLabel;
    dtpDataDisp: TCMDateTimePicker;
    sqlParamFinanc: TCMSqlParams;
    cdsParamFinanc: TCMClientDataSet;
    EdtBarras: TMaskEdit;
    EdtRepBarras: TMaskEdit;
    edtHistFinanc: TEdit;
    lblHist: TLabel;
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

  Private
    { Private declarations }
    CtrlPagEletronico : TCtrlPagEletronico;

    bExibeBarras      : Boolean;
    Procedure AtualizaBarras;
    Procedure MontaQueryBoletos;
    procedure habilitaHistorico;
  Public
    { Public declarations }
  End;

Var
  FrmPagEletronicoMT: TFrmPagEletronicoMT;

Implementation

Uses
  DBaseDados, uModulo, fAguarde, uFuncaoGeral, uDataBase, 
  DDadosBancarios;

{$R *.DFM}
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

  //Marcus Oliveira P.25094 30/04/2007 Inicio
  sqlParamFinanc.open;
  dtpDataDisp.Enabled := (cdsParamFinanc.FieldByName('FLGINTDISPFIN').asString = 'Y');
  lblDataDisp.Enabled := dtpDataDisp.Enabled;
  //Marcus Oliveira P.25094 30/04/2007 Fim

  bExibeBarras            := True;
  DtEmis.Date             := Date;
  PnlCodigodeBarras.Align := AlClient;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30028;
    bbtnAjuda.HelpContext := 30028;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

End;

Procedure TFrmPagEletronicoMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  CdsLoteDoc.Close;
  CdsLotePagto.Close;

  CtrlPagEletronico.Free;
  Inherited;
End;

Procedure TFrmPagEletronicoMT.IncludeBtnClick(Sender: TObject);
Var
  Index: Integer;
Begin
  If ( SrcList.selected[ SrcList.ItemIndex ] ) And
     //DAVID - Pendência 17221
     ( Modulo.RadLoteLiberado( StrToInt( SrcList.Items[ SrcList.ItemIndex ] ) ) ) Then
  Begin
    Index := GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);
  End;
  habilitaHistorico;
End;

procedure TFrmPagEletronicoMT.ExcludeBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
  
  habilitaHistorico;
end;

procedure TFrmPagEletronicoMT.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
  begin
    if not Modulo.RadLoteLiberado(StrToInt(SrcList.Items[I])) then
    begin
      MontaQueryBoletos;
      Break;
    end;
    DstList.Items.AddObject(SrcList.Items[I],SrcList.Items.Objects[I]);
  end;
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
  habilitaHistorico;
end;

procedure TFrmPagEletronicoMT.ExcAllBtnClick(Sender: TObject);
var
 Index:  Integer;
begin
  if DstList.Items.Count > 0 then
    If ( DstList.selected[ DstList.ItemIndex ] ) And
       ( Modulo.RadLoteLiberado( StrToInt( DstList.Items[ DstList.ItemIndex ] ) ) ) Then Begin
      Index := GetFirstSelection(DstList);
      MoveSelected(DstList, SrcList.Items);
      SetItem(DstList, Index);
    End;
  habilitaHistorico;    
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

Procedure TFrmPagEletronicoMT.bbtnConfirmarClick(Sender: TObject);
Var
  x: Integer;

Begin
  //Marcus Oliveria P.25388 17/05/2007
  if ( dtpDataDisp.Text = '') and ( dtpDataDisp.Enabled ) then
  begin
    MsgDlg('A data de disponibilidade deve ser preenchida.', 'Aviso', mtWarning, [mbok], 0 );
    dtpDataDisp.SetFocus;
    exit;
  end
  else if ( dtpDataDisp.Text <> '') and ( dtpDataDisp.Enabled ) then
    CtrlPagEletronico.dDataDisp := dtpDataDisp.Date;

Inherited;


  If (DstList.Items.Count = 0) Then Exit;
  CtrlPagEletronico.sLostesSel := '';
  For x := 0 To DstList.Items.Count -1 Do
    CtrlPagEletronico.sLostesSel := CtrlPagEletronico.sLostesSel + DstList.Items[x] + ',';

  CtrlPagEletronico.sLostesSel := Copy( CtrlPagEletronico.sLostesSel,
                                        1,
                                        LengTh( CtrlPagEletronico.sLostesSel ) - 1 );

  CdsLoteDoc.Data := CtrlPagEletronico.GetDataPacket(
    'SELECT                                                                     '+#13+
    '  L.NUMLOTE,                                                               '+#13+
    '  D.NODOCUMENTO,                                                           '+#13+
    '  L.VALOR,                                                                 '+#13+
    '  L.CODDOCUMENTO,                                                          '+#13+
    '  L.CODBARRA,                                                              '+#13+
    '  L.CODBARRAVALOR,                                                         '+#13+
    '  LP.CODPORTFORMA                                                          '+#13+
    ' FROM                                                                      '+#13+
    '  DOCUMENTO D,                                                             '+#13+
    '  LOTEXDOCUM  L,                                                           '+#13+
    '  PORTADORFORMA P,                                                         '+#13+
    '  LOTEPAGTO LP                                                             '+#13+
    ' WHERE                                                                     '+#13+
    '  (L.NUMLOTE IN ('+ CtrlPagEletronico.sLostesSel +'))  AND                                   '+#13+
    '  (D.RECPAG = ''' + ParamIntegra.RecPag + ''' ) AND                        '+#13+
    '  (P.CODFORMAPAGTO IN (' + CtrlPagEletronico.CtrlIntBanco.CodigosBarra + ') Or P.CODARQUIVOREMESSA IN (' + CtrlPagEletronico.CtrlIntBanco.ModeloCodigoBarra + '))  AND'+#13+
    '  ((L.CODBARRA IS NULL)              AND                                   '+#13+
    '  (L.CODBARRAVALOR IS NULL))         AND                                   '+#13+
    '  (LP.NUMLOTE = L.NUMLOTE)           AND                                   '+#13+
    '  (LP.CODPORTFORMA = P.CODPORTFORMA) AND                                   '+#13+
    '  (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        '+#13+
    'ORDER BY D.NODOCUMENTO                                                     ');

  If bExibeBarras And (not CdsLoteDoc.IsEmpty) Then
  Begin
    PnlCodigodeBarras.BringToFront;
    PnlCodigodeBarras.Visible := True;
    EdtBarras.Text            := cdsLoteDoc.FieldByName('CODBARRA').AsString;
    EdtRepBarras.Text         := cdsLoteDoc.FieldByName('CODBARRAVALOR').AsString;
    EdtBarras.SetFocus;
    Exit;
  end;

  Try
    CtrlPagEletronico.bbtnConfirmarClick( bExibeBarras,
                                          CmbModeloCnab.Text,
                                          CmbModeloCnab.LookupValue,
                                          DstList,
                                          RgEmisLote.ItemIndex,
                                          DtEmis.Text, edtHistFinanc.Text);
  Finally
    MsgDlg( CtrlPagEletronico.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
    SrcList.Items.Clear;
    FuncaoGeral.TiraIcone;
    frmAguarde.Apaga;
    CdsDocumentos.Close;
    MontaQueryBoletos;
 End;
End;

procedure TFrmPagEletronicoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iF PnlCodigodeBarras.Visible then
  begin
    PnlCodigodeBarras.SendToBack;
    PnlCodigodeBarras.Visible := False;
    bExibeBarras := True
  end
  else
    ExcAllBtnClick(Self);
end;

Procedure TFrmPagEletronicoMT.ChkDocClick(Sender: TObject);
Begin
  Inherited;
  CtrlPagEletronico.ChkDocClick( ChkDoc.Checked,
                                 CmbModeloCnab.LookupValue );
End;

Procedure TFrmPagEletronicoMT.AtualizaBarras;
Var
  Posicao: TBookMark;
  sCodBarras, sCodBarrasInf : string;
Begin
//  início - andre tavares - pendência 16342 - 29/04/2004
  sCodBarras    := '';
  sCodBarrasInf := '';
  If Trim(EdtCodBarrasArrecadacao.Text) <> '' Then
    If Not CtrlPagEletronico.CtrlIntBanco.ValidaCodBarrasArrecad(EdtCodBarrasArrecadacao.Text) then
      Exit
    else
      sCodBarrasInf := trim(EdtCodBarrasArrecadacao.Text);

  If Trim(EdtBarras.Text) <> '' Then
    If Not CtrlPagEletronico.CtrlIntBanco.ValidaCodBarrasSispag(EdtBarras.Text,11) then
      Exit
    else
      sCodBarras    := edtBarras.Text;
  if Trim(EdtRepBarras.Text) <> '' Then
    if not CtrlPagEletronico.CtrlIntBanco.ValidaCodBarrasSispag(EdtRepBarras.Text,10) then
      Exit
    else
      sCodBarrasInf := edtRepBarras.Text;

  if not CtrlPagEletronico.UpdateCodBarra(sCodBarras, sCodBarrasInf,
                                cdsLoteDoc.FieldByName('NUMLOTE').AsString,
                                cdsLoteDoc.FieldByName('CODDOCUMENTO').AsString) then Exit;

//  fim - andre tavares - pendência 16342 - 29/04/2004

  Posicao := cdsLoteDoc.GetBookMark;
  cdsLoteDoc.Close;
  CtrlPagEletronico.sqlLoteDocOpen;

  if cdsLoteDoc.BookmarkValid(Posicao) then cdsLoteDoc.GotoBookMark(Posicao);
  cdsLoteDoc.FreeBookMark(Posicao);

   // Andre Pontes - 09/07/2003 - Pendência 14015
   ChkDocClick(self);
   // FIM Andre Pontes - 09/07/2003 - Pendência 14015

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

procedure TFrmPagEletronicoMT.DsLoteDocDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if PnlCodigodeBarras.Visible then
  begin
    if cdsLoteDoc.RecordCount = 0 then
    begin
      EdtBarras.Text    := '';
      EdtRepBarras.Text := '';
      EdtCodBarrasArrecadacao.text := '';
    end
    else
    begin
      EdtBarras.Text := cdsLoteDoc.FieldByName('CODBARRA').AsString;
      EdtRepBarras.Text := CdsLoteDoc.FieldByName('CODBARRAVALOR').AsString;
      EdtCodBarrasArrecadacao.text := CdsLoteDoc.FieldByName('CODBARRAVALOR').AsString;
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

//pendência 22823 - 19/11/2007
procedure TFrmPagEletronicoMT.habilitaHistorico;
begin
  if DstList.Items.Count > 1 then
  begin
    lblHist.Enabled := true;
    edtHistFinanc.Enabled := true;
  end
  else
  begin
    lblHist.Enabled := false;
    edtHistFinanc.Enabled := false;
  end
end;

End.
