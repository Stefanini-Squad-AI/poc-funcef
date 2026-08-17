unit mAdministradora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolAdministradora = class(TFrame)
    Label5: TLabel;
    edtAdministradora: TEdit;
    btnBuscaAdministradora: TBitBtn;
    btnLimpaAdministradora: TBitBtn;
    btnAbrePessoa: TBitBtn;

    procedure btnBuscaAdministradoraClick(Sender: TObject);
    procedure btnLimpaAdministradoraClick(Sender: TObject);
    procedure btnAbrePessoaClick(Sender: TObject);
    procedure edtAdministradoraChange(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iAdministradora : int64;
   sAdministradora : string;
  end;

implementation

{$R *.DFM}
uses dMS, fPessoaAdministradorMT;


procedure TmolAdministradora.btnBuscaAdministradoraClick(Sender: TObject);
begin
  dtmMS.MS_AdminImovel.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_AdminImovel.RetornouValor then begin
     iAdministradora := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
     sAdministradora := dtmMS.MS_AdminImovel.ValoresChave[1];
     edtAdministradora.Text := dtmMS.MS_AdminImovel.ValoresChave[1];
  end;
  btnBuscaAdministradora.SetFocus;
end;

procedure TmolAdministradora.btnLimpaAdministradoraClick(Sender: TObject);
begin
  iAdministradora := -1;
  sAdministradora := '';
  edtAdministradora.Clear;
end;


procedure TmolAdministradora.btnAbrePessoaClick(Sender: TObject);
begin
   // Cria form de Pessoa Administradora
   if iAdministradora > 0 then begin
     Application.CreateForm(TfrmPessoaAdministradorMT, frmPessoaAdministradorMT);
     frmPessoaAdministradorMT.WindowState := wsNormal;
     frmPessoaAdministradorMT.SelPessoa(iAdministradora);
     frmPessoaAdministradorMT.Show;
   end;
end;

procedure TmolAdministradora.edtAdministradoraChange(Sender: TObject);
begin
  if edtAdministradora.Text = '' then
       btnAbrePessoa.Enabled := False
  else btnAbrePessoa.Enabled := True;
end;

end.
