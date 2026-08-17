unit mSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolSubConta = class(TFrame)
    Label5: TLabel;
    edtSubConta: TEdit;
    btnBuscaSubConta: TBitBtn;
    btnLimpaSubConta: TBitBtn;
    procedure btnBuscaSubContaClick(Sender: TObject);
    procedure btnLimpaSubContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   iSubConta : int64;
   sSubConta : string;
  end;

implementation

{$R *.DFM}
uses dMS;

procedure TmolSubConta.btnBuscaSubContaClick(Sender: TObject);
begin
  dtmMS.MS_SubConta.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_SubConta.RetornouValor then begin
     iSubConta := StrToInt(dtmMS.MS_SubConta.ValoresChave[0]);
     sSubConta := dtmMS.MS_SubConta.ValoresChave[1];
     edtSubConta.Text := sSubConta;
  end;
  btnBuscaSubConta.SetFocus;
end;

procedure TmolSubConta.btnLimpaSubContaClick(Sender: TObject);
begin
  iSubConta := -1;
  sSubConta := '';
  edtSubConta.Clear;
end;

end.
