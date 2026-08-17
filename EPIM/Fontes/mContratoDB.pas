unit mContratoDB;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TmolContratoDB = class(TFrame)
    Label2: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    DBedtContrato: TDBEdit;
    DBedtIDContrato: TDBEdit;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);


  private { Private declarations }

   procedure ContratoExtenso;


  public { Public declarations }
    iContrato        : int64;
    sNumContrato     : string;
    sNomeContrato    : string;
    sContratoExtenso : string;

  end;




implementation
{$R *.DFM}
uses
   dMS;




// define e preenche o nome do Contrato
procedure TmolContratoDB.ContratoExtenso;
begin
   sContratoExtenso := '';
   if ( (sNumContrato <> '') or (sNomeContrato <> '') ) then begin
      if length(trim(sNumcontrato)) = 0 then begin
         sContratoExtenso := sNomeContrato;
      end else begin
         sContratoExtenso := sNumContrato + ' - ' + sNomeContrato;
      end;
   end;

   // limpa o campo
   if DBedtContrato.DataField <> '' then DBedtContrato.DataSource.DataSet.FieldByName(DBedtContrato.DataField).Clear;

   // preenche o campo
   if sContratoExtenso <> '' then if DBedtContrato.DataField <> '' then begin
      DBedtContrato.DataSource.DataSet.FieldByName(DBedtContrato.DataField).AsString := sContratoExtenso;
   end;
end;



procedure TmolContratoDB.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_Contrato.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      iContrato      := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      sNumContrato   := dtmMS.MS_Contrato.ValoresChave[1];
      sNomeContrato  := dtmMS.MS_Contrato.ValoresChave[2];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDContrato.DataField <> '' then DBedtIDContrato.DataSource.DataSet.FieldByName(DBedtIDContrato.DataField).AsInteger := iContrato;

      // define e preenche o nome do Contrato
      ContratoExtenso;
   end;

   btnBuscaContrato.SetFocus;
end;



procedure TmolContratoDB.btnLimpaContratoClick(Sender: TObject);
begin
   iContrato         := -1;
   sNumContrato      := '';
   sNomeContrato     := '';
   sContratoExtenso  := '';

   // Controle dos campos DB (IDs) invisíveis
   if DBedtIDContrato.DataField <> '' then DBedtIDContrato.DataSource.DataSet.FieldByName(DBedtIDContrato.DataField).Clear;

   // define e preenche o nome do Contrato
   ContratoExtenso;
end;



end.
