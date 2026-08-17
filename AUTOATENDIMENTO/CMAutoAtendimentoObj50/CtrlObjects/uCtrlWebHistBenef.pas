unit uCtrlWebHistBenef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes;

Type
  TCtrlWebHistBenef = class(TCmControlObject)
  private

  protected

  public

    function SelecionaHistBenef( sAno : String; iIdPessoa, iIdTitular : integer ) : OleVariant;
    function SelecionaAnoHistBenef( iIdPessoa, iIdTitular : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebDadosCadastrais }

function TCtrlWebHistBenef.SelecionaAnoHistBenef( iIdPessoa, iIdTitular: integer ): OleVariant;
begin
  Result := GetDataPacket(                                      
   ' select distinct                                           ' +
   '            substr( hbn.MESREFERENCIA, 1, 4 ) as ANO       ' +
   ' from       ELEGPATRO el,                                  ' +
   '            BENEFBFCIARIO bb,                              ' +
   '            HSTBENEFBFCIARIO hbn,                          ' +
   '            PESSOA p,                                      ' +
   '            PESSOA patro,                                  ' +
   '            PLANPREV pl,                                   ' +
   '            BENEFICIO be                                   ' +
   ' where      bb.IDPESSOA      = ' + IntToStr( iIdPessoa )     +
   '   and      bb.IDTITULAR       = ' + IntToStr( iIdTitular )    +
   '   and      bb.IDTITULAR     = el.IDPESSOA                 ' +
   '   and      bb.IDPESSJUR     = el.IDPESSJUR                ' +
   '   and      bb.IDBENEFICIO   = hbn.IDBENEFICIO             ' +
   '   and      bb.SEQPROPOSTA   = hbn.SEQPROPOSTA             ' +
   '   and      bb.IDPLANOPREV   = pl.IDPLANOPREV              ' +
   '   and      bb.IDBENEFICIO   = be.IDBENEFICIO              ' +
   '   and      p.IDPESSOA       = bb.IDPESSOA                 ' +
   '   and      patro.IDPESSOA   = el.IDPESSJUR                ' +
   '   and      hbn.VLBENEFPGTO  > 0                           ' +
   '   and      bb.IDTITULAR     = hbn.IDTITULAR   (+)         ' +
   '   and      bb.IDPESSJUR     = hbn.IDPESSJUR   (+)         ' +
   '   and      bb.IDPLANOPREV   = hbn.IDPLANOPREV (+)         ' +
   '   and      bb.IDPESSOA      = hbn.IDPESSOA    (+)         ' +
   ' order by   1                                              ' );
end;

function TCtrlWebHistBenef.SelecionaHistBenef( sAno : String; iIdPessoa, iIdTitular : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     patro.NOME as PATROCINADORA,                                                                       ' +
   '            pl.NOME as PLANO,                                                                                  ' +
   '            hbn.MESREFERENCIA,                                                                                 ' +
   '            substr( hbn.MESREFERENCIA, 6, 2 ) || ''/'' || substr( hbn.MESREFERENCIA, 1, 4 ) as MESREFERENCIAF, ' +
   '            be.NOME as BENEFICIO,                                                                              ' +
   '            p.NOME as BENEFICIARIO,                                                                            ' +
   '            hbn.VLBENEFPGTO,                                                                                   ' +
   '            hbn.DTEFETPGTO,                                                                                    ' +
   '            substr( hbn.MES, 6, 2 ) || ''/'' || substr( hbn.MES, 1, 4 ) as MES                                 ' +
   ' from       ELEGPATRO el,                                                                                      ' +
   '            BENEFBFCIARIO bb,                                                                                  ' +
   '            HSTBENEFBFCIARIO hbn,                                                                              ' +
   '            PESSOA p,                                                                                          ' +
   '            PESSOA patro,                                                                                      ' +
   '            PLANPREV pl,                                                                                       ' +
   '            BENEFICIO be                                                                                       ' +
   ' where      bb.IDPESSOA      = ' + IntToStr( iIdPessoa )     +
   '   and      bb.IDTITULAR       = ' + IntToStr( iIdTitular )    +
   '   and      substr( hbn.MESREFERENCIA, 1, 4 ) = ' + QuotedStr( sAno )                                            +
   '   and      bb.IDTITULAR     = el.IDPESSOA                                                                     ' +
   '   and      bb.IDPESSJUR     = el.IDPESSJUR                                                                    ' +
   '   and      bb.IDBENEFICIO   = hbn.IDBENEFICIO                                                                 ' +
   '   and      bb.SEQPROPOSTA   = hbn.SEQPROPOSTA                                                                 ' +
   '   and      bb.IDPLANOPREV   = pl.IDPLANOPREV                                                                  ' +
   '   and      bb.IDBENEFICIO   = be.IDBENEFICIO                                                                  ' +
   '   and      p.IDPESSOA       = bb.IDPESSOA                                                                     ' +
   '   and      patro.IDPESSOA   = el.IDPESSJUR                                                                    ' +
   '   and      hbn.VLBENEFPGTO  > 0                           ' +
   '   and      bb.IDTITULAR     = hbn.IDTITULAR   (+)                                                             ' +
   '   and      bb.IDPESSJUR     = hbn.IDPESSJUR   (+)                                                             ' +
   '   and      bb.IDPLANOPREV   = hbn.IDPLANOPREV (+)                                                             ' +
   '   and      bb.IDPESSOA      = hbn.IDPESSOA    (+)                                                             ' +
   ' order by   PATROCINADORA,                                                                                     ' +
   '            PLANO,                                                                                             ' +
   '            hbn.MESREFERENCIA DESC,                                                                            ' +
   '            BENEFICIARIO                                                                                       ' );
end;

end.
