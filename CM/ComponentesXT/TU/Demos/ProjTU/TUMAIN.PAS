unit Tumain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, ExtCtrls, DbiTypes, DBIErrs,
  DBGrids, DBTables, Tu, VwErrDlg, Rebdlg, Verdlg, Grids;

type
  TFormTUMain = class(TForm)
    Panel1: TPanel;
    GroupBoxSelectTable: TGroupBox;
    OpenDialog1: TOpenDialog;
    EditFileName: TEdit;
    ButtonBrowse: TButton;
    GroupBoxViewInfo: TGroupBox;
    GroupBoxRepairTable: TGroupBox;
    ButtonClose: TButton;
    ButtonHelp: TButton;
    ButtonVerify: TButton;
    ButtonRebuild: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelRecSize: TLabel;
    LabelNumFields: TLabel;
    LabelNumRecs: TLabel;
    LabelNumAuxPasswords: TLabel;
    LabelPasswordTF: TLabel;
    TUtility1: TTUtility;
    VerifyDlg1: TVerifyDlg;
    RebuildDlg1: TRebuildDlg;
    ButtonBorrowStructure: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonBrowseClick(Sender: TObject);
    procedure ButtonBorrowStructureClick(Sender: TObject);
    procedure EditFileNameExit(Sender: TObject);
    procedure ButtonVerifyClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonRebuildClick(Sender: TObject);
  private
    { Private declarations }
    FileStructBorrowed : Boolean;
    procedure EnableButtons(TurnOn : Boolean);
    procedure DeleteErrorTable;
    Procedure ShowTableStats(TblInfoRec : TTableInfo);
  public
    { Public declarations }
  end;

var
  FormTUMain: TFormTUMain;

implementation

{$R *.DFM}

procedure TFormTUMain.FormCreate(Sender: TObject);
begin
  { Make sure the rebuild and verify buttons are greyed to start}
  EnableButtons(False);
end;

procedure TFormTUMain.EnableButtons(TurnOn : Boolean);
begin
  if TurnOn then
  begin
    ButtonBorrowStructure.Enabled := True;
    ButtonVerify.Enabled  := True;
    { Only turn on the Rebuild button if the header is not damaged
      this is a very consertive approach }
    if TUtility1.TblInfo.bValidInfo then
      ButtonRebuild.Enabled := True
    else
      ButtonRebuild.Enabled := False;
  end
  else
  begin
    ButtonVerify.Enabled  := False;
    ButtonRebuild.Enabled := False;
  end;
end;

procedure TFormTUMain.DeleteErrorTable;
Var
  ErrTblName : String;
begin
  { make sure the error table is not active }
  BtnBottomDlg.TableErrTable.Active := False;
  {Make sure the error table name has an extension }
  if extractFileExt(BtnBottomDlg.TableErrTable.TableName) = '' then
    ErrTblName := BtnBottomDlg.TableErrTable.TableName + '.DB'
  else
    ErrTblName := BtnBottomDlg.TableErrTable.TableName;
  {if the error table  does not have a path then assign the private one}
  if extractFilePath(BtnBottomDlg.TableErrTable.TableName) = '' then
    ErrTblName := Session.PrivateDir + '\' + ErrTblName;
  {Now delete the table if it exists}
  if fileexists(ErrTblName) then
    BtnBottomDlg.TableErrTable.DeleteTable;
end;

Procedure TFormTUMain.ShowTableStats(TblInfoRec : TTableInfo);
{ This method desplays useful information about the table being fixed
  on the form }
begin
  {Only change the displayed rec count if it's the table being fixed.
   If this is data from a borrowed structure then leave the rec count
   alone.}
  if not FileStructBorrowed then
    LabelNumRecs.Caption       := InttoStr(TblInfoRec.iRecords);
  LabelRecSize.Caption         := IntToStr(TblInfoRec.iRecSize);
  LabelNumFields.Caption       := IntToStr(TblInfoRec.iFields);
  LabelNumAuxPasswords.Caption := IntToStr(TblInfoRec.iPasswords);
  if TblInfoRec.bProtected then
    LabelPasswordTF.Caption := 'True'
  else
    LabelPasswordTF.Caption := 'False'
end;

procedure TFormTUMain.ButtonBrowseClick(Sender: TObject);
begin
 {Delete the error table so it doesn't show up in the list}
 DeleteErrorTable;
 { reset the FileStructBorrowed flag}
 FileStructBorrowed := False;
 { Display the file selection dialog }
 OpenDialog1.Execute;
 Try
   { Set the TableName Name property for the TUtility to be checked for corruption }
   { If you set things in the following order error checking is complete }
   TUtility1.TableName := OpenDialog1.FileName;
   EditFileName.Text := TUtility1.TableName;
   { Display file stats }
   ShowTableStats(TUtility1.TblInfo);
 Finally
   If FileExists(TUtility1.TableName) then
     {Activate the verify and rebuild buttons Show even if setting Table Erred}
     EnableButtons(true)
   else
     EnableButtons(false);
 end;
end;

procedure TFormTUMain.ButtonBorrowStructureClick(Sender: TObject);
begin
  { Display the file selection dialog }
  OpenDialog1.Execute;
  Try
    { Set AltStructName to the file we borrow the structure from}
    TUtility1.AltStructName := ExpandFileName(OpenDialog1.FileName);
    { Make sure the header for the borrowed structure table is not damaged}
    { Remember that assigning a table to AltStructName automatically
      verifies its header so you can imediately check iErrorLevel}
    If (TUtility1.iErrorLevel > 0) or
       Not(TUtility1.AltTblInfo.bValidInfo) then
    begin
      MessageDlg('The table you choose to borrow the structure from ' +
                 'is probably corrupt. Use a different table!',
                 mtWarning, [mbOk], 0);
      TUtility1.AltStructName := '';
    end
    else
    begin
      {Set the FileStructBorrowed flag }
      FileStructBorrowed := True;
      { enable the Rebuild button }
      ButtonRebuild.Enabled := True;
    end;
  finally
    if not fileexists(TUtility1.AltStructName) then
    begin
      ButtonRebuild.Enabled := False;
      FileStructBorrowed := False;
    end;
    ShowTableStats(TUtility1.AltTblInfo);
  end;
end;

procedure TFormTUMain.EditFileNameExit(Sender: TObject);
begin
 if EditFileName.Text = '' then exit;
 Try
   { Delete the error table if a new table has been selected }
   if ExtractFileName(Tutility1.TableName) <>
      ExtractFileName(EditFileName.Text) then
     DeleteErrorTable;
   { Set the TableName Name property for the TUtility to be checked for corruption }
   TUtility1.TableName := ExpandFileName(EditFileName.Text);
   { Display file stats }
   ShowTableStats(TUtility1.TblInfo);
   {enable the buttons}
   EnableButtons(true);
 Except
   EnableButtons(False);
   raise;
 end;
end;

procedure TFormTUMain.ButtonVerifyClick(Sender: TObject);
begin
  { Delete the ErrorTable if it exists }
  DeleteErrorTable;
  { run the Verify }
  TUtility1.ExecuteVerify;
  { Show completion status messages }
  if TUtility1.ierrorLevel <> 0 then
  begin
    if MessageDlg('The table is corrupt and must be repaired! ' +
                  #10#13 + 'Do you want to view the problems?',
                 mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      { open the table }
      BtnBottomDlg.TableErrTable.DatabaseName := Session.PrivateDir;
      BtnBottomDlg.TableErrTable.Active := True;
      BtnBottomDlg.ShowModal;
      { Deactivate Error Table }
      BtnBottomDlg.TableErrTable.Active := False;
      {Now depending on the situation Show the rebuild button}
      {There is a very high probability an autoerebuild will work if
       the error is 1 or 2 and the bValidInfo field is true}
      If (TUtility1.ierrorLevel < 3) then
        ButtonRebuild.Enabled := True
      else if TUtility1.ierrorLevel = 3 then
         MessageDlg('The cannot be automatically rebuilt.' +
                #10#13 + 'Do you want to view the problems?',
               mtWarning, [mbOK], 0)
      else if (TUtility1.ierrorLevel = 4) then
      begin
        MessageDlg('BAD NEWS! The cannot be rebuilt.' +
                #10#13 + 'Reload from backups.',
               mtInformation, [mbOK], 0);
        ButtonBorrowStructure.Enabled := False;
      end;
    end;
  end
  else {everythings cool}
  begin
    MessageDlg('GOOD NEWS!' + #10#13 + 'Header and Data are O.K.',
                 mtInformation, [mbOK], 0);
  end;
end;

procedure TFormTUMain.ButtonCloseClick(Sender: TObject);
begin
  {clean up when the app ends by deleting the error table}
  DeleteErrorTable;
  close;
end;

procedure TFormTUMain.ButtonRebuildClick(Sender: TObject);
var
  pTableDesc : pCRTblDesc;
begin
  {Hold on to your hats}
  { Determine if and where to get the table structure information }
  { ** Situation #1 : Go for the autorebuild }
  If (TUtility1.iErrorLevel < 3) and not(FileStructBorrowed) then
    pTableDesc := TUtility1.pCurrentTblDesc {get the automatic table description}
  { ** Situation #2 : Specify the file structure your self}
  else if (TUtility1.iErrorLevel < 4) and FileStructBorrowed then
    {In this case you must roll your own Table description}
    { select an alternate file by simulating a Borrow Structure button click}
    pTableDesc := TUtility1.pAltTblDesc {get the alternate table description}
  else { ** Situation #3 : A Real Bummer }
  begin
    MessageDlg('BAD NEWS! The cannot be rebuilt.' + #10#13 +
               'Reload from backups.',  mtInformation, [mbOK], 0);
    exit;               {Can't rebuild so Bail out }
  end;
  { Here's where the rebuild actually happens }
  Tutility1.ExecuteRebuild(pTableDesc);
  MessageDlg('Table Successfully rebuild!', mtInformation, [mbOK], 0);
end;

end.

