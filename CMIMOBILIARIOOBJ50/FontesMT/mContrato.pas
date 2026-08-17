{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27172
Responsável  : Daniel Simões
Data         : 09/01/2008
Descrição    : Adicionado novo MontaSelect no dtmMS apenas para ser executado
               aqui no frame já que o frame anterior (MS_Contrato) é utilizado
               em vários lugares...

               Passa a ser carregado em tempo de execução os parâmetros "L,D"
               quando a query for aberta pelo 'Administração Imobiliária' e
               "C,A" quando a query for aberta pelo 'Alienação' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

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
    sNomeLocatario   : string;
    sFlgStatus       : string;  // Marcio Motta - Pendência: 16754
    bFiltraModulo    : Boolean;
  end;




implementation
{$R *.DFM}
uses dMS, uSistema;



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
var sFiltro : String;
begin
   // adiciona o filtro por Empresa Proprietária e Módulo MontaSelect
   sFiltro := dtmMS.MS_ContratoFrame.Filtro.Text;  ;
   dtmMS.MS_ContratoFrame.Filtro.Add('C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

   if bFiltraModulo then
   begin
     If (Sistema.IdModulo = 64) then
       dtmMS.MS_ContratoFrame.Filtro.Add('C.FLGTIPOCONTRATO IN (''L'',''D'') ')  // Locação   { Daniel - 27172 - "D" }
     else
       dtmMS.MS_ContratoFrame.Filtro.Add('C.FLGTIPOCONTRATO IN (''C'',''A'') '); // Alienacao { Daniel - 27172 - "A" }
   end;

   dtmMS.MS_ContratoFrame.Executar;
   Repaint;

   // Retorna o Filtro anterior
   dtmMS.MS_ContratoFrame.Filtro.Clear;
   dtmMS.MS_ContratoFrame.Filtro.Text := sFiltro;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ContratoFrame.RetornouValor then begin

      iContrato      := StrToInt(dtmMS.MS_ContratoFrame.ValoresChave[0]);
      sNumContrato   := dtmMS.MS_ContratoFrame.ValoresChave[1];
      sNomeContrato  := dtmMS.MS_ContratoFrame.ValoresChave[2];
      iLocatario     := StrToInt(dtmMS.MS_ContratoFrame.ValoresChave[7]);
      //Ricardo Cristiano
      iCodportForma  := 0;
      if dtmMS.MS_ContratoFrame.ValoresChave[8] <> '' then
         iCodportForma  := StrToInt(dtmMS.MS_ContratoFrame.ValoresChave[8]);
      sNomeLocatario := dtmMS.MS_ContratoFrame.ValoresChave[4];
      sFlgStatus     := dtmMS.MS_ContratoFrame.ValoresChave[9]; // Marcio Motta - Pendência: 16754
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
   sNomeLocatario    := '';
   sFlgStatus        := ''; // Marcio Motta - Pendência: 16754
   bFiltraModulo     := True;

   // define e preenche o nome do Contrato
   ContratoExtenso;
end;



end.
