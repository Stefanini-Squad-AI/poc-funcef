{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPerExame;

interface

uses SysUtils, Db, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbPerExame;

type
  TCtrlPerExame = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbPerExame: TDbPerExame;
    FCdsPerExame: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPeriodo(CodTipoOcMed: double): OleVariant;

    function GravarPeriodo: boolean;

    function ProximoNumSeqPeriodo: integer;

    property CdsPerExame: TCMClientDataSet read FCdsPerExame write FCdsPerExame;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPerExame }

constructor TCtrlPerExame.Create;
begin
  inherited;
  FDbPerExame := TDbPerExame.Create(Self);
end;

destructor TCtrlPerExame.Destroy;
begin
  FDbPerExame.Free;
  if (IsAppServer) then
    FCdsPerExame.Free;
  inherited;
end;

procedure TCtrlPerExame.OnCreateAppServer;
begin
  inherited;
  FCdsPerExame := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPerExame.DoChangeDataBase;
begin
  inherited;
  FDbPerExame.DataBaseName := DataBaseName;
end;

function TCtrlPerExame.ListPeriodo(CodTipoOcMed: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PE.CODTIPOOCMED, PE.NUMSEQ, PE.IDCARGO,'+CR_LF+
    '  PE.CODCENTROCUSTO, PE.LIMINFERIOR, PE.LIMSUPERIOR,'+CR_LF+
    '  PE.INDTEMPO, DECODE(PE.INDTEMPO,1,' +QuotedStr(('Idade'))+
                                       ',' +QuotedStr(('Exposição'))+ ') AS TIPO,'+CR_LF+
    '  PE.PERIODO, C.TITULO AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PEREXAME PE, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (PE.CODTIPOOCMED = '+FloatToStr(CodTipoOcMed)+') AND'+CR_LF+
    '  (PE.IDCARGO      = C.IDCARGO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CODTIPOOCMED');
end;

function TCtrlPerExame.ProximoNumSeqPeriodo: integer;
var
  iMaxNumSeq: integer;
  RegAtual: TBookmark;
begin
  if (FCdsPerExame.IsEmpty) then
    Result := 1
  else
  begin
    FCdsPerExame.DisableControls;
    RegAtual := FCdsPerExame.GetBookmark;
    FCdsPerExame.First;

    iMaxNumSeq := FCdsPerExame.FieldByName('NUMSEQ').asInteger;
    while not(FCdsPerExame.EOF) do
    begin
      if (FCdsPerExame.FieldByName('NUMSEQ').asInteger > iMaxNumSeq) then
        iMaxNumSeq := FCdsPerExame.FieldByName('NUMSEQ').asInteger;
      FCdsPerExame.Next;
    end;
    Result := iMaxNumSeq + 1;

    FCdsPerExame.GotoBookmark(RegAtual);
    FCdsPerExame.FreeBookmark(RegAtual);
    FCdsPerExame.EnableControls;
  end;
end;

function TCtrlPerExame.GravarPeriodo: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPeriodoExame(FCdsPerExame.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsPerExame, FDbPerExame, [], []);
      if not(Result) then
        raise Exception.Create(FDbPerExame.MessageInfo);

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
