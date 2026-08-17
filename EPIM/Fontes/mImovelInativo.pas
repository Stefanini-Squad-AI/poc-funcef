unit mImovelInativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovelInativo = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;




procedure TmolImovelInativo.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelInativo.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelInativo.RetornouValor then begin

      // Imóvel
      iMestre     := StrToInt(dtmMS.MS_ImovelInativo.ValoresChave[0]);
      iImovel     := StrToInt(dtmMS.MS_ImovelInativo.ValoresChave[1]);
      sMestre     := dtmMS.MS_ImovelInativo.ValoresChave[2];
      sImovel     := dtmMS.MS_ImovelInativo.ValoresChave[3];

      edtImovel.Text := sMestre + ' - ' + sImovel;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelInativo.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel     := -1;
   iMestre     := -1;

   edtImovel.Clear;
end;



end.
