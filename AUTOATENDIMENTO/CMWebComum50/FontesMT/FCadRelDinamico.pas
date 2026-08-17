unit FCadRelDinamico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, uCmTypes, dBaseDados, uSistema, ComCtrls, FTelaAut,
  uCtrlRelDinamico, uCtrlRelDinamicoXInput, uCtrlInputSimulaBenef,
  fCadInputRelDinamico, uCtrlReports;

type
  TItens = array of Integer;

  TfrmCadRelDinamico = class(TFrmCadastroMT)
    CdsIDRELDINAMICO: TFloatField;
    CdsFLGATIVO: TFloatField;
    CdsQUERYINICIAL: TBlobField;
    lblIdRelDinamico: TLabel;
    dbedtIdRelDinamico: TDBEdit;
    dbchkFLGATIVO: TDBCheckBox;
    msInput: TMontaSelect;
    cdsRelDinamicoXInput: TCMClientDataSet;
    cdsRelDinamicoXInputIDRELDINAMICO: TFloatField;
    cdsRelDinamicoXInputIDINPUT: TFloatField;
    cdsRelDinamicoXInputORDEM: TFloatField;
    dbchkFLGROLLBACK: TDBCheckBox;
    CdsFLGROLLBACK: TFloatField;
    msReport: TMontaSelect;
    CdsFLGTIPODEMONSTRA: TStringField;
    CdsHTMLDEMONSTRA: TStringField;
    CdsIDREPORTS: TFloatField;
    dlgHTMLFile: TOpenDialog;
    CdsORIGEMCM: TFloatField;
    CdsDESCRELDINAMICO: TStringField;
    lblDESCRELDINAMICO: TLabel;
    dbedtDESCRELDINAMICO: TDBEdit;
    PageControl: TPageControl;
    tbsQuery: TTabSheet;
    lblObs: TLabel;
    dbmemQUERYINICIAL: TDBMemo;
    tbsCampos: TTabSheet;
    lbCampos: TListBox;
    Panel1: TPanel;
    spbCamposPlus: TSpeedButton;
    spbCamposMinus: TSpeedButton;
    Panel2: TPanel;
    spbCamposUp: TSpeedButton;
    spbCamposDown: TSpeedButton;
    tbsDemonstrativo: TTabSheet;
    pnlHTML: TPanel;
    lblHTMLFile: TLabel;
    btnHTMLFile: TSpeedButton;
    dbedtHTMLFile: TDBEdit;
    pnlGerador: TPanel;
    lblReport: TLabel;
    btnReport: TSpeedButton;
    edtReport: TEdit;
    rgrpFlgReportType: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure spbCamposUpClick(Sender: TObject);
    procedure lbCamposDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbCamposDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure spbCamposPlusClick(Sender: TObject);
    procedure spbCamposMinusClick(Sender: TObject);
    procedure spbCamposDownClick(Sender: TObject);
    procedure lbResultadosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbResultadosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbCamposDblClick(Sender: TObject);
    procedure rgrpFlgReportTypeClick(Sender: TObject);
    procedure btnHTMLFileClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    RelDinamico        : TCtrlRelDinamico;
    RelDinamicoXInput  : TCtrlRelDinamicoXInput;
    InputRelDinamico   : TCtrlInputSimulaBenef;
    Reports            : TCtrlReports;

    aIdInput  : TItens;
    aIdResult : TItens;

    procedure MsgErro ( sMsg : String );
    procedure TrocaItem( var aArray : TItens; lLista : TListBox; a, b : integer );
    procedure MoveItem( var aArray : TItens; lLista : TListBox; iPosAtual, iPosNova : integer );
    procedure CarregaInputs;
    function  Ordem( aArray : TItens; iItem : integer ) : integer;
    procedure Reset;
    procedure Up( var aArray : TItens; lLista : TListBox );
    procedure Down( var aArray : TItens; lLista : TListBox );
    procedure Plus( MontaSel : TMontaSelect; var aArray : TItens; lLista : TListBox );
    procedure Minus( var aArray : TItens; lLista : TListBox );
    procedure lDragDrop( var aArray : TItens; Sender, Source: TObject; X, Y: Integer );
    function  Salva : boolean;
    function  Apaga : boolean;
    procedure Consulta( iId : integer; sBeneficio : string );
  public
    procedure SelecionaOrigemDemonstra;
    function NomeReport( iIdReport, iOrigemCM : integer ) : string;
  end;

var
  frmCadRelDinamico: TfrmCadRelDinamico;

implementation

{$R *.DFM}

procedure TfrmCadRelDinamico.FormCreate(Sender: TObject);
begin
  inherited;
  RelDinamico := TCtrlRelDinamico.Create;
  RelDinamico.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          MsgErro );
  RelDinamico.CdsRelDinamico := Cds;

  RelDinamicoXInput := TCtrlRelDinamicoXInput.Create;
  RelDinamicoXInput.InitializeAs( RelDinamico );
  RelDinamicoXInput.cdsRelDinamicoXInput := cdsRelDinamicoXInput;

  InputRelDinamico := TCtrlInputSimulaBenef.Create;
  InputRelDinamico.InitializeAs( RelDinamico );

  Reports := TCtrlReports.Create;
  Reports.InitializeAs( RelDinamico );

  Reset;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

function TfrmCadRelDinamico.Salva: boolean;
var
  iIdRelDinamico : integer;
  i, iMax : integer;
begin
  Result := False;

  if not ( cds.State in [dsInsert, dsEdit] ) then
    Cds.Edit;

  if rgrpFlgReportType.ItemIndex = 1 then
  begin
    CdsFLGTIPODEMONSTRA.AsString := 'H';
    if trim( CdsHTMLDEMONSTRA.AsString ) = '' then
    begin
      ShowMessage( 'O arquivo HTML deve ser selecionado.' );
      PageControl.ActivePage := tbsDemonstrativo;
      dbedtHTMLFile.SetFocus;
      exit;
    end;
  end
  else
    if rgrpFlgReportType.ItemIndex = 2 then
    begin
      CdsFLGTIPODEMONSTRA.AsString := 'G';
      if CdsIDREPORTS.AsInteger <= 0 then
      begin
        ShowMessage( 'O trmplate deve ser selecionado.' );
        PageControl.ActivePage := tbsDemonstrativo;
        edtReport.SetFocus;
        exit;
      end;
    end
    else
      CdsFLGTIPODEMONSTRA.AsString := '';

  Cds.Post;

  if trim( cds.FieldByName('QUERYINICIAL').AsString ) = '' then
  begin
    ShowMessage( 'A query inicial deve ser informada.' );
    PageControl.ActivePage := tbsQuery;
    dbmemQUERYINICIAL.SetFocus;
    exit;
  end;

  //Se o relatório é ativo, testa se já há um relatório ativo
  //para este benefício, e gera um erro em caso afirmativo
  if   ( cds.FieldByName('FLGATIVO').AsInteger = 1 )
   and ( RelDinamico.ExisteRelDinamicoAtivo(
   cds.FieldByName('IDRELDINAMICO').AsInteger ) )then
  begin
    ShowMessage( 'Já existe uma simulação ativa para este benefício.' );
    exit;
  end;

  Result := RelDinamico.GravaRelDinamico( iIdRelDinamico );

  if Result then
  begin
    cdsRelDinamicoXInput.First;
    while not cdsRelDinamicoXInput.Eof do
      cdsRelDinamicoXInput.Delete;

    iMax := lbCampos.Items.Count - 1;

    for i := 0 to iMax do
    begin
      cdsRelDinamicoXInput.Insert;
      cdsRelDinamicoXInput.FieldByName('IDINPUT').AsInteger       := aIdInput[i];
      cdsRelDinamicoXInput.FieldByName('IDRELDINAMICO').AsInteger := iIdRelDinamico;
      cdsRelDinamicoXInput.FieldByName('ORDEM').AsInteger         := i + 1;
      cdsRelDinamicoXInput.Post;
    end;

    Result := RelDinamicoXInput.GravaRelDinamicoXInput;
  end;

end;

procedure TfrmCadRelDinamico.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Consulta( StrToInt( MontaSelect.ValoresChave[0] ), MontaSelect.ValoresChave[1] );
end;

procedure TfrmCadRelDinamico.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Reset;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.FormDestroy(Sender: TObject);
begin
  RelDinamico.Free;
  RelDinamicoXInput.Free;
  InputRelDinamico.Free;
  Reports.Free;
  inherited;
end;

procedure TfrmCadRelDinamico.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadRelDinamico.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadRelDinamico.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Apaga;
  if Accept then Reset;;
end;

procedure TfrmCadRelDinamico.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadRelDinamico.CmeCadastroInsert(Sender: TObject);
begin
  Reset;
  inherited;
  cds.FieldByName('FLGATIVO').AsInteger    := 1;
  cds.FieldByName('FLGROLLBACK').AsInteger := 0;
  rgrpFlgReportType.ItemIndex              := 0;
  SelecionaOrigemDemonstra;
end;

procedure TfrmCadRelDinamico.spbCamposUpClick(Sender: TObject);
begin
  inherited;
  Up( aIdInput, lbCampos );
end;

procedure TfrmCadRelDinamico.spbCamposDownClick(Sender: TObject);
begin
  inherited;
  Down( aIdInput, lbCampos );
end;

procedure TfrmCadRelDinamico.TrocaItem( var aArray : TItens; lLista : TListBox; a, b: integer );
var
  sAux : string;
  iAux : integer;
begin
  sAux := lLista.Items.Strings[a];
  lLista.Items.Strings[a] := lLista.Items.Strings[b];
  lLista.Items.Strings[b] := sAux;

  iAux := aArray[ a ];
  aArray[ a ] := aArray[ b ];
  aArray[ b ] := iAux;
end;

procedure TfrmCadRelDinamico.lbCamposDragDrop(Sender, Source: TObject; X,  Y: Integer);
begin
  inherited;
  lDragDrop( aIdInput, Sender, Source, X, Y );
end;

procedure TfrmCadRelDinamico.lbCamposDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Sender = Source );
end;

procedure TfrmCadRelDinamico.MoveItem( var aArray : TItens; lLista : TListBox; iPosAtual, iPosNova: integer );
var
  i, iMax : integer;
begin
  iMax := lLista.Items.Count - 1;

  if iPosNova = -1 then
  begin
    for i := iPosAtual to ( iMax - 1 ) do
      TrocaItem( aArray, lLista, i, i + 1 );
    lLista.ItemIndex := iMax;
    exit;
  end;

  if iPosNova < iPosAtual then
    for i := iPosAtual downto ( iPosNova + 1 ) do
      TrocaItem( aArray, lLista, i, i - 1 );

  if iPosNova > iPosAtual then
    for i := iPosAtual to ( iPosNova - 1 ) do
      TrocaItem( aArray, lLista, i, i + 1 );

  lLista.ItemIndex := iPosNova;
end;

procedure TfrmCadRelDinamico.CarregaInputs;
begin
  SetLength( aIdInput, 0 );

  cdsRelDinamicoXInput.Close;
  cdsRelDinamicoXInput.Data := RelDinamicoXInput.SelecionaPorRelatorio(
  Cds.FieldByName('IDRELDINAMICO').AsInteger );

  cdsRelDinamicoXInput.First;
  while not cdsRelDinamicoXInput.Eof do
  begin
    SetLength( aIdInput, length( aIdInput ) + 1 );
    aIdInput[ High( aIdInput ) ] := cdsRelDinamicoXInput.FieldByName('IDINPUT').AsInteger;
    lbCampos.Items.Add( InputRelDinamico.RecuperaTitulo(
     cdsRelDinamicoXInput.FieldByName('IDINPUT').AsInteger ) );

    cdsRelDinamicoXInput.Next;
  end;
end;

procedure TfrmCadRelDinamico.spbCamposPlusClick(Sender: TObject);
begin
  inherited;
  Plus( msInput, aIdInput, lbCampos );
end;

function TfrmCadRelDinamico.Ordem( aArray : TItens; iItem : integer ): integer;
var
  i, tam : integer;
begin
  Result := -1;

  tam := length( aArray );

  if tam = 0 then exit;

  for i := 0 to ( tam - 1 ) do
    if aArray[i] = iItem then
    begin
      Result := i + 1;
      break;
    end;
end;

procedure TfrmCadRelDinamico.Reset;
begin
  lbCampos.Clear;
  SetLength( aIdInput, 0 );
  edtReport.Clear;

  Cds.Close;
  Cds.CreateDataSet;

  cdsRelDinamicoXInput.Close;
  cdsRelDinamicoXInput.CreateDataSet;
end;

procedure TfrmCadRelDinamico.spbCamposMinusClick(Sender: TObject);
begin
  inherited;
  Minus( aIdInput, lbCampos );
end;

function TfrmCadRelDinamico.Apaga: boolean;
var
  iAux : integer;
begin
  Result := False;

  cdsRelDinamicoXInput.First;
  while not cdsRelDinamicoXInput.Eof do
    cdsRelDinamicoXInput.Delete;

  if RelDinamicoXInput.GravaRelDinamicoXInput then
      Result := RelDinamico.GravaRelDinamico( iAux );
end;

procedure TfrmCadRelDinamico.Up(var aArray: TItens; lLista : TListBox );
var
  i : integer;
begin
  inherited;
  i := lLista.ItemIndex;
  if i > 0 then
  begin
    TrocaItem( aArray, lLista, i, i - 1 );
    lLista.ItemIndex := i - 1;
  end;
end;

procedure TfrmCadRelDinamico.Down(var aArray: TItens; lLista: TListBox);
var
  i : integer;
begin
  inherited;
  i := lLista.ItemIndex;
  if   ( i >= 0 )
   and ( i < ( lLista.Items.Count - 1 ) ) then
  begin
    TrocaItem( aArray, lLista, i, i + 1 );
    lLista.ItemIndex := i + 1;
  end;
end;

procedure TfrmCadRelDinamico.Plus( MontaSel : TMontaSelect; var aArray: TItens; lLista: TListBox );
begin
  if cds.State in [dsInsert, dsEdit] then
  begin
    MontaSel.Executar;
    if MontaSel.RetornouValor then
    begin
      if Ordem( aArray, StrToInt( MontaSel.ValoresChave[0] ) ) > -1 then
      begin
        ShowMessage('Este item já foi adicionado.');
        exit;
      end;
      SetLength( aArray, length( aArray ) + 1 );
      aArray[ High( aArray ) ] := StrToInt( MontaSel.ValoresChave[0] );
      lLista.Items.Add( MontaSel.ValoresChave[1] );
    end;
  end;
end;

procedure TfrmCadRelDinamico.Minus( var aArray: TItens; lLista: TListBox );
var
  i, iPosAtual, iMax : integer;
begin
  iMax      := lLista.Items.Count - 1;
  iPosAtual := lLista.ItemIndex;

  if iPosAtual = -1 then exit;

  for i := iPosAtual to ( iMax - 1 ) do
    TrocaItem( aArray, lLista, i, i + 1 );

  lLista.Items.Delete( iMax );
  SetLength( aArray, Length( aArray ) - 1 );
end;

procedure TfrmCadRelDinamico.lDragDrop( var aArray : TItens; Sender, Source: TObject;
                                       X,  Y: Integer);
var
  Point: TPoint;
  i : integer;
begin
  if ( Sender = Source ) then
  begin
    Point.X := X;
    Point.Y := Y;

    i := (Sender as TListBox).ItemAtPos( Point, True );

    MoveItem( aArray, (Sender as TListBox), (Sender as TListBox).ItemIndex, i );
  end;
end;

procedure TfrmCadRelDinamico.lbResultadosDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Sender = Source );
end;

procedure TfrmCadRelDinamico.lbResultadosDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  lDragDrop( aIdResult, Sender, Source, X, Y );
end;

procedure TfrmCadRelDinamico.Consulta(iId: integer; sBeneficio : string );
begin
  Reset;
  Cds.Data := RelDinamico.SelecionaRelDinamico( iId );
  CarregaInputs;
  if trim( CdsFLGTIPODEMONSTRA.AsString ) = 'H' then
    rgrpFlgReportType.ItemIndex := 1
  else
    if trim( CdsFLGTIPODEMONSTRA.AsString ) = 'G' then
      rgrpFlgReportType.ItemIndex := 2
    else
      rgrpFlgReportType.ItemIndex := 0;

  edtReport.Text := NomeReport( CdsIDREPORTS.AsInteger, CdsORIGEMCM.AsInteger );

  SelecionaOrigemDemonstra;
end;

procedure TfrmCadRelDinamico.lbCamposDblClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := lbCampos.ItemIndex;
  if i > -1 then
  begin
    if frmCadInputRelDinamico = nil then
    begin
      frmCadInputRelDinamico := TfrmCadInputRelDinamico.Create( nil );
      frmCadInputRelDinamico.Show;
    end
    else
    begin
      frmCadInputRelDinamico.bbtnCancelar.Click;
      frmCadInputRelDinamico.BringToFront;
    end;
    frmCadInputRelDinamico.Consulta( aIdInput[ i ] );
    frmCadInputRelDinamico.sbtnAlterar.Enabled := True;
    frmCadInputRelDinamico.sbtnApagar.Enabled := True;
  end;
end;

procedure TfrmCadRelDinamico.SelecionaOrigemDemonstra;
begin
  pnlHTML.Visible    := ( rgrpFlgReportType.ItemIndex = 1 );
  pnlGerador.Visible := ( rgrpFlgReportType.ItemIndex = 2 );
end;

procedure TfrmCadRelDinamico.rgrpFlgReportTypeClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigemDemonstra;
end;

procedure TfrmCadRelDinamico.btnHTMLFileClick(Sender: TObject);
begin
  inherited;
  dlgHTMLFile.FileName := CdsHTMLDEMONSTRA.AsString;
  if dlgHTMLFile.Execute then
    CdsHTMLDEMONSTRA.AsString := dlgHTMLFile.FileName;
end;

procedure TfrmCadRelDinamico.btnReportClick(Sender: TObject);
begin
  inherited;
  msReport.Executar;
  if msReport.RetornouValor then
  begin
    edtReport.Text := msReport.ValoresChave[0];
    CdsIDREPORTS.AsInteger := StrToInt( msReport.ValoresChave[1] );
    cdsORIGEMCM.AsInteger  := StrToInt( msReport.ValoresChave[2] );
  end;
end;

function TfrmCadRelDinamico.NomeReport(iIdReport, iOrigemCM: integer): string;
var
  cdsAux : TClientDataset;
begin
  if iIdReport <= 0 then exit;
  cdsAux := TClientDataset.Create( nil );
  try
    cdsAux.Data := Reports.SelecionaReports( iIdReport, iOrigemCM );
    Result := cdsAux.FieldByName('NAME').AsString;
  finally
    cdsAux.Free;
  end;
end;

procedure TfrmCadRelDinamico.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.sbtnApagarClick(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

procedure TfrmCadRelDinamico.FormShow(Sender: TObject);
begin
  inherited;

  tbsQuery.Enabled         := pnlFundo.Enabled;
  tbsCampos.Enabled        := pnlFundo.Enabled;
  tbsDemonstrativo.Enabled := pnlFundo.Enabled;
end;

end.
