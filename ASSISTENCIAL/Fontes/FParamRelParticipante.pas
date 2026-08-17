unit FParamRelParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Mask,
  MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, TB97,  TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  ComCtrls;

type
  TfrmParamRelParticipante = class(TCMParamRel)
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    dsplanoprev: TwwDataSource;
    qryplanoprev: TwwQuery;
    qrysit: TwwQuery;
    dssit: TwwDataSource;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    Label3: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    DBCMBPLANO: TwwDBLookupCombo;
    DBLkpCmbplanass: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ednumero: TEdit;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    dblkpcmbSituacao: TwwDBLookupCombo;
    dlgdataadm: TCMDateTimePicker;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmbfilialEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelParticipante: TfrmParamRelParticipante;

implementation

uses FRelParticAnalit;

{$R *.DFM}

procedure TfrmParamRelParticipante.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
try
   frmRelParticAnalit := TfrmRelParticAnalit.Create(Self );
   frmRelParticAnalit.qr.preview;
finally
end;
end;

procedure TfrmParamRelParticipante.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
try
   frmRelParticAnalit := TfrmRelParticAnalit.Create(Self );
   frmRelParticAnalit.qr.print;
finally
end;
end;

procedure TfrmParamRelParticipante.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamRelParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;


procedure TfrmParamRelParticipante.FormCreate(Sender: TObject);
begin
  inherited;
qrypatro.open;
qryplanoprev.open;
qryplanass.open;
qrysit.open;
end;



procedure TfrmParamRelParticipante.cmbfilialEnter(Sender: TObject);
begin
  inherited;
if not qryfilial.active then qryfilial.open;
end;

end.
