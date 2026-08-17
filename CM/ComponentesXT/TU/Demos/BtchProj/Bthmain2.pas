unit Bthmain2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, TU,
  ExtCtrls, DB, DBTables,
  StatDlg, Errtbdlg, DBIErrs;

type
  TFormBatchAliasMain = class(TForm)
    TUtilityVerReb: TTUtility;
    Panel1: TPanel;
    ButtonFixAll: TButton;
    ListBoxStatus: TListBox;
    ButtonVerifyOnly: TButton;
    ButtonViewErrTable: TButton;
    ButtonSaveLog: TButton;
    ButtonClose: TButton;
    SaveDialogActivityLog: TSaveDialog;
    TUtilityVerOnly: TTUtility;
    ComboBoxTblAlias: TComboBox;
    EditFilePattern: TEdit;
    ListBoxTables: TListBox;
    RadioGroupRebuildOptions: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxBorrowAlias: TComboBox;
    Label5: TLabel;
    ListBoxMissing: TListBox;
    Button1: TButton;
    Label6: TLabel;
    procedure ButtonFixAllClick(Sender: TObject);
    procedure TUtilityVerRebInfoRebuild(Sender: TObject;
      RebuildCBRec: TRebuildCBData);
    procedure TUtilityVerRebInfoVerify(Sender: TObject;
      VerifyCBRec: TVerifyCBData);
    procedure TUtilityRestInfoVerReb(Sender: TObject; AMessage: String;
      Process: TUVerRebProcess; var Abort: Boolean);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonVerifyOnlyClick(Sender: TObject);
    procedure ButtonSaveLogClick(Sender: TObject);
    procedure ButtonViewErrTableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxTblAliasChange(Sender: TObject);
    procedure EditFilePatternChange(Sender: TObject);
    procedure ComboBoxBorrowAliasChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    CurProcess : TUVerRebProcess; {keep track of the rebuild or verify to eliminate screen flash}
    TablesProcessed : Word;
    NotList : Boolean;
    AliasPath,
    AltPath : String[128];
    procedure ZeroGages;
    procedure AssignBatchRec(TU : TTUtility; sList : TStrings; I : Word);
    procedure SendToLog(aMsg : String);
    procedure UpdateStats(TU : TTUtility; BatchList : TStrings);
    procedure DeleteErrorTable;
    function GetAliasPath(TheAlias : String) : String;
    procedure ReDoBorrowList(aNotList : Boolean);
  public
    { Public declarations }
  end;

var
  FormBatchAliasMain: TFormBatchAliasMain;

implementation

{$R *.DFM}

Procedure TFormBatchAliasMain.ZeroGages;
begin
  FormStatus.GaugeHeader.Progress := 0;
  FormStatus.GaugeIndex.Progress := 0;
  FormStatus.GaugeData.Progress := 0;
  FormStatus.GaugeHeaderIdx.Progress := 0;
  FormStatus.GaugeIndexIdx.Progress := 0;
  FormStatus.GaugeDataIdx.Progress := 0;
  FormStatus.GaugeIntegrity.Progress := 0;
  FormStatus.GaugeRebuild.Progress := 0;
  FormStatus.LabelNumPacked.Caption := '';
  FormStatus.LabelNumPacked.refresh;
end;

Procedure TFormBatchAliasMain.AssignBatchRec(TU : TTUtility;
                                             sList : TStrings;
                                             I : Word);
begin
  TU.TableName := '';          { This is a very important cleanup step }
  TU.tBkUpTableName := '';
  TU.TableName      := AliasPath + '\' + sList.Strings[I];
  if fileexists(AltPath + '\' + sList.Strings[I]) then
  begin
    TU.AltStructAlways := True;
    TU.AltStructName  := AltPath + '\' + sList.Strings[I];
  end
  else
  begin
    TU.AltStructAlways := False;
    TU.AltStructName := '';
  end;
end;

Procedure TFormBatchAliasMain.SendToLog(aMsg : String);
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


Procedure TFormBatchAliasMain.UpdateStats(TU : TTUtility; BatchList : TStrings);
Begin
  with FormStatus do
  begin
    LabelStatus.Caption := '';
    LabelNumRecs.Caption         := InttoStr(TU.TblInfo.iRecords);
    LabelRecSize.Caption         := IntToStr(TU.TblInfo.iRecSize);
    LabelNumFields.Caption       := IntToStr(TU.TblInfo.iFields);
    LabelNumAuxPasswords.Caption := IntToStr(TU.TblInfo.iPasswords);
    if TU.TblInfo.bProtected then
      LabelPasswordTF.Caption := 'True'
    else
      LabelPasswordTF.Caption := 'False';
    Inc(TablesProcessed);
    LabelTableOf.Caption := IntToStr(TablesProcessed);

    LabelOfTable.Caption := IntToStr(BatchList.Count);

    GroupBoxTableStats.Refresh;
  end;
end;

procedure TFormBatchAliasMain.DeleteErrorTable;
Var
  ErrTblName : String[255];
begin
  { make sure the error table is not active }
  BtnBottomDlg.TableErrTable.Active := False;
  BtnBottomDlg.TableErrTable.DatabaseName := Session.PrivateDir;
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

procedure TFormBatchAliasMain.ButtonFixAllClick(Sender: TObject);
var
  P1,P2 : TPoint;
  I : Word;
  ProcessList : TListBox;

begin
 If (RadioGroupRebuildOptions.ItemIndex = 1) and
    (ComboBoxBorrowAlias.ItemIndex = -1) then
 begin
   Application.MessageBox('You must select an Database Alias to borrow the structure from.',
              '"Always Borrow Structure" Checked',
               MB_ICONHAND OR MB_OK);
   ComboBoxBorrowAlias.SetFocus;
   exit;
 end;


  ListBoxStatus.Setfocus;
  CurProcess := TURebuilding;
  P1.X := 5;
  P1.Y := 5;
  P2 := ClienttoScreen(P1);
  FormStatus.Left := P2.X;
  FormStatus.Top := P2.Y;
  FormStatus.Show;
  Try
    ZeroGages;
    TablesProcessed := 0;
    If (RadioGroupRebuildOptions.ItemIndex = 1) then
    begin {only do the tables in the AND List}
      ProcessList := ListBoxMissing;
      {make sure it is the AND list}
      ReDoBorrowList(False);
{      TUtilityVerReb.AltStructAlways := True; }
    end
    else
    begin
      ProcessList := ListBoxTables;
{      TUtilityVerReb.AltStructAlways := False; }
    end;

    If ProcessList.Items.Count <= 0 then
    begin
      MessageDlg('No qualified tables in the batch to process.',
                 mtWarning, [mbOK], 0);
      exit;
    end;

    For I := 0 to ProcessList.Items.Count-1 do
    begin
      try
        ProcessList.ItemIndex := I;
        AssignBatchRec(TUtilityVerReb, ProcessList.Items, I);
        UpdateStats(TUtilityVerReb, ProcessList.Items);
        TUtilityVerReb.ExecuteVerifyRebuild;

      except
        {report the error to the log  so it doesn't stop the process}
        on E:Exception do
          SendToLog(E.Message);
      end;
      try
        ZeroGages;
      except
      { report the error to the log  so it doesn't stop the process}
        on E:Exception do
          SendToLog(E.Message);
      end;
    end;
  finally
    sysutils.deletefile(TUtilityVerReb.tErrTableName);
    FormStatus.Hide;
    FormStatus.Refresh;
  end;
end;

procedure TFormBatchAliasMain.TUtilityVerRebInfoRebuild(Sender: TObject;
  RebuildCBRec: TRebuildCBData);
begin
{ NOTE : This is VERRRRY important. DO NOT MAKE ANY DATABASE CALLS FROM
  THIS METHOD. This event is actually part of a BDE Callback response.
  The rules for Callback responses are clear. The BDE is not re-entrant,
  that means that you can not do anything here that would call the BDE.
  So.... No database calls. Just make pictures.}
  with RebuildCBRec do
  begin
    if sMsg = '' then
    begin
      FormStatus.GaugeRebuild.Progress := iPercentDone;
    end
    else
    begin
      FormStatus.LabelNumPacked.Caption := sMsg;
      FormStatus.LabelNumPacked.refresh;
    end;
  end;
end;

procedure TFormBatchAliasMain.TUtilityVerRebInfoVerify(Sender: TObject;
  VerifyCBRec: TVerifyCBData);
begin
{ NOTE : This is VERRRRY important. DO NOT MAKE ANY DATABASE CALLS FROM
  THIS METHOD. This event is actually part of a BDE Callback response.
  The rules for Callback responses are clear. The BDE is not re-entrant,
  that means that you can not do anything here that would call the BDE.
  So.... No database calls. Just make pictures.}
  with VerifyCBRec do
  begin
    Case Process of
      TUVerifyTableName :
        begin
          FormStatus.LabelStatus.Caption := TableName;
          FormStatus.LabelStatus.refresh;
{          FormStatus.GroupBoxVerify.refresh; }
        end;
      TUVerifyHeader    : FormStatus.GaugeHeader.Progress := PercentDone;
      TUVerifyIndex     : FormStatus.GaugeIndex.Progress := PercentDone;
      TUVerifyData      : FormStatus.GaugeData.Progress := PercentDone;
      TUVerifySXHeader  : FormStatus.GaugeHeaderIdx.Progress := PercentDone;
      TUVerifySXIndex   : FormStatus.GaugeIndexIdx.Progress := PercentDone;
      TUVerifySXData    : FormStatus.GaugeDataIdx.Progress := PercentDone;
      TUVerifySXIntegrity :   {the index count and current index is passed by the TUVerifySXIntegrity Process}
        begin
          FormStatus.GaugeIntegrity.Progress := PercentDone;
          FormStatus.LabelZeroOf.Caption := IntToStr(CurrentIndex);
          FormStatus.LabelOfZero.Caption := IntToStr(TotalIndex);
          FormStatus.LabelZeroOf.refresh;
          FormStatus.LabelOfZero.refresh;
        end;
    end; {Case}
  end;
end;

procedure TFormBatchAliasMain.TUtilityRestInfoVerReb(Sender: TObject;
  AMessage: String; Process: TUVerRebProcess; var Abort: Boolean);
begin
  SendToLog(AMessage);
  { use process to highlight the active panal in the status dialog }
  if process <> CurProcess then
  begin
    Case Process of
    TUVerifying  :
      begin
        FormStatus.GroupBoxVerify.Font.Color := clRed;
        FormStatus.GroupBoxRebuild.Font.Color := clBlack;
      end;
    TURebuilding :
      begin
        FormStatus.GroupBoxVerify.Font.Color := clBlack;
        FormStatus.GroupBoxRebuild.Font.Color := clRed;
      end;
    end; {case}
    FormStatus.GroupBoxVerify.refresh;
    FormStatus.GroupBoxRebuild.refresh;
    CurProcess := Process;
  end;
end;

procedure TFormBatchAliasMain.ButtonCloseClick(Sender: TObject);
begin
  DeleteErrorTable;
  Close;
end;

procedure TFormBatchAliasMain.ButtonVerifyOnlyClick(Sender: TObject);
{ There is nothing really special about the ExecuteVerifyRebuild
  method. It just combines the ExecuteVerify and ExecuteRebuild
  into one convient call. The following shows how to just verify all
  the files in the batch}
var
  P1,P2 : TPoint;
  I : Word;
  ProcessList : TListBox;
begin
  ListBoxStatus.Setfocus;
  CurProcess := TURebuilding;
  P1.X := 5;
  P1.Y := 5;
  P2 := ClienttoScreen(P1);
  FormStatus.Left := P2.X;
  FormStatus.Top := P2.Y;
  FormStatus.GroupBoxVerify.Font.Color := clRed;
  TablesProcessed := 0;
  FormStatus.Show;
  FormStatus.Refresh;
  Try
    ZeroGages;
    SendToLog('STARTING VERIFY ONLY PROCESSING OF THE BATCH');
    TUtilityVerOnly.Options := [];
    If (RadioGroupRebuildOptions.ItemIndex = 1) and
       (ComboBoxBorrowAlias.ItemIndex >= 0) then
    begin     {only do the tables in the AND List}
      ProcessList := ListBoxMissing;
      {make sure it is the AND list}
      ReDoBorrowList(False);
    end
    else
      ProcessList := ListBoxTables;
    If ProcessList.Items.Count <= 0 then
    begin
      MessageDlg('No qualified tables in the batch to process.',
                 mtWarning, [mbOK], 0);
      exit;
    end;
    For I := 0 to ProcessList.Items.Count-1 do
    begin
      try
        ProcessList.ItemIndex := I;
        SendToLog('Verifying Table           :' + ProcessList.Items.Strings[I]);
        AssignBatchRec(TUtilityVerOnly, ProcessList.Items, I);
        UpdateStats(TUtilityVerOnly, ProcessList.Items);
        TUtilityVerOnly.ExecuteVerify;
        SendToLog('Verifying Status          : ' +
           IntToStr(TUtilityVerOnly.iErrorLevel));
      except
        {report the error to the log  so it doesn't stop the process}
        on E:Exception do
          SendToLog(E.Message);
      end;
      try
        ZeroGages;
        {now append all errors to the verify only error toble for reporting}
        if fileexists(TUtilityVerOnly.tErrTableName) then
          TUtilityVerOnly.Options := [vTU_Append_Errors];
      except
        {report the error to the log  so it doesn't stop the process}
        on E:Exception do
          SendToLog(E.Message);
      end;
    end;
    ProcessList.ItemIndex := -1;
  finally
    SendToLog('VERIFY ONLY PROCESSING - COMPLETE');
    FormStatus.Hide;
    FormStatus.GroupBoxRebuild.Font.Color := clBlack;
    FormStatus.Refresh;
  end;

end;

procedure TFormBatchAliasMain.ButtonSaveLogClick(Sender: TObject);
begin
   if SaveDialogActivityLog.Execute then
   begin
     ListBoxStatus.Items.SaveToFile(SaveDialogActivityLog.FileName);
     if MessageDlg('Do you want to clear the message log?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        ListBoxStatus.Items.Clear;
   end;
end;

procedure TFormBatchAliasMain.ButtonViewErrTableClick(Sender: TObject);
begin
  BtnBottomDlg.TableErrTable.DatabaseName := Session.PrivateDir;
  BtnBottomDlg.TableErrTable.Active := True;
  BtnBottomDlg.ShowModal;
  { Deactivate Error Table }
  BtnBottomDlg.TableErrTable.Active := False;
end;

procedure TFormBatchAliasMain.FormCreate(Sender: TObject);
begin
  Session.GetDataBaseNames(ComboBoxTblAlias.Items);
  Session.GetDataBaseNames(ComboBoxBorrowAlias.Items);
  NotList := False;
end;

function TFormBatchAliasMain.GetAliasPath(TheAlias : String) : String;
var
  StrList : TStringList;
  I : Word;
begin
  result := '';
  StrList := TStringList.Create;
  Session.GetAliasParams(TheAlias, StrList);
  For I := 0 to StrList.count-1 do
    if pos('PATH=',StrList.Strings[I]) = 1 then
    begin
      result := copy(StrList.Strings[I], 6, 128);
      break;
    end;

  StrList.Free;
end;

procedure TFormBatchAliasMain.ComboBoxTblAliasChange(Sender: TObject);
begin
  with ComboBoxTblAlias do
  begin
    Session.GetTableNames(Items.Strings[ItemIndex], EditFilePattern.Text ,
                           True, False, ListBoxTables.Items);
    if ItemIndex <> -1 then
      AliasPath := GetAliasPath(Items.Strings[ItemIndex]);
  end;
  If ComboBoxBorrowAlias.ItemIndex <> -1 then  ReDoBorrowList(NotList);
end;

procedure TFormBatchAliasMain.EditFilePatternChange(Sender: TObject);
begin
  with ComboBoxTblAlias do
    Session.GetTableNames(Items.Strings[ItemIndex], EditFilePattern.Text ,
                           True, False, ListBoxTables.Items);
  If ComboBoxBorrowAlias.ItemIndex <> -1 then  ReDoBorrowList(NotList);
end;

procedure TFormBatchAliasMain.ReDoBorrowList(aNotList : Boolean);
var
  BorrowAliasTbls : TStringList;
  I : Word;
begin
  if ListBoxTables.items.count = 0 then exit;
  NotList := aNotList;
  ListBoxMissing.Clear;
  {Create a place to put the list of tables in the borrow alias}
  BorrowAliasTbls := TStringList.Create;
  with ComboBoxBorrowAlias do
  begin
    {Get the table names in the alias directory and put them in the temp list}
    Session.GetTableNames(Items.Strings[ItemIndex], EditFilePattern.Text,
      True, False, BorrowAliasTbls);
    If NotList then
    begin
      Label5.Caption := 'Files in Batch NOT found in the Borrow Structure DB';
      Label6.Visible := False;
      {Find all the tables in the batch alias directory that are not in the Borrow from
       alias directory}
      For I := 0 to ListBoxTables.Items.Count - 1 do
         if BorrowAliasTbls.IndexOf(ListBoxTables.Items.Strings[I]) = -1 then
           ListBoxMissing.Items.Add(ListBoxTables.Items.Strings[I]);
    end
    else
    begin
      Label5.Caption := 'Files in Batch AND found in the Borrow Structure DB';
      Label6.Visible := True;
      {Find all the tables in the batch alias directory that are not in the Borrow from
       alias directory}
      For I := 0 to ListBoxTables.Items.Count - 1 do
         if BorrowAliasTbls.IndexOf(ListBoxTables.Items.Strings[I]) > -1 then
           ListBoxMissing.Items.Add(ListBoxTables.Items.Strings[I]);
    end;
    {Get the complete path to the Borrow from alias directory}
    AltPath := GetAliasPath(Items.Strings[ItemIndex]);
    BorrowAliasTbls.Free
  end;

end;

procedure TFormBatchAliasMain.ComboBoxBorrowAliasChange(Sender: TObject);
begin
  if ComboBoxBorrowAlias.ItemIndex <> -1 then
    ReDoBorrowList(NotList);
end;

procedure TFormBatchAliasMain.Button1Click(Sender: TObject);
begin
  ReDoBorrowList(not NotList)
end;

end.


