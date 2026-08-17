unit uCtrlOutroEmpregado;
//***************************************************************************************
//Nº SIG...........: 20810
//Data da Alteração: 01/09/2016
//Responsável......: André Imakawa
//Descrição........: Alterar o campo Mês para "Vigência", com dia, mês e ano.
//                   Buscar dados do Cadastro de Favorecido para preencher "CNPJ" e ]
//                   "Nome Fantasia"
//***************************************************************************************
//Nº SOL...........: 250385/17479
//Nº PPM...........: 960979
//Data da Alteração: 22/07/2015
//Responsável......: Higor Nayde Ferreira
//Descrição........: Inclusão da Funcionalidade Transações -> Remuneração - Outro Empregador.
//***************************************************************************************
interface
uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbOutroEmpregado,uDbFuncionario, Wwquery;

type
  TCtrlOutroEmpregado = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbOutroEmpregado: TDbOutroEmpregado;
    FCdsOutroEmpregado: TCMClientDataSet;
    FDbFuncionario : TDbFuncionario;
    FCdsFuncionario : TCMClientDataSet;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function CarregaGrid(IdPessoa: String): OleVariant;
    function ListPessoa(IdPessoa: String): OleVariant;
    function Meses: OleVariant;
    function RetornaMascaraCPFCNPJ(pCPFCNPJ: String): String;
    
    property CdsOutroEmpregado: TCMClientDataSet read FCdsOutroEmpregado write FCdsOutroEmpregado;
    property CdsFuncionario : TCMClientDataSet read FCdsFuncionario write FCdsFuncionario;
end;
implementation
uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlOutroEmpregado }

function TCtrlOutroEmpregado.CarregaGrid(IdPessoa: String): OleVariant;
begin
  // Andre Imakawa - SIG 20810 - Inicio
  Result := GetDataPacket('SELECT R.IDREMUNOE,' + CR_LF +
                          '       R.IDPESSOA,' + CR_LF +
                          '       CAST(CASE LENGTH(REGEXP_REPLACE(P1.NUMDOCUMENTO, ''\D''))' + CR_LF +
                          '              WHEN 11 THEN' + CR_LF +
                          '               regexp_replace(REGEXP_REPLACE(P1.NUMDOCUMENTO, ''\D''),' + CR_LF +
                          '                              ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',' + CR_LF +
                          '                              ''\1.\2.\3-\4'')' + CR_LF +
                          '              WHEN 14 THEN' + CR_LF +
                          '               regexp_replace(REGEXP_REPLACE(P1.NUMDOCUMENTO, ''\D''),' + CR_LF +
                          '                              ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',' + CR_LF +
                          '                              ''\1.\2.\3/\4-\5'')' + CR_LF +
                          '              ELSE' + CR_LF +
                          '               REGEXP_REPLACE(P1.NUMDOCUMENTO, ''\D'')' + CR_LF +
                          '            END AS VARCHAR2(20)) CPF_CNPJ,' + CR_LF +
                          '       UPPER(P1.RAZAOSOCIAL) RAZAOSOCIAL,' + CR_LF +
                          '       VLREMUNOE,' + CR_LF +
                          '       CASE WHEN R.INICIOVIGENCIA IS NULL THEN '''' ELSE' + CR_LF +
                          '         TO_CHAR(R.INICIOVIGENCIA,''DD/MM/YYYY'') || '' a '' || TO_CHAR(R.FIMVIGENCIA,''DD/MM/YYYY'') END AS VIGENCIA,' + CR_LF +
                          '       R.INICIOVIGENCIA,' + CR_LF +
                          '       R.FIMVIGENCIA,' + CR_LF +
                          '       R.IDEMPRESA,' + CR_LF +
                          '       0 FLGATIVO' + CR_LF +
                          '  FROM REMUNOE R, PESSOA P1' + CR_LF +
                          ' WHERE P1.IDPESSOA (+)= R.IDEMPRESA' + CR_LF +
                          ' AND R.IDPESSOA = ' +(IdPessoa) + CR_LF +
                          ' ORDER BY R.INICIOVIGENCIA DESC ');
  // Andre Imakawa - SIG 20810 - Fim

end;

constructor TCtrlOutroEmpregado.Create;
begin
  inherited;
  FDbOutroEmpregado := TDbOutroEmpregado.Create(Self);
  FDbFuncionario := TDbFuncionario.Create(Self);

end;

destructor TCtrlOutroEmpregado.Destroy;
begin
  inherited;
    FDbOutroEmpregado.Free;
  if (IsAppServer) then
    FCdsOutroEmpregado.Free;

    FDbFuncionario.Free;
  if (IsAppServer) then
    FCdsFuncionario.Free;
    inherited;

end;

procedure TCtrlOutroEmpregado.DoChangeDataBase;
begin
  inherited;
    FDbOutroEmpregado.DataBaseName := DataBaseName;
    FDbFuncionario.DataBaseName := DataBaseName;

end;

function TCtrlOutroEmpregado.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsOutroEmpregado.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsOutroEmpregado, FDbOutroEmpregado, [], []);
      if not(Result) then
         raise Exception.Create(FDbOutroEmpregado.MessageInfo);

      Commit;
    except
      on E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
         Rollback;

      end;
    end;
  end;
end;

function TCtrlOutroEmpregado.ListPessoa(IdPessoa: String): OleVariant;
begin
  Result := GetDataPacket('SELECT '+
   ' PESSOA.NOME AS NOME,         '+
   ' FUNCIONARIO.MATRICULA AS MATRICULA, '+
   ' PESSOA.NUMDOCUMENTO AS NUMDOCUMENTO,'+
   ' CARGO.TITULO AS TITULO,             '+
   ' PESSOA.IDPESSOA AS IDPESSOA         '+
   ' FROM                                '+
   ' FUNCIONARIO,                        '+
   ' PESSOA,                             '+
   ' CARGO                               '+
   '  WHERE                              '+
   ' ( FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA) AND '+
   ' ( CARGO.IDCARGO = FUNCIONARIO.IDCARGO) AND    '+
   ' ( PESSOA.IDPESSOA = ' + IdPessoa +')');
end;

function TCtrlOutroEmpregado.Meses: OleVariant;
begin
  Result := GetDataPacket('         SELECT T.MES FROM (                                            '+
                          '       SELECT ''Janeiro'' AS MES, 1 AS ORD   FROM DUAL                  '+
                          ' UNION SELECT ''Fevereiro'' AS MES,2 AS ORD  FROM DUAL                  '+
                          ' UNION SELECT ''Março'' AS MES, 3 AS ORD  FROM DUAL                     '+
                          ' UNION SELECT ''Abril'' AS MES,4 AS ORD  FROM DUAL                      '+
                          ' UNION SELECT ''Maio'' AS MES,5 AS ORD  FROM DUAL                       '+
                          ' UNION SELECT ''Junho'' AS MES, 6 AS ORD  FROM DUAL                     '+
                          ' UNION SELECT ''Julho'' AS MES, 7 AS ORD  FROM DUAL                     '+
                          ' UNION SELECT ''Agosto'' AS MES, 8 AS ORD  FROM DUAL                    '+
                          ' UNION SELECT ''Setembro'' AS MES, 9 AS ORD  FROM DUAL                  '+
                          ' UNION SELECT ''Outubro'' AS MES, 10 AS ORD  FROM DUAL                  '+
                          ' UNION SELECT ''Novembro'' AS MES, 11 AS ORD FROM DUAL                  '+
                          ' UNION SELECT ''Dezembro'' AS MES, 12 AS ORD  FROM DUAL) T Order By ORD ');



end;

procedure TCtrlOutroEmpregado.OnCreateAppServer;
begin
  inherited;
    FCdsOutroEmpregado := TCMClientDataSet.Create(nil);
    FCdsFuncionario := TCMClientDataSet.Create(nil);
end;

// Andre Imakawa - SIG 20810 - Inicio
function TCtrlOutroEmpregado.RetornaMascaraCPFCNPJ(
  pCPFCNPJ: String): String;
var
  qryAux : TwwQuery;
  sSql : string;
begin
  qryAux:= Twwquery.Create(Nil);
  try
    qryAux.Databasename := 'BaseDados';

    sSql := ' SELECT CAST(CASE LENGTH(REGEXP_REPLACE(TRIM('''+pCPFCNPJ+'''), ''\D''))' + #13#10 +
            '              WHEN 11 THEN' + #13#10 +
            '               regexp_replace(REGEXP_REPLACE(TRIM('''+pCPFCNPJ+'''), ''\D''),' + #13#10 +
            '                              ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',' + #13#10 +
            '                              ''\1.\2.\3-\4'')' + #13#10 +
            '              WHEN 14 THEN' + #13#10 +
            '               regexp_replace(REGEXP_REPLACE(TRIM('''+pCPFCNPJ+'''), ''\D''),' + #13#10 +
            '                              ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',' + #13#10 +
            '                              ''\1.\2.\3/\4-\5'')' + #13#10 +
            '              ELSE' + #13#10 +
            '               REGEXP_REPLACE(TRIM('''+pCPFCNPJ+'''), ''\D'')' + #13#10 +
            '            END AS VARCHAR2(20)) CPF_CNPJ' + #13#10 +
            ' FROM DUAL';




    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;

    Result := qryAux.FieldByName('CPF_CNPJ').AsString;

  finally
    qryAux.Close;
    FreeAndNil(qryAux);
  end;
end;
// Andre Imakawa - SIG 20810 - Fim


end.




