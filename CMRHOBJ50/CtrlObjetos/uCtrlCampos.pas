{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCampos;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbCmpBD,
  uDbCmpBdGrp;

type
  TCtrlCampos = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCmpBD;
    FDbDet: TDbCmpBdGrp;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(IdCampo: string): OleVariant;
    function ListDetalhe(IdCampo, CodGrupoArquivo: string): OleVariant;
    function ListGrupos: OleVariant;
    function ListTabelas: OleVariant;
    function ListCamposTabela(Tabela: string): OleVariant;

    function Gravar(CodGrupoArquivo: string = '-1'): boolean;
    function Excluir(IdCampo, CodGrupoArquivo: string): boolean;

    property Cds: TCMClientDataSet read FCds write FCds;    
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCampos }

constructor TCtrlCampos.Create;
begin
  inherited;
  FDb := TDbCmpBD.Create(Self);
  FDbDet := TDbCmpBdGrp.Create(Self);
end;

destructor TCtrlCampos.Destroy;
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

procedure TCtrlCampos.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);  
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCampos.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;  
  FDbDet.DatabaseName := DataBaseName;
end;

function TCtrlCampos.ListMestre(IdCampo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, APELIDO,'+CR_LF+
    '  CAMPODOBANCO, CHAVE, FLGOBRIGATORIO, IDTIPODADO'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBD'+CR_LF+
    'WHERE'+CR_LF+
    '  (CAMPODOBANCO > 0) AND (IDCAMPO = '+QuotedStr(IdCampo)+')');
end;

function TCtrlCampos.ListDetalhe(IdCampo, CodGrupoArquivo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRUPOARQUIVO, IDCAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBDGRP'+CR_LF+
    'WHERE'+CR_LF+    
    '  (IDCAMPO         = '+QuotedStr(IdCampo)+') AND'+CR_LF+
    '  (CODGRUPOARQUIVO = '+QuotedStr(CodGrupoArquivo)+')');
end;

function TCtrlCampos.ListGrupos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRUPOARQUIVO, DESCGRUPOARQUIVO AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  GRPARQUIVO');
end;

function TCtrlCampos.ListTabelas: OleVariant;
begin
  Result := GetDataPacket('SELECT TABLENAME FROM DDTABLE');
end;

function TCtrlCampos.ListCamposTabela(Tabela: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UPPER(F.FIELDNAME) AS FIELDNAME'+CR_LF+
    'FROM'+CR_LF+
    '  DDTABLE T, DDFIELD F'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.TABLENAME = '+QuotedStr(Tabela)+') AND'+CR_LF+
    '  (T.IDDDTABLE = F.IDDDTABLE)');
end;

function TCtrlCampos.Gravar(CodGrupoArquivo: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end                                       
  else
  begin
    try
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
      begin
        if not(FCdsDet.IsEmpty) then
          FCdsDet.Delete;

        FCdsDet.Insert;
        FCdsDet.FieldByName('IDCAMPO').asString := FCds.FieldByName('IDCAMPO').asString;
        FCdsDet.FieldByName('CODGRUPOARQUIVO').asString := CodGrupoArquivo;
        FCdsDet.Post;
        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if not(Result) then
          MessageInfo := FDb.MessageInfo;
      end
      else
        MessageInfo := FDbDet.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlCampos.Excluir(IdCampo, CodGrupoArquivo: string): boolean;
var
  _Cds: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(IdCampo, CodGrupoArquivo);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    
    _Cds := TCMClientDataSet.Create(nil);

    DoProgresso(['Verificando Integridade...']);

    _Cds.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDCAMPO, IDCAMPO2'+CR_LF+
      'FROM'+CR_LF+
      '  ALGREGRA'+CR_LF+
      'WHERE'+CR_LF+
      '  ((IDCAMPO = '+QuotedStr(IdCampo)+') OR'+CR_LF+
      '   (IDCAMPO2 = '+QuotedStr(IdCampo)+')) OR'+CR_LF+
      '  ((IDCAMPO = '+QuotedStr(IdCampo)+') AND'+CR_LF+
      '   (IDCAMPO2 = '+QuotedStr(IdCampo)+'))');

    if not(_Cds.IsEmpty) then
    begin
      DoProgresso(['Existe alguma chamada a este campo por alguma regra.']);
      exit;
    end;

    DoProgresso(['Apagando dados...']);

    try
      if not(FCdsDet.IsEmpty) then
        FCdsDet.Delete;

      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
      begin
        FCds.Delete;
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          MessageInfo := FDb.MessageInfo;
      end
      else
        MessageInfo := FDbDet.MessageInfo;

{      StartTransaction;
      Result := ExecSQL(
        'DELETE FROM CMPBDGRP'+CR_LF+
        'WHERE (IDCAMPO         = '+QuotedStr(IdCampo)+') AND'+CR_LF+
        '      (CODGRUPOARQUIVO = '+QuotedStr(CodGrupoArquivo)+')');

      if (Result) then
        Result := ExecSQL('DELETE FROM CMPBD WHERE (IDCAMPO = '+QuotedStr(IdCampo)+')');

      if (Result) then
        Commit;}
    except
      on E: Exception do
      begin
//        Rollback;
        MessageInfo := E.Message;
      end;
    end;

    _Cds.Free;
  end;
end;

end.
