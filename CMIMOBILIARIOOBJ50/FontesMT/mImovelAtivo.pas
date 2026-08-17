unit mImovelAtivo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uSistema, uModuloImobiliario;

type
  TmolImovelAtivo = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
   iCarteira        : integer;
   iImovel, iMestre : int64;
   sImovel, sMestre : string;
   sCodTipoImo      : string;
   sImoCodigo       : string;
   sImovelExtenso   : string;

// Início ------- Data: 09/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
   sStatus          : string;
   iArea            : Double;
   iAtivo           : integer;
// Fim ------------------------ Marcio Motta -----------------------------------
  end;



implementation
{$R *.DFM}
uses dMS;



procedure TmolImovelAtivo.btnBuscaImovelClick(Sender: TObject);
begin
   if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
      dtmMS.MS_UnidadeAtiva.MultiSelect := False;

      dtmMS.MS_UnidadeAtiva.Executar;
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_UnidadeAtiva.RetornouValor then begin

         // Imóvel
         iMestre     := StrToInt(dtmMS.MS_UnidadeAtiva.ValoresChave[0]);
         iImovel     := StrToInt(dtmMS.MS_UnidadeAtiva.ValoresChave[1]);
         sMestre     := dtmMS.MS_UnidadeAtiva.ValoresChave[4];
         sImovel     := dtmMS.MS_UnidadeAtiva.ValoresChave[6] + ' - ' + dtmMS.MS_UnidadeAtiva.ValoresChave[5];
         sCodTipoImo := dtmMS.MS_UnidadeAtiva.ValoresChave[7];
         sImoCodigo  := dtmMS.MS_UnidadeAtiva.ValoresChave[10];
         sStatus     := dtmMS.MS_UnidadeAtiva.ValoresChave[14];
         if dtmMS.MS_UnidadeAtiva.ValoresChave[11] <> '' then
              iArea := StrToFloat(dtmMS.MS_UnidadeAtiva.ValoresChave[11])
         else iArea := 0;
         iAtivo      := StrToInt(dtmMS.MS_UnidadeAtiva.ValoresChave[12]);

         iCarteira   := -1;

         edtImovel.Text := sMestre + ' - ' + sImovel;
      end;
   end else begin
      dtmMS.MS_ImovelAtivo.MultiSelect := False;
      dtmMS.MS_ImovelAtivo.Executar;

      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_ImovelAtivo.RetornouValor then begin

         // Imóvel
         iMestre     := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[0]);
         iImovel     := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);
         sMestre     := dtmMS.MS_ImovelAtivo.ValoresChave[2];
         sImovel     := dtmMS.MS_ImovelAtivo.ValoresChave[3];
         sCodTipoImo := dtmMS.MS_ImovelAtivo.ValoresChave[4];
         sImoCodigo  := dtmMS.MS_ImovelAtivo.ValoresChave[7];

   // Início ------- Data: 09/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
         sStatus     := dtmMS.MS_ImovelAtivo.ValoresChave[11];
         if dtmMS.MS_ImovelAtivo.ValoresChave[8] <> '' then
              iArea := StrToFloat(dtmMS.MS_ImovelAtivo.ValoresChave[8])
         else iArea := 0;
         iAtivo      := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[12]);
   // Fim ------------------------ Marcio Motta -----------------------------------

         iCarteira   := -1;
         if dtmMS.MS_ImovelAtivo.ValoresChave[5] <> '' then begin
            iCarteira:= StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[5]);
         end;

         edtImovel.Text := sMestre + ' - ' + sImovel;
      end;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelAtivo.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel     := -1;
   iMestre     := -1;
   iCarteira   := -1;
   sImovel     := '';
   sMestre     := '';
   sCodTipoImo := '';
   sImoCodigo  := '';

// Início ------- Data: 09/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
   sStatus     := '';
   iArea       := -1;
   iAtivo      := -1;
// Fim ------------------------ Marcio Motta -----------------------------------

   edtImovel.Clear;
end;



end.
