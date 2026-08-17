unit fcampospararegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls,uglobal, Db, Wwdatsrc, DBTables, Wwquery,
  Buttons;

type
  TfrmCamposParaRegra = class(TForm)
    QRYREGRA: TwwQuery;
    DSREGRA: TwwDataSource;
    UPDSQLREGRA: TUpdateSQL;
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    rg1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCamposParaRegra: TfrmCamposParaRegra;
  IDREGRA:longint;
implementation

uses fCadRegra;

{$R *.DFM}

procedure TfrmCamposParaRegra.Button1Click(Sender: TObject);
begin
  TemQry := rg1.itemindex;
  close;
end;

procedure TfrmCamposParaRegra.Button2Click(Sender: TObject);
begin
   TemQry := -1;
   close;
end;

end.
