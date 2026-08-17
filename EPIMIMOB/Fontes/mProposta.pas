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
    procedure btnBuscaPropClick(const iTipo:Integer; const bSoVigentes : boolean; Sender: TObject);
    procedure btnLimpaPropClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iProposta    : Int64;
    iComprador   : Int64;
    sComprador   : String;
    sNumContrato : String;
    dDataAssinatura : TDateTime;
  end;

implementation

uses Dms;

{$R *.DFM}

procedure TmolProposta.btnBuscaPropClick(const iTipo:Integer; const bSoVigentes : boolean; Sender: TObject);
var MSTemp : TMontaSelect;
begin

// iTipo 1 - Somente Proposta
//       2 - Somente Contratos
//       3 - Propostas e Contratos

    Case iTipo of
       1 : MSTemp := dtmMS.Ms_AlienaProposta;
       2 : MSTemp := dtmMS.Ms_AlienaContrato;
       3 : MSTemp := dtmMS.Ms_AlienaPropostaContrato;
    end;

    // Para contratos Vigentes
    if bSoVigentes then
      MSTemp.Filtro.Add('C.FLGSTATUS = ''V''');

    MSTemp.Executar;
    Repaint;
    if MSTemp.RetornouValor then begin
       iProposta       := StrToInt(MSTemp.ValoresChave[0]);
       sNumContrato    := MSTemp.ValoresChave[1];
       edtNumProp.Text := MSTemp.ValoresChave[1];
       edtNomProp.Text := MSTemp.ValoresChave[2];

// Daniel Simões - Início ------------------------------------------------------
       if iTipo=1 then begin
         try
           dDataAssinatura := StrToDate(MSTemp.ValoresChave[3]);
         except
           dDataAssinatura := -1;
         end;
       end else begin
         if iTipo=2 then begin
           try
             dDataAssinatura := StrToDate(MSTemp.ValoresChave[5]);
           except
             dDataAssinatura := -1;
           end;
         end else begin
           try
             dDataAssinatura := StrToDate(MSTemp.ValoresChave[4]);
           except
             dDataAssinatura := -1;
           end;
         end;
       end;
// Daniel Simões - Fim ---------------------------------------------------------

       if iTipo = 2 then begin
          sComprador   := MSTemp.ValoresChave[3];
          iComprador   := StrToInt(MSTemp.ValoresChave[4]);
       end;
    end;
    if btnBuscaProp.CanFocus then btnBuscaProp.SetFocus;
end;

procedure TmolProposta.btnLimpaPropClick(Sender: TObject);
begin
   iProposta    := -1;
   iComprador   := -1;
   sComprador   := '';
   sNumContrato := '';
   edtNumProp.Clear;
   edtNomProp.Clear;
end;

end.
