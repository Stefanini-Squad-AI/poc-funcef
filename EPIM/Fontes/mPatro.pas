unit mPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolPatro = class(TFrame)
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    Label5: TLabel;
    btnBuscaPatro: TBitBtn;
    btnLimpaCli: TBitBtn;

    procedure btnBuscaPatroClick(Sender: TObject);
    procedure btnLimpaCliClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
   iPatro : int64;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolPatro.btnBuscaPatroClick(Sender: TObject);
begin
   dtmMS.MS_Patro.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Patro.RetornouValor then begin

      // Imóvel
      iPatro := StrToInt(dtmMS.MS_Patro.ValoresChave[0]);

      edtNomeFantasia.Text := dtmMS.MS_Patro.ValoresChave[1];
      edtRazaoSocial.Text  := dtmMS.MS_Patro.ValoresChave[2];
   end;

   if btnBuscaPatro.CanFocus then btnBuscaPatro.SetFocus;
end;



procedure TmolPatro.btnLimpaCliClick(Sender: TObject);
begin
   iPatro := -1;

   edtNomeFantasia.Clear;
   edtRazaoSocial.Clear;
end;



end.
