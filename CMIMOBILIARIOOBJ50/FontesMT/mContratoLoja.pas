unit mContratoLoja;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolContratoLoja = class(TFrame)
    Label5: TLabel;
    edtContrato: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    Label1: TLabel;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iContrato : Integer;
    sContrato : String;
    sTipo     : String;
    iImovel, iImovelFiltro : Integer;
    dInicio   : TDateTime;
    sStatus   : String;
  end;

implementation

uses dMS;

{$R *.DFM}

procedure TmolContratoLoja.btnBuscaContratoClick(Sender: TObject);
var sFiltro : string;
begin
  sFiltro := dtmMS.MS_ContratoLoja.Filtro.Text;

  if iImovelFiltro <> -1 then
    dtmMS.MS_ContratoLoja.Filtro.Add('CL.IDIMOVEL = '+IntToStr(iImovelFiltro));

  dtmMS.MS_ContratoLoja.Executar;
  Repaint;
  if dtmMS.MS_ContratoLoja.RetornouValor then begin
     iContrato := StrToInt(dtmMS.MS_ContratoLoja.ValoresChave[0]);
     iImovel   := StrToInt(dtmMS.MS_ContratoLoja.ValoresChave[4]);
     dInicio   := StrToDate(dtmMS.MS_ContratoLoja.ValoresChave[5]);
     sStatus   := dtmMS.MS_ContratoLoja.ValoresChave[6];
     sContrato := dtmMS.MS_ContratoLoja.ValoresChave[1] + ' - ' + dtmMS.MS_ContratoLoja.ValoresChave[2];
     edtContrato.Text := sContrato;
     if dtmMS.MS_ContratoLoja.ValoresChave[3] = 'A' then sTipo := 'Âncora';
     if dtmMS.MS_ContratoLoja.ValoresChave[3] = 'S' then sTipo := 'Satélite';
     if dtmMS.MS_ContratoLoja.ValoresChave[3] = 'Q' then sTipo := 'Quiosque';
  end;
  btnBuscaContrato.SetFocus;
  dtmMS.MS_ContratoLoja.Filtro.Text := sFiltro;
end;

procedure TmolContratoLoja.btnLimpaContratoClick(Sender: TObject);
begin
  iContrato := -1;
  iImovel   := -1;
  dInicio   := -1;
  sContrato := '';
  sTipo     := '';
  sStatus   := '';
  edtContrato.Text := '';
end;

end.
