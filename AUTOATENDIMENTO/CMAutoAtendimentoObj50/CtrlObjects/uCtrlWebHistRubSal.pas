unit uCtrlWebHistRubSal;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebHistRubSal = class(TCmControlObject)
  private

  protected

  public

    function SelecionaQuadroSalarial( sAno : String; iIdPessoa: integer ) : OleVariant;
    function SelecionaAnoQuadroSalarial( iIdPessoa: integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebDadosCadastrais }

function TCtrlWebHistRubSal.SelecionaAnoQuadroSalarial( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select    distinct                                         ' +
   '           substr( h.MES, 1, 4 ) as ANO                     ' +
   '  from     HISTRUBSAL h,                                    ' +
   '           PROVDESC c,                                      ' +
   '           PESSOA p,                                        ' +
   '           PLANPREV r                                       ' +
   '  where    h.IDPESSOA    = ' + IntToStr( iIdPessoa )          +
   '    and    h.IDPESSJUR   = p.IDPESSOA                       ' +
   '    and    h.IDPLANOPREV = r.IDPLANOPREV                    ' +
   '    and    h.IDRUBRICA   = c.IDPROVENTO                     ' +
   '  order by 1                                                ' );
end;

function TCtrlWebHistRubSal.SelecionaQuadroSalarial( sAno : String; iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select    p.NOME as PATRO,                                                                         ' +
   '           r.NOME as PLANO,                                                                         ' +
   '           substr( h.MES, 6, 2 ) || ''/'' || substr( h.MES, 1, 4 ) as MESF,                         ' +
   '           substr( h.MESCOBRANCA, 6, 2 ) || ''/'' || substr( h.MESCOBRANCA, 1, 4 ) as MESCOBRANCA,  ' +
   '           h.MES,                                                                                   ' +
   '           h.IDRUBRICA,                                                                             ' +
   '           h.VALORPROVENTO,                                                                         ' +
   '           c.DESCRICAO,                                                                             ' +
   '           decode( h.FLGSRB, 1, ''Ativo ou Mantido Total'',                                         ' +
   '                             2, ''Aux. Doença'',                                                    ' +
   '                             3, ''INSS'',                                                           ' +
   '                             4, ''Sal. Virtual'',                                                   ' +
   '                             5, ''Mantido Parcial'',                                                ' +
   '                             0, ''Outros'' ) as TIPO                                                ' +
   '  from     HISTRUBSAL h,                                                                            ' +
   '           PROVDESC c,                                                                              ' +
   '           PESSOA p,                                                                                ' +
   '           PLANPREV r                                                                               ' +
   '  where    h.IDPESSOA            = ' + IntToStr( iIdPessoa )                                          +
   '    and    substr( h.MES, 1, 4 ) = ' + QuotedStr( sAno )                                              +
   '    and    h.IDPESSJUR   = p.IDPESSOA                                                               ' +
   '    and    h.IDPLANOPREV = r.IDPLANOPREV                                                            ' +
   '    and    h.IDRUBRICA   = c.IDPROVENTO                                                             ' +
   '  order by h.MES desc,                                                                              ' +
   '           h.IDRUBRICA                                                                              ' );
end;

end.
