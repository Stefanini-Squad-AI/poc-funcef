{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlProfiss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbProfiss;

type
  TCtrlProfiss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbProfissao: TDbProfiss;
    FCdsProfissao: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListProfissao(IdProfiss: double = 0): OleVariant;

    function GravarProfissao: boolean;

    property CdsProfissao: TCMClientDataSet read FCdsProfissao write FCdsProfissao;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlProfiss }

constructor TCtrlProfiss.Create;
begin
  inherited;
  FDbProfissao := TDbProfiss.Create(Self);
end;

destructor TCtrlProfiss.Destroy;
begin
  FDbProfissao.Free;
  if (IsAppServer) then
    FCdsProfissao.Free;
  inherited;
end;

procedure TCtrlProfiss.OnCreateAppServer;
begin
  inherited;
  FCdsProfissao := TCMClientDataSet.Create(nil);
end;

procedure TCtrlProfiss.DoChangeDataBase;
begin
  inherited;
  FDbProfissao.DataBaseName := DataBaseName;
end;

function TCtrlProfiss.ListProfissao(IdProfiss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdProfiss=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPROFISS, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROFISS'+CR_LF+
    IFF(IdProfiss=-1, 'WHERE (1 = 2)',
      IFF(IdProfiss=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDPROFISS = ' +FloatToStr(IdProfiss)+ ')')));
end;

function TCtrlProfiss.GravarProfissao: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProfissao(FCdsProfissao.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsProfissao, FDbProfissao, [], []);
      if not(Result) then
        raise Exception.Create(FDbProfissao.MessageInfo);

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
