unit uCtrlPadrLancImovel;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE ATIVIDADES  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Alex de Queiroz Pereira
//	Data de Início  :  11/07/2002
//	Data de Término :  11/07/2002
//
// -----------------------------------------------------------------------------
//------------------------------------------------------------------------------
//SOL      : 136341
//KINTANA : 815095
//Responsável : Helen V Bianchi
//Data        : 09/10/2011
//Descrição   : Implementação da Confissão de Divida
//Rotina      : BuscaPadrLancContabil , AbrePadrLanc
//------------------------------------------------------------------------------
interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uDbPadrLancImovel,
     uCMTypes, uComunsImobiliario, {uCtrlSegregacao,} uCtrlParamIntegra,
     uCtrlImobSegregacao;

Type
  TParamContabeisMT = Record
    sContaContabilDebito    : string;
    sCentroCustoDebito      : string;
    sSubContaDebito         : string;
    sContaContabilCredito   : string;
    sCentroCustoCredito     : string;
    sSubContaCredito        : string;
    sContaContabilAntecipa  : string;
    sHistoricoCtb           : string;
    sHistoricoCapCar        : string;
    sTipCodigo              : string;
    iPlanilha               : integer;
    iCodDocumento           : integer;
    iIdRateioDocum          : integer;
    iExercicio              : integer;
    iPeriodo                : integer;
    iUnidNegoc              : integer;
    iIdSegregaCriter        : integer;
    sContaDebCred           : string;
    sContaResult            : string;
    sCentroCustoDebCred     : string;
    sCentroCustoResult      : string;
    sSubContaDebCred        : string;
    sSubContaResult         : string;
    sContaSegregaCriter     : string;
    sCodCentroRespon        : string;
    sCodCentroCusto         : string;
    sCodTipRecDes           : string;
    sCodTipImovel           : string;
    bFlgIntegraCapCar       : Boolean;
    bFlgIntegraContab       : Boolean;
  end;

  TCtrlPadrLancImovel = class(TCmControlObject)
  private
    //CtrlSegregacao      : TCtrlSegregacao;
    CtrlParamIntegra    : TCtrlParamIntegra;
    CtrlImobSegregacao  : TCtrlImobSegregacao;
    ParamSistema        : TParamSistema;

    FCdsPadrLancImovel: TCMClientDataSet;
    FDbPadrLancImovel: TDbPadrLancImovel;
    procedure SetCdsPadrLancImovel(const Value: TCMClientDataSet);
    procedure SetDbPadrLancImovel(const Value: TDbPadrLancImovel);

  protected
    procedure AfterInitialize;  Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create (const iIdEmpresa, iIdModulo: Integer); reintroduce;
    destructor  Destroy; override;

    property DbPadrLancImovel  : TDbPadrLancImovel read FDbPadrLancImovel write SetDbPadrLancImovel;
    property CdsPadrLancImovel : TCMClientDataSet read FCdsPadrLancImovel write SetCdsPadrLancImovel;

    function GravaPadrLancImovel  : Boolean;
    function LookUpPadrLancImovel(const iIdPessoa: integer; const iIdPadrLancImovel: integer = -1; const iIdTipoCustoRecImo: integer = -1; const iIdContratoImovel: integer = -1; const iIdImovel: integer = -1; const sCodTipImovel: string = ''): OleVariant;

    function BuscaPadrLancContabil(var ParamIntegra: TParamContabeisMT; var iCodErro:Integer; const sRecPag: string; const bDiario: boolean; const iEmpresaProp, iModulo, iTipoRecDes: integer;
                                   const sTipoImovel: string = ''; const iImovel: integer = -1; const iContrato: integer = -1;
{Helen - SOL: 136341 Kintana : 815095}  const sAcresDes: String = '' ): boolean;
    procedure ZeraPadrLancContabil (var ParamIntegra: TParamContabeisMT);
    procedure ZeraVetorPadrLancContabil (var ParamIntegra: array of TParamContabeisMT);

    function AbrePadrLanc(var ParamIntegra: TParamContabeisMT; const sRecPag: string; const bDiario: boolean;
                          const iEmpresaProp, iModulo, iTipoRecDes: integer;
                          const sTipoImovel: string = '';
                          const iImovel: integer = -1; const iContrato: integer = -1;
{Helen - SOL: 136341 Kintana : 815095}  const sAcresDes: String = ''): OleVariant;
  published

end;

implementation

{ TCtrlPadrLancImovel }


constructor TCtrlPadrLancImovel.Create(const iIdEmpresa, iIdModulo: Integer);
begin
  inherited Create;
  // Cria uma instância dos CtrlObjects Externos
  //CtrlSegregacao    := TCtrlSegregacao.Create;
  CtrlParamIntegra  := TCtrlParamIntegra.Create;
  CtrlImobSegregacao := TCtrlImobSegregacao.Create;

  // Cria os DbOjbects
  FDbPadrLancImovel := TDbPadrLancImovel.Create( Self );

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa      := iIdEmpresa;
  ParamSistema.idModulo       := iIdModulo;
  ParamSistema.idUsuario      := -1;
end;

destructor TCtrlPadrLancImovel.Destroy;
begin
  // Destroi os CtrlObjects Externos
  //FreeAndNil( CtrlSegregacao );
  FreeAndNil( CtrlParamIntegra );

  // Destrói os DbObjects criados
  FreeAndNil (FDbPadrLancImovel);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil(FCdsPadrLancImovel);
  end;
  inherited;
end;


procedure TCtrlPadrLancImovel.AfterInitialize;
begin
  inherited;
  // Inicializa os CtrlObjects Externos
  //CtrlSegregacao.InitializeAs( Self );
  CtrlParamIntegra.InitializeAs( Self );
  CtrlImobSegregacao.InitializeAs(Self);

  // define o DataBase a ser utilizado
  FDbPadrLancImovel.DataBaseName := DataBaseName;

  // Inibe o popup da messageinfo nos ctrls internos
  CtrlParamIntegra.OnMessageInfo   := nil;
  //CtrlSegregacao.OnMessageInfo     := nil;
  CtrlImobSegregacao.OnMessageInfo := nil;

  // Busca parämetros globais
  CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','', tiSistema);
  //CtrlSegregacao.GetParams(ParamSistema.idEmpresa);
  CtrlImobSegregacao.GetParams(ParamSistema.idEmpresa);
end;



function TCtrlPadrLancImovel.AbrePadrLanc(var   ParamIntegra   : TParamContabeisMT;
                                          const sRecPag        : string;
                                          const bDiario        : boolean;
                                          const iEmpresaProp,
                                                iModulo,
                                                iTipoRecDes    : integer;
                                          const sTipoImovel    : string;
                                          const iImovel,
                                                iContrato      : integer;
{Helen - SOL: 136341 Kintana : 815095}    const sAcresDes      : String ): OleVariant;
var
   sSQL, sFiltro: string;
begin
   sFiltro := '';
   if bDiario           then sFiltro := sFiltro + '   AND (P.FLGDIARIO = ''S'') '+#13
   else                      sFiltro := sFiltro + '   AND (P.FLGDIARIO = ''N'') '+#13;

   if sTipoImovel <> '' then sFiltro := sFiltro + '   AND (P.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel) + ') '+#13
   else                      sFiltro := sFiltro + '   AND (P.CODTIPIMOVEL IS NULL) '+#13;

   if iTipoRecDes <> -1 then sFiltro := sFiltro + '   AND (P.IDTIPOCUSTORECIMO = ' + IntToStr(iTipoRecDes) + ') '+#13
   else                      sFiltro := sFiltro + '   AND (P.IDTIPOCUSTORECIMO IS NULL) '+#13;

   if iImovel <> -1     then sFiltro := sFiltro + '   AND (P.IDIMOVEL = ' + IntToStr(iImovel) + ') '+#13
   else                      sFiltro := sFiltro + '   AND (P.IDIMOVEL IS NULL) '+#13;

   if iContrato <> -1   then sFiltro := sFiltro + '   AND (P.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') '+#13
   else                      sFiltro := sFiltro + '   AND (P.IDCONTRATOIMOVEL IS NULL) '+#13;
   // Helen - SOL: 136341 Kintana : 815095 - Inicio
   if sAcresDes <> '' then
      sFiltro := sFiltro + '   AND (T.FLGTIPOOPER = ''' + (sAcresDes) + ''') '+#13;
   // Helen - SOL: 136341 Kintana : 815095 - Fim

   sSQL :=
   'SELECT '                                                                              + #13 +
   '   P.IDPADRLANCIMOVEL, P.IDMODULO, P.RECPAG, P.DESCPADRLANCIMO, '                     + #13 +
   '   P.FLGINTEGRACAPCAR, P.FLGINTEGRACONTAB, P.IDPESSOA, P.CODTIPIMOVEL, '              + #13 +
   '   P.IDTIPOCUSTORECIMO, P.IDIMOVEL, P.IDCONTRATOIMOVEL, P.CODCENTRORESPON, '          + #13 +
   '   P.CODTIPRECDES, P.PLANO, P.IDEMPRESA, P.CONTARESULT, P.CENTROCUSTORESULT, '        + #13 +
   '   P.PLACONTAANT ,' + #13 + // Daniel Simões ...
   '   P.CONTADEBCRE, P.CENTROCUSTODEBCRE, P.UNIDNEGOC, P.TIPCODIGO, P.CODCENTROCUSTO, '  + #13 +
   '   TRD.ATIVO AS RECDES_ATIVO, CCD.ATIVO AS CCUSTD_ATIVO, CCR.ATIVO AS CCUSTR_ATIVO '  + #13 +
   'FROM '                                                                                + #13 +
   '   PADRLANCIMOVEL  P,   '                                                             + #13 +
   '   TIPORECEBDESEMB TRD, '                                                             + #13 +
   '   CENTCUST        CCD, '                                                             + #13 +
   '   CENTCUST        CCR, '                                                             + #13 +
   '   TIPOCUSTORECIMOV  T '  + #13 +   //Helen - SOL: 136341 Kintana : 815095
   'WHERE '                                                                               + #13 +
   '       ( P.IDPESSOA          = TRD.IDPESSOA(+) )     '                                + #13 +
   '   AND ( P.RECPAG            = TRD.RECPAG(+) )       '                                + #13 +
   '   AND ( P.CODTIPRECDES      = TRD.CODTIPRECDES(+) ) '                                + #13 +
   '   AND ( P.CENTROCUSTODEBCRE = CCD.CODCENTROCUSTO(+) ) '                              + #13 +
   '   AND ( P.CENTROCUSTORESULT = CCR.CODCENTROCUSTO(+) ) '                              + #13 +
   '   AND ( P.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+)) '+ #13 + //Helen - SOL: 136341 Kintana : 815095
   '   AND ( P.IDPESSOA          = ' + IntToStr ( iEmpresaProp ) + ' ) '                  + #13 +
   '   AND ( P.IDMODULO          = ' + IntToStr( iModulo ) + ' ) '                        + #13 +
   '   AND ( P.RECPAG            = ' + QuotedStr ( sRecPag ) + ' ) '                      + #13;

   sSQL := sSQL + sFiltro;

   Result := GetDataPacket(sSQL);
end;



function TCtrlPadrLancImovel.BuscaPadrLancContabil(var ParamIntegra: TParamContabeisMT;
                                                   var iCodErro: Integer;
                                                   const sRecPag: string;
                                                   const bDiario: boolean;
                                                   const iEmpresaProp, iModulo, iTipoRecDes: integer;
                                                   const sTipoImovel: string;
                                                   const iImovel, iContrato: integer;
{Helen - SOL: 136341 Kintana : 815095}             const sAcresDes: String ): boolean;
{sAcresDes <>  '' apenas Confissao de Divida}
var CdsLocal: TCMClientDataSet;
    iImovelMestre : Integer;
begin
   // ----------------------------------------------------------------------------------------------
   // ORDEM DE PESQUISA, SE ALTERAR MUDAR O HELP
   // ----------------------------------------------------------------------------------------------
   //    7) Tipo de Imóvel
   //    6) Tipo de Receita/Despesa
   //    5) Imóvel
   //    4) Contrato
   //    3) Tipo de Imóvel + Tipo de Receita/Despesa
   //    2) Imóvel + Tipo de Receita
   //    1) Contrato + Tipo de Receita/Despesa
   // ----------------------------------------------------------------------------------------------

  // nenhum padrão encontrado, a princípio
  Result   := False;
  iCodErro := 0;
  try
    CdsLocal := TCMClientDataSet.Create (nil);
    // Helen - SOL: 136341 Kintana : 815095 - Inicio
    // ---------------------------------------------------------------------------------------------

    // 0º Passo: Contrato + Tipo de Receita (caso mais detalhado)
    if ( (sAcresDes <> '') and (iTipoRecDes > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, sTipoImovel, -1, -1,sAcresDes);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------
    // Helen - SOL: 136341 Kintana : 815095 - Fim

    // 1º Passo: Contrato + Tipo de Receita (caso mais detalhado)
    //if ( (iContrato > 0) and (iTipoRecDes > 0) ) then begin - Helen - SOL: 136341 Kintana : 815095
    if ( not(Result) and (iContrato > 0) and (iTipoRecDes > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, '', -1, iContrato);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 2º Passo: Imóvel + Tipo de Receita/Despesa
    if ( not(Result) and (iImovel > 0) and (iTipoRecDes > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, '', iImovel, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // Marchetti - Pendencia 19719
    // 3º Passo: Imóvel Mestre + Tipo de Receita/Despesa
    if ( not(Result) and (iImovel > 0 ) and (iTipoRecDes > 0) ) then begin

       CdsLocal.Data := GetDataPacket('SELECT DECODE(IDIMOVELMESTRE,NULL,IDIMOVEL,IDIMOVELMESTRE) AS IDIMOVELMESTRE FROM IMOVEL WHERE IDIMOVEL = ' + IntToStr(iImovel));

       if (not cdsLocal.IsEmpty) then
          iImovelMestre := cdsLocal.FieldByName('IDIMOVELMESTRE').AsInteger;

       CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, '', iImovelMestre, -1);

       // Erro: ambigüidade no Padrão de Lançamento
       if CdsLocal.RecordCount > 1 then begin
         iCodErro := -7;
         exit;
       end else if CdsLocal.RecordCount = 1 then begin
         Result := True;
       end;
    end;
    // Fim Marchetti - Pendencia 19719

    // ---------------------------------------------------------------------------------------------

    // 4º Passo: Tipo de Imóvel + Tipo de Receita/Despesa
    //if ( not(Result) and (sTipoImovel <> '') and (iTipoRecDes > 0) ) then begin  Helen - SOL: 136341 Kintana : 815095 add  sAcresDes
      if ( not(Result) and (sTipoImovel <> '') and (iTipoRecDes > 0) and (sAcresDes = '') ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, sTipoImovel, -1, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 4º Passo: Contrato
    if ( not(Result) and (iContrato > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, -1, '', -1, iContrato);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 5º Passo: Imóvel
    if ( not(Result) and (iImovel > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, -1, '', iImovel, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 6º Passo: Tipo de Receita/Despesa
    if ( not(Result) and (iTipoRecDes > 0) ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, iTipoRecDes, '', -1, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 7º Passo: Tipo de Imóvel
    if ( not(Result) and (sTipoImovel <> '') ) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, -1, sTipoImovel, -1, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // 8º Passo: Todas as despesas
    if not(Result) then begin
      CdsLocal.Data := AbrePadrLanc (ParamIntegra, sRecPag, bDiario, iEmpresaProp, iModulo, -1, '', -1, -1);
      // Erro: ambigüidade no Padrão de Lançamento
      if CdsLocal.RecordCount > 1 then begin
        iCodErro := -7;
        exit;
      end else if CdsLocal.RecordCount = 1 then begin
        Result := True;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    // Finalmentes: resultado da Busca
    // verifica se agora foi encontrado algum Padrão de Lançamento
    if ( Result ) then begin

      // Verifica se o tipo de desembolso está ativo
      if cdsLocal.FieldByName('RECDES_ATIVO').AsString = 'N' then begin
         iCodErro := -9;
         Result   := False;
         Exit;
      end;

      // Verifica se o os centros de custos estão ativo
      if ( (not cdsLocal.FieldByName('CENTROCUSTODEBCRE').IsNull) and
               (cdsLocal.FieldByName('CCUSTD_ATIVO').AsString = 'N') ) or
         ( (not cdsLocal.FieldByName('CENTROCUSTORESULT').IsNull) and
               (cdsLocal.FieldByName('CCUSTR_ATIVO').AsString = 'N') ) then begin
         iCodErro := -19;
         Result   := False;
         Exit;
      end;

      with ParamIntegra do begin
        if (sRecPag = 'R') or (sRecPag = 'O') or (sRecPag = 'I') then begin
          sContaContabilDebito  := CdsLocal.FieldByName('CONTADEBCRE').AsString;
          sCentroCustoDebito    := CdsLocal.FieldByName('CENTROCUSTODEBCRE').AsString;
          sContaContabilCredito := CdsLocal.FieldByName('CONTARESULT').AsString;
          sCentroCustoCredito   := CdsLocal.FieldByName('CENTROCUSTORESULT').AsString;
          sContaContabilAntecipa:= CdsLocal.FieldByName('PLACONTAANT').AsString;
        end else begin
          sContaContabilDebito  := CdsLocal.FieldByName('CONTARESULT').AsString;
          sCentroCustoDebito    := CdsLocal.FieldByName('CENTROCUSTORESULT').AsString;
          sContaContabilCredito := CdsLocal.FieldByName('CONTADEBCRE').AsString;
          sCentroCustoCredito   := CdsLocal.FieldByName('CENTROCUSTODEBCRE').AsString;
          sContaContabilAntecipa:= '';
        end;

        sContaDebCred       := cdsLocal.FieldByName('CONTADEBCRE').AsString;
        sContaResult        := cdsLocal.FieldByName('CONTARESULT').AsString;
        sCentroCustoDebCred := cdsLocal.FieldByName('CENTROCUSTODEBCRE').AsString;
        sCentroCustoResult  := cdsLocal.FieldByName('CENTROCUSTORESULT').AsString;
        sCodCentroRespon    := cdsLocal.FieldByName('CODCENTRORESPON').AsString;

        sCodCentroCusto     := cdsLocal.FieldByName('CODCENTROCUSTO').AsString;

        sCodTipRecDes       := cdsLocal.FieldByName('CODTIPRECDES').AsString;
        sTipCodigo          := cdsLocal.FieldByName('TIPCODIGO').AsString;
        iUnidNegoc          := cdsLocal.FieldByName('UNIDNEGOC').AsInteger;

        bFlgIntegraCapCar   := cdsLocal.FieldByName('FLGINTEGRACAPCAR').AsInteger = 1;
        bFlgIntegraContab   := cdsLocal.FieldByName('FLGINTEGRACONTAB').AsInteger = 1;
        //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Início
        iIdSegregaCriter    := -1;
        //Busca o Critério de Segregação
        {iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                            CtrlParamIntegra.PlanoPrevGlobal,
                                                            CtrlParamIntegra.PatroGlobal,
                                                           sContaResult,
                                                            sContaSegregaCriter);
        if iIdSegregaCriter = -1 then
           iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                               CtrlParamIntegra.PlanoPrevGlobal,
                                                               CtrlParamIntegra.PatroGlobal,
                                                               sContaDebCred,
                                                               sContaSegregaCriter);
        iIdSegregaCriter := CtrlImobSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                    CtrlParamIntegra.PlanoPrevGlobal,
                                                                    CtrlParamIntegra.PatroGlobal,
                                                                    sContaResult,
                                                                    sContaSegregaCriter);

        if iIdSegregaCriter = -1 then
          iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                  CtrlParamIntegra.PlanoPrevGlobal,
                                                                  CtrlParamIntegra.PatroGlobal,
                                                                  sContaDebCred,
                                                                  sContaSegregaCriter);}
        //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Fim
      end;
    end
    else
      iCodErro := -8;
  finally
    FreeAndNil ( CdsLocal );
    MessageInfo := ComunsImobiliario.ErroIntegra( iCodErro );
  end;
end;


function TCtrlPadrLancImovel.GravaPadrLancImovel: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaPadrLancImovel( CdsPadrLancImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsPadrLancImovel, DbPadrLancImovel, [], [] );
      sMsg   := DbPadrLancImovel.MessageInfo;

      if not Result then raise Exception.Create( sMsg );
      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPadrLancImovel.LookUpPadrLancImovel(const iIdPessoa, iIdPadrLancImovel, iIdTipoCustoRecImo, iIdContratoImovel, iIdImovel: integer; const sCodTipImovel: string): OleVariant;
var
  sSql, sFiltro: string;
begin

  sFiltro := '  AND ( PAD.IDPESSOA = ' + IntToStr(iIdPessoa) + ' ) ' + #13;
  if iIdPadrLancImovel  <> -1 then sFiltro := sFiltro + '  AND ( PAD.IDPADRLANCIMOVEL = '  + IntToStr(iIdPadrLancImovel)  + ' ) ' + #13;
  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '  AND ( PAD.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo) + ' ) ' + #13;
  if iIdContratoImovel  <> -1 then sFiltro := sFiltro + '  AND ( PAD.IDCONTRATOIMOVEL = '  + IntToStr(iIdContratoImovel)  + ' ) ' + #13;
  if iIdImovel          <> -1 then sFiltro := sFiltro + '  AND ( PAD.IDIMOVEL = '          + IntToStr(iIdImovel)          + ' ) ' + #13;
  if sCodTipImovel      <> '' then sFiltro := sFiltro + '  AND ( PAD.CODTIPIMOVEL = '      + QuotedStr(sCodTipImovel)     + ' ) ' + #13;



  sSql := 'SELECT ' + #13 +
          '  PAD.IDPADRLANCIMOVEL  , PAD.UNIDNEGOC         , PAD.IDPESSOA          , PAD.RECPAG            , ' + #13 +
          '  PAD.CODTIPRECDES      , PAD.TIPCODIGO         , PAD.SUBCONTARESULT    , PAD.CODCENTRORESPON   , ' + #13 +
          '  PAD.CENTROCUSTORESULT , PAD.IDEMPRESA         , PAD.CENTROCUSTODEBCRE , PAD.CONTADEBCRE       , ' + #13 +
          '  PAD.PLANO             , PAD.CONTARESULT       , PAD.IDCARTEIRAINVEST  , PAD.CODTIPIMOVEL      , ' + #13 +
          '  PAD.IDCONTRATOIMOVEL  , PAD.IDTIPOCUSTORECIMO , PAD.IDIMOVEL          , PAD.FLGRESPPAGAMENTO  , ' + #13 +
          '  PAD.FLGINTEGRACAPCAR  , PAD.FLGINTEGRACONTAB  , PAD.SUBCONTADEBCRE    , PAD.DESCPADRLANCIMO   , ' + #13 +
          // Daniel Simões - 13/03/2006 - Adicionado o campo "PAD.PLACONTAANT" ( p:20315 ) ...
          '  PAD.IDMODULO          , PAD.FLGDIARIO         , PAD.CODCENTROCUSTO    , PAD.PLACONTAANT       , ' + #13 +
          '  DECODE(IM.IMONOME, NULL, I.IMONOME, IM.IMONOME ||'' - ''|| I.IMONOME) AS IMOVEL_EXTENSO, ' + #13 +
          '  DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO ||'' - ''|| C.CONNOME) AS CONTRATO_EXTENSO ' + #13 +
          'FROM ' + #13 +
          '  PADRLANCIMOVEL PAD, IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C ' + #13 +
          'WHERE ' + #13 +
          '  ( PAD.IDIMOVEL = I.IDIMOVEL(+) ) ' + #13 +
          '  AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) ) ' + #13 +
          '  AND ( PAD.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) ' + #13 +
          sFiltro;

  Result := GetDataPacket (sSql);
end;

procedure TCtrlPadrLancImovel.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsPadrLancImovel := TCMClientDataSet.Create( nil );
end;

procedure TCtrlPadrLancImovel.SetCdsPadrLancImovel(const Value: TCMClientDataSet);
begin
  FCdsPadrLancImovel := Value;
end;

procedure TCtrlPadrLancImovel.SetDbPadrLancImovel(const Value: TDbPadrLancImovel);
begin
  FDbPadrLancImovel := Value;
end;

procedure TCtrlPadrLancImovel.ZeraPadrLancContabil(var ParamIntegra: TParamContabeisMT);
begin
  with ParamIntegra do begin
    sContaContabilDebito  := '';
    sCentroCustoDebito    := '';
    sContaContabilCredito := '';
    sCentroCustoCredito   := '';
    sContaSegregaCriter   := '';
    sContaContabilAntecipa:= '';
    sHistoricoCtb         := '';
    sHistoricoCapCar      := '';
    iPlanilha             := -1;
    iExercicio            := -1;
    iPeriodo              := -1;
    iUnidNegoc            := -1;
    iIdSegregaCriter      := -1;

    sSubContaDebito       := '';
    sSubContaCredito      := '';
    sContaDebCred         := '';
    sContaResult          := '';
    sCentroCustoDebCred   := '';
    sCentroCustoResult    := '';
    sSubContaDebCred      := '';
    sSubContaResult       := '';
    sCodCentroRespon      := '';
    sCodCentroCusto       := '';
    sCodTipRecDes         := '';
    sCodTipImovel         := '';
    bFlgIntegraCapCar     := False;
    bFlgIntegraContab     := False;
  end;
end;

procedure TCtrlPadrLancImovel.ZeraVetorPadrLancContabil(var ParamIntegra: array of TParamContabeisMT);
var i: integer;
begin
  // zerar todos os dados do parâmetro contábil / capcar
  for i := 0 to Length(ParamIntegra)-1 do begin
    with ParamIntegra[i] do begin
      sContaContabilDebito  := '';
      sCentroCustoDebito    := '';
      sContaContabilCredito := '';
      sContaSegregaCriter   := '';
      sCentroCustoCredito   := '';
      sContaContabilAntecipa:= '';
      sHistoricoCtb         := '';
      sHistoricoCapCar      := '';
      iPlanilha             := -1;
      iExercicio            := -1;
      iPeriodo              := -1;
      iUnidNegoc            := -1;
      iIdSegregaCriter      := -1;

      sSubContaDebito       := '';
      sSubContaCredito      := '';
      sContaDebCred         := '';
      sContaResult          := '';
      sCentroCustoDebCred   := '';
      sCentroCustoResult    := '';
      sSubContaDebCred      := '';
      sSubContaResult       := '';
      sCodCentroRespon      := '';
      sCodCentroCusto       := '';
      sCodTipRecDes         := '';
      sCodTipImovel         := '';
      bFlgIntegraCapCar     := False;
      bFlgIntegraContab     := False;
    end;
  end;
end;

end.
