{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugenio Frioli                  }
{ Criado Em: 29/03/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlProdAss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbProdAss;

type
  TCtrlProdAss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbProdAss: TDbProdAss;
    FCdsProdAss: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListProdAss(IdProdAss: double = 0): OleVariant;

    function GravarProdAss: boolean;

    property CdsProdAss: TCMClientDataSet read FCdsProdAss write FCdsProdAss;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlProdAss }

constructor TCtrlProdAss.Create;
begin
  inherited;
  FDbProdAss := TDbProdAss.Create(Self);
end;

destructor TCtrlProdAss.Destroy;
begin
  FDbProdAss.Free;
  if (IsAppServer) then
    FCdsProdAss.Free;
  inherited;
end;

procedure TCtrlProdAss.OnCreateAppServer;
begin
  inherited;
  FCdsProdAss := TCMClientDataSet.Create(nil);
end;

procedure TCtrlProdAss.DoChangeDataBase;
begin
  inherited;
  FDbProdAss.DataBaseName := DataBaseName;
end;

function TCtrlProdAss.ListProdAss(IdProdAss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdProdAss=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPRODASS, NOME, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PRODASS'+CR_LF+
    IFF(IdProdAss=-1, 'WHERE (1 = 2)',
      IFF(IdProdAss=0, 'ORDER BY'+CR_LF+'  NOME', 'WHERE'+CR_LF+
        '  (IDPRODASS = ' +FloatToStr(IdProdAss)+ ')')));
end;

function TCtrlProdAss.GravarProdAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProdAss(FCdsProdAss.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsProdAss, FDbProdAss, [], []);
      if not(Result) then
        raise Exception.Create(FDbProdAss.MessageInfo);

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
