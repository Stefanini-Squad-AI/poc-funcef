unit mCliente;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolCliente = class(TFrame)
    btnBuscaCli: TBitBtn;
    btnLimpaCli: TBitBtn;
    edtNomeFantasia: TEdit;
    Label5: TLabel;
    edtRazaoSocial: TEdit;

    procedure btnBuscaCliClick(Sender: TObject);
    procedure btnLimpaCliClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iCliente : int64;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolCliente.btnBuscaCliClick(Sender: TObject);
begin
   dtmMS.MS_Cliente.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Cliente.RetornouValor then begin

      // Imóvel
      iCliente := StrToInt(dtmMS.MS_Cliente.ValoresChave[0]);

      edtNomeFantasia.Text := dtmMS.MS_Cliente.ValoresChave[1];
      edtRazaoSocial.Text  := dtmMS.MS_Cliente.ValoresChave[2];
   end;

   if btnBuscaCli.CanFocus then btnBuscaCli.SetFocus;
end;



procedure TmolCliente.btnLimpaCliClick(Sender: TObject);
begin
   iCliente := -1;

   edtNomeFantasia.Clear;
   edtRazaoSocial.Clear;
end;



end.
