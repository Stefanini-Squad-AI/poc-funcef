unit IvTargD;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  IvMulti, ExtCtrls;

type
  TIvTargetPropertyDialog = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    ClassLabel: TLabel;
    PropertyLabel: TLabel;
    ClassNameEdit: TEdit;
    PropertyNameEdit: TEdit;
    HelpButton: TButton;
    TypeRadio: TRadioGroup;
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);

  private
    FExclusiveComponent: Boolean;

  public
    procedure SetItem(value: TIvTargetProperty);

    property ExclusiveComponent: Boolean read FExclusiveComponent write FExclusiveComponent;
  end;

implementation

{$R *.DFM}

uses
  IvDictio;
  
procedure TIvTargetPropertyDialog.SetItem(value: TIvTargetProperty);
begin
  ClassNameEdit.Text := value.TargetClassName;
  PropertyNameEdit.Text := value.TargetPropertyName;
  TypeRadio.ItemIndex := Integer(value.TargetType);
end;

procedure TIvTargetPropertyDialog.HelpButtonClick(Sender: TObject);
begin
{$IFDEF WIN32}
  WinHelp(
    Handle,
    PChar(GetMLRegistryValue('RootDir', '') + '\docs\ivmulti.hlp'),
    HELP_CONTEXT,
    20001);
{$ENDIF}
end;

procedure TIvTargetPropertyDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult <> idOK then
    CanClose := True
  else
  begin
    if (ClassNameEdit.Text = '') and (PropertyNameEdit.Text = '') then
    begin
      MessageDlg(
        'Can not add an empty target',
        mtError,
        [mbOK],
        0);
      CanClose := False;
    end
    else if (TypeRadio.ItemIndex = 1) and (ClassNameEdit.Text = '') and FExclusiveComponent then
    begin
      MessageDlg(
        'You must give the class/component name for an exclusive target',
        mtError,
        [mbOK],
        0);
      CanClose := False;
    end
    else
      CanClose := True;
  end;
end;

procedure TIvTargetPropertyDialog.FormCreate(Sender: TObject);
begin
{$IFNDEF WIN32}
  HelpButton.Hide;
{$ENDIF}
  FExclusiveComponent := True;
end;

end.
