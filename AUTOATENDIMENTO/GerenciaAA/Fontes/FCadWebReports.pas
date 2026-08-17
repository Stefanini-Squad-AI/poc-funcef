unit FCadWebReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, MontaSelect, Db, DBClient, DBCtrls,
  uCMClientDataSet, uCmTypes, dBaseDados, uSistema, 
  uCtrlWebInterface, uCtrlWebReports, uCtrlReports, uCtrlWebTpReports;

type
  TfrmCadWebReports = class(TfrmOkCancelar)
    lblRelatorio: TLabel;
    cmbRelatorio: TComboBox;
    rgFlgReportType: TRadioGroup;
    tbsHTML: TTabSheet;
    tbsReportGenerator: TTabSheet;
    edtHTMLFile: TEdit;
    PageControl: TPageControl;
    lblHTMLFile: TLabel;
    btnHTMLFile: TSpeedButton;
    dlgHTMLFile: TOpenDialog;
    lblDataView: TLabel;
    edtDataView: TEdit;
    btnDataView: TSpeedButton;
    msDataView: TMontaSelect;
    lblReport: TLabel;
    edtReport: TEdit;
    btnReport: TSpeedButton;
    msReport: TMontaSelect;
    cdsWebReports: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    cdsInterface: TCMClientDataSet;
    cdsInterfaceIDWEBINTERFACE: TFloatField;
    cdsInterfaceNOMEINTERFACE: TStringField;
    cdsInterfaceENDLOGIN: TStringField;
    cdsInterfaceEMAIL: TStringField;
    cdsInterfaceTIMEOUT: TFloatField;
    cdsInterfaceMENUALTURA: TFloatField;
    cdsInterfaceMENULARGURA: TFloatField;
    cdsInterfaceMENUTAMFONTE: TFloatField;
    cdsInterfaceMENUPOSX: TFloatField;
    cdsInterfaceMENUPOSY: TFloatField;
    cdsInterfaceMENUDISTANCIA: TFloatField;
    cdsInterfaceMENUNOMEFONTE: TStringField;
    cdsInterfaceMENUCORFONTE: TStringField;
    cdsInterfaceMENUCORFONTESEL: TStringField;
    cdsInterfaceMENUCORFUNDO: TStringField;
    cdsInterfaceMENUCORFUNDOSEL: TStringField;
    cdsInterfaceFLGUSAMENU: TStringField;
    cdsInterfaceFLGUSALAYERS: TStringField;
    cdsInterfaceFLGDEMO: TStringField;
    cdsInterfaceFLGJANELARELAT: TStringField;
    dtsInterface: TDataSource;
    lblInterface: TLabel;
    dblkpInterface: TDBLookupComboBox;
    cdsWebTpReports: TCMClientDataSet;
    cdsWebTpReportsIDWEBREPORTS: TFloatField;
    cdsWebTpReportsFLGTIPO: TFloatField;
    cdsWebTpReportsDESCRICAO: TStringField;
    dsWebTpReports: TDataSource;
    dblkpWebTpReports: TDBLookupComboBox;
    procedure bbtnCancelarClick(Sender: TObject);
    //procedure cmbRelatorioClick(Sender: TObject);
    procedure rgFlgReportTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHTMLFileClick(Sender: TObject);
    procedure btnDataViewClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpInterfaceClick(Sender: TObject);
    procedure dblkpWebTpReportsClick(Sender: TObject);
  private
    WebReports : TCtrlWebReports;
    WebInterface : TCtrlWebInterface;
    WebTpReports : TCtrlWebTpReports;
    Reports : TCtrlReports;

    iIdDataView, iOrigemCMDV : integer;
    iIdReports, iOrigemCM : integer;

    procedure SelecionaRelatorio;
    procedure Reset;

    function RetornaId( iIndex : integer ) : integer;
    function RetornaIndex( iId : integer ) : integer;

    procedure MsgErro ( sMsg : String );        
  public
    { Public declarations }
  end;

var
  frmCadWebReports: TfrmCadWebReports;

implementation

{$R *.DFM}

procedure TfrmCadWebReports.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadWebReports.SelecionaRelatorio;
var
  iRepAnt, iIntAnt, iReport : integer;
begin
  //Pendência 19090
  iRepAnt := dblkpWebTpReports.KeyValue;
  iIntAnt := dblkpInterface.KeyValue;
  Reset;

  dblkpWebTpReports.KeyValue := iRepAnt;
  dblkpInterface.KeyValue := iIntAnt;

  iReport := RetornaId( dblkpWebTpReports.KeyValue );
  //Fim Pendência 19090

  rgFlgReportType.Enabled := True;
  PageControl.Enabled     := True;

  //Relatórios que não utilizam queries dinâmicas
  edtDataView.Enabled := ( ( iReport = 1 ) or ( iReport = 4 ) );
  //Pendência 19090
  btnDataView.Enabled := not ( ( iReport = 2 ) or ( iReport = 3 ) );
  //Fim Pendência 19090

  //Pendência 19090 - 09/07/2007 - Padrão 16
  if ( cdsWebTpReportsFLGTIPO.AsInteger > 0 ) then begin
     rgFlgReportType.ItemIndex := 1;
     rgFlgReportType.Enabled   := false;
  end else
     rgFlgReportType.Enabled   := true;

  cdsWebReports.Close;
  cdsWebReports.Data := WebReports.SelecionaWebReports( iReport, cdsInterfaceIDWEBINTERFACE.AsInteger );

  if cdsWebReports.IsEmpty then
  begin
    cdsWebReports.Insert;
  end
  else
  begin

    rgFlgReportType.ItemIndex := cdsWebReports.FieldByName('FLGREPORTTYPE').AsInteger - 1;

    if rgFlgReportType.ItemIndex = 0 then
    begin
      iIdDataView      := cdsWebReports.FieldByName('IDDATAVIEW').AsInteger;
      iOrigemCMDV      := cdsWebReports.FieldByName('ORIGEMCMDV').AsInteger;

      edtHTMLFile.Text := cdsWebReports.FieldByName('HTMLFILE').AsString;

      cdsAux.Close;
      cdsAux.Data := Reports.SelecionaDataView( iIdDataView, iOrigemCMDV );
      edtDataView.Text := cdsAux.FieldByName('NAME').AsString;
      cdsAux.Close;
    end
    else
    begin
      iIdReports := cdsWebReports.FieldByName('IDREPORTS').AsInteger;
      iOrigemCM  := cdsWebReports.FieldByName('ORIGEMCM').AsInteger;

      cdsAux.Close;
      cdsAux.Data := Reports.SelecionaReports( iIdReports, iOrigemCM );
      edtReport.Text := cdsAux.FieldByName('NAME').AsString;
      cdsAux.Close;
    end;

    cdsWebReports.Edit;    
  end;

end;

procedure TfrmCadWebReports.rgFlgReportTypeClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := PageControl.Pages[ rgFlgReportType.ItemIndex ];
end;

procedure TfrmCadWebReports.Reset;
var
  i : integer;
begin
  cdsWebReports.Close;

  //Pendência 19090
  dblkpWebTpReports.KeyValue:= -1;
  //Fim Pendência 19090
  dblkpInterface.KeyValue   := -1;
  rgFlgReportType.ItemIndex := -1;

  PageControl.ActivePage := nil;

  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;

  rgFlgReportType.Enabled := False;
  PageControl.Enabled     := False;

  edtDataView.Text := '';
  edtHTMLFile.Text := '';
  edtReport.Text   := '';

  iIdDataView := 0;
  iOrigemCMDV := 0;
  iIdReports  := 0;
  iOrigemCM   := 0;
end;

procedure TfrmCadWebReports.FormCreate(Sender: TObject);
begin
  inherited;

  WebReports := TCtrlWebReports.Create;
  WebReports.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  WebReports.CdsWebReports := cdsWebReports;

  Reports := TCtrlReports.Create;
  Reports.InitializeAs( WebReports );

  WebInterface   := TCtrlWebInterface.Create;
  WebInterface.InitializeAs( WebReports );

  //Preenche lookup de interface
  cdsInterface.Data := WebInterface.SelecionaTodos;
  if cdsInterface.IsEmpty then
  begin
    ShowMessage( 'Não há nenhuma interface cadastrada.' );
    Close;
  end;

  //Pendência 19090
  WebTpReports := TCtrlWebTpReports.Create;
  WebTpReports.InitializeAs( WebReports );
  cdsWebTpReports.Data := WebTpReports.SelecionaTodos;
  //Fim Pendência 19090

  Reset;
end;

procedure TfrmCadWebReports.btnHTMLFileClick(Sender: TObject);
begin
  inherited;
  if dlgHTMLFile.Execute then
    edtHTMLFile.Text := dlgHTMLFile.FileName;
end;

procedure TfrmCadWebReports.btnDataViewClick(Sender: TObject);
begin
  inherited;
  msDataView.Executar;
  if msDataView.RetornouValor then
  begin
    edtDataView.Text := msDataView.ValoresChave[0];
    iIdDataView      := StrToInt( msDataView.ValoresChave[1] );
    iOrigemCMDV      := StrToInt( msDataView.ValoresChave[2] );
  end;
end;

procedure TfrmCadWebReports.btnReportClick(Sender: TObject);
begin
  inherited;
  msReport.Executar;
  if msReport.RetornouValor then
  begin
    edtReport.Text := msReport.ValoresChave[0];
    iIdReports     := StrToInt( msReport.ValoresChave[1] );
    iOrigemCM      := StrToInt( msReport.ValoresChave[2] );
  end;
end;

function TfrmCadWebReports.RetornaId(iIndex: integer): integer;
begin
  //Pendência 19090
  Result := dblkpWebTpReports.KeyValue;
  //Fim Pendência 19090

end;

function TfrmCadWebReports.RetornaIndex(iId: integer): integer;
begin
  //Pendência 19090
  Result := iId-1;
  //Fim Pendência 19090

end;

procedure TfrmCadWebReports.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadWebReports.FormDestroy(Sender: TObject);
begin
  inherited;
  WebReports.Free;
  Reports.Free;
end;

procedure TfrmCadWebReports.bbtnConfirmarClick(Sender: TObject);
var
  iReport, iInterface : integer;
begin
  inherited;

  //Pendência 19090
  if dblkpWebTpReports.Text = '' then
  begin
    ShowMessage('O campo "Relatório" deve ser preenchido.' );
    dblkpWebTpReports.SetFocus;
    exit;
  end;
  //Fim Pendência 19090

  if dblkpInterface.Text = '' then
  begin
    ShowMessage('O campo "Interface" deve ser preenchido.' );
    dblkpInterface.SetFocus;
    exit;
  end;

  if rgFlgReportType.ItemIndex = -1 then
  begin
    ShowMessage('O Tipo de Relatório deve ser especificado.' );
    rgFlgReportType.SetFocus;
    exit;
  end;


  //Pendência 19090
  iReport    := RetornaId( cdsWebTpReportsIDWEBREPORTS.AsInteger );
  //Fim Pendência 19090
  iInterface := cdsInterfaceIDWEBINTERFACE.AsInteger;

  if rgFlgReportType.ItemIndex = 0 then
  begin

    //Pendência 19090
    if   ( not iReport in [ 2, 3 ] )
    //Fim Pendência 19090
     and ( iIdDataView = 0  ) then
    begin
      ShowMessage('O campo "DataView" deve ser preenchido.' );
      edtDataView.SetFocus;
      exit;
    end;

    if trim( edtHTMLFile.Text ) = '' then
    begin
      ShowMessage('O campo "Arquivo HTML" deve ser preenchido.' );
      edtHTMLFile.SetFocus;
      exit;
    end;

  end
  else
  begin

    if iIdReports = 0 then
    begin
      ShowMessage('O campo "Template" deve ser preenchido.' );
      edtReport.SetFocus;
      exit;
    end;

  end;

  cdsWebReports.FieldByName('IDWEBREPORTS').AsInteger   := iReport;
  cdsWebReports.FieldByName('IDWEBINTERFACE').AsInteger := iInterface;
  cdsWebReports.FieldByName('FLGREPORTTYPE').AsInteger  := rgFlgReportType.ItemIndex + 1;

  if rgFlgReportType.ItemIndex = 0 then
  begin
    cdsWebReports.FieldByName('IDDATAVIEW').AsInteger := iIdDataView;
    cdsWebReports.FieldByName('ORIGEMCMDV').AsInteger := iOrigemCMDV;
    cdsWebReports.FieldByName('HTMLFILE').AsString    := trim( edtHTMLFile.Text );
    cdsWebReports.FieldByName('IDREPORTS').Clear;
    cdsWebReports.FieldByName('ORIGEMCM').Clear;
  end
  else
  begin
    cdsWebReports.FieldByName('IDDATAVIEW').Clear;
    cdsWebReports.FieldByName('ORIGEMCMDV').Clear;
    cdsWebReports.FieldByName('HTMLFILE').Clear;
    cdsWebReports.FieldByName('IDREPORTS').AsInteger  := iIdReports;
    cdsWebReports.FieldByName('ORIGEMCM').AsInteger   := iOrigemCM;
  end;

  cdsWebReports.Post;

  if WebReports.GravaWebReports then
  begin
    ShowMessage('Relatório salvo com sucesso.');
    Reset;
    //Pendência 19090
    dblkpWebTpReports.KeyValue := RetornaIndex( iReport );
    //Fim Pendência 19090
    dblkpInterface.KeyValue := iInterface;
    SelecionaRelatorio;
  end;

end;

procedure TfrmCadWebReports.dblkpInterfaceClick(Sender: TObject);
begin
  inherited;
  //Pendência 19090
  if ( ( dblkpWebTpReports.Text <> '' ) and ( dblkpInterface.Text <> '' ) ) then
  //Fim Pendência 19090
    SelecionaRelatorio;
end;

//Pendência 19090 - 09/07/2007 - Padrão 16
procedure TfrmCadWebReports.dblkpWebTpReportsClick(Sender: TObject);
begin
  inherited;
  if ( ( dblkpWebTpReports.Text <> '' ) and ( dblkpInterface.Text <> '' ) ) then
    SelecionaRelatorio;
end;
//Fim Pendência 19090

end.
