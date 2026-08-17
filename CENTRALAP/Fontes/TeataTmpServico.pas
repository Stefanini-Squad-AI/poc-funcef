unit TeataTmpServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmSairAjuda1 = class(TfrmSairAjuda)
    QRY: TwwQuery;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSairAjuda1: TfrmSairAjuda1;

implementation

{$R *.DFM}

end.
