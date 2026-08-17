{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
 Nº Solicitação...: WO 11765
 Data da Alteração: 25/06/2024
 Responsável......: Everson Cunha
 Descrição........: Inclusão do ETL para processamento da Folha de Rescisão
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Nº SOL            : 250391.17474
 Nº PPM            : 959204
 Data da Alteração : 28/04/2016
 Alteração Form    : Mudança no leiaute e novos campos
 Responsável       : Michelle Suellyn Mota
 Descrição         : Alterações de leiaute e novos campos para atender o eSocial
			               Criação de nova consulta para alimentar a lista de motivos.
--------------------------------------------------------------------------------
 Nº SOL            : 250384.17324
 Nº PPM            : 1070235
 Data da Alteração : 12/02/2016
 Alteração Form    : Leiaute e campos novos
 Responsável       : Michelle Suellyn Mota
 Descrição         : Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
 Nº SOL............: 229881.16648
 Nº PPM............: 565999
 Data da Alteração.: 20/02/2015
 Responsável.......: William Santana
 Descrição.........: Desenvolvimento do produto referente ao SOL 229881.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlMotivo;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbMotivo;

type
  TCtrlMotivo = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbMotivo;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdMotivo: integer = 0; IdMovContrCAGED: integer = 0;
      GrupoMotivo: string = ''; FlgTipo: string = ''): OleVariant;
    function ListMotivo_Id_e_Descricao(ListaGrupoMotivo: string = '';
      ListaFlgTipo: string = ''): OleVariant;

    function Gravar: boolean;

    function ListMotivo_MODASM: OleVariant; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235 e 250391.17474  PPM 959204

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlMotivo }

constructor TCtrlMotivo.Create;
begin
  inherited;
  FDb := TDbMotivo.Create(Self);
end;

destructor TCtrlMotivo.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlMotivo.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlMotivo.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlMotivo.ListGeral(IdMotivo, IdMovContrCAGED: integer; GrupoMotivo,
  FlgTipo: string): OleVariant;
var
  sSQL: string;
begin
  // Se qualquer um dos parâmetros for igual a (-1), não é para trazer registro algum
  if (IdMotivo = -1) or (IdMovContrCAGED = -1) or (GrupoMotivo = '-1') or (FlgTipo = '-1') then
    sSQL := 'WHERE (1 = 2)'
  else // Se não, faz as seleções cabíveis
  begin
    sSQL := '';
    if (IdMotivo <> 0) then
      sSQL := '  (IDMOTIVO = '+IntToStr(IdMotivo)+')'+CR_LF;

    if (IdMovContrCAGED <> 0) then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(IDMOVCONTRCAGED = '+IntToStr(IdMovContrCAGED)+')'+CR_LF;

    if (GrupoMotivo <> '') then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(GRUPOMOTIVO = '+QuotedStr(GrupoMotivo)+')'+CR_LF;

    if (FlgTipo <> '') then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(FLGTIPO = '+QuotedStr(FlgTipo)+')'+CR_LF;

    if (sSQL <> '') then
      sSQL := 'WHERE '+sSQL;

    sSQL := sSQL + 'ORDER BY' +CR_LF+ '  DESCRICAO';
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(sSQL='WHERE (1 = 2)',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    sSQL);
end;

function TCtrlMotivo.ListMotivo_Id_e_Descricao(ListaGrupoMotivo, ListaFlgTipo: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (ListaGrupoMotivo <> '') then
  begin
    sSQL := 'WHERE' +CR_LF+ '  (GRUPOMOTIVO ';
    if (Pos(',', ListaGrupoMotivo) > 0) then
      sSQL := sSQL + 'IN (' + QuotedListaString(ListaGrupoMotivo, ',') + '))'
    else
      sSQL := sSQL + '= ' + QuotedListaString(ListaGrupoMotivo, ',') + ')';
  end;

  if (ListaFlgTipo <> '') then
  begin
    if (sSQL = '') then
      sSQL := 'WHERE' +CR_LF+ '  (FLGTIPO '
    else
      sSQL := ' AND (FLGTIPO ';
    if (Pos(',', ListaFlgTipo) > 0) then
      sSQL := sSQL + 'IN (' + QuotedListaString(ListaFlgTipo, ',') + '))'
    else
      sSQL := sSQL + '= ' + QuotedListaString(ListaFlgTipo, ',') + ')';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
  //  '  IDMOTIVO, DESCRICAO'+CR_LF+                               //William Santana - SOL 229881.16648 PPM 565999
  //'  IDMOTIVO, DESCRICAO, CODIGOESOCIAL, TABELAESOCIAL '+CR_LF+    //William Santana - SOL 229881.16648 PPM 565999        //Everson Cunha - WO 11765
  '  IDMOTIVO, DESCRICAO, CODIGOESOCIAL, TABELAESOCIAL, FLG_ETL '+CR_LF+    //William Santana - SOL 229881.16648 PPM 565999 //Everson Cunha - WO 11765
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    sSQL+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
function TCtrlMotivo.ListMotivo_MODASM: OleVariant;
begin
  Result := GetDataPacket(
    //'SELECT IDMOTIVO, DESCRICAO '+CR_LF+  //Everson Cunha - SIG38475
    'SELECT * '+CR_LF+                      //Everson Cunha - SIG38475
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    'WHERE IDMODULO = 21 '+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

function TCtrlMotivo.Gravar: boolean;
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
