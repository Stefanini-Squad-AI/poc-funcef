{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 14/08/2006                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegAcessoMorador;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlCustomRH, uDbAcessoMorador, uCtrlPessoa, uCMTypes,
  uValidaDoc, uDbImagens;

type
  TVerificaPessoa = (tpDocInvalido, tpDocExiste, tpMoradorExiste, tpNovoValido);

  TCtrlRegAcessoMorador = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbAcessoMorador: TDbAcessoMorador;
    FDbImagens: TDbImagens;
    
    FCdsAcessoMorador: TCMClientDataSet;
    FCdsImagens: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPessoaMorador(IdMorador: double; ListaTipo, ListaProf: string): OleVariant;
    function ListAcessoMorador(IdAcessoMorador: double): OleVariant;
    function ListTipoMorador(IdTipoMorador: double = 0): OleVariant;
    function ListAcessoEntradaMorador(IdMorador, IdEstacao: double; Tipo: string): OleVariant;
    function ListAcessosPeriodo(IdMorador: double; Tipo: string;
      DataIni, DataFim: TDate): OleVariant;
    function ListAcessoRegVezesMorador(IdMorador: double): OleVariant;
    function ListTipoDocumento: OleVariant;
    function ListDocPessoaFisica: OleVariant;
    function ListaPessoa(const IdPessoa: double): OleVariant;
    function ListImagens(const IdPessoa: double): OleVariant;

    function VerificaAcessoRegVezesMorador(const IdMorador, IdEstacao: double;
      const DataRef: TDate; var Permitidos, Usados: integer): boolean;

    function VerificaPessoa(const TipoDocumento: double; var IdPessoa: double;
      const NoDocumento: string): TVerificaPessoa;

    function GravarAcessoMorador: boolean;
    function InserirQuantAcessos(ListaIdMorador, IdEstacao, DataIni, DataFim,
      Vezes: string; CadaDia: boolean): boolean;
    function CadastrarMorador(const Inclusao: boolean; const IdUsuario: double;
      const Nome, Sexo: string; const DataNascimento: TDateTime;
      const TipoDocumento, TipoMorador, Horario: double; const NoDocumento,
      Apelido: string; var IdPessoa: double): boolean;
    function ExcluirMorador(const IdPessoa: double): boolean;

    property CdsAcessoMorador: TCMClientDataSet read FCdsAcessoMorador write FCdsAcessoMorador;
    property CdsImagens: TCMClientDataSet read FCdsImagens write FCdsImagens;
  end;

implementation

uses Db, uCtrlFuncoesRH, uDbPessoa, uDbPessoaFisica, uDbDocpessoa, uDbMorador;

{ TCtrlRegAcessoMorador }

constructor TCtrlRegAcessoMorador.Create;
begin
  inherited;
  FDbAcessoMorador := TDbAcessoMorador.Create(Self);
  FDbImagens := TDbImagens.Create(Self);
end;

destructor TCtrlRegAcessoMorador.Destroy;
begin
  FDbAcessoMorador.Free;
  FDbImagens.Free;
  if (IsAppServer) then
  begin
    FCdsAcessoMorador.Free;
    FCdsImagens.Free;
  end;

  inherited;
end;

procedure TCtrlRegAcessoMorador.OnCreateAppServer;
begin
  inherited;
  FCdsAcessoMorador := TCMClientDataSet.Create(nil);
  FCdsImagens := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegAcessoMorador.DoChangeDataBase;
begin
  inherited;
  FDbAcessoMorador.DataBaseName := DataBaseName;
  FDbImagens.DataBaseName := DataBaseName;
end;

function TCtrlRegAcessoMorador.ListaPessoa(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.IDPESSOA AS IDMORADOR, P.NOME, P.NUMDOCUMENTO, 0 AS IDHORARIO,' +CR_LF+
    '  0 AS IDTIPOMORADOR, LPAD('' '',60,'' '') APELIDOMORADOR, P.IDIMAGEM,' +CR_LF+
    '  PF.SEXO, PF.DATANASC, P.IDDOCUMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, PESSOAFISICA PF' +CR_LF+
    'WHERE' +CR_LF+
    '  (PF.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (PF.IDPESSOA = P.IDPESSOA)');
end;

function TCtrlRegAcessoMorador.ListPessoaMorador(IdMorador: double;
  ListaTipo, ListaProf: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  M.IDMORADOR, P.NOME, T.DESCTIPOMORADOR AS TIPOMORADOR, P.NUMDOCUMENTO,' +CR_LF+
    '  M.IDHORARIO, PR.DESCRICAO AS PROFISSAO, M.IDTIPOMORADOR,' +CR_LF+
    '  M.APELIDOMORADOR, P.IDIMAGEM, PF.SEXO, PF.DATANASC, P.IDDOCUMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, PESSOAFISICA PF, MORADOR M, TIPOMORADOR T, PROFISS PR' +CR_LF+
    'WHERE' +CR_LF+
    '  (M.IDMORADOR     '+IFF(IdMorador=0, '> ', '= ')+ FloatToStr(IdMorador)+ ') AND' +CR_LF+
    IFF(ListaTipo = '', '', '  (M.IDTIPOMORADOR IN (' +ListaTipo+ ')) AND' +CR_LF)+
    IFF(ListaProf = '', '', '  (M.IDPROFISS     IN (' +ListaProf+ ')) AND' +CR_LF)+
    '  (M.IDMORADOR     = PF.IDPESSOA) AND' +CR_LF+
    '  (M.IDMORADOR     = P.IDPESSOA) AND' +CR_LF+
    '  (M.IDTIPOMORADOR = T.IDTIPOMORADOR) AND' +CR_LF+
    '  (M.IDPROFISS     = PR.IDPROFISS(+))');
end;

function TCtrlRegAcessoMorador.ListAcessoMorador(IdAcessoMorador: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdAcessoMorador = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  ACESSOMORADOR'+CR_LF;

  if (IdAcessoMorador = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  begin
    sSQL := sSQL + 'WHERE'+CR_LF;

    if (IdAcessoMorador > 0) then
      sSQL := sSQL + '  (IDACESSOMORADOR = ' +FloatToStr(IdAcessoMorador)+ ')';
  end;

  sSQL := sSQL +CR_LF+
    'ORDER BY'+CR_LF+
    '  ENTRADA DESC, SAIDA DESC';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegAcessoMorador.ListTipoMorador(IdTipoMorador: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  *' +CR_LF+
    'FROM' +CR_LF+
    '  TIPOMORADOR' +CR_LF+
    'WHERE' +CR_LF+
    IFF(IdTipoMorador = 0, '   (1 = 1', '  (IDTIPOMORADOR  = ' +FloatToStr(IdTipoMorador))+ ')' +CR_LF+
    'ORDER BY DESCTIPOMORADOR');
end;

function TCtrlRegAcessoMorador.ListAcessoEntradaMorador(IdMorador, IdEstacao: double; Tipo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AM.*' +CR_LF+
    'FROM' +CR_LF+
    '  ACESSOMORADOR AM,' +CR_LF+
    '  (SELECT IDACESSOMORADOR, MAX(ENTRADA) AS DATA' +CR_LF+
    '   FROM   ACESSOMORADOR' +CR_LF+
    '   WHERE  (IDMORADOR       = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
    '          (IDESTACAOACESSO = ' +FloatToStr(IdEstacao)+ ') AND' +CR_LF+
    '          (INDFUNCAO       = ' +QuotedStr(Tipo)+ ') AND' +CR_LF+
    IFF(Tipo='P', '          (NVL(QTDEVEZES,0) = 0) AND' +CR_LF, '')+  // ??? TIPO = P ???
    '          (SAIDA     IS NULL)' +CR_LF+
    '   GROUP BY IDACESSOMORADOR) AM1' +CR_LF+
    'WHERE' +CR_LF+
    '  (AM.IDMORADOR       = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
    '  (AM.IDESTACAOACESSO = ' +FloatToStr(IdEstacao)+ ') AND' +CR_LF+
    '  (AM.IDACESSOMORADOR = AM1.IDACESSOMORADOR)');
end;

function TCtrlRegAcessoMorador.ListAcessosPeriodo(IdMorador: double;
  Tipo: string; DataIni, DataFim: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AM.*' +CR_LF+
    'FROM' +CR_LF+
    '  ACESSOMORADOR AM' +CR_LF+
    'WHERE' +CR_LF+
    '  (AM.IDMORADOR = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
    '  (AM.INDFUNCAO = ' +QuotedStr(Tipo)+ ') AND' +CR_LF+
    '  (AM.ENTRADA  >= TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (AM.ENTRADA  <= TO_DATE(' +QuotedStr(DateToStr(DataFim))+ ',''DD/MM/YYYY'')+1)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  AM.ENTRADA');
end;

function TCtrlRegAcessoMorador.ListAcessoRegVezesMorador(IdMorador: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AM.*, EA.ESTACAO || '' - '' || EA.DESCRICAO AS DESCRICAO' +CR_LF+
    'FROM' +CR_LF+
    '  ACESSOMORADOR AM, ESTACAOACESSO EA' +CR_LF+
    'WHERE' +CR_LF+
    '  (AM.IDMORADOR       = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
    '  (AM.INDFUNCAO       = ''Q'') AND' +CR_LF+
    '  (AM.IDESTACAOACESSO = EA.IDESTACAOACESSO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  AM.ENTRADA DESC');
end;

function TCtrlRegAcessoMorador.ListTipoDocumento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDDOCUMENTO, NOMEDOCUMENTO, MASCARA' +CR_LF+
    'FROM' +CR_LF+
    '  TIPODOCPESSOA' +CR_LF+
    'WHERE' +CR_LF+
    '  (FISICAJURIDICA = ''F'')' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(NOMEDOCUMENTO)');
end;

function TCtrlRegAcessoMorador.ListDocPessoaFisica: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  DOCPFISICA' +CR_LF+
    'FROM' +CR_LF+
    '  PARAMGLOBAL');
end;

function TCtrlRegAcessoMorador.VerificaAcessoRegVezesMorador(const IdMorador, IdEstacao: double;
  const DataRef: TDate; var Permitidos, Usados: integer): boolean;
var
  CdsAux: TCMClientDataSet;
  sDataIni, sDataFim: string;
begin
  CdsAux := TCMClientDataSet.Create(nil);
  try
    Result := true;
    Permitidos := 0;
    Usados := 0;

    // Procurar o registro do número de acessos para a pessoa
    CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  QTDEVEZES, ENTRADA, SAIDA' +CR_LF+
      'FROM' +CR_LF+
      '  ACESSOMORADOR' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDMORADOR       = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
      '  (INDFUNCAO       = ''Q'') AND' +CR_LF+
      '  (IDESTACAOACESSO = ' +FloatToStr(IdEstacao)+ ') AND' +CR_LF+
      '  (ENTRADA <= TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
      '  (SAIDA   >= TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''))');

    // Caso este registro exista, saber a quantidade de acessos a pessoa tem no dia e
    // retornar de acordo
    if not(CdsAux.IsEmpty) then
    begin
      Permitidos := CdsAux.FieldByName('QTDEVEZES').asInteger;
      sDataIni := RetornaDataAMD(CdsAux.FieldByName('ENTRADA').asDateTime, true);
      sDataFim := RetornaDataAMD(CdsAux.FieldByName('SAIDA').asDateTime, true);

      CdsAux.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  COUNT(*) AS CONTA' +CR_LF+
        'FROM' +CR_LF+
        '  ACESSOMORADOR A, ESTACAOACESSO E' +CR_LF+
        'WHERE' +CR_LF+
        '  (A.IDMORADOR       = ' +FloatToStr(IdMorador)+ ') AND' +CR_LF+
        '  (A.INDFUNCAO       = ''A'') AND' +CR_LF+
        '  (A.IDESTACAOACESSO = ' +FloatToStr(IdEstacao)+ ') AND' +CR_LF+
        '  (A.IDESTACAOACESSO = E.IDESTACAOACESSO) AND' +CR_LF+
        '  (TO_CHAR(A.ENTRADA,''YYYY/MM/DD'') >= ' +QuotedStr(sDataIni)+ ') AND' +CR_LF+
        '  (TO_CHAR(A.ENTRADA,''YYYY/MM/DD'') <= ' +QuotedStr(sDataFim)+ ') AND' +CR_LF+
        '  (A.SAIDA IS NOT NULL OR E.INDENTRASAI = 1)');

      Usados := CdsAux.FieldByName('CONTA').asInteger;
      Result := (Usados < Permitidos);
    end;
  finally
    CdsAux.Free;
  end;
end;

function TCtrlRegAcessoMorador.GravarAcessoMorador: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAcessoMorador(FCdsAcessoMorador.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsAcessoMorador, FDbAcessoMorador, [], []);
      if not(Result) then
        raise Exception.Create(FDbAcessoMorador.MessageInfo);

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

function TCtrlRegAcessoMorador.InserirQuantAcessos(ListaIdMorador, IdEstacao, DataIni,
  DataFim, Vezes: string; CadaDia: boolean): boolean;
var
  sSql, sIdMorador: string;
  incr: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirQuantAcessos(ListaIdMorador, IdEstacao,
      DataIni, DataFim, Vezes, CadaDia);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      sSql :=
        'DELETE ACESSOMORADOR WHERE IDMORADOR IN (' +ListaIdMorador+ ') AND '+
        'INDFUNCAO = ''Q'' AND ENTRADA BETWEEN '+
        'TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') '+
        ' AND SAIDA BETWEEN '+
        'TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'')';
      Result := ExecSQL(sSql);

      while (ListaIdMorador <> '') do
      begin
        ExtraiString(ListaIdMorador, sIdMorador, ',');
        if not CadaDia then
        begin
          sSql :=
            'INSERT INTO ACESSOMORADOR' +
            '  (IDACESSOMORADOR, IDMORADOR, INDFUNCAO, ENTRADA, SAIDA, ' +
            '   IDESTACAOACESSO, QTDEVEZES) ' +
            'VALUES (' +IntToStr(GetSequence('ACESSOMORADOR'))+ ', '+sIdMorador+', ''Q'', '+
            'TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY''), '+
            'TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''), '+
            IdEstacao + ', ' + Vezes + ')';
          Result := ExecSQL(sSql);

          if not(Result) then
            raise Exception.Create(MessageInfo);
        end
        else
        begin
          incr := 0;
          while StrToDate(DataIni) + incr <= StrToDate(DataFim) do
          begin
            sSql :=
              'INSERT INTO ACESSOMORADOR' +
              '  (IDACESSOMORADOR, IDMORADOR, INDFUNCAO, ENTRADA, SAIDA, ' +
              '   IDESTACAOACESSO, QTDEVEZES) ' +
              'VALUES (' +IntToStr(GetSequence('ACESSOMORADOR'))+ ', '+sIdMorador+', ''Q'', '+
              'TO_DATE(' +QuotedStr(DateToStr(StrToDate(DataIni)+incr))+ ',''DD/MM/YYYY''), '+
              'TO_DATE(' +QuotedStr(DateToStr(StrToDate(DataIni)+incr))+ ',''DD/MM/YYYY''), '+
              IdEstacao + ', ' + Vezes + ')';
            Result := ExecSQL(sSql);
            inc(incr);
            if not(Result) then
              raise Exception.Create(MessageInfo);
          end;
        end;
      end;

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

function TCtrlRegAcessoMorador.ListImagens(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IMG.IDIMAGEM, IMG.IMAGEM, IMG.DESCRIMAGEM' +CR_LF+
    'FROM' +CR_LF+
    '  IMAGENS IMG, PESSOA P' +CR_LF+
    'WHERE' +CR_LF+
    '  (P.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (P.IDIMAGEM = IMG.IDIMAGEM)');
end;

function TCtrlRegAcessoMorador.VerificaPessoa(const TipoDocumento: double;
  var IdPessoa: double; const NoDocumento: string): TVerificaPessoa;
var
  ValidaDoc: TCMValidaDoc;
  bOk: boolean;
begin
  Result := tpNovoValido;
  bOk := false;

  if (TipoDocumento < 4) then
  begin
    // Verifica se o documento é válido
    ValidaDoc := TCMValidaDoc.Create(nil);
    try
      ValidaDoc.Mensagem.ExibeMensagem := false;

      case (Trunc(abs(TipoDocumento))) of
        1 : ValidaDoc.TipoDocumento := tdCGC;
        2 : ValidaDoc.TipoDocumento := tdCPF;
        3 : ValidaDoc.TipoDocumento := tdCUIT;
      end;

      ValidaDoc.NumDocumento := NoDocumento;
      bOk := ValidaDoc.DocumentoValido;

      if not(bOk) then
      begin
        Result := tpDocInvalido;
        MessageInfo := ValidaDoc.Mensagem.Texto;
      end;
    finally
      ValidaDoc.Free;
    end;
  end;

  if (bOk) then
  begin
    // Verifica se já existe um pessoa no banco com esse número de documento
    _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' +QuotedStr(Trim(NoDocumento)));
    if not(_Cds.IsEmpty) then
    begin
      // Verifica se esse pessoa já está cadastrada como o meu subtipo
      IdPessoa := _Cds.Fields[0].asFloat;
      _Cds.Data := GetDataPacket('SELECT IDMORADOR FROM MORADOR WHERE IDMORADOR = ' +FloatToStr(IdPessoa));

      if not(_Cds.IsEmpty) then
      begin
        Result := tpMoradorExiste;
        MessageInfo := CMTranslate('A pessoa indicada já está cadastrada como freqüentador.');
      end
      else
      begin
        Result := tpDocExiste;
        MessageInfo := CMTranslate('Já existe pessoa cadastrada com esse nº documento.');
      end;
    end
    else
      IdPessoa := 0;

    // A VAR IdPessoa retorna o Identificador da pessoa cadastrada caso exista
  end;
end;

function TCtrlRegAcessoMorador.CadastrarMorador(const Inclusao: boolean;
  const IdUsuario: double; const Nome, Sexo: string; const DataNascimento: TDateTime;
  const TipoDocumento, TipoMorador, Horario: double; const NoDocumento, Apelido: string;
  var IdPessoa: double): boolean;
var
  bAltera, bInserirImg, bExcluirImg: boolean;
  _DbPessoa: TDbPessoa;
  _DbPessoaFisica: TDbPessoaFisica;
  _DbDocPessoa: TDbDocpessoa;
  _DbMorador: TDbMorador;
begin
  // 1) Verifica se já existe o pessoa com o CPF cadastrado e verifica se o mesmo já é morador
  // 2) Se não existir no pessoa insere o pessoa
  // 3) Caso exista e o mesmo não seja morador ou seja uma pessoa nova, insere no subtipo
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.CadastrarMorador(Inclusao, IdUsuario, Nome, Sexo,
      DataNascimento, TipoDocumento, TipoMorador, Horario, NoDocumento, Apelido,
      FCdsImagens.Data, IdPessoa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      // Validação dos Dados obrigatórios
      if (Nome = '') or (NoDocumento = '') or (TipoDocumento = 0) or (IdUsuario = 0) then
        raise Exception.Create(CMTranslate('Os campos nome, número do documento, tipo do documento e usuário são obrigatórios. Verifique.'));

      // Verificar se já existe uma pessoa no banco com esse número de documento e
      // Verifica se esse pessoa já está cadastrada como o meu subtipo
      Result := (VerificaPessoa(TipoDocumento, IdPessoa, NoDocumento) <> tpDocInvalido);
      if (Result) then
      begin
        _DbPessoa := TDbPessoa.Create(Self);
        _DbPessoaFisica := TDbPessoaFisica.Create(Self);
        _DbDocPessoa := TDbDocPessoa.Create(Self);
        _DbMorador := TDbMorador.Create(Self);
        try
          try
            StartTransaction;

            FCdsImagens.StatusFilter := [usInserted];
            bInserirImg := (FCdsImagens.RecordCount > 0);
            FCdsImagens.StatusFilter := [usDeleted];
            bExcluirImg := (FCdsImagens.RecordCount > 0);
            FCdsImagens.StatusFilter := [];

            Result := ApplyCds(FCdsImagens, FDbImagens, [], []);
            if not(Result) then
              raise Exception.Create(FDbImagens.MessageInfo);

            if (IdPessoa <= 0) and (Inclusao) then
            begin
              // Insere Pessoa
              _DbPessoa.Clear;

              if not(_DbPessoa.Insert) then
                raise Exception.Create(_DbPessoa.MessageInfo);

              IdPessoa := _DbPessoa.IdPessoa.asFloat;

              // Insere Pessoa Fisica
              _DbPessoaFisica.Clear;
              _DbPessoaFisica.IdPessoa.asFloat := IdPessoa;

              if not(_DbPessoaFisica.Insert) then
                raise Exception.Create(_DbPessoaFisica.MessageInfo);

              // Insere Documento Principal
              _DbDocPessoa.Clear;
              _DbDocPessoa.IdPessoa.asFloat := IdPessoa;
              _DbDocPessoa.IdDocumento.asFloat := TipoDocumento;
              _DbDocPessoa.NumDocumento.asString := NoDocumento;

              if not(_DbDocPessoa.Insert) then
                raise Exception.Create(_DbDocPessoa.MessageInfo);
            end
            else
            begin
              // Selecionar dados da Pessoa para que a mesmo seja atualidado
              _DbPessoa.IdPessoa.asFloat := IdPessoa;
              _DbPessoa.LoadFromDb;

              // Selecionar dados da Pessoa Fisica para que a mesmo seja atualidado
              _DbPessoaFisica.IdPessoa.asFloat := IdPessoa;
              _DbPessoaFisica.LoadFromDb;

              // Selecionar dados do Documento para que o mesmo seja atualidado
              _DbDocPessoa.IdPessoa.asFloat := IdPessoa;
              _DbDocPessoa.IdDocumento.asFloat := TipoDocumento;
              if not _DbDocPessoa.LoadFromDb then
              begin
                // Insere Documento Principal
                _DbDocPessoa.Clear;
                _DbDocPessoa.IdPessoa.asFloat := IdPessoa;
                _DbDocPessoa.IdDocumento.asFloat := TipoDocumento;
                _DbDocPessoa.NumDocumento.asString := NoDocumento;

                if not(_DbDocPessoa.Insert) then
                  raise Exception.Create(_DbDocPessoa.MessageInfo);
              end;
            end;

            // Atualizar Pessoa
            _DbPessoa.Nome.asString := Nome;
            _DbPessoa.Tipo.asString := 'F';
            _DbPessoa.RazaoSocial.asString := Nome;
            _DbPessoa.NumDocumento.asString := NoDocumento;
            _DbPessoa.IdDocumento.asFloat := TipoDocumento;

            if (bInserirImg) then
              _DbPessoa.IdImagem.asFloat := FDbImagens.IdImagem.asFloat
            else
            if (bExcluirImg) then
              _DbPessoa.IdImagem.Clear;

            // Atualizar Pessoa Física
            _DbPessoaFisica.Sexo.asString := Sexo;
            if (DataNascimento > 0) then
              _DbPessoaFisica.DataNasc.asDateTime := DataNascimento
            else
              _DbPessoaFisica.DataNasc.Clear;

            // Atualizar Documento
            _DbDocPessoa.NumDocumento.asString := NoDocumento;

            // Faz o tratamento do SubTipo que nesse caso é Morador
            if (Inclusao) then
              _DbMorador.Clear;

            _DbMorador.IdMorador.asFloat := IdPessoa;
            bAltera := _DbMorador.LoadFromDb;

            _DbMorador.IdMorador.asFloat := IdPessoa;
            _DbMorador.IdTipoMorador.asFloat := TipoMorador;
            _DbMorador.ApelidoMorador.asString := Apelido;

            if (Horario > 0) then
              _DbMorador.IdHorario.asFloat := Horario
            else
              _DbMorador.IdHorario.Clear;

            if (bAltera) then
            begin
              if not(_DbMorador.Update) then
                raise Exception.Create(_DbMorador.MessageInfo);
            end
            else
            if not(_DbMorador.Insert) then
              raise Exception.Create(_DbMorador.MessageInfo);

            _DbPessoa.Update;
            _DbPessoaFisica.Update;
            _DbDocPessoa.Update;

            Commit;
          except
            on E: Exception do
            begin
              Rollback;
              raise Exception.Create(E.Message);
            end;
          end;
        finally
          _DbPessoa.Free;
          _DbPessoaFisica.Free;
          _DbDocPessoa.Free;
          _DbMorador.Free;
        end;
      end;
    except
      on E: Exception do
      begin
        Result := false;
        IdPessoa := -1;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlRegAcessoMorador.ExcluirMorador(const IdPessoa: double): boolean;
var
  _DbMorador: TDbMorador;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirMorador(IdPessoa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    _DbMorador := TDbMorador.Create(Self);
    try
      _DbMorador.IdMorador.asFloat := IdPessoa;
      _DbMorador.LoadFromDb;
      try
        StartTransaction;
        if not(_DbMorador.Delete) then
          raise Exception.Create(_DbMorador.MessageInfo);
        Commit;
      except
        on E: Exception do
        begin
          Rollback;
          MessageInfo := E.Message;
          Result := false;
        end;
      end;
    finally
      _DbMorador.Free;
    end;
  end;
end;

end.
