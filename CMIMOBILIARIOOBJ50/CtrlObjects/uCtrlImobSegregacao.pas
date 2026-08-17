unit uCtrlImobSegregacao;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbSegregaCriter, uDbSegregaCotacao, uDbSegregaData,
     uCmFileUtils, DB, DbClient, uString, uCtrlParamIntegra, uCmMath,
     uDbImobSegregacao, uDatabase;

type TCtrlImobSegregacao = class(TCmControlObject)
  private
    fSegregaVirtual : Boolean;
    fPlanoPrevSegrega : integer;
    fPatroSegrega : integer;
    fPlanoPrevAdm : integer;
    fSegregaOrComum : Boolean;
    fSegregaOrAdm : Boolean;
    FFlgSegOrAdmFin: boolean;
    FFlgSegOrComFin: boolean;
    FActive: Boolean;
    FCdsRateio: TCMClientDataSet;
    FCdsSegregaCriter: TCMClientDataSet;
    FCdsSegregaData: TCMClientDataSet;
    FDbSegregaCotacao: TDbSegregaCotacao;
    FDbSegregaCriter: TDbSegregaCriter;
    FDbSegregaData: TDbSegregadata;
    FCdsSegregaCotacao: TCMClientDataSet;
    FCdsSegregaCrtiter: TCMClientDataSet;
    iIdEmpresa : integer;
    CtrlParamIntegra : TCtrlParamIntegra;
    _cdsLocal : TCMClientDataSet;

    procedure SetCdsRateio(const Value: TCMClientDataSet);
    procedure SetCdsSegregaCotacao(const Value: TCMClientDataSet);
    procedure SetCdsSegregaCriter(const Value: TCMClientDataSet);
    procedure SetCdsSegregaData(const Value: TCMClientDataSet);
    procedure SetDbSegregaCotacao(const Value: TDbSegregaCotacao);
    procedure SetDbSegregaCriter(const Value: TDbSegregaCriter);
    procedure SetDbSegregaData(const Value: TDbSegregadata);
    procedure SetFlgSegOrAdmFin(const Value: boolean);
    procedure SetFlgSegOrComFin(const Value: boolean);
  protected
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;

  public
    //tabela SEGREGACRITER
    property DbSegregaCriter   : TDbSegregaCriter read FDbSegregaCriter write SetDbSegregaCriter;
    property CdsSegregaCriter : TCMClientDataSet read FCdsSegregaCrtiter write SetCdsSegregaCriter;

    //tabela SEGREGADATA
    property DbSegregaData  : TDbSegregadata read FDbSegregaData write SetDbSegregaData;
    property CdsSegregaData : TCMClientDataSet read FCdsSegregaData write SetCdsSegregaData;

    //tabela SEGREGACOTACAO
    property DbSegregaCotacao  : TDbSegregaCotacao read FDbSegregaCotacao write SetDbSegregaCotacao;
    property CdsSegregaCotacao : TCMClientDataSet read FCdsSegregaCotacao write SetCdsSegregaCotacao;

    //Dataset que armazenará o resultado da segregação de um critério
    property CdsRateio  : TCMClientDataSet read FCdsRateio write SetCdsRateio;

    //Determina se a segragação está ativada no parâmetro global
    property SegregaVirtual : Boolean read fSegregaVirtual;

    //Determina os Plano Previdenciários e as Patrocinadoras definadas no cadastro do
    //imóvel que serão utilizadas na segregação
    property PlanoPrevSegrega: Integer read fPlanoPrevSegrega;
    property PatroSegrega: Integer read fPatroSegrega;

    //Flags que definem se há Plano Administrativo / Segregação na origem
    property PlanoPrevAdm: Integer read fPlanoPrevAdm;
    property SegregaOrComum: Boolean read fSegregaOrComum;
    property SegregaOrAdm: Boolean read fSegregaOrAdm;
    property FlgSegOrComFin : boolean read FFlgSegOrComFin write SetFlgSegOrComFin;
    property FlgSegOrAdmFin : boolean read FFlgSegOrAdmFin write SetFlgSegOrAdmFin;

    // travar processos com o Active = false;
    // esta propriedade true significa que o getparams foi executado
    property Active: Boolean read FActive;

    constructor Create; override;
    destructor Destroy; override;

    //Atribuir as propriedades do global. Verificar a necessidade dessa função.
    procedure GetParams ( const IdEmpresa : integer );

    function ListaSegregaCriter(const iIdSegregaCriter: integer = -1): OLEVariant;
    function GravaSegregaCriter : Boolean;

    function ListaSegregaData (const iIdSegregaCriter: integer = -1; const iIdSegregaData: integer = - 1): OleVariant;
    function ListaSegregaCotacao(const iIdSegregaData: Integer = -1; const iIdSegregaCotacao: Integer = -1): OLEVariant;
    function ListaSegregaCotacaoXData(const iIdSegregaCriter: Integer = -1; const dData: TDateTime = -1; const iIdSegregaDataNao: Integer = -1): OLEVariant;
    function GravaSegregaCotacao : Boolean;
    function ExcluiSegregaCotacao : Boolean;
    //Função que retorna as informações da tabela PLANOPATROXIMOVEL, a fim de realizar a segregação na origem.
    function ListaSegregaOrigem(iIdImovel : integer = -1; iIdContratoImovel: Integer = -1): OLEVariant;

    function ContaPai (const iPlano: integer; const sMascara, sPlaconta: string): string;
    function MascaraPlano (const iPlano: integer): string;
    function RetornaSegregaCriter(const iPlano, iIdPlanoPrev, iIdPatro: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;
    // retornando -1 não existe conflito de parâmetros para segregação, ref conta informada
    function ConflitoSegregaCriter(const iPlano: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;
    // se não achar programa resulta -1
    function RetornaPrograma(const iPlano: integer; const sPlaconta: string; var sContaPrograma: string; var sFlgTipoPrograma: string): Integer;
    // retornando -1 não existe conflito de parâmetros para programa, ref conta informada
    function ConflitoPrograma(const iPlano: integer; const sPlaconta: string; var sContaPrograma: string): Integer;

    function RetornaPlanoSegregar (const iPlano: integer; const sConta: string; const iPlanoPrev: integer): integer;

    function ContaContabilSegregacao ( const sPlaConta: string ): string;
    function ContaContabilDeSegregacao ( const sPlaConta: string ): boolean;
    function RateiaValor (const fValor: Extended; const iIdSegregaCriter: Integer; const dData: TDateTime): Boolean;
    //Cássio - SOL 92381 KINTANA 394180
    //Função que monta o Rateio, baseado nosm critérios de Segregação an Origem.
    function RateiaValorOrigem(const fValor: Extended; const iIdSegregaCriter : integer; const dData: TDateTime; iIdImovel: integer = -1; iIdContratoImovel: Integer = -1): Boolean;
    function GetSegregaCtrl: int64;
  end;

implementation


{ TCtrlImobSegregacao }

procedure TCtrlImobSegregacao.AfterInitialize;
begin
  inherited;
  CtrlParamIntegra.InitializeAs(Self);

  FDbSegregaCriter.DataBaseName := DatabaseName;
  FDbSegregaData.DataBaseName := DatabaseName;
  FDbSegregaCotacao.DataBaseName := DatabaseName;

end;

function TCtrlImobSegregacao.ConflitoPrograma(const iPlano: integer;
  const sPlaconta: string; var sContaPrograma: string): Integer;
var sSQL, sMascara, sPlaContaAux, sFlgTipoPrograma : string;
begin
  sContaPrograma := '';
  sSQL := 'SELECT PLACONTA, IDPROGRAMA ' + #13 +
          'FROM PLANOCONTA ' + #13 +
          'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
          '  AND IDPROGRAMA IS NOT NULL ' + #13 +
          '  AND PLACONTA LIKE( ' + QuotedStr(sPlaconta + '%') + ' ) ' + #13 +
          '  AND PLACONTA <> ' + QuotedStr(sPlaconta);
  FazQuery(_cdsLocal, sSQL);
  // verifica as contas filhas
  if not _CdsLocal.IsEmpty then
  begin
    sContaPrograma := _CdsLocal.FieldByName('PLACONTA').AsString;
    Result := _CdsLocal.FieldByName('IDPROGRAMA').AsInteger;
  // verifica as contas pai
  end
  else
  begin
    sMascara := MascaraPlano(iPlano);
    sPlaContaAux := ContaPai(iPlano, sMascara, sPlaconta);
    Result := RetornaPrograma (iPlano, sPlaContaAux, sContaPrograma, sFlgTipoPrograma);
  end;
end;

function TCtrlImobSegregacao.ConflitoSegregaCriter(const iPlano: integer;
  const sPlaconta: string; var sContaSegregaCriter: string): Integer;
var sSQL, sMascara, sPlaContaAux : string;
begin
  sContaSegregaCriter := '';
  sSQL := 'SELECT PLACONTA, IDSEGREGACRITER ' + #13 +
          'FROM PLANOCONTA ' + #13 +
          'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
          '  AND IDSEGREGACRITER IS NOT NULL ' + #13 +
          '  AND PLACONTA LIKE( ' + QuotedStr(sPlaconta + '%') + ' ) ' + #13 +
          '  AND PLACONTA <> ' + QuotedStr(sPlaconta);
  FazQuery(_cdsLocal, sSQL);

  // verifica as contas filhas
  if not _CdsLocal.IsEmpty then
  begin
    sContaSegregaCriter := _CdsLocal.FieldByName('PLACONTA').AsString;
    Result := _CdsLocal.FieldByName('IDSEGREGACRITER').AsInteger;
  end
  else
  begin
    // verifica as contas pai
    sMascara := MascaraPlano(iPlano);
    sPlaContaAux := ContaPai(iPlano, sMascara, sPlaconta);
    Result := RetornaSegregaCriter (iPlano, -1, -1, sPlaContaAux, sContaSegregaCriter);
  end;
end;

function TCtrlImobSegregacao.ContaContabilDeSegregacao(
  const sPlaConta: string): boolean;
begin
  Result := False;
  FazQuery(_cdsLocal, 'SELECT PLACONTA, PLACONTASEGREG FROM PLANOCONTA WHERE PLACONTASEGREG = ' + QuotedStr (sPlaConta) + ' AND PLANO = ' + inttostr(CtrlParamIntegra.Plano));
  if not _cdsLocal.IsEmpty then
    Result := True;
end;

function TCtrlImobSegregacao.ContaContabilSegregacao(
  const sPlaConta: string): string;
var
  sPlaContaAux : string;
begin
  Result := '';
  sPlaContaAux := sPlaConta;
  while sPlaContaAux <> '' do
  begin
    FazQuery(_cdsLocal, 'SELECT PLACONTASEGREG FROM PLANOCONTA WHERE PLACONTA = ' + QuotedStr (sPlaContaAux) + ' AND PLANO = ' + inttostr (CtrlParamIntegra.Plano));
    if not _CdsLocal.FieldByName('PLACONTASEGREG').IsNull then
    begin
      Result := _CdsLocal.FieldByName('PLACONTASEGREG').AsString;
      Exit;
    end;
    sPlaContaAux := ContaPai (CtrlParamIntegra.Plano, CtrlParamIntegra.MascaraPlano, sPlaContaAux);
  end;
end;

function TCtrlImobSegregacao.ContaPai(const iPlano: integer;
  const sMascara, sPlaconta: string): string;
var
  iTam, i     : integer;
  bAchouPai   : Boolean;
  sMascaraAux : string;
begin
  // igualar a máscara a conta passada, ignorando as contas pra frente.
  iTam := 0;

  for i:= 1 to Length (sPlaconta) do
  begin
    if sMascara[i+iTam] = '.' then
      Inc (iTam);
  end;

  sMascaraAux := Copy(sMascara, 1, i -1 + iTam);
  bAchouPai:= False;

  // procurar a conta com gráu imediatamente anterior (pai)
  for i:= length(sMascaraAux) downto 1 do
  begin
    if sMascara[i] = '.' then
    begin
      sMascaraAux := Copy(sMascaraAux, 1, i -1);
      bAchouPai := True;
      Break;
    end;
  end;

  // A máscara não possui mais pai estamos no primeiro nível
  if not bAchouPai then
    Result := ''
  else
  begin
    // contar o tamanho dos números
    iTam := Length(RemoveChar ('.', sMascaraAux));
    Result := Copy(sPlaconta, 1, iTam);
  end;
end;

constructor TCtrlImobSegregacao.Create;
begin
  inherited;
  FDbSegregaCriter := TDbSegregaCriter.Create(Self);
  FDbSegregaData := TDbSegregadata.Create (Self);
  FDbSegregaCotacao := TDbSegregaCotacao.Create (Self);
  FCdsRateio := TCMClientDataSet.Create (nil);
  _cdsLocal := TCMClientDataSet.Create(nil);

  //Verificar a necessidade desse Control Object
  CtrlParamIntegra := TCtrlParamIntegra.Create;

  iIdEmpresa      := 0;
  fSegregaVirtual := False;
  fPatroSegrega     := 0;
  fPlanoPrevSegrega := 0;
  fSegregaOrAdm   := False;
//  fSegregaOrComum := False;
//  FlgSegOrComFin  := False;
  FlgSegOrAdmFin  := False;
  fPlanoPrevAdm   := 0;
  FActive         := False;
end;

destructor TCtrlImobSegregacao.Destroy;
begin
  FreeAndNil (FDbSegregaCriter);
  FreeAndNil (FDbSegregaData);
  FreeAndNil (FDbSegregaCotacao);

  //Verificar a necssidade desse ControlObject
  FreeAndNil (CtrlParamIntegra);

  FreeAndNil (FCdsRateio);
  FreeAndNil (_CdsLocal);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsSegregaCriter);
    FreeAndNil (FCdsSegregaData);
    FreeAndNil (FCdsSegregaCotacao);
  end;
  inherited;
end;

function TCtrlImobSegregacao.ExcluiSegregaCotacao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiSegregaCotacao( CdsSegregaData.Data, CdsSegregaCotacao.Data );
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Marca todos as cotações para exclusão
      CdsSegregaCotacao.First;
      while not CdsSegregaCotacao.Eof do
        CdsSegregaCotacao.Delete;

      // Exclui as cotações
      Result := ApplyCds( CdsSegregaCotacao, DbSegregaCotacao, [], [] );
      if not Result then
        raise Exception.Create( DbSegregaCotacao.MessageInfo );

      // Exclui a Vigência de datas  ( Pai )
      Result := ApplyCds( CdsSegregaData, DbSegregaData, [], [] );
      if not Result then
        raise Exception.Create( DbSegregaData.MessageInfo );

      Commit;
    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlImobSegregacao.GetParams(const IdEmpresa: integer);
begin
  CtrlParamIntegra.GetParams(IdEmpresa, 0, '', '', tiSistema );

  iIdEmpresa := IdEmpresa;
  // verificar parâmetro global, se segregação está ativada
  FSegregaVirtual := CtrlParamIntegra.SegregaVirtual;
  fPatroSegrega     := CtrlParamIntegra.PatroGlobal;
  fPlanoPrevSegrega := CtrlParamIntegra.PlanoPrevGlobal;

  FSegregaOrAdm   := CtrlParamIntegra.SegregaOrAdm;
//---------------------------------------------------------------------------------------
// Cássio - SOL 92381 KINTANA 394180
//Não é levado em consideração a flag FSegregaOrComum para fazer a Segregação na Origem.
//  FSegregaOrComum := CtrlParamIntegra.SegregaOrComum;
//  FFlgSegOrComFin := CtrlParamIntegra.FlgSegOrComFin;

  FPlanoPrevAdm   := CtrlParamIntegra.PlanoPrevAdm;
  FFlgSegOrAdmFin := CtrlParamIntegra.FlgSegOrAdmFin;
  FActive := True;
end;

function TCtrlImobSegregacao.GetSegregaCtrl: int64;
begin
  Result := GetSequence('IDCONTRSEGREGA');
end;

function TCtrlImobSegregacao.GravaSegregaCotacao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaSegregaCotacao( CdsSegregaData.Data, CdsSegregaCotacao.Data );
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject - Pai
      Result := ApplyCds( CdsSegregaData, DbSegregaData, [], [] );
      if not Result then
        raise Exception.Create( DbSegregaData.MessageInfo );

      // Aplica as alterações do Cds através do DbObject - Filho
      Result := ApplyCds( CdsSegregaCotacao, DbSegregaCotacao, [DbSegregaData.Idsegregadata], [DbSegregaCotacao.Idsegregadata] );
      if not Result then
        raise Exception.Create( DbSegregaCotacao.MessageInfo );

      Commit;
    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlImobSegregacao.GravaSegregaCriter: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaSegregaCriter( CdsSegregaCriter.Data );
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsSegregaCriter, DbSegregaCriter, [], [] );
      if not Result then
        raise Exception.Create( DbSegregaCriter.MessageInfo );

      Commit;
    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlImobSegregacao.ListaSegregaCotacao(const iIdSegregaData,
  iIdSegregaCotacao: Integer): OLEVariant;
var
  sSQL, sParam : string;
begin
  sParam := '';

  if iIdSegregaData    <> -1 then
    sParam := sParam + '   AND ( CT.IDSEGREGADATA   = ' + IntToStr(iIdSegregaData) + ' ) ' + #13;

  if iIdSegregaCotacao <> -1 then
    sParam := sParam + '   AND ( CT.IDSEGREGACOTACAO = ' + IntToStr (iIdSegregaCotacao) + ' ) ' + #13;

  sSQL := 'SELECT ' + #13 +
          '   CT.IDSEGREGADATA, CT.IDSEGREGACOTACAO, ' + #13 +
          '   CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO, ' + #13 +
          '   P.NOME AS PATRO, PC.NOME AS PLANPREVCONTABIL ' + #13 +
          'FROM ' + #13 +
          '   PESSOA P, PATRO PA, PLANPREVCONTABIL PC, ' + #13 +
          '   SEGREGACOTACAO CT ' + #13 +
          'WHERE ' + #13 +
          '   ( P.IDPESSOA = PA.IDPESSOA ) ' + #13 +
          '   AND ( PA.IDPESSOA = CT.IDPATRO ) ' + #13 +
          '   AND ( CT.IDPLANOPREV = PC.IDPLANOPREV ) ' + #13 +
          sParam +
          'ORDER BY PATRO, PLANPREVCONTABIL ';

  Result := FazQuery(_cdsLocal, sSQL);
end;

function TCtrlImobSegregacao.ListaSegregaCotacaoXData(
  const iIdSegregaCriter: Integer; const dData: TDateTime;
  const iIdSegregaDataNao: Integer): OLEVariant;
var
  sData, sParam, sSQL : string;
begin
  sParam := '';
  sData := FormatDateTime ('dd/mm/yyyy', dData);

  if iIdSegregaCriter  <> -1 then
    sParam := sParam + '   AND ( DT.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ' ) ' + #13;

  if iIdSegregaDataNao <> -1 then
    sParam := sParam + '   AND ( DT.IDSEGREGADATA  <> ' + IntToStr(iIdSegregaDataNao) + ' ) ' + #13;

  if dData <> -1 then
    sParam := sParam + '   AND ( TO_DATE (' + QuotedStr(sData) + ', ''DD/MM/YYYY'') BETWEEN DT.DATAINI AND DT.DATAFIM ) ' + #13;

  sSQL := 'SELECT ' + #13 +
          '   DT.IDSEGREGACRITER, DT.IDSEGREGADATA, CT.IDSEGREGACOTACAO, ' + #13 +
          '   DT.DATAINI, DT.DATAFIM, CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO, ' + #13 +
          '   CR.DESCRICAO, CR.FLGTIPOCOTACAO, ' + #13 +
          '   TOT.TOT_COTACAO ' + #13 +
          'FROM ' + #13 +
          '   SEGREGADATA DT, SEGREGACOTACAO CT, SEGREGACRITER CR, ' + #13 +
          '   ( SELECT IDSEGREGADATA, SUM(COTACAO) AS TOT_COTACAO FROM SEGREGACOTACAO GROUP BY IDSEGREGADATA) TOT ' + #13 +
          'WHERE ' + #13 +
          '   ( DT.IDSEGREGADATA = CT.IDSEGREGADATA ) ' + #13 +
          '   AND ( DT.IDSEGREGACRITER = CR.IDSEGREGACRITER ) ' + #13 +
          '   AND ( DT.IDSEGREGADATA = TOT.IDSEGREGADATA ) ' + #13 +
          sParam;

  Result := FazQuery(_cdsLocal, sSQL);
end;

function TCtrlImobSegregacao.ListaSegregaCriter(
  const iIdSegregaCriter: integer): OLEVariant;
var
  sParam, sSQL : string;
begin
  sParam := '';

  if iIdSegregaCriter <> -1 then
    sParam := sParam + '   AND C.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter)  + #13;

  sSQL:= 'SELECT                                                       '+
         '  C.IDSEGREGACRITER, C.DESCRICAO, C.ORDEM, C.FLGTIPOSEGREGA, '+
         '  C.FLGTIPOCOTACAO, C.HITCODHIST, C.IDPESSOA, C.TIPCODIGO,   '+
         '  T.TIPCODIGO, T.TIPDESCRICAO                                '+
         'FROM                                                         '+
         '  SEGREGACRITER C, TIPOPER T                                 '+
         'WHERE                                                        '+
         '  1=1 AND                                                    '+
         '  C.TIPCODIGO = T.TIPCODIGO                                  ';
  sSQL := sSQL + sParam;
  sSQL := sSQL + 'ORDER BY C.DESCRICAO ' + #13;

  Result := FazQuery(_cdsLocal, sSQL);
end;

function TCtrlImobSegregacao.ListaSegregaData(const iIdSegregaCriter,
  iIdSegregaData: integer): OleVariant;
var
  sSQL, sParam : string;
begin
  sParam := '';

  if iIdSegregaCriter <> -1 then
    sParam := sParam + '   AND (CR.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ') ' + #13;

  if iIdSegregaData   <> -1 then
    sParam := sParam + '   AND (DT.IDSEGREGADATA = ' + IntToStr(iIdSegregaData) + ') ' + #13;

  sSQL := 'SELECT ' + #13 +
          '   CR.IDSEGREGACRITER, CR.DESCRICAO, CR.ORDEM, CR.FLGTIPOSEGREGA, ' + #13 +
          '   CR.FLGTIPOCOTACAO, DT.IDSEGREGADATA, DT.DATAINI, DT.DATAFIM ' + #13 +
          'FROM ' + #13 +
          '   SEGREGACRITER CR, SEGREGADATA DT ' + #13 +
          'WHERE ' + #13 +
          '   (CR.IDSEGREGACRITER = DT.IDSEGREGACRITER) ' + #13 +
          sParam +
          'ORDER BY CR.DESCRICAO, DT.DATAINI ';
  Result :=  FazQuery(_cdsLocal, sSQL);
end;

//------------------------------------------------------------------------------------------------
// Cássio - SOL 91381 KINTANA 394180
// Traz as informações de planos previdenciários, patrocinadoras, percentual de rateio,
// do imovel informado, através do parâmetro iIdImovel.
function TCtrlImobSegregacao.ListaSegregaOrigem(iIdImovel: integer = -1; iIdContratoImovel: Integer = -1): OLEVariant;
var
  sSQL: string;
  cdsSegrega : TClientDataSet;
begin
  cdsSegrega := TClientDataSet.Create(nil);
  try
    sSQL  :=  'SELECT IDPLANOPREV,                                                ' + #13#10 +
            '       IDPATRO,                                                      ' + #13#10 +
            '       PPIPERCENTRATEIO,                                             ' + #13#10 +
            '       FLGTIPO,                                                      ' + #13#10 +
            '       (SELECT SUM(PPIPERCENTRATEIO)                                 ' + #13#10 +
            '          FROM PLANOPATROXIMOVEL                                     ' + #13#10 +
            '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel) + ') AS TOT_RATEIO ' + #13#10 +
            '  FROM PLANOPATROXIMOVEL                                             ' + #13#10 +
            ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
    Result := FazQuery(cdsSegrega, sSQL);
  finally
    FreeAndNil(cdsSegrega);
  end;

  end;

function TCtrlImobSegregacao.MascaraPlano(const iPlano: integer): string;
begin
  FazQuery(_cdsLocal, 'SELECT MASCARA FROM PLANO WHERE PLANO = ' + IntToStr (iPlano));
  Result := _cdsLocal.FieldByName('MASCARA').AsString;
end;

procedure TCtrlImobSegregacao.OnCreateAppServer;
begin
  inherited;
  FCdsSegregaCriter := TCMClientDataSet.Create (nil);
  FCdsSegregaData := TCMClientDataSet.Create (nil);
  FCdsSegregaCotacao := TCMClientDataSet.Create (nil);
end;

function TCtrlImobSegregacao.RateiaValor(const fValor: Extended;
  const iIdSegregaCriter: Integer; const dData: TDateTime): Boolean;
var
  fValorLanc, fTotalLanc, fFator: Extended;
begin
  Result := True;
  try
    if FCdsRateio.Active then
      FCdsRateio.Close;

    FazQuery(FCdsRateio, 'SELECT 0 AS IDPLANOPREV, 0 AS IDPATRO, 0 AS VALOR FROM DUAL WHERE 1 = 2');
    _CdsLocal.Data := ListaSegregaCotacaoXData (iIdSegregaCriter, dData);
    if _CdsLocal.IsEmpty then
    begin
      _CdsLocal.Data := ListaSegregaCriter(iIdSegregaCriter);
      raise exception.Create ('Segregação de Recursos. ' + #13 +
                              'Cotação não encontrada para o critério selecionado! ' + #13 +
                              'Critério: ' + _CdsLocal.FieldByName('DESCRICAO').AsString + #13 +
                              'Data: ' + DateToStr (dData));
    end;

    fTotalLanc := 0;
    while not _CdsLocal.Eof do
    begin
      if _CdsLocal.FieldByName('FLGTIPOCOTACAO').AsString = 'P' then
        fFator := _CdsLocal.FieldByName('COTACAO').AsFloat / 100
      else
        fFator := _CdsLocal.FieldByName('COTACAO').AsFloat / _CdsLocal.FieldByName('TOT_COTACAO').AsFloat;

      fValorLanc := RoundCM( (fValor*fFator), 2);

      if _CdsLocal.RecNo = _CdsLocal.RecordCount then // último registro descarregar a diferença
        fValorLanc := fValor - fTotalLanc;

      fTotalLanc := fTotalLanc + fValorLanc;
      FCdsRateio.Append;
      FCdsRateio.FieldByName('IDPLANOPREV').AsInteger := _CdsLocal.FieldByName('IDPLANOPREV').AsInteger;
      FCdsRateio.FieldByName('IDPATRO').AsInteger := _CdsLocal.FieldByName('IDPATRO').AsInteger;
      FCdsRateio.FieldByName('VALOR').AsFloat := fValorLanc;
      FCdsRateio.Post;

      _CdsLocal.Next;
    end;
  except
    on E : Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImobSegregacao.RateiaValorOrigem(const fValor: Extended;
  const iIdSegregaCriter: integer; const dData: TDateTime;
  iIdImovel: integer = -1; iIdContratoImovel: Integer = -1): Boolean;
var
  fValorLanc, fTotalLanc, fFator: Extended;
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  Result := True;
  fTotalLanc := 0;
  try
    try
      if FCdsRateio.Active then
        FCdsRateio.Close;

      FazQuery(FCdsRateio, 'SELECT 0 AS IDPLANOPREV, 0 AS IDPATRO, 0 AS VALOR FROM DUAL WHERE 1 = 2');

      if iIdImovel <> -1 then
      begin
        sSQL:=  'SELECT IDPLANOPREV,                                                 ' + #13#10 +
                '       IDPATRO,                                                     ' + #13#10 +
                '       PPIPERCENTRATEIO AS PERCENTUAL,                              ' + #13#10 +
                '       FLGTIPO,                                                     ' + #13#10 +
                '       (SELECT SUM(PPIPERCENTRATEIO)                                ' + #13#10 +
                '          FROM PLANOPATROXIMOVEL                                    ' + #13#10 +
                '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel)+ ') AS TOT_RATEIO ' + #13#10 +
                '  FROM PLANOPATROXIMOVEL                                            ' + #13#10 +
                ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
        cdsAux.Data := GetDataPacket(sSQL);

        while not cdsAux.Eof do
        begin
          if cdsAux.FieldByName('FLGTIPO').AsString = 'P' then
            fFator := cdsAux.FieldByName('PERCENTUAL').AsFloat / 100
          else
            fFator := cdsAux.FieldByName('PERCENTUAL').AsFloat / cdsAux.FieldByName('TOT_RATEIO').AsFloat;

          fValorLanc := RoundCM( (fValor * fFator), 2);

          if cdsAux.RecNo = cdsAux.RecordCount then // último registro descarregar a diferença
            fValorLanc := fValor - fTotalLanc;

          fTotalLanc := fTotalLanc + fValorLanc;
          FCdsRateio.Append;
          FCdsRateio.FieldByName('IDPLANOPREV').AsInteger := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
          FCdsRateio.FieldByName('IDPATRO').AsInteger := cdsAux.FieldByName('IDPATRO').AsInteger;
          FCdsRateio.FieldByName('VALOR').AsFloat := fValorLanc;
          FCdsRateio.Post;

          cdsAux.Next;
        end;
      end
      else
      begin
        if iIdContratoImovel <> -1 then
        begin
          {sSQL := 'SELECT PPI.IDPLANOPREV, ' + #10#13 +
                  '       PPI.IDPATRO, ' + #10#13 +
                  '       PPI.FLGTIPO, ' + #10#13 +
                  '       SUM (PPI.PPIPERCENTRATEIO * 100 / TOT.TOTAL) AS PERCENTUAL, ' + #10#13 +
                  '       (SELECT SUM(PPIPERCENTRATEIO) ' + #10#13 +
                  '          FROM PLANOPATROXIMOVEL    ' + #10#13 +
                  '         WHERE IDIMOVEL in (SELECT IDIMOVEL FROM CONTRATOXIMOVEL ' + #10#13 +
                  '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + ')) AS TOT_RATEIO ' + #10#13 +
                  '  FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
                  '       CONTRATOXIMOVEL CXI, ' + #10#13 +
                  '       CONTRATOIMOVEL CTI, ' + #10#13 +
                  '       (SELECT SUM(PP.PPIPERCENTRATEIO) AS TOTAL ' + #10#13 +
                  '          FROM PLANOPATROXIMOVEL PP, ' + #10#13 +
                  '               CONTRATOXIMOVEL CX, ' + #10#13 +
                  '               CONTRATOIMOVEL CT ' + #10#13 +
                  '         WHERE CT.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + #10#13 +
                  '           AND CX.IDCONTRATOIMOVEL(+) = CT.IDCONTRATOIMOVEL ' + #10#13 +
                  '           AND PP.IDIMOVEL = CX.IDIMOVEL) TOT ' + #10#13 +
                  ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + #10#13 +
                  '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #10#13 +
                  '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' + #10#13 +
                  ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PPI.FLGTIPO '; }
          sSQL := 'SELECT PPI.IDPLANOPREV, ' + #10#13 +
                  '       PPI.IDPATRO, ' + #10#13 +
                  '       TRIM(TO_CHAR(TRUNC(SUM((CXI.VLRVENDA*PPI.PPIPERCENTRATEIO)/100),2),''9999999999D99'')) AS VALORLANC ' + #10#13 +
                  '  FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
                  '       CONTRATOXIMOVEL CXI, ' + #10#13 +
                  '       CONTRATOIMOVEL CTI ' + #10#13 +
                  ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + #10#13 +
                  '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #10#13 +
                  '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' + #10#13 +
                  ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO';
          FazQuery(cdsAux, sSQL);

          while not cdsAux.Eof do
          begin
            if cdsAux.RecNo = cdsAux.RecordCount then // último registro descarregar a diferença
              fValorLanc := fValor - fTotalLanc
            else
            begin
              fValorLanc := cdsAux.FieldByName('VALORLANC').asFloat;
              fTotalLanc := fTotalLanc + fValorLanc;
            end;

            FCdsRateio.Append;
            FCdsRateio.FieldByName('IDPLANOPREV').AsInteger := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
            FCdsRateio.FieldByName('IDPATRO').AsInteger := cdsAux.FieldByName('IDPATRO').AsInteger;
            FCdsRateio.FieldByName('VALOR').AsFloat := fValorLanc;
            FCdsRateio.Post;

            cdsAux.Next;
          end;
        end;
      end;

      if cdsAux.IsEmpty then
      begin
        cdsAux.Data := ListaSegregaCriter(iIdSegregaCriter);
        raise exception.Create ('Segregação de Recursos. ' + #13 +
                                'Cotação não encontrada para o critério selecionado! ' + #13 +
                                'Critério: ' + cdsAux.FieldByName('DESCRICAO').AsString + #13 +
                                'Data: ' + DateToStr (dData));
      end;

    except
      on E : Exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlImobSegregacao.RetornaPlanoSegregar(const iPlano: integer;
  const sConta: string; const iPlanoPrev: integer): integer;
var
  iIdPrograma: integer;
  sContaPrograma, sFlgTipoPrograma: string;

begin
  try
    Result := 0;  // não houve erro, porém o programa não foi parametrizado
    iIdPrograma := RetornaPrograma( iPlano, sConta, sContaPrograma, sFlgTipoPrograma);
    if iIdPrograma > 0 then
    begin
      // verificar se o programa está invertido
      if (sFlgTipoPrograma = 'PREV') then
      begin
        if (fPlanoPrevSegrega = iPlanoPrev) then
          raise Exception.Create ('Você tentou lançar o plano de Operações Comuns em uma conta do programa previdenciário! ' + #13 +
                                  'Estas contas aceitam apenas planos "carimbados".'+ #13 +
                                  'Conta Lançada: ' + sConta + #13 +
                                  'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);

          if (fPlanoPrevAdm = iPlanoPrev) then
            raise Exception.Create ('Você tentou lançar o plano de Operações Administrativas em uma conta do programa previdenciário! ' + #13 +
                                    'Estas contas aceitam apenas planos "carimbados".' + #13 +
                                    'Conta Lançada: ' + sConta + #13 +
                                    'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);
      end
      else
      begin
        if fPlanoPrevAdm <> 0 then
        begin // plano Adm parametrizado
          if (sFlgTipoPrograma = 'INV') and (fPlanoPrevAdm = iPlanoPrev) then
            raise Exception.Create ('Você tentou lançar o plano de Operações Administrativas em uma conta do programa de Investimentos! ' + #13 +
                                    'Estas contas aceitam apenas o plano de Operações Comuns ou planos "carimbados".' + #13 +
                                    'Conta Lançada: ' + sConta + #13 +
                                    'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);

          if (sFlgTipoPrograma = 'ADM') and (fPlanoPrevSegrega = iPlanoPrev) then
            raise Exception.Create ('Você tentou lançar o plano de Operações Comuns em uma conta do programa de Administrativo! ' + #13 +
                                    'Estas contas aceitam apenas o Plano de Operações Administrativas ou planos "carimbados".' + #13 +
                                    'Conta Lançada: ' + sConta + #13 +
                                    'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);
        end;
      end;

      if (sFlgTipoPrograma = 'INV') then
        Result := fPlanoPrevSegrega
      else
        if (sFlgTipoPrograma = 'ADM') then
          if (fPlanoPrevAdm <> 0) then // plano administrativo parametrizado
            Result := fPlanoPrevSegrega;
    end;
  except
    on E : Exception do
    begin
      Result := -1;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImobSegregacao.RetornaPrograma(const iPlano: integer;
  const sPlaconta: string; var sContaPrograma,
  sFlgTipoPrograma: string): Integer;
var
  sSQL, sPlaContaAux, sMascara: string;
begin
  Result := -1;
  sContaPrograma := '';
  sFlgTipoPrograma := '';
  sMascara := MascaraPlano(iPlano);
  sPlaContaAux := sPlaconta;

  // carregar o result sem achar ocorrencias
  while sPlaContaAux <> '' do
  begin
    sSQL := 'SELECT PL.IDPROGRAMA, PR.FLGTIPOPROGRAMA ' + #13 +
            'FROM PLANOCONTA PL, PROGRAMA PR ' + #13 +
            'WHERE PL.IDPROGRAMA = PR.IDPROGRAMA(+) ' + #13 +
            '  AND PLANO = ' + IntToStr(iPlano) + #13 +
            '  AND PLACONTA = ' + QuotedStr(sPlaContaAux);
    FazQuery(_cdsLocal, sSQL);

    if  not _CdsLocal.FieldByName ('IDPROGRAMA').IsNull then
    begin
      Result := _CdsLocal.FieldByName ('IDPROGRAMA').AsInteger;
      sContaPrograma := sPlaContaAux;
      sFlgTipoPrograma := _CdsLocal.FieldByName ('FLGTIPOPROGRAMA').AsString;
      sPlaContaAux := '';
    end
    else
      sPlaContaAux := ContaPai(iPlano, sMascara, sPlaContaAux);
  end;
end;

function TCtrlImobSegregacao.RetornaSegregaCriter(const iPlano,
  iIdPlanoPrev, iIdPatro: integer; const sPlaconta: string;
  var sContaSegregaCriter: string): Integer;
var
  sSQL, sPlaContaAux, sMascara : string;
begin
  Result := -1;
  sContaSegregaCriter := '';

  if not FSegregaVirtual then
    Exit;

  // para verificar contas (apenas no cadasto de plano de contas)
  // o plano e a patro devem vir -1
  if (iIdPlanoPrev <> -1) and (iIdPatro <> -1) then
  begin
    if (not ((iIdPlanoPrev = fPlanoPrevSegrega) or
             (iIdPlanoPrev = FPlanoPrevAdm))) or
       (iIdPatro <> fPatroSegrega) then
      // o dinheiro aqui é carimbado
      Exit;
  end;
  sMascara := MascaraPlano(iPlano);
  sPlaContaAux := sPlaconta;

  // carregar o result sem achar ocorrencias
  while sPlaContaAux <> '' do
  begin
    sSQL := 'SELECT IDSEGREGACRITER FROM PLANOCONTA ' + #13 +
            'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
            '  AND PLACONTA = ' + QuotedStr(sPlaContaAux);
    FazQuery(_CdsLocal, sSQL);

    if  not _CdsLocal.FieldByName ('IDSEGREGACRITER').IsNull then
    begin
      Result := _CdsLocal.FieldByName ('IDSEGREGACRITER').AsInteger;
      sContaSegregaCriter := sPlaContaAux;
      sPlaContaAux := '';
    end
    else
      sPlaContaAux := ContaPai (iPlano, sMascara, sPlaContaAux);
  end;
end;

procedure TCtrlImobSegregacao.SetCdsRateio(const Value: TCMClientDataSet);
begin
  FCdsRateio := Value;
end;

procedure TCtrlImobSegregacao.SetCdsSegregaCotacao(
  const Value: TCMClientDataSet);
begin
  FCdsSegregaCotacao := Value;
end;

procedure TCtrlImobSegregacao.SetCdsSegregaCriter(
  const Value: TCMClientDataSet);
begin
  FCdsSegregaCrtiter := Value;
end;

procedure TCtrlImobSegregacao.SetCdsSegregaData(
  const Value: TCMClientDataSet);
begin
  FCdsSegregaData := Value;
end;

procedure TCtrlImobSegregacao.SetDbSegregaCotacao(
  const Value: TDbSegregaCotacao);
begin
  FDbSegregaCotacao := Value;
end;

procedure TCtrlImobSegregacao.SetDbSegregaCriter(
  const Value: TDbSegregaCriter);
begin
  FDbSegregaCriter := Value;
end;

procedure TCtrlImobSegregacao.SetDbSegregaData(
  const Value: TDbSegregadata);
begin
  FDbSegregaData := Value;
end;

procedure TCtrlImobSegregacao.SetFlgSegOrAdmFin(const Value: boolean);
begin
  FFlgSegOrAdmFin := Value;
end;

procedure TCtrlImobSegregacao.SetFlgSegOrComFin(const Value: boolean);
begin
  FFlgSegOrComFin := Value;
end;

end.
