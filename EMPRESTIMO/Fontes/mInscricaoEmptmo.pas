// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
----------------------------------------------------------------------------------------------------}
unit mInscricaoEmptmo;


interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, UFuncoesEmptmo;

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
    property RetornouValor : Boolean read FRetornaValor;
    property IdInscricao   : Int64 read FIdInscricao;
    property NomePessoa    : String read FNomePessoa;
    { Public declarations }
  end;

implementation
uses dMS;

{$R *.DFM}

procedure TmolInscricaoEmptmo.btnBuscaContratoClick(Sender: TObject);
var
iIdBenef : integer;
begin
   dtmMS.MS_InscricaoEmptmo.Executar;
   FRetornaValor         := dtmMS.MS_InscricaoEmptmo.RetornouValor;
   if dtmMS.MS_InscricaoEmptmo.RetornouValor then
   begin
      iIdBenef            := dtmMS.MS_InscricaoEmptmo.ValoresChave[5];
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
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
