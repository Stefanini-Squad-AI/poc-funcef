{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraBem;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraEpi, uDbPpraClasseBem, uDbClassedeBem, uDbBem, uDbConjunto, uDbGrupo;

type
  TCtrlPpraBem = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb:  TDbBem;
    FDb1: TDbPpraEpi;

    FDb2: TDbClassedeBem;
    FDb3: TDbPpraClasseBem;

    FDb4: TDbConjunto;
    FDb5: TDbGrupo;

    FCds:  TCMClientDataSet;
    FCds1: TCMClientDataSet;
    FCds2: TCMClientDataSet;
    FCds3: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListBem(IdEmpresa, IdBem, IdClasseBem: double): OleVariant;
    function ListEpi(IdBem: double = 0): OleVariant;
    function ListClasseBem(IdPpraClasseBem: double): OleVariant;
    function ListPpraClasseBem(IdPpraClasseBem: double): OleVariant;
    function ListGrupo(IdGrupo: double): OleVariant;
    function ListConjunto(IdConjunto: double): OleVariant;
    function GravarBem: boolean;
    function ExcluirBem: boolean;
    function GravarClasseBem: boolean;
    function ExcluirClasseBem: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property Cds1: TCMClientDataSet read FCds1 write FCds1;
    property Cds2: TCMClientDataSet read FCds2 write FCds2;
    property Cds3: TCMClientDataSet read FCds3 write FCds3;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraBem }

constructor TCtrlPpraBem.Create;
begin
  inherited;
  FDb  := TDbBem.Create(Self);
  FDb1 := TDbPpraEpi.Create(Self);

  FDb2 := TDbClassedeBem.Create(Self);
  FDb3 := TDbPpraClasseBem.Create(Self);

  FDb4 := TDbConjunto.Create(Self);
  FDb5 := TDbGrupo.Create(Self);
end;

destructor TCtrlPpraBem.Destroy;
begin
  FDb1.Free;
  FDb2.Free;
  FDb3.Free;
  FDb4.Free;
  FDb5.Free;
  FDb.Free;
  if isAppServer then
  begin
    FCds.Free;
    FCds1.Free;
    FCds2.Free;
    FCds3.Free;
  end;
  inherited;
end;

procedure TCtrlPpraBem.OnCreateAppServer;
begin
  inherited;
  FCds  := TCMClientDataSet.Create(nil);
  FCds1 := TCMClientDataSet.Create(nil);
  FCds2 := TCMClientDataSet.Create(nil);
  FCds3 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraBem.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDb1.DataBaseName := DataBaseName;
  FDb2.DataBaseName := DataBaseName;
  FDb3.DataBaseName := DataBaseName;
  FDb4.DataBaseName := DataBaseName;
  FDb5.DataBaseName := DataBaseName;
end;

function TCtrlPpraBem.ListBem(IdEmpresa, IdBem, IdClasseBem: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdBem = -1) then
    sSQL := '  (1 = 2)'
  else
  begin
    if (IdEmpresa > 0) then
      sSQL := '  (IDEMPRESA = ' +FloatToStr(IdEmpresa)+ ')';
       
    if (IdBem > 0) then
    begin
      if (sSQL <> '') then
        sSQL := sSQL + ' AND'+CR_LF;
      sSQL := '  (IDBEM = ' +FloatToStr(IdBem)+ ')';
    end;

    if (IdClasseBem > 0) then
    begin
      if (sSQL <> '') then
        sSQL := sSQL + ' AND'+CR_LF;
      sSQL := '  (IDCLASSEBEM = ' +FloatToStr(IdClasseBem)+ ')';
    end
    else
    if (IdBem = 0) then
      sSQL := '  (1 = 1)';
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(IdClasseBem=0,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDBEM, IDPESSOA, IDMODULO, IDCONJUNTO, IDGRUPO,'+CR_LF+
    '  REGISTRO, DESBEM, PLACA, IDCLASSEBEM, CONTROLE'+CR_LF+
    'FROM'+CR_LF+
    '  BEM'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(DESBEM)');
end;

function TCtrlPpraBem.ListEpi(IdBem: double = 0): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +IFF(IdBem=0,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  PP.IDBEM, PP.IDPESSOA, PP.IDPPRAEPI, PP.IDFUNC,'+CR_LF+
    '  PP.DATAENTREGA, PP.DATARETORNO, PF.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, PPRAEPI PP'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdBem=0, '', '  (PP.IDBEM  = ' +FloatToStr(IdBem)+ ') AND'+CR_LF)+
    '  (PP.IDFUNC = PF.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PP.DATAENTREGA DESC');
end;

function TCtrlPpraBem.ListClasseBem(IdPpraClasseBem: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CB.IDCLASSEBEM, CB.CODHIERARQ, CB.ANASINT, CB.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CLASSEDEBEM CB'+CR_LF+
    IFF(IdPpraClasseBem=0, '', 'WHERE'+CR_LF+
      '  (CB.IDCLASSEBEM = '+FloatToStr(IdPpraClasseBem) +')'+ CR_LF)+
    'ORDER BY'+CR_LF+
    '  UPPER(CB.DESCRICAO)');
end;

function TCtrlPpraBem.ListPpraClasseBem(IdPpraClasseBem: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CP.IDCLASSEBEM, CP.INDEQUIPROT, CB.DESCRICAO,'+CR_LF+
    '  DECODE(CP.INDEQUIPROT,''I'',' +QuotedStr(CMTranslate('Individual'))+ ',' +QuotedStr(CMTranslate('Coletivo'))+ ') AS EQUIPROT'+CR_LF+
    'FROM'+CR_LF+
    '  CLASSEDEBEM CB, PPRACLASSEBEM CP'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdPpraClasseBem=-1, '  (1 = 2) AND',
      IFF(IdPpraClasseBem=0, '  (1 = 1) AND',
        '  (CP.IDCLASSEBEM = ' +FloatToStr(IdPpraClasseBem)+ ') AND'))+CR_LF+
    '  (CP.IDCLASSEBEM = CB.IDCLASSEBEM)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlPpraBem.ListGrupo(IdGrupo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDGRUPO, NOME, TIPO, STATUS, CLASSE'+CR_LF+
    'FROM'+CR_LF+
    '  GRUPO '+CR_LF+
    IFF(IdGrupo=0, '', 'WHERE'+CR_LF+
      '  (IDGRUPO = '+FloatToStr(IdGrupo)+')'+CR_LF)+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlPpraBem.ListConjunto(IdConjunto: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCONJUNTO, IDPESSOA, IDLOCALIZACAO, DESCCONJUNTO'+CR_LF+
    'FROM'+CR_LF+
    '  CONJUNTO'+CR_LF+
    IFF(IdConjunto=0, '', 'WHERE'+CR_LF+
      '  (IDCONJUNTO = '+FloatToStr(IdConjunto)+')'+CR_LF)+
    'ORDER BY' +CR_LF+
    '  UPPER(DESCCONJUNTO)');
end;

function TCtrlPpraBem.GravarBem: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarBem(FCds.Data, FCds1.Data);
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
        Result := ApplyCds(FCds1, FDb1, [FDb.IdBem], [FDb1.IdBem]);
        if not(Result) then
          raise Exception.Create(FDb1.MessageInfo);
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

function TCtrlPpraBem.ExcluirBem: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirBem(FCds.Data, FCds1.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCds1.First;
      while not(FCds1.EOF) do
        FCds1.Delete;

      StartTransaction;

      Result := ApplyCds(FCds1, FDb1, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          raise Exception.Create(FDb.MessageInfo);
      end
      else
        raise Exception.Create(FDb1.MessageInfo);

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

function TCtrlPpraBem.GravarClasseBem: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarClasseBem(FCds2.Data, FCds3.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds2, FDb2, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds3, FDb3, [FDb2.IdClasseBem], [FDb3.IdClasseBem]);
        if not(Result) then
            raise Exception.Create(FDb1.MessageInfo);
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

function TCtrlPpraBem.ExcluirClasseBem: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirClasseBem(FCds2.Data, FCds3.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCds3.First;
      while not(FCds3.EOF) do
        FCds3.Delete;

      StartTransaction;

      Result := ApplyCds(FCds3, FDb3, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds2, FDb2, [], []);
        if not(Result) then
          raise Exception.Create(FDb.MessageInfo);
      end
      else
        raise Exception.Create(FDb1.MessageInfo);

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
