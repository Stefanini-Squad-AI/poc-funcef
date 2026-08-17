unit mSeguradora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolSeguradora = class(TFrame)
    Label5: TLabel;
    edtSeguradora: TEdit;
    btnBuscaSeguradora: TBitBtn;
    btnLimpaSeguradora: TBitBtn;
    procedure btnBuscaSeguradoraClick(Sender: TObject);
    procedure btnLimpaSeguradoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   iSeguradora : int64;
   sSeguradora : string;
  end;

implementation

{$R *.DFM}
uses dMS;

procedure TmolSeguradora.btnBuscaSeguradoraClick(Sender: TObject);
begin
  dtmMS.MS_Seguradora.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Seguradora.RetornouValor then begin
     iSeguradora := StrToInt(dtmMS.MS_Seguradora.ValoresChave[0]);
     sSeguradora := dtmMS.MS_Seguradora.ValoresChave[1];
     edtSeguradora.Text := dtmMS.MS_Seguradora.ValoresChave[1];
  end;
  btnBuscaSeguradora.SetFocus;
end;

procedure TmolSeguradora.btnLimpaSeguradoraClick(Sender: TObject);
begin
  iSeguradora := -1;
  sSeguradora := '';
  edtSeguradora.Clear;
end;

end.
