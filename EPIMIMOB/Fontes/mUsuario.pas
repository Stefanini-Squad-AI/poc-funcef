unit mUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TMolUsuario = class(TFrame)
    Label5: TLabel;
    edtUsuario: TEdit;
    btnBuscaUsuario: TBitBtn;
    btnLimpaUsuario: TBitBtn;

    procedure btnBuscaUsuarioClick(Sender: TObject);
    procedure btnLimpaUsuarioClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
    iUsuario     : integer;
    sLogin       : String;
    sNomeUsuario : String;
  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TMolUsuario.btnBuscaUsuarioClick(Sender: TObject);
begin
   dtmMS.MS_Usuario.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Usuario.RetornouValor then begin

      Screen.Cursor   := crHourGlass;
      edtUsuario.Text := dtmMS.MS_Usuario.ValoresChave[4] + ' - ' + dtmMS.MS_Usuario.ValoresChave[1];
      iUsuario        := StrToInt(dtmMS.MS_Usuario.ValoresChave[0]);
      sLogin          := dtmMS.MS_Usuario.ValoresChave[4];
      sNomeUsuario    := dtmMS.MS_Usuario.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaUsuario.SetFocus;
end;



procedure TMolUsuario.btnLimpaUsuarioClick(Sender: TObject);
begin
   edtUsuario.Clear;
   iUsuario     := -1;
   sLogin       := '';
   sNomeUsuario := '';
end;



end.
