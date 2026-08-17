unit mContrato;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolContrato = class(TFrame)
    edtContrato: TEdit;
    Label2: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);

    
  private { Private declarations }

   procedure ContratoExtenso;


  public { Public declarations }
    iContrato        : int64;
    iLocatario       : int64;
    iCodportForma    : int64;
    sNumContrato     : string;
    sNomeContrato    : string;
    sContratoExtenso : string;

  end;




implementation
{$R *.DFM}
uses
   dMS;



// define e preenche o nome do Contrato
procedure TmolContrato.ContratoExtenso;
begin
   sContratoExtenso := '';
   if ( (sNumContrato <> '') or (sNomeContrato <> '') ) then begin
      if length(trim(sNumcontrato)) = 0 then begin
         sContratoExtenso := sNomeContrato;
      end else begin
         sContratoExtenso := sNumContrato + ' - ' + sNomeContrato;
      end;
   end;

   edtContrato.Text := sContratoExtenso;
end;



procedure TmolContrato.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_Contrato.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      iContrato      := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      sNumContrato   := dtmMS.MS_Contrato.ValoresChave[1];
      sNomeContrato  := dtmMS.MS_Contrato.ValoresChave[2];
      iLocatario     := StrToInt(dtmMS.MS_Contrato.ValoresChave[7]);
      iCodportForma  := StrToInt(dtmMS.MS_Contrato.ValoresChave[8]);
      // define e preenche o nome do Contrato
      ContratoExtenso;
   end;

   btnBuscaContrato.SetFocus;
end;



procedure TmolContrato.btnLimpaContratoClick(Sender: TObject);
begin
   iContrato         := -1;
   iLocatario        := -1;
   iCodportForma     := -1;
   sNumContrato      := '';
   sNomeContrato     := '';
   sContratoExtenso  := '';

   // define e preenche o nome do Contrato
   ContratoExtenso;
end;



end.
