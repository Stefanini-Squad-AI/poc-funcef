unit FParamGerUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, wwdblook,
  Mask, MskEdDlg, Db, Wwdatsrc, DBTables,TB97, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamGerUtil = class(TCMParamRel)
    dspatro: TwwDataSource;
    qrypatro: TwwQuery;
    qrytpservass: TwwQuery;
    dstpservass: TwwDataSource;
    qryplano: TwwQuery;
    dsplano: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    TabSheet1: TTabSheet;
    pnlPesquisa: TPanel;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    DBCMBPLANO: TwwDBLookupCombo;
    DBLkpCmbplanass: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    grpData: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    date1: TCMDateTimePicker;
    date2: TCMDateTimePicker;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    ednumero: TEdit;
    date3: TCMDateTimePicker;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamGerUtil: TfrmParamGerUtil;

implementation

uses FGerUtil;

{$R *.DFM}

procedure TfrmParamGerUtil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamGerUtil.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamGerUtil.rbtnVisualizarClick(Sender: TObject);
begin

try
   frmGerUtil := TfrmGerUtil.Create(Self );
   inherited;
   frmGerUtil.qr.preview;
finally
end;
end;

procedure TfrmParamGerUtil.rbtnImprimirClick(Sender: TObject);
begin
try
   frmGerUtil := TfrmGerUtil.Create(Self);
   inherited;
   frmGerUtil.qr.print;
finally
end;
end;

procedure TfrmParamGerUtil.FormCreate(Sender: TObject);
begin
  inherited;
  qrypatro.open;
  qryplano.open;
  qryplanass.open;
  qrytpservass.open;
end;









procedure TfrmParamGerUtil.cmbfilialEnter(Sender: TObject);
begin
  inherited;
if not qryfilial.active then qryfilial.open;
end;

end.
