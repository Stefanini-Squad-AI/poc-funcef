unit mImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovel = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

    
  private { Private declarations }

   procedure ImovelExtenso;


  public { Public declarations }
   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;
   sImovelExtenso    : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



// define e preenche o nome do Imóvel
procedure TmolImovel.ImovelExtenso;
begin
   sImovelExtenso := '';
   if ( (sMestre <> '') and (sImovel <> '') ) then sImovelExtenso := sMestre + ' - ' + sImovel;

   edtImovel.Clear;
   if sImovelExtenso <> '' then edtImovel.Text := sImovelExtenso;
end;



procedure TmolImovel.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_Imovel.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin

      iMestre        := StrToInt(dtmMS.MS_Imovel.ValoresChave[0]);
      iImovel        := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      sMestre        := dtmMS.MS_Imovel.ValoresChave[2];
      sImovel        := dtmMS.MS_Imovel.ValoresChave[3];

      // define e preenche o nome do Imóvel
      ImovelExtenso;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovel.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel  := -1;
   iMestre  := -1;
   sImovel  := '';
   sMestre  := '';

   // define e preenche o nome do Imóvel
   ImovelExtenso;
end;



end.
