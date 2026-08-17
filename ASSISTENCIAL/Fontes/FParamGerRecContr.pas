unit FParamGerRecContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Mask,
  MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Spin, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, Wwquery;

type
  TfrmParamGerRecContr = class(TCMParamRel)
    dspatro: TwwDataSource;
    qrypatro: TwwQuery;
    qrysitpart: TwwQuery;
    dssitpart: TwwDataSource;
    qryplano: TwwQuery;
    dsplano: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    TabSheet1: TTabSheet;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cmb1: TComboBox;
    cmb2: TComboBox;
    spin1: TSpinEdit;
    spin2: TSpinEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    Label3: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    DBLkpCmbplanass: TwwDBLookupCombo;
    DBCMBPLANO: TwwDBLookupCombo;
    rdgpagador: TRadioGroup;
    Label2: TLabel;
    cmbsituacao: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    ednumero: TEdit;
    dateedpart: TCMDateTimePicker;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    qryfilial: TwwQuery;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrytitBeforeOpen(DataSet: TDataSet);
    procedure qryplanoprevAfterScroll(DataSet: TDataSet);
    procedure qrypatroAfterScroll(DataSet: TDataSet);
    procedure qryplanassAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbdependClick(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamGerRecContr: TfrmParamGerRecContr;

implementation

uses FGerRecContr;

{$R *.DFM}

procedure TfrmParamGerRecContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamGerRecContr.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamGerRecContr.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
try
   frmGerRecContr := TfrmGerRecContr.Create(Self );
   frmGerRecContr.qr.preview;
finally
//   frmGerRecContr.close;
end;
end;

procedure TfrmParamGerRecContr.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
try
   frmGerRecContr := TfrmGerRecContr.Create(Self );
   frmGerRecContr.qr.print;
finally
//   frmGerRecContr.close;
end;
end;














procedure TfrmParamGerRecContr.FormCreate(Sender: TObject);
begin
  inherited;
qrypatro.open;
qryplano.open;
qryplanass.open;
qrysitpart.open;
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));

end;

procedure TfrmParamGerRecContr.qrytitBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
//qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
//qrytit.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmParamGerRecContr.qryplanoprevAfterScroll(DataSet: TDataSet);
begin
  inherited;
{if qrytit.active = true then
begin
   qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
   qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
   qrytit.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;}
end;

procedure TfrmParamGerRecContr.qrypatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
{if qrytit.active = true then
begin
   qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
   qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
   qrytit.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;}
end;

procedure TfrmParamGerRecContr.qryplanassAfterScroll(DataSet: TDataSet);
begin
  inherited;
{if qrytit.active = true then
begin
   qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
   qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
   qrytit.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;}
end;

procedure TfrmParamGerRecContr.dblkpcmbdependClick(Sender: TObject);
begin
  inherited;
//qrytit.open;
end;




procedure TfrmParamGerRecContr.cmbfilialEnter(Sender: TObject);
begin
  inherited;
if not qryfilial.active then qryfilial.open;
end;

end.
