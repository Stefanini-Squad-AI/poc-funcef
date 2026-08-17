unit mInscricaoEmptmo;

interface

uses 
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons;

type
   TmolInscricaoEmptmo = class(TFrame)
      Label2: TLabel;
      Label1: TLabel;
      edtNome: TEdit;
      btnBuscaContrato: TBitBtn;
      btnLimpaContrato: TBitBtn;
      edtidInscricao: TEdit;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnLimpaContratoClick(Sender: TObject);

   private
      FRetornaValor : Boolean;
      FIdInscricao  : Int64;
      FNomePessoa   : String;

   public { Public declarations }

      property RetornouValor : Boolean read FRetornaValor;    (* indica se o Mol retornou alguma informação *)
      property IDInscricao   : Int64 read FIdInscricao;       (* ID da Inscrição *)
      property NomePessoa    : String read FNomePessoa;       (* Informa o Nome do Titular de um contrato *)

   end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolInscricaoEmptmo.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_InscricaoEmptmo.Executar;

   FRetornaValor         := dtmMS.MS_InscricaoEmptmo.RetornouValor;
   if dtmMS.MS_InscricaoEmptmo.RetornouValor then
   begin
      edtIdInscricao.Text := dtmMS.MS_InscricaoEmptmo.ValoresChave[0];
      edtNome.Text        := dtmMS.MS_InscricaoEmptmo.ValoresChave[1];
      FIdInscricao        := StrToInt(dtmMS.MS_InscricaoEmptmo.ValoresChave[0]);
      FNomePessoa         := dtmMS.MS_InscricaoEmptmo.ValoresChave[1];
   end;
end;



procedure TmolInscricaoEmptmo.btnLimpaContratoClick(Sender: TObject);
begin
   FRetornaValor    := False;
   FIdInscricao     := -1;
   FNomePessoa      := '';
   edtIdInscricao.Clear;
   edtNome.Clear;
end;



end.
