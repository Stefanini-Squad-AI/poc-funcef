unit FCadSimulaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, uCmTypes, dBaseDados, uSistema, ComCtrls, FTelaAut,
  uCtrlSimulaBenef, uCtrlSimulaBenefXInput, uCtrlInputSimulaBenef,
  uCtrlSimulaBenefXResult, uCtrlResultSimulaBenef, fCadInputSimulaBenef,
  fCadResultSimulaBenef, uCtrlReports;

type
  TItens = array of Integer;

  TfrmCadSimulaBenef = class(TFrmCadastroMT)
    CdsIDSIMULABENEF: TFloatField;
    CdsIDBENEFICIO: TFloatField;
    CdsFLGATIVO: TFloatField;
    CdsQUERYINICIAL: TBlobField;
    lblIdSimulaBenef: TLabel;
    dbedtIdSimulaBenef: TDBEdit;
    dbchkFLGATIVO: TDBCheckBox;
    lblIDBENEFICIO: TLabel;
    edtIDBENEFICIO: TEdit;
    spbBeneficio: TSpeedButton;
    msBeneficio: TMontaSelect;
    PageControl: TPageControl;
    tbsQuery: TTabSheet;
    dbmemQUERYINICIAL: TDBMemo;
    tbsCampos: TTabSheet;
    lbCampos: TListBox;
    Panel1: TPanel;
    spbCamposPlus: TSpeedButton;
    spbCamposMinus: TSpeedButton;
    Panel2: TPanel;
    msInput: TMontaSelect;
    cdsSimulaBenefXInput: TCMClientDataSet;
    cdsSimulaBenefXInputIDSIMULABENEF: TFloatField;
    cdsSimulaBenefXInputIDINPUT: TFloatField;
    cdsSimulaBenefXInputORDEM: TFloatField;
    lblObs: TLabel;
    tbsResultados: TTabSheet;
    msResult: TMontaSelect;
    cdsSimulaBenefXResult: TCMClientDataSet;
    cdsSimulaBenefXResultIDSIMULABENEF: TFloatField;
    cdsSimulaBenefXResultIDRESULT: TFloatField;
    cdsSimulaBenefXResultORDEM: TFloatField;
    lbResultados: TListBox;
    spbCamposUp: TSpeedButton;
    spbCamposDown: TSpeedButton;
    Panel3: TPanel;
    spbResultadosPlus: TSpeedButton;
    spbResultadosMinus: TSpeedButton;
    Panel4: TPanel;
    spbResultadosUp: TSpeedButton;
    spbResultadosDown: TSpeedButton;
    dbchkFLGROLLBACK: TDBCheckBox;
    CdsFLGROLLBACK: TFloatField;
    tbsDemonstrativo: TTabSheet;
    msReport: TMontaSelect;
    CdsFLGTIPODEMONSTRA: TStringField;
    CdsHTMLDEMONSTRA: TStringField;
    CdsIDREPORTS: TFloatField;
    pnlHTML: TPanel;
    lblHTMLFile: TLabel;
    dbedtHTMLFile: TDBEdit;
    btnHTMLFile: TSpeedButton;
    pnlGerador: TPanel;
    lblReport: TLabel;
    edtReport: TEdit;
    btnReport: TSpeedButton;
    rgrpFlgReportType: TRadioGroup;
    dlgHTMLFile: TOpenDialog;
    CdsORIGEMCM: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure spbBeneficioClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure spbCamposUpClick(Sender: TObject);
    procedure lbCamposDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbCamposDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure spbCamposPlusClick(Sender: TObject);
    procedure spbCamposMinusClick(Sender: TObject);
    procedure spbCamposDownClick(Sender: TObject);
    procedure spbResultadosPlusClick(Sender: TObject);
    procedure spbResultadosMinusClick(Sender: TObject);
    procedure spbResultadosUpClick(Sender: TObject);
    procedure spbResultadosDownClick(Sender: TObject);
    procedure lbResultadosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbResultadosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbCamposDblClick(Sender: TObject);
    procedure lbResultadosDblClick(Sender: TObject);
    procedure rgrpFlgReportTypeClick(Sender: TObject);
    procedure btnHTMLFileClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    SimulaBenef        : TCtrlSimulaBenef;
    SimulaBenefXInput  : TCtrlSimulaBenefXInput;
    InputSimulaBenef   : TCtrlInputSimulaBenef;
    SimulaBenefXResult : TCtrlSimulaBenefXResult;
    ResultSimulaBenef  : TCtrlResultSimulaBenef;
    Reports            : TCtrlReports;

    aIdInput  : TItens;
    aIdResult : TItens;

    procedure MsgErro ( sMsg : String );
    procedure TrocaItem( var aArray : TItens; lLista : TListBox; a, b : integer );
    procedure MoveItem( var aArray : TItens; lLista : TListBox; iPosAtual, iPosNova : integer );
    procedure CarregaInputs;
    procedure CarregaResults;
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
  frmCadSimulaBenef: TfrmCadSimulaBenef;

implementation

{$R *.DFM}

procedure TfrmCadSimulaBenef.FormCreate(Sender: TObject);
begin
  inherited;
  SimulaBenef := TCtrlSimulaBenef.Create;
  SimulaBenef.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  SimulaBenef.CdsSimulaBenef := Cds;

  SimulaBenefXInput := TCtrlSimulaBenefXInput.Create;
  SimulaBenefXInput.InitializeAs( SimulaBenef );
  SimulaBenefXInput.cdsSimulaBenefXInput := cdsSimulaBenefXInput;

  InputSimulaBenef := TCtrlInputSimulaBenef.Create;
  InputSimulaBenef.InitializeAs( SimulaBenef );

  SimulaBenefXResult := TCtrlSimulaBenefXResult.Create;
  SimulaBenefXResult.InitializeAs( SimulaBenef );
  SimulaBenefXResult.cdsSimulaBenefXResult := cdsSimulaBenefXResult;

  ResultSimulaBenef := TCtrlResultSimulaBenef.Create;
  ResultSimulaBenef.InitializeAs( SimulaBenef );

  Reports := TCtrlReports.Create;
  Reports.InitializeAs( SimulaBenef );

  Reset;
end;

procedure TfrmCadSimulaBenef.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

function TfrmCadSimulaBenef.Salva: boolean;
var
  iIdSimulaBenef : integer;
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

  if cds.FieldByName('IDBENEFICIO').IsNull then
  begin
    ShowMessage( 'O benefício deve ser selecionado.' );
    edtIDBENEFICIO.SetFocus;
    exit;
  end;

  if trim( cds.FieldByName('QUERYINICIAL').AsString ) = '' then
  begin
    ShowMessage( 'A query inicial deve ser informada.' );
    PageControl.ActivePage := tbsQuery;
    dbmemQUERYINICIAL.SetFocus;
    exit;
  end;

  //Se a simulação é ativa, testa se já há uma silmulação ativa
  //para este benefício, e gera um erro em caso afirmativo
  if   ( cds.FieldByName('FLGATIVO').AsInteger = 1 )
   and ( SimulaBenef.ExisteSimulacaoAtiva(
   cds.FieldByName('IDBENEFICIO').AsInteger,
   cds.FieldByName('IDSIMULABENEF').AsInteger ) )then
  begin
    ShowMessage( 'Já existe uma simulação ativa para este benefício.' );
    exit;
  end;

  Result := SimulaBenef.GravaSimulaBenef( iIdSimulaBenef );

  if Result then
  begin
    cdsSimulaBenefXInput.First;
    while not cdsSimulaBenefXInput.Eof do
      cdsSimulaBenefXInput.Delete;

    iMax := lbCampos.Items.Count - 1;

    for i := 0 to iMax do
    begin
      cdsSimulaBenefXInput.Insert;
      cdsSimulaBenefXInput.FieldByName('IDINPUT').AsInteger       := aIdInput[i];
      cdsSimulaBenefXInput.FieldByName('IDSIMULABENEF').AsInteger := iIdSimulaBenef;
      cdsSimulaBenefXInput.FieldByName('ORDEM').AsInteger         := i + 1;
      cdsSimulaBenefXInput.Post;
    end;

    Result := SimulaBenefXInput.GravaSimulaBenefXInput;
  end;

  if Result then
  begin
    cdsSimulaBenefXResult.First;
    while not cdsSimulaBenefXResult.Eof do
      cdsSimulaBenefXResult.Delete;

    iMax := lbResultados.Items.Count - 1;

    for i := 0 to iMax do
    begin
      cdsSimulaBenefXResult.Insert;
      cdsSimulaBenefXResult.FieldByName('IDRESULT').AsInteger      := aIdResult[i];
      cdsSimulaBenefXResult.FieldByName('IDSIMULABENEF').AsInteger := iIdSimulaBenef;
      cdsSimulaBenefXResult.FieldByName('ORDEM').AsInteger         := i + 1;
      cdsSimulaBenefXResult.Post;
    end;

    Result := SimulaBenefXResult.GravaSimulaBenefXResult;

    if Result then
      Consulta( iIdSimulaBenef, edtIDBENEFICIO.text );
  end;

end;

procedure TfrmCadSimulaBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Consulta( StrToInt( MontaSelect.ValoresChave[0] ), MontaSelect.ValoresChave[1] );
end;

procedure TfrmCadSimulaBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadSimulaBenef.FormDestroy(Sender: TObject);
begin
  SimulaBenef.Free;
  SimulaBenefXInput.Free;
  InputSimulaBenef.Free;
  SimulaBenefXResult.Free;
  ResultSimulaBenef.Free;
  Reports.Free;
  inherited;
end;

procedure TfrmCadSimulaBenef.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadSimulaBenef.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadSimulaBenef.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Apaga;
  if Accept then Reset;;
end;

procedure TfrmCadSimulaBenef.spbBeneficioClick(Sender: TObject);
begin
  inherited;

  if not ( cds.State in [dsInsert, dsEdit] ) then
    cds.Edit;

  msBeneficio.Executar;
  if msBeneficio.RetornouValor then
  begin
    Cds.FieldByName('IDBENEFICIO').AsString := msBeneficio.ValoresChave[0];
    edtIDBENEFICIO.Text := msBeneficio.ValoresChave[1];
  end;
end;

procedure TfrmCadSimulaBenef.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadSimulaBenef.CmeCadastroInsert(Sender: TObject);
begin
  Reset;
  inherited;
  cds.FieldByName('FLGATIVO').AsInteger    := 1;
  cds.FieldByName('FLGROLLBACK').AsInteger := 0;
  cds.FieldByName('IDBENEFICIO').Clear;
  rgrpFlgReportType.ItemIndex              := 0;
  SelecionaOrigemDemonstra;
end;

procedure TfrmCadSimulaBenef.spbCamposUpClick(Sender: TObject);
begin
  inherited;
  Up( aIdInput, lbCampos );
end;

procedure TfrmCadSimulaBenef.spbCamposDownClick(Sender: TObject);
begin
  inherited;
  Down( aIdInput, lbCampos );
end;

procedure TfrmCadSimulaBenef.TrocaItem( var aArray : TItens; lLista : TListBox; a, b: integer );
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

procedure TfrmCadSimulaBenef.lbCamposDragDrop(Sender, Source: TObject; X,  Y: Integer);
begin
  inherited;
  lDragDrop( aIdInput, Sender, Source, X, Y );
end;

procedure TfrmCadSimulaBenef.lbCamposDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Sender = Source );
end;

procedure TfrmCadSimulaBenef.MoveItem( var aArray : TItens; lLista : TListBox; iPosAtual, iPosNova: integer );
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

procedure TfrmCadSimulaBenef.CarregaInputs;
begin
  SetLength( aIdInput, 0 );

  cdsSimulaBenefXInput.Close;
  cdsSimulaBenefXInput.Data := SimulaBenefXInput.SelecionaPorSimulacao(
   Cds.FieldByName('IDSIMULABENEF').AsInteger );

  cdsSimulaBenefXInput.First;
  while not cdsSimulaBenefXInput.Eof do
  begin
    SetLength( aIdInput, length( aIdInput ) + 1 );
    aIdInput[ High( aIdInput ) ] := cdsSimulaBenefXInput.FieldByName('IDINPUT').AsInteger;
    lbCampos.Items.Add( InputSimulaBenef.RecuperaTitulo(
     cdsSimulaBenefXInput.FieldByName('IDINPUT').AsInteger ) );

    cdsSimulaBenefXInput.Next;
  end;
end;

procedure TfrmCadSimulaBenef.CarregaResults;
begin
  SetLength( aIdResult, 0 );

  cdsSimulaBenefXResult.Close;
  cdsSimulaBenefXResult.Data := SimulaBenefXResult.SelecionaPorSimulacao(
   Cds.FieldByName('IDSIMULABENEF').AsInteger );

  cdsSimulaBenefXResult.First;
  while not cdsSimulaBenefXResult.Eof do
  begin
    SetLength( aIdResult, length( aIdResult ) + 1 );
    aIdResult[ High( aIdResult ) ] := cdsSimulaBenefXResult.FieldByName('IDRESULT').AsInteger;
    lbResultados.Items.Add( ResultSimulaBenef.RecuperaTitulo(
     cdsSimulaBenefXResult.FieldByName('IDRESULT').AsInteger ) );

    cdsSimulaBenefXResult.Next;
  end;
end;

procedure TfrmCadSimulaBenef.spbCamposPlusClick(Sender: TObject);
begin
  inherited;
  Plus( msInput, aIdInput, lbCampos );
end;

function TfrmCadSimulaBenef.Ordem( aArray : TItens; iItem : integer ): integer;
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

procedure TfrmCadSimulaBenef.Reset;
begin
  edtIDBENEFICIO.Text := '';
  lbCampos.Clear;
  SetLength( aIdInput, 0 );
  lbResultados.Clear;
  SetLength( aIdResult, 0 );
  edtReport.Clear;

  Cds.Close;
  Cds.CreateDataSet;

  cdsSimulaBenefXInput.Close;
  cdsSimulaBenefXInput.CreateDataSet;
  cdsSimulaBenefXResult.Close;
  cdsSimulaBenefXResult.CreateDataSet;
end;

procedure TfrmCadSimulaBenef.spbCamposMinusClick(Sender: TObject);
begin
  inherited;
  Minus( aIdInput, lbCampos );
end;

function TfrmCadSimulaBenef.Apaga: boolean;
var
  iAux : integer;
begin
  Result := False;

  cdsSimulaBenefXInput.First;
  while not cdsSimulaBenefXInput.Eof do
    cdsSimulaBenefXInput.Delete;

  cdsSimulaBenefXResult.First;
  while not cdsSimulaBenefXResult.Eof do
    cdsSimulaBenefXResult.Delete;

  if SimulaBenefXInput.GravaSimulaBenefXInput then
    if SimulaBenefXResult.GravaSimulaBenefXResult then
      Result := SimulaBenef.GravaSimulaBenef( iAux );
end;

procedure TfrmCadSimulaBenef.Up(var aArray: TItens; lLista : TListBox );
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

procedure TfrmCadSimulaBenef.Down(var aArray: TItens; lLista: TListBox);
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

procedure TfrmCadSimulaBenef.Plus( MontaSel : TMontaSelect; var aArray: TItens; lLista: TListBox );
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

procedure TfrmCadSimulaBenef.Minus( var aArray: TItens; lLista: TListBox );
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

procedure TfrmCadSimulaBenef.spbResultadosPlusClick(Sender: TObject);
begin
  inherited;
  Plus( msResult, aIdResult, lbResultados );
end;

procedure TfrmCadSimulaBenef.spbResultadosMinusClick(Sender: TObject);
begin
  inherited;
  Minus( aIdResult, lbResultados );
end;

procedure TfrmCadSimulaBenef.spbResultadosUpClick(Sender: TObject);
begin
  inherited;
  Up( aIdResult, lbResultados );
end;

procedure TfrmCadSimulaBenef.spbResultadosDownClick(Sender: TObject);
begin
  inherited;
  Down( aIdResult, lbResultados );
end;

procedure TfrmCadSimulaBenef.lDragDrop( var aArray : TItens; Sender, Source: TObject;
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

procedure TfrmCadSimulaBenef.lbResultadosDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Sender = Source );
end;

procedure TfrmCadSimulaBenef.lbResultadosDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  lDragDrop( aIdResult, Sender, Source, X, Y );
end;

procedure TfrmCadSimulaBenef.Consulta(iId: integer; sBeneficio : string );
begin
  Reset;
  Cds.Data := SimulaBenef.SelecionaSimulaBenef( iId );
  edtIDBENEFICIO.text := sBeneficio;
  CarregaInputs;
  CarregaResults;
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

procedure TfrmCadSimulaBenef.lbCamposDblClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := lbCampos.ItemIndex;
  if i > -1 then
  begin
    if frmCadInputSimulaBenef = nil then
    begin
      frmCadInputSimulaBenef := TfrmCadInputSimulaBenef.Create( nil );
      frmCadInputSimulaBenef.Show;
    end
    else
    begin
      frmCadInputSimulaBenef.bbtnCancelar.Click;
      frmCadInputSimulaBenef.BringToFront;
    end;
    frmCadInputSimulaBenef.Consulta( aIdInput[ i ] );
    frmCadInputSimulaBenef.sbtnAlterar.Enabled := True;
    frmCadInputSimulaBenef.sbtnApagar.Enabled := True;
  end;
end;

procedure TfrmCadSimulaBenef.lbResultadosDblClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := lbResultados.ItemIndex;
  if i > -1 then
  begin
    if frmCadResultSimulaBenef = nil then
    begin
      frmCadResultSimulaBenef := TfrmCadResultSimulaBenef.Create( nil );
      frmCadResultSimulaBenef.Show;
    end
    else
    begin
      frmCadResultSimulaBenef.bbtnCancelar.Click;
      frmCadResultSimulaBenef.BringToFront;
    end;
    frmCadResultSimulaBenef.Consulta( aIdResult[ i ] );
    frmCadResultSimulaBenef.sbtnAlterar.Enabled := True;
    frmCadResultSimulaBenef.sbtnApagar.Enabled := True;
  end;
end;

procedure TfrmCadSimulaBenef.SelecionaOrigemDemonstra;
begin
  pnlHTML.Visible    := ( rgrpFlgReportType.ItemIndex = 1 );
  pnlGerador.Visible := ( rgrpFlgReportType.ItemIndex = 2 );
end;

procedure TfrmCadSimulaBenef.rgrpFlgReportTypeClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigemDemonstra;
end;

procedure TfrmCadSimulaBenef.btnHTMLFileClick(Sender: TObject);
begin
  inherited;
  dlgHTMLFile.FileName := CdsHTMLDEMONSTRA.AsString;
  if dlgHTMLFile.Execute then
    CdsHTMLDEMONSTRA.AsString := dlgHTMLFile.FileName;
end;

procedure TfrmCadSimulaBenef.btnReportClick(Sender: TObject);
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

function TfrmCadSimulaBenef.NomeReport(iIdReport, iOrigemCM: integer): string;
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

end.
