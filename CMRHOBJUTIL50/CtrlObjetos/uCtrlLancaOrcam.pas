{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlLancaOrcam;

interface

uses Classes, Controls, Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  uCtrlCustomRH;

type
  TNumPessoas = array[1..14] of integer;
  TValor = array[1..14] of double;

  TCtrlLancaOrcam = class(TCtrlCustomRH)
  private
    FNumPessoas: TNumPessoas;
    FValSalario, FValBenef, FValEncargo, FValTotal: TValor;

    function IncluirOrcamentoRH(IdEmpresa: integer; IdPlanoOrcamentario: double;
      ContaOrcamentaria: string; DataRef: TDate; Valor: double): boolean;
    function IncluirOrcamentoRHModCes(IdEmpresa: integer; IdEstab, IdCargo: double;
      CodCentroCusto: string; DataRef: TDate; Valor: double): boolean;
    function GetNumPessoas(Indice: word): integer;
    function GetValBenef(Indice: word): double;
    function GetValEncargo(Indice: word): double;
    function GetValSalario(Indice: word): double;
    function GetValTotal(Indice: word): double;
    procedure SetNumPessoas(Indice: word; const Valor: integer);
    procedure SetValBenef(Indice: word; const Valor: double);
    procedure SetValEncargo(Indice: word; const Valor: double);
    procedure SetValSalario(Indice: word; const Valor: double);
    procedure SetValTotal(Indice: word; const Valor: double);
  public
    function LancarOrcamento(const IAppCliente: OleVariant;
      Mes, Ano: word; IdEmpresa: integer; IdPlanoOrcamentario: double;
      ContaNumEmpregados, ContaSalarios, ContaEncargos, ContaBeneficios: string;
      NumMeses: word; IdEstab, IdCargo: double; CodCentroCusto: string;
      LancaNumPessoasRH: boolean): boolean;

    property NumPessoas[Indice: word]: integer read GetNumPessoas write SetNumPessoas;
    property ValSalario[Indice: word]: double read GetValSalario write SetValSalario;
    property ValBenef[Indice: word]: double read GetValBenef write SetValBenef;
    property ValEncargo[Indice: word]: double read GetValEncargo write SetValEncargo;
    property ValTotal[Indice: word]: double read GetValTotal write SetValTotal;
  end;

implementation

uses uCMClientDataSet, uCMTypes, uCtrlFuncoesRH;

{ TCtrlLancaOrcam }

function TCtrlLancaOrcam.GetNumPessoas(Indice: word): integer;
begin
  Result := FNumPessoas[Indice];
end;

function TCtrlLancaOrcam.GetValBenef(Indice: word): double;
begin
  Result := FValBenef[Indice];
end;

function TCtrlLancaOrcam.GetValEncargo(Indice: word): double;
begin
  Result := FValEncargo[Indice];
end;

function TCtrlLancaOrcam.GetValSalario(Indice: word): double;
begin
  Result := FValSalario[Indice];
end;

function TCtrlLancaOrcam.GetValTotal(Indice: word): double;
begin
  Result := FValTotal[Indice];
end;

procedure TCtrlLancaOrcam.SetNumPessoas(Indice: word; const Valor: integer);
begin
  FNumPessoas[Indice] := Valor;
end;

procedure TCtrlLancaOrcam.SetValBenef(Indice: word; const Valor: double);
begin
  FValBenef[Indice] := Valor;
end;

procedure TCtrlLancaOrcam.SetValEncargo(Indice: word; const Valor: double);
begin
  FValEncargo[Indice] := Valor;
end;

procedure TCtrlLancaOrcam.SetValSalario(Indice: word; const Valor: double);
begin
  FValSalario[Indice] := Valor;
end;

procedure TCtrlLancaOrcam.SetValTotal(Indice: word; const Valor: double);
begin
  FValTotal[Indice] := Valor;
end;

function TCtrlLancaOrcam.LancarOrcamento(const IAppCliente: OleVariant;
  Mes, Ano: word; IdEmpresa: integer; IdPlanoOrcamentario: double;
  ContaNumEmpregados, ContaSalarios, ContaEncargos, ContaBeneficios: string;
  NumMeses: word; IdEstab, IdCargo: double; CodCentroCusto: string;
  LancaNumPessoasRH: boolean): boolean;
var
  bOk: boolean;
  DataRef: TDate;
  c, Ind, wMes, wAno: word;
  ovAux: OleVariant;
  _CdsAux: array[1..5] of TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    // Criar ClientDataSets associados aos vetores
    for c:=1 to 5 do
      _CdsAux[c] := TCMClientDataSet.Create(nil);

    // Converter os Arrays de Número de Pessoas e Valores em Objetos (OleVariant)
    // que podem ser passados como parâmetro para a Aplicação Servidora
    ovAux := ListVariaveisEmBranco;
    for Ind:=1 to 5 do
    begin
      _CdsAux[Ind].Data := ovAux;
      _CdsAux[Ind].Insert;
      for c:=1 to 12 do
      begin
        case (Ind) of
          1 : _CdsAux[Ind].FieldByName('VAL' + PoeZero(c)).asInteger := FNumPessoas[c];
          2 : _CdsAux[Ind].FieldByName('VAL' + PoeZero(c)).asFloat := FValSalario[c];
          3 : _CdsAux[Ind].FieldByName('VAL' + PoeZero(c)).asFloat := FValBenef[c];
          4 : _CdsAux[Ind].FieldByName('VAL' + PoeZero(c)).asFloat := FValEncargo[c];
          5 : _CdsAux[Ind].FieldByName('VAL' + PoeZero(c)).asFloat := FValTotal[c];
        end;
      end;
      _CdsAux[Ind].Post;
    end;
    
    // Chamar a Aplicação Servidora
    Result := Connection.AppServer.LancarOrcamento(IAppCliente, Mes, Ano, IdEmpresa,
      IdPlanoOrcamentario, ContaNumEmpregados, ContaSalarios, ContaEncargos,
      ContaBeneficios, NumMeses, IdEstab, IdCargo, CodCentroCusto, LancaNumPessoasRH,
      _CdsAux[1].Data, _CdsAux[2].Data, _CdsAux[3].Data, _CdsAux[4].Data, _CdsAux[5].Data);
    MessageInfo := Connection.AppServer.MessageInfo;

    // Destruir ClientDataSets associados aos vetores
    for c:=1 to 5 do
      FreeAndNil(_CdsAux[c]);
  end
  else
  begin
    bOk := true;
    StartTransaction;

    for c:=0 to NumMeses-1 do
    begin
      wMes := Mes + c;
      wAno := Ano;
      if (wMes > 12) then
      begin
        wMes := wMes - 12;
        Inc(wAno);
      end;

      DataRef := TrazUltDiaData(StrToDate('01/'+ PoeZero(wMes) +'/'+ IntToStr(wAno)));

      // Número de Empregados
      if (Trim(ContaNumEmpregados) <> '') then
        bOk := IncluirOrcamentoRH(IdEmpresa, IdPlanoOrcamentario, Trim(ContaNumEmpregados),
          DataRef, FNumPessoas[c+1]);

      if (LancaNumPessoasRH) then
        bOk := IncluirOrcamentoRHModCes(IdEmpresa, IdEstab, IdCargo, CodCentroCusto,
          DataRef, FNumPessoas[c+1]);

      // Salários
      if (bOk) and (Trim(ContaSalarios) <> '') then
        bOk := IncluirOrcamentoRH(IdEmpresa, IdPlanoOrcamentario, Trim(ContaSalarios),
          DataRef, FValSalario[c+1]);

      // Encargos
      if (bOk) and (Trim(ContaEncargos) <> '') then
        bOk := IncluirOrcamentoRH(IdEmpresa, IdPlanoOrcamentario, Trim(ContaEncargos),
          DataRef, FValEncargo[c+1]);

       // Benefícios
      if (bOk) and (Trim(ContaBeneficios) <> '') then
        bOk := IncluirOrcamentoRH(IdEmpresa, IdPlanoOrcamentario, Trim(ContaBeneficios),
          DataRef, FValBenef[c+1]);

      if not(bOk) then
        break;

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarGravarSolicitacoes_CB;
      except
      end;
    end;

    Result := bOk;
    if (Result) then
    begin
      Commit;
      MessageInfo := ('Processo concluído com sucesso.');
    end
    else
      Rollback;
  end;
end;

function TCtrlLancaOrcam.IncluirOrcamentoRH(IdEmpresa: integer; IdPlanoOrcamentario: double;
  ContaOrcamentaria: string; DataRef: TDate; Valor: double): boolean;
var
  iNumOrcamentos: integer;
  wDia, wMes, wAno: word;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(VLRORCADO) AS NUM_ORCAMENTOS'+CR_LF+
    'FROM'+CR_LF+
    '  SALDOORCADO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+CR_LF+
    '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+CR_LF+
    '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' +QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

  iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

  if (iNumOrcamentos > 0) then
  begin
    try
      Result := ExecSQL(
        'UPDATE SALDOORCADO'+CR_LF+
        'SET    VLRORCADO = ROUND(' +Float2String(Valor) +'/'+ IntToStr(iNumOrcamentos) +',0)'+CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
        '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+CR_LF+
        '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+CR_LF+
        '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' +QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

      if not(Result) then
        raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo :=
         ('Ocorreu um erro ao tentar alterar o Orçamento para a Conta Nº ')+
          ContaOrcamentaria +CR_LF+ ('Erro:') +CR_LF+ E.Message;
      end;
    end;
  end
  else
  begin
    try
      DecodeDate(DataRef, wAno, wMes, wDia);
      Result := ExecSQL(
        'INSERT INTO SALDOORCADO'+CR_LF+
        '(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO)'+CR_LF+
        'VALUES (' +
          Float2String(Valor) +', '+
          IntToStr(IdEmpresa) +', '+
          FloatToStr(IdPlanoOrcamentario) +', '+
          QuotedStr(ContaOrcamentaria) +', '+
          'TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''), '+
          IntToStr(wMes) +', '+
          IntToStr(wAno) +')');

      if not(Result) then
        raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo :=
          ('Ocorreu um erro ao tentar inserir o Orçamento para a Conta Nº ')+
          ContaOrcamentaria +CR_LF+ ('Erro:') +CR_LF+ E.Message;
      end;
    end;
  end;
end;

function TCtrlLancaOrcam.IncluirOrcamentoRHModCes(IdEmpresa: integer; IdEstab, IdCargo: double;
  CodCentroCusto: string; DataRef: TDate; Valor: double): boolean;
var
  iNumOrcamentos: integer;
  wDia, wMes, wAno: word;
begin
  DecodeDate(DataRef, wAno, wMes, wDia);
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDORCAMPESSOAL AS NUM_ORCAMENTOS'+CR_LF+
    'FROM'+CR_LF+
    '  ORCAMPESSOAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (ANO            = ' +IntToStr(wAno)+ ') AND'+CR_LF+
    '  (MES            = ' +IntToStr(wMes)+ ') AND'+CR_LF+
    '  (IDESTAB        '+IFF(IdEstab=-1,'IS NULL','= ' +FloatToStr(IdEstab))+ ') AND'+CR_LF+
    '  (IDCARGO        '+IFF(IdCargo=-1,'IS NULL','= ' +FloatToStr(IdCargo))+ ') AND'+CR_LF+
    '  (CODCENTROCUSTO '+IFF(CodCentroCusto='','IS NULL','= ' +QuotedStr(CodCentroCusto))+ ')');

  iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

  if (iNumOrcamentos > 0) then
  begin
    try
      Result := ExecSQL(
        'UPDATE ORCAMPESSOAL'+CR_LF+
        'SET    QTDEPESSOAL = ROUND(' +Float2String(Valor)+',0)'+CR_LF+
        'WHERE'+CR_LF+
        '  (IDORCAMPESSOAL = ' +IntToStr(iNumOrcamentos)+ ')');

      if not(Result) then
        raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo :=
          ('Ocorreu um erro ao tentar alterar o Orçamento do Nº Pessoas') +CR_LF+
          ('Erro:') +CR_LF+ E.Message;
      end;
    end;
  end
  else
  begin
    try
      iNumOrcamentos := GetSequence('ORCAMPESSOAL');
      Result := ExecSQL(
        'INSERT INTO ORCAMPESSOAL'+CR_LF+
        '(IDORCAMPESSOAL,ANO,MES,IDCARGO,IDEMPRESA,CODCENTROCUSTO,IDESTAB,QTDEPESSOAL)'+CR_LF+
        'VALUES (' +
        IntToStr(iNumOrcamentos) +', '+
        IntToStr(wAno) +', '+
        IntToStr(wMes) +', '+
        IFF(IdCargo=-1,'NULL',FloatToStr(IdCargo))+', '+
        IntToStr(IdEmpresa) +', '+
        IFF(CodCentroCusto='','NULL',QuotedStr(CodCentroCusto))+', '+
        IFF(IdEstab=-1,'NULL',FloatToStr(IdEstab))+', '+
        Float2String(Valor) +')');

      if not(Result) then
        raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo :=
          ('Ocorreu um erro ao tentar inserir o Orçamento para Nº Pessoas') +CR_LF+
          ('Erro:') +CR_LF+ E.Message;
      end;
    end;
  end;
end;

end.
