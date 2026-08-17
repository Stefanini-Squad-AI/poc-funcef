unit uCtrlIntegraOrcFDO;

// Alterações:
{-----------------------------------------------------------------------------------------------------
N. Atender....: WO28120
Dt Alteração..: 28/11/2025
Responsável...: Paulo Nobre
Descrição.....: Removendo das funções: GetRateioFDO_Contrato e GetNovoRateioFDOContrato o (+) que
                estava no JOIN.
-----------------------------------------------------------------------------------------------------
N. Atender....: WO15134
Dt Alteração..: 28/10/2024
Responsável...: Paulo Nobre
Descrição.....: Função GetNovoRateioFDOContrato
-----------------------------------------------------------------------------------------------------
Rotina......: GetRateioFDO
N. SIG......: 129028
Data .......: 15/09/2022
Responsável.: André Imakawa
Descrição...: Ajuste para considerar nova coluna para os valores do rateio.
-----------------------------------------------------------------------------------------------------
Rotina......: EnviaDadosFDO, GetRateioFDO_Contrato
N. SIG......: 117244
Data .......: 06/08/2021
Responsável.: Edilaine
Descrição...: Integração com FDO Digital para rateio de lançamentos de contratos
-----------------------------------------------------------------------------------------------------
Rotina......: GetRateioFDO
N. SIG......: 115595
Data .......: 20/05/2021
Responsável.: Edilaine
Descrição...: Integração com FDO Digital para rateio de lançamentos de contratos
-----------------------------------------------------------------------------------------------------
Rotina......: GetRateioFDO
Nº SIG......: 115594
Data........: 28/04/2021
Responsável.: edilaine
Descrição...: Integração com FDO Digital para rateio de lançamentos
-----------------------------------------------------------------------------------------------------
Rotina......: DocumentoProcessado
Nº SIG......: 115566
Data........: 28/04/2021
Responsável.: edilaine
Descrição...: Nao criticar alterador nao contabilizado na integração orçamentária
-----------------------------------------------------------------------------------------------------
Rotina......: EnviaDadosFDO
Nº SIG......: 115517
Data........: 23/04/2021
Responsável.: edilaine
Descrição...: ajuste para gravação do token de retorno do web service do sistema PLANO
-----------------------------------------------------------------------------------------------------
Nº SIG......: 115395
Data........: 16/04/2021
Responsável.: edilaine
Descrição...: ajuste na conversão de mes e ano 
-----------------------------------------------------------------------------------------------------
Nº SIG......: 115380
Data........: 16/04/2021
Responsável.: edilaine
Descrição...: ajuste no caminho da DLL
-----------------------------------------------------------------------------------------------------
Nº SIG......: 94320/95404
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web - envio
-----------------------------------------------------------------------------------------------------
Nº SIG......: 94320/95403
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web - consulta
-----------------------------------------------------------------------------------------------------
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web
-----------------------------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils, Provider,  uCMTypes, Classes,
     ComCtrls,CMProcuraMask, CMProcura,DBTables, uDbIntegraOrcFDO,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls,
     wwQuery, uClassJSon, uSistema, FileCtrl, ShellApi, Windows, Forms;

const  CRLF = #13+#10;

  Type
    TTipoConexao = (tcConsulta, tcServico, tcEnvio);

    TCtrlIntegraOrcFDO = Class(TCmControlObject)

    private
       _dbIntegraOrc   : TDbIntegraOrcFDO;

       mmRetorno : TStringList;
       IdHTTP1   : TidHTTP;

       FCdsIntegraOrc : TClientDataSet;

       procedure SetcdsIntegraOrc(const Value: TClientDataSet);

       {----------------------------------------------------------------------------------
        //edilaine - 94320/95403 - funcoes para Consulta de saldo
       ----------------------------------------------------------------------------------}
       function  AtualizaSaldo(sAnoRef, sPlano, sPlaConta : string; iUnidNegoc, iCCusto : integer; rValor : double) : boolean;
       function  ConsultaSaldo(sAnoRef, sPlano, sPlaConta : string;
                               iUnidNegoc, iCCusto : integer;
                               sURL : string; var rSaldo : double) : boolean;
       function  GetSituacaoIntegra(iIdModulo : integer; sTipoLanca : string) : boolean;
       function  VerificaConexao(var sURL : string) : boolean;
       //edilaine - 94320/95403 : fim

       {----------------------------------------------------------------------------------
        //edilaine - 94320/95404 - funcoes para Envio de dados
       ----------------------------------------------------------------------------------}
       function TrataCaracteresEspeciais(valor: string): string;

     protected
       procedure DoChangeDataBase; Override;

     public
       property cdsIntegraOrc : TClientDataSet Read FcdsIntegraOrc Write SetcdsIntegraOrc;

       Constructor Create; Override;
       Destructor  Destroy; Override;

       function TestaConexao(tipoConexao : TTipoConexao; sURL : string) : boolean;
       function IntegraOrcON(const iIdModulo : integer = -1; const sTipoLanca : string = 'D') : boolean;

       {----------------------------------------------------------------------------------
        funcoes para parametrizacao no GLOBALCM
       ----------------------------------------------------------------------------------}
       Function  IFF(condicao : boolean; strTrue, strFalse : string) : string;
       procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);

       Function  ListaParametros : OleVariant;
       function  GetModulos(lstModulos : string) : OleVariant;
       procedure GetModulosIntegracao(auxCds : TClientDataSet);

       function  Alterar : Boolean;

       //edilaine SIG115566 : inicio
       function  DocumentoProcessado(iCodDocumento, iPlncodigo : integer;
                                     rVlrLanca: double;
                                     bNaFila  : boolean = false
                                     ) : integer;
       function  DocumentoPGA(iPlnCodigo : integer) : integer;
       //edilaine SIG115566 : fim

       {----------------------------------------------------------------------------------
       //edilaine - 94320/95404 - funcoes para Envio dados
       ----------------------------------------------------------------------------------}
       function InsereDocumentoFilaFDO(iCodDocumento, iIdModulo, iPlncodigo : integer;
                                       sDataProg, sDebCre, sRecPag : String;
                                       rVlrLanca: double): boolean;
       function EnviaDadosFDO(iCodDocumento : double; iPlnCodigo : integer; bEstorno : Boolean = false): boolean;
       function EstornaDocumentoFDO(iPlnCodigo : integer) : boolean;
       function AtualizaDocumentoFilaFDO(iCodDocumento : Double; iPlncodigo : Integer; sCEPPID: String): boolean;
       function ExcluiDocumentoFilaFDO(iCodDocumento : Double; iPlncodigo : integer) : boolean;

       {----------------------------------------------------------------------------------
        //edilaine - 94320/95403 - funcoes para Consulta
       ----------------------------------------------------------------------------------}
       function  VerificaSaldoFDO(iPlnCodigo : integer; const bBloqueiaLancamento : boolean = true) : boolean;

       {----------------------------------------------------------------------------------
        //edilaine - 115594 -  Integração FDO Digital
       ----------------------------------------------------------------------------------}
       function  GetRateioFDO(sNumFDO, sRecPag, sCodCentroRespon : string;
                              var sMsgErro : string;
                              sSQLRateio : string = ''          //edilaine SIG115595
                              ) : OleVariant;

       //edilaine SIG115595 : inicio
       function  GetRateioFDO_Contrato(sNumFDO, sIdContrato, sIdObjeto, sIdIem : string;
                                       var sMsgErro : string
                                       ) : OleVariant;
       //edilaine SIG115595 : fim

       //----------------------------------------------------------------------------------
       // Paulo Nobre - WO15134 - Inicio
       //----------------------------------------------------------------------------------
       function GetNovoRateioFDOContrato(sFDOsClausulaIN,
                                         sIdContrato,
                                         sIdObjeto,
                                         sIdIem : string;
                                         var sMsgErro : string
                                        ) : OleVariant;
       //----------------------------------------------------------------------------------
       // Paulo Nobre - WO15134 - Fim
       //----------------------------------------------------------------------------------
  end;

implementation

{ TCtrlIntegraOrcFDO }

function OraNum(sn : string): string;
begin
  result := '';
  result := StringReplace(sn, ',', '.', []);
end;

function FloatNum(sn : string) :string;
begin
  result := '';
  result := StringReplace(sn, '.', ',', []);
end;

Function TCtrlIntegraOrcFDO.IFF(condicao : boolean; strTrue, strFalse : string) : string;
begin
  if condicao then result := strTrue
              else result := strFalse;
end;


procedure TCtrlIntegraOrcFDO.Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
var
  ini, fim : integer;
begin
   ListOfStrings.Clear;

   if copy(Trim(Str), Length(Trim(Str)), 1) <> Delimiter then
      Str := Str + Delimiter;

   while  Pos(Delimiter, Str) > 0 do
   begin
     ListOfStrings.Add( Trim(copy(Str, 1, Pos(Delimiter, Str)-1)) );
     Str := StringReplace(Str, ListOfStrings.Strings[ ListOfStrings.count-1 ]+Delimiter , '', []);
   end;
end;

function TCtrlIntegraOrcFDO.Alterar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Apagar ( FCdsIntegraOrc.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FCdsIntegraOrc, _dbIntegraOrc,[],[] );
           Msg    := _dbIntegraOrc.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

procedure TCtrlIntegraOrcFDO.SetcdsIntegraOrc(const Value: TClientDataSet);
begin
  FcdsIntegraOrc := Value;
end;

constructor TCtrlIntegraOrcFDO.Create;
begin
  inherited;
  _dbIntegraOrc   := TDbIntegraOrcFDO.Create(Self);

  FCdsIntegraOrc := TClientDataSet.Create(nil);

  mmRetorno := TStringList.create;
  IdHTTP1   := TIdHTTP.create(nil);
end;

destructor TCtrlIntegraOrcFDO.Destroy;
begin
  inherited;

  FcdsIntegraOrc.Free;

  mmRetorno.Free;
  IdHTTP1.free;
end;

procedure TCtrlIntegraOrcFDO.DoChangeDataBase;
begin
  inherited;
  _dbIntegraOrc.DataBaseName   := DataBaseName;
end;


function TCtrlIntegraOrcFDO.GetModulos(lstModulos : string) : OleVariant;
var
  sSql :string;
begin
   sSql := 'SELECT '+
           '    IDMODULO, NOMEMODULO '+
           'FROM ' +
           '    MODULO  ' +
           'WHERE HASH IS NOT NULL ' +
           '  AND NOMEMODULO IS NOT NULL ';

   if lstModulos <> '' then
      sSQL := sSQL +
           '  AND IDMODULO IN ('+lstModulos+ ')'
   else if FCdsIntegraOrc.FieldByName('MODULOS').AsString <> '' then
      sSQL := sSQL +
           '  AND IDMODULO NOT IN  ('+FCdsIntegraOrc.FieldByName('MODULOS').AsString+ ')';


   sSQL := sSQL +
           'ORDER BY NOMEMODULO';

   Result := GetDataPacket(sSql);
end;


function TCtrlIntegraOrcFDO.ListaParametros : OleVariant;
var
  sSql :string;
begin
   sSql := 'SELECT P.* '+                                                  
           '  FROM PARAMINTEGRAORC P '+
           ' WHERE P.IDPESSOA = 1';

   Result := GetDataPacket(sSql);
end;


procedure TCtrlIntegraOrcFDO.GetModulosIntegracao(auxCds : TClientDataSet);
var
  sModulos : string;
begin
  sModulos := iff(FCdsIntegraOrc.FieldByName('MODULOS').AsString = '', '-1', FCdsIntegraOrc.FieldByName('MODULOS').AsString);
  _cds.data := GetModulos(sModulos);
  while not _cds.eof do
  begin
    auxCds.append;
    auxCds.FieldByName('IDMODULO').AsInteger  := _Cds.FieldByName('IDMODULO').AsInteger;
    auxCds.FieldByName('NOMEMODULO').AsString := _Cds.FieldByName('NOMEMODULO').AsString;
    auxCds.Post;

    _cds.next;
  end;
end;






function TCtrlIntegraOrcFDO.TestaConexao(tipoConexao: TTipoConexao; sURL : string) : boolean;
begin
  Result := true;

  MessageInfo := '';

  // teste para validar serviço
  idHttp1.Request.ContentType := 'application/x-www-form-urlencoded';
  idhttp1.Request.AcceptCharSet := 'UTF-8';
  idHttp1.Request.Clear;
  idHttp1.Response.ContentType := 'application/x-www-form-urlencoded';
  idHttp1.Response.AcceptCharSet := 'UTF-8';

  try
    mmRetorno.clear;
    mmRetorno.text := idHttp1.get(sURL);

    if tipoConexao = tcServico then
    begin
      if Pos('"type"', mmRetorno.text) = 0 then
      begin
         MessageInfo := 'Serviço inativo';
         result := false;
      end;
    end;

    if tipoConexao = tcConsulta then
    begin
      if (Pos('"Informe a compet\u00eancia inicial"', mmRetorno.text) <> 0) or
         (Pos('"Informe a competência inicial"', mmRetorno.text) <> 0) then
      begin
         MessageInfo := 'Login efetuado com sucesso';
      end
      else
      begin
         MessageInfo := 'Falha na autenticação';
         result := false;
      end;
    end;

    if tipoConexao = tcEnvio then
    begin
      if (Pos('"status":0', mmRetorno.text) <> 0) then
      begin
         MessageInfo := 'Falha na autenticação';
         result := false;
      end
      else if (Pos('"status":1', mmRetorno.text) <> 0) then
      begin
         MessageInfo := 'Login efetuado com sucesso';
      end;
    end;

  except
     on e: exception do
     begin
       MessageInfo := e.Message;
       Result := false;
     end;
  end;

end;


function TCtrlIntegraOrcFDO.IntegraOrcON(const iIdModulo : integer = -1; const sTipoLanca : string = 'D') : boolean;
begin
  result := GetSituacaoIntegra(iIdModulo, sTipoLanca);
end;


//edilaine - 94320/95403 : inicio
function TCtrlIntegraOrcFDO.AtualizaSaldo(sAnoRef, sPlano, sPlaConta: string;
                                          iUnidNegoc, iCCusto: integer;
                                          rValor: double): boolean;
var
  sSQL : string;
begin
  MessageInfo := '';

  sSQL := 'UPDATE CTRLSALDOFDO SET SALDO = '+StringReplace(FloatToStr(rValor), ',', '.', []) +
          ' WHERE ANOREFERENCIA = '+Quotedstr(sAnoRef)+
          '   AND PLANO = '+Quotedstr(sPlano)+
          '   AND PLACONTA = '+Quotedstr(sPlaConta)+
          '   AND UNIDNEGOC = '+IntToStr(iUnidNegoc)+
          '   AND CODCENTROCUSTO = '+IntToStr(iCCusto)+
          '   AND IDPESSOA = 1';
  try
    StartTransaction;

    result := ExecSQL(sSQL, true);

    if not result then
    begin
      sSQL := 'INSERT INTO  CTRLSALDOFDO (IDPESSOA, ANOREFERENCIA, PLANO, PLACONTA, UNIDNEGOC, CODCENTROCUSTO, SALDO) '+
              ' VALUES ( '+
              ' 1, ' +
              ' '+Quotedstr(sAnoRef) +', '+
              ' '+Quotedstr(sPlano)    +', '+
              ' '+Quotedstr(sPlaConta) +', '+
              ' '+IntToStr(iUnidNegoc) +', '+
              ' '+IntToStr(iCCusto)    +', '+
              ' '+StringReplace(FloatToStr(rValor), ',', '.', []) +')';

      result := ExecSQL(sSQL, true);
    end;

    Commit;
  except
    On E:Exception Do
     Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
     End;
  end;
end;


function TCtrlIntegraOrcFDO.ConsultaSaldo(sAnoRef, sPlano, sPlaConta: string;
                                          iUnidNegoc, iCCusto: integer;
                                          sURL : string; var rSaldo : double) : boolean;
var
  sParams     : string;
  lstLinhas   : TStringList;
  ind : integer;
  rVlrSaldo, rVlrOrc, rVlrReal : double;
begin

  lstLinhas   := TStringList.create;

  sURL := sURL + '&COMPETENCIA_INICIO=01/01/'+sAnoRef +
                 '&COMPETENCIA_FIM=31/12/'+sAnoRef    +
                 '&ESTRUTURA_CONTA='+Trim(sPlaConta)  +
                 '&COD_DIMENSAO='+IntToStr(iUnidNegoc)+
                 '&COD_CENTROCUSTO='+IntToStr(iCCusto) +
                 '&VALOR_ACUMULADO=S'+
                 '&type=csv';

  // teste para validar serviço
  idHttp1.Request.ContentType := 'application/x-www-form-urlencoded';
  idhttp1.Request.AcceptCharSet := 'UTF-8';
  idHttp1.Request.Clear;
  idHttp1.Response.ContentType := 'application/x-www-form-urlencoded';
  idHttp1.Response.AcceptCharSet := 'UTF-8';

  try
    try
      mmRetorno.clear;
      mmRetorno.text := idHttp1.get(sURL);

      rVlrSaldo := 0;

      for ind := 1 to mmRetorno.Count-1 do
      begin
        sParams := mmRetorno.Strings[ind];
        split(';', sParams, lstLinhas);

        try
          rVlrOrc := StrToFloat(StringReplace(lstLinhas.Strings[13], '.', ',', []));
        except
          rVlrOrc := 0;
        end;

        try
          rVlrReal := StrToFloat(StringReplace(lstLinhas.Strings[14], '.', ',', []));
        except
          rVlrReal := 0;
        end;

        rVlrSaldo := rVlrSaldo + (abs(rVlrOrc) + rvlrReal);
      end;

      rSaldo := rVlrSaldo;

      AtualizaSaldo(sAnoRef, sPlano, sPlaConta, iUnidNegoc, iCCusto, rSaldo);

      Result := true;

    except
       on e: exception do
       begin
         MessageInfo := 'Erro ao consultar saldo das contas'+CRLF+e.Message;
         Result := false;
       end;
    end;

  finally
    FreeAndNil(lstLinhas);
  end;

end;


function TCtrlIntegraOrcFDO.GetSituacaoIntegra(iIdModulo : integer; sTipoLanca : string) : boolean;
var
  sSQL, sCampo : string;
  lstItens : TStringList;
begin
  lstItens := TStringList.create;

  try
    sSql := 'SELECT * '+
            '  FROM PARAMINTEGRAORC      '+
            ' WHERE FLGINTEGRAORCWEB = 1 ';

    _Cds.data := GetDataPacket(sSQL);

    result := not _Cds.isEmpty;

    if (iIdModulo > -1) and (result) then
    begin
      sCampo := 'MODULOS';
      if sTipoLanca = 'C' then
         sCampo := 'MODULOSCONTAB';

      split(',', _cds.FieldByName(sCampo).AsString, lstItens);

      if (lstItens.count = 0) and (_cds.FieldByName(sCampo).AsString <> '') then
         lstItens.Add(_cds.FieldByName(sCampo).AsString);
      result := lstItens.IndexOf(IntToStr(iIdModulo)) > -1;
    end;
  finally
    FreeAndNil(lstItens);
  end;
end;


function TCtrlIntegraOrcFDO.VerificaConexao(var sURL : string) : boolean;
begin
  Result := true;

  FCdsIntegraOrc.data := ListaParametros();

  if (FCdsIntegraOrc.IsEmpty) or
     (FCdsIntegraOrc.FieldByName('UrlConsulta').AsString = '') or
     (FCdsIntegraOrc.FieldByName('UserConsulta').AsString = '') or
     (FCdsIntegraOrc.FieldByName('PassConsulta').AsString = '') then
  begin
    MessageInfo := 'Falta parametrização';
    Result := false;
    exit;
  end;

  // teste para validar serviço
  sURL := FCdsIntegraOrc.FieldByName('UrlConsulta').AsString+'params';
  if not TestaConexao(tcServico, sURL) then
  begin
    Result := false;
    exit;
  end;

  // testa login
  sURL  := FCdsIntegraOrc.FieldByName('UrlConsulta').AsString+
           'LOGIN='+FCdsIntegraOrc.FieldByName('UserConsulta').AsString+
           '&SENHA='+FCdsIntegraOrc.FieldByName('PassConsulta').AsString;

  if not TestaConexao(tcConsulta, sURL) then
  begin
    Result := false;
    exit;
  end;

end;


function TCtrlIntegraOrcFDO.VerificaSaldoFDO(iPlnCodigo: integer; const bBloqueiaLancamento : boolean = true): boolean;
var
  sURL    : string;
  _qry    : TwwQuery;
  rSaldo  : double;
  sAnoMes : string;
  lstLog  : TStringList;
begin
  if not VerificaConexao(sURL) then
     exit;

  _qry   := TwwQuery.create(nil);
  lstLog := TStringList.create;
  try
    _qry.DataBaseName   := DataBaseName;

    _qry.SQL.Add('SELECT P.PERNUMERO, P.PEREXERCICIO, L.PLANO, L.PLACONTA, L.UNIDNEGOC, ');
    _qry.SQL.Add('       PC.PLANOME, U.NOME AS ATIVPROJ, ');
    _qry.SQL.Add('       L.CODCENTROCUSTO, CC.NOME AS CCUSTO, ');
    _qry.SQL.Add('       L.IDMODULO, SUM(L.LACVALOR) VLRLANCA ');
    _qry.SQL.Add('  FROM LANCAMENTO L ');
    _qry.SQL.Add('  JOIN PLANILHA P ON P.PLNCODIGO = L.PLNCODIGO ');
    _qry.SQL.Add('  JOIN PLANOCONTA PC ON PC.PLANO = L.PLANO     ');
    _qry.SQL.Add('                    AND PC.PLACONTA = L.PLACONTA ');
    _qry.SQL.Add('  LEFT JOIN UNIDNEGOCIO U ON U.UNIDNEGOC = L.UNIDNEGOC ');
    _qry.SQL.Add('  LEFT JOIN CENTCUST CC ON CC.CODCENTROCUSTO = L.CODCENTROCUSTO ');
    _qry.SQL.Add(' WHERE L.PLNCODIGO = '+IntToStr(iPlnCodigo) );
//    _qry.SQL.Add('   AND L.LACDEBCRE = '+Quotedstr( iff(sRecPag = 'P', 'D', 'C')) );
    _qry.SQL.Add('   AND L.LACDEBCRE = ''D'' ');
    _qry.SQL.Add('   AND L.IDPLANOPREV = 110 ');
    _qry.SQL.Add('   AND (L.PLACONTA LIKE (''41%'') OR L.PLACONTA LIKE (''42%'') OR ');
    _qry.SQL.Add('        L.PLACONTA LIKE (''43%'') OR L.PLACONTA LIKE (''44%'') OR ');
    _qry.SQL.Add('        L.PLACONTA LIKE (''45%'') OR L.PLACONTA LIKE (''47%''))   ');
    _qry.SQL.Add('GROUP BY P.PERNUMERO, P.PEREXERCICIO, L.PLANO, L.PLACONTA, L.UNIDNEGOC, ');
    _qry.SQL.Add('         PC.PLANOME, U.NOME, L.IDMODULO, L.CODCENTROCUSTO, CC.NOME ');

    try
      result := true;

      _qry.open;
      while (not _qry.eof) and (result) do
      begin
        if sAnoMes = '' then
           sAnoMes := FormatFloat('0000', _qry.FieldByName('PEREXERCICIO').AsInteger) +
                      FormatFloat('00', _qry.FieldByName('PERNUMERO').AsInteger);

        //Consulta Saldo
        Result := ConsultaSaldo(_qry.FieldByName('PEREXERCICIO').AsString,
                                _qry.FieldByName('PLANO').AsString,
                                _qry.FieldByName('PLACONTA').AsString,
                                _qry.FieldByName('UNIDNEGOC').AsInteger,
                                _qry.FieldByName('CODCENTROCUSTO').AsInteger,
                                sURL, rSaldo);

        //valida saldo de docs a pagar
        if (result) then
        begin
          if (rSaldo < _qry.FieldByName('VLRLANCA').AsFloat) then
          begin
            if bBloqueiaLancamento then
            begin
              Result := false;
              MessageInfo := 'Não há saldo suficiente na ' + CRLF +
                             'Conta Contábil: '+Trim(_qry.FieldByName('PLACONTA').AsString)+' - '+
                                                Trim(_qry.FieldByName('PLANOME').AsString) + CRLF +
                             'para Atividade de Projeto: '+_qry.FieldByName('ATIVPROJ').AsString + CRLF +
                             'do Centro de Custo: '+_qry.FieldByName('CCUSTO').AsString + CRLF+CRLF +
                             'Entre em contato com a COPEF.';
            end
            else
            begin
              if lstLog.count = 0 then
              begin
                lstLog.Add('Modulo..: '+Sistema.NomeModulo   );
                lstLog.Add('Planilha: '+IntToStr(iPlnCodigo) );
                lstLog.Add('');
                lstLog.Add('Relação de Contas com Saldo Insuficiente ');
                lstLog.Add('--------------------------------------------------------------------')
              end;

              lstLog.Add('Conta Contábil: '+Trim(_qry.FieldByName('PLACONTA').AsString)+' - '+
                                            Trim(_qry.FieldByName('PLANOME').AsString)  );
              lstLog.Add('Atividade de Projeto: '+_qry.FieldByName('ATIVPROJ').AsString );
              lstLog.Add('Centro de Custo: '+_qry.FieldByName('CCUSTO').AsString );
              lstLog.Add('--------------------------------------------------------------------');
           end;
          end;
        end;

        _qry.next;
      end;

    except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
    end;

  finally
    if lstLog.Count > 0 then
    begin
      if not DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\IntegraOrc') then
         CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\IntegraOrc');
      lstLog.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\IntegraOrc\LogErro_'+
                        sAnoMes+'_PLANILHA_'+IntToStr(iPlnCodigo)+'.txt');
    end;

    FreeAndNil(lstLog);
    FreeAndNil(_qry);
  end;
end;
//edilaine - 94320/95403 : fim

function TCtrlIntegraOrcFDO.EnviaDadosFDO(iCodDocumento: double; iPlnCodigo : integer;
                                          bEstorno : Boolean = false
                                         ): boolean;
type
  TGeraToken = function(Login: PAnsiChar; Password: PAnsiChar): PAnsiChar; stdcall;
  TEnviaRealizado = function(Auth_Token: PAnsiChar; Competencia: PAnsiChar;
                             PathArquivo: PAnsiChar; Delimitador: PAnsiChar): PAnsiChar; stdcall;
var
  xHandle: THandle;
  xGeraToken: TGeraToken;
  GeraToken: PAnsiChar;
  xEnviaRealizado: TEnviaRealizado;
  EnviaRealizado: PAnsiChar;
  js: TlkJSONBase;
  sToken: string;
  _qry      : TwwQuery;
  sAnoMes   : string;
  sArquivo  : string;
  sVlrLanca : string;
  sCompetencia : string;
  lArqCSV   : TStringList;
begin
  //edilaine SIG115517 : inicio
  if not FileExists('C:\CMSOLUCOES\Executaveis\bpl\IntegraOrcamentoDLL.dll') then
  begin
    MessageInfo := 'DLL de Integração Orçamentária não localizada!';
    Result := False;
    exit;
  end;

  if (FileExists('C:\CMSOLUCOES\Executaveis\bpl\RestSharp.dll')) and
     (not FileExists(ExtractFilePath(Application.ExeName)+'RestSharp.dll')) then
  begin
    copyfile(pchar('C:\CMSOLUCOES\Executaveis\bpl\RestSharp.dll'), pchar(ExtractFilePath(Application.ExeName)+'RestSharp.dll'), false);
  end;

  if (not FileExists(ExtractFilePath(Application.ExeName)+'RestSharp.dll')) then
  begin
    MessageInfo := 'DLL de apoio de Integração Orçamentária não localizada!';
    Result := False;
    exit;
  end;
  //edilaine SIG115517 : fim

  //preparar arquivo
  _qry := TwwQuery.create(nil);

  lArqCSV   := TStringList.create;


  xHandle := LoadLibrary('C:\CMSolucoes\Executaveis\bpl\IntegraOrcamentoDLL.dll');    //edilaine - SIG115380
  if (xHandle > 0) then
  begin
    try
      _qry.DataBaseName   := DataBaseName;

      _qry.SQL.Add('SELECT P.PERNUMERO AS MES, ');
      _qry.SQL.Add('       P.PEREXERCICIO AS ANO,       ');
      _qry.SQL.Add('       TO_CHAR(P.PLNDATDIA, ''DD/MM/YYYY'') AS DATA, ');
      _qry.SQL.Add('       1 AS CODUNIDADE,                              ');
      _qry.SQL.Add('       TRIM(CC.CODCENTROCUSTO) CODCENTRODECUSTO,     ');
      _qry.SQL.Add('       CC.NOME DESCCENTRODECUSTO,                    ');
      _qry.SQL.Add('       TRIM(PC.PLACONTA) CODCONTACONTABIL,           ');
      _qry.SQL.Add('       PC.PLANOME DESCCONTACONTABIL,                 ');
      _qry.SQL.Add('       NVL(TO_CHAR(LD.CODDOCUMENTO), '' '') AS DOCUMENTO,     ');
      _qry.SQL.Add('       LC.LACDEBCRE NATUREZA,                        ');
      _qry.SQL.Add('       decode(LC.LACDEBCRE, ''C'', sum(NVL(LC.LACVALOR,0)) * -1, sum(NVL(LC.LACVALOR,0))) as VALOR, ');
      _qry.SQL.Add('       LC.LACHIST1||'' ''||LC.LACHIST2||'' ''||LC.LACHIST3||'' ''||LC.LACHIST4||'' ''||LC.LACHIST5 AS HISTORICO, ');
      _qry.SQL.Add('       '' '' AS CODPROJETO,  ');
      _qry.SQL.Add('       '' '' AS GERADOR,     ');
      _qry.SQL.Add('       U.UNIDNEGOC DIMENSAO  ');
      _qry.SQL.Add('  FROM LANCAMENTO LC  ');
      _qry.SQL.Add('  JOIN PLANILHA          P ON P.PLNCODIGO = LC.PLNCODIGO     ');
      _qry.SQL.Add('  LEFT JOIN UNIDNEGOCIO  U ON U.UNIDNEGOC = LC.UNIDNEGOC ');
      _qry.SQL.Add('  LEFT JOIN CENTCUST    CC ON CC.CODCENTROCUSTO = LC.CODCENTROCUSTO ');
      _qry.SQL.Add('  LEFT JOIN PLANOCONTA  PC ON PC.PLACONTA = LC.PLACONTA ');
      _qry.SQL.Add('  LEFT JOIN LANCTODOCUM LD ON LD.PLNCODIGO = LC.PLNCODIGO');
      _qry.SQL.Add(' WHERE LC.PLNCODIGO = '+IntToStr(iPlnCodigo) );

      if iCodDocumento > 0 THEN
         _qry.SQL.Add('   AND LD.CODDOCUMENTO = '+FloatToStr(iCodDocumento) );

      _qry.SQL.Add('   AND (TRIM(LOWER(LC.LACNUMDOC)) NOT LIKE (''rateio por prog'') OR LC.LACNUMDOC IS NULL) ');
      _qry.SQL.Add('   AND LC.IDPLANOPREV = 110 ');
      _qry.SQL.Add('   AND LC.PLACONTA LIKE (''40%'') ' );
      //_qry.SQL.Add('   AND (LC.PLACONTA LIKE (''41%'') OR LC.PLACONTA LIKE (''42%'') OR LC.PLACONTA LIKE (''43%'') OR  ');
      //_qry.SQL.Add('        LC.PLACONTA LIKE (''44%'') OR LC.PLACONTA LIKE (''45%'') OR LC.PLACONTA LIKE (''47%''))    ');
      _qry.SQL.Add('   AND LC.TIPCODIGO <> ''98''   ');
      _qry.SQL.Add('GROUP BY P.PERNUMERO,           ');
      _qry.SQL.Add('         P.PEREXERCICIO,        ');
      _qry.SQL.Add('         to_char(P.PLNDATDIA, ''MM/YYYY''),  ');
      _qry.SQL.Add('         P.PLNDATDIA, CC.CODCENTROCUSTO,PC.PLACONTA, ');
      _qry.SQL.Add('         LC.PLACONTA,           ');
      _qry.SQL.Add('         LC.LACDEBCRE,          ');
      _qry.SQL.Add('         PC.PLANOME,            ');
      _qry.SQL.Add('         NVL(TO_CHAR(LD.CODDOCUMENTO), '' ''), ');
      _qry.SQL.Add('         CC.NOME ,              ');
      _qry.SQL.Add('         U.UNIDNEGOC ,          ');
      _qry.SQL.Add('         LC.LACHIST1||'' ''||LC.LACHIST2||'' ''||LC.LACHIST3||'' ''||LC.LACHIST4||'' ''||LC.LACHIST5 ');

      try
        Result := True;

        _qry.open;

        if not _qry.eof then
        begin
          sCompetencia := FormatFloat('0000', _qry.FieldByName('ANO').AsInteger) + '/' +
                          FormatFloat('00', _qry.FieldByName('MES').AsInteger) + '/01';

          sAnoMes := FormatFloat('0000', _qry.FieldByName('ANO').AsInteger) +
                     FormatFloat('00', _qry.FieldByName('MES').AsInteger);

          lArqCSV.Clear;
          lArqCSV.Add('DRE|'+sCompetencia);
          while not _qry.eof do
          begin
            if bEstorno then
               sVlrLanca := FloatNum(FloatToStr(_qry.FieldByName('VALOR').AsFloat * -1))
            else
               sVlrLanca := FloatNum(_qry.FieldByName('VALOR').AsString);


            lArqCSV.Add(_qry.FieldByName('MES').AsString + ';' +
                        _qry.FieldByName('ANO').AsString + ';' +
                        _qry.FieldByName('DATA').AsString + ';' +
                        _qry.FieldByName('CODUNIDADE').AsString + ';' +
                        _qry.FieldByName('CODCENTRODECUSTO').AsString + ';' +
                        _qry.FieldByName('DESCCENTRODECUSTO').AsString + ';' +
                        _qry.FieldByName('CODCONTACONTABIL').AsString + ';' +
                        _qry.FieldByName('DESCCONTACONTABIL').AsString + ';' +
                        _qry.FieldByName('DOCUMENTO').AsString + ';' +
                        _qry.FieldByName('NATUREZA').AsString + ';' +
                        sVlrLanca + ';' +
                        StringReplace(_qry.FieldByName('HISTORICO').AsString, ';', ',', [rfReplaceAll]) + ';' +
                        _qry.FieldByName('CODPROJETO').AsString + ';' +
                        _qry.FieldByName('GERADOR').AsString + ';' +
                        _qry.FieldByName('DIMENSAO').AsString + ';' +
                        'S'
                       );

            _qry.Next;
          end;
          _qry.Close;

          sArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\IntegraOrc';
          if not DirectoryExists(sArquivo) then
             CreateDir(sArquivo);
          sArquivo := sArquivo + '\'+sAnoMes+'_PLANILHA_'+FloatToStr(iPlnCodigo)+'.csv';
          lArqCSV.SaveToFile(sArquivo);


          // Gerando Token
          @xGeraToken := GetProcAddress(xHandle, 'GeraToken'); //nome do seu método no C#
          if (@xGeraToken <> nil) then
          begin
            GeraToken := xGeraToken('integrador.401@allstrategy.com.br', '4ip1B5wh');

            js := TlkJSON.ParseText(GeraToken);

            //edilaine SIG117244 : inicio
            if js <> nil then
            begin
              sToken := VarToStr(js.Field['auth_token'].Value);

              Result := (VarToStr(js.Field['status'].Value) = '1');

              if not Result then
                MessageInfo := TrataCaracteresEspeciais(VarToStr(js.Field['msg'].Value));

              js.Free;
            end
            else
              MessageInfo := 'Erro ao gerar Token para envio dos dados. Verifique parametrização!';
              Result := False;
            //edilaine SIG117244 : fim
          end
          else
          begin
            MessageInfo := 'Função GeraToken não encontrada na IntegraOrcamentoDLL!';
            Result := False;
          end;

          // Enviando o arquivo se existir Token
          if (Result) and (sToken <> '') then
          begin
            @xEnviaRealizado := GetProcAddress(xHandle, 'EnviaRealizado');
            if (@xEnviaRealizado <> nil) then
            begin
              EnviaRealizado := xEnviaRealizado(PChar(sToken), PChar(sCompetencia), PChar(sArquivo), ';');

              js := TlkJSON.ParseText(EnviaRealizado);

              Result := (VarToStr(js.Field['status'].Value) = '1');

              if Result then
                AtualizaDocumentoFilaFDO(iCodDocumento, iPlnCodigo, VarToStr(js.Field['CEPP_ID'].Value) )
              else
                MessageInfo := TrataCaracteresEspeciais(VarToStr(js.Field['msg'].Value));

              js.Free;

            end
            else
            begin
              MessageInfo := 'Função EnviaRealizado não encontrada na IntegraOrcamentoDLL!';
              Result := False;
            end;

          end;

        end
        else
        begin
          //exclui da fila se não tem nada para enviar
          ExcluiDocumentoFilaFDO(iCodDocumento, iPlnCodigo);
        end;
      except
        on E: Exception do
        begin
          Result := False;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil(_qry);
      FreeAndNil(lArqCSV);
      FreeLibrary(xHandle);
    end;               
  end
  else
  begin
    MessageInfo := 'Aplicação para envio de dados não encontrado!';
    Result := false;
  end;

end;




function TCtrlIntegraOrcFDO.InsereDocumentoFilaFDO(iCodDocumento, iIdModulo, iPlncodigo: integer;
                                                   sDataProg, sDebCre, sRecPag : String;
                                                   rVlrLanca: double): boolean;
var
  iMes, iAno  : integer;
  wdia, wmes, wano : word;      //edilaine SIG115395
  iTentativas : byte;
  iRetorno    : Integer;
  tTempoIni   : TDateTime;
  SP_PROC     : TStoredProc;
begin

  result := false;
  //edilaine SIG115395 : inicio
  //iMes   := StrToInt(copy(sDataProg, 4,2));
  //iAno   := StrToInt(copy(sDataProg, 7,4));

  decodedate( StrToDate(sDataProg), wano, wmes, wdia);

  iMes := wmes;
  iAno := wano;
  //edilaine SIG115395 : fim


  if ((sRecPag = 'P')  and (sDebCre = 'D')) or
     ((sRecPag <> 'P') and (sDebCre = 'C')) then
     rVlrLanca := rVlrLanca * -1;

  try

    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'CM.SP_ALL_INSERE_FILA';

    SP_PROC.Params.CreateParam(ftInteger,   'inCodDocumento',  ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inPLNCodigo',     ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inMes',           ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inAno',           ptinput);
    SP_PROC.Params.CreateParam(ftFloat,     'inValor',         ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inModulo',        ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'outRetorno',      ptOutput);


    SP_PROC.parambyName('inCodDocumento').asInteger := iCodDocumento;
    SP_PROC.parambyName('inPLNCodigo').asInteger    := iPlncodigo;
    SP_PROC.parambyName('inMes').asInteger          := iMes;
    SP_PROC.parambyName('inAno').asInteger          := iAno;
    SP_PROC.parambyName('inValor').asFloat          := rVlrLanca;
    SP_PROC.parambyName('inModulo').asInteger       := iIdModulo;

    try

      tTempoIni   := now;
      iTentativas := 0;

      repeat
        {repetir a tentativa de inserir por 1,5 minuto}
        inc(iTentativas);

        SP_PROC.Prepare;
        SP_PROC.ExecProc;

        result := SP_PROC.parambyName('outRetorno').asInteger > 0;

        if not result then
           sleep(15000);

      until (result) or (iTentativas < 3);

      if not result then
         MessageInfo := 'Não foi possível inserir documento na fila de Integração Orçamentária.'+char(10)+char(13)+
                        'Entre em contato com a COPEF';

    except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
    end;

  finally
    FreeAndNil(SP_PROC);
  end;
end;


function TCtrlIntegraOrcFDO.TrataCaracteresEspeciais(valor: string): string;
begin
  Result := valor;
  Result := StringReplace(Result, '\u00e1', 'á', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e0', 'à', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e2', 'â', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e3', 'ã', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e4', 'ä', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c1', 'Á', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c0', 'À', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c2', 'Â', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c3', 'Ã', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c4', 'Ä', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e9', 'é', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e8', 'è', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ea', 'ê', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ea', 'ê', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c9', 'É', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c8', 'È', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ca', 'Ê', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00cb', 'Ë', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ed', 'í', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ec', 'ì', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ee', 'î', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ef', 'ï', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00cd', 'Í', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00cc', 'Ì', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00ce', 'Î', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00cf', 'Ï', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f3', 'ó', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f2', 'ò', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f4', 'ô', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f5', 'õ', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f6', 'ö', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d3', 'Ó', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d2', 'Ò', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d4', 'Ô', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d5', 'Õ', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d6', 'Ö', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00fa', 'ú', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f9', 'ù', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00fb', 'û', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00fc', 'ü', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00da', 'Ú', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d9', 'Ù', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00db', 'Û', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00e7', 'ç', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00c7', 'Ç', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00f1', 'ñ', [rfReplaceAll]);
  Result := StringReplace(Result, '\u00d1', 'Ñ', [rfReplaceAll]);
  Result := StringReplace(Result, '\u0026', '&', [rfReplaceAll]);
  Result := StringReplace(Result, '\u0027', '''', [rfReplaceAll]);
end;


function TCtrlIntegraOrcFDO.AtualizaDocumentoFilaFDO(iCodDocumento : Double; iPlncodigo : Integer; sCEPPID: String): boolean;
var
  _qry       : TwwQuery;
  SP_PROC   : TStoredProc;
begin

  try

    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'CM.SP_ALL_ATUALIZA_CEPP_ID';

    SP_PROC.Params.CreateParam(ftFloat,     'inCodDocumento',  ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inPLNCodigo',     ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inCEPPID',        ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'outRetorno',      ptOutput);


    SP_PROC.parambyName('inCodDocumento').asFloat := iCodDocumento;
    SP_PROC.parambyName('inPLNCodigo').asInteger  := iPlncodigo;
    SP_PROC.parambyName('inCEPPID').asInteger     := StrToIntDef(sCEPPID, -1);

    try
      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      result := SP_PROC.parambyName('outRetorno').asInteger > 0;
    except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
    end;
  finally
    FreeAndNil(SP_PROC);
  end;
end;

function TCtrlIntegraOrcFDO.EstornaDocumentoFDO(iPlnCodigo: integer): boolean;
var
  _qry       : TwwQuery;
begin

  try

    _qry := TwwQuery.Create(Application);
    _qry.DatabaseName  := 'BaseDados';

    _qry.SQL.Text := 'SELECT LD.CODDOCUMENTO, DC.IDMODULO, DC.DATAPROGRAMADA, '+
                     '       LD.DEBCRE, DC.RECPAG, LD.VALOR '+
                     '  FROM LANCTODOCUM LD      '+
                     '  JOIN DOCUMENTO   DC ON DC.CODDOCUMENTO = LD.CODDOCUMENTO '+
                     ' WHERE LD.PLNCODIGO = '+ IntToStr(iPlnCodigo);

    try
      _qry.Open;

      if not _qry.eof then
      begin
        Result := InsereDocumentoFilaFDO(_qry.FieldByName('CODDOCUMENTO').AsInteger,
                                         _qry.FieldByName('IDMODULO').AsInteger,
                                         iPlnCodigo,
                                         _qry.FieldByName('DATAPROGRAMADA').AsString,
                                         _qry.FieldByName('DEBCRE').AsString,
                                         _qry.FieldByName('RECPAG').AsString,
                                         _qry.FieldByName('VALOR').AsFloat
                                        );
        if Result then
           Result := EnviaDadosFDO(_qry.FieldByName('CODDOCUMENTO').AsInteger, iPlnCodigo, true);

      end
      else
        Result := True;

    except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
    end;
  finally
    FreeAndNil(_qry);
  end;

end;

function TCtrlIntegraOrcFDO.ExcluiDocumentoFilaFDO(iCodDocumento: Double; iPlncodigo: integer): boolean;
var
  SP_PROC  : TStoredProc;
begin

  try

    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'CM.SP_ALL_ESTORNA_FILA';

    SP_PROC.Params.CreateParam(ftInteger,   'inCodDocumento',  ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'inPLNCodigo',     ptinput);
    SP_PROC.Params.CreateParam(ftInteger,   'outRetorno',      ptOutput);

    SP_PROC.parambyName('inCodDocumento').asFloat  := iCodDocumento;
    SP_PROC.parambyName('inPLNCodigo').asInteger   := iPlncodigo;

    try
        SP_PROC.Prepare;
        SP_PROC.ExecProc;

        result := SP_PROC.parambyName('outRetorno').asInteger > 0;

    except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
    end;

  finally
    FreeAndNil(SP_PROC);
  end;

end;

//edilaine SIG115566 : inicio
function TCtrlIntegraOrcFDO.DocumentoProcessado(iCodDocumento, iPlncodigo: integer;
                                                rVlrLanca: double;
                                                bNaFila : boolean = false
                                                ): integer;
var
  _qry    : TwwQuery;
begin

  _qry   := TwwQuery.create(nil);
  try
    _qry.DataBaseName   := DataBaseName;

    _qry.SQL.Add('SELECT  COUNT(C.IDCTRLFILASALDO)   ');
    _qry.SQL.Add('  FROM CTRLFILASALDOFDO C        ');
    _qry.SQL.Add(' WHERE C.CODDOCUMENTO = '+IntToStr(iCodDocumento) );
    _qry.SQL.Add('   AND C.PLNCODIGO    = '+IntToStr(iPlncodigo) );
    _qry.SQL.Add('   AND C.VLRLANCA     = '+OraNum(FloatToStr(rVlrLanca)) );

    if bNaFila then
       _qry.SQL.Add('   AND C.CEPP_ID IS NULL' ); 

    try
      _qry.Open;
      result := _qry.Fields[0].AsInteger;
    except
      On E:Exception Do
       Begin
          Result := -1;
          MessageInfo := E.Message;
       End;
    end;

  finally
    FreeAndNil(_qry);
  end;
end;

function TCtrlIntegraOrcFDO.DocumentoPGA(iPlnCodigo: integer): integer;
var
  _qry    : TwwQuery;
begin

   if iPlnCodigo = 0 then
   begin
     result := -1;
     exit;
   end;

  _qry   := TwwQuery.create(nil);
  try
    _qry.DataBaseName   := DataBaseName;

    _qry.SQL.Add('SELECT COUNT(LC.PLNCODIGO)  ');
    _qry.SQL.Add('  FROM LANCAMENTO LC        ');
    _qry.SQL.Add(' WHERE LC.PLNCODIGO    = '+IntToStr(iPlncodigo) );
    _qry.SQL.Add('   AND LC.IDPLANOPREV  = 110');
    _qry.SQL.Add('   AND LC.PLACONTA LIKE (''40%'')');

    try
      _qry.Open;
      result := _qry.Fields[0].AsInteger;
    except
      On E:Exception Do
       Begin
          Result := -1;
          MessageInfo := E.Message;
       End;
    end;

  finally
    FreeAndNil(_qry);
  end;
end;
//edilaine SIG115566 : fim


//ediline SIG115594 : inicio
function TCtrlIntegraOrcFDO.GetRateioFDO(sNumFDO, sRecPag, sCodCentroRespon : string;
                                         var sMsgErro : string;
                                         sSQLRateio : string = ''          //edilaine SIG115595
                                        ): OleVariant;
var
  sSQL    : string;
  _qry    : TwwQuery;
  iIdFDO  : integer;
begin

  _qry   := TwwQuery.create(nil);
  try
    _qry.DataBaseName   := DataBaseName;

    sSQL := 'SELECT ID_FDO, COD_FDO, SITUACAO '+
            '  FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL '+
            ' WHERE COD_FDO = ' + QuotedStr(sNumFDO);

    _qry.SQL.text := sSQL;
    try
      _qry.Open;

      if _qry.isEmpty then
         sMsgErro := 'Este FDO não existe e/ou o código está errado. Favor verificar !'
      else if _qry.FieldByName('SITUACAO').AsString <> 'APROVADO' then
         sMsgErro := 'Este FDO não está aprovado. Favor verificar !';

      if sMsgErro = '' then
         iIdFDO := _qry.FieldByName('ID_FDO').AsInteger
      else
         iIdFDO := -1;

    except
      On E:Exception Do
       Begin
          iIdFDO := -1;
          MessageInfo := E.Message;
       End;
    end;

    //edilaine SIG115595 : inicio
    //busca rateio
    if sSQLRateio <> '' then
    begin
       sSQL := sSQLRateio;
       sSQL := StringReplace(sSQL, ':iIdFDO', IntToStr(iIdFDO), [rfReplaceAll]);
    end
    else
    begin
      sSQL :=
           'SELECT '                                                   + #13 +
           '  PDR.IDPADRRATEIODOC, '                                   + #13 +
           '  PDR.IDGRUPORATEIO, '                                     + #13 +
           '  PDR.IDPROGRAMA, PGR.DESCPROGRAMA, '                      + #13 +
           '  PDR.IDEMPRESAPROP, '                                     + #13 +
           '  PDR.RECPAG, '                                            + #13 +
           '  PDR.CODTIPRECDES, TRD.DESCRICAO AS TIPODESEMBOLSO, '     + #13 +
           '  PDR.CODCENTROCUSTO, CCU.NOME AS CENTROCUSTO, '           + #13 +
           '  CCU.CODEXTERNO AS CODCCEXTERNO, '                        + #13 +
           '  CRE.CODCENTRORESPON, CRE.NOME AS CENTRORESPON, '         + #13 +
           '  CRE.CODEXTERNO AS CODCREXTERNO, '                        + #13 +
           '  PDR.UNIDNEGOC, UND.NOME AS UNIDNEGOCIO, '                + #13 +
           '  UND.UNETIPO, '                                           + #13 +
           '  PDR.IDPATRO, PTR.NOME AS PATRO, '                        + #13 +
           '  PDR.IDPLANOPREV, PLP.NOME AS PLANPREV, '                 + #13 +
           '  PDR.PERCENTRATEIO, '                                     + #13 +
           '  PDR.VALORFDO, '                                          + #13 +
           '  PDR.TOTAL '                                              + #13 +
           'FROM '                                                     + #13 +
           '     (SELECT '+IntToStr(Sistema.IDEmpresa)+' AS IDEMPRESAPROP, ' + #13 +
           '             '+QuotedStr(sRecPag)+'   AS RECPAG,               ' + #13 +
           '             110     AS IDPLANOPREV,    '                        + #13 +  {PGA}
           '             1117723 AS IDPATRO,        '                        + #13 +  {PGA}
           '             0       AS PERCENTRATEIO,  '                        + #13 +
           '             0       AS IDGRUPORATEIO,  '                        + #13 +
           '             '+sCodCentroRespon+'    AS CODCENTRORESPON,  '      + #13 +
           '             CC.IDPROGRAMA,  '                                   + #13 +
           '             FDO.ID_FDO          AS IDPADRRATEIODOC, '           + #13 +
           '             FDO.ID_ATIVIDADE_PROJETO  AS UNIDNEGOC, '           + #13 +
           '             FDO.ID_CENTRO_CUSTO AS CODCENTROCUSTO,  '           + #13 +
           '             DES.CODIGO          AS CODTIPRECDES,    '           + #13 +
           //'             FDO.VALOR_ITEM      AS VALORFDO,        '           + #13 + // Andre Imakawa - 129028
           '             FDO.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/''))      AS VALORFDO,        ' + #13 + // Andre Imakawa - 129028
           '             FDO.CONTA_CREDITO   AS CONTAC,          '           + #13 +
           '             FDO.CONTA_DEBITO    AS CONTAD,          '           + #13 +
           //'             (SELECT SUM(F.VALOR_ITEM)      '                                + #13 +                    // Andre Imakawa - 129028
           //'                FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO F '  + #13 +                    // Andre Imakawa - 129028
           '             (SELECT SUM(F.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(MES_ANO_SERVICO,''/''))) ' + #13 + // Andre Imakawa - 129028
           '                FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO F '                       + #13 + // Andre Imakawa - 129028
           '                INNER JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL FD ON FD.ID_FDO = F.ID_FDO '  + #13 + // Andre Imakawa - 129028
           '               WHERE F.ID_FDO = FDO.ID_FDO  '                                + #13 +
           '             ) AS TOTAL   '                                                  + #13 +
           '        FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO FDO ' + #13 +
           '        JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL           FDD       '+ #13 + // Andre Imakawa - 129028
           '          ON FDD.ID_FDO = FDO.ID_FDO                                      '+ #13 + // Andre Imakawa - 129028
           '        JOIN USER_INTEGRACAO_ORCAMENTARIA.VW_FDO_DESEMBOLSO     DES ' + #13 +
           '          ON FDO.ID_DESEMBOLSO = DES.IDTIPORDXCCXCONTA              ' + #13 +
           '        JOIN CENTCUST CC ON CC.CODCENTROCUSTO = FDO.ID_CENTRO_CUSTO ' + #13 +
           '       WHERE FDO.ID_FDO = '+IntToStr(iIdFDO)                          + #13 +
           '     ) PDR,  '                                             + #13 +
           '  PESSOA            PTR, '                                 + #13 +
           '  TIPORECEBDESEMB   TRD, '                                 + #13 +
           '  CENTCUST          CCU, '                                 + #13 +
           '  CENTRESPON        CRE, '                                 + #13 +
           '  PLANPREVCONTABIL  PLP, '                                 + #13 +
           '  UNIDNEGOCIO       UND, '                                 + #13 +
           '  PROGRAMA          PGR  '                                 + #13 +
           'WHERE '                                                    + #13 +
           '      PDR.IDEMPRESAPROP   = '+IntToStr(Sistema.IDEmpresa)  + #13 +
           '  AND PDR.RECPAG          = '+QuotedStr(sRecPag)           + #13 +
           '  AND PDR.CODCENTRORESPON = CRE.CODCENTRORESPON  '         + #13 +
           '  AND PDR.IDEMPRESAPROP   = CRE.IDPESSOA '                 + #13 +
           '  AND PDR.IDPATRO         = PTR.IDPESSOA '                 + #13 +
           '  AND PDR.RECPAG          = TRD.RECPAG '                   + #13 +
           '  AND PDR.IDEMPRESAPROP   = TRD.IDPESSOA '                 + #13 +
           '  AND PDR.CODTIPRECDES    = TRD.CODTIPRECDES '             + #13 +
           '  AND PDR.IDEMPRESAPROP   = CCU.IDEMPRESA '                + #13 +
           '  AND PDR.CODCENTROCUSTO  = CCU.CODCENTROCUSTO '           + #13 +
           '  AND PDR.UNIDNEGOC       = UND.UNIDNEGOC '                + #13 +
           '  AND PDR.IDPLANOPREV     = PLP.IDPLANOPREV '              + #13 +
           '  AND PDR.IDPROGRAMA      = PGR.IDPROGRAMA '               + #13 +
           'ORDER BY '                                                 + #13 +
           '  DECODE(PDR.PERCENTRATEIO, 0, PDR.VALORFDO) ';
    end;
    //edilaine SIG115595 : fim

    Result := GetDataPacket( sSQL );

  finally
    FreeAndNil(_qry);
  end;

end;
//edilaine SIG115594 : fim


//edilaine SIG115595 : inicio
function TCtrlIntegraOrcFDO.GetRateioFDO_Contrato(sNumFDO, sIdContrato, sIdObjeto, sIdIem : string;
                                                  var sMsgErro : string
                                                  ) : OleVariant;
var
  sSQL : string;
begin
   sSQL := 'SELECT R.IDRATEIOCCUSTO,   R.IDEMPRESA,   R.IDCONTRATO,     R.IDOBJETO,        '+ #13 +
           '       R.IDITEM,           R.IDPESSOA,    R.UNIDNEGOC,      R.IDPATRO,         '+ #13 +
           '       R.IDPLANOPREV,      R.IDPROGRAMA,  R.CODCENTROCUSTO, R.PERCRATEIOCONTR, '+ #13 +
           '       R.IDPLANOORCAMEN,   R.IDCONTAORCAMEN,      '+ #13 +
           '       PR.DESCPROGRAMA AS NOMEPROG,               '+ #13 +
           '       CC.NOME AS DESCCC,                         '+ #13 +
           '       PA.RAZAOSOCIAL AS NOME_PATRO,              '+ #13 +
           '       PL.NOME AS NOME_PLANO,                     '+ #13 +
           '       UN.NOME AS NOME_UNIDNEGOCIO,               '+ #13 +
           '       ''V''   AS DIVISOR                         '+ #13 +
           ', OI.PLACONTA                                     '+ #13 +
           ', R.IDDESPESAORC, PR.IDPROGRAMAORCAMEN            '+ #13 +
           ', NVL(R.CONTAC, NVL(TR.PLACONTACREDITO, E.CONTACFORN)) AS CONTA  '+ #13 +
           ', NVL(R.CODTIPRECDES, TR.CODTIPRECDES)  AS CODTIPRECDES '+ #13 +
           ', 0 AS TIPODESPESA                                '+ #13 +
           ', 0 AS PLANOORIGEM                                '+ #13 +
           ', 0 AS PATROORIGEM                                '+ #13 +
           ', OI.PLANO                                        '+ #13 +
           ', R.ID_FDO                                        '+ #13 +
           ', R.COD_FDO                                       '+ #13 +
           ', CPM.PARCELANUM                                  '+ #13 +
           ', R.TOTAL                                         '+ #13 +
           ', '+QuotedStr(sNumFDO)+' AS RATEIOFDO             '+ #13 +
           '  FROM                                            '+ #13 +
           '     (SELECT '+IntToStr(Sistema.IDEmpresa)+' AS IDEMPRESA, ' + #13 +
           '             '+IntToStr(Sistema.IDEmpresa)+' AS IDPESSOA,  ' + #13 +
           '            ''P''    AS RECPAG,                   '+ #13 +
           '             110     AS IDPLANOPREV,              '+ #13 +
           '             1117723 AS IDPATRO,                  '+ #13 +
           '             '+sIdObjeto+'    AS IDOBJETO,        '+ #13 +
           '             '+sIdContrato+'  AS IDCONTRATO,      '+ #13 +
           '             '+sIdIem+'       AS IDITEM,          '+ #13 +
           '             -1      AS IDDESPESAORC,             '+ #13 +
           '             -1      AS IDPLANOORCAMEN,           '+ #13 +
           '             -1      AS IDCONTAORCAMEN,           '+ #13 +
           '             CC.IDPROGRAMA,                       '+ #13 +
           '             FDD.COD_FDO,                         '+ #13 +
           '             FDO.ID_FDO,                          '+ #13 +
           '             FDO.ID_FDO          AS IDRATEIOCCUSTO,   '+ #13 +
           '             FDO.ID_ATIVIDADE_PROJETO  AS UNIDNEGOC,  '+ #13 +
           '             FDO.ID_CENTRO_CUSTO AS CODCENTROCUSTO,   '+ #13 +
           '             DES.CODIGO          AS CODTIPRECDES,     '+ #13 +
           //'             FDO.VALOR_ITEM      AS PERCRATEIOCONTR,  '+ #13 + // Andre Imakawa - 129028
           '             FDO.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/'')) AS PERCRATEIOCONTR, ' + #13 + // Andre Imakawa - 129028
           '             FDO.CONTA_CREDITO   AS CONTAC,           '+ #13 +
           '             FDO.CONTA_DEBITO    AS CONTAD,           '+ #13 +
           //'             (SELECT SUM(F.VALOR_ITEM)                '+ #13 +
           //'                FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO F '+ #13 +
           '             (SELECT SUM(F.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(MES_ANO_SERVICO,''/''))) ' + #13 + // Andre Imakawa - 129028
           '                FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO F '                       + #13 + // Andre Imakawa - 129028
           '                INNER JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL FD ON FD.ID_FDO = F.ID_FDO '  + #13 + // Andre Imakawa - 129028
           '               WHERE F.ID_FDO = FDO.ID_FDO                                '+ #13 +
           '             ) AS TOTAL                                                   '+ #13 +
           '        FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO FDO       '+ #13 +
           '        JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL           FDD       '+ #13 +
           '          ON FDD.ID_FDO = FDO.ID_FDO                                      '+ #13 +
           '        JOIN USER_INTEGRACAO_ORCAMENTARIA.VW_FDO_DESEMBOLSO     DES       '+ #13 +
           '          ON FDO.ID_DESEMBOLSO = DES.IDTIPORDXCCXCONTA                    '+ #13 +  // Paulo Nobre - WO28120
           '        JOIN CENTCUST CC ON CC.CODCENTROCUSTO = FDO.ID_CENTRO_CUSTO       '+ #13 +
           '       WHERE FDO.ID_FDO = :iIdFDO                                             '+ #13 +
           '       ) R,                     '+ #13 +
           '       PESSOA             PA,   '+ #13 +
           '       PLANPREVCONTABIL   PL,   '+ #13 +
           '       CENTCUST           CC,   '+ #13 +
           '       PROGRAMA           PR,   '+ #13 +
           '       UNIDNEGOCIO        UN,   '+ #13 +
           '       OBJETOXITEM        OI,   '+ #13 +
           '       TIPORECEBDESEMB    TR,   '+ #13 +
           '       CONTRATOCONTR      C,    '+ #13 +
           '       EMPRESAFORN        E,    '+ #13 +
           '       CTRLPARCELAMEDICAO CPM   '+ #13 +
           ' WHERE R.IDEMPRESA      = CC.IDEMPRESA        '+ #13 +
           '   AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO   '+ #13 +
           '   AND R.IDPROGRAMA     = PR.IDPROGRAMA       '+ #13 +
           '   AND R.IDPATRO        = PA.IDPESSOA         '+ #13 +
           '   AND R.IDPLANOPREV    = PL.IDPLANOPREV      '+ #13 +
           '   AND R.IDPESSOA       = UN.IDPESSOA         '+ #13 +
           '   AND R.UNIDNEGOC      = UN.UNIDNEGOC        '+ #13 +
           '   AND R.IDEMPRESA      = '+IntToStr(Sistema.IDEmpresa)  + #13 +
           '   AND R.IDCONTRATO     = '+sIdContrato       + #13 +
           '   AND R.IDITEM         = OI.IDITEM           '+ #13 +
           '   AND R.IDOBJETO       = OI.IDOBJETO         '+ #13 +
           '   AND OI.IDPESSOA      = TR.IDPESSOA(+)      '+ #13 +
           '   AND OI.CODTIPRECDES  = TR.CODTIPRECDES(+)  '+ #13 +
           '   AND OI.RECPAG        = TR.RECPAG(+)        '+ #13 +
           '   AND R.IDCONTRATO     = C.IDCONTRATO        '+ #13 +
           '   AND C.IDFORCLI       = E.IDFORCLI          '+ #13 +
           '   AND E.IDPESSOA       = R.IDEMPRESA         '+ #13 +
           '   AND R.IDCONTRATO     = CPM.IDCONTRATO(+)   '+ #13 +    //edilaine SIG117244
           '   AND R.IDITEM         = CPM.IDITEM(+)       '+ #13 +    //edilaine SIG117244
           '   AND R.IDOBJETO       = CPM.IDOBJETO(+)     '+ #13 +    //edilaine SIG117244
           '   AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0)         '+ #13 +
           '                                     FROM CTRLPARCELAMEDICAO CPM2         '+ #13 +
           '                                    where CPM2.IDCONTRATO = r.IDCONTRATO  '+ #13 +
           '                                      AND CPM2.IDITEM = r.IDITEM          '+ #13 +
           '                                      AND CPM2.IDOBJETO = r.IDOBJETO)     '+ #13 +
           ' ORDER BY /*DESCCC*/ R.PERCRATEIOCONTR ';   //edilaine SIG117244


  Result :=  GetRateioFDO(sNumFDO, 'P', '', sMsgErro, sSQL);
end;
//edilaine SIG115595 : fim

//==================================================================================================================
// Paulo Nobre - WO15134 - Inicio
//==================================================================================================================
function TCtrlIntegraOrcFDO.GetNovoRateioFDOContrato(sFDOsClausulaIN,
                                                     sIdContrato,
                                                     sIdObjeto,
                                                     sIdIem : string;
                                                     var sMsgErro : string
                                                    ) : OleVariant; 
var
  sSQL, sIdFDOsClausulaIN : string;
  _qry : TwwQuery;
  i : Integer;
begin
  Try
    _qry   := TwwQuery.create(nil);
    try
      _qry.DataBaseName   := DataBaseName;

      // Selecionando para trazer os IDs dos FDOs informados
      sSQL := 'SELECT ID_FDO, COD_FDO, SITUACAO '+
              'FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL '+
              'WHERE COD_FDO IN ' + sFDOsClausulaIN;

      _qry.SQL.text := sSQL;
      try
        _qry.Open;

        if _qry.isEmpty then
          sMsgErro := 'O(s) FDO(s) desta lista não existe(m). Favor verificar !'
        else if _qry.FieldByName('SITUACAO').AsString <> 'APROVADO' then
          sMsgErro := 'Este(s) FDO(s) não está(ão) aprovado(s). Favor verificar !';

        if sMsgErro = '' then
        Begin
           // Montando a clausula IN com os IDs
           sIdFDOsClausulaIN := '(';
            _qry.first;
            while not _qry.EOF do
            begin
              sIdFDOsClausulaIN := sIdFDOsClausulaIN + _qry.FieldByName('ID_FDO').AsString + ',';
              _qry.next;
            end;
            sIdFDOsClausulaIN := Copy(sIdFDOsClausulaIN, 1, Length(sIdFDOsClausulaIN) - 1);
            sIdFDOsClausulaIN := sIdFDOsClausulaIN + ')';
        end
        else
           sIdFDOsClausulaIN := '';

      except
        On E:Exception Do
         Begin
            MessageInfo := E.Message;
         End;
      end;

      sSQL := 'SELECT R.IDRATEIOCCUSTO,   R.IDEMPRESA,   R.IDCONTRATO,     R.IDOBJETO,        '+ #13 +
               '      R.IDITEM,           R.IDPESSOA,    R.UNIDNEGOC,      R.IDPATRO,         '+ #13 +
               '      R.IDPLANOPREV,      R.IDPROGRAMA,  R.CODCENTROCUSTO, R.PERCRATEIOCONTR, '+ #13 +
               '      R.IDPLANOORCAMEN,   R.IDCONTAORCAMEN,      '+ #13 +
               '      PR.DESCPROGRAMA AS NOMEPROG,               '+ #13 +
               '      CC.NOME AS DESCCC,                         '+ #13 +
               '      PA.RAZAOSOCIAL AS NOME_PATRO,              '+ #13 +
               '      PL.NOME AS NOME_PLANO,                     '+ #13 +
               '      UN.NOME AS NOME_UNIDNEGOCIO,               '+ #13 +
               '      ''V''   AS DIVISOR                         '+ #13 +
               '      , OI.PLACONTA                              '+ #13 +
               '      , R.IDDESPESAORC, PR.IDPROGRAMAORCAMEN     '+ #13 +
               '      , NVL(R.CONTAC, NVL(TR.PLACONTACREDITO, E.CONTACFORN)) AS CONTA  '+ #13 +
               '      , NVL(R.CODTIPRECDES, TR.CODTIPRECDES)  AS CODTIPRECDES          '+ #13 +
               '      , 0 AS TIPODESPESA                                '+ #13 +
               '      , 0 AS PLANOORIGEM                                '+ #13 +
               '      , 0 AS PATROORIGEM                                '+ #13 +
               '      , OI.PLANO                                        '+ #13 +
               '      , R.ID_FDO                                        '+ #13 +
               '      , R.COD_FDO                                       '+ #13 +
               '      , CPM.PARCELANUM                                  '+ #13 +
               '      , R.TOTAL                                         '+ #13 +
               '      , NULL AS RATEIOFDO                               '+ #13 +       // com varios FDO´s, aqui deverá ser NULL
               'FROM                                                    '+ #13 +
               '   (SELECT '+IntToStr(Sistema.IDEmpresa)+' AS IDEMPRESA, ' + #13 +
               '           '+IntToStr(Sistema.IDEmpresa)+' AS IDPESSOA,  ' + #13 +
               '           ''P''    AS RECPAG,                   '+ #13 +
               '            110     AS IDPLANOPREV,              '+ #13 +
               '            1117723 AS IDPATRO,                  '+ #13 +
               '            '+sIdObjeto+'    AS IDOBJETO,        '+ #13 +
               '            '+sIdContrato+'  AS IDCONTRATO,      '+ #13 +
               '            '+sIdIem+'       AS IDITEM,          '+ #13 +
               '            -1      AS IDDESPESAORC,             '+ #13 +
               '            -1      AS IDPLANOORCAMEN,           '+ #13 +
               '            -1      AS IDCONTAORCAMEN,           '+ #13 +
               '            CC.IDPROGRAMA,                       '+ #13 +
               '            FDD.COD_FDO,                         '+ #13 +
               '            FDO.ID_FDO,                          '+ #13 +
               '            FDO.ID_FDO          AS IDRATEIOCCUSTO,   '+ #13 +
               '            FDO.ID_ATIVIDADE_PROJETO  AS UNIDNEGOC,  '+ #13 +
               '            FDO.ID_CENTRO_CUSTO AS CODCENTROCUSTO,   '+ #13 +
               '            DES.CODIGO          AS CODTIPRECDES,     '+ #13 +
               '            FDO.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(FDD.MES_ANO_SERVICO,''/'')) AS PERCRATEIOCONTR, ' + #13 + // Andre Imakawa - 129028
               '            FDO.CONTA_CREDITO   AS CONTAC,           '+ #13 +
               '            FDO.CONTA_DEBITO    AS CONTAD,           '+ #13 +
               '            (SELECT SUM(F.VALOR_TOTAL_ITEM / DECODE(REGEXP_COUNT(MES_ANO_SERVICO,''/''),0,1,REGEXP_COUNT(MES_ANO_SERVICO,''/''))) ' + #13 + // Andre Imakawa - 129028
               '             FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO F '                       + #13 +
               '             INNER JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL FD ON FD.ID_FDO = F.ID_FDO '  + #13 +
               '             WHERE F.ID_FDO IN ' + sIdFDOsClausulaIN                       + #13 +
               '             ) AS TOTAL                                                   '+ #13 +
               '        FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_ITEM_ORCAMENTARIO FDO       '+ #13 +
               '        JOIN USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL           FDD       '+ #13 +
               '          ON FDD.ID_FDO = FDO.ID_FDO                                      '+ #13 +
               '        JOIN USER_INTEGRACAO_ORCAMENTARIA.VW_FDO_DESEMBOLSO     DES       '+ #13 +
               '          ON FDO.ID_DESEMBOLSO = DES.IDTIPORDXCCXCONTA                    '+ #13 +  // Paulo Nobre - WO28120
               '        JOIN CENTCUST CC ON CC.CODCENTROCUSTO = FDO.ID_CENTRO_CUSTO       '+ #13 +
               '       WHERE FDO.ID_FDO IN ' + sIdFDOsClausulaIN                           + #13 +
               '       ) R,                     '+ #13 +
               '       PESSOA             PA,   '+ #13 +
               '       PLANPREVCONTABIL   PL,   '+ #13 +
               '       CENTCUST           CC,   '+ #13 +
               '       PROGRAMA           PR,   '+ #13 +
               '       UNIDNEGOCIO        UN,   '+ #13 +
               '       OBJETOXITEM        OI,   '+ #13 +
               '       TIPORECEBDESEMB    TR,   '+ #13 +
               '       CONTRATOCONTR      C,    '+ #13 +
               '       EMPRESAFORN        E,    '+ #13 +
               '       CTRLPARCELAMEDICAO CPM   '+ #13 +
               ' WHERE R.IDEMPRESA      = CC.IDEMPRESA        '+ #13 +
               '   AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO   '+ #13 +
               '   AND R.IDPROGRAMA     = PR.IDPROGRAMA       '+ #13 +
               '   AND R.IDPATRO        = PA.IDPESSOA         '+ #13 +
               '   AND R.IDPLANOPREV    = PL.IDPLANOPREV      '+ #13 +
               '   AND R.IDPESSOA       = UN.IDPESSOA         '+ #13 +
               '   AND R.UNIDNEGOC      = UN.UNIDNEGOC        '+ #13 +
               '   AND R.IDEMPRESA      = '+IntToStr(Sistema.IDEmpresa)  + #13 +
               '   AND R.IDCONTRATO     = '+sIdContrato       + #13 +
               '   AND R.IDITEM         = OI.IDITEM           '+ #13 +
               '   AND R.IDOBJETO       = OI.IDOBJETO         '+ #13 +
               '   AND OI.IDPESSOA      = TR.IDPESSOA(+)      '+ #13 +
               '   AND OI.CODTIPRECDES  = TR.CODTIPRECDES(+)  '+ #13 +
               '   AND OI.RECPAG        = TR.RECPAG(+)        '+ #13 +
               '   AND R.IDCONTRATO     = C.IDCONTRATO        '+ #13 +
               '   AND C.IDFORCLI       = E.IDFORCLI          '+ #13 +
               '   AND E.IDPESSOA       = R.IDEMPRESA         '+ #13 +
               '   AND R.IDCONTRATO     = CPM.IDCONTRATO(+)   '+ #13 +
               '   AND R.IDITEM         = CPM.IDITEM(+)       '+ #13 +
               '   AND R.IDOBJETO       = CPM.IDOBJETO(+)     '+ #13 +
               '   AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0)         '+ #13 +
               '                                  FROM CTRLPARCELAMEDICAO CPM2            '+ #13 +
               '                                  WHERE CPM2.IDCONTRATO = r.IDCONTRATO    '+ #13 +
               '                                        AND CPM2.IDITEM = r.IDITEM        '+ #13 +
               '                                        AND CPM2.IDOBJETO = r.IDOBJETO)   '+ #13 +
               ' ORDER BY R.COD_FDO, CPM.PARCELANUM, R.PERCRATEIOCONTR';

       Result := GetDataPacket( sSQL );
    Except
      On E:Exception Do
      Begin
        MessageInfo := E.Message;
      End
    end
  finally
    FreeAndNil(_qry);
  End;

end;
//==================================================================================================================
// Paulo Nobre - WO15134 - Fim
//==================================================================================================================

end.


