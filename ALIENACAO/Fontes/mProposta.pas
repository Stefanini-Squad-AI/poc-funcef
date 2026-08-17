unit mProposta;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, MontaSelect;

type
  TmolProposta = class(TFrame)
    Label1: TLabel;
    edtNomProp: TEdit;
    btnBuscaProp: TBitBtn;
    btnLimpaProp: TBitBtn;
    edtNumProp: TEdit;
    Label2: TLabel;
    procedure btnBuscaPropClick(const iTipo:Integer; Sender: TObject);
    procedure btnLimpaPropClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iProposta  : Int64;
    sComprador : String;
  end;

implementation

uses DmsFinanc;

{$R *.DFM}

procedure TmolProposta.btnBuscaPropClick(const iTipo:Integer; Sender: TObject);
var MSTemp : TMontaSelect;
begin

// iTipo 1 - Somente Proposta
//       2 - Somente Contratos
//       3 - Propostas e Contratos

    Case iTipo of
       1 : MSTemp := dtmMS.Ms_Proposta;
       2 : MSTemp := dtmMS.Ms_Contrato;
       3 : MSTemp := dtmMS.Ms_PropostaContrato;
    end;

    MSTemp.Executar;
    Repaint;
    if MSTemp.RetornouValor then begin
       iProposta       := StrToInt(MSTemp.ValoresChave[0]);
       edtNumProp.Text := MSTemp.ValoresChave[1];
       edtNomProp.Text := MSTemp.ValoresChave[2];
       if iTipo = 2 then begin
          sComprador   := MSTemp.ValoresChave[3];
       end;
    end;
    if btnBuscaProp.CanFocus then btnBuscaProp.SetFocus;
end;

procedure TmolProposta.btnLimpaPropClick(Sender: TObject);
begin
   iProposta  := -1;
   sComprador := '';
   edtNumProp.Clear;
   edtNomProp.Clear;
end;

end.
