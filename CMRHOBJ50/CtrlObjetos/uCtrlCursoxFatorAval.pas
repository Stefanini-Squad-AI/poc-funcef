{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 10/07/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlCursoxFatorAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCursoxFatorAval;

type
  TCtrlCursoxFatorAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbCursoxFatorAval: TDbCursoxFatorAval;
    FCdsCursoxFatorAval: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListCursoxFatorAval(IdCurso: double = 0): OleVariant;

    function GravarCursoxFatorAval: boolean;

    property CdsCursoxFatorAval: TCMClientDataSet read FCdsCursoxFatorAval write FCdsCursoxFatorAval;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCursoxFatorAval }

constructor TCtrlCursoxFatorAval.Create;
begin
  inherited;
  FDbCursoxFatorAval := TDbCursoxFatorAval.Create(Self);
end;

destructor TCtrlCursoxFatorAval.Destroy;
begin
  FDbCursoxFatorAval.Free;
  if (IsAppServer) then
    FCdsCursoxFatorAval.Free;
  inherited;
end;

procedure TCtrlCursoxFatorAval.OnCreateAppServer;
begin
  inherited;
  FCdsCursoxFatorAval := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCursoxFatorAval.DoChangeDataBase;
begin
  inherited;
  FDbCursoxFatorAval.DataBaseName := DataBaseName;
end;

function TCtrlCursoxFatorAval.ListCursoxFatorAval(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CF.IDCURSO, C.DESCRICAO AS CURSO, CF.IDFATORAVAL, FA.FLGAVALCURSO,'+CR_LF+
    '  FA.DESCRICAO AS FATORAVAL, FA.IDESCALACONCEITOS, FA.INDAPLICACAO,'+CR_LF+
    '  DECODE(NVL(FA.INDAPLICACAO,0), 0,''Cursos'', 1,''Alunos'') AS APLICACAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSOXFATORAVAL CF, CURSO C, FATORAVALCURSO FA'+CR_LF+
    IFF(IdCurso=-1, 'WHERE (1 = 2)',
      IFF(IdCurso=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (CF.IDCURSO = C.IDCURSO) AND (CF.IDFATORAVAL = FA.IDFATORAVAL) AND'+CR_LF+
        '  (CF.IDCURSO = '+FloatToStr(IdCurso)+')'))+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(CURSO), UPPER(FATORAVAL)');
end;

function TCtrlCursoxFatorAval.GravarCursoXFatorAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCursoxFatorAval(FCdsCursoxFatorAval.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsCursoxFatorAval, FDbCursoxFatorAval, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbCursoxFatorAval.MessageInfo);
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
