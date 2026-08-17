unit mContratoNumero;
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 107772/5704
Nº KINTANA..: 1360314
Data........: 25/05/2012
Responsável.: André Oliveira
Descrição...: Trazer apenas alteradores de desconto concedido, passar para 4 casas decimais
os campos de divergencias
---------------------------------------------------------------------------------------------------}

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolContratoNumero = class(TFrame)
    Label1: TLabel;
    edtConNumero: TEdit;
    edtConNome: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
  private
    { Private declarations }

    procedure ContratoExtenso;

  public
    { Public declarations }

    iContrato        : int64;
    iLocatario       : int64;
    iCodportForma    : int64;
    sNumContrato     : string;
    sNomeContrato    : string;
    sContratoExtenso : string;
    sNomeLocatario   : string;
    sFlgStatus       : string;
  end;

implementation

{$R *.DFM}

uses dMS, uSistema;

procedure TmolContratoNumero.btnBuscaContratoClick(Sender: TObject);
var sFiltro : String;
begin

   // adiciona o filtro por Empresa Proprietária e Módulo MontaSelect
   sFiltro := dtmMS.MS_Contrato.Filtro.Text;
   // Alterado por FHBS - SOL: 107772 KTN: 485678
   //dtmMS.MS_Contrato.Filtro.Add('C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
   if Sistema.IdModulo = 64 then
     // Alterado por FHBS - SOL: 107772 KTN: 485678 - Adicionada a Condição "D"
     dtmMS.MS_Contrato.Filtro.Add('C.FLGTIPOCONTRATO IN (''L'', ''D'') ') // Locação
   else
     dtmMS.MS_Contrato.Filtro.Add('C.FLGTIPOCONTRATO = ''C'' '); // Alienacao

   dtmMS.MS_Contrato.Executar;
   Repaint;

   // Retorna o Filtro anterior
   dtmMS.MS_Contrato.Filtro.Clear;
   dtmMS.MS_Contrato.Filtro.Text := sFiltro;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      iContrato      := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      sNumContrato   := dtmMS.MS_Contrato.ValoresChave[1];
      sNomeContrato  := dtmMS.MS_Contrato.ValoresChave[2];
      // Alterado por FHBS - SOL: 107772 KTN: 485678
      iLocatario     := StrToIntDef(dtmMS.MS_Contrato.ValoresChave[7], 0);
      iCodportForma  := StrToIntDef(dtmMS.MS_Contrato.ValoresChave[8], 0);
      sNomeLocatario := dtmMS.MS_Contrato.ValoresChave[4];
      sFlgStatus     := dtmMS.MS_Contrato.ValoresChave[9]; // Marcio Motta - Pendência: 16754
      // define e preenche o nome do Contrato
      ContratoExtenso;
   end;

   btnBuscaContrato.SetFocus;
end;

procedure TmolContratoNumero.btnLimpaContratoClick(Sender: TObject);
begin
   iContrato        := -1;
   iLocatario       := -1;
   iCodportForma    := -1;
   sNumContrato     := '';
   sNomeContrato    := '';
   sContratoExtenso := '';
   sNomeLocatario   := '';
   sFlgStatus       := '';

   // Define e preenche o nome do Contrato...
   ContratoExtenso;
end;

procedure TmolContratoNumero.ContratoExtenso;
begin
  sContratoExtenso := '';

  if ( (sNumContrato<>'') or (sNomeContrato<>'') ) then begin
    if ( Length(Trim(sNumcontrato))=0 ) then
      sContratoExtenso := sNomeContrato
    else
      sContratoExtenso := sNumContrato+' - '+sNomeContrato;
  end
  // Alterado por FHBS - SOL: 107772 KTN: 485678
  else
  begin
    sContratoExtenso := '';
    sNumContrato := '';
  end;

  // Alterado por FHBS - SOL: 107772 KTN: 485678
  edtConNumero.Text := sNumContrato;
  edtConNome.Text := sContratoExtenso;
end;

end.
