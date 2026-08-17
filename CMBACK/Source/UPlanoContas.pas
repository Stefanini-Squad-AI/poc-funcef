unit UPlanoContas;

interface
uses ComCtrls, WwTable,  SysUtils,Graphics, StdCtrls, Controls, Mask, DBCtrls, DBLookup, ExtCtrls, DBGrids,
     Forms, DB, DBTables, Grids ,Dialogs, CMwwQuery,
     Printers, Classes, Menus;

    Function  VerificaMascara(sMascara : String;var sMascPict : String;var lNivel : Array of Integer;var iSoma : Integer;var ind : Integer) : Boolean;
    Function  TiraPontos(sNoAnterior : String;lNivel : Array of Integer;ind : Integer) : String;
    Function  CalcGrau(sNoAnterior : String;lNivel : Array of Integer;ind : Integer;var sPai : String) : Integer;
    Procedure PreencheArvore(var sConta :String;sNoAnterior,sNomeConta : String;var treePlano : TTreeView;var iUltFilho,lNivel : Array of Integer;ind,iSoma,iSomaAnt : Integer);
    Function  CorrigeReal(sValor : String) : String;

implementation

Function VerificaMascara(sMascara : String; var sMascPict : String; var lNivel  : Array  of Integer; var iSoma : Integer; var ind : Integer) : Boolean;
var
  i         : Integer;
begin
  Result    := true;
  lNivel[0] := 1;
  iSoma     := 0;
  ind       := 0;
  sMascPict := copy(sMascara,1,1);
  for i := 1 to Length(sMascara) do begin
       if i > 1 then
          sMascPict := sMascPict + copy(sMascara,i,1);
       if copy(sMascara,i,1) ='.' then begin
          ind := ind + 1;
          lnivel[ind] := i - ind - iSoma;
          iSoma := iSoma + lNivel[ind];
       end;
   end;
  if (ind = 0) and (length(sMascara) > 0) then begin
      lnivel[1] := length(sMascara);
      ind := 1;
  end;
  if ind = 0 then
     Result := false;
  lNivel[ind+1] := Length(sMascara) - ind - iSoma;
end;

//==============================================================================
Procedure PreencheArvore(var sConta : String; sNoAnterior,sNomeConta : String;var treePlano : TTreeView;var iUltFilho,lNivel : Array of Integer;ind,iSoma,iSomaAnt : Integer);
var
  iNivel      : Integer;
  i           : Integer;
  iSomaTot    : Integer;
begin
  iNivel := 0;
  iSomaTot := iSoma + lNivel[ind+1];
  for i := (ind + 1) downto 1 do begin
      if length(sConta) >= iSomaTot then begin
         iNivel := i;
         break;
      end;
      iSomaTot := iSomaTot - lNivel[i];
  end;

  iSoma := iSomaAnt;
  for i := ind downto 1 do begin
      if copy(sConta,(isoma + 1),1) <> '' then
         insert('.',sConta,(isoma + 1));
      iSoma := iSoma - lNivel[i];
  end;
  if copy(sNoAnterior,1,1) <> copy(sConta,1,1) then   { Grupo diferente}
     begin
       treePlano.Items.Add(treePlano.TopItem,sConta + ' - '+ sNomeConta);
       for i := 1 to 20 do
         iUltFilho[i] := 0;
     end
  else if length(sConta) > length(sNoAnterior)   then  { Filho da Sintética anterior}
     begin
       treePlano.Selected := treePlano.Items.Item[treePlano.Items.Count-1];
       treePlano.Items.AddChild(treePlano.Selected,sConta +' - '+ sNomeConta);
     end
  else                                                 { Filho ou irmã da sintética anterior}
     begin
       treePlano.Selected := treePlano.Items.Item[iUltFilho[inivel]];
       treePlano.Items.Add(treePlano.Selected,sConta + ' - '+ sNomeConta);

     end;
  treePlano.Selected := treePlano.Items.Item[treePlano.Items.Count-1];
  iUltFilho[inivel] := treePlano.Selected.AbsoluteIndex;

end;

//==============================================================================
Function  TiraPontos(sNoAnterior : String;lNivel : Array of Integer;ind : Integer) : String;
var
   i    : Integer;
   iAux : Integer;
begin
iAux   := 1;
Result := '';
for i:= 1 to ind+1 do
    begin
      if (copy(sNoAnterior,iAux,1) <> ' ') and (copy(sNoAnterior,iAux,1) <> '-') then
         begin
           Result := Result + Copy(sNoAnterior,iAux,lNivel[i]);
           iAux := iAux + lNivel[i] + 1;
         end
      else
         break
    end;
end;

//==============================================================================
Function  CalcGrau(sNoAnterior : String;lNivel : Array of Integer;ind : Integer;var sPai : String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin
iAux   := 0;
Result := 0;
sAux   := '';
lAux   := false;
for i:= 1 to ind+1 do
    begin
       inc(Result);
       iAux:=iAux+lNivel[i];
       if length(sNoAnterior)=iAux then
          begin
             lAux:=True;
             sPai := Copy(sNoAnterior,1,iAux-lNivel[i]);
             break;
          end;
    end;

    if not lAux then
       Result:=0;

end;
Function CorrigeReal(sValor : String) : String;
Var
  iPonto : Integer;
  sRealF : String;
Begin
  iPonto := 1;
  sRealF := '';
  While iPonto <= Length(sValor) do Begin
      if decimalSeparator = ',' then
         if copy(sValor,iPonto,1) <> '.' then
            sRealF := sRealF + copy(sValor,iPonto,1);
      if decimalSeparator = '.' then
         if copy(sValor,iPonto,1) <> ',' then
            sRealF := sRealF + copy(sValor,iPonto,1);
      inc(iPonto);
  end;
  Result := sRealF;
end;

end.
