unit mLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolLoja = class(TFrame)
    Label5: TLabel;
    edtLoja: TEdit;
    btnBuscaLoja: TBitBtn;
    btnLimpaLoja: TBitBtn;

    procedure btnBuscaLojaClick(Sender: TObject);
    procedure btnLimpaLojaClick(Sender: TObject);
  private
    { Private declarations }
    procedure LojaExtenso;
  public
    { Public declarations }
    iImovelFiltro : Integer;
    iLoja, iImovel : Integer;
    sPiso, sLoja, sLojaExtenso : String;
    fAbl : Extended;
  end;

implementation

uses dMS;

{$R *.DFM}

{ TmolLoja }

procedure TmolLoja.LojaExtenso;
begin
  edtLoja.Clear;
  sLojaExtenso := '';
  if (sPiso <> '') and (sLoja <> '') then
       sLojaExtenso := sPiso + ' - ' + sLoja
  else sLojaExtenso := sPiso + sLoja;
  if sLojaExtenso <> '' then edtLoja.Text := sLojaExtenso;
end;

procedure TmolLoja.btnBuscaLojaClick(Sender: TObject);
var sFiltro : String;
begin
  sFiltro := dtmMS.MS_Loja.Filtro.Text;
  if iImovelFiltro > 0 then begin
     dtmMS.MS_Loja.Filtro.Add('L.IDIMOVEL = ' + IntToStr(iImovelFiltro) );
  end;

  dtmMS.MS_Loja.Executar;
  Repaint;
  if dtmMS.MS_Loja.RetornouValor then begin
     iLoja   := StrToInt(dtmMS.MS_Loja.ValoresChave[0]);
     iImovel := StrToInt(dtmMS.MS_Loja.ValoresChave[3]);
     sPiso   := dtmMS.MS_Loja.ValoresChave[1];
     sLoja   := dtmMS.MS_Loja.ValoresChave[2];
     fAbl    := StrToFloat(dtmMS.MS_Loja.ValoresChave[4]);
     LojaExtenso;
  end;
  dtmMS.MS_Loja.Filtro.Text := sFiltro;
  btnBuscaLoja.SetFocus;
end;

procedure TmolLoja.btnLimpaLojaClick(Sender: TObject);
begin
  iImovel := -1;
  iLoja   := -1;
  sLoja   := '';
  sPiso   := '';
  fAbl    := 0;
  LojaExtenso;
end;

end.
