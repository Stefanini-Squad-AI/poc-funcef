unit uCtrlWebContraCheque;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebContraCheque = class(TCmControlObject)
  private

  protected

  public

    function SelecionaDataContraCheque( iIdPessoa : integer ) : OleVariant;

    function SelecionaContraCheque( iIdPessoa : integer; sDtPagamento : String ) : OleVariant;

    function SelecionaDadosFundacao : OleVariant;

  published

end;

implementation


{ TCtrlWebContraCheque }

function TCtrlWebContraCheque.SelecionaDataContraCheque( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   '  select    distinct                                                                ' +
   '            hst.DATAPAGAMENTO                                                       ' +
   '  from      HISTRUBSAL        hst,                                                  ' +
   '            ELEGPATRO         elp,                                                  ' +
   '            PARTPREVPLAN      ppp,                                                  ' +
   '            PESSOA            ben,                                                  ' +
   '            PESSOAFISICA      pfi,                                                  ' +
   '            PROVDESC          pvd,                                                  ' +
   '            CONTABANCARIA     cb,                                                   ' +
   '            PESSOA            bc,                                                   ' +
   '            PESSOA            agn,                                                  ' +
   '            BANCO             bco,                                                  ' +
   '            AGENCIABANCARIA   ag                                                    ' +
   '    where   hst.IDRESPONSAVEL = ' + IntToStr( iIdPessoa )                             +
   '    and     pvd.IDPROVENTO    = hst.IDRUBRICA                                       ' +
   '    and     elp.IDPESSOA      = hst.IDTITULAR                                       ' +
   '    and     elp.IDPESSJUR     = hst.IDPATRO                                         ' +
   '    and     ppp.IDPESSJUR     = hst.IDPATRO                                         ' +
   '    and     ppp.IDPLANOPREV   = hst.IDPLANOPREV                                     ' +
   '    and     ppp.IDPESSOA      = hst.IDTITULAR                                       ' +
   '    and     hst.IDRESPONSAVEL = pfi.IDPESSOA                                        ' +
   '    and     ben.IDPESSOA      = hst.IDRESPONSAVEL                                   ' +
   '    and     cb.IDPESSOA       = hst.IDRESPONSAVEL                                   ' +
   '    and     ag.IDPESSOA       = cb.IDAGENCIA                                        ' +
   '    and     bc.IDPESSOA       = ag.IDBANCO                                          ' +
   '    and     agn.IDPESSOA      = ag.IDPESSOA                                         ' +
   '    and     bc.IDPESSOA       = bco.IDPESSOA                                        ' +
   '    and     ( ( rtrim( hst.NUMBANCO) = bco.NUMBANCO ) or ( hst.NUMBANCO is null ) ) ' +
   '    and     ( ( hst.NUMAGENCIA = ag.NUMAGENCIA) or ( hst.NUMAGENCIA is null ) )     ' +
   '    and     cb.FLGCONTAPREF   = 1                                                   ' +
   '    order by  1 desc                                                                ' );
end;

function TCtrlWebContraCheque.SelecionaDadosFundacao: OleVariant;
begin
  Result := GetDataPacket(
   ' select     p.NOME,                        ' +
   '            p.RAZAOSOCIAL,                 ' +
   '            e.LOGRADOURO,                  ' +
   '            e.NUMERO,                      ' +
   '            e.COMPLEMENTO,                 ' +
   '            e.BAIRRO,                      ' +
   '            c.NOME as CIDADE,              ' +
   '            c.CODESTADO,                   ' +
   '            e.CEP,                         ' +
   '            p.IDIMAGEM                     ' +
   ' from       PESSOA p,                      ' +
   '            ENDPESS e,                     ' +
   '            CIDADES c,                     ' +
   '            EMPRESAPROP m                  ' +
   ' where      p.IDPESSOA   = m.IDPESSOA      ' +
   '   and      p.IDPESSOA   = e.IDPESSOA  (+) ' +
   '   and      e.IDCIDADES  = c.IDCIDADES (+) ' );
end;


function TCtrlWebContraCheque.SelecionaContraCheque( iIdPessoa : integer;
         sDtPagamento : String ) : OleVariant;
begin
  Result := GetDataPacket(
    ' select     ben.NOME,                                                                                   ' +
    '            pfi.DATANASC,                                                                               ' +
    '            elp.MATRICULA,                                                                              ' +
    '            ppp.INSCRICAONUMERO,                                                                        ' +
    '            ep.LOGRADOURO,                                                                              ' +
    '            ep.NUMERO,                                                                                  ' +
    '            ep.COMPLEMENTO,                                                                             ' +
    '            ep.BAIRRO,                                                                                  ' +
    '            cid.NOME as CIDADE,                                                                         ' +
    '            est.CODESTADO,                                                                              ' +
    '            ep.CEP,                                                                                     ' +
    '            substr( hst.MESCOBRANCA, 6, 2 ) || ''/'' || substr( hst.MESCOBRANCA, 1, 4 ) as MESCOBRANCA, ' +
    '            pfi.NUMDEPIRRF,                                                                             ' +
    '            pvd.FLGDESCONTO,                                                                            ' +
    '            decode( pvd.FLGDESCONTO, 0, ''PROVENTO'', 1, ''DESCONTO'', ''INFORMATIVA'' ) as PD,         ' +
    '            substr( hst.MES, 6, 2 ) || ''/'' || substr( hst.MES, 1, 4 ) as MES,                         ' +
    '            nvl( pvd.CODPROVDESC, pvd.IDPROVENTO ) as CODIGO,                                           ' +
    '            nvl( pvd.DESCRPROVDESC, pvd.DESCRICAO ) as DESCRICAO,                                       ' +
    '            hst.VALORPROVENTO,                                                                          ' +
    '            decode( pvd.FLGDESCONTO, 0, hst.VALORPROVENTO, 0.0 ) as VLPROVENTO,                         ' +
    '            bco.NUMBANCO,                                                                               ' +
    '            bc.NOME as BANCO,                                                                           ' +
    '            ag.NUMAGENCIA,                                                                              ' +
    '            agn.NOME as AGENCIA,                                                                        ' +
    '            cb.CONTACORRENTE,                                                                           ' +
    '            decode( pvd.FLGDESCONTO, 1, hst.VALORPROVENTO, 0.0 ) as VLDESCONTO                          ' +
    ' from       HISTRUBSAL        hst,                                                                      ' +
    '            ELEGPATRO         elp,                                                                      ' +
    '            PARTPREVPLAN      ppp,                                                                      ' +
    '            PESSOA            ben,                                                                      ' +
    '            PESSOAFISICA      pfi,                                                                      ' +
    '            PROVDESC          pvd,                                                                      ' +
    '            ENDPESS           ep,                                                                       ' +
    '            CONTABANCARIA     cb,                                                                       ' +
    '            PESSOA            bc,                                                                       ' +
    '            PESSOA            agn,                                                                      ' +
    '            BANCO             bco,                                                                      ' +
    '            AGENCIABANCARIA   ag,                                                                       ' +
    '            CIDADES           cid,                                                                      ' +
    '            ESTADO            est                                                                       ' +
    ' where      hst.IDRESPONSAVEL = ' + IntToStr( iIdPessoa )                                                 +
    '   and      hst.DATAPAGAMENTO = to_date(' + QuotedStr( sDtPagamento ) + ', ''DD / MM / YYYY'')          ' +
    '   and      pvd.IDPROVENTO    = hst.IDRUBRICA                                                           ' +
    '   and      elp.IDPESSOA      = hst.IDTITULAR                                                           ' +
    '   and      elp.IDPESSJUR     = hst.IDPATRO                                                             ' +
    '   and      ppp.IDPESSJUR     = hst.IDPATRO                                                             ' +
    '   and      ppp.IDPLANOPREV   = hst.IDPLANOPREV                                                         ' +
    '   and      ppp.IDPESSOA      = hst.IDTITULAR                                                           ' +
    '   and      hst.IDRESPONSAVEL = pfi.IDPESSOA                                                            ' +
    '   and      ben.IDPESSOA      = hst.IDRESPONSAVEL                                                       ' +
    '   and      cb.IDPESSOA       = hst.IDRESPONSAVEL                                                       ' +
    '   and      ag.IDPESSOA       = cb.IDAGENCIA                                                            ' +
    '   and      bc.IDPESSOA       = ag.IDBANCO                                                              ' +
    '   and      agn.IDPESSOA      = ag.IDPESSOA                                                             ' +
    '   and      bc.IDPESSOA       = bco.IDPESSOA                                                            ' +
    '   and      hst.IDRESPONSAVEL = ep.IDPESSOA                                                             ' +
    '   and      ep.IDENDERECO     = ben.IDENDCORRESP                                                        ' +
    '   and      ( ( rtrim( hst.NUMBANCO) = bco.NUMBANCO ) or ( hst.NUMBANCO is null ) )                     ' +
    '   and      ( ( hst.NUMAGENCIA = ag.NUMAGENCIA) or ( hst.NUMAGENCIA is null ) )                         ' +
    '   and      ep.IDCIDADES      = cid.IDCIDADES     (+)                                                   ' +
    '   and      cid.IDESTADO      = est.IDESTADO      (+)                                                   ' +
    '   and      cb.FLGCONTAPREF   = 1                                                                       ' +
    ' order by   ben.NOME,                                                                                   ' +
    '            pvd.FLGDESCONTO,                                                                            ' +
    '            MES                                                                                         ' );
end;

end.
