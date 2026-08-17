unit ListDlg;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, IvDictio, IvMulti;

type
  TListDialog = class(TForm)
    OKBtn: TButton;
    Bevel1: TBevel;
    List: TListBox;
    IvTranslator1: TIvTranslator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  Main;
  
end.
