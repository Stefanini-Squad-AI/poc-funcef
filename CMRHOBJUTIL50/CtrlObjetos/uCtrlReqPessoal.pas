{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/12/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlReqPessoal;

interface

uses Classes, Db, Controls, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlRAD, uCtrlCustomRH, uDbRequiPes, uDbRequiCand;

type
  TCtrlReqPessoal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlRAD: TCtrlRAD;
    FCdsReqPessoal: TCMClientDataSet;
    FCdsReqCandidato: TCMClientDataSet;
    FDbReqPessoal: TDbRequiPes;
    FDbReqCandidato: TDbRequiCand;

    FIdEmpresa: integer;
    FIntegraRAD: boolean;

    function SomaValorTotal: double;
    function GerarProcessoRAD(IdTipoProcesso: integer; CodCentroCusto,
      NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
  public
    constructor Create(IntegraRAD: boolean; IdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function ListRequisicao(NumReq: double): OleVariant;
    function ListDadosEssenciaisReqPessoa(NumReq: double): OleVariant;
    function ListReqCand(NumReq, IdPessoa: double): OleVariant;
    function ListCandidatosRequisicao(NumReq: double): OleVariant;

    function  GetNumAprovados: integer;
    procedure ReprovarTodos;

    function InserirRequisicaoCand: boolean;
    function GravarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
      NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
    function ExcluirRequisicao: boolean;
    function CopiarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
      NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;

    property CdsReqPessoal: TCMClientDataSet read FCdsReqPessoal write FCdsReqPessoal;
    property CdsReqCandidato: TCMClientDataSet read FCdsReqCandidato write FCdsReqCandidato;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_RAD_CRIADO = 'Processo RAD Nº :1 foi criado.';

{ TCtrlReqPessoal }

constructor TCtrlReqPessoal.Create(IntegraRAD: boolean; IdEmpresa: integer);
begin
  FDbReqPessoal := TDbRequiPes.Create(Self);
  FDbReqCandidato := TDbRequiCand.Create(Self);

  FIdEmpresa := IdEmpresa;
  FIntegraRAD := IntegraRAD;
  if (FIntegraRAD) then
    FCtrlRAD := TCtrlRAD.Create;

  inherited Create;
end;

destructor TCtrlReqPessoal.Destroy;
begin
  FDbReqPessoal.Free;
  FDbReqCandidato.Free;
  if (IsAppServer) then
  begin
    FCdsReqPessoal.Free;
    FCdsReqCandidato.Free;
  end;
  if (FIntegraRAD) then
    FCtrlRad.Free;
  inherited;
end;

procedure TCtrlReqPessoal.AfterInitialize;
begin
  inherited;
  if (FIntegraRAD) then
    FCtrlRAD.InitializeAs(Self);
end;

procedure TCtrlReqPessoal.OnCreateAppServer;
begin
  inherited;
  FCdsReqPessoal := TCMClientDataSet.Create(nil);
  FCdsReqCandidato := TCMClientDataSet.Create(nil);
end;

procedure TCtrlReqPessoal.DoChangeDataBase;
begin
  inherited;
  FDbReqPessoal.DataBaseName := DataBaseName;
  FDbReqCandidato.DataBaseName := DataBaseName;
end;

function TCtrlReqPessoal.ListRequisicao(NumReq: double): OleVariant;
begin
//  FDbReqPessoal.NumReq.asFloat := NumReq;
//  Result := GetDataPacket(FDbReqPessoal.sSqlSelect);
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  RP.*, NVL(FP.FATORFAIXA,1) AS FATORFAIXA' +CR_LF+
    'FROM' +CR_LF+
    '  REQUIPES RP, FILIALPESSOA FP' +CR_LF+
    'WHERE' +CR_LF+
    '  (RP.NUMREQ  = ' +FloatToStr(NumReq)+ ') AND' +CR_LF+
    '  (RP.IDESTAB = FP.IDFILIALPESSOA)');
end;

function TCtrlReqPessoal.ListDadosEssenciaisReqPessoa(NumReq: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCARGO, DECODE(TIPOCONTRATO,''1'',''T'',''2'',''G'',''E'') AS TIPOCONTRATO'+CR_LF+
    'FROM'+CR_LF+
    '  REQUIPES'+CR_LF+
    'WHERE'+CR_LF+
    '  (NUMREQ  = ' +FloatToStr(NumReq)+ ')');
end;

function TCtrlReqPessoal.ListReqCand(NumReq, IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  REQUICAND'+CR_LF+
    'WHERE'+CR_LF+
    IFF(NumReq = -1, '', '  (NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF)+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlReqPessoal.ListCandidatosRequisicao(NumReq: double): OleVariant;
begin
  Result := GetDataPacket(
    '( SELECT'+CR_LF+
    '    UPPER(P.NOME) AS UPNOME, P.NOME, C.TITULO, R.*, ' +QuotedStr(('Externo'))+ ' AS TIPOCAND'+CR_LF+
    '  FROM'+CR_LF+
    '    PESSOA P, CARGO C, REQUICAND R, CANDIDAT CA'+CR_LF+
    '  WHERE'+CR_LF+
    '    (CA.IDCARGO = C.IDCARGO(+)) AND'+CR_LF+
    '    (R.NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF+
    '    (R.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '    (R.IDPESSOA = CA.IDPESSOA) )'+CR_LF+
    'UNION'+CR_LF+
    '( SELECT'+CR_LF+
    '    UPPER(P.NOME) AS UPNOME, P.NOME, C.TITULO, R.*, ' +QuotedStr(('Interno'))+ ' AS TIPOCAND'+CR_LF+
    '  FROM'+CR_LF+
    '    PESSOA P, CARGO C, REQUICAND R, FUNCIONARIO F'+CR_LF+
    '  WHERE'+CR_LF+
    '    (F.IDCARGO  = C.IDCARGO(+)) AND'+CR_LF+
    '    (R.NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF+
    '    (R.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '    (R.IDPESSOA = F.IDPESSOA) )'+CR_LF+
    'ORDER BY 1');
end;

function TCtrlReqPessoal.GetNumAprovados: integer;
begin
  Result := 0;
  FCdsReqCandidato.DisableControls;
  FCdsReqCandidato.First;
  while not(FCdsReqCandidato.EOF) do
  begin
    if (FCdsReqCandidato.FieldByName('FLGAPROVADO').asInteger = 1) then
      Inc(Result);
    FCdsReqCandidato.Next;
  end;
  FCdsReqCandidato.EnableControls;
end;

function TCtrlReqPessoal.SomaValorTotal: double;
var
  DataPlanejada: TDate;
  _CdsAux: TCMClientDataSet;
  NumDias, NumMeses, NumAnos: integer;
begin
  Result := 0;
  DataPlanejada := FCdsReqPessoal.FieldByName('DATAPLAN').asDateTime;
  if (DataPlanejada > 0) then
  begin
    _CdsAux := TCMClientDataSet.Create(nil);
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  ROUND(FX.STEP1 ' +
      IFF(FCdsReqPessoal.FieldByName('FATORFAIXA').asFloat>0,
        '* ' + Float2String(FCdsReqPessoal.FieldByName('FATORFAIXA').asFloat) +' ', '')+
        '* ENC.ENCARGOS, 2) AS VALORTOTAL' +CR_LF+
      'FROM' +CR_LF+
      '  FAIXASAL FX, CARGO C,' +CR_LF+
      '  (SELECT' +CR_LF+
      '     ((100 + NVL(SUM(PERCENCARGO),0)) / 100) AS ENCARGOS' +CR_LF+
      '   FROM' +CR_LF+
      '     ENCARGO) ENC' +CR_LF+
      'WHERE' +CR_LF+
      '  (C.IDCARGO         = ' +IntToStr(FCdsReqPessoal.FieldByName('IDCARGO').asInteger)+ ') AND' +CR_LF+
      '  (C.IDFAIXASALARIAL = FX.IDFAIXASALARIAL)');

    if not(_CdsAux.IsEmpty) then
    begin
      CalculaDifData(DateToStr(DataPlanejada), '31/12/'+IntToStr(ExtraiAno(DataPlanejada)),
        NumDias, NumMeses, NumAnos);
      Result := _CdsAux.FieldByName('VALORTOTAL').asFloat * NumMeses;
    end;
    _CdsAux.Free;
  end;
end;

procedure TCtrlReqPessoal.ReprovarTodos;
begin
  FCdsReqCandidato.First;
  while not(FCdsReqCandidato.EOF) do
  begin
    FCdsReqCandidato.Edit;
    FCdsReqCandidato.FieldByName('FLGAPROVADO').asInteger := 0;
    FCdsReqCandidato.Post;
    FCdsReqCandidato.Next;
  end;
  FCdsReqCandidato.First;
end;

function TCtrlReqPessoal.GerarProcessoRAD(IdTipoProcesso: integer; CodCentroCusto,
  NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
var
  ValorTotal: double;
begin
  MessageInfo := '';
  try
    ValorTotal := SomaValorTotal;
    if (FIntegraRAD) and (IdTipoProcesso > 0) then
    begin
      if (FCdsReqPessoal.FieldByName('IDPROCESSO').asInteger <= 0) then
      begin
        FCtrlRad.TipoProcesso := IdTipoProcesso;
        FCtrlRad.IdPessoa := FIdEmpresa;
        FCtrlRad.IdEmpresa := FIdEmpresa;
        FCtrlRad.CodCentroCusto := CodCentroCusto;
        FCtrlRad.OBS :=
          ('Aberta em: ') +FCdsReqPessoal.FieldByName('DATAREQ').asString +CR_LF+
          ('Data Desejada de Atendimento: ') +FCdsReqPessoal.FieldByName('DATAPLAN').asString +CR_LF+
          ('Cargo Solicitado: ') +NomeCargo+CR_LF+
          ('Centro de Custo: ') +NomeCentroCusto+CR_LF+
          ('Tipo: ') +IFF(FCdsReqPessoal.FieldByName('TIPOREQ').asInteger=1,
          ('Ampliação'), ('Substituição'))+
          iff(FCdsReqPessoal.FieldByName('TIPOREQ').asInteger=1,
          '',CR_LF+('Nome Substituído: ') + NomeSubstituido);
        FCtrlRad.Valor := ValorTotal;

        if not(FCdsReqPessoal.State in [dsInsert,dsEdit]) then
          FCdsReqPessoal.Edit;
        FCdsReqPessoal.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
        FCdsReqPessoal.Post;

        if (FCdsReqPessoal.FieldByName('IDPROCESSO').asInteger < 0) Then
          raise Exception.Create(('Erro ao tentar instanciar o processo no RAD.'))
        else
          MessageInfo := CMTranslateMsg(MSG_RAD_CRIADO, [FCdsReqPessoal.FieldByName('IDPROCESSO').asString]);
      end
      else
      begin
        try
          ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +OraNumero(FloatToStr(ValorTotal))+
                  ' WHERE IDPROCESSO = ' +FCdsReqPessoal.FieldByName('IDPROCESSO').asString);
        except
          raise Exception.Create(('Erro ao tentar atualizar o processo no RAD.'));
        end;
      end;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

function TCtrlReqPessoal.InserirRequisicaoCand: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirRequisicaoCand(FCdsReqCandidato.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsReqCandidato, FDbReqCandidato, [], []);
      if not(Result) then
        raise Exception.Create(FDbReqCandidato.MessageInfo);

      Commit;
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

function TCtrlReqPessoal.GravarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
  NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRequisicao(FIntegraRAD, FIdEmpresa, IdTipoProcesso,
      CodCentroCusto, NomeCargo, NomeSubstituido, NomeCentroCusto, FCdsReqPessoal.Data,
      FCdsReqCandidato.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsReqCandidato.DisableControls;
    try
      StartTransaction;

      // Integração com o RAD
      if not(GerarProcessoRAD(IdTipoProcesso, CodCentroCusto, NomeCargo, NomeSubstituido, NomeCentroCusto)) then
        raise Exception.Create(MessageInfo);

      // Gravar a Requisição
      Result := ApplyCds(FCdsReqPessoal, FDbReqPessoal, [], []);
      if not(Result) then
        raise Exception.Create(FDbReqPessoal.MessageInfo);

      // Gravar os Candidatos da Requisição
      Result := ApplyCds(FCdsReqCandidato, FDbReqCandidato, [FDbReqPessoal.NumReq],
        [FDbReqCandidato.NumReq]);
      if not(Result) then
        raise Exception.Create(FDbReqCandidato.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsReqCandidato.EnableControls;
  end;
end;

function TCtrlReqPessoal.ExcluirRequisicao: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirRequisicao(FIntegraRAD, FIdEmpresa,
      FCdsReqPessoal.Data, FCdsReqCandidato.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Excluir os Candidatos da Requisição
      FCdsReqCandidato.First;
      while not(FCdsReqCandidato.EOF) do
        FCdsReqCandidato.Delete;
        
      Result := ApplyCds(FCdsReqCandidato, FDbReqCandidato, [], []);
      if not(Result) then
        raise Exception.Create(FDbReqCandidato.MessageInfo);
      FCdsReqCandidato.EmptyDataSet;

      // Gravar a Requisição
      Result := ApplyCds(FCdsReqPessoal, FDbReqPessoal, [], []);
      if not(Result) then
        raise Exception.Create(FDbReqPessoal.MessageInfo);
      FCdsReqPessoal.EmptyDataSet;

      Commit;
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

function TCtrlReqPessoal.CopiarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
  NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
var
  _Cds: TCMClientDataSet;
begin
  Result := true;
  try
    _Cds := TCMClientDataSet.Create(nil);
    try
      FCdsReqPessoal.DisableControls;

      _Cds.Data := FCdsReqPessoal.Data;

      if not(AssociarDadosCds(_Cds, FCdsReqPessoal)) then
        raise Exception.Create(('Erro ao tentar inserir dados na tabela: ')+
          FDbReqPessoal.TableName)
      else
      begin
        FCdsReqPessoal.Edit;
        FCdsReqPessoal.FieldByName('SITUACAO').asString := 'A';
        FCdsReqPessoal.FieldByName('NUMREQ').Clear;
        FCdsReqPessoal.FieldByName('IDNOVOOCUP').Clear;
        FCdsReqPessoal.FieldByName('DATAREQ').asDateTime := Date;
        FCdsReqPessoal.Post;
      end;

      if (GravarRequisicao(IdTipoProcesso, CodCentroCusto, NomeCargo,
          NomeSubstituido, NomeCentroCusto)) then
        MessageInfo := ('Replicação concluída com sucesso.')
      else
        raise Exception.Create(MessageInfo);

      FCdsReqPessoal.Data := _Cds.Data;

      FCdsReqPessoal.EnableControls;

      Result := true;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(_Cds);
  end;
end;

end.
