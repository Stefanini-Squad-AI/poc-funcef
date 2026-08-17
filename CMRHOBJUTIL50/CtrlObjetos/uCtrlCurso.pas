{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCurso;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbCurso, uDbCursoxAvalDes, uDbCursoxFatorAval;

type
  TCtrlCurso = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCurso;
    FCds: TCMClientDataSet;
    FDbDet: TDbCursoxAvalDes;
    FCdsDet: TCMClientDataSet;
    FDbDet2: TDbCursoxFatorAval;
    FCdsDet2: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdCurso: double = 0): OleVariant;
    function ListGrupoTr: OleVariant;
    function ListPacote: OleVariant;
    function ListTipCurso: OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;    

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
    property CdsDet2: TCMClientDataSet read FCdsDet2 write FCdsDet2;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCurso }

constructor TCtrlCurso.Create;
begin
  inherited;
  FDb := TDbCurso.Create(Self);
  FDbDet := TDbCursoxAvalDes.Create(Self);
  FDbDet2 := TDbCursoxFatorAval.Create(Self);
end;

destructor TCtrlCurso.Destroy;
begin
  FDbDet2.Free;
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsDet.Free;
    FCdsDet2.Free;
  end;
  inherited;
end;

procedure TCtrlCurso.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
  FCdsDet2 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCurso.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
  FDbDet2.DataBaseName := DataBaseName;
end;

function TCtrlCurso.ListGeral(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDCURSO, DESCRICAO, ABREV, DUR_TEOR, DUR_PRAT, CODGRPTREIN,'+CR_LF+
    '  AVALPRAT, AVALIACAO, VALOR, OBSERVACAO, TEMAVPR, TEMAVAL,'+CR_LF+
    '  IDTIPOCURSO, IDPACOTE, IDENTIDINSTR, OBSERVACAO2'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO'+CR_LF+
    IFF(IdCurso=-1, 'WHERE (1 = 2)',
      IFF(IdCurso=0, 'ORDER BY DESCRICAO', 'WHERE'+CR_LF+
        '  (IDCURSO = ' +FloatToStr(IdCurso)+ ')')));
end;

function TCtrlCurso.ListGrupoTr: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRPTREIN, DESCGRPTREIN'+CR_LF+
    'FROM'+CR_LF+
    '  GRPTREIN'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCGRPTREIN');
end;

function TCtrlCurso.ListPacote: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPACOTE, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PACOTE'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlCurso.ListTipCurso: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPOCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPCURSO'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlCurso.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCurso(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
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
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.IdCurso], [FDbDet.IdCurso]);
        if (Result) then
        begin
          Result := ApplyCds(FCdsDet2, FDbDet2, [FDb.IdCurso], [FDbDet2.IdCurso]);
          if not(Result) then
            raise Exception.Create(FDbDet2.MessageInfo);
        end
        else
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

function TCtrlCurso.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirCurso(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsDet2.First;
      while not(FCdsDet2.EOF) do
        FCdsDet2.Delete;

      Result := ApplyCds(FCdsDet2, FDbDet2, [], []);
      if (Result) then
      begin
        FCdsDet.First;
        while not(FCdsDet.EOF) do
          FCdsDet.Delete;

        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCds, FDb, [], []);
          if not(Result) then
            MessageInfo := FDb.MessageInfo;
        end
        else
          MessageInfo := FDbDet.MessageInfo;
      end
      else
        MessageInfo := FDbDet2.MessageInfo;

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
