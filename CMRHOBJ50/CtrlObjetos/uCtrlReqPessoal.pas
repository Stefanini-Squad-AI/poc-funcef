{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/12/2002                                 }
{                                                       }
{*******************************************************}


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 199923 KINTANA 1926807
//Responsável : MARCIO SANCHES SPINOSA
//Data        : 05/02/2013
//Descrição   : Ajuste na função GravarRequisicao.
//------------------------------------------------------------------------------
//Pendência   : SOL 137265 KINTANA 829773
//Responsável : RODRIGO DE BRITO FIGUEREDO
//Data        : 18/09/2012
//Descrição   : Criada function ListCaracteristicasPessoais.
//------------------------------------------------------------------------------


unit uCtrlReqPessoal;

interface

uses Classes, Db, Controls, SysUtils, uSistema, uCmDbObject, uCmControlObject,
  uCMClientDataSet, uCtrlRAD, uCtrlCustomRH, uDbRequiPes, uDbRequiCand ,
  uDbRequipesxcaracpessoais;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773

  const ModAuto = 1;//MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807

type
  TCtrlReqPessoal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlRAD: TCtrlRAD;
    FCdsReqPessoal             : TCMClientDataSet;
    FCdsReqCandidato           : TCMClientDataSet;
    FCdsRequipesxcaracpessoais : TCMClientDataSet;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773


    FDbReqPessoal             : TDbRequiPes;
    FDbReqCandidato           : TDbRequiCand;
    FDBRequipesxcaracpessoais : TDBRequipesxcaracpessoais;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773


    FIdEmpresa: integer;
    FIntegraRAD: boolean;
    FIDModulo : integer;//MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807

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

    function ListCaracteristicasPessoais(NumReq: double; bTodos: Boolean): OleVariant;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773

    function  GetPessoaSubstituida(const IdPessoa: double): boolean;

    function  GetNumAprovados: integer;
    procedure ReprovarTodos;

    function InserirRequisicaoCand: boolean;
    function GravarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
      NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
    function ExcluirRequisicao: boolean;
    function CopiarRequisicao(IdTipoProcesso: integer; CodCentroCusto,
      NomeCargo, NomeSubstituido, NomeCentroCusto: string): boolean;
    procedure AtualizaIDModulo(pintIDModulo : integer); //MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807

    property CdsReqPessoal: TCMClientDataSet read FCdsReqPessoal write FCdsReqPessoal;
    property CdsReqCandidato: TCMClientDataSet read FCdsReqCandidato write FCdsReqCandidato;
    property CdsRequipesxcaracpessoais : TCMClientDataSet read FCdsRequipesxcaracpessoais  write FCdsRequipesxcaracpessoais;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773


  end;


implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlReqPessoal }

constructor TCtrlReqPessoal.Create(IntegraRAD: boolean; IdEmpresa: integer);
begin
  FDbReqPessoal := TDbRequiPes.Create(Self);
  FDbReqCandidato := TDbRequiCand.Create(Self);

  FDBRequipesxcaracpessoais := TDBRequipesxcaracpessoais.Create(Self); //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773

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
  FCdsRequipesxcaracpessoais := TCMClientDataSet.Create(nil);//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
end;

procedure TCtrlReqPessoal.DoChangeDataBase;
begin
  inherited;
  FDbReqPessoal.DataBaseName := DataBaseName;
  FDbReqCandidato.DataBaseName := DataBaseName;
  FDBRequipesxcaracpessoais.DataBaseName := DataBaseName;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
end;

function TCtrlReqPessoal.ListRequisicao(NumReq: double): OleVariant;
begin
  FDbReqPessoal.NumReq.asFloat := NumReq;
  Result := GetDataPacket(FDbReqPessoal.sSqlSelect);
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
    '  (NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlReqPessoal.ListCandidatosRequisicao(NumReq: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UPPER(P.NOME) AS UPNOME, P.NOME, C.TITULO, R.*, ''Externo'' AS TIPOCAND'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, CARGO C, REQUICAND R, CANDIDAT CA'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF+
    '  (R.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (R.IDPESSOA = CA.IDPESSOA) AND'+CR_LF+
    '  (CA.IDCARGO = C.IDCARGO(+))'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  UPPER(P.NOME) AS UPNOME, P.NOME, C.TITULO, R.*, ''Interno'' AS TIPOCAND'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, CARGO C, REQUICAND R, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.NUMREQ   = ' +FloatToStr(NumReq)+ ') AND'+CR_LF+
    '  (R.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (R.IDPESSOA = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO  = C.IDCARGO(+))'+CR_LF+
    'ORDER BY 1');
end;

function TCtrlReqPessoal.GetPessoaSubstituida(const IdPessoa: double): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    try
      _CdsAux.Data := GetDataPacket(
        'SELECT DISTINCT IDSUBSTITUIDO' +CR_LF+
        'FROM   REQUIPES' +CR_LF+
        'WHERE  (IDSUBSTITUIDO = ' +FloatToStr(IdPessoa)+ ')');
      Result := (_CdsAux.FieldByName('IDSUBSTITUIDO').asString <> '');
    finally
      _CdsAux.Free;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
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
      'SELECT'+CR_LF+
      '  ROUND(FX.STEP1 * ENC.ENCARGOS, 2) AS VALORTOTAL'+CR_LF+
      'FROM'+CR_LF+
      '  FAIXASAL FX, CARGO C,'+CR_LF+
      '  (SELECT'+CR_LF+
      '     ((100 + NVL(SUM(PERCENCARGO),0)) / 100) AS ENCARGOS'+CR_LF+
      '   FROM'+CR_LF+
      '     ENCARGO) ENC'+CR_LF+
      'WHERE'+CR_LF+
      '  (C.IDCARGO         = ' +FCdsReqPessoal.FieldByName('IDCARGO').asString+ ') AND'+CR_LF+
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
          'Aberta em: '+FCdsReqPessoal.FieldByName('DATAREQ').asString +CR_LF+
          'Data Desejada de Atendimento: '+FCdsReqPessoal.FieldByName('DATAPLAN').asString +CR_LF+
          'Cargo Solicitado: '+ NomeCargo+CR_LF+
          'Centro de Custo: ' +NomeCentroCusto+CR_LF+
          'Tipo: '+iff(FCdsReqPessoal.FieldByName('TIPOREQ').asInteger=1,
          'Ampliação','Substituição')+
          iff(FCdsReqPessoal.FieldByName('TIPOREQ').asInteger=1,
          '',CR_LF+'Nome Substituído: '+NomeSubstituido);
        FCtrlRad.Valor := ValorTotal;

        if not(FCdsReqPessoal.State in [dsInsert,dsEdit]) then
          FCdsReqPessoal.Edit;
        FCdsReqPessoal.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
        FCdsReqPessoal.Post;

        if (FCdsReqPessoal.FieldByName('IDPROCESSO').asInteger < 0) Then
          raise Exception.Create('Erro ao tentar instanciar o processo no RAD.')
        else
          MessageInfo := 'Processo RAD Nº '+
                         FCdsReqPessoal.FieldByName('IDPROCESSO').asString+
                         ' foi criado.';
      end
      else
      begin
        try
          ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +OraNumero(FloatToStr(ValorTotal))+
                  ' WHERE IDPROCESSO = ' +FCdsReqPessoal.FieldByName('IDPROCESSO').asString);
        except
          raise Exception.Create('Erro ao tentar atualizar o processo no RAD.');
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


      //MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807
      if (FIDModulo = ModAuto) then
      begin
      //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
        Result := ExecSQL('update REQUIPESXCARACPESSOAIS '+
                          '   set IDCARACPESSOAIS = IDCARACPESSOAIS '+
                          ' where NUMREQ = ' + FDbReqPessoal.NumReq.AsString );

        // Gravar caracteristicas pessoais
        Result := ApplyCds(FCdsRequipesxcaracpessoais,
                           FDbRequipesxcaracpessoais,
                           [FDbReqPessoal.NumReq],
                           [FDbRequipesxcaracpessoais.NumReq]);

        if not(Result) then
          raise Exception.Create(FDbRequipesxcaracpessoais.MessageInfo);
       //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim
      end;//MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807
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
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbReqPessoal.TableName)
      else
      begin
        FCdsReqPessoal.Edit;
        FCdsReqPessoal.FieldByName('SITUACAO').AsString := 'A';
        FCdsReqPessoal.FieldByName('NUMREQ').Value := Null;
        FCdsReqPessoal.FieldByName('IDNOVOOCUP').Value := Null;
        FCdsReqPessoal.FieldByName('DATAREQ').Value := Date;
        FCdsReqPessoal.Post;
      end;

      if (GravarRequisicao(IdTipoProcesso, CodCentroCusto, NomeCargo,
                           NomeSubstituido, NomeCentroCusto)) then
        MessageInfo := 'Replicação Concluída com sucesso.'
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

//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
//function para preencher CDS de caracteristicas pessoais (CdsCarac)
function TCtrlReqPessoal.ListCaracteristicasPessoais(NumReq: double; bTodos: Boolean): OleVariant;
begin
  if bTodos then
    Result := GetDataPacket(
     'SELECT R.NUMREQ, C.IDCARACPESSOAIS, C.DESCRICAO '+
        'FROM CARACPESSOAIS C LEFT JOIN REQUIPESXCARACPESSOAIS R '+
        'ON R.NUMREQ = '+FloatToStr(NumReq)+ ' AND R.IDCARACPESSOAIS = C.IDCARACPESSOAIS ')
  else
    Result := GetDataPacket(
     'SELECT R.NUMREQ, R.IDCARACPESSOAIS, C.DESCRICAO '+
        'FROM CARACPESSOAIS C INNER JOIN REQUIPESXCARACPESSOAIS R '+
        'ON R.NUMREQ = '+FloatToStr(NumReq)+ ' AND R.IDCARACPESSOAIS = C.IDCARACPESSOAIS ');
end;
//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim

// MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807 - inicio
procedure TCtrlReqPessoal.AtualizaIDModulo(pintIDModulo: integer);
begin
  FIDModulo := pintIDModulo;
end;
//MARCIO SANCHES SPINOSA SOL 199923 KINTANA 1926807 - Fim
end.
