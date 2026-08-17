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
{------------------------------------------------------------
Data      : 18.10.2007
Autor     : Marcus Oliveira
Pendencia : 25549
Descrição : Atualizar o calculo do dv da nova conta do Santander Banespa.
{------------------------------------------------------------
Data      : 08.01.2007
Autor     : Antonio Marcos Fernandes de Souza
Pendencia : 23823
Descrição : Testa o flag que indica se valida ou não a contacorrente.
------------------------------------------------------------}

unit uCalcDv;

interface

Uses Forms, Classes, SysUtils, Dialogs, Graphics, Controls, Windows,
     //amf 03.01.2007
     DbClient, uCtrlPadroes, uSistema, dBaseDados, uMensErro;

Const
   BO_UNIBANCO   = 409;
   BO_REAL       = 275;
   BO_ABN        = 356;
   BO_MERIDIONAL = 008;
   BO_CEF        = 104;
   BO_BAMERINDUS = 399;
   BO_BRADESCO   = 237;
   BO_BANESPA    = 033;
   BO_BBRASIL    = 001;

   NA_UNIBANCO   = 4;
   NA_REAL       = 4;
   NA_MERIDIONAL = 3;
   NA_CEF        = 4;
   NA_BAMERINDUS = 4;
   NA_BRADESCO   = 5;
   NA_BANESPA    = 4;
   NA_BBRASIL    = 0;

   NC_UNIBANCO   = 7;
   NC_REAL       = 10;
   NC_MERIDIONAL = 10;
   NC_CEF        = 12;
   NC_BAMERINDUS = 7;
   NC_BRADESCO   = 10;
   NC_BANESPA    = 10;
   NC_BBRASIL    = 10;



Type
   TCalcDv = Class
   Private
     Padroes: TCtrlPadroes;
     fTipoConta :Integer;
     Procedure DelChar(Var s:String; c: Char);
     Procedure MontaConta(Var sNumAg, sNumConta:String; IDigConta, iDigAgencia:
     Integer);
     Function ValidaContaCef(sNumAg,sNumConta:String):Boolean;
     Function ValidaContaUnibanco(sNumAg,sNumConta:String):Boolean;
     Function ValidaContaReal(sNumAg,sNumConta:String):Boolean;
     Function ValidaContaMeridional(sNumAg,sNumConta:String):Boolean;

     Function ValidaContaBanespa(sNumAg,sNumConta:String):Boolean;
     Function ValidaContaBrasil(sNumAg,sNumConta:String):Boolean;
     Function ValidaContaBradesco(sNumAg,sNumConta: String): Boolean;


     function CriticaContaBanco(rIdPessoa: extended): boolean;
     function GetIdPessoaDoBanco(sNumBanco, sNumAg: string): extended;

   Public
     Constructor Create;


     destructor Destroy; override;

     Property TipoConta :Integer Read fTipoConta Write fTipoConta;
     Function ValidaConta(sNumBanco,sNumAg,sNumConta:String;bMostraMSsg:Boolean):Boolean;
end;

Var
  CalculaDv: TCalcDv;

implementation

Constructor TCalcDv.Create;
Begin
  Inherited Create;
  fTipoConta := -1;
  Padroes := TCtrlPadroes.Create;
  Padroes.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True)
End;

Function TCalcDv.ValidaConta(sNumBanco,sNumAg,sNumConta:String;bMostraMSsg:Boolean):Boolean;
Var
   iNumBanco: Integer;
Begin


   if (not CriticaContaBanco(GetIdPessoaDoBanco(sNumBanco, sNumAg))) then
   begin
      Result := True;
      exit;
   end;

   If SNumBanco = '' Then
      iNumBanco  := 0
   Else
      iNumBanco := StrToInt(sNumBanco);

   Case iNumBanco of
     BO_UNIBANCO:
     Begin
        MontaConta(sNumAg,sNumConta,NC_UNIBANCO,NA_UNIBANCO);
        Result := ValidaContaUnibanco(sNumAg,sNumConta);
     End;

     BO_REAL, BO_ABN:
     Begin
       If fTipoConta <> 3 Then
       Begin
         MontaConta(sNumAg,sNumConta,NC_REAL,NA_REAL);
         Result := ValidaContaReal(sNumAg,sNumConta);
       End
       Else
         Result := True;
     End;

     BO_MERIDIONAL:
     Begin
        MontaConta(sNumAg,sNumConta,NC_MERIDIONAL,NA_MERIDIONAL);
        Result := ValidaContaMeridional(sNumAg,sNumConta);
     End;

     BO_CEF:
     Begin
        MontaConta(sNumAg,sNumConta,NC_CEF,NA_CEF);
        Result := ValidaContaCef(sNumAg,sNumConta);
     End;

     BO_BAMERINDUS:
     Begin


        Result := True;
     End;

     BO_BRADESCO:
     Begin
       If fTipoConta <> 3 Then
       Begin
        MontaConta(sNumAg,sNumConta,NC_BRADESCO,NA_BRADESCO);
        Result := ValidaContaBradesco(sNumAg,sNumConta);
       End
       Else
         Result :=  True;
     End;

     BO_BANESPA:
     Begin
        MontaConta(sNumAg,sNumConta,NC_BANESPA,NA_BANESPA);
        Result := ValidaContaBanespa(sNumAg,sNumConta);
     End;

     BO_BBRASIL:
     Begin
        MontaConta(sNumAg,sNumConta,NC_BBRASIL,NA_BBRASIL);
        Result := ValidaContaBrasil(sNumAg,sNumConta);
     End;
   Else
     Result := True;
   End;

   if Not Result And bMostraMSsg Then
      Application.MessageBox('Nº da Conta ou Agência Bancária Inválidos','Validação de Conta Bancária',Mb_IconExclamation);

End;

Procedure TCalcDv.DelChar(Var s:String; c: Char);
Begin
   While Pos(c,s) <> 0 Do
         Delete(s,Pos(c,s),1);
End;


Procedure TCalcDv.MontaConta(Var sNumAg, sNumConta:String; IDigConta, iDigAgencia:
Integer);
var temp:string;
    cont, Tam:Integer;
Begin
   DelChar(sNumAg,'.');
   DelChar(sNumAg,',');
   DelChar(sNumAg,'-');
   DelChar(sNumAg,'/');

   DelChar(sNumConta,'.');
   DelChar(sNumConta,',');
   DelChar(sNumConta,'-');
   DelChar(sNumConta,'/');

   temp := Trim(sNumConta);

   Tam := length(temp);

   for cont:=1 to IDigConta - Tam do
       temp:='0'+temp;

   sNumConta := temp;

   temp := Trim(sNumAg);

   Tam := length(temp);

   for cont:=1 to iDigAgencia - Tam do
       temp:='0'+temp;

   sNumAg := temp;
End;


Function TCalcDv.ValidaContaCef(sNumAg,sNumConta:String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, DV: String;
   iSoma, Resto: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_CEF,1);
  sDvAgencia  := Copy(sNumConta,NA_CEF,1);
  sConta      := Copy(sNumConta,1,NC_CEF - 1);
  sAgencia    := Copy(sNumAg,1,NA_CEF);

  sCCorrente  := sAgencia + sConta;

  iSoma := (StrToInt(sCCorrente[1]) * 8) +
           (StrToInt(sCCorrente[2]) * 7) +
           (StrToInt(sCCorrente[3]) * 6) +
           (StrToInt(sCCorrente[4]) * 5) +
           (StrToInt(sCCorrente[5]) * 4) +
           (StrToInt(sCCorrente[6]) * 3) +
           (StrToInt(sCCorrente[7]) * 2) +
           (StrToInt(sCCorrente[8]) * 9) +
           (StrToInt(sCCorrente[9]) * 8) +
           (StrToInt(sCCorrente[10]) * 7) +
           (StrToInt(sCCorrente[11]) * 6) +
           (StrToInt(sCCorrente[12]) * 5) +
           (StrToInt(sCCorrente[13]) * 4) +
           (StrToInt(sCCorrente[14]) * 3) +
           (StrToInt(sCCorrente[15]) * 2);

  Resto := ((iSoma * 10) MOD 11);

  If Resto = 10 Then
     Dv := '0'
  Else
     Dv := IntToStr(Resto);

  Result := (sDvConta = Dv);
End;


Function TCalcDv.ValidaContaMeridional(sNumAg,sNumConta:String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, DV: String;
   iSoma, Resto: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_MERIDIONAL,1);
  sDvAgencia  := Copy(sNumConta,NA_MERIDIONAL,1);
  sConta      := Copy(sNumConta,1,NC_MERIDIONAL - 1);
  sAgencia    := Copy(sNumAg,1,NA_MERIDIONAL);

  sCCorrente  := sAgencia + sConta;

  iSoma := (StrToInt(sCCorrente[1]) * 6) +
           (StrToInt(sCCorrente[2]) * 5) +
           (StrToInt(sCCorrente[3]) * 4) +
           (StrToInt(sCCorrente[4]) * 2) +
           (StrToInt(sCCorrente[5]) * 9) +
           (StrToInt(sCCorrente[6]) * 8) +
           (StrToInt(sCCorrente[7]) * 7) +
           (StrToInt(sCCorrente[8]) * 6) +
           (StrToInt(sCCorrente[9]) * 5) +
           (StrToInt(sCCorrente[10]) * 4) +
           (StrToInt(sCCorrente[11]) * 3) +
           (StrToInt(sCCorrente[12]) * 2);

  Resto := (iSoma MOD 11);

  Case Resto Of
   0,1: Dv := '0';
  Else
   Dv := IntToStr(11 - Resto);
  ENd;

  Result := (sDvConta = Dv);
End;

Function TCalcDv.ValidaContaReal(sNumAg,sNumConta:String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, DV: String;
   iSoma, Resto: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_REAL,1);
  sDvAgencia  := Copy(sNumAg,NA_REAL,1);
  sConta      := Copy(sNumConta,1,NC_REAL - 1);
  sAgencia    := Copy(sNumAg,1,NA_REAL);

  sCCorrente  := sAgencia + sConta;

  iSoma := (StrToInt(sCCorrente[1]) * 8) +
           (StrToInt(sCCorrente[2]) * 1) +
           (StrToInt(sCCorrente[3]) * 4) +
           (StrToInt(sCCorrente[4]) * 7) +
           (StrToInt(sCCorrente[5]) * 0) +
           (StrToInt(sCCorrente[6]) * 0) +
           (StrToInt(sCCorrente[7]) * 2) +
           (StrToInt(sCCorrente[8]) * 2) +
           (StrToInt(sCCorrente[9]) * 5) +
           (StrToInt(sCCorrente[10]) * 9) +
           (StrToInt(sCCorrente[11]) * 3) +
           (StrToInt(sCCorrente[12]) * 9) +
           (StrToInt(sCCorrente[13]) * 5);

  Resto := (iSoma MOD 11);

  Case Resto Of
   0: Dv := '1';
   1: Dv := '0';
  Else
   Dv := IntToStr(11 - Resto);
  ENd;

  Result := (sDvConta = Dv);
End;

Function TCalcDv.ValidaContaUnibanco(sNumAg,sNumConta:String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, NX, NY, NW, DV: String;
  iFator, X, iSoma: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_UNIBANCO,1);
  sDvAgencia  := Copy(sNumAg,NA_UNIBANCO,1);
  sConta      := Copy(sNumConta,1,NC_UNIBANCO - 1);
  sAgencia    := Copy(sNumAg,1,NA_UNIBANCO);

  sCCorrente  := sAgencia + sConta;

  iFator := 1;

  For X:=1 To 10 Do
  Begin
     NY := NY + IntToStr((StrToInt(sCCorrente[X])) * iFator);
     Inc(iFator);
     If iFator = 3 Then
        iFator := 1;
  End;

  iSoma := 0;
  For X:=1 To Length(NY) Do
      iSoma := iSoma + StrToInt(NY[X]);

  NW := IntToStr(iSoma);

  If NW[2] = '0' Then
     Dv := '0'
  Else
  Begin
     NX := NW;
     NW := IntToStr((StrToInt(NW[1]) + 1)) + Copy(NW,2,Length(NW));
     NW := NW[1] + '0' + Copy(NW,3,Length(NW));
     Dv := IntToStr(StrToInt(NW) - StrToInt(NX));
  End;

  Result := (sDvConta = Dv);
End;

Function TCalcDv.ValidaContaBanespa(sNumAg,sNumConta:String):Boolean;
Var

  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, NW, DV, sAux: String;
  X, iSoma: Integer;
  NY: Array [1..15] of String;

Begin

  sDvConta    := Copy(sNumConta,NC_BANESPA,1);
  sDvAgencia  := Copy(sNumAg,NA_BANESPA,1);
  sConta      := Copy(sNumConta,1,NC_BANESPA - 1);
  sAgencia    := Copy(sNumAg,1,NA_BANESPA);


  if Length(Trim(sNumAg + sNumConta)) = 13 then
  begin
     sCCorrente  := sAgencia + sConta;

     NY[1]  := IntToStr(StrToInt(sCCorrente[1]) * 0);
     NY[2]  := IntToStr(StrToInt(sCCorrente[2]) * 7);
     NY[3]  := IntToStr(StrToInt(sCCorrente[3]) * 3);
     NY[4]  := IntToStr(StrToInt(sCCorrente[4]) * 1);
     NY[5]  := IntToStr(StrToInt(sCCorrente[5]) * 0);
     NY[6]  := IntToStr(StrToInt(sCCorrente[6]) * 9);
     NY[7]  := IntToStr(StrToInt(sCCorrente[7]) * 7);
     NY[8]  := IntToStr(StrToInt(sCCorrente[8]) * 1);
     NY[9]  := IntToStr(StrToInt(sCCorrente[9]) * 3);
     NY[10] := IntToStr(StrToInt(sCCorrente[10]) * 1);
     NY[11] := IntToStr(StrToInt(sCCorrente[11]) * 9);
     NY[12] := IntToStr(StrToInt(sCCorrente[12]) * 7);
     NY[13] := IntToStr(StrToInt(sCCorrente[13]) * 3);

     iSoma := 0;
     For X:=1 To 13 Do
         If Length(NY[X]) > 1 Then
         Begin
           sAux := NY[X];
           iSoma := iSoma + StrToInt(sAux[2]);
         End
         Else
         Begin
           sAux := NY[X];
           iSoma := iSoma + StrToInt(sAux[1]);
         End;

    NW := IntToStr(iSoma);

    If NW[2] = '0' Then
       Dv := '0'
    Else
       Dv := IntToStr(10 - StrToInt(NW[2]));

    Result := (sDvConta = Dv);
  end
  else

  Begin
     sCCorrente  := sNumAg + '0' +sConta;

     NY[1]  := IntToStr(StrToInt(sCCorrente[1]) * 9);
     NY[2]  := IntToStr(StrToInt(sCCorrente[2]) * 7);
     NY[3]  := IntToStr(StrToInt(sCCorrente[3]) * 3);
     NY[4]  := IntToStr(StrToInt(sCCorrente[4]) * 1);
     NY[5]  := IntToStr(StrToInt(sCCorrente[5]) * 0);
     NY[6]  := IntToStr(StrToInt(sCCorrente[6]) * 0);
     NY[7]  := IntToStr(StrToInt(sCCorrente[7]) * 0);
     NY[8]  := IntToStr(StrToInt(sCCorrente[8]) * 9);
     NY[9]  := IntToStr(StrToInt(sCCorrente[9]) * 7);
     NY[10] := IntToStr(StrToInt(sCCorrente[10]) * 1);
     NY[11] := IntToStr(StrToInt(sCCorrente[11]) * 3);
     NY[12] := IntToStr(StrToInt(sCCorrente[12]) * 1);
     NY[13] := IntToStr(StrToInt(sCCorrente[13]) * 9);
     NY[14] := IntToStr(StrToInt(sCCorrente[14]) * 7);
     NY[15] := IntToStr(StrToInt(sCCorrente[15]) * 3);

     iSoma := 0;
     For X:=1 To 15 Do
         If Length(NY[X]) > 1 Then
         Begin
           sAux := NY[X];
           iSoma := iSoma + StrToInt(sAux[2]);
         End
         Else
         Begin
           sAux := NY[X];
           iSoma := iSoma + StrToInt(sAux[1]);
         End;

    NW := IntToStr(iSoma);

    If NW[2] = '0' Then
       Dv := '0'
    Else
       Dv := IntToStr(10 - StrToInt(NW[2]));

    Result := (sDvConta = Dv);
  end;

End;

Function TCalcDv.ValidaContaBrasil(sNumAg,sNumConta:String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, DV: String;
   iSoma, Resto: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_BBRASIL,1);
  sDvAgencia  := Copy(sNumAg,NA_BBRASIL,1);
  sConta      := Copy(sNumConta,1,NC_BBRASIL - 1);
  sAgencia    := Copy(sNumAg,1,NA_BBRASIL);

  sCCorrente  := sAgencia + sConta;

  iSoma := (StrToInt(sCCorrente[1]) * 2) +
           (StrToInt(sCCorrente[2]) * 9) +
           (StrToInt(sCCorrente[3]) * 8) +
           (StrToInt(sCCorrente[4]) * 7) +
           (StrToInt(sCCorrente[5]) * 6) +
           (StrToInt(sCCorrente[6]) * 5) +
           (StrToInt(sCCorrente[7]) * 4) +
           (StrToInt(sCCorrente[8]) * 3) +
           (StrToInt(sCCorrente[9]) * 2);

  Resto := (iSoma MOD 11);

  Case Resto Of
   0: Dv := '0';
   1: Dv := 'X';
  Else
   Dv := IntToStr(11 - Resto);
  ENd;

  Result := (UpperCase(sDvConta) = Dv);
End;

Function TCalcDv.ValidaContaBradesco(sNumAg,sNumConta: String):Boolean;
Var
  sDvConta, sDvAgencia, sConta, sAgencia, sCCorrente, DV: String;
  iSoma: Integer;
Begin
  sDvConta    := Copy(sNumConta,NC_BRADESCO,1);
  sDvAgencia  := Copy(sNumAg,NA_BRADESCO,1);
  sConta      := Copy(sNumConta,1,NC_BRADESCO - 1);
  sAgencia    := Copy(sNumAg,1,NA_BRADESCO);

  sCCorrente  := sConta;

  iSoma := (StrToInt(sCCorrente[1]) * 2) +
           (StrToInt(sCCorrente[2]) * 9) +
           (StrToInt(sCCorrente[3]) * 8) +
           (StrToInt(sCCorrente[4]) * 7) +
           (StrToInt(sCCorrente[5]) * 6) +
           (StrToInt(sCCorrente[6]) * 5) +
           (StrToInt(sCCorrente[7]) * 4) +
           (StrToInt(sCCorrente[8]) * 3) +
           (StrToInt(sCCorrente[9]) * 2);

  If (iSoma Mod 11) <> 0 Then
      DV := IntToStr(11 - (iSoma Mod 11))
  Else
      DV := '0';

  If DV = '10' Then
     DV :=  'P';

  Result := (sDvConta = DV);
End;


function TCalcDv.CriticaContaBanco(rIdPessoa: extended): boolean;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
   Result := False;
   try
     try
       sSQL     := 'SELECT FLGVALIDACC FROM BANCO WHERE IDPESSOA = ' + FloatToStr(rIdPessoa);
       cdsLocal := TClientDataSet.Create(nil);
       cdsLocal.Data := Padroes.GetDataPacket(sSQL);

       Result := cdsLocal.FieldByName('FLGVALIDACC').AsString = 'S';

     except
       Result := False;
     end;
   finally
       FreeAndNil(cdsLocal);
   end;
end;

destructor TCalcDv.Destroy;
begin
  FreeAndNil(Padroes);
  inherited;

end;

function TCalcDv.GetIdPessoaDoBanco(sNumBanco, sNumAg: string): extended;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
   Result := -1;
   try
     try
       sSQL     :=
         'SELECT B.*, A.* FROM BANCO B, AGENCIABANCARIA A '+
         'WHERE B.IDPESSOA = A.IDBANCO                    '+
         '  AND B.NUMBANCO =   ' + QuotedStr(sNumBanco)    +
         '  AND A.NUMAGENCIA = ' + QuotedStr(sNumAg)       ;

       cdsLocal := TClientDataSet.Create(nil);
       cdsLocal.Data := Padroes.GetDataPacket(sSQL);

       Result := cdsLocal.FieldByName('IDPESSOA').AsFloat;

     except
       on e:exception do
         MsgDlg(e.Message,'Erro',mtError,[mbOK],0);
     end;
   finally
       FreeAndNil(cdsLocal);
   end;
end;

end.
