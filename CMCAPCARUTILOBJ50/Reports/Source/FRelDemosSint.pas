unit FRelDemosSint;
{ --------------------------------------------------------------------------------------------------
Data      : 03/04/2008
Autor     : Igor Ferreira (Iferreira)
Pendencia : 27617
Descrição : Corrigindo o método MontaArvore.
---------------------------------------------------------------------------------------------------}

// Daniel Simões Braga - P: 15396 - 12/01/2006
// Adicionei o campo CODEXTERNO da tabela CENTRESPON na query SqlCentroRespon
// para ser exibido no componente TreeCRespon.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Db, DBTables, fcTreeView, Mask,UMensErro,
  CMProcuraSubTipo, ImgList, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  fParamReports_Padrao, CmParamReport, uCmSqlParams, DBClient, uCtrlParamIntegra,
  uCMClientDataSet, {$IFDEF VER0505}uComum, {$ELSE}uCMTypes{$ENDIF}, uCtrlParamCap;

type
  // 27617 - Iferreira 03/04/2008 Inicio
  TItem = record
     CodExterno     : String;
     NomeCentRespon : String;
     FlgAnaSint     : String;
  end;

  pItem = ^TItem;
  // 27617 - Iferreira 03/04/2008 Fim

  TFrmRelDemosSint = class(TfrmParamReports_Padrao)
    lblCentroRespon: TLabel;
    RgStatus: TRadioGroup;
    GroupBox1: TGroupBox;
    DtIni: TCMDateTimePicker;
    DtFin: TCMDateTimePicker;
    Rgdata: TRadioGroup;
    TreeCRespon: TfcTreeView;
    ImlTreeView: TImageList;
    RgSitDoc: TRadioGroup;
    cbMostraCPMF: TCheckBox;
    Bevel1: TBevel;
    CdsCentroRespon: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    CdsParam: TCMClientDataSet;
    cdsPlancentResp: TCMClientDataSet;
    sqlPlancentResp: TCMSqlParams;
    Label1: TLabel;
    dblkPlancentRespon: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure TreeCResponEditing(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var AllowEdit: Boolean);
    procedure TreeCResponToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure dblkPlancentResponExit(Sender: TObject);
    procedure dblkPlancentResponChange(Sender: TObject);
    procedure dblkPlancentResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sListaDescricao: string;
    sListaCentroRespon: string;
    CtrlParamCap: TCtrlParamCap;
    procedure MontaArvore;
    function BuscaCentRespon: string;

    // 27617 - Iferreira 03/04/2008 Inicio
    function  InserePasta(bEumaPasta:
              Boolean;  Arvore: TfcTreeView; NoDestino: TfcTreeNode; pDesc: pItem): TfcTreeNode;
    procedure InserePapel(Arvore: TfcTreeView; NoDestino: TfcTreeNode; pDesc: pItem);
    // 27617 - Iferreira 03/04/2008 Fim

    //David Ayrolla - Pendência 27617 - 04/06/2008
    procedure planCentResp;

  public
    { Public declarations }
  end;

var
  FrmRelDemosSint: TFrmRelDemosSint;

implementation

uses uSistema, DBaseDados, uString;

{$R *.DFM}

procedure TFrmRelDemosSint.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamCap := TCtrlParamCap.Create;
  CtrlParamCap.Initialize(DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CdsParam.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.idempresa);

  //David Ayrolla - Pendência 27617 - 04/06/2008
  sqlPlancentResp.Open;

  if ParamIntegra.PlanoCentroRespon > 0 then
  begin
    dblkPlancentRespon.LookupValue := IntToStr( ParamIntegra.PlanoCentroRespon );
    cdsPlancentResp.Locate( 'IDPLANCRESPON', ParamIntegra.PlanoCentroRespon, [] );
    dblkPlancentRespon.Text := cdsPlancentResp.FieldByName('DESCPLANCRESPON').AsString;
  end;
end;

procedure TFrmRelDemosSint.bbtnConfirmarClick(Sender: TObject);
begin
  // Verificar se a data foi informada.
  if (DtIni.Text = '')then
  begin
    MsgDlg('Período inicial não informado.','Erro',mtError,[mbOk],0);
    DtIni.SetFocus;
    exit;
  end;
  if (DtFin.Text = '') then
  begin
    MsgDlg('Período final não informado.','Erro',mtError,[mbOk],0);
    DtFin.SetFocus;
    exit;
  end;


  inherited;
  sListaCentroRespon := BuscaCentRespon;
  Cmp_Padrao.ParamValues[0].AsString := sListaCentroRespon;
  Cmp_Padrao.ParamValues[1].AsBoolean := cbMostraCPMF.Checked;
  Cmp_Padrao.ParamValues[2].AsString := IntToStr(Rgdata.ItemIndex);
  Cmp_Padrao.ParamValues[3].AsString := IntToStr(RgSitDoc.ItemIndex);
  Cmp_Padrao.ParamValues[4].AsString := IntToStr(RgStatus.itemindex);
  Cmp_Padrao.ParamValues[5].AsString := DtIni.text;
  Cmp_Padrao.ParamValues[6].AsString := DtFin.text;
  Cmp_Padrao.ParamValues[7].AsString := sListaDescricao;
  Cmp_Padrao.ParamValues[8].AsString := RgSitDoc.Items[RgSitDoc.ItemIndex];
  Cmp_Padrao.ParamValues[9].AsString := inttostr(CdsParam.FieldByName('CODTIPDOCCPMF').AsInteger);

  ModalResult := mrOk;
//  confirmar a impressao
end;

procedure TFrmRelDemosSint.MontaArvore;
var
  NoPai, NoFilho: TfcTreeNode;
  iTamPai, itamNo: ShortInt;
  sDescFormat: string;
  bNaoTemSintetico: Boolean;

  ItemNo      : pItem;
  No          : TfcTreeNode;
  sCodPaiGrup : string;
begin
  TreeCRespon.Items.Clear;
  CdsCentroRespon.First;
// DANIEL SIMÕES - P: 15396 - 13/01/2006
// Início.......................................................................
  iTamPai := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
  itamNo := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);

  NoPai := nil;
  NoFilho := nil;
  bNaoTemSintetico := True;

  // 27617 - Iferreira 03/04/2008 Inicio
  No := TreeCRespon.Items.GetFirstNode;

  sCodPaiGrup := CdsCentroRespon.FieldByName('CODEXTERNO').AsString;
  while Not CdsCentroRespon.Eof Do
  begin
    new(ItemNo);
    ItemNo.CodExterno     := CdsCentroRespon.FieldByName('IDPLANCRESPON').AsString+CdsCentroRespon.FieldByName('CODEXTERNO').AsString;
    ItemNo.NomeCentRespon := FormatMaskText(ParamIntegra.MascaraCr + ';0; ', CdsCentroRespon.FieldByName('CODEXTERNO').AsString) + ' - ' +
                             CdsCentroRespon.FieldByName('NOME').AsString;
    ItemNo.FlgAnaSint     := CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString;


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
         end;

         //David Ayrolla - 04/06/2008
         if No = nil then Break;

      end;
    end;

    if ItemNo.FlgAnaSint = 'S' then
    begin
      No := InserePasta(False, TreeCRespon,No,ItemNo);
    end
    else
      InserePapel(TreeCRespon,No,ItemNo);
      CdsCentroRespon.Next;
   end;

   TreeCRespon.Refresh;

  // 27617 - Iferreira 03/04/2008 Fim
  (*while not CdsCentroRespon.Eof do
  begin
    sDescFormat := FormatMaskText(ParamIntegra.MascaraCr + ';0; ', CdsCentroRespon.FieldByName('CODEXTERNO').AsString) + ' - ' +
      CdsCentroRespon.FieldByName('NOME').AsString;
    if CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString = 'S' then
    begin
      bNaoTemSintetico := False;
      if iTamPai > length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) then
      begin
        while (NoFilho.Parent <> nil)
          and (length(Trim(NoFilho.StringData)) > length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString))) do
          NoFilho := NoFilho.Parent;
        if (NoFilho = nil) or (NoFilho.Parent = nil) then
          NoPai := TreeCRespon.Items.Add(nil, sDescFormat)
        else
          NoPai := TreeCRespon.Items.AddChild(NoFilho, sDescFormat)
      end
      else if iTamPai < length(Trim(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) then
        NoPai := TreeCRespon.Items.AddChild(NoPai, sDescFormat)
      else
        NoPai := TreeCRespon.Items.Add(nil, sDescFormat);

      with NoPai do
      begin
        StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
        StringData2 := 'S';
        CheckboxType := tvctCheckBox;
        ImageIndex := 0;
        selectedIndex := 0;
        StateIndex := 1;
      end;
      iTamPai := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
    end
    else
    begin
      if not bNaoTemSintetico then
      begin
        if (itamNo > length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString)) and
          (NoPai.Parent <> nil) then
          NoPai := NoPai.Parent;
        while (NoPai.Parent <> nil) and
          (itamNo < Length(NoPai.Parent.Stringdata)) do
          NoPai := NoPai.Parent;
        NoFilho := TreeCRespon.Items.AddChild(NoPai, sDescFormat);
        with Nofilho do
        begin
          StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
          StringData2 := 'A';
          CheckboxType := tvctCheckBox;
          ImageIndex := 2;
          selectedIndex := 2;
          StateIndex := 2;
        end;
      end
      else
      begin
        NoFilho := TreeCRespon.Items.AddChild(nil, sDescFormat);
        with Nofilho do
        begin
          StringData := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
          StringData2 := 'A';
          CheckboxType := tvctCheckBox;
          ImageIndex := 2;
          selectedIndex := 2;
          StateIndex := 2;
        end;
      end;
    end;
    itamNo := length(CdsCentroRespon.FieldByName('CODEXTERNO').AsString);
    CdsCentroRespon.Next;
  end;
// DANIEL SIMÕES - P: 15396 - 13/01/2006
// Fim.......................................................................... *)
end;

procedure TFrmRelDemosSint.TreeCResponEditing(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False;
end;

procedure TFrmRelDemosSint.TreeCResponToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
var
  No: tfcTreeNode;
begin
  inherited;
  if Node.ImageIndex = 0 then
  begin
    No := Node.getfirstchild;
    while No <> nil do
    begin
      No.Checked := Node.Checked;
      No := Node.GetNextChild(No);
    end;
  end;
end;

function TFrmRelDemosSint.BuscaCentRespon: string;
var
  X: Integer;
begin
  Result := '';
  sListaDescricao := '';
  for X := 0 to TreeCRespon.Items.Count - 1 do
    if (TreeCRespon.Items[x].StringData2 = 'A') and
      (TreeCRespon.Items[x].Checked) then
    begin
      if sListaDescricao = '' then
        sListaDescricao := Copy(TreeCRespon.Items[x].Text, Pos('-', TreeCRespon.Items[x].Text) + 1, Length(Trim(TreeCRespon.Items[x].Text)))
      else
        sListaDescricao := sListaDescricao + ' / ' + Copy(TreeCRespon.Items[x].Text, Pos('-', TreeCRespon.Items[x].Text) + 1,
          Length(Trim(TreeCRespon.Items[x].Text)));

      Result := Result + '''' + Espaco(TreeCRespon.Items[x].StringData, 10) + ''',';
    end;

  if Result <> '' then
    Result := Copy(Result, 1, Length(Result) - 1);
end;

procedure TFrmRelDemosSint.InserePapel(Arvore: TfcTreeView;
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

function TFrmRelDemosSint.InserePasta(bEumaPasta: Boolean;
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

procedure TFrmRelDemosSint.dblkPlancentResponExit(Sender: TObject);
begin
  inherited;
  if dblkPlancentRespon.LookupValue <> '' then
  begin
    cdsPlancentResp.Locate( 'IDPLANCRESPON', StrToInt( dblkPlancentRespon.LookupValue ), [] );
    dblkPlancentRespon.Text := cdsPlancentResp.FieldByName('DESCPLANCRESPON').AsString;
  end;
end;

procedure TFrmRelDemosSint.planCentResp;
begin
  SqlCentroRespon.Prepare;
  SqlCentroRespon.Params[0].AsFloat  := Sistema.idEmpresa;
  SqlCentroRespon.Params[1].AsString := dblkPlancentRespon.LookupValue;
  SqlCentroRespon.Open;
  MontaArvore;
end;

procedure TFrmRelDemosSint.dblkPlancentResponChange(Sender: TObject);
begin
  inherited;
  planCentResp;
end;

procedure TFrmRelDemosSint.dblkPlancentResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  planCentResp;
end;

end.

