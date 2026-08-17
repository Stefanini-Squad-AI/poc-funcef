unit FResourceCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TB97, CmDock, StdCtrls, uFormManager, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, uResource, Buttons;

type
  TfrmResourceCM = class(TForm)
    PnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label1: TLabel;
    edtArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    edtversao: TEdit;
    Label3: TLabel;
    edtVersaoNova: TEdit;
    CMResourceManager1: TCMResourceManager;
    procedure CMOkCancelar1SairClick(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResourceCM: TfrmResourceCM;

implementation

Uses fLiberaVersao, FCadModulo, fScripAutoriza;

{$R *.DFM}

procedure TfrmResourceCM.CMOkCancelar1SairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmResourceCM.CMOkCancelar1OkClick(Sender: TObject);
begin
  if (edtArquivo.Text = '') then begin
    MessageDlg('Favor informar o arquivo!', mtInformation, [mbOK], 0);
    exit;
  end;

  if (edtVersaoNova.Text = '' ) then begin
    MessageDlg('Favor informar a nova versão!', mtInformation, [mbOK], 0);
    exit;
  end;

  CMResourceManager1.Versao := edtVersaoNova.Text;
  if CMResourceManager1.CriarResorce then
    MessageDlg('O arquivo de resource ' + CMResourceManager1.ResName + ' foi criado!'#10#10 +
      'Compile o projeto para ter efeito.', mtInformation, [mbOK], 0)
  else
    MessageDlg('Erro ao se criar o arquivo de resorce!'#10#10 +
    CMResourceManager1.MensErro, mtError, [mbOK], 0);


end;

procedure TfrmResourceCM.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    edtArquivo.Text := OpenDialog1.FileName;
    CMResourceManager1.ProjectName := OpenDialog1.FileName;
    CMResourceManager1.ObterNomeExecutavel;
    CMResourceManager1.ObterVersao;
    edtversao.Text := CMResourceManager1.Versao;
    edtVersaoNova.Clear;
  end;
end;

end.
