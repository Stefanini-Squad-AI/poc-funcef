unit UConversaoMed;

interface

uses Graphics, StdCtrls, Controls, Mask, DBCtrls, DBLookup, ExtCtrls, DBGrids,
     TEdNum, Forms, SysUtils, DB, DBTables, Grids ,Dialogs, UMensErro,
     WinTypes, WinProcs, Printers, Classes, wwTable, Wwquery,DBaseDados,uDataBase;

type
  TConversaoMed = class

     { CONVERSAO DO VALOR UNITARIO
     FatorProd       ----  R$ CustoMedioProd
     FatorMedUsuario ----  R$ X
     Result := (rCustoMed * rFatorCodMedCustoUsu) / rFatorCodMedCustoProd;}

    { CONVERSAO DO SALDO OU ESTOQUE EM QTDE
     rSaldoQtdeMUsu := (rSaldoQtde * rFatorCodMedCustoProd)/rFatorCodMedCustoUsu;}

     {Retorna o SaldoQtde e EstoqueMin convertido na unidade de medida passada}
     function SaldoQtdeEmOutraUnidade(iCodAlmoxa: Integer;
                                      sCodArtigo,sCodMedida: String;
                                      var rEstMinMUsu:Real;
                                      var bExisteArtigoNaTblSaldo:Boolean): Real;
     function CustoMedEmOutraUnidade(qry : TwwQuery;
                  CodArtigo,CodMedUsu :String;
                  iCodCusteioAlmoxaOrigem : Integer): Real;
     procedure SaldoEstMinMedUsu(var qrySaldo:TwwQuery; var SaldoMedUsu,EstMinMedUsu: Real;
         CodAlmoxa:Integer;CodArtigo,CodProduto,CodMedCusto,CodMedUsu :String);

    { Rotina que recebe um SALDO , sua unidade de medida e a unidade
      de medida na qual quer convertê-lo e retorna o SALDO convertido
      Parâmetros : sCodArtigo    = código do Artigo ao qual se refere o SALDO
                   umOriginal    = unidade de medida do valor a ser
                                   convertido
                   umFinal       = unidade de medida para o qual quer
                                   converter o valor original
                   SaldoOriginal = Saldo a ser convertido }
     function ConverteSaldoQtde( sCodArtigo, umOriginal, umFinal : string; saldoOriginal : Double ): Double;
     function ConverteCusto    ( sCodArtigo, umOriginal, umFinal : string; valorOriginal : real ): real;
     function TestaUnidade     ( sCodProduto, sUnidade : string ): Real;
     function ConverteQtdeUnCM ( sCodArtigo, sUnidade : string; rQtde : Double ): Double;
     function InfoSaldo ( sArt : String; icodAlmoxa : LongInt; Dt : TDateTime ) : Double;
  end;

var
  ConversaoMed : TConversaoMed;

implementation

uses uString, DMoviment, uModulo;

function TConversaoMed.SaldoQtdeEmOutraUnidade(iCodAlmoxa: Integer;sCodArtigo,
                                               sCodMedida : String;
                                               var rEstMinMUsu:Real;
                                               var bExisteArtigoNaTblSaldo:Boolean): Real;
var qrySaldo : TwwQuery;
begin
   qrySaldo := TwwQuery.Create(Application);
   qrySaldo.DatabaseName := 'BaseDados';
//   qrySaldo.DatabaseName := sDataBaseName; //'Almoxarifado';
   with qrySaldo do begin
      Close;
      SQL.Clear;
      SQL.Add('Select A.CodArtigo, PR.CodMedCusto, CU.CodMedida, '+
              'S.SaldoQtde,S.EstMinUsado,CU.Fator,CPR.Fator, '+
              '(S.EstMinUsado*CPR.Fator/CU.Fator) As EstMinMedUsu,' +
              '(S.SaldoQtde*CPR.Fator/CU.Fator) as SaldoQtdeMedUsu '+
       'From Produto PR, Artigo A, Conver CU, Conver CPR, Saldo S '+
       'Where A.CodArtigo = ''' + sCodArtigo + ''' and A.CodProduto = PR.CodProduto '+
         'and PR.CodProduto = CPR.CodProduto and PR.CodMedCusto = CPR.CodMedida '+
         'and A.CodProduto = CU.CodProduto and CU.CodMedida = ''' + sCodMedida +
         ''' and S.CodArtigo = A.CodArtigo and S.CodAlmoxarifado = ' + IntToStr(iCodAlmoxa));
      Open;
      if RecordCount <> 0
      then begin
         Result := FieldByName('SaldoQtdeMedUsu').AsFloat;
         rEstMinMUsu := FieldByName('EstMinMedUsu').AsFloat;
         bExisteArtigoNaTblSaldo := True;
      end
      else begin
         bExisteArtigoNaTblSaldo := False;
         Result := 0;
      end;
      Free;
   end; {with}
end;

procedure TConversaoMed.SaldoEstMinMedUsu(var qrySaldo:TwwQuery; var SaldoMedUsu,EstMinMedUsu: Real;
         CodAlmoxa:Integer;CodArtigo,CodProduto,CodMedCusto,CodMedUsu :String);
begin
   with qrySaldo do begin
      Close;
      Sql.Clear;
      Sql.Add('Select S.SaldoQtde, S.EstMinUsado,CU.Fator,CPR.Fator,'+
                 '(S.SaldoQtde*CPR.Fator/CU.Fator) As SaldoUsu,'+
                 '(S.EstMinUsado*CPR.Fator/CU.Fator) As EstMinUsu');
      Sql.Add('From Saldo S,Conver CU, Conver CPR');
      Sql.Add('Where S.CodAlmoxarifado = '+ IntToStr(CodAlmoxa)+
                 ' and S.CodArtigo='''+ CodArtigo + ''''+
                 ' and CPR.CodProduto = '''+ CodProduto + ''''+
                 ' and CPR.CodMedida = '''+ CodMedCusto + ''''+
                 ' and CU.CodProduto = '''+ CodProduto + ''''+
                 ' and CU.CodMedida = '''+ CodMedUsu + '''');
      try
         Open;
      except
         on E:EDBEngineError do begin
                  MostrarErro(E);
                  SaldoMedUsu := -1;
                  EstMinMedUsu := -1;
                  Exit;
         end;
      end; {except}
      if RecordCount = 0 then
      begin
          SaldoMedUsu := 0;
          EstMinMedUsu := 0;
      end
      else begin
          SaldoMedUsu := FieldByName('SaldoUsu').AsFloat;
          EstMinMedUsu := FieldByName('EstMinUsu').AsFloat;
      end;
      Close;
   end; {with}
end;

function TConversaoMed.CustoMedEmOutraUnidade(qry : TwwQuery;
                  CodArtigo,CodMedUsu :String;
                  iCodCusteioAlmoxaOrigem : Integer): Real;
//var rCustoMed : Real;
begin
   with qry do begin
      Close;
      SQL.Clear;
      SQL.Add('Select A.CodArtigo, PR.CodMedCusto, '+
	           'CM.CustoMedio,CU.Fator,CPR.Fator,'+
	           '(CM.CustoMedio*CU.Fator/CPR.Fator) as ValorUn ');
      SQL.Add('From Artigo A,Produto PR, CustoMed CM, Conver CU, Conver CPR ');
      SQL.Add('Where A.CodArtigo= '''+ CodArtigo + ''''+
               ' and CM.CodArtigo=A.CodArtigo' +
               ' and CM.CodCusteio = ' + IntToStr(iCodCusteioAlmoxaOrigem)+
               ' and A.CodProduto = PR.CodProduto'+
               ' and PR.CodProduto = CPR.CodProduto'+
               ' and PR.CodMedCusto = CPR.CodMedida'+
               ' and CU.CodProduto = PR.CodProduto'+
               ' and CU.CodMedida = '''+ CodMedUsu + '''');
      try
         Open;
      except
         on E:EDBEngineError do begin
            MostrarErro(E);
            Result := -1;
            Exit;
         end;
      end;
      Result := FieldByName('ValorUn').AsFloat;
      Close;
   end;{with}

end;

function TConversaoMed.ConverteSaldoQtde( sCodArtigo, umOriginal, umFinal : string; saldoOriginal : Double ): Double;
var qrySaldo : TwwQuery;
    sSQL     : string;
    cAuxSeparador : char;

begin
   qrySaldo := TwwQuery.Create(Application);
//   qrySaldo.DatabaseName := sDataBaseName; //'Almoxarifado';
   qrySaldo.DatabaseName := 'BaseDados';
   with qrySaldo do begin
      Close;
      SQL.Clear;
   {.}cAuxSeparador := DecimalSeparator;
   {.}DecimalSeparator := '.';
      sSQL := 'SELECT A.CodArtigo,P.CodProduto,CO.Fator,CF.Fator, '+
              '       ('+FormatFloat('#0.00000',saldoOriginal)+'*CO.Fator/CF.Fator) As SaldoQtdeFinal ' +
              'FROM  Produto P, Artigo A, Conver CO, Conver CF '+
              'WHERE (RTRIM(A.CodArtigo) = ''' + Trim(sCodArtigo)+ ''') and '+
              '      (A.CodProduto = P.CodProduto) and '+
              '      (P.CodProduto = CO.CodProduto) and '+
              '      (RTRIM(CO.CodMedida) = '''+Trim(umOriginal)+''') and '+
              '      (P.CodProduto = CF.CodProduto) and '+
              '      (RTRIM(CF.CodMedida) = '''+Trim(umFinal)+''')';
   {.}DecimalSeparator := cAuxSeparador;
      SQL.Add(sSQL);
      Open;
      if Not IsEmpty
      then Result := FieldByName('SaldoQtdeFinal').AsFloat
      else Result := 0;
      Free;
   end; {with}
end; { function ConverteSaldoQtde }

function TConversaoMed.ConverteCusto( sCodArtigo, umOriginal, umFinal : string; valorOriginal : real ): real;
var qrySaldo : TwwQuery;
    sSQL     : string;
    cAuxSeparador : char;

begin
   qrySaldo := TwwQuery.Create(Application);
//   qrySaldo.DatabaseName := sDataBaseName;//'Almoxarifado';
   qrySaldo.DatabaseName := 'BaseDados';
   with qrySaldo do begin
      Close;
      SQL.Clear;
   {.}cAuxSeparador := DecimalSeparator;
   {.}DecimalSeparator := '.';
      sSQL := 'SELECT A.CodArtigo,P.CodProduto,CO.Fator,CF.Fator, '+
              ' ('+FormatFloat('#0.00000',valorOriginal)+'*CF.Fator/CO.Fator) As ValorFinal ' +
              'FROM  Produto P, Artigo A, Conver CO, Conver CF '+
              'WHERE A.CodArtigo = ''' + sCodArtigo + ''' and  '+
              '      A.CodProduto = P.CodProduto and '+
              '      P.CodProduto = CO.CodProduto and '+
              '      CO.CodMedida = '''+umOriginal+''' and '+
              '      P.CodProduto = CF.CodProduto and '+
              '      CF.CodMedida = '''+umFinal+'''';
   {.}DecimalSeparator := cAuxSeparador;
      SQL.Add(sSQL);
      Open;
      if RecordCount <> 0
      then Result := FieldByName('ValorFinal').AsFloat
      else Result := 0;
      Free;
   end; {with}
end; { function ConverteCusto }

function TConversaoMed.TestaUnidade(sCodProduto, sUnidade : string ): Real;
var
   qryTestaU:TwwQuery;
begin
   //Result:=-1 => Unidade não Cadastrada.
   qryTestaU :=TwwQuery.Create(Application);
   qryTestaU.DatabaseName  := 'BASEDADOS';
   Try
     //
     qryTestaU.Close;
     qryTestaU.SQL.Clear;
     qryTestaU.SQL.text :='SELECT FATOR FROM CONVER WHERE CODPRODUTO = '''+sCodProduto+''' AND '+
                          'CODMEDIDA = '''+sUnidade+'''';
     qryTestaU.Open;
     //
     if qryTestaU.IsEmpty then
        Result:=-1
     else
        Result:=qryTestaU.FieldByName('FATOR').AsFloat;
   Finally
     qryTestaU.Free;
   end;
end;

Function TConversaoMed.ConverteQtdeUnCM ( sCodArtigo, sUnidade : string; rQtde : Double ): Double;
Begin
    FazQuery(dtmBasedados.qry,' SELECT '+
                              '     CODMEDCUSTO '+
                              ' FROM '+
                              '     PRODUTO '+
                              ' WHERE (CODPRODUTO  = '''+copy(sCodArtigo,1,6)+''')');

   ConverteQtdeUnCM:= ConverteSaldoQtde( sCodArtigo, sUnidade, dtmBasedados.qry.FieldByName('CODMEDCUSTO').asString, rQtde);

End;

Function TConversaoMed.InfoSaldo ( sArt : String; icodAlmoxa : LongInt; Dt : TDateTime ) : Double;
Begin
  sArt    := Espaco( Trim( sArt ),14);
  Try
    With DtmMoviment Do
       Begin
           If Dt <= Modulo.LeDataRepresa Then
              Begin
                 qryInfoSaldoRep.Close;
                 qryInfoSaldoRep.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmoxa;
                 qryInfoSaldoRep.ParamByName('pCODARTIGO').asString        := sArt;
                 qryInfoSaldoRep.Open;
                 IF Not qryInfoSaldoRep.IsEmpty Then
                    InfoSaldo := qryInfoSaldoRep.FieldByName('SALDOQTDE').asFloat
                 Else
                    InfoSaldo := 0;
                 qryInfoSaldoRep.Close;
              End
           Else
              Begin
                 qryInfoSaldoMov.Close;
                 qryInfoSaldoMov.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmoxa;
                 qryInfoSaldoMov.ParamByName('pCODARTIGO').asString        := sArt;
                 qryInfoSaldoMov.ParamByName('pDATAMOV').asDateTime        := Dt;
                 qryInfoSaldoMov.Open;
                 IF Not qryInfoSaldoMov.IsEmpty Then
                    InfoSaldo := qryInfoSaldoMov.FieldByName('SALDOQTDEMOV').asFloat
                 Else
                    InfoSaldo := 0;
                 qryInfoSaldoMov.Close;
              End;
       End;
  Except
      Raise;
  End;
End;

end.
