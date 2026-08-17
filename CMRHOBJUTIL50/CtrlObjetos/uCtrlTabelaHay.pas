{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTabelaHay;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbTabelaHay;

type
  TCtrlTabelaHay = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDbTabelaHay: TDbTabelaHay;
    FCdsTabelaHay: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTabelaHay(IdTabelaHay: double = 0): OleVariant;

    function GetValorHay(IdCargo: integer): double;

    function Gravar: boolean;

    property CdsTabelaHay: TCMClientDataSet read FCdsTabelaHay write FCdsTabelaHay;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTabelaHay }

constructor TCtrlTabelaHay.Create;
begin
  inherited;
  FDbTabelaHay := TDbTabelaHay.Create(Self);
end;

destructor TCtrlTabelaHay.Destroy;
begin
  FDbTabelaHay.Free;
  if (IsAppServer) then
    FCdsTabelaHay.Free;
  inherited;
end;

procedure TCtrlTabelaHay.OnCreateAppServer;
begin
  inherited;
  FCdsTabelaHay := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTabelaHay.DoChangeDataBase;
begin
  inherited;
  FDbTabelaHay.DataBaseName := DataBaseName;
end;

function TCtrlTabelaHay.ListTabelaHay(IdTabelaHay: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTabelaHay=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  * '+CR_LF+
    'FROM'+CR_LF+
    '  TABELAHAY'+CR_LF+
    IFF(IdTabelaHay=-1, 'WHERE (1 = 2)',
      IFF(IdTabelaHay=0, 'ORDER BY'+CR_LF+'  LIMITE', 'WHERE'+CR_LF+
        '  (IDTABELAHAY = ' +FloatToStr(IdTabelaHay)+ ')')));
end;

function TCtrlTabelaHay.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTabelaHay(FCdsTabelaHay.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTabelaHay, FDbTabelaHay, [], []);
      if not(Result) then
        raise Exception.Create(FDbTabelaHay.MessageInfo);

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

// Retorna o Valor Hay de acordo com o Cargo informado
function TCtrlTabelaHay.GetValorHay(IdCargo: integer): double;
var
  _CdsAux: TCMClientDataSet;
  iPontos: integer;
  dFator, dMultiplicador, dParcela: double;
begin
  Result := 0;
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  C.PONTOSHAY, G.FATORHAY' +CR_LF+
    'FROM' +CR_LF+
    '  CARGO C, GRUPFUNC G' +CR_LF+
    'WHERE' +CR_LF+
    '  (C.IDCARGO    = ' +IntToStr(IdCargo) +') AND' +CR_LF+
    '  (C.CODGRPFUNC = G.CODGRPFUNC)');

  if not(_CdsAux.IsEmpty) then
  begin
    iPontos := _CdsAux.FieldByName('PONTOSHAY').asInteger;
    dFator := _CdsAux.FieldByName('FATORHAY').asFloat;

    if (dFator = 0) then
      dFator := 1;

    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  MULTIPLICADOR, PARCELA' +CR_LF+
      'FROM' +CR_LF+
      '  TABELAHAY' +CR_LF+
      'WHERE' +CR_LF+
      '  (LIMITE = (SELECT MIN(LIMITE)' +CR_LF+
      '             FROM   TABELAHAY' +CR_LF+
      '             WHERE  (LIMITE >= ' +IntToStr(iPontos)+ ')))');
    if not(_CdsAux.IsEmpty) then
    begin
      dMultiplicador := _CdsAux.FieldByName('MULTIPLICADOR').asFloat;
      dParcela := _CdsAux.FieldByName('PARCELA').asFloat;
      Result := Round((iPontos * dMultiplicador + dParcela) * 100 * dFator / 13) / 100;
    end;
  end;
  _CdsAux.Free;
end;

end.
