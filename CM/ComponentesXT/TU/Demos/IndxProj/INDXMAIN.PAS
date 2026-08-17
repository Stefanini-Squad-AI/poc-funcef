unit Indxmain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Tuidx, DB, DBTables, Rebdlg, Verdlg, TRepDlg;

type
  TFormIndxProjMain = class(TForm)
    IdxUtl1: TIdxUtl;
    OpenDialog1: TOpenDialog;
    ButtonBrowse: TButton;
    EditFileName: TEdit;
    ListBoxStatus: TListBox;
    ButtonCheckIndexes: TButton;
    ButtonRegenIndexes: TButton;
    RepairDialog1: TRepairDialog;
    procedure ButtonBrowseClick(Sender: TObject);
    procedure EditFileNameExit(Sender: TObject);
    procedure ButtonCheckIndexesClick(Sender: TObject);
    procedure IdxUtl1InfoIdxCheck(Sender: TObject; IndexName: String;
      IsUptoDate: Boolean);
    procedure ButtonRegenIndexesClick(Sender: TObject);
    procedure IdxUtl1InfoIdxRegen(Sender: TObject; IndexName: String;
      IsUptoDate: Boolean; var Skip: Boolean);
  private
    { Private declarations }
    Procedure SendToLog(aMsg : String);
  public
    { Public declarations }
  end;

var
  FormIndxProjMain: TFormIndxProjMain;

implementation

{$R *.DFM}

Procedure TFormIndxProjMain.SendToLog(aMsg : String);
begin
  With ListBoxStatus do
  begin
    Items.Add(AMsg);
    { This next bit scrolls the text so the most recent msg is visible}
    if (ItemHeight * Items.count) > Height then
      TopIndex:= Items.count - (Height div ItemHeight) ;
  end;
  ListBoxStatus.Refresh;
end;

procedure TFormIndxProjMain.ButtonBrowseClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    { Set the TableName Name property for the TIdxUtl to be checked }
    IdxUtl1.TableName := OpenDialog1.FileName;
    EditFileName.Text := IdxUtl1.TableName;
  end;
end;

procedure TFormIndxProjMain.EditFileNameExit(Sender: TObject);
begin
 if EditFileName.Text = '' then exit;
 { Set the TableName Name property for the TUtility to be checked for corruption }
 IdxUtl1.TableName := ExpandFileName(EditFileName.Text);
end;

procedure TFormIndxProjMain.ButtonCheckIndexesClick(Sender: TObject);
begin
  if not IdxUtl1.CheckIndexes then
    MessageDlg('Existem indíces desatualizados que precisam ser regerados.',
                 mtWarning, [mbOk], 0);
end;

procedure TFormIndxProjMain.IdxUtl1InfoIdxCheck(Sender: TObject;
  IndexName: String; IsUptoDate: Boolean);
begin
  if IsUptoDate then
    SendToLog('O Índice ' + IndexName + ' está atualizado.')
  else
    SendToLog('O Índice ' + Uppercase(IndexName) + ' está desatualizado.');
end;

procedure TFormIndxProjMain.ButtonRegenIndexesClick(Sender: TObject);
begin
  IdxUtl1. RegenIndex;
end;

procedure TFormIndxProjMain.IdxUtl1InfoIdxRegen(Sender: TObject;
  IndexName: String; IsUptoDate: Boolean; var Skip: Boolean);
begin
  if IsUptoDate then
  begin
    if MessageDlg('O índice ' + IndexName + ' não está desatualizado, você quer regerálo mesmo assim?',
                 mtInformation, [mbYes,mbNo], 0) = mrYes then
    begin
      Skip := False;
      SendToLog(IndexName + ' foi regerado.');
    end
    else
    begin
      Skip := True;  {this line is not necessary cause Skip is true by default}
      SendToLog(IndexName + ' não está desatualizado e não foi regerado.');
    end;
  end
  else
  begin
    Skip := False; {this line is not necessary cause Skip is false by default}
    SendToLog(IndexName + ' foi regerado.');
  end;
end;

end.
