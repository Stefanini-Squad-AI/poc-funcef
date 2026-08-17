{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 21/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCorrecaoFaixaSal;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlFaixaSal, uCtrlPessoaFuncionario, uCtrlEvolFunc;

type
  TCtrlCorrecaoFaixaSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlFaixaSal: TCtrlFaixaSal;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FCtrlEvolFunc: TCtrlEvolFunc;

    FIAppCliente: OleVariant;

    FIdEmpresa: integer;
    FTipoEmpresa: string;

    procedure ExecProgresso(const Progresso: string = ''; NumRegistros: integer = 0;
      ProxRegistro: boolean = false);
  public
    constructor Create(IdEmpresa: integer; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function CorrigirFaixasSal(const IAppCliente: OleVariant; DataEfetivacao: TDateTime;
      PercCorrecao, Parcela: double; TipoArredondamento: integer;
      AtualizaSalEmpregados: boolean; TipoEvento: double): boolean;

    property TipoEmpresa: string read FTipoEmpresa;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCorrecaoFaixaSal }

constructor TCtrlCorrecaoFaixaSal.Create(IdEmpresa: integer; UsuXFilial, UsuXCCusto,
  IdUsuarioGeral: string);
begin
  inherited Create;

  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlFaixaSal := TCtrlFaixaSal.Create(IdEmpresa);
  FCtrlEvolFunc := TCtrlEvolFunc.Create;

  FIdEmpresa := IdEmpresa;
end;

procedure TCtrlCorrecaoFaixaSal.AfterInitialize;
begin
  inherited;
  FCtrlFaixaSal.InitializeAs(Self);
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FCtrlEvolFunc.InitializeAs(Self);

  FCtrlEvolFunc.OpenTransaction := false;
  FCtrlFaixaSal.OpenTransaction := false;
  FTipoEmpresa := FCtrlFaixaSal.TipoEmpresa;
end;

destructor TCtrlCorrecaoFaixaSal.Destroy;
begin
  FreeObject(FCtrlFaixaSal);
  FreeObject(FCtrlPessoaFuncionario);
  FreeObject(FCtrlEvolFunc);
  inherited;
end;

procedure TCtrlCorrecaoFaixaSal.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlCorrecaoFaixaSal.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlCorrecaoFaixaSal.ExecProgresso(const Progresso: string; NumRegistros: integer;
  ProxRegistro: boolean);
begin
  try
    FIAppCliente.ExecProgresso_CB(Progresso, NumRegistros, ProxRegistro);
  except
  end;
end;

function TCtrlCorrecaoFaixaSal.CorrigirFaixasSal(const IAppCliente: OleVariant;
  DataEfetivacao: TDateTime; PercCorrecao, Parcela: double; TipoArredondamento: integer;
  AtualizaSalEmpregados: boolean; TipoEvento: double): boolean;
var
  c: byte;
  iNumReg: integer;
  rFator, rAjuste, rUltSalario: real;
  _CdsFaixa, _CdsFunc, _CdsHstCes: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.CorrigirFaixasSal(IAppCliente, FIdEmpresa, FUsuXFilial,
      FUsuXCCusto, FIdUsuarioGeral, DataEfetivacao, PercCorrecao, Parcela,
      TipoArredondamento, AtualizaSalEmpregados, TipoEvento);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FIAppCliente := IAppCliente;
    
    _CdsFaixa := TCMClientDataSet.Create(nil);
    _CdsFunc := TCMClientDataSet.Create(nil);
    _CdsHstCes := TCMClientDataSet.Create(nil);

    Result := true;
    case (TipoArredondamento) of
      1 : rFator := 10;
      2 : rFator := 1;
      3 : rFator := 0.10;
      4 : rFator := 0.01;
     else rFator := 100;
    end;

    if (TipoArredondamento = 0) then
      rAjuste := 0
    else
      rAjuste := 0.49;

    try
      // Enviar mensagem ao cliente
      ExecProgresso(('Selecionando Dados...'));

      _CdsFaixa.Data := FCtrlFaixaSal.ListFaixaSal;
      iNumReg := _CdsFaixa.RecordCount;

      if (AtualizaSalEmpregados) then
      begin
        _CdsFunc.Data := FCtrlPessoaFuncionario.ListEmpresaFuncionario(
          FIdEmpresa, 'F.*', '', 'A,F');
        _CdsHstCes.Data := FCtrlEvolFunc.ListEvolFunc(-1);
        iNumReg := iNumReg + _CdsFunc.RecordCount;
      end;

      // Enviar mensagem ao cliente
      ExecProgresso(('Atualizando Faixas...'), iNumReg);

      StartTransaction;

      // Atualização das Faixas Salariais
      while not(_CdsFaixa.EOF) do
      begin
        _CdsFaixa.Edit;
        _CdsFaixa.FieldByName('DATAEFETIV').asDateTime := DataEfetivacao;

        for c:=1 to 9 do
          if (_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat > 0) then
            _CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat :=
              Round((_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat +
                ((_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat *
                  PercCorrecao) / 100) + Parcela) * rFator + rAjuste) / rFator;

        _CdsFaixa.Post;
        _CdsFaixa.Next;

        // Enviar mensagem ao cliente
        ExecProgresso('', 0, true);
      end;

      // Atualização do Cdastro dos Empregados e Histórico de Evolução Funcional
      if (AtualizaSalEmpregados) then
      begin
        // Enviar mensagem ao cliente
        ExecProgresso(('Atualizando Salários dos Empregados...'));

        _CdsFunc.First;
        while not(_CdsFunc.EOF) do
        begin
          if not(_CdsFunc.FieldByName('IDFAIXACARGO').IsNull) and
             not(_CdsFunc.FieldByName('NIVELINDIV1').IsNull) and
             (_CdsFaixa.Locate('IDFAIXASALARIAL', _CdsFunc.FieldByName('IDFAIXACARGO').asFloat, [])) then
          begin
            rUltSalario := _CdsFunc.FieldByName('SALARIOATUAL').asFloat;

            _CdsFunc.Edit;
            _CdsFunc.FieldByName('SALARIOATUAL').asFloat :=
              _CdsFaixa.FieldByName('STEP' +_CdsFunc.FieldByName('NIVELINDIV1').asString).asFloat;
            _CdsFunc.FieldByName('DATASALARIO').asDateTime := DataEfetivacao;
            _CdsFunc.Post;

            // Criar Histórico
            _CdsHstCes.Insert;
            _CdsHstCes.FieldByName('IDPESSOA').asFloat := _CdsFunc.FieldByName('IDPESSOA').asFloat;
            _CdsHstCes.FieldByName('DATAALTERFUNC').asDateTime := DataEfetivacao;
            _CdsHstCes.FieldByName('IDESTAB').asFloat := _CdsFunc.FieldByName('IDESTAB').asFloat;
            _CdsHstCes.FieldByName('IDEMPRESA').asInteger := _CdsFunc.FieldByName('IDEMPRESA').asInteger;
            _CdsHstCes.FieldByName('CODCENTROCUSTO').asString := _CdsFunc.FieldByName('CODCENTROCUSTO').asString;
            _CdsHstCes.FieldByName('IDCARGO').asFloat := _CdsFunc.FieldByName('IDCARGO').asFloat;
            _CdsHstCes.FieldByName('SALARIO').asFloat := _CdsFunc.FieldByName('SALARIOATUAL').asFloat;
            _CdsHstCes.FieldByName('IDMOTIVO').asFloat := TipoEvento;
            _CdsHstCes.FieldByName('TRGDTINCLUSAO').asDateTime := Now;

            if (rUltSalario = 0) then
              _CdsHstCes.FieldByName('PERC_REAJ').asFloat := 0
            else
              _CdsHstCes.FieldByName('PERC_REAJ').asFloat :=
                (_CdsFunc.FieldByName('SALARIOATUAL').asFloat - rUltSalario) * 100 / rUltSalario;

            _CdsHstCes.FieldByName('TIPOPAGAMENTO').asString := _CdsFunc.FieldByName('TIPOPAGAMENTO').asString;
            _CdsHstCes.Post;
          end;
          _CdsFunc.Next;

          // Enviar mensagem ao cliente
          ExecProgresso('', 0, true);
        end;
      end;

      if (IsAppServer) then
        FCtrlFaixaSal.Cds.Data := _CdsFaixa.Data
      else
        FCtrlFaixaSal.Cds := _CdsFaixa;

      if (AtualizaSalEmpregados) then
        if (IsAppServer) then
        begin
          FCtrlEvolFunc.CdsEvolFunc.Data := _CdsHstCes.Data;
          FCtrlEvolFunc.CdsFuncionario.Data := _CdsFunc.Data;
        end
        else
        begin
          FCtrlEvolFunc.CdsEvolFunc := _CdsHstCes;
          FCtrlEvolFunc.CdsFuncionario := _CdsFunc;
        end;

      if (FCtrlFaixaSal.Gravar) then
      begin
        if (AtualizaSalEmpregados) then
        begin
          if not(FCtrlEvolFunc.GravarEvolFunc(true)) then
          begin
            raise Exception.Create(('Processo Abortado.')+CR_LF+
              ('Um erro ocorreu ao tentar fazer a atualização do Salário dos Empregados.')+CR_LF+
              ('Erro:') +CR_LF+ FCtrlEvolFunc.MessageInfo);
          end;
        end
        else
        begin
          Commit;
          Result := true;
          MessageInfo := ('Procedimento Concluído com sucesso.');
        end;
      end
      else
      begin
        raise Exception.Create(('Processo Abortado.')+CR_LF+
          ('Um erro ocorreu ao tentar fazer a correção das Faixas.')+CR_LF+
          ('Erro:') +CR_LF+ FCtrlFaixaSal.MessageInfo);
      end;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FreeObject(_CdsFaixa);
    FreeObject(_CdsFunc);
    FreeObject(_CdsHstCes);
  end;
end;

end.
