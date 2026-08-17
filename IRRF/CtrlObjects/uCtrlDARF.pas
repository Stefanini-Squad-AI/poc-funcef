unit uCtrlDARF;
// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina:         GravarDocumento
Data:           15/07/2024
Pendencia:      WO10032 - Contas a Pagar - Remessa eletrônica
Autor:          Arnaldo Vicente Scarin
Descricao:      Quando o documento de origem possui diversas contas de baixa
                (CCBaixasXDocum preenchida), deveriam ser levadas essas contas
                para o Documento de Arrecadação de Impostos que é gerado a partir
                do DARF, mas isso não é feito. Em reunião ocorrida com o Cassio e
                o Depto. Contabil, foi informado que esses documentos podem ser
                criados somente com uma conta de baixa e para tanto será utilizada
                a conta de baixa que está vinculada ao Alterador do Imposto.
----------------------------------------------------------------------------------------------------
Rotina    : ProcurarDarf
Data      : 26/03/2008
Autor     : Bruno Bastos
Pendencia : 27473
Descrição : Alterando consulta da Rotina
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 22063
Data.....: 11/04/2006
Rotina...: GravarDocumento
Descrição: Se for uma alteração de documento, gravar primeiro o lançamento do do_
           cumento depois seus alteradores.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 21709
Data.....: 24/03/2006
Rotina...: GravarDocumento
Descrição: Testar se o cdsRateio está nulo, para evitar erro ao excluir um darf.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 21131
Rotina...: GravarDocumento
Descrição: Passar o campo UnidNegoc para as rotinas que gravam RateioDocum,
           LanctoDocum, CcBaixasxDocum.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 19007
Rotina...: GravarDocumento
Descrição: Alterada a rotina de inserção da CCBaixasxDocum
----------------------------------------------------------------------------------------------------
Analista.: Marchetti
Pendencia: 16079
Rotina...: GravarDocumento
Descrição: Processo de gravacao da segregacao de recursos
----------------------------------------------------------------------------------------------------
Analista.: Flavio Dias
Pendencia: 17596
Rotina...: Darf.ListPlanoPrev;
Descrição: Filtrar planos ativos
---------------------------------------------------------------------------------------------------}

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uDbDARF, DB, uDataBase, uSistema, DbClient, UctrlDocumento,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},
  uCtrlSegregacao, uCtrlParamIntegra;


  type
    TCtrlDARF = Class(TCmControlObject)

    private

    FDbDARF: TDbDARF;

    FCdsDARF          : TClientDataSet;
    CdsAux            : TClientDataSet;
    Documento         : TCtrlDocumento;
    CdsDocumento      : TClientDataSet;
    CdsLancamentos    : TClientDataSet;

    CdsCCBaixasxDocum : TClientDataSet; 
    CdsRateios        : TClientDataSet;
    CtrlSegregacao    : TCtrlSegregacao;

    FCodDocumento     : Double;

    procedure SetDbDARF(const Value: TDbDARF);
    procedure SetCdsDARF(const Value: TClientDataSet);
    procedure SetCodDocumento(const Value: Double);


    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

    public

      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsDARF      : TClientDataSet  read FCdsDARF       write SetCdsDARF;
      property DbDARF       : TDbDARF         read FDbDARF        write setDbDARF;
      property CodDocumento : Double          read FCodDocumento  write SetCodDocumento;

      // Grava Alterações das Naturezas de rendimento no Banco de Dados
      Function GravarDARF(bAbreTransacao : Boolean = True): Boolean;

      function ProcurarDARF(IdDarf, IDPessoa : Integer): OleVariant;

      function ListPlanoPrev      : OleVariant;   // Lista os planos prevs
      function ListPatrocinadora  : OleVariant;   // Lista as pratrocinadoras
      function ListPrograma       : OleVariant;   // Lista os programas
      function ListCidades        : OleVariant;   // Lista os municípios

      {Verifica se existe lançamento para o IdDarf}
      function PegaCountLancIRRF(IdDarf : integer) : Integer;
      {Lista dados empresaprop}
      function ListEmpresaProp(IdEmpresa : integer) : OleVariant;
      {pega o id do Darf}
      function PegaId(Tabela : string) : LongInt;
      {Lista os dados da Natureza de rendimento}
      function ListDadosNaturendimento(IDPessoa : LongInt; CodNatureza : string) : OleVariant;
      {Lista parâmetros do livro}
      function ListParametrosIRRF(IDPessoa: LongInt) : OleVariant;
      {Atualiza os Lançamentos}
      function AtualizaLanc(IdDarf : integer) : Boolean;

      {Lista DARF's para exclusão múltipla}
      function ListaDarfsAExcluir(bAbreCdsVazio,bFiltroVencimento: boolean; dDtInicial,dDtFinal: TDAteTime) : OleVariant;


      function AtualizaDarf(idDarf : LongInt; CodDocumento : longInt = 0) : Boolean;

      function ListBaixa(CodDocumento : longInt) : OleVariant;

      function ListLanctoDoc(CodDocumento : LongInt) : OleVariant;

      function ListLancamentos(CodDocumento : LongInt) : OleVariant;

      function ListDadosDoc(CodDocumento : longInt) : OleVariant;

      {grava as alterações no documento
       o parâmetro operação:
         I - inclusão
         A - Alteração
         E - Excluir
      }

      function GravarDocumento(DataDocumento, DataLancamentos, DataRateios, DataCCBaixasxDocum : OleVariant;
                               Operacao : char;
                               EspAcesso, IdUsuario : integer;
                               pCodDocumento : Integer = -1;
                               pCodigoNatureza : String = '') : Boolean;
      {Procura lancamentos}
      function ProcurarLancamentos(CodDocumento : LongInt) : OleVariant;
      {procura Documento}
      function ProcurarDocumento(CodDocumento : LongInt) : OleVariant;
      {procurar rateio}
      function ProcurarRateio(CodDocumento : LongInt) : OleVariant;
      {inclui  rateio}
      function IncluirRateio(DataRateio : OleVariant) : Boolean;
      {inclui Lançamento}
      function IncluirLancamento(DataLancamento : OleVariant) : Boolean;
      {lista lançamentos com juros}
      function ListLancJuros(CodDocumento, NumLancto : integer) : OleVariant;
      {Excluir Lançamento}
      function ExcluirLancamento(CodDocumento, NumLancto : integer) : Boolean;
      {Atualiza IR}
      function AtualizaLancIRRF(IdDarf : integer) : Boolean;

      function AtualizaAuteradores(CodDocumento, Numlancamento : LongInt; Operacao : string) : Boolean;

      function OraNumero (Numero: string): string;

      function ExcluiDocumento (iCodDocumento, EspAcesso, IdUsuario: LongInt) : Boolean;


    end;



implementation
{ TCtrlDARF }



constructor TCtrlDARF.Create;
begin
  inherited;

  documento      := TCtrlDocumento.Create;

  FDbDARF        := TDbDARF.create(self);
  FcdsDARF       := TClientDataSet.Create(nil);
  cdsAux         := TClientDataSet.Create(nil);

  CdsDocumento   := TClientDataSet.Create(nil);
  CdsLancamentos := TClientDataSet.Create(nil);

  CdsCCBaixasxDocum := TClientDataSet.Create(nil);
  CdsRateios        := TClientDataSet.Create(nil);

  CtrlSegregacao    := TCtrlSegregacao.Create;
end;



destructor TCtrlDARF.Destroy;
begin
  FDbDARF.Free;
  Documento.Free;
  if isAppServer then
    Begin
      FCdsDARF.free;
      cdsAux.free;
      CdsDocumento.free;
      CdsLancamentos.free;
      CdsCCBaixasxDocum.Free; 
      CdsRateios.free;
    end;

  CtrlSegregacao.Free;

  inherited;
end;

procedure TCtrlDARF.DoChangeDataBase;
begin
  inherited;
  DbDARF.DataBaseName   := DataBaseName;
end;




procedure TCtrlDARF.SetCdsDARF(
  const Value: TClientDataSet);
begin
  FCdsDARF := Value;
end;

procedure TCtrlDARF.SetDbDARF(
        const Value: TDbDARF);
begin
  FDbDARF := Value;
end;

function TCtrlDARF.GravarDARF(bAbreTransacao : Boolean = True) : Boolean;
var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDARF(FCdsDARF.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           if bAbreTransacao then StartTransaction;
           // Pai
           Result := ApplyCds(CdsDARF,FDbDARF,[],[] );
           Msg    := FDbDARF.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           if bAbreTransacao then Commit;
        except
           On E:Exception Do
            Begin
               if bAbreTransacao then Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlDARF.ProcurarDARF(IdDarf, IDPessoa : Integer) : OleVariant;
var
  sSQL : string;
begin
  {CPrev - Pend. 27473 - Início
  sSQL := 'SELECT * '+
          '  FROM DARF '+
          ' WHERE IDDARF = '+intTostr(IdDarf) + ' '+
          '   AND IDPESSOA = '+intTostr(IDPessoa);
  }

  sSQL := ' SELECT '+
          '   LDC.DATALANCTO AS DATAPAGTODARF, '+
          '   DRF.* '+
          ' FROM '+
          '   LANCTODOCUM LDC, '+
          '   DARF        DRF '+
          ' WHERE DRF.IDDARF = '+intTostr(IdDarf) +
          '   AND DRF.IDPESSOA = '+intTostr(IDPessoa)+
          '   AND DRF.CODDOCUMENTO = LDC.CODDOCUMENTO(+) '+
          '   AND LDC.OPERACAO(+)        = ''5'' ';
  //CPrev - Pend. 27473 - Fim

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlDARF.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlDARF.ListPlanoPrev: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPLANOPREV, NOME '+
          'FROM PLANPREVCONTABIL '+
          'WHERE NVL(ATIVO,''S'') = ''S''  ' +         
          'ORDER BY NOME ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ListPatrocinadora: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.NOME, PT.IDPESSOA '+
          '  FROM PESSOA P, PATRO PT '+
          ' WHERE (P.IDPESSOA = PT.IDPESSOA)';
  Result := GetDataPacket(sSQL);        
end;

function TCtrlDARF.ListPrograma: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA '+
          '  FROM PROGRAMA '+
          ' ORDER BY CODPROGRAMA ';
  result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ListCidades: OleVariant;
var
 sSQL : string;
begin
  sSQL := 'SELECT IDCIDADES, NOME '+
          '  FROM CIDADES '+
          ' ORDER BY NOME ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.PegaCountLancIRRF(IdDarf: integer): Integer;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.PegaCountLancIRRF(IdDarf);
  End
  else
    Begin
      sSQL := 'SELECT COUNT(*) AS TOTDARF '+
              '  FROM LANCIRRF '+
              ' WHERE (IDDARF = '+IntToStr(IdDarf)+')';
      CdsAux.data := GetDataPacket(sSQL);
      Result := CdsAux.FieldByName('TOTDARF').Asinteger;
    end;
end;

function TCtrlDARF.ListEmpresaProp(IdEmpresa: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT RAZAOSOCIAL, NOME, NUMDOCUMENTO, TIPO '+
          '  FROM PESSOA '+
          ' WHERE IDPESSOA = '+intTostr(IdEmpresa);
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.PegaId(Tabela : string) : LongInt;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.PegaId(Tabela);
  End
  else
    Result := GetSequence(Tabela);
end;

function TCtrlDARF.ListDadosNaturendimento(IDPessoa : LongInt; CodNatureza : string) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT N.CODTIPRECDES, '+
          '       N.IDPESSOA, '+
          '       N.RECPAG, '+
          '       N.IDFORCLI, '+
          '       E.PLANO AS PLANOFORN, '+
          '       E.CODSUBCONTA, '+
          '       E.CODCENTROCUSTO, '+
          '       E.CONTACFORN, '+
          '       T.PLACONTACREDITO, '+
          '       T.PLANO AS PLANODESEMB '+
          '  FROM NATURENDIMENTO N, EMPRESAFORN E, TIPORECEBDESEMB T '+
          ' WHERE (N.IDPESSOA = '+intTostr(IDPessoa)+') '+
          '   AND (N.CODNATUREZA = '+QuotedStr(CodNatureza)+') '+
          '   AND (E.IDFORCLI = N.IDFORCLI) '+
          '   AND (E.IDPESSOA = N.IDPESSOA) '+
          '   AND (T.IDPESSOA = N.IDPESSOA) '+
          '   AND (T.CODTIPRECDES = N.CODTIPRECDES) '+
          '   AND (T.ATIVO = ''S'') '+  
          '   AND (T.RECPAG = N.RECPAG) ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlDARF.ListParametrosIRRF(IDPessoa: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT L.IDFORCLI,L.CODTIPRECDES,E.PLANO,E.CODSUBCONTA,L.CODCENTRORESPON, '+
          '       E.CODCENTROCUSTO,E.CONTACFORN,L.CODTIPDOC, L.CODALTJUROS, '+
          '       L.CODALTMULTA,L.UNIDNEGOC, L.CODALTDESCONTO '+
          '  FROM EMPRESAFORN E, PARAMIRRF L '+
          ' WHERE (L.IDPESSOA = '+IntToStr(IDPessoa)+') '+
          '   AND (E.IDPESSOA = L.IDPESSOA) '+
          '   AND (E.IDFORCLI = L.IDFORCLI) ';
  Result := GetDataPacket(sSQL);
end;


function TCtrlDARF.AtualizaLanc(IdDarf: integer): Boolean;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizaLanc(IdDarf);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  else
    Begin
      Result := True;
      sSQL := 'UPDATE LANCIRRF '+
            '   SET IDDARF = NULL, '+
            '       FLGDARF = ''N'' '+
            ' WHERE (IDDARF = '+intTostr(IdDarf)+') ';
      if not ExecSQL(sSQL) then
         Result := False;
    end;
end;

function TCtrlDARF.ListBaixa(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT OPERACAO '+
          '  FROM LANCTODOCUM '+
          ' WHERE (CODDOCUMENTO = '+IntToStr(CodDocumento)+') '+
          '   AND (OPERACAO = ''5 '') '+
          '   AND (ESTORNO IS NULL)';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ListLanctoDoc(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT PLNCODIGO '+
          '  FROM LANCTODOCUM '+
          ' WHERE (CODDOCUMENTO = '+IntToStr(CodDocumento)+') '+
          '   AND (PLNCODIGO IS NOT NULL) '+
          ' GROUP BY PLNCODIGO';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ListLancamentos(CodDocumento : LongInt) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT L.NUMLANCTO,L.HISTORICOCOMPL,D.NUMFATURA,D.OPERACAO, '+
          '       D.NUMLEITCODBARRAS,D.NUMDIGCODBARRAS,D.EMISBLOQ,D.NUMSLIP'+
          '  FROM DOCUMENTO D, LANCTODOCUM L '+
          ' WHERE (D.CODDOCUMENTO = '+intTostr(CodDocumento)+') '+
          '   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '   AND (D.OPERACAO = L.OPERACAO)';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ListDadosDoc(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT PLACONTA, PLANO, OBS, REFERENCIA AS REFCAP '+
          '  FROM DOCUMENTO '+
          ' WHERE CODDOCUMENTO = '+IntToStr(CodDocumento);
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.GravarDocumento(DataDocumento, DataLancamentos, DataRateios, DataCCBaixasxDocum : OleVariant;
                                   Operacao : char;
                                   EspAcesso, IdUsuario : integer;
                                   pCodDocumento :Integer;
                                   pCodigoNatureza : String) : Boolean;

   // WO10032 - Contas a Pagar - Remessa eletrônica
   // Alterado por Arnaldo Vicente Scarin em 15/07/2024
   // Quando o documento não tem conta de baixa informada, e o CDS de Contas de
   // Baixas estiver vazio deverá ser utilizada a conta de baixa que está
   // vinculada ao Alterador do Imposto.
   Function LocalizaContaBaixaAlteradorImposto(const pCodDocumento : Integer; const pCodigoNatureza : String) : String;
   var _qry : TClientDataSet;
   begin
     _qry := TClientDataSet.Create(nil);
     _qry.data := GetDataPacket('select ld.coddocumento, ta.codAlterador, ta.CodNatureza, ta.PlaConta'+#13+
                                'from LanctoDocum ld Join TipoAlterador ta on ta.codAlterador = ld.codAlterador'+#13+
                                'where codDocumento = '+intToStr(pCodDocumento)+#13+
                                'and ta.CodNatureza = '+QuotedStr(pCodigoNatureza));
     Result := _qry.FieldByName('PlaConta').asString;
     _qry.close;
     freeAndNil(_qry);
   end;


var iNumdocumento : Integer;

   iIdSegregaCriter : Integer;
   sContaSegregaCriter : String;

   sUltConta           : String;
   iContContas,
   iUltIdSegregaCriter : Integer;

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDocumento(DataDocumento, DataLancamentos, DataRateios, Operacao, EspAcesso, IdUsuario);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
       Try
          Result := True;
          Documento.Prepare(OpDocumento, odlEfetivo);
          Documento.IdEspAcesso        := EspAcesso;
          Documento.IdUsuario          := IdUsuario;
          CdsDocumento.data            := DataDocumento;
          CdsLancamentos.data          := DataLancamentos;
          CdsRateios.data              := DataRateios;

          iIdSegregaCriter := -1;

          iContContas := 0;
          If DataCCBaixasxDocum <> Null Then
          Begin
            cdsCCBaixasxDocum.Data        := DataCCBaixasxDocum;
            cdsCCBaixasxDocum.First;
            While Not cdsCCBaixasxDocum.Eof Do
            Begin
              iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(
                                                         ParamIntegra.Plano,
                                                         cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                         cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger,
                                                         cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString,
                                                         sContaSegregaCriter);

              If (cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString <> sUltConta) Or
                 (iIdsegregaCriter <> iUltIdSegregaCriter) Then
              Begin
                sUltConta           := cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString;
                iUltIdSegregaCriter := iIdSegregaCriter;
                Inc(iContContas);
              End;
              cdsCCBaixasxDocum.Next;
            End;
          End
          Else
            if ParamIntegra.SegregaVirtual then
              If cdsRateios.Data <> Null Then
                iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(ParamIntegra.Plano,
                                                                        cdsRateios.FieldByName('IDPLANOPREV').AsInteger,
                                                                        CdsRateios.FieldByName('IDPATRO').Asinteger,
                                                                        CdsDocumento.FieldByName('PLACONTA').Asstring,
                                                                        sContaSegregaCriter);


          Case Operacao of

           // --------------------------------------------------------------------------------------

           'I':
              Begin
                    If iContContas > 1 Then
                      sUltConta := ''
                    Else
                    begin
                      sUltConta := cdsDocumento.FieldByName('PLACONTA').AsString;
                      // WO10032 - Contas a Pagar - Remessa eletrônica
                      // Alterado por Arnaldo Vicente Scarin em 15/07/2024
                      // Quando o documento não tem conta de baixa informada,
                      // e o CDS de Contas de Baixas estiver vazio deverá ser
                      // utilizada a conta de baixa que está vinculada ao
                      // Alterador do Imposto.
                      if (sUltConta = '') and (pCodDocumento > 0) then
                      begin
                        sUltConta := LocalizaContaBaixaAlteradorImposto(pCodDocumento,pCodigoNatureza);
                      end;
                      // WO10032 - FIM
                    end;

                    //preenche os campos do documento
                    try
                       FCodDocumento := GetSequence('DOCUMENTO');

                       Documento.SetValues(Trunc(FCodDocumento),
                                           Trunc(FCodDocumento),
                                           CdsDocumento.FieldByName('COMPLDOCUMENTO').Asstring,
                                           CdsDocumento.FieldByName('STATUS').Asstring,
                                           CdsDocumento.FieldByName('RECPAG').Asstring,
                                           CdsDocumento.FieldByName('OPERACAO').Asstring,
                                           CdsDocumento.FieldByName('NUMSLIP').Asstring,
                                           CdsDocumento.FieldByName('NUMLEITCODBARRAS').Asstring,
                                           sUltConta, 
                                           CdsDocumento.FieldByName('CODCENTROCUSTO').Asstring,
                                           CdsDocumento.FieldByName('NOSSONUMERO').Asstring,
                                           CdsDocumento.FieldByName('NUMDIGCODBARRAS').Asstring,
                                           CdsDocumento.FieldByName('GRUPODOC').Asstring,
                                           '',
                                           '',
                                           CdsDocumento.FieldByName('EMISBLOQ').Asstring,
                                           CdsDocumento.FieldByName('REFERENCIA').Asstring,
                                           CdsDocumento.FieldByName('OBS').Asstring,
                                           CdsDocumento.FieldByName('DATAVENCTO').AsDatetime,
                                           CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime,
                                           CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime,
                                           CdsDocumento.FieldByName('DATAREMESSA').AsDateTime,
                                           CdsDocumento.FieldByName('DATALIMITE').AsDateTime,
                                           CdsDocumento.FieldByName('DATACORRECAO').AsDateTime,
                                           CdsDocumento.FieldByName('VLRMULTA').AsFloat,
                                           CdsDocumento.FieldByName('VALORJUROS').AsFloat,
                                           CdsDocumento.FieldByName('VALORDESCONTO').AsFloat,
                                           CdsDocumento.FieldByName('PERCJUROSSIMPLES').AsFloat,
                                           CdsDocumento.FieldByName('PERCJUROSATUARIAL').AsFloat,
                                           CdsDocumento.FieldByName('CODTIPDOC').Asinteger,
                                           CdsDocumento.FieldByName('IDPESSOA').Asinteger,
                                           CdsDocumento.FieldByName('IDMODULO').Asinteger,
                                           CdsDocumento.FieldByName('IDFORCLI').Asinteger,
                                           CdsDocumento.FieldByName('NUMFATURA').AsInteger,
                                           CdsDocumento.FieldByName('IDCBANCARIA').AsInteger,
                                           CdsDocumento.FieldByName('UNIDNEGOC').Asinteger,
                                           CdsDocumento.FieldByName('PLANO').Asinteger,
                                           CdsDocumento.FieldByName('NUMCPBAIXA').Asinteger,
                                           CdsDocumento.FieldByName('NUMAPGR').Asinteger,
                                           CdsDocumento.FieldByName('MOECODIGO').Asinteger,
                                           CdsDocumento.FieldByName('LOTETRANSMISSAO').Asinteger,
                                           CdsDocumento.FieldByName('INDICECORRECAO').AsInteger,
                                           CdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                           CdsDocumento.FieldByName('IDEMPRESA').AsInteger,
                                           0,
                                           CdsDocumento.FieldByName('CONTROLEREMESSA').Asinteger,
                                           CdsDocumento.FieldByName('CODSUBCONTA').Asinteger,
                                           CdsDocumento.FieldByName('CODPORTFORMA').Asinteger,
                                           CdsDocumento.FieldByName('CODGRUPOCNAB').Asinteger,
                                           CdsDocumento.FieldByName('CODGERADORINSS').Asinteger,
                                           CdsDocumento.FieldByName('CODFORMA').AsInteger,
                                           iIDSegregaCriter);
                       //insere os lançamentos

                       documento.DataDisponibilidade := CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime; 
                       CdsLancamentos.First;
                       while not CdsLancamentos.eof do
                       Begin
                           Documento.Lanctodocum.SetValues(CdsLancamentos.FieldByName('DATALANCTO').AsDateTime,
                                                           Trunc(FCodDocumento),
                                                           CdsLancamentos.FieldByName('NUMLANCTO').AsInteger,
                                                           CdsLancamentos.FieldByName('VLRLIQUIDO').AsFloat,
                                                           CdsLancamentos.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                           CdsLancamentos.FieldByName('VALOR').AsFloat,
                                                           CdsLancamentos.FieldByName('UNIDNEGOC').Asinteger,
                                                           CdsLancamentos.FieldByName('PLNCODIGO').AsInteger,
                                                           CdsLancamentos.FieldByName('NUMLOTEMANUAL').Asinteger,
                                                           CdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').Asinteger,
                                                           CdsLancamentos.FieldByName('IDPESSOA').AsInteger,
                                                           0,
                                                           CdsLancamentos.FieldByName('ESTORNO').AsInteger,
                                                           CdsLancamentos.FieldByName('CODTIPDOC').Asinteger,
                                                           CdsLancamentos.FieldByName('CODDOCINSS').Asinteger,
                                                           CdsLancamentos.FieldByName('CODALTERADOR').AsInteger,
                                                           CdsLancamentos.FieldByName('OPERACAO').Asstring,
                                                           CdsLancamentos.FieldByName('NUMRECIBO').Asstring,
                                                           CdsLancamentos.FieldByName('NUMNF').Asstring,
                                                           CdsLancamentos.FieldByName('NUMFATURA').Asstring,
                                                           CdsLancamentos.FieldByName('HISTORICOCOMPL').Asstring,
                                                           '',
                                                           '',
                                                           '',
                                                           CdsLancamentos.FieldByName('DEBCRE').Asstring,
                                                           CdsLancamentos.FieldByName('IDMODULO').AsInteger,
                                                           CdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger,
                                                           (CdsLancamentos.FieldByName('USAPLANOPATRO').AsString = 'S'));
                           CdsLancamentos.next;
                       end;

                       //insere rateiodocum

                       CdsRateios.first;
                       while not CdsRateios.Eof do
                       Begin
                           Documento.Rateiodocum.SetValues(CdsRateios.FieldByName('VALOR').AsFloat,
                                                           CdsRateios.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                           CdsRateios.FieldByName('VLRRESORCAMEN').AsFloat,
                                                           0,
                                                           CdsRateios.FieldByName('IDPESSOA').AsInteger,
                                                           Trunc(FCodDocumento),
                                                           CdsRateios.FieldByName('UNIDNEGOC').Asinteger,
                                                           CdsRateios.FieldByName('MOECODIGO').Asinteger,
                                                           CdsRateios.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                                           CdsRateios.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                           CdsRateios.FieldByName('PLANO').Asinteger,
                                                           CdsRateios.FieldByName('IDPLANOPREV').Asinteger,
                                                           CdsRateios.FieldByName('IDPATRO').Asinteger,
                                                           CdsRateios.FieldByName('IDPROGRAMA').Asinteger,
                                                           CdsRateios.FieldByName('IDPROCESSO').AsInteger,
                                                           CdsRateios.FieldByName('IDPESSOA').AsInteger,
                                                           CdsRateios.FieldByName('CODTIPRECDES').Asstring,
                                                           CdsRateios.FieldByName('RECPAG').Asstring,
                                                           CdsRateios.FieldByName('CODCENTRORESPON').Asstring,
                                                           CdsRateios.FieldByName('CODCENTROCUSTO').Asstring,
                                                           CdsRateios.FieldByName('NUMIMOVEL').Asstring
                                                          );
                           CdsRateios.Next;
                       end;


                       If iContContas > 1 Then
                       Begin
                         // insere CCBAIXASXDOCUM
                         If cdsCCBaixasxDocum.Data <> null then
                         begin
                           cdsCCBaixasxDocum.First;
                           while not cdsCCBaixasxDocum.Eof do
                           begin

                             iIDSegregaCriter := -1;
                             if ParamIntegra.SegregaVirtual then
                             begin
                               iIDSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(
                                                                                       ParamIntegra.Plano,
                                                                                       cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                                                       cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger,
                                                                                       cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString,
                                                                                       sContaSegregaCriter
                                                                                       );
                             end;

                             Documento.CCBAIXASXDOCUM.SetValues(cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat,
                                                                0,
                                                                cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger,
                                                                Trunc(FCodDocumento),
                                                                cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsInteger, 
                                                                cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger,
                                                                cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                                cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger,
                                                                iIDSegregaCriter,
                                                                cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString
                                                               );
                             cdsCCBaixasxDocum.Next;
                           end;
                         end;
                       End;
                       //
                    except
                       Result := False;
                       MessageInfo := Documento.MessageInfo;
                    end;

                    if Result then
                    begin
                       try
                           if not Documento.Insert then
                           Begin
                               Result := False;
                               MessageInfo := Documento.MessageInfo;
                           end
                           else
                           Begin
                               Result := True;
                               CodDocumento := Documento.CodDocumento;
                           end;
                       except
                            On E:Exception Do
                            Begin
                                 Rollback;
                                 Result := False;
                                 MessageInfo := E.Message;
                                 Raise;
                            End;
                       end;
                    end
                    else
                    begin
                       Rollback;
                    end;
              end;

           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------

           'A':
              Begin
                //preenche os campos do documento que serão alterados
                Documento.CodDocumento := CdsDocumento.FieldByName('CODDOCUMENTO').Asinteger;
                Documento.SetValues(CdsDocumento.FieldByName('CODDOCUMENTO').Asinteger,
                                    CdsDocumento.FieldByName('NODOCUMENTO').Asinteger,
                                    CdsDocumento.FieldByName('COMPLDOCUMENTO').Asstring,
                                    CdsDocumento.FieldByName('STATUS').Asstring,
                                    CdsDocumento.FieldByName('RECPAG').Asstring,
                                    CdsDocumento.FieldByName('OPERACAO').Asstring,
                                    CdsDocumento.FieldByName('NUMSLIP').Asstring,
                                    CdsDocumento.FieldByName('NUMLEITCODBARRAS').Asstring,
                                    CdsDocumento.FieldByName('PLACONTA').Asstring,
                                    CdsDocumento.FieldByName('CODCENTROCUSTO').Asstring,
                                    CdsDocumento.FieldByName('NOSSONUMERO').Asstring,
                                    CdsDocumento.FieldByName('NUMDIGCODBARRAS').Asstring,
                                    CdsDocumento.FieldByName('GRUPODOC').Asstring,
                                    '',
                                    '',
                                    CdsDocumento.FieldByName('EMISBLOQ').Asstring,
                                    CdsDocumento.FieldByName('REFERENCIA').Asstring,
                                    CdsDocumento.FieldByName('OBS').Asstring,
                                    CdsDocumento.FieldByName('DATAVENCTO').AsDateTime,
                                    CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime,
                                    CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime,
                                    CdsDocumento.FieldByName('DATAREMESSA').AsDateTime,
                                    CdsDocumento.FieldByName('DATALIMITE').AsDateTime,
                                    CdsDocumento.FieldByName('DATACORRECAO').AsDateTime,
                                    CdsDocumento.FieldByName('VLRMULTA').AsFloat,
                                    CdsDocumento.FieldByName('VALORJUROS').AsFloat,
                                    CdsDocumento.FieldByName('VALORDESCONTO').AsFloat,
                                    CdsDocumento.FieldByName('PERCJUROSSIMPLES').AsFloat,
                                    CdsDocumento.FieldByName('PERCJUROSATUARIAL').AsFloat,
                                    CdsDocumento.FieldByName('CODTIPDOC').Asinteger,
                                    CdsDocumento.FieldByName('IDPESSOA').Asinteger,
                                    CdsDocumento.FieldByName('IDMODULO').Asinteger,
                                    CdsDocumento.FieldByName('IDFORCLI').Asinteger,
                                    CdsDocumento.FieldByName('NUMFATURA').AsInteger,
                                    CdsDocumento.FieldByName('IDCBANCARIA').AsInteger,
                                    CdsDocumento.FieldByName('UNIDNEGOC').Asinteger,
                                    CdsDocumento.FieldByName('PLANO').Asinteger,
                                    CdsDocumento.FieldByName('NUMCPBAIXA').Asinteger,
                                    CdsDocumento.FieldByName('NUMAPGR').Asinteger,
                                    CdsDocumento.FieldByName('MOECODIGO').Asinteger,
                                    CdsDocumento.FieldByName('LOTETRANSMISSAO').Asinteger,
                                    CdsDocumento.FieldByName('INDICECORRECAO').AsInteger,
                                    CdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                    CdsDocumento.FieldByName('IDEMPRESA').AsInteger, 0,
                                    CdsDocumento.FieldByName('CONTROLEREMESSA').Asinteger,
                                    CdsDocumento.FieldByName('CODSUBCONTA').Asinteger,
                                    CdsDocumento.FieldByName('CODPORTFORMA').Asinteger,
                                    CdsDocumento.FieldByName('CODGRUPOCNAB').Asinteger,
                                    CdsDocumento.FieldByName('CODGERADORINSS').Asinteger,
                                    CdsDocumento.FieldByName('CODFORMA').AsInteger
                                   );

                //altera os lançamentos
                CdsLancamentos.Locate('OPERACAO', '2', []);
                Documento.Lanctodocum.SetValues(CdsLancamentos.FieldByName('DATALANCTO').AsDateTime,
                                                CdsLancamentos.FieldByName('CODDOCUMENTO').Asinteger,
                                                CdsLancamentos.FieldByName('NUMLANCTO').AsInteger,
                                                CdsLancamentos.FieldByName('VLRLIQUIDO').AsFloat,
                                                CdsLancamentos.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                CdsLancamentos.FieldByName('VALOR').AsFloat,
                                                CdsLancamentos.FieldByName('UNIDNEGOC').Asinteger,
                                                CdsLancamentos.FieldByName('PLNCODIGO').AsInteger,
                                                CdsLancamentos.FieldByName('NUMLOTEMANUAL').Asinteger,
                                                CdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').Asinteger,
                                                CdsLancamentos.FieldByName('IDPESSOA').AsInteger,
                                                0, CdsLancamentos.FieldByName('ESTORNO').AsInteger,
                                                CdsLancamentos.FieldByName('CODTIPDOC').Asinteger,
                                                CdsLancamentos.FieldByName('CODDOCINSS').Asinteger,
                                                CdsLancamentos.FieldByName('CODALTERADOR').AsInteger,
                                                CdsLancamentos.FieldByName('OPERACAO').Asstring,
                                                CdsLancamentos.FieldByName('NUMRECIBO').Asstring,
                                                CdsLancamentos.FieldByName('NUMNF').Asstring,
                                                CdsLancamentos.FieldByName('NUMFATURA').Asstring,
                                                CdsLancamentos.FieldByName('HISTORICOCOMPL').Asstring,
                                                '',
                                                '',
                                                '',
                                                CdsLancamentos.FieldByName('DEBCRE').Asstring,
                                                CdsLancamentos.FieldByName('IDMODULO').AsInteger,
                                                CdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger,
                                                (CdsLancamentos.FieldByName('USAPLANOPATRO').AsString = 'S')
                                               );

                CdsLancamentos.First;
                while not CdsLancamentos.eof do
                Begin
                  If cdslancamentos.FieldByName('OPERACAO').asstring <> '2' Then
                  Begin
                    Documento.Lanctodocum.SetValues(CdsLancamentos.FieldByName('DATALANCTO').AsDateTime,
                                                    CdsLancamentos.FieldByName('CODDOCUMENTO').Asinteger,
                                                    CdsLancamentos.FieldByName('NUMLANCTO').AsInteger,
                                                    CdsLancamentos.FieldByName('VLRLIQUIDO').AsFloat,
                                                    CdsLancamentos.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                    CdsLancamentos.FieldByName('VALOR').AsFloat,
                                                    CdsLancamentos.FieldByName('UNIDNEGOC').Asinteger,
                                                    CdsLancamentos.FieldByName('PLNCODIGO').AsInteger,
                                                    CdsLancamentos.FieldByName('NUMLOTEMANUAL').Asinteger,
                                                    CdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').Asinteger,
                                                    CdsLancamentos.FieldByName('IDPESSOA').AsInteger,
                                                    0,
                                                    CdsLancamentos.FieldByName('ESTORNO').AsInteger,
                                                    CdsLancamentos.FieldByName('CODTIPDOC').Asinteger,
                                                    CdsLancamentos.FieldByName('CODDOCINSS').Asinteger,
                                                    CdsLancamentos.FieldByName('CODALTERADOR').AsInteger,
                                                    CdsLancamentos.FieldByName('OPERACAO').Asstring,
                                                    CdsLancamentos.FieldByName('NUMRECIBO').Asstring,
                                                    CdsLancamentos.FieldByName('NUMNF').Asstring,
                                                    CdsLancamentos.FieldByName('NUMFATURA').Asstring,
                                                    CdsLancamentos.FieldByName('HISTORICOCOMPL').Asstring,
                                                    '',
                                                    '',
                                                    '',
                                                    CdsLancamentos.FieldByName('DEBCRE').Asstring,
                                                    CdsLancamentos.FieldByName('IDMODULO').AsInteger,
                                                    CdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger,
                                                    (CdsLancamentos.FieldByName('USAPLANOPATRO').AsString = 'S')
                                                   );
                  End;
                  CdsLancamentos.next;
                end;

                //altera rateiodocum
                if not CdsRateios.isEmpty then
                   CdsRateios.first;
                while not CdsRateios.Eof do
                Begin
                    Documento.Rateiodocum.SetValues(CdsRateios.FieldByName('VALOR').AsFloat, CdsRateios.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                    CdsRateios.FieldByName('VLRRESORCAMEN').AsFloat, CdsRateios.FieldByName('idrateiodocum').Asinteger, CdsRateios.FieldByName('IDPESSOA').AsInteger,
                                                    CdsRateios.FieldByName('CODDOCUMENTO').Asinteger, CdsRateios.FieldByName('UNIDNEGOC').Asinteger, CdsRateios.FieldByName('MOECODIGO').Asinteger,
                                                    CdsRateios.FieldByName('IDUSUARIOINCLUSAO').AsInteger, CdsRateios.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                    CdsRateios.FieldByName('PLANO').Asinteger, CdsRateios.FieldByName('IDPLANOPREV').Asinteger,
                                                    CdsRateios.FieldByName('IDPATRO').Asinteger, CdsRateios.FieldByName('IDPROGRAMA').Asinteger,
                                                    CdsRateios.FieldByName('IDPROCESSO').AsInteger, CdsRateios.FieldByName('IDPESSOA').AsInteger,
                                                    CdsRateios.FieldByName('CODTIPRECDES').Asstring, CdsRateios.FieldByName('RECPAG').Asstring,
                                                    CdsRateios.FieldByName('CODCENTRORESPON').Asstring, CdsRateios.FieldByName('CODCENTROCUSTO').Asstring,
                                                    CdsRateios.FieldByName('NUMIMOVEL').Asstring);
                    CdsRateios.Next;
                end;

                // altera CCBAIXASXDOCUM
                If iContContas > 1 Then
                Begin
                  // insere CCBAIXASXDOCUM
                  If cdsCCBaixasxDocum.Data <> null then
                  begin
                    cdsCCBaixasxDocum.First;
                    while not cdsCCBaixasxDocum.Eof do
                    begin
                      iIDSegregaCriter := -1;
                      if ParamIntegra.SegregaVirtual then
                      begin
                         iIDSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(
                                                                                 ParamIntegra.Plano,
                                                                                 cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger, 
                                                                                 cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger, 
                                                                                 cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString,
                                                                                 sContaSegregaCriter
                                                                                );
                      end;

                      Documento.CCBAIXASXDOCUM.SetValues(cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat,
                                                         0,
                                                         cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger,
                                                         iNumDocumento,
                                                         cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsInteger, 
                                                         cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger,
                                                         cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                         cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger,
                                                         iIDSegregaCriter,
                                                         cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString);
                      cdsCCBaixasxDocum.Next;
                    end;
                  end;
                end;

                if not Documento.Update then
                Begin
                    Result := False;
                    MessageInfo := Documento.MessageInfo;
                end
                else
                Begin
                    Result := True;
                    CdsLancamentos.First;
                    while not CdsLancamentos.eof do
                    Begin
                         AtualizaAuteradores(CdsLancamentos.FieldByName('CODDOCUMENTO').Asinteger,
                                             CdsLancamentos.FieldByName('NUMLANCTO').Asinteger,
                                             CdsLancamentos.FieldByName('OPERACAO').Asstring);
                         CdsLancamentos.next;
                    end;
                end;
              end;

           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------

           'E':
              Begin
                Documento.CodDocumento := CdsDocumento.FieldByName('CODDOCUMENTO').AsFloat;
                if not Documento.Delete then
                   Begin
                    Result := False;
                    MessageInfo := Documento.MessageInfo;
                  end
                else
                  Begin
                    Result := True;
                  end;
              end;

           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------
           // --------------------------------------------------------------------------------------

          end; //fim do case
       except
          MessageInfo := Documento.MessageInfo;
          Result := False;
       end;
     end;
end;



function TCtrlDARF.ProcurarLancamentos(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT LANCTODOCUM.*, (0) AS IDMODULO, (0) AS IDPLANOCONTA, (''N'') AS USAPLANOPATRO '+
  '  FROM LANCTODOCUM '+
  ' WHERE CODDOCUMENTO = '+intTostr(CodDocumento);

  Result := GetDataPacket(sSQL);
end;



function TCtrlDARF.ProcurarDocumento(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT * '+
          '  FROM DOCUMENTO '+
          ' WHERE CODDOCUMENTO = '+intTostr(CodDocumento);
  Result := GetDataPacket(sSQL);        
end;

function TCtrlDARF.ProcurarRateio(CodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT * '+
          '  FROM RATEIODOCUM '+
          ' WHERE CODDOCUMENTO = '+intTostr(CodDocumento);
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.IncluirRateio(DataRateio: OleVariant): Boolean;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.IncluirRateio(DataRateio);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
          CdsRateios.data := DataRateio;
          CdsRateios.First;
          result := True;
          StartTransaction;
          while not CdsRateios.Eof do
            Begin
                sSQL := 'INSERT INTO RATEIODOCUM (IDRATEIODOCUM, CODDOCUMENTO, CODTIPRECDES, RECPAG, IDPESSOA, CODCENTRORESPON, '+
                        '                         UNIDNEGOC, MOECODIGO, VALOR, VALOROUTRAMOEDA, IDUSUARIOINCLUSAO, '+
                        '                         LOTETRANSMISSAO, IDRESERVAORCAMEN, IDEMPRESA, CODCENTROCUSTO, IDPLANOPREV, IDPATRO, '+
                        '                         PLANO, IDPROGRAMA, NUMIMOVEL, VLRRESORCAMEN, IDPROCESSO) '+
                        'VALUES                  ('+CdsRateios.FieldByName('IDRATEIODOCUM').Asstring+ ', '+ CdsRateios.FieldByName('CODDOCUMENTO').Asstring+ ', '+
                        ' '+quotedStr(CdsRateios.FieldByName('CODTIPRECDES').Asstring)+ ', '+quotedStr(CdsRateios.FieldByName('RECPAG').Asstring) +', '+CdsRateios.FieldByName('IDPESSOA').Asstring + ', '+
                        ' '+quotedStr(CdsRateios.FieldByName('CODCENTRORESPON').Asstring)+ ', ';

                if Trim(CdsRateios.FieldByName('UNIDNEGOC').Asstring) <> '' then
                   sSQL := sSQL + quotedStr(CdsRateios.FieldByName('UNIDNEGOC').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsRateios.FieldByName('MOECODIGO').Asstring) <> '' then
                   sSQL := sSQL + CdsRateios.FieldByName('MOECODIGO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('VALOR').AsFloat > 0 then
                   sSQL := sSQL + Oranumero(CdsRateios.FieldByName('VALOR').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('VALOROUTRAMOEDA').AsFloat > 0 then
                   sSQL := sSQL + Oranumero(CdsRateios.FieldByName('VALOROUTRAMOEDA').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                sSQL := sSQL + CdsRateios.FieldByName('IDUSUARIOINCLUSAO').Asstring + ', ';

                if CdsRateios.FieldByName('LOTETRANSMISSAO').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('LOTETRANSMISSAO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDRESERVAORCAMEN').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDRESERVAORCAMEN').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDEMPRESA').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDEMPRESA').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsRateios.FieldByName('CODCENTROCUSTO').Asstring) <> '' then
                   sSQL := sSQL + quotedStr(CdsRateios.FieldByName('CODCENTROCUSTO').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDPLANOPREV').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDPLANOPREV').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDPATRO').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDPATRO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('PLANO').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('PLANO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDPROGRAMA').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDPROGRAMA').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsRateios.FieldByName('NUMIMOVEL').Asstring) <> '' then
                   sSQL := sSQL + quotedStr(CdsRateios.FieldByName('NUMIMOVEL').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('VLRRESORCAMEN').AsFloat > 0 then
                   sSQL := sSQL + Oranumero(CdsRateios.FieldByName('VLRRESORCAMEN').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsRateios.FieldByName('IDPROCESSO').AsFloat > 0 then
                   sSQL := sSQL + CdsRateios.FieldByName('IDPROCESSO').Asstring + ')'
                else
                   sSQL := sSQL + 'null)';
                if not ExecSQL(sSQL) then
                   Raise Exception.Create(messageinfo);
                CdsRateios.Next;
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
end;



function TCtrlDARF.IncluirLancamento(DataLancamento: OleVariant): Boolean;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.IncluirLancamento(DataLancamento);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
          CdsLancamentos.data := DataLancamento;
          Result := True;
          cdsLancamentos.first;
          StartTransaction;
          while not CdsLancamentos.eof do
            Begin
                sSQL := 'INSERT INTO LANCTODOCUM (CODDOCUMENTO, NUMLANCTO, CODALTERADOR, PLNCODIGO, DATALANCTO, VALOR, '+
                        '                         VALOROUTRAMOEDA, DEBCRE, OPERACAO, HISTORICOCOMPL, IDUSUARIOINCLUSAO, '+
                        '                         ESTORNO, LOTETRANSMISSAO, NUMFATURA, CODTIPDOC, VLRLIQUIDO, NUMRECIBO, '+
                        '                         UNIDNEGOC, IDPESSOA, NUMLOTEMANUAL, CODDOCINSS, NUMNF) '+
                        'VALUES                  ('+CdsLancamentos.FieldByName('CODDOCUMENTO').Asstring + ', '+ CdsLancamentos.FieldByName('NUMLANCTO').Asstring + ', ';

                if CdsLancamentos.FieldByName('CODALTERADOR').AsFloat > 0 then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('CODALTERADOR').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('PLNCODIGO').AsFloat > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('PLNCODIGO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('DATALANCTO').Asstring) > '' then
                   sSQL := sSQL + 'TO_DATE('+ quotedStr(CdsLancamentos.FieldByName('DATALANCTO').Asstring) + ', ''DD/MM/YYYY'') , '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('VALOR').AsFloat > 0 then
                   sSQL := sSQL + Oranumero(CdsLancamentos.FieldByName('VALOR').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('VALOROUTRAMOEDA').AsFloat > 0 then
                   sSQL := sSQL + Oranumero(CdsLancamentos.FieldByName('VALOROUTRAMOEDA').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';


                if Trim(CdsLancamentos.FieldByName('DEBCRE').Asstring) > '' then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('DEBCRE').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('OPERACAO').Asstring) > '' then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('OPERACAO').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('HISTORICOCOMPL').Asstring) > '' then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('HISTORICOCOMPL').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('ESTORNO').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('ESTORNO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('LOTETRANSMISSAO').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('LOTETRANSMISSAO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('NUMFATURA').Asstring) <> '' then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('NUMFATURA').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('CODTIPDOC').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('CODTIPDOC').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('VLRLIQUIDO').Asinteger > 0 then
                   sSQL := sSQL + Oranumero(CdsLancamentos.FieldByName('VLRLIQUIDO').Asstring) + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('NUMRECIBO').Asstring) <> '' then
                   sSQL := sSQL + CdsLancamentos.FieldByName('NUMRECIBO').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('UNIDNEGOC').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('UNIDNEGOC').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                sSQL := sSQL + CdsLancamentos.FieldByName('IDPESSOA').Asstring + ', ';

                if CdsLancamentos.FieldByName('NUMLOTEMANUAL').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('NUMLOTEMANUAL').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if CdsLancamentos.FieldByName('CODDOCINSS').Asinteger > 0 then
                   sSQL := sSQL + CdsLancamentos.FieldByName('CODDOCINSS').Asstring + ', '
                else
                   sSQL := sSQL + 'null, ';

                if Trim(CdsLancamentos.FieldByName('NUMNF').Asstring) <> '' then
                   sSQL := sSQL + quotedStr(CdsLancamentos.FieldByName('NUMNF').Asstring) + ')'
                else
                   sSQL := sSQL + 'null)';

                if not ExecSQL(sSQL) then
                  Raise Exception.Create(messageinfo);
                CdsLancamentos.Next;
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
end;

function TCtrlDARF.ListLancJuros(CodDocumento,
                                 NumLancto: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT PLNCODIGO,HISTORICOCOMPL '+
          '  FROM LANCTODOCUM  '+
          ' WHERE (CODDOCUMENTO = '+intTostr(CodDocumento)+') '+
          '   AND (NUMLANCTO = '+IntToStr(NumLancto)+')';
  Result := GetDataPacket(sSQL);
end;

function TCtrlDARF.ExcluirLancamento(CodDocumento,
                                     NumLancto: integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirLancamento(CodDocumento, NumLancto);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
    Begin
      try
        StartTransaction;
        Documento.Prepare(OpLanctoDocum, odlAlterador);
        Documento.Lanctodocum.CodDocumento := CodDocumento;
        Documento.Lanctodocum.Numlancto    := NumLancto;
        if not Documento.Delete then
           Begin
             Rollback;
             Result := False;
           end
        else
           Begin
             Commit;
             result := True;
           end;
      except
        On E:Exception Do
           Begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
           End;
      end;
    end;
end;

function TCtrlDARF.AtualizaLancIRRF(IdDarf: integer): Boolean;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizarLancIRRF(IdDarf);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  else
    Begin
      Result := true;
      try
        StartTransaction;
        sSQL := 'UPDATE LANCIRRF '+
                '   SET IDDARF = NULL, FLGDARF = ''N'' '+
                ' WHERE (IDDARF = '+IntToStr(IdDarf)+') ';
        if not ExecSQL(sSQL) then
           Raise Exception.Create(messageinfo);
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
end;

procedure TCtrlDARF.AfterInitialize;
begin
  inherited;
  Documento.InitializeAs(self);

  CtrlSegregacao.InitializeAs(Self);
  CtrlSegregacao.GetParams(Sistema.IdEmpresa);

end;

function TCtrlDARF.OraNumero(Numero: string): string;
var
  i   : integer;
  sOra: string;
begin
  sOra := '';

  for i:=1 to length(Trim(Numero)) do
  begin
     if (Numero[i] = ',') then
       sOra := sOra + '.'
     else
       sOra := sOra + Numero[i]
   end;
   Result := sOra;
end;

function TCtrlDARF.AtualizaAuteradores(CodDocumento,
                                       Numlancamento: Integer; Operacao : string): Boolean;
var
  sSQL : string;
begin
  //Função implementada em critério de usrgência, quando tiver tempo substitui-la, pois para
  //gravar os alteradores de forma correta terei que trocar a função principal
  sSQL := 'UPDATE LANCTODOCUM SET OPERACAO = '+quotedStr(Operacao)+
          ' WHERE CODDOCUMENTO = '+intTostr(CodDocumento)+ ' AND NUMLANCTO = '+ intTostr(Numlancamento);
  Result := ExecSQL(sSQL);
end;

function TCtrlDARF.AtualizaDarf(idDarf : LongInt; CodDocumento: integer): Boolean;
var
  sSQL : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizaDarf(IdDarf, CodDocumento);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  else
    Begin
      Result := True;
      if CodDocumento = 0 then
        Begin
          sSQL := 'UPDATE DARF SET CODDOCUMENTO = NULL '+
                  ' WHERE IDDARF = '+intTostr(idDarf);
          if not ExecSQL(sSQL) then
            Result := False;
        end
      else
        Begin
          sSQL := 'UPDATE DARF SET CODDOCUMENTO = '+intTostr(CodDocumento)+
                  ' WHERE IDDARF = '+intTostr(idDarf);
          if not ExecSQL(sSQL) then
            Result := False;
        end;
    end;
end;



function TCtrlDARF.ListaDarfsAExcluir(bAbreCdsVazio, bFiltroVencimento: boolean;
  dDtInicial, dDtFinal: TDAteTime): OleVariant;
var
 sSQL: string;
begin
  sSQL :=
  'SELECT '                                                      + #13 +
  '   P.NOME AS FAVORECIDO, '                                    + #13 +
  '   DECODE(C.NOME,NULL,''Entrada Manual'',C.NOME) AS CONTRIBUINTE, ' + #13 +
  '   F.IDDARF, '                                                + #13 +
  '   F.DATAEMISDARF, '                                          + #13 +
  '   F.CODDOCUMENTO, '                                          + #13 +
  '   F.VLRTOTAL, '                                              + #13 +
  '   F.DATAVENCDARF, '                                          + #13 +
  '   ''S'' AS FLGEXCLUI, '                                      + #13 +
  '   F.CODNATUREZA '                                            + #13 +
  'FROM '                                                        + #13 +
  '   PESSOA P, '                                                + #13 +
  '   PESSOA C, '                                                + #13 +
  '   DOCUMENTO D, '                                             + #13 +
  '   DARF F, '                                                  + #13 +
  '   LANCIRRF L '                                               + #13 +
  'WHERE '                                                       + #13 +
  '      P.IDPESSOA     =  D.IDFORCLI '                          + #13 +
  'AND   L.IDBENEFIRRF  = C.IDPESSOA(+) '                        + #13 +
  'AND   D.CODDOCUMENTO = F.CODDOCUMENTO '                       + #13 +
  'AND   D.STATUS      <> ''2'' '                                + #13 +
  'AND   F.CODNATUREZA IN (7416,7431) '                          + #13 +
  'AND   F.IDDARF       = L.IDDARF(+) '                          + #13 +
  'AND   NOT EXISTS (SELECT 1 FROM LANCTODOCUM X '               + #13 +
  '                  WHERE  D.CODDOCUMENTO = X.CODDOCUMENTO '    + #13 +
  '                  AND X.OPERACAO = ''5'') ';


  if bAbreCdsVazio then
  sSQL := sSQL + ' AND F.IDDARF = -1 '

  else
  begin
    if bFiltroVencimento then
    sSQL := sSQL + 'AND F.DATAVENCDARF BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicial)) +',''DD/MM/YYYY'') ' + #13 +
                   '                       AND TO_DATE('+ QuotedStr(DateToStr(dDtFinal))   +',''DD/MM/YYYY'') '

    else
    sSQL := sSQL + 'AND F.DATAEMISDARF BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicial)) +',''DD/MM/YYYY'') ' + #13 +
                   '                       AND TO_DATE('+ QuotedStr(DateToStr(dDtFinal))   +',''DD/MM/YYYY'') ';
  end;

  Result := GetDataPacket(sSQL);
end;



function TCtrlDARF.ExcluiDocumento(iCodDocumento, EspAcesso, IdUsuario: LongInt): Boolean;
begin
  Result := True;

  Documento.Prepare(OpDocumento, odlEfetivo);
  Documento.IdEspAcesso        := EspAcesso;
  Documento.IdUsuario          := IdUsuario;

  try
     Documento.CodDocumento := iCodDocumento;
     if not(Documento.Delete) then
     Begin
        Result := False;
        MessageInfo := Documento.MessageInfo;
     end
     else
     Begin
        Result := True;
     end;

  except
     Result := False;
     MessageInfo := 'Não foi possível excluir documento.';
  end;
end;



procedure TCtrlDARF.SetCodDocumento(const Value: Double);
begin
  FCodDocumento := Value;
end;



end.
