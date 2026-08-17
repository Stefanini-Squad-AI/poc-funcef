{-------------------------------------------------------------------------------
------------------------ HIST”RICO DE ALTERA«’ES -------------------------------
--------------------------------------------------------------------------------
 N∫ SIG......: 43337
 Data........: 10/03/2022
 Respons·vel.: Everson Cunha
 DescriÁ„o...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlCertificado;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbCertificado, uDbCertificadoPessoa;

Type
  TCtrlCertificado = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;

  private
    Fcds: TClientDataSet;
    FcdsDet: TClientDataSet;

    _DbCertificado: TDbCertificado;
    _DbCertificadoPessoa: TDbCertificadoPessoa;

    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsDet(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsDet: TClientDataSet read FcdsDet write SetcdsDet;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de NegÛcio
    //------------------------------------//
    function ListaCertificado(idCertificado: Double = 0): OleVariant;
    function ListaCertificado_Pessoa(idCertificado: Double = 0): OleVariant;
    function VerificaDuplicado(idCertificado, DescricaoCertificado: String): OleVariant;
    function Gravar_Certificado: Boolean;
    function Gravar_Certificado_Pessoa: Boolean;

  end;

implementation

Uses uCmTypes;

constructor TCtrlCertificado.Create;
begin
  inherited;
  FCds           := TClientDataSet.Create(nil);
  FCdsDet        := TClientDataSet.Create(nil);

  _DbCertificado       := TDbCertificado.Create(Self);
  _DbCertificadoPessoa := TDbCertificadoPessoa.Create(Self);
end;

destructor TCtrlCertificado.Destroy;
begin
  if Fcds.Active then
    Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  if FcdsDet.Active then
    FcdsDet.Close;

  FcdsDet := nil;
  FcdsDet.Free;

  _DbCertificado.Free;
  _DbCertificadoPessoa.Free;

  inherited;
end;

procedure TCtrlCertificado.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlCertificado.SetcdsDet(const Value: TClientDataSet);
begin
  FcdsDet := Value;
end;

procedure TCtrlCertificado.DoChangeDataBase;
begin
  inherited;
  _DbCertificado.DataBaseName       := DatabaseName;
  _DbCertificadoPessoa.DataBaseName := DatabaseName;
end;

function TCtrlCertificado.ListaCertificado(idCertificado: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT * ' +
         '  FROM CM.CERTIFICADO ';

  if idCertificado <> 0 then
    Sql := Sql + ' WHERE IDCERTIFICADO = ' + FloatToStr(idCertificado);

  Sql := Sql + ' ORDER BY DESCRICAO ';

  Result := GetDataPacket(Sql);
end;

function TCtrlCertificado.ListaCertificado_Pessoa(
  idCertificado: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT P.IDPESSOA, F.MATRICULA, F.DATAADMISSAO, P.NOME, CA.TITULO, CC.NOME AREA, ' +
         '       DECODE(NVL(CP.FLGHABILITACAO, ''N''), ''N'', ''N„o'', ''S'', ''Sim'') DESC_EXIGE_HABILITACAO, ' +
	       '       DECODE(NVL(CP.STATUS_HABILITACAO, -1), -1, ''N/A'', 0, ''Sem HabilitaÁ„o'', 1, ''Habilitado'') DESC_STATUS_HABILITACAO, ' +
         '       CP.* ' +
         '  FROM CM.CERTIFICADO C ' +
         '  JOIN CM.CERTIFICADO_PESSOA CP ON CP.IDCERTIFICADO = C.IDCERTIFICADO ' +
         '  JOIN CM.PESSOA P ON P.IDPESSOA = CP.IDPESSOA ' +
         '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = P.IDPESSOA ' +
         '  JOIN CM.CARGO CA ON CA.IDCARGO = NVL(F.IDFUNCAO, F.IDCARGO) ' +
         '  JOIN CM.CENTCUST CC ON CC.CODCENTROCUSTO = F.CODCENTROCUSTO ';

  if idCertificado <> 0 then
    Sql := Sql + ' WHERE C.IDCERTIFICADO = ' + FloatToStr(idCertificado);

  Sql := Sql + ' ORDER BY C.DESCRICAO, P.NOME, CP.DT_VALIDADE ';

  Result := GetDataPacket(Sql);
end;

function TCtrlCertificado.VerificaDuplicado(idCertificado, DescricaoCertificado: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  with oCds do
  try
    Sql := 'SELECT 1 ' +
           '  FROM CM.CERTIFICADO ' +
           ' WHERE UPPER(TRANSLATE(TRIM(DESCRICAO) ,''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) = ' + QuotedStr(trim(UpperCase(DescricaoCertificado)));

    if idCertificado <> '' then
      Sql := Sql + ' AND IDCERTIFICADO <> ' + (idCertificado);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlCertificado.Gravar_Certificado: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarCertificado(Fcds.Data);

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(Fcds, _DbCertificado, [], []);
      Msg    := _DbCertificado.MessageInfo;

      if not Result then
        raise Exception.Create(Msg);

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

function TCtrlCertificado.Gravar_Certificado_Pessoa: Boolean;
Var
  Msg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarCertificadoPessoa(FcdsDet.Data);

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FcdsDet, _DbCertificadoPessoa, [], []);
      Msg    := _DbCertificadoPessoa.MessageInfo;

      if not Result then
        raise Exception.Create(Msg);

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

