unit FParamRelParticAnalist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Mask,
  MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, TB97, TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  ComCtrls;

type
  TfrmParamRelParticAnalist = class(TCMParamRel)
    qrypatro: TwwQuery;
    qryplanoprev: TwwQuery;
    dspatro: TwwDataSource;
    dsplanoprev: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
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
    Label13: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    edmat: TEdit;
    ednome: TEdit;
    dblkpcmbSituacao: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    ednumero: TEdit;
    date3: TCMDateTimePicker;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryfilial: TwwQuery;
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
  frmParamRelParticAnalist: TfrmParamRelParticAnalist;

implementation

uses FRelParticAnalit, FRelParticipante;

{$R *.DFM}

procedure TfrmParamRelParticAnalist.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamRelParticAnalist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamRelParticAnalist.FormCreate(Sender: TObject);
begin
  inherited;
RadioGroup1.itemindex := 1;
qrypatro.open;
qryplanoprev.open;
qryplanass.open;
qrysit.open;


end;







procedure TfrmParamRelParticAnalist.cmbfilialEnter(Sender: TObject);
begin
  inherited;
if not qryfilial.active then qryfilial.open;
end;

end.
