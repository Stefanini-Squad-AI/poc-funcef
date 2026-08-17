{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 07/08/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlCursoxAvalDes;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbCursoxAvalDes;

type
  TCtrlCursoxAvalDes = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbCursoxAvalDes: TDbCursoxAvalDes;
    FCdsCursoxAvalDes: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListCursoxAvalDes(IdCurso: double = 0): OleVariant;
    function ListAvalDesXCurso(IdFatorAval: double = 0): OleVariant;

    function GravarCursoxAvalDes: boolean;

    property CdsCursoxAvalDes: TCMClientDataSet read FCdsCursoxAvalDes write FCdsCursoxAvalDes;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCursoxAvalDes }

constructor TCtrlCursoxAvalDes.Create;
begin
  inherited;
  FDbCursoxAvalDes := TDbCursoxAvalDes.Create(Self);
end;

destructor TCtrlCursoxAvalDes.Destroy;
begin
  FDbCursoxAvalDes.Free;
  if (IsAppServer) then
    FCdsCursoxAvalDes.Free;
  inherited;
end;

procedure TCtrlCursoxAvalDes.OnCreateAppServer;
begin
  inherited;
  FCdsCursoxAvalDes := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCursoxAvalDes.DoChangeDataBase;
begin
  inherited;
  FDbCursoxAvalDes.DataBaseName := DataBaseName;
end;

function TCtrlCursoxAvalDes.ListCursoxAvalDes(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CA.IDCURSO, C.DESCRICAO AS CURSO, CA.IDFATORAVAL, F.DESCRFATORAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  CURSOXAVALDES CA, CURSO C, FATORAVAL F'+CR_LF+
    IFF(IdCurso=-1, 'WHERE (1 = 2)',
      IFF(IdCurso=0, '',
        'WHERE'+CR_LF+
        '  (CA.IDCURSO     = '+FloatToStr(IdCurso)+') AND'+CR_LF+
        '  (CA.IDCURSO     = C.IDCURSO) AND'+CR_LF+
        '  (CA.IDFATORAVAL = F.IDFATORAVAL)'))+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(C.DESCRICAO), UPPER(DESCRFATORAVAL)');
end;

function TCtrlCursoxAvalDes.ListAvalDesXCurso(IdFatorAval: double = 0): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CA.IDCURSO, C.DESCRICAO AS CURSO, CA.IDFATORAVAL, F.DESCRFATORAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  CURSOXAVALDES CA, CURSO C, FATORAVAL F'+CR_LF+
    IFF(IdFatorAval=-1, 'WHERE (1 = 2)',
      IFF(IdFatorAval=0, '',
        'WHERE'+CR_LF+
        '  (CA.IDFATORAVAL = '+FloatToStr(IdFatorAval)+') AND'+CR_LF+
        '  (CA.IDCURSO     = C.IDCURSO) AND'+CR_LF+
        '  (CA.IDFATORAVAL = F.IDFATORAVAL)'))+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(DESCRFATORAVAL), UPPER(C.DESCRICAO)');
end;

function TCtrlCursoxAvalDes.GravarCursoXAvalDes: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCursoxAvalDes(FCdsCursoxAvalDes.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsCursoxAvalDes, FDbCursoxAvalDes, [], []);
      if not(Result) then
        raise Exception.Create(FDbCursoxAvalDes.MessageInfo);

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
