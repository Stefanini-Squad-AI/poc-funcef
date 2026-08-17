unit FConsMovAltCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, FPreview,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Wwdatsrc;

type
  TfrmConsMovAltCestaOpcInd = class(TfrmOkCancelarInv)
    bt_Imprime: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryOrdemOpcInd: TwwQuery;
    qryOrdemOpcIndDESCINVESTIMENTO: TStringField;
    qryOrdemOpcIndDATAORDEM: TDateTimeField;
    qryOrdemOpcIndIDCESTAOPCIND: TFloatField;
    qryOrdemOpcIndIDINVESTIMENTO: TFloatField;
    qryOrdemOpcIndIDTIPOOPERACAO: TFloatField;
    qryOrdemOpcIndIDLOTE: TStringField;
    qryOrdemOpcIndIDBOLETA: TStringField;
    pnlCestaAnterior: TPanel;
    pnlTitCestaAnterior: TPanel;
    dbgTransferencias: TwwDBGrid;
    PnlSelecao: TPanel;
    Label2: TLabel;
    dDbData: TCMDateTimePicker;
    Label1: TLabel;
    dblOpcao: TwwDBLookupCombo;
    QryConsMovAltCestaOpcInd: TwwQuery;
    DsConsMovAltCestaOpcInd: TwwDataSource;
    QryConsMovAltCestaOpcIndIDCESTAOPCIND: TFloatField;
    QryConsMovAltCestaOpcIndDESCINVESTIMENTO: TStringField;
    QryConsMovAltCestaOpcIndSGLCUSTODIANTE: TStringField;
    QryConsMovAltCestaOpcIndIDCUSTODIANTE: TFloatField;
    QryConsMovAltCestaOpcIndIDINVESTIMENTO: TFloatField;
    QryConsMovAltCestaOpcIndIDEMISSOR: TFloatField;
    QryConsMovAltCestaOpcIndIDCARTEIRAINVEST: TFloatField;
    QryConsMovAltCestaOpcIndDESCCARTINVEST: TStringField;
    QryConsMovAltCestaOpcIndQTDANT: TFloatField;
    QryConsMovAltCestaOpcIndQTDATU: TFloatField;
    QryConsMovAltCestaOpcIndDIF: TFloatField;
    QryConsMovAltCestaOpcIndCUSTO: TFloatField;
    QryConsMovAltCestaOpcIndVARIACAO: TFloatField;
    QryConsMovAltCestaOpcIndDESCINVESTIMENTO_1: TStringField;
    BitBtn1: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dDbDataExit(Sender: TObject);
    procedure dblOpcaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMovAltCestaOpcInd: TfrmConsMovAltCestaOpcInd;

implementation

uses FDmRelConsMovAltCestaOpcInd, UDiasUteisInv, UOperacaoInvest,
  UBibliotecaInvest, UOperComum;

{$R *.DFM}

procedure TfrmConsMovAltCestaOpcInd.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsMovAltCestaOpcInd.FormShow(Sender: TObject);
begin
  inherited;

   dDbData.DateTime := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH-1,-1,1,'',True,False,False);

   qryOrdemOpcInd.Close;
   qryOrdemOpcInd.ParamByName('DATAFECHTO').AsString := DateToStr(dDbData.Date);
   qryOrdemOpcInd.Open;

end;

procedure TfrmConsMovAltCestaOpcInd.dDbDataExit(Sender: TObject);
begin
  inherited;
   If Trim(dDbData.Text) <> '' Then
   begin
      qryOrdemOpcInd.Close;
      qryOrdemOpcInd.ParamByName('DATAFECHTO').AsString := DateToStr(dDbData.Date);
      qryOrdemOpcInd.Open;

      OperComum.LimpaParametros(QryConsMovAltCestaOpcInd);
      QryConsMovAltCestaOpcInd.ParamByName('DATAATUAL').AsString      := dDbData.Text;
      If Trim(dblOpcao.LookupValue) <> '' Then
         QryConsMovAltCestaOpcInd.ParamByName('IDCESTAOPCIND').AsInteger := StrToInt(dblOpcao.LookupValue);
      QryConsMovAltCestaOpcInd.Open;
      
   end;
end;

procedure TfrmConsMovAltCestaOpcInd.dblOpcaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   If Trim(dDbData.Text) <> '' Then
   begin
      OperComum.LimpaParametros(QryConsMovAltCestaOpcInd);
      QryConsMovAltCestaOpcInd.ParamByName('DATAATUAL').AsString         := dDbData.Text;
      If Trim(dblOpcao.LookupValue) <> '' Then
         QryConsMovAltCestaOpcInd.ParamByName('IDCESTAOPCIND').AsInteger := StrToInt(dblOpcao.LookupValue);
      QryConsMovAltCestaOpcInd.Open;      
   end;
end;

procedure TfrmConsMovAltCestaOpcInd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   qryOrdemOpcInd.Close;
   QryConsMovAltCestaOpcInd.Close;
end;

procedure TfrmConsMovAltCestaOpcInd.BitBtn1Click(Sender: TObject);
begin
  inherited;
   If Trim(dDbData.Text) <> '' Then
   begin
      QryConsMovAltCestaOpcInd.DisableControls;
      With DmRelConsMovAltCestaOpcInd Do
      begin
         OperComum.LimpaParametros(QryConsMovAltCestaOpcIndSintetico);
         QryConsMovAltCestaOpcIndSintetico.ParamByName('DATAATUAL').AsString      := dDbData.Text;
         If Trim(dblOpcao.LookupValue) <> '' Then
            QryConsMovAltCestaOpcIndSintetico.ParamByName('IDCESTAOPCIND').AsInteger := StrToInt(dblOpcao.LookupValue);
         QryConsMovAltCestaOpcIndSintetico.Open;

         ppLDataMovSintetico.Caption := dDbData.Text;

         TfrmPreview.CreateModalPreview(Application,
                                        ppRConsMovAltCestaOpcIndSintetico,
                                        ppRConsMovAltCestaOpcIndSintetico.PrinterSetup.DocumentName);
      end;
      QryConsMovAltCestaOpcInd.EnableControls;
   end;

end;

procedure TfrmConsMovAltCestaOpcInd.bt_ImprimeClick(Sender: TObject);
begin

  inherited;

   If Trim(dDbData.Text) <> '' Then
   begin
      QryConsMovAltCestaOpcInd.DisableControls;

      OperComum.LimpaParametros(QryConsMovAltCestaOpcInd);
      QryConsMovAltCestaOpcInd.ParamByName('DATAATUAL').AsString         := dDbData.Text;
      If Trim(dblOpcao.Text) <> '' Then
         QryConsMovAltCestaOpcInd.ParamByName('IDCESTAOPCIND').AsInteger := StrToInt(dblOpcao.LookupValue);
      QryConsMovAltCestaOpcInd.Open;

      With DmRelConsMovAltCestaOpcInd Do
      begin
         pplConsMovAltCestaOpcInd.DataSource := DsConsMovAltCestaOpcInd;

         ppLDataMov.Caption := dDbData.Text;

         TfrmPreview.CreateModalPreview(Application,
                                        ppRConsMovAltCestaOpcInd,
                                        ppRConsMovAltCestaOpcInd.PrinterSetup.DocumentName);
      end;

      QryConsMovAltCestaOpcInd.EnableControls;

   end;

end;

end.
