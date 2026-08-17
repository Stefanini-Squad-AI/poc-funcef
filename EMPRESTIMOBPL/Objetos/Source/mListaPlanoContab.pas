unit mListaPlanoContab;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, CheckLst;

type
   TmolListaPlanoContab = class(TFrame)
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
      function  ListaPlano(const bTodos: Boolean = True): String;

   end;



implementation
{$R *.DFM}
uses
   dLookEmptmo, uFuncoesEmptmo;



procedure TmolListaPlanoContab.PreenchePlano;
var
   i : Integer;
begin
   if not(dtmLookEmptmo.qryLookPlanPrevContab.Active) then dtmLookEmptmo.qryLookPlanPrevContab.Open;
   dtmLookEmptmo.qryLookPlanPrevContab.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);

   while not(dtmLookEmptmo.qryLookPlanPrevContab.EOF) do
   begin
      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevContabNOME.AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := dtmLookEmptmo.qryLookPlanPrevContabIDPLANOPREV.AsInteger;

      dtmLookEmptmo.qryLookPlanPrevContab.Next;
   end;
end;



procedure TmolListaPlanoContab.MarcaTodosPlano;
var
   i : Integer;
begin
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



procedure TmolListaPlanoContab.InvertePlano;
var
  i : Integer;
begin
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



function TmolListaPlanoContab.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de Planos
   for i := 0 to (lstPlano.Items.Count - 1) do
   begin
      if lstPlano.Checked[i] then
      begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vIDPlano[i]);
      end;
   end;

   Result := sPlanos;
end;



function TmolListaPlanoContab.ListaPlano(const bTodos: Boolean = True): String;
var
   i        : Integer;
   sPlanos  : String;
   bFalta   : Boolean;
begin
   inherited;

   sPlanos := '';
   bFalta  := False;

   // concatena a String de Planos
   for i := 0 to (lstPlano.Items.Count - 1) do
   begin
      if lstPlano.Checked[i] then
      begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + lstPlano.Items[i];
      end
      else
      begin
         bFalta := True;
      end;
   end;

   Result := sPlanos;
   if (bTodos) and not(bFalta) then Result := '< todos >';
end;



procedure TmolListaPlanoContab.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TmolListaPlanoContab.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   InvertePlano;
end;



end.
