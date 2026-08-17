{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------

--------------------------------------------------------------------------------
Rotina...........: AtualizaSaldoContabBem
Nº Chamado.......: SIG46687
Data da Alteração: 25/09/2018
Responsável......: Fabio Sampaio
Descrição........: Inclusão do parâmetro bRecalculaSaldo para possibilitar o
                   tratamento de cálculo e exclusão das tabelas SALDOCONTABBEM
                   e SLDCTBBEMXDEP.
--------------------------------------------------------------------------------
Rotina...........: ListaBemxDep,ListaHistBemxDep
Nº SOL...........: SOL198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Inclusão na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação.
--------------------------------------------------------------------------------
Rotina...........: idImovelHistorico, cadastrarImovelxBem, ListaPlanoPatroxBemMedia
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina...........: AtualizaSaldoContabBem - passo: Reconstroi Saldo Contábil do Bem
Nº SOL...........: 224857
Nº KINTANA.......: 2058411
Data da Alteração: 24/01/2014
Responsável......: Fernando Xavier
Descrição........: considerar a implemetação do SOL 215665 somente para o CAF
------------------------------------------------------------------------------
Rotina...........: AtualizaSaldoContabBem - passo: Reconstroi Saldo Contábil do Bem
Nº SOL...........: 215665
Nº KINTANA.......: 2045970
Data da Alteração: 10/10/2013
Responsável......: Fernando Xavier
Descrição........: Quando é executado a baixa para o termo de baixa de nº 112 ao
                   ser baixado os bens permanecem com valores positivos.
------------------------------------------------------------------------------
Rotina...........: EstornaEntrada, Construtor, Destroy, ExecutaEntrada TCtrlBem
                   criação da rotina ListaItensHistBemxDep
Nº SOL...........: 204458
Nº KINTANA.......: 1981316
Data da Alteração: 19/04/2013
Responsável......: Thiago Melo
Descrição........: ajustar as funcionalidades de alterar e excluir qualquer bem
                   na tela de cadastro de bens.
------------------------------------------------------------------------------
Rotina...........:  ListaHistBemxDep , ListaBemxDep ,RegistraEntradaTotal
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: Criação da Rotina ListaHistBemxDep e Alteração ListaBemxDep
------------------------------------------------------------------------------
Rotina......: ListaAcrescimoValor
Nº SOL......: 142550
Nº KINTANA..: 911790
Responsável.: Helen V. Bianchi
Data........: 25/10/2010
Descrição....: 
--------------------------------------------------------------------------------
Rotina......: ListaBem, SaldoContabilBem2, AtualizaSaldoContabBem
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 17/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Adicionado o campo "VALRESIDUAL" na select
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SOL..........: 139388
Kintana......: 766651
Responsável..: Cássio Camargo
Data.........: 08/07/2010
Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
               Encerramento de Obras, para utilização da tabela
               PLANOPATROXVIGENCIABEM e PLANOPATROXVIGENCIAIMOB
--------------------------------------------------------------------------------}

unit uCtrlBem;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP, SysUtils, Math, uCMMath, Wwquery,
     dbclient, Provider, uMidasUtil,   uCMTypes,
     uDBBem, uDBBemxMoeda, uDBBemxDep, uDBPlanoPatroxBem, uDBImagemBem,
     uDBSaldoContabBem, uDBSldCtbBemxDep, dMTBem,
     uCtrlParamCAF, uCtrlConjunto, uCtrlHistMovBem,
     uCtrlCAFxContab, uCtrlGrupoContab, uDiasUteis,uCmfileUtils
     , USistema; //SOL 224857 KINTANA 2058411

Type
   TCtrlBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbBem            : TDBBem;
      _dbBemxMoeda      : TDBBemxMoeda;
      _dbBemxDep        : TDBBemxDep;
      _dbPlanoPatroxBem : TDBPlanoPatroxBem;
      _dbImagem         : TDBImagemBem;

      _dbSaldoContabBem : TDBSaldoContabBem;
      _dbSldCtbBemxDep  : TDBSldCtbBemxDep;

      _dMTBem           : tdtmMTBem;

      FidImovelHistorico : Integer;  // Vando - SOL 154328-5901 / KTN 1373449

      Fcds,
      FcdsBemxMoeda,
      FcdsBemxDep,
      FcdsPlanoPatroxBem,
      FcdsImagem,

      FcdsSaldoContabBem,
      FcdsSldCtbBemxDep,

      FcdsMovContabBem,
      FcdsMovTransf,

      FcdsTaxasDep : TClientDataSet;

      FcdsConjunto: TClientDataSet;

      // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
      FcdsImovelxBem: TclientDataSet;
      FcdsLancImovelxBem: TclientDataSet;

      // Thiago Melo SOL 204458 Kintana 1981316
      FcdsHistBemxDep: TclientDataSet;

      ParamCAF    : TCtrlParamCAF;
      Conjunto    : TCtrlConjunto;
      GrupoContab : TCtrlGrupoContab;
      HistMovBem  : TCtrlHistMovBem;
      CAFxContab  : TCtrlCAFxContab;
      DiasUteis   : TDiasUteis;
      FcdsPlanoPatroxVigenciaBem: TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsSaldoContabBem(const Value: TClientDataSet);
      procedure SetcdsSldCtbBemxDep(const Value: TClientDataSet);
      procedure SetcdsMovContabBem(const Value: TClientDataSet);
      procedure SetcdsMovTransf(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
      procedure SetcdsImagem(const Value: TClientDataSet);
      procedure SetcdsConjunto(const Value: TClientDataSet);

      // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
      procedure SetcdsImovelxBem(const Value: TclientDataSet);
      procedure SetcdsLancImovelxBem(const Value: TclientDataSet);

      //----------------------------------------------------------------------------------
      // Funções Auxiliares
      //----------------------------------------------------------------------------------
      function TiraCaracter(sStr : string; sCh : Char) : string;
      function RegistraEntradaTotal(nEmpresaProp, nBem,
                                    nGrupo, nSubConta, nAtivProjeto : Extended;
                                    dDataInicioDep : TDateTime; nValHistorico : Extended;
                                    bFlgBemIntContab : Boolean; dDtaContab : TDateTime) : Boolean;
      function CMTranslate(sIgor : String) : String;
      procedure SetcdsPlanoPatroxVigenciaBem(const Value: TClientDataSet);
      // Thiago Melo SOL 204458 Kintana 1981316
      procedure SetcdsHistBemxDep(const Value: TClientDataSet);
    procedure SetidImovelHistorico(const Value: Integer); // Vando - SOL 154328-5901 / KTN 1373449


   Public
      property cds : TClientDataSet               read Fcds               write Setcds;
      property cdsBemxMoeda : TClientDataSet      read FcdsBemxMoeda      write SetcdsBemxMoeda;
      property cdsBemxDep : TClientDataSet        read FcdsBemxDep        write SetcdsBemxDep;
      property cdsPlanoPatroxBem : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      property cdsSaldoContabBem : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
      property cdsSldCtbBemxDep : TClientDataSet  read FcdsSldCtbBemxDep  write SetcdsSldCtbBemxDep;
      property cdsMovContabBem : TClientDataSet   read FcdsMovContabBem   write SetcdsMovContabBem;
      property cdsMovTransf : TClientDataSet      read FcdsMovTransf      write SetcdsMovTransf;
      property cdsTaxasDep : TClientDataSet       read FcdsTaxasDep       write SetcdsTaxasDep;
      property cdsImagem : TClientDataSet         read FcdsImagem         write SetcdsImagem;
      property cdsConjunto : TClientDataSet       read FcdsConjunto       write SetcdsConjunto;
      Property idImovelHistorico : Integer read FidImovelHistorico write SetidImovelHistorico; // Vando - SOL 154328-5901 / KTN 1373449

      // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
      property cdsImovelxBem : TclientDataSet     read FcdsImovelxBem     write SetcdsImovelxBem;
      property cdsLancImovelxBem : TclientDataSet read FcdsLancImovelxBem write SetcdsLancImovelxBem;

      //Cássio - SOL Nº107352 KINTANA Nº 482395 - Registros da tabela PLANOPATROXVIGENCIABEM
      property cdsPlanoPatroxVigenciaBem: TClientDataSet read FcdsPlanoPatroxVigenciaBem write SetcdsPlanoPatroxVigenciaBem;

      // Thiago Melo SOL 204458 Kintana 1981316
      property cdsHistBemxDep: TClientDataSet read FcdsHistBemxDep write SetcdsHistBemxDep;

      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ProcurarBem(nIdPessoa, nIdBem : Extended) : OleVariant;
      function ProcurarBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
      function ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended) : OleVariant;
      function ProcurarPlanoPatroxBem(nIdPessoa, nIdBem, nIdPlanoPrev, nIdPatro : Extended) : OleVariant;

      function ListaBem(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaBemxMoeda(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1): OleVariant;
      function ListaBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                            nIdBemxDep : Extended = -1): OleVariant;
      function ListaHistBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                      nIdBemxDep : Extended = -1): OleVariant; // Helen - SOL: 142551 KTN: 911676

      // Thiago Melo SOL 204458 Kintana 1981316
      function ListaItensHistBemxDep(nIdPessoa, nIdBem : Extended): OleVariant; // Thiago Melo SOL 204458 Kintana 1981316

      function ListaReavaliacao(nIdPessoa : Extended; nIdBem : Extended = -1; bUltReaval : boolean = False): OleVariant;
      function ListaReavalxMoeda(nIdPessoa, nIdBem : Extended; nIdReavaliacao : Extended = -1; nMoeCodigo : Extended = -1) : OleVariant;
      function ListaReavalxDep(nIdPessoa, nIdBem : Extended; nIdReavaliacao : Extended = -1; nMoeCodigo  : Extended = -1; nIdReavalxDep : Extended = -1): OleVariant;

      function ListaAcrescimoValor(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaAcrescValorxMoeda(nIdPessoa, nIdBem : Extended; nIdAcrescimo : Extended = -1; nMoeCodigo : Extended = -1) : OleVariant;
      function ListaAcrescValorxDep(nIdPessoa, nIdBem : Extended; nIdAcrescimo : Extended = -1; nMoeCodigo  : Extended = -1; nIdAcrescimoxDep : Extended = -1): OleVariant;

      function ListaPlanoPatroxBem(nIdPessoa, nIdBem : Extended; nIdPatro : Extended = -1;
                                   nIdPlanoPrev : Extended = -1) : OleVariant;

      function ListaPlanoPatroxBemMedia(nIdPessoa : Extended; sListaIdBem : string) : OleVariant;   // Vando - SOL 154328-5901 / KTN 1373449

      // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
      function ListaImovelxBem(nIdPessoa, nIdBem: Extended): OleVariant;
      function ListaLancImovelxBem(nIdPessoa, nIdBem: Extended): OleVariant;

      function ListaPlanoPatroxVIgenciaBem(nIDPessoa, nIdBem: Extended): OLEVariant;

      function ListaMovimentacao(iEmpresaProp, iBem : Integer;
                                 dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer) : OleVariant;
      function PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
      function PlacaIdBem(nEmpresa : Extended; sPlaca : string) : Integer;

      function CotacaoMoeda(iMoeda : Integer; dData : tDatetime;
                            var iNumDecimais, iFlgArredonda : Integer) : Extended;
      function ConversaoMoeda(nValor : Extended; iMoeda : Integer; dData : tDatetime) : Extended;
      function ComplZeros(sCodigo : String; iTam : Integer) : string;

      function VerificaPeriodoCAF(nEmpresaProp, nBem : Extended;
                                  iFlgImovel : Integer;
                                  sTipoMov : String;
                                  dDataMov : TDateTime;
                                  var dDataUltMov, dDataUltDep : TDateTime;
                                  bPermiteMesmaData : boolean = False) : Boolean;
      function ConvNum(nValor : Extended) : Extended;
      //----------------------------------------------------------------------------------
      // Saldo Contábil
      //----------------------------------------------------------------------------------
      function AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                      iMoeCodigo, iTaxaDep : Integer;
                                      nValOrg, nCmBem, nDepLanc, nCmDep,
                                      nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                      nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc,
                                      nUltReavCmDep : Extended;
                                      iGrupo, iLocalizacao, iResponsavel, iConjunto, iAtivProjeto,
                                      iCodMov, iPai : Integer;
                                      nValorRes : Extended = 0; // Alterado por FHBS - SOL: 136972  KTN: 823252
                                      bRecalculaSaldo : Boolean = True // Alterado por FHBS - 25/09/2018 - SIG46687
                                      ) : Boolean;

      function SaldoContabilBem(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                iMoeCodigo, iTaxaDep : Integer;
                                Var nValOrg, nCmBem,
                                    nDepLanc, nCmDep,
                                    nReavValOrg, nReavCmBem,
                                    nReavDepLanc, nReavCmDep,
                                    nUltReavValOrg, nUltReavCmBem,
                                    nUltReavDepLanc, nUltReavCmDep,
                                    nDepLancAtu, nUltReavDepLancAtu : Extended;
                                Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;

      // Alterado por FHBS - SOL: 136972  KTN: 823252
      function SaldoContabilBem2(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                iMoeCodigo, iTaxaDep : Integer;
                                Var nValOrg, nCmBem,
                                    nDepLanc, nCmDep,
                                    nReavValOrg, nReavCmBem,
                                    nReavDepLanc, nReavCmDep,
                                    nUltReavValOrg, nUltReavCmBem,
                                    nUltReavDepLanc, nUltReavCmDep,
                                    nDepLancAtu, nUltReavDepLancAtu, nValResidual : Extended;
                                Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;

      function SaldoContabil(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                             iMoeCodigo, iTaxaDep : Integer) : Extended;
      function SaldoContabilA(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                              iMoeCodigo, iTaxaDep : Integer;
                              iReavaliacao : Integer = 0) : Extended;
      //----------------------------------------------------------------------------------
      // Movimentações
      //----------------------------------------------------------------------------------
      function ExecutaEntrada(iModulo, iEmpresaProp, iUsuario : Integer;
                              Var nPlanilha : Extended; qtGruposContabeis : TwwQuery = nil) : LongInt;
      function EstornaEntrada(iModulo, iEmpresaProp, iUsuario, iBem : Integer;
                              dDataMov, dDataEst : tDateTime; iTipoEstorna : Integer = 0) : Boolean;
      function ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem : Extended;
                                  nPlacaNova : Extended; dDataMov : TDateTime) : boolean;
      function ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov : TDateTime;
                                    nGrupo, nSubConta, nAtivProjeto : Extended;
                                    dDataInicioDep : TDateTime;
                                    nValHistorico : Extended;
                                    bFlgBemIntContab : Boolean;
                                    dDtaContab : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      // Integração com o Manut
      //----------------------------------------------------------------------------------
      Function ExecutaAlteracaoBemManut : Boolean;
   end;

implementation

{ TCtrlBem }

constructor TCtrlBem.Create;
begin
   inherited;
   _dbBem            := TDBBem.Create(Self);
   _dbBemxMoeda      := TDBBemxMoeda.Create(Self);
   _dbBemxDep        := TDBBemxDep.Create(Self);
   _dbPlanoPatroxBem := TDBPlanoPatroxBem.Create(Self);
   _dbImagem         := TDBImagemBem.Create(Self);
   
   _dbSaldoContabBem := TDBSaldoContabBem.Create(Self);
   _dbSldCtbBemxDep  := TDBSldCtbBemxDep.Create(Self);

   _dMTBem            := tdtmMTBem.Create(Self);

   Fcds               := TClientDataSet.Create(nil);
   FcdsBemxMoeda      := TClientDataSet.Create(nil);
   FcdsBemxDep        := TClientDataSet.Create(nil);
   FcdsPlanoPatroxBem := TClientDataSet.Create(nil);
   FcdsImagem         := TClientDataSet.Create(nil);
   FcdsConjunto       := TClientDataSet.Create(nil);

   FcdsSaldoContabBem := TClientDataSet.Create(nil);
   FcdsSldCtbBemxDep  := TClientDataSet.Create(nil);
   FcdsMovContabBem   := TClientDataSet.Create(nil);
   FcdsMovTransf      := TClientDataSet.Create(nil);
   FcdsTaxasDep       := TClientDataSet.Create(nil);

   // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
   FcdsImovelxBem     := TClientDataSet.Create(Nil);
   FcdsLancImovelxBem := TClientDataSet.Create(Nil);

   //Cássio - SOL Nº 107352 KINTANA Nº 482365 - Início
   FcdsPlanoPatroxVigenciaBem := TClientDataSet.Create(nil);

   // Thiago Melo SOL 204458 Kintana 1981316
   FcdsHistBemxDep := TClientDataSet.Create(nil);

   ParamCAF          := TCtrlParamCAF.Create;
   GrupoContab       := TCtrlGrupoContab.Create;
   Conjunto          := TCtrlConjunto.Create;
   HistMovBem        := TCtrlHistMovBem.Create;
   CAFxContab        := TCtrlCAFxContab.Create;
   DiasUteis         := TDiasUteis.Create;
end;

destructor TCtrlBem.Destroy;
begin
   Fcds.Free;
   FcdsBemxMoeda.Free;
   FcdsBemxDep.Free;
   FcdsPlanoPatroxBem.Free;
   FcdsImagem.Free;
   FcdsConjunto.Free;
   
   FcdsSaldoContabBem.Free;
   FcdsSldCtbBemxDep.Free;
   FcdsMovContabBem.Free;
   FcdsMovTransf.Free;
   FcdsTaxasDep.Free;

   // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
   FcdsImovelxBem.Free;
   FcdsLancImovelxBem.Free;

   //Cássio - SOL Nº 107352 KINTANA Nº 482365 - Início
   FcdsPlanoPatroxVigenciaBem.Free;

   // Thiago Melo SOL 204458 Kintana 1981316
   FcdsHistBemxDep.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbPlanoPatroxBem.Free;
   _dbImagem.Free;

   _dbSaldoContabBem.Free;
   _dbSldCtbBemxDep.Free;

   _dMTBem.Free;

   ParamCAF.Free;
   Conjunto.Free;
   GrupoContab.Free;
   HistMovBem.Free;
   CAFxContab.Free;
   DiasUteis.Free;
   inherited;
end;

procedure TCtrlBem.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CAFxContab.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
end;

procedure TCtrlBem.DoChangeDataBase;
begin
   inherited;
   _dbBem.DataBaseName := DataBaseName;
   _dbBemxMoeda.DataBaseName := DataBaseName;
   _dbBemxDep.DataBaseName := DataBaseName;
   _dbPlanoPatroxBem.DataBaseName := DataBaseName;
   _dbImagem.DataBaseName := DataBaseName;
end;

function TCtrlBem.ListaBem(nIdPessoa, nIdBem: Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.IDBEM, B.IDPESSOA, B.IDFORNSERV, B.IDTERCEIRO, B.IDCLASSEBEM,                 ' + #13 +
           '        B.IDMODULO, B.CODSUBCONTA, B.IDITENSRECDEV, B.UNIDNEGOC, B.IDIMAGEM,            ' + #13 +
           '        B.IDSITUACAO, B.IDCONJUNTO, B.IDGRUPO, B.REGISTRO, B.DESBEM,                    ' + #13 +
           '        B.DTAINCLUSAO, B.DTANOTA, B.DATAINICIODEP, B.PROPBAIXA, B.CONTROLE,             ' + #13 +
           '        B.VALDEPINI, B.NUMSERIE, B.BAIXATOTAL, B.IDNOTA, B.COMPLNOTA, B.PLACA,          ' + #13 +
           '        B.VALHISTORICO, B.FLGSAIDATEMP, B.IDOPCIONAL, B.PROCESSOAQUIS,                  ' + #13 +
           '        B.EMPENHOAQUIS, B.PUBAUTOR, B.PUBEDITORA, B.PUBANO, B.FLGBEMINTCONTAB,          ' + #13 +
           '        B.DTACONTAB, B.PRIORIDADE, B.DATAINSTALACAO, B.DATATERMINOGAR, B.FLGPENHORA, ' + #13 +
           '        CB.DESCRICAO AS NOMECLASSE, S.DESCSITUACAO, C.DESCCONJUNTO,                     ' + #13 +
           '        F.NOME AS NOMEFORN, T.NOME AS NOMETERCEIRO, G.CLASSE, G.NOME AS DESCGRUPO,      ' + #13 +
           '        G.FLGIMOVEL, AP.NOME AS DESCATIVPROJ, SC.NOMESUBCONTA,                          ' + #13 +
           '        C.IDLOCALIZACAO, C.IDRESPONSAVEL,                                               ' + #13 +
           '        L.NOME AS DESCLOCALIZACAO, R.NOME AS NOMERESPONSAVEL,                           ' + #13 +
           // Alterado por FHBS - SOL: 136972 KTN: 823252 - Adicionado "B.VALRESIDUAL"
           '        L.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO, B.VALRESIDUAL, B.PATRIMONIO            ' + #13 +
           // Fim - Alterado por FHBS 
           ' FROM BEM         B,  '+ #13 +
           '      CLASSEDEBEM CB, '+ #13 +
           '      SITUACAO    S,  '+ #13 +
           '      CONJUNTO    C,  '+ #13 +
           '      PESSOA      F,  '+ #13 +
           '      PESSOA      R,  '+ #13 +
           '      PESSOA      T,  '+ #13 +
           '      GRUPO       G,  '+ #13 +
           '      UNIDNEGOCIO AP, '+ #13 +
           '      SUBCONTA    SC, '+ #13 +
           '      LOCALIZACAO L,  '+ #13 +
           '      CENTCUST    CC  '+ #13 +
           ' WHERE (B.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (B.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'+ #13 +
                  '   AND (C.IDRESPONSAVEL  = R.IDPESSOA(+))'+ #13 +
                  '   AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'+ #13 +
                  '   AND (C.IDPESSOA       = L.IDPESSOA(+))'+ #13 +
                  '   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'+ #13 +
                  '   AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'+ #13 +
                  '   AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'+ #13 +
                  '   AND (B.IDSITUACAO     = S.IDSITUACAO(+))'+ #13 +
                  '   AND (B.IDFORNSERV     = F.IDPESSOA(+))'+ #13 +
                  '   AND (B.IDTERCEIRO     = T.IDPESSOA(+))'+ #13 +
                  '   AND (B.IDGRUPO        = G.IDGRUPO(+))'+ #13 +
                  '   AND (B.UNIDNEGOC      = AP.UNIDNEGOC(+))'+ #13 +
                  '   AND (B.IDPESSOA       = AP.IDPESSOA(+))'+ #13 +
                  '   AND (B.CODSUBCONTA    = SC.CODSUBCONTA(+))'+ #13 +
                  '   AND (B.IDPESSOA       = SC.IDPESSOA(+))'+ #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT BM.IDBEM, BM.IDPESSOA, BM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        BM.VALORG, BM.CMBEM, BM.DATAULTCM, '+ #13 +
           // Alterado por FHBS - SOL: 136972 KTN: 823252
           // - Adicionado o campo "BM.VALORRES" e "VALORCALC" que será o (BM.VALORG - BM.VALORRES)
           '        BM.VALORRES, (NVL(BM.VALORG,0) - NVL(BM.VALORRES,0)) AS VALORCALC '+ #13 +
           // Fim - Alterado por FHBS 
           ' FROM BEMXMOEDA BM, '+ #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (BM.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BM.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BM.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BM.MOECODIGO = M.MOECODIGO) ' + #13 +
                  ' ORDER BY BM.IDBEM, BM.MOECODIGO' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended): OleVariant;
var
   sSql : String;

begin
   // Helen - SOL: 142551 KTN: 911676 Add : DATAINICIODEP,DATAFIMDEP,TRGDTINCLUSAO,TRGUSERINCLUSAO
   sSql := ' SELECT BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        BD.DEPLANC, BD.CMDEP, BD.DATAULTDEP, BD.DATAULTCM, BD.FLGDEPREC, '+ #13 +
           '        BD.DATAINICIODEP,BD.DATAFIMDEP, BD.TRGDTINCLUSAO, BD.TRGUSERINCLUSAO '+ #13 +
           '        ,BD.VIDAUTIL'+ #13 +//Darivaldo Alencar SOL198886.18334
           ' FROM BEMXDEP BD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (BD.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BD.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBemxDep <> -1 then
      sSql := sSql + '   AND (BD.IDBEMXDEP = ' + floattostr(nIdBemxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BD.MOECODIGO = M.MOECODIGO) ' + #13 +
                  '   AND (BD.IDBEM = B.IDBEM) ' + #13 +
                  '   AND (BD.IDPESSOA = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA = GD.IDPESSOA) ' + #13 +
                  '   AND (BD.IDBEMXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY BD.IDBEM, BD.MOECODIGO, BD.IDBEMXDEP' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
function TCtrlBem.ListaHistBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended): OleVariant;
var
   sSql : String;
begin
   // Helen - SOL: 142551 KTN: 911676
   sSql := ' SELECT BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        BD.DEPLANC, BD.CMDEP, BD.DATAULTDEP, BD.DATAULTCM, BD.FLGDEPREC, '+ #13 +
           '        BD.DATAINICIODEP,BD.DATAFIMDEP, BD.TRGDTINCLUSAO, BD.TRGUSERINCLUSAO, '+ #13 +
           '        BD.DTINCLUSAO, BD.USERINCLUSAO '+ #13 +
           '        ,BD.VIDAUTIL '+ #13 +//Darivaldo Alencar SOL198886.18334
           ' FROM HISTBEMXDEP BD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (BD.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BD.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBemxDep <> -1 then
      sSql := sSql + '   AND (BD.IDBEMXDEP = ' + floattostr(nIdBemxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BD.MOECODIGO = M.MOECODIGO) ' + #13 +
                  '   AND (BD.IDBEM = B.IDBEM) ' + #13 +
                  '   AND (BD.IDPESSOA = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA = GD.IDPESSOA) ' + #13 +
                  '   AND (BD.IDBEMXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY BD.IDBEM, BD.MOECODIGO, BD.IDBEMXDEP' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaReavaliacao(nIdPessoa, nIdBem: Extended; bUltReaval : boolean) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT R.IDREAVALIACAO, R.IDMOVIMENTACAO, R.IDBEM, R.IDPESSOA, '+ #13 +
           '        R.DATAREAVALIACAO, R.FLGULTREAVAL '+ #13 +
           ' FROM REAVALIACAO R   '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if bUltReaval then
      sSql := sSql + '   AND (R.FLGULTREAVAL = 1) ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaReavalxMoeda(nIdPessoa, nIdBem, nIdReavaliacao, nMoeCodigo : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT R.IDBEM, R.IDPESSOA, RM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        RM.IDREAVALIACAO, RM.VALORG, RM.CMBEM, RM.DATAULTCM ' + #13 +
           ' FROM REAVALIACAO R, ' + #13 +
           '      REAVALXMOEDA RM, ' + #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavaliacao <> -1 then
      sSql := sSql + '   AND (RM.IDREAVALIACAO = ' + floattostr(nIdReavaliacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (RM.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (R.IDREAVALIACAO = RM.IDREAVALIACAO) ' + #13 +
                  '   AND (RM.MOECODIGO = M.MOECODIGO) ' + #13 +
                  ' ORDER BY RM.IDREAVALIACAO, RM.MOECODIGO' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaReavalxDep(nIdPessoa, nIdBem, nIdReavaliacao, nMoeCodigo, nIdReavalxDep : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT R.IDBEM, R.IDPESSOA, RD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        RD.IDREAVALIACAO, RD.IDREAVALXDEP, RD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        RD.DEPLANC, RD.CMDEP, RD.DATAULTDEP, RD.DATAULTCM, RD.FLGDEPREC '+ #13 +
           ' FROM REAVALIACAO R, '+ #13 +
           '      REAVALXDEP RD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavaliacao <> -1 then
      sSql := sSql + '   AND (RD.IDREAVALIACAO = ' + floattostr(nIdReavaliacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (RD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavalxDep <> -1 then
      sSql := sSql + '   AND (RD.IDREAVALXDEP = ' + floattostr(nIdReavalxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (R.IDREAVALIACAO = RD.IDREAVALIACAO) ' + #13 +
                  '   AND (RD.MOECODIGO    = M.MOECODIGO) ' + #13 +
                  '   AND (R.IDBEM         = B.IDBEM) ' + #13 +
                  '   AND (R.IDPESSOA      = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO       = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA      = GD.IDPESSOA) ' + #13 +
                  '   AND (RD.IDREAVALXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY RD.IDREAVALIACAO, RD.MOECODIGO, RD.IDREAVALXDEP' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaAcrescimoValor(nIdPessoa, nIdBem: Extended) : OleVariant;
var
   sSql : String;

begin
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add IDTIPODESPESA
   sSql := ' SELECT A.IDACRESCIMO, A.IDMOVIMENTACAO, A.IDBEM, A.IDPESSOA, '+ #13 +
           '        A.DATAACRESCIMO, A.IDTIPODESPESA '+ #13 +
           ' FROM ACRESCIMOVALOR A '+ #13 +
           ' WHERE (A.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (A.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaAcrescValorxMoeda(nIdPessoa, nIdBem, nIdAcrescimo, nMoeCodigo : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT A.IDBEM, A.IDPESSOA, AM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        AM.IDACRESCIMO, AM.VALORG, AM.CMBEM, AM.DATAULTCM ' + #13 +
           ' FROM ACRESCIMOVALOR A, ' + #13 +
           '      ACRESCVALORXMOEDA AM, ' + #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (A.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (A.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdAcrescimo <> -1 then
      sSql := sSql + '   AND (AM.IDACRESCIMO = ' + floattostr(nIdAcrescimo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (AM.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (A.IDACRESCIMO = AM.IDACRESCIMO) ' + #13 +
                  '   AND (AM.MOECODIGO = M.MOECODIGO) ' + #13 +
                  ' ORDER BY AM.IDACRESCIMO, AM.MOECODIGO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaAcrescValorxDep(nIdPessoa, nIdBem, nIdAcrescimo, nMoeCodigo, nIdAcrescimoxDep : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT A.IDBEM, A.IDPESSOA, AD.MOECODIGO, M.MOEDESC, ' + #13 +
           '        AD.IDACRESCIMO, AD.IDACRESCIMOXDEP, AD.TAXADEP, GD.DESCTAXADEP, ' + #13 +
           '        AD.DEPLANC, AD.CMDEP, AD.DATAULTDEP, AD.DATAULTCM, AD.FLGDEPREC ' + #13 +
           ' FROM ACRESCIMOVALOR A, ' + #13 +
           '      ACRESCVALORXDEP AD, ' + #13 +
           '      MOEDA M, ' + #13 +
           '      BEM B, ' + #13 +
           '      GRUPOTAXADEP GD ' + #13 +
           ' WHERE (A.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (A.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdAcrescimo <> -1 then
      sSql := sSql + '   AND (AD.IDACRESCIMO = ' + floattostr(nIdAcrescimo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (AD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdAcrescimoxDep <> -1 then
      sSql := sSql + '   AND (AD.IDACRESCIMOXDEP = ' + floattostr(nIdAcrescimoxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (A.IDACRESCIMO   = AD.IDACRESCIMO) ' + #13 +
                  '   AND (AD.MOECODIGO    = M.MOECODIGO) ' + #13 +
                  '   AND (A.IDBEM         = B.IDBEM) ' + #13 +
                  '   AND (A.IDPESSOA      = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO       = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA      = GD.IDPESSOA) ' + #13 +
                  '   AND (AD.IDACRESCIMOXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY AD.IDACRESCIMO, AD.MOECODIGO, AD.IDACRESCIMOXDEP ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaPlanoPatroxBem(nIdPessoa, nIdBem, nIdPatro, nIdPlanoPrev: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT PPB.IDBEM,PPB.IDPESSOA,PPB.IDPLANOPREV,PPB.IDPATRO,PPB.PPBPERCRATEIO, ' + #13 +
           '        P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV ' + #13 +
           ' FROM PLANOPATROXBEM PPB, ' + #13 +
           '      PLANPREVCONTABIL PLANO, ' + #13 +
           '      PATRO, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE (PPB.IDPESSOA = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (PPB.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPatro <> -1 then
      sSql := sSql + '   AND (PPB.IDPATRO = ' + floattostr(nIdPatro) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPlanoPrev <> -1 then
      sSql := sSql + '   AND (PPB.IDPLANOPREV = ' + floattostr(nIdPlanoPrev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' AND (PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+)) ' + #13 +
                  ' AND (PPB.IDPATRO = PATRO.IDPESSOA(+)) ' + #13 +
                  ' AND (PATRO.IDPESSOA = P.IDPESSOA(+)) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ListaPlanoPatroxBemMedia(nIdPessoa : Extended; sListaIdBem : string): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT 0 IDBEM, PPB.IDPESSOA,PPB.IDPLANOPREV,PPB.IDPATRO, ' + #13 +
           '        SUM(PPB.PPBPERCRATEIO) / (SELECT COUNT(UNIQUE(IDBEM)) AS QTD FROM  PLANOPATROXBEM WHERE IDBEM IN ('+sListaIdBem+')) PPBPERCRATEIO, ' + #13 +
           '        P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV ' + #13 +
           ' FROM PLANOPATROXBEM PPB, ' + #13 +
           '      PLANPREVCONTABIL PLANO, ' + #13 +
           '      PATRO, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE (PPB.IDPESSOA = '+ floattostr(nIdPessoa) +') ' + #13 +
           '   AND (PPB.IDBEM in (' + sListaIdBem + ')) ' + #13 +
           '   AND (PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+)) ' + #13 +
           '   AND (PPB.IDPATRO = PATRO.IDPESSOA(+)) ' + #13 +
           '   AND (PATRO.IDPESSOA = P.IDPESSOA(+)) ' + #13 +
           ' GROUP BY PPB.IDPESSOA, PPB.IDPLANOPREV, PPB.IDPATRO,P.NOME,PLANO.NOME ';

   Result := GetDataPacket(sSql);
end;


// Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
function tCtrlBem.ListaImovelxBem(nIdPessoa, nIdBem : Extended): OleVariant;
var sSql : String;
begin
   sSql := 'Select IDIMOVEL,IDBEM,IDPESSOA,IXBGRUPO,IXBPERCENT' + #13 +
           'FROM ImovelxBem' + #13 +
           'WHERE (IDPESSOA = '+ floattostr(nIdPessoa) +')' + #13 +
           '  AND (IDBEM = ' + floattostr(nIdBem) + ')' + #13;
   Result := GetDataPacket(sSql);
end;

// Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
Function tCtrlBem.ListaLancImovelxBem(nIdPessoa,nIdBem : Extended): OleVariant;
var sSql : String;
begin
   sSql := 'Select IDLANCIMOVEL,IDBEM,IDPESSOA,VLRMOV,FLGTIPOMOV,FLGNUMMOV,IDMOVIMENTACAO' + #13 +
           'FROM LancImovelxBem' + #13 +
           'WHERE (IDPESSOA = '+ floattostr(nIdPessoa) +')' + #13 +
           '  AND (IDBEM = ' + floattostr(nIdBem) + ')' + #13;
   Result := GetDataPacket(sSql);
end;

function TCtrlBem.ProcurarBem(nIdPessoa, nIdBem: Extended): OleVariant;
begin
   _dbBem.IDPESSOA.AsFloat := nIdPessoa;
   _dbBem.IDBEM.AsFloat    := nIdBem;
   Result := GetDataPacket(_dbBem.sSQLSelect);
end;

function TCtrlBem.ProcurarBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended): OleVariant;
begin
   _dbBemxMoeda.IDPESSOA.AsFloat  := nIdPessoa;
   _dbBemxMoeda.IDBEM.AsFloat     := nIdBem;
   _dbBemxMoeda.MOECODIGO.AsFloat := nMoeCodigo;
   Result := GetDataPacket(_dbBemxMoeda.sSQLSelect);
end;

function TCtrlBem.ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep: Extended): OleVariant;
begin
   _dbBemxDep.IDPESSOA.AsFloat    := nIdPessoa;
   _dbBemxDep.IDBEM.AsFloat       := nIdBem;
   _dbBemxDep.MOECODIGO.AsFloat   := nMoeCodigo;
   _dbBemxDep.IDBEMXDEP.AsFloat   := nIdBemxDep;
   Result := GetDataPacket(_dbBemxDep.sSQLSelect);
end;

function TCtrlBem.ProcurarPlanoPatroxBem(nIdPessoa, nIdBem, nIdPlanoPrev, nIdPatro: Extended): OleVariant;
begin
   _dbPlanoPatroxBem.IDPESSOA.AsFloat    := nIdPessoa;
   _dbPlanoPatroxBem.IDBEM.AsFloat       := nIdBem;
   _dbPlanoPatroxBem.IDPLANOPREV.AsFloat := nIdPlanoPrev;
   _dbPlanoPatroxBem.IDPATRO.AsFloat     := nIdPatro;
   Result := GetDataPacket(_dbPlanoPatroxBem.sSQLSelect);
end;

procedure TCtrlBem.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlBem.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlBem.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlBem.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
   FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlBem.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
   FcdsSaldoContabBem := Value;
end;

procedure TCtrlBem.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
   FcdsSldCtbBemxDep := Value;
end;

procedure TCtrlBem.SetcdsMovContabBem(const Value: TClientDataSet);
begin
   FcdsMovContabBem := Value;
end;

procedure TCtrlBem.SetcdsMovTransf(const Value: TClientDataSet);
begin
   FcdsMovTransf := Value;
end;

procedure TCtrlBem.SetcdsTaxasDep(const Value: TClientDataSet);
begin
   FcdsTaxasDep := Value;
end;

procedure TCtrlBem.SetcdsImagem(const Value: TClientDataSet);
begin
   FcdsImagem := Value;
end;

procedure TCtrlBem.SetcdsConjunto(const Value: TClientDataSet);
begin
  FcdsConjunto := Value;
end;
//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TCtrlBem.ConvNum(nValor : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[nValor]));
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
function TCtrlBem.AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer;
                                         dDataSld : tDateTime;
                                         iMoeCodigo,
                                         iTaxaDep : Integer;
                                         nValOrg, nCmBem, nDepLanc, nCmDep,
                                         nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                         nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc,
                                         nUltReavCmDep : Extended;
                                         iGrupo, iLocalizacao, iResponsavel,
                                         iConjunto, iAtivProjeto,
                                         iCodMov, iPai : Integer;
                                         nValorRes : Extended;
                                         bRecalculaSaldo : Boolean // Alterado por FHBS - 25/09/2018 - SIG46687
                                         ) : Boolean;
Var
   sSql, sMensagem                       : String;
   naValOrg, naCmBem,
   naDepLanc, naCmDep,
   naReavValOrg, naReavCmBem,
   naReavDepLanc, naReavCmDep,
   naUltReavValOrg, naUltReavCmBem,
   naUltReavDepLanc, naUltReavCmDep,
   nSValOrg, nSCmBem,
   nSReavValOrg, nSReavCmBem,
   nSUltReavValOrg, nSUltReavCmBem,
   nSDepLanc, nSCmDep,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavDepLanc, nSUltReavCmDep      : Currency;
   isGrupo, isLocalizacao, isResponsavel,
   isConjunto, isAtivProjeto             : Integer;
   dDataMov                              : TDateTime;
   bResult                               : Boolean;
   fLog   : TextFile;
   sLinha : String;
   naValorRes, nSValorRes                : Currency;
   //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
   _CdsAuxiliar : TClientDataSet;
   dDataBuscaSaldo : TDateTime;

begin
   try
       //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
       _CdsAuxiliar := TClientDataSet.Create(nil);
      //----------------------------------------------------------------------------------
      // Tratamento dos valores
      //----------------------------------------------------------------------------------
      naValOrg := nValOrg;
      naValorRes := nValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
      naCmBem := nCmBem;
      naDepLanc := nDepLanc;
      naCmDep := nCmDep;
      naReavValOrg := nReavValOrg;
      naReavCmBem := nReavCmBem;
      naReavDepLanc := nReavDepLanc;
      naReavCmDep := nReavCmDep;
      naUltReavValOrg := nUltReavValOrg;
      naUltReavCmBem := nUltReavCmBem;
      naUltReavDepLanc := nUltReavDepLanc;
      naUltReavCmDep := nUltReavCmDep;
      //----------------------------------------------------------------------------------
      // Remove os saldos posteriores a data da movimentação estornada
      //----------------------------------------------------------------------------------
      if iCodMov = 2 then
      begin
         if (iPai = 1) then // Remove os saldos quando for a atualização do pai
         begin
            sSql := ' DELETE FROM SLDCTBBEMXDEP ' + #13 +
                    ' WHERE (IDBEM = ' + inttostr(iBem) + ')' + #13 +
                    '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' + #13 +
                    '   AND (MOECODIGO = ' + inttostr(iMoeCodigo) + ')' + #13 ;

            // Alterado por FHBS - 25/09/2018 - SIG46687
            if (not bRecalculaSaldo) then
              sSql := sSql + '   AND (DATASLDBEM = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSld)) + ', ''DD/MM/YYYY''))' + #13;
            // Fim - Alterado por FHBS - 25/09/2018 - SIG46687

            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM SALDOCONTABBEM ' + #13 +
                    ' WHERE (IDBEM = ' + inttostr(iBem) + ')' + #13 +
                    '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' + #13 +
                    '   AND (MOECODIGO = ' + inttostr(iMoeCodigo) + ')' + #13;

            // Alterado por FHBS - 25/09/2018 - SIG46687
            if (not bRecalculaSaldo) then
              sSql := sSql + '   AND (DATASLDBEM = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSld)) + ', ''DD/MM/YYYY''))' + #13;
            // Fim - Alterado por FHBS - 25/09/2018 - SIG46687

            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
         end;
      end;
      //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - INI
      sSql := ' SELECT MAX(H.DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
              ' FROM   HISTORICOMOVIMENTACAO H ' + #13 +
              ' WHERE (H.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +
              '  AND (H.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '  AND H.IDTIPOMOVIMENTACAO NOT IN (200,201) ' + #13 +
              '  AND H.IDTIPOMOVIMENTACAO > 0 ' + #13 +
              '  AND H.IDMOVIMREFCIRCULAR IS NULL ' + #13 +
              '  AND H.DATAMOVIMENTACAO < ' + #13 +
              '       (SELECT MAX(H1.DATAMOVIMENTACAO) ' + #13 +
              '          FROM   HISTORICOMOVIMENTACAO  H1 ' + #13 +
              '         WHERE H1.IDMOVIMENTACAO IN (SELECT HBD.IDMOVIMENTACAO ' + #13 +
              '                                       FROM   HISTORICOMOVIMENTACAO HBD, HISTORICOMOVIMENTACAO H ' + #13 +
              '                                      WHERE (HBD.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +
              '                                        AND (HBD.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '                                        AND (H.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +
              '                                        AND (H.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '                                        AND  H.IDMOVIMREFCIRCULAR = HBD.IDMOVIMENTACAO))' + #13 +
              '  AND NOT EXISTS (SELECT HBD.IDMOVIMENTACAO ' + #13 +
              '                    FROM HISTORICOMOVIMENTACAO HBD ' + #13 +
              '                   WHERE  (HBD.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +
              '                     AND (HBD.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '                     AND (HBD.IDMOVIMREFCIRCULAR = H.IDMOVIMENTACAO)) ';

       _CdsAuxiliar.Data := GetDataPacket(sSql);

       dDataBuscaSaldo := dDataSld;
       if ((not _CdsAuxiliar.isempty) and (_CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime > 0))then
       begin
          if (dDataBuscaSaldo > _CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime) then
             dDataBuscaSaldo := _CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime;
       end;
       //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - FIM

      //----------------------------------------------------------------------------------
      // Prepara os ClientDataSet's que irão gravar o saldo do bem
      //----------------------------------------------------------------------------------
      _dMTBem.sqlSaldoContabBem.Prepare;
      _dMTBem.sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
      _dMTBem.sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
      //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
      _dMTBem.sqlSaldoContabBem.ParamByName('DATASLD').AsDate      := dDataBuscaSaldo;
      _dMTBem.sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
      FcdsSaldoContabBem.Data := _dMTBem.sqlSaldoContabBem.Data;
      _dMTBem.sqlSldCtbBemxDep.Prepare;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('IDBEM').AsInteger      := iBem;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('DATASLD').AsDate       := dDataSld;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger  := iMoeCodigo;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('IDTAXADEP').AsInteger  := iTaxaDep;
      FcdsSldCtbBemxDep.Data  := _dMTBem.sqlSldCtbBemxDep.Data;
      //----------------------------------------------------------------------------------
      // Inicializa as variáveis de trabalho
      //----------------------------------------------------------------------------------
      if not cdsSaldoContabBem.IsEmpty then
      begin
         nSValOrg         := FcdsSaldoContabBem.FieldByName('VALORG').AsFloat;
         nSValorRes       := FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat; // Alterado por FHBS - SOL: 136972  KTN: 823252
         nSCmBem          := FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat;
         nSReavValOrg     := FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat;
         nSReavCmBem      := FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat;
         nSUltReavValOrg  := FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat;
         nSUltReavCmBem   := FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
         nSDepLanc        := FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat;
         nSCmDep          := FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat;
         nSReavDepLanc    := FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat;
         nSReavCmDep      := FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat;
         nSUltReavDepLanc := FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat;
         nSUltReavCmDep   := FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat;
      end else
      begin
         nSValOrg         := 0;
         nSValorRes       := 0; // Alterado por FHBS - SOL: 136972  KTN: 823252
         nSCmBem          := 0;
         nSReavValOrg     := 0;
         nSReavCmBem      := 0;
         nSUltReavValOrg  := 0;
         nSUltReavCmBem   := 0;
         nSDepLanc        := 0;
         nSCmDep          := 0;
         nSReavDepLanc    := 0;
         nSReavCmDep      := 0;
         nSUltReavDepLanc := 0;
         nSUltReavCmDep   := 0;
      end;
      //----------------------------------------------------------------------------------
      // Registra o grupo, localização e responsável
      //----------------------------------------------------------------------------------
      isGrupo       := iGrupo;
      isLocalizacao := iLocalizacao;
      isResponsavel := iResponsavel;
      isConjunto    := iConjunto;
      isAtivProjeto := iAtivProjeto;
      //----------------------------------------------------------------------------------
      // Todas as movimentações, exceto REAVALIAÇÃO
      //----------------------------------------------------------------------------------
      if iCodMov = 0 then
      begin
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização já exista no cadastro, atualizar dados
         //-------------------------------------------------------------------------------
         if FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
         begin
            if iPai = 1 then
            begin
               FcdsSaldoContabBem.Edit;
               FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
               FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat        := nSValorRes       + naValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
               FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
               FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + naReavValOrg;
               FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + naReavCmBem;
               FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg  + naUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem   + naUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
            end;
            if FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
            begin
               FcdsSldCtbBemxDep.Edit;
               FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + naDepLanc;
               FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + naCmDep;
               FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + naReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + naReavCmDep;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := nSUltReavDepLanc + naUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := nSUltReavCmDep   + naUltReavCmDep;
               FcdsSldCtbBemxDep.Post;
            end else
            begin
               FcdsSldCtbBemxDep.Append;
               FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
               FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
               FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
               FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
               FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
               FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
               FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
               FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + naReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + naReavCmDep;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc + naUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep   + naUltReavCmDep;
               FcdsSldCtbBemxDep.Post;
            end;
         end else
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização não exista no cadastro, inserir saldo
         //-------------------------------------------------------------------------------
         begin
            if iPai = 1 then
            begin
               FcdsSaldoContabBem.Append;
               FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger         := iBem;
               FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger      := iEmpresaProp;
               FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime   := dDataSld;
               FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger     := iMoeCodigo;
               FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg        + naValOrg;
               FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat        := nSValorRes      + naValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
               FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem         + naCmBem;
               FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg    + naReavValOrg;
               FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem     + naReavCmBem;
               FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg + naUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem  + naUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
            end;
            FcdsSldCtbBemxDep.Append;
            FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
            FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
            FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
            FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
            FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
            FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
            FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
            FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + naReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + naReavCmDep;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc + naUltReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep   + naUltReavCmDep;
            FcdsSldCtbBemxDep.Post;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Atualização de saldo decorrente de REAVALIAÇÃO
      //----------------------------------------------------------------------------------
      if iCodMov = 1 then
      begin
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização já exista no cadastro, atualizar dados
         //-------------------------------------------------------------------------------
         if cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
         begin
            if iPai = 1 then
            begin
               FcdsSaldoContabBem.Edit;
               FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
               FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat        := nSValorRes       + naValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
               FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
               FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + nSUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + nSUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := naUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := naUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
            end;
            if cdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
            begin
               FcdsSldCtbBemxDep.Edit;
               FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + naDepLanc;
               FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + naCmDep;
               FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + nSUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + nSUltReavCmDep;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := naUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := naUltReavCmDep;
               FcdsSldCtbBemxDep.Post;
            end else
            begin
               FcdsSldCtbBemxDep.Append;
               FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
               FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
               FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
               FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
               FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
               FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
               FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
               FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nSUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nSUltReavCmDep;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := naUltReavDepLanc;
               FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := naUltReavCmDep;
               FcdsSldCtbBemxDep.Post;
            end;
         end else
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização não exista no cadastro, inserir saldo
         //-------------------------------------------------------------------------------
         begin
            if iPai = 1 then
            begin
               FcdsSaldoContabBem.Append;
               FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger         := iBem;
               FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger      := iEmpresaProp;
               FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime   := dDataSld;
               FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger     := iMoeCodigo;
               FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
               FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat        := nSValorRes       + naValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
               FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
               FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + nSUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + nSUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := naUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := naUltReavCmBem;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
            end;
            FcdsSldCtbBemxDep.Append;
            FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
            FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
            FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
            FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
            FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
            FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
            FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
            FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nSUltReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nSUltReavCmDep;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := naUltReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := naUltReavCmDep;
            FcdsSldCtbBemxDep.Post;
        end;
      end else
      //----------------------------------------------------------------------------------
      // Reconstroi Saldo Contábil do Bem
      //----------------------------------------------------------------------------------
      if iCodMov = 2 then
      begin
         if (bRecalculaSaldo) then // Alterado por FHBS - 25/09/2018 - SIG46687
         begin
           nSValOrg         := 0;
           nSValorRes       := 0; // Alterado por FHBS - SOL: 136972  KTN: 823252
           nSCmBem          := 0;
           nSDepLanc        := 0;
           nSCmDep          := 0;
           nSReavValOrg     := 0;
           nSReavCmBem      := 0;
           nSReavDepLanc    := 0;
           nSReavCmDep      := 0;
           nSUltReavValOrg  := 0;
           nSUltReavCmBem   := 0;
           nSUltReavDepLanc := 0;
           nSUltReavCmDep   := 0;
         end;
         //-------------------------------------------------------------------------------
         // Prepara o ClientDataSet que irá fornecer os valores movimentados
         // no bem por moeda x taxa depreciação
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovContabBem.Prepare;
         _dMTBem.sqlRCMovContabBem.ParamByName('PIDBEM').AsInteger     := iBem;
         _dMTBem.sqlRCMovContabBem.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
         _dMTBem.sqlRCMovContabBem.ParamByName('PMOECODIGO').AsInteger := iMoeCodigo;
         _dMTBem.sqlRCMovContabBem.ParamByName('PIDTAXADEP').AsInteger := iTaxaDep;
         FcdsMovContabBem.Data := _dMTBem.sqlRCMovContabBem.Data;
         //-------------------------------------------------------------------------------
         while not FcdsMovContabBem.EOF do
         begin
            // Alterado por FHBS - 25/09/2018 - SIG46687
            if (not bRecalculaSaldo) then
              if FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime < dDataSld then
              begin
                FcdsMovContabBem.Next;
                Continue;
              end;
            // Alterado por FHBS - 25/09/2018 - SIG46687

            nSValOrg         := nSValOrg         + fcdsMovContabBem.FieldByName('VALORG').AsFloat;
            nSValorRes       := nSValorRes       + fcdsMovContabBem.FieldByName('VALORRES').AsFloat; // Alterado por FHBS - SOL: 136972  KTN: 823252
            nSCmBem          := nSCmBem          + fcdsMovContabBem.FieldByName('CMBEM').AsFloat;
            nSDepLanc        := nSDepLanc        + fcdsMovContabBem.FieldByName('DEPLANC').AsFloat;
            if sistema.idmodulo = 7 then // SOL 224857 KINTANA 2058411
            If (nSDepLanc < 0 ) then // SOL 215665 KINTANA 2045970 // O bem é depreciado até seu valor chegar a zero, não podendo ficar com valor negativo.
               nSDepLanc := 0;
            nSCmDep          := nSCmDep          + fcdsMovContabBem.FieldByName('CMDEP').AsFloat;
            nSReavValOrg     := nSReavValOrg     + fcdsMovContabBem.FieldByName('REAVVALORG').AsFloat;
            nSReavCmBem      := nSReavCmBem      + fcdsMovContabBem.FieldByName('REAVCMBEM').AsFloat;
            nSReavDepLanc    := nSReavDepLanc    + fcdsMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
            nSReavCmDep      := nSReavCmDep      + fcdsMovContabBem.FieldByName('REAVCMDEP').AsFloat;
            nSUltReavValOrg  := nSUltReavValOrg  + fcdsMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
            nSUltReavCmBem   := nSUltReavCmBem   + fcdsMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
            nSUltReavDepLanc := nSUltReavDepLanc + fcdsMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
            nSUltReavCmDep   := nSUltReavCmDep   + fcdsMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
            //----------------------------------------------------------------------------
            if iPai = 1 then
            begin
               FcdsSaldoContabBem.Append;
               FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger        := FcdsMovContabBem.FieldByName('IDBEM').AsInteger;
               FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger     := FcdsMovContabBem.FieldByName('IDPESSOA').AsInteger;
               FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger    := iMoeCodigo;
               FcdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg;
               FcdsSaldoContabBem.FieldByName('VALORRES').AsFloat       := nSValorRes; // Alterado por FHBS - SOL: 136972  KTN: 823252
               FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem;
               FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg;
               FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem;
               FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg;
               FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem;
               FcdsSaldoContabBem.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsSldCtbBemxDep.Append;
            FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := FcdsMovContabBem.FieldByName('IDBEM').AsInteger;
            FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := FcdsMovContabBem.FieldByName('IDPESSOA').AsInteger;
            FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
            FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
            FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc;
            FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep;
            FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
            FcdsSldCtbBemxDep.Post;
            //----------------------------------------------------------------------------
            FcdsMovContabBem.Next;
         end;
         FcdsMovContabBem.Close;
         //-------------------------------------------------------------------------------
         // Recoloca os grupos/localizações/responsáveis dos saldos reconstruidos
         //-------------------------------------------------------------------------------
         FcdsSaldoContabBem.Last;
         while not cdsSaldoContabBem.BOF do
         begin
            //----------------------------------------------------------------------------
            // Dados anteriores do bem
            //----------------------------------------------------------------------------
            _dMTBem.sqlMovTransf.Prepare;
            _dMTBem.sqlMovTransf.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTBem.sqlMovTransf.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            FcdsMovTransf.Data := _dMTBem.sqlMovTransf.Data;
            //----------------------------------------------------------------------------
            while (not FcdsSaldoContabBem.BOF) and (FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger = iBem) and
                                                   (FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger = iEmpresaProp) do
            begin
               //-------------------------------------------------------------------------
               // Atualiza os dados na tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Edit;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
               //-------------------------------------------------------------------------
               // Verifica mudança no grupo, localização, responsável,
               // Conjunto ou Atividade/Projeto do bem
               //-------------------------------------------------------------------------
               if FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime then
               begin
                  dDataMov := FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  while (not FcdsMovTransf.EOF) and
                        (FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                  begin
                     if (not FcdsMovTransf.FieldByName('IDGRUPANT').IsNull) and (not FcdsMovTransf.FieldByName('IDGRUPO').IsNull) then
                        isGrupo       := FcdsMovTransf.FieldByName('IDGRUPANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('IDLOCALANT').IsNull) and (not FcdsMovTransf.FieldByName('IDLOCALIZACAO').IsNull) then
                        isLocalizacao := FcdsMovTransf.FieldByName('IDLOCALANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('IDRESPANT').IsNull) and (not FcdsMovTransf.FieldByName('IDRESPONSAVEL').IsNull) then
                        isResponsavel := FcdsMovTransf.FieldByName('IDRESPANT').AsInteger;
                     //-------------------------------------------------------------------
                     if (not FcdsMovTransf.FieldByName('IDCONJANT').IsNull) and (not FcdsMovTransf.FieldByName('IDCONJUNTO').IsNull) then
                        isConjunto    := FcdsMovTransf.FieldByName('IDCONJANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('UNIDNEGOCANT').IsNull) and (not FcdsMovTransf.FieldByName('UNIDNEGOC').IsNull) then
                        isAtivProjeto := FcdsMovTransf.FieldByName('UNIDNEGOCANT').AsInteger;
                     //-------------------------------------------------------------------
                     FcdsMovTransf.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Prior;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Gravação dos dados nas tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
      //----------------------------------------------------------------------------------
      bResult := ApplyCds(FcdsSaldoContabBem,_dbSaldoContabBem,[],[]);
      sMensagem := _dbSaldoContabBem.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);

      bResult := ApplyCds(FcdsSldCtbBemxDep,_dbSldCtbBemxDep,[],[]);
      sMensagem := _dbSldCtbBemxDep.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
   //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
   FreeAndNil(_CdsAuxiliar);
end;
//========================================================================================
// Função que executa a Entrada de um Bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// nPlanilha    : id da Planilha Contábil Gerada
//----------------------------------------------------------------------------------------
function TCtrlBem.ExecutaEntrada(iModulo, iEmpresaProp, iUsuario : Integer;
                                 Var nPlanilha : Extended; qtGruposContabeis : TwwQuery = nil) : LongInt;
var
   iFlgSemPlaca, iExercicio,
   iPeriodo, icBemxDep, iFlgPai,
   iLocalizacao, iResponsavel    : Integer;
   sGrupo, sSql                  : String;
   nTipoMov, nSeqHist            : Extended;
   bCtaxCCusto                   : Boolean;
   nSeqHistValRes                : Extended;

   //----------------------------------------------------------//
   procedure _GravaImovelxBem(const pIdBem : Double);
   begin
     cdsImovelxBem.First;
     while not cdsImovelxBem.Eof do
     begin
       sSql := 'Insert Into ImovelxBem(IDIMOVEL,IDBEM,IDPESSOA,IXBGRUPO,IXBPERCENT)'+#13+'Values(';
       sSql := sSql + cdsImovelxBem.Fields[0].asString+','; // IdImovel
       sSql := sSql + FloatToStr(pIdBem)+',';
       sSql := sSql + cdsImovelxBem.Fields[2].asString+','; // IdPessoa
       sSql := sSql + cdsImovelxBem.Fields[3].asString+','; // IxbGrupo
       sSql := sSql + cdsImovelxBem.Fields[4].asString+')'; // IxbPercent
       try
         ExecSQL(sSql,True);
       except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
         end;
       end;
       cdsImovelxBem.Next;
     end;
     cdsImovelxBem.Close;
   end;
   //----------------------------------------------------------//
   procedure _GravaLancImovelxBem(const pIdBem : Double);
   begin
     cdsLancImovelxBem.First;
     while not cdsLancImovelxBem.Eof do
     begin
       sSql := 'Insert Into LancImovelxBem(IDLANCIMOVEL,IDBEM,IDPESSOA,VLRMOV,FLGTIPOMOV,FLGNUMMOV,IDMOVIMENTACAO)'+#13+'Values(';
       sSql := sSql + cdsLancImovelxBem.Fields[0].asString+',';
       sSql := sSql + FloatToStr(pIdBem)+',';
       sSql := sSql + cdsLancImovelxBem.Fields[2].asString+',';
       sSql := sSql + cdsLancImovelxBem.Fields[3].asString+',';
       sSql := sSql + cdsLancImovelxBem.Fields[4].asString+',';
       sSql := sSql + cdsLancImovelxBem.Fields[5].asString+',';
       sSql := sSql + cdsLancImovelxBem.Fields[6].asString+')';
       try
         ExecSQL(sSql,True);
       except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
         end;
       end;
       cdsLancImovelxBem.Next;
     end;
     cdsLancImovelxBem.Close;
   end;

   procedure _GravaPlanoPatroxVigenciaBem(const pIdBem : Double);
   begin
     cdsPlanoPatroxVigenciaBem.First;
     while not cdsPlanoPatroxVigenciaBem.Eof do
     begin
       sSql := 'INSERT INTO PLANOPATROXVIGENCIABEM(IDPLANOPATROXVIGENCIABEM,IDBEM,DATAVIGENCIA,IDPLANOPREV,IDPESSOA,IDPATRO,PERCENTRATEIO)'+#13+'VALUES(';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[0].asString+',';
       sSql := sSql + FloatToStr(pIdBem)+',';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[2].AsString+',';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[3].asString+',';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[4].asString+',';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[5].asString+',';
       sSql := sSql + cdsPlanoPatroxVigenciaBem.Fields[6].asString+')';
       try
         ExecSQL(sSql,True);
       except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
         end;
       end;
       cdsPlanoPatroxVigenciaBem.Next;
     end;
     cdsPlanoPatroxVigenciaBem.Close;
   end;

   // Thiago Melo SOL 204458 Kintana 1981316

   procedure _GravaHistoricoBemxDep(const pIdBem : Double);
   begin
     cdsHistBemxDep.First;
     while not cdsHistBemxDep.Eof do
     begin
       sSql := 'INSERT INTO HISTBEMXDEP (IDBEMXDEP, IDBEM, IDPESSOA, MOECODIGO, DATAVIGENCIA, TAXADEP, DEPLANC, '+#13+
       'CMDEP, DATAULTDEP, DATAULTCM, FLGDEPREC, VIDAUTIL, DATAFIMDEP, DATAINICIODEP, FLGDEPSUSPENSA)'+#13+'Values(';
       sSql := sSql + cdsHistBemxDep.Fields[0].asString+','; // IdBemXDep
       sSql := sSql + FloatToStr(pIdBem)+',';
       sSql := sSql + cdsHistBemxDep.Fields[2].asString+','; // IdPessoa
       sSql := sSql + cdsHistBemxDep.Fields[3].asString+','; // MOECODIGO

       if cdsHistBemxDep.Fields[4].isNull then begin
         sSql := sSql + 'NULL,'; // DATAVIGENCIA
       end
       else begin
         sSql := sSql + 'to_date(' + QuotedStr(cdsHistBemxDep.Fields[4].asString) + ',' + QuotedStr('dd/mm/yyyy hh24:mi:ss') + '),'; // DATAVIGENCIA
       end;

       sSql := sSql + StringReplace(FloatToStr(cdsHistBemxDep.Fields[5].asFloat), ',', '.', [rfReplaceAll])+','; // TAXADEP
       sSql := sSql + StringReplace(FloatToStr(cdsHistBemxDep.Fields[6].asFloat), ',', '.', [rfReplaceAll])+','; // DEPLANC
       sSql := sSql + cdsHistBemxDep.Fields[7].asString+','; // CMDEP

       if cdsHistBemxDep.Fields[8].isNull then begin
         sSql := sSql + 'NULL,'; // DATAULTDEP
       end
       else begin
         sSql := sSql + 'to_date(' + QuotedStr(cdsHistBemxDep.Fields[8].asString) + ',' + QuotedStr('dd/mm/yyyy hh24:mi:ss') + '),'; // DATAULTDEP
       end;

       if cdsHistBemxDep.Fields[9].isNull then begin
         sSql := sSql + 'NULL,'; // DATAULTCM
       end
       else begin
         sSql := sSql + 'to_date(' + QuotedStr(cdsHistBemxDep.Fields[9].asString) + ',' + QuotedStr('dd/mm/yyyy hh24:mi:ss') + '),'; // DATAULTCM
       end;

       sSql := sSql + cdsHistBemxDep.Fields[10].asString+','; // FLGDEPREC

       if cdsHistBemxDep.Fields[13].isNull then begin
         sSql := sSql + 'NULL,'; // VIDAUTIL
       end
       else begin
         sSql := sSql + cdsHistBemxDep.Fields[13].asString+','; // VIDAUTIL
       end;

       if cdsHistBemxDep.Fields[14].isNull then begin
         sSql := sSql + 'NULL,'; // DATAFIMDEP
       end
       else begin
         sSql := sSql + 'to_date(' + QuotedStr(cdsHistBemxDep.Fields[14].asString) + ',' + QuotedStr('dd/mm/yyyy hh24:mi:ss') + '),'; // DATAFIMDEP
       end;

       if cdsHistBemxDep.Fields[15].isNull then begin
         sSql := sSql + 'NULL)'; // DATAINICIODEP
       end
       else begin
         sSql := sSql + 'to_date(' + QuotedStr(cdsHistBemxDep.Fields[15].asString) + ',' + QuotedStr('dd/mm/yyyy hh24:mi:ss') + '),'; // DATAINICIODEP
       end;

       sSql := sSql + cdsHistBemxDep.Fields[16].asString+')'; // FLGDEPSUSPENSA
       try
         ExecSQL(sSql,True);
       except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
         end;
       end;
       cdsHistBemxDep.Next;
     end;
     cdsHistBemxDep.Close;
   end;
   // Thiago Melo SOL 204458 Kintana 1981316

   // Vando - SOL 154328-5901 / KTN 1373449 - inicio
   procedure cadastrarImovelxBem(idImovel, idBem, idPessoa :integer);
   var sSqlInsertIxB :string;
   begin
     if (idImovel <= 0) or (idBem <= 0) or (idPessoa <= 0) then
       exit;
     if qtGruposContabeis = nil then
       exit;
     qtGruposContabeis.First;
     while not qtGruposContabeis.eof do
     begin
       if qtGruposContabeis.fieldbyname('idGrupo').asinteger = qtGruposContabeis.tag then
         break;
       qtGruposContabeis.next;
     end;
     sSqlInsertIxB := 'INSERT INTO IMOVELXBEM'+
                                   '(IDIMOVEL, IDBEM, IDPESSOA, IXBGRUPO) '+
                              'VALUES'+
                                   '(' + inttostr(idImovel) + ',' + inttostr(idBem) + ',' + inttostr(idPessoa) + ',' + quotedstr(qtGruposContabeis.fieldbyname('GRUPO_BEM').asstring) + ')';
     if not ExecSQL(sSqlInsertIxB, True) then
       Raise Exception.Create(MessageInfo);
   end;
   // Vando - SOL 154328-5901 / KTN 1373449 - fim
begin
   try
      //----------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Validação dos parâmetros obrigatórios para entrada de bens
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('REGISTRO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer o Código de Registro do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((Fcds.FieldbyName('REGISTRO').AsString = 'I') or
              (Fcds.FieldbyName('REGISTRO').AsString = 'O')) then
      begin
         MessageInfo := CMTranslate('Código de registro inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('REGISTRO').AsString = 'O' then
      begin
         Fcds.Edit;
         Fcds.FieldByName('CONTROLE').AsString := 'F';
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('CONTROLE').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a Forma de Controle do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((Fcds.FieldbyName('CONTROLE').AsString = 'T') or (Fcds.FieldbyName('CONTROLE').AsString = 'F')) then
      begin
         MessageInfo := CMTranslate('Código de controle inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDMODULO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do módulo CM inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDPESSOA').IsNull then
      begin
         MessageInfo := CMTranslate('Código da EMPRESA PROPRIETÁRIA Inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT NOME '+
                                    ' FROM PESSOA '+
                                    ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')');
         if _cds.isEmpty then
         begin
            MessageInfo := CMTranslate('Código da EMPRESA PROPRIETÁRIA Inválido ou não cadastrado!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDCONJUNTO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do CONJUNTO do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDLOCALIZACAO, IDRESPONSAVEL, DESCCONJUNTO '+
                                    ' FROM CONJUNTO '+
                                    ' WHERE (IDPESSOA = '   + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (IDCONJUNTO = ' + Fcds.FieldbyName('IDCONJUNTO').AsString + ')');
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código do CONJUNTO do bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
         iLocalizacao := _cds.FieldByName('IDLOCALIZACAO').AsInteger;
         iResponsavel := _cds.FieldByName('IDRESPONSAVEL').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDGRUPO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do GRUPO CONTÁBIL do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT G.IDGRUPO, G.NOME, G.FLGSEMPLACA '+
                                    ' FROM PLANOGRUPO PG, '+
                                    '      GRUPO G '+
                                    ' WHERE (PG.IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (PG.IDGRUPO  = ' + Fcds.FieldbyName('IDGRUPO').AsString + ')'  +
                                    '   AND (PG.IDGRUPO = G.IDGRUPO)');
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código do GRUPO CONTÁBIL do bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
         iFlgSemPlaca := _cds.FieldByName('FLGSEMPLACA').AsInteger;
         sGrupo       := _cds.FieldByName('NOME').AsString;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDCLASSEBEM').IsNull then
      begin
         MessageInfo := CMTranslate('Código da CLASSE do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDCLASSEBEM ' +
                                    ' FROM CLASSEDEBEM ' +
                                    ' WHERE (IDCLASSEBEM = ' + Fcds.FieldbyName('IDCLASSEBEM').AsString + ')') ;
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de CLASSE de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if not Fcds.FieldbyName('CODSUBCONTA').IsNull then
      begin
         _cds.Data := GetDataPacket(' SELECT CODSUBCONTA ' +
                                    ' FROM SUBCONTA ' +
                                    ' WHERE (CODSUBCONTA = ' + Fcds.FieldbyName('CODSUBCONTA').AsString + ')' +
                                    '   AND (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de SUBCONTA de bem inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if (not Fcds.FieldbyName('IDFORNSERV').IsNull) and (Fcds.FieldbyName('IDFORNSERV').AsInteger <> 0) then
      begin
         _cds.Data := GetDataPacket(' SELECT NOME '+
                                    ' FROM PESSOA '+
                                    ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDFORNSERV').AsString + ')' );
         if _cds.isEmpty then
         begin
            MessageInfo := CMTranslate('Código do FORNECEDOR Inválido ou não cadastrado!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('PLACA').IsNull then
      begin
         if iFlgSemPlaca = 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o Número de TOMBAMENTO do bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end else
      begin
         if not PlacaUnica(Fcds.FieldbyName('IDPESSOA').AsFloat,
                           Fcds.FieldbyName('PLACA').AsString) then
         begin
            MessageInfo := CMTranslate('Número da PLACA DE TOMBAMENTO já alocado a outro bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDSITUACAO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a ID da SITUAÇÃO FÍSICA do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDSITUACAO ' +
                                    ' FROM SITUACAO ' +
                                    ' WHERE (IDSITUACAO = ' + Fcds.FieldbyName('IDSITUACAO').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código da SITUAÇÃO FÍSICA de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('DESBEM').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a DESCRIÇÃO do bem!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('FLGBEMINTCONTAB').AsInteger = 1 then
      begin
         if Fcds.FieldbyName('DTACONTAB').IsNull then
         begin
            MessageInfo := CMTranslate('A data do registro do custo de entrada do bem na contabilidade deve ser informada!');
            Raise Exception.Create(MessageInfo);
         end;
      end else
      begin
         Fcds.Edit;
         Fcds.FieldbyName('DTACONTAB').Clear;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('UNIDNEGOC').IsNull then
      begin
         Fcds.Edit;
         Fcds.FieldbyName('UNIDNEGOC').AsFloat := ParamCAF.ATIVPROJETO;
      end;
      //----------------------------------------------------------------------------------
      // Tratamento da Imagem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM IMAGENS ' +
              ' WHERE IDIMAGEM = ' + floattostr(FcdsImagem.FieldByName('IDIMAGEM').AsFloat);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      if not FcdsImagem.FieldByName('IMAGEM').IsNull then
      begin
         CdsToDbObject(FcdsImagem,_dbImagem);
         if not _dbImagem.Insert then
            Raise Exception.Create(_dbImagem.MessageInfo);
         Fcds.Edit;
         Fcds.FieldbyName('IDIMAGEM').AsFloat := _dbImagem.IDIMAGEM.AsFloat;
      end else
      begin
         Fcds.Edit;
         Fcds.FieldbyName('IDIMAGEM').Clear;
      end;

      //----------------------------------------------------------------------------------
      // Verificar se todas as taxas de depreciação foram informadas
      //----------------------------------------------------------------------------------
      icBemxDep := 0;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial then
            icBemxDep := icBemxDep + 1;
         FcdsBemxDep.Next;
      end;
      if icBemxDep <> ParamCAF.NUMTAXADEP then
      begin
         MessageInfo := CMTranslate('As taxas de depreciação não foram totalmente informadas!');
         Raise Exception.Create(MessageInfo);
      end;
      //==================================================================================
      // Gravação dos dados nas tabelas BEM, BEMXMOEDA, BEMXDEP, PLANOPATROXBEM
      // Não deve ser usado o ApplyCds, pois o mesmo traz o status do form
      //==================================================================================
      CdsToDbObject(Fcds,_dbBem);
      if not _dbBem.InsertAs(Fcds.FieldByName('IDBEM').AsFloat) then
         Raise Exception.Create(_dbBem.MessageInfo);

      // Vando - SOL 154328-5901 / KTN 1373449
      cadastrarImovelxBem(idImovelHistorico, _dbBem.idBem.AsInteger, _dbBem.idPessoa.AsInteger); 

      // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
      If Not FcdsImovelxBem.IsEmpty then
      begin
        _GravaImovelxBem(_dbBem.IdBem.AsFloat);
        _GravaLancImovelxBem(_dbBem.IdBem.AsFloat);
        //Cássio - SOL Nº107352 KINTANA Nº 482365 - Início
        _GravaPlanoPatroxVigenciaBem(_dbBem.Idbem.AsFloat);
      end;

      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
         _dbBemxMoeda.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbBemxMoeda.Insert then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         CdsToDbObject(FcdsBemxDep,_dbBemxDep);
         _dbBemxDep.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbBemxDep.Insert then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------


      // Thiago Melo SOL 204458 Kintana 1981316
      If Not FcdsHistBemxDep.IsEmpty then
      begin
        _GravaHistoricoBemxDep(_dbBem.IdBem.AsFloat);
      end;
      // Thiago Melo SOL 204458 Kintana 1981316


      FcdsPlanoPatroxBem.First;
      while not FcdsPlanoPatroxBem.EOF do
      begin
         CdsToDbObject(FcdsPlanoPatroxBem,_dbPlanoPatroxBem);
         _dbPlanoPatroxBem.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbPlanoPatroxBem.Insert then
            Raise Exception.Create(_dbPlanoPatroxBem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsPlanoPatroxBem.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra a entrada na contabilidade
      //----------------------------------------------------------------------------------
      nPlanilha := -1;
      if (ParamCAF.INTEGRACONTAB = 'S') and
         (_dbBem.FLGBEMINTCONTAB.AsInteger = 1) and
         (_dbBem.CONTROLE.AsString = 'T') and
         ((_dbBem.IDMODULO.AsInteger = 7) or (_dbBem.IDMODULO.AsInteger = 54)) then
      begin
         if not CAFxContab.VerificaPeriodoContabil(_dbBem.IDPESSOA.AsInteger,
                                                   _dbBem.DTACONTAB.AsDateTime,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query de montagem da Planilha Contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.InicializaMontaContab then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query com a Parametrização contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.MontaParamCAFxContab(_dbBem.IDPESSOA.AsInteger, ParamCAF.PLANOVIGENTE) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Lê a Dependencia da Conta Contábil do Centro de Custo
         //-------------------------------------------------------------------------------
         bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
         //-------------------------------------------------------------------------------
         // Leitura do valor a ser contabilizado
         //-------------------------------------------------------------------------------
         if not FcdsBemxMoeda.Locate('MOECODIGO',VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]) then
            Raise Exception.Create(CMTranslate('Erro na leitura do valor a ser contabilizado'));
         //-------------------------------------------------------------------------------
         // Prepara o DataSet que irá acumular a planilha contábil para a integração
         //-------------------------------------------------------------------------------
         if not CAFxContab.ContabilizaEntrada(_dbBem.IDMODULO.AsInteger, _dbBem.IDPESSOA.AsInteger,
                                              _dbBem.IDBEM.AsInteger, _dbBem.IDGRUPO.AsInteger,
                                              _dbBem.IDCONJUNTO.AsInteger, _dbBem.UNIDNEGOC.AsInteger,
                                              _dbBem.CODSUBCONTA.AsInteger, _dbBem.PLACA.AsString,
                                              _dbBem.DESBEM.AsString, sGrupo,
                                              _dbBem.DTACONTAB.AsDateTime,
                                              FcdsBemxMoeda.FieldByName('VALORG').AsFloat,
                                              iExercicio, iPeriodo, bCtaxCCusto, 01) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         // Alterado por FHBS - SOL: 136972 KTN: 823252
         if FcdsBemxMoeda.FieldByName('VALORRES').AsFloat > 0 then
         begin
           if not CAFxContab.ContabilizaEntrada(_dbBem.IDMODULO.AsInteger, _dbBem.IDPESSOA.AsInteger,
                                                _dbBem.IDBEM.AsInteger, _dbBem.IDGRUPO.AsInteger,
                                                _dbBem.IDCONJUNTO.AsInteger, _dbBem.UNIDNEGOC.AsInteger,
                                                _dbBem.CODSUBCONTA.AsInteger, _dbBem.PLACA.AsString,
                                                _dbBem.DESBEM.AsString, sGrupo,
                                                _dbBem.DTACONTAB.AsDateTime,
                                                FcdsBemxMoeda.FieldByName('VALORRES').AsFloat,
                                                iExercicio, iPeriodo, bCtaxCCusto, 97) then
              Raise Exception.Create(CAFxContab.MessageInfo);
         end;
         // Fim - Alterado por FHBS
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         nPlanilha := CAFxContab.RegistraPlanilhaContabil(_dbBem.IDMODULO.AsFloat,
                                                          _dbBem.IDPESSOA.AsFloat,
                                                          iUsuario,
                                                          _dbBem.DTACONTAB.AsString);
         if nPlanilha < 0 then
            Raise Exception.Create(CAFxContab.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Registra a entrada no histórico
      //----------------------------------------------------------------------------------
      if _dbBem.CONTROLE.AsString = 'T' then
         nTipoMov := 01
      else
         nTipoMov := 03;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                nTipoMov,                      // IDTIPOMOVIMENTACAO
                                                _dbBem.DTAINCLUSAO.AsDatetime, // DATAMOVIMENTACAO
                                                -1,                            // IDREAVALACRESC
                                                -1,                            // DATAULTDEP
                                                -1,                            // IDGRUPANT
                                                -1,                            // IDCONJANT
                                                -1,                            // IDLOCALANT
                                                -1,                            // IDRESPANT
                                                -1,                            // PLACAANT
                                                nPlanilha,                     // PLNCODIGO
                                                '',                            // OBSREAVAL
                                                0,                             // TIPDEPPRORATA
                                                -1,                            // IDTIPODESPESA
                                                '',                            // OBSACRESCIMO
                                                -1,                            // IDMOTIVOBAIXA
                                                0,                             // PROPBAIXA
                                                0,                             // VALVENDAOFI
                                                '');                           // OBSBAIXA
      if nSeqHist = -1 then
         Raise Exception.Create(HistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //----------------------------------------------------------------------------------
      nSeqHistValRes := 0; // Alterado por FHBS - SOL: 136972  KTN: 823252
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 0,
                                                 FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
            Raise Exception.Create(HistMovBem.MessageInfo);

         // Alterado por FHBS - SOL: 136972  KTN: 823252
         if FcdsBemxMoeda.FieldByName('VALORRES').AsFloat > 0 then
         begin
           if nSeqHistValRes = 0 then
             nSeqHistValRes := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                             _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                             _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                             97,                            // IDTIPOMOVIMENTACAO
                                                             _dbBem.DTAINCLUSAO.AsDatetime, // DATAMOVIMENTACAO
                                                             -1,                            // IDREAVALACRESC
                                                             -1,                            // DATAULTDEP
                                                             -1,                            // IDGRUPANT
                                                             -1,                            // IDCONJANT
                                                             -1,                            // IDLOCALANT
                                                             -1,                            // IDRESPANT
                                                             -1,                            // PLACAANT
                                                             nPlanilha,                     // PLNCODIGO
                                                             '',                            // OBSREAVAL
                                                             0,                             // TIPDEPPRORATA
                                                             -1,                            // IDTIPODESPESA
                                                             '',                            // OBSACRESCIMO
                                                             -1,                            // IDMOTIVOBAIXA
                                                             0,                             // PROPBAIXA
                                                             0,                             // VALVENDAOFI
                                                             '');                           // OBSBAIXA
            if nSeqHistValRes = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);

           if not HistMovBem.RegistraVlrHistMovBem(nSeqHistValRes,
                                                   FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                   0,
                                                   FcdsBemxMoeda.FieldByName('VALORRES').AsFloat) then
              Raise Exception.Create(HistMovBem.MessageInfo);
         end;
         // Fim - Alterado por FHBS

         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
            begin
               if not AtualizaSaldoContabBem(_dbBem.IDPESSOA.AsInteger,
                                             _dbBem.IDBEM.AsInteger,
                                             _dbBem.DTAINCLUSAO.AsDateTime,
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                             FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, 0, 0, 0,
                                             _dbBem.IDGRUPO.AsInteger,
                                             iLocalizacao,
                                             iResponsavel,
                                             _dbBem.IDCONJUNTO.AsInteger,
                                             _dbBem.UNIDNEGOC.AsInteger,
                                             0, iFlgPai,
                                             FcdsBemxMoeda.FieldByName('VALORRES').AsFloat) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
            end;
            FcdsBemxDep.Next;
         end;
         FcdsBemxMoeda.Next;
      end;

     // Vando - SOL 154328-5901 / KTN 1373449
     SetidImovelHistorico(strtoint(floattostr(nSeqHist)));

      //----------------------------------------------------------------------------------
      Result := _dbBem.IdBem.AsInteger;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := -1;
      end;
   end;
end;
//========================================================================================
// Função que executa o estorno da Entrada de um Bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem                    (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária                        (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
// iTipoEstorna : 0 - Estorno Total
//                1 - Estorno Parcial
//                2 - Estorno Total de Entrada por Encerramento de Obra
//----------------------------------------------------------------------------------------
function TCtrlBem.EstornaEntrada(iModulo, iEmpresaProp, iUsuario, iBem : Integer;
                                 dDataMov, dDataEst : tDateTime;
                                 iTipoEstorna : Integer) : Boolean;
Var
   iExercicio, iPeriodo,
   iTotPlan, iPlan       : Integer;
   aPlanilha             : Array [1..12] of Integer;
   aDataMov              : Array [1..12] of tDateTime;
   sSql                  : String;

begin
   try
      //----------------------------------------------------------------------------------
      // Posiciona a tabela BEM
      //----------------------------------------------------------------------------------
      if Fcds.IsEmpty then
         Fcds.Data := ListaBem(iEmpresaProp,iBem);
      //----------------------------------------------------------------------------------
      if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MessageInfo := CMTranslate('Bem em Saída Temporária!');
         Raise Exception.Create(MessageInfo);
      end else
      if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MessageInfo := CMTranslate('Bem Baixado!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após sua entrada nos bens com
      // controle total
      //----------------------------------------------------------------------------------
      if Fcds.FieldByName('CONTROLE').AsString = 'T' then
      begin
         _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO '+
                                    ' FROM   HISTORICOMOVIMENTACAO ' +
                                    ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                    '   AND (IDBEM = ' + inttostr(iBem) + ')' +
                                    '   AND (IDTIPOMOVIMENTACAO <> 01)  '+    // ENTRADA TOTAL
                                    '   AND (IDTIPOMOVIMENTACAO <> 03)  '+    // ENTRADA FISICA
                                    '   AND (IDTIPOMOVIMENTACAO <> 17)  '+    // INCLUSAO DE DEPRECIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 15)  '+    // CORRECAO MONETARIA
                                    '   AND (IDTIPOMOVIMENTACAO <> 21)  '+    // CORRECAO MONETARIA DA DEPRECIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 32)  '+    // INCLUSAO DO SALDO DE REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 33)  '+    // INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 22)  '+    // CORRECAO MONETARIA DA REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 19)  '+    // CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 97)  ');   // VALOR RESIDUAL // Alterado por FHBS - SOL: 136972 KTN: 823252
         if not _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Existe movimentação após a Entrada do Bem no Ativo Fixo. Consulte Movimentação!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if iTipoEstorna < 2 then
      begin
         if (ParamCAF.INTEGRACONTAB = 'S') and
            (Fcds.FieldByName('FLGBEMINTCONTAB').AsInteger = 1) and
            (Fcds.FieldByName('CONTROLE').AsString = 'T') and
            ((Fcds.FieldByName('IDMODULO').AsInteger = 7) or
             (Fcds.FieldByName('IDMODULO').AsInteger = 54)) then
         begin
            if CAFxContab.VerificaPeriodoContabil(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                  Fcds.FieldByName('DTACONTAB').AsDateTime,
                                                  iExercicio,iPeriodo) then
            begin
               _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                                          ' FROM   HISTORICOMOVIMENTACAO '+
                                          ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                                          '   AND (IDBEM    = ' + inttostr(iBem) + ') ');
               iTotPlan := 0;
               while not _cds.EOF do
               begin
                  if not ((_cds.FieldByName('PLNCODIGO').AsInteger <= 0) or
                          (_cds.FieldByName('PLNCODIGO').IsNull)) then
                  begin
                     iTotPlan := iTotPlan + 1;
                     aPlanilha[iTotPlan] := _cds.FieldByName('PLNCODIGO').AsInteger;
                     aDataMov[iTotPlan]  := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  end;
                  _cds.Next;
               end;
               //-------------------------------------------------------------------------
               // RETIRA O LINK DA PLANILHA CONTÁBIL
               //-------------------------------------------------------------------------
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL '+
                       ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                       '                          FROM HISTORICOMOVIMENTACAO'+
                       '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                       '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iPlan := 1;
               while iPlan <= iTotPlan do
               begin
                  if not CAFxContab.RemovePlanContab(iEmpresaProp) then
                  begin
                     if not CAFxContab.LancaContab.EstornaLancaContab(iUsuario, aPlanilha[iPlan],
                                                                      iModulo,iEmpresaProp,
                                                                      ParamCAF.USAPLANOPATRO,
                                                                      datetostr(aDataMov[iPlan])) then
                     begin
                        MessageInfo := CMTranslate('Estorno Entrada : Estorno da Planilha Contabil não Executado !');
                        Raise Exception.Create(MessageInfo);
                     end;
                  end else
                  begin
                     if not CAFxContab.LancaContab.ExcluiLancaContab(iUsuario, aPlanilha[iPlan],
                                                                     iModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                     begin
                        MessageInfo := CMTranslate('Estorno Entrada : Remoção da Planilha Contabil não Executada !');
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  iPlan := iPlan + 1;
               end;
            end else
            begin
               MessageInfo := CMTranslate('Erro no Estorno das Planilhas Contábeis !');
               Raise Exception.Create(MessageInfo);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDREAVALACRESC ' + #13 +
                                 ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                 '   AND (IDBEM    = ' + inttostr(iBem) + ')');
      while not _cds.Eof do
      begin
         if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32 then  // Saldo de Reavaliações
         begin
            sSql := ' DELETE FROM REAVALXDEP ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALXDEP)');
            sSql := ' DELETE FROM REAVALXMOEDA ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALXMOEDA)');
            sSql := ' DELETE FROM REAVALIACAO ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALIACAO)');
         end;
         //-------------------------------------------------------------------------------
         if not ((_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 04) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12)) then  // Saldo de Reavaliações
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then  // MANUT
               Raise Exception.Create(MessageInfo + ' (VLRHISTMOVBEM)');
         end;
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Remove os Registros de Movimentacao Inicial do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (HISTORICOMOVIMENTACAO)');
      //----------------------------------------------------------------------------------
      // Remove os Registros de Saldos Contábeis do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (SLDCTBBEMXDEP)');
      sSql := ' DELETE FROM SALDOCONTABBEM ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (SALDOCONTABBEM)');
      //----------------------------------------------------------------------------------
      // Remove o Bem, caso o estorno seja total
      //----------------------------------------------------------------------------------
      if (iTipoEstorna = 0) or (iTipoEstorna = 2) then
      begin
         sSql := ' DELETE FROM BEMCOTACAO ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);

         sSql := ' DELETE FROM PLANOPATROXBEM ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);

         sSql := ' DELETE FROM BEMXDEP ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (BEMXDEP)');


         // Thiago Melo SOL 204458 Kintana 1981316
         sSql := ' DELETE FROM HISTBEMXDEP ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo + ' (HISTBEMXDEP)');
         // Thiago Melo SOL 204458 Kintana 1981316

         sSql := ' DELETE FROM BEMXMOEDA ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (BEMXMOEDA)');

         // Alterado por Arnaldo V. Scarin - SOL: 100718 Kintana: 446391 - Erro de Constraint ao gravar alterações
         // Erro ao alterar um registro dentro do CAF, e esse registro tem
         // ramificações com o Sistema Imobiliário
         If iModulo = 54 then
         begin
           sSql := ' DELETE FROM IMOVELXBEM ' +
                   ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                   '   AND (IDBEM    = ' + inttostr(iBem) + ')';
           if not ExecSQL(sSql) then
              Raise Exception.Create(MessageInfo + ' (BEM)');

           sSql := ' DELETE FROM LANCIMOVELXBEM ' +
                   ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                   '   AND (IDBEM    = ' + inttostr(iBem) + ')';
           if not ExecSQL(sSql) then
              Raise Exception.Create(MessageInfo + ' (BEM)');

           //Cássio - SOL Nº 139388 KINTANA Nº855985 - Início
           //Exclui lançamentos na PLANOPATROXVIGENCIABEM
           sSql := ' DELETE FROM PLANOPATROXVIGENCIABEM ' +
                   '  WHERE (IDPESSOA = ' + IntToStr(iEmpresaProp) + ')' +
                   '    AND (IDBEM = ' + IntToStr(iBem) + ')';
           if not ExecSQL(sSql) then
            Raise Exception.Create(MessageInfo + '(BEM)');
           //Cássio - SOL Nº 139388 KINTANA Nº855985  - Fim
         end;

         sSql := ' DELETE FROM BEM ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo + ' (BEM)');

         if not Fcds.FieldByName('IDIMAGEM').IsNull then
         begin
            sSql := ' DELETE FROM IMAGENS ' +
                    ' WHERE IDIMAGEM = ' + floattostr(Fcds.FieldByName('IDIMAGEM').AsFloat);
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
function TCtrlBem.TiraCaracter(sStr : string; sCh : Char) : string;
var
   iConta : Byte;

begin
   Result := '';
   for iConta := 1 to length(sStr) do
   begin
      if sStr[iConta] <> sCh then
         Result := Result + sStr[iConta];
   end;
end;
//========================================================================================
function TCtrlBem.PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
var
   sSql, sPlacaAux : String;

begin
   sPlacaAux := sPlaca;
   while (pos('.',sPlacaAux) <> 0) do
      sPlacaAux := TiraCaracter(sPlacaAux,'.');
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT IDBEM, DESBEM ' + #13 +
           ' FROM BEM ' + #13 +
           ' WHERE (PLACA = ' + sPlacaAux + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nEmpresa) + ') ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   result := _cds.IsEmpty;
end;
//========================================================================================
function TCtrlBem.PlacaIdBem(nEmpresa : Extended; sPlaca : string) : Integer;
var
   sSql, sPlacaAux : String;

begin
   sPlacaAux := sPlaca;
   while (pos('.',sPlacaAux) <> 0) do
      sPlacaAux := TiraCaracter(sPlacaAux,'.');
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT IDBEM, DESBEM ' + #13 +
           ' FROM BEM ' + #13 +
           ' WHERE (PLACA = ' + sPlacaAux + ') ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nEmpresa) + ') ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.RecordCount = 1 then
      result := _cds.FieldByName('IDBEM').AsInteger
   else
      result := 0;
end;
//========================================================================================
function TCtrlBem.CotacaoMoeda(iMoeda : Integer; dData : TDateTime;
                               var iNumDecimais, iFlgArredonda : Integer) : Extended;
var
   sData               : String;
   cdsMoeda, cdsMoedaC : TClientDataSet;

begin
   cdsMoeda  := TClientDataSet.Create(nil);
   cdsMoedaC := TClientDataSet.Create(nil);
   //-------------------------------------------------------------------------------------
   try
      cdsMoeda.Data := GetDataPacket(' SELECT MOECODIGO, MOEPERIODICIDADE, MOEDESC, ' + #13 +
                                     '        (2) AS NUMDECIMAIS, (1) AS FLGARREDONDA ' + #13 +
                                     ' FROM MOEDA ' + #13 +
                                     ' WHERE MOECODIGO = ' + inttostr(iMoeda));
      //----------------------------------------------------------------------------------
      if not cdsMoeda.FieldByName('NUMDECIMAIS').IsNull then
      begin
         iNumDecimais  := cdsMoeda.FieldByName('NUMDECIMAIS').AsInteger;
         iFlgArredonda := cdsMoeda.FieldByName('FLGARREDONDA').AsInteger;
      end else
      begin
         iNumDecimais  := 2;
         iFlgArredonda := 1;
      end;
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'A' then
      begin
         sData := copy(datetostr(dData),7,4);
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTMESREF = ' + QuotedStr(sData) + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.IsEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Ano ') + sData + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Ano ') + sData + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
      begin
         sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTMESREF = ' + QuotedStr(sData) + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.IsEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Mês ') + sData + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Mês ') + sData + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE MOECODIGO = ' + inttostr(iMoeda) + #13 +
                                         '   AND COTDATA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dData)) + ',' + QuotedStr('DD/MM/YYYY') + ')');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.isEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Dia ') + datetostr(dData) + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Dia ') + datetostr(dData) + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      begin
         Result := 1;
      end;
   finally
      cdsMoeda.Free;
      cdsMoedaC.Free;
   end;
end;
//========================================================================================
function TCtrlBem.ConversaoMoeda(nValor : Extended; iMoeda : Integer; dData : TDatetime) : Extended;
var
   nFator, nValMin, nResult : Extended;
   iFatorDec, iNumDecimais, iFlgArredonda : Integer;
   sFatorDec : String;
begin
   try
      nFator := CotacaoMoeda(iMoeda, dData, iNumDecimais, iFlgArredonda);
      if nFator < 0 then
         raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      nResult := nValor / nFator;
      //----------------------------------------------------------------------------------
      // Retorna os valores na precisão cadastrada no Global para a Moeda Padrão
      //----------------------------------------------------------------------------------
      if iMoeda = ParamCAF.MOEDAPADRAO then
      begin
         if ParamCAF.MOEPADRAODECIMAIS > 0 then
            nValMin := 1 / Power(10,ParamCAF.MOEPADRAODECIMAIS)
         else
            nValMin := 0;
         //-------------------------------------------------------------------------------
         if abs(nResult) >= nValMin then
         begin
            iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
            if ParamCAF.MOEPADRAODECIMAIS > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
            end else
            begin
               sFatorDec := '#0';
            end;
            nResult := strtofloat(FormatFloat(sFatorDec,((nResult * iFatorDec) / iFatorDec)));
         end;
      end else
      begin
         if iNumDecimais > 0 then
            nValMin := 1 / Power(10,iNumDecimais)
         else
            nValMin := 0;
         //-------------------------------------------------------------------------------
         if abs(nResult) >= nValMin then
         begin
            iFatorDec := 10 * iNumDecimais;
            if iNumDecimais > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',iNumDecimais);
            end else
            begin
               sFatorDec := '#0';
            end;
            nResult := strtofloat(FormatFloat(sFatorDec,((nResult * iFatorDec) / iFatorDec)));
         end;
      end;
      Result := nResult;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;
//========================================================================================
// Funções genéricas
//========================================================================================
function TCtrlBem.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;
//========================================================================================
function TCtrlBem.SaldoContabil(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                iMoeCodigo, iTaxaDep : Integer) : Extended;
var
   nValOrg, nCmBem, nDepLanc, nCmDep,
   nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
   nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
   nDepLancAtu, nUltReavDepLancAtu    : Extended;
   iGrupo, iLocalizacao, iResponsavel : Integer;

begin
   try
      if not SaldoContabilBem(iEmpresaProp, iBem, dDataSld, iMoeCodigo, iTaxaDep,
                              nValOrg, nCmBem, nDepLanc, nCmDep,
                              nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                              nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
                              nDepLancAtu, nUltReavDepLancAtu,
                              iGrupo, iLocalizacao, iResponsavel) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      Result := nValOrg + nCmBem - nDepLanc - nCmDep +
                nReavValOrg + nReavCmBem - nReavDepLanc - nReavCmDep +
                nUltReavValOrg + nUltReavCmBem - nUltReavDepLanc - nUltReavCmDep;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;

function TCtrlBem.SaldoContabilBem(iEmpresaProp, iBem : Integer;
                                   dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer;
                                   Var nValOrg, nCmBem,
                                       nDepLanc, nCmDep,
                                       nReavValOrg, nReavCmBem,
                                       nReavDepLanc, nReavCmDep,
                                       nUltReavValOrg, nUltReavCmBem,
                                       nUltReavDepLanc, nUltReavCmDep,
                                       nDepLancAtu, nUltReavDepLancAtu: Extended;
                                   Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;
//Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
var _CdsAuxiliar : TClientDataSet;
    sSql : String;
begin
   try
      //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
      sSql := ' SELECT MAX(H.DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
              ' FROM   HISTORICOMOVIMENTACAO H ' + #13 +
              ' WHERE  (H.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +' AND (H.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '  AND H.IDTIPOMOVIMENTACAO NOT IN (200,201) ' + #13 +
              '  AND H.IDTIPOMOVIMENTACAO > 0 ' + #13 +
              '  AND H.IDMOVIMREFCIRCULAR IS NULL ' + #13 +
              '  AND H.DATAMOVIMENTACAO < ' + #13 +
              '       (SELECT H1.DATAMOVIMENTACAO ' + #13 +
              '          FROM   HISTORICOMOVIMENTACAO  H1 ' + #13 +
              '         WHERE H1.IDMOVIMENTACAO IN (SELECT HBD.IDMOVIMENTACAO ' + #13 +
              '                                       FROM   HISTORICOMOVIMENTACAO HBD, HISTORICOMOVIMENTACAO H ' + #13 +
              '                                      WHERE  (HBD.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +' AND (HBD.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '                                        AND (H.IDBEM    = ' + floattostr(iBem) + ') ' + #13 +' AND (H.IDPESSOA = ' + floattostr(iEmpresaProp) + ') ' + #13 +
              '                                        AND  H.IDMOVIMREFCIRCULAR = HBD.IDMOVIMENTACAO)' + #13 +
              '                                      GROUP BY H1.DATAMOVIMENTACAO)';

       _CdsAuxiliar      := TClientDataSet.Create(nil);              
       _CdsAuxiliar.Data := GetDataPacket(sSql);

       if ((not _CdsAuxiliar.isempty) and (_CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime > 0))then
       begin
          if (dDataSld > _CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime) then
             dDataSld := _CdsAuxiliar.FieldByName('DATAULTMOV').AsDateTime;
       end;

      _dMTBem.sqlSaldoContabilBem.Prepare;
      _dMTBem.sqlSaldoContabilBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
      _dMTBem.sqlSaldoContabilBem.ParamByName('IDBEM').AsInteger     := iBem;
      _dMTBem.sqlSaldoContabilBem.ParamByName('DATASLD').AsDate      := dDataSld;
      _dMTBem.sqlSaldoContabilBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
      _dMTBem.sqlSaldoContabilBem.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
      _cds.Data := _dMTBem.sqlSaldoContabilBem.Data;
      //----------------------------------------------------------------------------------
      //cmDebugToFile(_dMTBem.sqlSaldoContabilBem.SqlChanged, 'C:\Planus\Temp\TESTEHELEN.txt') ;
      if not _cds.IsEmpty then
      begin
         nValOrg            := _cds.FieldByName('VALORG').AsFloat;
         nCMBem             := _cds.FieldByName('CMBEM').AsFloat;
         nDepLanc           := _cds.FieldByName('DEPLANC').AsFloat;
         nCMDep             := _cds.FieldByName('CMDEP').AsFloat;
         nReavValOrg        := _cds.FieldByName('REAVVALORG').AsFloat;
         nReavCMBem         := _cds.FieldByName('REAVCMBEM').AsFloat;
         nReavDepLanc       := _cds.FieldByName('REAVDEPLANC').AsFloat;
         nReavCMDep         := _cds.FieldByName('REAVCMDEP').AsFloat;
         nUltReavValOrg     := _cds.FieldByName('ULTREAVVALORG').AsFloat;
         nUltReavCMBem      := _cds.FieldByName('ULTREAVCMBEM').AsFloat;
         nUltReavDepLanc    := _cds.FieldByName('ULTREAVDEPLANC').AsFloat;
         nUltReavCMDep      := _cds.FieldByName('ULTREAVCMDEP').AsFloat;
         iGrupo             := _cds.FieldByName('IDGRUPO').AsInteger;
         iLocalizacao       := _cds.FieldByName('IDLOCALIZACAO').AsInteger;
         iResponsavel       := _cds.FieldByName('IDRESPONSAVEL').AsInteger;
         nDepLancAtu        := _cds.FieldByName('DEPLANCATU').AsFloat;
         nUltReavDepLancAtu := _cds.FieldByName('VALULTDEPREAVATU').AsFloat;
      end else
      begin
         nValOrg            := 0;
         nCMBem             := 0;
         nDepLanc           := 0;
         nCMDep             := 0;
         nReavValOrg        := 0;
         nReavCMBem         := 0;
         nReavDepLanc       := 0;
         nReavCMDep         := 0;
         nUltReavValOrg     := 0;
         nUltReavCMBem      := 0;
         nUltReavDepLanc    := 0;
         nUltReavCMDep      := 0;
         iGrupo             := 0;
         iLocalizacao       := 0;
         iResponsavel       := 0;
         nDepLancAtu        := 0;
         nUltReavDepLancAtu := 0;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
   //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
   FreeAndNil(_CdsAuxiliar);
end;

function TCtrlBem.SaldoContabilBem2(iEmpresaProp, iBem : Integer;
                                    dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer;
                                    Var nValOrg, nCmBem,
                                        nDepLanc, nCmDep,
                                        nReavValOrg, nReavCmBem,
                                        nReavDepLanc, nReavCmDep,
                                        nUltReavValOrg, nUltReavCmBem,
                                        nUltReavDepLanc, nUltReavCmDep,
                                        nDepLancAtu, nUltReavDepLancAtu, nValResidual: Extended;
                                    Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;
begin
   try

     nValResidual := 0;

     Result := SaldoContabilBem(iEmpresaProp, iBem, dDataSld, iMoeCodigo, iTaxaDep,
                                nValOrg, nCmBem, nDepLanc, nCmDep,
                                nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
                                nDepLancAtu, nUltReavDepLancAtu,
                                iGrupo, iLocalizacao, iResponsavel);

     if Result then
       nValResidual := _cds.FieldByName('VALORRES').AsFloat;

   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

function TCtrlBem.SaldoContabilA(iEmpresaProp, iBem : Integer;
                                 dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer;
                                 iReavaliacao : Integer = 0) : Extended;
begin
   try
      if iReavaliacao <= 0 then
      begin
         _dMTBem.sqlSaldoContabBemA.Prepare;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDBEM').AsInteger     := iBem;
         _dMTBem.sqlSaldoContabBemA.ParamByName('DATASLD').AsDate      := dDataSld;
         _dMTBem.sqlSaldoContabBemA.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
         _cds.Data := _dMTBem.sqlSaldoContabBemA.Data;
      end else
      begin
         _dMTBem.sqlSaldoContabReavalA.Prepare;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDPESSOA').AsInteger      := iEmpresaProp;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDBEM').AsInteger         := iBem;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('DATASLD').AsDate          := dDataSld;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('MOECODIGO').AsInteger     := iMoeCodigo;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDTAXADEP').AsInteger     := iTaxaDep;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDREAVALIACAO').AsInteger := iReavaliacao;
         _cds.Data := _dMTBem.sqlSaldoContabReavalA.Data;
      end;
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
         Result := _cds.FieldByName('VALORG').AsFloat  + _cds.FieldByName('CMBEM').AsFloat -
                   _cds.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('CMDEP').AsFloat
      else
         Result := 0;
      //----------------------------------------------------------------------------------
      MessageInfo := '';
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;
//========================================================================================
function TCtrlBem.ListaMovimentacao(iEmpresaProp, iBem : Integer;
                                    dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer) : OleVariant;
begin
   _dMTBem.sqlHistMovBem.Prepare;
   _dMTBem.sqlHistMovBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
   _dMTBem.sqlHistMovBem.ParamByName('IDBEM').AsInteger     := iBem;
   _dMTBem.sqlHistMovBem.ParamByName('DATAMOV').AsDate      := dDataSld;
   _dMTBem.sqlHistMovBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
   _dMTBem.sqlHistMovBem.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
   Result := _dMTBem.sqlHistMovBem.Data;
end;
//========================================================================================
function TCtrlBem.VerificaPeriodoCAF(nEmpresaProp, nBem : Extended;
                                     iFlgImovel : Integer;
                                     sTipoMov : String;
                                     dDataMov : TDateTime;
                                     var dDataUltMov, dDataUltDep : TDateTime;
                                     bPermiteMesmaData : boolean) : Boolean;
var
   iAno, iMes, iDia   : Word;
   dDataIni, dDataFim : TDateTime;
   sSql               : String;

begin
   dDataUltMov := 0;
   dDataUltDep := 0;
   //-------------------------------------------------------------------------------------
   // Data da Última Movimentação
   //-------------------------------------------------------------------------------------

//Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387  - INI
   sSql :=
' SELECT MAX(H.DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
' FROM   HISTORICOMOVIMENTACAO H ' + #13 +
' WHERE  (H.IDBEM    = ' + floattostr(nBem) + ') ' + #13 +' AND (H.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
'  AND H.IDTIPOMOVIMENTACAO NOT IN (200,201) ' + #13 +
'  AND H.IDTIPOMOVIMENTACAO > 0 ' + #13 +
'  AND H.IDMOVIMREFCIRCULAR IS NULL ' + #13 +
'  AND H.DATAMOVIMENTACAO < ' + #13 +
'       (SELECT H1.DATAMOVIMENTACAO ' + #13 +
'          FROM   HISTORICOMOVIMENTACAO  H1 ' + #13 +
'         WHERE H1.IDMOVIMENTACAO IN (SELECT HBD.IDMOVIMENTACAO ' + #13 +
'                                       FROM   HISTORICOMOVIMENTACAO HBD, HISTORICOMOVIMENTACAO H ' + #13 +
'                                      WHERE  (HBD.IDBEM    = ' + floattostr(nBem) + ') ' + #13 +' AND (HBD.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
'                                        AND (H.IDBEM    = ' + floattostr(nBem) + ') ' + #13 +' AND (H.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
'                                        AND  H.IDMOVIMREFCIRCULAR = HBD.IDMOVIMENTACAO)' + #13 +
'                                      GROUP BY H1.DATAMOVIMENTACAO)';

   _cds.Data := GetDataPacket(sSql);
   if ((_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime <= 0)) then
   begin
      sSql := ' SELECT MAX(H.DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
              ' FROM   HISTORICOMOVIMENTACAO H' + #13 +
              ' WHERE  (H.IDBEM    = ' + floattostr(nBem) + ') ' + #13 +
              '   AND  (H.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ';
      _cds.Data := GetDataPacket(sSql);
      if _cds.IsEmpty then
      begin
         Result := True;
         Exit;
      end;
   end;
   //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - FIM   

   dDataUltMov := _cds.FieldByName('DATAULTMOV').AsDateTime;
   //-------------------------------------------------------------------------------------
   // Data do Último Fechamento
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT MAX(PG.DATAULTFEC) AS DTAULTFECHAMENTO ' +
           ' FROM GRUPO G,' +
           '      PLANOGRUPO PG '+
           ' WHERE (G.FLGIMOVEL = ' + inttostr(iFlgImovel) + ')' +
           '   AND (PG.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
           '   AND (PG.IDGRUPO = G.IDGRUPO) ';
   _cds.Data := GetDataPacket(sSql);
   if (_cds.IsEmpty) or (_cds.FieldByName('DTAULTFECHAMENTO').IsNull) then
   begin
      Result := True;
      Exit;
   end;
   dDataUltDep := _cds.FieldByName('DTAULTFECHAMENTO').AsDateTime;
   //-------------------------------------------------------------------------------------
   // Verifica se a movimentação já ocorreu na data
   //-------------------------------------------------------------------------------------
   if not bPermiteMesmaData then
   begin
      sSql := ' SELECT DATAMOVIMENTACAO ' +
              ' FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE (IDBEM = ' + floattostr(nBem) + ')' +
              '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ')' +
              '   AND (IDTIPOMOVIMENTACAO IN ( ' + sTipoMov + ' ))' +
              '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('DD/MM/YYYY',dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))';
      _cds.Data := GetDataPacket(sSql);
      if not _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('Já existe esta movimentação na data. Consulte Histórico de Movimentações!');
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if dDataUltMov > (dDataMov + 1) then
   begin
      MessageInfo := CMTranslate('Existem movimentações com data posterior. Consulte Histórico de Movimentações!');
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   dDataIni := dDataUltDep + 1;
   DecodeDate(dDataIni,iAno,iMes,iDia);
   dDataFim := DiasUteis.UltDiaMes(iAno,iMes);
   if dDataMov > dDataFim then
   begin
      MessageInfo := CMTranslate('Período ainda não iniciado pelo Controle do Ativo Fixo!') + #13 +
                     CMTranslate('Impossível gerar lançamento de movimentação.') + #13 +
                     CMTranslate('Altere a data de movimentação.');
      Result := False;
   end else
   if (dDataMov < dDataIni) then
   begin
      MessageInfo := CMTranslate('Período já encerrado pelo Controle do Ativo Fixo!') + #13 +
                     CMTranslate('Impossível gerar lançamento de movimentação.') + #13 +
                     CMTranslate('Altere a data de movimentação.');
      Result := False;
   end else
      Result := True;
end;
//========================================================================================
// Função que executa a Troca do Número da Placa de Tombamento Patrimonial
//----------------------------------------------------------------------------------------
// nModulo      : id do Módulo que incluiu o bem                     (IDMODULO)
// nEmpresaProp : id da Empresa Proprietária                         (IDPESSOA)
// nBem         : id do Bem movimentado                              (IDBEM)
// nPlacaNova   : Número da Placa Nova                               (PLACA)
// dDataMov     : Data da Troca                                      (DATAMOVIMENTACAO)
//----------------------------------------------------------------------------------------
function TCtrlBem.ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem : Extended;
                                     nPlacaNova : Extended; dDataMov : TDateTime) : boolean;
var
   dDataUltMov, dDataUltDep : TDateTime;
   nSeqHist : Extended;
   iFlgPai : Integer;
   
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem,
                                                        nPlacaNova, dDataMov);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM no Bem que terá a Placa Substituída
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaBem(nEmpresaProp, nBem);
         if Fcds.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipula-lo'));
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem em Saída Temporária!');
            Raise Exception.Create(MessageInfo);
         end else
         if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se a placa nova não existe
         //-------------------------------------------------------------------------------
         if nPlacaNova <= 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o novo Número de TOMBAMENTO do bem!');
            Raise Exception.Create(MessageInfo);
         end else
         begin
            if not PlacaUnica(Fcds.FieldbyName('IDPESSOA').AsFloat,
                              floattostr(nPlacaNova)) then
            begin
               MessageInfo := CMTranslate('Novo Número da PLACA DE TOMBAMENTO já alocado a outro bem!');
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoCAF(nEmpresaProp, nBem,
                                   Fcds.FieldByName('FLGIMOVEL').AsInteger,
                                   '04', dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                  // IDBEM
                                                   nEmpresaProp,                          // IDPESSOA
                                                   nModulo,                               // IDMODULO
                                                   04,                                    // IDTIPOMOVIMENTACAO
                                                   dDataMov,                              // DATAMOVIMENTACAO
                                                   -1,                                    // IDREAVALACRESC
                                                   -1,                                    // DATAULTDEP
                                                   -1,                                    // IDGRUPANT
                                                   -1,                                    // IDCONJANT
                                                   -1,                                    // IDLOCALANT
                                                   -1,                                    // IDRESPANT
                                                   Fcds.FieldByName('PLACA').AsFloat,     // PLACAANT
                                                   -1,                                    // PLNCODIGO
                                                   '',                                    // OBSREAVAL
                                                   0,                                     // TIPDEPPRORATA
                                                   -1,                                    // IDTIPODESPESA
                                                   '',                                    // OBSACRESCIMO
                                                   -1,                                    // IDMOTIVOBAIXA
                                                   0,                                     // PROPBAIXA
                                                   0,                                     // VALVENDAOFI
                                                   '');                                   // OBSBAIXA
         if nSeqHist = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Altera a Tabela BEM
         //-------------------------------------------------------------------------------
         Fcds.Edit;
         Fcds.FieldByName('PLACA').AsFloat := nPlacaNova;
         if not ApplyCds(Fcds,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp, Fcds.FieldByName('IDCONJUNTO').AsFloat);
         FcdsBemxDep.Data := ListaBemxDep(nEmpresaProp, nBem);
         FcdsBemxMoeda.Data := ListaBemxMoeda(nEmpresaProp, nBem);
         while not FcdsBemxMoeda.EOF do
         begin
            iFlgPai := 1;
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
               begin
                  if not AtualizaSaldoContabBem(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                0, 0, 0, 0,
                                                0, 0, 0, 0,
                                                0, 0, 0, 0,
                                                Fcds.FieldByName('IDGRUPO').AsInteger,
                                                FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                                FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                                Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                                Fcds.FieldByName('UNIDNEGOC').AsInteger,
                                                0, iFlgPai) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa a Transferencia do Bem para Controle Total
//----------------------------------------------------------------------------------------
function TCtrlBem.ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                       dDataMov : TDateTime;
                                       nGrupo, nSubConta, nAtivProjeto : Extended;
                                       dDataInicioDep : TDateTime;
                                       nValHistorico : Extended;
                                       bFlgBemIntContab : Boolean;
                                       dDtaContab : TDateTime) : Boolean;
Var
   nSeqHist, nPlanilha      : Extended;
   dDataUltMov, dDataUltDep : TDateTime;
   bIntegraContab,
   bCtaxCCusto              : Boolean;
   iExercicio, iPeriodo,
   iFlgPai                  : Integer;
   sGrupo, sSql             : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario, nBem,
                                                          dDataMov, nGrupo, nSubConta, nAtivProjeto,
                                                          dDataInicioDep, nValHistorico,
                                                          bFlgBemIntContab, dDtaContab);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaBem(nEmpresaProp, nBem);
         if Fcds.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipula-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
         else
            if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem em Saída Temporária!');
            Raise Exception.Create(MessageInfo);
         end else
         if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('CONTROLE').AsString = 'T' then
            Raise Exception.Create(CMTranslate('O Bem já está em Controle Total!'));
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if dDataMov <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Data da Movimentação!'))
         else
            if dDataMov < Fcds.FieldByName('DTAINCLUSAO').AsDateTime then
               Raise Exception.Create(CMTranslate('A Data da Movimentação não pode ser Anterior a Data de Entrada do Bem no Ativo Fixo!'));
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoCAF(nEmpresaProp, nBem,
                                   Fcds.FieldByName('FLGIMOVEL').AsInteger,
                                   '01', dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if nGrupo <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Grupo Contábil do Bem!'));
         //-------------------------------------------------------------------------------
         if nValHistorico <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Valor Histórico de Aquisição do Bem!'));
         //-------------------------------------------------------------------------------
         if dDataInicioDep <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Data de Inicio da Depreciação do Bem!'))
         else
            if dDataInicioDep < Fcds.FieldByName('DTAINCLUSAO').AsDateTime then
               Raise Exception.Create(CMTranslate('A Data de Inicio da Depreciação não pode ser anterior a Data de Entrada do Bem no Ativo Fixo!'));
         //-------------------------------------------------------------------------------
         if bFlgBemIntContab and (dDtaContab <= 0) then
            Raise Exception.Create(CMTranslate('Informe a Data de Contabilização da Transferência para Controle Total!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         nPlanilha := -1;
         if bIntegraContab and bFlgBemIntContab then
         begin
            if not CAFxContab.VerificaPeriodoContabil(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                      dDtaContab, iExercicio, iPeriodo) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.InicializaMontaContab then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.MontaParamCAFxContab(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                   ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
            //----------------------------------------------------------------------------
            // Prepara o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CAFxContab.ContabilizaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                                 Fcds.FieldByName('IDPESSOA').AsInteger,
                                                 Fcds.FieldByName('IDBEM').AsInteger,
                                                 Trunc(nGrupo),
                                                 Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                                 Trunc(nAtivProjeto),
                                                 Trunc(nSubConta),
                                                 Fcds.FieldByName('PLACA').AsString,
                                                 Fcds.FieldByName('DESBEM').AsString, sGrupo,
                                                 dDtaContab, nValHistorico, 
                                                 iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(Fcds.FieldByName('IDMODULO').AsFloat,
                                                             Fcds.FieldByName('IDPESSOA').AsFloat,
                                                             nUsuario, DateToStr(dDtaContab));
            if nPlanilha < 0 then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Entrada do Bem
         //-------------------------------------------------------------------------------
         if not RegistraEntradaTotal(nEmpresaProp, nBem,
                                     nGrupo, nSubConta, nAtivProjeto,
                                     dDataInicioDep, nValHistorico,
                                     bFlgBemIntContab, dDtaContab) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove o lançamento com controle físico anterior
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                 ' WHERE (IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO ' +
                 '                           FROM HISTORICOMOVIMENTACAO ' +
                 '                           WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                 '                             AND (IDBEM    = ' + Floattostr(nBem) + ')))';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO '+
                 ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + Floattostr(nBem) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM SLDCTBBEMXDEP '+
                 ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + Floattostr(nBem) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM SALDOCONTABBEM '+
                 ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + Floattostr(nBem) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra na tabela HISTORICOMOVIMENTACAO
         //-------------------------------------------------------------------------------
         nSeqHist := HistMovBem.RegistraHistMovBem(Fcds.FieldByName('IDBEM').AsFloat,     // IDBEM
                                                   Fcds.FieldByName('IDPESSOA').AsFloat,  // IDPESSOA
                                                   Fcds.FieldByName('IDMODULO').AsFloat,  // IDMODULO
                                                   01,                                    // IDTIPOMOVIMENTACAO
                                                   dDataMov,                              // DATAMOVIMENTACAO
                                                   -1,                                    // IDREAVALACRESC
                                                   -1,                                    // DATAULTDEP
                                                   -1,                                    // IDGRUPANT
                                                   -1,                                    // IDCONJANT
                                                   -1,                                    // IDLOCALANT
                                                   -1,                                    // IDRESPANT
                                                   -1,                                    // PLACAANT
                                                   nPlanilha,                             // PLNCODIGO
                                                   '',                                    // OBSREAVAL
                                                   0,                                     // TIPDEPPRORATA
                                                   -1,                                    // IDTIPODESPESA
                                                   '',                                    // OBSACRESCIMO
                                                   -1,                                    // IDMOTIVOBAIXA
                                                   0,                                     // PROPBAIXA
                                                   0,                                     // VALVENDAOFI
                                                   '');                                   // OBSBAIXA
         if nSeqHist = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Atualiza o saldo contábil
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
               begin
                  if not AtualizaSaldoContabBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                Fcds.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                                0, 0, 0, 0,
                                                0, 0, 0, 0,
                                                Fcds.FieldByName('IDGRUPO').AsInteger,
                                                Fcds.FieldByName('IDLOCALIZACAO').AsInteger,
                                                Fcds.FieldByName('IDRESPONSAVEL').AsInteger,
                                                Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                                Fcds.FieldByName('UNIDNEGOC').AsInteger,
                                                0, iFlgPai) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlBem.RegistraEntradaTotal(nEmpresaProp, nBem,
                                       nGrupo, nSubConta, nAtivProjeto : Extended;
                                       dDataInicioDep : TDateTime; nValHistorico : Extended;
                                       bFlgBemIntContab : Boolean; dDtaContab : TDateTime) : Boolean;
type
   rBemxDep = Record
      IDBEMXDEP  : Integer;
      TAXADEP    : Extended;
   end;

var
   sSql             : String;
   aBemxDep         : Array of rBemxDep;
   iaBemxDep, iAux  : Integer;
   nValorMoeda      : Extended;

begin
   try
      //----------------------------------------------------------------------------------
      // Altera a tabela BEM
      //----------------------------------------------------------------------------------
      with _dMTBem.sqlRegistraBemTotal do
      begin
         Prepare;
         //-------------------------------------------------------------------------------
         ParamByName('IDBEM').AsFloat            := nBem;
         ParamByName('IDPESSOA').AsFloat         := nEmpresaProp;
         ParamByName('DATAINICIODEP').asDateTime := dDataInicioDep;
         ParamByName('VALHISTORICO').asFloat     := nValHistorico;
         ParamByName('IDGRUPO').AsFloat          := nGrupo;
         //-------------------------------------------------------------------------------
         if nSubConta > 0 then
            ParamByName('CODSUBCONTA').AsFloat := nSubConta
         else
            ParamByName('CODSUBCONTA').Clear;
         //-------------------------------------------------------------------------------
         if nAtivProjeto > 0 then
            ParamByName('UNIDNEGOC').AsFloat := nAtivProjeto
         else
            ParamByName('UNIDNEGOC').Clear;
         //-------------------------------------------------------------------------------
         if bFlgBemIntContab then
         begin
            ParamByName('FLGBEMINTCONTAB').AsInteger := 1;
            ParamByName('DTACONTAB').AsDateTime := dDtaContab;
         end else
         begin
            ParamByName('FLGBEMINTCONTAB').AsInteger := 0;
            ParamByName('DTACONTAB').Clear;
         end;
      end;
      //----------------------------------------------------------------------------------
      if not ExecSQL(_dMTBem.sqlRegistraBemTotal.SQLChanged, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Remove os BemxMoeda e BemxDep anteriores
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEMXDEP ' +
              ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + FloattoStr(nBem) + ')';
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      sSql := ' DELETE FROM BEMXMOEDA ' +
              ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + FloattoStr(nBem) + ')';
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra as BemxMoeda e BemxDep
      //----------------------------------------------------------------------------------
      // Carga das Multiplas Taxas com Grupo Selecionado
      //----------------------------------------------------------------------------------
      FcdsBemxDep.Data  := ListaBemxDep(0, 0);
      FcdsTaxasDep.Data := GrupoContab.ListaGrupoTaxaDep(Fcds.FieldByName('IDGRUPO').AsFloat, nEmpresaProp);
      while not FcdsTaxasDep.EOF do
      begin
         FcdsBemxDep.Append;
         FcdsBemxDep.FieldByName('IDPESSOA').AsFloat     := nEmpresaProp;
         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger  := cdsTaxasDep.FieldByName('IDTAXADEP').AsInteger;
         FcdsBemxDep.FieldByName('TAXADEP').AsFloat      := cdsTaxasDep.FieldByName('TAXADEP').AsFloat;
         FcdsBemxDep.FieldByName('DESCTAXADEP').AsString := cdsTaxasDep.FieldByName('DESCTAXADEP').AsString;
         // Helen - SOL: 142551 KTN: 911676
         FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime := cds.FieldByName('DATAINICIODEP').AsDateTime;
         FcdsBemxDep.Post;
         //-------------------------------------------------------------------------------
         FcdsTaxasDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra em array os dados relativos a BEMXDEP em Moeda Oficial, para serem
      // replicados nas moedas restantes.
      //----------------------------------------------------------------------------------
      iaBemxDep := 0;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  = ParamCAF.MOEDAOFICIAL then
         begin
            FcdsBemxDep.Edit;
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := dDataInicioDep;
            FcdsBemxDep.Post;
         end;
         SetLength(aBemxDep,iaBemxDep + 1);
         aBemxDep[iaBemxDep].IDBEMXDEP  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
         aBemxDep[iaBemxDep].TAXADEP    := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
         iaBemxDep := iaBemxDep + 1;
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza os lançamentos em BEMXMOEDA
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Data := ListaBemxMoeda(nEmpresaProp, 0);
      //----------------------------------------------------------------------------------
      // Registro do Valor em Moeda Oficial
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsFloat     := nEmpresaProp;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValHistorico;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
      FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataInicioDep;
      FcdsBemxMoeda.Post;
      //----------------------------------------------------------------------------------
      // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAFISCAL > 0 then
      begin
         nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAFISCAL,
                                       Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAFISCAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAFISCAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime  := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            // Helen - SOL: 142551 KTN: 911676
            FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIAL > 0 then
      begin
         nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIAL,
                                       Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            // Helen - SOL: 142551 KTN: 911676
            FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALB > 0 then
      begin
         nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIALB,
                                       Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //----------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //----------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            // Helen - SOL: 142551 KTN: 911676
            FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALC > 0 then
      begin
         nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIALC,
                                       Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
         FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         // Registra as taxas de depreciacao para esta moeda
         //-------------------------------------------------------------------------------
         iAux := 0;
         while iAux < iaBemxDep do
         begin
            FcdsBemxDep.Append;
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger := Fcds.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            // Helen - SOL: 142551 KTN: 911676
            FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
         _dbBemxMoeda.IDBEM.AsFloat := Fcds.FieldbyName('IDBEM').AsFloat;
         if not _dbBemxMoeda.Insert then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         CdsToDbObject(FcdsBemxDep,_dbBemxDep);
         _dbBemxDep.IDBEM.AsFloat := Fcds.FieldbyName('IDBEM').AsFloat;
         if not _dbBemxDep.Insert then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
function TCtrlBem.ExecutaAlteracaoBemManut : Boolean;
Var
   sSql : String;
   nSeqHist : Extended;
   iFlgPai : Integer;
   
begin
   try
      FcdsConjunto.Data := Conjunto.ListaConjunto(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                  Fcds.FieldByName('IDCONJUNTO').AsFloat);
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO ' +
                                 ' FROM HISTORICOMOVIMENTACAO ' +
                                 ' WHERE IDBEM = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) +
                                 '   AND IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) );
      while not _cds.EOF do
      begin
         if not ((_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 04) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12)) then
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, False) then  // MANUT
               Raise Exception.Create(MessageInfo + ' (VLRHISTMOVBEM)');
         end;
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Remove os Registros de Movimentacao Inicial do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (HISTORICOMOVIMENTACAO)');
      //----------------------------------------------------------------------------------
      // Remove os Registros de Saldos Contábeis do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (SLDCTBBEMXDEP)');

      sSql := ' DELETE FROM SALDOCONTABBEM ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (SALDOCONTABBEM)');
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEMXDEP ' +
              ' WHERE (IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) + ')' +
              '   AND (IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (BEMXDEP)');

      sSql := ' DELETE FROM BEMXMOEDA ' +
              ' WHERE (IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) + ')' +
              '   AND (IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (BEMXMOEDA)');
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
         _dbBemxMoeda.IDBEM.AsFloat := Fcds.FieldByName('IDBEM').AsFloat;
         if not _dbBemxMoeda.Insert then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         CdsToDbObject(FcdsBemxDep,_dbBemxDep);
         _dbBemxDep.IDBEM.AsFloat := Fcds.FieldByName('IDBEM').AsFloat;
         if not _dbBemxDep.Insert then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(Fcds.FieldByName('IDBEM').AsFloat,
                                                Fcds.FieldByName('IDPESSOA').AsFloat,
                                                Fcds.FieldByName('IDMODULO').AsFloat,
                                                03,
                                                Fcds.FieldByName('DTAINCLUSAO').AsDatetime,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                '',
                                                0,
                                                -1,
                                                '',
                                                -1,
                                                0,
                                                0,
                                                '');
      if nSeqHist = -1 then
         Raise Exception.Create(HistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 0,
                                                 FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
            begin
               if not AtualizaSaldoContabBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                             Fcds.FieldByName('IDBEM').AsInteger,
                                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                             FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, 0, 0, 0,
                                             Fcds.FieldByName('IDGRUPO').AsInteger,
                                             FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                             FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                             Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                             Fcds.FieldByName('UNIDNEGOCIO').AsInteger,
                                             0, iFlgPai) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
            end;
            FcdsBemxDep.Next;
         end;
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

function TCtrlBem.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

procedure TCtrlBem.SetcdsImovelxBem(const Value: TclientDataSet);
begin
  FcdsImovelxBem := Value;
end;

procedure TCtrlBem.SetcdsLancImovelxBem(const Value: TclientDataSet);
begin
  FcdsLancImovelxBem := Value;
end;

procedure TCtrlBem.SetcdsPlanoPatroxVigenciaBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxVigenciaBem := Value;
end;

function TCtrlBem.ListaPlanoPatroxVigenciaBem(nIDPessoa,
  nIdBem: Extended): OLEVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPLANOPATROXVIGENCIABEM,          ' + #13 +
          '       IDBEM,                             ' + #13 +
          '       DATAVIGENCIA,                      ' + #13 +
          '       IDPLANOPREV,                       ' + #13 +
          '       IDPESSOA,                          ' + #13 +
          '       IDPATRO,                           ' + #13 +
          '       PERCENTRATEIO                      ' + #13 +
          '  FROM PLANOPATROXVIGENCIABEM             ' + #13 +
          ' WHERE IDBEM =  ' + FloatToStr(nIdBem)      + #13 +
          '   AND IDPESSOA = ' + FloatToStr(nIDPessoa) + #13;
  Result := GetDataPacket(sSQL);
end;

// Thiago Melo SOL 204458 Kintana 1981316 Ini
procedure TCtrlBem.SetcdsHistBemxDep(const Value: TClientDataSet);
begin
  FcdsHistBemxDep := Value;
end;

function TCtrlBem.ListaItensHistBemxDep(nIdPessoa,
  nIdBem: Extended): OleVariant;
var
  sSql : String;
begin
   sSql := 'SELECT * FROM HISTBEMXDEP' + #13 +
           'WHERE (IDPESSOA = '+ floattostr(nIdPessoa) +')' + #13 +
           '  AND (IDBEM = ' + floattostr(nIdBem) + ')' + #13;
   Result := GetDataPacket(sSql);
end;
// Thiago Melo SOL 204458 Kintana 1981316 Fim

// Vando - SOL 154328-5901 / KTN 1373449
procedure TCtrlBem.SetidImovelHistorico(const Value: Integer);
begin
  FidImovelHistorico := Value;
end;
// Vando - SOL 154328-5901 / KTN 1373449 - fim

end.


