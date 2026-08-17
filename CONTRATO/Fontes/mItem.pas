unit mItem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolItem = class(TFrame)
    Label5: TLabel;
    edtItem: TEdit;
    btnBuscaItem: TBitBtn;
    btnLimpaItem: TBitBtn;
    procedure btnBuscaItemClick(Sender: TObject);
    procedure btnLimpaItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iItem : int64;
    sItem : string;
  end;

implementation

{$R *.DFM}
uses dMS;

procedure TmolItem.btnBuscaItemClick(Sender: TObject);
begin
  dtmMS.MS_Item.Executar;
  Repaint;
  // se houve busca, abre a query com o registro buscado
  if dtmMS.MS_Item.RetornouValor then begin
     iItem  := StrToInt(dtmMS.MS_Item.ValoresChave[0]);
     sItem  := dtmMS.MS_Item.ValoresChave[1];
     edtItem.Text := sItem;
  end;
  btnBuscaItem.SetFocus;
end;

procedure TmolItem.btnLimpaItemClick(Sender: TObject);
begin
  iItem := -1;
  sItem := '';
  edtItem.Clear;
end;

end.
