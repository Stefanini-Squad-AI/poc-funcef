//******************************************************************************
// Data     : 28/09/2004
// AL_1
// Motivo   : Nova query e relatório de Saldos de Custódia
//            Reformulação da navegação no form
//******************************************************************************
unit FConsSaldoCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, checklst,   wwdbdatetimepicker, CMDateTimePicker,
  ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, FPreview;

type
  TFrmConsSaldoCust = class(TfrmSairAjuda)
    DsInvestimento: TwwDataSource;
    QryInvestimento: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid: TwwDBGrid;
    Splitter1: TSplitter;
    DBGridIButton: TwwIButton;
    QryCarteira: TwwQuery;
    LkcCarteira: TwwDBLookupCombo;
    LkcInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    Label4: TLabel;
    LkcCustodiante: TwwDBLookupCombo;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryPesquisaBasica: TwwQuery;
    Label6: TLabel;
    qrySaldoCustodia: TwwQuery;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    QryPesquisaBasicaDESCCARTINVEST: TStringField;
    QryPesquisaBasicaSGLCUSTODIANTE: TStringField;
    QryPesquisaBasicaIDLOTE: TStringField;
    QryPesquisaBasicaSALDOBLOQUEADO: TFloatField;
    QryPesquisaBasicaSALDOLIBERADO: TFloatField;
    qrySaldoCustodiaSALDOBLOQUEADO: TFloatField;
    qrySaldoCustodiaSALDOLIBERADO: TFloatField;
    QryPesquisaBasicaIDCARTEIRAINVEST: TFloatField;
    QryPesquisaBasicaIDCUSTODIANTE: TFloatField;
    QryPesquisaBasicaIDINVESTIMENTO: TFloatField;
    DbLkcMotBlq: TwwDBLookupCombo;
    Label5: TLabel;
    qryMotBlq: TwwQuery;
    qryMotBlqSIGLAMOTBLOQ: TStringField;
    qryMotBlqDESCMOTBLOQ: TStringField;
    qryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    edDataIni: TCMDateTimePicker;
    Label3: TLabel;
    DbLkcLote: TwwDBLookupCombo;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LkcInvestimentoExit(Sender: TObject);
    procedure LkcCarteiraExit(Sender: TObject);
    procedure LkcCustodianteExit(Sender: TObject);
    procedure DbLkcMotBlqExit(Sender: TObject);
    procedure DbLkcLoteExit(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataIniCloseUp(Sender: TObject);
    procedure LkcCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure LkcInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure LkcCustodianteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DbLkcMotBlqCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DbLkcLoteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    wRefaz: Boolean;
    procedure RefazQuery;
  public
    { Public declarations }
  end;

var  FrmConsSaldoCust: TFrmConsSaldoCust;
     wCarteira: integer;

implementation

Uses UBibliotecaInvest, UOperComum, FDmRelSaldosCustodia;

{$R *.DFM}

//---------------------------------------------------
// Mostra Formulario
procedure TFrmConsSaldoCust.FormShow(Sender: TObject);
begin
  inherited;
  // Abre Tabelas
  QryCarteira.Open;
  QryInvestimento.Open;
  QryLote.Open;
  QryCustodiante.Open;
  QryMotBlq.Open;
  //AL_1
  OperComum.LimpaParametros(DmRelSaldosCustodia.qrySaldosCustodia);

end;

//---------------------------------------------------
// Fecha Formulario
procedure TFrmConsSaldoCust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Fecha Tabelas
  QryCarteira.Close;
  QryInvestimento.Close;
  //AL_1
  OperComum.LimpaParametros(DmRelSaldosCustodia.qrySaldosCustodia);
  QryLote.Close;
  QryCustodiante.Close;
end;

procedure TFrmConsSaldoCust.FormCreate(Sender: TObject);
begin
  inherited;
  //AL_1
  edDataIni.Date := pRPI.DATAULTFECH;
end;

Procedure TfrmConsSaldoCust.RefazQuery;
var bRefaz: Boolean;
begin
   //AL_1
   with DmRelSaldosCustodia, DmRelSaldosCustodia.qrySaldosCustodia  do
   begin
      bRefaz := False;

      if edDataIni.Text <> ParamByName('DATAMOV').AsString then
      begin
         Close;
         if Trim(edDataIni.Text) <> '' then
            ParamByName('DATAMOV').AsString := edDataIni.Text
         else
            ParamByName('DATAMOV').Clear;
         bRefaz := True;
      end;

      if LkcCarteira.LookupValue <> ParamByName('IDCARTEIRAINVEST').AsString then
      begin
         Close;
         if Trim(LkcCarteira.Text) <> '' then
            ParamByName('IDCARTEIRAINVEST').AsInteger := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger
         else
            ParamByName('IDCARTEIRAINVEST').Clear;
         bRefaz := True;
      end;

      if LkcInvestimento.LookupValue <> ParamByName('IDINVESTIMENTO').AsString then
      begin
         Close;
         if Trim(LkcInvestimento.Text) <> '' then
            ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
         else
            ParamByName('IDINVESTIMENTO').Clear;
         bRefaz := True;
      end;

      if LkcCustodiante.LookupValue <> ParamByName('IDCUSTODIANTE').AsString then
      begin
         Close;
         if Trim(LkcCustodiante.Text) <> '' then
            ParamByName('IDCUSTODIANTE').AsInteger := QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger
         else
            ParamByName('IDCUSTODIANTE').Clear;
         bRefaz := True;
      end;

      if DbLkcLote.LookupValue <> ParamByName('IDLOTE').AsString then
      begin
         Close;
         if Trim(DbLkcLote.Text) <> '' then
            ParamByName('IDLOTE').AsString := QryLote.FieldByName('IDLOTE').AsString
         else
            ParamByName('IDLOTE').Clear;
         bRefaz := True;
      end;

      if (bRefaz) or (not Active) then
         Open;

      if not IsEmpty then
         bbtnImprimir.Enabled := True
      else
         bbtnImprimir.Enabled := False;

   end;
end;

procedure TFrmConsSaldoCust.LkcInvestimentoExit(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.LkcCarteiraExit(Sender: TObject);
begin
   inherited;
   if Trim(LkcCarteira.Text) <> '' then
   begin
      QryInvestimento.Close;
      QryInvestimento.ParamByName('IDCARTEIRAINVEST').Value := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsString;
      QryInvestimento.Open;
   end;
   //AL_1
   RefazQuery;
end;

procedure TFrmConsSaldoCust.LkcCustodianteExit(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.DbLkcMotBlqExit(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.DbLkcLoteExit(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.edDataIniExit(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.edDataIniCloseUp(Sender: TObject);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.LkcCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.LkcInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.LkcCustodianteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.DbLkcMotBlqCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.DbLkcLoteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_1
  RefazQuery;
end;

procedure TFrmConsSaldoCust.bbtnImprimirClick(Sender: TObject);
begin
   //AL_1
   inherited;
   with DmRelSaldosCustodia, DmRelSaldosCustodia.qrySaldosCustodia  do
   begin
      DisableControls;
      lblPeriodo.Caption := edDataIni.Text;
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldosCustodia,
                                     rptSaldosCustodia.PrinterSetup.DocumentName);

      EnableControls;
   end;
end;

end.

