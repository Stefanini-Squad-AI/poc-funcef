unit uCtrlAtivoCota;

interface

uses  DB, uDatabase, uCmControlObject, Messages, dbClient, StdCtrls, Sysutils,
      uSistema, dBasedados, uCmTypes, CmEventosCadastro, uCmClientdataset,
      dbtables, uMensErro, uMidasUtil, uCmSQLParams, Classes, uDbAtivoCota;



type
    TCtrlAtivoCota = class(TCmControlObject)


    private
    FcdsAtivoCota: TCmClientDataSet;
    FDbAtivoCota: TDbAtivoCota;
    procedure SetcdsAtivoCota(const Value: TCmClientDataSet);
    procedure SetDbAtivoCota(const Value: TDbAtivoCota);


     protected
             procedure AfterInitialize; override;
             procedure OnCreateAppserver; override;



     public

             TAInvestimento :    integer;
             TAImovel :          integer;
             TATipoContrEmptmo : integer;
             TAFundoInvest : integer;
             TotalAtivos :       integer;



             constructor Create;  override;
             destructor Destroy;  override;

             property cdsAtivoCota : TCmClientDataSet read FcdsAtivoCota write SetcdsAtivoCota;
             property DbAtivoCota : TDbAtivoCota read FDbAtivoCota write SetDbAtivoCota;


             function GravarAtivoCota : Boolean;
             function ListaAtivoCota(const IdAtivoCota: integer = -1; const DescricaoReq: Boolean = False) : OleVariant;
             function ListaAtivosNovosINVESTIMENTO : OleVariant;
             function ListaAtivosNovosIMOVEL : OleVariant;
             function ListaAtivosNovosTIPOCONTREMPTMO : OleVariant;
             function ListaAtivosNovosFUNDOINVEST : OleVariant;
             function ListaAtivosManuais : OleVariant;
             function TransfereDados  : Boolean;
             function VerificaAtivoCadastrado (const sDescricao : string; iIdAtivoCota : integer = -1): Boolean;
             function  ListaCotaCotacao(const iIdCotaCotacao :integer =-1): OleVariant;



     published



end;

implementation

{ TCtrlAtivoCota }

procedure TCtrlAtivoCota.AfterInitialize;
begin
  inherited;
  FDbAtivoCota.DataBaseName := DatabaseName;

end;


constructor TCtrlAtivoCota.Create;
begin
  inherited;
  FDbAtivoCota := TDbAtivoCota.Create(self);

end;


destructor TCtrlAtivoCota.Destroy;
begin
  FreeAndNil (FDbAtivoCota);
  // Destrói os Cd's criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
  FreeAndNil (FCdsAtivoCota);
  inherited;

end;



function TCtrlAtivoCota.GravarAtivoCota: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaAtivoCota( CdsAtivoCota.Data );

    //exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      //inicia a transacao
      StartTransaction;
      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsAtivoCota, DbAtivoCota, [], [] );
      if not Result then
        raise Exception.Create(DbAtivoCota.MessageInfo);
      Commit;
      //em caso de erro, anula transacao
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

end;


function TCtrlAtivoCota.ListaAtivoCota
         (const IdAtivoCota: integer; const DescricaoReq: Boolean) : OleVariant;
var
sSQL: string;
//lista uma qry em branco da tabela ATIVOCOTA
begin
  sSQL := 'SELECT * FROM ATIVOCOTA'                                      + #13 +
          'WHERE IDATIVOCOTA = '+IntToStr(IDAtivoCota);
          if DescricaoReq  then
          sSQL := ' SELECT IDATIVOCOTA, DESCRICAO FROM ATIVOCOTA '       + #13 +
                  ' WHERE DESCRICAO IS NOT NULL '                        + #13 +
                  ' ORDER BY DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;


procedure TCtrlAtivoCota.OnCreateAppserver;
begin
  inherited;
  CdsAtivoCota := TCmClientDataSet.Create(nil);
end;


procedure TCtrlAtivoCota.SetcdsAtivoCota(const Value: TCmClientDataSet);
begin
  FCdsAtivoCota := Value;
end;



procedure TCtrlAtivoCota.SetDbAtivoCota(const Value: TDbAtivoCota);
begin
  FDbAtivoCota := Value;
end;



function TCtrlAtivoCota.TransfereDados: Boolean;
var
  _cdsLocal: TCMClientDataSet;

begin
  //zera as variáveis
  TAInvestimento := 0;
  TAImovel := 0;
  TATipoContrEmptmo := 0;
  TAFundoInvest := 0;
  TotalAtivos := 0;

  //faz a gravação dos ativos novos
  try
    try
      //cria o Cds local
      _cdsLocal := TCmClientDataSet.Create(nil);

      //Inicia a transação
      StartTransaction;

      //----------------- TABELA TIPOCONTREMPTMO -----------------------------//
      //carrega os dados dos novos ativos da tabela TIPOCONTREMPTMO
      _cdsLocal.Data := ListaAtivosNovosTIPOCONTREMPTMO;

      //passa a quantidade de registros da tabela TIPOCONTREMPTMO
      //para as variáveis TAInvestimento e TotalAtivos
      TATipoContrEmptmo := _cdsLocal.RecordCount;
      TotalAtivos := TATipoContrEmptmo;

      //se encontrado, começa o laço de inserção do(s) registro(s)- tabela TIPOCONTREMPTMO
      while not _cdsLocal.Eof do begin
        FDbAtivoCota.Clear;
        FDbAtivoCota.IdTIPOCONTREMPTMO.AsInteger :=
        _cdsLocal.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
        if not FDbAtivoCota.Insert then
          raise exception.Create (FDbAtivoCota.MessageInfo);
        _CdsLocal.Next;
      end;
      //termina o laço de inserção do(s) registro(s)- tabela TIPOCONTREMPTMO


      //---------------------- TABELA INVESTIMENTO ---------------------------//
      //carrega os dados dos novos ativos da tabela INVESTIMENTO
      _cdsLocal.Data := ListaAtivosNovosINVESTIMENTO;

      //passa a quantidade de registros da tabela INVESTIMENTO
      // para as variáveis
      TAInvestimento := _cdsLocal.RecordCount;
      TotalAtivos := TotalAtivos + TAInvestimento;

      {se encontrado, começa o laço de inserção do(s) registro(s)-
       tabela INVESTIMENTO}
      while not _cdsLocal.Eof do begin
        FDbAtivoCota.Clear;
        FDbAtivoCota.Idinvestimento.AsInteger :=
        _cdsLocal.FieldByName('IDINVESTIMENTO').AsInteger;
        if not FDbAtivoCota.Insert then
          raise exception.Create (FDbAtivoCota.MessageInfo);
        _CdsLocal.Next;
      end;
      //termina o laço de inserção do(s) registro(s)- tabela INVESTIMENTO


      //------------------------ TABELA IMOVEL -------------------------------//
      //carrega os dados da tabela IMOVEL
      _cdsLocal.Data := ListaAtivosNovosIMOVEL;

      //passa a quantidade de registros da tabela IMOVEL
      // para as variáveis
      TAImovel := _cdsLocal.RecordCount;
      TotalAtivos := TotalAtivos + TAImovel;

      //se encontrado, começa o laço de inserção do(s) registro(s)- tabela IMOVEL
      while not _cdsLocal.Eof do begin
        FDbAtivoCota.Clear;
        FDbAtivoCota.IdIMOVEL.AsInteger :=
        _cdsLocal.FieldByName('IDIMOVEL').AsInteger;
        if not FDbAtivoCota.Insert then
          raise exception.Create (FDbAtivoCota.MessageInfo);
        _CdsLocal.Next;
      end;
      //termina o laço de inserção do(s) registro(s)- tabela IMOVEL


     //--------------------- TABELA FUNDOINVEST ------------------------------//
      //carrega os dados da tabela FUNDOINVEST
      _cdsLocal.Data := ListaAtivosNovosFUNDOINVEST;

      //passa a quantidade de registros da tabela FUNDOINVEST
      // para as variáveis
      TAFundoInvest := _cdsLocal.RecordCount;
      TotalAtivos := TotalAtivos + TAFundoInvest;

      //se encontrado, começa o laço de inserção do(s) registro(s)- tabela IMOVEL
      while not _cdsLocal.Eof do begin
        FDbAtivoCota.Clear;
        FDbAtivoCota.Idfundoinvest.AsInteger :=
        _cdsLocal.FieldByName('IDFUNDOINVEST').AsInteger;
        if not FDbAtivoCota.Insert then
          raise exception.Create (FDbAtivoCota.MessageInfo);
        _CdsLocal.Next;
      end;
      //termina o laço de inserção do(s) registro(s)- tabela FUNDOINVEST


      //Confirma a transação
      Commit;
      Result := true;

    //no caso de erro do bloco acima
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;

    end;

  //destrói o cds Local
  finally
    FreeAndNil(_cdsLocal);
  end;
//fim do bloco
end;



function TCtrlAtivoCota.ListaAtivosNovosIMOVEL: OleVariant;
var
sSQL: string;
//lista os ativos novos da tabela IMOVEL
begin
sSQL := 'SELECT I.IDIMOVEL'                                              + #13 +
        'FROM IMOVEL I'                                                  + #13 +
        'WHERE I.IDIMOVELMESTRE IS NOT NULL'                             + #13 +
        'AND I.CODTIPIMOVEL IS NOT NULL'                                 + #13 +
        'AND I.FLGATIVO = 1'                                             + #13 +
        'AND NOT EXISTS'                                                 + #13 +
        '(SELECT 1 FROM ATIVOCOTA A '                                    + #13 +
        'WHERE A.IDIMOVEL = I.IDIMOVEL)';
Result := GetDataPacket(sSQL);
end;




function TCtrlAtivoCota.ListaAtivosNovosTIPOCONTREMPTMO: OleVariant;
var
sSQL: string;
//lista os NOVOS ativos da tabela TIPOCONTREMPTMO
begin
sSQL := 'SELECT T.IDTIPOCONTREMPTMO,T.FLGSITUACAO,'                      + #13 +
        'A.IDTIPOCONTREMPTMO'                                            + #13 +
        'FROM TIPOCONTREMPTMO T, ATIVOCOTA A'                            + #13 +
        'WHERE T.FLGSITUACAO = ''A'' '                                   + #13 +
        'AND NOT A.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO';
Result := GetDataPacket(sSQL);
end;



function TCtrlAtivoCota.ListaAtivosNovosINVESTIMENTO: OleVariant;
var
sSQL: string;
//lista os NOVOS ativos da tabela INVESTIMENTO
begin
sSQL := 'SELECT IDINVESTIMENTO'                                          + #13 +
        'FROM   INVESTIMENTO I'                                          + #13 +
        'WHERE  (NVL(I.FLGATIVO,''S'') = ''S'') '                        + #13 +
        'AND NOT EXISTS'                                                 + #13 +
        '(SELECT 1 FROM ATIVOCOTA A '                                    + #13 +
        'WHERE A.IDINVESTIMENTO = I.IDINVESTIMENTO)';
Result := GetDataPacket(sSQL);
end;



function TCtrlAtivoCota.ListaAtivosNovosFUNDOINVEST: OleVariant;
var
sSQL: string;
//Lista os NOVOS ativos da tabela FUNDOINVEST
begin
sSQL := 'SELECT T.IDFUNDOINVEST'                                         + #13 +
        'FROM FUNDOINVEST T'                                             + #13 +
        'WHERE NOT EXISTS'                                               + #13 +
        '(SELECT 1 FROM ATIVOCOTA A'                                     + #13 +
        'WHERE A.IDFUNDOINVEST = T.IDFUNDOINVEST)';
Result := GetDataPacket(sSQL);
end;



function TCtrlAtivoCota.ListaAtivosManuais: OleVariant;
var
sSQL: string;
{Lista os ativos lançados manualmente na tabela ATIVOCOTA}
begin
  sSQL := 'SELECT IDATIVOCOTA,IDCARTEIRASPC,DESCRICAO FROM ATIVOCOTA'    + #13 +
          'WHERE IDIMOVEL IS NULL'                                       + #13 +
          'AND IDTIPOCONTREMPTMO IS NULL'                                + #13 +
          'AND IDINVESTIMENTO IS NULL'                                   + #13 +
          'AND IDFUNDOINVEST IS NULL'                                    + #13 +
          'ORDER BY DESCRICAO';

  Result := GetDataPacket(sSQL);
end;


function TCtrlAtivoCota.VerificaAtivoCadastrado(const sDescricao: string;
  iIdAtivoCota: integer): Boolean;
var
sSQL : string;

begin
  Result := False;
  sSQL := 'SELECT IDATIVOCOTA FROM ATIVOCOTA '                           + #13 +
          'WHERE UPPER(DESCRICAO) = ' + QuotedStr(AnsiUpperCase(sDescricao));
          if iIdAtivoCota <> -1 then
          sSQL := sSQl + ' AND IDATIVOCOTA <> ' + IntToStr(iIdAtivoCota);
  _Cds.Data := GetDataPacket(sSQL);

  if _Cds.RecordCount > 0 then
  Result := True;

end;



function TCtrlAtivoCota.ListaCotaCotacao(const iIdCotaCotacao: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL :=
     ' SELECT '                                                          + #13 +
     '    DECODE(A.DESCRICAO,NULL, '                                     + #13 +
     '    DECODE(A.IDINVESTIMENTO,NULL, '                                + #13 +
     '    DECODE(A.IDTIPOCONTREMPTMO,NULL, '                             + #13 +
     '    DECODE(A.IDIMOVEL,NULL, '                                      + #13 +
     '    DECODE(A.IDFUNDOINVEST,NULL,'''', '                            + #13 +
     '         (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  IDFUNDOINVEST     =  A.IDFUNDOINVEST)) '     + #13 +
     '        ,(SELECT  IMONOME          FROM  IMOVEL           WHERE  IDIMOVEL          =  A.IDIMOVEL)) '          + #13 +
     '        ,(SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)) ' + #13 +
     '        ,(SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  IDINVESTIMENTO    =  A.IDINVESTIMENTO)) '    + #13 +
     '        ,A.DESCRICAO) AS ATIVO, '                                  + #13 +
     '  C.IDCOTACOTACAO, C.DATA, C.IDATIVOCOTA, C.IDPATRO, '             + #13 +
     '  C.IDPLANO, C.VLRCOTA, C.VLRPATRIMONIO, C.QTDCOTA, '              + #13 +
     '  PTR.NOME AS NOMEPATRO, PRV.NOME AS NOMEPLANO '                   + #13 +
     'FROM '                                                             + #13 +
     '  COTACOTACAO C, ATIVOCOTA A, PESSOA PTR, PLANPREVCONTABIL PRV '   + #13 +

     'WHERE '                                                            + #13 +
     '  C.IDATIVOCOTA = A.IDATIVOCOTA '                                  + #13 +
     'AND '                                                              + #13 +
     '  C.IDPATRO = PTR.IDPESSOA '                                       + #13 +
     'AND '                                                              + #13 +
     '  C.IDPLANO = PRV.IDPLANOPREV ';

     if iIdCotaCotacao <> -1 then sSQL :=  sSQL +
     '   AND  C.IDCOTACOTACAO = ' + IntToStr(iIdCotaCotacao)             + #13;

     sSQL := sSQL +
     'ORDER BY '                                                         + #13 +
     '   ATIVO ';

   Result := GetDataPacket(sSQL);
end;



end.
