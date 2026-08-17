{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 28/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAumentosSalariais;

interface

uses SysUtils, Controls, uCmControlObject, uCmDbObject, IvDictio, 
  uCmClientDataSet, uCMTypes, uCtrlCustomRH, uDbEvolFunc, uDbFuncionario;

type
  TCtrlAumentosSalariais = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbEvolFunc: TDbEvolFunc;
    FDbFuncionario: TDbFuncionario;
    FCdsPessoal: TCMClientDataSet;

    FIdEmpresa: Integer; 
    FEfetivar: boolean;
    FListaIdPessoa: string;
    FDataAlteracao: TDate;
    FTipoSimul, FTipoArred, FNumVez: integer;
    FIdMotivo: double;
    FParcela, FPercentualUnico, FValorASomarUnico, FPisoUnico: double;
    FMax, FPer, FParc, FPiso: array[1..8] of double;
    FNumPessoas: array[1..10] of integer;
    FValAtual, FValCorrigido, FPercAumento: array[1..10] of double;

    function GetMax(Indice: byte): double;
    function GetParc(Indice: byte): double;
    function GetPer(Indice: byte): double;
    function GetPiso(Indice: byte): double;
    function GetPercAumento(Indice: byte): double;
    function GetNumPessoas(Indice: byte): integer;
    function GetValAtual(Indice: byte): double;
    function GetValCorrigido(Indice: byte): double;
    procedure SetMax(Indice: byte; const Value: double);
    procedure SetParc(Indice: byte; const Value: double);
    procedure SetPer(Indice: byte; const Value: double);
    procedure SetPiso(Indice: byte; const Value: double);
    procedure SetPercAumento(Indice: byte; const Value: double);
    procedure SetNumPessoas(Indice: byte; const Value: integer);
    procedure SetValAtual(Indice: byte; const Value: double);
    procedure SetValCorrigido(Indice: byte; const Value: double);

    function GravarAumentoSalarial: boolean;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ImplementarAumentosSalariais(const IAppCliente: OleVariant; IdEmpresa: integer;
      IdMotivo: double; DataAlteracao: TDateTime): boolean;

    property CdsPessoal: TCMClientDataSet read FCdsPessoal write FCdsPessoal;

    property Efetivar: boolean read FEfetivar write FEfetivar;
    property NumVez: integer read FNumVez write FNumVez;
    property TipoSimul: integer read FTipoSimul write FTipoSimul;
    property TipoArred: integer read FTipoArred write FTipoArred;
    property ListaIdPessoa: string read FListaIdPessoa;

    property PercentualUnico: double read FPercentualUnico write FPercentualUnico;
    property ValorASomarUnico: double read FValorASomarUnico write FValorASomarUnico;
    property PisoUnico: double read FPisoUnico write FPisoUnico;
    property Max[Indice: byte]: double read GetMax write SetMax;
    property Per[Indice: byte]: double read GetPer write SetPer;
    property Parc[Indice: byte]: double read GetParc write SetParc;
    property Piso[Indice: byte]: double read GetPiso write SetPiso;
    property NumPessoas[Indice: byte]: integer read GetNumPessoas write SetNumPessoas;
    property ValAtual[Indice: byte]: double read GetValAtual write SetValAtual;
    property ValCorrigido[Indice: byte]: double read GetValCorrigido write SetValCorrigido;
    property PercAumento[Indice: byte]: double read GetPercAumento write SetPercAumento;
  end;

implementation

uses Classes, uMidasUtil, uCtrlFuncoesRH;

{ TCtrlAumentosSalariais }

constructor TCtrlAumentosSalariais.Create;
begin
  inherited;
  FDbEvolFunc := TDbEvolFunc.Create(Self);
  FDbFuncionario := TDbFuncionario.Create(Self);
end;

destructor TCtrlAumentosSalariais.Destroy;
begin
  FreeObject(FDbEvolFunc);
  FreeObject(FDbFuncionario);
  if (IsAppServer) then
    FreeObject(FCdsPessoal);
  inherited;
end;

procedure TCtrlAumentosSalariais.OnCreateAppServer;
begin
  inherited;
  FCdsPessoal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAumentosSalariais.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FDbEvolFunc.DataBaseName := DataBaseName;
end;

function TCtrlAumentosSalariais.GetMax(Indice: byte): double;
begin
  Result := FMax[Indice];
end;

function TCtrlAumentosSalariais.GetParc(Indice: byte): double;
begin
  Result := FParc[Indice];
end;

function TCtrlAumentosSalariais.GetPer(Indice: byte): double;
begin
  Result := FPer[Indice];
end;

function TCtrlAumentosSalariais.GetPiso(Indice: byte): double;
begin
  Result := FPiso[Indice];
end;

function TCtrlAumentosSalariais.GetPercAumento(Indice: byte): double;
begin
  Result := FPercAumento[Indice];
end;

function TCtrlAumentosSalariais.GetNumPessoas(Indice: byte): integer;
begin
  Result := FNumPessoas[Indice];
end;

function TCtrlAumentosSalariais.GetValAtual(Indice: byte): double;
begin
  Result := FValAtual[Indice];
end;

function TCtrlAumentosSalariais.GetValCorrigido(Indice: byte): double;
begin
  Result := FValCorrigido[Indice];
end;

procedure TCtrlAumentosSalariais.SetMax(Indice: byte; const Value: double);
begin
  FMax[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetParc(Indice: byte; const Value: double);
begin
  FParc[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetPer(Indice: byte; const Value: double);
begin
  FPer[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetPiso(Indice: byte; const Value: double);
begin
  FPiso[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetPercAumento(Indice: byte; const Value: double);
begin
  FPercAumento[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetNumPessoas(Indice: byte; const Value: integer);
begin
  FNumPessoas[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetValAtual(Indice: byte; const Value: double);
begin
  FValAtual[Indice] := Value;
end;

procedure TCtrlAumentosSalariais.SetValCorrigido(Indice: byte; const Value: double);
begin
  FValCorrigido[Indice] := Value;
end;

function TCtrlAumentosSalariais.ImplementarAumentosSalariais(const IAppCliente: OleVariant;
  IdEmpresa: integer; IdMotivo: double; DataAlteracao: TDateTime): boolean;
var
  c, Ind: byte;
  bErro: boolean;
  iTotNumPessoas: integer;
  dTotValAtual, dTotPercAumento, dTotValCorrigido,
  BasSalario, Fator, Ajuste, VlParc, rValorSalario: double;
  PerAumento, LimSalario, ValParcela, ValorPiso: array[1..8] of double;
  ovAux: OleVariant;
  _CdsAux: array[1..5] of TCMClientDataSet;
  ovFaixaMaxSai, ovNumPessoas, ovValAtual, ovValCorrigido, ovPercAumento: OleVariant;
begin
  if (ConnectionSide = cnsClient) then
  begin
    ovAux := ListVariaveisEmBranco;
    // Converter os Arrays de Valores em Objetos (OleVariant)
    // que podem ser passados como parâmetro para a Aplicação Servidora
    for Ind:=1 to 4 do
    begin
      _CdsAux[Ind] := TCMClientDataSet.Create(nil);
      _CdsAux[Ind].Data := ovAux;
      _CdsAux[Ind].Insert;
      for c:=1 to 8 do
      begin
        case (Ind) of
          1 : _CdsAux[Ind].Fields[c-1].asFloat := FMax[c];
          2 : _CdsAux[Ind].Fields[c-1].asFloat := FPer[c];
          3 : _CdsAux[Ind].Fields[c-1].asFloat := FParc[c];
          4 : _CdsAux[Ind].Fields[c-1].asFloat := FPiso[c];
        end;
      end;
      _CdsAux[Ind].Post;
    end;
    _CdsAux[5] := TCMClientDataSet.Create(nil);

    iTotNumPessoas := FNumPessoas[10];
    dTotValAtual := FValAtual[10];
    dTotPercAumento := FPercAumento[10];
    dTotValCorrigido := FValCorrigido[10];
    // Chamar a Aplicação Servidora
    Result := Connection.AppServer.ImplementarAumentosSalariais(IAppCliente, FCdsPessoal.Data,
      _CdsAux[1].Data, _CdsAux[2].Data, _CdsAux[3].Data, _CdsAux[4].Data, IdEmpresa, FNumVez,
      FEfetivar, FTipoSimul, FTipoArred, FPercentualUnico, FValorASomarUnico, FPisoUnico,
      IdMotivo, DataAlteracao, FListaIdPessoa, iTotNumPessoas, dTotValAtual, dTotPercAumento,
      dTotValCorrigido, ovFaixaMaxSai, ovNumPessoas, ovValAtual, ovValCorrigido, ovPercAumento);
    MessageInfo := Connection.AppServer.MessageInfo;

    // Atribuir aos vetores os valores vindos da Aplicação Servidora
    FNumPessoas[10] := iTotNumPessoas;
    FValAtual[10] := dTotValAtual;
    FPercAumento[10] := dTotPercAumento;
    FValCorrigido[10] := dTotValCorrigido;

    _CdsAux[1].Data := ovFaixaMaxSai;
    _CdsAux[2].Data := ovNumPessoas;
    _CdsAux[3].Data := ovValAtual;
    _CdsAux[4].Data := ovValCorrigido;
    _CdsAux[5].Data := ovPercAumento;

    for Ind:=1 to 5 do
    begin
      for c:=1 to 10 do
      begin
        case (Ind) of
          1 : if (c <= 8) then
              FMax[c] := _CdsAux[Ind].Fields[c-1].asFloat;
          2 : FNumPessoas[c] := _CdsAux[Ind].Fields[c-1].asInteger;
          3 : FValAtual[c] := _CdsAux[Ind].Fields[c-1].asFloat;
          4 : FValCorrigido[c] := _CdsAux[Ind].Fields[c-1].asFloat;
          5 : FPercAumento[c] := _CdsAux[Ind].Fields[c-1].asFloat;
        end;
      end;
      FreeObject(_CdsAux[Ind]);
    end;
  end
  else
  begin
    try
      bErro := false;
      FIdMotivo := IdMotivo;
      FDataAlteracao := DataAlteracao;
      FIdEmpresa := IdEmpresa;

      Ajuste := 0.49;
      Fator := 100;

      case (FTipoArred) of
        0 : Ajuste := 0;
        1 : Fator := 10;
        2 : Fator := 1;
        3 : Fator := 0.10;
        4 : Fator := 0.01;
      end;

      if not(FEfetivar) then
      begin
        if (FNumVez = 1) then
        begin
          FValAtual[10] := 0;
          FPercAumento[10] := 0;
          FNumPessoas[10] := 0;
          FValCorrigido[10] := 0;
        end;

        for c:=1 to 8 do
        begin
          LimSalario[c] := 0;
          PerAumento[c] := 0;
          ValParcela[c] := 0;
          ValorPiso[c] := 0;
        end;

        for c:=1 to 9 do
        begin
          FValAtual[c] := 0;
          FPercAumento[c] := 0;
          FNumPessoas[c] := 0;
          FValCorrigido[c] := 0;
        end;
      end;

      if (FTipoSimul = 0) then
      begin
        LimSalario[1] := 99999999;

        if (FPercentualUnico <> 0) then
          PerAumento[1] := FPercentualUnico;

        if (FValorASomarUnico <> 0) then
          ValParcela[1] := FValorASomarUnico;

        if (FPisoUnico <> 0) then
          ValorPiso[1] := FPisoUnico;
      end
      else
      begin
        for c:=1 to 8 do
        begin
          LimSalario[c] := FMax[c];
          PerAumento[c] := FPer[c];
          ValParcela[c] := FParc[c];
          ValorPiso[c] := FPiso[c];
        end;
      end;

      if (FEfetivar) then
        StartTransaction;

      FListaIdPessoa := '';
      FCdsPessoal.First;
      while not(FCdsPessoal.EOF) do
      begin
        if (FCdsPessoal.FieldByName('SALARIOATUAL').asFloat = 0) or
           (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = '') or
           (FCdsPessoal.FieldByName('JORNADAMENSAL').asInteger = 0) then
        begin
          FCdsPessoal.Next;

          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarGravarSolicitacoes_CB;
          except
          end;
          continue;
        end;

        rValorSalario := FCdsPessoal.FieldByName('SALARIOATUAL').asFloat;

        if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
          rValorSalario := rValorSalario * 30
        else
        if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
          rValorSalario := rValorSalario * FCdsPessoal.FieldByName('JORNADAMENSAL').asInteger;

        for c:=1 to 8 do
        begin
          if (LimSalario[c] = 0) then
            break;

          if (c = 1) then
            BasSalario := 0
          else
            BasSalario := LimSalario[c-1];

          if (rValorSalario >= BasSalario) and (rValorSalario <= LimSalario[c]) then
          begin
            VlParc := ValParcela[c];

            if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
              VlParc := VlParc / 30
            else
            if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
              VlParc := VlParc / FCdsPessoal.FieldByName('JORNADAMENSAL').asInteger;

            FParcela := Round((FCdsPessoal.FieldByName('SALARIOATUAL').asFloat *
              (100 + PerAumento[c]) / 100 + VlParc) * Fator + Ajuste) / Fator;

            if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
              FParcela := FParcela * 30
            else
            if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
              FParcela := FParcela * FCdsPessoal.FieldByName('JORNADAMENSAL').asInteger;

            if (ValorPiso[c] > FParcela) then
              FParcela := ValorPiso[c];

            if not(FEfetivar) then
            begin
              FNumPessoas[c] := FNumPessoas[c] + 1;
              FValAtual[c] := FValAtual[c] + rValorSalario;
              FValCorrigido[c] := FValCorrigido[c] + FParcela;
            end
            else
            begin
              if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
                FParcela := FParcela / 30
              else
              if (FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
                FParcela := FParcela / FCdsPessoal.FieldByName('JORNADAMENSAL').asInteger;

              // Somente grava a alteração se o percentual de alteração for maior que zero
              if ((FParcela - FCdsPessoal.FieldByName('SALARIOATUAL').asFloat) * 100 /
                  FCdsPessoal.FieldByName('SALARIOATUAL').asFloat > 0) then
                bErro := not(GravarAumentoSalarial)
              else
                bErro := false;
            end;
            break;
          end;
        end;

        if (FEfetivar) and (bErro) then
          break;

        FListaIdPessoa := FListaIdPessoa +IFF(FListaIdPessoa <> '',' OR ','')+
          '(H.IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString+ ')';

        FCdsPessoal.Next;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarGravarSolicitacoes_CB;
        except
        end;
      end;

      if (FEfetivar) then
      begin
        if not(bErro) then
        begin
          Commit;
          MessageInfo := ('Processo concluído com sucesso.');
        end
        else
        begin
          raise Exception.Create(('Processo Abortado.') +CR_LF+
            ('Um erro ocorreu ao tentar efetivar o Aumento para o Empregado:') +CR_LF+
            FCdsPessoal.FieldByName('NOME').asString+CR_LF+
            ('Erro:') +CR_LF+ MessageInfo);
        end;
      end;

      for c:=1 to 8 do
      begin
        FValAtual[9] := FValAtual[9] + FValAtual[c];
        FValCorrigido[9] := FValCorrigido[9] + FValCorrigido[c];
        FNumPessoas[9] := FNumPessoas[9] + FNumPessoas[c];
        FValAtual[10] := FValAtual[10] + FValAtual[c];
        FValCorrigido[10] := FValCorrigido[10] + FValCorrigido[c];
        FNumPessoas[10] := FNumPessoas[10] + FNumPessoas[c];
      end;

      for c:=1 to 10 do
        if (FValAtual[c] > 0) then
          FPercAumento[c] := (FValCorrigido[c] - FValAtual[c]) * 100 / FValAtual[c];

      Result := true;
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

function TCtrlAumentosSalariais.GravarAumentoSalarial: boolean;
var
  bAltFunc: boolean;
begin
  try
    // Criar Histórico
    FDbEvolFunc.IdPessoa.asFloat := FCdsPessoal.FieldByName('IDPESSOA').asFloat;
    FDbEvolFunc.DataAlterFunc.asDateTime := FDataAlteracao;
    FDbEvolFunc.CodCentroCusto.asString := FCdsPessoal.FieldByName('CODCENTROCUSTO').asString;
    FDbEvolFunc.IdEmpresa.asInteger := FIdEmpresa;
    FDbEvolFunc.IdCargo.asFloat := FCdsPessoal.FieldByName('IDCARGO').asFloat;
    FDbEvolFunc.IdEstab.asFloat := FCdsPessoal.FieldByName('IDESTAB').asFloat;
    FDbEvolFunc.Salario.asFloat := FParcela;
    FDbEvolFunc.IdMotivo.asFloat := FIdMotivo;
    FDbEvolFunc.Perc_Reaj.asFloat :=
      (FParcela - FCdsPessoal.FieldByName('SALARIOATUAL').asFloat) * 100 /
       FCdsPessoal.FieldByName('SALARIOATUAL').asFloat;
    FDbEvolFunc.TipoPagamento.asString := FCdsPessoal.FieldByName('TIPOPAGAMENTO').asString;

    FDbFuncionario.IdPessoa.asFloat := FCdsPessoal.FieldByName('IDPESSOA').asFloat;
    FDbFuncionario.LoadFromDb;

    // Atualizar Cadastro de Empregados
    bAltFunc := false;
    if (FDbEvolFunc.DataAlterFunc.asDateTime >= FCdsPessoal.FieldByName('DATASALARIO').asDateTime) and
       (FDbEvolFunc.Salario.asFloat <> FCdsPessoal.FieldByName('SALARIOATUAL').asFloat) then
    begin
      FDbFuncionario.DataSalario.asDateTime := FDbEvolFunc.DataAlterFunc.asDateTime;
      FDbFuncionario.SalarioAtual.asFloat := FDbEvolFunc.Salario.asFloat;
      FDbFuncionario.TipoPagamento.asString := FDbEvolFunc.TipoPagamento.asString;
      bAltFunc := true;
    end;

    if (FDbEvolFunc.DataAlterFunc.asDateTime >= FCdsPessoal.FieldByName('DATACARGO').asDateTime) and
       (FDbEvolFunc.IdCargo.asFloat <> FCdsPessoal.FieldByName('IDCARGO').asFloat) then
    begin
      FDbFuncionario.DataCargo.asDateTime := FDbEvolFunc.DataAlterFunc.asDateTime;
      FDbFuncionario.IdCargo.asFloat := FDbEvolFunc.IdCargo.asFloat;
      bAltFunc := true;
    end;

    if (FDbEvolFunc.DataAlterFunc.asDateTime >= FCdsPessoal.FieldByName('DATALOTACAO').asDateTime) and
       (FDbEvolFunc.CodCentroCusto.asFloat <> FCdsPessoal.FieldByName('CODCENTROCUSTO').asFloat) then
    begin
      FDbFuncionario.DataLotacao.asDateTime := FDbEvolFunc.DataAlterFunc.asDateTime;
      FDbFuncionario.CodCentroCusto.asString := FDbEvolFunc.CodCentroCusto.asString;
      bAltFunc := true;
    end;

    // Aplicar no Banco
    FDbEvolFunc.TrgDtInclusao.asDateTime := Now;
    Result := FDbEvolFunc.Insert;
    if (Result) then
    begin
      if (bAltFunc) then
        Result := FDbFuncionario.Update;
    end
    else
      raise Exception.Create(FDbEvolFunc.MessageInfo);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
