unit uCtrlParcFinancImov;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient,
  provider, wwQuery, uCMClientDataSet, uCMTypes, JclSysUtils, JclDateTime,
  uCtrlParamAlienacao, uComunsImobiliarioDB, uCtrlTipoCustoRecImov, uCMFileUtils,
  uCtrlModuloImobiliario;

type
  TCtrlParcFinancImov = class(TCmControlObject)
  private
    FcdsPerda: TCMClientDataSet;
    procedure SetcdsPerda(const Value: TCMClientDataSet);
  private
    CtrlParam             : TCtrlParamAlienacao;
    CtrlTipoCustoRecImo   : TCtrlTipoCustoRecImov;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    ComunsImobiliarioDB   : TComunsImobiliarioDB;


    Property cdsPerda : TCMClientDataSet read FcdsPerda write SetcdsPerda;
    Function BuscaPerdasContrato (const iIdEmpresa, iIdContrato:Integer; dDataLimite:TDateTime; const sTipoContrato : String = '') : Extended;
  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    function LookupLancamentosDiarios(const iIdModulo, iAnoCompetencia, iMesCompetencia: integer; const sFlgDiario: string; const iIdTipoCustoRecImo: integer = -1; const iImovelMestre: integer = -1; const iImovel: integer = -1): OleVariant;
    function MontaLancamentosDiarios(const iAnoCompetencia, iMesCompetencia: integer; const sFlgDiario: string; const iIdTipoCustoRecImo: integer = -1; const iContrato: integer = -1): OleVariant;

    function LookupDocAberto(const dLimite: TDateTime; const sTipo: String; const iIdContrato:Integer = -1; const sTipoContrato : String = '') : OLEVariant;
    function SelecionaProvisaoPerdas(sNomeBilhete: string; const iIdEmpresa, iIdModulo: Integer; const dDataLimite: TDateTime; const iIdContrato:Integer = -1; const sTipoImovel:String = ''; const sTipoContrato : String = '') : OLEVariant;

    function CalcSaldoDevedorAnt (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
    function CalcSldNova         (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
    function CalcResiduo         (const iContrato: Integer; const dData:TDateTime = -1): Extended;

      // -------------------------------------------------------------------------------------------
      // Marcos Topini - 01/06/2006 - pendência  21095
      function LookupConsultaParcelas(const iIdEmpresa       : Integer;
                                      const iIdContratoImovel: Integer   = -1;
                                      const dDtFim           : TDateTime = -1;
                                      const iAltCPMF         : Integer   = -1;
                                      const iAltAdiant       : Integer   = -1;
                                      const iTipoCliente     : Integer   = -1;
                                      const iIdModulo        : Integer   = -1;
                                      const iComprador       : Integer   = -1;
                                      const iResponsavel     : Integer   = -1;
                                      const iImovelMestre    : Integer   = -1): Olevariant;

      // Daniel - 9730
      function LookupInadSintetico (const iIdContrato:Integer=-1; const dData:TDateTime=-1 ): OleVariant;


      // Data : 16/06/2006 Autor: Marcos Ventura Topini
      function LookupCondicoesPagamento(const iIdContratoImovel: Integer) : Olevariant;

      // Data : 26/06/2006 Autor: Marcos Ventura Topini
      function LookupMultaJuros(const iIdContratoImovel: Integer) : Olevariant;

      // Data: 27/06/2006 Autor : Marcos Ventura Topini
      function LookupCorrecao(const CodDocumento : Integer): Olevariant;
      function LookupAltradoresBaixas(const CodDocumento : Integer;
                                      const CodAlterador : Integer): Olevariant;

      // Função para Retornar a Descrição do Tipo de Parcela
      // Data : 22/02/2002  Autor: Vinícius Meyer Lana
      function TipoParcela(const iFlgTipo, iFlgIntegra: Integer): String;

      // Fim Marcos Topini 01/06/2006 - Pendência 21095


      // -------------------------------------------------------------------------------------------
      // André Pontes - 04/07/2005 - pendência 19325

      function LookupAlienacaoAtiva(const dData  : TDateTime;
                                    const iJurCM : Integer;
                                    const bAtualizacaoSaldo : Boolean = False;
                                    const sTipoContrato : String = ''
                                   ): OLEVariant;


      function LookupParcelaAntPos(const iContrato : Integer;
                                   const iCondPag  : Integer;
                                   const dData     : TDateTime;
                                   const iAntPos   : Integer
                                  ): OLEVariant;

      // FIM André Pontes - 04/07/2005 - pendência 19325
      // -------------------------------------------------------------------------------------------


      function LookupResiduoParcela(const iIdEmpresa : Integer;  const dData : TDateTime) : OleVariant;

      function LookupAlienacao(const dData     : TDateTime;
                               const iContrato : Integer;
                               const iCondPag  : Integer
                              ): OLEVariant;

      function BuscaUltimaAtualizacao(const iContrato : Integer;
                                      const iCondPag  : Integer;
                                      const dData     : TDateTime) : TDateTime;


      function BuscaValoresUltimaAtualizacao(const iContrato : Integer;
                                             const iCondPag  : Integer;
                                             const dData     : TDateTime;
                                             var   fJuros    : Extended;
                                             var   fCM       : Extended) : Boolean;


      function BuscaUltimaParcelaGerada(const iContrato : Integer;
                                        const iCondPag  : Integer;
                                        const dData     : TDateTime) : TDateTime;

      function CalcAtualSaldo(const iContrato : Integer;
                              const iCondPag  : Integer;
                              const dVencto   : TDateTime;
                              const dData     : TDateTime) : Extended;


      function LogToFile(const sLog   : String;
                         const sArq   : String;
                         const bPasta : Boolean = True;
                         const bHora  : Boolean = True
                        ): Boolean;


  published
end;

implementation

uses uDiasUteis, uComunsImobiliario ;

{ TCtrlParcFinancImov }

procedure TCtrlParcFinancImov.AfterInitialize;
begin
  inherited;
  CtrlParam.InitializeAs( Self );
  CtrlTipoCustoRecImo.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs( Self );
  ComunsImobiliarioDB.InitializeAs( Self );
end;

constructor TCtrlParcFinancImov.Create;
begin
  inherited;
  CtrlParam             := TCtrlParamAlienacao.Create;
  CtrlTipoCustoRecImo   := TCtrlTipoCustoRecImov.Create;
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(1, 135, -1, -1, True);

  FCdsPerda := TCMClientDataSet.Create( nil );
end;

procedure TCtrlParcFinancImov.onCreateAppServer;
begin
  inherited;

end;

destructor TCtrlParcFinancImov.Destroy;
begin
  FreeAndNil( FcdsPerda );
  FreeAndNil( CtrlParam );
  FreeAndNil( CtrlTipoCustoRecImo );
  FreeAndNil( CtrlModuloImobiliario );
  FreeAndNil( ComunsImobiliarioDB );
  inherited;
end;

{ Parâmetros

  iAnoCompetencia     ==>> Obrigatório
  iMesCompetencia     ==>> Opcional (-1) para impostos anuais
  sFlgDiario          ==>> 'M'ensal / 'A'nual
  iIdTipoCustoRecImo  ==>> Opcional
}
function TCtrlParcFinancImov.LookupLancamentosDiarios(
  const iIdModulo, iAnoCompetencia, iMesCompetencia: integer;
  const sFlgDiario: string; const iIdTipoCustoRecImo, iImovelMestre, iImovel: integer): OleVariant;
var
  sSql, sFiltro: string;
begin
  sFiltro := '';

  if ( sFlgDiario = 'M' ) and ( iMesCompetencia <> -1 ) then sFiltro := sFiltro + '   AND ( L.MESCOMPETENCIA = ' + IntToStr (iMesCompetencia) + ' ) ' + #13;

  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '   AND ( L.IDTIPOCUSTORECIMO = ' + IntToStr (iIdTipoCustoRecImo) + ' ) ' + #13;
  if iImovel            <> -1 then sFiltro := sFiltro + '   AND ( L.IDIMOVEL = ' + IntToStr (iImovel) + ' ) ' + #13;
  if iImovelMestre      <> -1 then sFiltro := sFiltro + '   AND ( L.IDIMOVELMESTRE = ' + IntToStr (iImovelMestre) + ' ) ' + #13;


  sSql := 'SELECT ' + #13 +
          '   L.IDIMOVEL, L.IDTIPOCUSTORECIMO, I.CODTIPIMOVEL, ' + #13 +
          '   SUM(NVL(L.VLRLANCPAGAR,0)+NVL(L.VLRLANCRECEB,0)) AS VLRTOTAL ' + #13 +
          'FROM ' + #13 +
          '   ParcFinancImov L, IMOVEL I, TIPOCUSTORECIMOV T ' + #13 +
          'WHERE ' + #13 +
          '   ( L.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
          '   AND ( L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
          '   AND ( L.ANOCOMPETENCIA = ' + IntToStr (iAnoCompetencia) + ' ) ' + #13 +
          '   AND ( T.FLGDIARIO = '+ QuotedStr( sFlgDiario ) + ' ) ' + #13 +
          '   AND ( T.IDMODULO = ' + IntToStr (iIdModulo) + ' ) ' + #13 +
          sFiltro +
          'GROUP BY ' + #13 +
          '   L.IDIMOVEL, L.IDTIPOCUSTORECIMO, I.CODTIPIMOVEL ' + #13;

  Result := GetDataPacket ( sSql );
end;

function TCtrlParcFinancImov.MontaLancamentosDiarios(const iAnoCompetencia,iMesCompetencia: integer;
                                                     const sFlgDiario: string;
                                                     const iIdTipoCustoRecImo, iContrato: integer): OleVariant;
var _cdsParam, _cdsParc, _cdsCusto, _cdsTemp : TCMClientDataSet;
    sSql, sParam : String;
    dDataIni,dDataFim : TDateTime;
    sDataIni,sDataFim : String;
    iIdTipoCusto : Integer;
    dIniCtb, dFimCtb : TDateTime;
begin
  try
    try
      // Cria cds Temporários
      _cdsParam := TCMClientDataSet.Create( nil );
      _cdsParc  := TCMClientDataSet.Create( nil );
      _cdsCusto := TCMClientDataSet.Create( nil );
      _cdsTemp  := TCMClientDataSet.Create( nil );

      // Carrega os Parâmetros de alienação
      _cdsParam.Data := CtrlParam.SelecionaParamAlienacao;

      // Define Data inicial e final de vencimento
      dDataIni := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
      dDataFim := DiasUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia);
      sDataIni := FormatDateTime('dd/mm/yyyy',dDataIni);
      sDataFim := FormatDateTime('dd/mm/yyyy',dDataFim);

      // Monta Parâmetros
      sParam   := ' AND ( P.DATAVENCIMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') '+ #13 +
                  '                            AND TO_DATE(' + QuotedStr(sDataFim) + ', ''DD/MM/YYYY'') )'+ #13;

      if iIdTipoCustoRecImo <> -1 then begin
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECAVISTA').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 7';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECAMORTIZACAO').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 3';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECCORRECAO').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 3';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECAMORTEXTRA').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 5';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECSINAL').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 2';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECJUROS').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 3';
        if iIdTipoCustoRecImo = _cdsParam.FieldByName('IDRECPROJECAO').AsInteger then
          sParam := sParam + ' AND P.FLGTIPOLANC = 4';
      end else begin
        sParam := sParam + ' AND P.FLGTIPOLANC IN(2,3,4,5,7)';
      end;

      // Monta Sql das parcelas
      sSql := 'SELECT P.IDPARCFINANCIMOV, P.FLGTIPOLANC, P.VLRJUROS, P.VLRRESIDUO, '+#13+
              '       DECODE(P.FLGTIPOLANC,9,P.VLRAMORTIZACAO,P.VLRPRESTACAO) AS VLRPRESTACAO, '+#13+
              '       I.CODTIPIMOVEL, MIN(CXI.IDIMOVEL) AS IDIMOVEL '+#13+
              '  FROM PARCFINANCIMOV P,    '+#13+
              '       CONDPAGIMOVEL CP,    '+#13+
              '       CONTRATOXIMOVEL CXI, '+#13+
              '       IMOVEL I '+#13+
              ' WHERE P.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL     '+#13+
              '   AND CP.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
              '   AND CXI.IDIMOVEL = I.IDIMOVEL '+#13+ sParam + #13+
              ' GROUP BY P.IDPARCFINANCIMOV, P.FLGTIPOLANC, P.VLRJUROS, P.VLRRESIDUO, '+#13+
              '       DECODE(P.FLGTIPOLANC,9,P.VLRAMORTIZACAO,P.VLRPRESTACAO), I.CODTIPIMOVEL';
      _cdsParc.Data := GetDataPacket( sSql );

      // Monta Sql dos Lançamentos
      sSql := 'SELECT 0 AS IDIMOVEL, 0 AS IDTIPOCUSTORECIMO,   '+#13+
              '       ''     '' AS CODTIPIMOVEL,  ' +#13+
              '       SYSDATE AS DTINICTBDIARIA, SYSDATE AS DTFIMCTBDIARIA, ' +#13+
              '       0 AS VLRTOTAL '+#13+
              '  FROM DUAL '+#13+
              ' WHERE 1=2';
      _cdsTemp.Data := GetDataPacket( sSql );

      // Monta tabela com os lançamentos originados das Parcelas
      while not _cdsParc.Eof do begin

        // Verifica o tipo de receita da parcela
        iIdTipoCusto := -1;
        case _cdsParc.FieldByName('FLGTIPOLANC').AsInteger of
          2 : iIdTipoCusto := _cdsParam.FieldByName('IDRECSINAL').AsInteger;
          3 : iIdTipoCusto := _cdsParam.FieldByName('IDRECAMORTIZACAO').AsInteger;
          4 : iIdTipoCusto := _cdsParam.FieldByName('IDRECPROJECAO').AsInteger;
          5 : iIdTipoCusto := _cdsParam.FieldByName('IDRECAMORTEXTRA').AsInteger;
          7 : iIdTipoCusto := _cdsParam.FieldByName('IDRECAVISTA').AsInteger;
        end;

        // Determina data inicial e final da contabilização
        dIniCtb := EncodeDate(iAnoCompetencia, iMesCompetencia, 1);
        dFimCtb := DiasUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia);

        // Verifica se o tipo de Custo possui contabilização diária
        _cdsCusto.Data := CtrlTipoCustoRecImo.LookupTipoCustoRecImov(-1,'',iIdTipoCusto);
        if ( (sFlgDiario = '') and (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] in['M','A']) or
             (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] = sFlgDiario) ) then begin

          // inclui registro de lançamento
          _cdsTemp.Insert;
          _cdsTemp.FieldByName('IDIMOVEL').AsInteger          := _cdsParc.FieldByName('IDIMOVEL').AsInteger;
          _cdsTemp.FieldByName('CODTIPIMOVEL').AsString       := _cdsParc.FieldByName('CODTIPIMOVEL').AsString;
          _cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger := iIdTipoCusto;
          _cdsTemp.FieldByName('DTINICTBDIARIA').AsDateTime   := dIniCtb;
          _cdsTemp.FieldByName('DTFIMCTBDIARIA').AsDateTime   := dFimCtb;
          _cdsTemp.FieldByName('VLRTOTAL').AsFloat            := _cdsParc.FieldByName('VLRPRESTACAO').AsFloat;
          _cdsTemp.Post;
        end;

        // se for parcelamento, verifica lançamento de juros e correção
        if _cdsParc.FieldByName('FLGTIPOLANC').AsInteger = 3 then begin
          iIdTipoCusto := _cdsParam.FieldByName('IDRECJUROS').AsInteger;
          _cdsCusto.Data := CtrlTipoCustoRecImo.LookupTipoCustoRecImov(-1,'',iIdTipoCusto);
          if ( (sFlgDiario = '') and (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] in['M','A']) or
               (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] = sFlgDiario) ) then begin
            _cdsTemp.Insert;
            _cdsTemp.FieldByName('IDIMOVEL').AsInteger          := _cdsParc.FieldByName('IDIMOVEL').AsInteger;
            _cdsTemp.FieldByName('CODTIPIMOVEL').AsString       := _cdsParc.FieldByName('CODTIPIMOVEL').AsString;
            _cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger := iIdTipoCusto;
            _cdsTemp.FieldByName('DTINICTBDIARIA').AsDateTime   := dIniCtb;
            _cdsTemp.FieldByName('DTFIMCTBDIARIA').AsDateTime   := dFimCtb;
            _cdsTemp.FieldByName('VLRTOTAL').AsFloat            := _cdsParc.FieldByName('VLRJUROS').AsFloat;
            _cdsTemp.Post;
          end;

          iIdTipoCusto := _cdsParam.FieldByName('IDRECCORRECAO').AsInteger;
          _cdsCusto.Data := CtrlTipoCustoRecImo.LookupTipoCustoRecImov(-1,'',iIdTipoCusto);
          if ( (sFlgDiario = '') and (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] in['M','A']) or
               (_cdsCusto.FieldByName('FLGDIARIO').AsString[1] = sFlgDiario) ) then begin
            _cdsTemp.Insert;
            _cdsTemp.FieldByName('IDIMOVEL').AsInteger          := _cdsParc.FieldByName('IDIMOVEL').AsInteger;
            _cdsTemp.FieldByName('CODTIPIMOVEL').AsString       := _cdsParc.FieldByName('CODTIPIMOVEL').AsString;
            _cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger := iIdTipoCusto;
            _cdsTemp.FieldByName('DTINICTBDIARIA').AsDateTime   := dIniCtb;
            _cdsTemp.FieldByName('DTFIMCTBDIARIA').AsDateTime   := dFimCtb;
            _cdsTemp.FieldByName('VLRTOTAL').AsFloat            := _cdsParc.FieldByName('VLRRESIDUO').AsFloat;
            _cdsTemp.Post;
          end;
        end;
        _cdsParc.Next;
      end;
      Result := _cdsTemp.Data;
    except
      on E:Exception do begin
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( _cdsParam );
    FreeAndNil( _cdsParc  );
    FreeAndNil( _cdsCusto );
    FreeAndNil( _cdsTemp  );
  end;
end;



//========================================================================================
// Função para Pesquisar os documentos não baixados em atraso, para atualização
//     dos valores de Multa, Juros e Correção por atraso
// Data : 18/03/2005                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : dLimite  - Data limite para o vencimento do documento
//              sTipo    - 'T' Aberto total sem nenhuma baixa
//                         'P' Aberto com baixas parciais
//                         ''  Todos documentos em aberto
//              iIdContrato - ID do Contrato
//
// Retorno : OLEVariant - Conjunto de Dados
//----------------------------------------------------------------------------------------
function TCtrlParcFinancImov.LookupDocAberto(const dLimite: TDateTime;
                                             const sTipo: String;
                                             const iIdContrato:Integer = -1;
                                             const sTipoContrato : String = '') : OLEVariant;
var sSql, sParam : String;
    ArqLog : TextFile;
begin
   Result := True;
   // Define Parâmetros
   sParam := ' AND P.DATAVENCIMENTO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') '+#13;
   if iIdContrato > 0 then sParam := sParam + ' AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13;

   if sTipoContrato <> '' then sParam := sParam + ' AND C.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) + #13;

   // Define tipo de documento em aberto
   case sTipo[1] of
      'T' : begin  // aberto sem nenhuma baixa
               sParam := sParam + ' AND P.CODDOCUMENTO IS NOT NULL ' +#13+
                                  ' AND P.CODDOCUMENTO NOT IN ( SELECT CODDOCUMENTO ' +#13+
                                  '                               FROM LANCTODOCUM  ' +#13+
                                  '                              WHERE RTRIM(OPERACAO) = ''5'' ' +#13+
                                  '                                AND ESTORNO IS NULL         ' +#13+
                                  '                                AND DATALANCTO  <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
                                  '                                AND CODDOCUMENTO = P.CODDOCUMENTO ) ' +#13;
            end;
      'P' : begin  // aberto com baixas parciais
               sParam := sParam + ' AND ( (P.FLGLANCINTEGRA IN(3,7) ) OR ' +#13+    // baixa manual ou Integ. Adminimob
                                  '       (P.CODDOCUMENTO IN ( SELECT CODDOCUMENTO ' +#13+
                                  '                              FROM LANCTODOCUM  ' +#13+
                                  '                             WHERE RTRIM(OPERACAO) = ''5'' ' +#13+
                                  '                               AND ESTORNO IS NULL         ' +#13+
                                  '                               AND DATALANCTO  <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
                                  '                               AND CODDOCUMENTO = P.CODDOCUMENTO ) ) ) ' +#13;

            end;
      else  begin  // todos em aberto
               sParam := sParam + ' AND RTRIM(D.STATUS) <> 2       ' +#13+
                                  ' AND P.CODDOCUMENTO IS NOT NULL ' +#13;
            end;
   end;

   sSql := 'SELECT P.CODDOCUMENTO, P.IDPARCFINANCIMOV,                              '+#13+
           '       P.DATAVENCIMENTO, P.DATAPAGAMENTO AS DATA_BAIXA,                 '+#13+
           '       P.FLGLANCINTEGRA,                                                '+#13+
           '       ROUND(P.VLRPRESTACAO,2)   AS TOT_RECEBER,                        '+#13+
           '       ROUND(P.VLRPAGO,2)        AS TOT_RECEBIDO,                       '+#13+
           '       ROUND(AL.TOT_ALTERADOR,2) AS TOT_ALTERADOR,                      '+#13+
           '       C.IDCONTRATOIMOVEL, C.IDLOCATARIO AS IDFORCLI, P.DATALIMITE,     '+#13+
           '       TO_NUMBER(TO_CHAR(P.DATAVENCIMENTO,''MM''))   AS MESCOMPETENCIA, '+#13+
           '       TO_NUMBER(TO_CHAR(P.DATAVENCIMENTO,''YYYY'')) AS ANOCOMPETENCIA, '+#13+
           '       C.IDCIDADES, C.IDPAIS, C.CODESTADO,                   '+#13+
           '       NVL(D.STATUS,''0'')  AS STATUS_DOC,                   '+#13+
           '       CXM.DIASTOLERANCIA   AS CONDIASTOLERANCIA,            '+#13+
           '       CXM.FLGTIPODIATOLERA AS FLGTIPODIATOLERA,             '+#13+
           '       CXM.IDINDCORRECAO    AS IDINDCORRECAO,                '+#13+
           '       CXM.MESREFCORRECAO   AS CONMESREFREAJUSTE,            '+#13+
           '       CXM.VLRMULTA         AS CONVLRMULTA,                  '+#13+
           '       CXM.MOEDAMULTA       AS CONMOEDAMULTA,                '+#13+
           '       CXM.PERCMULTA        AS CONPERCENTMULTA,              '+#13+
           '       CXM.PERCJUROS        AS CONPERCENTMORA,               '+#13+
           '       CXM.FLGJUROSPROPORC  AS FLGMORAPROPORC,               '+#13+
           '       CXM.PERIODOJUROS     AS CONPERMORA,                   '+#13+
           '       CXM.VLRJUROS         AS CONVLRMORA,                   '+#13+
           '       CXM.MOEDAJUROS       AS CONMOEDAMORA,                 '+#13+
           '       CXM.DIASREPASSE      AS CONDIASREPASSE,               '+#13+
           '       CD.ULTDATA           AS DTCONCILIA,                   '+#13+
           '       MAX(I.CODTIPIMOVEL)  AS CODTIPIMOVEL                  '+#13+
           '  FROM PARCFINANCIMOV P, CONDPAGIMOVEL CP, CONTRATOIMOVEL C, '+#13+
           '       CONTRATOXIMOVEL CXI, IMOVEL I, CONTRATOXMULTA CXM,    '+#13+
           '       DOCUMENTO D,                                          '+#13+
           '       ( SELECT IDPARCFINANCIMOV, MAX(DATA) AS ULTDATA       '+#13+
           '           FROM CONCILIADOC                                  '+#13+
           '          WHERE FLGTIPO = ''A''                              '+#13+
           '          GROUP BY IDPARCFINANCIMOV ) CD,                    '+#13+
           '       ( SELECT D2.CODDOCUMENTO,                             '+#13+
           '                SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1))  AS TOT_ALTERADOR '+#13+
           '           FROM LANCTODOCUM LD, DOCUMENTO D2, EMPRESAPROP E, '+#13+
           '                ( SELECT DISTINCT             '+#13+
           '                         CODDOCUMENTO, T.CODALTJRAL, T.CODALTMTAL, T.CODALTCMAL '+#13+
           '                    FROM PARCFINANCIMOV P2, CONDPAGIMOVEL CP2,                  '+#13+
           '                         CONTRATOXIMOVEL CX2, IMOVEL I2, TIPOIMOVEL T           '+#13+
           '                   WHERE P2.IDCONDPAGIMOVEL = CP2.IDCONDPAGIMOVEL               '+#13+
           '                     AND CP2.IDCONTRATOIMOVEL = CX2.IDCONTRATOIMOVEL            '+#13+
           '                     AND CX2.IDIMOVEL = I2.IDIMOVEL                             '+#13+
           '                     AND I2.CODTIPIMOVEL = T.CODTIPIMOVEL                       '+#13+
           '                ) TC '+#13+
           '          WHERE D2.CODDOCUMENTO = LD.CODDOCUMENTO '+#13+
           '            AND RTRIM(LD.OPERACAO) = ''4''        '+#13+
           '            AND LD.DATALANCTO  < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
           '            AND LD.ESTORNO IS NULL                '+#13+
           '            AND D2.CODDOCUMENTO = TC.CODDOCUMENTO '+#13+
           '            AND D2.IDPESSOA     = E.IDPESSOA      '+#13+
           '            AND LD.CODALTERADOR <> TC.CODALTCMAL  '+#13+
           '            AND LD.CODALTERADOR <> TC.CODALTJRAL  '+#13+
           '            AND LD.CODALTERADOR <> TC.CODALTMTAL  '+#13+
           '            AND ( (E.TIPOCLIENTE <> 19991) OR     '+#13+
           '                  (LD.CODALTERADOR <> 215 AND LD.CODALTERADOR <> 216) ) '+#13+    // cpmf e valor pago a maior PO - funcef
           '          GROUP BY D2.CODDOCUMENTO                '+#13+
           '       ) AL                                       '+#13+
           ' WHERE P.IDCONDPAGIMOVEL = CP.IDCONDINICIAL                  '+#13+
           '   AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL              '+#13+
           '   AND C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL             '+#13+
           '   AND C.IDCONTRATOIMOVEL = CXM.IDCONTRATOIMOVEL             '+#13+
           '   AND C.FLGSTATUS        = ''V''                            '+#13+
           '   AND CXI.IDIMOVEL = I.IDIMOVEL                             '+#13+
           '   AND ( P.CODDOCUMENTO IS NOT NULL OR                       '+#13+
           '         P.FLGLANCINTEGRA = 3 )                              '+#13+  // baixa manual
           '   AND P.CODDOCUMENTO = D.CODDOCUMENTO(+)                    '+#13+
           '   AND D.CODDOCUMENTO = AL.CODDOCUMENTO(+)                   '+#13+
           '   AND P.IDPARCFINANCIMOV = CD.IDPARCFINANCIMOV(+)           '+#13+
           '   AND (( CXM.FLGINDETERMINADO = ''N'' AND P.DATAVENCIMENTO BETWEEN CXM.DATAINI AND CXM.DATAFIM ) OR '+#13+
           '        ( CXM.FLGINDETERMINADO = ''S'' AND P.DATAVENCIMENTO >= CXM.DATAINI ) )                       '+#13+
           '   AND NVL(P.FLGCONCILIADO,''N'') <> ''S''                     '+#13+
           '   AND ( ( NVL(P.FLGCONCILIADO,''N'') <> ''C'' AND CD.ULTDATA IS NULL) OR '+#13+
           '         ( NVL(P.FLGCONCILIADO,''N'') =  ''C'' AND CD.ULTDATA >=  TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ) ) '+#13+ sParam +
           ' GROUP BY P.CODDOCUMENTO, P.IDPARCFINANCIMOV,                  '+#13+
           '          P.DATAVENCIMENTO, P.DATAPAGAMENTO, P.FLGLANCINTEGRA, '+#13+
           '          ROUND(P.VLRPRESTACAO,2), ROUND(P.VLRPAGO,2),         '+#13+
           '          ROUND(AL.TOT_ALTERADOR,2),                           '+#13+
           '          C.IDCONTRATOIMOVEL, C.IDLOCATARIO, P.DATALIMITE,     '+#13+
           '          TO_NUMBER(TO_CHAR(P.DATAVENCIMENTO,''MM'')),         '+#13+
           '          TO_NUMBER(TO_CHAR(P.DATAVENCIMENTO,''YYYY'')),       '+#13+
           '          C.IDCIDADES, C.IDPAIS, C.CODESTADO, D.STATUS,        '+#13+
           '          CXM.DIASTOLERANCIA, CXM.FLGTIPODIATOLERA, CXM.IDINDCORRECAO, CXM.MESREFCORRECAO, '+#13+
           '          CXM.VLRMULTA, CXM.MOEDAMULTA, CXM.PERCMULTA, CXM.PERCJUROS,                      '+#13+
           '          CXM.FLGJUROSPROPORC, CXM.PERIODOJUROS, CXM.VLRJUROS,                             '+#13+
           '          CXM.MOEDAJUROS, CXM.DIASREPASSE, CD.ULTDATA ';

  Result := GetDataPacket( sSql );
end;

function TCtrlParcFinancImov.SelecionaProvisaoPerdas(sNomeBilhete: string;
                                                     const iIdEmpresa,iIdModulo: Integer;
                                                     const dDataLimite: TDateTime;
                                                     const iIdContrato:Integer;
                                                     const sTipoImovel: String;
                                                     const sTipoContrato : String): OLEVariant;
var sSql, sParam, sDataLimite : String;
    cdsTemp : TCMClientDataSet;
    fResiduo, fSldVincendo : Extended;
    iQuant, iAtual : Integer;
begin
   if sTipoImovel <> '' then sParam := sParam + ' AND TI.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel)   +#13;
   if iIdContrato  > 0  then sParam := sParam + ' AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13;

   if sTipoContrato <> '' then sParam := sParam + ' AND C.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) + #13;
   
   sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataLimite)) + ',''DD/MM/YYYY'')';

   // Busca todos os contratos
   sSql := 'SELECT C.CONNUMERO, C.IDCONTRATOIMOVEL, TI.CODTIPIMOVEL, T.DESCTIPOIMOVEL,      '+#13+
           '       DECODE(C.IDCONTRATOIMOVEL, NULL, C.IDLOCATARIO, NULL) AS IDFORCLI,       '+#13+
           '       C.CONNOME, C.CONDATAINICIO,                                              '+#13+
           '       DECODE(C.FLGSTATUS, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL) AS STATUS_CONTRATO, '+#13+
           '       0 AS PERCENTUAL, 0 AS VLR_PROVISAO, ''                  '' AS DSC_GRUPO, '+#13+
           '       0 AS SLD_VINCENDO, 0 AS TOT_DIFERENCA,                                   '+#13+
           '       0 AS TOT_RESIDUO,                                                        '+#13+
           '       0 AS DIFERENCA,                                                          '+#13+

           '       MIN(P.DATAVENCIMENTO) AS DATAVENCIMENTO,                                 '+#13+
           '       ROUND( ( '+ sDataLimite +'- MIN(P.DATAVENCIMENTO)), 0) AS DIAS           '+#13+

           '  FROM PARCFINANCIMOV P, CONTRATOIMOVEL C, TIPOIMOVEL T,                        '+#13+
           '       ( SELECT DISTINCT IDCONTRATOIMOVEL, IDCONDINICIAL                        '+#13+
           '           FROM CONDPAGIMOVEL ) CP,                                             '+#13+
           '       ( SELECT CI.IDCONTRATOIMOVEL, MAX(I.CODTIPIMOVEL) AS CODTIPIMOVEL        '+#13+
           '           FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI, IMOVEL I                '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL                                       '+#13+
           '            AND CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL                      '+#13;

   if sTipoContrato <> '' then
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) +#13
   else
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ''C''                       '+#13;
      
   sSql := sSQL +
           '          GROUP BY CI.IDCONTRATOIMOVEL   ) TI                                   '+#13+

           ' WHERE P.IDCONDPAGIMOVEL   = CP.IDCONDINICIAL          '+#13+
           '   AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL        '+#13+
           '   AND C.IDCONTRATOIMOVEL  = TI.IDCONTRATOIMOVEL       '+#13+
           '   AND TI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+)         '+#13+
           '   AND P.FLGTIPOLANC       > 1                         '+#13+
           '   AND P.FLGLANCINTEGRA IN(2,3,4,6,7)                  '+#13+
           '   AND P.DATAVENCIMENTO <= ' + sDataLimite              +#13+ sParam +
           ' GROUP BY C.CONNUMERO, C.IDCONTRATOIMOVEL, TI.CODTIPIMOVEL, T.DESCTIPOIMOVEL, '+#13+
           '          DECODE(C.IDCONTRATOIMOVEL, NULL, C.IDLOCATARIO, NULL),              '+#13+
           '          C.CONNOME, C.CONDATAINICIO,                                         '+#13+
           '          DECODE(C.FLGSTATUS, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL), '+#13+
           '          0 , 0 , ''                  '', 0, 0, 0, 0  '+#13+
           ' ORDER BY DIAS, CODTIPIMOVEL, DESCTIPOIMOVEL, CONNOME ';

   LogToFile(sSQL, 'ProvPerda.txt', False, False);

   cdsTemp := TCMClientDataSet.Create( nil );
   cdsTemp.Data := GetDataPacket( sSql );

   // força um do progresso para montar a tela
   iAtual := 0;
   iQuant := cdsTemp.RecordCount;
   DoProgresso ([sNomeBilhete, iAtual, iQuant]);

   with cdsTemp do begin
     while not Eof do begin

       Inc (iAtual);
       DoProgresso ([sNomeBilhete, iAtual, iQuant]);

       // busca provisão de perdas porcontrato
       BuscaPerdasContrato(iIdEmpresa, cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger, dDataLimite, sTipoContrato);

       if (cdsPerda.FieldByName('DIAS').AsInteger < 61) or
          (cdsPerda.FieldByName('DIFERENCA').AsInteger <= 0) then begin
         Delete;
       end else begin
         Edit;
         FieldByName('DATAVENCIMENTO').AsDateTime := cdsPerda.FieldByName('DATAVENCIMENTO').AsDateTime;
         FieldByName('DIAS').AsFloat              := cdsPerda.FieldByName('DIAS').AsFloat;
         FieldByName('TOT_RESIDUO').AsFloat       := cdsPerda.FieldByName('TOT_RESIDUO').AsFloat;
         FieldByName('DIFERENCA').AsFloat         := cdsPerda.FieldByName('DIFERENCA').AsFloat;

         if FieldByName('DIAS').AsInteger < 121 then begin
            FieldByName('PERCENTUAL').AsInteger := 25;
            FieldByName('DSC_GRUPO').AsString := 'de 61 à 120 dias';
         end else if FieldByName('DIAS').AsInteger < 241 then begin
            FieldByName('PERCENTUAL').AsInteger := 50;
            FieldByName('DSC_GRUPO').AsString := 'de 121 à 240 dias';
         end else if FieldByName('DIAS').AsInteger < 361 then begin
            FieldByName('PERCENTUAL').AsInteger := 75;
            FieldByName('DSC_GRUPO').AsString := 'de 241 à 360 dias';
         end else begin
            FieldByName('PERCENTUAL').AsInteger := 100;
            FieldByName('DSC_GRUPO').AsString := 'acima de 360 dias';
         end;

         // Busca o Saldo Devedor Vincendo
         fSldVincendo := CalcSldNova( FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dDataLimite );
         FieldByName('SLD_VINCENDO').AsFloat  := fSldVincendo;
         FieldByName('DIFERENCA').AsFloat     := ComunsImobiliario.Arredonda(FieldByName('DIFERENCA').AsFloat + FieldByName('TOT_RESIDUO').AsFloat,2);
         FieldByName('TOT_DIFERENCA').AsFloat := ComunsImobiliario.Arredonda(FieldByName('DIFERENCA').AsFloat + fSldVincendo,2);
         FieldByName('VLR_PROVISAO').AsFloat  := ComunsImobiliario.Arredonda(
                                                    (FieldByName('DIFERENCA').AsFloat + fSldVincendo) *
                                                     FieldByName('PERCENTUAL').AsFloat / 100, 2);
         Post;
         Next;
       end;
     end;
   end;

   if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);

   // Retorna o cds Calculado
   Result := cdsTemp.Data;
end;


function TCtrlParcFinancImov.BuscaPerdasContrato(const iIdEmpresa, iIdContrato: Integer; dDataLimite: TDateTime; const sTipoContrato : String = ''): Extended;
var sSql, sDataLimite : String;
begin
   sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataLimite)) + ',''DD/MM/YYYY'')';

   sSql := 'SELECT C.CONNUMERO, C.IDCONTRATOIMOVEL, TI.CODTIPIMOVEL, T.DESCTIPOIMOVEL,      '+#13+
           '       DECODE(C.IDCONTRATOIMOVEL, NULL, C.IDLOCATARIO, NULL) AS IDFORCLI,       '+#13+
           '       C.CONNOME, C.CONDATAINICIO,                                              '+#13+
           '       DECODE(C.FLGSTATUS, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL) AS STATUS_CONTRATO, '+#13+
           '       0 AS PERCENTUAL, 0 AS VLR_PROVISAO, ''                  '' AS DSC_GRUPO, '+#13+
           '       0 AS SLD_VINCENDO, 0 AS TOT_DIFERENCA,                                   '+#13+
           '       MIN(RE.TOT_RESIDUO) AS TOT_RESIDUO,                                      '+#13+

           // Pendencia 23163
           '       MIN(DECODE(SIGN(DECODE(CD.IDDOCDIVERGE, NULL, DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0, '+#13+
           '                                                                                        ROUND(NVL(P.VLRPRESTACAO,0),2)  + '+#13+
           '                                                                                        ROUND(NVL(TA.TOT_ALTERADOR,0),2) + '+#13+
           '                                                                                        ROUND(NVL(CO.TOT_CORRECAO,0),2) - '+#13+
           '                                                                                        ROUND(NVL(PP.VLRPAGO,0),2)))), -1, '+#13+
           '                                                                                       ' + sDataLimite + ', '+#13+
           '                                                                                        P.DATAVENCIMENTO '+#13+
           '                                                                                        )) AS DATAVENCIMENTO, '+#13+

           '     ROUND( ( ' + sDataLimite + ' - '+#13+
           '           MIN(DECODE(SIGN(DECODE(CD.IDDOCDIVERGE, NULL, DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0, '+#13+
           '                                                                                        ROUND(NVL(P.VLRPRESTACAO,0),2)  + '+#13+
           '                                                                                        ROUND(NVL(TA.TOT_ALTERADOR,0),2) + '+#13+
           '                                                                                        ROUND(NVL(CO.TOT_CORRECAO,0),2) - '+#13+
           '                                                                                        ROUND(NVL(PP.VLRPAGO,0),2)))), -1, '+#13+
           '                                                                                       ' + sDataLimite + ', '+#13+
           '                                                                                        P.DATAVENCIMENTO '+#13+
           '                                                                                        )) )) AS DIAS, '+#13+
           // Fim Pendencia 23163

           '       ROUND(SUM(                                                                     '+#13+
           '       DECODE(CD.IDDOCDIVERGE, NULL,                                            '+#13+
           '          DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0,               '+#13+
           '                 ROUND(NVL(P.VLRPRESTACAO,0),2)  + ROUND(NVL(TA.TOT_ALTERADOR,0),2) + ROUND(NVL(CO.TOT_CORRECAO,0),2) - ROUND(NVL(PP.VLRPAGO,0),2) - ROUND(NVL(ABONO.TOT_ABONO,0),2) ), NULL) '+#13+
           '           ),2) AS DIFERENCA  '+#13+
           '  FROM PARCFINANCIMOV P, CONTRATOIMOVEL C, TIPOIMOVEL T,                        '+#13+
           '      ( '+#13+
           '        SELECT /*+ INDEX(LD) INDEX(RP)*/ '+#13+
           '               IDPARCFINANCIMOV,         '+#13+
           '               DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
           '               DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO                  '+#13+
           '          FROM PARCFINANCIMOV P, CONDPAGIMOVEL CP, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
           '         WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)             '+#13+
           '           AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)             '+#13+
           '           AND LD.NUMLANCTO    = RP.NUMLANCTO(+)                '+#13+
           '           AND P.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL           '+#13+
           '           AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)   +#13+
           '           AND ( (P.CODDOCUMENTO IS NULL) OR                    '+#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) ) '+#13+
           '           AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= ' + sDataLimite + ' ) OR                '+#13+
           '                (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 )    '+#13+
           '                                            AND LD.ESTORNO IS NULL '+#13+
           '                                            AND LD.DATALANCTO <= ' + sDataLimite + ' ) ) '+#13+
           '         GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO '+#13+
           '      ) PP, '+#13+

           '      ( SELECT DISTINCT          '+#13+
           '               IDPARCFINANCIMOV, '+#13+
           '               DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVERGE '+#13+
           '          FROM CONCILIADOC                  '+#13+
           '         WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '           AND DATA <= ' + sDataLimite       +#13+
           '           AND (IDDOCDIVERGE IS NOT NULL OR '+#13+
           '                IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPARCFINANCIMOV    '+#13+
           '                                            FROM CONCILIADOC                  '+#13+
           '                                           WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
           '                                             AND DATA <= ' + sDataLimite       +#13+
           '                                             AND IDDOCDIVERGE IS NOT NULL ) ) '+#13+
           '      ) CD, '+#13+

           '      (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO, '+#13+
           '                DECODE(FLGTIPO,''M'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                               ''J'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                               ''C'', DECODE(QTDE,3,''S'',''P''), '+#13+
           '                               CONCILIADOC ) AS CONCILIADOC       '+#13+
           '           FROM '+#13+
           '                ( SELECT C.IDPARCFINANCIMOV,           '+#13+
           '                         DECODE(C.FLGTIPO, NULL, NULL, '+#13+
           '                                ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
           '                                ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC,           '+#13+
           '                         MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS FLGTIPO, COUNT(*) AS QTDE '+#13+
           '                    FROM CONCILIADOC C, PARCFINANCIMOV P         '+#13+
           '                   WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV '+#13+
           '                     AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'') '+#13+
           '                     AND C.DATA <= ' + sDataLimite +#13+

          // Marchetti - Pendencia 26068
           '                     AND ( C.FLGTIPO IN (''T'',''R'') OR                                '+#13+
           '                           NOT EXISTS ( SELECT 1 FROM CONCILIADOC              '+#13+
           '                                         WHERE FLGTIPO IN (''T'',''R'')        '+#13+
          // Fim Marchetti - Pendencia 26068
           '                                           AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) ) '+#13+
           '                   GROUP BY C.IDPARCFINANCIMOV,   '+#13+
           '                            DECODE(C.FLGTIPO, NULL, NULL, '+#13+
           '                                ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
           '                                ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2, '+#13+
           '       ( SELECT DISTINCT IDCONTRATOIMOVEL, IDCONDINICIAL                        '+#13+
           '           FROM CONDPAGIMOVEL ) CP,                                             '+#13+
           '       ( SELECT CI.IDCONTRATOIMOVEL, MAX(I.CODTIPIMOVEL) AS CODTIPIMOVEL        '+#13+
           '           FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI, IMOVEL I                '+#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL                                       '+#13+
           '            AND CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL                      '+#13+
           '            AND CI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                  +#13;

   if sTipoContrato <> '' then
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) +#13
   else
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ''C''                       '+#13;

   sSQL := sSQL +
           '          GROUP BY CI.IDCONTRATOIMOVEL   ) TI,                                  '+#13+

           '       ( SELECT D1.IDPARCFINANCIMOV, D1.TOT_CORRECAO                        '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                   '+#13+
           '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE L.VLRACUM <> 0                                     '+#13+
           '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')              '+#13+
           '                     AND L.IDMODULO = 135                                   '+#13+
           '                     AND P.IDPESSOA = ' + IntToStr(iIdEmpresa)               +#13+
           '                     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)      +#13+
           '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERATUALCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,            '+#13+
           '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2              '+#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(iIdEmpresa)              +#13+
           '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                 '+#13+
           '                     AND L2.IDMODULO = 135                                  '+#13+
           '                     AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)     +#13+
           '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERATUALCM )        '+#13+
           '                     AND ( DATAOPER <= ' + sDataLimite + ')          '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV ) D2                 '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV            '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                              '+#13+
           '       ) CO,                                                         '+#13+

           '       (                                                                        '+#13+
           '         SELECT CP.IDCONTRATOIMOVEL,                                            '+#13+
           '                ROUND(SUM(NVL(PF.VLRRESIDUO,0)+NVL(CO.VLR_CORRIG,0)),2) AS TOT_RESIDUO '+#13+
           '           FROM CONDPAGIMOVEL CP,                     '+#13+
           '                PARCFINANCIMOV PF,                    '+#13+
           '                ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
           '                    FROM PARCEXTRAIMOV                '+#13+
           '                   WHERE FLGTIPOCOBRANCA = ''R''      '+#13+
           '                 ) CR,                                '+#13+

           '                 ( SELECT D1.IDPARCFINANCIMOV, D1.VLR_CORRIG                '+#13+
           '                     FROM ( SELECT /*+ INDEX (L) */                         '+#13+
           '                                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLR_CORRIG '+#13+
           '                              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P      '+#13+
           '                             WHERE P.IDPESSOA = ' + IntToStr(iIdEmpresa)     +#13+
           '                               AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13+
           '                               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                        '+#13+
           '                               AND L.IDMODULO = 135                         '+#13+
           '                               AND ( L.IDOPERACAO = P.IDOPERATUALRES )      '+#13+
           '                             GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,  '+#13+
           '                          ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                              FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2    '+#13+
           '                             WHERE P2.IDPESSOA = ' + IntToStr(iIdEmpresa)    +#13+
           '                               AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                       '+#13+
           '                               AND L2.IDMODULO = 135                        '+#13+
           '                               AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13+
           '                               AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )    '+#13+
           '                               AND ( DATAOPER <= ' + sDataLimite + ')       '+#13+
           '                             GROUP BY L2.IDPARCFINANCIMOV ) D2              '+#13+
           '                    WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV         '+#13+
           '                      AND D1.DATAOPER = D2.DTAPUR                           '+#13+
           '                  ) CO                                                      '+#13+
           '          WHERE PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL                        '+#13+
           '            AND PF.IDPARCFINANCIMOV = CR.IDPARCCOBRADA(+)                       '+#13+
           '            AND PF.IDPARCFINANCIMOV = CO.IDPARCFINANCIMOV(+)                    '+#13+
           '            AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                  +#13+
           '            AND PF.DATAVENCIMENTO  <= ' + sDataLimite                            +#13+
           '            AND ( (NVL(PF.FLGRESIDUOINCORP,''N'') = ''N'' AND                   '+#13+
           '                   PF.FLGLANCINTEGRA <> 5 AND PF.FLGLANCINTEGRA <> 6 ) OR       '+#13+
           '                  (NVL(PF.FLGRESIDUOINCORP,''N'') = ''C'' AND CR.DATACOBRES > ' + sDataLimite + ' ) ) '+#13+
           '          GROUP BY CP.IDCONTRATOIMOVEL                                          '+#13+
           '       ) RE,                                                                    '+#13+
           '       (                                                                        '+#13+
           '        SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'', L.VALOR, L.VALOR * -1) ) AS TOT_ALTERADOR '+#13+
           '          FROM LANCTODOCUM L, DOCUMENTO D, TIPOIMOVEL T,                        '+#13+
           '               PARCFINANCIMOV P, CONDPAGIMOVEL CP,                              '+#13+
           '               ( SELECT CI.IDCONTRATOIMOVEL, MAX(I.CODTIPIMOVEL) AS CODTIPIMOVEL'+#13+
           '                   FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI, IMOVEL I        '+#13+
           '                  WHERE CXI.IDIMOVEL = I.IDIMOVEL                               '+#13+
           '                    AND CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL              '+#13;
   if sTipoContrato <> '' then
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) +#13
   else
      sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ''C''                       '+#13;

   sSQL := sSQL +
           '                  GROUP BY CI.IDCONTRATOIMOVEL ) CXI                            '+#13+
           '         WHERE L.CODDOCUMENTO = D.CODDOCUMENTO                                  '+#13+
           '           AND D.CODDOCUMENTO = P.CODDOCUMENTO                                  '+#13+
           '           AND P.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL                           '+#13+
           '           AND CP.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL                       '+#13+
           '           AND CXI.CODTIPIMOVEL = T.CODTIPIMOVEL                                '+#13+
           '           AND RTRIM(L.OPERACAO) = ''4''                                        '+#13+
           '           AND L.ESTORNO IS NULL                                                '+#13+
           '           AND D.IDMODULO = 135                                                 '+#13+
           '           AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                   +#13+
           '           AND L.DATALANCTO <= ' + sDataLimite                                   +#13+
           '           AND L.CODALTERADOR <> 215                                            '+#13+
           '           AND L.CODALTERADOR <> 216                                            '+#13+
           '           AND L.CODALTERADOR <> T.CODALTMTAL                                   '+#13+
           '           AND L.CODALTERADOR <> T.CODALTJRAL                                   '+#13+
           '           AND L.CODALTERADOR <> T.CODALTCMAL                                   '+#13+
           '         GROUP BY D.CODDOCUMENTO                                                '+#13+
           '       ) TA,                                                                    '+#13+
           '       ( SELECT D1.IDPARCFINANCIMOV, D1.TOT_ABONO                           '+#13+
           '           FROM ( SELECT /*+ INDEX (L) */                                   '+#13+
           '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                '+#13+
           '                   WHERE L.VLRACUM <> 0                                     '+#13+
           '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                  '+#13+
           '                     AND L.IDMODULO = 135                                   '+#13+
           '                     AND P.IDPESSOA = ' + IntToStr(iIdEmpresa)               +#13+
           '                     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)      +#13+
           '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR             '+#13+
           '                           L.IDOPERACAO = P.IDOPERABONOCM )                 '+#13+
           '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,            '+#13+
           '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2              '+#13+
           '                   WHERE P2.IDPESSOA = ' + IntToStr(iIdEmpresa)              +#13+
           '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                 '+#13+
           '                     AND L2.IDMODULO = 135                                  '+#13+
           '                     AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)     +#13+
           '                     AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERABONOJUROS OR    '+#13+
           '                           L2.IDOPERACAO = P2.IDOPERABONOCM )        '+#13+
           '                     AND ( DATAOPER <= ' + sDataLimite + ')          '+#13+
           '                   GROUP BY L2.IDPARCFINANCIMOV ) D2                 '+#13+
           '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV            '+#13+
           '            AND D1.DATAOPER = D2.DTAPUR                              '+#13+
           '       ) ABONO                                                       '+#13+

           ' WHERE P.IDPARCFINANCIMOV  = CO.IDPARCFINANCIMOV(+)    '+#13+
           '   AND P.IDPARCFINANCIMOV  = PP.IDPARCFINANCIMOV(+)    '+#13+
           '   AND P.IDPARCFINANCIMOV  = CD.IDPARCFINANCIMOV(+)    '+#13+
           '   AND P.IDPARCFINANCIMOV  = CD2.IDPARCFINANCIMOV(+)   '+#13+
           '   AND P.IDPARCFINANCIMOV  = ABONO.IDPARCFINANCIMOV(+) '+#13+
           '   AND P.CODDOCUMENTO      = TA.CODDOCUMENTO(+)        '+#13+
           '   AND P.IDCONDPAGIMOVEL   = CP.IDCONDINICIAL          '+#13+
           '   AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL        '+#13+
           '   AND C.IDCONTRATOIMOVEL  = TI.IDCONTRATOIMOVEL       '+#13+
           '   AND C.IDCONTRATOIMOVEL  = RE.IDCONTRATOIMOVEL(+)    '+#13+
           '   AND TI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+)         '+#13+
           '   AND C.IDCONTRATOIMOVEL  = ' + IntToStr(iIdContrato)  +#13+
           '   AND P.FLGTIPOLANC       > 1                         '+#13+
           //Pendência 28049
           //'   AND P.FLGLANCINTEGRA IN(2,3,4,6,7)                  '+#13+
           '   AND P.FLGLANCINTEGRA IN(2,3,4,5,6,7)                  '+#13+
           '   AND P.IDPARCFINANCIMOV NOT IN( SELECT IDPARCFINANCIMOV '+#13+
           '                          FROM CONCILIADOC                   '+#13+
           '                WHERE FLGTIPO = ''R''                        '+#13+
           '                  AND DATA <= ' + sDataLimite + ')          '+#13+
           //Fim Pendência 28049
           '   AND NVL(CD2.CONCILIADOC,''N'') NOT IN (''C'',''S'') '+#13+
           '   AND P.DATAVENCIMENTO <= ' + sDataLimite              +#13+
           '   AND ROUND(P.VLRPRESTACAO + NVL(TA.TOT_ALTERADOR,0) + NVL(CO.TOT_CORRECAO,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TOT_ABONO,0), 2) <> 0 '+#13+
           ' GROUP BY C.CONNUMERO, C.IDCONTRATOIMOVEL, TI.CODTIPIMOVEL, T.DESCTIPOIMOVEL, '+#13+
           '          DECODE(C.IDCONTRATOIMOVEL, NULL, C.IDLOCATARIO, NULL),              '+#13+
           '          C.CONNOME, C.CONDATAINICIO,                                         '+#13+
           '          DECODE(C.FLGSTATUS, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL), '+#13+
           '          0 , 0 , ''                  '', 0, 0  '+#13+
           ' ORDER BY DIAS, CODTIPIMOVEL, DESCTIPOIMOVEL, CONNOME ';

   LogToFile(sSQL, 'ProvPerda_IdContr_'+ IntToStr(iIdContrato) +'.txt', False, False);

   cdsPerda.Data := GetDataPacket( sSql );
end;





function TCtrlParcFinancImov.CalcSldNova(const iContrato, iCondPag: Integer; const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    cdsTemp, cdsCond : TCMClientDataSet;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  // Ajustar para FUNCEF contrato 000444 não funciona para a nova função
  if (Sistema.TipoCliente = 19991) and (iContrato = 2720) then begin
     Result := CalcSaldoDevedorAnt(iContrato, iCondPag, dData);
     Exit;
  end;

  try
     try
        cdsTemp := TCMClientDataSet.Create( nil );
        cdsCond := TCMClientDataSet.Create( nil );
        cdsCond.Data := GetDataPacket('SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');
        // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
        sSql := 'SELECT P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
                '       DECODE(ULT.FORMACALCULO,             '+#13+
                '              1, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2),    '+#13+
                '              2, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0)),2),    '+#13+
                '              4, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2),    '+#13+
                '             18, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRPRESTACAO,0) ),2),   '+#13+
                '                 ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2) ) AS SALDOATUAL '+#13+
                '  FROM PARCFINANCIMOV P, '+#13+
                '       ( SELECT P2.IDCONDPAGIMOVEL, C2.FORMACALCULO, MAX(P2.DATAVENCIMENTO) AS DATAVENCIMENTO '+#13+
                '           FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2, '+#13+

                // Marchetti - Pendencia 21541
                '           ( '+#13+
                '             SELECT /*+ INDEX(LD) INDEX(RP)*/   '+#13+
                '                    IDPARCFINANCIMOV, '+#13+
                '                    DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
                '                    DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
                '               FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
                '              WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
                '                AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
                '                AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
                '                AND ( (P.CODDOCUMENTO IS NULL) OR        '+#13+
                '                      (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '+#13+
                '                AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) OR '+#13+
                '                     (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
                '                                                 AND LD.ESTORNO IS NULL                  '+#13+
                '                                                 AND LD.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) )  '+#13+
                '              GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                                  '+#13+
                '           ) PP '+#13+
                // Fim Marchetti - Pendencia 21541

                '          WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDINICIAL '+#13+
                '            AND (P2.NUMPARCELA > 0 OR P2.FLGTIPOLANC = 12 ) '+#13+
                '            AND P2.FLGTIPOLANC <> 6   '+#13+

// VINICIUS - 04/01/2006 - Verificar ordem cronologica das repactuações
                '            AND (C2.IDREPACTUA IS NULL OR C2.DATAFIM >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) '+#13+
// Fim VINICIUS - 04/01/2006

                // Marchetti - Pendencia 21541
                '            AND (PP.IDPARCFINANCIMOV(+) = P2.IDPARCFINANCIMOV) '+#13+
                '            AND ( (P2.DATAVENCIMENTO IS NULL) OR (P2.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'')) OR ' + #13 +
                '                  (PP.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'')) )' + #13 +
                // Fim Marchetti - Pendencia 21541

                '            AND P2.IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
                '                                         WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;
        if iCondPag > 0 then
          sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

        sSql := sSql + '                    ) '+#13+

                '          GROUP BY P2.IDCONDPAGIMOVEL, C2.FORMACALCULO ) ULT    '+#13+
                ' WHERE P.IDCONDPAGIMOVEL = ULT.IDCONDPAGIMOVEL '+#13+
                '   AND P.DATAVENCIMENTO  = ULT.DATAVENCIMENTO  '+#13+
                '   AND FLGTIPOLANC <> 6 '+#13+
                '   AND (NUMPARCELA > 0 OR P.FLGTIPOLANC = 12 )'+#13+
                '   AND (NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0)) > 0 '+#13+

                'UNION '+#13+

                'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, '+#13+
                '       VLRFINANC  AS SALDOATUAL '+#13+
                '  FROM CONDPAGIMOVEL '+#13+
                ' WHERE IDREPACTUA IS NULL '+#13+
                '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
                '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
                '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

        if iCondPag > 0 then
          sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

        sSql := sSql + '                    ) ';

        if (Sistema.TipoCliente = 19991) and ( ((iContrato = 2756) and (dLimite < StrToDate('01/04/2006'))) or (iContrato = 2806) ) then
        begin
           sSQL :=
           'SELECT P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, ' + #13 +
           '       DECODE(ULT.FORMACALCULO, ' + #13 +
           '                           1, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2), ' + #13 +
           '                           2, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0)),2), ' + #13 +
           '                           4, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2), ' + #13 +
           '                           9, ROUND(P.VLRSALDODEVEDOR,2), ' + #13 +
           '                           11, ROUND(NVL(P.VLRSALDODEVEDOR,0),2), ' + #13 +
           '                               ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2) ) AS SALDOATUAL ' + #13 +
           '               FROM PARCFINANCIMOV P, ' + #13 +
           '                    ( SELECT P2.IDCONDPAGIMOVEL, C2.FORMACALCULO, min(P2.DATAVENCIMENTO) AS DATAVENCIMENTO ' + #13 +
           '                        FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2, REPCONDPAGIMOV R ' + #13 +
           '                       WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDINICIAL ' + #13 +
           '                         AND C2.IDREPACTUA = R.IDREPACTUA(+) ' + #13 +
           '                         AND P2.FLGTIPOLANC <> 6 ' + #13 +
           '                         AND (C2.IDREPACTUA IS NULL OR R.DATAREPACTUA > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) '+#13+
           '                         AND P2.IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL ' + #13 +
           '                                                      WHERE IDCONTRATOIMOVEL =  ' + IntToStr(iContrato) +#13;
           if iCondPag > 0 then
             sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

           sSQL := sSQL +
           '                         ) ' + #13 +
           '                       GROUP BY P2.IDCONDPAGIMOVEL, C2.FORMACALCULO ) ULT ' + #13 +
           '              WHERE ' + #13 +
           '                    P.IDCONDPAGIMOVEL = ULT.IDCONDPAGIMOVEL ' + #13 +
           '                AND FLGTIPOLANC <> 6 ' + #13 +
           '                AND P.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
           'ORDER BY DATAVENCIMENTO DESC ' + #13;
        end;

        cdsTemp.Data := GetDataPacket( sSql );

        if (Sistema.TipoCliente = 19991) and ( ((iContrato = 2756) and (dLimite < StrToDate('01/04/2006'))) or (iContrato = 2806) ) then
        begin
           fSaldo := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('SALDOATUAL').AsFloat, 2);
        end
        else
        begin
           fSaldo := 0;
           while not cdsTemp.Eof do begin
              if not cdsCond.Locate('IDCONDPAGIMOVEL', cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
                 fSaldo := fSaldo + ComunsImobiliario.Arredonda(cdsTemp.FieldByName('SALDOATUAL').AsFloat, 2);
                 cdsCond.Insert;
                 cdsCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger;
                 cdsCond.Post;
              end;
              cdsTemp.Next
           end;
        end;
     except
       on E:Exception do begin
         MessageInfo := E.Message;
       end;
     end;
  finally
     FreeAndNil( cdsTemp );
     FreeAndNil( cdsCond );
     Result := fSaldo;
  end;
end;


function TCtrlParcFinancImov.CalcSaldoDevedorAnt(const iContrato, iCondPag: Integer; const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    cdsTemp, cdsCond : TCMClientDataSet;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  try
     try
        cdsTemp := TCMClientDataSet.Create( nil );
        cdsCond := TCMClientDataSet.Create( nil );
        cdsCond.Data := GetDataPacket('SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');

        // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
        // Marchetti - pendencia 28201
        //sSql := 'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRSALDOATUAL '+#13+
        sSql := 'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRSALDODEVEDOR AS VLRSALDOATUAL '+#13+
                '  FROM PARCFINANCIMOV     '+#13+
                ' WHERE NUMPARCELA > 0     '+#13+
                '   AND FLGTIPOLANC <> 6   '+#13+
                '   AND NVL(VLRPAGO,0) = 0 '+#13+
        //      '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
                '   AND DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
                '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
                '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;
        if iCondPag > 0 then
          sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

        sSql := sSql + '                    ) '+#13+
        //' ORDER BY IDCONDPAGIMOVEL, DATAVENCIMENTO ';
                  ' ORDER BY DATAVENCIMENTO DESC, IDCONDPAGIMOVEL ASC';
        // Fim Marchetti - pendencia 28201
        
        cdsTemp.Data := GetDataPacket( sSql );

        fSaldo := 0;
        while not cdsTemp.Eof do begin
           if not cdsCond.Locate('IDCONDPAGIMOVEL', cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(cdsTemp.FieldByName('VLRSALDOATUAL').AsFloat, 2);
              cdsCond.Insert;
              cdsCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              cdsCond.Post;
           end;
           cdsTemp.Next
        end;

        // Verifica as condições já encerradas que não tiveram o saldo teórico quitado
        sSql := 'SELECT P.IDPARCFINANCIMOV, P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
                '       ROUND(P.VLRSALDODEVEDOR, 2) AS VLRSALDODEVEDOR '+#13+
                '  FROM PARCFINANCIMOV P, '+#13+
                '       ( SELECT P.IDCONDPAGIMOVEL, '+#13+
                '                MAX(P.DATAVENCIMENTO)  AS DATAVENCIMENTO, '+#13+
                '                MAX(P.NUMPARCELA)      AS ULTPARC '+#13+
                '           FROM PARCFINANCIMOV P, CONDPAGIMOVEL C '+#13+
                '          WHERE C.IDCONDINICIAL = P.IDCONDPAGIMOVEL '+#13+
                '            AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
                '            AND P.NUMPARCELA > 0 '+#13+
                '          GROUP BY P.IDCONDPAGIMOVEL  ) UP '+#13+
                ' WHERE P.IDCONDPAGIMOVEL = UP.IDCONDPAGIMOVEL '+#13+
                '   AND P.DATAVENCIMENTO  = UP.DATAVENCIMENTO  '+#13+
                '   AND P.NUMPARCELA      = UP.ULTPARC         '+#13+
                '   AND P.VLRSALDODEVEDOR > 0 '+#13+
                '   AND P.NUMPARCELA > 0 ';
        if iCondPag > 0 then
          sSql := sSql + ' AND P.IDCONDPAGIMOVEL = ' + IntToStr(iCondPag);

        cdsTemp.Data := GetDataPacket( sSql );

        while not cdsTemp.Eof do begin
           if not cdsCond.Locate('IDCONDPAGIMOVEL', cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(cdsTemp.FieldByName('VLRSALDODEVEDOR').AsFloat, 2);
              cdsCond.Insert;
              cdsCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := cdsTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              cdsCond.Post;
           end;
           cdsTemp.Next
        end;
     except
       on E:Exception do begin
         MessageInfo := E.Message;
       end;
     end;
  finally
     FreeAndNil( cdsTemp );
     FreeAndNil( cdsCond );
     Result := fSaldo;
  end;
end;



function TCtrlParcFinancImov.CalcResiduo(const iContrato: Integer; const dData: TDateTime): Extended;
var sSql : String;
    cdsTemp : TCMClientDataSet;
    fCM : Extended;
begin
   try
      cdsTemp := TCMClientDataSet.Create(nil);
      sSql := 'SELECT C.INDCORRECAO,    '+#13+
              '       C.MESREFREAJUSTE, '+#13+
              '       MAX(P.DATAVENCIMENTO)      AS DTINICIO,   '+#13+
              '       ROUND(SUM(P.VLRRESIDUO),2) AS TOT_RESIDUO '+#13+
              '  FROM PARCFINANCIMOV P, '+#13+
              '       ( SELECT A.IDCONDINICIAL,   A.IDCONTRATOIMOVEL, '+#13+
              '                A.IDCONDPAGIMOVEL, A.INDCORRECAO, '+#13+
              '                A.MESREFREAJUSTE '+#13+
              '           FROM CONDPAGIMOVEL A, '+#13+
              '                (SELECT IDCONDINICIAL, '+#13+
              '                        MAX(DATAINI) AS DATAINI    '+#13+
              '                   FROM CONDPAGIMOVEL              '+#13+
              '                  GROUP BY IDCONDINICIAL) B        '+#13+
              '           WHERE B.IDCONDINICIAL = A.IDCONDINICIAL '+#13+
              '             AND B.DATAINI = A.DATAINI ) C         '+#13+
              ' WHERE P.IDCONDPAGIMOVEL = C.IDCONDINICIAL         '+#13+
              '   AND P.VLRRESIDUO IS NOT NULL                    '+#13+
              '   AND NVL(P.FLGRESIDUOINCORP,''N'') = ''N''       '+#13+
              '   AND P.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dData)) + ',''dd/mm/yyyy'') '+#13+
              '   AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
              ' GROUP BY C.INDCORRECAO, C.MESREFREAJUSTE ';
      cdsTemp.Data := GetDataPacket(sSql);
      if cdsTemp.FieldByName('TOT_RESIDUO').AsFloat > 0 then begin
         fCM := ComunsImobiliarioDB.CalcCM(cdsTemp.FieldByName('TOT_RESIDUO').AsFloat,
                                           cdsTemp.FieldByName('INDCORRECAO').AsInteger,
                                           cdsTemp.FieldByName('DTINICIO').AsDateTime + 1,
                                           dData, True,
                                           cdsTemp.FieldByName('MESREFREAJUSTE').AsInteger);

         Result := cdsTemp.FieldByName('TOT_RESIDUO').AsFloat + fCM;
      end else begin
         Result := 0;
      end;
   finally
      FreeAndNil(cdsTemp);
   end;
end;



function TCtrlParcFinancImov.LookupAlienacaoAtiva(const dData  : TDateTime;
                                                  const iJurCM : Integer;
                                                  const bAtualizacaoSaldo : Boolean = False;
                                                  const sTipoContrato : String = ''
                                                 ): OLEVariant;
var
   sSQL  : String;
   sData : String;
begin
   sData := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')';

   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +
   '   CON.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL, IMO.CODTIPIMOVEL, '                        + #13 +
   '   CON.FLGTIPOCONTRATO, CON.FLGSTATUS, CON.IDLOCATARIO, CON.CONNOME, '                   + #13 +
   '   CON.CONVLRTOTAL, CON.CONVLRAJUSTADO, CON.CONDIAVENCIMENTO, '                          + #13 +
   '   CON.CONDATAASSINATURA, CON.CONDATAINICIO, CON.CONDATACARENCIA, '                      + #13 +
   '   CON.CONDATAFIM, CON.CONDATADENUNCIA, '                                                + #13 +
   '   CON.CONDATAREAJUSTE, CON.CONPERREAJUSTE, CON.CONPROXREAJUSTE, CON.CONPERCREAJUSTE, '  + #13 +
   '   CON.MOECODIGO, CON.FLGTIPOALUGUEL, '                                                  + #13 +
   '   CON.CONPERCENTMORA, CON.CONPERMORA, CON.CONPERCENTMULTA '                             + #13 +
   'FROM '                                                                                   + #13 +
   '   CONTRATOIMOVEL  CON, '                                                                + #13 +
   '   CONDPAGIMOVEL   CPI, '                                                                + #13 +
   '   CONTRATOXIMOVEL CXI, '                                                                + #13 +
   '   IMOVEL          IMO  '                                                                + #13 +
   'WHERE '                                                                                  + #13;

   if sTipoContrato <> '' then
      sSQL := sSQL +
      '       CON.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato)                                + #13
   else
      sSQL := sSQL +
      '       CON.FLGTIPOCONTRATO = ''C'' '                                                     + #13;

   sSQL := sSQL +
   '   AND CON.FLGSTATUS        = ''V'' '                                                    + #13 +
   '   AND CPI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                                     + #13 +
   '   AND CON.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '                                     + #13 +
   '   AND CXI.IDIMOVEL         = IMO.IDIMOVEL '                                             + #13;

   if not bAtualizacaoSaldo then
   begin
      sSQL := sSQL +
      '   AND EXISTS '                                                                          + #13 +
      '       ( '                                                                               + #13 +
      '       SELECT 1 '                                                                        + #13 +
      '       FROM '                                                                            + #13 +
      '          PARCFINANCIMOV PAR, '                                                          + #13 +
      '          CONDPAGIMOVEL  COP, '                                                          + #13 +
      '          CONTRATOIMOVEL CIM '                                                           + #13 +
      '       WHERE '                                                                           + #13;

      if sTipoContrato <> '' then
         sSQL := sSQL +
         '       CON.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato)                                + #13
      else
         sSQL := sSQL +
         '       CON.FLGTIPOCONTRATO = ''C'' '                                                     + #13;

      sSQL := sSQL +
      '          AND PAR.DATAVENCIMENTO   < ' + sData                                           + #13 +
      '          AND PAR.IDCONDPAGIMOVEL  = COP.IDCONDPAGIMOVEL '                               + #13 +
      '          AND COP.IDCONTRATOIMOVEL = CIM.IDCONTRATOIMOVEL '                              + #13 +
      '          AND COP.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                              + #13 +
      '          AND CIM.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                              + #13 +
      '          AND COP.IDCONDPAGIMOVEL  = CPI.IDCONDPAGIMOVEL '                               + #13 +
      '       ) '                                                                               + #13 +
      '   AND EXISTS '                                                                          + #13 +
      '       ( '                                                                               + #13 +
      '       SELECT 1 '                                                                        + #13 +
      '       FROM '                                                                            + #13 +
      '          PARCFINANCIMOV PAR, '                                                          + #13 +
      '          CONDPAGIMOVEL  COP, '                                                          + #13 +
      '          CONTRATOIMOVEL CIM '                                                           + #13 +
      '       WHERE '                                                                           + #13;

      if sTipoContrato <> '' then
         sSQL := sSQL +
         '              CIM.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato)                                + #13
      else
         sSQL := sSQL +
         '              CIM.FLGTIPOCONTRATO = ''C'' '                                                     + #13;

      sSQL := sSQL +
      '          AND PAR.DATAVENCIMENTO  >= ' + sData                                           + #13;

      case iJurCM of
         1: sSQL := sSQL + '          AND (NVL(PAR.VLRJUROS, 0) + NVL(PAR.VLRJUROSPARC, 0)) <> 0 '    + #13;
         2: sSQL := sSQL + '          AND (NVL(PAR.VLRRESIDUO, 0) + NVL(PAR.VLRCORRSALDO, 0)) <> 0 '  + #13;
      end;

      sSQL := sSQL +
      '          AND PAR.IDCONDPAGIMOVEL  = COP.IDCONDPAGIMOVEL '                               + #13 +
      '          AND COP.IDCONTRATOIMOVEL = CIM.IDCONTRATOIMOVEL '                              + #13 +
      '          AND COP.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                              + #13 +
      '          AND CIM.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                              + #13 +
      '          AND COP.IDCONDPAGIMOVEL  = CPI.IDCONDPAGIMOVEL '                               + #13 +
      '       ) '                                                                               + #13;
   end;
   sSQL := sSQL +
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL ';

   Result   := GetDataPacket(sSQL);
end;



function TCtrlParcFinancImov.LookupParcelaAntPos(const iContrato : Integer;
                                                 const iCondPag  : Integer;
                                                 const dData     : TDateTime;
                                                 const iAntPos   : Integer
                                                ): OLEVariant;
var
   sSQL  : String;
   sData : String;
begin
   sData := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')';

   sSQL :=
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL, PAR.IDPARCFINANCIMOV, PAR.NUMPARCELA, ' + #13 +
   '      VLRSALDODEVEDOR, PAR.VLRPRESTACAO, PAR.VLRJUROS, PAR.VLRJUROSPARC, '               + #13 +
   '      PAR.VLRRESIDUO, PAR.VLRCORRSALDO, PAR.VLRAMORTIZACAO, PAR.VLRPRESTATUALIZADA, '    + #13 +
   '      PAR.VLRPRESTCORRIG, PAR.VLRPAGO, PAR.VLRRESIDUOATUALI, PAR.VLRCORRIGIDOATRASO, '   + #13 +
   '      PAR.VLRMULTAATRASO, PAR.VLRMORAATRASO, PAR.IDINDCORRECAO, CON.CONVLRMORA, '        + #13 +
   '      PAR.FLGTIPOLANC, PAR.FLGLANCINTEGRA, PAR.DATALANCINTEGRA, PAR.CODDOCUMENTO, '      + #13 +
   '      PAR.DATAVENCIMENTO, PAR.DATAPAGAMENTO, CON.CONPERCENTMORA, '                       + #13 +
   '      PAR.VLRMULTACORRIG, PAR.VLRJUROSCORRIG, '                                          + #13 +
   '      PAR.VLRSALDOATUAL, PAR.VLRNOMINAL, CON.CONMOEDAMORA '                              + #13 +
   '   FROM '                                                                                + #13 +
   '      PARCFINANCIMOV PAR, '                                                              + #13 +
   '      CONDPAGIMOVEL  CPI, '                                                              + #13 +
   '      CONTRATOIMOVEL CON '                                                               + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.FLGTIPOCONTRATO <> ''L'' '                                                 + #13 +
   '      AND CON.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                 + #13 +
   '      AND CPI.IDCONDPAGIMOVEL  = ' + IntToStr(iCondPag)                                  + #13;

   case iAntPos of
      1: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO   < ' + sData                          + #13;
      2: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO  >= ' + sData                          + #13;
   end;


   case iAntPos of
      1: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO   = (SELECT MAX(PAR.DATAVENCIMENTO) '  + #13;
      2: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO   = (SELECT MIN(PAR.DATAVENCIMENTO) '  + #13;
   end;

   sSQL := sSQL + '                                  FROM   PARCFINANCIMOV PAR, '  + #13 +
                  '                                         CONDPAGIMOVEL  CPI, '  + #13 +
                  '                                  CONTRATOIMOVEL CON '  + #13 +
                  '                                  WHERE '  + #13 +
                  '                                  CON.FLGTIPOCONTRATO <> ''L'' '  + #13 +
                  '                                  AND CON.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                 + #13 +
                  '                                  AND CPI.IDCONDPAGIMOVEL  = ' + IntToStr(iCondPag)                                  + #13;
   case iAntPos of
      1: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO   < ' + sData                          + #13;
      2: sSQL := sSQL + '      AND PAR.DATAVENCIMENTO  >= ' + sData                          + #13;
   end;

   sSQL := sSQL + '                                  AND PAR.IDCONDPAGIMOVEL  = CPI.IDCONDPAGIMOVEL  '  + #13 +
                  '                                  AND CPI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL) '  + #13;

   sSQL := sSQL +
   '      AND PAR.IDCONDPAGIMOVEL  = CPI.IDCONDPAGIMOVEL '                                   + #13 +
   '      AND CPI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                                  + #13 +
   '   ORDER BY '                                                                            + #13;

   case iAntPos of
      1: sSQL := sSQL + '      PAR.DATAVENCIMENTO DESC '                                     + #13;
      2: sSQL := sSQL + '      PAR.DATAVENCIMENTO '                                          + #13;
   end;

   Result   := GetDataPacket(sSQL);
end;



function TCtrlParcFinancImov.LookupResiduoParcela(const iIdEmpresa : Integer; const dData: TDateTime): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT PF.IDPARCFINANCIMOV, '+#13+
   '       PF.IDCONDPAGIMOVEL,  '+#13+
   '       PF.CODDOCUMENTO,     '+#13+
   '       CI.IDCONTRATOIMOVEL, '+#13+
   '       TI.CODTIPIMOVEL,     '+#13+
   '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
   '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO, '+#13+
           QuotedStr(FormatDateTime('MMYYYY', dData )) + ' AS MESANO_CALCULO, '+#13+
   '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '+#13+
   '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '+#13+
   '       PF.VLRRESIDUO,         '+#13+
   '       PF.VLRRESIDUOATUALI,   '+#13+
   '       0 AS VLRRESIDUOCORRIG, '+#13+
   '       CR.DATACOBRES,         '+#13+
   '       PF.IDINDCORRECAO,      '+#13+
   '       NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP,   '+#13+
   '       PF.FLGTIPOLANC,        '+#13+
   '       PF.FLGLANCINTEGRA,     '+#13+
   '       TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') AS DATA_BASE '+#13+
   '  FROM  '+#13+
   '       PARCFINANCIMOV PF, '+#13+
   '       CONDPAGIMOVEL  CP, '+#13+
   '       CONTRATOIMOVEL CI, '+#13+

   '       (SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
   '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
   '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
   '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+
   '                     AND C.FLGTIPOCONTRATO = ''C'' ) TI,                 '+#13+
   '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '+#13+
   '                A.NUMPARCELAS    AS NUMPARCELAS,   '+#13+
   '                A.DATAINI,         '+#13+
   '                A.IDCONDPAGIMOVEL, '+#13+
   '                A.INDCORRECAO,     '+#13+
   '                A.MESREFREAJUSTE,  '+#13+
   '                DECODE(A.TIPOCONDPAG, ''V'', ''A Vista'', '+#13+
   '                                      ''S'', ''Sinal'',   '+#13+
   '                                      ''C'', ''Caução'',  '+#13+
   '                                      ''P'', ''Parcelamento'' ) AS TIPOCONDPAG '+#13+
   '         FROM   CONDPAGIMOVEL A,                  '+#13+
   '                (SELECT   IDCONDINICIAL,          '+#13+
   '                          MAX(DATAINI) AS DATAINI '+#13+
   '                 FROM     CONDPAGIMOVEL           '+#13+
   '                 GROUP BY IDCONDINICIAL) B        '+#13+
   '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '+#13+
   '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '+#13+
   '       ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
   '           FROM PARCEXTRAIMOV                             '+#13+
   '          WHERE FLGTIPOCOBRANCA = ''R''                   '+#13+
   '        ) CR                                              '+#13+
   '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10))        '+#13+
   '    AND (CI.FLGSTATUS <> ''E'')                           '+#13+
   '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)         '+#13+
   '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)       '+#13+
   '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)     '+#13+
   '    AND (TI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)       '+#13+
   '    AND (PF.IDPARCFINANCIMOV = CR.IDPARCCOBRADA(+))       '+#13+
   '  ORDER BY CI.IDCONTRATOIMOVEL, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC ';

   Result := GetDataPacket(sSQL);
end;



function TCtrlParcFinancImov.LookupAlienacao(const dData: TDateTime;
                                             const iContrato, iCondPag: Integer): OLEVariant;
var
   sSQL  : String;
   sData : String;
begin
   sData := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')';

   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +
   '   CON.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL, IMO.CODTIPIMOVEL, '                        + #13 +
   '   CON.FLGTIPOCONTRATO, CON.FLGSTATUS, CON.IDLOCATARIO, CON.CONNOME, '                   + #13 +
   '   CON.CONDATAASSINATURA, CON.CONDATAINICIO, CON.CONMOEDAMORA, '                         + #13 +
   '   CPI.INDCORRECAO, CPI.MESREFREAJUSTE, CPI.TAXAJUROS, CPI.PERIODOTAXA '                 + #13 +
   'FROM '                                                                                   + #13 +
   '   CONTRATOIMOVEL  CON, '                                                                + #13 +
   '   CONDPAGIMOVEL   CPI, '                                                                + #13 +
   '   CONTRATOXIMOVEL CXI, '                                                                + #13 +
   '   CONTRATOXMULTA  CXM, '                                                                + #13 +
   '   IMOVEL          IMO  '                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       CON.FLGTIPOCONTRATO <> ''L'' '                                                    + #13 +
   '   AND CON.FLGSTATUS        = ''V'' '                                                    + #13 +
   '   AND CPI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL '                                     + #13 +
   '   AND CON.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '                                     + #13 +
   '   AND CON.IDCONTRATOIMOVEL = CXM.IDCONTRATOIMOVEL '                                     + #13 +
   '   AND CXI.IDIMOVEL         = IMO.IDIMOVEL '                                             + #13;

   if iContrato > 0 then
      sSQL := sSQL + '   AND CON.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + #13;

   if iCondPag > 0 then
      sSQL := sSQL + '   AND CPI.IDCONDPAGIMOVEL = ' + IntToStr(iCondPag) + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOIMOVEL, CPI.IDCONDPAGIMOVEL ';

   Result   := GetDataPacket(sSQL);
end;



function TCtrlParcFinancImov.CalcAtualSaldo(const iContrato, iCondPag: Integer; const dVencto, dData: TDateTime): Extended;
var
   sSQL   : String;
   fSaldo : Extended;
begin
   fSaldo := 0;

   sSQL   :=
   'SELECT '                                                                                                    + #13 +
   '    NVL(SUM(L.VLRDIA),0) AS TOTAL '                                                                         + #13 +
   'FROM '                                                                                                      + #13 +
   '    LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                   + #13 +
   'WHERE '                                                                                                     + #13 +
   '    L.IDCONTRATOIMOVEL  = ' + IntToStr(iContrato)                                                           + #13 +
   'AND L.IDCONDPAGIMOVEL   = ' + IntToStr(iCondPag)                                                            + #13 +
   'AND L.IDOPERACAO = P.IDRECCORRECAO '                                                                        + #13 +
   'AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                     + #13 +
   'AND L.DATAOPER >= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dVencto)) + ', ''DD/MM/YYYY'')'   + #13 +
   'AND L.DATAOPER <= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'     + #13 +

   'UNION '                                                                                                     + #13 +

   'SELECT '                                                                                                    + #13 +
   '    NVL(SUM(L.VLRDIA),0) AS TOTAL '                                                                         + #13 +
   'FROM '                                                                                                      + #13 +
   '    LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                   + #13 +
   'WHERE '                                                                                                     + #13 +
   '    L.IDCONTRATOIMOVEL  = ' + IntToStr(iContrato)                                                           + #13 +
   'AND L.IDCONDPAGIMOVEL   = ' + IntToStr(iCondPag)                                                            + #13 +
   'AND L.IDOPERACAO = P.IDRECJUROS '                                                                           + #13 +
   'AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                     + #13 +
   'AND L.DATAOPER >= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dVencto)) + ', ''DD/MM/YYYY'')'   + #13 +
   'AND L.DATAOPER <= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'     + #13;

   _cds.Data := GetDataPacket(sSQL);
   while not _cds.eof do
   begin
       fSaldo := fSaldo + _cds.FieldByName('TOTAL').AsFloat;
      _cds.Next;
   end;

   Result := fSaldo;
end;



function TCtrlParcFinancImov.BuscaUltimaAtualizacao(const iContrato, iCondPag: Integer; const dData: TDateTime): TDateTime;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT MAX(DATAOPER) AS DATAOPER '                                                                          + #13 +
   'FROM LANCOPERDIAIMOB '                                                                                      + #13 +
   'WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                            + #13 +
   'AND IDCONDPAGIMOVEL = ' + IntToStr(iCondPag)                                                                + #13 +
   'AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                       + #13 +
   'AND DATAOPER <= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'     + #13;

   _cds.Data := GetDataPacket(sSQL);

   if (_cds.IsEmpty) or (_cds.FieldByName('DATAOPER').IsNull) then
      Result := -1
   else
      Result := _cds.FieldByName('DATAOPER').AsDateTime;
end;



function TCtrlParcFinancImov.BuscaUltimaParcelaGerada(const iContrato, iCondPag: Integer; const dData: TDateTime): TDateTime;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT MAX(P.DATAVENCIMENTO) AS DATAVENCIMENTO '                                                                    + #13 +
   'FROM PARCFINANCIMOV P, CONDPAGIMOVEL C '                                                                            + #13 +
   'WHERE C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                                  + #13 +
   'AND C.IDCONDPAGIMOVEL = ' + IntToStr(iCondPag)                                                                      + #13 +
   'AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL '                                                                         + #13 +
   'AND P.DATAVENCIMENTO <= ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'       + #13;

   _cds.Data := GetDataPacket(sSQL);

   if (_cds.IsEmpty) or (_cds.FieldByName('DATAVENCIMENTO').IsNull) then
      Result := -1
   else
      Result := _cds.FieldByName('DATAVENCIMENTO').AsDateTime;
end;



function TCtrlParcFinancImov.BuscaValoresUltimaAtualizacao(const iContrato, iCondPag: Integer; const dData: TDateTime;
                                                           var   fJuros    : Extended;
                                                           var   fCM       : Extended): Boolean;
var
   sSQL : String;
begin
   fJuros := 0;
   fCM    := 0;

   sSQL   :=
   'SELECT '                                                                                                    + #13 +
   '    NVL(L.VLRDIA,0) AS FCM '                                                                                + #13 +
   'FROM '                                                                                                      + #13 +
   '    LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                   + #13 +
   'WHERE '                                                                                                     + #13 +
   '    L.IDCONTRATOIMOVEL  = ' + IntToStr(iContrato)                                                           + #13 +
   'AND L.IDCONDPAGIMOVEL   = ' + IntToStr(iCondPag)                                                            + #13 +
   'AND L.IDOPERACAO = P.IDRECCORRECAO '                                                                        + #13 +
   'AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                     + #13 +
   'AND L.DATAOPER = ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'      + #13;

   _cds.Data := GetDataPacket(sSQL);
   if (not _cds.IsEmpty) or (not _cds.FieldByName('FCM').IsNull) then
      fCM := _cds.FieldByName('FCM').AsFloat;

   sSQL   :=
   'SELECT '                                                                                                    + #13 +
   '    NVL(L.VLRDIA,0) AS FJUROS '                                                                             + #13 +
   'FROM '                                                                                                      + #13 +
   '    LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                   + #13 +
   'WHERE '                                                                                                     + #13 +
   '    L.IDCONTRATOIMOVEL  = ' + IntToStr(iContrato)                                                           + #13 +
   'AND L.IDCONDPAGIMOVEL   = ' + IntToStr(iCondPag)                                                            + #13 +
   'AND L.IDOPERACAO = P.IDRECJUROS '                                                                           + #13 +
   'AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                     + #13 +   
   'AND L.DATAOPER = ' + 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'')'      + #13;

   _cds.Data := GetDataPacket(sSQL);
   if (not _cds.IsEmpty) or (not _cds.FieldByName('FJUROS').IsNull) then
      fJuros := _cds.FieldByName('FJUROS').AsFloat;

   Result := True;
end;



function TCtrlParcFinancImov.LogToFile(const sLog, sArq: String;
  const bPasta, bHora: Boolean): Boolean;
var
   Arquivo  : TextFile;
   sPasta   : String;
   sArquivo : String;
   sLinha   : String;
begin
   // ----------------------------------------------------------------------------------------------

   if sArq = '' then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   sPasta := Sistema.TempDir;

   if bPasta then
      sPasta := sPasta + 'LogEP\';

   sArquivo := sPasta + sArq;

   // ----------------------------------------------------------------------------------------------

   try
      {$I-}

      // The $I switch directive enables or disables the automatic code generation that checks the
      // result of a call to an I/O procedure. I/O procedures are described in the Object Pascal
      // Language Guide. If an I/O procedure returns a nonzero I/O result when this switch is on,
      // an EInOutError exception is raised (or the program is terminated if exception handling is
      // not enabled). When this switch is off, you must check for I/O errors by calling IOResult.

      CriaDiretorio(sPasta);
      AssignFile(Arquivo, sArquivo);

      if FileExists(sArquivo) then
      begin
         Append(Arquivo);
      end
      else
      begin
         ReWrite(Arquivo);
      end;

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';
      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      CloseFile(Arquivo);

      Result := True;

      {$I+}

   except
      Result := False;
   end;
end;


procedure TCtrlParcFinancImov.SetcdsPerda(const Value: TCMClientDataSet);
begin
  FcdsPerda := Value;
end;


function TCtrlParcFinancImov.LookupConsultaParcelas(const iIdEmpresa       : Integer;
                                                    const iIdContratoImovel: Integer   = -1;
                                                    const dDtFim           : TDateTime = -1;
                                                    const iAltCPMF         : Integer   = -1;
                                                    const iAltAdiant       : Integer   = -1;
                                                    const iTipoCliente     : Integer   = -1;
                                                    const iIdModulo        : Integer   = -1;
                                                    const iComprador       : Integer   = -1;
                                                    const iResponsavel     : Integer   = -1;
                                                    const iImovelMestre    : Integer   = -1): Olevariant;
var sSql, sData : string;
    _cdsTemp : TCMClientDataSet;
begin

   if dDtFim > 0 then
     sData := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') '
   else
     sData := 'SYSDATE';

   try
     // Cria cd Temporário
     _cdsTemp := TCMClientDataSet.Create( nil );

     sSql := 'SELECT PF.IDPARCFINANCIMOV,                                                                                        '+#13+
             '       PF.IDCONDPAGIMOVEL,                                                                                         '+#13+
             '       CI.IDCONTRATOIMOVEL,                                                                                        '+#13+
             '       CI.CONNUMERO,                                                                                               '+#13+
             '       CI.CONNOME,                                                                                                 '+#13+
             '       CI.VLRPROPOSTA,                                                                                             '+#13+
             '       CI.CONDATAINICIO,                                                                                           '+#13+
             '       CI.IDCIDADES,                                                                                               '+#13+
             '       CI.IDPAIS,                                                                                                  '+#13+
             '       CI.CODESTADO,                                                                                               '+#13+
             '       P.RAZAOSOCIAL,                                                                                              '+#13+
             '       IM.NOMEMESTRE,                                                                                              '+#13+
             '       PF.CODDOCUMENTO,                                                                                            '+#13+
             '       PF.PLNCODIGO,                                                                                               '+#13+
             '       ALT.TOT_ALTERADOR,                                                                                          '+#13+
             '       CPMF.TOT_CPMF,                                                                                              '+#13+
             '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0,                                                                         '+#13+
             '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO) ) AS NUMDOC,                         '+#13+
             '       PF.NUMPARCELA AS NUMPARC,                                                                                   '+#13+
             '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
             '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO,                              '+#13+
             '       TO_CHAR(PF.DATAVENCIMENTO,''MMYYYY'') AS MESANO_VENCIMENTO,                                                 '+#13+
                     QuotedStr(FormatDateTime('MMYYYY', dDtFim )) + ' AS MESANO_CALCULO,                                         '+#13+
             '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG,                                                                   '+#13+
             '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG,                                                                   '+#13+
             '       CPFINAL.TIPOCONDPAG,                                                                                        '+#13+
             '       CPFINAL.NUMPARCELAS,                                                                                        '+#13+
             '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO,                                                                   '+#13+
             '       PF.VLRNOMINAL,                                                                                              '+#13+
             '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) AS TOT_DEVIDO,                                                   '+#13+
             '       PF.VLRJUROS,                                                                                                '+#13+
             '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO,                                                               '+#13+
             '       PF.VLRSALDODEVEDOR,                                                                                         '+#13+
             '       PF.VLRSALDOATUAL,                                                                                           '+#13+
             '       PF.VLRPRESTATUALIZADA,                                                                                      '+#13+
             '       PF.VLRRESIDUO,                                                                                              '+#13+
             '       PF.VLRRESIDUOATUALI,                                                                                        '+#13+

             '       (NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)) as VLRRESIDUOCORRIG,                                    '+#13+
             '       CR.DATACOBRES,                                                                                              '+#13+

             '       PF.IDINDCORRECAO,                                                                                           '+#13+
             '       PF.VLRCORRIGIDOATRASO,                                                                                      '+#13+
             '       PF.VLRMULTAATRASO,                                                                                          '+#13+
             '       PF.VLRMORAATRASO,                                                                                           '+#13+
             '       NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP,                                                         '+#13+
             '       PF.FLGTIPOLANC,                                                                                             '+#13+

             '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA,                                                              '+#13+
             '              DECODE(CD2.FLGTIPO, NULL,                                                                            '+#13+
             '                     DECODE(PF.CODDOCUMENTO, NULL,                                                                 '+#13+
             '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), 2), 5) ) AS FLGLANCINTEGRA,                        '+#13+

             '       PF.DATALIMITE,                                                                                              '+#13+
             '       PP.DATAPAGAMENTO,                                                                                           '+#13+
             '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO,                                                                      '+#13+
             '       NVL(CD2.CONCILIADOC, ''N'') AS FLGCONCILIADO,                                                               '+#13+
             '       PF.IDREPACTUA,                                                                                              '+#13+
             '       CD.IDDOCDIVERGE,                                                                                            '+#13+

             '       ''                    '' AS DESCLANC,                                                                       '+#13+
             '       ''                    '' AS TIPOPARCELA,                                                                    '+#13+
             '       D.DATAEMISSAO,                                                                                              '+#13+
             '       D.DATAPROGRAMADA,                                                                                           '+#13+
             '       D.NOSSONUMERO,                                                                                              '+#13+
             '       D.TRGDTINCLUSAO AS DATA_INCLUSAO,                                                                           '+#13+
             '       L.DATALANCTO    AS DATA_LANCAMENTO,                                                                         '+#13+
             '       TO_CHAR (DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO),''MONTH'') AS MESCOMPETENCIA,          '+#13+
             '       TO_CHAR (DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO),''YYYY'') AS ANOCOMPETENCIA,           '+#13+
             '       D.IDUSUARIOINCLUSAO AS USUARIO_INCLUSAO,                                                                    '+#13+
             '       PU.NOME        AS DSC_USUARIO,                                                                              '+#13+
             '       US.NOMEUSUARIO AS NOME_USUARIO,                                                                             '+#13+
             '       PT.DESCRICAO AS DSC_FORMACOBRANCA,                                                                          '+#13+
             '       CI.CONDATAASSINATURA,                                                                                       '+#13+
             '       PA.NOME AS NOMADMINIMOVEL,                                                                                  '+#13;

             if dDtFim > 0 then
                sSql := sSql + 'TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDtFim )) + ',''DD/MM/YYYY'') AS DATA_BASE,    '+#13
             else
               sSql := sSql + ' SYSDATE as DATA_BASE,                                                                            '+#13;

             sSql := sSql + '       CO2.DTAPUR AS DATA_CORRECAO,                                                                 '+#13+
             '       DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0,                                                     '+#13+
             '          DECODE(NVL(PP.VLRPAGO,0), 0, 0,                                                                          '+#13+
             '                 NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) )) AS VLRDIF, '+#13+
             '       DECODE(CD.IDDOCDIVERGE, NULL,                                                                               '+#13+
             '          DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0,                                                  '+#13+
             '                 NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) ), NULL) AS VLRCORRIG '+#13+
             '  FROM                                                                                                             '+#13+
             '       PARCFINANCIMOV PF,                                                                                          '+#13+
             '       CONDPAGIMOVEL  CP,                                                                                          '+#13+
             '       CONTRATOIMOVEL CI,                                                                                          '+#13+
             '       PESSOA P,                                                                                                   '+#13+

             '       PORTADORFORMA PT,                                                                                           '+#13+
             '       PESSOA PU,                                                                                                  '+#13+
             '       PESSOA PA,                                                                                                  '+#13+
             '       USUARIOSISTEMA US,                                                                                          '+#13+
             '       DOCUMENTO D,                                                                                                '+#13+
             '       LANCTODOCUM L,                                                                                              '+#13+

             '       (                                                                                                           '+#13+
             '         SELECT /*+ INDEX(LD) INDEX(RP)*/                                                                          '+#13+
             '                IDPARCFINANCIMOV,                                                                                  '+#13+
             '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO,           '+#13+
             '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO                            '+#13+
             '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP                                                   '+#13+
             '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)                                                               '+#13+
             '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)                                                               '+#13+
             '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)                                                                  '+#13+
             '            AND ( (P.CODDOCUMENTO IS NULL) OR                                                                      '+#13+
             '                  (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) )          '+#13+
             '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= ' + sData + ' ) OR                               '+#13+
             '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 )           '+#13+
             '                                             AND LD.ESTORNO IS NULL                                                '+#13+
             '                                             AND LD.DATALANCTO <= ' + sData + ' ) )                                '+#13+
             '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                                                                '+#13+
             '       ) PP,                                                                                                       '+#13+

             '       ( SELECT DISTINCT                                                                                           '+#13+
             '                IDPARCFINANCIMOV,                                                                                  '+#13+
             '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVERGE                                                '+#13+
             '           FROM CONCILIADOC                                                                                        '+#13+
             '          WHERE IDPARCFINANCIMOV IS NOT NULL                                                                       '+#13+
             '            AND DATA <= ' + sData                                                                                   +#13+
             '            AND (IDDOCDIVERGE IS NOT NULL OR                                                                       '+#13+
             '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPARCFINANCIMOV                                        '+#13+
             '                                             FROM CONCILIADOC                                                      '+#13+
             '                                            WHERE IDPARCFINANCIMOV IS NOT NULL                                     '+#13+
             '                                              AND DATA <= ' + sData                                                 +#13+
             '                                              AND IDDOCDIVERGE IS NOT NULL ) )                                     '+#13+
             '       ) CD,                                                                                                       '+#13+
             // Vinicius - 03/01/2006 - verifica ordem cronologica para abonos, repactuacoes e cobranças
             '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,                                                                  '+#13+
             '                 DECODE(FLGTIPO,''M'', DECODE(QTDE,3,''S'',''P''),                                                 '+#13+
             '                                ''J'', DECODE(QTDE,3,''S'',''P''),                                                 '+#13+
             '                                ''C'', DECODE(QTDE,3,''S'',''P''),                                                 '+#13+
             '                                CONCILIADOC ) AS CONCILIADOC                                                       '+#13+
             '            FROM                                                                                                   '+#13+
             '                 ( SELECT C.IDPARCFINANCIMOV,                                                                      '+#13+
             '                          DECODE(C.FLGTIPO, NULL, NULL,                                                            '+#13+
             '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'',                  '+#13+
             '                                 ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC,                                   '+#13+
             '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS FLGTIPO, COUNT(*) AS QTDE                         '+#13+
             '                     FROM CONCILIADOC C, PARCFINANCIMOV P                                                          '+#13+
             '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV                                                  '+#13+
             '                      AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'')                                       '+#13+
             '                      AND C.DATA <= ' + sData                                                                       +#13+

             // Vinicius - 23/03/2006 - ajuste abonos contrato 000023: abono total e de multa, estava duplicando o registro
             '                      AND ( C.FLGTIPO = ''T'' OR                                                                   '+#13+
             '                            NOT EXISTS ( SELECT 1 FROM CONCILIADOC                                                 '+#13+
             '                                          WHERE FLGTIPO = ''T''                                                    '+#13+
             '                                            AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) )                          '+#13+
             // Vinicius - 23/03/2006 - Fim

             '                    GROUP BY C.IDPARCFINANCIMOV,                                                                   '+#13+
             '                             DECODE(C.FLGTIPO, NULL, NULL,                                                         '+#13+
             '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'',                  '+#13+
             '                                 ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2,                                          '+#13+
             // Vinicius - 03/01/2006 - fim
             '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,                                                                 '+#13+
             '                A.NUMPARCELAS    AS NUMPARCELAS,                                                                   '+#13+
             '                A.DATAINI,                                                                                         '+#13+
             '                A.IDCONDPAGIMOVEL,                                                                                 '+#13+
             '                A.INDCORRECAO,                                                                                     '+#13+
             '                A.MESREFREAJUSTE,                                                                                  '+#13+
             '                DECODE(A.TIPOCONDPAG, ''V'', ''A Vista'',                                                          '+#13+
             '                                      ''S'', ''Sinal'',                                                            '+#13+
             '                                      ''C'', ''Caução'',                                                           '+#13+
             '                                      ''P'', ''Parcelamento'' ) AS TIPOCONDPAG                                     '+#13+
             '         FROM   CONDPAGIMOVEL A,                                                                                   '+#13+
             '                (SELECT   IDCONDINICIAL,                                                                           '+#13+
             '                          MAX(DATAINI) AS DATAINI                                                                  '+#13+
             '                 FROM     CONDPAGIMOVEL                                                                            '+#13+
             '                 GROUP BY IDCONDINICIAL) B                                                                         '+#13+
             '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL                                                                   '+#13+
             '           AND B.DATAINI = A.DATAINI ) CPFINAL,                                                                    '+#13+

             '       ( SELECT DISTINCT                                                                                           '+#13+
             '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,                                                          '+#13+
             '                M.IMONOME            AS NOMEMESTRE,                                                                '+#13+
             '                M.IDIMOVEL           AS IDIMOVEL                                                                   '+#13+
             '           FROM CONTRATOXIMOVEL CXI,                                                                               '+#13+
             '                IMOVEL I,                                                                                          '+#13+
             '                IMOVEL M                                                                                           '+#13+
             '          WHERE CXI.IDIMOVEL = I.IDIMOVEL                                                                          '+#13+
             '            AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM,                                                                '+#13+

             '       ( SELECT /*+ INDEX(D) INDEX(LD)*/                                                                           '+#13+
             '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,                                                                   '+#13+
             '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR                         '+#13+
             '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,                                                    '+#13+
             '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,                                                  '+#13+
             '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL                                               '+#13+
             '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I                                           '+#13+
             '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                                                                 '+#13+
             '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL                                                 '+#13+
             '                     AND C.FLGTIPOCONTRATO IN (''C'',''A'') ) TC                                                   '+#13+
             '          WHERE RTRIM(LD.OPERACAO) = ''4''                                                                         '+#13+
             '            AND LD.CODALTERADOR <> ' + IntToStr(iAltCPMF)                                                           +#13;

             if iTipoCliente = 19991 then sSql := sSql +  // ADIANTAMENTO DE ALIENACAO - FUNCEF
             '           AND LD.CODALTERADOR <> ' + IntToStr(iAltAdiant)                                                          +#13;

             sSql := sSql +
             '            AND PA.IDPESSOA        = ' + IntToStr(iIdEmpresa)                                                       +#13+
             '            AND LD.CODDOCUMENTO    = D.CODDOCUMENTO                                                                '+#13+
             '            AND D.CODDOCUMENTO     = P.CODDOCUMENTO                                                                '+#13+
             '            AND P.IDCONDPAGIMOVEL  = C.IDCONDPAGIMOVEL                                                             '+#13+
             '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL                                                           '+#13+
             '            AND TC.CODTIPIMOVEL    = T.CODTIPIMOVEL                                                                '+#13+
             '            AND LD.DATALANCTO     <= ' + sData                                                                       +#13+
             '            AND ( PA.IDOPERATUALCM IS NULL OR                                                                      '+#13+
             '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND                                                            '+#13+
             '                    LD.CODALTERADOR <> T.CODALTJRAL AND                                                            '+#13+
             '                    LD.CODALTERADOR <> T.CODALTMTAL ) )                                                            '+#13+
             '            AND D.IDMODULO =  ' + IntToStr(iIdModulo)                                                               +#13+
             '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT,                                                        '+#13+

             '       ( SELECT /*+ INDEX (D) INDEX(LD) */                                                                         '+#13+
             '                LD.CODDOCUMENTO,                                                                                   '+#13+
             '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_CPMF                              '+#13+
             '           FROM LANCTODOCUM LD,                                                                                    '+#13+
             '                DOCUMENTO D                                                                                        '+#13+
             '          WHERE RTRIM(LD.OPERACAO) = ''4''                                                                         '+#13+
             '            AND CODALTERADOR    = ' + IntToStr(iAltCPMF)                                                            +#13+
             '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO                                                                   '+#13+
             '            AND D.IDMODULO = ' + IntToStr(iIdModulo)                                                                   +#13+
             '          GROUP BY LD.CODDOCUMENTO  )  CPMF,                                                                       '+#13+

             // Marchetti - 09/11/2005
             '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOCORRIG                                              '+#13+
             '           FROM ( SELECT /*+ INDEX (L) */                                                                          '+#13+
             '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRRESIDUOCORRIG                        '+#13+
             '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                                                       '+#13+
             '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                         '+#13+
             '                     AND P.IDPESSOA = ' + IntToStr(iIdEmpresa)                                                      +#13+
             '                     AND L.IDMODULO = ' + IntToStr(iIdModulo)                                                       +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                       +#13;
             sSql := sSql +
             '                     AND ( L.IDOPERACAO = P.IDOPERATUALRES )                                                       '+#13+
             '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,                                                   '+#13+
             '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) AS DTAPUR                         '+#13+
             '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2                                                     '+#13+
             '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                        '+#13+
             '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)                                              +#13+
             '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                               +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                      +#13;
                sSql := sSql +
             '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )                                                     '+#13+
             '                     AND ( DATAOPER <= ' + sData + ')                                                              '+#13+
             '                   GROUP BY L2.IDPARCFINANCIMOV ) D2                                                               '+#13+
             '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV                                                          '+#13+
             '            AND D1.DATAOPER = D2.DTAPUR                                                                            '+#13+
             '        ) AR,                                                                                                      '+#13+
             // Fim Marchetti - 09/11/2005

             // Vinicius - 11/11/2005 - Verificar data de Cobrança de resíduo
             '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES                                                         '+#13+
             '            FROM PARCEXTRAIMOV                                                                                     '+#13+
             '           WHERE FLGTIPOCOBRANCA = ''R''                                                                           '+#13+
             '         ) CR,                                                                                                     '+#13+
             // Fim Vinicius - 11/11/2005

             '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO                                                    '+#13+
             '           FROM ( SELECT /*+ INDEX (L) */                                                                          '+#13+
             '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO                            '+#13+
             '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                                                       '+#13+
             '                   WHERE L.DATABAIXA IS NOT NULL                                                                   '+#13+
             '                     AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                         '+#13+
             '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                                +#13+
             '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)                                               +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                       +#13;
             sSql := sSql +
             '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR                                                    '+#13+
             '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR                                                    '+#13+
             '                           L.IDOPERACAO = P.IDOPERATUALCM )                                                        '+#13+
             '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,                                                   '+#13+
             '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR                          '+#13+
             '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2                                                     '+#13+
             '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                        '+#13+
             '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)                                              +#13+
             '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                               +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                      +#13;
             sSql := sSql +
             '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR                                                  '+#13+
             '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR                                                  '+#13+
             '                           L2.IDOPERACAO = P2.IDOPERATUALCM )                                                      '+#13+
             '                     AND ( DATAOPER <= ' + sData + ')                                                              '+#13+
             '                   GROUP BY L2.IDPARCFINANCIMOV ) D2                                                               '+#13+
             '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV                                                          '+#13+
             '            AND D1.DATAOPER = D2.DTAPUR                                                                            '+#13+
             '       ) CO1,                                                                                                      '+#13+
             '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO                                                    '+#13+
             '           FROM ( SELECT /*+ INDEX (L) */                                                                          '+#13+
             '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO                            '+#13+
             '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P                                                       '+#13+
             '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                         '+#13+
             '                     AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                                +#13+
             '                     AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)                                               +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                       +#13;
             sSql := sSql +
             '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR                                                    '+#13+
             '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR                                                    '+#13+
             '                           L.IDOPERACAO = P.IDOPERATUALCM )                                                        '+#13+
             '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,                                                   '+#13+
             '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR                          '+#13+
             '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2                                                     '+#13+
             '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                                                                        '+#13+
             '                     AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)                                              +#13+
             '                     AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                               +#13;
             if iIdContratoImovel > 0 then
                sSql := sSql + '   AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                      +#13;
             sSql := sSql +
             '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR                                                  '+#13+
             '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS OR                                                  '+#13+
             '                           L2.IDOPERACAO = P2.IDOPERATUALCM )                                                      '+#13+
             '                     AND ( DATAOPER <= ' + sData + ')                                                              '+#13+
             '                   GROUP BY L2.IDPARCFINANCIMOV ) D2                                                               '+#13+
             '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV                                                          '+#13+
             '            AND D1.DATAOPER = D2.DTAPUR                                                                            '+#13+
             '        ) CO2                                                                                                      '+#13+
             '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))                                                              '+#13+
             '    AND (PF.IDCONDPAGIMOVEL      = CP.IDCONDPAGIMOVEL)                                                             '+#13+
             '    AND (CP.IDCONTRATOIMOVEL     = CI.IDCONTRATOIMOVEL)                                                            '+#13+
             '    AND (PF.IDCONDPAGIMOVEL      = CPFINAL.IDCONDINICIAL)                                                          '+#13+
             '    AND (P.IDPESSOA(+)           = CI.IDLOCATARIO)                                                                 '+#13+
             '    AND (PP.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (CO1.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (AR.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (CR.IDPARCCOBRADA(+)     = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (CD.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)                                                            '+#13+
             '    AND (IM.IDCONTRATOIMOVEL(+)  = CI.IDCONTRATOIMOVEL)                                                            '+#13+
             '    AND (ALT.CODDOCUMENTO(+)     = PF.CODDOCUMENTO)                                                                '+#13+
             '    AND (CPMF.CODDOCUMENTO(+)    = PF.CODDOCUMENTO)                                                                '+#13+
             '    AND (D.CODDOCUMENTO(+)       = PF.CODDOCUMENTO)                                                                '+#13+

             '    AND (D.CODPORTFORMA          = PT.CODPORTFORMA(+))                                                             '+#13+
             '    AND (D.IDUSUARIOINCLUSAO     = US.IDUSUARIO(+))                                                                '+#13+
             '    AND (D.IDUSUARIOINCLUSAO     = PU.IDPESSOA(+))                                                                 '+#13+
             '    AND (D.CODDOCUMENTO(+)       = PF.CODDOCUMENTO)                                                                '+#13+
             '    AND (L.CODDOCUMENTO(+)       = D.CODDOCUMENTO)                                                                 '+#13+
             '    AND ( (PF.CODDOCUMENTO IS NOT NULL AND TRIM(L.OPERACAO) = ''2'') OR PF.CODDOCUMENTO IS NULL )                  '+#13+
             '    AND (CI.IDADMINIMOVEL        = PA.IDPESSOA(+))                                                                 '+#13;

             if iIdContratoImovel > 0 then
                sSql := sSql + '    AND CI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)                                     +#13;
             if iComprador > 0 then
                sSql := sSql + '    AND CI.IDLOCATARIO = ' + IntToStr(iComprador)                                                 +#13;
             if iResponsavel > 0 then
                sSql := sSql + '    AND CI.IDRESPONSAVEL = ' + IntToStr(iResponsavel)                                             +#13;
             if iImovelMestre > 0 then
                sSql := sSql + '    AND IM.IDIMOVEL = ' + IntToStr(iImovelMestre)                                                 +#13;
             if dDtFim > 0 then // Marchetti - Pendencia 21541
                sSQL := sSQL +
                '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sData + ') OR                                '+#13+
                '          (PP.DATAPAGAMENTO <= ' + sData + ') )' + #13;
             // Fim Marchetti - Pendencia 21541
             sSql := sSql + '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';

     CMDebugToFile(sSql,'temp.txt');

     _cdsTemp.Data := GetDataPacket(sSql);

     while not _cdsTemp.Eof do begin

       _cdsTemp.edit;
       if _cdsTemp.FieldByName('FLGCONCILIADO').AsString = 'S' then begin
          if _cdsTemp.FieldByName('VLRPAGO').IsNull then begin
             if _cdsTemp.FieldByName('IDREPACTUA').IsNull then
                  _cdsTemp.FieldByName('DESCLANC').AsString := 'Abonado'
             else _cdsTemp.FieldByName('DESCLANC').AsString := 'Repactuado';
          end else begin
             if _cdsTemp.FieldByName('VLRDIF').AsFloat = 0 then begin
                if (_cdsTemp.FieldByName('DATAPAGAMENTO').AsDateTime > _cdsTemp.FieldByName('DATALIMITE').AsDateTime) or
                   (_cdsTemp.FieldByName('VLRPAGO').AsFloat <> _cdsTemp.FieldByName('VLRPRESTACAO').AsFloat) then begin
                   _cdsTemp.FieldByName('DESCLANC').AsString := 'Abono Total';
                end else begin
                   _cdsTemp.FieldByName('DESCLANC').AsString := '';
                end;
             end else begin
                if _cdsTemp.FieldByName('IDDOCDIVERGE').IsNull then begin
                   if _cdsTemp.FieldByName('IDREPACTUA').IsNull then
                        _cdsTemp.FieldByName('DESCLANC').AsString := 'Abonado'
                   else _cdsTemp.FieldByName('DESCLANC').AsString := 'Repactuado';
                end else begin
                   _cdsTemp.FieldByName('DESCLANC').AsString := 'Cobrança';
                end;
             end;
          end;
       end else if _cdsTemp.FieldByName('FLGCONCILIADO').AsString = 'P' then begin
          _cdsTemp.FieldByName('DESCLANC').AsString := 'Abono Parcial';
       end else if _cdsTemp.FieldByName('FLGCONCILIADO').AsString = 'C' then begin
          _cdsTemp.FieldByName('DESCLANC').AsString := 'Cobrança';
       end else begin
          _cdsTemp.FieldByName('DESCLANC').AsString := '';
       end;

     // Preenche a Descrição do Tipo de Parcela
     _cdsTemp.FieldByName('TIPOPARCELA').AsString := TipoParcela(_cdsTemp.FieldByName('FLGTIPOLANC').AsInteger,_cdsTemp.FieldByName('FLGLANCINTEGRA').AsInteger);

     _cdsTemp.Post;
     _cdsTemp.Next;

     end;

     Result :=  _cdsTemp.Data;

  finally
     FreeAndNil(_cdsTemp);
  end;

end;


function TCtrlParcFinancImov.LookupCondicoesPagamento(const iIdContratoImovel: Integer): Olevariant;
var sSql     : string;
    _cdsTemp : TCMClientDataSet;
begin

   try
     // Cria cd Temporário
     _cdsTemp := TCMClientDataSet.Create( nil );

     sSql := 'SELECT ''              '' AS CAL_TIPO,                       '+#13+
             '       ''              '' AS CAL_INTERVALO,                  '+#13+
             '       ''              '' AS CAL_PERTAXA,                    '+#13+
             '       ''              '' AS CAL_FORMA,                      '+#13+
             '       CPI.IDCONTRATOIMOVEL,                                 '+#13+
             '       CPI.IDCONDPAGIMOVEL,                                  '+#13+
             '       CPI.INDCORRECAO,                                      '+#13+
             '       M.MOESIGLA    AS DSCINDCORR,                          '+#13+
             '       CPI.IDINDCORRPROJ,                                    '+#13+
             '       MP.MOESIGLA   AS DSCINDPROJ,                          '+#13+
             '       CPI.VLRFINANC,                                        '+#13+
             '       CPI.DATAVENCIMENTO,                                   '+#13+
             '       CPI.DATACARENCIA,                                     '+#13+
             '       CPI.DATAINIAMORTIZ,                                   '+#13+
             '       CPI.DATAINI,                                          '+#13+
             '       CPI.DATAFIM,                                          '+#13+
             '       CPI.PRAZO,                                            '+#13+
             '       CPI.PERIODO,                                          '+#13+
             '       CPI.TAXAJUROS,                                        '+#13+
             '       CPI.PERIODOTAXA,                                      '+#13+
             '       CPI.NUMPARCELAS,                                      '+#13+
             '       CPI.TIPOCONDPAG,                                      '+#13+
             '       CPI.IDCONDINICIAL,                                    '+#13+
             '       CPI.MESREFREAJUSTE,                                   '+#13+
             '       CPI.FORMACALCULO,                                     '+#13+
             '       CPI.PERINDPROJ,                                       '+#13+
             '       CPI.FLGJURCARENCIA,                                   '+#13+
             '       CPI.PERIODOREAJUSTE                                   '+#13+
             '  FROM                                                       '+#13+
             '       CONDPAGIMOVEL CPI,                                    '+#13+
             '       MOEDA M,                                              '+#13+
             '       MOEDA MP                                              '+#13+
             '  WHERE                                                      '+#13+
             '       (M.MOECODIGO(+) = CPI.INDCORRECAO)                    '+#13+
             '       AND (MP.MOECODIGO(+) = CPI.IDINDCORRPROJ)             '+#13+
             '       AND CPI.IDCONTRATOIMOVEL = ' +  IntToStr(iIdContratoImovel) +#13;

     _cdsTemp.Data := GetDataPacket(sSql);

     while not _cdsTemp.Eof do begin
       _cdsTemp.edit;

       if _cdsTemp.FieldByName('PERIODOTAXA').AsString = 'M' then
            _cdsTemp.FieldByName('CAL_PERTAXA').AsString := FormatFloat('##0.0000000000', _cdsTemp.FieldByName('TAXAJUROS').AsFloat) +  '% Mês';
       if _cdsTemp.FieldByName('PERIODOTAXA').AsString = 'A' then
            _cdsTemp.FieldByName('CAL_PERTAXA').AsString := FormatFloat('##0.0000000000', _cdsTemp.FieldByName('TAXAJUROS').AsFloat) +  '% Ano Simp';
       if _cdsTemp.FieldByName('PERIODOTAXA').AsString = 'C' then
            _cdsTemp.FieldByName('CAL_PERTAXA').AsString := FormatFloat('##0.0000000000', _cdsTemp.FieldByName('TAXAJUROS').AsFloat) +  '% Ano Comp';

       if _cdsTemp.FieldByName('PERIODO').AsFloat = 1 then begin
          if _cdsTemp.FieldByName('PRAZO').AsString = 'M' then
               _cdsTemp.FieldByName('CAL_INTERVALO').AsString := FormatFloat('##0', _cdsTemp.FieldByName('PERIODO').AsFloat) +  ' Mês'
          else _cdsTemp.FieldByName('CAL_INTERVALO').AsString := FormatFloat('##0', _cdsTemp.FieldByName('PERIODO').AsFloat) +  ' Ano';
       end else begin
          if _cdsTemp.FieldByName('PRAZO').AsString = 'M' then
               _cdsTemp.FieldByName('CAL_INTERVALO').AsString := FormatFloat('##0', _cdsTemp.FieldByName('PERIODO').AsFloat) +  ' Meses'
          else _cdsTemp.FieldByName('CAL_INTERVALO').AsString := FormatFloat('##0', _cdsTemp.FieldByName('PERIODO').AsFloat) +  ' Anos';
       end;

       if _cdsTemp.FieldByName('TIPOCONDPAG').AsString = 'S' then _cdsTemp.FieldByName('CAL_TIPO').AsString := 'Sinal';
       if _cdsTemp.FieldByName('TIPOCONDPAG').AsString = 'V' then _cdsTemp.FieldByName('CAL_TIPO').AsString := 'A Vista';
       if _cdsTemp.FieldByName('TIPOCONDPAG').AsString = 'C' then _cdsTemp.FieldByName('CAL_TIPO').AsString := 'Caução';
       if _cdsTemp.FieldByName('TIPOCONDPAG').AsString = 'P' then _cdsTemp.FieldByName('CAL_TIPO').AsString := 'Parc.';
       if _cdsTemp.FieldByName('TIPOCONDPAG').AsString = 'R' then _cdsTemp.FieldByName('CAL_TIPO').AsString := 'Repac.';

       _cdsTemp.Post;
       _cdsTemp.Next;
     end;

     Result := _cdsTemp.Data;
   finally
      FreeAndNil(_cdsTemp);
   end;

end;


//========================================================================================
// Função para Retornar a Descrição do Tipo de Parcela
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iFlgTipo     : Nr. do Tipo de Parcela
//       iFlgIntegra  : Nr. do Flag de Integração ou (-1)
//
// Retorno : Descrição do Tipo de Parcela
//----------------------------------------------------------------------------------------
function TCtrlParcFinancImov.TipoParcela(const iFlgTipo, iFlgIntegra: Integer): String;
var sDesc : String;
begin

 // Alterar esta função também na UFuncAlienacao (Alienação)
 // Marcos Topini em 14/06/2006

{
TIPOS - 1 -> Saldo Inicial            INTEGRAÇÃO - NULL -> Não Integrado
        2 -> Sinal                                    1 -> Integrado Parcial ( Projeção )
        3 -> Parcela Gerada                           2 -> Integrado Total
        4 -> Parcela Projetada                        3 -> Lançamento de Baixa Manual
        5 -> Amortização Extra                        4 -> Lançamento de Baixa Migrado
        6 -> Acerto Divergencias                      5 -> Repactuada Total
        7 -> Pagamento de Venda a Vista               6 -> Repactuada Parcial
        8 -> Caução                                   7 -> Associado ao Adminimob
        9 -> Parcela Antecipada
       10 -> Pagamento de Resíduo
       11 -> Atualização de Saldo
       12 -> Ajuste de Saldo
}

   // situacao original sem integracao
   sDesc := '';
   case iFlgTipo of
      1 : sDesc := 'Saldo Inicial';
      2 : sDesc := 'Sinal';
      3 : sDesc := 'Parc. Gerada';
      4 : sDesc := 'Parc. Projetada';
      5 : sDesc := 'Amort. Extra';
      6 : sDesc := 'Acerto Divergência';
      7 : sDesc := 'Venda a Vista';
      8 : sDesc := 'Caução';
      9 : sDesc := 'Parc. Antecipada';
     10 : sDesc := 'Pagto Resíduo';
     11 : sDesc := 'Atualização de Saldo';
     12 : sDesc := 'Ajuste de Saldo';
   end;

   // considerar integracao total das parcelas geradas ( -1 não considera a integração )
   if iFlgIntegra <> -1 then begin

      if iFlgIntegra = 1 then begin    // considerar apenas para as projetadas
         case iFlgTipo of
            4 : sDesc := 'Proj. Integrada';
         end;
      end;

      if iFlgIntegra = 2 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integrado';
            3 : sDesc := 'Parc. Integrada';
            4 : sDesc := 'Proj. Integrada';
            5 : sDesc := 'Amort.Integrada';
            6 : sDesc := 'Acerto Integrado';
            7 : sDesc := 'A Vista Integrado';
            8 : sDesc := 'Caução Integrada';
            9 : sDesc := 'Antecip.Integrada';
           10 : sDesc := 'Pagto.Resíduo Integrado';
         end;
      end;
      if iFlgIntegra = 3 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Man';
            3 : sDesc := 'Parc. Baix.Man';
            4 : sDesc := 'Proj. Baix.Man';
            5 : sDesc := 'Amort.Baix.Man';
            6 : sDesc := 'Acerto Baix.Man';
            7 : sDesc := 'A Vista Baix.Man';
            8 : sDesc := 'Caução Baix.Man';
            9 : sDesc := 'Antecip.Baix.Man';
           10 : sDesc := 'Pagto.Resíduo Baix.Man';
         end;
      end;

      if iFlgIntegra = 4 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Mig';
            3 : sDesc := 'Parc. Baix.Mig';
            4 : sDesc := 'Proj. Baix.Mig';
            5 : sDesc := 'Amort.Baix.Mig';
            6 : sDesc := 'Acerto Baix.Mig';
            7 : sDesc := 'A Vista Baix.Mig';
            8 : sDesc := 'Caução Baix.Mig';
            9 : sDesc := 'Antecip.Baix.Mig';
           10 : sDesc := 'Pagto.Resíduo Baix.Mig';
         end;
      end;

      if iFlgIntegra = 5 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 6 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 7 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integ. Adm';
            3 : sDesc := 'Parc. Integ. Adm';
            4 : sDesc := 'Proj. Integ. Adm';
            5 : sDesc := 'Amort.Integ. Adm';
            6 : sDesc := 'Acerto Integ. Adm';
            7 : sDesc := 'A Vista Integ. Adm';
            8 : sDesc := 'Caução Integ. Adm';
            9 : sDesc := 'Antecip.Integ. Adm';
           10 : sDesc := 'Pagto.Resíduo Integ. Adm';
         end;
      end;

   end;
   Result := sDesc;
end;


function TCtrlParcFinancImov.LookupMultaJuros(const iIdContratoImovel: Integer): Olevariant;
var sSql : String;
begin
    sSql := 'SELECT MJ.IDCONTRATOXMULTA,                      '+#13+
            '       MJ.IDCONTRATOIMOVEL,                      '+#13+
            '       MJ.IDINDCORRECAO,                         '+#13+
            '       M.MOESIGLA AS DSCINDCORR,                 '+#13+
            '       MJ.MOEDAJUROS,                            '+#13+
            '       MP.MOESIGLA AS DSCMOEJUROS,               '+#13+
            '       MJ.MOEDAMULTA,                            '+#13+
            '       MD.MOESIGLA AS DSCMOEMULTA,               '+#13+
            '       MJ.FLGINDETERMINADO,                      '+#13+
            '       MJ.VLRMULTA,                              '+#13+
            '       MJ.PERCMULTA,                             '+#13+
            '       MJ.VLRJUROS,                              '+#13+
            '       MJ.PERCJUROS,                             '+#13+
            '       MJ.PERIODOJUROS,                          '+#13+
            '       MJ.FLGJUROSPROPORC,                       '+#13+
            '       MJ.DATAINI,                               '+#13+
            '       MJ.DATAFIM,                               '+#13+
            '       MJ.MESREFCORRECAO,                        '+#13+
            '       MJ.DIASTOLERANCIA,                        '+#13+
            '       MJ.DIASREPASSE,                           '+#13+
            '       MJ.FLGTIPODIATOLERA,                      '+#13+
            '       MJ.FLGTIPODIAREPASS,                      '+#13+
            '       DECODE(MJ.PERIODOJUROS,''D'',''Diário'',''M'',''Mensal'','''')                AS DSCPERIODOJUROS,     '+#13+
            '       DECODE(MJ.FLGTIPODIATOLERA,''C'',''Dias Corridos'',''U'',''Dias Úteis'','''') AS DSCTIPODIATOLERA,    '+#13+
            '       DECODE(MJ.FLGTIPODIAREPASS,''C'',''Dias Corridos'',''U'',''Dias Úteis'','''') AS DSCTIPODIAREPASS     '+#13+
            'FROM                                                                                                         '+#13+
            '     CONTRATOXMULTA MJ,                          '+#13+
            '     MOEDA M,                                    '+#13+
            '     MOEDA MP,                                   '+#13+
            '     MOEDA MD                                    '+#13+
            'WHERE                                            '+#13+
            '     MJ.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel)   +#13+
            '  AND(M.MOECODIGO(+)     = MJ.IDINDCORRECAO)                '+#13+
            '  AND(MP.MOECODIGO(+)    = MJ.MOEDAJUROS)                   '+#13+
            '  AND(MD.MOECODIGO(+)    = MJ.MOEDAMULTA)                   '+#13;

    Result := GetDataPacket(sSql);

end;


function TCtrlParcFinancImov.LookupCorrecao(const CodDocumento: Integer): Olevariant;
var sSql : String;
begin
    sSql := 'SELECT L.IDOPERACAO,                            '+#13+
            '       L.DATAOPER,                              '+#13+
            '       T.DESCCUSTORECIMO,                       '+#13+
            '       L.DATABAIXA,                             '+#13+
            '       L.VLRDIA,                                '+#13+
            '       L.VLRACUM                                '+#13+
            '  FROM LANCOPERDIAIMOB L,                       '+#13+
            '       TIPOCUSTORECIMOV T                       '+#13+
            ' WHERE L.IDOPERACAO   = T.IDTIPOCUSTORECIMO     '+#13+
            '   AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND L.CODDOCUMENTO = ' + IntToStr(CodDocumento) +#13+
            '   AND L.IDOPERACAO IN(148,149,150)             '+#13+
            ' ORDER BY DATAOPER DESC                         '+#13;

    Result := GetDataPacket(sSql);

end;


function TCtrlParcFinancImov.LookupAltradoresBaixas(const CodDocumento,CodAlterador: Integer): Olevariant;
var sSql   : String;
begin
    sSql := 'SELECT LD.CODDOCUMENTO,                                     '+#13+
            '       LD.NUMLANCTO,                                        '+#13+
            '       LD.CODALTERADOR, LD.PLNCODIGO,                       '+#13+
            '       LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,         '+#13+
            '       LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,           '+#13+
            '       R.DATABAIXA,                                         '+#13+
            '       DECODE(RTRIM(LD.OPERACAO),''4'',A.DESCRICAO,         '+#13+
            '             ''LANÇAMENTO DE BAIXA'') AS DESCRICAO,         '+#13+
            '       D.NODOCUMENTO,                                       '+#13+
            '       P.NOME, LD.TRGDTINCLUSAO                             '+#13+
            '  FROM                                                      '+#13+
            '       LANCTODOCUM LD,                                      '+#13+
            '       TIPOALTERADOR A,                                     '+#13+
            '       DOCUMENTO D,                                         '+#13+
            '       PESSOA P,                                            '+#13+
            '       RECBTOPAGTO R                                        '+#13+
            ' WHERE                                                      '+#13+
            '       ( LD.CODDOCUMENTO = ' + IntToStr(CODDOCUMENTO) + ' ) '+#13+
            '       AND ( RTRIM(LD.OPERACAO) in(''4'',''5'') )           '+#13+
            '       AND ( LD.CODALTERADOR = A.CODALTERADOR(+) )          '+#13+
            '       AND ( LD.CODDOCUMENTO = R.CODDOCUMENTO(+) )          '+#13+
            '       AND ( LD.NUMLANCTO    = R.NUMLANCTO(+) )             '+#13+
            '       AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )             '+#13+
            '       AND ( P.IDPESSOA      = LD.IDUSUARIOINCLUSAO)        '+#13+
            'ORDER BY                                                    '+#13+
            '   LD.DATALANCTO, A.DESCRICAO                               '+#13;

    Result := GetDataPacket(sSql);
end;

// Daniel - 9730 - Início ------------------------------------------------------
function TCtrlParcFinancImov.LookupInadSintetico(const iIdContrato: Integer; const dData: TDateTime): OleVariant;
var sSql, sParam : string;
begin
   sSql   := 'SELECT (CI.CONNUMERO || '' - '' || CI.CONNOME) AS NOMECONTRATO, '                                                                                         +#13;

      if (CtrlModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
         (CtrlModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
         (CtrlModuloImobiliario.Alienacao.iTipoOperAtualCM    > 0) then
      begin
         sSql := sSql +
           '       SUM(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 )  - NVL( PP.VLRPAGO, 0 ) + ' +#13+
           '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + NVL(JS.VLRMORASALDO,0))  AS TOTDEVIDO '                                                     +#13;
      end
      else
      begin
         sSql := sSql +
           '       SUM(DECODE(PF.CODDOCUMENTO, NULL, DECODE(PF.FLGCONCILIADO, ''S'', 0, ''C'', 0, NVL(PF.VLRPRESTACAO,0) - NVL(PP.VLRPAGO,0) ), '                       +#13+
           '              NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) )) AS TOTDEVIDO '                                              +#13;
      end;

      sSql := sSql +
           '  FROM PARCFINANCIMOV PF, '                                                                                                                                 +#13+
           '       CONDPAGIMOVEL  CP, '                                                                                                                                 +#13+
           '       CONTRATOIMOVEL CI, '                                                                                                                                 +#13+
           '       PESSOA P,          '                                                                                                                                 +#13+

           '       ( '                                                                                                                                                  +#13+
           '         SELECT /*+ INDEX(LD) INDEX(RP)*/ '                                                                                                                 +#13+
           '                IDPARCFINANCIMOV, '+#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '                                                  +#13+
           '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '                                                                   +#13+
           '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '                                                                                          +#13+
           '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '                                                                                                      +#13+
           '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '                                                                                                      +#13+
           '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '                                                                                                      +#13+
           '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) OR '     +#13+
           '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '                                                  +#13+
           '                                             AND LD.ESTORNO IS NULL '                                                                                       +#13+
           '                                             AND LD.DATALANCTO <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ' ) ) ) '                    +#13+
           '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO '                                                                                                       +#13+
           '       ) PP, '                                                                                                                                              +#13+

           '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '                                                                                                        +#13+
           '                A.NUMPARCELAS    AS NUMPARCELAS, '                                                                                                          +#13+
           '                A.DATAINI, '                                                                                                                                +#13+
           '                A.IDCONDPAGIMOVEL '                                                                                                                         +#13+
           '           FROM CONDPAGIMOVEL A, '                                                                                                                          +#13+
           '                (SELECT IDCONDINICIAL, '                                                                                                                    +#13+
           '                        MAX(DATAINI) AS DATAINI '                                                                                                           +#13+
           '                   FROM CONDPAGIMOVEL '                                                                                                                     +#13+
           '                  GROUP BY IDCONDINICIAL) B '                                                                                                               +#13+
           '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL '                                                                                                         +#13+
           '            AND B.DATAINI       = A.DATAINI ) CPFINAL, '                                                                                                    +#13+

//----------

           '       ( '                                                                                                                                                  +#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOATRASO '                                                                                     +#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                   +#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOATRASO '                                                                 +#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                  +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                                                                            +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '                                                                                                    +#13+
           '                AND L.DATABAIXA IS NOT NULL '                                                                                                               +#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                             +#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                   +#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                  +#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                         +#13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '                                                                                                  +#13+
           '                AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                        +#13+
           '                AND L2.DATABAIXA IS NOT NULL '                                                                                                              +#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                         +#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                  +#13+
           '                AND D1.DATAOPER = D2.DTAPUR '                                                                                                               +#13+
           '       ) CMA, '                                                                                                                                             +#13+

           '       ( '                                                                                                                                                  +#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRASO '                                                                                         +#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                   +#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTAATRASO '                                                                      +#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                  +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '                                                                                                 +#13+
           '                AND L.DATABAIXA IS NOT NULL '                                                                                                               +#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                             +#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                   +#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                  +#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                          +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                         +#13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '                                                                                               +#13+
           '                AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                        +#13+
           '                AND L2.DATABAIXA IS NOT NULL '                                                                                                              +#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                         +#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                  +#13+
           '         AND D1.DATAOPER = D2.DTAPUR '                                                                                                                      +#13+
           '       ) MA, '                                                                                                                                              +#13+

           '       ( '                                                                                                                                                  +#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '                                                                                           +#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                    +#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORAATRASO '                                                                        +#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                   +#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                    +#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                            +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '               AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                           +#13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '                                                                                                  +#13+
           '               AND L.DATABAIXA IS NOT NULL '                                                                                                                +#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                              +#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                    +#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                 +#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '               AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '                                                                                                +#13+
           '               AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                         +#13+
           '               AND L2.DATABAIXA IS NOT NULL '                                                                                                               +#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                          +#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                   +#13+
           '        AND D1.DATAOPER = D2.DTAPUR '                                                                                                                       +#13+
           '       ) JA, '                                                                                                                                              +#13+

//----------

           '       ( '                                                                                                                                                  +#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOSALDO '                                                                                      +#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                   +#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOSALDO '                                                                  +#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                  +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                                                                            +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '                                                                                                    +#13+
           '                AND L.DATABAIXA IS NULL '                                                                                                                   +#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                             +#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                   +#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                  +#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                         +#13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '                                                                                                  +#13+
           '                AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                        +#13+
           '                AND L2.DATABAIXA IS NULL '                                                                                                                  +#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                         +#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                  +#13+
           '                AND D1.DATAOPER = D2.DTAPUR '                                                                                                               +#13+
           '       ) CMS, '                                                                                                                                             +#13+

           '       ( '                                                                                                                                                  +#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO '                                                                                          +#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                   +#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTASALDO '                                                                       +#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                  +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '                                                                                                 +#13+
           '                AND L.DATABAIXA IS NULL '                                                                                                                   +#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                             +#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                   +#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                +#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                  +#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                          +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                         +#13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '                                                                                               +#13+
           '                AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                        +#13+
           '                AND L2.DATABAIXA IS NULL '                                                                                                                  +#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                         +#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                  +#13+
           '         AND D1.DATAOPER = D2.DTAPUR '                                                                                                                      +#13+
           '       ) MS, '                                                                                                                                              +#13+

           '       ( '                                                                                                                                                  +#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '                                                                                            +#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '                                                                                                                    +#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORASALDO '                                                                         +#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '                                                                                                   +#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                    +#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                            +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '               AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                           +#13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '                                                                                                  +#13+
           '               AND L.DATABAIXA IS NULL '                                                                                                                    +#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '                                                                                              +#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '                                                                    +#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '                                                                                                 +#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '                                                                                                                   +#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa)                                                                                           +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '               AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                          +#13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '                                                                                                +#13+
           '               AND ( DATAOPER <= TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dData )) + ',''DD/MM/YYYY'') ) '                                         +#13+
           '               AND L2.DATABAIXA IS NULL '                                                                                                                   +#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '                                                                                                          +#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '                                                                                                   +#13+
           '        AND D1.DATAOPER = D2.DTAPUR '                                                                                                                       +#13+
           '       ) JS, '                                                                                                                                              +#13+

           '       ( SELECT DISTINCT '                                                                                                                                  +#13+
           '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '                                                                                                 +#13+
           '                M.IMONOME   AS NOMEMESTRE, '                                                                                                                +#13+
           '                M.IDIMOVEL  AS IDIMOVELMESTRE, '                                                                                                            +#13+
           '                C.UF AS UF '                                                                                                                                +#13+
           '           FROM CONTRATOXIMOVEL CXI, '                                                                                                                      +#13+
           '                IMOVEL I, '                                                                                                                                 +#13+
           '                IMOVEL M, '                                                                                                                                 +#13+
           '                CIDADES C '                                                                                                                                 +#13+
           '          WHERE CXI.IDIMOVEL = I.IDIMOVEL '                                                                                                                 +#13+
           '           AND  M.IDCIDADES = C.IDCIDADES(+) '                                                                                                              +#13+
           '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM '                                                                                                        +#13+
           '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9)) '                                                                                                             +#13+
           '    AND (NVL(PF.FLGCONCILIADO,''N'') = ''N'') '                                                                                                             +#13+
           '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL) '                                                                                                         +#13+
           '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '                                                                                                       +#13+
           '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL) '                                                                                                     +#13+
           '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '                                                                                                    +#13+
           '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+)) '                                                                                                    +#13+
           '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+)) '                                                                                                    +#13+
           '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+)) '                                                                                                   +#13+
           '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+)) '                                                                                                    +#13+
           '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+)) '                                                                                                    +#13+
           '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+)) '                                                                                                   +#13+
           '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO) '                                                                                                                  +#13+
           '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '                                                                                                    +#13;

           if iIdContrato > 0 then
             sSQL := sSQL +
           '    AND CI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)                                                                                                     +#13;

           sSQL := sSQL +
           'GROUP BY P.RAZAOSOCIAL, (CI.CONNUMERO || '' - '' || CI.CONNOME) '                                                                                           +#13;

   Result := GetDataPacket(sSql);

end;
// Daniel - 9730 - Fim ------------------------------------------------------

end.


