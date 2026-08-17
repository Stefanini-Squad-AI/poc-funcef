unit mProponente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolProponente = class(TFrame)
    Label5: TLabel;
    edtProponente: TEdit;
    btnBuscaProponente: TBitBtn;
    btnLimpaProponente: TBitBtn;
    btnAbrePessoa: TBitBtn;

    procedure btnBuscaProponenteClick(Sender: TObject);
    procedure btnLimpaProponenteClick(Sender: TObject);
    procedure btnAbrePessoaClick(Sender: TObject);
    procedure edtProponenteChange(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iProponente : int64;
   sProponente : string;
  end;

implementation

{$R *.DFM}
uses dMS, fPessoaProprietarioMT;


procedure TmolProponente.btnBuscaProponenteClick(Sender: TObject);
begin
  dtmMS.MS_Proprietario.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Proprietario.RetornouValor then begin
     iProponente := StrToInt(dtmMS.MS_Proprietario.ValoresChave[0]);
     sProponente := dtmMS.MS_Proprietario.ValoresChave[1];
     edtProponente.Text := dtmMS.MS_Proprietario.ValoresChave[1];
  end;
  btnBuscaProponente.SetFocus;
end;

procedure TmolProponente.btnLimpaProponenteClick(Sender: TObject);
begin
  iProponente := -1;
  sProponente := '';
  edtProponente.Clear;
end;


procedure TmolProponente.btnAbrePessoaClick(Sender: TObject);
begin
   // Cria form de Pessoa Locatario
   if iProponente > 0 then begin
     Application.CreateForm(TfrmPessoaProprietarioMT, frmPessoaProprietarioMT);
     frmPessoaProprietarioMT.WindowState := wsNormal;
     frmPessoaProprietarioMT.SelPessoa(iProponente);
     frmPessoaProprietarioMT.Show;
   end;
end;

procedure TmolProponente.edtProponenteChange(Sender: TObject);
begin
  if edtProponente.Text = '' then
       btnAbrePessoa.Enabled := False
  else btnAbrePessoa.Enabled := True;
end;

end.
