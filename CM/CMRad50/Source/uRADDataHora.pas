unit uRADDataHora;

interface

uses SysUtils;

const
  //Minuto no formato numérico
  cMinuto  = 0.000694444443070097;

{Converte a hora (no formato [+/-]hh:mm) em minutos}
function HoraParaMinutos( StrTime : string ) : integer;

{Soma uma quantidade de minutos a uma data/hora}
function SomaMinutos( dDataHora : TDateTime; iMinutos : integer ) : TDateTime;

{Valida uma hora e a formata convenientemente}
function FormataDataHora( StrTime : string; SemLimiteDeHoras : boolean = False ) : string;

implementation

{Converte a hora (no formato [+/-]hh:mm) em minutos}
function HoraParaMinutos( StrTime : string ) : integer;
var
  iPos,
  iFator,
  iHoras,
  iMinutos : integer;
  sTime : string;
begin
  sTime := trim( StrTime );

  iFator := 1;
  if ( Copy( sTime, 1, 1 )= '+' ) or ( Copy( sTime, 1, 1 )= '-' ) then
  begin
    if Copy( sTime, 1, 1 )= '+' then
      iFator := 1
    else
      iFator := -1;
    sTime := Copy( sTime, 2, length( sTime ) - 1 );
  end;

  sTime := FormataDataHora( sTime, True );

  iPos := Pos( ':', sTime );

  iHoras   := StrToIntDef( trim( Copy( sTime, 1, iPos - 1 ) ), 0 );
  iMinutos := StrToIntDef( trim( Copy( sTime, iPos + 1, length( sTime ) - iPos ) ), 0 );

  Result := ( ( iHoras * 60 ) + iMinutos ) * iFator;
end; {HoraParaMinutos}



{Valida uma hora e a formata convenientemente}
function FormataDataHora( StrTime : string; SemLimiteDeHoras : boolean = False ) : string;
var
  sFinal, sHoraFormatada : string;
  iPos, iHoras, iMinutos : integer;
begin
  sFinal  := trim( StrTime );

  if ( sFinal = '' ) or ( sFinal = ':' ) then
    exit;

  iPos := Pos( ':', sFinal );

  iHoras   := StrToIntDef( trim( Copy( sFinal, 1, iPos - 1 ) ), 0 );
  iMinutos := StrToIntDef( trim( Copy( sFinal, iPos + 1, length( sFinal ) - iPos ) ), 0 );

  if iHoras   < 0  then iHoras   := 0;

  if not SemLimiteDeHoras then
    if iHoras   > 23 then iHoras   := 23;

  if iMinutos < 0  then iMinutos := 0;

  if iMinutos > 59 then iMinutos := 59;

  if not SemLimiteDeHoras then
    sHoraFormatada := FormatFloat( '00', iHoras )
  else
    sHoraFormatada := IntToStr( iHoras );

  sFinal := sHoraFormatada + ':' + FormatFloat( '00', iMinutos );

  Result := sFinal;
end; {KValidateTime}


{Soma uma quantidade de minutos a uma data/hora}
function SomaMinutos( dDataHora : TDateTime; iMinutos : integer ) : TDateTime;
begin
  Result := dDataHora + ( iMinutos * cMinuto );
end; {SomaMinutos}


end.
