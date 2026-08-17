unit uCtrlCompromisso;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, Classes, provider, uCMTypes;

Type
  TCtrlCompromisso = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      function Reservas(idpessoa, idplanoorcamen: integer; idcontaorcamen,
        dataini, datafim: string) : OleVariant;
      function Compromissos(idpessoa, idcompromisso: integer) : OleVariant;
      function BuscaCompOrcamen( pUNIDNEGOC,
                                 pdblcPlanoParamConta,
                                 pdblcPatroParamConta : String;
                                 piGrupo: Integer ): OleVariant;

      Function ReservaECompromisso( pidEmpresa,
                                    piPlanoOrc       : Integer;
                                    pIDCONTAORCAMEN,
                                    pdteDataIni,
                                    pdteDataFim       : String;
                                    pNUMRESERVA       : Double ) : OleVariant;
  End;

implementation


procedure TCtrlCompromisso.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlCompromisso.Create;
begin
  inherited;
  //
end;

destructor TCtrlCompromisso.Destroy;
begin
  inherited;
  //
end;

function TCtrlCompromisso.Reservas(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, dataini, datafim: string) : OleVariant;
var sSql: string;
begin
  sSql := 'SELECT ' +
          'R.NUMRESERVA, R.DATAREFERENCIA, R.VLRRESERVA, R.FLGRESERVA, ' +
          'R.OBSRESERVA, C.CODCENTRORESPON, R.IDRESERVAORCAMEN ' +
          'FROM ' +
          'RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE ' +
          '(C.IDCONTAORCAMEN = R.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = R.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(R.IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
          '(R.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(R.DATAREFERENCIA BETWEEN TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'') AND TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' +
          '(R.FLGRESERVA = ''A'') AND (R.FLGRESCOMP = ''R'') ' +
          'ORDER BY ' +
          'R.NUMRESERVA';
  Result := GetDataPacket(sSql);
end;

function TCtrlCompromisso.Compromissos(idpessoa, idcompromisso: integer) :
  OleVariant;
var sSql: string;
begin
  sSQl := 'SELECT ' +
          'R.NUMRESERVA, R.DATAREFERENCIA, R.VLRRESERVA, ' +
          'X.IDRESXCOMP, X.IDPESSOA, X.IDRESERVA, X.IDCOMPROMISSO ' +
          'FROM ' +
          'RESERVAORCAMEN R, RESXCOMP X ' +
          'WHERE ' +
          '(R.IDRESERVAORCAMEN = X.IDRESERVA) AND ' +
          '(X.IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(X.IDCOMPROMISSO = ' + IntToStr(idcompromisso) + ') AND ' +
          '(R.FLGRESCOMP = ''R'') ' +
          'ORDER BY ' +
          'R.NUMRESERVA';
  Result := GetDataPacket(sSql);
end;
//************************************************
Function TCtrlCompromisso.ReservaECompromisso( pidEmpresa,
                                               piPlanoOrc       : Integer;
                                               pIDCONTAORCAMEN,
                                               pdteDataIni,
                                               pdteDataFim       : String;
                                               pNUMRESERVA       : Double ) : OleVariant;
Var
  sSql : TStringList;
Begin

  sSql := TStringList.Create;
  Try
    sSql.Add( 'SELECT' );
    sSql.Add( '  NUMRESERVA, DATAREFERENCIA, VLRRESERVA, FLGRESERVA, OBSRESERVA, IDRESERVAORCAMEN,' );
    sSql.Add( '  CODCENTRORESPON, IDRESXCOMP, IDPESSOA, IDRESERVA, IDCOMPROMISSO, IDCONTAORCAMEN' );
    sSql.Add( 'FROM' );
    sSql.Add( '  (' );
    sSql.Add( '  --COMPROMISSO' );
    sSql.Add( '  SELECT' );
    sSql.Add( '    R.NUMRESERVA, R.DATAREFERENCIA, R.VLRRESERVA, R.FLGRESERVA, R.OBSRESERVA, R.IDRESERVAORCAMEN,' );
    sSql.Add( '    '' '' CODCENTRORESPON, X.IDRESXCOMP, X.IDPESSOA, X.IDRESERVA, X.IDCOMPROMISSO, R.IDCONTAORCAMEN' );
    sSql.Add( '  FROM' );
    sSql.Add( '    RESERVAORCAMEN R, RESXCOMP X' );
    sSql.Add( '  WHERE' );
    sSql.Add( '    (X.IDPESSOA         = ' + IntToStr( pidEmpresa ) + ') AND' );
    sSql.Add( '    (X.IDCOMPROMISSO    = ' + FloatToStr( pNUMRESERVA ) + ' ) AND' );
    sSql.Add( '    (R.IDRESERVAORCAMEN = X.IDRESERVA)    AND' );
    sSql.Add( '    (R.FLGRESCOMP       = ''R'')' );
    sSql.Add( '' );
    sSql.Add( '  UNION' );
    sSql.Add( '' );
    sSql.Add( '  -- RESERVA' );
    sSql.Add( '  SELECT' );
    sSql.Add( '    R.NUMRESERVA, R.DATAREFERENCIA, R.VLRRESERVA, R.FLGRESERVA, R.OBSRESERVA, R.IDRESERVAORCAMEN,' );
    sSql.Add( '    C.CODCENTRORESPON, 0 IDRESXCOMP, 0 IDPESSOA, 0 IDRESERVA, 0 IDCOMPROMISSO, R.IDCONTAORCAMEN' );
    sSql.Add( '  FROM' );
    sSql.Add( '    RESERVAORCAMEN R, CONTASORCAMEN C' );
    sSql.Add( '  WHERE' );
    sSql.Add( '    (C.IDCONTAORCAMEN = R.IDCONTAORCAMEN) AND' );
    sSql.Add( '    (C.IDPLANOORCAMEN = R.IDPLANOORCAMEN) AND' );
    sSql.Add( '    (R.IDPESSOA       = ' + IntToStr( pidEmpresa ) + ') AND' );
    sSql.Add( '    (R.IDCONTAORCAMEN = ' + QuotedStr( pIDCONTAORCAMEN ) + ') AND' );
    sSql.Add( '    (R.IDPLANOORCAMEN = ' + IntToStr( pIPlanoOrc ) + ') AND' );
    sSql.Add( '    (R.DATAREFERENCIA BETWEEN TO_DATE(' + QuotedStr( pdteDataIni ) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr( pdteDataFim ) + ', ''DD/MM/YYYY'')) AND' );
    sSql.Add( '    (R.FLGRESERVA = ''A'') AND (R.FLGRESCOMP = ''R'')' );
    sSql.Add( ')' );
    sSql.Add( 'ORDER BY' );
    sSql.Add( '  NUMRESERVA' );

    Result := GetDataPacket( sSql.Text );
  Finally
    sSql.Free;
  End;
End;
//************************************************
Function TCtrlCompromisso.BuscaCompOrcamen( pUNIDNEGOC,
                                            pdblcPlanoParamConta,
                                            pdblcPatroParamConta : String;
                                            piGrupo              : Integer ) : OleVariant;
Var
  sSql : String;

Begin
  sSQl := 'SELECT DISTINCT' + #13 + #10 +
          'CC.PLACONTA' + #13 + #10 +
          'FROM' + #13 + #10 +
          '  CONTASORCAMEN C, COMPCONTASORCAMEN CC' + #13 + #10 +
          'WHERE' + #13 + #10 +
          ' (CC.PLACONTA IS NOT NULL) AND (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND' + #13 + #10 +
          ' (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND' + #13 + #10 +
          ' (C.IDGRUPOORCAMEN = ' + IntToStr( piGrupo) + ' ) AND' + #13 + #10;

  If ( Trim( pUNIDNEGOC ) = '' ) Then Begin

    sSql := sSql + '( 1 = 1 ) AND ';
  end else begin

    sSql := sSql + '( CC.UNIDNEGOC = ' + QuotedStr( pUNIDNEGOC ) + ') AND ';
  end;
  sSql := sSql + #13 + #10;

  If ( Trim( pdblcPlanoParamConta ) = '' ) Then Begin

    sSql := sSql + '( 1 = 1 ) AND ';

  End Else Begin

    sSql := sSql + '( CC.IDPLANOPREV = ' + QuotedStr( pdblcPlanoParamConta ) +  ') AND ';
  End;
  sSql := sSql + #13 + #10;

  If ( Trim( PdblcPatroParamConta ) = '' ) Then Begin

    sSql := sSql + '( 1 = 1)';

  end else begin
    sSql := sSql + '( CC.IDPATRO = ' + pdblcPatroParamConta + ')';
  end;
  sSql := sSql + #13 + #10;

  Result := GetDataPacket( sSql );
End;
//************************************************
End.
