unit FParamGerPagPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Mask,
  MskEdDlg, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, TB97, ComCtrls;

type
  TfrmParamGerPagPatro = class(TCMParamRel)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
    cmMaskEditDlg1: TcmMaskEditDlg;
    cmMaskEditDlg2: TcmMaskEditDlg;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label10: TLabel;
    cmMaskEditDlg3: TcmMaskEditDlg;
    cmMaskEditDlg4: TcmMaskEditDlg;
    cmMaskEditDlg5: TcmMaskEditDlg;
    cmMaskEditDlg6: TcmMaskEditDlg;
    qryforn: TwwQuery;
    qrymotivo: TwwQuery;
    dspatro: TwwDataSource;
    dsmotivo: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamGerPagPatro: TfrmParamGerPagPatro;

implementation

uses FGerPagPatro;

{$R *.DFM}

procedure TfrmParamGerPagPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 action := cafree;
end;

procedure TfrmParamGerPagPatro.bbtnFecharClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmParamGerPagPatro.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
try
   frmGerPagPatro := TfrmGerPagPatro.Create(Application );
   frmGerPagPatro.qr.preview;
finally
   frmGerPagPatro.free;
   frmGerPagPatro := nil;
end;
end;

procedure TfrmParamGerPagPatro.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
try
   frmGerPagPatro := TfrmGerPagPatro.Create(Application );
   frmGerPagPatro.qr.print
finally
   frmGerPagPatro.free;
   frmGerPagPatro := nil;
end;
end;


















procedure TfrmParamGerPagPatro.FormCreate(Sender: TObject);
begin
  inherited;
qryforn.open;
qryplanass.open;
end;

end.
