unit mImovelAtivo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

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
   iCarteira         : integer;
   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolImovelAtivo.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelAtivo.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelAtivo.RetornouValor then begin

      // Imóvel
      iMestre     := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[0]);
      iImovel     := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);
      sMestre     := dtmMS.MS_ImovelAtivo.ValoresChave[2];
      sImovel     := dtmMS.MS_ImovelAtivo.ValoresChave[3];

      iCarteira   := -1;
      if dtmMS.MS_ImovelAtivo.ValoresChave[5] <> '' then begin
         iCarteira:= StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[5]);
      end;

      edtImovel.Text := sMestre + ' - ' + sImovel;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelAtivo.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel     := -1;
   iMestre     := -1;
   iCarteira   := -1;

   edtImovel.Clear;
end;



end.
