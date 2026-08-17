unit mObjeto;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolObjeto = class(TFrame)
    Label5: TLabel;
    edtObjeto: TEdit;
    btnBuscaObjeto: TBitBtn;
    btnLimpaObjeto: TBitBtn;
    procedure btnBuscaObjetoClick(Sender: TObject);
    procedure btnLimpaObjetoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iObjeto : int64;
    sObjeto : string;
  end;

implementation

{$R *.DFM}
uses dMS;

procedure TmolObjeto.btnBuscaObjetoClick(Sender: TObject);
begin
  dtmMS.MS_Objeto.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Objeto.RetornouValor then begin
     iObjeto  := StrToInt(dtmMS.MS_Objeto.ValoresChave[0]);
     sObjeto  := dtmMS.MS_Objeto.ValoresChave[1];
     edtObjeto.Text := sObjeto;
  end;
  btnBuscaObjeto.SetFocus;
end;

procedure TmolObjeto.btnLimpaObjetoClick(Sender: TObject);
begin
  iObjeto := -1;
  sObjeto := '';
  edtObjeto.Clear;
end;

end.
