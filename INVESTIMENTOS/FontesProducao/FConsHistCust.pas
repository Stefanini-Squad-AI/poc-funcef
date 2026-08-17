unit FConsHistCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, checklst, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmConsHistCust = class(TfrmSairAjuda)
    DsInvestimento: TwwDataSource;
    QryInvestimento: TwwQuery;
    DsHistorico: TwwDataSource;
    RadioGroup1: TRadioGroup;
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
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    Label4: TLabel;
    LkcCustodiante: TwwDBLookupCombo;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryHistorico: TwwQuery;
    QryPesquisaBasica: TwwQuery;
    QryPesquisaBasicaIDCUSTODIA: TFloatField;
    QryPesquisaBasicaIDOPERACAOINVEST: TFloatField;
    QryPesquisaBasicaIDCARTEIRAINVEST: TFloatField;
    QryPesquisaBasicaIDINVESTIMENTO: TFloatField;
    QryPesquisaBasicaIDCUSTODIANTE: TFloatField;
    QryPesquisaBasicaDATAMOVCUSTOD: TDateTimeField;
    QryPesquisaBasicaQTDEMOVCUSTOD: TFloatField;
    QryPesquisaBasicaSALDOLIBERADO: TFloatField;
    QryPesquisaBasicaSALDOBLOQUEADO: TFloatField;
    QryPesquisaBasicaFLGCALCSALDO: TStringField;
    QryPesquisaBasicaIDLOTE: TStringField;
    QryPesquisaBasicaTIPOCUSTODIA: TStringField;
    QryHistoricoIDCUSTODIA: TFloatField;
    QryHistoricoIDOPERACAOINVEST: TFloatField;
    QryHistoricoIDCARTEIRAINVEST: TFloatField;
    QryHistoricoIDINVESTIMENTO: TFloatField;
    QryHistoricoIDCUSTODIANTE: TFloatField;
    QryHistoricoDATAMOVCUSTOD: TDateTimeField;
    QryHistoricoQTDEMOVCUSTOD: TFloatField;
    QryHistoricoSALDOLIBERADO: TFloatField;
    QryHistoricoSALDOBLOQUEADO: TFloatField;
    QryHistoricoFLGCALCSALDO: TStringField;
    QryHistoricoIDLOTE: TStringField;
    QryHistoricoTIPOCUSTODIA: TStringField;
    QryHistoricoDESCTIPOOPERACAO: TStringField;
    QryPesquisaBasicaDESCTIPOOPERACAO: TStringField;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label8: TLabel;
    edDataFim: TCMDateTimePicker;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    Label5: TLabel;
    CkLstTpSaldo: TCheckListBox;
    Label7: TLabel;
    DbLkcMotBlq: TwwDBLookupCombo;
    qryMotBlq: TwwQuery;
    qryMotBlqSIGLAMOTBLOQ: TStringField;
    qryMotBlqDESCMOTBLOQ: TStringField;
    qryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
    QryHistoricoSIGLACMOTBLOQ: TStringField;
    QryHistoricoIDMOTIVOBLOQUEIO: TFloatField;
    QryPesquisaBasicaIDMOTIVOBLOQUEIO: TFloatField;
    QryPesquisaBasicaSIGLACMOTBLOQ: TStringField;
    DbLkcLote: TwwDBLookupCombo;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CkLstTpSaldoClick(Sender: TObject);
    procedure LkcCarteiraExit(Sender: TObject);
    procedure LkcInvestimentoExit(Sender: TObject);
    procedure LkcCustodianteExit(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure DbLkcLoteExit(Sender: TObject);
    procedure DbLkcMotBlqExit(Sender: TObject);
  private
    { Private declarations }
    procedure RefazQuery;
  public
    { Public declarations }
  end;

var
  FrmConsHistCust: TFrmConsHistCust;

implementation

Uses UBibliotecaInvest;

{$R *.DFM}

procedure TFrmConsHistCust.FormShow(Sender: TObject);
begin
  inherited;

  QryCarteira.Open;
  QryInvestimento.Open;
  QryLote.Open;
  QryCustodiante.Open;
  QryMotBlq.Open;
  QryHistorico.Close;

  QryHistorico.Sql.Text:= QryPesquisaBasica.Sql.GetText+'ORDER BY HIS.DATAMOVCUSTOD DESC, HIS.IDCUSTODIA DESC ';
  
// Preenche o Paramento
  QryHistorico.ParamByName('IDINVESTIMENTO').AsInteger  :=
    QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
  QryHistorico.ParamByName('IDCARTEIRAINVEST').AsInteger:=
    QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
  QryHistorico.ParamByName('IDCUSTODIANTE').AsInteger:=
    QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
  QryHistorico.Open;

  LkcCarteira.Text     := QryCarteira['DESCCARTINVEST'];
  LkcInvestimento.Text := QryInvestimento['DESCINVESTIMENTO'];
  LkcCustodiante.Text  := QryCustodiante.FieldByName('SGLCUSTODIANTE').AsString;
end;

procedure TFrmConsHistCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCarteira.Close;
  QryInvestimento.Close;
  QryHistorico.Close;
  QryLote.Close;
  QryCustodiante.Close;
  QryMotBlq.Close;
end;

procedure TFrmConsHistCust.RadioGroup1Click(Sender: TObject);
Var
  wSQL:String;
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistCust.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date-60;
  edDataFim.Date := Date;
end;

Procedure TfrmConsHistCust.RefazQuery;
var
  bPrimeiro : boolean;
  sSQL : string;
  I : integer;
Begin
  bPrimeiro := true;

  QryHistorico.Close;
  QryHistorico.Sql.Text:= QryPesquisaBasica.Sql.GetText;

  If DbLkcLote.Text<>'' Then Begin
    QryHistorico.Sql.Text := QryHistorico.Sql.Text+
      ' AND HIS.IDLOTE = '+QuotedStr(DbLkcLote.Value)+' ';
    End;

  If DbLkcMotBlq.Text <> '' Then
    QryHistorico.Sql.Text := QryHistorico.Sql.Text+
      ' AND HIS.IDMOTIVOBLOQUEIO = '+QuotedStr(DbLkcMotBlq.LookupValue)+' ';

  If trim(edDataIni.Text) <> '' Then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' AND (HIS.DATAMOVCUSTOD >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ';

  If trim(edDataFim.Text) <> '' Then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text +
      ' AND (HIS.DATAMOVCUSTOD <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')) ';

// Tipo de Saldo
  For I:=0 To (CkLstTpSaldo.Items.Count-1) Do
  Begin
// Caso Checado inclui filtro em HistCustodia
    If CkLstTpSaldo.Checked[I] Then
    Begin

      if bPrimeiro then
      begin
        sSQL := ' AND (';
        bPrimeiro := false;
      end else
        sSQL := ' OR ';

      Case I of
         0: sSQL := sSQL + ' (HIS.IDMOTIVOBLOQUEIO =  -1) ';
         1: sSQL := sSQL + ' (HIS.IDMOTIVOBLOQUEIO <> -1) ';
      end;

      QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + sSQL;

    End;
  End;

  if not bPrimeiro then
    QryHistorico.Sql.Text:=  QryHistorico.Sql.Text + ' ) ';

  If RadioGroup1.ItemIndex = 0 Then
    QryHistorico.Sql.Text := QryHistorico.Sql.Text+
      ' ORDER BY HIS.DATAMOVCUSTOD DESC, HIS.IDCUSTODIA DESC '
  Else
    QryHistorico.Sql.Text := QryHistorico.Sql.Text+
      ' ORDER BY HIS.DATAMOVCUSTOD, HIS.IDCUSTODIA ';

// Preenche o Paramento
  QryHistorico.ParamByName('IDINVESTIMENTO').AsInteger  :=
    QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
  QryHistorico.ParamByName('IDCARTEIRAINVEST').AsInteger:=
    QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
  QryHistorico.ParamByName('IDCUSTODIANTE').AsInteger:=
    QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
  QryHistorico.Open;
end;

procedure TFrmConsHistCust.CkLstTpSaldoClick(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistCust.LkcCarteiraExit(Sender: TObject);
begin
  inherited;
  LkcCarteira.Text:=QryCarteira['DESCCARTINVEST'];
  RefazQuery;
end;

procedure TFrmConsHistCust.LkcInvestimentoExit(Sender: TObject);
begin
  inherited;
  LkcInvestimento.Text:=QryInvestimento['DESCINVESTIMENTO'];
  RefazQuery;
end;

procedure TFrmConsHistCust.LkcCustodianteExit(Sender: TObject);
begin
  inherited;
  LkcCustodiante.Text  := QryCustodiante.FieldByName('SGLCUSTODIANTE').AsString;
  RefazQuery;
end;

procedure TFrmConsHistCust.edDataIniExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistCust.edDataFimExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistCust.DbLkcLoteExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

procedure TFrmConsHistCust.DbLkcMotBlqExit(Sender: TObject);
begin
  inherited;
  RefazQuery;
end;

end.

