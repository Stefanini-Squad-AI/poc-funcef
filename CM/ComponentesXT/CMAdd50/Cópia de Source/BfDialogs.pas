{*******************************************************************************
   Unit
      uDialogs.pas
   Description:
      Declares the TsBfCustomDialog, the base calss for the dialogs, who want to
         have the ability to be previewed at design time.
      Implements the "property editor" to preview the dialog.
   Versions:
      1.0
	History:
      1.0	- 	somewhere 1997
      			Initial (and, I think, final) release
   Autor(s):
      Dimitry Statilko - dstatus@iname.com, dima@mobitel.com
   Comments:
*******************************************************************************}
unit BfDialogs;

interface

uses Classes, SysUtils, Dialogs, Forms, DsgnIntf;

type
   TsBfCustomDialog = class(TComponent)
   public
      function Execute: Boolean; virtual; abstract;
   end;

   TBfDialogEditor = class(TDefaultEditor)
   public
      procedure ExecuteVerb(Index : Integer); override;
      function GetVerb(Index : Integer): string; override;
      function GetVerbCount : Integer; override;
      procedure Edit; override;
   end;

implementation

uses  BfConsts;


procedure TBfDialogEditor.ExecuteVerb(Index: Integer);
begin
   if Index <> 0 then Exit;
   Edit;
end;

function TBfDialogEditor.GetVerb(Index: Integer): AnsiString;
begin
   Result := STesTDialogEditorCaption;
end;

function TBfDialogEditor.GetVerbCount: Integer;
begin
   Result := 1;
end;

procedure TBfDialogEditor.Edit;
begin
   TsBfCustomDialog(Component).Execute;
end;

end.
