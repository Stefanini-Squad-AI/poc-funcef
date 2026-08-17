unit mListaPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, CheckLst;

type
   TmolListaPatro = class(TFrame)
      Label6: TLabel;
      lstPatro: TCheckListBox;
      btnInvertePatro: TBitBtn;
      btnMarcaTodosPatro: TBitBtn;

      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);


   private { Private declarations }

      procedure MarcaTodosPatro;
      procedure InvertePatro;


   public { Public declarations }

      vIDPatro : array of Int64;

      procedure PreenchePatro;
      function  PegaPatro: String;
      function  ListaPatro(const bTodos: Boolean = True): String;

   end;



implementation
{$R *.DFM}
uses
   dLookEmptmo, uFuncoesEmptmo;



procedure TmolListaPatro.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPatro, i);

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do
   begin
      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      inc(i);
      SetLength(vIDPatro, i);
      vIDPatro[i-1] := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TmolListaPatro.MarcaTodosPatro;
var
   i : Integer;
begin
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



procedure TmolListaPatro.InvertePatro;
var
  i : Integer;
begin
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



function TmolListaPatro.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do
   begin
      if lstPatro.Checked[i] then
      begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vIDPatro[i]);
      end;
   end;

   Result := sPatros;
end;



function TmolListaPatro.ListaPatro(const bTodos: Boolean = True): String;
var
   i        : Integer;
   sPatros  : String;
   bFalta   : Boolean;
begin
   inherited;

   sPatros := '';
   bFalta  := False;

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do
   begin
      if lstPatro.Checked[i] then
      begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + lstPatro.Items[i];
      end
      else
      begin
         bFalta := True;
      end;
   end;

   Result := sPatros;
   if (bTodos) and not(bFalta) then Result := '< todas >';
end;



procedure TmolListaPatro.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro
end;



procedure TmolListaPatro.btnInvertePatroClick(Sender: TObject);
begin
   inherited;
   InvertePatro;
end;



end.
