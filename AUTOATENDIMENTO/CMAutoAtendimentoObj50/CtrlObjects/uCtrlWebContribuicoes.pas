unit uCtrlWebContribuicoes;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebContribuicoes = class(TCmControlObject)
  private

  protected

  public

    function SelecionaContribuicoes( sAno : String; iIdPessoa, iIdTitular : integer ) : OleVariant;
    function SelecionaAno( iIdPessoa, iIdTitular : integer ) : OleVariant;

  published

end;

implementation

{ TCtrlWebDadosCadastrais }

function TCtrlWebContribuicoes.SelecionaAno( iIdPessoa, iIdTitular: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select distinct                                            ' +
   '          substr( hst.MESREFERENCIA, 1, 4 ) as ANO          ' +
   ' from     HSTCONTRIBPREV    hst,                            ' +
   '          PATRO             pt,                             ' +
   '          ELEGPATRO         el,                             ' +
   '          PARTPREVPLAN      ppp,                            ' +
   '          CONTRIBPREVPARTP  cpp,                            ' +
   '          CONTPREV          cp,                             ' +
   '          CONTRIBUICAO      cont,                           ' +
   '          MOTIVO            mt,                             ' +
   '          PLANPREV          pl,                             ' +
   '          PESSOA            pp                              ' +
   ' where    hst.IDPESSOA           = ' + IntToStr( iIdPessoa )  +
   ' and      hst.IDPESSOA           = ' + IntToStr( iIdTitular ) +
   ' and      hst.IDCONTRIBUICAO     = cpp.IDCONTRIBUICAO       ' +
   ' and      hst.IDCONTRIBUICAO     = cp.IDCONTRIBUICAO        ' +
   ' and      hst.IDCONTRIBUICAO     = cont.IDCONTRIBUICAO      ' +
   ' and      hst.IDMOTIVO           = mt.IDMOTIVO              ' +
   ' and      hst.VALORRECEBIDO      is not null                ' +
   ' and      hst.IDPESSJUR          = el.IDPESSJUR             ' +
   ' and      hst.IDPESSOA           = el.IDPESSOA              ' +
   ' and      hst.IDPESSJUR          = ppp.IDPESSJUR            ' +
   ' and      hst.IDPESSOA           = ppp.IDPESSOA             ' +
   ' and      hst.IDPLANOPREV        = ppp.IDPLANOPREV          ' +
   ' and      hst.SEQPROPOSTA        = ppp.SEQPROPOSTA          ' +
   ' and      hst.IDPESSJUR          = cpp.IDPESSJUR            ' +
   ' and      hst.IDPESSOA           = cpp.IDPESSOA             ' +
   ' and      hst.IDPLANOPREV        = cpp.IDPLANOPREV          ' +
   ' and      hst.SEQPROPOSTA        = cpp.SEQPROPOSTA          ' +
   ' and      hst.IDPLANOPREV        = cp.IDPLANOPREV           ' +
   ' and      hst.IDPESSJUR          = pt.IDPESSOA              ' +
   ' and      hst.IDPLANOPREV        = pl.IDPLANOPREV           ' +
   ' and      pt.IDPESSOA            = pp.IDPESSOA              ' +
   ' and      hst.DATARECEBIMENTO    is not null                ' +
   ' order by 1                                                 ' );
end;

function TCtrlWebContribuicoes.SelecionaContribuicoes( sAno : String; iIdPessoa, iIdTitular : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   pp.NOME as PATRO,                                                                       ' +
   '          pl.NOME as PLANPREV,                                                                    ' +
   '          hst.MESREFERENCIA,                                                                      ' +
   '          substr( hst.MESREFERENCIA, 6, 2 ) || ''/'' || substr( hst.MESREFERENCIA, 1, 4 ) as MES, ' +
   '          cont.NOME as CONTRIB,                                                                   ' +
   '          hst.VALORRECEBIDO,                                                                      ' +
   '          decode( hst.FLGDEVOLUCAO, 1, ''Sim'', ''Não'' ) as FLGDEVOLUCAO,                        ' +
   '          decode( hst.FLGCALCRESERVA, 1, ''Sim'', ''Não'' ) as FLGCALCRESERVA,                    ' +
   '          decode( hst.SITRECEBIMENTO,                                                             ' +
   '           ''0'', ''Não enviado'',                            DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''1'', ''Enviado e não recebido'',                 DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''2'', ''Recebido Ok'',                            DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''3'', ''Recebido com divergência e não tratado'', DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''4'', ''Recebido com divergência e tratado'',     DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''5'', ''Pagou a divergência'',                    DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''6'', ''Divergência enviada e não recebida'',     DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''7'', ''Financiado ou renegociado'',              DECODE( hst.SITRECEBIMENTO,         ' +
   '           ''8'', ''Cancelada'',                                                                  ' +
   '                ''Contribuição atrasada a cobrar na Folha de Benefícios'' ))))))))) as DESCRICAO, ' +
   '          hst.DATARECEBIMENTO                                                                     ' +
   ' from     HSTCONTRIBPREV    hst,                                                                  ' +
   '          PATRO             pt,                                                                   ' +
   '          ELEGPATRO         el,                                                                   ' +
   '          PARTPREVPLAN      ppp,                                                                  ' +
   '          CONTRIBPREVPARTP  cpp,                                                                  ' +
   '          CONTPREV          cp,                                                                   ' +
   '          CONTRIBUICAO      cont,                                                                 ' +
   '          MOTIVO            mt,                                                                   ' +
   '          PLANPREV          pl,                                                                   ' +
   '          PESSOA            pp                                                                    ' +
   ' where    hst.IDPESSOA           = ' + IntToStr( iIdPessoa )                                        +
   ' and      hst.IDPESSOA           = ' + IntToStr( iIdTitular )                                       +
   ' and      substr( hst.MESREFERENCIA, 1, 4 ) = ' + QuotedStr( sAno )                                 +
   ' and      hst.IDCONTRIBUICAO     = cpp.IDCONTRIBUICAO                                             ' +
   ' and      hst.IDCONTRIBUICAO     = cp.IDCONTRIBUICAO                                              ' +
   ' and      hst.IDCONTRIBUICAO     = cont.IDCONTRIBUICAO                                            ' +
   ' and      hst.IDMOTIVO           = mt.IDMOTIVO                                                    ' +
   ' and      hst.VALORRECEBIDO      is not null                                                      ' +
   ' and      hst.IDPESSJUR          = el.IDPESSJUR                                                   ' +
   ' and      hst.IDPESSOA           = el.IDPESSOA                                                    ' +
   ' and      hst.IDPESSJUR          = ppp.IDPESSJUR                                                  ' +
   ' and      hst.IDPESSOA           = ppp.IDPESSOA                                                   ' +
   ' and      hst.IDPLANOPREV        = ppp.IDPLANOPREV                                                ' +
   ' and      hst.SEQPROPOSTA        = ppp.SEQPROPOSTA                                                ' +
   ' and      hst.IDPESSJUR          = cpp.IDPESSJUR                                                  ' +
   ' and      hst.IDPESSOA           = cpp.IDPESSOA                                                   ' +
   ' and      hst.IDPLANOPREV        = cpp.IDPLANOPREV                                                ' +
   ' and      hst.SEQPROPOSTA        = cpp.SEQPROPOSTA                                                ' +
   ' and      hst.IDPLANOPREV        = cp.IDPLANOPREV                                                 ' +
   ' and      hst.IDPLANOPREV        = pl.IDPLANOPREV                                                 ' +
   ' and      hst.IDPESSJUR          = pt.IDPESSOA                                                    ' +
   ' and      pt.IDPESSOA            = pp.IDPESSOA                                                    ' +
   ' and      hst.DATARECEBIMENTO    is not null                                                      ' +
   ' and      hst.VALORRECEBIDO      > 0                                                              ' +
   ' order by PATRO,                                                                                  ' +
   '          PLANPREV,                                                                               ' +
   '          hst.MESREFERENCIA desc,                                                                 ' +
   '          CONTRIB                                                                                 ' );
end;

end.
