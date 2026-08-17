unit mObraDesmembra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, StdCtrls, Buttons;

type
  TmolObraDesmembra = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaObra: TBitBtn;
    btnLimpaObra: TBitBtn;
    MS_Obra: TMontaSelect;
    memObra: TMemo;

    procedure btnBuscaObraClick(Sender: TObject);
    procedure btnLimpaObraClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iObra, iImovel: int64;
   sImovel, sMestre, sObra : String;
  end;


implementation
{$R *.DFM}

procedure TmolObraDesmembra.btnBuscaObraClick(Sender: TObject);
begin
   MS_Obra.Executar;
   Repaint;
   if MS_Obra.RetornouValor then begin
      iObra   := StrToInt(MS_Obra.ValoresChave[0]);
      iImovel := StrToInt(MS_Obra.ValoresChave[1]);
      sMestre := MS_Obra.ValoresChave[2];
      sImovel := MS_Obra.ValoresChave[3];
      sObra   := MS_Obra.ValoresChave[4];
      edtImovel.Text := sMestre + ' - ' + sImovel;
      memObra.Text   := sObra;
   end;
   btnBuscaObra.SetFocus;
end;

procedure TmolObraDesmembra.btnLimpaObraClick(Sender: TObject);
begin
   iObra   := -1;
   sImovel := '';
   sMestre := '';

   edtImovel.Clear;
   memObra.Clear;
end;

end.
