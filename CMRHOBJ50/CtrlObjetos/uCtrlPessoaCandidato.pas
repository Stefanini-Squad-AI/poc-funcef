{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/09/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaCandidato;

interface

uses SysUtils, Controls, uSistema, uCMClientDataSet, CmEventosCadastro, uCMTypes, uCtrlPessoa,
  uCtrlFuncoesRH, uCtrlCustomRH, uCtrlSitFunc, uCtrlPessoaFuncionario, uDbCandidat,
  uDbUltEmpr, uDbRequiCand, uDbHstAval, uDbHstTrn;

type
  TCtrlPessoaCandidato = class(TCtrlCustomPessoaRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDbCandidato: TDbCandidat;
    FDbUltimosEmpregos: TDbUltEmpr;
    FDbRequiCand: TDbRequiCand;
    FDbTestes: TDbHstAval;
    FDbTreinamentos: TDbHstTrn;

    FCdsUltimosEmpregos: TCMClientDataSet;
    FCdsRequiCand: TCMClientDataSet;
    FCdsTestes: TCMClientDataSet;
    FCdsTreinamentos: TCMClientDataSet;

    FCtrlSitFunc: TCtrlSitFunc;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FFU: TCtrlFuncoesRH;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function ListCandidato(IdPessoa: double): OleVariant;
    function ListCandidatoPessoa(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListRequisicoes(IdPessoa: double): OleVariant;

    function AtivarComoEmpregado(IdEmpresa: integer; IdPessoa, IdCargo: double;
      TipoContrato, TipoPagamento: string; SalarioContr: double;
      PossuiRegistroTabFunc: boolean; TamanhoMatricula: byte; DataAdmissao: TDate): boolean;

    property CdsUltimosEmpregos: TCMClientDataSet read FCdsUltimosEmpregos write FCdsUltimosEmpregos;
    property CdsRequiCand: TCMClientDataSet read FCdsRequiCand write FCdsRequiCand;
    property CdsTestes: TCMClientDataSet read FCdsTestes write FCdsTestes;
    property CdsTreinamentos: TCMClientDataSet read FCdsTreinamentos write FCdsTreinamentos;
    property CtrlSitFunc: TCtrlSitFunc read FCtrlSitFunc;
    property CtrlPessoaFuncionario: TCtrlPessoaFuncionario read FCtrlPessoaFuncionario;
  end;

implementation

uses uMidasUtil;

{ TCtrlPessoaCandidato }

constructor TCtrlPessoaCandidato.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FDbCandidato := TDbCandidat.Create(Self);
  FDbUltimosEmpregos := TDbUltEmpr.Create(Self);
  FDbRequiCand := TDbRequiCand.Create(Self);
  FDbTestes := TDbHstAval.Create(Self);
  FDbTreinamentos := TDbHstTrn.Create(Self);
  FCtrlSitFunc := TCtrlSitFunc.Create;
  FFU := TCtrlFuncoesRH.Create;
end;

procedure TCtrlPessoaCandidato.OnCreateAppServer;
begin
  inherited;
  FCdsUltimosEmpregos := TCMClientDataSet.Create(nil);
  FCdsRequiCand := TCMClientDataSet.Create(nil);
  FCdsTestes := TCMClientDataSet.Create(nil);
  FCdsTreinamentos := TCMClientDataSet.Create(nil);
end;

destructor TCtrlPessoaCandidato.Destroy;
begin
  FreeAndNil(FDbCandidato);
  FreeAndNil(FCtrlSitFunc);
  FreeAndNil(FCtrlPessoaFuncionario);
  FreeAndNil(FDbUltimosEmpregos);
  FreeAndNil(FDbRequiCand);
  FreeAndNil(FDbTestes);
  FreeAndNil(FDbTreinamentos);
  FreeAndNil(FFU);
  if (IsAppServer) then
  begin
    FCdsUltimosEmpregos.Free;
    FCdsRequiCand.Free;
    FCdsTestes.Free;
    FCdsTreinamentos.Free;
  end;
  inherited;
end;

procedure TCtrlPessoaCandidato.AfterInitialize;
begin
  inherited;
  FCtrlSitFunc.InitializeAs(Self);
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FFU.InitializeAs(Self);
end;

procedure TCtrlPessoaCandidato.DoChangeDataBase;
begin
  inherited;
  FDbCandidato.DataBaseName := DataBaseName;
  FDbRequiCand.DataBaseName := DataBaseName;
  FDbTestes.DataBaseName := DataBaseName;
  FDbTreinamentos.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;
end;

function TCtrlPessoaCandidato.ListCandidato(IdPessoa: double): OleVariant;
begin
  FDbCandidato.IdPessoa.asFloat := IdPessoa;
  Result := GetDataPacket(FDbCandidato.sSqlSelect);
end;

function TCtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    FFU.IFF(Campos<>'', Campos,
      '  CA.IDPESSOA, CA.IDPESSOA AS MATRICULA, P.NOME, ''Candidato'' AS SITUACAO,'+CR_LF+
      '  CA.IDCARGO, CA.SALARIO, CA.TIPOPAGAMENTO, CA.DAT_ADMIS, CA.TIPOCONTRATO')+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, CANDIDAT CA'+CR_LF+
    'WHERE'+CR_LF+
    FFU.IFF(IdPessoa=0, '', '  (CA.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF)+
    '  (CA.IDPESSOA = P.IDPESSOA)');
end;

function TCtrlPessoaCandidato.ListRequisicoes(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  RC.*, C.TITULO, CC.NOME AS CCUSTO,'+CR_LF+
    '  P.NOME AS ESTAB, R.DATAREQ,'+CR_LF+
    '  DECODE(R.SEXO, ''M'',''Masculino'', ''F'', ''Feminino'', ''Indiferente'') AS SEXO,'+CR_LF+
    '  DECODE(R.SITUACAO, ''A'', ''Aberta'', ''E'', ''Encerrada'', ''Camcelada'') AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, CENTCUST CC, CARGO C, REQUIPES R, REQUICAND RC'+CR_LF+
    'WHERE'+CR_LF+
    '  (RC.IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (RC.NUMREQ        = R.NUMREQ) AND'+CR_LF+
    '  (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'+CR_LF+
    '  (R.IDEMPRESA      = CC.IDEMPRESA(+)) AND'+CR_LF+
    '  (R.IDESTAB        = P.IDPESSOA(+)) AND'+CR_LF+
    '  (R.IDCARGO        = C.IDCARGO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  RC.NUMREQ');
end;

function TCtrlPessoaCandidato.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo, FCdsUltimosEmpregos]);

      Result := ApplyCds(FCdsUltimosEmpregos, FDbUltimosEmpregos, [], []);
      if not(Result) then
        raise Exception.Create(FDbUltimosEmpregos.MessageInfo);

      Result := ApplyCds(FCdsRequiCand, FDbRequiCand, [], []);
      if not(Result) then
        raise Exception.Create(FDbRequiCand.MessageInfo);

      Result := ApplyCds(FCdsTestes, FDbTestes, [], []);
      if not(Result) then
        raise Exception.Create(FDbTestes.MessageInfo);

      Result := ApplyCds(FCdsTreinamentos, FDbTreinamentos, [], []);
      if not(Result) then
        raise Exception.Create(FDbTreinamentos.MessageInfo);

      Result := ApplyCds(CdsSubTipo, FDbCandidato, [], []);
      if not(Result) then
        raise Exception.Create(FDbCandidato.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDbCandidato, [_DbPessoa.IdPessoa], [FDbCandidato.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbCandidato.MessageInfo);

      Result := ApplyCds(FCdsUltimosEmpregos, FDbUltimosEmpregos, [_DbPessoa.IdPessoa], [FDbUltimosEmpregos.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbUltimosEmpregos.MessageInfo);

      Result := ApplyCds(FCdsRequiCand, FDbRequiCand, [_DbPessoa.IdPessoa], [FDbRequiCand.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbRequiCand.MessageInfo);

      Result := ApplyCds(FCdsTestes, FDbTestes, [_DbPessoa.IdPessoa], [FDbTestes.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbTestes.MessageInfo);

      Result := ApplyCds(FCdsTreinamentos, FDbTreinamentos, [_DbPessoa.IdPessoa], [FDbTreinamentos.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbTreinamentos.MessageInfo);
    end;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

function TCtrlPessoaCandidato.AtivarComoEmpregado(IdEmpresa: integer; IdPessoa,
  IdCargo: double; TipoContrato, TipoPagamento: string; SalarioContr: double;
  PossuiRegistroTabFunc: boolean;
  TamanhoMatricula: byte; DataAdmissao: TDate): boolean;
var
  sIdSitFunc, sMatric, sSQL: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtivarComoEmpregado(IdEmpresa, IdPessoa, IdCargo,
      TipoContrato, TipoPagamento, PossuiRegistroTabFunc, TamanhoMatricula,
      DateToStr(DataAdmissao));
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    // Pego o ID da primeira Situação Ativa
    _Cds.Data := FCtrlSitFunc.ListGeral(0, 'A');
    sIdSitFunc := _Cds.FieldByName('IDSITFUNC').asString;

    if not(PossuiRegistroTabFunc) then
    begin
      if (TamanhoMatricula > 0) then
        sMatric := FCtrlPessoaFuncionario.GetProxMatricula(TamanhoMatricula)
      else
        sMatric := '';

      sSQL :=
        'INSERT INTO FUNCIONARIO'+CR_LF+
        '  (IDPESSOA,IDEMPRESA,IDCARGO,IDSITFUNC,DATAADMISSAO,TIPOCONTRATO,TIPOPAGAMENTO,'+CR_LF+
        '   MATRICULA,SALARIOATUAL,DATAOPCAOFGTS,DATASALARIO,DATACARGO,DATALOTACAO)'+CR_LF+
        'VALUES'+CR_LF+
        '  (' +FloatToStr(IdPessoa) +','+ CR_LF+
        '   ' +IntToStr(IdEmpresa) +','+ CR_LF+
        '   ' +FloatToStr(IdCargo) +','+ CR_LF+
        '   ' +sIdSitFunc +','+ CR_LF+
        '   TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '   ' +QuotedStr(TipoContrato) +','+ CR_LF+
        '   ' +QuotedStr(TipoPagamento) +','+ CR_LF+
        '   ' +QuotedStr(sMatric) +','+ CR_LF+
        '   ' +FFU.Float2String(SalarioContr) +','+ CR_LF+
        '   TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '   TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '   TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '   TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''))';
    end
    else
      sSQL :=
        'UPDATE'+CR_LF+
        '  FUNCIONARIO'+CR_LF+
        'SET'+CR_LF+
        '  IDCARGO       = ' +FloatToStr(IdCargo) +','+ CR_LF+
        '  IDSITFUNC     = ' +sIdSitFunc +','+ CR_LF+
        '  DATAADMISSAO  = TO_DATE(' +QuotedStr(DateToStr(DataAdmissao)) + ',''DD/MM/YYYY''),'+ CR_LF+
        '  TIPOCONTRATO  = ' +QuotedStr(TipoContrato) +','+ CR_LF+
        '  TIPOPAGAMENTO =' +QuotedStr(TipoPagamento) +','+ CR_LF+
        '  SALARIOATUAL  = ' +FFU.Float2String(SalarioContr) +','+ CR_LF+
        '  DATAOPCAOFGTS = TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '  DATASALARIO   = TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '  DATACARGO     = TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY''),'+ CR_LF+
        '  DATALOTACAO   = TO_DATE(' +QuotedStr(DateToStr(DataAdmissao))+ ',''DD/MM/YYYY'')'+ CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    try
      StartTransaction;

      if (ExecSQL(sSQL)) and
         (ExecSQL('DELETE REQUICAND WHERE IDPESSOA = ' +FloatToStr(IdPessoa))) and
         (ExecSQL('DELETE CANDIDAT WHERE IDPESSOA = ' +FloatToStr(IdPessoa))) then
        Commit
      else
      begin
        Rollback;
        raise Exception.Create(MessageInfo);
      end;

      Result := true;
      MessageInfo := 'Ativação do Candidato como Empregado concluída com sucesso.' +CR_LF+
        'Complemente os dados no módulo apropriado.';
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := 'Não foi possível fazer a Ativação do Candidato como Empregado.'+CR_LF+
          'O erro abaixo ocorreu:'+CR_LF+ E.Message;
      end;
    end;
  end;
end;

end.
