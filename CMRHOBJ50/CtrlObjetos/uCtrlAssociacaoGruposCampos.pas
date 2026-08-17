{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAssociacaoGruposCampos;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbCmpBdGrp;

type
  TCtrlAssociacaoGruposCampos = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCmpBdGrp;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGrupos: OleVariant;
    function ListCamposSel(CodGrupoArquivo: string): OleVariant;
    function ListCamposDisp(CodGrupoArquivo: string): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAssociacaoGruposCampos }

constructor TCtrlAssociacaoGruposCampos.Create;
begin
  inherited;
  FDb := TDbCmpBdGrp.Create(Self);
end;

destructor TCtrlAssociacaoGruposCampos.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlAssociacaoGruposCampos.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAssociacaoGruposCampos.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlAssociacaoGruposCampos.ListGrupos: OleVariant;
begin
  Result := GetDataPacket('SELECT CODGRUPOARQUIVO, DESCGRUPOARQUIVO FROM GRPARQUIVO');
end;

function TCtrlAssociacaoGruposCampos.ListCamposSel(CodGrupoArquivo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  G.CODGRUPOARQUIVO, C.IDCAMPO, C.DESCRICAODOCAMPO,'+CR_LF+
    '  (C.IDCAMPO || '' - '' || C.DESCRICAODOCAMPO) AS DESCR'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBDGRP G, CMPBD C'+CR_LF+
    'WHERE'+CR_LF+
    '  (G.CODGRUPOARQUIVO = '+QuotedStr(CodGrupoArquivo)+') AND'+CR_LF+
    '  (G.IDCAMPO         = C.IDCAMPO)');
end;

function TCtrlAssociacaoGruposCampos.ListCamposDisp(CodGrupoArquivo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCAMPO, DESCRICAODOCAMPO, ENTIDADE AS TABELA, NOMEDOCAMPO AS CAMPO,'+CR_LF+
    '  IDCAMPO || '' - '' || DESCRICAODOCAMPO AS DESCR'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBD'+CR_LF+
    'WHERE'+CR_LF+
    '  (CAMPODOBANCO > 0) AND'+CR_LF+
    '  (IDCAMPO NOT IN (SELECT'+CR_LF+
    '                       C.IDCAMPO'+CR_LF+
    '                     FROM'+CR_LF+
    '                       CMPBDGRP G, CMPBD C'+CR_LF+
    '                     WHERE'+CR_LF+
    '                       (G.CODGRUPOARQUIVO = '+QuotedStr(CodGrupoArquivo)+') AND'+CR_LF+
    '                       (G.IDCAMPO         = C.IDCAMPO)))');
end;

function TCtrlAssociacaoGruposCampos.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
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
