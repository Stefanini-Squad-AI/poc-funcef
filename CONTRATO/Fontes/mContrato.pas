unit mContrato;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, MontaSelect;

type
  TmolContrato = class(TFrame)
    edtContrato: TEdit;
    lblContrato: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtProcesso: TEdit;
    lblProcesso: TLabel;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }
    iContrato  : int64;
    iForCli    : int64;
    sContrato  : string;
    sProcesso  : string;
    sTipoContr : string;

    sStatus    : string;
  end;

implementation

{$R *.DFM}

uses uSistema, dMS;

procedure TmolContrato.btnBuscaContratoClick(Sender: TObject);
var sFiltro : String;
begin
   sFiltro := dtmMs.MS_Contrato.Filtro.Text;
   if sStatus = 'A' then begin
     dtmMs.MS_Contrato.Filtro.Add('C.FLGFIMCONTRATO = ''S'' ');
     dtmMs.MS_Contrato.Filtro.Add('(C.IDPROCESSORAD IS NULL) OR (R.FLGOK = ''S'') ');
   end;

   dtmMS.MS_Contrato.Executar;
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin
      iContrato  := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      sContrato  := dtmMS.MS_Contrato.ValoresChave[1];
      sProcesso  := dtmMS.MS_Contrato.ValoresChave[2];
      sTipoContr := dtmMS.MS_Contrato.ValoresChave[3];
      iForCli    := StrToInt(dtmMS.MS_Contrato.ValoresChave[4]);
      edtContrato.Text := sContrato;
      edtProcesso.Text := sProcesso;
   end;

   dtmMs.MS_Contrato.Filtro.Text := sFiltro;
   btnBuscaContrato.SetFocus;
end;


procedure TmolContrato.btnLimpaContratoClick(Sender: TObject);
begin
   iContrato  := -1;
   iForCli    := -1;
   sContrato  := '';
   sProcesso  := '';
   sTipoContr := '';
   edtContrato.Clear;
   edtProcesso.Clear;
end;



end.
