unit mImovelMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovelMestre = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iMestre  : int64;
   sMestre  : string;
  end;



implementation
{$R *.DFM}
uses
   dMS;


procedure TmolImovelMestre.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelMestre.Executar;
   Repaint;
   // se houve busca, abre a query com o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin
      iMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      sMestre        := dtmMS.MS_ImovelMestre.ValoresChave[1];
      edtImovel.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];
   end;
   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelMestre.btnLimpaImovelClick(Sender: TObject);
begin
   iMestre  := -1;
   sMestre  := '';
   edtImovel.Clear;
end;


end.
