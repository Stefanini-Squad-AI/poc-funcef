unit FPrazoSimula;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, CheckLst, Db, DBTables, Wwquery;

type
   TfrmPrazoSimula = class(TFrmOkCancelarImob)
      lstPrazo: TCheckListBox;
      Panel3: TPanel;
      btnInvertePrazo: TBitBtn;
      btnMarcaTodosPrazo: TBitBtn;
      qryLookTipoContrato: TwwQuery;
      qryLookTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoContratoTCEDESCRICAO: TStringField;
      qryLookTipoContratoTCEMAXPARC: TFloatField;
      qryLookTipoContratoTCEMINPARC: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure btnMarcaTodosPrazoClick(Sender: TObject);
      procedure btnInvertePrazoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations


   public   // Public declarations

      iTipoContrato : Int64;

   end;



var
  frmPrazoSimula: TfrmPrazoSimula;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, fCadInscricao;



procedure TfrmPrazoSimula.FormShow(Sender: TObject);
var
   iMin  : Integer;
   iMax  : Integer;
   i     : Integer;
begin
   inherited;

   with qryLookTipoContrato do
   begin
      LimpaParametros(qryLookTipoContrato);
      ParamByName('PIDTIPOCONTREMPTMO').asInteger := iTipoContrato;
      Open;

      iMin  := qryLookTipoContratoTCEMINPARC.AsInteger;
      iMax  := qryLookTipoContratoTCEMAXPARC.AsInteger;

      Close;
   end;

   lstPrazo.Clear;
   SetLength(frmCadInscricao.vPrazo, iMax + 1);

   for i := 1 to iMax do
   begin
      lstPrazo.Items.Add(IntToStr(i));

      frmCadInscricao.vPrazo[i] := 0;
      if ( i >= iMin ) and ( i <= iMax ) then frmCadInscricao.vPrazo[i] := 1;
   end;

   for i := 0 to (lstPrazo.Items.Count - 1) do lstPrazo.Checked[i] := True;
end;



procedure TfrmPrazoSimula.btnMarcaTodosPrazoClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to (lstPrazo.Items.Count - 1) do lstPrazo.Checked[i] := True;
end;



procedure TfrmPrazoSimula.btnInvertePrazoClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to (lstPrazo.Items.Count - 1) do lstPrazo.Checked[i] := not(lstPrazo.Checked[i]);
end;



procedure TfrmPrazoSimula.bbtnConfirmarClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to (lstPrazo.Items.Count - 1) do
   begin
      frmCadInscricao.vPrazo[i+1] := 0;
      if lstPrazo.Checked[i] then frmCadInscricao.vPrazo[i+1] := 1;
   end;

   inherited;
end;



end.
