//*******************************************************************//
//                                                                   //
//       Developer Express Visual Component Library                  //
//       ExpressGrid MemData Demo                                    //
//                                                                   //
//       Copyright (c) 1998 Developer Express Inc.                   //
//       ALL RIGHTS RESERVED                                         //
//*******************************************************************//

unit tellmore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TForm4 = class(TForm)
    RichEdit: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.DFM}

procedure TForm4.FormCreate(Sender: TObject);
begin
  RichEdit.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\about.rtf');
end;

end.
