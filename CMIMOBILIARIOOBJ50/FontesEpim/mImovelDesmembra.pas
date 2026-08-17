unit mImovelDesmembra;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, StdCtrls, Buttons;

type
  TmolImovelDesmembra = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    MS_ImovelInativo: TMontaSelect;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iImovel, iMestre: int64;
   sImovel, sMestre: string;

  end;



implementation
{$R *.DFM}



procedure TmolImovelDesmembra.btnBuscaImovelClick(Sender: TObject);
begin
   MS_ImovelInativo.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_ImovelInativo.RetornouValor then begin

      // Imóvel
      iMestre  := StrToInt(MS_ImovelInativo.ValoresChave[0]);
      iImovel  := StrToInt(MS_ImovelInativo.ValoresChave[1]);
      sMestre  := MS_ImovelInativo.ValoresChave[2];
      sImovel  := MS_ImovelInativo.ValoresChave[3];

      edtImovel.Text := sMestre + ' - ' + sImovel;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelDesmembra.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel  := -1;
   iMestre  := -1;

   edtImovel.Clear;
end;



end.
