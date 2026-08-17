unit mClasseBem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolClasseBem = class(TFrame)
    label1: TLabel;
    edtClasseBem: TEdit;
    btnBuscaClasseBem: TBitBtn;
    btnLimpaClasseBem: TBitBtn;
    procedure btnBuscaClasseBemClick(Sender: TObject);
    procedure btnLimpaClasseBemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iClasseBem : integer;
  end;

implementation

{$R *.DFM}

uses dMs;

procedure TmolClasseBem.btnBuscaClasseBemClick(Sender: TObject);
begin
   dtmMS.MS_ClasseBem.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ClasseBem.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iClasseBem         := StrToInt(dtmMS.MS_ClasseBem.ValoresChave[0]);
      edtClasseBem.Text  := dtmMS.MS_ClasseBem.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaClasseBem.SetFocus;
end;

procedure TmolClasseBem.btnLimpaClasseBemClick(Sender: TObject);
begin
   iClasseBem := -1;
   edtClasseBem.Clear;
end;

end.
