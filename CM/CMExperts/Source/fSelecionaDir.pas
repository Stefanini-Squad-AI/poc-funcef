unit fSelecionaDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, TB97, CmDock, ActnList, BfDialogs,
  BrowseFolder, uProcuraDir;

type
  TFrmSelecionaDir = class(TForm)
    pnlFundo: TPanel;
    LblPath: TLabel;
    LbPath: TListBox;
    SbtnDown: TSpeedButton;
    SbtnUp: TSpeedButton;
    SbtnAdd: TSpeedButton;
    SbtnDel: TSpeedButton;
    CMOkCancelar1: TCMOkCancelar;
    FindDir: TProcuraDirDlg;
    procedure SbtnDelClick(Sender: TObject);
    procedure SbtnAddClick(Sender: TObject);
    procedure SbtnUpClick(Sender: TObject);
    procedure SbtnDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionaDir: TFrmSelecionaDir;

implementation

{$R *.DFM}

procedure TFrmSelecionaDir.SbtnDelClick(Sender: TObject);
begin
  LbPath.Items.Delete(LbPath.ItemIndex);
end;

procedure TFrmSelecionaDir.SbtnAddClick(Sender: TObject);
begin
  If FindDir.Execute Then
     LbPath.Items.Add(FindDir.Directory);
end;

procedure TFrmSelecionaDir.SbtnUpClick(Sender: TObject);
Var
  iOldIndex :Integer;
begin
  iOldIndex := LbPath.ItemIndex ;
  LbPath.Items.Insert(iOldIndex - 1,LbPath.Items[iOldIndex]);
  LbPath.Items.Delete(iOldIndex + 1);
  LbPath.Selected[(iOldIndex - 1)] := True;
end;

procedure TFrmSelecionaDir.SbtnDownClick(Sender: TObject);
Var
  iOldIndex :Integer;
begin
  iOldIndex := LbPath.ItemIndex ;
  LbPath.Items.Insert(iOldIndex + 2,LbPath.Items[iOldIndex]);
  LbPath.Items.Delete(iOldIndex);
  LbPath.Selected[(iOldIndex - 1)] := True;
end;

end.
