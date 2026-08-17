// Alterações:
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
---------------------------------------------------------------------------------------------------}
unit mMutuario;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons;

type
   TmolMutuario = class(TFrame)
      btnBuscaPart: TBitBtn;
      btnLimpaPart: TBitBtn;
      edtMatricula: TEdit;
      edtInscricao: TEdit;
      edtNome: TEdit;
      Label5: TLabel;
      Label1: TLabel;
      Label2: TLabel;

      procedure btnBuscaPartClick(Sender: TObject);
      procedure btnLimpaPartClick(Sender: TObject);


   private { Private declarations }

   public { Public declarations }

      iParticipante : Int64;

   end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolMutuario.btnBuscaPartClick(Sender: TObject);
var
 iIdBenef : integer;
 begin
   dtmMS.MS_Mutuario.Executar;

   Repaint;

   if dtmMS.MS_Mutuario.RetornouValor then begin

      iParticipante     := StrToInt(dtmMS.MS_Mutuario.ValoresChave[0]);
      iIdBenef          := StrToInt(dtmMS.MS_Mutuario.ValoresChave[9]);
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
      edtMatricula.Text := dtmMS.MS_Mutuario.ValoresChave[5];
      edtInscricao.Text := dtmMS.MS_Mutuario.ValoresChave[4];
      edtNome.Text      := dtmMS.MS_Mutuario.ValoresChave[2];
   end;

   if btnBuscaPart.CanFocus then btnBuscaPart.SetFocus;
end;



procedure TmolMutuario.btnLimpaPartClick(Sender: TObject);
begin
   iParticipante := -1;

   edtMatricula.Clear;
   edtInscricao.Clear;
   edtNome.Clear;
end;



end.
