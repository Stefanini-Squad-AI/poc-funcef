unit CMXptAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, buttons, shellapi, inifiles, ComCtrls,
  IvDictio, IvMulti, IvEMulti, jpeg;

type                  
  TExecuteType = (etSplash, etAbout);

  TfrmCMEntrada = class(TForm)
    pnlFundo: TPanel;
    Image1: TImage;
    lblNomeModulo: TLabel;
    lblVersao: TLabel;
    lblConex: TLabel;
    BvlNomeSistema: TBevel;
    lstVersao: TListView;
    lstGeral: TListBox;
    btnOk: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
  public
    class procedure ExecuteAbout;
  end;

implementation

uses
  FSM_WinApiLib;

{$R *.DFM}
procedure TfrmCMEntrada.FormCreate(Sender: TObject);
begin                            
  lblNomeModulo.Caption := 'CM Experts';
  lblVersao.Caption := 'Versão ' + GetFileVersion('CMExperts.bpl');
  //imgIcon.Picture.Icon.Assign(Application.Icon);
end;

procedure TfrmCMEntrada.Label1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, 'http://www.cmsolucoes.com.br', nil, nil, SW_SHOW);
end;

class procedure TfrmCMEntrada.ExecuteAbout;
begin
  with Self.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
