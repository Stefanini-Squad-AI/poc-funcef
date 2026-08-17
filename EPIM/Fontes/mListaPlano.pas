unit mListaPlano;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, CheckLst;

type
   TmolListaPlano = class(TFrame)
      Label6: TLabel;
      lstPlano: TCheckListBox;
      btnInvertePlano: TBitBtn;
      btnMarcaTodosPlano: TBitBtn;

      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);


   private { Private declarations }

      procedure MarcaTodosPlano;
      procedure InvertePlano;


   public { Public declarations }

      vIDPlano : array of Int64;

      procedure PreenchePlano;
      function  PegaPlano: String;

   end;



implementation
{$R *.DFM}
uses
   dLookEmptmo, uFuncoesEmptmo;



procedure TmolListaPlano.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planocinadoras
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);

   // Preenche a listbox de Planocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;

      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TmolListaPlano.MarcaTodosPlano;
var
   i : Integer;
begin
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



procedure TmolListaPlano.InvertePlano;
var
  i : Integer;
begin
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



function TmolListaPlano.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de Planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vIDPlano[i]);
      end;
   end;

   Result := sPlanos;
end;



procedure TmolListaPlano.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano
end;



procedure TmolListaPlano.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   InvertePlano;
end;



end.
