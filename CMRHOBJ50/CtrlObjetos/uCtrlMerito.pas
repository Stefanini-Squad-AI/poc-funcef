unit uCtrlMerito;

{--------------------------------------------------------------------------------------------------
Roina............: cricação da funcionalidade
Nº SIG...........: 39701
Data da Alteração: 01/06/2014
Responsável......: Edilaine
Descrição........: Inclusão funcionalidade Transações > Registro de Mérito
--------------------------------------------------------------------------------------------------}

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uCtrlCustomRH, uDbMerito;

type
  TCtrlMerito = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbMerito;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListaDados(IdPessoa: double): OleVariant;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlMerito }

constructor TCtrlMerito.Create;
begin
  inherited;
  FDbDet := TDbMerito.Create(Self);
end;

destructor TCtrlMerito.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlMerito.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlMerito.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
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

function TCtrlMerito.ListaDados(IdPessoa: double): OleVariant;
var
  sSQL : string;
begin

  sSQL :=
  'SELECT M.IDMERITOFUNC,' +CR_LF+
  '       M.IDPESSOA,' +CR_LF+
  '       M.MOTIVO,' +CR_LF+
  '       M.DATAOCORRENCIA,' +CR_LF+
  '       M.PONTUACAO,' +CR_LF+
  '       M.OBS, ' +CR_LF+
  '       SUBSTR(M.OBS, 1, 120) AS OBS_STR ' +CR_LF+
  '  FROM MERITOFUNC M' +CR_LF+
  '  WHERE M.IDPESSOA = '+FloatToStr(IdPessoa) +CR_LF+
  '  ORDER BY M.DATAOCORRENCIA DESC';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlMerito.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

end.
