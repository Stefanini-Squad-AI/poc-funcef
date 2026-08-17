unit dMS;

// =================================================================================================
//    Valores-chave dos MontaSelect
// =================================================================================================

// =================================================================================================


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect;

type
   TdtmMS = class(TDataModule)
      MS_Cartorio: TMontaSelect;
      MS_CContabil: TMontaSelect;
      MS_Cliente: TMontaSelect;
      MS_Fiador: TMontaSelect;
      MS_Forn: TMontaSelect;
      MS_Proposta: TMontaSelect;
      MS_Responsavel: TMontaSelect;
      MS_Usuario: TMontaSelect;
      MS_Seguradora: TMontaSelect;
      MS_Regra: TMontaSelect;
      MS_Patro: TMontaSelect;
      MS_Cidade: TMontaSelect;
      MS_InscricaoEmptmo: TMontaSelect;
      MS_Beneficiario: TMontaSelect;
      MS_Solicitante: TMontaSelect;
      MS_Mutuario: TMontaSelect;
      MS_ContratoEmptmo: TMontaSelect;
      MS_ContrCancConc: TMontaSelect;
      MS_ContratoQuitacao: TMontaSelect;
      MS_ContrCancAmort: TMontaSelect;
      MS_Titular: TMontaSelect;
      MS_Benef: TMontaSelect;
    MS_ConsultaContrato: TMontaSelect;
    MS_ContratoPendente: TMontaSelect;
    //Pendência 23384 - 09/10/2006
    MS_ContratoQuitacaoMorte: TMontaSelect;
    //Fim Pendência 23384

      procedure DataModuleCreate(Sender: TObject);

   private { Private declarations }

   public { Public declarations }

      // criar e limpar os itens default de um Monta Select
      procedure LimpaMS(const MS_: TMontaSelect);

   end;



var
  dtmMS: TdtmMS;



implementation
{$R *.DFM}



// criar e limpar os itens default de um Monta Select
procedure TdtmMS.LimpaMS(const MS_: TMontaSelect);
var
   i: integer;
begin
   MS_.ItemsBusca.Clear;
   for i := 0 to (MS_.Colunas.Count - 1) do MS_.ItemsBusca.Add('');
end;



procedure TdtmMS.DataModuleCreate(Sender: TObject);
begin
// =================================================================================================
//    Valores default para os MontaSelect
// =================================================================================================

// =================================================================================================
//
// =================================================================================================
end;



end.
