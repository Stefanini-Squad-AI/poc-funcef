{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit fCMListDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  ActnList, AppEvnts, uCMListDialog;

type
  TFrmCMListDialog = class(TForm)
    LblMessage: TLabel;
    Bevel1: TBevel;
    LbPath: TListBox;
    BtnDown: TSpeedButton;
    BtnUp: TSpeedButton;
    EdtSelPath: TEdit;
    BtnAlterarPath: TButton;
    BtnAdicionarPath: TButton;
    BtnExcluirPath: TButton;
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    FindDir: TProcuraDirDlg;
    ActSelPath: TActionList;
    ActOk: TAction;
    ActCancelar: TAction;
    BtnOpenDlg: TSpeedButton;
    DlgFile: TOpenDialog;
    procedure BtnUpClick(Sender: TObject);
    procedure BtnDownClick(Sender: TObject);
    procedure BtnOpenDlgClick(Sender: TObject);
    procedure BtnExcluirPathClick(Sender: TObject);
    procedure BtnAlterarPathClick(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure ActOkUpdate(Sender: TObject);
    procedure BtnAdicionarPathClick(Sender: TObject);
    procedure LbPathClick(Sender: TObject);
    procedure LbPathMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EdtSelPathChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure BuildList;
    { Private declarations }
  public
    aCmListDialog: TCMListDialog;
  end;

implementation

{$R *.DFM}

procedure TFrmCMListDialog.BtnUpClick(Sender: TObject);
Var
  iIndex :Integer;
  sAux: String;
begin
  iIndex := LbPath.ItemIndex ;

  sAux := LbPath.Items[iIndex - 1];
  LbPath.Items[iIndex - 1] := LbPath.Items[iIndex];
  LbPath.Items[iIndex] := sAux;
  LbPath.ItemIndex := iIndex - 1;
end;

procedure TFrmCMListDialog.BtnDownClick(Sender: TObject);
Var
  iIndex :Integer;
  sAux: String;
begin
  iIndex := LbPath.ItemIndex ;
  sAux := LbPath.Items[iIndex + 1];
  LbPath.Items[iIndex + 1] := LbPath.Items[iIndex];
  LbPath.Items[iIndex] := sAux;
  LbPath.ItemIndex := iIndex + 1;
end;

procedure TFrmCMListDialog.BtnOpenDlgClick(Sender: TObject);
begin
  Case aCMListDialog.ListDialogType Of
    ldtPathList:
       If FindDir.Execute Then
          EdtSelPath.Text := Trim(FindDir.Directory);
    ldtFileList:
       If DlgFile.Execute Then
          EdtSelPath.Text := Trim(DlgFile.FileName);
  End;
end;

procedure TFrmCMListDialog.BtnExcluirPathClick(Sender: TObject);
Var
  iAux: Integer;
begin
  iAux := LbPath.ItemIndex;
  LbPath.Items.Delete(iAux);

  If iAux <= LbPath.Items.Count - 1 Then
     LbPath.ItemIndex := (iAux)
  Else
     LbPath.ItemIndex := (LbPath.Items.Count - 1);
end;

procedure TFrmCMListDialog.BtnAlterarPathClick(Sender: TObject);
begin
  LbPath.Items[LbPath.ItemIndex] := Trim(EdtSelPath.Text);
end;

procedure TFrmCMListDialog.ActCancelarExecute(Sender: TObject);
begin
   ModalResult := MrCancel;
end;

procedure TFrmCMListDialog.ActOkExecute(Sender: TObject);
Var
  X: Integer;
  sAuxPathList: String;
begin
  If (Not aCMListDialog.AllowEmptyList) And (LbPath.Items.Count = 0) Then
    Application.MessageBox(PChar(aCMListDialog.MessageForEmptyList),PChar(Caption),Mb_IconExclamation)
  Else
  Begin
    sAuxPathList := '';                            

    For X:=0 To LbPath.Items.Count - 1 Do
       If (sAuxPathList = '') Then
         sAuxPathList := LbPath.Items[x]
       Else
         sAuxPathList := sAuxPathList + aCMListDialog.ItemSeparator + LbPath.Items[x];

    aCMListDialog.Content := sAuxPathList;

    ModalResult := MrOk;
  End;
end;

procedure TFrmCMListDialog.ActOkUpdate(Sender: TObject);
Var
  bExistePath: Boolean;
begin
  bExistePath := (LbPath.Items.Count > 0);
  BtnUp.Enabled := bExistePath And (LbPath.ItemIndex > 0);
  BtnDown.Enabled := bExistePath And (LbPath.ItemIndex < (LbPath.Items.Count - 1))And (LbPath.ItemIndex > -1);
  BtnAlterarPath.Enabled := bExistePath And (Trim(EdtSelPath.Text) <> '') And (LbPath.ItemIndex > -1);
  BtnAdicionarPath.Enabled := (Trim(EdtSelPath.Text) <> '') And (LbPath.Items.IndexOf(Trim(EdtSelPath.Text)) = -1);
  BtnExcluirPath.Enabled := bExistePath And (LbPath.ItemIndex >= 0);
end;

procedure TFrmCMListDialog.BuildList;
Var
  sAuxPath: String;
  iPos: Integer;
begin
  sAuxPath := aCMListDialog.Content;

  LbPath.Items.Clear;

  While (Trim(sAuxPath) <> '') Do
  Begin
    iPos := Pos(aCMListDialog.ItemSeparator,sAuxPath);

    If iPos = 0 Then
    Begin
       LbPath.Items.Add(sAuxPath);
       sAuxPath := '';
    End
    Else
    Begin
       LbPath.Items.Add(Copy(sAuxPath,1,iPos - 1));
       sAuxPath := Copy(sAuxPath,iPos + 1, Length(sAuxPath));
    End; 
  End;
end;

procedure TFrmCMListDialog.BtnAdicionarPathClick(Sender: TObject);
Var
  Accept: Boolean;
begin
  Accept := True;

  aCMListDialog.ValidateItem(aCMListDialog, EdtSelPath.Text, Accept);

  If Accept Then
     LbPath.Items.Add(Trim(EdtSelPath.Text));
end;

procedure TFrmCMListDialog.LbPathClick(Sender: TObject);
begin
   If (LbPath.ItemIndex > -1) Then
      EdtSelPath.Text := LbPath.Items[LbPath.ItemIndex];
end;

procedure TFrmCMListDialog.LbPathMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
Var
  APoint: TPoint;
  iItem: Integer;
begin
  APoint.x := X;
  APoint.y := Y;

  iItem := LbPath.ItemAtPos(APoint,True);
  If iItem = -1 Then
    LbPath.ShowHint := False
  Else
  Begin
    LbPath.ShowHint := True;
    LbPath.Hint := LbPath.Items[iItem];
  End;
end;

procedure TFrmCMListDialog.EdtSelPathChange(Sender: TObject);
begin
  EdtSelPath.Hint := EdtSelPath.Text;
  EdtSelPath.ShowHint := (EdtSelPath.Text <> '') 
end;

procedure TFrmCMListDialog.FormShow(Sender: TObject);
begin
  LblMessage.Caption := aCMListDialog.Text;
  Caption := aCMListDialog.Caption;
  Font.Assign(aCMListDialog.Font);

  DlgFile.Title := aCMListDialog.Caption;
  DlgFile.Filter := aCMListDialog.FileFilter;
  FindDir.Caption := aCMListDialog.Caption;

  BtnOpenDlg.Visible := (aCMListDialog.ListDialogType <> ldtCustomList);

  BuildList;
end;

end.

