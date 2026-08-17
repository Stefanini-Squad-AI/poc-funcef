{-------------------------------------------------------------------------------

      OBJETO DE CONTROLE DE PARÂMETRIZAÇÃO DE MULTAS E JUROS  ( MT )

      Módulo               :  Comuns Imobiliário ( CMImobiliarioObj50 )
      Analista Responsável :  Daniel Simões Braga
      Data de Término      :  00/00/2007

--------------------------------------------------------------------------------
SOL         : 136341
Kintana     : 815095
Responsável : Helen V. Bianchi
Data        : 09/10/2011
Descrição   : BuscaParamMulta , AbreQueryMulta adicioanado parametro CODDOCUMENTO
--------------------------------------------------------------------------------
      Pendência   : 22687 e 26104
      Descrição   : 14/08/2007 - 3º CtrlObject criada para controlar todo o
                                    procedimento de parametrização de Multas e
                                    Juros que antes eram executados na
                                    'CtrlContratoImovel'.

                    20/03/2007 - 2º Implementação das funções AbreQueryMulta e
                                    BuscaParamMulta.

                    28/01/2007 - 1º Implementação da função "LookupMultaJuros" e
                                    gravação dos juros e multas na tabela
                                    CONTRATOXMULTA no form "fCadContratoImovel".

--------------------------------------------------------------------------------
FUNÇÕES PUBLICADAS -------------------------------------------------------------
--------------------------------------------------------------------------------

LookupMultaJuros     - Busca os cadastros de Juros e Multas relacionados ao
                       contrato de locação.
AbreQueryMulta       - Abre a query Juros e Multas relacionados ao contrato de
                       locação em função da função 'BuscaParamMulta'.
BuscaParamMulta      - Busca parametrização de cadastros de Juros e Multa
                       relacionados ao Contrato e/ou Tipo de Receita dentro do
                       período de vigência informado.
LimpaQueryMultaJuros - "Zera" os parâmetros de parametrização de Multas e Juros.

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlParamMulta;

interface

uses SysUtils, dbClient, DB, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uDiasUteis, uCMTypes, uComunsImobiliario, uCtrlModuloImobiliario,
     uVerificaPreenchimento, uCMFileUtils, uDbContratoXMulta;

type
  TParamMulta = record
    iContrato           : Integer;
    iIndiceCorrecao     : Integer;
    iTipoReceita        : Integer;
    iMesRefCorrecao     : Integer;
    iDiasTolerancia     : Integer;
    iDiasRepasse        : Integer;
    iMoeMulta           : Integer;
    iMoeJuros           : Integer;

    fVlrMulta           : Double;
    fVlrJuros           : Double;
    fPercMulta          : Double;
    fPercJuros          : Double;

    dDataInicio         : TDateTime;
    dDataFim            : TDateTime;

    sPeriodoJuros       : String;
    sDscCorrecao        : String;
    sDscMulta           : String;
    sDscJuros           : String;
    sDscTipoReceita     : String;
    sFlgJurosProporc    : String;
    sFlgTipoDiasTolera  : String;
    sFlgTipoDiasRepasse : String;
  end;

  TCtrlParamMulta = class(TCMControlObject)

  private
    FCdsContratoXMulta : TCMClientDataSet;
    FDbContratoXMulta  : TDbContratoXMulta;

    procedure SetCdsContratoXMulta(const Value: TCMClientDataSet);
    procedure SetDbContratoXMulta(const Value: TDbContratoXMulta);

  protected
    procedure AfterInitialize;   override;
    procedure OnCreateAppServer; override;

  public
    constructor Create (const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer;
                        const bUsaPlanoPatro:Boolean); reintroduce;
    destructor  Destroy; override;

    property CdsContratoXMulta : TCMClientDataSet  read FCdsContratoXMulta write SetCdsContratoXMulta;
    property DbContratoXMulta  : TDbContratoXMulta read FDbContratoXMulta  write SetDbContratoXMulta;

    function LookupMultaJuros(const iIdContratoImovel:Integer=-1): Olevariant;
    function AbreQueryMulta(var rParamMulta:TParamMulta;
                            const iIdContratoImovel:Integer=-1;
                            const iIdTipoReceita:Integer=-1;
                            const dData:TDateTime=-1;
                            const iCodDocumento: Integer = -1 //Helen - SOL: 136341 Kintana : 815095
                            ): OleVariant;
    function BuscaParamMulta(var rParamMulta:TParamMulta;
                             const iIdContratoImovel:Integer=-1;
                             const iIdTipoReceita:Integer=-1;
                             const dData:TDateTime=-1;
                             const iCodDocumento: Integer = -1 //Helen - SOL: 136341 Kintana : 815095
                             ): Boolean;

    procedure LimpaQueryMultaJuros(var rParamMulta:TParamMulta);

  published

  end;

implementation

{ TCtrlParamMulta }

function TCtrlParamMulta.AbreQueryMulta(var rParamMulta:TParamMulta;
                                        const iIdContratoImovel,iIdTipoReceita:Integer;
                                        const dData:TDateTime;
                                        const iCodDocumento: Integer //Helen - SOL: 136341 Kintana : 815095 - Add iCodDocumento
                                        ): OleVariant;
var sSql, sParam : String;
begin
  sSql   := '';
  sParam := '';
  //Quando o tipo de Receita = 196 (Confissão de Divida) , o Sistema deverá levar em
  //consideração os dados da Table CONFISSAOXCONDICAO
  if (iIdTipoReceita <> 196)  then  //Helen - SOL: 136341 Kintana : 815095
  begin
      if (iIdContratoImovel<>-1) then
        sParam := sParam+'  AND CXM.IDCONTRATOIMOVEL = '+QuotedStr(IntToStr(iIdContratoImovel))+#13
      else
        sParam := sParam+'  AND CXM.IDCONTRATOIMOVEL IS NULL '+#13;

      if (iIdTipoReceita<>-1) then
        sParam := sParam+'  AND CXM.IDTIPOCUSTORECIMO = '+QuotedStr(IntToStr(iIdTipoReceita))+#13
      else
        sParam := sParam+'  AND CXM.IDTIPOCUSTORECIMO IS NULL '+#13;

      sSql := 'SELECT CXM.IDCONTRATOXMULTA,            CXM.IDCONTRATOIMOVEL,       CXM.IDINDCORRECAO,               CXM.MOEDAJUROS, '                  +#13+
              '       CXM.MOEDAMULTA,                  CXM.FLGINDETERMINADO,       NVL(CXM.VLRMULTA,0) AS VLRMULTA, CXM.PERCMULTA, '                   +#13+
              '       NVL(CXM.VLRJUROS,0) AS VLRJUROS, CXM.PERCJUROS,              CXM.PERIODOJUROS,                CXM.FLGJUROSPROPORC, '             +#13+
              '       CXM.DATAINI,                     CXM.DATAFIM,                CXM.MESREFCORRECAO,              CXM.DIASTOLERANCIA, '              +#13+
              '       CXM.DIASREPASSE,                 CXM.FLGTIPODIATOLERA,       CXM.FLGTIPODIAREPASS,            CXM.IDTIPOCUSTORECIMO, '           +#13+
              '       M.MOESIGLA AS DSCINDCORR,        MP.MOESIGLA AS DSCMOEJUROS, MD.MOESIGLA AS DSCMOEMULTA,      TR.DESCCUSTORECIMO '               +#13+
              'FROM CONTRATOXMULTA CXM, MOEDA M, MOEDA MP, MOEDA MD, TIPOCUSTORECIMOV TR '                                                             +#13+
              'WHERE ( TR.IDTIPOCUSTORECIMO(+) = CXM.IDTIPOCUSTORECIMO ) '                                                                             +#13+
              '  AND ( M.MOECODIGO(+)          = CXM.IDINDCORRECAO     ) '                                                                             +#13+
              '  AND ( MP.MOECODIGO(+)         = CXM.MOEDAJUROS        ) '                                                                             +#13+
              '  AND ( MD.MOECODIGO(+)         = CXM.MOEDAMULTA        ) '                                                                             +#13+
              '  AND ( (CXM.DATAFIM IS NOT NULL AND TO_DATE('+QuotedStr(DateToStr(dData))+',''DD/MM/YYYY'') BETWEEN CXM.DATAINI AND CXM.DATAFIM ) OR ' +#13+
              '        (CXM.DATAFIM IS NULL AND TO_DATE('+QuotedStr(DateToStr(dData))+',''DD/MM/YYYY'') >= CXM.DATAINI) ) '                            +#13+
              sParam;

  end    //Helen - SOL: 136341 Kintana : 815095 - Inicio
  else
  begin
      if (iIdContratoImovel<>-1) then
        sParam := sParam+'  AND CXM.IDCONTRATOIMOVEL =  '+QuotedStr(IntToStr(iIdContratoImovel))+#13;
      if (iCodDocumento<>-1) then
        sParam := sParam+'  AND CD.CODDOCUMENTO =       '+QuotedStr(IntToStr(iCodDocumento))+#13
      else
        sParam := sParam+'  AND CD.CODDOCUMENTO = 0     '#13;
      if (iIdTipoReceita<>-1) then
        sParam := sParam+'  AND TR.IDTIPOCUSTORECIMO  =  '+QuotedStr(IntToStr(iIdTipoReceita))+#13;

      sSql := ' SELECT CXM.IDCONTRATOXMULTA,   CXM.IDCONTRATOIMOVEL,    CC.INDCORRECAO as IDINDCORRECAO,    CXM.MOEDAJUROS, '  +#13+
              '       CXM.MOEDAMULTA, ''''  AS FLGINDETERMINADO, (0) AS VLRMULTA,  CC.TAXAMULTA AS PERCMULTA,'                 +#13+
              '       (0) AS VLRJUROS, CC.TAXAJUROS AS PERCJUROS,  CC.PERIODOTAXA AS PERIODOJUROS, '' ''  AS FLGJUROSPROPORC,'  +#13+
              '       CC.INICIOCONFISSAO AS DATAINI,Cast(null AS date) as DATAFIM, CC.MESREFREAJUSTE as MESREFCORRECAO,(0) AS DIASTOLERANCIA,'+#13+
              '       (0) AS DIASREPASSE,'' ''  AS FLGTIPODIATOLERA,'' ''  AS FLGTIPODIAREPASS,TR.IDTIPOCUSTORECIMO,'             +#13+
              '       M.MOESIGLA AS DSCINDCORR, MP.MOESIGLA AS DSCMOEJUROS,  MD.MOESIGLA AS DSCMOEMULTA, TR.DESCCUSTORECIMO'    +#13+
              ' FROM  CONTRATOXMULTA   CXM, CONFISSAOXCONDICAO CC, CONFISSAOXDOCUMENTO CD, ' +#13+
              '       MOEDA M,   MOEDA MP,MOEDA  MD, TIPOCUSTORECIMOV TR  ' +#13+
              ' WHERE   (CD.IDCONFISSAODIVIDA = CC.IDCONFISSAODIVIDA)     ' +#13+
              ' AND (CD.IDCONDRESULT = CC.IDCONDRESULT)  ' +#13+
              ' AND (M.MOECODIGO(+) = CC.INDCORRECAO)    ' +#13+
              ' AND (MP.MOECODIGO(+) = CXM.MOEDAJUROS)   ' +#13+
              ' AND (MD.MOECODIGO(+) = CXM.MOEDAMULTA)   ' +#13+
              sParam;
  end  ;  //Helen - SOL: 136341 Kintana : 815095 - Fim
  Result := GetDataPacket(sSql);
end;

procedure TCtrlParamMulta.AfterInitialize;
begin
  inherited;

  FDbContratoXMulta.DataBaseName := DataBaseName;
end;

function TCtrlParamMulta.BuscaParamMulta(var rParamMulta:TParamMulta;
                                         const iIdContratoImovel,iIdTipoReceita:Integer;
                                         const dData:TDateTime;
                                         const iCodDocumento: Integer): Boolean;
                                         //Helen - SOL: 136341 Kintana : 815095 - Add iCodDocumento
var cdsTemp  : TCMClientDataSet;
    iCodErro : Integer;
begin

  // Nenhum filtro foi considerado, a princípio...
  Result   := False;
  iCodErro := 0;

  LimpaQueryMultaJuros(rParamMulta);

  try
    cdsTemp := TCMClientDataSet.Create(nil);
    //Helen - SOL: 136341 Kintana : 815095 - Inicio
     //Quando o tipo de Receita = 196 (Confissão de Divida) , o Sistema deverá levar em consideração
     //os dados da Table CONFISSAOXCONDICAO
    // 4º filtro: Cotrato +  Tipo de Receita = 196 ...
    if (iIdContratoImovel > 0) and (iIdTipoReceita = 196 ) and (iCodDocumento > 0 ) then begin
      cdsTemp.Data := AbreQueryMulta(rParamMulta,iIdContratoImovel,iIdTipoReceita,dData,iCodDocumento );

      // Erro: O filtro retorna mais de um registro...
      if (cdsTemp.RecordCount>1) then begin
        iCodErro := -7;
        Exit;
      end else begin
         if (cdsTemp.RecordCount=1) then
           Result := True;
      end;
    end;
    //Helen - SOL: 136341 Kintana : 815095 - Fim

    // 1º filtro: Cotrato + Vigência + Tipo de Receita...
    //if (iIdContratoImovel>0) and (iIdTipoReceita>0) then begin
    //Helen - SOL: 136341 Kintana : 815095 - Fim
    if (not Result) and (iIdContratoImovel>0) and (iIdTipoReceita>0) then begin
      cdsTemp.Data := AbreQueryMulta(rParamMulta,iIdContratoImovel,iIdTipoReceita,dData);

      // Erro: O filtro retorna mais de um registro...
      if (cdsTemp.RecordCount>1) then begin
        iCodErro := -7;
        Exit;
      end else begin
         if (cdsTemp.RecordCount=1) then
           Result := True;
      end;
    end;

    // 2º filtro: Cotrato + Vigência...
    if (not Result) and (iIdContratoImovel>0)  then begin
      cdsTemp.Data := AbreQueryMulta(rParamMulta,iIdContratoImovel,-1,dData);

      // Erro: O filtro retorna mais de um registro...
      if (cdsTemp.RecordCount>1) then begin
        iCodErro := -7;
        Exit;
      end else begin
         if (cdsTemp.RecordCount=1) then
           Result := True;
      end;
    end;

    // 3º filtro: Tipo de Receita + Vigência...
    if (not Result) and (iIdTipoReceita>0) then begin
      cdsTemp.Data := AbreQueryMulta(rParamMulta,-1,iIdTipoReceita,dData);

      // Erro: O filtro retorna mais de um registro...
      if (cdsTemp.RecordCount>1) then begin
        iCodErro := -7;
        Exit;
      end else begin
         if (cdsTemp.RecordCount=1) then
           Result := True;
      end;
    end;

    // Resultado da Busca...
    // Verifica se agora foi encontrado passado algum filtro...
    if (Result) then begin

      // Preenche os parâmetros do Registro Variável...
      with rParamMulta do begin
        iContrato           := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;
        iIndiceCorrecao     := cdsTemp.FieldByName('IDINDCORRECAO').AsInteger;
        iTipoReceita        := cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
        iMesRefCorrecao     := cdsTemp.FieldByName('MESREFCORRECAO').AsInteger;
        iDiasTolerancia     := cdsTemp.FieldByName('DIASTOLERANCIA').AsInteger;
        iDiasRepasse        := cdsTemp.FieldByName('DIASREPASSE').AsInteger;
        iMoeMulta           := cdsTemp.FieldByName('MOEDAMULTA').AsInteger;
        iMoeJuros           := cdsTemp.FieldByName('MOEDAJUROS').AsInteger;

        fVlrMulta           := cdsTemp.FieldByName('VLRMULTA').AsFloat;
        fVlrJuros           := cdsTemp.FieldByName('VLRJUROS').AsFloat;
        fPercMulta          := cdsTemp.FieldByName('PERCMULTA').AsFloat;
        fPercJuros          := cdsTemp.FieldByName('PERCJUROS').AsFloat;

        dDataInicio         := cdsTemp.FieldByName('DATAINI').AsDateTime;
        dDataFim            := cdsTemp.FieldByName('DATAFIM').AsDateTime;

        sPeriodoJuros       := cdsTemp.FieldByName('PERIODOJUROS').AsString;
        sDscCorrecao        := cdsTemp.FieldByName('DSCINDCORR').AsString;
        sDscMulta           := cdsTemp.FieldByName('DSCMOEJUROS').AsString;
        sDscJuros           := cdsTemp.FieldByName('DSCMOEMULTA').AsString;
        sDscTipoReceita     := cdsTemp.FieldByName('DESCCUSTORECIMO').AsString;
        sFlgJurosProporc    := cdsTemp.FieldByName('FLGJUROSPROPORC').AsString;
        sFlgTipoDiasTolera  := cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString;
        sFlgTipoDiasRepasse := cdsTemp.FieldByName('FLGTIPODIAREPASS').AsString;
      end;

    end else iCodErro := -8;

  finally
    case iCodErro of
      -7: MessageInfo := 'Erro: Parametrização duplicada.';
      -8: MessageInfo := 'Aviso: Parametrização não encontrada nesta vigência.';
    end;

    FreeAndNil(cdsTemp);
  end;
end;

constructor TCtrlParamMulta.Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer;
                                   const bUsaPlanoPatro:Boolean);
begin
  inherited create;
  FDbContratoXMulta := TDbContratoXMulta.Create( Self );
end;

destructor TCtrlParamMulta.Destroy;
begin
  FreeAndNil( FDBContratoXMulta );

  if isAppServer then
    FreeAndNil(fCdsContratoXMulta);

  inherited;

end;

procedure TCtrlParamMulta.LimpaQueryMultaJuros(var rParamMulta:TParamMulta);
begin
  with rParamMulta do begin
    iContrato           := -1;
    iIndiceCorrecao     := -1;
    iTipoReceita        := -1;
    iMesRefCorrecao     := 0;
    iDiasTolerancia     := -1;
    iDiasRepasse        := -1;
    iMoeMulta           := -1;
    iMoeJuros           := -1;

    fVlrMulta           := 0;
    fVlrJuros           := 0;
    fPercMulta          := 0;
    fPercJuros          := 0;

    dDataInicio         := -1;
    dDataFim            := -1;

    sPeriodoJuros       := '';
    sDscCorrecao        := '';
    sDscMulta           := '';
    sDscJuros           := '';
    sDscTipoReceita     := '';
    sFlgJurosProporc    := '';
    sFlgTipoDiasTolera  := '';
    sFlgTipoDiasRepasse := '';
  end;
end;

function TCtrlParamMulta.LookupMultaJuros(const iIdContratoImovel:Integer): Olevariant;
var sSql, sParam : String;
begin
  sSql   := '';
  sParam := '';

  if (iIdContratoImovel<>-1) then
    sParam := sParam+'  AND MJ.IDCONTRATOIMOVEL = '+QuotedStr(IntToStr(iIdContratoImovel))+#13;

  sSql := 'SELECT MJ.IDTIPOCUSTORECIMO,       MJ.IDCONTRATOXMULTA,      MJ.IDCONTRATOIMOVEL, '         +#13+
          '       MJ.IDINDCORRECAO,           M.MOESIGLA AS DSCINDCORR, MJ.MOEDAJUROS, '               +#13+
          '       MP.MOESIGLA AS DSCMOEJUROS, MJ.MOEDAMULTA,            MD.MOESIGLA AS DSCMOEMULTA, '  +#13+
          '       MJ.FLGINDETERMINADO,        MJ.VLRMULTA,              MJ.PERCMULTA, '                +#13+
          '       MJ.VLRJUROS,                MJ.PERCJUROS,             MJ.PERIODOJUROS, '             +#13+
          '       MJ.FLGJUROSPROPORC,         MJ.DATAINI,               MJ.DATAFIM, '                  +#13+
          '       MJ.MESREFCORRECAO,          MJ.DIASTOLERANCIA,        MJ.DIASREPASSE, '              +#13+
          '       MJ.FLGTIPODIATOLERA,        MJ.FLGTIPODIAREPASS,      MJ.TRGDTINCLUSAO, '            +#13+
          '       MJ.TRGUSERINCLUSAO,         TR.DESCCUSTORECIMO, '                                    +#13+
          '       DECODE(MJ.PERIODOJUROS,''D'',''Diário'',''M'',''Mensal'','''') AS DSCPERIODOJUROS, ' +#13+
          '       DECODE(MJ.FLGTIPODIATOLERA,''C'',''Dias Corridos'', '                                +
                                            '''U'',''Dias Úteis'','''') AS DSCTIPODIATOLERA, '         +#13+
          '       DECODE(MJ.FLGTIPODIAREPASS,''C'',''Dias Corridos'', '                                +
                                            '''U'',''Dias Úteis'','''') AS DSCTIPODIAREPASS '          +#13+
          'FROM CONTRATOXMULTA MJ, MOEDA M, MOEDA MP, MOEDA MD, TIPOCUSTORECIMOV TR '                  +#13+
          'WHERE 1=1 '                                                                                 +#13+sParam+
          '  AND ( TR.IDTIPOCUSTORECIMO(+) = MJ.IDTIPOCUSTORECIMO ) '                                  +#13+
          '  AND ( M.MOECODIGO(+)          = MJ.IDINDCORRECAO     ) '                                  +#13+
          '  AND ( MP.MOECODIGO(+)         = MJ.MOEDAJUROS        ) '                                  +#13+
          '  AND ( MD.MOECODIGO(+)         = MJ.MOEDAMULTA        ) ';

  Result := GetDataPacket(sSql);
end;

procedure TCtrlParamMulta.OnCreateAppServer;
begin
  inherited;

  FCdsContratoXMulta := TCMClientDataSet.Create( nil );
end;

procedure TCtrlParamMulta.SetCdsContratoXMulta(const Value:TCMClientDataSet);
begin
  FCdsContratoXMulta := Value;
end;

procedure TCtrlParamMulta.SetDbContratoXMulta(const Value:TDbContratoXMulta);
begin
  FDbContratoXMulta := Value;
end;

end.
