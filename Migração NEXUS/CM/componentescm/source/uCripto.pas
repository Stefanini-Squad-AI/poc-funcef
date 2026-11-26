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
unit UCripto;

interface

uses SysUtils, RipeMD, forms, TwoFish;

Const
  CKEYCRIPTO = 'Cris@270170#$270192&*)Mateus041094Saulo!';

function CriptografarCM(const sP: string): string;
function CriptografarHash(const sP:String; const sI: LongInt; const iTam:ShortInt): string;
function Encrypt(const S: String; KEY:WORD): String;
function Decrypt(const S: String; KEY:WORD): String;
Procedure CriptografarArquivo(const ArquivoOrigem, ArquivoDestino, Chave: string);
Procedure DeCriptografarArquivo(const ArquivoOrigem, ArquivoDestino, Chave: string);
function DeCriptografarString(const S, Chave: string): String;
function CriptografarString(const S, Chave: string): String;


implementation

const
  C1 = 52845;
  C2 = 22719;
  sCHAVE = 'CMSOL';

function CriptografarCM(const sP: string): string;
var
   tam,i,max : Integer;
   a,m,s : Word;
   validos : String;
begin
	validos := '';
	for i := 40 to 125 do
   	    validos := validos + Chr(i);
	max := length(validos);

	Result := '';

        s := 0;
	tam := Length(sP);
	for i := 1 to tam do
   	s := s + (Ord(sP[i]) * i);

	RandSeed := s;
	for i := 1 to tam do begin
		a := Random(255);
	 	a := a mod max;
    	m := Ord(sP[i]) mod max;
		Result := Result + validos[((a + m) mod max) + 1];
   end;
end;

function CriptografarHash(const sP:String; const sI: LongInt; const iTam:ShortInt): string;
var
   Digest :TDigest;
   Crypto :TRipeMD;
begin
   Crypto := TRipeMD.Create(Application);
   Try
     Crypto.Init;
     Crypto.HashString(sP + IntToStr(Si) + sCHAVE);
     Digest := Crypto.Finish;
     Result := Copy(Crypto.GetHashString,1,iTam);
   finally
     Crypto.Free;
   End;
end;

function Encrypt(const S: String; KEY:WORD): String;
var
  I: byte;
begin
  SetLength(Result,0);

  for I := 1 to Length(S) do begin
    Result := Result+char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

function Decrypt(const S: String; KEY:WORD): String;
var
  I: cardinal;
begin
  SetLength(Result,0);
  for I := 1 to Length(S) do begin
    Result := Result+char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

Procedure CriptografarArquivo(const ArquivoOrigem, ArquivoDestino, Chave: string);
begin
  with TTwoFish.Create(Application) do
    try
      CipherMode := ECB;
      KeySize := Large256;
      // carrega chaves
      LoadIVString('Init Vector');
      InitialiseString(Chave);

      // verifica se o arquivo de origem existe
      if FileExists(ArquivoOrigem) then
      begin
        // encripta o arquivo
        EncFile(ArquivoOrigem, ArquivoDestino);
      end;

      // burn sensitive data
      Burn;
    finally
      Free;
    end;
end;

Procedure DeCriptografarArquivo(const ArquivoOrigem, ArquivoDestino, Chave: string);
begin
  with TTwoFish.Create(Application) do
    try
      CipherMode := ECB;
      KeySize := Large256;
      // carrega chaves
      LoadIVString('Init Vector');
      InitialiseString(Chave);

      // verifica se o arquivo de origem existe
      if FileExists(ArquivoOrigem) then
      begin
        // encripta o arquivo
        DecFile(ArquivoOrigem, ArquivoDestino);
      end; 
      // burn sensitive data
      Burn;
    finally
      Free;
    end;
end;

function CriptografarString(const S, Chave: string): String;
Var
  Sout :string;
Begin
  with TTwoFish.Create(Application) do
    try
      CipherMode := ECB;
      KeySize := Large256;
      // carrega chaves
      LoadIVString('Init Vector');
      InitialiseString(Chave);

      EncString(S, Sout);

      // burn sensitive data
      Burn;
      Result := sOut;
    finally
      Free;
    end;
End;

function DeCriptografarString(const S, Chave: string): String;
Var
  Sout :string;
Begin
  with TTwoFish.Create(Application) do
    try
      CipherMode := ECB;
      KeySize := Large256;
      // carrega chaves
      LoadIVString('Init Vector');
      InitialiseString(Chave);

      DecString(S, Sout);

      Burn;
      Result := sOut;      
    finally
      Free;
    end;
End;


end.
