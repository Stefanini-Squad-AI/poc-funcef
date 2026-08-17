{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/04/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlTabLonga;

interface

uses SysUtils, uSistema, Db, dbclient, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbLongTabGener, uDbLongValTabGener, uDbLongCmpTabGener;

type
  TCtrlTabLonga = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbLongTabGener: TDbLongTabGener;
    FDbLongValTabGener: TDbLongValTabGener;
    FDbLongCmpTabGener: TDbLongCmpTabGener;

    FCdsLongTabGener: TCMClientDataSet;
    FCdsLongValTabGener: TCMClientDataSet;
    FCdsLongCmpTabGener: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function CopiarTabLonga: boolean;

    function GravarTabGener(ovLongTabGener, ovLongCmpTabGener, ovLongValTabGener: OleVariant): boolean;
    function ExcluirTabGener: boolean;

    function ListLongTabGener(IdTabela: double = 0): OleVariant;
    function ListLongValTabGener(IdTabela: double): OleVariant;
    function ListLongCampoTabGener(IdTabela: double): OleVariant;
    function GetProxNumLinhaLongValTabGener(IdTabela: double): integer;

    property CdsLongTabGener: TCMClientDataSet read FCdsLongTabGener write FCdsLongTabGener;
    property CdsLongValTabGener: TCMClientDataSet read FCdsLongValTabGener write FCdsLongValTabGener;
    property CdsLongCmpTabGener: TCMClientDataSet read FCdsLongCmpTabGener write FCdsLongCmpTabGener;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTabLonga }

constructor TCtrlTabLonga.Create;
begin
  inherited;
  FDbLongTabGener := TDbLongTabGener.Create(Self);
  FDbLongValTabGener := TDbLongValTabGener.Create(Self);
  FDbLongCmpTabGener := TDbLongCmpTabGener.Create(Self);
end;

destructor TCtrlTabLonga.Destroy;
begin
  FDbLongValTabGener.Free;
  FDbLongTabGener.Free;
  FDbLongCmpTabGener.Free;
  if (IsAppServer) then
  begin
    FCdsLongTabGener.Free;
    FCdsLongValTabGener.Free;
    FCdsLongCmpTabGener.Free;
  end;
  inherited;
end;

procedure TCtrlTabLonga.OnCreateAppServer;
begin
  inherited;
  FCdsLongTabGener := TCMClientDataSet.Create(nil);
  FCdsLongValTabGener := TCMClientDataSet.Create(nil);
  FCdsLongCmpTabGener := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTabLonga.DoChangeDataBase;
begin
  inherited;
  FDbLongTabGener.DataBaseName := DataBaseName;
  FDbLongValTabGener.DataBaseName := DataBaseName;
  FDbLongCmpTabGener.DataBaseName := DataBaseName;
end;

function TCtrlTabLonga.ListLongTabGener(IdTabela: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTabela=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDTABELA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  LONGTABGENER'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTABELA = ' +FloatToStr(IdTabela)+ ')');
end;

function TCtrlTabLonga.ListLongValTabGener(IdTabela: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTABELA, NUMLINHA,'+CR_LF+
    '  C1, C2, C3, C4, C5, C6, C7, C8, C9, C10,'+CR_LF+
    '  C11, C12, C13, C14, C15, C16, C17, C18, C19, C20,'+CR_LF+
    '  C21, C22, C23, C24, C25, C26, C27, C28, C29, C30,'+CR_LF+
    '  C31, C32, C33, C34, C35, C36, C37, C38, C39, C40,'+CR_LF+
    '  C41, C42, C43, C44, C45, C46, C47, C48, C49, C50,'+CR_LF+
    '  C51, C52, C53, C54, C55, C56, C57, C58, C59, C60,'+CR_LF+
    '  C61, C62, C63, C64, C65, C66, C67, C68, C69, C70,'+CR_LF+
    '  C71, C72, C73, C74, C75, C76, C77, C78, C79, C80,'+CR_LF+
    '  C81, C82, C83, C84, C85, C86, C87, C88, C89, C90,'+CR_LF+
    '  C91, C92, C93, C94, C95, C96, C97, C98, C99, C100'+CR_LF+
    'FROM'+CR_LF+
    '  LONGVALTABGENER'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTABELA = ' +FloatToStr(IdTabela)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NUMLINHA');
end;

function TCtrlTabLonga.ListLongCampoTabGener(IdTabela: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTabela=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDTABELA, IDCAMPO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  LONGCMPTABGENER'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTABELA = ' +FloatToStr(IdTabela)+ ') AND'+CR_LF+
    '  (IDTABELA > 0)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  IDTABELA, IDCAMPO');
end;

function TCtrlTabLonga.GetProxNumLinhaLongValTabGener(IdTabela: double): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  NVL(MAX(NUMLINHA),0)+1 AS PROXREG'+CR_LF+
    'FROM'+CR_LF+
    '  LONGVALTABGENER'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTABELA = ' +FloatToStr(IdTabela)+ ')');

  Result := _Cds.FieldByName('PROXREG').asInteger;
end;

function TCtrlTabLonga.CopiarTabLonga: boolean;
var
  _Cds, _CdsCmp, _CdsValor: TCMClientDataSet;
begin
  Result := true;
  try
    _Cds := TCMClientDataSet.Create(nil);
    _CdsCmp := TCMClientDataSet.Create(nil);
    _CdsValor := TCMClientDataSet.Create(nil);
    try
      FCdsLongTabGener.DisableControls;
      FCdsLongCmpTabGener.DisableControls;
      FCdsLongValTabGener.DisableControls;

      _Cds.Data := FCdsLongTabGener.Data;
      _CdsCmp.Data := FCdsLongCmpTabGener.Data;
      _CdsValor.Data := FCdsLongValTabGener.Data;

      if not(AssociarDadosCds(FCdsLongTabGener, _Cds)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbLongTabGener.TableName);
      if not(AssociarDadosCds(FCdsLongCmpTabGener, _CdsCmp)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbLongCmpTabGener.TableName);
      if not(AssociarDadosCds(FCdsLongValTabGener, _CdsValor)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbLongValTabGener.TableName);

      if (GravarTabGener(_Cds.Data, _CdsCmp.Data, _CdsValor.Data)) then
        MessageInfo := 'Replicação Concluída com sucesso.'
      else
        raise Exception.Create(MessageInfo);

      FCdsLongTabGener.EnableControls;
      FCdsLongCmpTabGener.EnableControls;
      FCdsLongValTabGener.EnableControls;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(_Cds);
    FreeAndNil(_CdsCmp);
    FreeAndNil(_CdsValor);
  end;
end;

function TCtrlTabLonga.GravarTabGener(ovLongTabGener, ovLongCmpTabGener,
  ovLongValTabGener: OleVariant): boolean;
var
  _Cds, _CdsCmp, _CdsValor: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTabGener(FCdsLongTabGener.Data,
      FCdsLongValTabGener.Data, FCdsLongCmpTabGener.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      _Cds := TCMClientDataSet.Create(nil);
      _CdsCmp := TCMClientDataSet.Create(nil);
      _CdsValor := TCMClientDataSet.Create(nil);

      _Cds.Data := ovLongTabGener;
      _CdsCmp.Data := ovLongCmpTabGener;
      _CdsValor.Data := ovLongValTabGener;
      try
        StartTransaction;

        Result := ApplyCds(_Cds, FDbLongTabGener, [], []);
        if (Result) then
        begin
          Result := ApplyCds(_CdsCmp, FDbLongCmpTabGener,
            [FDbLongTabGener.IdTabela], [FDbLongCmpTabGener.IdTabela]);
          if (Result) then
          begin
            Result := ApplyCds(_CdsValor, FDbLongValTabGener,
              [FDbLongTabGener.IdTabela], [FDbLongValTabGener.IdTabela]);
            if not(Result) then
              raise Exception.Create(FDbLongValTabGener.MessageInfo);
          end
          else
            raise Exception.Create(FDbLongCmpTabGener.MessageInfo);
        end
        else
          raise Exception.Create(FDbLongTabGener.MessageInfo);

        Commit;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil(_Cds);
      FreeAndNil(_CdsCmp);
      FreeAndNil(_CdsValor);
    end;
  end;
end;

function TCtrlTabLonga.ExcluirTabGener: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirTabGener(FCdsLongTabGener.Data,
      FCdsLongValTabGener.Data, FCdsLongCmpTabGener.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsLongCmpTabGener.First;
      while not(FCdsLongCmpTabGener.EOF) do
        FCdsLongCmpTabGener.Delete;

      FCdsLongValTabGener.First;
      while not(FCdsLongValTabGener.EOF) do
        FCdsLongValTabGener.Delete;

      FCdsLongTabGener.Delete;

      StartTransaction;

      Result := ApplyCds(FCdsLongValTabGener, FDbLongValTabGener, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsLongCmpTabGener, FDbLongCmpTabGener, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCdsLongTabGener, FDbLongTabGener, [], []);
          if not(Result) then
            raise Exception.Create(FDbLongTabGener.MessageInfo);
        end
        else
          raise Exception.Create(FDbLongCmpTabGener.MessageInfo);
      end
      else
        raise Exception.Create(FDbLongValTabGener.MessageInfo);

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
