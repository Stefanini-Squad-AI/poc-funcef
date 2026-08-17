unit mRepactuacao;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, MontaSelect, TREdit, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TmolRepactuacao = class(TFrame)
    Label1: TLabel;
    edtNomProp: TEdit;
    btnBuscaRep: TBitBtn;
    btnLimpaRep: TBitBtn;
    edtNumProp: TEdit;
    Label2: TLabel;
    edtComprador: TEdit;
    Label3: TLabel;
    gbCondInicial: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtSaldoDev: TDBRealEdit;
    gbInicio: TGroupBox;
    cmDtVencto: TCMDateTimePicker;
    edtParc: TDBRealEdit;
    edtDataRepactua: TCMDateTimePicker;
    procedure btnLimpaRepClick(Sender: TObject);
    procedure btnBuscaRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iContrato        : Int64;
    iRepactuacao     : Int64;
    iCondPagInicial  : Int64;
    sComprador       : String;
    dDataRepactua    : TDateTime;
    dDataVenctoIni   : TDateTime;
  end;

implementation

uses Dms;

{$R *.DFM}


procedure TmolRepactuacao.btnLimpaRepClick(Sender: TObject);
begin
   iContrato        := -1;
   iRepactuacao     := -1;
   iCondPagInicial  := -1;
   sComprador       := '';
   edtNumProp.Clear;
   edtNomProp.Clear;
   edtComprador.Clear;
   cmDtVencto.Clear;
   edtSaldoDev.Clear;
   edtParc.Clear;
   edtDataRepactua.Clear;
end;

procedure TmolRepactuacao.btnBuscaRepClick(Sender: TObject);
var dia, mes, ano : Word;
begin
   with dtmMS.Ms_AlienaRepactua do begin
      Executar;
      Repaint;

      if RetornouValor then begin
         iContrato         := StrToInt(ValoresChave[0]);
         iRepactuacao      := StrToInt(ValoresChave[1]);
         iCondPagInicial   := StrToInt(ValoresChave[3]);
         sComprador        := ValoresChave[6];
         dDataRepactua     := StrToDate(ValoresChave[11]);
         dDataVenctoIni    := StrToDate(ValoresChave[7]);
         edtNumProp.Text   := ValoresChave[4];
         edtNomProp.Text   := ValoresChave[5];
         edtComprador.Text := ValoresChave[6];
         cmDtVencto.Date   := StrToDate(ValoresChave[7]);
         edtSaldoDev.Value := StrToFloat(ValoresChave[8]);
         edtParc.Value     := StrToInt(ValoresChave[9]);
         edtDataRepactua.Date := StrToDate(ValoresChave[11]);
      end;   
   end;
   if btnBuscaRep.CanFocus then btnBuscaRep.SetFocus;
end;

end.
