unit mUnidAutonoma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolUnidAutonoma = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaUnidaut: TBitBtn;
    btnLimpaUnidaut: TBitBtn;
    Label1: TLabel;
    edtUnidaut: TEdit;

    procedure btnBuscaUnidautClick(Sender: TObject);
    procedure btnLimpaUnidautClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
   iImovel, iMestre, iUnidaut  : int64;
   sImovel, sMestre, sUnidaut  : string;
   sImovelExtenso    : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolUnidAutonoma.btnBuscaUnidautClick(Sender: TObject);
begin
   dtmMS.MS_UnidAut.Executar;
   Repaint;
   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_UnidAut.RetornouValor then begin

      iUnidaut       := StrToInt(dtmMS.MS_Unidaut.ValoresChave[0]);
      iMestre        := StrToInt(dtmMS.MS_Unidaut.ValoresChave[2]);
      iImovel        := StrToInt(dtmMS.MS_Unidaut.ValoresChave[3]);

      sUnidaut       := dtmMS.MS_Unidaut.ValoresChave[1];
      sMestre        := dtmMS.MS_Unidaut.ValoresChave[4];
      sImovel        := dtmMS.MS_Unidaut.ValoresChave[5];

      sImovelExtenso := sMestre + ' - '+ sImovel;
      edtImovel.Text := sImovelExtenso;
      edtUnidaut.Text:= sUnidaut;

   end;
   btnBuscaUnidaut.SetFocus;
end;



procedure TmolUnidAutonoma.btnLimpaUnidautClick(Sender: TObject);
begin
   iUnidaut := -1;
   iImovel  := -1;
   iMestre  := -1;

   sUnidaut       := '';
   sImovel        := '';
   sMestre        := '';
   sImovelExtenso := '';

   edtImovel.Clear;
   edtUnidaut.Clear;
end;


end.
