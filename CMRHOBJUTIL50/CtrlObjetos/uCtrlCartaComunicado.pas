{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCartaComunicado;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbCarta;

type
  TCtrlCartaComunicado = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCarta;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListCarta(NumCarta: double): OleVariant;
    function ListMotivo: OleVariant;
    function ListDocumentos: OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCartaComunicado }

constructor TCtrlCartaComunicado.Create;
begin
  inherited;
  FDb := TDbCarta.Create(Self);
end;

destructor TCtrlCartaComunicado.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlCartaComunicado.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCartaComunicado.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlCartaComunicado.ListCarta(NumCarta: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(NumCarta=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  NUMCARTA, IDMOTIVO, DATACARTA, ASSUNTO, TEXTO'+CR_LF+
    'FROM'+CR_LF+
    '  CARTA'+CR_LF+
    IFF(NumCarta=-1, 'WHERE (1 = 2)',
      IFF(NumCarta=0, '', 'WHERE'+CR_LF+
        '  (NUMCARTA = ' +FloatToStr(NumCarta)+ ')')));
end;

function TCtrlCartaComunicado.ListMotivo: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDMOTIVO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    'WHERE'+CR_LF+
    '  (GRUPOMOTIVO IN (''A'',''D''))');
end;

function TCtrlCartaComunicado.ListDocumentos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  TDP.NOMEDOCUMENTO AS NOME, TDP.OBRIGAUF, TDP.OBRIGAORGAO,' +CR_LF+
    '  TDP.OBRIGAEMISSAO, TDP.FLGOBRIGAVALIDADE, TDP.FISICAJURIDICA,' +CR_LF+
    '  TDO.SIGLADOCUMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO' +CR_LF+
    'WHERE' +CR_LF+
    '  (TDO.IDDOCUMENTO = TDP.IDDOCUMENTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  NOMEDOCUMENTO');
end;

function TCtrlCartaComunicado.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCartaComunicado(FCds.Data);
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
