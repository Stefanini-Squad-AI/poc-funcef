unit FImportPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
//  Fimport,
  OpenArqText, Db, Wwdatsrc, DBTables, Wwquery, StdCtrls,
  ComCtrls, wwdblook, MAHlpBtn, Buttons,  ExtCtrls, TB97,fImport ,
  IvEMulti, TB97Tlbr;

type
  TfrmImportPart = class(TfrmImport)
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportPart: TfrmImportPart;

implementation

{$R *.DFM}

procedure TfrmImportPart.bbtnSairClick(Sender: TObject);
begin
//inherited;
close;
end;

end.
