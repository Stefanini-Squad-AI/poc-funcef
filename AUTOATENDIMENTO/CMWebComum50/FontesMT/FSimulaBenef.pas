unit FSimulaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, ComCtrls,
  uCmTypes, dBaseDados, uSistema, JCLStrings, JCLSysUtils, uCtrlFuncoesAA,
  uCtrlSimulaBenef, uCtrlReports, Db, DBClient, uCMClientDataSet, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, DBCtrls, wwrcdpnl, DBTables, wwdbdatetimepicker,
  fcLabel, fcText, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, ppModule,
  ShellAPI;

const
  AlturaCampo  = 30;
  AlturaResult = 25;

type

  TCampoSimula = class( TPanel )
  private
    FTipo: integer;

    Controle : TControl;
    FFormato: string;
    FValue : string;
    FListaItens: string;
    FId: integer;
    FPodeAlterar: boolean;

    procedure SetTipo(const Value: integer);
    procedure SetFormato(const Value: string);

    procedure _KeyPress( Sender: TObject; var Key: Char );
    procedure _Exit( Sender: TObject );
    procedure SetValue(const Value: string);
    function GetValue : string;
    procedure SetListaItens(const Value: string);
    procedure SetId(const Value: integer);
    procedure SetPodeAlterar(const Value: boolean);

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Focus;

    //1 = Texto, 2 = Data, 3 = Lista, 4 = Numérico
    property Tipo : integer read FTipo write SetTipo;

    property Formato : string read FFormato write SetFormato;

    property Value : string read GetValue write SetValue;

    property ListaItens : string read FListaItens write SetListaItens;

    property Id : integer read FId write SetId;

    property PodeAlterar : boolean read FPodeAlterar write SetPodeAlterar;

  end;


  TResultSimula = class( TPanel )
  private
    Lbl : TLabel;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;


  TfrmSimulaBenef = class(TfrmOkCancelar)
    msParticipante: TMontaSelect;
    PageControl: TPageControl;
    tabParticipante: TTabSheet;
    grpParticipante: TGroupBox;
    lblMatricula: TLabel;
    lblNome: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    tabBeneficio: TTabSheet;
    grpBeneficio: TGroupBox;
    Label2: TLabel;
    cdsBeneficio: TCMClientDataSet;
    tabCampos: TTabSheet;
    dtsBeneficio: TDataSource;
    cmbBeneficio: TDBLookupComboBox;
    btnVoltar: TBitBtn;
    Label1: TLabel;
    edtInscricao: TEdit;
    Label3: TLabel;
    edtLogin: TEdit;
    btnConsulta: TSpeedButton;
    pnlTop1: TPanel;
    pnlTop2: TPanel;
    pnlTop3: TPanel;
    tabResultados: TTabSheet;
    pnlTop4: TPanel;
    cdsCamposProcesso: TCMClientDataSet;
    cdsCamposProcessoIDINPUT: TIntegerField;
    cdsCamposProcessoNOMECAMPO: TStringField;
    cdsCamposProcessoVALOR: TStringField;
    cdsBeneficioIDSIMULABENEF: TFloatField;
    cdsBeneficioIDBENEFICIO: TFloatField;
    cdsBeneficioQUERYINICIAL: TMemoField;
    cdsBeneficioFLGROLLBACK: TFloatField;
    cdsBeneficioNOME: TStringField;
    cdsCamposSimulaBenef: TClientDataSet;
    cdsResultSimulaBenef: TClientDataSet;
    pnlEt4: TPanel;
    scrollResultados: TScrollBox;
    pnlEt3: TPanel;
    scrollCampos: TScrollBox;
    PanelBeneficio: TPanel;
    fcLabel1: TfcLabel;
    lblBenef: TLabel;
    btnDemonstrativo: TBitBtn;
    cdsBeneficioIDREPORTS: TFloatField;
    cdsBeneficioORIGEMCM: TFloatField;
    cdsBeneficioFLGTIPODEMONSTRA: TStringField;
    cdsBeneficioHTMLDEMONSTRA: TStringField;
    cdsDemonstrativo: TClientDataSet;
    ppDemonstrativo: TppBDEPipeline;
    rptDemonstrativo: TppReport;
    dtsDemonstrativo: TDataSource;
    cdsReports: TClientDataSet;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnDemonstrativoClick(Sender: TObject);

  private
    iIdPessoa,
    iIdSimulaBenef,
    iFlgRollback : integer;

    SimulaBenef        : TCtrlSimulaBenef;
    Reports            : TCtrlReports;

    CampoSimula  : array of TCampoSimula;
    ResultSimula : array of TResultSimula;

    PanelCampos, PanelResultados : TPanel;

    procedure Etapa1;
    procedure Etapa2;
    procedure Etapa3;

    procedure HabilitaTab( iTab : integer );

    function ValidaPreenchimento : boolean;
    procedure PreencheCampos;

    function CampoPorId( _Id : integer ) : TCampoSimula;

    function GetTempDir : string;

    procedure MsgErro( sMsg : string );

    procedure ConverteStringParaLista( sLista : string; lLista : TStringList );

  public
    { Public declarations }
  end;

var
  frmSimulaBenef: TfrmSimulaBenef;

implementation

{$R *.DFM}


procedure TfrmSimulaBenef.FormCreate(Sender: TObject);
begin
  inherited;

  SimulaBenef := TCtrlSimulaBenef.Create;
  SimulaBenef.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  Reports := TCtrlReports.Create;
  Reports.InitializeAs( SimulaBenef );

  iIdPessoa      := -1;
  iIdSimulaBenef := -1;
  iFlgRollback   := -1;

  HabilitaTab( 0 );
end;


procedure TfrmSimulaBenef.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  inherited;

  for i := 0 to High( CampoSimula ) do
    FreeAndNil( CampoSimula[i] );

  for i := 0 to High( ResultSimula ) do
    FreeAndNil( ResultSimula[i] );

  if PanelCampos <> nil then
    FreeAndNil( PanelCampos );

  if PanelResultados <> nil then
    FreeAndNil( PanelResultados );

  SimulaBenef.Free;
  Reports.Free;
end;


procedure TfrmSimulaBenef.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;


procedure TfrmSimulaBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  bbtnConfirmar.SetFocus;

  if PageControl.ActivePage = tabParticipante then
    Etapa1
  else
    if PageControl.ActivePage = tabBeneficio then
      Etapa2
    else
      if PageControl.ActivePage = tabCampos then
        Etapa3;

end;


procedure TfrmSimulaBenef.btnVoltarClick(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePageIndex = 3 then
  begin
    if length( CampoSimula ) = 0 then
      HabilitaTab( 1 )
    else
      HabilitaTab( 2 );
  end
  else
    HabilitaTab( PageControl.ActivePageIndex - 1 );
end;

procedure TfrmSimulaBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if MessageDlg( 'Confirma o cancelamento da simulação?', mtConfirmation, [mbYes, mbNo], 0 ) <> mrYes then
    exit;

  iIdPessoa    := -1;
  iIdSimulaBenef := -1;
  iFlgRollback := -1;
  edtNome.Text := '';
  edtMatricula.Text := '';
  edtInscricao.Text := '';
  edtLogin.Text := '';
  
  HabilitaTab( 0 );
end;

procedure TfrmSimulaBenef.HabilitaTab(iTab: integer);
var
  i : integer;
begin
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;

  PageControl.Pages[iTab].TabVisible := True;

  btnVoltar.Enabled        := ( iTab > 0 );

  btnDemonstrativo.Enabled := False;
  if iTab = 3 then
    if ( cdsBeneficioFLGTIPODEMONSTRA.AsString = 'G' ) or
       ( cdsBeneficioFLGTIPODEMONSTRA.AsString = 'H' ) then
      btnDemonstrativo.Enabled := True;
end;


procedure TfrmSimulaBenef.Etapa1;
begin
  if iIdPessoa <= 0 then
  begin
    ShowMessage('É necessário selecionar um participante.');
    exit;
  end;

  cdsBeneficio.Close;
  iIdSimulaBenef := -1;
  iFlgRollback   := -1;

  cdsBeneficio.Data := SimulaBenef.ListaBeneficios;

  cmbBeneficio.KeyValue := -1;

  HabilitaTab( 1 );
end;

procedure TfrmSimulaBenef.Etapa2;
var
  i, iWidth    : integer;
  bExisteParam : boolean;
begin
  if cmbBeneficio.KeyValue <= 0 then
  begin
    ShowMessage('É necessário selecionar um benefício.');
    exit;
  end;

  iIdSimulaBenef := cmbBeneficio.KeyValue;
  iFlgRollback  := cdsBeneficioFLGROLLBACK.AsInteger;

  for i := 0 to High( CampoSimula ) do
    FreeAndNil( CampoSimula[i] );

  SetLength( CampoSimula, 0 );

  //Recupera os dados dos campos com os conteúdos calculados
  cdsCamposSimulaBenef.Close;
  try
    cdsCamposSimulaBenef.Data := SimulaBenef.CamposSimulaBenef( iIdPessoa, iIdSimulaBenef, iFlgRollback, Sistema.IdEmpresa );
  finally
  end;

  if not cdsCamposSimulaBenef.Active then
    exit;

  //Verifica se existe campos visíveis e/ou editáveis
  bExisteParam := False;
  if not cdsCamposSimulaBenef.IsEmpty then
  begin
    cdsCamposSimulaBenef.First;
    while not cdsCamposSimulaBenef.Eof do
    begin
      //Se o campo for visível e editável
      if ( cdsCamposSimulaBenef.FieldByName('FLGVISIVEL').AsString     = '1' ) and
         ( cdsCamposSimulaBenef.FieldByName('FLGPODEALTERAR').AsString = '1' ) then
      begin
        bExisteParam := True;
        break;
      end;
      cdsCamposSimulaBenef.Next;
    end;
  end;

  //Prepara o dataset de campos (que será utilizado até o final)
  cdsCamposProcesso.Close;
  cdsCamposProcesso.CreateDataSet;

  cdsCamposSimulaBenef.First;
  while not cdsCamposSimulaBenef.Eof do
  begin

    cdsCamposProcesso.Append;
    if not cdsCamposSimulaBenef.FieldByName('IDINPUT').IsNull then
      cdsCamposProcessoIDINPUT.AsInteger  := cdsCamposSimulaBenef.FieldByName('IDINPUT').AsInteger
    else
      cdsCamposProcessoNOMECAMPO.AsString := cdsCamposSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
    cdsCamposProcessoVALOR.AsString     := cdsCamposSimulaBenef.FieldByName('VALOR').AsString;
    cdsCamposProcesso.Post;

    cdsCamposSimulaBenef.Next;
  end;


  //Se não há campo, gera apenas a página de resultados
  if not bExisteParam then
  begin
    Etapa3;
    exit;
  end;

  iWidth := scrollCampos.Width - 20;

  //Geração dos campos
  cdsCamposSimulaBenef.First;
  while not cdsCamposSimulaBenef.Eof do
  begin
    if  ( trim( cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString ) <> '' )
    and ( cdsCamposSimulaBenef.FieldByName('FLGVISIVEL').AsInteger      =  1  ) then
    begin
      SetLength( CampoSimula, length( CampoSimula ) + 1 );
      i := High( CampoSimula );

      CampoSimula[i]            := TCampoSimula.Create( Self );
      CampoSimula[i].Id         := cdsCamposSimulaBenef.FieldByName('IDINPUT').AsInteger;
      CampoSimula[i].Parent     := scrollCampos;
      CampoSimula[i].BevelOuter := bvNone;
      CampoSimula[i].Top        := ( ( High( CampoSimula ) ) * AlturaCampo ) + 1;
      CampoSimula[i].Left       := 0;
      CampoSimula[i].Width      := iWidth;
      CampoSimula[i].Height     := AlturaCampo;
      CampoSimula[i].Caption    := '  ' + cdsCamposSimulaBenef.FieldByName('TITULO').AsString;
      CampoSimula[i].Alignment  := taLeftJustify;
      CampoSimula[i].TabOrder   := i;

      //Tipo do campo  (T = Texto, D = Data, L = Lista, N = Numérico)
      if trim( cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString ) = 'T' then CampoSimula[i].Tipo := 1;
      if trim( cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString ) = 'D' then CampoSimula[i].Tipo := 2;
      if trim( cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString ) = 'L' then CampoSimula[i].Tipo := 3;
      if trim( cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString ) = 'N' then CampoSimula[i].Tipo := 4;

      CampoSimula[i].Formato := trim( cdsCamposSimulaBenef.FieldByName('FORMATO').AsString );

      if trim( cdsCamposSimulaBenef.FieldByName('LISTAITENS').AsString ) <> '' then
        CampoSimula[i].ListaItens := trim( cdsCamposSimulaBenef.FieldByName('LISTAITENS').AsString );

      if trim( cdsCamposSimulaBenef.FieldByName('VALOR').AsString ) <> '' then
        CampoSimula[i].Value := trim( cdsCamposSimulaBenef.FieldByName('VALOR').AsString );

      CampoSimula[i].PodeAlterar := ( cdsCamposSimulaBenef.FieldByName('FLGPODEALTERAR').AsInteger = 1 );
    end;

    cdsCamposSimulaBenef.Next;
  end;

  for i := 0 to High( CampoSimula ) do
    CampoSimula[i].Anchors := [akLeft, akTop, akRight];

  HabilitaTab( 2 );
end;


procedure TfrmSimulaBenef.btnConsultaClick(Sender: TObject);
begin
  inherited;
  msParticipante.Executar;
  if msParticipante.RetornouValor then
  begin
    iIdPessoa := StrToInt( msParticipante.ValoresChave[0] );
    edtNome.Text := msParticipante.ValoresChave[1];
    edtMatricula.Text := msParticipante.ValoresChave[2];
    edtInscricao.Text := msParticipante.ValoresChave[3];
    edtLogin.Text := msParticipante.ValoresChave[4];
  end;
end;

constructor TCampoSimula.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TCampoSimula.Destroy;
begin
  if Controle <> nil then
    FreeAndNil( Controle );

  inherited;    
end;

procedure TCampoSimula._KeyPress( Sender: TObject; var Key: Char );
begin
  inherited;      
  if FTipo = 4 then
  begin
    //Verifica se é caractere
    if not ( Key in [ '0'..'9', DecimalSeparator, '-', Chr(8), Chr(10), Chr(13), Chr(27) ] ) then
      Key := #0;

    // Verifica digitação do Decimal Separator
    if Key = DecimalSeparator then
      if Pos( DecimalSeparator, (Controle as TEdit).Text ) <> 0 then
        Key := #0;

    // Verifica digitação do sinal
    if ( Key = '-' ) then
      if ( Pos( '-', (Controle as TEdit).Text ) <> 0 ) or ( (Controle as TEdit).SelStart > 0 ) then
        Key := #0;
  end;        
end;


procedure TCampoSimula.SetFormato(const Value: string);
begin
  FFormato := Value;

  if FTipo = 4 then
    FFormato := StringReplace( StringReplace( StringReplace(
     FFormato, '.', '[§]', [rfReplaceAll] ), ',', '.', [rfReplaceAll] ), '[§]', ',', [rfReplaceAll] );

  if FTipo = 2 then ( Controle as TwwDBDateTimePicker ).DisplayFormat := FFormato;
end;


procedure TCampoSimula.SetTipo(const Value: integer);
begin
  FTipo := Value;

  case FTipo of
    1 : Controle := TEdit.Create( Self );                                       //Texto
    2 : begin
          Controle := TwwDBDateTimePicker.Create( Self );                       //Data
          ( Controle as TwwDBDateTimePicker).UnboundDataType := wwDTEdtDate;
          Formato := 'dd/mm/yyyy';
        end;
    3 : begin
          Controle := TComboBox.Create( Self );                                 //Lista
          ( Controle as TComboBox).Style := csDropDownList;
        end;
    4 : begin
          Controle := TEdit.Create( Self );                                     //Número
          ( Controle as TEdit ).OnKeyPress := _KeyPress;
          ( Controle as TEdit ).OnExit     := _Exit;
          Formato := '';
        end;
  else
    Controle := TLabel.Create( Self );
    ( Controle as TLabel ).AutoSize := False;
  end;

  Controle.Parent     := Self;

  case FTipo of
    1 : ( Controle as TEdit ).Font.Color := clNavy;
    2 : ( Controle as TwwDBDateTimePicker).Font.Color := clNavy;
    3 : ( Controle as TComboBox).Font.Color := clNavy;
    4 : ( Controle as TEdit ).Font.Color := clNavy;
  else ( Controle as TLabel ).Font.Color := clNavy;
  end;

  Controle.Top        := round( ( Self.Height - Controle.Height ) / 2 );
  Controle.Left       := round( Self.Width / 2 );

  if FTipo <> 2 then
  begin
    Controle.Width   := round( Self.Width / 2 ) - 4;
    Controle.Anchors := [akLeft, akTop, akRight];
  end
  else
    Controle.Width := 100;
end;

procedure TfrmSimulaBenef.Etapa3;
var
  i, iTop : integer;
  sValor : string;
  lLista : TStringList;


  function CriaPainelDiv( _Caption : string; _Top : integer ) : TPanel;
  var
    fcLabel : TfcLabel;
  begin
    Result         := TPanel.Create( Self );
    Result.Parent  := scrollResultados;
    Result.Caption := '';
    Result.Top     := _Top;
    Result.Left    := 2;
    Result.Height  := 25;
    Result.Width   := scrollResultados.Width - 20;
    Result.Color   := $00D9FFFF;

    fcLabel                   := TfcLabel.Create( Self );
    fcLabel.Parent            := Result;
    fcLabel.Left              := 6;
    fcLabel.Top               := 4;
    fcLabel.Caption           := _Caption;
    fcLabel.Font.Color        := clNavy;
    fcLabel.Font.Name         := 'Arial';
    fcLabel.Font.Size         := 11;
    fcLabel.Font.Style        := [fsBold];
    fcLabel.Transparent       := True;
    fcLabel.TextOptions.Style := fclsLowered;
  end;

  function CriaPainelResult( _Caption, _Value : string; _Top : integer ) : TResultSimula;
  begin
    Result              := TResultSimula.Create( Self );
    Result.Parent       := scrollResultados;
    Result.Caption      := '    ' + _Caption;
    Result.Top          := _Top;
    Result.Left         := 2;
    Result.Width        := scrollResultados.Width - 21;
    Result.Lbl.Caption  := _Value;
    Result.Lbl.Left     := round( Result.Width / 2 );
    Result.Lbl.AutoSize := False;
    Result.Lbl.Width    := round( Result.Width / 2 ) - 10;
    Result.Lbl.Anchors  := [akLeft, akTop, akRight];
    SetLength( ResultSimula, length( ResultSimula ) + 1 );
    ResultSimula[ High( ResultSimula ) ] := Result;
  end;

begin
  //Preenche os campos com os dados alterados pelo usuário
  PreencheCampos;

  //Valida o preenchimento dos campos
  if not ValidaPreenchimento then
    exit;

  PanelBeneficio.Anchors := [akLeft, akTop];
  PanelBeneficio.Width   := scrollResultados.Width - 4;

  if PanelCampos <> nil then
    FreeAndNil( PanelCampos );

  if PanelResultados <> nil then
    FreeAndNil( PanelResultados );

  for i := 0 to High( ResultSimula ) do
    FreeAndNil( ResultSimula[i] );

  SetLength( ResultSimula, 0 );

  //Recupera os dados dos resultados com os conteúdos calculados
  cdsResultSimulaBenef.Close;
  try
    cdsResultSimulaBenef.Data := SimulaBenef.ResultSimulaBenef( iIdPessoa, iIdSimulaBenef, iFlgRollback, Sistema.IdEmpresa, cdsCamposProcesso.Data );
  except
  end;

  lblBenef.Caption := '    ' + cmbBeneficio.Text;

  if not cdsResultSimulaBenef.Active then
    exit;

  iTop := 65;

  PanelCampos := CriaPainelDiv( 'Campos', iTop );

  iTop := iTop + PanelCampos.Height;


  lLista := TStringList.Create;
  try
    cdsCamposProcesso.First;
    while not cdsCamposProcesso.Eof do
    begin
      cdsCamposSimulaBenef.First;
      if cdsCamposProcesso.FieldByName('IDINPUT').AsString <> '' then
      begin
        cdsCamposSimulaBenef.Locate( 'IDINPUT', cdsCamposProcesso.FieldByName('IDINPUT').AsInteger, [] );

        cdsCamposProcesso.Edit;
        cdsCamposProcesso.FieldByName('NOMECAMPO').AsString := cdsCamposSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
        cdsCamposProcesso.Post;

        if cdsCamposSimulaBenef.FieldByName('FLGVISIVEL').AsInteger = 1 then
        begin
          if trim( cdsCamposProcesso.FieldByName('VALOR').AsString ) <> '' then
          begin
            sValor := cdsCamposProcesso.FieldByName('VALOR').AsString;
            if cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString = 'L' then
            begin
              ConverteStringParaLista( cdsCamposSimulaBenef.FieldByName('LISTAITENS').AsString, lLista );
              sValor := lLista.Strings[ StrToInt( sValor ) - 1];
            end;
            CriaPainelResult( cdsCamposSimulaBenef.FieldByName('TITULO').AsString, sValor, iTop );
            iTop := iTop + AlturaResult;
          end;
        end;
      end;
      cdsCamposProcesso.Next;
    end;
  finally
    lLista.Free;
  end;

  if length( ResultSimula ) = 0 then
  begin
    iTop := iTop - PanelCampos.Height;
    FreeAndNil( PanelCampos );
  end
  else
    iTop := iTop + 20;
    
  PanelResultados := CriaPainelDiv( 'Resultados', iTop );

  iTop := PanelResultados.Top + PanelResultados.Height;

  cdsResultSimulaBenef.First;
  while not cdsResultSimulaBenef.Eof do
  begin
    if cdsResultSimulaBenef.FieldByName('FLGVISIVEL').AsInteger = 1 then
    begin
      CriaPainelResult( cdsResultSimulaBenef.FieldByName('TITULO').AsString, cdsResultSimulaBenef.FieldByName('VALOR').AsString, iTop );
      iTop := iTop + AlturaResult;
    end;
    cdsResultSimulaBenef.Next;
  end;

  if PanelCampos <> nil then
    PanelCampos.Anchors     := [akLeft, akTop, akRight];
  PanelBeneficio.Anchors := [akLeft, akTop, akRight];
  PanelResultados.Anchors := [akLeft, akTop, akRight];

  for i := 0 to High( ResultSimula ) do
    ResultSimula[i].Anchors := [akLeft, akTop, akRight];

  HabilitaTab( 3 );
end;

procedure TCampoSimula._Exit(Sender: TObject);
begin
  Value := trim( Value );
end;


procedure TCampoSimula.SetValue(const Value: string);
begin
  FValue := trim( Value );

  if FValue = '' then
  begin
    case FTipo of
      0 : ( Controle as TLabel ).Caption := '';
      1, 2, 4 : ( Controle as TEdit ).Clear;
      3 : ( Controle as TComboBox).ItemIndex := -1;
    end;
  end
  else
  begin
    case FTipo of
      0 : ( Controle as TLabel ).Caption := Value;
      1 : ( Controle as TEdit ).Text := Value;
      2 : ( Controle as TwwDBDateTimePicker).Date := StrToDate( Value );
      3 : ( Controle as TComboBox).ItemIndex := StrToInt( Value );
      4 : ( Controle as TEdit ).Text := FormatFloat( FFormato, StrToFloat( StringReplace( Value, '.', '', [rfReplaceAll] ) ) );
    end;
  end;
end;


function TCampoSimula.GetValue: string;
begin
  case FTipo of
    1 : FValue := trim( ( Controle as TEdit ).Text );
    2 : begin
          if ( Controle as TwwDBDateTimePicker).Text = '' then
            FValue := ''
          else
            FValue := FormatDateTime( FFormato, ( Controle as TwwDBDateTimePicker).Date );
        end;
    3 : FValue := iff( ( Controle as TComboBox).ItemIndex <= 0, '', IntToStr( ( Controle as TComboBox).ItemIndex ) );
    4 : begin
          if ( Controle as TEdit ).Text = '' then
            FValue := ''
          else
            FValue := FormatFloat( FFormato, StrToFloat( StringReplace( ( Controle as TEdit ).Text, '.', '', [rfReplaceAll] ) ) );
        end;
  end;
  Result := FValue;
end;


procedure TCampoSimula.SetListaItens(const Value: string);
var
  sAux : string;
  iPos : integer;
begin
  FListaItens := Value;
  if FTipo = 3 then
  begin
    ( Controle as TComboBox).Items.Clear;

    ( Controle as TComboBox).Items.Add( ' ' );

    sAux := trim( FlistaItens );
    while sAux <> '' do
    begin
      iPos := StrFind( '#', sAux, 1 );
      if iPos <> 0 then
      begin
        ( Controle as TComboBox).Items.Add( StrLeft( sAux, iPos - 1 ) );
        sAux := StrRight( sAux, length( sAux ) - iPos );
      end
      else
      begin
        ( Controle as TComboBox).Items.Add( sAux );
        sAux := '';
      end;
    end;
  end;
end;


procedure TCampoSimula.SetId(const Value: integer);
begin
  FId := Value;
end;


procedure TCampoSimula.SetPodeAlterar(const Value: boolean);
var
  _Color : TColor;
begin
  FPodeAlterar := Value;

  if FPodeAlterar then
    _Color := clWindow
  else
    _Color := clBtnFace;

  case FTipo of
    1 : ( Controle as TEdit ).Color := _Color;
    2 : ( Controle as TwwDBDateTimePicker).Color := _Color;
    3 : ( Controle as TComboBox).Color := _Color;
    4 : ( Controle as TEdit ).Color := _Color;
  end;

  Self.Enabled := FPodeAlterar;
end;


function TfrmSimulaBenef.ValidaPreenchimento: boolean;
var
  _CampoSimula : TCampoSimula;
begin
  Result := False;

  cdsCamposProcesso.First;
  while not cdsCamposProcesso.Eof do
  begin
    cdsCamposSimulaBenef.First;
    cdsCamposSimulaBenef.Locate( 'IDINPUT', cdsCamposProcesso.FieldByName('IDINPUT').AsInteger, [] );
    if cdsCamposSimulaBenef.FieldByName('FLGREQUERIDO').AsInteger = 1 then
    begin
      if cdsCamposProcesso.FieldByName('IDINPUT').AsString <> '' then
      begin
        if trim( cdsCamposProcesso.FieldByName('VALOR').AsString ) = '' then
        begin
          _CampoSimula := CampoPorId( cdsCamposProcesso.FieldByName('IDINPUT').AsInteger );
          scrollCampos.ScrollInView( _CampoSimula );
          MessageDlg( 'Preencha o campo ''' + trim( _CampoSimula.Caption ) + '''.', mtWarning, [mbOk], 0 );
          _CampoSimula.Focus;
          exit;
        end;
      end;
    end;
    cdsCamposProcesso.Next;
  end;

  Result := True;
end;

function TfrmSimulaBenef.CampoPorId( _Id : integer ): TCampoSimula;
var
  i : integer;
begin
  Result := nil;
  for i := 0 to High( CampoSimula ) do
    if CampoSimula[i].Id = _Id then
    begin
      Result := CampoSimula[i];
      exit;
    end;
end;

procedure TCampoSimula.Focus;
begin
  case FTipo of
    1 : ( Controle as TEdit ).SetFocus;
    2 : ( Controle as TwwDBDateTimePicker).SetFocus;
    3 : ( Controle as TComboBox).SetFocus;
    4 : ( Controle as TEdit ).SetFocus;
  else Self.SetFocus;
  end;
end;

procedure TfrmSimulaBenef.PreencheCampos;
var
  _CampoSimula : TCampoSimula;
begin
  cdsCamposProcesso.First;
  while not cdsCamposProcesso.Eof do
  begin
    if cdsCamposProcesso.FieldByName('IDINPUT').AsString <> '' then
    begin
      _CampoSimula := CampoPorId( cdsCamposProcesso.FieldByName('IDINPUT').AsInteger );
      if _CampoSimula <> nil then
      begin
        cdsCamposProcesso.Edit;
        cdsCamposProcesso.FieldByName('VALOR').AsString := trim( _CampoSimula.Value );
        cdsCamposProcesso.Post;
      end;
    end;
    cdsCamposProcesso.Next;
  end;
end;


constructor TResultSimula.Create(AOwner: TComponent);
begin
  inherited;
  Alignment       := taLeftJustify;
  Self.Height     := AlturaResult;
  Self.BevelInner := bvNone;
  Self.BevelOuter := bvNone;

  Lbl            := TLabel.Create( Self );
  Lbl.Parent     := Self;
  Lbl.Top        := round( ( Self.Height - Lbl.Height ) / 2 );
  Lbl.Caption    := '';
  Lbl.Font.Color := clNavy;
  Lbl.Font.Style := [fsBold];
end;


destructor TResultSimula.Destroy;
begin
  Lbl.Free;
  inherited;
end;


procedure TfrmSimulaBenef.btnDemonstrativoClick(Sender: TObject);
var
  lLista : TStringList;
  ReportStream : TMemoryStream;
  sHTMLLocal : string;
  i, iQtdeCampos : integer;
  sHTMLFile : string;
begin
  inherited;

  ReportStream := TMemoryStream.Create;
  lLista := TStringList.Create;
  try

    cdsDemonstrativo.Data := cdsCamposProcesso.Data;

    cdsDemonstrativo.First;
    while not cdsDemonstrativo.Eof do
    begin
      cdsCamposSimulaBenef.First;
      cdsCamposSimulaBenef.Locate( 'IDINPUT', cdsDemonstrativo.FieldByName('IDINPUT').AsInteger, [] );
      if cdsCamposSimulaBenef.FieldByName('TIPODADO').AsString = 'L' then
      begin
        cdsDemonstrativo.Edit;
        ConverteStringParaLista( cdsCamposSimulaBenef.FieldByName('LISTAITENS').AsString, lLista );
        cdsDemonstrativo.FieldByName('VALOR').AsString := lLista.Strings[ StrToInt( cdsDemonstrativo.FieldByName('VALOR').AsString ) - 1];
        cdsDemonstrativo.Post;
      end;
      cdsDemonstrativo.Next;
    end;


    cdsResultSimulaBenef.First;
    while not cdsResultSimulaBenef.Eof do
    begin
      if trim( cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
      begin
        cdsDemonstrativo.Append;
        cdsDemonstrativo.FieldByName('NOMECAMPO').AsString := cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
        cdsDemonstrativo.FieldByName('VALOR').AsString     := cdsResultSimulaBenef.FieldByName('VALOR').AsString;
        cdsDemonstrativo.Post;
      end;
      cdsResultSimulaBenef.Next;
    end;

    cdsDemonstrativo.Data := SimulaBenef.DataToSQL( cdsDemonstrativo.Data );

    if trim( cdsBeneficioFLGTIPODEMONSTRA.AsString ) = 'H' then
    begin

      //Se o arquivo não existir..
      if not FileExists( trim( cdsBeneficioHTMLDEMONSTRA.AsString ) ) then
      begin
        MsgErro( 'Não foi possível encontrar o template do relatório.' );
        exit;
      end;

      sHTMLLocal := LeTxt( trim( cdsBeneficioHTMLDEMONSTRA.AsString ) );

      //Se o arquivo não estiver vazio...
      if trim( sHTMLLocal ) <> '' then
      begin

        //Quantidade de campos
        iQtdeCampos := cdsDemonstrativo.FieldCount;

        //Substitui as tags pelos conteúdos dos campos
        for i := 0 to iQtdeCampos - 1 do
          sHTMLLocal := StrSubst( sHTMLLocal, '<#' + cdsDemonstrativo.Fields[i].FieldName + '>', cdsDemonstrativo.Fields[i].AsString );

      end;

      sHTMLFile := GetTempDir + 'H' + StrRight( FormatFloat( '0000000', GetTickCount ), 7 ) + '.htm';

      //Se não gravar txt...
      if not GravaTxt( sHTMLFile, sHTMLLocal ) then
      begin
        MsgErro( 'Não foi possível gerar o relatório. Erro de gravação em disco.' );
        exit;
      end;

      ShellExecute( Handle, 'open', PChar( sHTMLFile ), '', '', SW_SHOWNORMAL );

    end
    else
    begin
      cdsReports.Close;
      cdsReports.Data := Reports.SelecionaReports( cdsBeneficioIDREPORTS.AsInteger, cdsBeneficioORIGEMCM.AsInteger );

      if cdsReports.IsEmpty then
      begin
        MsgErro( 'Não foi possível encontrar o layout do relatório do banco de dados.' );
        exit;
      end;

      //Se o template estiver nulo
      if ( cdsReports.FieldByName('TEMPLATE').IsNull ) then
      begin
        MsgErro( 'Template de relatório nulo.' );
        exit;
      end;

      //Envia os dados do termplate para o stream
      ( cdsReports.FieldByName('TEMPLATE') as TBlobField).SaveToStream( ReportStream );

      //Posiciona no início do stream
      ReportStream.Position := 0;

      //Envia o stream para o componente de relatório
      rptDemonstrativo.Template.LoadFromStream( ReportStream );

      rptDemonstrativo.DataPipeline := ppDemonstrativo;
      

      //Imprime (salva) o relatório
      rptDemonstrativo.Print;

    end;


  finally
    ReportStream.Free;
    lLista.Free;
  end;

end;

procedure TfrmSimulaBenef.ConverteStringParaLista(sLista: string; lLista: TStringList);
var
  sAux : string;
  iPOs : integer;
begin
  lLista.Clear;

  sAux := trim( sLista );
  while sAux <> '' do
  begin
    iPos := StrFind( '#', sAux, 1 );
    if iPos <> 0 then
    begin
      lLista.Add( StrLeft( sAux, iPos - 1 ) );
      sAux := StrRight( sAux, length( sAux ) - iPos );
    end
    else
    begin
      lLista.Add( sAux );
      sAux := '';
    end;
  end;
end;

function TfrmSimulaBenef.GetTempDir: string;
var
  lpPath: PChar;
begin
  lpPath := nil;
  try
    GetMem( lpPath, MAX_PATH );
    GetTempPath( MAX_PATH, lpPath );
    Result := StrPas( lpPath );
    if StrRight( Result, 1 ) <> '\' then Result := Result + '\';
  finally
    FreeMem(lpPath);
  end;
end;


end.
