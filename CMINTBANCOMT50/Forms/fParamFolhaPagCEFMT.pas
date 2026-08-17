unit fParamFolhaPagCEFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro;

type
  TfrmParamFolhaPagCEFMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RB1: TRadioButton;
    RB2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamFolhaPagCEFMT: TfrmParamFolhaPagCEFMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamFolhaPagCEFMT.FormCreate(Sender: TObject);
Begin
  if IntBancoManager.BuscaParamIntBanco('DESCRICAO','S') = 'DÉBITO AUTOMÁTICO' then
     RB2.Checked := True
  else
     RB1.Checked := True
end;

procedure TfrmParamFolhaPagCEFMT.CMOkCancelar1OkClick(Sender: TObject);
var sDescricao : String;
begin
  if RB2.Checked then
    sDescricao := 'DÉBITO AUTOMÁTICO'
  else
    sDescricao := 'FOLHA PAGAMENTO';
  IntBancoManager.GravaParamIntBanco(['DESCRICAO'],
                                 [sDescricao]);
  ModalResult := MrOk;
end;

procedure TfrmParamFolhaPagCEFMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
