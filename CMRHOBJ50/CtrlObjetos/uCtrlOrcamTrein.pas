{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlOrcamTrein;

interface

uses SysUtils, Forms, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
 uCtrlCustomRH, uDbOrcamTrein;

type
  TCtrlOrcamTrein = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbOrcamTrein;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListMestre(IdCurso: double): OleVariant;
    function ListDetalhe(IdCurso: double): OleVariant;
    function ListCentroCusto(IdEmpresa: double; CentroCusto: string): OleVariant;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlOrcamTrein }

constructor TCtrlOrcamTrein.Create;
begin
  inherited;
  FDbDet := TDbOrcamTrein.Create(Self);
end;

destructor TCtrlOrcamTrein.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlOrcamTrein.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlOrcamTrein.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlOrcamTrein.ListMestre(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCURSO, DESCRICAO, DUR_TEOR, DUR_PRAT, VALOR'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDCURSO  = '+FloatToStr(IdCurso)+')');
end;

function TCtrlOrcamTrein.ListDetalhe(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  OT.IDORCAMTREIN, OT.IDEMPRESA, OT.CODCENTROCUSTO, OT.IDCURSO, OT.ANO,'+CR_LF+
    '  OT.OCORRENCIAS, CC.NOME AS CENTRO_CUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  ORCAMTREIN OT, CENTCUST CC'+CR_LF+
    'WHERE'+CR_LF+
    '  (OT.IDCURSO        = '+FloatToStr(IdCurso)+') AND'+CR_LF+
    '  (OT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))');
end;

function TCtrlOrcamTrein.ListCentroCusto(IdEmpresa: double; CentroCusto: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  NOME, CODCENTROCUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  CENTCUST'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDEMPRESA          = '+FloatToStr(IdEmpresa)+')'+CR_LF+
    IFF(Trim(CentroCusto)='', '', '  AND (CODCENTROCUSTO '+
      IFF(Pos(',',CentroCusto)>0, 'IN ', '= ')+ CentroCusto +')'));
end;

function TCtrlOrcamTrein.Gravar: boolean;
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

end.
