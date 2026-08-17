unit fuQExport3License;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfmQExport3License = class(TForm)
    reLicense: TRichEdit;
    btnPrint: TButton;
    btnOK: TButton;
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQExport3License: TfmQExport3License;

implementation

{$R *.dfm}

procedure TfmQExport3License.btnPrintClick(Sender: TObject);
begin
  reLicense.Print(Caption);
end;

procedure TfmQExport3License.FormCreate(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if FindResource(HInstance, 'qe_eula', RT_RCDATA) > 0 then
  begin
    resStream := TResourceStream.Create(HInstance, 'qe_eula', RT_RCDATA);
    try
      reLicense.Lines.LoadFromStream(resStream);
    finally
      resStream.Free;
    end;
  end;
end;

end.
