unit mContratoEmptmo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

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

   private { Private declarations }

      FRetornaValor : Boolean;
      FIDContrato   : Int64;
      FNomePessoa   : String;

   public { Public declarations }

      (* Propriedade que veridica se o Frame retornou alguma informação *)
      property RetornouValor : Boolean read FRetornaValor;

      (* Informa o IDContratoEmptmo de um Contrato *)
      property IDContrato    : Int64 read FIDContrato;

      (* Informa o Nome do Titular de um contrato *)
      property NomePessoa    : String read FNomePessoa;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolContratoEmptmo.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_ContratoEmptmo.Executar;
   Repaint;

   FRetornaValor           := dtmMS.MS_ContratoEmptmo.RetornouValor;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then begin
      edtIDContrato.Text   := dtmMS.MS_ContratoEmptmo.ValoresChave[0];
      edtMatricula.Text    := dtmMS.MS_ContratoEmptmo.ValoresChave[3];
      edtNome.Text         := dtmMS.MS_ContratoEmptmo.ValoresChave[1];

      FIDContrato          := StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]);
      FNomePessoa          := dtmMS.MS_ContratoEmptmo.ValoresChave[1];
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
