{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlClasseSal;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uCtrlCargo, uDbClasseSal, uDbCargo;

type
  TCtrlClasseSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FDbClasseSal: TDbClasseSal;
    FDbCargo: TDbCargo;
    FCtrlCargo: TCtrlCargo;
    FCdsClasseSal: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListClasseSal(CodGrpFunc: string): OleVariant;

    function GravarClasseSal: boolean;

    function AtualizarFaixas(CodGrpFunc: string): boolean;

    property CdsDet: TCMClientDataSet read FCdsClasseSal write FCdsClasseSal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlClasseSal }

constructor TCtrlClasseSal.Create;
begin
  inherited;
  FDbClasseSal := TDbClasseSal.Create(Self);
  FDbCargo := TDbCargo.Create(Self);
  FCtrlCargo := TCtrlCargo.Create;
end;

destructor TCtrlClasseSal.Destroy;
begin
  FDbClasseSal.Free;
  FDbCargo.Free;
  FCtrlCargo.Free;
  if (IsAppServer) then
    FCdsClasseSal.Free;
  inherited;
end;

procedure TCtrlClasseSal.OnCreateAppServer;
begin
  inherited;
  FCdsClasseSal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlClasseSal.DoChangeDataBase;
begin
  inherited;
  FDbClasseSal.DataBaseName := DataBaseName;
  FDbCargo.DataBaseName := DataBaseName;
end;

procedure TCtrlClasseSal.AfterInitialize;
begin
  inherited;
  FCtrlCargo.InitializeAs(Self);
end;

function TCtrlClasseSal.ListClasseSal(CodGrpFunc: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodGrpFunc='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFAIXASALARIAL, CODGRPFUNC, MINIMO, MAXIMO'+CR_LF+
    'FROM'+CR_LF+
    '  CLASSESAL'+CR_LF+
    IFF(CodGrpFunc='-1', 'WHERE (1 = 2)',
      IFF(CodGrpFunc='', '', 'WHERE'+CR_LF+
        '  (CODGRPFUNC = '+QUOTEDSTR(CODGRPFUNC)+')'))+CR_LF+
    'ORDER BY'+CR_LF+
    '  IDFAIXASALARIAL');
end;

function TCtrlClasseSal.AtualizarFaixas(CodGrpFunc: string): boolean;
var
  iTotPontos: integer;
  _CdsCargo, _CdsClasse, _CdsTotPontos: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarFaixas(CodGrpFunc);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsCargo := TCMClientDataSet.Create(nil);
    _CdsClasse := TCMClientDataSet.Create(nil);
    _CdsTotPontos := TCMClientDataSet.Create(nil);

    _CdsCargo.Data := FCtrlCargo.ListCargo(0, 0, 0, 0, '', CodGrpFunc);
    _CdsClasse.Data := ListClasseSal(CodGrpFunc);

    try
      while not(_CdsCargo.EOF) do
      begin
        // Pego o total de pontos dos graus do Cargo atualmente posicionado
        _CdsTotPontos.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  SUM(PG.PESO * GC.GRAU) AS TOTAL_PONTOS'+CR_LF+
          'FROM'+CR_LF+
          '  PESOFATGRP PG, GRAUCARGO GC'+CR_LF+
          'WHERE'+CR_LF+
          '  (GC.IDCARGO     = ' +_CdsCargo.FieldByName('IDCARGO').asString+ ') AND'+CR_LF+
          '  (PG.CODGRPFUNC  = ' +_CdsCargo.FieldByName('CODGRPFUNC').asString+ ') AND'+CR_LF+
          '  (GC.IDFATORAVAL = PG.IDFATORAVAL)');
        iTotPontos := _CdsTotPontos.FieldByName('TOTAL_PONTOS').asInteger;

        // Altero a Faixa Salarial do Cargo atualmente posicionado, se necessário
        _CdsClasse.First;
        while not(_CdsClasse.EOF) do
        begin
          if (iTotPontos >= _CdsClasse.FieldByName('MINIMO').asInteger) and
             (iTotPontos <= _CdsClasse.FieldByName('MAXIMO').asInteger) and
             (_CdsCargo.FieldByName('IDFAIXASALARIAL').asInteger <>
              _CdsClasse.FieldByName('IDFAIXASALARIAL').asInteger) then
          begin
            _CdsCargo.Edit;
            _CdsCargo.FieldByName('IDFAIXASALARIAL').asInteger :=
              _CdsClasse.FieldByName('IDFAIXASALARIAL').asInteger;
            _CdsCargo.Post;

            CdsToDbObject(_CdsCargo, FDbCargo);
            StartTransaction;

            Result := FDbCargo.Update;
            if not(Result) then
            begin
              MessageInfo := FDbCargo.MessageInfo;
              Rollback;
            end
            else
              Commit;

            break;
          end;
          _CdsClasse.Next;
        end;
        _CdsCargo.Next;
      end;
      MessageInfo := ('Atualização realizada com sucesso.');
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        Rollback;
        MessageInfo :=('Operação Abortada.') +CR_LF+
          ('Ocorreu um erro ao atualizar a faixa Nº')+
          _CdsClasse.FieldByName('IDFAIXASALARIAL').asString +CR_LF+
         ('Erro:') +CR_LF+ E.Message;
      end;
    end;
    _CdsClasse.Free;
    _CdsTotPontos.Free;
    _CdsCargo.Free;
  end;
end;

function TCtrlClasseSal.GravarClasseSal: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarClasseSal(FCdsClasseSal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsClasseSal, FDbClasseSal, [], []);
      if not(Result) then
        raise Exception.Create(FDbClasseSal.MessageInfo);

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

end.
