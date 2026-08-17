unit FParamGerRecFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, wwdblook,
  Mask, MskEdDlg, Db, Wwdatsrc, DBTables,  Spin, TB97,
  ComCtrls, TB97Tlbr, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmParamGerRecFornserv = class(TCMParamRel)
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrymotivo: TwwQuery;
    dsmotivo: TwwDataSource;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    spin1: TSpinEdit;
    cmb1: TComboBox;
    spin2: TSpinEdit;
    cmb2: TComboBox;
    grpdatacob: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    datacomini: TCMDateTimePicker;
    datacomfim: TCMDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamGerRecFornserv: TfrmParamGerRecFornserv;

implementation

uses FGerRecFornserv;

{$R *.DFM}

procedure TfrmParamGerRecFornserv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamGerRecFornserv.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamGerRecFornserv.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
try
   frmGerRecFornserv := TfrmGerRecFornserv.Create(Self );
   frmGerRecFornserv.qr.preview;
finally
//   frmGerRecFornserv.close;
end;
end;




procedure TfrmParamGerRecFornserv.FormCreate(Sender: TObject);
begin
  inherited;
qryplanass.open;
qrymotivo.open;
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));
end;











procedure TfrmParamGerRecFornserv.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
try
   frmGerRecFornserv := TfrmGerRecFornserv.Create(Self );
   frmGerRecFornserv.qr.print;
finally
//   frmGerRecFornserv.close;
end;
end;


end.
