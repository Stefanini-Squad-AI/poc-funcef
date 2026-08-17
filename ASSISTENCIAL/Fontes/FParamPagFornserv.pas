unit FParamPagFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, wwdbedit,
  Mask, MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Spin,
  TB97, ComCtrls, TB97Tlbr, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmParamPagFornserv = class(TCMParamRel)
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrymotivo: TwwQuery;
    dsmotivo: TwwDataSource;
    TabSheet1: TTabSheet;
    pnlPesquisa: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    grpData: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    spin1: TSpinEdit;
    cmb1: TComboBox;
    spin2: TSpinEdit;
    cmb2: TComboBox;
    grpdatacob: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Datapagini: TCMDateTimePicker;
    datapagfim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPagFornserv: TfrmParamPagFornserv;

implementation

uses FGerPagFornserv;

{$R *.DFM}

procedure TfrmParamPagFornserv.FormCreate(Sender: TObject);
begin
  inherited;
qryplanass.open;
qrymotivo.open;
spin1.value := strtoint(copy(datetostr(date),7,4));
spin2.value := strtoint(copy(datetostr(date),7,4));
end;

procedure TfrmParamPagFornserv.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamPagFornserv.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
try
   frmGerPagFornserv := TFrmGerPagFornserv.Create(Self );
   frmGerPagFornserv.qr.preview;
finally
//   frmGerPagFornserv.close;
end;
end;

procedure TfrmParamPagFornserv.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
try
   frmGerPagFornserv := TFrmGerPagFornserv.Create(Self );
   frmGerPagFornserv.qr.print;
finally
//   frmGerPagFornserv.close;
end;
end;

procedure TfrmParamPagFornserv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;


















end.
