{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
{--------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Novas funções para cálculo dos dígitos do CNPJ Alfanumérico
                 .Estas funções servem para CNPJ com somente números e o novo
                  alfabético.
--------------------------------------------------------------------------------
}
unit uValidaDoc;

interface

Uses Classes, sysutils, forms, windows;

Type
    TTipoDocumento = (tdCPF, tdCGC, tdCUIT);

    TCMMensagemValidaDoc = Class(TPersistent)
    Private
        fExibeMensagem :Boolean;
        fTexto :String;
    public
        Constructor Create;
    Published
        property ExibeMensagem :Boolean read fExibeMensagem write fExibeMensagem;
        property Texto :String read fTexto write fTexto;
    End;

    TCMValidaDoc = Class(TComponent)
    Private
       fNumDocumento :String;
       fTipoDocumento :TTipoDocumento;
       fMensagem :TCMMensagemValidaDoc;

       function CPFValido(sDocum:string):Boolean;
//       function CGCValido(sDocum:string):Boolean;      Paulo Nobre - WO33342
       function CUITValido(sDocum:string):Boolean;
       function SomaDig(sDocum:string; iTotDig, iPot : integer ): integer;

       //========= PROJETO CNPJ ALFANUMÉRICO =========
       //
       // Paulo Nobre - WO33342 - Inicio
       //
       // Novas funções para cálculo dos dígitos do CNPJ Alfanumérico
       //
       //===== Originais (usam GLetrasProibidas)
       function CNPJValido(const CNPJ14: string): Boolean;
       function CalcularDVsCNPJAlfa(const CNPJBase12: string): string;
       function MontarOuValidarCNPJAlfa(const CNPJInformado: string): string;

       //===== Customizadas (permitem definir as letras proibidas por chamada)
       function CalcularDVsCNPJAlfaCustom(const CNPJBase12, LetrasProibidas: string): string;
       function MontarOuValidarCNPJAlfaCustom(const CNPJInformado, LetrasProibidas: string): string;
       function CNPJAlfaValidoCustom(const CNPJ14, LetrasProibidas: string): Boolean;

       //===== Auxiliares
       function LimparMascara(const S: string): string;
       function CaractereProibido(U: Char; const LetrasProibidas: string): Boolean;
       function ValorDVDeCaractere(C: Char; const LetrasProibidas: string): Integer;

       procedure GarantirPermitido(U: Char; const LetrasProibidas: string);
       procedure CalcularDVsInterno(const Base12, LetrasProibidas: string; out D1, D2: Integer);
       //
       // Paulo Nobre - WO33342 - Fim

    Public
       Constructor Create(AOwner: TComponent); Override;
       Destructor Destroy; Override;
       function DocumentoValido: Boolean;
    Published
       property NumDocumento :String read fNumDocumento write fNumDocumento;
       property TipoDocumento :TTipoDocumento read fTipoDocumento write fTipoDocumento;
       Property Mensagem :TCMMensagemValidaDoc read fMensagem write fMensagem;
    End;


implementation

{ TCMMensagemValidaDoc }

var
   GLetrasProibidas: string = 'IOQF';        // Paulo Nobre - WO33342

Constructor TCMMensagemValidaDoc.Create;
Begin
   fExibeMensagem := false;
   fTexto := 'Número de Documento Inválido';
End;

{ TCMValidaDoc }

Constructor TCMValidaDoc.Create(AOwner: TComponent);
Begin
    inherited Create(Aowner);
    fTipoDocumento := tdCPF;
    fNumDocumento := '';
    fMensagem := TCMMensagemValidaDoc.Create;
End;

Destructor TCMValidaDoc.Destroy;
Begin
    fMensagem.Free;
    inherited Destroy;
End;

// Paulo Nobre - WO33342 - Inicio
{function TCMValidaDoc.CGCValido( sDocum:string ): boolean;
var iSoma, idvo1, idvo2, idv1, idv2, iResto : integer;
begin
    if length(sDocum) <> 14 then
       Result := false
    else
    if sDocum = '00000000000000' then
       Result := false
    else
    begin
         idvo1 := StrToInt(sDocum[13]);
         idvo2 := StrToInt(sDocum[14]);

       //Calcula o digito verificador 1
       iSoma := SomaDig(sDocum,12,5);
        iResto := iSoma mod 11;
       if (iResto <= 1) then
          idv1 := 0
       else
           idv1 := 11 - iResto;

       // Calcula o digito verificador 2
       iSoma := SomaDig(sDocum,12,6);
       iSoma := iSoma+(idv1*2);

       iResto := iSoma mod 11;
       if (iResto <= 1) then
          idv2 := 0
       else
           idv2 := 11 - iResto;

       Result := ((idv1 = idvo1) and (idv2 = idvo2));
    end;

    If (Not Result) And fMensagem.ExibeMensagem Then
       Application.MessageBox(PChar(fMensagem.fTexto),'Valida Documento',Mb_IconStop);
end;        }
// Paulo Nobre - WO33342 - Fim

function TCMValidaDoc.CUITValido(sDocum:string):Boolean;
Var
   iDig  :Array [0..10] of Integer;
   iSoma :LongInt;
   iTam  :Integer;
Begin
   iTam := Length(Trim(sDocum));

   If (iTam = 11) Then
   Begin
      iDig[0]  := StrToInt(Copy(sDocum,11,1))* 1;
      iDig[1]  := StrToInt(Copy(sDocum,10,1)) * 2;
      iDig[2]  := StrToInt(Copy(sDocum,9,1)) * 3;
      iDig[3]  := StrToInt(Copy(sDocum,8,1)) * 4;
      iDig[4]  := StrToInt(Copy(sDocum,7,1)) * 5;
      iDig[5]  := StrToInt(Copy(sDocum,6,1)) * 6;
      iDig[6]  := StrToInt(Copy(sDocum,5,1)) * 7;
      iDig[7]  := StrToInt(Copy(sDocum,1,1)) * 5;
      iDig[8]  := StrToInt(Copy(sDocum,2,1)) * 4;
      iDig[9]  := StrToInt(Copy(sDocum,3,1)) * 3;
      iDig[10] := StrToInt(Copy(sDocum,4,1)) * 2;

      iSoma := iDig[0] + iDig[1] + iDig[2] + iDig[3] + iDig[4] + iDig[5] + iDig[6] + iDig[7] + iDig[8] + iDig[9] + iDig[10];

      Result := ((iSoma Mod 11 = 0) or (sDocum = '99999999999'));
   End
   Else
      Result := False;

   If (Not Result) And fMensagem.ExibeMensagem Then
       Application.MessageBox(PChar(fMensagem.fTexto),'Valida Documento',Mb_IconStop);
End;

function TCMValidaDoc.CPFValido( sDocum:string ): boolean;
var idvo1, idvo2, idv1, idv2, iSoma, iResto : integer;
begin
   if length(sDocum) <> 11 then
      Result := false
   else
   begin
        idvo1 := StrToInt(sDocum[10]);
        idvo2 := StrToInt(sDocum[11]);

        //Calcula o digito verificador 1
        iSoma := SomaDig(sDocum,9,10);
        iResto := iSoma mod 11;
      if (iResto <= 1) then
         idv1 := 0
      else
          idv1 := 11 - iResto;

      //Calcula o digito verificador 2
      iSoma := SomaDig(sDocum,9,11);
      iSoma := iSoma+(idv1*2);

      iResto := iSoma mod 11;
      if (iResto <= 1) then
         idv2 := 0
      else
          idv2 := 11 - iResto;

      Result := ((idv1 = idvo1) and (idv2 = idvo2));
   end;


   If (Not Result) And fMensagem.ExibeMensagem Then
      Application.MessageBox(PChar(fMensagem.fTexto),'Valida Documento',Mb_IconStop);
end;

function TCMValidaDoc.SomaDig(sDocum:string; iTotDig, iPot : integer ): integer;
var i : integer;
begin
     Result := 0;
     for i := 1 to iTotDig do
     begin
          Result := Result+(StrToInt(sDocum[i])*iPot);
          Dec(iPot);
          if iPot = 1 then
             iPot := 9;
     end;
end;

function TCMValidaDoc.DocumentoValido: Boolean;
Begin
  Case fTipoDocumento of
    tdCPF : Result := CPFValido(fNumDocumento);
//    tdCGC : Result := CGCValido(fNumDocumento);       // Paulo Nobre - WO33342
    tdCGC : Result := CNPJValido(fNumDocumento);
    tdCUIT : Result := CUITValido(fNumDocumento);
    Else
      Result := False;
  End;
End;

// Paulo Nobre - WO33342 - Inicio

//========= PROJETO CNPJ ALFANUMÉRICO =========
//
// EXEMPLOS:

// 1) Calcular os DVs para um CNPJ alfanumérico base (12 chars):
//    ShowMessage( CalcularDVsCNPJAlfa('12ABC345DE67') ); // -> "35" (exemplo)

// 2) Montar o CNPJ completo a partir de 12 chars:
//    ShowMessage( MontarOuValidarCNPJAlfa('12ABC345DE67') ); // -> "12ABC345DE6735"

// 3) Validar um CNPJ (numérico ou alfanumérico, com ou sem máscara):
//    if CNPJValido('12.ABC.345/DE67-35') then
//       ShowMessage('Válido')
//    else
//       ShowMessage('Inválido');
//
//===============================================================================================
//
// Conjunto de funções principal e auxiliares para cálculo dos dígitos do CNPJ Alfanumérico
//
function TCMValidaDoc.CNPJValido(const CNPJ14: string): Boolean;
begin
  Result := CNPJAlfaValidoCustom(CNPJ14, GLetrasProibidas);
end;

function TCMValidaDoc.CNPJAlfaValidoCustom(const CNPJ14, LetrasProibidas: string): Boolean;
var
  Limpo, Base12, DVsCalc, DVsInf: string;
  LP: string;
begin
  Limpo := LimparMascara(CNPJ14);
  Result := False;
  LP := UpperCase(LetrasProibidas);

  if Length(Limpo) <> 14 then Exit;
  Base12 := Copy(Limpo, 1, 12);

  // DV informado precisa ser numérico
  if not ((Limpo[13] in ['0'..'9']) and (Limpo[14] in ['0'..'9'])) then Exit;

  DVsInf  := Copy(Limpo, 13, 2);
  DVsCalc := CalcularDVsCNPJAlfaCustom(Base12, LP);
  Result := (DVsCalc = DVsInf);
end;

function TCMValidaDoc.CalcularDVsCNPJAlfaCustom(const CNPJBase12, LetrasProibidas: string): string;
var
  Limpo: string;
  D1, D2: Integer;
begin
  Limpo := LimparMascara(CNPJBase12);
  if Length(Limpo) <> 12 then
    raise Exception.Create('Informe os 12 primeiros caracteres do CNPJ (sem os DVs).');

  CalcularDVsInterno(Limpo, UpperCase(LetrasProibidas), D1, D2);
  Result := IntToStr(D1) + IntToStr(D2);
end;

function TCMValidaDoc.MontarOuValidarCNPJAlfa(const CNPJInformado: string): string;
begin
  Result := MontarOuValidarCNPJAlfaCustom(CNPJInformado, GLetrasProibidas);
end;

function TCMValidaDoc.MontarOuValidarCNPJAlfaCustom(const CNPJInformado, LetrasProibidas: string): string;
var
  Limpo, Base12, DVs: string;
  LP: string;
begin
  Limpo := LimparMascara(CNPJInformado);
  LP := UpperCase(LetrasProibidas);

  if Length(Limpo) = 12 then
  begin
    Base12 := Limpo;
    DVs := CalcularDVsCNPJAlfaCustom(Base12, LP);
    Result := Base12 + DVs;
  end
  else if Length(Limpo) = 14 then
  begin
    if not CNPJAlfaValidoCustom(Limpo, LP) then
      raise Exception.Create('CNPJ inválido (dígitos verificadores não conferem ou letras não permitidas).');
    Result := Limpo;
  end
  else
    raise Exception.Create('Informe 12 (para calcular DVs) ou 14 caracteres (para validar).');
end;

//====================================== AUXILIARES ================================================

// Calcula e retorna apenas os 2 digitos do CNPJ com apenas 12 caracteres informado
function TCMValidaDoc.CalcularDVsCNPJAlfa(const CNPJBase12: string): string;
begin
  Result := CalcularDVsCNPJAlfaCustom(CNPJBase12, GLetrasProibidas);
end;

function TCMValidaDoc.CaractereProibido(U: Char; const LetrasProibidas: string): Boolean;
begin
  Result := Pos(UpCase(U), UpperCase(LetrasProibidas)) > 0;
end;

procedure TCMValidaDoc.GarantirPermitido(U: Char; const LetrasProibidas: string);
begin
  if CaractereProibido(U, LetrasProibidas) then
    raise Exception.CreateFmt('Caractere não permitido no CNPJ: "%s"', [U]);
end;

function TCMValidaDoc.ValorDVDeCaractere(C: Char; const LetrasProibidas: string): Integer;
var
  U: Char;
begin
  U := UpCase(C);
  // rejeita letras específicas antes de converter
  GarantirPermitido(U, LetrasProibidas);

  if (U >= '0') and (U <= '9') then
    Result := Ord(U) - Ord('0')                // 0..9
  else if (U >= 'A') and (U <= 'Z') then
    Result := Ord(U) - 48                      // 'A'(65) -> 17, ..., 'Z'(90) -> 42
  else
    raise Exception.CreateFmt('Caractere inválido no CNPJ: "%s"', [C]);
end;

procedure TCMValidaDoc.CalcularDVsInterno(const Base12, LetrasProibidas: string; out D1, D2: Integer);
const
  Pesos1: array[1..12] of Integer = (5,4,3,2,9,8,7,6,5,4,3,2);
  Pesos2: array[1..13] of Integer = (6,5,4,3,2,9,8,7,6,5,4,3,2);
var
  i, Soma, Resto: Integer;
begin
  if Length(Base12) <> 12 then
    raise Exception.Create('Para calcular os DVs, informe exatamente 12 caracteres (A–Z, 0–9).');

  // 1º DV
  Soma := 0;
  for i := 1 to 12 do
    Soma := Soma + ValorDVDeCaractere(Base12[i], LetrasProibidas) * Pesos1[i];

  Resto := Soma mod 11;
  if Resto < 2 then D1 := 0 else D1 := 11 - Resto;

  // 2º DV (usa os 12 + D1)
  Soma := 0;
  for i := 1 to 12 do
    Soma := Soma + ValorDVDeCaractere(Base12[i], LetrasProibidas) * Pesos2[i];
  Soma := Soma + (D1 * Pesos2[13]);

  Resto := Soma mod 11;
  if Resto < 2 then D2 := 0 else D2 := 11 - Resto;
end;

function TCMValidaDoc.LimparMascara(const S: string): string;
var
  i: Integer;
  c: Char;
begin
  Result := '';
  for i := 1 to Length(S) do
  begin
    c := S[i];
    if (c in ['0'..'9']) or (c in ['A'..'Z']) or (c in ['a'..'z']) then
      Result := Result + c;
  end;
end;

//===================================================================================================

// Paulo Nobre - WO33342 - Fim

end.


