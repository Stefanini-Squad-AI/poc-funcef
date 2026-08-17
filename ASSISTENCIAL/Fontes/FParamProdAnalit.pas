unit FParamProdAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, wwdblook,
  Db, Wwdatsrc, DBTables, Wwquery, TB97, ComCtrls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmParamProdAnalit = class(TCMParamRel)
    dspatro: TwwDataSource;
    dsplanoprev: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBLkpCmbplanass: TwwDBLookupCombo;
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
  frmParamProdAnalit: TfrmParamProdAnalit;

implementation

uses FRelProdAnalit, FRelProd;

{$R *.DFM}

procedure TfrmParamProdAnalit.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmParamProdAnalit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := cafree;
end;

procedure TfrmParamProdAnalit.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  if RadioGroup1.itemindex = 0 then
  begin
    try
       frmRelProdAnalit := TFrmRelProdAnalit.Create(Self );
       frmRelProdAnalit.qr.preview;
    finally
    //frmRelProdAnalit.close;
    end;
  end;
  if RadioGroup1.itemindex = 1 then
  begin
    try
       frmRelProd := TFrmRelProd.Create(Self );
       frmRelProd.qr.preview;
    finally
    //frmRelProd.close;
    end;
  end;
end;

procedure TfrmParamProdAnalit.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if RadioGroup1.itemindex = 0 then
  begin
    try
       frmRelProdAnalit := TFrmRelProdAnalit.Create(Self );
       frmRelProdAnalit.qr.print;
    finally
    //frmRelProdAnalit.close;
    end;
  end;
  if RadioGroup1.itemindex = 1 then
  begin
    try
       frmRelProd := TFrmRelProd.Create(Self );
       frmRelProd.qr.print;
    finally
    //frmRelProd.close;
    end;
  end;
end;

procedure TfrmParamProdAnalit.FormCreate(Sender: TObject);
begin
  inherited;
  RadioGroup1.itemindex := 1 ;
  qryplanass.open;
end;

end.
