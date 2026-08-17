unit mResponsavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolResponsavel = class(TFrame)
    Label5: TLabel;
    edtResponsavel: TEdit;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaResponsavel: TBitBtn;
    btnAbrePessoa: TBitBtn;
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure btnAbrePessoaClick(Sender: TObject);
    procedure edtResponsavelChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iResponsavel: integer;
  end;

implementation

{$R *.DFM}

uses dLookImobiliario, DMS, fPessoaResponsavelMT;

procedure TmolResponsavel.btnBuscaResponsavelClick(Sender: TObject);
begin
   dtmMS.MS_Responsavel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Responsavel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iResponsavel         := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtResponsavel.Text  := dtmMS.MS_Responsavel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaResponsavel.SetFocus;
end;

procedure TmolResponsavel.btnLimpaResponsavelClick(Sender: TObject);
begin
   iResponsavel := -1;
   edtResponsavel.Clear;
end;

procedure TmolResponsavel.btnAbrePessoaClick(Sender: TObject);
begin
   // Cria form de Pessoa Administradora
   if iResponsavel > 0 then begin
     Application.CreateForm(TfrmPessoaResponsavelMT, frmPessoaResponsavelMT);
     frmPessoaResponsavelMT.WindowState := wsNormal;
     frmPessoaResponsavelMT.SelPessoa(iResponsavel);
     frmPessoaResponsavelMT.Show;
   end;
end;

procedure TmolResponsavel.edtResponsavelChange(Sender: TObject);
begin
  if edtResponsavel.Text = '' then
       btnAbrePessoa.Enabled := False
  else btnAbrePessoa.Enabled := True;
end;

end.
