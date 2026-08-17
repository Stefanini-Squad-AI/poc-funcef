unit mResponsavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TMolResponsavel = class(TFrame)
    Label5: TLabel;
    edtResponsavel: TEdit;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaResponsavel: TBitBtn;
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iResponsavel: integer;
  end;

implementation

{$R *.DFM}

uses dLookImobiliario, DMS;

procedure TMolResponsavel.btnBuscaResponsavelClick(Sender: TObject);
begin
   dtmMS.MS_Responsavel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Responsavel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iResponsavel         := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtResponsavel.Text  := dtmMS.MS_Responsavel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaResponsavel.SetFocus;
end;

procedure TMolResponsavel.btnLimpaResponsavelClick(Sender: TObject);
begin
   iResponsavel := -1;
   edtResponsavel.Clear;
end;

end.
