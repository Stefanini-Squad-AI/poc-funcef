unit FCadWebInterface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, JCLStrings,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, ComCtrls, Mask, DBCtrls, uCmTypes, dBaseDados, uSistema, uCtrlWebInterface,
  BfDialogs, BrowseFolder, uProcuraDir;

type
  TfrmCadWebInterface = class(TFrmCadastroMT)
    CdsIDWEBINTERFACE: TFloatField;
    CdsNOMEINTERFACE: TStringField;
    CdsENDLOGIN: TStringField;
    CdsEMAIL: TStringField;
    CdsTIMEOUT: TFloatField;
    CdsMENUALTURA: TFloatField;
    CdsMENULARGURA: TFloatField;
    CdsMENUTAMFONTE: TFloatField;
    CdsMENUPOSX: TFloatField;
    CdsMENUPOSY: TFloatField;
    CdsMENUDISTANCIA: TFloatField;
    CdsMENUNOMEFONTE: TStringField;
    CdsMENUCORFONTE: TStringField;
    CdsMENUCORFONTESEL: TStringField;
    CdsMENUCORFUNDO: TStringField;
    CdsMENUCORFUNDOSEL: TStringField;
    CdsFLGUSAMENU: TStringField;
    CdsFLGUSALAYERS: TStringField;
    CdsFLGDEMO: TStringField;
    PageControl: TPageControl;
    tabGerais: TTabSheet;
    lblEMail: TLabel;
    lblTimeOut: TLabel;
    lblEndLogin: TLabel;
    dbedtEMail: TDBEdit;
    edtTimeOut: TEdit;
    updTimeOut: TUpDown;
    dbedtEndLogin: TDBEdit;
    tabMenu: TTabSheet;
    lblMenuAltura: TLabel;
    lblMenuLargura: TLabel;
    lblMenuTamFonte: TLabel;
    lblMenuPosX: TLabel;
    lblMenuPosY: TLabel;
    lblMenuDistancia: TLabel;
    lblMenuNomeFonte: TLabel;
    lblMenuCorFonte: TLabel;
    lblMenuCorFonteSel: TLabel;
    lblMenuCorFundo: TLabel;
    lblMenuCorFundoSel: TLabel;
    dbedtMenuAltura: TDBEdit;
    dbedtMenuLargura: TDBEdit;
    dbedtMenuTamFonte: TDBEdit;
    dbedtMenuPosX: TDBEdit;
    dbedtMenuPosY: TDBEdit;
    dbedtMenuDistancia: TDBEdit;
    dbedtMenuNomeFonte: TDBEdit;
    dbedtMenuCorFonte: TDBEdit;
    dbedtMenuCorFonteSel: TDBEdit;
    dbedtMenuCorFundo: TDBEdit;
    dbedtMenuCorFundoSel: TDBEdit;
    btnPadrao: TButton;
    pnlMenuCorFonte: TPanel;
    pnlMenuCorFundo: TPanel;
    pnlMenuCorFonteSel: TPanel;
    pnlMenuCorFundoSel: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    dbEdtIDWebInterface: TwwDBEdit;
    Label2: TLabel;
    dbedtNomeInterface: TwwDBEdit;
    DBCheckDemo: TDBCheckBox;
    DBCheckUsaMenu: TDBCheckBox;
    DBCheckUsaLayers: TDBCheckBox;
    dlgCor: TColorDialog;
    CdsFLGJANELARELAT: TStringField;
    DBCheckJanelaRelat: TDBCheckBox;
    Label3: TLabel;
    dbedDirFisico: TDBEdit;
    CdsDIRFISICO: TStringField;
    ProcuraDirDlg: TProcuraDirDlg;
    spbAbreDir: TSpeedButton;
    procedure pnlMenuCorFonteClick(Sender: TObject);
    procedure pnlMenuCorFonteMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFonteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFundoClick(Sender: TObject);
    procedure pnlMenuCorFundoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFundoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFonteSelClick(Sender: TObject);
    procedure pnlMenuCorFonteSelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFonteSelMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMenuCorFundoSelClick(Sender: TObject);
    procedure pnlMenuCorFundoSelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure edtTimeOutExit(Sender: TObject);
    procedure edtTimeOutKeyPress(Sender: TObject; var Key: Char);
    procedure pnlMenuCorFundoSelMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure dbedtMenuCorFonteExit(Sender: TObject);
    procedure dbedtMenuCorFundoExit(Sender: TObject);
    procedure dbedtMenuCorFonteSelExit(Sender: TObject);
    procedure dbedtMenuCorFundoSelExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedtEndLoginExit(Sender: TObject);
    procedure btnDirClick(Sender: TObject);
    procedure ProcuraDirDlgSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
  private
    { Private declarations }
    WebInterface : TCtrlWebInterface;
    procedure MudaCor( Botao : Tpanel; Campo : TField );
    procedure MsgErro(sMsg: String);
    function Salva: boolean;
    function ConverteCor( sCor : string ) : string;
    procedure SelectAll( idWebInterface : Integer );
    procedure Reset;
  public
    { Public declarations }
  end;

var
  frmCadWebInterface: TfrmCadWebInterface;
  sDirAux : String;

implementation

{$R *.DFM}


function TfrmCadWebInterface.Salva: boolean;
begin
  if not cds.IsEmpty then
  begin
    cds.Edit;
    cdsTIMEOUT.AsInteger := updTimeOut.Position;
    cds.Post;
  end;

  Result := WebInterface.GravaWebInterface;

  if Result then
    SelectAll( CdsIDWEBINTERFACE.AsInteger );
end;


procedure TfrmCadWebInterface.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadWebInterface.MudaCor(Botao: Tpanel; Campo: TField);
var
  sColor : String;
begin
  sColor := Copy( trim( Campo.AsString ), 2, 6 );
  if trim(sColor) = '' then sColor := '000000';
  sColor := ConverteCor( sColor );
  dlgCor.Color := StringToColor( sColor );
  if dlgCor.Execute then
  begin
    if Cds.State <> dsEdit then
      if Cds.IsEmpty then
        Cds.Insert
      else
        Cds.Edit;
    Botao.Color := dlgCor.Color;
    sColor := IntToHex( ColorToRGB( dlgCor.Color ), 6 );
    sColor := Copy( sColor, 5, 2 ) + Copy( sColor, 3, 2 ) + Copy( sColor, 1, 2 );
    Campo.AsString := '#' + sColor;
    Cds.Post;
  end;
end;


procedure TfrmCadWebInterface.pnlMenuCorFonteClick(Sender: TObject);
begin
  inherited;
  MudaCor( pnlMenuCorFonte, CdsMENUCORFONTE );
end;

procedure TfrmCadWebInterface.pnlMenuCorFonteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFonte.BevelOuter := bvLowered;
end;

procedure TfrmCadWebInterface.pnlMenuCorFonteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFonte.BevelOuter := bvRaised;
end;



procedure TfrmCadWebInterface.pnlMenuCorFundoClick(Sender: TObject);
begin
  inherited;
  MudaCor( pnlMenuCorFundo, CdsMENUCORFUNDO );
end;

procedure TfrmCadWebInterface.pnlMenuCorFundoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFundo.BevelOuter := bvLowered;
end;

procedure TfrmCadWebInterface.pnlMenuCorFundoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFundo.BevelOuter := bvRaised;
end;

procedure TfrmCadWebInterface.pnlMenuCorFonteSelClick(Sender: TObject);
begin
  inherited;
  MudaCor( pnlMenuCorFonteSel, CdsMENUCORFONTESEL );
end;

procedure TfrmCadWebInterface.pnlMenuCorFonteSelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFonteSel.BevelOuter := bvLowered;
end;

procedure TfrmCadWebInterface.pnlMenuCorFonteSelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFonteSel.BevelOuter := bvRaised;
end;



procedure TfrmCadWebInterface.pnlMenuCorFundoSelClick(Sender: TObject);
begin
  inherited;
  MudaCor( pnlMenuCorFundoSel, CdsMENUCORFUNDOSEL );
end;



procedure TfrmCadWebInterface.pnlMenuCorFundoSelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFundoSel.BevelOuter := bvLowered;
end;



procedure TfrmCadWebInterface.btnPadraoClick(Sender: TObject);
begin
  inherited;
  if Cds.IsEmpty then
    Cds.Insert
  else
    Cds.Edit;

  CdsMENUALTURA.AsInteger      := 17;
  CdsMENULARGURA.AsInteger     := 160;
  CdsMENUTAMFONTE.AsInteger    := 10;
  CdsMENUPOSX.AsInteger        := 110;
  CdsMENUPOSY.AsInteger        := 105;
  CdsMENUDISTANCIA.AsInteger   := 104;
  CdsMENUNOMEFONTE.AsString    := 'Arial, Helvetica, Sans-Serif';
  CdsMENUCORFONTE.AsString     := '#003366';
  CdsMENUCORFONTESEL.AsString  := '#003366';
  CdsMENUCORFUNDO.AsString     := '#EEEEEE';
  CdsMENUCORFUNDOSEL.AsString  := '#C0C0C0';
  Cds.Post;

  pnlMenuCorFonte.Color    := StringToColor( ConverteCor( CdsMENUCORFONTE.AsString    ) );
  pnlMenuCorFundo.Color    := StringToColor( ConverteCor( CdsMENUCORFUNDO.AsString    ) );
  pnlMenuCorFonteSel.Color := StringToColor( ConverteCor( CdsMENUCORFONTESEL.AsString ) );
  pnlMenuCorFundoSel.Color := StringToColor( ConverteCor( CdsMENUCORFUNDOSEL.AsString ) );
end;



procedure TfrmCadWebInterface.FormCreate(Sender: TObject);
var IdwebAux : integer;
begin
  inherited;
  WebInterface := TCtrlWebInterface.Create;
  WebInterface.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  WebInterface.CdsWebInterface := Cds;
  Cds.CreateDataSet;

  IdwebAux := WebInterface.PegaRegistroUnico;
  if IdwebAux <> -1 then
  begin
    SelectAll( IdwebAux );
    CmeCadastro.Operacao := opIdle;
  end;

end;

procedure TfrmCadWebInterface.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    SelectAll( StrToIntDef( MontaSelect.ValoresChave[0], -1 ) );
end;

procedure TfrmCadWebInterface.FormDestroy(Sender: TObject);
begin
  inherited;
  WebInterface.Free;
end;

procedure TfrmCadWebInterface.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
  if Accept then Reset;
end;

procedure TfrmCadWebInterface.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
   
  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TfrmCadWebInterface.edtTimeOutExit(Sender: TObject);
begin
  inherited;
  if StrToIntDef( edtTimeOut.Text, 0 ) < updTimeOut.Min then
    edtTimeOut.Text := IntToStr( updTimeOut.Min );

  if StrToIntDef( edtTimeOut.Text, 0 ) > updTimeOut.Max then
    edtTimeOut.Text := IntToStr( updTimeOut.Max );
end;

procedure TfrmCadWebInterface.edtTimeOutKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmCadWebInterface.pnlMenuCorFundoSelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlMenuCorFundoSel.BevelOuter := bvRaised;
end;

procedure TfrmCadWebInterface.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsFLGUSAMENU.AsString     := 'N';
  CdsFLGDEMO.AsString        := 'N';
  CdsFLGUSALAYERS.AsString   := 'N';
  CdsFLGJANELARELAT.AsString := 'N';
end;

procedure TfrmCadWebInterface.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadWebInterface.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
  if Accept then Reset;
end;

function TfrmCadWebInterface.ConverteCor(sCor: string): string;
begin
  sCor := trim( sCor );
  if Copy( sCor, 1, 1 ) = '#' then
    Result := '$' + Copy( sCor, 6, 2 ) + Copy( sCor, 4, 2 ) + Copy( sCor, 2, 2 )
  else
    Result := '$000000';
end;

procedure TfrmCadWebInterface.dbedtMenuCorFonteExit(Sender: TObject);
begin
  inherited;
  pnlMenuCorFonte.Color    := StringToColor( ConverteCor( CdsMENUCORFONTE.AsString ) );
end;

procedure TfrmCadWebInterface.dbedtMenuCorFundoExit(Sender: TObject);
begin
  inherited;
  pnlMenuCorFundo.Color    := StringToColor( ConverteCor( CdsMENUCORFUNDO.AsString ) );
end;

procedure TfrmCadWebInterface.dbedtMenuCorFonteSelExit(Sender: TObject);
begin
  inherited;
  pnlMenuCorFonteSel.Color    := StringToColor( ConverteCor( CdsMENUCORFONTESEL.AsString ) );
end;

procedure TfrmCadWebInterface.dbedtMenuCorFundoSelExit(Sender: TObject);
begin
  inherited;
  pnlMenuCorFundoSel.Color    := StringToColor( ConverteCor( CdsMENUCORFUNDOSEL.AsString ) );
end;

procedure TfrmCadWebInterface.Reset;
begin
  pnlMenuCorFonte.Color    := clBlack;
  pnlMenuCorFonteSel.Color := clBlack;
  pnlMenuCorFundo.Color    := clBlack;
  pnlMenuCorFundoSel.Color := clBlack;
  PageControl.ActivePage   := tabGerais;
  edtTimeOut.Text          := '0';
end;

procedure TfrmCadWebInterface.SelectAll(idWebInterface: Integer);
begin
  Cds.Data := WebInterface.SelecionaWebInterface(idWebInterface);
  if not Cds.IsEmpty then
  begin
    updTimeOut.Position      := StrToIntDef( CdsTIMEOUT.AsString, 0 );
    updTimeOut.Refresh;
    edtTimeOut.Text          := CdsTIMEOUT.AsString;
    pnlMenuCorFonte.Color    := StringToColor( ConverteCor( CdsMENUCORFONTE.AsString    ) );
    pnlMenuCorFundo.Color    := StringToColor( ConverteCor( CdsMENUCORFUNDO.AsString    ) );
    pnlMenuCorFonteSel.Color := StringToColor( ConverteCor( CdsMENUCORFONTESEL.AsString ) );
    pnlMenuCorFundoSel.Color := StringToColor( ConverteCor( CdsMENUCORFUNDOSEL.AsString ) );
  end;
end;

procedure TfrmCadWebInterface.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  reset;
end;

procedure TfrmCadWebInterface.dbedtEndLoginExit(Sender: TObject);
var
  sDirTmp : String;
begin
  inherited;
  sDirTmp := trim( dbedtEndLogin.Text );

  if sDirTmp = '' then exit;

  if StrRight( sDirTmp, 1 ) <> '/' then
  begin
    sDirTmp := sDirTmp + '/';
    dbedtEndLogin.Text := sDirTmp;
  end;
end;

procedure TfrmCadWebInterface.btnDirClick(Sender: TObject);
begin
  inherited;
  ProcuraDirDlg.Directory := dbedDirFisico.Text;
  if ProcuraDirDlg.Execute then
    dbedDirFisico.Text := sDirAux;
end;

procedure TfrmCadWebInterface.ProcuraDirDlgSelectionChanged(
  Sender: TObject; Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sDirAux := Path;
end;

end.


