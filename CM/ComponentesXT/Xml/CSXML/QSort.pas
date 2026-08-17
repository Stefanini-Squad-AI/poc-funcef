unit QSort;
{ *************************** QSORT.PAS *******************************
 PURPOSE AND IMPLEMENTATION:
  This unit provides generic quick sort function for use by various
  routines.  It also provides some comparison routines to make writing
  a sort routine easier.

 HISTORY:
  Created on June 19, 1996 by Colin Patrick Sarsfield
   Code for sort logic extracted from
    Quick Sort Routine (qsort.p) by Charlie Ross
    http://ecswww.baylor.edu/code_storehouse/pascal/qsort.html

 COPYRIGHT:
  Released into the public domain by Colin Sarsfield 1/30/97.
 ************************************************************************}

interface

type
  TCompareProc = function(const a, b: Longint): Longint of object;
  TExchangeProc = procedure(const a, b: Longint) of object;

  { main quick sort procedure }
procedure QuickSort(const p, r: Longint; const Compare: TCompareProc;
  const Exchange: TExchangeProc);

{ some useful comparison routines }
function CompareFloats(const a, b: Single): Longint;
function CompareIntegers(const a, b: Longint): Longint;

implementation

function CompareFloats(const a, b: Single): Longint;
begin
  if a > b then
    Result := 1
  else if a < b then
    Result := -1
  else
    Result := 0;
end;

function CompareIntegers(const a, b: Longint): Longint;
begin
  Result := a - b;
end;

function Partition(const p, r: Longint; const Compare: TCompareProc;
  const Exchange: TExchangeProc): Longint;
var
  i, j: Longint;
begin
  i := p;
  j := r;
  Result := 0; { to remove compiler warning }
  while True do begin
    while ((j > p) and (Compare(j, p) >= 0)) do
      Dec(j);
    while ((i < r) and (Compare(i, p) < 0)) do
      Inc(i);
    if i < j then
      Exchange(i, j)
    else begin
      Result := j;
      Break;
    end; {else}
  end; {while}
end;

procedure QuickSort(const p, r: Longint; const Compare: TCompareProc;
  const Exchange: TExchangeProc);
var
  q: Longint;
begin
  if (p < r) then begin
    q := Partition(p, r, Compare, Exchange);
    QuickSort(p, q, Compare, Exchange);
    QuickSort(q + 1, r, Compare, Exchange);
  end;
end;

end.

