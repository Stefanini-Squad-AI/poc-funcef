{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlUsuarioXFilial;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbUsuarioXFilial;

type
  TCtrlUsuarioXFilial = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbUsuarioXFilial;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListUsuarioXFilial(IdUsuario: double): OleVariant;
    function ListEstabNaoHab(IdUsuario: double; IdEmpresa: integer): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlUsuarioXFilial }

constructor TCtrlUsuarioXFilial.Create;
begin
  inherited;
  FDb := TDbUsuarioXFilial.Create(Self);
end;

destructor TCtrlUsuarioXFilial.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlUsuarioXFilial.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlUsuarioXFilial.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlUsuarioXFilial.ListUsuarioXFilial(IdUsuario: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UC.IDFILIALPESSOA, UC.IDUSUARIO, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, USUARIOXFILIAL UC'+CR_LF+
    'WHERE'+CR_LF+
    '  (UC.IDUSUARIO      = ' +FloatToStr(IdUsuario)+ ') AND'+CR_LF+
    '  (UC.IDFILIALPESSOA = P.IDPESSOA)');
end;

function TCtrlUsuarioXFilial.ListEstabNaoHab(IdUsuario: double; IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  F.IDFILIALPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FILIALPESSOA F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDFILIALPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (F.IDFILIALPESSOA NOT IN (SELECT IDFILIALPESSOA'+CR_LF+
    '                            FROM   USUARIOXFILIAL'+CR_LF+
    '                            WHERE  (IDUSUARIO = ' +FloatToStr(IdUsuario)+ '))) AND'+CR_LF+
    '  ((P.IDGRUPO = ' +IntToStr(IdEmpresa)+ ') OR'+CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                  WHERE  IDGRUPO = ' +IntToStr(IdEmpresa)+ ')) OR'+CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                  WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                                     WHERE  IDGRUPO = ' +IntToStr(IdEmpresa)+ '))) OR'+CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                  WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                                     WHERE IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'+CR_LF+
    '                                                       WHERE  IDGRUPO = ' +
    IntToStr(IdEmpresa)+ ')))))');
end;

function TCtrlUsuarioXFilial.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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
