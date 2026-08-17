{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//N.Atender..........: 32554
//Data da Alteração..: 09/04/2026
//Responsável........: Paulo Nobre
//Descrição..........: Incluso um DISTINCT na qry da função DadosDocsVencidos..
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Ajustes para trazer os valores de Juros, Multa e Correção pela
             'CtrlParamMulta' iserida no Cadastro de Contratos de Locação...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlInadimplencia;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil, uComunsImobiliarioDB,
     uComunsImobiliario, uCMClientDataset, uCmFileUtils, uCtrlModuloImobiliario;

const
  CR = #13#10;

type
  TCtrlInadimplencia = class(TCmControlObject)
  protected

    procedure AfterInitialize; override;

  private

    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;

    ParamSistema  : TParamSistema;
  public

    constructor Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;

    destructor Destroy; override;

    function RecuperaContratos( sNoContrato, sNomeContrato, sNomeLocatario, sNomeImovel,
                                sNomeImovelMestre: string; dDtInicio, dDtFim : TDateTime;
                                iQtdeDias : integer; sComparadorQtdeDias, sTipoContrato : string;
                                iIdSitContImob : integer; dDataCalc : TDateTime; bApenasAbertos, bCFinan : boolean;
                                bConsiderarPendJur : boolean ) : OLEVariant;

    function RecuperaImoveis( iIdContratoImovel : integer ) : OLEVariant;

    function RecuperaDocumentosImob( iIdContratoImovel : integer; dDataCalc : TDateTime; bApenasAbertos, bCFinan : boolean ) : OLEVariant;

    function RecuperaDocumentosAliena( iIdContratoImovel : integer; dDataCalc : TDateTime; bApenasAbertos : boolean ) : OLEVariant;

    function ExisteDocumentosImob( iIdContratoImovel : integer; dDtInicio, dDtFim, dDataCalc : TDateTime; bApenasAbertos : boolean ) : boolean;

    function ExisteDocumentosAliena( iIdContratoImovel : integer; bApenasAbertos : boolean ) : boolean;

    function TipoParcela( const iFlgTipo : Integer ) : string;

    function AtualizaDataLimite(const sFLGTIPOCONTRATO : String; const IDContratoImovel : Integer; const bAtualizaTodos : Boolean) : Boolean;

    procedure DadosDocsVencidos( iCodDocumento : integer;
                                 iIdParcFinancImov: Integer;
                                 dLimite : TDateTime;
                                 iMesesAnteriores,
                                 iIdIndCorrecao : Integer;
                                 fConVlrMulta,
                                 fConPercentMulta : Extended;
                                 iConMoedaMulta : Integer;
                                 fConVlrMora,
                                 fConPercentMora : Extended;
                                 iConMoedaMora : Integer;
                                 iFlgMoraProporc,
                                 iIdCidades,
                                 iIdPais,
                                 iConDiasTolerancia,
                                 iConDiasRepasse : Integer;
                                 bTemBaixaParcial : Boolean;
                                 fValorAReceber,
                                 fValorRecebido : Extended;
                                 dDataVencimento,
                                 dDataLimite : TDateTime;
                                 sConPerMora,
                                 sCodEstado,
                                 sFlgTipoDiaTolera,
                                 sFlgTipoDiaRepass,
                                 sFlgTipoContrato,
                                 sFlgCalcInadimp : String;
                                 bRecalculaDoc : Boolean;
                                 var fValorAtual,  fMulta,    fJuros,            fCorrecaoMonet,
                                     fMultaDif,    fJurosDif, fCorrecaoMonetDif, fProporcao,
                                     fValorDiverg, fValorDivergAtual : Extended;
                                 var dDataCalculo : TDateTime );

    function ListaAlteradores(iContrato : Integer) : OleVariant;

  end;

implementation

{ TCtrlInadimplencia }

function TCtrlInadimplencia.RecuperaContratos( sNoContrato, sNomeContrato, sNomeLocatario,
          sNomeImovel, sNomeImovelMestre: string; dDtInicio, dDtFim: TDateTime;
          iQtdeDias: integer; sComparadorQtdeDias, sTipoContrato: string;
          iIdSitContImob : integer; dDataCalc : TDateTime; bApenasAbertos, bCFinan : boolean;
          bConsiderarPendJur : boolean ): OLEVariant;
var
  sSQL : string;
  cdsAux : TCMClientDataset;
begin

  sSQL := '';
  if ( sTipoContrato = 'T' ) or ( sTipoContrato = 'L' ) or ( sTipoContrato = 'D' ) then
  begin

    sSQL :=
     ' SELECT   DISTINCT                                                                                                           ' + CR +
     '          CI.IDCONTRATOIMOVEL,                                                                                               ' + CR +
     '          CI.IDLOCATARIO,                                                                                                    ' + CR +
     '          CI.CONNUMERO,                                                                                                      ' + CR +
     '          CI.CONNOME,                                                                                                        ' + CR +
     '          PE.NOME AS LOCATARIO,                                                                                              ' + CR +
     '          CI.CONDATAINICIO,                                                                                                  ' + CR +
     '          CI.CONDATAFIM,                                                                                                     ' + CR +
     '          CI.FLGTIPOCONTRATO,                                                                                                ' + CR +
     '          CI.FLGTIPODIATOLERA,                                                                                               ' + CR +
     '          CI.CONMESREFREAJUSTE,                                                                                              ' + CR +
     '          CI.CONVLRMULTA,                                                                                                    ' + CR +
     '          CI.CONPERCENTMULTA,                                                                                                ' + CR +
     '          CI.CONMOEDAMULTA,                                                                                                  ' + CR +
     '          CI.CONVLRMORA,                                                                                                     ' + CR +
     '          CI.CONPERCENTMORA,                                                                                                 ' + CR +
     '          CI.CONMOEDAMORA,                                                                                                   ' + CR +
     '          CI.CONPERMORA,                                                                                                     ' + CR +
     '          CI.CONDIASTOLERANCIA,                                                                                              ' + CR +
     '          CI.CONDIASREPASSE,                                                                                                 ' + CR +
     '          CI.CONPERMORA,                                                                                                     ' + CR +
     '          CI.IDINDCORRECAO,                                                                                                  ' + CR +
     '          CI.FLGMORAPROPORC,                                                                                                 ' + CR +
     '          CI.IDCIDADES,                                                                                                      ' + CR +
     '          CI.IDPAIS,                                                                                                         ' + CR +
     '          CI.CODESTADO,                                                                                                      ' + CR +
     '          DECODE(CI.FLGTIPOCONTRATO,''L'',''Locação'',''Confissão'') AS DSCTIPOCONTRATO                                      ' + CR +
     ' FROM     CONTRATOIMOVEL  CI,                                                                                                ' + CR +
     '          PESSOA          PE,                                                                                                ' + CR +
     '          CONTRATOXIMOVEL CX,                                                                                                ' + CR +
     '          IMOVEL          IM,                                                                                                ' + CR +
     '          IMOVEL          II,                                                                                                ' + CR +
     '          ( SELECT   LI.IDCONTRATOIMOVEL,                                                                                    ' + CR +
     '                     SUM( DECODE( RTRIM( LD.OPERACAO ), ''2'', DECODE( D.RECPAG, ''R'', LD.VALOR, 0 ), 0 ) +                 ' + CR +
     '                          DECODE( RTRIM( LD.OPERACAO ), ''4'', DECODE( D.RECPAG, ''R'',                                      ' + CR +
     '                          DECODE( LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1 ), 0 ), 0 ) ) AS TOT_RECEBER,                    ' + CR +
     '                     SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', LD.VALOR, 0 ), 0 ) ) AS RECEBIDO     ' + CR +
     '            FROM     DOCUMENTO D,                                                                                            ' + CR +
     '                     LANCTODOCUM LD,                                                                                         ' + CR +
     '                     LANCAMENTOSIMOVEL LI,                                                                                   ' + CR ;

    if not bCFinan then
      sSQL := sSQL +
       '                   ( SELECT RP.CODDOCUMENTO,           ' + CR +
       '                            RP.DATABAIXA AS DATAPAGTO  ' + CR +
       '                     FROM   RECBTOPAGTO RP ) DB        '
    else
      sSQL := sSQL +
       '                   ( SELECT   D.CODDOCUMENTO,                                                                                       ' + CR +
       '                              DECODE( MIN( MMM.DATALANCFINAN ), NULL, MIN( RP.DATABAIXA ), MIN( MMM.DATALANCFINAN ) ) AS DATAPAGTO  ' + CR +
       '                     FROM     DOCUMENTO D,                                                                                          ' + CR +
       '                              LANCTODOCUM LD,                                                                                       ' + CR +
       '                              RECBTOPAGTO RP,                                                                                       ' + CR +
       '                              ( SELECT XX.IDRELACIONANI,                                                                            ' + CR +
       '                                       XX.MOVIN_FINAN,                                                                              ' + CR +
       '                                       XX.DATALANCFINAN,                                                                            ' + CR +
       '                                       MM.CODDOCUMENTO                                                                              ' + CR +
       '                                FROM   ( SELECT R2.IDRELACIONANI,                                                                   ' + CR +
       '                                                R2.CODLANCFINANC AS MOVIN_FINAN,                                                    ' + CR +
       '                                                M.DATALANCFINAN,                                                                    ' + CR +
       '                                                R2.FLGNI                                                                            ' + CR +
       '                                         FROM   RELACIONANI R2,                                                                     ' + CR +
       '                                                MOVIMFINANC M                                                                       ' + CR +
       '                                         WHERE  R2.CODLANCFINANC = M.CODLANCFINANC                                                  ' + CR +
       '                                           AND  R2.IDRELACIONANI IN ( SELECT R3.IDRELACIONANI                                       ' + CR +
       '                                                                      FROM   RELACIONANI R3,                                        ' + CR +
       '                                                                             RECBTOPAGTO RB                                         ' + CR +
       '                                                                      WHERE  R3.CODLANCFINANC = RB.CODLANCFINANC ) ) XX,            ' + CR +
       '                                       ( SELECT CJ1.IDRELACIONANI,                                                                  ' + CR +
       '                                                CJ1.MOVIN_FINAN,                                                                    ' + CR +
       '                                                CJ2.CODDOCUMENTO                                                                    ' + CR +
       '                                         FROM   ( SELECT R2.IDRELACIONANI,                                                          ' + CR +
       '                                                         R2.CODLANCFINANC AS MOVIN_FINAN,                                           ' + CR +
       '                                                         M.DATALANCFINAN,                                                           ' + CR +
       '                                                         R2.FLGNI                                                                   ' + CR +
       '                                                  FROM   RELACIONANI R2,                                                            ' + CR +
       '                                                         MOVIMFINANC M                                                              ' + CR +
       '                                                  WHERE  R2.CODLANCFINANC = M.CODLANCFINANC                                         ' + CR +
       '                                                    AND  R2.IDRELACIONANI IN ( SELECT R3.IDRELACIONANI                              ' + CR +
       '                                                                               FROM   RELACIONANI R3,                               ' + CR +
       '                                                                                      RECBTOPAGTO RB                                ' + CR +
       '                                                                               WHERE  R3.CODLANCFINANC = RB.CODLANCFINANC ) ) CJ1,  ' + CR +
       '                                                ( SELECT R.CODDOCUMENTO,                                                            ' + CR +
       '                                                         R.CODLANCFINANC AS MOVIN_DOCUM                                             ' + CR +
       '                                                  FROM   RECBTOPAGTO R,                                                             ' + CR +
       '                                                         PARCFINANCIMOV DD                                                          ' + CR +
       '                                                  WHERE  R.CODDOCUMENTO = DD.CODDOCUMENTO ) CJ2                                     ' + CR +
       '                                         WHERE CJ2.MOVIN_DOCUM = CJ1.MOVIN_FINAN ) MM                                               ' + CR +
       '                                WHERE MM.IDRELACIONANI = XX.IDRELACIONANI                                                           ' + CR +
       '                                  AND XX.FLGNI         = ''I'' ) MMM                                                                ' + CR +
       '                     WHERE    ( LD.ESTORNO IS NULL                    )                                                             ' + CR +
       '                       AND    ( D.CODDOCUMENTO  = LD.CODDOCUMENTO     )                                                             ' + CR +
       '                       AND    ( D.CODDOCUMENTO  = MMM.CODDOCUMENTO(+) )                                                             ' + CR +
       '                       AND    ( LD.NUMLANCTO    = RP.NUMLANCTO        )                                                             ' + CR +
       '                       AND    ( LD.CODDOCUMENTO = RP.CODDOCUMENTO     )                                                             ' + CR +
       '                     GROUP BY D.CODDOCUMENTO ) DB                                                                                   ' + CR ;

    sSQL := sSQL +
     '            WHERE    ( LI.IDCONTRATOIMOVEL IS NOT NULL ) ' ;

    if dDtInicio <> 0 then
      sSQL := sSQL +
       '            AND    ( LI.DATAVENCIMENTO >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtInicio ) ) + ' ) ';

    if dDtFim <> 0 then
      sSQL := sSQL +
       '            AND    ( LI.DATAVENCIMENTO <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim ) ) + ' ) ';

    if iQtdeDias > 0 then
      sSQL := sSQL +
       '            AND    ( TRUNC( DECODE( DB.DATAPAGTO, null, TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ' ) ) - LI.DATAVENCIMENTO ) ' +
       sComparadorQtdeDias + ' ' + IntToStr( iQtdeDias ) + ' ) ';

    sSQL := sSQL +
     '              AND    ( ( ( D.STATUS <> ''2'' ) OR ( D.STATUS IS NULL ) )                                                  ' ;

    if bApenasAbertos then
      sSQL := sSQL + ' OR ( ( D.STATUS  = ''2'' ) AND ( D.FLGNAOCONCILIADO = 1 ) ) ) '
    else
      sSQL := sSQL + ' OR ( LI.DATALIMITE < DB.DATAPAGTO ) ) ';

    sSQL := sSQL +
     '              AND    ( D.RECPAG        = ''R''                       )                                                    ' +
     '              AND    ( LI.CODDOCUMENTO = D.CODDOCUMENTO              )                                                    ' +
     '              AND    ( D.CODDOCUMENTO  = LD.CODDOCUMENTO             )                                                    ' +
     '              AND    ( D.CODDOCUMENTO  = DB.CODDOCUMENTO (+)         )                                                    ' +
     '            GROUP BY LI.IDCONTRATOIMOVEL ) RD                                                                             ' +
     ' WHERE    CI.IDLOCATARIO      = PE.IDPESSOA (+)                                                                           ' +
     '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL                                                                       ' +
     '   AND    CX.IDIMOVEL         = IM.IDIMOVEL                                                                               ' +
     '   AND    IM.IDIMOVELMESTRE   = II.IDIMOVEL                                                                               ' +
     '   AND    CI.IDCONTRATOIMOVEL = RD.IDCONTRATOIMOVEL                                                                       ' ;

    if sTipoContrato = 'L' then
      sSQL := sSQL +
     '   AND    CI.FLGTIPOCONTRATO  = ''L''                                                                                     ';

    if sTipoContrato = 'D' then
      sSQL := sSQL +
     '   AND    CI.FLGTIPOCONTRATO  = ''D''                                                                                     ';

    if not bConsiderarPendJur then
      sSQL := sSQL +
       '   AND    CI.IDSITCONTIMOB    is null                                                                                   ' ;

    if trim( sNoContrato ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( CI.CONNUMERO ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNoContrato ) ) + '%' );

    if trim( sNomeContrato ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( CI.CONNOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeContrato ) ) + '%' );

    if trim( sNomeLocatario ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( PE.NOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeLocatario ) ) + '%' );

    if trim( sNomeImovel ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( IM.IMONOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeImovel ) ) + '%' );

    if trim( sNomeImovelMestre ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( II.IMONOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeImovelMestre ) ) + '%' );

    if iIdSitContImob > 0 then
      sSQL := sSQL +
       '   AND    CI.IDSITCONTIMOB    = ' + IntToStr( iIdSitContImob );
  end;

  if ( sTipoContrato = 'T' ) or ( sTipoContrato = 'A' ) or ( sTipoContrato = 'D' ) then
  begin
    if sSQL <> '' then
      sSQL := sSQL +
       ' UNION                                                                                                                  ' ;

    sSQL := sSQL +
     ' SELECT   DISTINCT                                                                                                        ' +
     '          CI.IDCONTRATOIMOVEL,                                                                                            ' +
     '          CI.IDLOCATARIO,                                                                                                 ' +
     '          CI.CONNUMERO,                                                                                                   ' +
     '          CI.CONNOME,                                                                                                     ' +
     '          PE.NOME AS LOCATARIO,                                                                                           ' +
     '          CI.CONDATAINICIO,                                                                                               ' +
     '          CI.CONDATAFIM,                                                                                                  ' +
     '          CI.FLGTIPOCONTRATO,                                                                                             ' +
     '          CI.FLGTIPODIATOLERA,                                                                                            ' +
     '          CI.CONMESREFREAJUSTE,                                                                                           ' +
     '          CI.CONVLRMULTA,                                                                                                 ' +
     '          CI.CONPERCENTMULTA,                                                                                             ' +
     '          CI.CONMOEDAMULTA,                                                                                               ' +
     '          CI.CONVLRMORA,                                                                                                  ' +
     '          CI.CONPERCENTMORA,                                                                                              ' +
     '          CI.CONMOEDAMORA,                                                                                                ' +
     '          CI.CONPERMORA,                                                                                                  ' +
     '          CI.CONDIASTOLERANCIA,                                                                                           ' +
     '          CI.CONDIASREPASSE,                                                                                              ' +
     '          CI.CONPERMORA,                                                                                                  ' +
     '          CI.IDINDCORRECAO,                                                                                               ' +
     '          CI.FLGMORAPROPORC,                                                                                              ' +
     '          CI.IDCIDADES,                                                                                                   ' +
     '          CI.IDPAIS,                                                                                                      ' +
     '          CI.CODESTADO,                                                                                                   ' +
     '          ''Alienação'' AS DSCTIPOCONTRATO                                                                                ' +
     ' FROM     CONTRATOIMOVEL  CI,                                                                                             ' +
     '          PESSOA          PE,                                                                                             ' +
     '          CONTRATOXIMOVEL CX,                                                                                             ' +
     '          IMOVEL          IM,                                                                                             ' +
     '          IMOVEL          II,                                                                                             ' +
     '          PARCFINANCIMOV  PF,                                                                                             ' +
     '          CONDPAGIMOVEL   CP                                                                                              ' +
     ' WHERE    CI.IDLOCATARIO      = PE.IDPESSOA (+)                                                                           ' +
     '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL                                                                       ' +
     '   AND    CX.IDIMOVEL         = IM.IDIMOVEL                                                                               ' +
     '   AND    IM.IDIMOVELMESTRE   = II.IDIMOVEL                                                                               ' +
     '   AND    PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL                                                                        ' +
     '   AND    CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL                                                                       ' ;


    if sTipoContrato = 'A' then
      sSQL := sSQL +
     '   AND    CI.FLGTIPOCONTRATO  = ''C''                                                                                     ';

    if sTipoContrato = 'D' then
      sSQL := sSQL +
     '   AND    CI.FLGTIPOCONTRATO  = ''D''                                                                                     ';

    if not bConsiderarPendJur then
      sSQL := sSQL +
       '   AND    CI.IDSITCONTIMOB    is null                                                                                   ' ;

    if dDtInicio <> 0 then
      sSQL := sSQL +
       ' AND    PF.DATAVENCIMENTO >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtInicio ) );

    if dDtFim <> 0 then
      sSQL := sSQL +
       ' AND    PF.DATAVENCIMENTO <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim ) );

    if iQtdeDias > 0 then
      sSQL := sSQL +
       ' AND    TRUNC( DECODE( PF.DATAPAGAMENTO, null, TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ' ) ) - PF.DATAVENCIMENTO ) ' +
       sComparadorQtdeDias + ' ' + IntToStr( iQtdeDias );

    sSQL := sSQL +
     '   AND    PF.FLGTIPOLANC      IN ( 2, 3, 5, 6, 7, 8, 9 ) ' +
     '   AND ';

    if bApenasAbertos then
      sSQL := sSQL + ' ( ( PF.FLGCONCILIADO IS NULL ) OR ( PF.FLGCONCILIADO = ''N'' ) ) '
    else
      sSQL := sSQL + ' ( PF.DATALIMITE < PF.DATAPAGAMENTO ) ';

    if trim( sNoContrato ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( CI.CONNUMERO ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNoContrato ) ) + '%' );

    if trim( sNomeContrato ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( CI.CONNOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeContrato ) ) + '%' );

    if trim( sNomeLocatario ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( PE.NOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeLocatario ) ) + '%' );

    if trim( sNomeImovel ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( IM.IMONOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeImovel ) ) + '%' );

    if trim( sNomeImovelMestre ) <> '' then
      sSQL := sSQL +
       ' AND UPPER( II.IMONOME ) LIKE ' + QuotedStr( '%' + trim( UpperCase( sNomeImovelMestre ) ) + '%' );

    if iIdSitContImob > 0 then
      sSQL := sSQL +
       '   AND    CI.IDSITCONTIMOB    = ' + IntToStr( iIdSitContImob );

  end;

  sSQL := sSQL +
   ' ORDER BY 2, 4                                                                                                            ' ;

  cdsAux := TCMClientDataset.Create( nil );
  try

    cdsAux.Data := GetDataPacket( sSQL );

    cdsAux.First;
    while not cdsAux.Eof do
    begin

      if (trim( cdsAux.FieldByName('FLGTIPOCONTRATO').AsString ) = 'L') or
         (trim( cdsAux.FieldByName('FLGTIPOCONTRATO').AsString ) = 'D') then
      begin
        if not ExisteDocumentosImob( cdsAux.FieldByName('IDCONTRATOIMOVEL').AsInteger, dDtInicio, dDtFim, dDataCalc, bApenasAbertos ) then
        begin
          cdsAux.Delete;
          Continue;
        end;
      end
      else
      begin
        if not ExisteDocumentosAliena( cdsAux.FieldByName('IDCONTRATOIMOVEL').AsInteger, bApenasAbertos ) then
        begin
          cdsAux.Delete;
          Continue;
        end;
      end;

      cdsAux.Next;
    end;

    Result := cdsAux.Data;

  finally
    cdsAux.Free;
  end;

end;


function TCtrlInadimplencia.RecuperaDocumentosAliena( iIdContratoImovel: integer; dDataCalc : TDateTime; bApenasAbertos : boolean ): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT    C.IDCONTRATOIMOVEL,                                                                                                        ' +
   '           AL.CODDOCUMENTO,                                                                                                           ' +
   '           AL.IDPARCFINANCIMOV,                                                                                                       ' +
   '           AL.NODOCUMENTO,                                                                                                            ' +
   '           AL.FLGTIPOLANC,                                                                                                            ' +
   '           ''' + StringOfChar( ' ', 60 ) + ''' AS DESCCUSTORECIMO,                                                                    ' +
   '           AL.DATAVENCIMENTO AS DATAVENCTO,                                                                                           ' +
   '           AL.DATALIMITE,                                                                                                             ' +
   '           AL.COMPETENCIA,                                                                                                            ' +

   ' DECODE(AL.DATAPAGAMENTO,NULL, ' +
   '             TRUNC( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ' ) - AL.DATAVENCIMENTO ), ' +
   '             TRUNC( AL.DATAPAGAMENTO - AL.DATAVENCIMENTO ) ) AS DIAS_ATRASO,                                        ' + CR +

   '           AL.VALOR_ORIGINAL,                                                                                                         ' +
   '           AL.VALOR_RECEBIDO,                                                                                                         ' +
   '           AL.DATAPAGAMENTO AS DATAPAGTO,                                                                                             ' +
   '           0 AS MULTA,                                                                                                                ' +
   '           0 AS JUROS,                                                                                                                ' +
   '           0 AS CORRECMONET,                                                                                                          ' +
   '           0 AS MULTADIF,                                                                                                             ' +
   '           0 AS JUROSDIF,                                                                                                             ' +
   '           0 AS CORRECMONETDIF,                                                                                                       ' +
   '           0 AS PROPORCAO,                                                                                                            ' +
   '           0 AS VALORATUAL,                                                                                                           ' +
   '           0 AS VALORDIVERG,                                                                                                          ' +
   '           0 AS VALORDIVERGATUAL,                                                                                                     ' +
   '           SYSDATE AS DATACALCULO                                                                                                     ' +
   ' FROM      CONTRATOIMOVEL C,                                                                                                          ' +
   '           (  SELECT CI.IDCONTRATOIMOVEL,                                                                                             ' +
   '                     PF.CODDOCUMENTO,                                                                                                 ' +
   '                     PF.IDPARCFINANCIMOV,                                                                                             ' +
   '                     DO.NODOCUMENTO,                                                                                                  ' +
   '                     PF.FLGTIPOLANC,                                                                                                  ' +
   '                     PF.DATAPAGAMENTO,                                                                                                ' +
   '                     PF.DATALIMITE,                                                                                                   ' +
   '                     DECODE( PF.DATAVENCIMENTO, NULL, CP.DATAINI, PF.DATAVENCIMENTO ) AS DATAVENCIMENTO,                              ' +
   '                     TO_CHAR( DECODE( PF.DATAVENCIMENTO, NULL, CP.DATAINI, PF.DATAVENCIMENTO ), ''MM/YYYY'' ) AS COMPETENCIA,         ' +
   '                     DECODE( PF.FLGTIPOLANC, 9, PF.VLRAMORTIZACAO, PF.VLRPRESTACAO ) AS VALOR_ORIGINAL,                               ' +
   '                     PF.VLRPAGO AS VALOR_RECEBIDO                                                                                     ' +
   '              FROM   PARCFINANCIMOV PF,                                                                                               ' +
   '                     DOCUMENTO      DO,                                                                                               ' +
   '                     CONDPAGIMOVEL  CP,                                                                                               ' +
   '                     CONTRATOIMOVEL CI                                                                                                ' +
   '              WHERE  ( PF.FLGTIPOLANC IN ( 2, 3, 5, 6, 7, 8, 9 )            )                                                         ' +
   '                AND  ( ( PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = ''N'' )                                                       ' ;

  if bApenasAbertos then
    sSQL := sSQL + ')'
  else
    sSQL := sSQL + ' OR ( PF.DATALIMITE < PF.DATAPAGAMENTO ) ) ';

  sSQL := sSQL +
   '                AND  ( PF.IDCONDPAGIMOVEL     = CP.IDCONDPAGIMOVEL          )                                                 ' +
   '                AND  ( CP.IDCONTRATOIMOVEL    = CI.IDCONTRATOIMOVEL         )                                                 ' +
   '                AND  ( PF.CODDOCUMENTO        = DO.CODDOCUMENTO (+)       ) ) AL                                              ' +
   ' WHERE     ( C.IDCONTRATOIMOVEL = AL.IDCONTRATOIMOVEL        )                                                                ' +
   '   AND     ( C.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel ) + ' )                                                     ' ;

  Result := GetDataPacket( sSQL );
end;


function TCtrlInadimplencia.RecuperaDocumentosImob( iIdContratoImovel: integer; dDataCalc : TDateTime;
                                                    bApenasAbertos, bCFinan : boolean ): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT    C.IDCONTRATOIMOVEL,      '+#13+
   '           RD.CODDOCUMENTO,         '+#13+
   '           -1 AS IDPARCFINANCIMOV,  '+#13+
   '           RD.NODOCUMENTO,          '+#13+
   '           0 AS FLGTIPOLANC,        '+#13+
   '           RD.DESCCUSTORECIMO,      '+#13+
   '           RD.DATAVENCTO,           '+#13+
   '           RD.DATALIMITE,           '+#13+
   '           RD.COMPETENCIA,          '+#13+
   '           RD.IDTIPOCUSTORECIMO,    '+#13+ // Daniel - 26461
   '           0 AS CORRECAOMONET,      '+#13+ // TESTE

   ' DECODE(RD.DATAPAGTO,NULL, ' +
   '             TRUNC( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ' ) - RD.DATAVENCTO ), ' +
   '             TRUNC( RD.DATAPAGTO - RD.DATAVENCTO ) ) AS DIAS_ATRASO, '+#13+

   '           RD.VALOR_ORIGINAL,      '+#13+
   '           RD.VALOR_RECEBIDO,      '+#13+
   '           RD.DATAPAGTO,           '+#13+
   '           0 AS MULTA,             '+#13+
   '           0 AS JUROS,             '+#13+
   '           0 AS CORRECMONET,       '+#13+
   '           0 AS MULTADIF,          '+#13+
   '           0 AS JUROSDIF,          '+#13+
   '           0 AS CORRECMONETDIF,    '+#13+
   '           0 AS PROPORCAO,         '+#13+
   '           0 AS VALORATUAL,        '+#13+
   '           0 AS VALORDIVERG,       '+#13+
   '           0 AS VALORDIVERGATUAL,  '+#13+
   '           SYSDATE AS DATACALCULO  '+#13+
   ' FROM      CONTRATOIMOVEL C,       '+#13+
   '           (  SELECT   D.CODDOCUMENTO, '+#13+
   '                       D.NODOCUMENTO,  '+#13+
   '                       LI.IDCONTRATOIMOVEL, '+#13+
   '                       LI.IDTIPOCUSTORECIMO, '+#13+ // Daniel - 26461
   '                       TC.DESCCUSTORECIMO,  '+#13+
   '                       D.DATAVENCTO,        '+#13+
   '                       DB.DATAPAGTO,        '+#13+
   '                       LI.DATALIMITE,       '+#13+
   '                       TO_CHAR( LI.MESCOMPETENCIA, ''00'' ) || ''/'' || TO_CHAR( LI.ANOCOMPETENCIA ) AS COMPETENCIA,  '+#13+
   '                       SUM( DECODE( RTRIM( LD.OPERACAO ), ''2'', DECODE( D.RECPAG, ''R'', LD.VALOR, 0 ), 0 ) +        '+#13+
   '                        DECODE( RTRIM( LD.OPERACAO ), ''4'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1 ), 0 ), 0 ) ) AS VALOR_ORIGINAL, '+#13+
   '                       SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', LD.VALOR, 0 ), 0 ) ) AS VALOR_RECEBIDO '+#13+
   '              FROM     DOCUMENTO D,      '+#13+
   '                       LANCTODOCUM LD,   '+#13+
   '                       ( SELECT DISTINCT '+#13+
   '                                L2.CODDOCUMENTO,      '+#13+
   '                                L2.MESCOMPETENCIA,    '+#13+
   '                                L2.DATALIMITE,        '+#13+
   '                                L2.IDCONTRATOIMOVEL,  '+#13+
   '                                L2.CODTIPIMOVEL,      '+#13+
   '                                L2.IDTIPOCUSTORECIMO, '+#13+

                                    // Marchetti - Pendencia 19980
   '                                NVL(L2.FLGESTORNADO,0) AS FLGESTORNADO, '+#13+
                                    // Fim Marchetti - Pendencia 19980

   '                                L2.ANOCOMPETENCIA     '+#13+
   '                         FROM   LANCAMENTOSIMOVEL L2  '+#13+
   '                         WHERE  L2.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel ) + ' ) LI, '+#13;

  if not bCFinan then
    sSQL := sSQL +
     ' ( SELECT RP.CODDOCUMENTO,          '+#13+
     '          MAX(RP.DATABAIXA) AS DATAPAGTO '+#13+
     '   FROM   RECBTOPAGTO RP GROUP BY RP.CODDOCUMENTO ) DB,      '+#13

  else
    sSQL := sSQL +
     ' ( SELECT   D.CODDOCUMENTO, '+#13+
     '            DECODE( MIN( MMM.DATALANCFINAN ), NULL, MIN( RP.DATABAIXA ), MIN( MMM.DATALANCFINAN ) ) AS DATAPAGTO  '+#13+
     '   FROM     DOCUMENTO D,     '+#13+
     '            LANCTODOCUM LD,  '+#13+
     '            RECBTOPAGTO RP,  '+#13+
     '            ( SELECT XX.IDRELACIONANI,  '+#13+
     '                     XX.MOVIN_FINAN,    '+#13+
     '                     XX.DATALANCFINAN,  '+#13+
     '                     MM.CODDOCUMENTO    '+#13+
     '              FROM   ( SELECT R2.IDRELACIONANI, '+#13+
     '                              R2.CODLANCFINANC AS MOVIN_FINAN, '+#13+
     '                              M.DATALANCFINAN,  '+#13+
     '                              R2.FLGNI          '+#13+
     '                       FROM   RELACIONANI R2,   '+#13+
     '                              MOVIMFINANC M     '+#13+
     '                       WHERE  R2.CODLANCFINANC = M.CODLANCFINANC  '+#13+
     '                         AND  R2.IDRELACIONANI IN ( SELECT R3.IDRELACIONANI '+#13+
     '                                                    FROM   RELACIONANI R3,  '+#13+
     '                                                           RECBTOPAGTO RB   '+#13+
     '                                                    WHERE  R3.CODLANCFINANC = RB.CODLANCFINANC ) ) XX, '+#13+
     '                     ( SELECT CJ1.IDRELACIONANI, '+#13+
     '                              CJ1.MOVIN_FINAN,   '+#13+
     '                              CJ2.CODDOCUMENTO   '+#13+
     '                       FROM   ( SELECT R2.IDRELACIONANI, '+#13+
     '                                       R2.CODLANCFINANC AS MOVIN_FINAN, '+#13+
     '                                       M.DATALANCFINAN, '+#13+
     '                                       R2.FLGNI         '+#13+
     '                                FROM   RELACIONANI R2,  '+#13+
     '                                       MOVIMFINANC M    '+#13+
     '                                WHERE  R2.CODLANCFINANC = M.CODLANCFINANC '+#13+
     '                                  AND  R2.IDRELACIONANI IN ( SELECT R3.IDRELACIONANI '+#13+
     '                                                             FROM   RELACIONANI R3,  '+#13+
     '                                                                    RECBTOPAGTO RB   '+#13+
     '                                                             WHERE  R3.CODLANCFINANC = RB.CODLANCFINANC ) ) CJ1, '+#13+
     '                              ( SELECT R.CODDOCUMENTO,  '+#13+
     '                                       R.CODLANCFINANC AS MOVIN_DOCUM '+#13+
     '                                FROM   RECBTOPAGTO R,                 '+#13+
     '                                       PARCFINANCIMOV DD              '+#13+
     '                                WHERE  R.CODDOCUMENTO = DD.CODDOCUMENTO ) CJ2 '+#13+
     '                       WHERE CJ2.MOVIN_DOCUM = CJ1.MOVIN_FINAN ) MM '+#13+
     '              WHERE MM.IDRELACIONANI = XX.IDRELACIONANI             '+#13+
     '                AND XX.FLGNI         = ''I'' ) MMM                  '+#13+
     '   WHERE    ( LD.ESTORNO IS NULL                    )               '+#13+
     '     AND    ( D.CODDOCUMENTO  = LD.CODDOCUMENTO     )               '+#13+
     '     AND    ( D.CODDOCUMENTO  = MMM.CODDOCUMENTO(+) )               '+#13+
     '     AND    ( LD.NUMLANCTO    = RP.NUMLANCTO        )               '+#13+
     '     AND    ( LD.CODDOCUMENTO = RP.CODDOCUMENTO     )               '+#13+
     '   GROUP BY D.CODDOCUMENTO ) DB,                                    '+#13;

  sSQL := sSQL +
   '                       TIPOCUSTORECIMOV TC, '+#13+
   '                       TIPOIMOVEL TI        '+#13+
   '              WHERE    ( ( ( D.STATUS <> ''2'' ) OR ( D.STATUS IS NULL ) )  ' ;

  if bApenasAbertos then
    sSQL := sSQL + ' OR ( ( D.STATUS  = ''2'' ) AND ( D.FLGNAOCONCILIADO = 1 ) ) ) '
  else
    sSQL := sSQL + ' OR ( LI.DATALIMITE < DB.DATAPAGTO ) ) ';

  sSQL := sSQL +
   '                AND    ( LI.DATALIMITE < TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ',''DD/MM/YYYY''))  '+#13+
   '                AND    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO           ) '+#13+
   '                AND    ( LI.CODTIPIMOVEL      = TI.CODTIPIMOVEL          ) '+#13+
   '                AND    ( D.RECPAG             = ''R''                    ) '+#13+
   '                AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO          ) '+#13+
   '                AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO     ) '+#13+
   '                AND    ( D.CODDOCUMENTO       = DB.CODDOCUMENTO (+)      ) '+#13+
   '                AND    ( ( LD.CODALTERADOR IS NULL ) OR  ( LD.CODALTERADOR NOT IN( TI.CODALTMULTA, TI.CODALTJUROS, TI.CODALTCORRMON ) ) ) '+#13+

   // Marchetti - Pendencia 19980
   '                AND    ( LI.FLGESTORNADO      <> 1                       ) '+#13+
   // Fim Marchetti - Pendencia 19980

   '              GROUP BY D.CODDOCUMENTO,       '+#13+
   '                       D.NODOCUMENTO,        '+#13+
   '                       LI.IDCONTRATOIMOVEL,  '+#13+
   '                       TC.DESCCUSTORECIMO,   '+#13+
   '                       D.DATAVENCTO,         '+#13+
   '                       DB.DATAPAGTO,         '+#13+
   '                       LI.DATALIMITE,        '+#13+
   '                       LI.MESCOMPETENCIA,    '+#13+
   '                       LI.IDTIPOCUSTORECIMO, '+#13+ // Daniel - 26461
   '                       LI.ANOCOMPETENCIA ) RD  '+#13+   ' WHERE     ( C.IDCONTRATOIMOVEL = RD.IDCONTRATOIMOVEL ) '+#13+
   '   AND     ( C.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel ) + ' )   ' ;

  //CMDebugToFile(sSql,'c:\qry.txt');

  Result := GetDataPacket( sSQL );
end;


function TCtrlInadimplencia.RecuperaImoveis( iIdContratoImovel: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT   M.IMONOME AS IMOMESTRE,                                ' +
   '          I.IMONOME                                              ' +
   ' FROM     CONTRATOXIMOVEL CI,                                    ' +
   '          IMOVEL           I,                                    ' +
   '          IMOVEL           M                                     ' +
   ' WHERE    CI.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel )  +
   '   AND    CI.IDIMOVEL         = I.IDIMOVEL                       ' +
   '   AND    I.IDIMOVELMESTRE    = M.IDIMOVEL                       ' +
   ' ORDER BY 1, 2                                                   ' );
end;

function TCtrlInadimplencia.TipoParcela(const iFlgTipo : Integer): string;
begin
  Result := '';
  case iFlgTipo of
    1 : Result := 'Saldo Inicial';
    2 : Result := 'Sinal';
    3 : Result := 'Parc. Gerada';
    4 : Result := 'Parc. Projetada';
    5 : Result := 'Amort. Extra';
    6 : Result := 'Acerto Divergência';
    7 : Result := 'Venda a Vista';
    8 : Result := 'Caução';
    9 : Result := 'Parc. Antecipada';
   10 : Result := 'Pagto Resíduo';
  end;
end;


procedure TCtrlInadimplencia.DadosDocsVencidos( iCodDocumento : integer;
                                                iIdParcFinancImov : Integer;
                                                dLimite : TDateTime;
                                                iMESESANTERIORES,
                                                iIDINDCORRECAO : integer;
                                                fCONVLRMULTA,
                                                fCONPERCENTMULTA : extended;
                                                iCONMOEDAMULTA : integer;
                                                fCONVLRMORA,
                                                fCONPERCENTMORA : extended;
                                                iCONMOEDAMORA : integer;
                                                iFLGMORAPROPORC,
                                                iIDCIDADES,
                                                iIDPAIS,
                                                iCONDIASTOLERANCIA,
                                                iCONDIASREPASSE : integer;
                                                bTEMBAIXAPARCIAL : boolean;
                                                fVALORARECEBER,
                                                fVALORRECEBIDO : extended;
                                                dDATAVENCIMENTO,
                                                dDATALIMITE : TDateTime;
                                                sCONPERMORA,
                                                sCODESTADO,
                                                sFLGTIPODIATOLERA,
                                                sFLGTIPODIAREPASS,
                                                sFLGTIPOCONTRATO,
                                                sFLGCALCINADIMP : string;
                                                bRecalculaDoc : Boolean;
                                                var fValorAtual,
                                                fMulta, fJuros, fCorrecaoMonet,
                                                fMultaDif, fJurosDif, fCorrecaoMonetDif,
                                                fProporcao, fValorDiverg, fValorDivergAtual : extended;
                                                var dDataCalculo : TDateTime );
type
  TCorrige = record
    dBaixa         : TDateTime;
    fCorrecaoMonet : Extended;
    fJuros         : Extended;
    fMulta         : Extended;
  end;

var
  cdsBaixa,
  cdsCodAlteradores,
  cdsRecalculo : TCMClientDataset;
  sSql : string;
  iAltMulta,
  iAltJuros,
  iAltCMonetaria,
  iCiclo : integer;
  bExisteRecalculo, bCalcMulta : boolean;
  vCorrige : Array [1..2] of TCorrige;
  dDataInicio, dDtLimite, dDataCalc : TDateTime;
  fVlrDevido, fTotCiclo, fValorReal: Extended;

  bApenasUltMes : Boolean;
begin
  fMulta            := 0;
  fJuros            := 0;
  fCorrecaoMonet    := 0;
  fMultaDif         := 0;
  fJurosDif         := 0;
  fCorrecaoMonetDif := 0;
  fProporcao        := 0;
  fValorAtual       := 0;
  fValorDiverg      := 0;
  fValorDivergAtual := 0;

  if trim( sFLGCALCINADIMP ) = '' then sFLGCALCINADIMP := 'D';

  bExisteRecalculo := False;

  cdsBaixa := TCMClientDataset.Create( nil );
  cdsCodAlteradores := TCMClientDataset.Create( nil );
  cdsRecalculo := TCMClientDataset.Create( nil );

  try
    if ParamSistema.idModulo = 135 then
         bApenasUltMes := CtrlModuloImobiliario.Alienacao.bApenasUltMesAnterior
    else bApenasUltMes := CtrlModuloImobiliario.AdminImob.bApenasUltMesAnterior;

    //Verifica se há recálculo
    if sFLGTIPOCONTRATO = 'L' then
      cdsCodAlteradores.Data := GetDataPacket(
       ' SELECT DISTINCT TI.CODALTMULTA,                      ' +         // Paulo Nobre - WO32554
       '        TI.CODALTJUROS,                               ' +
       '        TI.CODALTCORRMON,                             ' +
       '        TI.CODALTCMAL,                                ' +
       '        TI.CODALTJRAL,                                ' +
       '        TI.CODALTMTAL                                 ' +
       ' FROM   TIPOIMOVEL TI,                                ' +
       '        LANCAMENTOSIMOVEL LI                          ' +
       ' WHERE  LI.CODDOCUMENTO = ' + IntToStr( iCodDocumento ) +
       '   AND  TI.CODTIPIMOVEL = LI.CODTIPIMOVEL             ' )
    else
      cdsCodAlteradores.Data := GetDataPacket(
       ' SELECT DISTINCT TI.CODTIPIMOVEL,                            ' +
       '        TI.CODALTMULTA,                                      ' +
       '        TI.CODALTJUROS,                                      ' +
       '        TI.CODALTCORRMON,                                    ' +
       '        TI.CODALTCMAL,                                       ' +
       '        TI.CODALTJRAL,                                       ' +
       '        TI.CODALTMTAL                                        ' +
       ' FROM   PARCFINANCIMOV  PF,                                  ' +
       '        DOCUMENTO       DO,                                  ' +
       '        CONDPAGIMOVEL   CP,                                  ' +
       '        CONTRATOIMOVEL  CI,                                  ' +
       '        CONTRATOXIMOVEL CX,                                  ' +
       '        IMOVEL          IM,                                  ' +
       '        TIPOIMOVEL      TI                                   ' +
       ' WHERE  PF.IDCONDPAGIMOVEL     = CP.IDCONDPAGIMOVEL          ' +
       '   AND  CP.IDCONTRATOIMOVEL    = CI.IDCONTRATOIMOVEL         ' +
       '   AND  CI.IDCONTRATOIMOVEL    = CX.IDCONTRATOIMOVEL         ' +
       '   AND  CX.IDIMOVEL            = IM.IDIMOVEL                 ' +
       '   AND  IM.CODTIPIMOVEL        = TI.CODTIPIMOVEL             ' +
       '   AND  PF.CODDOCUMENTO        = DO.CODDOCUMENTO             ' +
       '   AND  DO.CODDOCUMENTO        = ' + IntToStr( iCodDocumento ) );

    bExisteRecalculo := False;
    dDataCalculo     := -1;
    if (not cdsCodAlteradores.IsEmpty) and (not bRecalculaDoc) then
    begin

      if sFLGTIPOCONTRATO = 'L' then
      begin
        iAltMulta      := cdsCodAlteradores.FieldByName('CODALTMULTA').AsInteger;
        iAltJuros      := cdsCodAlteradores.FieldByName('CODALTJUROS').AsInteger;
        iAltCMonetaria := cdsCodAlteradores.FieldByName('CODALTCORRMON').AsInteger;
      end
      else
      begin
        iAltMulta      := cdsCodAlteradores.FieldByName('CODALTCMAL').AsInteger;
        iAltJuros      := cdsCodAlteradores.FieldByName('CODALTJRAL').AsInteger;
        iAltCMonetaria := cdsCodAlteradores.FieldByName('CODALTMTAL').AsInteger;
      end;

      // Verifica se existe recalculo posterior a data do calculo
      cdsRecalculo.Data := GetDataPacket(
       ' SELECT MAX(EVIDATA) AS ULTRECALC '+#13+
       '   FROM EVENTOIMOVEL              '+#13+
       '  WHERE FLGTIPOEVENTO = ''RD''    '+#13+
       '    AND CODDOCUMENTO  = ' + IntToStr(iCodDocumento)  );

      // Daniel - 26461 ( Retirado cdsRecalculoULTRECALC.IsNull ) ...
      if (cdsRecalculo.FieldByName('ULTRECALC').AsDateTime >= dLimite) then begin
         bExisteRecalculo := True;
         dDataCalculo   := cdsRecalculo.FieldByName('ULTRECALC').AsDateTime;
      end;

      if bExisteRecalculo then begin
         // Busca valores já calculados até o pagamento
         cdsRecalculo.Data := GetDataPacket(
          ' SELECT M.VALOR_MULTA,                                                                    ' +
          '        J.VALOR_JUROS,                                                                    ' +
          '        C.VALOR_CMONETARIA                                                                ' +
          ' FROM   ( SELECT SUM( L.VALOR ) AS VALOR_MULTA                                            ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   < ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltMulta ) + ' ) M,                     ' +
          '        ( SELECT SUM( L.VALOR ) AS VALOR_JUROS                                            ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   < ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltJuros ) + ' ) J,                     ' +
          '        ( SELECT SUM( L.VALOR ) AS VALOR_CMONETARIA                                       ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   < ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltCMonetaria ) + ' ) C                 ' );

         if ( cdsRecalculo.FieldByName('VALOR_MULTA').AsFloat      <> 0 ) or
            ( cdsRecalculo.FieldByName('VALOR_JUROS').AsFloat      <> 0 ) or
            ( cdsRecalculo.FieldByName('VALOR_CMONETARIA').AsFloat <> 0 ) then
         begin
           fMulta         := cdsRecalculo.FieldByName('VALOR_MULTA').AsFloat;
           fJuros         := cdsRecalculo.FieldByName('VALOR_JUROS').AsFloat;
           fCorrecaoMonet := cdsRecalculo.FieldByName('VALOR_CMONETARIA').AsFloat;
         end;

         // Busca valores da diferença já calculados até a data do calculo
         cdsRecalculo.Data := GetDataPacket(
          ' SELECT M.VALOR_MULTA,                                                                    ' +
          '        J.VALOR_JUROS,                                                                    ' +
          '        C.VALOR_CMONETARIA                                                               ' +
          ' FROM   ( SELECT SUM( L.VALOR ) AS VALOR_MULTA                                            ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   = ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltMulta ) + ' ) M,                     ' +
          '        ( SELECT SUM( L.VALOR ) AS VALOR_JUROS                                            ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   = ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltJuros ) + ' ) J,                     ' +
          '        ( SELECT SUM( L.VALOR ) AS VALOR_CMONETARIA                                       ' +
          '          FROM   LANCTODOCUM L                                                            ' +
          '          WHERE  L.DATALANCTO   = ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalculo ) ) +
          '            AND  L.CODDOCUMENTO =  ' + IntToStr( iCodDocumento )                            +
          '            AND  L.CODALTERADOR =  ' + IntToStr( iAltCMonetaria ) + ' ) C                 ' );

         if ( cdsRecalculo.FieldByName('VALOR_MULTA').AsFloat      <> 0 ) or
            ( cdsRecalculo.FieldByName('VALOR_JUROS').AsFloat      <> 0 ) or
            ( cdsRecalculo.FieldByName('VALOR_CMONETARIA').AsFloat <> 0 ) then
         begin
           fMultaDif         := cdsRecalculo.FieldByName('VALOR_MULTA').AsFloat;
           fJurosDif         := cdsRecalculo.FieldByName('VALOR_JUROS').AsFloat;
           fCorrecaoMonetDif := cdsRecalculo.FieldByName('VALOR_CMONETARIA').AsFloat;
         end;

         // Calcula a Proporção
         fTotCiclo := fMulta + fJuros + fCorrecaoMonet;
         if sFLGCALCINADIMP = 'D' then begin        //Por diferença
           if fVALORRECEBIDO > 0 then
                fProporcao := ( fVALORRECEBIDO / fVALORARECEBER ) * 100
           else fProporcao := 0;
           fVlrDevido := ComunsImobiliario.Arredonda( fVALORARECEBER + fTotCiclo - fVALORRECEBIDO, 2 )
         end else begin                             //Proporcional
           fValorReal := fVALORARECEBER + fTotCiclo;
           if fVALORRECEBIDO > 0 then
                fProporcao := ( fVALORRECEBIDO / fValorReal ) * 100
           else fProporcao := 0;
           if fValorReal <> 0 then begin
             if fProporcao > 0 then
                  fVlrDevido := ComunsImobiliario.Arredonda( fVALORARECEBER - ( fVALORARECEBER * (fProporcao/100) ), 2 )
             else fVlrDevido := ComunsImobiliario.Arredonda( fValorReal, 2 );
           end else begin
             fVlrDevido := 0;
           end;
         end;

      end;
    end;

    if not bExisteRecalculo then
    begin
      dDataCalculo := dLimite;

      if not bTEMBAIXAPARCIAL then
      begin

        //Define a data limite
        if dDATALIMITE > 0 then
          dDtLimite := dDATALIMITE
        else
        begin
          dDtLimite := ComunsImobiliarioDB.DataLimite( dDATAVENCIMENTO, iIDCIDADES,
                                                     iIDPAIS, iCONDIASTOLERANCIA,
                                                     iCONDIASREPASSE, sCODESTADO,
                                                     sFLGTIPODIATOLERA, sFLGTIPODIAREPASS,
                                                     True, False, False );

           //Atualiza a data limite calculada no documento
          sSql := 'UPDATE LANCAMENTOSIMOVEL '+
                  '   SET DATALIMITE = TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDtLimite ) ) + ',''DD/MM/YYYY'') ' +
                  ' WHERE CODDOCUMENTO = ' + IntToStr( iCodDocumento ) +
                  '   AND DATALIMITE IS NULL ';

          if not ExecSQL( sSql ) then
            raise Exception.create( 'Erro ao atualizar a data limite.');
        end;

        if dLimite > dDtLimite then begin

           //Define o Valor Devido
           fVlrDevido := fVALORARECEBER;

           //Calcula a Correção Monetária
           if iIDINDCORRECAO > 0 then
             fCorrecaoMonet := ComunsImobiliarioDB.CalcCM( fVlrDevido,
                                                           iIDINDCORRECAO,
                                                           dDATAVENCIMENTO + 1,
                                                           dLimite,
                                                           bApenasUltMes,
                                                           iMESESANTERIORES );

           //Calcula a Multa sobre o Valor Original + a Correção Monetária
           fMulta := ComunsImobiliarioDB.CalcMulta( iCodDocumento, fVlrDevido, fCorrecaoMonet,
                                                    fCONVLRMULTA,
                                                    fCONPERCENTMULTA,
                                                    iCONMOEDAMULTA,
                                                    -1,
                                                    dLimite,
                                                    dLimite,
                                                    iIdParcFinancImov );

           //Calcula o Juros sobre o Valor Original + a Correção Monetária
           fJuros := ComunsImobiliarioDB.CalcJuros( fVlrDevido + fCorrecaoMonet,
                                                    fCONVLRMORA,
                                                    fCONPERCENTMORA,
                                                    iCONMOEDAMORA,
                                                    sCONPERMORA,
                                                    dDATAVENCIMENTO + 1,
                                                    dLimite,
                                                    iFLGMORAPROPORC = 1 );
        end;

      end
      else
      begin


        //DAVID - Pendência 18398
        //Verifica se parâmetro do sistema (PARAMIMOVEL.FLGCALCINADIMP) é
        // "D" (cálculo por diferença) ou "P" (cálculo proporcional)

        fTotCiclo := 0;

        //Busca data da ultima baixa
        sSql :=
         ' SELECT R.DATABAIXA                    '+
         '  FROM LANCTODOCUM L, RECBTOPAGTO R    '+
         ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO '+
         '   AND L.NUMLANCTO    = R.NUMLANCTO    '+
         '   AND RTRIM(L.OPERACAO) = ''5''       '+
         '   AND L.CODDOCUMENTO = ' + IntToStr( iCodDocumento ) +
         ' ORDER BY R.DATABAIXA DESC ';

        cdsBaixa.Close;
        cdsBaixa.Data := GetDataPacket( sSql );

        //Define a data limite
        if dDATALIMITE > 0 then
          dDtLimite := dDATALIMITE
        else
        begin
          dDtLimite := ComunsImobiliarioDB.DataLimite( dDATAVENCIMENTO, iIDCIDADES,
                                                     iIDPAIS, iCONDIASTOLERANCIA,
                                                     iCONDIASREPASSE, sCODESTADO,
                                                     sFLGTIPODIATOLERA, sFLGTIPODIAREPASS,
                                                     True, False, False );

           //Atualiza a data limite calculada no documento
          sSql := 'UPDATE LANCAMENTOSIMOVEL '+
                  '   SET DATALIMITE = TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDtLimite ) ) + ',''DD/MM/YYYY'') ' +
                  ' WHERE CODDOCUMENTO = ' + IntToStr( iCodDocumento ) +
                  '   AND DATALIMITE IS NULL ';

          if not ExecSQL( sSql ) then
            raise Exception.create( 'Erro ao atualizar a data limite.');
        end;


        //Verificar se a multa já foi cobrada, pois esta é cobrada uma única vez.
        bCalcMulta := True;

        //Zera o vetor
        for iCiclo := 1 to 2 do
        begin
          vCorrige[iCiclo].dBaixa         := -1;
          vCorrige[iCiclo].fCorrecaoMonet :=  0;
          vCorrige[iCiclo].fJuros         :=  0;
          vCorrige[iCiclo].fMulta         :=  0;
        end;

        //Efetua o calculo em 2 etapas..
        // 1º entre o vencimento e ultima baixa  ( CM, Multa, Juros )
        // 2º entre a ultima baixa e data de apuração ( CM e Juros )
        for iCiclo := 1 to 2 do
        begin

          // Define a data da baixa e Valor Devido
          if iCiclo = 1 then
          begin
            dDataInicio := dDATAVENCIMENTO;
            dDataCalc   := cdsBaixa.FieldByName('DATABAIXA').AsDateTime;
            if dDataCalc > dDtLimite then
              fVlrDevido  := fVALORARECEBER
            else
              fVlrDevido  := fVALORARECEBER - fVALORRECEBIDO;
          end
          else
          begin
            if cdsBaixa.FieldByName('DATABAIXA').AsDateTime > dDATAVENCIMENTO then
                 dDataInicio := cdsBaixa.FieldByName('DATABAIXA').AsDateTime
            else dDataInicio := dDATAVENCIMENTO;
            dDataCalc   := dLimite;

            //DAVID - Pendência 18398
            if sFLGCALCINADIMP = 'D' then         //Por diferença
            begin
              if fVALORRECEBIDO > 0 then
                   fProporcao := ( fVALORRECEBIDO / fVALORARECEBER ) * 100
              else fProporcao := 0;
              fVlrDevido := ComunsImobiliario.Arredonda( fVALORARECEBER + fTotCiclo - fVALORRECEBIDO, 2 )
            end
            else                                  //Proporcional
            begin
              fValorReal := fVALORARECEBER + fTotCiclo;
              if fVALORRECEBIDO > 0 then
                   fProporcao := ( fVALORRECEBIDO / fValorReal ) * 100
              else fProporcao := 0;
              if fValorReal <> 0 then begin
                if fProporcao > 0 then
                     fVlrDevido := ComunsImobiliario.Arredonda( fVALORARECEBER - ( fVALORARECEBER * (fProporcao/100) ), 2 )
                else fVlrDevido := ComunsImobiliario.Arredonda( fValorReal, 2 );
              end else begin
                fVlrDevido := 0;
              end;
            end;

          end;

          fTotCiclo := 0;
          if ( dDataCalc > dDataInicio ) and ( fVlrDevido > 0 ) then
          begin
            //Define a data de baixa - fim do período de apuração
            if iCiclo = 1 then
              vCorrige[iCiclo].dBaixa := cdsBaixa.FieldByName('DATABAIXA').AsDateTime
            else
              vCorrige[iCiclo].dBaixa := -1;

            //Calcula a Correção Monetária
            if iIDINDCORRECAO > 0 then
              vCorrige[iCiclo].fCorrecaoMonet := ComunsImobiliarioDB.CalcCM( fVlrDevido,
                                                                             iIDINDCORRECAO,
                                                                             dDataInicio + 1,
                                                                             dDataCalc,
                                                                             bApenasUltMes,
                                                                             iMESESANTERIORES );



            //Calcula o Juros sobre o Valor Original + a Correção Monetária
            vCorrige[iCiclo].fJuros := ComunsImobiliarioDB.CalcJuros( fVlrDevido + vCorrige[iCiclo].fCorrecaoMonet,
                                                                      fCONVLRMORA,
                                                                      fCONPERCENTMORA,
                                                                      iCONMOEDAMORA,
                                                                      sCONPERMORA,
                                                                      dDataInicio + 1,
                                                                      dDataCalc,
                                                                      iFLGMORAPROPORC = 1);

            //Calcula a Multa sobre o Valor Original + a Correção Monetária
            if bCalcMulta or ( sFLGCALCINADIMP = 'P' ) then
            begin
              vCorrige[iCiclo].fMulta := ComunsImobiliarioDB.CalcMulta( iCodDocumento, fVlrDevido ,vCorrige[iCiclo].fCorrecaoMonet,
                                                                        fCONVLRMULTA,
                                                                        fCONPERCENTMULTA,
                                                                        iCONMOEDAMULTA,
                                                                        cdsBaixa.FieldByName('DATABAIXA').AsDateTime,
                                                                        dDataCalc,
                                                                        dLimite,
                                                                        iIdParcFinancImov );
              bCalcMulta := False;
            end;

            fTotCiclo := vCorrige[iCiclo].fCorrecaoMonet + vCorrige[iCiclo].fJuros + vCorrige[iCiclo].fMulta;
          end;

          if iCiclo = 1 then
          begin
            fCorrecaoMonet := vCorrige[iCiclo].fCorrecaoMonet;
            fJuros         := vCorrige[iCiclo].fJuros;
            fMulta         := vCorrige[iCiclo].fMulta;
          end
          else
          begin
            fCorrecaoMonetDif := vCorrige[iCiclo].fCorrecaoMonet;
            fJurosDif         := vCorrige[iCiclo].fJuros;
            fMultaDif         := vCorrige[iCiclo].fMulta;
          end;
        end;
      end;
    end;

    fValorAtual := fVALORARECEBER + fMulta + fJuros + fCorrecaoMonet;

    if sFLGCALCINADIMP = 'D' then
      fValorDiverg := fValorAtual - fVALORRECEBIDO
    else begin
      if fProporcao > 0 then
           fValorDiverg := fVALORARECEBER - (fVALORARECEBER * (fProporcao / 100))
      else fValordiverg := fValorAtual;
    end;

    fValorDivergAtual := fValorDiverg + fCorrecaoMonetDif + fJurosDif + fMultaDif;
  finally
    cdsBaixa.Free;
    cdsCodAlteradores.Free;
    cdsRecalculo.Free;
  end;
end;


constructor TCtrlInadimplencia.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited create;
  ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  ParamSistema.idEmpresa     := iIdEmpresa;
  ParamSistema.idModulo      := iIdModulo;
  ParamSistema.idUsuario     := iIdUsuario;
  ParamSistema.idEspAcesso   := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro := bUsaPlanoPatro;
end;

destructor TCtrlInadimplencia.Destroy;
begin
  ComunsImobiliarioDB.Free;
  CtrlModuloImobiliario.Free;
  inherited;
end;

procedure TCtrlInadimplencia.AfterInitialize;
begin
  inherited;
  ComunsImobiliarioDB.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs( Self );

  CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.Alienacao.GetParam(ParamSistema.idEmpresa);
end;



function TCtrlInadimplencia.AtualizaDataLimite(const sFLGTIPOCONTRATO : String; const IDContratoImovel : Integer; const bAtualizaTodos : Boolean) : Boolean;
var
   sSQL        : string;
   _cds        : TCMClientDataSet;
   dDataLimite : TDateTime;
   bAtualizou  : Boolean;
begin
   _cds   := TCMClientDataSet.Create(nil);
   Result := True;
    try
       if sFLGTIPOCONTRATO = 'L' then
       begin
          sSQL :=
          'SELECT DISTINCT '                                       + #13 +
          '    D.FLGNAOCONCILIADO, '                               + #13 +
          '    C.IDCONTRATOIMOVEL, '                               + #13 +
          '    C.CODESTADO, '                                      + #13 +
          '    C.IDPAIS, '                                         + #13 +
          '    C.IDCIDADES, '                                      + #13 +
          '    C.CONDIASTOLERANCIA, '                              + #13 +
          '    C.CONDIASREPASSE, '                                 + #13 +
          '    C.FLGTIPODIATOLERA, '                               + #13 +
          '    C.FLGTIPODIATOLERA AS FLGTIPODIAREPASSE, '          + #13 +
          '    L.DATAVENCIMENTO, '                                 + #13 +
          '    L.CODDOCUMENTO '                                    + #13 +
          'FROM '                                                  + #13 +
          '    CONTRATOIMOVEL C, '                                 + #13 +
          '    LANCAMENTOSIMOVEL L, '                              + #13 +
          '    DOCUMENTO D '                                       + #13 +
          'WHERE '                                                 + #13 +
          '    C.IDCONTRATOIMOVEL = ' + IntToStr(IDContratoImovel) + #13 +
          'AND L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '           + #13 +
          'AND L.RECPAG           = ''R'' '                        + #13 +
          'AND D.CODDOCUMENTO     = L.CODDOCUMENTO '               + #13 +
          'AND D.FLGNAOCONCILIADO = 1 '                            + #13;

          if not bAtualizaTodos then
             sSQl := sSQL + 'AND L.DATALIMITE IS NULL';
       end
       else
       begin
          sSQL :=
          'SELECT DISTINCT '                                                                             + #13 +
          '    D.FLGNAOCONCILIADO, '                                                                     + #13 +
          '    C.IDCONTRATOIMOVEL, '                                                                     + #13 +
          '    C.CODESTADO, '                                                                            + #13 +
          '    C.IDPAIS, '                                                                               + #13 +
          '    C.IDCIDADES, '                                                                            + #13 +
          '    CM.DIASTOLERANCIA as CONDIASTOLERANCIA, '                                                 + #13 +
          '    CM.DIASREPASSE AS CONDIASREPASSE, '                                                       + #13 +
          '    CM.FLGTIPODIATOLERA, '                                                                    + #13 +
          '    CM.FLGTIPODIAREPASS AS FLGTIPODIAREPASSE, '                                               + #13 +
          '    L.DATAVENCIMENTO, '                                                                       + #13 +
          '    L.IDPARCFINANCIMOV, '                                                                     + #13 +
          '    L.CODDOCUMENTO '                                                                          + #13 +
          'FROM '                                                                                        + #13 +
          '    CONTRATOIMOVEL C, '                                                                       + #13 +
          '    CONDPAGIMOVEL  CP, '                                                                      + #13 +
          '    PARCFINANCIMOV L, '                                                                       + #13 +
          '    DOCUMENTO D, '                                                                            + #13 +
          '    CONTRATOXMULTA CM '                                                                       + #13 +
          'WHERE '                                                                                       + #13 +
          '    C.IDCONTRATOIMOVEL        = ' + IntToStr(IDContratoImovel)                                    + #13 +
          'AND CP.IDCONTRATOIMOVEL       = C.IDCONTRATOIMOVEL '                                              + #13 +
          'AND CP.IDCONDINICIAL          = L.IDCONDPAGIMOVEL '                                               + #13 +
          'AND NVL(D.RECPAG,''R'')       = ''R'' '                                                           + #13 +
          'AND L.CODDOCUMENTO            = D.CODDOCUMENTO(+) '                                                  + #13 +
          'AND NVL(D.FLGNAOCONCILIADO,1) = 1 '                                                               + #13 +
          'AND CM.IDCONTRATOIMOVEL       = C.IDCONTRATOIMOVEL'                                               + #13 +
          'AND ((CM.FLGINDETERMINADO     = ''N'' AND L.DATAVENCIMENTO BETWEEN CM.DATAINI AND CM.DATAFIM) OR' + #13 +
          '     (CM.FLGINDETERMINADO     = ''S'' AND L.DATAVENCIMENTO >= CM.DATAINI))'                       + #13;

          if not bAtualizaTodos then
             sSQl := sSQL + 'AND L.DATALIMITE IS NULL';
       end;
       _cds.Data := GetDataPacket(sSQL);
       while not _cds.EOF do
       begin
          dDataLimite := ComunsImobiliarioDB.DataLimite(_cds.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                        _cds.FieldByName('IDCIDADES').AsInteger,
                                                        _cds.FieldByName('IDPAIS').AsInteger,
                                                        _cds.FieldByName('CONDIASTOLERANCIA').AsInteger,
                                                        _cds.FieldByName('CONDIASREPASSE').AsInteger,
                                                        _cds.FieldByName('CODESTADO').AsString,
                                                        _cds.FieldByName('FLGTIPODIATOLERA').AsString,
                                                        _cds.FieldByName('FLGTIPODIAREPASSE').AsString,
                                                        True,
                                                        False,
                                                        False);
          if sFLGTIPOCONTRATO = 'L' then
             bAtualizou := ExecSql('UPDATE LANCAMENTOSIMOVEL SET DATALIMITE = TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'') ' +
                                   'WHERE CODDOCUMENTO     = ' + _cds.FieldByName('CODDOCUMENTO').AsString + ' ' +
                                   'AND   IDCONTRATOIMOVEL = ' + IntToStr(IDContratoImovel))
          else
             bAtualizou := ExecSql('UPDATE PARCFINANCIMOV SET DATALIMITE = TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'') ' +
                                   'WHERE IDPARCFINANCIMOV = ' + _cds.FieldByName('IDPARCFINANCIMOV').AsString);

          if not bAtualizou then
          begin
             Result := False;
             raise Exception.create( 'Erro ao atualizar a data limite.');
          end;

          _cds.Next;
       end;
    finally
       _cds.Free;
    end;
end;



function TCtrlInadimplencia.ListaAlteradores(iContrato: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   ' SELECT DISTINCT TI.CODTIPIMOVEL,                            ' + #13 +
   '        TI.CODALTMULTA,                                      ' + #13 +
   '        TI.CODALTJUROS,                                      ' + #13 +
   '        TI.CODALTCORRMON,                                    ' + #13 +
   '        TI.CODALTCMAL,                                       ' + #13 +
   '        TI.CODALTJRAL,                                       ' + #13 +
   '        TI.CODALTMTAL                                        ' + #13 +
   ' FROM   CONTRATOIMOVEL  CI,                                  ' + #13 +
   '        CONTRATOXIMOVEL CX,                                  ' + #13 +
   '        IMOVEL          IM,                                  ' + #13 +
   '        TIPOIMOVEL      TI                                   ' + #13 +
   ' WHERE  CI.IDCONTRATOIMOVEL    = CX.IDCONTRATOIMOVEL         ' + #13 +
   '   AND  CX.IDIMOVEL            = IM.IDIMOVEL                 ' + #13 +
   '   AND  IM.CODTIPIMOVEL        = TI.CODTIPIMOVEL             ' + #13 +
   '   AND  CI.IDCONTRATOIMOVEL    = ' + IntToStr(iContrato)       + #13;
   Result := GetDataPacket(sSQL);
end;


function TCtrlInadimplencia.ExisteDocumentosImob( iIdContratoImovel : integer; dDtInicio, dDtFim, dDataCalc : TDateTime; bApenasAbertos : boolean ) : boolean;
var
  sSQL : string;
  cdsAux : TCMClientDataset;
begin

  sSQL :=
   ' SELECT DISTINCT CODDOCUMENTO, DATABAIXA, VALORPAGO, VALORDEVIDO' +
   ' FROM   ( SELECT D.CODDOCUMENTO, ' +
   '                 LI.DATALIMITE, ' +
   '                 MAX( R.DATABAIXA ) AS DATABAIXA, ' +
   '                 SUM( DECODE( TRIM( LD.OPERACAO ), ''5'', LD.VALOR, 0 ) ) AS VALORPAGO, ' +
   '                 SUM( DECODE( TRIM( LD.OPERACAO ), ''2'', LD.VALOR, ''4'', DECODE( TRIM( LD.DEBCRE ), ''C'', LD.VALOR, LD.VALOR * -1 ) ) ) AS VALORDEVIDO ' +
   '          FROM   DOCUMENTO D, ' +
   '                 LANCTODOCUM LD, ' +
   '                 ( SELECT DISTINCT ' +
   '                          L2.CODDOCUMENTO, ' +
   '                          L2.DATALIMITE, ' +
   '                          L2.IDCONTRATOIMOVEL, ' +
   '                          L2.CODTIPIMOVEL, ' +
   '                          NVL( L2.FLGESTORNADO, 0 ) AS FLGESTORNADO ' +
   '                   FROM   LANCAMENTOSIMOVEL L2 ' +
   '                   WHERE  ( L2.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel ) + ' ) ';

  if dDtInicio <> 0 then
    sSQL := sSQL +
     '            AND ( L2.DATAVENCIMENTO >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtInicio ) ) + ' ) ';

  if dDtFim <> 0 then
    sSQL := sSQL +
     '            AND ( L2.DATAVENCIMENTO <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim ) ) + ' ) ';

  sSQL := sSQL + ' ) LI, ' +
   '                 TIPOIMOVEL TI, ' +
   '                 RECBTOPAGTO R ' +
   '                 WHERE ( LD.CODDOCUMENTO = R.CODDOCUMENTO (+) ) ' +
   '                   AND ( LD.NUMLANCTO    = R.NUMLANCTO (+) ) ' +
   '                   AND ( ( ( D.STATUS <> ''2'' ) OR ( D.STATUS IS NULL ) ) ' ;

  if bApenasAbertos then
    sSQL := sSQL + ' OR ( ( D.STATUS  = ''2'' ) AND ( D.FLGNAOCONCILIADO = 1 ) ) ) '
  else
    sSQL := sSQL + ' ) ';

  sSQL := sSQL +
   '           AND  ( LI.DATALIMITE < TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCalc ) ) + ', ''DD/MM/YYYY'' ) )  ' +
   '           AND  ( LI.CODDOCUMENTO = D.CODDOCUMENTO  ) ' +
   '           AND  ( LI.CODTIPIMOVEL = TI.CODTIPIMOVEL ) ' +
   '           AND  ( D.RECPAG        = ''R''           ) ' +
   '           AND  ( D.CODDOCUMENTO  = LD.CODDOCUMENTO ) ' +
   '           AND  ( ( LD.CODALTERADOR IS NULL ) OR ( LD.CODALTERADOR NOT IN( TI.CODALTMULTA, TI.CODALTJUROS, TI.CODALTCORRMON ) ) ) ' +
   '           AND  ( LI.FLGESTORNADO <> 1              ) ' +
   '         GROUP BY D.CODDOCUMENTO, LI.DATALIMITE ) ' +
   ' WHERE  ( ( DATABAIXA IS NULL ) OR ( DATABAIXA > DATALIMITE ) ) ' +
   '    OR  ( VALORPAGO < VALORDEVIDO ) ';

  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket( sSQL );
    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.Free;
  end;

end;

function TCtrlInadimplencia.ExisteDocumentosAliena( iIdContratoImovel : integer; bApenasAbertos : boolean ) : boolean;
var
  sSQL : string;
  cdsAux : TCMClientDataset;
begin

  sSQL :=
   ' SELECT PF.CODDOCUMENTO, PF.FLGTIPOLANC                                    ' +
   ' FROM   PARCFINANCIMOV PF,                                                 ' +
   '        CONDPAGIMOVEL  CP,                                                 ' +
   '        CONTRATOIMOVEL CI                                                  ' +
   ' WHERE  ( PF.FLGTIPOLANC IN ( 2, 3, 5, 6, 7, 8, 9 )                      ) ' +
   '   AND  ( ( PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = ''N'' )         ' ;

  if bApenasAbertos then
    sSQL := sSQL + ')'
  else
    sSQL := sSQL + ' OR ( PF.DATALIMITE < PF.DATAPAGAMENTO ) ) ';

  sSQL := sSQL +
   '   AND  ( PF.IDCONDPAGIMOVEL     = CP.IDCONDPAGIMOVEL                    ) ' +
   '   AND  ( CP.IDCONTRATOIMOVEL    = CI.IDCONTRATOIMOVEL                   ) ' +
   '   AND  ( CP.IDCONTRATOIMOVEL    = ' + IntToStr( iIdContratoImovel ) + ' ) ' +
   '   AND  ( PF.DATALIMITE          < SYSDATE                               ) ' ;

  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket( sSQL );
    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.Free;
  end;

end;


end.
