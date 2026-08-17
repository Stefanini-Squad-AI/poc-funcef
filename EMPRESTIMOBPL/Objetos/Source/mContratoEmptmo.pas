{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------}

unit mContratoEmptmo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, UFuncoesEmptmo;

type
   TmolContratoEmptmo = class(TFrame)
      edtNome: TEdit;
      Label2: TLabel;
      btnBuscaContrato: TBitBtn;
      btnLimpaContrato: TBitBtn;
      edtIDContrato: TEdit;
      Label1: TLabel;
      edtMatricula: TEdit;
      Label3: TLabel;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnLimpaContratoClick(Sender: TObject);

   private  // Private declarations

      FRetornaValor : Boolean;
      FIDContrato   : Extended;
      FIDTipoContr  : Integer;
      FNomePessoa   : String;

   public   // Public declarations

      // Propriedade que veridica se o Frame retornou alguma informação
      Filtro                 : String;
      property RetornouValor : Boolean read FRetornaValor;

      // Informa o IDContratoEmptmo de um Contrato
      property IDContrato    : Extended read FIDContrato;

      property IDTipoContr   : Integer read FIDTipoContr;

      // Informa o Nome do Titular de um contrato
      property NomePessoa    : String read FNomePessoa;

  end;



implementation
{$R *.DFM}
uses
   dMS,
   dEmptmo,
   FExecBuscaContrato;



procedure TmolContratoEmptmo.btnBuscaContratoClick(Sender: TObject);
var
   iIdBenef : integer;
begin
   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := Filtro;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         edtIDContrato.Text   := frmExecBuscaContrato.ValoresChave[0];
         edtMatricula.Text    := frmExecBuscaContrato.ValoresChave[1];
         edtNome.Text         := frmExecBuscaContrato.ValoresChave[2];

         FIDContrato          := StrToFloat(frmExecBuscaContrato.ValoresChave[0]);
         FIDTipoContr         := StrToInt(frmExecBuscaContrato.ValoresChave[5]);

         FNomePessoa          := frmExecBuscaContrato.ValoresChave[2];

         iIdBenef := frmExecBuscaContrato.qryResultadoC12.AsInteger;
         uFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         frmExecBuscaContrato.Free;
      end;

   end
   else
   begin

     dtmMS.MS_ContratoEmptmo.Executar;
     Repaint;

     FRetornaValor           := dtmMS.MS_ContratoEmptmo.RetornouValor;

     if dtmMS.MS_ContratoEmptmo.RetornouValor then
     begin
        edtIDContrato.Text   := dtmMS.MS_ContratoEmptmo.ValoresChave[0];
        edtMatricula.Text    := dtmMS.MS_ContratoEmptmo.ValoresChave[3];
        edtNome.Text         := dtmMS.MS_ContratoEmptmo.ValoresChave[1];

        FIDContrato          := StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]);
        FIDTipoContr         := StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[4]);

        iIdBenef             := StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[2]);
        uFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

        FNomePessoa          := dtmMS.MS_ContratoEmptmo.ValoresChave[1];
     end;
   end;
end;



procedure TmolContratoEmptmo.btnLimpaContratoClick(Sender: TObject);
begin
   FRetornaValor    := False;
   FIDContrato      := -1;
   FNomePessoa      := '';

   edtIDContrato.Clear;
   edtMatricula.Clear;
   edtNome.Clear;
end;



end.
