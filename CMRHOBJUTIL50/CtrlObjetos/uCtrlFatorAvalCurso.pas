{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFatorAvalCurso;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbFatorAvalCurso;

type
  TCtrlFatorAvalCurso = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FDbFatorAvalCurso: TDbFatorAvalCurso;
    FCdsFatorAvalCurso: TCMClientDataSet;

    FFiltrarAvalCurso: boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListFatorAvalCurso(IdFatorAval: double = 0; Opcao: integer = 0;
      IdCurso: double = 0): OleVariant;

    function GravarFatorAvalCurso: boolean;

    property CdsFatorAvalCurso: TCMClientDataSet read FCdsFatorAvalCurso write FCdsFatorAvalCurso;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFatorAvalCurso }

constructor TCtrlFatorAvalCurso.Create;
begin
  inherited;
  FDbFatorAvalCurso := TDbFatorAvalCurso.Create(Self);
end;

destructor TCtrlFatorAvalCurso.Destroy;
begin
  FDbFatorAvalCurso.Free;
  if (IsAppServer) then
    FCdsFatorAvalCurso.Free;
  inherited;
end;

procedure TCtrlFatorAvalCurso.OnCreateAppServer;
begin
  inherited;
  FCdsFatorAvalCurso := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFatorAvalCurso.AfterInitialize;
begin
  inherited;
  _Cds.Data := GetDataPacket('SELECT FLGCURSOXAVAL FROM PARAMRH');
  FFiltrarAvalCurso := (_Cds.FieldByName('FLGCURSOXAVAL').asInteger = 1);
end;

procedure TCtrlFatorAvalCurso.DoChangeDataBase;
begin
  inherited;
  FDbFatorAvalCurso.DataBaseName := DataBaseName;
end;

function TCtrlFatorAvalCurso.ListFatorAvalCurso(IdFatorAval: double; Opcao: integer;
  IdCurso: double): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT' + IFF(IdFatorAval=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  F.IDFATORAVAL, F.DESCRICAO, F.FLGAVALCURSO, F.INDAPLICACAO, F.OBSERVACAO, F.IDESCALACONCEITOS,'+CR_LF+
    '  DECODE(NVL(F.INDAPLICACAO,0),0, ' +QuotedStr(('Cursos'))+
                                  ',1, ' +QuotedStr(('Alunos'))+ ') AS APLICACAO'+CR_LF+
    'FROM'+CR_LF+
    '  FATORAVALCURSO F';

  if (IdFatorAval = -1) then
    sSQL := sSQL +CR_LF+
      'WHERE' +CR_LF+
      '  (1 = 2)'
  else
  if (IdFatorAval > 0) then
    sSQL := sSQL +CR_LF+
      'WHERE' +CR_LF+
      '  (F.IDFATORAVAL = ' +FloatToStr(IdFatorAval)+ ')'
  else
  if (IdFatorAval = 0) then
  begin
    if (IdCurso = 0) or not(FFiltrarAvalCurso) then
    begin
      sSQL := sSQL +CR_LF;

      if (Opcao > -1) then
        sSQL := sSQL +
          'WHERE' +CR_LF+
          '  (NVL(F.INDAPLICACAO,0) = ' +IntToStr(Opcao)+ ')'+CR_LF;
    end
    else
    begin
      sSQL := sSQL + ', CURSOXFATORAVAL C'+CR_LF;

      sSQL := sSQL +
        'WHERE (C.IDCURSO     = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
        '      (C.IDFATORAVAL = F.IDFATORAVAL)'+CR_LF;

      if (Opcao > -1) then
        sSQL := sSQL +
          'AND   (NVL(F.INDAPLICACAO,0) = ' +IntToStr(Opcao)+ ')'+CR_LF;
    end;
    
    sSQL := sSQL +
      'ORDER BY' +CR_LF+
      '  UPPER(F.DESCRICAO)';
  end;
  Result := GetDataPacket(sSQL);
end;

function TCtrlFatorAvalCurso.GravarFatorAvalCurso: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFatorAvalCurso(FCdsFatorAvalCurso.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsFatorAvalCurso, FDbFatorAvalCurso, [], []);
      if not(Result) then
        raise Exception.Create(FDbFatorAvalCurso.MessageInfo);

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
