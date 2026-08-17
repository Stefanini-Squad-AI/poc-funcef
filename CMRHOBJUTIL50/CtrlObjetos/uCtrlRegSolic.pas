{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/05/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegSolic;

interface

uses SysUtils, Controls, Db, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlRad, uCtrlCustomRH, uCtrlPessoaFuncionario, uCtrlListTerceirosRH,
  uCtrlEvolFunc, uCtrlIntegraPrevRH, uDbSolAltFunc;

type
  TCtrlRegSolic = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbSolAltFunc: TDbSolAltFunc;
    FCdsSolAltFunc: TCMClientDataSet;
    FCdsFunc: TCMClientDataSet;
    FCdsEvolFunc: TCMClientDataSet;
    FCtrlRad: TCtrlRad;
    FCtrlEvolFunc: TCtrlEvolFunc;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FCtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    FIdEmpresa: integer;
    FTipoEmpresa: string;
    FIntegraRAD: boolean;
    FIdUsuario: double;
    FIdTipoProcesso: integer;
    FImplementarSolicitacao: boolean;
    function GerarProcessoRAD(OBS: string): boolean;
    function GravarSolicitacaoAtual: boolean;
  public
    constructor Create(IdEmpresa: integer; TipoEmpresa: string; IntegraRAD: boolean;
      IdUsuario: double); reintroduce;
    destructor  Destroy; override;

    function ListRegSolic(Id_Solic_Alter_Func: double): OleVariant;
    function ListSolicitacoes(ListaIdIndicado, ListaIdRequisitante, ListaIdAcao: string;
      SelSolicPropostas, SelSolicEfetivadas: boolean; DataIni, DataFim: TDate): OleVariant;

    function GetProximoID(DataRef: TDate): double;
    function GetNumCartaSolic(Id_Solic_Alter_Func: double): integer;
    function GerarValSolic(DadosFunc: OleVariant): double;

    function GerarDadosCarta(SelPessoaIndicada, SomenteProposta: boolean; var ListaNumCarta,
      ListaIdSolSemCarta, ListaIdPessoa: string): boolean;

    function GravarRegSolic(OBS_RAD: string = ''): boolean;
    function GravarSolicitacoes(const IAppCliente: OleVariant; SomentePessoaIndicada: boolean;
      ListaIdIndicado: string): boolean;
    function GravarImplementacaoSolicitacao: boolean;

    property CdsSolAltFunc: TCMClientDataSet read FCdsSolAltFunc write FCdsSolAltFunc;
    property CdsFunc: TCMClientDataSet read FCdsFunc write FCdsFunc;
    property ImplementarSolicitacao: boolean read FImplementarSolicitacao write FImplementarSolicitacao;
  end;

implementation

uses uSistema, uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegSolic }

constructor TCtrlRegSolic.Create(IdEmpresa: integer; TipoEmpresa: string; IntegraRAD: boolean;
  IdUsuario: double);
begin
  inherited Create;
  FDbSolAltFunc := TDbSolAltFunc.Create(Self);
  FCdsEvolFunc := TCMClientDataSet.Create(nil);
  FCtrlEvolFunc := TCtrlEvolFunc.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create('', '', '');
  FCtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;

  FIdEmpresa := IdEmpresa;
  FTipoEmpresa := TipoEmpresa;
  FIntegraRAD := IntegraRAD;
  FIdUsuario := IdUsuario;
  FImplementarSolicitacao := false;

  // Somente cria o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FCtrlRad := TCtrlRad.Create;
end;

destructor TCtrlRegSolic.Destroy;
begin
  FreeObject(FDbSolAltFunc);
  FreeObject(FCdsEvolFunc);
  FreeObject(FCtrlEvolFunc);
  FreeObject(FCtrlListTerceirosRH);
  FreeObject(FCtrlPessoaFuncionario);
  FreeObject(FCtrlIntegraPrevRH);

  // Somente destrói o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FreeObject(FCtrlRad);

  if (IsAppServer) then
  begin
    FreeObject(FCdsSolAltFunc);
    FreeObject(FCdsFunc);
  end;
  inherited;
end;

procedure TCtrlRegSolic.OnCreateAppServer;
begin
  inherited;
  FCdsSolAltFunc := TCMClientDataSet.Create(nil);
  FCdsFunc := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegSolic.AfterInitialize;
begin
  inherited;
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FCtrlEvolFunc.InitializeAs(Self);
  FCtrlEvolFunc.OpenTransaction := false;

  FCtrlIntegraPrevRH.InitializeAs(Self);
  FCtrlIntegraPrevRH.OpenTransaction := false;

  FCtrlListTerceirosRH.InitializeAs(Self);
  // Somente procura o IdTipoProcesso se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (IsAppServer) or (ConnectionSide <> cnsClient) then
  begin
    if (FIntegraRAD) then
    begin
      FCtrlRad.InitializeAs(Self);
      FCtrlRad.OpenTransaction := false;
      FIdTipoProcesso := FCtrlListTerceirosRH.GetIdTipoProcesso(FIdEmpresa, FIdUsuario, 16);
    end
    else
      FIdTipoProcesso := -1;
  end;
end;

procedure TCtrlRegSolic.DoChangeDataBase;
begin
  inherited;
  FDbSolAltFunc.DataBaseName := DataBaseName;
  FCtrlListTerceirosRH.DataBaseName := DataBaseName;
  FCtrlEvolFunc.DataBaseName := DataBaseName;
  FCtrlPessoaFuncionario.DataBaseName := DataBaseName;
  FCtrlIntegraPrevRH.DataBaseName := DataBaseName;
  // Somente muda o DataBaseName do RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
    FCtrlRad.DataBaseName := DataBaseName;
end;

function TCtrlRegSolic.ListRegSolic(Id_Solic_Alter_Func: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  ID_SOLIC_ALTER_FUNC, IDEMPRESA, IDESTAB, CODCENTROCUSTO, IDMOTIVO,' +CR_LF+
    '  IDCARGO, DATA_SOLIC_ALTER, DATA_EFETIV_ALTER, PERC_REAJ, NOVO_SALARIO,' +CR_LF+
    '  NOVO_TIPO_SAL, SITUACAO_SOLIC, FLAG_PERC_SALAR, IDINDICADO, OBSERV_SOLIC,' +CR_LF+
    '  IDREQUISITANTE, IDPROCESSO' +CR_LF+
    'FROM'+CR_LF+
    '  SOLALTFUNC'+CR_LF+
    'WHERE'+CR_LF+
    '  (ID_SOLIC_ALTER_FUNC = ' +FloatToStr(Id_Solic_Alter_Func)+ ')');
end;

function TCtrlRegSolic.ListSolicitacoes(ListaIdIndicado, ListaIdRequisitante,
  ListaIdAcao: string; SelSolicPropostas, SelSolicEfetivadas: boolean;
  DataIni, DataFim: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';

  if (ListaIdIndicado <> '') then
    if (Pos(',', ListaIdIndicado) > 0) then
      sSQL := sSQL + '  (SAF.IDINDICADO        IN (' +ListaIdIndicado+ ')) AND' +CR_LF
    else
      sSQL := sSQL + '  (SAF.IDINDICADO         = ' +ListaIdIndicado+ ') AND' +CR_LF;

  if (ListaIdRequisitante <> '') then
    if (Pos(',', ListaIdRequisitante) > 0) then
      sSQL := sSQL + '  (SAF.IDREQUISITANTE    IN (' +ListaIdRequisitante+ ')) AND' +CR_LF
    else
      sSQL := sSQL + '  (SAF.IDREQUISITANTE     = ' +ListaIdRequisitante+ ') AND' +CR_LF;

  if (ListaIdAcao <> '') then
    if (Pos(',', ListaIdAcao) > 0) then
      sSQL := sSQL + '  (SAF.IDMOTIVO          IN (' +ListaIdAcao+ ')) AND' +CR_LF
    else
      sSQL := sSQL + '  (SAF.IDMOTIVO           = ' +ListaIdAcao+ ') AND' +CR_LF;

  if (SelSolicPropostas) and not(SelSolicEfetivadas) then
    sSQL := sSQL + '  (SAF.SITUACAO_SOLIC     = 0) AND' +CR_LF
  else
  if not(SelSolicPropostas) and (SelSolicEfetivadas) then
    sSQL := sSQL + '  (SAF.SITUACAO_SOLIC     = 1) AND' +CR_LF;

  if (DataIni > 0) then
    sSQL := sSQL + '  (SAF.DATA_EFETIV_ALTER >= TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ', ''DD/MM/YYYY'')) AND' +CR_LF;

  if (DataFim > 0) then
    sSQL := sSQL + '  (SAF.DATA_EFETIV_ALTER <= TO_DATE(' +QuotedStr(DateToStr(DataFim))+ ', ''DD/MM/YYYY'')) AND' +CR_LF;
                        
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  ID_SOLIC_ALTER_FUNC, IDEMPRESA, IDESTAB, CODCENTROCUSTO, MO.IDMOTIVO,' +CR_LF+
    '  IDCARGO, DATA_SOLIC_ALTER, DATA_EFETIV_ALTER, PERC_REAJ, NOVO_SALARIO,' +CR_LF+
    '  NOVO_TIPO_SAL, SITUACAO_SOLIC, FLAG_PERC_SALAR, IDINDICADO, OBSERV_SOLIC,' +CR_LF+
    '  IDREQUISITANTE, IDPROCESSO, PR.NOME AS NOME_REQUIS, PI.NOME AS NOME_INDIC,' +CR_LF+
    '  MO.DESCRICAO AS TIPO_DESCR' +CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PR, PESSOA PI, SOLALTFUNC SAF, MOTIVO MO'+CR_LF+
    'WHERE' +CR_LF+
    sSQL+
    '  (SAF.IDMOTIVO       = MO.IDMOTIVO) AND' +CR_LF+
    '  (SAF.IDREQUISITANTE = PR.IDPESSOA) AND' +CR_LF+
    '  (SAF.IDINDICADO     = PI.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  ID_SOLIC_ALTER_FUNC');
end;

function TCtrlRegSolic.GetProximoID(DataRef: TDate): double;
var
  _CdsAux: TCMClientDataSet;
  rUltNum: real;
  Ano, Mes, Dia, Ano1, Mes1, Dia1: word;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT SF.ID_SOLIC_ALTER_FUNC, SF.DATA_SOLIC_ALTER' +CR_LF+
    'FROM' +CR_LF+
    '  SOLALTFUNC SF,' +CR_LF+
    '  (SELECT MAX(ID_SOLIC_ALTER_FUNC) AS ID' +CR_LF+
    '   FROM   SOLALTFUNC) USF' +CR_LF+
    'WHERE' +CR_LF+
    '  (SF.ID_SOLIC_ALTER_FUNC = USF.ID)');
  if (_CdsAux.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat > 0) then
  begin
    DecodeDate(_CdsAux.FieldByName('DATA_SOLIC_ALTER').asDateTime, Ano1, Mes1, Dia1);
    rUltNum := _CdsAux.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat;
  end
  else
  begin
    Ano1 := 0;
    rUltNum := 0;
  end;  

  rUltNum := rUltNum + 1;
  DecodeDate(DataRef, Ano, Mes, Dia);

  if (Ano <> Ano1) then
    rUltNum := Ano * 10000 + 1;

  Result := rUltNum;
  FreeObject(_CdsAux);
end;

function TCtrlRegSolic.GetNumCartaSolic(Id_Solic_Alter_Func: double): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  C.NUMCARTA' +CR_LF+
    'FROM' +CR_LF+
    '  SOLALTFUNC S, CARTA C' +CR_LF+
    'WHERE' +CR_LF+
    '  (S.ID_SOLIC_ALTER_FUNC = ' +FloatToStr(Id_Solic_Alter_Func)+ ') AND' +CR_LF+
    '  (S.IDMOTIVO            = C.IDMOTIVO)');

  Result := _Cds.FieldByName('NUMCARTA').asInteger;
end;

function TCtrlRegSolic.GerarValSolic(DadosFunc: OleVariant): double;
var
  dValor: double;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := DadosFunc;

  FCdsSolAltFunc.DisableControls;
  FCdsSolAltFunc.First;
  Result := 0;
  while not(FCdsSolAltFunc.EOF) do
  begin
    dValor := FCdsSolAltFunc.FieldByName('NOVO_SALARIO').asFloat *
      (1 - (100 / (100 + FCdsSolAltFunc.FieldByName('PERC_REAJ').asFloat)));

    _CdsAux.Locate('IDPESSOA', FCdsSolAltFunc.FieldByName('IDINDICADO').asString, []);
    if (_CdsAux.FieldByName('TIPOPAGAMENTO').asString = 'D') then
      dValor := dValor * 30
    else
    if (_CdsAux.FieldByName('TIPOPAGAMENTO').asString = 'H') then
      dValor := dValor * _CdsAux.FieldByName('JORNADAMENSAL').asInteger;

    FCdsSolAltFunc.Next;
    Result := Result + dValor;
  end;
  FCdsSolAltFunc.First;
  FCdsSolAltFunc.EnableControls;

  FreeObject(_CdsAux);
end;

function TCtrlRegSolic.GerarDadosCarta(SelPessoaIndicada, SomenteProposta: boolean;
  var ListaNumCarta, ListaIdSolSemCarta, ListaIdPessoa: string): boolean;
var
  iNumCarta: integer;
begin
  try
    ListaNumCarta := '';
    ListaIdSolSemCarta := '';
    ListaIdPessoa := '';
    Result := true;

    if (SelPessoaIndicada) then
    begin
      if ((SomenteProposta) and (FCdsSolAltFunc.FieldByName('SITUACAO_SOLIC').asInteger = 0)) or
         not(SomenteProposta) then
      begin
        iNumCarta := GetNumCartaSolic(FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat);
        if (iNumCarta = 0) then
          ListaIdSolSemCarta := FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asString
        else
        begin
          ListaIdPessoa := FCdsSolAltFunc.FieldByName('IDINDICADO').asString;
          ListaNumCarta := IntToStr(iNumCarta);
        end;
      end;
    end
    else
    begin
      FCdsSolAltFunc.DisableControls;
      FCdsSolAltFunc.First;
      while not(FCdsSolAltFunc.EOF) do
      begin
        if ((SomenteProposta) and (FCdsSolAltFunc.FieldByName('SITUACAO_SOLIC').asInteger = 0)) or
           not(SomenteProposta) then
        begin
          iNumCarta := GetNumCartaSolic(FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asFloat);
          if (iNumCarta = 0) then
          begin
            if (VerificaCodigoEm(ListaIdSolSemCarta,
                FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asString,',') <> 1) then
            begin
              if (Trim(ListaIdSolSemCarta) = '') then
                ListaIdSolSemCarta := FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asString
              else
                ListaIdSolSemCarta := ListaIdSolSemCarta +
                  IFF(Trim(ListaIdSolSemCarta) = '','',',') +
                  FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asString;
            end;
          end
          else
          begin
            if (Trim(ListaIdPessoa) = '') then
            begin
              ListaIdPessoa := FCdsSolAltFunc.FieldByName('IDINDICADO').asString;
              ListaNumCarta := IntToStr(iNumCarta);
            end
            else
            if (VerificaCodigoEm(ListaIdPessoa,
                FCdsSolAltFunc.FieldByName('IDINDICADO').asString,',') <> 1) then
            begin
              ListaIdPessoa := ListaIdPessoa +','+ FCdsSolAltFunc.FieldByName('IDINDICADO').asString;
              ListaNumCarta := ListaNumCarta +','+ IntToStr(iNumCarta);
            end;
          end;
        end;  
        FCdsSolAltFunc.Next;
      end;
      FCdsSolAltFunc.First;
      FCdsSolAltFunc.EnableControls;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate('Ocorreu um erro na geração dos parâmetros Carta.') +
        CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlRegSolic.GerarProcessoRAD(OBS: string): boolean;
var
  bOk: boolean;
begin
  MessageInfo := '';
  try
    if (FIdTipoProcesso > 0) then
    begin
      if (FCdsSolAltFunc.FieldByName('IDPROCESSO').asFloat <= 0) then
      begin
        FCtrlRad.TipoProcesso := FIdTipoProcesso;
        FCtrlRad.IdPessoa := FIdEmpresa;
        FCtrlRad.IdPessResp := Trunc(FCdsSolAltFunc.FieldByName('IDINDICADO').asFloat);
        FCtrlRad.OBS := OBS;
        FCtrlRad.Valor := FCdsSolAltFunc.FieldByName('NOVO_SALARIO').asFloat;

        if not(FCdsFunc.IsEmpty) then
        begin
          FCtrlRad.IdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;
          FCtrlRad.CodCentroCusto := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;
        end;

        if not(FCdsSolAltFunc.State in [dsInsert,dsEdit]) then
          FCdsSolAltFunc.Edit;
        FCdsSolAltFunc.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
        FCdsSolAltFunc.Post;

        if (FCdsSolAltFunc.FieldByName('IDPROCESSO').asInteger < 0) then
          raise Exception.Create(
            CMTranslate('Erro ao tentar instanciar o processo no RAD.')+
            CR_LF + FCtrlRad.MessageInfo)
        else
        begin
          if (MessageInfo = '') then
            MessageInfo := CMTranslate('Nº do(s) Processo(s) RAD Gerado(s):') +CR_LF+
              FCdsSolAltFunc.FieldByName('IDPROCESSO').asString
          else
            MessageInfo := MessageInfo +', '+
              FCdsSolAltFunc.FieldByName('IDPROCESSO').asString;
        end;
      end
      else
      begin
        bOk := ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +
                       OraNumero(FCdsSolAltFunc.FieldByName('NOVO_SALARIO').asString) +
                       ', OBS = ' +QuotedStr(OBS)+
                       ' WHERE IDPROCESSO = ' +FCdsSolAltFunc.FieldByName('IDPROCESSO').asString);
        if not(bOk) then
          raise Exception.Create(CMTranslate('Erro ao tentar atualizar o processo no RAD.')+
            CR_LF + MessageInfo);
      end;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRegSolic.GravarRegSolic(OBS_RAD: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegSolic(FCdsSolAltFunc.Data, FIdEmpresa,
      FTipoEmpresa, FIntegraRAD, FIdUsuario, OBS_RAD, FImplementarSolicitacao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if (FIntegraRAD) and (OBS_RAD <> '') then
        if not(GerarProcessoRAD(OBS_RAD)) then
          raise Exception.Create(MessageInfo);

      if (FImplementarSolicitacao) then
        if not(GravarImplementacaoSolicitacao) then
          raise Exception.Create(MessageInfo);

      Result := ApplyCds(FCdsSolAltFunc, FDbSolAltFunc, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbSolAltFunc.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlRegSolic.GravarSolicitacaoAtual: boolean;
begin
  try
    if (FCdsSolAltFunc.FieldByName('SITUACAO_SOLIC').asInteger = 0) then
    begin
      if not(GravarImplementacaoSolicitacao) then
        raise Exception.Create(MessageInfo);

      FCdsSolAltFunc.Edit;
      FCdsSolAltFunc.FieldByName('SITUACAO_SOLIC').asInteger := 1;
      FCdsSolAltFunc.Post;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate('* Erro na Solicitação Nº') +
        FCdsSolAltFunc.FieldByName('ID_SOLIC_ALTER_FUNC').asString +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlRegSolic.GravarSolicitacoes(const IAppCliente: OleVariant;
  SomentePessoaIndicada: boolean; ListaIdIndicado: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSolicitacoes(IAppCliente,
      FCdsSolAltFunc.Data, FIdEmpresa, FTipoEmpresa, FIntegraRAD, FIdUsuario,
      SomentePessoaIndicada, ListaIdIndicado);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    if not(IsAppServer) then
    FCdsFunc := TCMClientDataSet.Create(nil);

    FCdsFunc.Data := FCtrlPessoaFuncionario.ListFuncionario(ListaIdIndicado);
    try
      StartTransaction;

      if (SomentePessoaIndicada) then
      begin
        if not(GravarSolicitacaoAtual) then
          raise Exception.Create(MessageInfo);
          
        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarGravarSolicitacoes_CB;
        except
        end;
      end
      else
      begin
        FCdsSolAltFunc.DisableControls;
        FCdsSolAltFunc.First;
        while not(FCdsSolAltFunc.EOF) do
        begin
          if (FCdsFunc.Locate('IDPESSOA',
              FCdsSolAltFunc.FieldByName('IDINDICADO').asFloat, [])) then
            if not(GravarSolicitacaoAtual) then
              raise Exception.Create(MessageInfo);
          FCdsSolAltFunc.Next;
          
          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarGravarSolicitacoes_CB;
          except
          end;
        end;
        FCdsSolAltFunc.First;
        FCdsSolAltFunc.EnableControls;
      end;

      Result := ApplyCds(FCdsSolAltFunc, FDbSolAltFunc, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbSolAltFunc.MessageInfo);

      MessageInfo := CMTranslate('Efetivação concluída com sucesso.');
    except
      on E: Exception do
      begin
        Result := false;
        Rollback;
        MessageInfo := CMTranslate('Ocorreu um erro na efetivação das Solicitações.') +
          CR_LF+ E.Message;
      end;
    end;
    if not(IsAppServer) then
      FCdsFunc.Free;
  end;
end;

function TCtrlRegSolic.GravarImplementacaoSolicitacao: boolean;
begin
  try
    FCdsEvolFunc.Data := FCtrlEvolFunc.ListEvolFunc(-1);
    // Gravar histórico
    FCdsEvolFunc.Insert;
    FCdsEvolFunc.FieldByName('IDPESSOA').asFloat := FCdsSolAltFunc.FieldByName('IDINDICADO').asFloat;
    FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime := FCdsSolAltFunc.FieldByName('DATA_EFETIV_ALTER').asDateTime;
    FCdsEvolFunc.FieldByName('IDESTAB').asFloat := FCdsSolAltFunc.FieldByName('IDESTAB').asFloat;
    FCdsEvolFunc.FieldByName('IDEMPRESA').asInteger := FCdsSolAltFunc.FieldByName('IDEMPRESA').asInteger;
    FCdsEvolFunc.FieldByName('CODCENTROCUSTO').asString := FCdsSolAltFunc.FieldByName('CODCENTROCUSTO').asString;
    FCdsEvolFunc.FieldByName('IDCARGO').asFloat := FCdsSolAltFunc.FieldByName('IDCARGO').asFloat;
    FCdsEvolFunc.FieldByName('SALARIO').asFloat := FCdsSolAltFunc.FieldByName('NOVO_SALARIO').asFloat;
    FCdsEvolFunc.FieldByName('IDMOTIVO').asFloat := FCdsSolAltFunc.FieldByName('IDMOTIVO').asFloat;
    FCdsEvolFunc.FieldByName('PERC_REAJ').asFloat := FCdsSolAltFunc.FieldByName('PERC_REAJ').asFloat;
    FCdsEvolFunc.FieldByName('TIPOPAGAMENTO').asString := FCdsSolAltFunc.FieldByName('NOVO_TIPO_SAL').asString;
    FCdsEvolFunc.FieldByName('TRGDTINCLUSAO').asDateTime := Now;
    FCdsEvolFunc.Post;

    // Atualizar cadastro
    if (FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime >=
        FCdsFunc.FieldByName('DATASALARIO').asDateTime) and
       (FCdsEvolFunc.FieldByName('SALARIO').asFloat <>
        FCdsFunc.FieldByName('SALARIOATUAL').asFloat) then
    begin
      FCdsFunc.Edit;
      FCdsFunc.FieldByName('DATASALARIO').asDateTime := FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime;
      FCdsFunc.FieldByName('SALARIOATUAL').asFloat := FCdsEvolFunc.FieldByName('SALARIO').asFloat;
      FCdsFunc.FieldByName('TIPOPAGAMENTO').asString := FCdsEvolFunc.FieldByName('TIPOPAGAMENTO').asString;
    end;

    if (FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime >=
        FCdsFunc.FieldByName('DATACARGO').asDateTime) and
       (FCdsEvolFunc.FieldByName('IDCARGO').asFloat <>
        FCdsFunc.FieldByName('IDCARGO').asFloat) then
    begin
      FCdsFunc.Edit;
      FCdsFunc.FieldByName('DATACARGO').asDateTime := FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime;
      FCdsFunc.FieldByName('IDCARGO').asFloat := FCdsEvolFunc.FieldByName('IDCARGO').asFloat;
    end;

    if (FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime >=
        FCdsFunc.FieldByName('DATALOTACAO').asDateTime) and
       ((FCdsEvolFunc.FieldByName('CODCENTROCUSTO').asString <>
         FCdsFunc.FieldByName('CODCENTROCUSTO').asString) or
        (FCdsEvolFunc.FieldByName('IDESTAB').asFloat <>
         FCdsFunc.FieldByName('IDESTAB').asFloat)) then
    begin
      FCdsFunc.Edit;
      FCdsFunc.FieldByName('DATALOTACAO').asDateTime := FCdsEvolFunc.FieldByName('DATAALTERFUNC').asDateTime;
      FCdsFunc.FieldByName('IDESTAB').asFloat := FCdsEvolFunc.FieldByName('IDESTAB').asFloat;
      FCdsFunc.FieldByName('IDEMPRESA').asInteger := FCdsEvolFunc.FieldByName('IDEMPRESA').asInteger;
      FCdsFunc.FieldByName('CODCENTROCUSTO').asString := FCdsEvolFunc.FieldByName('CODCENTROCUSTO').asString;
    end;

    if (FCdsFunc.State = dsEdit) then
      FCdsFunc.Post;

    // Efetivar alterações no Banco de Dados
    if (IsAppServer) then
    begin
      FCtrlEvolFunc.CdsEvolFunc.Data := FCdsEvolFunc.Data;
      FCtrlEvolFunc.CdsFuncionario.Data := FCdsFunc.Data;
    end
    else
    begin
      FCtrlEvolFunc.CdsEvolFunc := FCdsEvolFunc;
      FCtrlEvolFunc.CdsFuncionario := FCdsFunc;
    end;

    if not(FCtrlEvolFunc.GravarEvolFunc(true)) then
      raise Exception.Create(FCtrlEvolFunc.MessageInfo);

    // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
    // de RH e Folha de Pagamento de uma Fundação
    if (FTipoEmpresa = 'P') and (FCdsFunc.FieldByName('IDEMPRESA').asInteger > 0) then
    begin
      if not(FCtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
             FCdsFunc.FieldByName('IDEMPRESA').asFloat,
             FCdsFunc.FieldByName('IDPESSOA').asFloat)) then
        raise Exception.Create(
          CMTranslate('Ocorreu um erro ao tentar atualizar tabelas do Previdenciário.')+
          CR_LF + CMTranslate('Erro:')+ CR_LF+ FCtrlIntegraPrevRH.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate('* Gravação do histórico.') +CR_LF+ E.Message;
    end;
  end;
end;

end.
