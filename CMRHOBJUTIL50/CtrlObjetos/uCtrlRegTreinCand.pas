{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegTreinCand;

interface

uses Classes, Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uDbHstTrn;

type
  TCtrlRegTreinCand = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstTrn: TDbHstTrn;
    FCdsHstTrn: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHistorico(IdPessoa: double): OleVariant;

    function ProximoNumSeq(IdPessoa,IdCurso: double): integer;

    function GravarRegTreinCand: boolean;

    property CdsHstTrn: TCMClientDataSet read FCdsHstTrn write FCdsHstTrn;
  end;

implementation

uses uCMTypes, uCmSqlParams, uCtrlFuncoesRH;

{ TCtrlRegTreinCand }

constructor TCtrlRegTreinCand.Create;
begin
  inherited;
  FDbHstTrn := TDbHstTrn.Create(Self);
end;

destructor TCtrlRegTreinCand.Destroy;
begin
  FDbHstTrn.Free;
  if (IsAppServer) then
    FCdsHstTrn.Free;
  inherited;
end;

procedure TCtrlRegTreinCand.OnCreateAppServer;
begin
  inherited;
  FCdsHstTrn := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegTreinCand.DoChangeDataBase;
begin
  inherited;
  FDbHstTrn.DataBaseName := Self.DataBaseName;
end;

function TCtrlRegTreinCand.ListHistorico(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.*, C.DESCRICAO, NVL(DATREINI, DATPLINI) AS DATAREF'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H, CURSO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.IDCURSO  = C.IDCURSO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAREF DESC');
end;

function TCtrlRegTreinCand.ProximoNumSeq(IdPessoa, IdCurso: double): integer;
var
  Marca: TBookmark;
begin
  Marca := FCdsHstTrn.GetBookmark;
  FCdsHstTrn.First;
  Result := 0;
  while not(FCdsHstTrn.EOF) do
  begin
    if (FCdsHstTrn.FieldByName('IDCURSO').asFloat = IdCurso) and
       (FCdsHstTrn.FieldByName('NUMSEQ').asInteger > Result) then
      Result := FCdsHstTrn.FieldByName('NUMSEQ').asInteger;

    FCdsHstTrn.Next;
  end;
  FCdsHstTrn.GotoBookmark(Marca);
  FCdsHstTrn.FreeBookmark(Marca);
  Result := Result + 1;
end;

function TCtrlRegTreinCand.GravarRegTreinCand: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegTreinCand(FCdsHstTrn.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstTrn, FDbHstTrn, [], []);
      if not(Result) then
        raise Exception.Create(FDbHstTrn.MessageInfo);

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
