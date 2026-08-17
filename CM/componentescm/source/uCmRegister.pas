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
unit uCmRegister;

interface

uses Registry,WinTypes, WinProcs,Forms,SysUtils,Dialogs;

Type
  TCmRegister = Class

  Private
    CmReg           : TRegistry;
  Public
    Constructor Create;
    Destructor Destroy; Override;

    Function LerStringReg (ChaveRaiz : HKey;
                          Chave,Valor : String;
                          Default : string) : String;
    Function LerNumeroReg (ChaveRaiz : HKey;
                           Chave,Valor : String;
                           Default : integer) : Integer;
    Function LerBooleanReg(ChaveRaiz : HKey;
                           Chave,Valor : String;
                           Default : boolean) : boolean;


    Function EscreverStringReg(ChaveRaiz : HKey;
                               Chave,Valor : String;
                               VlrEscr : string) : Boolean;

    Function EscreverNumeroReg(ChaveRaiz : HKey;
                                Chave,Valor : String;
                                VlrEscr : integer) : Boolean;

    Function EscreverBooleanReg(ChaveRaiz : HKey;
                                Chave,Valor : String;
                                VlrEscr : boolean) : Boolean;
End;

Var
  CmRegister: TCmRegister;

implementation


Constructor TCmRegister.Create;
Begin
   Inherited Create;
   CmReg := TRegistry.Create;
End;

Destructor TCmRegister.Destroy;
Begin
   CmReg.Free;
   Inherited Destroy;
end;

Function TCmRegister.LerStringReg (ChaveRaiz : HKey;
                       Chave,Valor : String;
                       Default : string) : String;
var
   Resultado : string;

begin
   Result := Default;

   CmReg.RootKey := ChaveRaiz;
   try
     CmReg.OpenKey(Chave,True);
   except
     CmReg.OpenKeyReadOnly(Chave);

   end;

   try
     Resultado := CmReg.ReadString(Valor);
   except
     { Erro ao tentar ler o valor - retorna vazaio }
     Resultado := Default;
   end;

   Result := Resultado;

   CmReg.CloseKey;
end;

Function TCmRegister.LerNumeroReg (ChaveRaiz : HKey;
                       Chave,Valor : String;
                       Default : integer) : Integer;
var
   Resultado : integer;

begin
   Result := Default;

   CmReg.RootKey := ChaveRaiz;
   try
      CmReg.OpenKey(Chave,True);
   except
      CmReg.OpenKeyReadOnly(Chave);

   end;
   try
     If Not CmReg.ValueExists(Valor) Then CmReg.WriteInteger(Valor, Default);
     Resultado := CmReg.ReadInteger(Valor);
   except
     Resultado := Default;
   end;

   Result := Resultado;

   CmReg.CloseKey;
end;

Function TCmRegister.LerBooleanReg(ChaveRaiz : HKey;
                       Chave,Valor : String;
                       Default : boolean) : boolean;
var
   Resultado : boolean;

begin
   Result := Default;

   CmReg.RootKey := ChaveRaiz;
   try
      CmReg.OpenKey(Chave,True);
   except
      CmReg.OpenKeyReadOnly(Chave);

   end;

   try
     Resultado := CmReg.ReadBool(Valor);
   except
     { Erro ao tentar ler o valor - retorna vazaio }
     Resultado := Default;
   end;

   Result := Resultado;

   CmReg.CloseKey;
end;

Function TCmRegister.EscreverStringReg(ChaveRaiz : HKey;
                           Chave,Valor : String;
                           VlrEscr : string) : Boolean;
begin
   Result := True;

   try
      CmReg.RootKey := ChaveRaiz;
      CmReg.LazyWrite := false;
      CmReg.OpenKey(Chave,true);
      CmReg.WriteString(Valor,VlrEscr);
   except
      ShowMessage('Erro ao ler a chave '  +  Chave);
      Result := False;
      exit;
   end;

   try
     CmReg.LazyWrite := true;
     CmReg.CloseKey;
   except
     { erro ao tentar fechar a chave }
   end;

end;

Function TCmRegister.EscreverNumeroReg(ChaveRaiz : HKey;
                            Chave,Valor : String;
                            VlrEscr : integer) : Boolean;
begin
   Result := True;

   try
      CmReg.RootKey := ChaveRaiz;
      CmReg.LazyWrite := false;
      if not CmReg.OpenKey(Chave,true) then begin
         ShowMessage('Erro ao ler a chave '  +  Chave);
         exit;
      end;

      CmReg.WriteInteger(Valor,VlrEscr);

   except
      Result := False;
   end;

   try
     CmReg.LazyWrite := true;
     CmReg.CloseKey;
   except
     { erro ao tentar fechar a chave }
   end;

end;
Function TCmRegister.EscreverBooleanReg(ChaveRaiz : HKey;
                            Chave,Valor : String;
                            VlrEscr : boolean) : Boolean;
begin
   Result := True;

   try
      CmReg.RootKey := ChaveRaiz;
      CmReg.LazyWrite := false;
      if not CmReg.OpenKey(Chave,true) then begin
         ShowMessage('Erro ao ler a chave '  +  Chave);
         exit;
      end;

      CmReg.WriteBool(Valor,VlrEscr);

   except
      Result := False;
   end;

   try
     CmReg.LazyWrite := true;
     CmReg.CloseKey;
   except
     { erro ao tentar fechar a chave }
   end;

end;

End.
