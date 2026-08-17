unit FParamRelFornserv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, DBCtrls,
  Mask, MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, TB97, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmParamRelFornserv = class(TCMParamRel)
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBCMBPATRO: TwwDBLookupCombo;
    DBLkpCmbplanass: TwwDBLookupCombo;
    cmMaskEditDlg1: TcmMaskEditDlg;
    GroupBox2: TGroupBox;
    DBCheckBox1: TCheckBox;
    DBCheckBox4: TCheckBox;
    DBCheckBox2: TCheckBox;
    DBCheckBox3: TCheckBox;
    DBCheckBox5: TCheckBox;
    DBCheckBox6: TCheckBox;
    DBCheckBox8: TCheckBox;
    DBCheckBox9: TCheckBox;
    DBCheckBox7: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelFornserv: TfrmParamRelFornserv;

implementation

uses FRelFornservAnalit, FRelFornServ;

{$R *.DFM}

procedure TfrmParamRelFornserv.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamRelFornserv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamRelFornserv.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
if RadioGroup1.itemindex = 0 then
begin
try
   frmRelFornservAnalit := TfrmRelFornservAnalit.Create(Self );
   frmRelFornservAnalit.qr.preview;
finally
//   frmRelFornservAnalit.close;
end;
end;
if RadioGroup1.itemindex = 1 then
begin
try
   frmRelFornserv := TFrmRelFornserv.Create(Self );
   frmRelFornserv.qr.preview;
finally
//   frmRelFornserv.close;
end;
end;

end;









procedure TfrmParamRelFornserv.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
if RadioGroup1.itemindex = 0 then
begin
try
   frmRelFornservAnalit := TfrmRelFornservAnalit.Create(Self );
   frmRelFornservAnalit.qr.print;
finally
 //  frmRelFornservAnalit.close;
 //  frmRelFornservAnalit := nil;
end;
end;
if RadioGroup1.itemindex = 1 then
begin
try
   frmRelFornserv := TFrmRelFornserv.Create(Self );
   frmRelFornserv.qr.print;
finally
//   frmRelFornserv.close;
//   frmRelFornserv := nil;
end;
end;
end;

procedure TfrmParamRelFornserv.FormCreate(Sender: TObject);
begin
  inherited;
RadioGroup1.itemindex := 1;
qrypatro.open;
//qryplanoprev.open;
qryplanass.open;

end;











end.
