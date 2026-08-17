{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/02/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegAcessoFunc;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbAcessoFunc;

type
  TCtrlRegAcessoFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbAcessoFunc: TDbAcessoFunc;
    FCdsAcessoFunc: TCMClientDataSet;

    function GetData(Data: string): string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListAcessoFunc(IdAcessoFunc: double): OleVariant;
    function ListAcessoEntradaFunc(IdPessoa: double; Tipo: string): OleVariant;
    function ListAcessoEntradaFunc2(IdPessoa: double; Tipo: string): OleVariant;
    function ListAcessosPeriodo(IdPessoa: double; Tipo: string;
      DataIni, DataFim: TDate): OleVariant;
    function ListAcessoRegVezesFunc(IdPessoa: double): OleVariant;
    function PessoaEmFerias(const IdPessoa: double; const Data: TDateTime): boolean;

    function VerificaAcessoRegVezesFunc(const IdPessoa, IdEstacao: double;
      const DataRef: TDate; var Permitidos, Usados: integer): boolean;

    function GravarAcessoFunc: boolean;
    function GravarFlgAbonado(IdAcessoFunc, FlgAbonado: string): boolean;
    function GravarPontoForcado(IdAcessoFunc, FlgAbonado, FlgAbonado2,
      FlgAbonado3, FlgAbonado4, Entrada, Saida, SaidaIntervalo,
      RetornoIntervalo, CodMotivo, CodMotivo2, CodMotivo3, CodMotivo4,
      Descricao: string): boolean;
    function InserirAbonoFalta(var IdAcessoFunc: integer; IdPessoa: double;
      Entrada, CodMotivo, Descricao: string): boolean;
    function InserirPontoForcado(var IdAcessoFunc: integer; Abonado: integer;
      IdPessoa: double; Entrada, Saida, SaidaIntervalo, RetornoIntervalo,
      CodMotivo, Descricao: string): boolean;
    function ExcluirPontoForcado(const IdAcessoFunc: integer; Data: TDate): boolean;
    function ExcluirAbonoFalta(IdAcessoFunc: integer): boolean;
    function InserirQuantAcessos(ListaIdFunc, IdEstacao, DataIni, DataFim,
      Vezes: string; CadaDia: boolean): boolean;
    function AtualizarMarcaPonto(ListaIdFunc: string; MarcaPonto,
      MarcaIntervalo: boolean): boolean;
    function ListHistorico(ListaIdPessoa, ListaCodOcorr: string;
      AnoInicial, AnoFinal: integer): OleVariant;
    function GetDataHora: TDateTime;

    property CdsAcessoFunc: TCMClientDataSet read FCdsAcessoFunc write FCdsAcessoFunc;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegAcessoFunc }

constructor TCtrlRegAcessoFunc.Create;
begin
  inherited;
  FDbAcessoFunc := TDbAcessoFunc.Create(Self);
end;

destructor TCtrlRegAcessoFunc.Destroy;
begin
  FDbAcessoFunc.Free;
  if (IsAppServer) then
    FCdsAcessoFunc.Free;
  inherited;
end;

procedure TCtrlRegAcessoFunc.OnCreateAppServer;
begin
  inherited;
  FCdsAcessoFunc := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegAcessoFunc.DoChangeDataBase;
begin
  inherited;
  FDbAcessoFunc.DataBaseName := DataBaseName;
end;

function TCtrlRegAcessoFunc.GetData(Data: string): string;
begin
  Data := Trim(Data);
  if (Data = '') then // a data veio EM BRANCO
    Result := 'NULL'
  else
  if (Length(Data) = 10) then // a data não veio COM A HORA
    Result := 'TO_DATE(' +QuotedStr(Data)+ ',''DD/MM/YYYY'')'
  else // a data não veio SEM A HORA
    Result := 'TO_DATE(' +QuotedStr(Data)+ ',''DD/MM/YYYY HH24:MI'')';
end;

function TCtrlRegAcessoFunc.ListAcessoFunc(IdAcessoFunc: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdAcessoFunc = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  ACESSOFUNC'+CR_LF;

  if (IdAcessoFunc = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  begin
    sSQL := sSQL + 'WHERE'+CR_LF;

    if (IdAcessoFunc > 0) then
      sSQL := sSQL + '  (IDACESSOFUNC = ' +FloatToStr(IdAcessoFunc)+ ')';
  end;

  sSQL := sSQL +CR_LF+
    'ORDER BY'+CR_LF+
    '  ENTRADA DESC, SAIDA DESC';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegAcessoFunc.ListAcessoEntradaFunc(IdPessoa: double; Tipo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AF.*' +CR_LF+
    'FROM' +CR_LF+
    '  ACESSOFUNC AF,' +CR_LF+
    '  (SELECT IDACESSOFUNC, MAX(ENTRADA) AS DATA' +CR_LF+
    '   FROM   ACESSOFUNC' +CR_LF+
    '   WHERE  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '          (INDFUNCAO  = ' +QuotedStr(Tipo)+ ') AND' +CR_LF+
    IFF(Tipo='P', '          (NVL(QTDEVEZES,0) = 0) AND' +CR_LF, '')+
    '          (SAIDA     IS NULL)' +CR_LF+
    '   GROUP BY IDACESSOFUNC) AF1' +CR_LF+
    'WHERE' +CR_LF+
    '  (AF.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (AF.IDACESSOFUNC = AF1.IDACESSOFUNC)');
end;

function TCtrlRegAcessoFunc.ListAcessoEntradaFunc2(IdPessoa: double; Tipo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AF.*' +CR_LF+
    'FROM' +CR_LF+
    '  ACESSOFUNC AF,' +CR_LF+
    '  (SELECT MAX(ENTRADA) AS DATA' +CR_LF+
    '   FROM   ACESSOFUNC' +CR_LF+
    '   WHERE  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '          (INDFUNCAO  = ' +QuotedStr(Tipo)+ ') AND' +CR_LF+
    IFF(Tipo='P', '          (NVL(QTDEVEZES,0) = 0) ) AF1' +CR_LF, '')+
    'WHERE' +CR_LF+
    '  (AF.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (AF.ENTRADA = AF1.DATA)');
end;

function TCtrlRegAcessoFunc.ListAcessosPeriodo(IdPessoa: double;
  Tipo: string; DataIni, DataFim: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AF.*, TP.DESCRTIPOOCMED AS MOTIVO,'+CR_LF+
    '  TP2.DESCRTIPOOCMED AS MOTIVO2,'+CR_LF+
    '  TP3.DESCRTIPOOCMED AS MOTIVO3,'+CR_LF+
    '  TP4.DESCRTIPOOCMED AS MOTIVO4'+CR_LF+
    'FROM'+CR_LF+
    '  ACESSOFUNC AF, TIPOCMED TP,'+CR_LF+
    '  TIPOCMED TP2, TIPOCMED TP3, TIPOCMED TP4'+CR_LF+
    'WHERE'+CR_LF+
    '  (AF.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (INDFUNCAO   = ' +QuotedStr(Tipo)+ ') AND'+CR_LF+
    '  (AF.ENTRADA >= TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (AF.ENTRADA <= TO_DATE(' +QuotedStr(DateToStr(DataFim))+ ',''DD/MM/YYYY'')+1) AND'+CR_LF+
    '  (AF.CODTIPOOCMED  = TP.CODTIPOOCMED(+)) AND'+CR_LF+
    '  (AF.CODTIPOOCMED2 = TP2.CODTIPOOCMED(+)) AND'+CR_LF+
    '  (AF.CODTIPOOCMED3 = TP3.CODTIPOOCMED(+)) AND'+CR_LF+
    '  (AF.CODTIPOOCMED4 = TP4.CODTIPOOCMED(+))'+CR_LF+
    'ORDER BY AF.ENTRADA');
end;

function TCtrlRegAcessoFunc.ListAcessoRegVezesFunc(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AF.*, EA.ESTACAO || '' - '' || EA.DESCRICAO AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  ACESSOFUNC AF, ESTACAOACESSO EA'+CR_LF+
    'WHERE'+CR_LF+
    '  (AF.IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (AF.INDFUNCAO       = ''Q'') AND'+CR_LF+
    '  (AF.IDESTACAOACESSO = EA.IDESTACAOACESSO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  AF.ENTRADA DESC');
end;

function TCtrlRegAcessoFunc.PessoaEmFerias(const IdPessoa: double;
  const Data: TDateTime): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDPESSOA' +CR_LF+
      'FROM' +CR_LF+
      '  FERIAS' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(Data))+',''DD/MM/YYYY'')) AND' +CR_LF+
      '  (FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(Data))+',''DD/MM/YYYY''))');

    Result := not(_CdsAux.IsEmpty);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlRegAcessoFunc.VerificaAcessoRegVezesFunc(const IdPessoa, IdEstacao: double;
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
      '  ACESSOFUNC' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
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
        '  ACESSOFUNC A, ESTACAOACESSO E' +CR_LF+
        'WHERE' +CR_LF+
        '  (A.IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
        '  (A.INDFUNCAO       = ''A'') AND' +CR_LF+
        '  (A.IDESTACAOACESSO = ' +FloatToStr(IdEstacao)+ ') AND' +CR_LF+
        '  (A.IDESTACAOACESSO = E.IDESTACAOACESSO) AND' +CR_LF+
        '  (TO_CHAR(A.ENTRADA,''YYYY/MM/DD'') >= ' +QuotedStr(sDataIni)+ ') AND' +CR_LF+
        '  (TO_CHAR(A.ENTRADA,''YYYY/MM/DD'') <= ' +QuotedStr(sDataFim)+ ') AND' +CR_LF+
        '  ((A.SAIDA         IS NOT NULL) OR' +CR_LF+
        '   (E.INDENTRASAI    = 1))');

      Usados := CdsAux.FieldByName('CONTA').asInteger;
      Result := (Usados < Permitidos);
    end;  
  finally
    CdsAux.Free;
  end;  
end;

function TCtrlRegAcessoFunc.GravarAcessoFunc: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAcessoFunc(FCdsAcessoFunc.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsAcessoFunc, FDbAcessoFunc, [], []);
      if not(Result) then
        raise Exception.Create(FDbAcessoFunc.MessageInfo);

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

function TCtrlRegAcessoFunc.GravarFlgAbonado(IdAcessoFunc, FlgAbonado: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFlgAbonado(IdAcessoFunc, FlgAbonado);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'UPDATE' +CR_LF+
        '  ACESSOFUNC' +CR_LF+
        'SET' +CR_LF+
        '  FLGABONADO    = ' +FlgAbonado+CR_LF+
        'WHERE' +CR_LF+
        '  (IDACESSOFUNC = ' +IdAcessoFunc+ ')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.GravarPontoForcado(IdAcessoFunc, FlgAbonado,
  FlgAbonado2, FlgAbonado3, FlgAbonado4,
  Entrada, Saida, SaidaIntervalo, RetornoIntervalo, CodMotivo,
  CodMotivo2, CodMotivo3, CodMotivo4, Descricao: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPontoForcado(IdAcessoFunc, FlgAbonado,
     Entrada, Saida, SaidaIntervalo, RetornoIntervalo, CodMotivo, Descricao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'UPDATE' +CR_LF+
        '  ACESSOFUNC' +CR_LF+
        'SET' +CR_LF+
        '  FLGABONADO = ' +FlgAbonado +',' +CR_LF+
        '  FLGABONADO2 = ' +FlgAbonado2 +',' +CR_LF+
        '  FLGABONADO3 = ' +FlgAbonado3 +',' +CR_LF+
        '  FLGABONADO4 = ' +FlgAbonado4 +',' +CR_LF+
        '  ENTRADA = ' +GetData(Entrada)+ ',' +CR_LF+
        '  SAIDA = ' +GetData(Saida)+ ',' +CR_LF+
        '  SAIDAINTERVALO = ' +GetData(SaidaIntervalo)+ ',' +CR_LF+
        '  RETORNOINTERVALO = ' +GetData(RetornoIntervalo)+ ',' +CR_LF+
        '  CODTIPOOCMED = ' +IFF(CodMotivo='', 'NULL', CodMotivo)+ ',' +CR_LF+
        '  CODTIPOOCMED2 = ' +IFF(CodMotivo2='', 'NULL', CodMotivo2)+ ',' +CR_LF+
        '  CODTIPOOCMED3 = ' +IFF(CodMotivo3='', 'NULL', CodMotivo3)+ ',' +CR_LF+
        '  CODTIPOOCMED4 = ' +IFF(CodMotivo4='', 'NULL', CodMotivo4)+ ',' +CR_LF+
        '  OBSERVACAO = ' +IFF(Descricao='', 'NULL', QuotedStr(Descricao))+ ',' +CR_LF+
        '  INDPASSAGEM = ''10''' +CR_LF+
        'WHERE' +CR_LF+
        '  (IDACESSOFUNC = ' +IdAcessoFunc+ ')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.InserirAbonoFalta(var IdAcessoFunc: integer; IdPessoa: double;
  Entrada, CodMotivo, Descricao: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirAbonoFalta(IdAcessoFunc, IdPessoa, Entrada,
      CodMotivo, Descricao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      IdAcessoFunc := GetSequence('ACESSOFUNC');
      Result := ExecSQL(
        'INSERT INTO ACESSOFUNC' +CR_LF+
        '  (IDACESSOFUNC, IDPESSOA, FLGABONADO, INDFUNCAO, ENTRADA, SAIDA,' +
        ' CODTIPOOCMED, OBSERVACAO, INDPASSAGEM)' +CR_LF+
        'VALUES (' +IntToStr(IdAcessoFunc)+ ', ' +FloatToStr(IdPessoa)+ ', 1, ''P'', '+
        'TO_DATE(' +QuotedStr(Entrada)+ ',''DD/MM/YYYY''), '+
        'TO_DATE(' +QuotedStr(Entrada)+ ',''DD/MM/YYYY''), '+
        IFF(CodMotivo='', 'NULL', CodMotivo) +', '+
        IFF(Descricao='', 'NULL', QuotedStr(Descricao)) +', '+
        '''10'')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.InserirPontoForcado(var IdAcessoFunc: integer; Abonado: integer;
  IdPessoa: double; Entrada, Saida, SaidaIntervalo, RetornoIntervalo,
  CodMotivo, Descricao: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirPontoForcado(IdAcessoFunc, Abonado,
      IdPessoa, Entrada, Saida, SaidaIntervalo, RetornoIntervalo, CodMotivo, Descricao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      IdAcessoFunc := GetSequence('ACESSOFUNC');
      Result := ExecSQL(
        'INSERT INTO ACESSOFUNC' +CR_LF+
        '  (IDACESSOFUNC, IDPESSOA, FLGABONADO, INDFUNCAO, ENTRADA, SAIDA, ' +CR_LF+
        '   SAIDAINTERVALO, RETORNOINTERVALO, CODTIPOOCMED, OBSERVACAO, INDPASSAGEM)' +CR_LF+
        'VALUES (' +IntToStr(IdAcessoFunc) +', '+ FloatToStr(IdPessoa) +', '+
        IntToStr(Abonado) +', ''P'', '+ GetData(Entrada) +', '+ GetData(Saida) +', '+
        GetData(SaidaIntervalo) +', '+ GetData(RetornoIntervalo) +', '+
        IFF(CodMotivo='', 'NULL', CodMotivo) +', '+
        IFF(Descricao='', 'NULL', QuotedStr(Descricao)) +', '+
        '''10'')');

      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.ExcluirPontoForcado(const IdAcessoFunc: integer; Data: TDate): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirPontoForcado(IdAcessoFunc, Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'DELETE ACESSOFUNC' +CR_LF+
        'WHERE  (IDACESSOFUNC = ' +IntToStr(IdAcessoFunc)+ ') AND' +CR_LF+
        '       (TO_CHAR(ENTRADA,''DD/MM/YYYY'') = ' +QuotedStr(DateToStr(Data))+ ')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.ExcluirAbonoFalta(IdAcessoFunc: integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirAbonoFalta(IdAcessoFunc);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'DELETE ACESSOFUNC WHERE IDACESSOFUNC = ' + IntToStr(IdAcessoFunc));
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.InserirQuantAcessos(ListaIdFunc, IdEstacao, DataIni,
  DataFim, Vezes: string; CadaDia: boolean): boolean;
var
  sSql, sIdPessoa: string;
  incr: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirQuantAcessos(ListaIdFunc, IdEstacao,
      DataIni, DataFim, Vezes, CadaDia);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      sSql :=
        'DELETE ACESSOFUNC WHERE IDPESSOA IN ('+ ListaIdFunc +') AND '+
        'INDFUNCAO = ''Q'' AND ENTRADA BETWEEN '+
        'TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') '+
        ' AND SAIDA BETWEEN '+
        'TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'') AND '+
        'TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'')';
      Result := ExecSQL(sSql);

      while (ListaIdFunc <> '') do
      begin
        ExtraiString(ListaIdFunc, sIdPessoa, ',');
        if not CadaDia then
        begin
          sSql :=
            'INSERT INTO ACESSOFUNC' +
            '  (IDACESSOFUNC, IDPESSOA, FLGABONADO, INDFUNCAO, ENTRADA, SAIDA, ' +
            '   IDESTACAOACESSO, QTDEVEZES) ' +
            'VALUES (' +IntToStr(GetSequence('ACESSOFUNC'))+ ', '+sIdPessoa+', 0, ''Q'', '+
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
              'INSERT INTO ACESSOFUNC' +
              '  (IDACESSOFUNC, IDPESSOA, FLGABONADO, INDFUNCAO, ENTRADA, SAIDA, ' +
              '   IDESTACAOACESSO, QTDEVEZES) ' +
              'VALUES (' +IntToStr(GetSequence('ACESSOFUNC'))+ ', '+sIdPessoa+', 0, ''Q'', '+
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

function TCtrlRegAcessoFunc.AtualizarMarcaPonto(ListaIdFunc: string; MarcaPonto,
  MarcaIntervalo: boolean): boolean;
var
  sMarcaPonto, sMarcaIntervalo: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarMarcaPonto(ListaIdFunc, MarcaPonto,
      MarcaIntervalo);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      sMarcaPonto := IFF(MarcaPonto, '1', '0');
      sMarcaIntervalo := IFF(MarcaIntervalo, '1', '0');

      Result := ExecSQL(
        'UPDATE' +CR_LF+
        '  FUNCIONARIO' +CR_LF+
        'SET' +CR_LF+
        '  FLGMARCAPONTO = ' +sMarcaPonto+CR_LF+
        ', FLGMARCAINTERVALO = ' +sMarcaIntervalo+CR_LF+
        'WHERE' +CR_LF+
        '  (IDPESSOA IN ('+ ListaIdFunc +'))');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlRegAcessoFunc.ListHistorico(ListaIdPessoa, ListaCodOcorr: string;
  AnoInicial, AnoFinal: integer): OleVariant;
var
  sSQL: string;
begin
{  sSQL :=
    'SELECT'+CR_LF+
    '  AUX.CODTIPOOCMED,'+CR_LF+
    '  SUBSTR(AUX.MES,5,2) AS MES,'+CR_LF+
    '  SUBSTR(AUX.MES,1,4) AS ANO,'+CR_LF+
    '  COUNT(*) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT'+CR_LF+
    '     CODTIPOOCMED, TO_CHAR(ENTRADA,''YYYYMM'') AS MES'+CR_LF+
    '   FROM'+CR_LF+
    '     ACESSOFUNC'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',', ListaIdPessoa) > 0) then
    sSQL := sSQL + '     (IDPESSOA     IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '     (IDPESSOA      = ' +ListaIdPessoa+ ') AND'+CR_LF;

  if (Pos(',', ListaCodOcorr) > 0) then
    sSQL := sSQL + '     (CODTIPOOCMED IN (' +ListaCodOcorr+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '     (CODTIPOOCMED  = ' +ListaCodOcorr+ ') AND'+CR_LF;  }

  sSQL := sSQL +
    '     (ENTRADA IS NOT NULL) AND'+CR_LF+
    '     (TO_NUMBER(TO_CHAR(ENTRADA,''YYYY'')) >= ' +IntToStr(AnoInicial)+ ') AND'+CR_LF+
    '     (TO_NUMBER(TO_CHAR(ENTRADA,''YYYY'')) <= ' +IntToStr(AnoFinal)+ ')) AUX'+CR_LF+
    'GROUP BY'+CR_LF+
    '  MES, CODTIPOOCMED';

  sSQL :=
    'SELECT'+CR_LF+
    '  CODTIPOOCMED,'+CR_LF+
    '  TO_CHAR(ENTRADA,''MM'') AS MES,'+CR_LF+
    '  TO_CHAR(ENTRADA,''YYYY'') AS ANO,'+CR_LF+
    '  COUNT(*) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  ACESSOFUNC'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',', ListaIdPessoa) > 0) then
    sSQL := sSQL + '  (IDPESSOA     IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '  (IDPESSOA      = ' +ListaIdPessoa+ ') AND'+CR_LF;

  if (Pos(',', ListaCodOcorr) > 0) then
    sSQL := sSQL + '  (CODTIPOOCMED IN (' +ListaCodOcorr+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '  (CODTIPOOCMED  = ' +ListaCodOcorr+ ') AND'+CR_LF;

  sSQL := sSQL +
    '  (ENTRADA IS NOT NULL) AND'+CR_LF+
    '  (TO_NUMBER(TO_CHAR(ENTRADA,''YYYY'')) >= ' +IntToStr(AnoInicial)+ ') AND'+CR_LF+
    '  (TO_NUMBER(TO_CHAR(ENTRADA,''YYYY'')) <= ' +IntToStr(AnoFinal)+ ')'+CR_LF+
    'GROUP BY TO_CHAR(ENTRADA,''MM''), TO_CHAR(ENTRADA,''YYYY''), CODTIPOOCMED'+CR_LF+
    'ORDER BY ANO, MES';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegAcessoFunc.GetDataHora: TDateTime;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  Result := Now;
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  SYSDATE AS DATAHORA' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL');
    Result := _CdsAux.FieldByName('DATAHORA').asDateTime;
  finally
    _CdsAux.Free;
  end;
end;

end.
