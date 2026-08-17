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

uses Classes, Controls, Db, SysUtils, uSistema, uCmDbObject, uCmControlObject, uCtrlCustomRH;

type
  TNumPessoas = array[1..14] of integer;
  TValor = array[1..14] of double;

  TCtrlLancaOrcam = class(TCtrlCustomRH)
  private
    FNumPessoas: TNumPessoas;
    FValSalario, FValBenef, FValEncargo, FValTotal: TValor;

    function IncluirOrcamentoRH(IdEmpresa: integer; IdPlanoOrcamentario: double;
      ContaOrcamentaria: string; DataRef: TDate; Valor: double): boolean;
    function IncluirOrcamentoRHModCes(IdEmpresa: integer; Estab, Cargo, CentroCusto: string;
      DataRef: TDate; Valor: double): boolean;
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
    function LancarOrcamento(Mes,Ano: word; IdEmpresa: integer; IdPlanoOrcamentario: double;
      ContaNumEmpregados, ContaSalarios, ContaEncargos, ContaBeneficios: string;
      NumMeses: word; Estab, Cargo, CentroCusto: string; bRH: boolean): boolean;

    property NumPessoas[Indice: word]: integer read GetNumPessoas write SetNumPessoas;
    property ValSalario[Indice: word]: double read GetValSalario write SetValSalario;
    property ValBenef[Indice: word]: double read GetValBenef write SetValBenef;
    property ValEncargo[Indice: word]: double read GetValEncargo write SetValEncargo;
    property ValTotal[Indice: word]: double read GetValTotal write SetValTotal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

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

function TCtrlLancaOrcam.LancarOrcamento(Mes,Ano: word; IdEmpresa: integer;
  IdPlanoOrcamentario: double; ContaNumEmpregados, ContaSalarios, ContaEncargos,
  ContaBeneficios: string; NumMeses: word; Estab, Cargo, CentroCusto: string;
  bRH: boolean): boolean;
var
  bOk: boolean;
  DataRef: TDate;
  c, wMes, wAno: word;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.LancarOrcamento(Mes, Ano, IdEmpresa, IdPlanoOrcamentario,
      ContaNumEmpregados, ContaSalarios, ContaEncargos, ContaBeneficios, NumMeses,
      Estab, Cargo, CentroCusto, bRH);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
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

      if (bRH) then
        bOk := IncluirOrcamentoRHModCes(IdEmpresa, Estab, Cargo, CentroCusto,
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

      DoProgresso([0]);
    end;

    Result := bOk;
    if (Result) then
    begin
      Commit;
      MessageInfo := 'Processo concluído com sucesso.';
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
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.IncluirOrcamentoRH(IdEmpresa, IdPlanoOrcamentario,
      ContaOrcamentaria, DataRef, Valor);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _Cds.Data := GetDataPacket(
      'SELECT'+#13+
      '  COUNT(VLRORCADO) AS NUM_ORCAMENTOS'+#13+
      'FROM'+#13+
      '  SALDOORCADO'+#13+
      'WHERE'+#13+
      '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
      '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
      '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
      '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' +QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

    iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

    if (iNumOrcamentos > 0) then
    begin
      try
        Result := ExecSQL(
          'UPDATE SALDOORCADO'+#13+
          'SET    VLRORCADO = ROUND(' +Float2String(Valor) +'/'+ IntToStr(iNumOrcamentos) +',0)'+#13+
          'WHERE'+#13+
          '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
          '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
          '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
          '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' +QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      except
        on E: Exception do
        begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar alterar o Orçamento para a Conta Nº '+
            ContaOrcamentaria +#13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end
    else
    begin
      try
        DecodeDate(DataRef, wAno, wMes, wDia);
        Result := ExecSQL(
          'INSERT INTO SALDOORCADO'+#13+
          '(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO)'+#13+
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
          MessageInfo := 'Ocorreu um erro ao tentar inserir o Orçamento para a Conta Nº '+
            ContaOrcamentaria +#13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end;
  end;
end;

function TCtrlLancaOrcam.IncluirOrcamentoRHModCes(IdEmpresa: integer;
  Estab, Cargo, CentroCusto: string;
  DataRef: TDate; Valor: double): boolean;
var
  iNumOrcamentos: integer;
  wDia, wMes, wAno: word;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.IncluirOrcamentoRHModCes(IdEmpresa,
      Estab, Cargo, CentroCusto, DataRef, Valor);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    DecodeDate(DataRef, wAno, wMes, wDia);
    _Cds.Data := GetDataPacket(
      'SELECT'+#13+
      '  IDORCAMPESSOAL AS NUM_ORCAMENTOS'+#13+
      'FROM'+#13+
      '  ORCAMPESSOAL'+#13+
      'WHERE'+#13+
      '  (IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
      '  (ANO             = ' +IntToStr(wAno)+ ') AND'+#13+
      '  (MES             = ' +IntToStr(wMes)+ ') AND'+#13+
      '  (IDESTAB '+IFF(Estab='','IS NULL','= ' +Estab)+ ') AND'+#13+
      '  (IDCARGO '+IFF(Cargo='','IS NULL','= ' +Cargo)+ ') AND'+#13+
      '  (CODCENTROCUSTO '+IFF(CentroCusto='','IS NULL','= ' +QuotedStr(CentroCusto))+ ')');

    iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

    if (iNumOrcamentos > 0) then
    begin
      try
        Result := ExecSQL(
          'UPDATE ORCAMPESSOAL'+#13+
          'SET    QTDEPESSOAL = ROUND(' +Float2String(Valor)+',0)'+#13+
          'WHERE'+#13+
          '  (IDORCAMPESSOAL       = ' +IntToStr(iNumOrcamentos)+ ')');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      except
        on E: Exception do
        begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar alterar o Orçamento do Nº Pessoas'+
            #13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end
    else
    begin
      try
        iNumOrcamentos := GetSequence('ORCAMPESSOAL');
        Result := ExecSQL(
          'INSERT INTO ORCAMPESSOAL'+#13+
          '(IDORCAMPESSOAL,ANO,MES,IDCARGO,IDEMPRESA,CODCENTROCUSTO,IDESTAB,QTDEPESSOAL)'+#13+
          'VALUES (' +
            IntToStr(iNumOrcamentos) +', '+
            IntToStr(wAno) +', '+
            IntToStr(wMes) +', '+
            IFF(Cargo='','NULL',Cargo)+', '+
            IntToStr(IdEmpresa) +', '+
            IFF(CentroCusto='','NULL',QuotedStr(CentroCusto))+', '+
            IFF(Estab='','NULL',Estab)+', '+
            Float2String(Valor) +')');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      except
        on E: Exception do
        begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar inserir o Orçamento para Nº Pessoas'+
            #13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end;
  end;
end;

end.
