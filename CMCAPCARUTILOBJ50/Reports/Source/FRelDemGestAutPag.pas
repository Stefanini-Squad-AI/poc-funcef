{ --------------------------------------------------------------------------------------------------
Data      : 27/04/2007
Autor     : Antonio Marcos (amf)
Pendencia : 25220
Descrição : Corrigido o erro. Os tipos de dados dos parâmetros(0, 1 e 2) do componente de relatório estavam
            diferente do tipo esperado na passagem dos parâmetros. tipo string e integer.
---------------------------------------------------------------------------------------------------
Data      : 18/09/2006
Autor     : Antonio Marcos (amf)
Pendencia : 21309
Descrição : Acrescentei a referência/processo, o valor e DISPONIBILIZEI a consulta
            ao solicitante / beneficiário para este relatório.
---------------------------------------------------------------------------------------------------}
// Daniel Simões Braga - P: 15389 em 11/01/2006 e 15402 em 13/01/2006 ----------
// Adicionei o campo CODEXTERNO da tabela CENTRESPON na query para ser exibido
// no componente TreeCRespon.
// OBS.: A pendência de número 15402 já está concluida devido ao fato de o
//       relatório usar o mesmo formulário do relatório de "Demonstrativo de
//       Gestão de Pagamento".
Unit FRelDemGestAutPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Db, DBTables, Wwquery,
  fcTreeView, Mask, CMProcuraSubTipo, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls, fParamReports_Padrao, DBClient,
  uCMClientDataSet, uCmSqlParams, CmParamReport, uCtrlParamIntegra,
  dxEdLib, dxCntner, dxEditor, dxExEdtr;

Type
   TItem = record
      CodExterno      : String;
      CodCentrorespon : String;
      NomeCentRespon  : String;
      FlgAnaSint      : String;
   end;

   pItem = ^TItem;

  TFrmRelDemGestAutPag = Class(TfrmParamReports_Padrao)
    lblCentroRespon: TLabel;
    RgStatus: TRadioGroup;
    GroupBox1: TGroupBox;
    DtIni: TCMDateTimePicker;
    DtFin: TCMDateTimePicker;
    Rgdata: TRadioGroup;
    TreeCRespon: TfcTreeView;
    ImlTreeView: TImageList;
    gpbCamposOrder: TGroupBox;
    TreeOrdem: TfcTreeView;
    BtnOrdemUp: TSpeedButton;
    BtnOrdemDown: TSpeedButton;
    RgSitDoc: TRadioGroup;
    CmpForCli: TCMProcuraForCli;
    cbMostraCPMF: TCheckBox;
    Bevel1: TBevel;
    SqlCentroRespon: TCMSqlParams;
    CdsCentroRespon: TCMClientDataSet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cValor: TdxCurrencyEdit;
    Label2: TLabel;
    edProcesso: TdxEdit;
    CdsPeriodo: TCMClientDataSet;
    SqlPeriodo: TCMSqlParams;
    Procedure FormCreate(Sender: TObject);
    Procedure TreeCResponEditing(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Var AllowEdit: Boolean);
    Procedure TreeCResponToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    Procedure BtnOrdemUpClick(Sender: TObject);
    Procedure BtnOrdemDownClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //Iferreira
    ItemNo       : pItem;
    No           : TfcTreeNode;
    ListItem     : TList;

    sListaDescricao: String;
        sCamposOrderDefault :String;
    Procedure MontaArvore;
    Function BuscaCentRespon: String;

    //Iferreira
    function  InserePasta(bEumaPasta:
              Boolean;  Arvore: TfcTreeView; NoDestino: TfcTreeNode; pDesc: pItem): TfcTreeNode;
    procedure InserePapel(Arvore: TfcTreeView; NoDestino: TfcTreeNode; pDesc: pItem);

  public
    { Public declarations }

  End;

Var
  FrmRelDemGestAutPag: TFrmRelDemGestAutPag;

Implementation

Uses uSistema, uDataBase, uString, uMensErro, uModulo;

{$R *.DFM}

Procedure TFrmRelDemGestAutPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  With SqlCentroRespon Do
  Begin
    Prepare;
    Params[0].AsFloat := Sistema.idEmpresa;
    Open;
  End;
  //Iferreira
  ListItem := TList.Create;
  MontaArvore;

  SqlPeriodo.Open;
  if not CdsPeriodo.IsEmpty then
  begin
    DtIni.Date := CdsPeriodo.FieldByName('DATAINI').AsDateTime;
    DtFin.Date := CdsPeriodo.FieldByName('DATAFIM').AsDateTime;
  end;

End;

Procedure TFrmRelDemGestAutPag.MontaArvore;
Var
  NoPai, NoFilho: TfcTreeNode;
  iTamPai, itamNo: ShortInt;
  sDescFormat: String;
  bNaoTemSintetico: Boolean;

  sCodPaiGrup : string;
Begin
  TreeCRespon.Items.Clear;
  ListItem.Clear;
  CdsCentroRespon.First;
// DANIEL SIMÕES - P: 15389 - 11/01/2006
// Início.......................................................................
  iTamPai := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
  itamNo := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);

  NoPai := Nil;
  NoFilho := Nil;
  bNaoTemSintetico := True;

  No := TreeCRespon.Items.GetFirstNode;

  sCodPaiGrup := CdsCentroRespon.FieldByName('CODEXTERNO').AsString;
  //Iferreira inicio
  while Not CdsCentroRespon.Eof Do
  begin
    new(ItemNo);
    ItemNo^.CodExterno      := CdsCentroRespon.FieldByName('IDPLANCRESPON').AsString+CdsCentroRespon.FieldByName('CODEXTERNO').AsString;
    ItemNo^.CodCentrorespon := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    ItemNo^.NomeCentRespon  := FormatMaskText(ParamIntegra.MascaraCr + ';0; ', CdsCentroRespon.FieldByName('CODEXTERNO').AsString) + ' - ' +
                              CdsCentroRespon.FieldByName('NOME').AsString;
    ItemNo^.FlgAnaSint      := CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString;


    if (No <> nil) then
    begin
      while pItem(No.Data)^.CodExterno <> Copy(CdsCentroRespon.FieldByName('IDPLANCRESPON').AsString+CdsCentroRespon.FieldByName('CODEXTERNO').AsString,1,Length(pItem(No.Data)^.CodExterno)) do
      begin
         if sCodPaiGrup = Copy(CdsCentroRespon.FieldByName('CODEXTERNO').AsString,1,Length(sCodPaiGrup)) then
            No := No.Parent
         else
         begin
            sCodPaiGrup := CdsCentroRespon.FieldByName('CODEXTERNO').AsString;
            No          := nil;
            Break;
         end;
      end;
    end;

    if ItemNo^.FlgAnaSint = 'S' then
    begin
      No := InserePasta(False, TreeCRespon,No,ItemNo);
    end
    else
      InserePapel(TreeCRespon,No,ItemNo);

    CdsCentroRespon.Next;
    ListItem.Add(ItemNo);
   end;
   //Iferreira Fim
  {While Not CdsCentroRespon.Eof Do
  Begin

    sDescFormat := FormatMaskText(ParamIntegra.MascaraCr + ';0; ', CdsCentroRespon.FieldByName('CODEXTERNO').AsString) + ' - ' +
      CdsCentroRespon.FieldByName('NOME').AsString;

    If CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString = 'S' Then
    Begin
      bNaoTemSintetico := False;
      If iTamPai > length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) Then
      Begin
        While (NoFilho.Parent <> Nil) And (length(Trim(NoFilho.StringData)) >
          length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString))) Do
          NoFilho := NoFilho.Parent;

        If (NoFilho = Nil) Or (NoFilho.Parent = Nil) Then
          NoPai := TreeCRespon.Items.Add(Nil, sDescFormat)
        Else
          NoPai := TreeCRespon.Items.AddChild(NoFilho, sDescFormat)

      End
      Else If iTamPai < length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) Then
        NoPai := TreeCRespon.Items.AddChild(NoPai, sDescFormat)
      Else
        NoPai := TreeCRespon.Items.Add(Nil, sDescFormat);

      With NoPai Do
      Begin
        StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
        StringData2 := 'S';
        CheckboxType := tvctCheckBox;
        ImageIndex := 0;
        selectedIndex := 0;
        StateIndex := 1;
      End;

      iTamPai := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
    End
    Else
    Begin
      If Not bNaoTemSintetico Then
      Begin

        If (itamNo > length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) And
          (NoPai.Parent <> Nil) Then
          NoPai := NoPai.Parent;

        While (NoPai.Parent <> Nil) And
          (itamNo < Length(NoPai.Parent.Stringdata)) Do
          NoPai := NoPai.Parent;

        NoFilho := TreeCRespon.Items.AddChild(NoPai, sDescFormat);
        With Nofilho Do
        Begin
          StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
          StringData2 := 'A';
          CheckboxType := tvctCheckBox;
          ImageIndex := 2;
          selectedIndex := 2;
          StateIndex := 2;
        End;
      End
      Else
      Begin
        NoFilho := TreeCRespon.Items.AddChild(Nil, sDescFormat);
        With Nofilho Do
        Begin
          StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
          StringData2 := 'A';
          CheckboxType := tvctCheckBox;
          ImageIndex := 2;
          selectedIndex := 2;
          StateIndex := 2;
        End;
      End;
    End;
    itamNo := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
    CdsCentroRespon.Next;
  End; }
// DANIEL SIMÕES - P: 15389 - 11/01/2006
// Fim..........................................................................
End;

Procedure TFrmRelDemGestAutPag.TreeCResponEditing(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; Var AllowEdit: Boolean);
Begin
  Inherited;
  AllowEdit := False;
End;

Procedure TFrmRelDemGestAutPag.TreeCResponToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
Var
  No: tfcTreeNode;
Begin
  Inherited;
  If Node.ImageIndex = 0 Then
  Begin
    No := Node.getfirstchild;
    While No <> Nil Do
    Begin
      No.Checked := Node.Checked;
      No := Node.GetNextChild(No);
    End;
  End;
End;

Procedure TFrmRelDemGestAutPag.BtnOrdemUpClick(Sender: TObject);
Begin
  Inherited;
  If (TreeOrdem.Selected <> Nil) And
    (TreeOrdem.Selected.AbsoluteIndex > 0) Then
    TreeOrdem.Selected.MoveTo(TreeOrdem.Selected.GetPrev, fcnaInsert);
End;

Procedure TFrmRelDemGestAutPag.BtnOrdemDownClick(Sender: TObject);
Begin
  Inherited;
  If (TreeOrdem.Selected <> Nil) And
    (TreeOrdem.Selected.AbsoluteIndex < (TreeOrdem.Items.Count - 1)) Then
    TreeOrdem.Selected.MoveTo(TreeOrdem.Selected.GetNext, fcnaInsertAfter);
End;

Function TFrmRelDemGestAutPag.BuscaCentRespon: String;
Var
  X: Integer;
Begin
  Result := '';
  sListaDescricao := '';
  For X := 0 To TreeCRespon.Items.Count - 1 Do
    If (TreeCRespon.Items[x].StringData2 = 'A') And
      (TreeCRespon.Items[x].Checked) Then
    Begin
      If sListaDescricao = '' Then
        sListaDescricao := Copy(TreeCRespon.Items[x].Text, Pos('-', TreeCRespon.Items[x].Text) + 1, Length(Trim(TreeCRespon.Items[x].Text)))
      Else
        sListaDescricao := sListaDescricao + ' / ' + Copy(TreeCRespon.Items[x].Text, Pos('-', TreeCRespon.Items[x].Text) + 1,
          Length(Trim(TreeCRespon.Items[x].Text)));

      //Iferreira
      ItemNo := ListItem.Items[x];
      Result := Result + '''' + ItemNo^.CodCentrorespon + ''',';
      //Result := Result + '''' + Espaco(TreeCRespon.Items[x].StringData, 10) + ''',';
    End;

  If Result <> '' Then
    Result := Copy(Result, 1, Length(Result) - 1);
End;

Procedure TFrmRelDemGestAutPag.FormShow(Sender: TObject);
Var
  sSelect: String;
Begin
  Inherited;
 Case Tag of
     1:
     Begin
        TreeOrdem.Items.Delete(TreeOrdem.Items[2]);
        gpbCamposOrder.Caption := ' Ordena pelo favorecido + ';
        Height := 519;
     End;
     0:
     Begin
        TreeOrdem.Items.Delete(TreeOrdem.Items[0]);
        gpbCamposOrder.Caption := ' Ordena pela Data de Inclusão + ';
        CmpForCli.top := 335;
        Height := 470;
     End;
 end;
End;

procedure TFrmRelDemGestAutPag.bbtnConfirmarClick(Sender: TObject);
var x : integer;
ScamposOrder : String;
sListaCentroRespon : STRING;
begin
  inherited;

  sListaCentroRespon := BuscaCentRespon;

  sCamposOrder := sCamposOrderDefault;



  For X:=0 To 2 Do
  Begin
    If TreeOrdem.Items[x].StringData = 'DATA' Then
    begin
      if trim(sCamposOrder) <> '' then sCamposOrder := sCamposOrder + ', ';
      sCamposOrder := sCamposOrder + ' TRGDTINCLUSAO';
    end
    Else
    begin
       if trim(sCamposOrder) <> '' then sCamposOrder := sCamposOrder + ', ';
       sCamposOrder := sCamposOrder + TreeOrdem.Items[x].StringData;
    end;
  End;

  Cmp_Padrao.ParamValues[0].AsInteger :=  rgdata.ItemIndex;
  Cmp_Padrao.ParamValues[1].AsInteger :=  RgSitDoc.ItemIndex;
  Cmp_Padrao.ParamValues[2].AsInteger :=  RgStatus.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsString  :=  DtIni.Text;
  Cmp_Padrao.ParamValues[4].AsString  :=  DtFin.Text;
  Cmp_Padrao.ParamValues[5].AsString  :=  RgSitDoc.Items.Strings[RgSitDoc.itemIndex];
  Cmp_Padrao.ParamValues[6].AsString  :=  sListaDescricao;
  Cmp_Padrao.ParamValues[7].AsString  :=  IntToStr(modulo.CodDocCPMF);
  Cmp_Padrao.ParamValues[8].AsString  :=  sCamposOrder;
  Cmp_Padrao.ParamValues[9].AsBoolean :=  cbMostraCPMF.Checked ;
  Cmp_Padrao.ParamValues[10].AsString  := sListaCentroRespon;
  If (Trim(CmpForCli.Text) <> '') Then
    Cmp_Padrao.ParamValues[11].AsString  := FloatToStr(CmpForCli.ForCliReg.Id)
  else
    Cmp_Padrao.ParamValues[11].AsString  := '';

  //amf 15.09.2006 21309
  Cmp_Padrao.ParamValues[12].AsString  := edProcesso.Text;
  Cmp_Padrao.ParamValues[13].AsFloat  := cValor.Value;

end;

procedure TFrmRelDemGestAutPag.InserePapel(Arvore: TfcTreeView;
  NoDestino: TfcTreeNode; pDesc: pItem);
var
  No: TfcTreeNode;
begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentRespon,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;

  with No do
  begin
    StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    StringData2 := 'A';
    CheckboxType := tvctCheckBox;
    ImageIndex := 2;
    selectedIndex := 2;
    StateIndex := 2;
  end;
end;

function TFrmRelDemGestAutPag.InserePasta(bEumaPasta: Boolean;
  Arvore: TfcTreeView; NoDestino: TfcTreeNode; pDesc: pItem): TfcTreeNode;
var
  No: TfcTreeNode;
begin
  if bEumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.NomeCentRespon,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentRespon,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;

  with No do
  begin
    StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    StringData2 := 'S';
    CheckboxType := tvctCheckBox;
    ImageIndex := 0;
    selectedIndex := 0;
    StateIndex := 1;
  end;

  Result := No;
end;

procedure TFrmRelDemGestAutPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListItem.Free;
end;

End.

