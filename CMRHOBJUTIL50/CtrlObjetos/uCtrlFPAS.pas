{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFPAS;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbFPAS, uDbConvPrevid;

type
  TCtrlFPAS = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbFPAS;
    FDbDet: TDbConvPrevid;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListMestre(IdFPAS: integer = 0): OleVariant;
    function ListFPASDescPequena(IdFPAS: integer = 0): OleVariant;    
    function ListDetalhe(IdFPAS: integer): OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFPAS }

constructor TCtrlFPAS.Create;
begin
  inherited;
  FDb := TDbFPAS.Create(Self);
  FDbDet := TDbConvPrevid.Create(Self);
end;

destructor TCtrlFPAS.Destroy;
begin
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsDet.Free;
  end;
  inherited;
end;

procedure TCtrlFPAS.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);  
end;

procedure TCtrlFPAS.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlFPAS.ListMestre(IdFPAS: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFPAS=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFPAS, DESCRICAO, PERCSALMATERN, PERCSALFAM, PERCPREVRURAL,'+CR_LF+
    '  PERCDECTERC, PERCCONTRIBEMPRES'+CR_LF+
    'FROM'+CR_LF+
    '  FPAS'+CR_LF+
    IFF(IdFPAS=-1, 'WHERE (1 = 2)',
      IFF(IdFPAS=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDFPAS = '+IntToStr(IdFPAS)+')')));
end;

function TCtrlFPAS.ListFPASDescPequena(IdFPAS: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFPAS=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFPAS, SUBSTR(DESCRICAO,1,120) AS DESCPEQUENA'+CR_LF+
    'FROM'+CR_LF+
    '  FPAS'+CR_LF+
    IFF(IdFPAS=-1, 'WHERE (1 = 2)',
      IFF(IdFPAS=0, 'ORDER BY'+CR_LF+'  DESCPEQUENA', 'WHERE'+CR_LF+
        '  (IDFPAS = '+IntToStr(IdFPAS)+')')));
end;

function TCtrlFPAS.ListDetalhe(IdFPAS: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDFPAS, IDCONVPREVID, DESCRICAO, PERCCONVPREVID'+CR_LF+
    'FROM'+CR_LF+
    '  CONVPREVID'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDFPAS = '+IntToStr(IdFPAS)+')');
end;

function TCtrlFPAS.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFPAS(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if not(Result) then
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
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

function TCtrlFPAS.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirFPAS(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsDet.First;
      while not(FCdsDet.EOF) do
        FCdsDet.Delete;

      StartTransaction;

      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          MessageInfo := FDb.MessageInfo;
      end
      else
        MessageInfo := FDbDet.MessageInfo;

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
