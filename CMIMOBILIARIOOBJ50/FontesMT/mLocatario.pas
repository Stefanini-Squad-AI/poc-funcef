unit mLocatario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolLocatario = class(TFrame)
    Label5: TLabel;
    edtLocatario: TEdit;
    btnBuscaLocatario: TBitBtn;
    btnLimpaLocatario: TBitBtn;
    btnAbrePessoa: TBitBtn;

    procedure btnBuscaLocatarioClick(Sender: TObject);
    procedure btnLimpaLocatarioClick(Sender: TObject);
    procedure btnAbrePessoaClick(Sender: TObject);
    procedure edtLocatarioChange(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iLocatario : int64;
   sLocatario : string;
  end;

implementation

{$R *.DFM}
uses dMS, fPessoaLocatarioMT;


procedure TmolLocatario.btnBuscaLocatarioClick(Sender: TObject);
begin
  dtmMS.MS_Locatario.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Locatario.RetornouValor then begin
     iLocatario := StrToInt(dtmMS.MS_Locatario.ValoresChave[0]);
     sLocatario := dtmMS.MS_Locatario.ValoresChave[1];
     edtLocatario.Text := dtmMS.MS_Locatario.ValoresChave[1];
  end;
  btnBuscaLocatario.SetFocus;
end;

procedure TmolLocatario.btnLimpaLocatarioClick(Sender: TObject);
begin
  iLocatario := -1;
  sLocatario := '';
  edtLocatario.Clear;
end;


procedure TmolLocatario.btnAbrePessoaClick(Sender: TObject);
begin
   // Cria form de Pessoa Locatario
   if iLocatario > 0 then begin
     Application.CreateForm(TfrmPessoaLocatarioMT, frmPessoaLocatarioMT);
     frmPessoaLocatarioMT.WindowState := wsNormal;
     frmPessoaLocatarioMT.SelPessoa(iLocatario);
     frmPessoaLocatarioMT.Show;
   end;
end;

procedure TmolLocatario.edtLocatarioChange(Sender: TObject);
begin
  if edtLocatario.Text = '' then
       btnAbrePessoa.Enabled := False
  else btnAbrePessoa.Enabled := True;
end;

end.
