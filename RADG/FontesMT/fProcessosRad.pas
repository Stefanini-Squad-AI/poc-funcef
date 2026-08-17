unit fProcessosRad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, wwdbedit, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, fConsultaDocMT, usistema, fPropAprovaRAD;

type
  TfrmProcessosRad = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CMSqlParams1: TCMSqlParams;
    cdsRad: TCMClientDataSet;
    dtsRAD: TwwDataSource;
    SqlObjRad: TCMSqlParams;
    CdsObjRad: TCMClientDataSet;
    pnlProcessos: TPanel;
    Panel7: TPanel;
    cdsRadIDPROCESSO: TFloatField;
    cdsRadDATAINIPROCESSO: TDateTimeField;
    cdsRadDATAFIMPREV: TDateTimeField;
    cdsRadNOME: TStringField;
    cdsRadVLRPROC: TFloatField;
    cdsRadOBS: TStringField;
    cdsRadNOMEETAPA: TStringField;
    cdsRadDATAINIETAPA: TDateTimeField;
    Splitter2: TSplitter;
    Panel8: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel6: TPanel;
    CheckBox4: TCheckBox;
    Panel5: TPanel;
    CheckBox3: TCheckBox;
    Panel4: TPanel;
    CheckBox2: TCheckBox;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    Panel9: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Panel10: TPanel;
    DBMemo1: TDBMemo;
    Panel11: TPanel;
    DBNavigator1: TDBNavigator;
    Panel12: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    pnlSub: TPanel;
    cdsRadDATAPROGRAMADA: TDateTimeField;
    cdsRadFORNECEDOR: TStringField;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    TabSheet3: TTabSheet;
    Panel15: TPanel;
    Label12: TLabel;
    DsImagem: TwwDataSource;
    CdsImagem: TCMClientDataSet;
    SqlImagem: TCMSqlParams;
    CdsProc: TCMClientDataSet;
    CdsVerifUsr: TCMClientDataSet;
    SqlVerifUsr: TCMSqlParams;
    SqlProc: TCMSqlParams;
    dsEtapa: TwwDataSource;
    dsAut: TwwDataSource;
    CdsAut: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    CdsEtapaNOMETAPA: TStringField;
    CdsEtapaDATAINIETAPA: TDateTimeField;
    CdsEtapaDATAFIMPREV: TDateTimeField;
    CdsEtapaDATAFIMETAPA: TDateTimeField;
    CdsEtapaIDETAPA: TFloatField;
    SqlEtapa: TCMSqlParams;
    SqlAut: TCMSqlParams;
    Panel13: TPanel;
    Splitter1: TSplitter;
    Panel14: TPanel;
    Panel16: TPanel;
    Splitter3: TSplitter;
    plnBem: TPanel;
    memOBS: TDBMemo;
    CdsAutDATAAUTORIZACAO: TDateTimeField;
    CdsAutNOMEUSUARIO: TStringField;
    CdsAutSTATUS: TStringField;
    CdsAutOBSAUTORIZA: TMemoField;
    CdsAutIDETAPA: TFloatField;
    Panel17: TPanel;
    GrdEtapa: TwwDBGrid;
    Panel18: TPanel;
    Panel19: TPanel;
    GrdAut: TwwDBGrid;
    Panel20: TPanel;
    DBNavigator2: TDBNavigator;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    wwDBEdit3: TwwDBEdit;
    Panel21: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    DBEdit9: TDBEdit;
    wwDBEdit6: TwwDBEdit;
    BitBtn1: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    cdsRadNOMEUSUARIO: TStringField;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    procedure PageControl1Change(Sender: TObject);
    procedure wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure cdsRadAfterOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsEtapaAfterScroll(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    frmConsultaDocMT : TfrmConsultaDocMT;
  public
    { Public declarations }
  end;

var
  frmProcessosRad: TfrmProcessosRad;
  frmPropAprovaRAD: TfrmPropAprovaRAD;

implementation

{$R *.DFM}

procedure TfrmProcessosRad.PageControl1Change(Sender: TObject);
begin

  if PageControl1.ActivePage = TabSheet2 then
  begin

    pnlSub.Visible := False;
    Sistema.IdRad := cdsRad.FieldByName ('IDPROCESSO').AsInteger;
    frmConsultaDocMT := TfrmConsultaDocMT.Create( Self );
    frmConsultaDocMT.Parent := pnlSub;
    frmConsultaDocMT.Dock971.Visible := false;
    frmConsultaDocMT.FormStyle := fsNormal;
    frmConsultaDocMT.WindowState := wsMaximized;
    frmConsultaDocMT.BorderStyle := bsNone;
    frmConsultaDocMT.bbtnSeleciona.Enabled := False;
    frmConsultaDocMT.Show;
    pnlSub.Visible := True;

  end
  else
  begin              
    if frmConsultaDocMT <> nil then
      FreeAndNil( frmConsultaDocMT );

    if PageControl1.ActivePage = TabSheet3 then
    begin
      cdsAut.Filtered := False;
      cdsAut.Filter := 'IDETAPA = ' + CdsEtapaIDETAPA.AsString;
      cdsAut.Filtered := True;
    end; 

  end;

  inherited;
end;

procedure TfrmProcessosRad.wwDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;

  if not wwDBGrid1.IsSelected then
  begin
    wwDBGrid1.Canvas.Font.Color := clBlack;

    if cdsRad.RecNo <= 2 then
      wwDBGrid1.Canvas.Brush.Color := $00B7DBFF
    else if ( cdsRad.RecNo >= 3 ) and ( cdsRad.RecNo <= 5 ) then
      wwDBGrid1.Canvas.Brush.Color := $00DFFFDF
    else if cdsRad.RecNo = 6  then
      wwDBGrid1.Canvas.Brush.Color := $00FFFFDF
    else
      wwDBGrid1.Canvas.Brush.Color := $00D7FFFF;

    wwDBGrid1.DefaultDrawDataCell( Rect, Field, State );
  end;

end;

procedure TfrmProcessosRad.cdsRadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsRad.First;
  wwDBGrid1.SelectRecord;
end;

procedure TfrmProcessosRad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ShowMessage( 'Confirma operação?' );  
end;

procedure TfrmProcessosRad.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try
    frmPropAprovaRAD.iTipoOperacao := 1;
    frmPropAprovaRAD.bConclui := ( cdsRad.RecNo < 10 );
    if frmPropAprovaRAD.ShowModal = mrOk then
    begin
      ShowMessage( 'Processos aprovados.' );
    end;
  finally
    FreeAndNil( frmPropAprovaRAD );
  end;
end;

procedure TfrmProcessosRad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try
    frmPropAprovaRAD.iTipoOperacao := 2;
    if frmPropAprovaRAD.ShowModal = mrOk then
    begin
      ShowMessage( 'Processos aprovados.' );
    end;
  finally
    FreeAndNil( frmPropAprovaRAD );
  end;
end;


procedure TfrmProcessosRad.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  frmPropAprovaRAD := TfrmPropAprovaRAD.Create( Self );
  try
    frmPropAprovaRAD.iTipoOperacao := 3;
    if frmPropAprovaRAD.ShowModal = mrOk then
    begin
      ShowMessage( 'Processos recusados.' );
    end;
  finally
    FreeAndNil( frmPropAprovaRAD );
  end;
end;

procedure TfrmProcessosRad.CdsEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cdsAut.Filtered := False;
  cdsAut.Filter := 'IDETAPA = ' + CdsEtapaIDETAPA.AsString;
  cdsAut.Filtered := True;
end;

procedure TfrmProcessosRad.FormResize(Sender: TObject);
begin
  inherited;
  cdsAut.Filtered := True;
end;

end.
