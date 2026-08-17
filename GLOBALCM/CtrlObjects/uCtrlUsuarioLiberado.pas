{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlUsuarioLiberado;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbUsuarioLiberado;

Type
  TCtrlUsuarioLiberado = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbUsuarioLiberado: TDbUsuarioLiberado;
    FcdsDet: TClientDataSet;
    procedure SetcdsDet(const Value: TClientDataSet);

  Public
    Property cdsDet: TClientDataSet read FcdsDet write SetcdsDet;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de Negócio
    //------------------------------------//
    function ListaFuncionario(idUsuario: Double = 0): OleVariant;
    function ListaUsuarioLiberado(idUsuario: Double = 0): OleVariant;
    function Gravar: Boolean;

  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlUsuarioLiberado.Create;
begin
  inherited;
  _DbUsuarioLiberado := TDbUsuarioLiberado.Create(Self);

  FCdsDet := TClientDataSet.Create(nil);
end;

destructor TCtrlUsuarioLiberado.Destroy;
begin
  with FcdsDet do
  begin
    if Active then
      Close;

    FcdsDet := nil;
    Free;
  end;

  _DbUsuarioLiberado.Free;

  inherited;
end;

procedure TCtrlUsuarioLiberado.SetcdsDet(const Value: TClientDataSet);
begin
  FcdsDet := Value;
end;

procedure TCtrlUsuarioLiberado.DoChangeDataBase;
begin
  inherited;

  _DbUsuarioLiberado.DataBaseName := DatabaseName;
end;

function TCtrlUsuarioLiberado.ListaFuncionario(idUsuario: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT F.IDPESSOA, F.MATRICULA, P.NOME, US.NOMEUSUARIO, ' +
         '       SF.TIPOSIT, ' +
         '       DECODE(NVL(SF.TIPOSIT, ''A''), ''A'', ''Ativ'', ''F'', ''Afastad'', ''D'', ''Desligad'') ||  ' +
         '       DECODE(PF.SEXO, ''F'', ''a'', ''M'', ''o'') SITUACAO ' +
         '  FROM CM.FUNCIONARIO F ' +
         '  JOIN CM.PESSOA P ON P.IDPESSOA = F.IDPESSOA ' +
         '  JOIN CM.SITFUNC SF ON SF.IDSITFUNC = F.IDSITFUNC ' +
         '  JOIN CM.PESSOAFISICA PF ON PF.IDPESSOA = F.IDPESSOA ' +
         '  JOIN CM.USUARIOSISTEMA US ON US.IDUSUARIO = F.IDPESSOA ' +
         ' WHERE 1 = 1 ';

  if idUsuario <> 0 then
    Sql := Sql + ' AND F.IDPESSOA = ' + FloatToStr(idUsuario);

  Sql := Sql + ' ORDER BY F.MATRICULA ';

  Result := GetDataPacket(Sql);
end;

function TCtrlUsuarioLiberado.ListaUsuarioLiberado(idUsuario: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT TRIM(M.NOMEMODULO) NOMEMODULO, ' +
         '       TRIM(M.NOMEMODULO) || '' - '' || M.IDMODULO NOME_ID, ' +
         '       UL.* ' +
         '  FROM CM.USUARIOS_LIBERADOS UL ' +
         '  JOIN CM.FUNCIONARIO F ON UL.IDUSUARIO = F.IDPESSOA ' +
         '  JOIN CM.MODULO M ON M.IDMODULO = UL.IDMODULO ';

  if idUsuario <> 0 then
    Sql := Sql + ' AND F.IDPESSOA =  ' + FloatToStr(idUsuario);

  Sql := Sql + ' ORDER BY F.MATRICULA, M.NOMEMODULO ';

  Result := GetDataPacket(Sql);
end;

function TCtrlUsuarioLiberado.Gravar: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Gravar(FcdsDet.Data);

    if Not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
        StartTransaction;
        
      Result := ApplyCds(fcdsDet, _DbUsuarioLiberado, [], []);

      if Not Result then
        Raise Exception.Create(_DbUsuarioLiberado.MessageInfo);

      Commit;
    except
      on E:Exception do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


end.

