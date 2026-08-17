unit uCtrlIncRubrica;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes, uCtrlRubricaIndiv,
  uCtrlCustomRH, uDbRubricaIndiv;

type
  TCtrlIncRubrica = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlRubricaIndiv: TCtrlRubricaIndiv;
    FCdsPrincipal: TCMClientDataSet;
    FCdsHistorico: TCMClientDataSet;
    FDbRubricaIndiv: TDbRubricaIndiv;
    FIdRubrica: double;
    FAnoMesInicio: string;
    FIdEmpresa: integer;
    FNumParcelas: integer;
    FRubricaPermanente: boolean;
    FIdRegra: double;
    FNumOcorrencias: integer;
    FValor: double;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ProcessarInclusaoBeneficios: boolean;

    property CdsPrincipal: TCMClientDataSet read FCdsPrincipal write FCdsPrincipal;
    property IdRubrica: double read FIdRubrica write FIdRubrica;
    property AnoMesInicio: string read FAnoMesInicio write FAnoMesInicio;
    property IdEmpresa: integer read FIdEmpresa write FIdEmpresa;
    property NumParcelas: integer read FNumParcelas write FNumParcelas;
    property RubricaPermanente: boolean read FRubricaPermanente write FRubricaPermanente;
    property IdRegra: double read FIdRegra write FIdRegra;
    property NumOcorrencias: integer read FNumOcorrencias write FNumOcorrencias;
    property Valor: double read FValor write FValor;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlIncRubrica }

constructor TCtrlIncRubrica.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  
  FDbRubricaIndiv := TDbRubricaIndiv.Create(Self);
  FCtrlRubricaIndiv := TCtrlRubricaIndiv.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCdsHistorico := TCMClientDataSet.Create(nil);

  FCtrlRubricaIndiv.CdsRubricaIndiv := FCdsHistorico;
  FCtrlRubricaIndiv.OpenTransaction := false;
end;

destructor TCtrlIncRubrica.Destroy;
begin
  FDbRubricaIndiv.Free;
  FCtrlRubricaIndiv.Free;
  FCdsHistorico.Free;
  if (IsAppServer) then
    FCdsPrincipal.Free;
  inherited;
end;

procedure TCtrlIncRubrica.OnCreateAppServer;
begin
  inherited;
  FCdsPrincipal := TCMClientDataSet.Create(nil);
  FCdsHistorico := TCMClientDataSet.Create(nil);
end;

procedure TCtrlIncRubrica.AfterInitialize;
begin
  inherited;
  FCtrlRubricaIndiv.InitializeAs(Self);
end;

procedure TCtrlIncRubrica.DoChangeDataBase;
begin
  inherited;
  FDbRubricaIndiv.DataBaseName := DataBaseName;
end;

function TCtrlIncRubrica.ProcessarInclusaoBeneficios: Boolean;
var
  bFaz: boolean;
  iSequenciaRub: integer;
  _CdsRubricaPessoa: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarInclusaoBeneficios(FCdsPrincipal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsRubricaPessoa := TCMClientDataSet.Create(nil);
    try
      FCdsHistorico.Data := FCtrlRubricaIndiv.ListRubricaIndiv(-1);

      FCdsPrincipal.First;
      while not(FCdsPrincipal.EOF) do
      begin
        _CdsRubricaPessoa.Data := FCtrlRubricaIndiv.ListRubricaIndiv(
          CdsPrincipal.FieldByName('IDPESSOA').asFloat, FIdRubrica, -1, FIdEmpresa);

        bFaz := true;
        while not(_CdsRubricaPessoa.EOF) do
        begin
          if (_CdsRubricaPessoa.FieldByName('NUMOCORRENCIAS').asInteger <
              _CdsRubricaPessoa.FieldByName('PARCELAS').asInteger) or
             (_CdsRubricaPessoa.FieldByName('FLGPERMANENTE').asInteger = 1) then
          begin
            bFaz := false;
            break;
          end;
          _CdsRubricaPessoa.Next;
        end;

        if (bFaz) then
        begin
          iSequenciaRub := 0;
          _CdsRubricaPessoa.First;
          while not(_CdsRubricaPessoa.EOF) do
          begin
            if (_CdsRubricaPessoa.FieldByName('SEQRUBRICAINDIV').asInteger > iSequenciaRub) then
              iSequenciaRub := _CdsRubricaPessoa.FieldByName('SEQRUBRICAINDIV').asInteger;
            _CdsRubricaPessoa.Next;
          end;

          FCdsHistorico.Insert;
          FCdsHistorico.FieldByName('IDPESSOA').asFloat := FCdsPrincipal.FieldByName('IDPESSOA').asFloat;
          FCdsHistorico.FieldByName('IDRUBRICA').asFloat := FIdRubrica;
          FCdsHistorico.FieldByName('IDEMPRESA').asInteger := FIdEmpresa;
          FCdsHistorico.FieldByName('ANOMESINICIO').asString := FAnoMesInicio;
          FCdsHistorico.FieldByName('PARCELAS').asInteger := FNumParcelas;
          FCdsHistorico.FieldbyName('IDREGRACALCULO').asFloat := FIdRegra;
          FCdsHistorico.FieldbyName('FLGTPRUBMANUT').asInteger := 2;
          FCdsHistorico.FieldbyName('NUMOCORRENCIAS').asInteger := FNumOcorrencias;
          FCdsHistorico.FieldByName('SEQRUBRICAINDIV').asInteger := iSequenciaRub + 1;
          FCdsHistorico.FieldByName('VALORRUBRICA').asFloat := FValor;

          if (FRubricaPermanente) then
            FCdsHistorico.FieldByName('FLGPERMANENTE').asInteger := 1
          else
            FCdsHistorico.FieldByName('FLGPERMANENTE').asInteger := 0;

          FCdsHistorico.Post;
        end;
        FCdsPrincipal.Next;
        DoProgresso([0]);
      end;

      Result := FCtrlRubricaIndiv.GravarRubricaIndiv;
      if (Result) then
        MessageInfo := 'Processo executado com sucesso.'
      else
        MessageInfo := 'Ocorreu um erro na execução do Processo para o Empregado:' +CR_LF+
          FCdsPrincipal.FieldByName('NOME').asString +CR_LF+CR_LF+
          'Erro:' +CR_LF+ FCtrlRubricaIndiv.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := 'Ocorreu um erro na execução do Processo para o Empregado:' +CR_LF+
          FCdsPrincipal.FieldByName('NOME').asString +CR_LF+CR_LF+
          'Erro:' +CR_LF+ E.Message;
      end;
    end;
    _CdsRubricaPessoa.Free;
  end;
end;

end.
