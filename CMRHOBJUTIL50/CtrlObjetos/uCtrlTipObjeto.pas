{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipObjeto;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoObjProcTrab;

type
  TCtrlTipObjeto = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipObjeto: TDbTipoObjProcTrab;
    FCdsTipObjeto: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipObjeto(CodTipoObjeto: double = 0): OleVariant;
    function ListRubrica(IdEmpresa: integer): OleVariant;
    function ListGrpObjeto: OleVariant;

    function GravarTipObjeto: boolean;

    property CdsTipObjeto: TCMClientDataSet read FCdsTipObjeto write FCdsTipObjeto;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipObjeto }

constructor TCtrlTipObjeto.Create;
begin
  inherited;
  FDbTipObjeto := TDbTipoObjProcTrab.Create(Self);
end;

destructor TCtrlTipObjeto.Destroy;
begin
  FDbTipObjeto.Free;
  if (IsAppServer) then
    FCdsTipObjeto.Free;
  inherited;
end;

procedure TCtrlTipObjeto.OnCreateAppServer;
begin
  inherited;
  FCdsTipObjeto := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipObjeto.DoChangeDataBase;
begin
  inherited;
  FDbTipObjeto.DataBaseName := DataBaseName;
end;

function TCtrlTipObjeto.ListTipObjeto(CodTipoObjeto: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoObjeto=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODTIPOOBJETO, DESCRICAO, IDPROVENTO, IDGRUPOOBJETO, FLGPROVDESC, CLASSEOBJ'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOOBJPROCTRAB'+CR_LF+
    IFF(CodTipoObjeto=-1, 'WHERE (1 = 2)',
      IFF(CodTipoObjeto=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (CODTIPOOBJETO = ' +FloatToStr(CodTipoObjeto)+ ')')));
end;

function TCtrlTipObjeto.ListRubrica(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PD.IDPROVENTO, RP.DESCRPROVDESC'+CR_LF+
    'FROM'+CR_LF+
    '   RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    '  (RP.IDPESSOA        = '+IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RP.IDRUBRICA       = PD.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  RP.DESCRPROVDESC');
end;

function TCtrlTipObjeto.ListGrpObjeto: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDGRUPOOBJETO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  GRPOBJPROCJUR'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlTipObjeto.GravarTipObjeto: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipObjeto(FCdsTipObjeto.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTipObjeto, FDbTipObjeto, [], []);
      if not(Result) then
        Exception.Create(FDbTipObjeto.MessageInfo);

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
