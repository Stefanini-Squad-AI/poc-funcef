{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFaixaSal;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbFaixaSal, uDbParamRH;

type
  TCtrlFaixaSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbFaixaSal;
    FDbParamRH: TDbParamRH;
    FCds: TCMClientDataSet;
    FTipoEmpresa: string;
    FIdEmpresa: integer;
  public
    constructor Create(IdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function ListFaixaSal(const IdFaixaSalarial: double = 0;
      const FatorFaixaSal: double = 0): OleVariant;
    function ListFaixaCargo(const IdCargo: double; const FatorFaixaSal: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property DbParamRH: TDbParamRH read FDbParamRH write FDbParamRH;
    property TipoEmpresa: string read FTipoEmpresa;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFaixaSal }

constructor TCtrlFaixaSal.Create(IdEmpresa: integer);
begin
  inherited Create;
  FDb := TDbFaixaSal.Create(Self);
  FDbParamRH := TDbParamRH.Create(Self, 0);

  FIdEmpresa := IdEmpresa;
end;

destructor TCtrlFaixaSal.Destroy;
begin
  FreeObject(FDbParamRH);
  FreeObject(FDb);
  if (IsAppServer) then
    FreeObject(FCds);
  inherited;
end;

procedure TCtrlFaixaSal.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFaixaSal.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
  FDbParamRH.DatabaseName := DataBaseName;

  // Verifica a rotina de integraçao dos sistemas previdenciários com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  _Cds.Data := GetDataPacket('SELECT TIPOEMPRESA FROM EMPRESAPROP '+
    'WHERE IDPESSOA = ' + IntToStr(FIdEmpresa));
  FTipoEmpresa := _Cds.FieldByName('TIPOEMPRESA').asString;
end;

function TCtrlFaixaSal.ListFaixaSal(const IdFaixaSalarial, FatorFaixaSal: double): OleVariant;
var
  c: byte;
  sStep: string;
begin
  sStep := '';
  for c:=1 to 9 do
    sStep := sStep + 'STEP' +IntToStr(c)+
      IFF(FatorFaixaSal > 0, ' * ' +Float2String(FatorFaixaSal), '')+
      ' AS STEP' +IntToStr(c)+', ';

  Result := GetDataPacket(
    'SELECT'+IFF(IdFaixaSalarial=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  ' +sStep+ 'IDFAIXASALARIAL, DATAEFETIV' +CR_LF+
    'FROM'+CR_LF+
    '  FAIXASAL'+CR_LF+
    IFF(IdFaixaSalarial=-1, 'WHERE (1 = 2)',
      IFF(IdFaixaSalarial=0, 'ORDER BY'+CR_LF+'  IDFAIXASALARIAL', 'WHERE'+CR_LF+
      '  (IDFAIXASALARIAL = '+FloatToStr(IdFaixaSalarial)+')')));
end;

function TCtrlFaixaSal.ListFaixaCargo(const IdCargo: double;
  const FatorFaixaSal: double): OleVariant;
var
  c: byte;
  sStep: string;
begin
  sStep := '';
  for c:=1 to 9 do
    sStep := sStep + 'F.STEP' +IntToStr(c)+
      IFF(FatorFaixaSal > 0, ' * ' +Float2String(FatorFaixaSal), '')+
      ' AS STEP' +IntToStr(c)+', ';

  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  ' +sStep+ 'F.IDFAIXASALARIAL, F.DATAEFETIV' +CR_LF+
    'FROM' +CR_LF+
    '  FAIXASAL F, CARGO C' +CR_LF+
    'WHERE' +CR_LF+
    '  (C.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND' +CR_LF+
    '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)');
end;

function TCtrlFaixaSal.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFaixaSal(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

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
