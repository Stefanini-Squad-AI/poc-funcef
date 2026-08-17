unit uProcuraDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, BrowseFolder;

type
  TProcuraDirDlg = class(TsBrowseFolderDialog)
  private
  protected
  public
    Function BuscaDir: Boolean;
  published
    property Caption;
    property Directory;
    property Folder;
    property Options;
    property ShowPath;
    property Title;
    property OnInitialized;
    property OnSelectionChanged;
  end;


implementation

function TProcuraDirDlg.BuscaDir: Boolean;
var
  sDir: string;
begin
  sDir := Self.Directory;
  BrowseDirectory(sDir,Self.Caption);
  if sDir <> Self.Directory then
  begin
     Self.Directory := sDir;
     Result := True
  end else
     Result := False;
end;

end.
