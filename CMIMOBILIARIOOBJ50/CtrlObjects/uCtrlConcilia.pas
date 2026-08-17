{-------------------------------------------------------------------------------

      OBJETO DE CONTROLE CONCILIAÇÃO DE LANÇAMENTOS  ( MT )

Módulo          :  Comuns Imobiliário
Autor           :  Daniel Simões
Data de Término :  16/02/2007


      FUNÇÕES PUBLICADAS

  Concilia          - Efetua a conciliação de documentos com o CAR...
  LookupConciliacao - Busca divergências de conciliação...

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Padrão      : 5.10.16 em diante...
Pendência   : 26601
Responsável : Daniel Simões
Data        : 09/04/2008
Descrição   : Alterações na estrutura das querys abertas na função
              'LookupConciliacao' ...
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Passa a calcular os valores de Juros, Multa e Correção pela
             'CtrlParamMulta' iserida no Cadastro de Contratos de Locação...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlConcilia;

interface

uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes, SysUtils, dbclient,
     Provider, uSistema, uMidasUtil, uComunsImobiliarioDB, uComunsImobiliario,
     uCMClientDataset, uCmFileUtils, uCtrlModuloImobiliario, uCtrlParamIntegra,
     wwQuery, uDiasUteis, uCtrlOrcamento, {uCtrlLancamento, uCtrlDocumento,}
     UCalcDocumento, uCtrlMsgBoleto, uCtrlParamMulta, uCtrlInadimplencia,
     uModuloImobiliario,
     //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
     uCtrlImobDocumento, uCtrlImobLancamento;

type
  TCtrlConcilia = class(TCmControlObject)

  protected
    procedure AfterInitialize; override;
    procedure onCreateAppServer; override;
  private
    ParamSistema          : TParamSistema;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    CtrlParamIntegra      : TCtrlParamIntegra;
    // Daniel - 26461
    CtrlParamMulta        : TCtrlParamMulta;
    CtrlInadimplencia     : TCtrlInadimplencia;
    // Fim.
    ComunsImobiliarioDB   : TComunsImobiliarioDB;

    rParamMulta           : TParamMulta; // Daniel - 26461

  public
    cdsConciliaTemp : TCMClientDataSet;

    constructor Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer; const bUsaPlanoPatro:Boolean); reintroduce;
    destructor Destroy; override;

    function AtualizaConciliacaoNormal(const iIdContrato:Integer=-1;    const iIdUsuario:Integer=-1;
                                       const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                                       const iAno:Integer=-1;           const sOrigemLanc:String='';
                                       const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                                       const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                                       const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1;
                                       const bTransacao:Boolean=True): Boolean;

    function AtualizaDataLimite(const iCodDocumento:Integer=-1; const dDataLimite:TDateTime=-1; const bTransacao:Boolean=True): Boolean;

    function AtualizaLancImovel(const iCodDocumento:Integer=-1; const fVlrCorrecao:Double=-1;
                                const fVlrJuros:Double=-1;      const fVlrMulta:Double=-1;
                                const bTransacao:Boolean=True): Boolean;

    function Concilia(var oResultConcilia: OLEVariant; // Daniel - 26461
                      const dConciliacao : TDateTime;
                      const iIdContrato:Integer=-1;    const iIdUsuarioInc:Integer=-1;
                      const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                      const iAno:Integer=-1;           const sOrigemLanc:String='';
                      const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                      const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                      const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1 ): Boolean;

    function ConciliaFeriado(const iIdContrato:Integer=-1;    const iIdUsuarioInc:Integer=-1;
                             const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                             const iAno:Integer=-1;           const sOrigemLanc:String='';
                             const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                             const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                             const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1): Boolean;

    function ConciliaNormal(const iIdContrato:Integer=-1;    const iIdUsuarioInc:Integer=-1;
                            const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                            const iAno:Integer=-1;           const sOrigemLanc:String='';
                            const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                            const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                            const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1): Boolean;

    function CorrigeAtrasoDocBaixado(var oResultConcilia: OLEVariant; // Daniel - 26461
                                     const dConciliacao : TDateTime;
                                     const iIdContrato:Integer=-1;    const iIdUsuarioInc:Integer=-1;
                                     const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                                     const iAno:Integer=-1;           const sOrigemLanc:String='';
                                     const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                                     const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                                     const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1 ): Boolean;

    function LookupConciliacao(const iIdContrato:Integer=-1;    const iIdUsuarioInc:Integer=-1;
                               const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                               const iAno:Integer=-1;           const dIniInclusao:TDateTime=-1;
                               const dFimInclusao:TDateTime=-1; const dIniLancto:TDateTime=-1;
                               const dFimLancto:TDateTime=-1;   const dIniVencto:TDateTime=-1;
                               const dFimVencto:TDateTime=-1;   const dBaseCalc:TDateTime=-1;
                               const sOrigemLanc:String='';     const bApenasDocsComBaixa:Boolean=True;
                               const bApenasDocsPagoVlrOrig:Boolean=False): OLEVariant;

    function LookupValorOriginalVencido(const iIdContrato:Integer=-1;    const iIdUsuario:Integer=-1;
                                        const iIdForCli:Integer=-1;      const iMes:Integer=-1;
                                        const iAno:Integer=-1;           const sOrigemLanc:String='';
                                        const dIniInclusao:TDateTime=-1; const dFimInclusao:TDateTime=-1;
                                        const dIniLancto:TDateTime=-1;   const dFimLancto:TDateTime=-1;
                                        const dIniVencto:TDateTime=-1;   const dFimVencto:TDateTime=-1): OLEVariant;

    function AbonaDocumento(const iCodDocumento:Integer;
                            const sMotivo:String='';
                            const fDiferenca:Double=-1): Boolean;

    function ExcluiMotivoConciliacao(const iCodDocumento:Integer;
                                     const iParcFinancImov:Integer=-1;
                                     const sFlgTipo:String=''): Boolean;

    function GravaMotivoConciliacao(const iCodDocumento:Integer;
                                    const iIdConciliaDoc:Integer;
                                    const iParcFinancImov:Integer=-1;
                                    const iIdUsuario:Integer=-1;
                                    const iCodDocDiverge:Integer=-1;
                                    const iNumLanctoDiverge:Integer=-1;
                                    const iDifDias:Integer=-1;
                                    const iDifValor:Integer=-1;
                                    const sMotivo:String='';
                                    const sFlgTipo:String='';
                                    const dDataConcilia:TDateTime=-1): Boolean;
end;

implementation

{ TCtrlConcilia }

{ TCtrlConcilia }

constructor TCtrlConcilia.Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer;
                                 const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  CtrlParamIntegra      := TCtrlParamIntegra.Create;
  // Daniel - 26461
  CtrlParamMulta        := TCtrlParamMulta.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);
  CtrlInadimplencia     := TCtrlInadimplencia.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);
  // Fim.
  ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa      := iIdEmpresa;
  ParamSistema.idModulo       := iIdModulo;
  ParamSistema.idUsuario      := iIdUsuario;
  ParamSistema.IdEspAcesso    := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro  := bUsaPlanoPatro;
end;

procedure TCtrlConcilia.AfterInitialize;
begin
  inherited;

  CtrlModuloImobiliario.InitializeAs(Self);
  CtrlParamIntegra.InitializeAs(Self);
  // Daniel - 26461
  CtrlParamMulta.InitializeAs(Self);
  CtrlInadimplencia.InitializeAs(Self);
  // Fim.
  ComunsImobiliarioDB.InitializeAs(Self);

  CtrlModuloImobiliario.OnMessageInfo := nil;
  CtrlParamIntegra.OnMessageInfo      := nil;
  // Daniel - 26461
  CtrlParamMulta.OnMessageInfo        := nil;
  CtrlInadimplencia.OnMessageInfo     := nil;
  // Fim.
  ComunsImobiliarioDB.OnMessageInfo   := nil;

  CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.InvestImob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.Global.GetParam(ParamSistema.idEmpresa);

  CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','',tiSistema);
end;

procedure TCtrlConcilia.onCreateAppServer;
begin
  inherited;

end;

destructor TCtrlConcilia.Destroy;
begin
  FreeAndNil(CtrlModuloImobiliario);
  FreeAndNil(CtrlParamIntegra);
  // Daniel - 26461
  FreeAndNil(CtrlParamMulta);
  FreeAndNil(CtrlInadimplencia);
  // Fim.
  FreeAndNil(ComunsImobiliarioDB);

  inherited;
end;

function TCtrlConcilia.AtualizaConciliacaoNormal(const iIdContrato,iIdUsuario,iIdForCli,iMes,iAno:Integer;
                                                 const sOrigemLanc:String;
                                                 const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime;
                                                 const bTransacao:Boolean): Boolean;
var sSql, sParam : String;
begin
  Result := True;

  // Define Paramêtros
  sParam := '';

  if iIdUsuario     > 0 then sParam := sParam + 'AND (V.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuario)+') '                                   +#13;
  if iIdContrato    > 0 then sParam := sParam + 'AND (V.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)+') '                                  +#13;
  if iIdForCli      > 0 then sParam := sParam + 'AND (V.IDFORCLI = '+IntToStr(iIdForCli)+') '                                            +#13;
  if sOrigemLanc   <>'' then sParam := sParam + 'AND (V.FLGORIGEMLANC = '+QuotedStr(sOrigemLanc)+') '                                            +#13;

  if (iMes <> -1) and (iAno <> -1) then
    sParam := sParam + 'AND ((V.MESCOMPETENCIA = '+IntToStr(iMes)+') AND (V.ANOCOMPETENCIA = '+IntToStr(iAno)+')) '                      +#13;


  if (dIniInclusao>0) and (dFimInclusao>0) then
    sParam := sParam + 'AND (V.TRGDTINCLUSAO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') ' +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'')) '                         +#13;

  if (dIniLancto>0) and (dFimLancto>0) then
    sParam := sParam + 'AND (V.DATALANCAMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') '  +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'')) '                           +#13;

  if (dIniVencto>0) and (dFimVencto>0) then
    sParam := sParam + 'AND (V.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') '  +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'')) '                           +#13;

  sSql := 'UPDATE DOCUMENTO SET FLGNAOCONCILIADO = NULL '                                                                                +#13+
          'WHERE CODDOCUMENTO IN( SELECT DISTINCT V.CODDOCUMENTO '                                                                       +#13+
          '                       FROM VWLANCAMENTO V '                                                                                  +#13+
          '                       WHERE ( V.IDMODULO          = 64 ) '                                                                   +#13+
          '                         AND ( V.STATUS_DOC        = ''2'' ) '                                                                +#13+
          '                         AND ( V.FLGNAOCONCILIADO  = 1 ) '                                                                    +#13+
          '                         AND ( V.RECPAG            = ''R'' ) '                                                                +#13+
          '                         AND ( V.DATAVENCIMENTO   >= V.DATA_BAIXA ) '                                                         +#13+
          '                         AND ( V.TOT_RECEBER       = V.TOT_RECEBIDO ) '                                                       +#13+
          sParam +' ) ';

  
  try
    if bTransacao then StartTransaction;
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
    if bTransacao then Commit;
  except
    on E : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlConcilia.AtualizaDataLimite(const iCodDocumento:Integer; const dDataLimite:TDateTime; const bTransacao:Boolean): Boolean;
var sSql, sParam : String;
begin
  Result := True;

  // Define Paramêtros
  sParam := '';

  sSql := 'UPDATE LANCAMENTOSIMOVEL SET DATALIMITE = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLimite))+',''DD/MM/YYYY'')' +#13+
          'WHERE ( CODDOCUMENTO = '+IntToStr(iCodDocumento)+' ) '                                                                     +#13+
          '  AND ( DATALIMITE IS NULL ) ';

  
  try
    if bTransacao then
      StartTransaction;

    if not ExecSQL( sSql ) then
      raise Exception.Create( MessageInfo );

    if bTransacao then
      Commit;
  except
    on E : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlConcilia.AtualizaLancImovel(const iCodDocumento:Integer; const fVlrCorrecao:Double;
                                          const fVlrJuros:Double;      const fVlrMulta:Double;
                                          const bTransacao:Boolean): Boolean;
var sSql, sParam : String;
begin
  Result := True;

  // Define Paramêtros
  sParam := '';

  if iCodDocumento > 0 then sParam := sParam + 'WHERE CODDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));

  sSql := 'UPDATE LANCAMENTOSIMOVEL SET VLRCORRECAOMON = '+QuotedStr(FloatToStr(fVlrCorrecao))+', ' +#13+
          '                             VLRJUROS       = '+QuotedStr(FloatToStr(fVlrJuros))+', '    +#13+
          '                             VLRMULTA       = '+QuotedStr(FloatToStr(fVlrMulta))         +#13+sParam;

  try
    if bTransacao then StartTransaction;
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
    if bTransacao then Commit;
  except
    on E : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlConcilia.Concilia(var oResultConcilia: OLEVariant; // Daniel - 26461
                                const dConciliacao : TDateTime;
                                const iIdContrato,iIdUsuarioInc,iIdForCli,iMes,iAno:Integer;
                                const sOrigemLanc:String;
                                const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime ): Boolean;
begin
  Result := True;
  try
     // Concilia Lançamentos pagos até a data do vencimento
     if not ConciliaNormal(iIdContrato, iIdUsuarioInc, iIdForCli,
                           iMes, iAno, sOrigemLanc, dIniInclusao, dFimInclusao,
                           dIniLancto, dFimLancto, dIniVencto, dFimVencto) then
        raise Exception.Create( MessageInfo );

     // Concilia Lançamento pagos até o vencimento, quando o mesmo for feriado
     if not ConciliaFeriado(iIdContrato, iIdUsuarioInc, iIdForCli,
                            iMes, iAno, sOrigemLanc, dIniInclusao, dFimInclusao,
                            dIniLancto, dFimLancto, dIniVencto, dFimVencto) then
        raise Exception.Create( MessageInfo );


     if (CtrlModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
        (CtrlModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
        (CtrlModuloImobiliario.AdminImob.iTipoOperAtualCM <= 0) then
     begin
       { Aplica Multa, Juros e Correção para os lançamentos pagos fora da data
         limite... }
       if not CorrigeAtrasoDocBaixado(oResultConcilia, // Daniel - 26461
                                      dConciliacao,
                                      iIdContrato,
                                      iIdUsuarioInc,
                                      iIdForCli,
                                      iMes,
                                      iAno,
                                      sOrigemLanc,
                                      dIniInclusao,
                                      dFimInclusao,
                                      dIniLancto,
                                      dFimLancto,
                                      dIniVencto,
                                      dFimVencto ) then raise Exception.Create( MessageInfo );
     end;
  except
     on e : Exception do begin
       Result := False;
       MessageInfo := e.message;
     end;
  end;
end;

function TCtrlConcilia.ConciliaNormal(const iIdContrato,iIdUsuarioInc,iIdForCli,iMes,iAno:Integer;
                                      const sOrigemLanc:String;
                                      const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime): Boolean;
var sSql, sParam : String;
begin
  Result := True;
  // Define Parâmetros
  sParam := 'AND V.IDMODULO = '+IntToStr(ParamSistema.idModulo)                                                 +#13;
  if iIdContrato   <> -1 then sParam := sParam + 'AND V.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)              +#13;
  if iIdUsuarioInc <> -1 then sParam := sParam + 'AND V.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuarioInc)            +#13;
  if iIdForCli     <> -1 then sParam := sParam + 'AND V.IDFORCLI         = '+IntToStr(iIdForCli)                +#13;
  if iMes          <> -1 then sParam := sParam + 'AND V.MESCOMPETENCIA   = '+IntToStr(iMes)                     +#13;
  if iAno          <> -1 then sParam := sParam + 'AND V.ANOCOMPETENCIA   = '+IntToStr(iAno)                     +#13;
  if sOrigemLanc   <> '' then sParam := sParam + 'AND V.FLGORIGEMLANC    = '+QuotedStr(sOrigemLanc)             +#13;

  if (dIniInclusao <> -1) and (dFimInclusao <> -1) then
     sParam := sParam + 'AND V.TRGDTINCLUSAO BETWEEN '+
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') AND ' +
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'') '     +#13;

  if (dIniLancto <> -1) and (dFimLancto <> -1) then
     sParam := sParam + 'AND V.DATALANCAMENTO BETWEEN '+
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') AND '   +
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'') '       +#13;

  if (dIniVencto <> -1) and (dFimVencto <> -1) then
     sParam := sParam + 'AND V.DATAVENCIMENTO BETWEEN '+
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') AND '   +
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'') '       +#13;

  // Define Sql
  sSql := 'UPDATE DOCUMENTO SET FLGNAOCONCILIADO = NULL '                                                       +#13+
          ' WHERE CODDOCUMENTO IN( SELECT DISTINCT V.CODDOCUMENTO '                                             +#13+
          '                        FROM VWLANCAMENTO V '                                                        +#13+
          '                        WHERE V.STATUS_DOC        = ''2'' '                                          +#13+
          '                          AND V.FLGNAOCONCILIADO  = 1 '                                              +#13+
          '                          AND V.DATAVENCIMENTO   >= V.DATA_BAIXA '                                   +#13+
          '                          AND V.TOT_RECEBER       = V.TOT_RECEBIDO '                                 +#13+
          sParam+' )';

  try
     if not ExecSQL( sSql ) then raise exception.Create('Erro ao atualizar a tabela Documento - Conciliação Normal')   ;
  except
     on e : Exception do begin
       Result := False;
       MessageInfo := e.message;
     end;
  end;
end;

function TCtrlConcilia.ConciliaFeriado(const iIdContrato,iIdUsuarioInc,iIdForCli,iMes,iAno:Integer;
                                       const sOrigemLanc:String;
                                       const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime): Boolean;
var sSql, sParam : String;
    cdsTemp      : TCMClientDataSet;
    dProximoUtil : TDateTime;
begin
  Result := True;

  // Define Parâmetros...
  sParam := '  AND V.IDMODULO = '+IntToStr(ParamSistema.IdModulo)                                              +#13;

  if iIdContrato   <> -1 then sParam := sParam + '  AND V.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)           +#13;
  if iIdUsuarioInc <> -1 then sParam := sParam + '  AND V.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuarioInc)         +#13;
  if iIdForCli     <> -1 then sParam := sParam + '  AND V.IDFORCLI         = '+IntToStr(iIdForCli)             +#13;
  if iMes          <> -1 then sParam := sParam + '  AND V.MESCOMPETENCIA   = '+IntToStr(iMes)                  +#13;
  if iAno          <> -1 then sParam := sParam + '  AND V.ANOCOMPETENCIA   = '+IntToStr(iAno)                  +#13;
  if sOrigemLanc   <> '' then sParam := sParam + '  AND V.FLGORIGEMLANC    = '+QuotedStr(sOrigemLanc)                     +#13;

  if (dIniInclusao <> -1) and (dFimInclusao <> -1) then
    sParam := sParam + '  AND V.TRGDTINCLUSAO  BETWEEN '+
                       'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') AND ' +
                       'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'') '     +#13;

  if (dIniLancto <> -1) and (dFimLancto <> -1) then
     sParam := sParam + '  AND V.DATALANCAMENTO  BETWEEN '+
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') AND '  +
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'') '      +#13;

  if (dIniVencto <> -1) and (dFimVencto <> -1) then
     sParam := sParam + '  AND V.DATAVENCIMENTO  BETWEEN '+
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') AND '  +
                        'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'') '      +#13;

  // Define Sql
  sSql := '';
  sSql := 'SELECT DISTINCT  V.CODDOCUMENTO,        V.DATAVENCIMENTO,      V.DATA_BAIXA, '       +#13+
          '                 V.TOT_RECEBER,         V.TOT_RECEBIDO,        V.FLGNAOCONCILIADO, ' +#13+
          '                 V.IDCONTRATOIMOVEL,    V.IDCIDADES,           V.IDPAIS, '           +#13+
          '                 V.CODESTADO,           V.CONDIASTOLERANCIA,   V.FLGTIPODIATOLERA, ' +#13+
          '                 CONTRATO_EXTENSO,      V.MESCOMPETENCIA,      V.ANOCOMPETENCIA, '   +#13+
          '                 V.DATALIMITE,          V.CONDIASREPASSE, '                          +#13+
          '                (V.DATA_BAIXA-V.DATALIMITE) AS DIF '                                 +#13+
          'FROM VWLANCAMENTO V '                                                                +#13+
          'WHERE V.STATUS_DOC = ''2'' '                                                         +#13+
          '  AND V.RECPAG = ''R'' '                                                             +#13+
          '  AND V.FLGNAOCONCILIADO = 1 '                                                       +#13+
          '  AND V.TOT_RECEBER = V.TOT_RECEBIDO '                                               +#13+sParam;
  sSql := sSql+'ORDER BY DIF, V.CONTRATO_EXTENSO ';

  try
    try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := GetDataPacket( sSql );

      while not cdsTemp.Eof do begin

        // Somente atualizar a data limite se a folha de alugueis ja não o fez...
        if cdsTemp.FieldByName('DATALIMITE').IsNull then begin
          dProximoUtil := ComunsImobiliarioDB.DataLimite(cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                         cdsTemp.FieldByName('IDCIDADES').AsInteger,
                                                         cdsTemp.FieldByName('IDPAIS').AsInteger,
                                                         cdsTemp.FieldByName('CONDIASTOLERANCIA').AsInteger,
                                                         cdsTemp.FieldByName('CONDIASREPASSE').AsInteger,
                                                         cdsTemp.FieldByName('CODESTADO').AsString,
                                                         cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString,
                                                         cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString, // alterar para FLGTIPODIAREPASSE...
                                                         True,
                                                         False,
                                                         False);

          // Atualizar a data limite de vencimento...
          sSql := '';
          sSql := 'UPDATE LANCAMENTOSIMOVEL '                                                                           +#13+
                  '   SET DATALIMITE = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dProximoUtil))+',''DD/MM/YYYY'')'+#13+
                  ' WHERE CODDOCUMENTO = ' + IntToStr(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger);

          if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
        end else begin
          dProximoUtil := cdsTemp.FieldByName('DATALIMITE').AsDateTime;
        end;

        // O locatário pagou o aluguel em um dia útil válido sem cálculo de multa...
        if dProximoUtil >= cdsTemp.FieldByName('DATA_BAIXA').AsDateTime then begin
          sSql := '';
          sSql := 'UPDATE DOCUMENTO '                                                                 +#13+
                  '   SET FLGNAOCONCILIADO = NULL '                                                   +#13+
                  ' WHERE CODDOCUMENTO = ' + IntToStr(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger);
          if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
        end;

        cdsTemp.Next;
      end;
    except
      on e : Exception do begin
        Result := False;
        MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

function TCtrlConcilia.CorrigeAtrasoDocBaixado(var oResultConcilia: OLEVariant; // Daniel - 26461
                                               const dConciliacao : TDateTime;
                                               const iIdContrato,iIdUsuarioInc,iIdForCli,iMes,iAno:Integer;
                                               const sOrigemLanc:String;
                                               const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime): Boolean;
var cdsTemp                      : TCMClientDataSet;
    fVlrDevido                   : Extended;
    iUsaMesAnterior              : Integer;
    dDataBaixa                   : TDateTime;
    sSql                         : String;

// Daniel - 26461 - Início -----------------------------------------------------
    iFlgJurosProporc             : Integer;
    dProximoUtil                 : TDateTime;
    dDataCalculo                 : TDateTime;
    bTemBaixaParcial             : Boolean;
    fValorAtual,fVlrMulta        : Extended;
    fVlrJuros,fCorrecaoMonet     : Extended;
    fMultaDif,fJurosDif          : Extended;
    fCorrecaoMonetDif,fProporcao : Extended;
    fValorDiverg                 : Extended;
    fValorDivergAtual            : Extended;
    dData                        : TdateTime;
// Daniel - 26461 - Fim --------------------------------------------------------

begin
  Result := True;

// Daniel - 26461 - Início -----------------------------------------------------
  fValorAtual       := 0;
  fVlrMulta         := 0;
  fVlrJuros         := 0;
  fCorrecaoMonet    := 0;
  fMultaDif         := 0;
  fJurosDif         := 0;
  fCorrecaoMonetDif := 0;
  fProporcao        := 0;
  fValorDiverg      := 0;
  fValorDivergAtual := 0;
  dDataCalculo      := 0;
// Daniel - 26461 - Fim --------------------------------------------------------

  try
    try
      // Busca os Lançamentos ainda não conciliados
      cdsTemp := TCMClientDataSet.Create( nil );

      cdsTemp.Data := LookupConciliacao(iIdContrato,
                                        iIdUsuarioInc,
                                        iIdForCli,
                                        iMes,
                                        iAno,
                                        dIniInclusao,
                                        dFimInclusao,
                                        dIniLancto,
                                        dFimLancto,
                                        dIniVencto,
                                        dFimVencto,
                                        -1,
                                        '',
                                        False);

      


      // Calcula a Correção, Juros e Multa para cada documento em atraso
      cdsTemp.First;
      while not cdsTemp.Eof do begin

// Daniel - 26461 - Início -----------------------------------------------------
        CtrlParamMulta.BuscaParamMulta(rParamMulta,iIdContrato,
                                       cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                       cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime);

        if (rParamMulta.sFlgJurosProporc='S') then
             iFlgJurosProporc := 1
        else iFlgJurosProporc := 0;

        if cdsTemp.FieldByName('DATALIMITE').IsNull then begin
          dProximoUtil := ComunsImobiliarioDB.DataLimite(cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                         cdsTemp.FieldByName('IDCIDADES').AsInteger,
                                                         cdsTemp.FieldByName('IDPAIS').AsInteger,
                                                         rParamMulta.iDiasTolerancia,
                                                         rParamMulta.iDiasRepasse,
                                                         cdsTemp.FieldByName('CODESTADO').AsString,
                                                         rParamMulta.sFlgTipoDiasTolera,
                                                         rParamMulta.sFlgTipoDiasRepasse,
                                                         True,
                                                         False,
                                                         False);

          if not AtualizaDataLimite(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,dProximoUtil,False) then
            raise Exception.Create(MessageInfo);
        end else dProximoUtil := cdsTemp.FieldByName('DATALIMITE').AsDateTime;

        bTemBaixaParcial := cdsTemp.FieldByName('TOT_RECEBIDO').AsFloat<>0;
// Daniel - 26461 - Fim --------------------------------------------------------

        // Verifica uso do indice do mes anterior
        if cdsTemp.FieldByName('CONMESREFREAJUSTE').AsString = 'A' then
             iUsaMesAnterior := 1
        else iUsaMesAnterior := 0;

        // Define a data da baixa e Valor Devido
        if cdsTemp.FieldByName('STATUS_DOC').AsInteger = 2 then begin
           dDataBaixa := cdsTemp.FieldByName('DATA_BAIXA').AsDateTime;
           fVlrDevido := cdsTemp.FieldByName('TOT_RECEBER').AsFloat;
        end else begin
           if cdsTemp.FieldByName('TOT_RECEBIDO').IsNull then begin
             dDataBaixa := Date;
             fVlrDevido := cdsTemp.FieldByName('TOT_RECEBER').AsFloat;
           end else begin
             dDataBaixa := Date;
             fVlrDevido := cdsTemp.FieldByName('TOT_RECEBER').AsFloat -
                           cdsTemp.FieldByName('TOT_RECEBIDO').AsFloat;
           end;
        end;

// Daniel - 26461 - Início -----------------------------------------------------
        if (cdsTemp.FieldByName('DATA_BAIXA').AsDateTime > dProximoUtil) or
           (cdsTemp.FieldByName('TOT_RECEBIDO').AsFloat < cdsTemp.FieldByName('TOT_RECEBER').AsFloat) then
        begin
          CtrlInadimplencia.DadosDocsVencidos( cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                               -1,
                                               dConciliacao,
                                               rParamMulta.iMesRefCorrecao,
                                               rParamMulta.iIndiceCorrecao,
                                               rParamMulta.fVlrMulta,
                                               rParamMulta.fPercMulta,
                                               rParamMulta.iMoeMulta,
                                               rParamMulta.fVlrJuros,
                                               rParamMulta.fPercJuros,
                                               rParamMulta.iMoeJuros,
                                               iFlgJurosProporc,
                                               cdsTemp.FieldByName('IDCIDADES').AsInteger,
                                               cdsTemp.FieldByName('IDPAIS').AsInteger,
                                               rParamMulta.iDiasTolerancia,
                                               rParamMulta.iDiasRepasse,
                                               bTemBaixaParcial,
                                               cdsTemp.FieldByName('TOT_RECEBER').AsFloat,
                                               cdsTemp.FieldByName('TOT_RECEBIDO').AsFloat,
                                               cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                               dProximoUtil,
                                               rParamMulta.sPeriodoJuros,
                                               cdsTemp.FieldByName('CODESTADO').AsString,
                                               rParamMulta.sFlgTipoDiasTolera,
                                               rParamMulta.sFlgTipoDiasRepasse,
                                               'L',
                                               ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                               False,
                                               fValorAtual,
                                               fVlrMulta,
                                               fVlrJuros,
                                               fCorrecaoMonet,
                                               fMultaDif,
                                               fJurosDif,
                                               fCorrecaoMonetDif,
                                               fProporcao,
                                               fValorDiverg,
                                               fValorDivergAtual,
                                               dDataCalculo );
        end;

        cdsTemp.Edit;
        cdsTemp.FieldByName('CORRECAO').AsFloat    := fCorrecaoMonet;
        cdsTemp.FieldByName('JUROS').AsFloat       := fVlrJuros;
        cdsTemp.FieldByName('MULTA').AsFloat       := fVlrMulta;
        cdsTemp.FieldByName('CORRECAODIF').AsFloat := fCorrecaoMonetDif;
        cdsTemp.FieldByName('JUROSDIF').AsFloat    := fJurosDif;
        cdsTemp.FieldByName('MULTADIF').AsFloat    := fMultaDif;
        cdsTemp.FieldByName('VLRATUAL').AsFloat    := fValorAtual;
        cdsTemp.FieldByName('VLRDIVERG').AsFloat   := fValorDiverg;
        cdsTemp.FieldByName('DIFERENCA').AsFloat   := fValorDivergAtual;
        cdsTemp.FieldByName('PROPORCAO').AsFloat   := fProporcao;
        cdsTemp.Post;
// Daniel - 26461 - Fim --------------------------------------------------------

        cdsTemp.Next;
      end;

      oResultConcilia := cdsTemp.Data; // Daniel - 26461

    except
      on e : Exception do begin
        Result := False;
        MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

function TCtrlConcilia.LookupConciliacao(const iIdContrato,iIdUsuarioInc,iIdForCli,iMes,iAno:Integer;
                                         const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto,dBaseCalc:TDateTime;
                                         const sOrigemLanc:String;
                                         const bApenasDocsComBaixa:Boolean;
                                         const bApenasDocsPagoVlrOrig:Boolean): OLEVariant;
var sSql, sParam, sParam2 : String;
begin
  Result := True;

  if (CtrlModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
     (CtrlModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
     (CtrlModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then
  begin
    // Define Parâmetros
    sParam := '  AND V.IDMODULO = '+IntToStr(ParamSistema.IdModulo)                                             +#13;
    if iIdContrato   <> -1 then sParam := sParam + '  AND V.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)          +#13;
    if iIdUsuarioInc <> -1 then sParam := sParam + '  AND V.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuarioInc)        +#13;
    if iIdForCli     <> -1 then sParam := sParam + '  AND V.IDFORCLI         = '+IntToStr(iIdForCli)            +#13;
    if iMes          <> -1 then sParam := sParam + '  AND V.MESCOMPETENCIA   = '+IntToStr(iMes)                 +#13;
    if iAno          <> -1 then sParam := sParam + '  AND V.ANOCOMPETENCIA   = '+IntToStr(iAno)                 +#13;
    if sOrigemLanc   <> '' then sParam := sParam + '  AND V.FLGORIGEMLANC    = '+QuotedStr(sOrigemLanc)         +#13;

    if (dIniInclusao <> -1) and (dFimInclusao <> -1) then
      sParam := sParam + '  AND V.TRGDTINCLUSAO BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') AND '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'') '    +#13;

    if (dIniLancto <> -1) and (dFimLancto <> -1) then
      sParam := sParam + '  AND V.DATALANCAMENTO  BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') AND '  +
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'') '      +#13;

    if (dIniVencto <> -1) and (dFimVencto <> -1) then
      sParam := sParam + '  AND V.DATAVENCIMENTO  BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') AND '  +
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'') '      +#13;

// Daniel - 26601 - Início -----------------------------------------------------
    // Daniel - 26461
    if (bApenasDocsComBaixa)    then sParam := sParam + '  AND V.STATUS_DOC = ''2'' '                           +#13;
    if (bApenasDocsPagoVlrOrig) then
      sParam := sParam + '  AND ((V.TOT_RECEBER+NVL(ALT.TOT_ALTERADOR,0))-V.TOT_RECEBIDO)=0 '                   +#13+
                         '  AND V.DATAVENCIMENTO < SYSDATE '                                                    +#13;
    // Fim.
// Daniel - 26601 - Fim --------------------------------------------------------

    // Define Sql
    sSql := 'SELECT DISTINCT V.CODDOCUMENTO,    V.DATAVENCIMENTO,    V.DATA_BAIXA, '                            +#13+
            '                V.TOT_RECEBER+NVL(ALT.TOT_ALTERADOR,0) AS TOT_RECEBER, '                           +#13+ // Daniel - 26601
            '                V.TOT_RECEBIDO,    V.FLGNAOCONCILIADO,  V.IDCONTRATOIMOVEL, V.IDCIDADES, '         +#13+
            '                V.IDPAIS,          V.CODESTADO,         V.RS_FORCLI,        V.IDFORCLI, '          +#13+
            '                V.DATALIMITE,      V.CONTRATO_EXTENSO,  V.MESCOMPETENCIA,   V.ANOCOMPETENCIA, '    +#13+
            '                V.CODTIPIMOVEL,    V.CONMESREFREAJUSTE, V.STATUS_DOC,       V.IDTIPOCUSTORECIMO, ' +#13+
            '                0 AS FLGMARCAR,    V.CONNUMERO,         V.TOT_ALTERADOR, '                         +#13+

            { Daniel - 26461 ( FORAM RETIRADOS TODOS OS CAMPOS CUJO VALORES SÃO TRAZIDOS DA 'CTRLPARAMMULTA' E OS MESMOS
                               FORAM SUBSTITUÍDOS POR CAMPOS TEMPORÁRIOS QUE RECEBERÃO SEUS RESPECTIVOS VALORES DA
                               'CTRLPARAMMULTA' E CALCULADOS EM TEMPO DE EXECUÇÃO... ) }
            '                0.00 AS CORRECAO,  0.00 AS JUROS,       0.00 AS MULTA,      0.00 AS CORRECAODIF, ' +#13+
            '                0.00 AS JUROSDIF,  0.00 AS MULTADIF,    0.00 AS VLRATUAL,   0.00 AS VLRDIVERG, '   +#13+
            '                0.00 AS DIFERENCA, 0.00 AS PROPORCAO,   0.00 AS ABONO, '                           +#13+

            '                0.00 AS VLRDIVERGATUAL, 0.00 AS TOT_CORRIGIDO,  '''' AS NUMERO_CONTRATO, '         +#13+
            '                '''' AS NOME_CONTRATO,  0 AS IDINDCORRECAO,     0 AS CONDIASTOLERANCIA, '          +#13+
            '                0 AS CONDIASREPASSE,    V.FLGTIPODIATOLERA,     0 AS CONVLRMULTA, '                +#13+
            '                0 AS CONPERCENTMULTA,   0 AS CONMOEDAMULTA,     0 AS CONVLRMORA, '                 +#13+
            '                0 AS CONMOEDAMORA,      0 AS CONPERCENTMORA,    V.FLGMORAPROPORC, '                +#13+
            '                0 AS CONPERMORA, '                                                                 +#13+
            '               (V.TOT_RECEBER+V.TOT_ALTERADOR) AS A_RECEBER '                                      +#13+ // Daniel - 26601

            'FROM VWLANCAMENTO V, '                                                                             +#13+
// Daniel - 26601 - Início -----------------------------------------------------
            '   ( SELECT L.CODDOCUMENTO, SUM(DECODE(LD.DEBCRE,''D'',LD.VALOR,LD.VALOR*-1)) AS TOT_ALTERADOR '   +#13+
            '     FROM LANCTODOCUM LD, '                                                                        +#13+
            '        ( SELECT L.CODDOCUMENTO, MAX(L.CODTIPIMOVEL) AS CODTIPIMOVEL, '                            +#13+
            '                 MAX(T.CODALTMULTA) AS CODALTMULTA, '                                              +#13+
            '                 MAX(T.CODALTJUROS) AS CODALTJUROS, '                                              +#13+
            '                 MAX(T.CODALTCORRMON) AS CODALTCORRMON '                                           +#13+
            '          FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T '                                                 +#13+
            '          WHERE L.RECPAG       = ''R'' '                                                           +#13+
            '            AND L.CODTIPIMOVEL = T.CODTIPIMOVEL '                                                  +#13+
            '          GROUP BY L.CODDOCUMENTO ) L '                                                            +#13+
            '     WHERE L.CODDOCUMENTO    = LD.CODDOCUMENTO '                                                   +#13+
            '       AND LD.ESTORNO        IS NULL '                                                             +#13+
            '       AND TRIM(LD.OPERACAO) = ''4'' '                                                             +#13+
            '       AND LD.CODALTERADOR   NOT IN(L.CODALTMULTA,L.CODALTJUROS,L.CODALTCORRMON) '                 +#13+
            '     GROUP BY L.CODDOCUMENTO ) ALT '                                                               +#13+
// Daniel - 26601 - Fim --------------------------------------------------------
            'WHERE V.FLGNAOCONCILIADO = 1 '                                                                     +#13+
            '  AND V.RECPAG           = ''R'' '                                                                 +#13+
            '  AND V.CODDOCUMENTO     = ALT.CODDOCUMENTO(+) '                                                   +#13+
            sParam;

    { Daniel - 26461 - ANTES ORDENAVA APENAS PELA DIFERENÇA ... }
    sSQL := sSQL + 'ORDER BY CONNUMERO, DATAVENCIMENTO, ANOCOMPETENCIA, MESCOMPETENCIA, CODDOCUMENTO ';
  end else begin
    // Define Parâmetros
    sParam := '  AND REC_DES.IDMODULO         = '+IntToStr(ParamSistema.idModulo)                               +#13;
    if (iIdContrato<>-1) then begin
      sParam  := sParam  + '  AND C.IDCONTRATOIMOVEL       = '+IntToStr(iIdContrato)                            +#13;
      sParam2 := sParam2 + '  AND LO.IDCONTRATOIMOVEL      = '+IntToStr(iIdContrato)                            +#13; // Daniel - 26601
    end;

    if iIdUsuarioInc <> -1 then sParam := sParam + '  AND REC_DES.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuarioInc)  +#13;
    if iIdForCli     <> -1 then sParam := sParam + '  AND REC_DES.IDFORCLI         = '+IntToStr(iIdForCli)      +#13;
    if iMes          <> -1 then sParam := sParam + '  AND REC_DES.MESCOMPETENCIA   = '+IntToStr(iMes)           +#13;
    if iAno          <> -1 then sParam := sParam + '  AND REC_DES.ANOCOMPETENCIA   = '+IntToStr(iAno)           +#13;
    if sOrigemLanc   <> '' then sParam := sParam + '  AND REC_DES.FLGORIGEMLANC    = '+QuotedStr(sOrigemLanc)   +#13;

    if (dIniInclusao <> -1) and (dFimInclusao <> -1) then
      sParam := sParam + '  AND REC_DES.TRGDTINCLUSAO BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') AND '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'') '    +#13;

    if (dIniLancto <> -1) and (dFimLancto <> -1) then
      sParam := sParam + '  AND REC_DES.DATALANCAMENTO BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') AND '  +
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'') '      +#13;

    if (dIniVencto <> -1) and (dFimVencto <> -1) then
      sParam := sParam + '  AND REC_DES.DATAVENCIMENTO BETWEEN '+
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') AND '  +
                         'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'') '      +#13;

    // Define Sql
    sSql := 'SELECT 0 AS FLGMARCAR, REC_DES.CODDOCUMENTO, REC_DES.MESCOMPETENCIA, REC_DES.ANOCOMPETENCIA, REC_DES.DATAVENCIMENTO, '                                                                            +#13+
                 // Daniel - 26461 - Adicionado o campo 'IDTIPOCUSTORECIMO' ...
            '       REC_DES.IDTIPOCUSTORECIMO, REC_DES.DATA_BAIXA, REC_DES.DATALIMITE, REC_DES.CODTIPIMOVEL, '                                                                                                 +#13+

            // Daniel - Início -------------------------------------------------
            '       ROUND(REC_DES.TOT_RECEBER,2) AS TOT_RECEBER, '                                                                                                                                             +#13+
            '       ROUND(REC_DES.TOT_RECEBIDO,2) AS TOT_RECEBIDO, '                                                                                                                                           +#13+
            // Daniel - Fim ----------------------------------------------------

            '       ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0))-NVL(REC_DES.TOT_RECEBIDO,0)-NVL(ABONO.TOT_ABONO,0),2) AS DIFERENCA, '                                    +#13+
            '       NVL(CM.VLRACUM,0) AS CORRECAO, NVL(JR.VLRACUM,0) AS JUROS, NVL(MT.VLRACUM,0) AS MULTA, NVL(ABONO.TOT_ABONO,0) AS ABONO, '                                                                  +#13+
            '       C.IDCONTRATOIMOVEL, C.CONNUMERO AS NUMERO_CONTRATO, C.CONNOME AS NOME_CONTRATO, C.CONMESREFREAJUSTE, '                                                                                     +#13+
            '       C.IDINDCORRECAO, C.IDCIDADES, C.IDPAIS, C.CODESTADO, C.CONDIASTOLERANCIA, C.CONDIASREPASSE, '                                                                                              +#13+
            '       C.FLGTIPODIATOLERA, C.CONVLRMULTA, C.CONPERCENTMULTA, C.CONMOEDAMULTA, C.CONVLRMORA, C.CONMOEDAMORA, '                                                                                     +#13+
            '       C.CONPERCENTMORA, C.FLGMORAPROPORC, C.CONPERMORA, (C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO, '                                                                                 +#13+

            // Daniel - 26461
            '       0.00 AS CORRECAODIF, 0.00 AS JUROSDIF, 0.00 AS MULTADIF, 0.00 AS VLRATUAL, 0.00 AS VLRDIVERG, 0.00 AS PROPORCAO '                                                                          +#13+
            // Fim.

            'FROM CONTRATOIMOVEL C, '                                                                                                                                                                          +#13+
            '   ( SELECT LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.CODDOCUMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '                                                                         +#13+
            '            LI.IDTIPOCUSTORECIMO, LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEMA, LI.IDFORCLI, LI.FLGORIGEMLANC, '                                                                           +#13+
            '            SUM( '                                                                                                                                                                                +#13+
            '                DECODE(RTRIM(LD.OPERACAO),''1'',DECODE(D.RECPAG,''R'',DECODE(LD.DEBCRE,''D'',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),0)+ '                                                       +#13+
            '                DECODE(RTRIM(LD.OPERACAO),''2'',DECODE(D.RECPAG,''R'',DECODE(LD.DEBCRE,''D'',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),0)+ '                                                       +#13+
            '                DECODE(RTRIM(LD.OPERACAO),''3'',DECODE(D.RECPAG,''R'',DECODE(LD.DEBCRE,''D'',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),0)+ '                                                       +#13+
            '                DECODE(RTRIM(LD.OPERACAO),''4'',DECODE(D.RECPAG,''R'',DECODE(LD.DEBCRE,''D'',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VALOR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0) '                  +#13+
            '               ) AS TOT_RECEBER, '                                                                                                                                                                +#13+
            '            SUM(DECODE(RTRIM(LD.OPERACAO),''5'',DECODE(D.RECPAG,''R'',DECODE(LD.DEBCRE,''C'',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VALOR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)) AS TOT_RECEBIDO,' +#13+
            '            MAX(BX.DATABAIXA) AS DATA_BAIXA, D.RECPAG '                                                                                                                                           +#13+
            '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, '                                                                                                    +#13+
            '        ( SELECT CODDOCUMENTO, VALOR '                                                                                                                                                            +#13+
            '          FROM LANCTODOCUM '                                                                                                                                                                      +#13+
            '          WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD, '                                                                                             +#13+
            '        ( SELECT D.CODDOCUMENTO, MAX(RP.DATABAIXA) AS DATABAIXA '                                                                                                                                 +#13+
            '          FROM DOCUMENTO D, RECBTOPAGTO RP '                                                                                                                                                      +#13+
            '          WHERE ( D.CODDOCUMENTO = RP.CODDOCUMENTO ) '                                                                                                                                            +#13+
            '          GROUP BY D.CODDOCUMENTO ) BX '                                                                                                                                                          +#13+
            '     WHERE ( LI.CODDOCUMENTO   = D.CODDOCUMENTO ) '                                                                                                                                               +#13+
            '       AND ( LD.DATALANCTO    <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'') ) '                                                                               +#13+

            // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006 - Substitui O FLGNAOCONCILIADO
            '       AND ( LI.FLGESTORNADO IS NULL ) '                                                                                                                                                          +#13+
            '       AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              '                                                                                                                           +#13+
            '                                      FROM CONCILIADOC              '                                                                                                                             +#13+
            '                                      WHERE FLGTIPO = ''A''          '                                                                                                                            +#13+
            '                                        AND IDPARCFINANCIMOV IS NULL '                                                                                                                            +#13+
            '                                        AND DATA <= TO_DATE(''' + FormatDateTime('DD/MM/YYYY', dBaseCalc) + ''', ''DD/MM/YYYY'') ) )'                                                             +#13+
            // Fim - Vinicius 01/11/2006

             '       AND ( C.FLGTIPOCONTRATO = ''L'' OR LI.IDCONTRATOIMOVEL IS NULL ) '                                                                                                                        +#13+
             '       AND ( LD.ESTORNO IS NULL ) '                                                                                                                                                              +#13+
             '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '                                                                                                                                     +#13+
             '       AND ( D.CODDOCUMENTO      = LD.CODDOCUMENTO ) '                                                                                                                                           +#13+
             '       AND ( D.CODDOCUMENTO      = TRD.CODDOCUMENTO ) '                                                                                                                                          +#13+
             '       AND ( D.CODDOCUMENTO      = BX.CODDOCUMENTO(+) ) '                                                                                                                                        +#13+
             '       AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '                                                                                                                                            +#13+
             '       AND ( (LD.CODALTERADOR IS NULL) OR  '                                                                                                                                                     +#13+
             '             (LD.CODALTERADOR IN(T.CODALTMULTA,T.CODALTJUROS,T.CODALTCORRMON) '                                                                                                                  +#13+
             '              AND LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') '                                                                                                                       +#13+
             '              AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB '                                                                                                                                   +#13+
             '                                WHERE CODDOCUMENTO = LD.CODDOCUMENTO '                                                                                                                           +#13+
             '                                  AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ) ) OR  '                                                                                                            +#13+
             '             (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND   '                                                                                                                                    +#13+
             '              LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND   '                                                                                                                                    +#13+
             '              LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0))  ) '                                                                                                                                    +#13+
             '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'')) OR '                                                +#13+
             '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'')) ) '                                                 +#13+
             '     GROUP BY LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.CODDOCUMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '                                                                      +#13+
             '              LI.IDTIPOCUSTORECIMO, LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEMA, LI.IDFORCLI, LI.FLGORIGEMLANC,  '                                                                       +#13+
             '              LI.FLGIMPORTADO, D.STATUS, D.RECPAG ) REC_DES, '                                                                                                                                   +#13+

            '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VLRACUM '                                                                                                     +#13+
            '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '                                                                                                                                                   +#13+
            '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '                                                                                                                                  +#13+
            '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '                                                                                                                                             +#13+
            '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALCM '                                                                                                                                             +#13+
            '            AND LO2.DATAOPER   <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'') '                                                                                +#13+
            '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> ''S'') '                                                                                                                                   +#13+
            '          GROUP BY LO2.CODDOCUMENTO ) UD '                                                                                                                                                        +#13+
            '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALCM '                                                                                                                                               +#13+
            '       AND LO.DATAOPER         = UD.ULTDIA '                                                                                                                                                      +#13+
            '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '                                                                                                                                             +#13+
            sParam2+ // Daniel - 26601
            '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> ''S'') '                                                                                                                                          +#13+
            '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO ) CM, '                                                                                                                         +#13+

            '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VLRACUM '                                                                                                     +#13+
            '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '                                                                                                                                                   +#13+
            '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '                                                                                                                                  +#13+
            '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '                                                                                                                                             +#13+
            '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALJUROS '                                                                                                                                          +#13+
            '            AND LO2.DATAOPER   <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'') '                                                                                +#13+
            '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> ''S'') '                                                                                                                                   +#13+
            '          GROUP BY LO2.CODDOCUMENTO ) UD '                                                                                                                                                        +#13+
            '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALJUROS '                                                                                                                                            +#13+
            '       AND LO.DATAOPER         = UD.ULTDIA '                                                                                                                                                      +#13+
            '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '                                                                                                                                             +#13+
            sParam2+ // Daniel - 26601
            '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> ''S'') '                                                                                                                                          +#13+
            '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO ) JR, '                                                                                                                         +#13+

            '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VLRACUM '                                                                                                     +#13+
            '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '                                                                                                                                                   +#13+
            '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '                                                                                                                                  +#13+
            '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '                                                                                                                                             +#13+
            '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALMULTA '                                                                                                                                          +#13+
            '            AND LO2.DATAOPER   <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'') '                                                                                +#13+
            '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> ''S'') '                                                                                                                                   +#13+
            '          GROUP BY LO2.CODDOCUMENTO ) UD '                                                                                                                                                        +#13+
            '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALMULTA '                                                                                                                                            +#13+
            '       AND LO.DATAOPER         = UD.ULTDIA '                                                                                                                                                      +#13+
            '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '                                                                                                                                             +#13+
            sParam2+ // Daniel - 26601
            '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> ''S'') '                                                                                                                                          +#13+
            '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO ) MT, '                                                                                                                         +#13+

            '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, SUM(LO.VLRACUM) AS TOT_ABONO '                                                                                                                  +#13+
            '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '                                                                                                                                                   +#13+
            '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '                                                                                                                                  +#13+
            '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '                                                                                                                                             +#13+
            '          WHERE ( LO2.IDOPERACAO = PI2.IDOPERABONOMULTA OR '                                                                                                                                      +#13+
            '                  LO2.IDOPERACAO = PI2.IDOPERABONOJUROS OR '                                                                                                                                      +#13+
            '                  LO2.IDOPERACAO = PI2.IDOPERABONOCM )     '                                                                                                                                      +#13+
            '            AND LO2.DATAOPER   <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dBaseCalc))+',''DD/MM/YYYY'') '                                                                                +#13+
            '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> ''S'') '                                                                                                                                   +#13+
            '          GROUP BY LO2.CODDOCUMENTO ) UD '                                                                                                                                                        +#13+
            '     WHERE ( LO.IDOPERACAO = PI.IDOPERABONOMULTA OR '                                                                                                                                             +#13+
            '             LO.IDOPERACAO = PI.IDOPERABONOJUROS OR '                                                                                                                                             +#13+
            '             LO.IDOPERACAO = PI.IDOPERABONOCM )     '                                                                                                                                             +#13+
            '       AND LO.DATAOPER         = UD.ULTDIA '                                                                                                                                                      +#13+
            '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '                                                                                                                                             +#13+
            sParam2+ // Daniel - 26601
            '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> ''S'') '                                                                                                                                          +#13+
            '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL ) ABONO '                                                                                                                                      +#13+
            'WHERE ( REC_DES.RECPAG           = ''R'' ) '                                                                                                                                                      +#13+
            '  AND ( REC_DES.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '                                                                                                                                      +#13+
            '  AND ( REC_DES.IDCONTRATOIMOVEL = CM.IDCONTRATOIMOVEL(+) ) '                                                                                                                                     +#13+
            '  AND ( REC_DES.CODDOCUMENTO     = CM.CODDOCUMENTO(+) ) '                                                                                                                                         +#13+
            '  AND ( REC_DES.IDCONTRATOIMOVEL = JR.IDCONTRATOIMOVEL(+) ) '                                                                                                                                     +#13+
            '  AND ( REC_DES.CODDOCUMENTO     = JR.CODDOCUMENTO(+) ) '                                                                                                                                         +#13+
            '  AND ( REC_DES.IDCONTRATOIMOVEL = MT.IDCONTRATOIMOVEL(+) ) '                                                                                                                                     +#13+
            '  AND ( REC_DES.CODDOCUMENTO     = MT.CODDOCUMENTO(+) ) '                                                                                                                                         +#13+
            '  AND ( REC_DES.IDCONTRATOIMOVEL = ABONO.IDCONTRATOIMOVEL(+) ) '                                                                                                                                  +#13+
            '  AND ( REC_DES.CODDOCUMENTO     = ABONO.CODDOCUMENTO(+) ) '                                                                                                                                      +#13;

            if bApenasDocsPagoVlrOrig then begin
               sSql := sSql + '  AND ( NVL(REC_DES.TOT_RECEBER,0) = NVL(REC_DES.TOT_RECEBIDO,0) ) '                                                                                                            +#13+
                              '  AND ( REC_DES.DATA_BAIXA > REC_DES.DATALIMITE ) '                                                                                                                             +#13;
            end else begin
               sSql := sSql + '  AND ( ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0)-NVL(REC_DES.TOT_RECEBIDO,0)-NVL(ABONO.TOT_ABONO,0)),2) <> 0) '                         +#13;
            end;

    sSql := sSql + sParam + 'ORDER BY NUMERO_CONTRATO, DATAVENCIMENTO, ANOCOMPETENCIA, MESCOMPETENCIA, CODDOCUMENTO ';
  end;

  Result := GetDataPacket( sSql );
end;

function TCtrlConcilia.LookupValorOriginalVencido(const iIdContrato,iIdUsuario,iIdForCli,iMes,iAno:Integer;
                                                  const sOrigemLanc:String;
                                                  const dIniInclusao,dFimInclusao,dIniLancto,dFimLancto,dIniVencto,dFimVencto:TDateTime): OLEVariant;
var sSql, sParam : String;
begin
  Result  := True;

  // Define Paramêtros
  sParam := '';

  if iIdUsuario      > 0 then sParam := sParam + 'AND (V.IDUSUARIOSISTEMA = '+IntToStr(iIdUsuario)+') '                                  +#13;
  if iIdContrato     > 0 then sParam := sParam + 'AND (V.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)+') '                                 +#13;
  if iIdForCli       > 0 then sParam := sParam + 'AND (V.IDFORCLI = '+IntToStr(iIdForCli)+') '                                           +#13;
  if sOrigemLanc    <>'' then sParam := sParam + 'AND (V.FLGORIGEMLANC = '+QuotedStr(sOrigemLanc)+') '                                   +#13;

  if (iMes <> -1) and (iAno <> -1) then
    sParam := sParam + 'AND ((V.MESCOMPETENCIA = '+IntToStr(iMes)+') AND (V.ANOCOMPETENCIA = '+IntToStr(iAno)+')) '                      +#13;

  if (dIniInclusao>0) and (dFimInclusao>0) then
    sParam := sParam + 'AND (V.TRGDTINCLUSAO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniInclusao))+',''DD/MM/YYYY'') ' +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimInclusao))+',''DD/MM/YYYY'')) '                         +#13;

  if (dIniLancto>0) and (dFimLancto>0) then
    sParam := sParam + 'AND (V.DATALANCAMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniLancto))+',''DD/MM/YYYY'') '  +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimLancto))+',''DD/MM/YYYY'')) '                           +#13;

  if (dIniVencto>0) and (dFimVencto>0) then
    sParam := sParam + 'AND (V.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dIniVencto))+',''DD/MM/YYYY'') '  +
                       'AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dFimVencto))+',''DD/MM/YYYY'')) '                           +#13;

  sSql := 'SELECT DISTINCT V.CODDOCUMENTO,     V.DATAVENCIMENTO,     V.DATA_BAIXA, '                     +#13+
          '                V.TOT_RECEBER,      V.TOT_RECEBIDO,       V.FLGNAOCONCILIADO, '               +#13+
          '                V.IDCONTRATOIMOVEL, V.IDCIDADES,          V.IDPAIS, '                         +#13+
          '                V.CODESTADO,        V.CONDIASTOLERANCIA,  V.FLGTIPODIATOLERA, '               +#13+
          '                CONTRATO_EXTENSO,   V.MESCOMPETENCIA,     V.ANOCOMPETENCIA, '                 +#13+
          '                V.DATALIMITE,       V.CONDIASREPASSE,    (V.DATA_BAIXA-V.DATALIMITE) AS DIF ' +#13+
          'FROM VWLANCAMENTO V '                                                                         +#13+
          'WHERE ( V.IDMODULO = 64 ) '                                                                   +#13+
          '  AND ( V.STATUS_DOC = ''2'' ) '                                                              +#13+
          '  AND ( V.FLGNAOCONCILIADO = 1 ) '                                                            +#13+
          '  AND ( V.RECPAG = ''R'' ) '                                                                  +#13+
          '  AND ( V.TOT_RECEBER = V.TOT_RECEBIDO ) '                                                    +#13+sParam;

  sSql := sSql + 'ORDER BY DIF, V.CONTRATO_EXTENSO ';

  Result := GetDataPacket( sSql );
end;

function TCtrlConcilia.AbonaDocumento(const iCodDocumento:Integer;
                                      const sMotivo:String;
                                      const fDiferenca:Double): Boolean;
var sSql: String;
begin
  Result := True;

  try
    StartTransaction;

    sSql := 'UPDATE DOCUMENTO SET FLGNAOCONCILIADO = NULL ' +#13+
            'WHERE CODDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));

    // Executa o Sql
    if not ExecSQL(sSql) then
      raise Exception.Create( MessageInfo );

    if not (GravaMotivoConciliacao(iCodDocumento,-1,-1,Sistema.IdUsuario,-1,-1,-1,-1,sMotivo,'A',Date)) then
      raise Exception.Create( MessageInfo );

    Commit;
  except
    on e : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := e.message;
    end;
  end;

end;

function TCtrlConcilia.ExcluiMotivoConciliacao(const iCodDocumento,iParcFinancImov:Integer;
                                               const sFlgTipo:String): Boolean;
var sSql, sParam: String;
begin
  Result := True;

  // Define Paramêtros
  sParam := '';

  if iParcFinancImov <> -1 then sParam := sParam + '  AND IDPARCFINANCIMOV = '+IntToStr(iParcFinancImov) +#13;
  if sFlgTipo        <> '' then sParam := sParam + '  AND FLGTIPO          = '+QuotedStr(sFlgTipo)       +#13;

  try
    StartTransaction;

    sSql := 'DELETE FROM CONCILIADOC '                                +#13+
            'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento)) +#13+sParam;

    // Executa o Sql
    if not ExecSQL(sSql) then
      raise Exception.Create( MessageInfo );

    Commit;
  except
    on e : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := e.message;
    end;
  end;
end;

function TCtrlConcilia.GravaMotivoConciliacao(const iCodDocumento,iIdConciliaDoc,iParcFinancImov,iIdUsuario,
                                                    iCodDocDiverge,iNumLanctoDiverge,iDifDias,iDifValor:Integer;
                                              const sMotivo,sFlgTipo:String;
                                              const dDataConcilia:TDateTime): Boolean;
var sSql: String;
begin
  Result := True;

  try
    StartTransaction;

    { COMENTÁRIO ANTERIOR NA ROINA EM DUAS CAMADAS ----------------------------
      Exclui o Motivo da Conciliação antes pois o usuário do "Contas a Receber"
      pode ter alterado o Lançamento de Pagamento colocando o "FLGNAOINTEGRADO"
      como "1" e o Motivo do Abono neste caso conteria um lixo... }
    if not ( ExcluiMotivoConciliacao(iCodDocumento,iParcFinancImov,sFlgTipo) ) then
       raise Exception.Create( MessageInfo );

    sSql := 'INSERT INTO CONCILIADOC '                                            +#13+
            '     ( IDCONCILIADOC, '                                              +
            '       IDDOCUMENTO, '                                                +
            '       IDPARCFINANCIMOV, '                                           +
            '       IDUSUARIO, '                                                  +
            '       IDDOCDIVERGE, '                                               +
            '       NUMLANCTODIVERGE, '                                           +
            '       DIFDIAS, '                                                    +
            '       DIFVLR, '                                                     +
            '       MOTIVO, '                                                     +
            '       DATA, '                                                       +
            '       FLGTIPO ) '                                                   +#13+
            'VALUES '                                                             +#13+
            '     ( '+IntToStr(LeultRegistro(Nil,'CONCILIADOC'))+', ';

                      if (iCodDocumento<>-1) then
                        sSql := sSql+IntToStr(iCodDocumento)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (iParcFinancImov<>-1) then
                        sSql := sSql+IntToStr(iParcFinancImov)+', '
                      else
                        sSql := sSql+'Null , ';

                      sSql := sSql+IntToStr(iIdUsuario)+', ';

                      if (iCodDocDiverge<>-1) then
                        sSql := sSql+IntToStr(iCodDocDiverge)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (iNumLanctoDiverge<>-1) then
                        sSql := sSql+IntToStr(iNumLanctoDiverge)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (iDifDias<>-1) then
                        sSql := sSql+IntToStr(iDifDias)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (iDifValor<>-1) then
                        sSql := sSql+IntToStr(iDifValor)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (sMotivo<>'') then
                        sSql := sSql+QuotedStr(sMotivo)+', '
                      else
                        sSql := sSql+'Null , ';

                      if (dDataConcilia<>-1) then
                        sSql := sSql+QuotedStr(DateToStr(dDataConcilia))+', '
                      else
                        sSql := sSql+'Null , ';

                      sSql := sSql+QuotedStr(sFlgTipo)+' ) ';

    // Executa o Sql
    if not ExecSQL(sSql) then
      raise Exception.Create( MessageInfo );

    Commit;
  except
    on e : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := e.message;
    end;
  end;
end;

end.
