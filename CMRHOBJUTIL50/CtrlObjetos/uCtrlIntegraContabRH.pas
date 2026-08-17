unit uCtrlIntegraContabRH;
                                
interface

uses SysUtils, Db, Controls, Classes, Forms, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCtrlLancamento, uCtrlCustomRH, uCtrlContab, uCtrlPeriodo;

type
  TTipoLancContab = (tlcDebito, tlcCredito, tlcPartidaDobrada);

  TCtrlIntegraContabRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
  private
    FCtrlLancamento: TCtrlLancamento;
    FContab: TCtrlContab;

    FIdModulo: integer;
    FIdUsuario: integer;

    FUsaPlanoPatro: boolean;
    FIdPatro: integer;
    FIdPlanoPrev: integer;

    FPlnCodigo: double;
  public
    constructor Create(IdModulo, IdUsuario: integer; UsaPlanoPatro: boolean;
      IdPatro, IdPlanoPrev: integer); reintroduce;
    destructor  Destroy; override;

    function VerificaPeriodoContabil(const IdEmpresa: integer; Data: TDate): boolean;
    function VerificarLancamento(const IdEmpresa: integer;
      const TipoLancamento: TTipoLancContab; var TipoOperacao: string;
      const DataLancamento: TDate; const UnidNegoc, IdPlano: integer;
      const ContaDebito: string; const CodSubContaDebito: double;
      const CodCentroCustoDebito: string; const ContaCredito: string;
      const CodSubContaCredito: double; const CodCentroCustoCredito: string;
      const Valor: double): boolean;

    function InserirLancamento(const PlnCodigo: double; const IdEmpresa: integer;
      TipoLancamento: TTipoLancContab; TipoOperacao: string; Consolida: boolean;
      DataLancamento: TDate; UnidNegoc, IdPlano: integer; ContaDebito: string;
      SubContaDebito: double; CodCentroCustoDebito, ContaCredito: string;
      SubContaCredito: double; CodCentroCustoCredito, NumDocumento, HistLinha1,
      HistLinha2: string; Valor: double): boolean;

    property PlnCodigo: double read FPlnCodigo;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlIntegraContabRH }

constructor TCtrlIntegraContabRH.Create(IdModulo, IdUsuario: integer;
  UsaPlanoPatro: boolean; IdPatro, IdPlanoPrev: integer);
begin
  inherited Create;

  FContab := TCtrlContab.Create;  
  FCtrlLancamento := TCtrlLancamento.Create;
  
  FCtrlLancamento.OpenTransaction := false;

  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FUsaPlanoPatro := UsaPlanoPatro;
  FIdPatro := IdPatro;
  FIdPlanoPrev := IdPlanoPrev;
end;

destructor TCtrlIntegraContabRH.Destroy;
begin
  FCtrlLancamento.Free;
  FContab.Free;
  inherited; 
end;

procedure TCtrlIntegraContabRH.AfterInitialize;
begin
  inherited;
  FCtrlLancamento.InitializeAs(Self);
  FContab.InitializeAs(Self);
end;

procedure TCtrlIntegraContabRH.DoChangeDataBase;
begin
  inherited;
  FCtrlLancamento.DataBaseName := DataBaseName;
  FContab.DataBaseName := DataBaseName;
end;

function TCtrlIntegraContabRH.VerificaPeriodoContabil(const IdEmpresa: integer; Data: TDate): boolean;
var
  _CtrlPeriodo: TCtrlPeriodo;
begin
  Result := false;
  _CtrlPeriodo := TCtrlPeriodo.Create;
  try
    _CtrlPeriodo.InitializeAs(Self);
    try
      if not(_CtrlPeriodo.RetornaPeriodoExercicioDataProc(IdEmpresa, DateToStr(Data))) then
        raise Exception.Create(_CtrlPeriodo.MessageInfo);

      if (_CtrlPeriodo.Bloqueado = 'S') or (_CtrlPeriodo.Integrado = 'S') then
        raise Exception.Create(_CtrlPeriodo.MessageInfo +
          CMTranslate('Período Bloqueado para Lançamento ou Integração.'));

      if not(FContab.SelecionaParametrosProc(IdEmpresa)) then
        raise Exception.Create(FContab.MessageInfo);

      if (FContab.ExercicioAtual > _CtrlPeriodo.Exercicio) then
        raise Exception.Create(CMTranslate('Exercício já foi Encerrado.'));

      Result := true;
    except
      on E: Exception do
        MessageInfo := E.Message;
    end;
  finally
    _CtrlPeriodo.Free;
  end;
end;

function TCtrlIntegraContabRH.VerificarLancamento(
  const IdEmpresa: integer; const TipoLancamento: TTipoLancContab;
  var TipoOperacao: string; const DataLancamento: TDate;
  const UnidNegoc, IdPlano: integer; const ContaDebito: string;
  const CodSubContaDebito: double; const CodCentroCustoDebito: string;
  const ContaCredito: string; const CodSubContaCredito: double;
  const CodCentroCustoCredito: string; const Valor: double): boolean;
begin
  try
    if (FContab.PermiteZero = 'N') and (Valor = 0) then
      raise Exception.Create(CMTranslate('Lançamentos Zerados não são permitidos'));

    if (FUsaPlanoPatro) then
    begin
      if (FIdPatro = 0) then
        raise Exception.Create(CMTranslate('Patrocinadora não Informada'));

      if (FIdPlanoPrev = 0) then
        raise Exception.Create(CMTranslate('Plano não Informado'));
    end;

    if (TipoOperacao = '') then
      if (FContab.ObrigaTipoOper = 'S') then
        raise Exception.Create(CMTranslate('Tipo de Operação não Informado'))
      else
        TipoOperacao := FContab.TipoOperLanca;

    if not(FContab.SelecionaPlanoDataProc(IdEmpresa, DateToStr(DataLancamento))) then
      raise Exception.Create(CMTranslate('Plano de Contas Inválido'));

    if not(FCtrlLancamento.RetornaAtivProjPadrao(IdEmpresa)) then
      raise Exception.Create(FCtrlLancamento.MessageInfo);

    case (TipoLancamento) of
      tlcPartidaDobrada :
        if (ContaDebito = '') or (ContaCredito = '') then
          raise Exception.Create(CMTranslate('Conta a Débito e a Crédito devem ser Informadas em um Lançamento de Partida Dobrada'));
      tlcDebito :
        if (ContaDebito = '') then
          raise Exception.Create(CMTranslate('Conta a Débito deve ser Informada em um Lançamento a Débito'));
      tlcCredito :
        if (ContaCredito = '') then
          raise Exception.Create(CMTranslate('Conta a Crédito deve ser Informada em um Lançamento a Crédito'));
    end;

    if (ContaDebito <> '') then
    begin
      FCtrlLancamento.lcCentroCusto := CodCentroCustoDebito;
      FCtrlLancamento.lcSubConta := CodSubContaDebito;
      if not(FCtrlLancamento.TestaContaLancamento(
             ContaDebito, 'D', DateToStr(DataLancamento),
             IdPlano, IdEmpresa, FIdModulo,
             ExtraiMes(DataLancamento), ExtraiAno(DataLancamento))) then
      begin
        raise Exception.Create(FCtrlLancamento.MessageInfo);
      end;
    end;

    if (ContaCredito <> '') then
    begin
      FCtrlLancamento.lcCentroCusto := CodCentroCustoCredito;
      FCtrlLancamento.lcSubConta := CodSubContaCredito;
      if not(FCtrlLancamento.TestaContaLancamento(
             ContaCredito, 'C', DateToStr(DataLancamento),
             IdPlano, IdEmpresa, FIdModulo,
             ExtraiMes(DataLancamento), ExtraiAno(DataLancamento))) then
      begin
        raise Exception.Create(FCtrlLancamento.MessageInfo);
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

function TCtrlIntegraContabRH.InserirLancamento(const PlnCodigo: double;
  const IdEmpresa: integer; TipoLancamento: TTipoLancContab; TipoOperacao: string;
  Consolida: boolean; DataLancamento: TDate; UnidNegoc, IdPlano: integer;
  ContaDebito: string; SubContaDebito: double; CodCentroCustoDebito, ContaCredito: string;
  SubContaCredito: double; CodCentroCustoCredito, NumDocumento, HistLinha1,
  HistLinha2: string; Valor: double): boolean;
var
  bOk: boolean;
  cTipoLancamento: char;
begin
  case (TipoLancamento) of
    tlcDebito  : cTipoLancamento := '0';
    tlcCredito : cTipoLancamento := '1';
    else         cTipoLancamento := '2'; // tlcPartidaDobrada
  end;
  
  bOk := FCtrlLancamento.InsereLancaContab(
    cTipoLancamento, // Tipo do Lançamento
    IdEmpresa, // Empresa
    FIdModulo, // Módulo de Origem
    FIdUsuario, // Usuário Ativo
    IdPlano, // Plano de Contas
    IFF(UnidNegoc > 0, UnidNegoc, -1), // Unidade de Negócio
    SubContaDebito, // Sub-Conta de Débito
    SubContaCredito, // Sub-Conta de Crédito
    FIdPlanoPrev, // ID do Plano Previdenciário
    FIdPatro, // ID da Patrocinadora
    PlnCodigo, // Número da Planilha
    0, // Número do Lançamento
    DateToStr(DataLancamento), // Data do Lançamento
    NumDocumento, // Número do Documento
    HistLinha1, // 1ª Linha da Histórico
    HistLinha2, // 2ª Linha da Histórico
    '', // 3ª Linha da Histórico
    '', // 4ª Linha da Histórico
    '', // 5ª Linha da Histórico
    TipoOperacao, // Tipo de Operação Indicado
    CodCentroCustoDebito, // Centro de Custo para Débito
    ContaDebito, // Conta para Débito
    CodCentroCustoCredito, // Centro de Custo para Crédito
    ContaCredito, // Conta para Crédito
    '', // Código do Histórico Padrão
    Valor, // Valor a ser Lançado
    Consolida, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
    FUsaPlanoPatro); // Indica se usa Plano da Patrocinadora

  if (bOk) and (PlnCodigo <= 0) then
  begin
    FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo;
    bOk := (FPlnCodigo > 0);
  end;

  Result := bOk;

  if not(Result) then
    MessageInfo := FCtrlLancamento.MessageInfo;
end;

end.
