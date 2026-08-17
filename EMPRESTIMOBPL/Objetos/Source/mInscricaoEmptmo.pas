// Alterações:
{
--------------------------------------------------------------------------------------------------
Pendência   : SIG121983
Responsável : edilaine
Data        : 30/12/2021
Descrição   : Busca contrato retorna erro
---------------------------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
---------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002 
Autor     : Marchetti
Descrição : Acerto no retorno do campo chave no que se refere ao nome do mutuário
---------------------------------------------------------------------------------------------------}
unit mInscricaoEmptmo;

interface

uses 
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons,UFuncoesEmptmo;

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
      FIdInscricao  : Extended;
      FNomePessoa   : String;

   public { Public declarations }

      property RetornouValor : Boolean  read FRetornaValor;    (* indica se o Mol retornou alguma informação *)
      property IDInscricao   : Extended read FIdInscricao;       (* ID da Inscrição *)
      property NomePessoa    : String   read FNomePessoa;       (* Informa o Nome do Titular de um contrato *)

   end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolInscricaoEmptmo.btnBuscaContratoClick(Sender: TObject);
var
iIdBenef : integer;
begin
   dtmMS.MS_InscricaoEmptmo.Executar;

   FRetornaValor         := dtmMS.MS_InscricaoEmptmo.RetornouValor;
   if dtmMS.MS_InscricaoEmptmo.RetornouValor then
   begin

      //iIdBenef            := StrToInt(dtmMS.MS_InscricaoEmptmo.ValoresChave[5]);    //edilaine SIG121983
      iIdBenef            := StrToInt(dtmMS.MS_InscricaoEmptmo.ValoresChave[2]);      //edilaine SIG121983
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
      edtIdInscricao.Text := dtmMS.MS_InscricaoEmptmo.ValoresChave[0];
      edtNome.Text        := dtmMS.MS_InscricaoEmptmo.ValoresChave[4];
      FIdInscricao        := StrToFloat(dtmMS.MS_InscricaoEmptmo.ValoresChave[0]);
      FNomePessoa         := dtmMS.MS_InscricaoEmptmo.ValoresChave[4];
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
