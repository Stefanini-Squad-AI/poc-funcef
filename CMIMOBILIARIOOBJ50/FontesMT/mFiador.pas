unit mFiador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolFiador = class(TFrame)
    Label5: TLabel;
    edtFiador: TEdit;
    btnBuscaFiador: TBitBtn;
    btnLimpaFiador: TBitBtn;

    procedure btnBuscaFiadorClick(Sender: TObject);
    procedure btnLimpaFiadorClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
   iFiador    : int64;
   sFiador    : string;
   sFiador_RS : String;
  end;

implementation

{$R *.DFM}
uses dMS;


procedure TmolFiador.btnBuscaFiadorClick(Sender: TObject);
begin
  dtmMS.MS_Fiador.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Fiador.RetornouValor then begin
     iFiador        := StrToInt(dtmMS.MS_Fiador.ValoresChave[0]);
     sFiador        := dtmMS.MS_Fiador.ValoresChave[1];
     sFiador_RS     := dtmMS.MS_Fiador.ValoresChave[2];
     edtFiador.Text := dtmMS.MS_Fiador.ValoresChave[1];
  end;
  btnBuscaFiador.SetFocus;
end;

procedure TmolFiador.btnLimpaFiadorClick(Sender: TObject);
begin
  iFiador    := -1;
  sFiador    := '';
  sFiador_RS := '';
  edtFiador.Clear;
end;


end.
