unit uFuncoesUteis;

{-------------------------------------------------------------------------------
Rotina......: criação do arquivo de funcoes uteis para Contratos
N. Sol......: 222290-16959
N. PPM .....: 670297
Data........: 15/02/2012
Responsável.: Edilaine Ferraresi
Melhoria....: contador para total de registros por tipo de aditamento
--------------------------------------------------------------------------------}


interface

uses SysUtils, Classes, StdCtrls, WinTypes, Forms, wwTable, Wwquery,checklst;

CONST

  CR = #13;
  LF = #10;
  CR_LF = CR+LF;


function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string; TamLinha: word): string;
function CriaListaOpcoes(const CheckList: TCheckListBox; const Lista: TStringList;
      var Valor: string; Separador: string; EntrePliques: boolean;
      UsaNames: boolean = false): word;

procedure ExtraiString(var Str, StrAtual: string; Separador: string);
function  ContaCaracter(Texto: string; Ch: char): integer;
function  Replicate(Texto: string; NumVezes: integer): string;

function IFF(Condicao: boolean; Primeiro, Segundo: integer): integer; overload;
function IFF(Condicao: boolean; Primeiro, Segundo: string): string; overload;
function IFF(Condicao: boolean; Primeiro, Segundo: double): double; overload;
function IFF(Condicao: boolean; Primeiro, Segundo: byte): byte; overload;
function IFF(Condicao: boolean; Primeiro, Segundo:smallint): smallint; overload;



implementation



procedure ExtraiString(var Str, StrAtual: string; Separador: string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy(Str, 1, iPos-1);
    Delete(Str, 1, iPos + Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str := '';
  end;
end;


// Retorna a quantidade de caracteres CH na string TEXTO
function ContaCaracter(Texto: string; Ch: char): integer;
var
  c: integer;
begin
  Result := 0;
  for c:=1 to Length(Texto) do
    if (Texto[c] = Ch) then
      Inc(Result);
end;


function Replicate(Texto: string; NumVezes: integer): string;
var
  c: word;
  Temp: string;
begin
  Temp := '';
  for c:=1 to NumVezes do
    Temp := Temp + Texto;
  Result := Temp;
end;


function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string;
  TamLinha: word): string;
var
  iNumItem, iNumItensLista: integer;
  c, iNumLinhas: byte;
  sLinhaAtual, sIDAtual: string;
begin
  // Calcular o número de linhas necessárias
  iNumItensLista := ContaCaracter(ListaID,',');
  if (iNumItensLista > 0) then
    Inc(iNumItensLista);

  if (iNumItensLista <= TamLinha) then
  begin
    Result := Replicate(' ', NumEspacos) + Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') + ListaID + IFF(iNumItensLista>1,')','')+ ')';
    exit;
  end
  else
  begin
    if ((iNumItensLista mod TamLinha) = 0) then
      iNumLinhas := iNumItensLista div TamLinha
    else
      iNumLinhas := (iNumItensLista div TamLinha) + 1;
  end;
  
  // Gerar as linhas necessárias
  Result := '';
  for c:=1 to iNumLinhas do
  begin
    // Adicionar o número máximo de elementos à linha atual
    iNumItem := 0;
    sLinhaAtual := '';
    repeat
      ExtraiString(ListaID, sIDAtual, ',');
      Inc(iNumItem);
      if (sLinhaAtual = '') then
        sLinhaAtual := sIDAtual
      else
        sLinhaAtual := sLinhaAtual +','+ sIDAtual;
    until (ListaID = '') or (iNumItem = TamLinha);

    // Montar a linha atual
    Result := Result +
      Replicate(' ', NumEspacos+2) +
      Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') +
      sLinhaAtual + '))'+
      IFF(c < iNumLinhas, ' OR' + CR, '');
  end;

  if (Result <> '') and (Pos(CR,Result) > 0) then
    Result := Replicate(' ',NumEspacos) +'('+ CR +Result+ CR +Replicate(' ',NumEspacos)+ ')';
end;


{* retorna itens selecionados de um checkListBos baseado numa listas de ID's *}
function CriaListaOpcoes(const CheckList: TCheckListBox;
  const Lista: TStringList; var Valor: string; Separador: string; EntrePliques: boolean;
  UsaNames: boolean): word;
var
  wAux: word;
  I, K: integer;
  AuxValor: string;
begin
  AuxValor := '';
  K := 1;
  wAux := 0;
  for I:=0 to CheckList.Items.Count-1 do
    if (CheckList.Checked[I]) then
    begin
      if (K = 1) then
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := Lista[I];
        end;
        Inc(K);
      end
      else
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := AuxValor +Separador+ QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := AuxValor +Separador+ Lista[I];
        end;
      end;
      Inc(wAux);
    end;

  Valor := AuxValor;
  Result := wAux;
end;



// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF(Condicao: boolean; Primeiro, Segundo: string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF(Condicao: boolean; Primeiro, Segundo: integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF(Condicao: boolean; Primeiro, Segundo: double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function IFF(Condicao: boolean; Primeiro, Segundo: byte): byte;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function IFF(Condicao: boolean; Primeiro, Segundo: smallint): smallint;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;


end.
