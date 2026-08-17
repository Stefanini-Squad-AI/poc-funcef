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
   StdCtrls, Buttons, Wwquery ,uFuncoesEmptmo;

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


   private  // Private declarations

   public   // Public declarations

      IDTitular : Int64;
      IDBenef   : Int64;

      Filtro    : String;

   end;



implementation
{$R *.DFM}
uses
   dMS,
   dEmptmo,
   FExecBuscaContrato, FExecBuscaSolicitante;



procedure TmolMutuario.btnBuscaPartClick(Sender: TObject);
begin
   ParametrosSistema;

   try
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         Application.CreateForm(TfrmExecBuscaSolicitante, frmExecBuscaSolicitante);
         frmExecBuscaSolicitante.ShowModal;

         Repaint;

         if frmExecBuscaSolicitante.RetornouValor then
         begin
            Screen.Cursor     := crHourGlass;

            IDTitular         := StrToInt(frmExecBuscaSolicitante.ValoresChave[1]);
            IDBenef           := StrToInt(frmExecBuscaSolicitante.ValoresChave[0]);
            UFuncoesEmptmo.buscaUsuarioMutuario(IDBenef);
            edtMatricula.Text := frmExecBuscaSolicitante.ValoresChave[1];
            edtInscricao.Text := frmExecBuscaSolicitante.ValoresChave[3];
            edtNome.Text      := frmExecBuscaSolicitante.ValoresChave[2];

            frmExecBuscaSolicitante.Free;
         end;

      end
      else
      begin
         dtmMS.MS_Mutuario.Executar;

         Repaint;

         if dtmMS.MS_Mutuario.RetornouValor then
         begin
            Screen.Cursor     := crHourGlass;

            IDTitular         := StrToInt(dtmMS.MS_Mutuario.ValoresChave[1]);
            IDBenef           := StrToInt(dtmMS.MS_Mutuario.ValoresChave[0]);
            UFuncoesEmptmo.buscaUsuarioMutuario(IDBenef);
            edtMatricula.Text := dtmMS.MS_Mutuario.ValoresChave[3];
            edtInscricao.Text := dtmMS.MS_Mutuario.ValoresChave[5];
            edtNome.Text      := dtmMS.MS_Mutuario.ValoresChave[2];
         end;

         if btnBuscaPart.CanFocus then btnBuscaPart.SetFocus;
      end;
   finally
      Screen.Cursor     := crDefault;
   end;
end;



procedure TmolMutuario.btnLimpaPartClick(Sender: TObject);
begin
   IDTitular   := -1;
   IDBenef     := -1;

   edtMatricula.Clear;
   edtInscricao.Clear;
   edtNome.Clear;
end;



end.
