unit mCartorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolCartorio = class(TFrame)
    Label5: TLabel;
    edtCartorio: TEdit;
    btnBuscaCartorio: TBitBtn;
    btnLimpaCartorio: TBitBtn;
    btnAbrePessoa: TBitBtn;

    procedure btnBuscaCartorioClick(Sender: TObject);
    procedure btnLimpaCartorioClick(Sender: TObject);
    procedure btnAbrePessoaClick(Sender: TObject);
    procedure edtCartorioChange(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iCartorio : int64;
   sCartorio : string;
  end;

implementation

{$R *.DFM}
uses dMS, fPessoaCartorioMT;


procedure TmolCartorio.btnBuscaCartorioClick(Sender: TObject);
begin
  dtmMS.MS_Cartorio.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Cartorio.RetornouValor then begin
    iCartorio        := StrToInt(dtmMS.MS_Cartorio.ValoresChave[0]);
    sCartorio        := dtmMS.MS_Cartorio.ValoresChave[1];
    edtCartorio.Text := dtmMS.MS_Cartorio.ValoresChave[1];
  end;
  btnBuscaCartorio.SetFocus;
end;


procedure TmolCartorio.btnLimpaCartorioClick(Sender: TObject);
begin
   iCartorio := -1;
   sCartorio := '';
   edtCartorio.Clear;
end;


procedure TmolCartorio.btnAbrePessoaClick(Sender: TObject);
begin
   // Cria form de Pessoa Locatario
   if iCartorio > 0 then begin
     Application.CreateForm(TfrmPessoaCartorioMT, frmPessoaCartorioMT);
     frmPessoaCartorioMT.WindowState := wsNormal;
     frmPessoaCartorioMT.SelPessoa(iCartorio);
     frmPessoaCartorioMT.Show;
   end;
end;

procedure TmolCartorio.edtCartorioChange(Sender: TObject);
begin
  if edtCartorio.Text = '' then
       btnAbrePessoa.Enabled := False
  else btnAbrePessoa.Enabled := True;
end;

end.
