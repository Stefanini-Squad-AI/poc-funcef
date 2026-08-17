unit fCMAppWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TB97, CmDock, ActnList, ExptIntf, editIntf, FCmDialog,
  IvDictio, IvMulti, IvEMulti, ExtCtrls;

type
  TfrmCMAppWiz = class(TFrmCmDialog)
    Label1: TLabel;
    edIDModulo: TEdit;
    Label2: TLabel;
    edNomeDPR: TEdit;
    Label3: TLabel;
    edAppTitle: TEdit;
    AclDialog: TActionList;
    ActOk: TAction;
    ActCancelar: TAction;
    procedure actOKExecute
    (Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure edIDModuloKeyPress(Sender: TObject; var Key: Char);
  private
  public
    class function Execute(var IdModulo: Integer; var NomeDPR, TituloApp: string): Boolean;
  end;

var
  frmCMAppWiz: TfrmCMAppWiz;

implementation

{$R *.DFM}
uses
  FileCtrl, FSM_FxLib, CMAppWizConsts;

procedure TfrmCMAppWiz.actOKExecute(Sender: TObject);

begin
  ModalResult := idok;
end;

procedure TfrmCMAppWiz.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := (Trim(edNomeDPR.Text) <> '') and (edIDModulo.Text <> '');
end;

class function TfrmCMAppWiz.Execute(var IdModulo: Integer; var NomeDPR, TituloApp: string): Boolean;
begin
  with Self.Create(nil) do
    try
      Result := ShowModal = idOK;
      if Result then
      begin
        IdModulo := StrToIntDef(edIDModulo.Text, 0);
        NomeDPR := edNomeDPR.Text;
        TituloApp := edAppTitle.Text;
      end;
    finally
      Free;
    end;
end;

procedure TfrmCMAppWiz.ActCancelarExecute(Sender: TObject);
begin
  ModalResult :=idCancel;
end;

procedure TfrmCMAppWiz.edIDModuloKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', #8, #13]) then
  begin
    Beep;
    Key := #0;
  end;
end;

end.
