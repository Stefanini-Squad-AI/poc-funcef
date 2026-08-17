unit uCtrlFuncoesAA;

interface

uses SysUtils, uCMClientDataSet, uCmControlObject, JCLStrings, Windows;


//Converte um número para formato "###.##"
function ConverteVirgulaParaPonto( fNum : real ) : String;


//Converte um string para formato "###,##"
function ConvertePontoParaVirgulaStr( sNum : string ) : String;


//Converte um string para formato "###,##"
function ConverteVirgulaParaPontoStr( sNum : string ) : String;


//Substitui uma string pela outra dentro de uma outra string.
function StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;


//Converte um número para formato do Oracle
function OraNumero( sNumero : string ):string;


//Converte um número para formato inverso do Oracle
function OraNumeroInv( sNumero : string ):string;

//Pega próximo seqüence da tabela passada como parâmetro...
function ProxId( CtrlObject : TCmControlObject; sTabela : string ): integer;
function ProxIdFloat( CtrlObject : TCmControlObject; sTabela : string ): extended;

//Gera uma string contendo a hora no padrão Oracle
function DateToStrOracle(dDt: TDateTime): String;

//Converte data em um formato para outro
function FormataDataHora( sFormat, sDataAnt : String ) : String;

//Retorna a hora do banco de dados
function SysDate( CtrlObject : TCmControlObject ) : TDateTime;

//Verifica se o parâmetro é uma string nula. Se for, substitui por um espaço em branco
function NullToSpace( s : string ) : string;


{Retira o primeiro elemento de uma string (cujos elementos são separados por
 um caracter delimitador), retornando este elemento.}
function RetiraPrimeiroElemento( var sStr : string; cDelimitador : char ) : string;

//Gera um nome aleatório
function GeraNomeAleatorio( iTam : integer ) : string;

implementation


//Converte um número para formato "###.##"
function ConverteVirgulaParaPonto( fNum : real ) : String;
begin
  Result := FloatToStr( fNum );
  Result := StrSubst( Result, '.', '' );
  Result := StrSubst( Result, ',', '.' );
end; {ConverteVirgulaParaPonto}



//Converte um string para formato "###,##"
function ConvertePontoParaVirgulaStr( sNum : string ) : String;
begin
  Result := StrSubst( sNum, ',', '' );
  Result := StrSubst( Result, '.', ',' );
end; {ConvertePontoParaVirgulaStr}


//Converte um string para formato "###,##"
function ConverteVirgulaParaPontoStr( sNum : string ) : String;
begin
  Result := StrSubst( sNum, '.', '' );
  Result := StrSubst( Result, ',', '.' );
end; {ConverteVirgulaParaPontoStr}


//Substitui uma string pela outra dentro de uma outra string.
function StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;
var
  iPos : integer;
begin
  Result := Str;
  while True do
  begin
    iPos := Pos( SubStrOld, Result );

    if iPos <= 0 then break;

    Result := Copy( Result, 1, iPos - 1 ) + SubStrNew +
              Copy( Result, iPos + length( SubStrOld ),
              length(Result) - length( SubStrOld ) - iPos + 1 );
  end;
end; {StrSubst}


//Converte um número para formato do Oracle
function OraNumero( sNumero : string ):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end; {OraNumero}


//Converte um número para formato inverso do Oracle
function OraNumeroInv( sNumero : string ):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + ',';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> ','
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+',';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end; {OraNumeroInv}

//Pega próximo seqüence da tabela passada como parâmetro...
function ProxId( CtrlObject : TCmControlObject; sTabela : string ): integer;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := CtrlObject.GetDataPacket( ' select SEQ' + trim( sTabela ) +
                                               '.NEXTVAL as PROXID from   DUAL ' );

    Result := cdsLocal.FieldByName('PROXID').AsInteger;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;

end; {ProxId}


function ProxIdFloat( CtrlObject : TCmControlObject; sTabela : string ): extended;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := CtrlObject.GetDataPacket( ' select SEQ' + trim( sTabela ) +
                                               '.NEXTVAL as PROXID from   DUAL ' );

    Result := cdsLocal.FieldByName('PROXID').AsFloat;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;

end; {ProxIdFloat}



//Gera uma string contendo a hora no padrão Oracle
function DateToStrOracle(dDt: TDateTime): String;
begin
  Result := ' to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDt ) )  +
            ', ''DD/MM/YYYY hh24:mi:ss'' )';
end; {DateToStrOracle}


//Converte data em um formato para outro
function FormataDataHora( sFormat, sDataAnt : String ) : String;
begin
  try
    if Pos( ' ', sDataAnt ) > 0 then
      sDataAnt := Copy( sDataAnt, 1, Pos( ' ', sDataAnt ) - 1 );
    if ( trim( sDataAnt ) <> '30/12/1899' ) and ( trim( sDataAnt ) <> '' ) then
      Result := FormatDateTime( sFormat, StrToDateTime( sDataAnt ) )
    else
      Result := '';
  except
    Result := '';
  end;
end; {FormataDataHora}


//Retorna a hora do banco de dados
function SysDate( CtrlObject : TCmControlObject ) : TDateTime;
var
  cdsLocal : TCMClientDataSet;
begin
  Result := 0;
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := CtrlObject.GetDataPacket( ' select SYSDATE as AGORA from DUAL ' );
    Result := cdsLocal.FieldByName('AGORA').AsDateTime;
  finally
    cdsLocal.Free;
  end;
end; {SysDate}


//Verifica se o parâmetro é uma string nula. Se for, substitui por um espaço em branco
function NullToSpace( s : string ) : string;
begin
  Result := s;
  if Result = '' then Result := ' ';
end;


{Retira o primeiro elemento de uma string (cujos elementos são separados por
 um caracter delimitador), retornando este elemento.}
function RetiraPrimeiroElemento( var sStr : string; cDelimitador : char ) : string;
var
  iPos : integer;
begin
  iPos := Pos( cDelimitador, sStr );
  if iPos <= 0 then
  begin
    Result := sStr;
    sStr   := '';
  end
  else
  begin
    Result := Copy( sStr, 1, iPos - 1 );
    sStr   := Copy( sStr, iPos + 1, length( sStr ) - iPos );
  end;
end; {RetiraPrimeiroElemento}


//Gera um nome aleatório
function GeraNomeAleatorio( iTam : integer ) : string;
begin
  Randomize;
  Result := StrRight( StrPadLeft( IntToStr( Abs( GetTickCount ) *
   ( Random( 9 ) + 1 ) ), iTam, '0' ), iTam );
end; {GeraNomeArq}


end.
