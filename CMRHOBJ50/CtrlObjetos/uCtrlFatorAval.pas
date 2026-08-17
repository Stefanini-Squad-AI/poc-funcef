{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFatorAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbFatorAval;

type
  TCtrlFatorAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbFatorAval;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListFatorAval(IdFatorAval: double = 0; ListaIndFatorAval: string = '';
      IdGrupoFatorAval: double = 0): OleVariant;

    function ListFatorAvalFiltrado(IdFatorAval: double; ListaIndFatorAval, IdGrupo: string): OleVariant;

    function GravarFatorAval: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFatorAval }

constructor TCtrlFatorAval.Create;
begin
  inherited;
  FDb := TDbFatorAval.Create(Self);
end;

destructor TCtrlFatorAval.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlFatorAval.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFatorAval.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlFatorAval.ListFatorAval(IdFatorAval: double; ListaIndFatorAval: string;
  IdGrupoFatorAval: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdFatorAval = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  FATORAVAL'+CR_LF;

  if (IdFatorAval = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  begin
    if (IdFatorAval > 0) then
      sSQL := sSQL +
        'WHERE'+CR_LF+
        '  (IDFATORAVAL = '+FloatToStr(IdFatorAval)+')';

    if (IdGrupoFatorAval > 0) then
      sSQL := sSQL +
        IFF(IdFatorAval = 0, 'WHERE', 'AND')+CR_LF+
        '  (IDGRUPOFATORAVAL = ' +FloatToStr(IdGrupoFatorAval)+ ')';

    if (ListaIndFatorAval <> '') then
      sSQL := sSQL +
        IFF(IdFatorAval = 0, 'WHERE', 'AND')+CR_LF+
        IFF(Pos(',', ListaIndFatorAval) > 0,
          '  (INDFATORAVAL IN (' +ListaIndFatorAval+ '))',
          '  (INDFATORAVAL = ' +ListaIndFatorAval+ ')');

    if (IdFatorAval = 0) then
      sSQL := sSQL +
        'ORDER BY'+CR_LF+
        '  DESCRFATORAVAL';
  end;

  Result := GetDataPacket(sSQL);
end;

function TCtrlFatorAval.ListFatorAvalFiltrado(IdFatorAval: double; ListaIndFatorAval, IdGrupo: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdFatorAval = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  F.*'+CR_LF+
    'FROM'+CR_LF+
    '  FATORAVAL F, PESOFATGRP P'+CR_LF;

  if (IdFatorAval = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  begin
    if (IdFatorAval > 0) then
      sSQL := sSQL +
        'WHERE'+CR_LF+
        '  (F.IDFATORAVAL = '+FloatToStr(IdFatorAval)+')';

    if (ListaIndFatorAval <> '') then
      sSQL := sSQL +
        IFF(IdFatorAval = 0, 'WHERE', 'AND')+CR_LF+
        IFF(Pos(',', ListaIndFatorAval) > 0,
          '  (F.INDFATORAVAL IN (' +ListaIndFatorAval+ '))',
          '  (F.INDFATORAVAL = ' +ListaIndFatorAval+ ')');

    sSQL := sSQL + 'AND (F.IDFATORAVAL = P.IDFATORAVAL)';
    sSQL := sSQL + 'AND (P.CODGRPFUNC = ' +QuotedStr(IdGrupo)+ ')';

    if (IdFatorAval = 0) then
      sSQL := sSQL +
        'ORDER BY'+CR_LF+
        '  F.DESCRFATORAVAL';
  end;

  Result := GetDataPacket(sSQL);
end;

function TCtrlFatorAval.GravarFatorAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFatorAval(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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
