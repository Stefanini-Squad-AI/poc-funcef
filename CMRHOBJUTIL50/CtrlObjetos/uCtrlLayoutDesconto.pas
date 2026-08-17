{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlLayoutDesconto;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbLayoutDesconto, uDbLayoutXColunas;

type
  TCtrlLayoutDesconto = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbLayoutDesconto;
    FDbDet: TDbLayoutXColunas;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListMestre(IdLayout: double): OleVariant;
    function ListDetalhe(IdLayout: double): OleVariant;
    function ListLayoutDescontoXColunas: OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlLayoutDesconto }

constructor TCtrlLayoutDesconto.Create;
begin
  inherited;
  FDb := TDbLayoutDesconto.Create(Self);
  FDbDet := TDbLayoutXColunas.Create(Self);
end;

destructor TCtrlLayoutDesconto.Destroy;
begin
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCdsDet.Free;
    FCds.Free;
  end;
  inherited;
end;

procedure TCtrlLayoutDesconto.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlLayoutDesconto.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlLayoutDesconto.ListMestre(IdLayout: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdLayout=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDLAYOUT, DESCRICAO, COLCODIGO, TAMCODIGO,'+CR_LF+
    '  COLCODFAVORECIDO, TAMCODFAVORECIDO, COLCODIGODEP'+CR_LF+
    'FROM'+CR_LF+
    '  LAYOUTDESCONTO'+CR_LF+
    IFF(IdLayout=-1, 'WHERE (1 = 2)',
      IFF(IdLayout=0, '', 'WHERE'+CR_LF+
        '  (IDLAYOUT = '+FloatToStr(IdLayout)+')')));
end;

function TCtrlLayoutDesconto.ListDetalhe(IdLayout: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT *'+IFF(IdLayout=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    'FROM'+CR_LF+
    '  LAYOUTXCOLUNAS'+CR_LF+
    IFF(IdLayout=-1, 'WHERE (1 = 2)',
      IFF(IdLayout=0, '', 'WHERE'+CR_LF+
        '  (IDLAYOUT = '+FloatToStr(IdLayout)+')')));
end;

function TCtrlLayoutDesconto.ListLayoutDescontoXColunas: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  LD.IDLAYOUT, LD.DESCRICAO, LD.COLCODIGO, LD.TAMCODIGO,'+CR_LF+
    '  LD.COLCODFAVORECIDO, LD.TAMCODFAVORECIDO, LD.COLCODIGODEP,'+CR_LF+
    '  LC.COLVALOR, LC.TAMVALOR, LC.CODCENTRORESPON,'+CR_LF+
    '  LC.NUMDECIMAIS, LC.CARACDECIMAL, LC.COLPARCELAS, LC.TAMPARCELAS,'+CR_LF+
    '  LC.COLOCORRENCIAS, LC.TAMOCORRENCIAS, LC.IDRUBRICA'+CR_LF+
    'FROM'+CR_LF+
    '  LAYOUTDESCONTO LD, LAYOUTXCOLUNAS LC'+CR_LF+
    'WHERE'+CR_LF+
    '  (LD.IDLAYOUT = LC.IDLAYOUT)');
end;

function TCtrlLayoutDesconto.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarLayoutDesconto(FCds.Data, FCdsDet.Data);
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
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.IdLayout], [FDbDet.IdLayout]);
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

function TCtrlLayoutDesconto.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(FCds.Data, FCdsDet.Data);
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
          raise Exception.Create(FDb.MessageInfo);
      end
      else
        raise Exception.Create(FDbDet.MessageInfo);

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
