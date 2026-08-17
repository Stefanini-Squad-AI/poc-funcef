{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrupoArquivo;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbGrpArquivo;

type
  TCtrlGrupoArquivo = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbGrpArquivo;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(CodGrupoArquivo: string): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrupoArquivo }

constructor TCtrlGrupoArquivo.Create;
begin
  inherited;
  FDb := TDbGrpArquivo.Create(Self);
end;

destructor TCtrlGrupoArquivo.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGrupoArquivo.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrupoArquivo.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlGrupoArquivo.ListGeral(CodGrupoArquivo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodGrupoArquivo='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS'+CR_LF+
    'FROM'+CR_LF+
    '  GRPARQUIVO'+CR_LF+
    IFF(CodGrupoArquivo='-1', 'WHERE (1 = 2)',
      IFF(CodGrupoArquivo='0', '', 'WHERE'+CR_LF+
      '  (CODGRUPOARQUIVO = '+QuotedStr(CodGrupoArquivo)+')')));
end;

function TCtrlGrupoArquivo.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrupoArquivo(FCds.Data);
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
