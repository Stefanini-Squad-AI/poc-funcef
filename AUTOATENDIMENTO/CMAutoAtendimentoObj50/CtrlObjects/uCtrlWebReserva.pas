unit uCtrlWebReserva;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebReserva = class(TCmControlObject)
  private

  protected

  public
//Pendência 22997 - 18/08/2006
    function SelecionaReserva( iIdPessoa: integer ): OleVariant;
    function SelecionaExtratoReserva( sAno, sReserva : String; iIdPessoa : integer ) : OleVariant;
    function SelecionaAno( sReserva : String; iIdPessoa : integer ) : OleVariant;
//Fim Pendência 22997
    function SelecionaSaldoReserva( iIdPessoa : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebDadosCadastrais }

//Pendência 22997 - 18/08/2006
function TCtrlWebReserva.SelecionaReserva( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select    distinct                                   ' +
   '           tp.NOME as RESERVA                         ' +
   '   from    HISTMOVRESERVA h,                          ' +
   '           RESERVAXPLANO tp,                          ' +
   '           CONTRIBUICAO c,                            ' +
   '           BENEFICIO b,                               ' +
   '           PLANPREV pp,                               ' +
   '           PATRO p,                                   ' +
   '           PESSOA pt,                                 ' +
   '           ELEGPATRO el                               ' +
   '  where    h.IDPESSOA          = ' + IntToStr( iIdPessoa ) +
   '    and    h.IDPESSJUR         = p.IDPESSOA           ' +
   '    and    p.IDPESSOA          = pt.IDPESSOA          ' +
   '    and    h.IDPLANOPREV       = pp.IDPLANOPREV       ' +
   '    and    tp.IDPLANOPREV      = h.IDPLANOPREV        ' +
   '    and    tp.IDTIPORESERVA    = h.IDTIPORESERVA      ' +
   '    and    el.IDPESSOA         = h.IDPESSOA           ' +
   '    and    el.IDPESSJUR        = h.IDPESSJUR          ' +
   '    and    tp.ANALITICOSINTETI = ''A''                ' +
   '    and    h.IDCONTRIBUICAO    = c.IDCONTRIBUICAO (+) ' +
   '    and    h.IDBENEFICIO       = b.IDBENEFICIO    (+) ' +
   ' order by 1                                           ' );
end;
//Fim Pendência 22997

//Pendência 22997 - 18/08/2006
function TCtrlWebReserva.SelecionaAno( sReserva : String; iIdPessoa: integer ): OleVariant;
begin
  if trim( sReserva ) <> '' then
    sReserva := '    and    tp.NOME             = ' + QuotedStr( sReserva );

  Result := GetDataPacket(
   ' select    distinct                                   ' +
   '           substr( h.MESREFERENCIA, 1, 4 ) as ANO     ' +
   '   from    HISTMOVRESERVA h,                          ' +
   '           RESERVAXPLANO tp,                          ' +
   '           CONTRIBUICAO c,                            ' +
   '           BENEFICIO b,                               ' +
   '           PLANPREV pp,                               ' +
   '           PATRO p,                                   ' +
   '           PESSOA pt,                                 ' +
   '           ELEGPATRO el                               ' +
   '  where    h.IDPESSOA          = ' + IntToStr( iIdPessoa ) + sReserva +
//Fim Pendência 22997
   '    and    h.IDPESSJUR         = p.IDPESSOA           ' +
   '    and    p.IDPESSOA          = pt.IDPESSOA          ' +
   '    and    h.IDPLANOPREV       = pp.IDPLANOPREV       ' +
   '    and    tp.IDPLANOPREV      = h.IDPLANOPREV        ' +
   '    and    tp.IDTIPORESERVA    = h.IDTIPORESERVA      ' +
   '    and    el.IDPESSOA         = h.IDPESSOA           ' +
   '    and    el.IDPESSJUR        = h.IDPESSJUR          ' +
   '    and    tp.ANALITICOSINTETI = ''A''                ' +
   '    and    h.IDCONTRIBUICAO    = c.IDCONTRIBUICAO (+) ' +
   '    and    h.IDBENEFICIO       = b.IDBENEFICIO    (+) ' +
   ' order by 1                                           ' );
end;

//Pendência 22997 - 18/08/2006
function TCtrlWebReserva.SelecionaExtratoReserva( sAno, sReserva : String; iIdPessoa : integer ): OleVariant;
begin
  if trim( sReserva ) <> '' then
    sReserva := '     and    tp.NOME             = ' + QuotedStr( sReserva );

  Result := GetDataPacket(
   ' select     pt.NOME as PATROCINADORA,                                                                       ' +
   '            pp.NOME as PLANO,                                                                               ' +
   '            h.MESREFERENCIA,                                                                                ' +
   '            substr( h.MESREFERENCIA, 6, 2 ) || ''/'' || substr( h.MESREFERENCIA, 1, 4 ) as MESREFERENCIAF,  ' +
   '            DECODE( h.FLGENTRADA, 1,''E'', ''S'' ) as FLGENTRADA,                                           ' +
   '            h.VLRREAL,                                                                                      ' +
   '            h.SALDOREAL,                                                                                    ' +
   '            tp.CODHIERARQUIA,                                                                               ' +
   '            tp.NOME,                                                                                        ' +
   '            c.NOME as NOMECONTRIB,                                                                          ' +
   '            b.NOME as NOMEBENEF                                                                             ' +
   '   from     HISTMOVRESERVA h,                                                                               ' +
   '            RESERVAXPLANO tp,                                                                               ' +
   '            CONTRIBUICAO c,                                                                                 ' +
   '            BENEFICIO b,                                                                                    ' +
   '            PLANPREV pp,                                                                                    ' +
   '            PATRO p,                                                                                        ' +
   '            PESSOA pt,                                                                                      ' +
   '            ELEGPATRO el                                                                                    ' +
   '   where    h.IDPESSOA          = ' + IntToStr( iIdPessoa )                                                   +
   '     and    substr( h.MESREFERENCIA, 1, 4 ) = ' + QuotedStr( sAno ) + sReserva                                +
//Fim Pendência 22997
   '     and    h.IDPESSJUR         = p.IDPESSOA                                                                ' +
   '     and    p.IDPESSOA          = pt.IDPESSOA                                                               ' +
   '     and    h.IDPLANOPREV       = pp.IDPLANOPREV                                                            ' +
   '     and    tp.IDPLANOPREV      = h.IDPLANOPREV                                                             ' +
   '     and    tp.IDTIPORESERVA    = h.IDTIPORESERVA                                                           ' +
   '     and    el.IDPESSOA         = h.IDPESSOA                                                                ' +
   '     and    el.IDPESSJUR        = h.IDPESSJUR                                                               ' +
   '     and    tp.FLGCONTROLE      = 0                                                                         ' +
   '     and    tp.ANALITICOSINTETI = ''A''                                                                     ' +
   '     and    h.IDCONTRIBUICAO    = c.IDCONTRIBUICAO (+)                                                      ' +
   '     and    h.IDBENEFICIO       = b.IDBENEFICIO    (+)                                                      ' +
   '   order by pt.NOME,                                                                                        ' +
   '            pp.NOME,                                                                                        ' +
   '            h.MESREFERENCIA desc,                                                                           ' +
   '            tp.CODHIERARQUIA                                                                                ' );
end;

function TCtrlWebReserva.SelecionaSaldoReserva( iIdPessoa: integer ): OleVariant;
begin
   Result := GetDataPacket(
   ' select   pj.NOME as PATROCINADORA,                                     ' +
   '          pv.NOME as PLANO,                                             ' +
   '          rs.DATAULTALIM,                                               ' +
   '          rs.DATAREFERENCIASA,                                          ' +
   '          rs.VALORRESERVA,                                              ' +
   '          CO.COTVALOR,                                                  ' +
   '          co.COTVALOR * rs.VALORRESERVA as VLRATUAL,                    ' +
   '          tp.NOME,                                                      ' +
   '          decode( RS.FLGATIVO, 1, ''Ativo'', ''Inativo'' ) as FLGATIVO, ' +
   '          m.MOESIGLA,                                                   ' +
   '          md.DATAMAX                                                    ' +
   ' from     RESERVAPART rs,                                               ' +
   '          PESSOA pj,                                                    ' +
   '          RESERVAXPLANO tp,                                             ' +
   '          PLANPREV pv,                                                  ' +
   '          COTACAOMOEDA co,                                              ' +
   '          ELEGPATRO e,                                                  ' +
   '          MOEDA m,                                                      ' +
   '          ( select   tp1.INDICEREAJUSTE as INDICERE,                    ' +
   '                     max( COTDATA ) as DATAMAX                          ' +
   '            from     RESERVAPART rp1,                                   ' +
   '                     RESERVAXPLANO tp1,                                 ' +
   '                     COTACAOMOEDA co1                                   ' +
   '            where    rp1.IDPESSOA      = ' + IntToStr( iIdPessoa )        +
   '              and    tp1.IDPLANOPREV   = rp1.IDPLANOPREV                ' +
   '              and    tp1.IDTIPORESERVA = rp1.IDTIPORESERVA              ' +
   '              and    co1.MOECODIGO     = tp1.INDICEREAJUSTE             ' +
   '            group by tp1.INDICEREAJUSTE ) md                            ' +
   ' where    rs.IDPESSOA         = ' + IntToStr( iIdPessoa )                 +
   '   and    pj.IDPESSOA         = rs.IDPESSJUR                            ' +
   '   and    tp.IDPLANOPREV      = rs.IDPLANOPREV                          ' +
   '   and    tp.IDTIPORESERVA    = rs.IDTIPORESERVA                        ' +
   '   and    tp.INDICEREAJUSTE   = md.INDICERE                             ' +
   '   and    pv.IDPLANOPREV      = RS.IDPLANOPREV                          ' +
   '   and    tp.ANALITICOSINTETI = ''A''                                   ' +
   '   and    tp.FLGCONTROLE      = 0                                       ' +
   '   and    rs.VALORRESERVA     <> 0                                      ' +
   '   and    rs.IDPESSOA         = e.IDPESSOA                              ' +
   //Pendência 22931 - 05/08/2006 
   '   and    rs.IDPESSJUR        = e.IDPESSJUR                             ' +
   //Fim Pendência 22931
   '   and    md.INDICERE         = co.MOECODIGO (+)                        ' +
   '   and    co.MOECODIGO        = m.MOECODIGO  (+)                        ' +
   '   and    md.DATAMAX          = co.COTDATA   (+)                        ' +
   ' order by PATROCINADORA,                                                ' +
   '          PLANO,                                                        ' +
   '          rs.DATAULTALIM,                                               ' +
   '          rs.DATAREFERENCIASA                                           ' );
end;

end.
