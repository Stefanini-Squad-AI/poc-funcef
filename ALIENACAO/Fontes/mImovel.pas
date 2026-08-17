unit mImovel;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovel = class(TFrame)
    Label1: TLabel;
    edtNomMestre: TEdit;
    Label2: TLabel;
    edtNomImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iImovel : Int64;
    iMestre : Int64;
    iArea   : Double;
    sStatus : String;
  end;

implementation

uses DmsFinanc;

{$R *.DFM}

procedure TmolImovel.btnBuscaImovelClick(Sender: TObject);
begin
    dtmMS.MS_Imovel.Executar;
    Repaint;
    if dtmMS.MS_Imovel.RetornouValor then begin
       iImovel           := StrToInt(dtmMS.MS_Imovel.ValoresChave[0]);
       if dtmMS.MS_Imovel.ValoresChave[3] <> '' then
            iArea        := StrToFloat(dtmMS.MS_Imovel.ValoresChave[3])
       else iArea        := 0;
       iMestre           := StrToInt(dtmMS.MS_Imovel.ValoresChave[4]);
       sStatus           := dtmMS.MS_Imovel.ValoresChave[5];
       edtNomMestre.Text := dtmMS.MS_Imovel.ValoresChave[1];
       edtNomImovel.Text := dtmMS.MS_Imovel.ValoresChave[2];
    end;
    if btnBuscaImovel.CanFocus then btnBuscaImovel.SetFocus;
end;

procedure TmolImovel.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel := -1;
   iMestre := -1;
   iArea   :=  0;
   edtNomMestre.Clear;
   edtNomImovel.Clear;
end;

end.
