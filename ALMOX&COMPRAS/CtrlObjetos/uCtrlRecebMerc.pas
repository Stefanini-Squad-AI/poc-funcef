{*******************************************************************************
  Alterações:
********************************************************************************
 Rotina     : GetNomePlanoPrev
 Data       : 15.05.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 22244
 Descrição  : Não estamos conseguindo receber notas para produtos comprados
              sem cotação, quando tem processo RAD - descrição registrada no Pendência. O
              problema não era causado pelo RAD, foi uma coincidência.
---------------------------------------------------------------------------------
 Rotina     : BaixaSCI
 Data       : 24.04.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 22069
 Descrição  : corrige o problema que ocorria quando as unidades (solicitação/compras) eram
              distintas. Ex(solicitação (unidade CENTO.) Recebimento (unidade SACO));
---------------------------------------------------------------------------------
 Rotina     : ExcluiBaixaSCI
 Data       : 13.04.2006
 Autor      : Antonio Marcos Fernandes de Souza
 Pendências : 21902
 Descrição  : Corrige o erro da quantidade pendente que ocorria na deleção da nota.
--------------------------------------------------------------------------------
 Rotina     : ExcluiMoviment
 Data       : 03.04.2006
 Autor      : Antonio Marcos Fernandes de Souza
 Pendências : 21830
 Descrição  : Na exclusão do movimento (Tabela Moviment), só era considerada a entrada
             (tlEntradaCusto) e nunca a saída (tlSaida).
{---------------------------------------------------------------------------------
 Rotina     : MultiplasContasBaixa
 Data       : 02/12/2004
 Autor      : Alex Pereira
 Pendências : 20862
 Descrição  : O sistema estava gerando múltiplas contas de baixa, mesmo que o
              documento tivesse apenas uma conta de baixa.
---------------------------------------------------------------------------------
{---------------------------------------------------------------------------------
 Rotina     :  BaixaOC
 Data       : 27/07/2005
 Autor      : Rodolpho da SIlva
 Pendências : 19824
 Descrição  : Ao inserir um novo recebimento de mercadoria e receber apenas parte
              do produto NÃO deixando a quantidade restante pendente (Ex: Peço
              1000 items, recebo 600 e os outros 400 é descartado), o sistema não
              está descartando a quantidade restante.
---------------------------------------------------------------------------------
{---------------------------------------------------------------------------------
 Rotina     :
 Data       : 06/07/2005
 Autor      : André Tavares
 Pendências : 18169
 Descrição  : Fazer os lançamentos de partidaDobrada quando o parânmetro da contabilidade
              (obriga partidadobrada estiver ligado).
---------------------------------------------------------------------------------
 Rotina     : Alterar
 Data       : 08/04/2005
 Autor      : Rodolpho da Silva
 Pendências : 18210
 Descrição  : Não permitir que o numero da OC seja incrementado no momento da alteração.
---------------------------------------------------------------------------------
 Rotina     : InsereCdsContab, ProcessaNota, FazIntegraCAP e FazIntegraContab
 Data       : 02/12/04
 Autor      : Bruno Bastos
 Pendências : 18113
 Descrição  : Passar a utilizar os campos IdPlanoPrev, IdPatro na contabilização
              do recebimento de mercadoria. No rateio do documento, além desses
              campos utilizar o campo idprograma.
---------------------------------------------------------------------------------
 Rotina     : FazIntegraCAP
 Data       : 27/07/2004
 Autor      : andre tavares
 Pendências : 17168
 Descrição  : solução do problema na comparação de uma variável do tipo float que
              estava causando a inserção uma linha com valor zerado na rateiodocum.
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
 Rotina     : FazIntegraCAP
 Data       : 22/06/04 (término)
 Autor      : David Ayrolla
 Pendências : 17057
 Descrição  : Resolver vários problemas no preenchimento do Compromisso
              Orçamentário.
---------------------------------------------------------------------------------

--------------------------------------------------------------------------------
 Rotina    : ProcessaItemNota
 Data      : 19/05/2004
 Autor     : André Pontes
 Pendência : 16818 e 16819
 Descrição : Corrigida a passagem dos valores _dbItemNota.VLRESTOQUE.AsFloat e _dbItemNota.QTDERECEBDEVOL.AsFloat.
             Os valores abaixo estavam sendo passados já multiplicados por (-1)
             Dentro da GeraMovimento, há um if que verifica se é saída e novamente multiplica por (-1).
             Retirada a multiplicação por (-1).
--------------------------------------------------------------------------------

 Rotinas   : ProcessaNota
 Data      : 26/03/2004
 Autor     : David Ayrolla
 Descrição : Correção de problema nos lançamentos sem impostos agregados.
--------------------------------------------------------------------------------
 Rotina    : ProcessaItemNota
 Data      : 22/03/2004
 Autor     : Marchetti
 Pendência : 16180
 Descrição : Não estava sendo passado o almoxarifado, por isso a query nao retornava
             itens a serem baixados na SCI e a quantidade pendente ficava igual a
             quantidade pedida
--------------------------------------------------------------------------------
 Rotina    : FazIntegraCAP
 Data      : 28/02/2004
 Autor     : David Ayrolla
 Pendência : 15713
 Descrição : Correção de erro na inclusão dos campos NUMLEITCODBARRAS,
             NUMDIGCODBARRAS e IDCBANCARIA.
--------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 27/02/2004 (término)
 Autor     : David Ayrolla
 Pendência : 15868
 Descrição : Lançamento de documentos com múltiplas contas de baixa e segregados
--------------------------------------------------------------------------------}

unit uCtrlRecebMerc;

interface

Uses DB, uCmControlObject, dbclient,uCmDbObject, DAlmoxarifado,
     sysUtils,uSistema, udbNota, udbItemNota, udbAgregItemNota,jclMath,uCMMath,
     udbAgregNota,Dialogs,uCMTypes, uMidasUtil,uCtrlLancamento,uCtrlUnMedida,
     uCtrlDocumento, uCtrlMovEstoque,  uCtrlOrdemCompra, uCtrlImpostoRetido,
     uCtrlListCAPCAR,uCtrlIntegracaoContabil, Classes, uCtrlArtigo,uCMSQLParams,
     uListaCamposHistAlmox, uCtrlModeloHistorico,JclStrings,Mask, uCtrlOrcamento,
     uCtrlAlmoxCAF, uModulo,
     uCMClientDataset, uCtrlSegregacao, uCtrlParamIntegra;



Const
   MAX_DIFERENCA = 0.02;

   MSG_FORN_NAO_PREENCH            = ' Fornecedor não preenchido.';
   MSG_NUMNOTA_NAO_PREENCH         = ' Número da nota não preenchido.';
   MSG_NAO_HA_ITEMNOTA             = ' Não há nehum item preenchido.';
   MSG_DATAEMISS_NAO_PREENCH       = ' Data de emissão não preenchida.';
   MSG_ALMOXDESTINO_NAO_PREENCH    = ' Almoxarifado destino não preenchida.';
   MSG_CENTRESPON_NAO_PREENCH      = ' Centro de Responsabilidade  não preenchida.';
   MSG_CENTCUSTDESTINO_NAO_PREENCH = ' Centro de Custo destino não preenchida.';
   MSG_UNIDNEGOC_NAO_PREENCH       = ' Atividade/Projeto não preenchida.';
   MSG_DATAENTRADA_NAO_PREENCH     = ' Data de entrada não preenchida.';
   MSG_DATAENTRADA_MENOR           = ' Data de entrada não pode ser menor que a data de emissão. ';
   MSG_DATAVENCTO_NAO_PREENCH      = ' Data de vencimento não pode estar em branco. ';
   MSG_DATAVENCTO_MENOR            = ' Data de vencimento não pode ser menor que a data de entrada .';
   MSG_NOTA_JA_LANCADA             = ' Nota Fiscal já Lançada pra este Fornecedor. Verifique.';
   MSG_CODFISCAL_INVALIDO          = ' Código fiscal inválido. ';
   MSG_DATAVALIDADE_INVALIDO       = ' Data validade inválida. ';
   MSG_ARTIGO_SEM_SALDO            = ' Excede a quantidade disponível em estoque.';
   MSG_NAO_CONFERE_VALTOT          = ' o total não Confere. Verifique.';

Type

  TObjContabil = record
                   sTipoLanc: char;   // 0, 1 e 2
                   iUnidNegoc,iSubContaD,iSubContaC,
                   iPlanPrev, iPatro, iPlnCodigo, iPlanilha: integer;
                   sDataLanc,sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5,
                   sCCustD,sContaD,sCCustC,sContaC,sHistorico,
                   scodHistPadrao, sOrigApl, sUneCodigo, sPlnCodigoExt: string;
                   dValLanc : Extended;
                   iIdSegregaCriter: integer;
                   dDataSegregaCriter: TDateTime;
                 end;

   { Estrutura que conterá a divisão do valor da nota por critério de segregação.}
   TSegregacao = record
     IdSegregaCriter: integer  ;
     IdPlanoPrev    : integer  ;
     IdPatro        : integer  ;
     Total          : extended ;
     Percentual     : extended ;
   end;

   TCtrlRecebMerc = class(TCmControlObject)
   Protected
     Procedure AfterInitialize; Override;
     Procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
   private
    plnCodigo        : Double;
    OldTransaction   : Boolean;

    { Array que conterá a divisão do valor da nota por critério de segregação.}
    aSegregacao : array of TSegregacao;






    _iNumSlip        : Double;

    _dbNota          : TdbNota;
    _dbItemNota      : TdbItemNota;
    _dbAgregItemNota : TdbAgregItemNota;
    _dbAgregNota     : TdbAgregNota;

    _DtmAlmox           : TDtmAlmoxarifado;
    _Lancamento         : TCtrlLancamento;
    _Documento          : TCtrlDocumento;
    _MovEstoque         : TCtrlMovEstoque;
    _ListCAPCAR         : TCtrlListCAPCAR;
    _IntegracaoContabil : TCtrlIntegracaoContabil;
    _OC                 : TCtrlOrdemCompra;
    _ImpostoRetido      : TCtrlImpostoRetido;
    _UnMedida           : TCtrlUnMedida;
    _Artigo             : TCtrlArtigo;
    _ModeloHist         : TCtrlModeloHistorico;
    _Orcamento          : TOrcamentoBackMT;
    _AlmoxCAF           : TCtrlAlmoxCAF;

    _Segregacao         : TCtrlSegregacao;

    FcdsItemNota: TClientDataSet;
    FcdsNota: TClientDataSet;
    FCdsContab: TClientDataSet;
    FcdsAgregNotaTela: TClientDataSet;
    FcdsAgregItemTela: TClientDataSet;
    FCdsCAP: TClientDataSet;
    FCdsNFCompl: TClientDataSet;
    FCdsAgregNFCompl: TClientDataSet;
    FCdsValTotAgreg: TClientDataSet;
    FIdNFRecebDevol: Double;
    FCdsAtivoFixo: TClientDataSet;


    { Função que indicará se o lançamento do documento atual se dará por múltiplas
      contas de baixa. O parâmetro "receive" trará o último critério verificado.}
    function MultiplasContasBaixa( var IdSegregaCriter : integer ) : boolean;

    procedure SetcdsItemNota(const Value: TClientDataSet);
    procedure SetcdsNota(const Value: TClientDataSet);
    procedure SetCdsContab(const Value: TClientDataSet);
    procedure SetcdsAgregItemTela(const Value: TClientDataSet);
    procedure SetcdsAgregNotaTela(const Value: TClientDataSet);
    procedure SetCdsCAP(const Value: TClientDataSet);
    procedure SetCdsNFCompl(const Value: TClientDataSet);
    procedure SetCdsAgregNFCompl(const Value: TClientDataSet);
    procedure SetCdsValTotAgreg(const Value: TClientDataSet);

    {**
      Gera os lancamento do almoxarifado no sistema de contabilidade
    **}
    Function  FazIntegraContab ( IdPessoa          : Integer;
                                 UsaPlanoPrev      : Boolean;
                                 IdModulo          : Double;
                                 IdUsuario         : Double;
                                 IdPatro           : Double;
                                 IdPlanoPrev       : Double ) : Double ;
    {**
       Gera a OC automática caso o Recebimento seja sem OC
    **}
    Function GeraOCAuto(IdNFRecebDevol, IdUsuario : Double) : Boolean;
    {**
       Caso o Recebimento seja com OC baixa a qantidade pendente
    **}
    Function BaixaOC(Quantidade: Double; FlgAtendida : String ) : Boolean;
    {**
       Baixa a qantidade pendente e o saldo a Comprar da Solicitação de Compra
    **}
    Function BaixaSCI( IdPessoa          : Integer;
                       IdItensRecDev     : Double;
                       CodAlmoxarifado   : Integer;
                       CodArtigo         : String;
                       UnidNegoc         : Integer;
                       CodCentroRespon   : String;
                       IdProdVari        : Integer;
                       ERecebimentoComOC : Boolean ) : Boolean;
    {**
       Atualiza o Valor de Última Compra do Produto
    **}
    Function AtualizaValUltCompra(CodArtigo : String; Valor : Double ) : Boolean;
    {**
       Validas os Dados da nota Fiscal
    **}
    Function ValidaDadosNota( IntegraCAP : Boolean ) : Boolean;
    {**
       Validas os Dados da Item
    **}
    Function ValidaDadosItem(IntegraLivro : Boolean) : Boolean;
    {**
       Verifica se o CodFiscal existem
    **}
    Function TestaCodFiscal( CodFiscal : String ) : Boolean;
    {**
       Faz a Integração com o Sistema de Contas a Pagar
    **}
    Function FazIntegraCAP(IdPessoa        : Integer;
                           IdUsuario       : Double;
                           IdEspAcesso     : Double;
                           IdPatro         : Double;
                           IdPlanoPrev     : Double;
                           IdPrograma      : Double;
                           IdPlnCodigo     : Double;
                           rAbateValor     : Double;
                           rTotImp         : Double;
                           rTotRefCalculo  : Double;
                           bEnglobaParcela : Boolean;
                           bUsaPlanoPatro  : Boolean;
                           IntegraContab   : Boolean) : Double;

    {**
       Processa todos os calculos da nota fiscal
    **}
    Function ProcessaNota(IdPessoa           : Double;
                          iUnidNegocPadrao   : Double;
                          var rAbateValor    : Double;
                          var rTotImp        : Double;
                          var rTotRefCalculo : Double;
                          IntegraContab      : Boolean;
                          IntegraLivro       : Boolean;
                          sCCustoPadrao      : String;
                          { Parâmetros necessários à segregação e múltiplas contas de baixa.}
                          iIdPatro,
                          iIdPlanoPrev       : Double ) : Boolean;
    {**
       Verifica se o Item da nota sofreu baixa direta
    **}
    Function FezBaixaDireta( IdMov : Double ) : Boolean;
    {**
       Pega a quantidade da Nota de Devolução caso tenha tido
    **}
    Function PegaQtdeDevol( IdNFRecebDevol : Double;
                            CodArtigo      : String;
                            IdProdVari     : Double ) : Double;
    {**
       Exclui a baixa da SCI
    **}
    Function ExcluiBaixaSCI( IdItensRecDev     : Double;
                             CodArtigo         : String;
                             IdProdVari        : Integer;
                             ERecebimentoComOC : Boolean ) : Boolean;
    {**
       Exclui a avaliação do fornecedor relativa ao determinado recebimento
       de mercadoria
    **}
    Function ExcluiAvaliacaoForn ( IdNFRecebDevol : Double ) : boolean;
    {**
       Extorna as movimentações referentes a entradas das mercadorias
    **}
    Function ExcluiMoviment( IdMov : Double; DataValidade : TDateTime ) : Boolean;
    {**
       Insere os dados no CDSCONTAB para posterior gravação na contabilidade.
    **}
    Function InsereCdsContab(iPlano, UnidNegoc, CodSubConta : Double;sDebCre,sConta,sCentroCusto,sHistorico : String; Valor : Double;
                             { Parâmetros necessários à segregação e múltiplas contas de baixa.}
                             iIdSegregaCriter : double; iIdPlanoPrev, iIdPatro : Integer) : Boolean;
    {**
       Efetua as gravações dos detalhes e processamento ligado ao
       item da Nota
    **}

    Function ProcessaItemNota( IdItensRecDev,IdUsuario : Double; bERecebimentoComOC: boolean): Boolean;

    {**
       Efetua a gravação da nota complementar
    **}
    Function GravaNotaCompl( IdPessoa        : Double;
                             IntegraCAP      : Boolean;
                             IdUsuario       : Double;
                             IdEspAcesso     : Double;
                             IdPatro         : Double;
                             IdPlanoPrev     : Double;
                             IdPrograma      : Double;
                             IdPlnCodigo     : Double;
                             rAbateValor     : Double;
                             rTotImp         : Double;
                             rTotRefCalculo  : Double;
                             bEnglobaParcela : Boolean;
                             bUsaPlanoPatro  : Boolean;
                             IntegraContab   : Boolean ): Boolean;
    procedure SetCdsAtivoFixo(const Value: TClientDataSet);

   Public
      Property  cdsNota             : TClientDataSet read FcdsNota write SetcdsNota;
      Property  cdsItemNota         : TClientDataSet read FcdsItemNota write SetcdsItemNota;
      Property  CdsContab           : TClientDataSet read FCdsContab write SetCdsContab;
      Property  cdsAgregItemTela    : TClientDataSet read FcdsAgregItemTela write SetcdsAgregItemTela;
      Property  cdsAgregNotaTela    : TClientDataSet read FcdsAgregNotaTela write SetcdsAgregNotaTela;
      Property  CdsCAP              : TClientDataSet read FCdsCAP write SetCdsCAP;
      Property  CdsNFCompl          : TClientDataSet read FCdsNFCompl write SetCdsNFCompl;
      Property  CdsAgregNFCompl     : TClientDataSet read FCdsAgregNFCompl write SetCdsAgregNFCompl;
      Property  CdsValTotAgreg      : TClientDataSet read FCdsValTotAgreg write SetCdsValTotAgreg;
      Property  IdNFRecebDevol      : Double read FIdNFRecebDevol;
      Property  CdsAtivoFixo        : TClientDataSet read FCdsAtivoFixo write SetCdsAtivoFixo;
      // Métodos
      Constructor Create;  Override;
      Destructor  Destroy; Override;
      {**
         Lista os dados da tabela TIPOAGRE
      **}
      Function ListaImposto(IdPessoa : Double;
                            CodCustAgreg : Double) : OleVariant;

      { Obtém o artigo na tabela ITEMOC para verificar se há
        pendências para o artigo ou não. Esta solução, é indepen-
        dente de plano previdenciário }
      function ObtemArtigoNaOC(IdItemOc: double): OleVariant;

      {**
         Efetua a gravação do recebimento de mercadoria
      **}
      Function Gravar ( IdPessoa          : Integer;
                        UsaPlanoPrev      : Boolean;
                        IntegraCAP        : Boolean;
                        IntegraContab     : Boolean;
                        IntegraLivro      : Boolean;
                        IdModulo          : Double;
                        IdUsuario         : Double;
                        IdEspAcesso       : Double;
                        IdPatro           : Double;
                        IdPlanoPrev       : Double;
                        IdPrograma        : Double;
                        iUnidNegocPadrao  : Double;
                        ERecebimentoComOC : Boolean;
                        EnglobaParcela    : Boolean;
                        sCCustoPadrao     : String) : Boolean;
      {**
         Efetua a exclusão do recebimento de mercadoria
      **}
      Function Excluir( IdNFRecebDevol : Double;
                        IdEspAcesso    : Double;
                        IdUsuario      : Double;
                        UsaPlanoPatro  : Boolean) : Boolean;
      {**
         Efetua a gravação do recebimento de mercadoria
      **}
      Function Alterar( IdPessoa          : Integer;
                        IdNFRecebDevol    : Double;
                        UsaPlanoPrev      : Boolean;
                        IntegraCAP        : Boolean;
                        IntegraContab     : Boolean;
                        IntegraLivro      : Boolean;
                        IdModulo          : Double;
                        IdUsuario         : Double;
                        IdEspAcesso       : Double;
                        IdPatro           : Double;
                        IdPlanoPrev       : Double;
                        IdPrograma        : Double;
                        iUnidNegocPadrao  : Double;
                        ERecebimentoComOC : Boolean;
                        EnglobaParcela    : Boolean;
                        sCCustoPadrao     : String) : Boolean;
      {**
         Restorna os dados do Cabeçalho da nota
      **}
      Function Procurar ( IdNFRecebDevol : Double ) : OleVariant;
      {**
         Restorna os dados dos Itens da nota
      **}
      Function GetItem ( IdNFRecebDevol : Double ) : OleVariant;
      {**
        Lista a contabilização da Nota
      **}
      Function  ListContabilizacao( PlnCodigo : Double ): OleVariant;
      {**
         Lista os dados da integração com Contas a Pagar
      **}
      Function  ListDadosCAP( CodDocumento : Double ): OleVariant;
      {**
         Pega os dados da Nota Complementar
      **}
      Function GetNotaComplementar( IdNFReferencia : Double ) : OleVariant;
      {**
        Lista os impostos que são conferidos no final da Nota
      **}
      Function ListChecaValorTotal : OleVariant;
      {**
         Pega os Impostos do  da Nota
      **}
      Function GetAgregNota( IdNFRecebDevol : Double ) : OleVariant;
      {**
         Pega os Impostos da item Nota mais os existentes
      **}
      Function GetAgregItem( IdNFRecebDevol : Double ) : OleVariant;
      {**
         Pega os Impostos que efetivamente foram gravados noS itens da Nota
      **}
      Function GetAgregItemForItem( IdNFRecebDevol : Double ) : OleVariant;
      {**
        Lista os impostos da Nota Complementar
      **}
      Function ListAgregNFComplementar( IdNFRecebDevol : Double) : OleVariant;
      {**
         Verifica se o fornecedor é do mesmo estado do que a empresa própria
         1 = mesmos estado
         2 = estado diferente
      **}
      Function MontaClassFiscal(IdPessoa  : Double;
                                IdForCli  : Double  ) : String;

      function GetNomePlanoPrev(iIdPlanoPrev: integer): string;
   End;




implementation




uses uCmCustomCdbObject;

{ TCtrlRecebMerc }




procedure TCtrlRecebMerc.AfterInitialize;
begin
  inherited;
  _Lancamento.InitializeAs(self);
  _Documento.InitializeAs(self);
  _MovEstoque.InitializeAs(self);
  _ListCAPCAR.InitializeAs(self);
  _IntegracaoContabil.InitializeAs(self);

  _OC.InitializeAs(self);
  _OC.OpenTransaction := False;

  _ImpostoRetido.InitializeAs(self);
  _Artigo.InitializeAs(Self);
  _UnMedida.InitializeAs(Self);
  _ModeloHist.InitializeAs(Self);
  _Orcamento.InitializeAs(Self);
  _AlmoxCAF.InitializeAs(Self);


  _Segregacao.InitializeAs(Self);
  _Segregacao.GetParams( Sistema.IdEmpresa );
end;




constructor TCtrlRecebMerc.Create;
begin
  inherited;
  _dbNota          := TdbNota.Create(Self);
  _dbItemNota      := TdbItemNota.Create(Self);
  _dbAgregItemNota := TdbAgregItemNota.Create(Self);
  _dbAgregNota     := TdbAgregNota.Create(Self);

  _DtmAlmox        := TDtmAlmoxarifado.Create(nil);

  _Lancamento         := TCtrlLancamento.Create;
  _Documento          := TCtrlDocumento.Create;
  _MovEstoque         := TCtrlMovEstoque.Create;
  _OC                 := TCtrlOrdemCompra.Create;
  _ImpostoRetido      := TCtrlImpostoRetido.Create;
  _ListCAPCAR         := TCtrlListCAPCAR.Create;
  _IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  _Artigo             := TCtrlArtigo.Create;
  _UnMedida           := TCtrlUnMedida.Create;
  _ModeloHist         := TCtrlModeloHistorico.Create;
  _Orcamento          := TOrcamentoBackMT.Create;
  _AlmoxCAF           := TCtrlAlmoxCAF.Create;


  _Segregacao         := TCtrlSegregacao.Create;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
end;




Destructor TCtrlRecebMerc.Destroy;
begin
  If IsAppServer Then
     FreeCds([FcdsNota, FcdsItemNota,FcdsContab,FcdsAgregItemTela,
              FcdsAgregNotaTela, FCdsCAP, FCdsNFCompl, FCdsAgregNFCompl,
              FCdsValTotAgreg ]);


  _dbNota.Free;
  _dbItemNota.Free;
  _dbAgregItemNota.Free;
  _dbAgregNota.Free;

  _DtmAlmox.Free;

  _Lancamento.Free;
  _Documento.Free;
  _MovEstoque.Free;
  _ListCAPCAR.Free;
  _IntegracaoContabil.Free;

  _OC.Free;
  _ImpostoRetido.Free;
  _Artigo.Free;
  _UnMedida.Free;
  _ModeloHist.Free;
  _Orcamento.Free;
  _AlmoxCAF.Free;

  _Segregacao.Free;

  inherited;
end;




procedure TCtrlRecebMerc.DoChangeDataBase;
begin
  inherited;
  _dbNota.DataBaseName          := DataBaseName;
  _dbItemNota.DataBaseName      := DataBaseName;
  _dbAgregItemNota.DataBaseName := DataBaseName;
  _dbAgregNota.DataBaseName     := DataBaseName;
end;




function TCtrlRecebMerc.Excluir( IdNFRecebDevol, IdEspAcesso, IdUsuario : Double;
UsaPlanoPatro : Boolean ) : Boolean;
Var
   SQL         : String;
   CdsPrinc    : TClientDataSet;
   CdsDet      : TClientDataSet;
   rSaldo      : Double;
   slDocumento : TStrings;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.ExcluirRecebMerc( IdNFRecebDevol,IdEspAcesso, Idusuario, UsaPlanoPatro );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         CdsPrinc    := TClientDataSet.Create(Nil);
         CdsDet      := TClientDataSet.Create(Nil);
         slDocumento := TStringList.Create;
         Try
            Try
               StartTransaction;

               SQL := ' SELECT IDPESSOA,IDNFRECEBDEVOL,FLGTIPONOTA,PLNCODIGO,CODDOCUMENTO, IDNFLIVRO FROM NFRECEBDEVOL '+
                      ' WHERE (IDNFREFERENCIA = '+FloatToStr(IdNFRecebDevol) +') '+
                      ' ORDER BY IDNFRECEBDEVOL DESC ';

               CdsPrinc.Data := GetDataPacket( SQL );

               CdsDet.Data := GetItem( IdNFRecebDevol );
               CdsDet.First;
               While Not CdsDet.Eof Do
                  Begin
                     If CdsDet.FieldByName('FLGDESTINO').AsString <> 'A' Then
                        Begin
                           If Not FezBaixaDireta(CdsDet.FieldByName('IDMOV').AsFloat) Then
                              Begin
                                 rSaldo:= _MovEstoque.InfoSaldo(CdsPrinc.FieldByName('IDPESSOA').AsInteger,
                                                                CdsDet.FieldByName('CODARTIGO').AsString,
                                                                CdsDet.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                CdsDet.FieldByName('DATAENTDEVOL').AsDateTime) -
                                          _UnMedida.QtdeToUnCustoMedio(CdsDet.FieldByName('CODARTIGO').AsString,
                                                                       CdsDet.FieldByName('CODMEDIDA').AsString,
                                                                       CdsDet.FieldByName('QTDERECEBDEVOL').AsFloat) +
                                           PegaQtdeDevol(IdNFRecebDevol,CdsDet.FieldByName('CODARTIGO').AsString,CdsDet.FieldByName('IDPRODVARI').AsInteger);

                                 If rSaldo < 0 Then
                                    Raise Exception.Create(CdsDet.FieldByName('DESCPROD').AsString + MSG_ARTIGO_SEM_SALDO );

                              End;
                        End;
                     CdsDet.Next;
                  End;
               //--------------------------------------------------------------------------------------------
               // Delete os itens de todas as notas referentes a de entrada
               //--------------------------------------------------------------------------------------------
               CdsPrinc.First;
               While Not CdsPrinc.Eof Do
                  Begin
                     SQL := ' SELECT * FROM ITENSRECEBDEVOL '+
                            ' WHERE (IDNFRECEBDEVOL = '+CdsPrinc.FieldByName('IDNFRECEBDEVOL').AsString+')';
                     CdsDet.Data := GetDataPacket( SQL );

                     CdsDet.First;
                     While Not CdsDet.Eof Do
                        Begin
                           If CdsPrinc.FieldByName('FLGTIPONOTA').AsString = 'R' Then
                              Begin
                                 SQL := ' SELECT FLGCOMSEMOC FROM OC '+
                                        ' WHERE (NUMOC = '+CdsDet.FieldByName('NUMOC').AsString+')';

                                 _Cds.Data := GetDataPacket( SQL );
                                 //---------------------------------------------------------------------------------
                                 // Retorna as quantidades para pendentes de entrega para Recebimento COM OC
                                 //---------------------------------------------------------------------------------
                                 If _Cds.FieldByName('FLGCOMSEMOC').AsString <> 'S' Then
                                    Begin
                                       SQL := ' UPDATE ITEMOC SET QTDERECEBIDA = QTDERECEBIDA - '+FloatToStrCM(CdsDet.FieldByName('QTDERECEBDEVOL').AsFloat) +', FLGITEMATENDIDO = ''F'' '+
                                              ' WHERE (IDITEMOC = '+CdsDet.FieldByName('IDITEMOC').AsString+')';

                                       If Not ExecSQL(SQL) Then
                                          Raise Exception.Create( MessageInfo );

                                    End
                                 Else // Sem OC
                                    BEgin
                                       If Not _OC.CancelaOC( CdsPrinc.fieldByName('IDPESSOA').AsFloat,
                                                             CdsDet.FieldByName('NUMOC').AsFloat, False)
                                       Then
                                          Raise Exception.Create( _OC.MessageInfo );
                                    End;

                                 //---------------------------------------------------------------------------------
                                 // Deleta a Baixa da SC
                                 //---------------------------------------------------------------------------------
                                 If Not ExcluiBaixaSCI( CdsDet.FieldByName('IDITENSRECDEV').Asfloat,
                                                        CdsDet.FieldByName('CODARTIGO').AsString,
                                                        CdsDet.FieldByName('IDPRODVARI').AsInteger,
                                                        _Cds.FieldByName('FLGCOMSEMOC').AsString = 'S')
                                 Then
                                    Raise Exception.Create( MessageInfo );
                              End;
                           //-----------------------------------------------------------------------------------------------------
                           // Deleta Impostos dos Itens
                           //-----------------------------------------------------------------------------------------------------
                            SQL := ' DELETE FROM AGRITENSRECDEV WHERE (IDITENSRECDEV = '+CdsDet.FieldByName('IDITENSRECDEV').AsString+')';
                            If Not ExecSQL(SQL) Then
                               Raise Exception.Create( MessageInfo );

                           //-----------------------------------------------------------------------------------------------------
                           // Exclusão dos itens de ATIVO FIXO
                           //-----------------------------------------------------------------------------------------------------
                           If Not _AlmoxCAF.EstornaEntradaBensPendentes(CdsPrinc.fieldByName('IDPESSOA').AsFloat,sistema.idusuario,CdsDet.FieldByName('IDITENSRECDEV').Asfloat) Then
                              Raise Exception.Create( _AlmoxCAF.MessageInfo );


                           //-----------------------------------------------------------------------------------------------------
                           // Deleta os Itens
                           //-----------------------------------------------------------------------------------------------------
                            SQL := ' DELETE FROM ITENSRECEBDEVOL WHERE (IDITENSRECDEV = '+CdsDet.FieldByName('IDITENSRECDEV').AsString+')';
                            If Not ExecSQL(SQL,True) Then
                               Raise Exception.Create( MessageInfo );

                           //-----------------------------------------------------------------------------------------------------
                           // Deleta Movimento dos Itens
                           //-----------------------------------------------------------------------------------------------------
                            if (CdsDet.FieldByName('FLGDESTINO').AsString = 'E') Or (CdsDet.FieldByName('FLGDESTINO').AsString = 'C') then
                                Begin
                                   If Not ExcluiMoviment(CdsDet.FieldByName('IDMOV').AsFloat,CdsDet.FieldByName('DATAVALIDADE').AsDateTime) Then
                                      Raise Exception.Create( MessageInfo );
                                End;

                           //-----------------------------------------------------------------------------------------------------
                           // Deleta Orcamento
                           //-----------------------------------------------------------------------------------------------------
                           If Not CdsDet.FieldByName('IDRESERVAORCAMEN').IsNull Then
                              Begin
                                 _Orcamento.IdEmpresa := CdsPrinc.fieldByName('IDPESSOA').AsInteger;
                                 _Orcamento.IdUsuario := Trunc(IdUsuario);
                                 If _Orcamento.EstornaCompromisso(_Orcamento.BuscaIdNumReserva(CdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger,0,False),
                                    CdsDet.FieldByName('VLRESTOQUE').AsFloat,True) <> 0
                                 Then
                                    Raise Exception.Create( _Orcamento.MessageInfo );
                              End;
                           CdsDet.Next;
                        End;
                     //-----------------------------------------------------------------------------------------------------
                     // Deleta Impostos da Nota
                     //-----------------------------------------------------------------------------------------------------
                     SQL := ' DELETE FROM AGRNFRECDEV WHERE (IDNFRECEBDEVOL = '+ CdsPrinc.FieldByName('IDNFRECEBDEVOL').AsString+ ')';
                     If Not ExecSQL( SQL ) Then
                        Raise Exception.Create( MessageInfo );

                     //-----------------------------------------------------------------------------------------------------
                     // Delete Notas Complementares
                     //-----------------------------------------------------------------------------------------------------
                     If CdsPrinc.FieldByName('IDNFRECEBDEVOL').AsFloat <> IdNFRecebDevol Then
                        Begin
                           SQL := ' DELETE FROM NFRECEBDEVOL WHERE ( IDNFRECEBDEVOL = '+CdsPrinc.FieldByName('IDNFRECEBDEVOL').AsString+')';
                           If Not ExecSQL( SQL ) Then
                              Raise Exception.Create( MessageInfo );
                        End;

                     CdsPrinc.Next;
                  End;
               //-----------------------------------------------------------------------------------------------------
               // Deleta a Avaliação do Fornecedor
               //-----------------------------------------------------------------------------------------------------
                IF Not ExcluiAvaliacaoForn( IdNFRecebDevol ) Then
                   Raise Exception.Create( MessageInfo );

               //-----------------------------------------------------------------------------------------------------
               // Deleta a Nota Principal
               //-----------------------------------------------------------------------------------------------------
                SQL := ' DELETE FROM NFRECEBDEVOL WHERE (IDNFRECEBDEVOL = '+FloatToStr( IdNFRecebDevol )+')';
                IF Not ExecSQL( SQL, True ) Then
                   Raise Exception.Create( MessageInfo );

               CdsPrinc.First;
               While Not CdsPrinc.Eof Do
                  Begin
                     //-----------------------------------------------------------------------------------------------------
                     // Deleta a Integração com o Livro Fiscal
                     //-----------------------------------------------------------------------------------------------------
                     If CdsPrinc.FieldByName('IDNFLIVRO').AsInteger <> 0 then
                        Begin
                           SQL := ' DELETE FROM NFLIVRODETALHE WHERE (IDNFLIVRO = '+CdsPrinc.FieldByName('IDNFLIVRO').AsString+')';
                           If Not ExecSQL( SQL ) Then
                              Raise Exception.Create( MessageInfo );
                           //
                           SQL :=' DELETE FROM NFLIVRO WHERE (IDNFLIVRO = '+CdsPrinc.FieldByName('IDNFLIVRO').AsString+')';
                           If Not ExecSQL( SQL ) Then
                              Raise Exception.Create( MessageInfo );
                        End;

                     //-------------------------------------------------------------------------------------------------
                     // Exclui a Integração com o Contas a Pagar
                     //-------------------------------------------------------------------------------------------------
                     If Not CdsPrinc.FieldByName('CODDOCUMENTO').IsNull Then
                        Begin
                           //-------------------------------------------------------------------------------------------
                           // Verifica se o Documento já foi excluido
                           //-------------------------------------------------------------------------------------------
                           If slDocumento.IndexOf( CdsPrinc.FieldByName('CODDOCUMENTO').AsString ) < 0 Then
                              Begin
                                 _Documento.Prepare( OpDocumento, odlEfetivo );

                                 _Documento.CodDocumento  := CdsPrinc.FieldByName('CODDOCUMENTO').AsFloat;
                                 _Documento.IdEspAcesso   := IdEspAcesso;
                                 _Documento.IdUsuario     := IdUsuario;
                                 _Documento.IdModulo      := Sistema.IdModulo;
                                 _Documento.UsaPlanoPatro := UsaPlanoPatro;
                                 If Not _Documento.Delete(False) Then
                                    Raise Exception.Create( _Documento.MessageInfo );

                                 slDocumento.Add(CdsPrinc.FieldByName('CODDOCUMENTO').AsString);
                              end;
                        End;

                     CdsPrinc.Next;
                  End;

               //-----------------------------------------------------------------------------------------------------
               // Deleta a Integração com a Contabilidade
               //-----------------------------------------------------------------------------------------------------
               If Not CdsPrinc.FieldByName('PLNCODIGO').IsNull Then
                  Begin
                     SQL :=' UPDATE MOVIMENT SET PLNCODIGO = NULL WHERE (PLNCODIGO = '+CdsPrinc.FieldByName('PLNCODIGO').AsString+')';
                     If Not ExecSQL( SQL ) Then
                        Raise Exception.Create( MessageInfo );

                     If Not _Lancamento.ExcluiLancaContab(IdUsuario,
                                                          CdsPrinc.FieldByName('PLNCODIGO').AsFloat,
                                                          Sistema.IdModulo,0,UsaPlanoPatro,True)
                     Then
                        Raise Exception.Create( _Lancamento.MessageInfo );
                  End;


               Commit;
            except
               On E:Exception Do
                Begin
                   Rollback;
                   Result := False;
                   MessageInfo := E.Message;
                End;
            End;
         Finally
            CdsPrinc.Free;
            CdsDet.Free;
            slDocumento.Free;
         End;
      End;
end;




function TCtrlRecebMerc.GeraOCAuto( IdNFRecebDevol, IdUsuario : Double): Boolean;
Var
  cdsItem           : TClientDataSet;
  cdsOC             : TClientDataSet;
  cdsItemOC         : TClientDataSet;
  cdsAgregItemOC    : TClientDataSet;
  cdsPrazoPgtoOC    : TClientDataSet;
  cdsPrazoEntregaOC : TClientDataSet;
  cdsSCItemOC       : TClientDataSet;
  CdsForn           : TClientDataSet;
  CdsAgregProd      : TClientDataSet;
  iPrazo            : Integer;
  SQL               : String;
  rBase             : Double;
  rPerc             : Double;
  rValorImp         : Double;
begin
   Result := True;

   CdsItem       := TClientDataSet.Create(nil);
   cdsItem.Data  := FCdsItemNota.Data;

   CdsForn           := TClientDataSet.Create(nil);
   CdsAgregProd      := TClientDataSet.Create(nil);
   CdsOC             := TClientDataSet.Create(nil);
   CdsItemOC         := TClientDataSet.Create(nil);
   cdsAgregItemOC    := TClientDataSet.Create(nil);
   CdsPrazoPgtoOC    := TClientDataSet.Create(nil);
   CdsPrazoEntregaOC := TClientDataSet.Create(nil);
   CdsSCItemOC       := TClientDataSet.Create(nil);

   //------------------------------------------------------------------------
   // Inicializa os cds´s da OC
   //------------------------------------------------------------------------
   cdsOC.Data             := _OC.ListOC(-1);
   cdsItemOC.Data         := _OC.GetItemOC(Sistema.IdEmpresa, -1);
   cdsAgregItemOC.Data    := _OC.GetAgregItemOC(-1);
   cdsPrazoPgtoOC.Data    := _OC.GetPrazoPgtoOC(-1);
   cdsPrazoEntregaOC.Data := _OC.GetPrazoEntregaOC(-1);
   cdsSCItemOC.Data       := _OC.GetSCItemOC(-1);

   Try
      Try
         CdsItem.Data := FcdsItemNota.Data;

         cdsItem.First;
         While Not cdsItem.Eof Do
            Begin
               If cdsOC.IsEmpty  Then
                  Begin
                     cdsOC.Append;
                     cdsOC.FieldByName('NUMOC').AsFloat         := GetNextID;
                     cdsOC.FieldByName('IDFORCLI').AsFloat      := FcdsNota.FieldByName('IDFORCLI').AsFloat;
                     cdsOC.FieldByName('IDPESSOA').AsFloat      := FcdsNota.FieldByName('IDPESSOA').AsFloat;
                     cdsOC.FieldByName('OCATENDIDA').AsString   := 'T';
                     cdsOC.FieldByName('FLGIMPRESSA').AsString  := 'T';
                     cdsOC.FieldByName('FLGCOMSEMOC').AsString  := 'S';
                     cdsOC.FieldByName('FLGCOMSEMCOT').AsString := 'S';
                     cdsOC.FieldByName('DATAOC').AsDateTime     := FcdsNota.FieldByName('DATAENTDEVOL').AsDateTime + 3;//***;
                     cdsOC.Post;
                  End;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Itens
              //--------------------------------------------------------------------------------------------------------------------
              cdsItemOC.Append;
              cdsItemOC.FieldByName('NUMOC').AsFloat             := cdsOC.FieldByName('NUMOC').AsFloat;
              cdsItemOC.FieldByName('IDITEMOC').AsFloat          := GetSequence('ITEMOC');
              cdsItemOC.FieldByName('CODARTIGO').AsString        := CdsItem.FieldByName('CODARTIGO').AsString;
              cdsItemOC.FieldByName('CODGRUPOPROD').AsString     := CdsItem.FieldByName('CODGRUPOPROD').AsString;
              cdsItemOC.FieldByName('CODMEDIDA').AsString        := CdsItem.FieldByName('CODMEDIDA').AsString;
              cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat        := CdsItem.FieldByName('QTDERECEBDEVOL').AsFloat;

              If (CdsItem.FieldByName('IDPRODVARI').IsNull) Or (CdsItem.FieldByName('IDPRODVARI').AsInteger <= 0) Then
                 cdsItemOC.FieldByName('IDPRODVARI').Clear
              Else
                 cdsItemOC.FieldByName('IDPRODVARI').AsInteger := CdsItem.FieldByName('IDPRODVARI').AsInteger;

              cdsItemOC.FieldByName('VALORUN').AsString          := CdsItem.FieldByName('VLRUNITARIO').AsString;
              cdsItemOC.FieldByName('FLGITEMATENDIDO').AsString  := 'T';

              cdsItemOC.Post;

              iPrazo := Trunc(FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime - FCdsNota.FieldByName('DATAEMISNF').AsDateTime);
              If iPrazo <= 0 Then iPrazo := 1;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Prazos de Pagamento e Entrega
              //--------------------------------------------------------------------------------------------------------------------
               cdsPrazoEntregaOC.Append;
               cdsPrazoEntregaOC.FieldByName('IDITEMOC').AsFloat         := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
               cdsPrazoEntregaOC.FieldByName('PARCELAENTREGA').AsInteger := 1;
               cdsPrazoEntregaOC.FieldByName('PRAZOENTREGA').AsInteger   := iPrazo;
               cdsPrazoEntregaOC.FieldByName('QTDEENTREGA').AsFloat      := CdsItem.FieldByName('QTDERECEBDEVOL').AsFloat;
               cdsPrazoEntregaOC.FieldByName('PERIODOPRAZO').AsString    := 'D';
               cdsPrazoEntregaOC.FieldByName('DATAENTREGA').AsDateTime   := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
               cdsPrazoEntregaOC.Post;
               //
               cdsPrazoPgtoOC.Append;
               cdsPrazoPgtoOC.FieldByName('IDITEMOC').AsFloat       := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
               cdsPrazoPgtoOC.FieldByName('PARCELAPGTO').AsInteger  := 1;
               cdsPrazoPgtoOC.FieldByName('PRAZOPGTO').AsInteger    := iPrazo;
               cdsPrazoPgtoOC.FieldByName('PERIODOPRAZO').AsString  := 'D';
               cdsPrazoPgtoOC.FieldByName('PERCPAGTO').AsFloat      := 100;
               cdsPrazoPgtoOC.FieldByName('DATAPAGTO').AsDateTime   := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
               cdsPrazoPgtoOC.Post;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Impostos
              //--------------------------------------------------------------------------------------------------------------------
               If Not cdsItemOC.FieldByName('CODTIPRECDES').IsNull Then
                  Begin
                     _ImpostoRetido.DataProgramada    := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime + iPrazo;
                     _ImpostoRetido.OperacaoDocumento := '2 ';
                     _ImpostoRetido.IdForCli          := FCdsNota.FieldByName('IDFORCLI').AsInteger;
                     _ImpostoRetido.CodDocumento      := 0;
                     _ImpostoRetido.NumLancto         := 0;
                     _ImpostoRetido.ValorLancto       := CdsItem.FieldByName('QTDERECEBDEVOL').AsFloat * CdsItem.FieldByName('VLRUNITARIO').AsFloat;
                     _ImpostoRetido.ValorLiquido      := _ImpostoRetido.ValorLancto;
                     _ImpostoRetido.DataLancto        := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
                     _ImpostoRetido.DataEmissao       := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
                     _ImpostoRetido.DebCre            := 'C';
                     _ImpostoRetido.CodTipRecDes      := cdsItemOC.FieldByName('CODTIPRECDES').AsString;
                     _ImpostoRetido.MomentoLancamento := mlLancamento;
                     _ImpostoRetido.CodTipoDoc        := 0;
                     _ImpostoRetido.IntegraContab     := False;
                     _ImpostoRetido.IdModulo          := Sistema.IdModulo;
                     _ImpostoRetido.IdUsuario         := Trunc(IdUsuario);
                     _ImpostoRetido.Incluir;
                     //
                     If Not _ImpostoRetido.CdsSimulacao.IsEmpty Then
                        Begin
                           _ImpostoRetido.CdsSimulacao.First;
                           While Not _ImpostoRetido.CdsSimulacao.EOF Do
                              Begin
                                 cdsAgregItemOC.Append;
                                 cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat           := cdsItemOC.FieldByName('IDITEMOC').asFloat;
                                 cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsInteger := _ImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger;
                                 cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat           := _ImpostoRetido.CdsSimulacao.FieldByName('PERCIMPOSTO').AsFloat;
                                 cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat        := _ImpostoRetido.CdsSimulacao.FieldByName('VALORBASE').AsFloat;
                                 cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat       := _ImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                                 cdsAgregItemOC.Post;

                                 _ImpostoRetido.CdsSimulacao.Next;
                              End;
                        End;
                  End;

               SQL := ' SELECT ES.CODESTADO, ES.IDPAIS '+
                      ' FROM  PESSOA P, ENDPESS E, CIDADES CI, ESTADO  ES '+
                      ' WHERE (P.IDPESSOA     = '+FcdsNota.FieldByName('IDPESSOA').AsString+') '+
                      '   AND (E.IDPESSOA(+)  = P.IDPESSOA) '+
                      '   AND (E.IDENDERECO(+)= P.IDENDCOMERCIAL) '+
                      '   AND (E.IDCIDADES    = CI.IDCIDADES(+)) '+
                      '   AND (ES.IDESTADO(+) = CI.IDESTADO) ';

               CdsForn.Data := GetDataPacket( SQL );

               SQL := ' SELECT CODTIPOCUSTAGREG '+
                      ' FROM IMPOSTOSXPRODUTOS  '+
                      ' WHERE  (RTRIM(CODPRODUTO) = '+QuotedStr(Trim(Copy(CdsItem.FieldByName('CODARTIGO').AsString,1,6)))+' )'+
                      '    AND (IDPESSOA   = '+FcdsNota.FieldByName('IDPESSOA').AsString+') ';

               CdsAgregProd.Data := GetDataPacket( SQL );
               CdsAgregProd.First;
               While Not CdsAgregProd.Eof Do
                  Begin
                     SQL := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                            ' FROM IMPOSTOSXPRODUTOS '+
                            ' WHERE '+
                            '      (RTRIM(CODPRODUTO) = '+QuotedStr(Trim(Copy(CdsItem.FieldByName('CODARTIGO').AsString,1,6)))+' )'+
                            '  AND (CODTIPOCUSTAGREG = '+ CdsAgregProd.FieldByName('CODTIPOCUSTAGREG').AsString +') '+
                            '  AND (CODESTADO  = '+QuotedStr(CdsForn.FieldByName('CODESTADO').AsString )+') '+
                            '  AND (IDPAIS     = '+CdsForn.FieldByName('IDPAIS').AsString +') ';

                     _Cds.Data := GetDataPacket( SQL );

                     If Not _Cds.IsEmpty Then
                        Begin
                           rBase := _Cds.FieldByName('PERCBASEIMP').asFloat;
                           rPerc := _Cds.FieldByName('PERCIMPOSTO').asFloat;
                           //
                           rBase     := (CdsItem.FieldByName('QTDERECEBDEVOL').AsFloat * CdsItem.FieldByName('VLRUNITARIO').AsFloat) *(rBase/100);
                           rValorImp := rBase*(rPerc/100);
                        End
                     Else
                        Begin
                           rBase     := 0;
                           rPerc     := 0;
                           rValorImp := 0;
                        End;
                     cdsAgregItemOC.Append;
                     cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat           := cdsItemOC.FieldByName('IDITEMOC').asFloat;
                     cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsInteger := CdsAgregProd.FieldByName('CODTIPOCUSTAGREG').AsInteger;
                     cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat           := rPerc;
                     cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat        := rBase;
                     cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat       := rValorImp;
                     cdsAgregItemOC.Post;

                     CdsAgregProd.Next;
                  End;
               CdsItem.Next;
            End;

         // A CtrlOC já cria os ClientDataSets se for aplicação servidora.
         // Sem assim, quando as propriedades eram ponteradas para os Cds privados da
         // função, no final da execução da mesma esses perdiam os ponteiros causando
         // a 'falha catastrófica' no Destroy da control;
         if IsAppServer then
         begin
           _OC.cdsOC.Data             := cdsOC.Data;
           _OC.cdsItemOC.Data         := cdsItemOC.Data;
           _OC.cdsAgregItemOC.Data    := cdsAgregItemOC.Data;
           _OC.cdsPrazoEntregaOC.Data := cdsPrazoEntregaOC.Data;
           _OC.cdsPrazoPgtoOC.Data    := cdsPrazoPgtoOC.Data;
           _OC.cdsSCItemOC.Data       := cdsSCItemOC.Data;
         end
         else
         begin
           _OC.cdsOC             := cdsOC;
           _OC.cdsItemOC         := cdsItemOC;
           _OC.cdsAgregItemOC    := cdsAgregItemOC;
           _OC.cdsPrazoEntregaOC := cdsPrazoEntregaOC;
           _OC.cdsPrazoPgtoOC    := cdsPrazoPgtoOC;
           _OC.cdsSCItemOC       := cdsSCItemOC;
         end;

         IF Not _OC.Gravar( IdUsuario ) Then
            Raise Exception.Create( _OC.MessageInfo );

         SQL := ' UPDATE ITENSRECEBDEVOL SET NUMOC = '+FloatToStr( _OC.NumOC ) +
                ' WHERE (IDNFRECEBDEVOL = '+FloatToStr( FIdNFRecebDevol ) +')';
         IF Not ExecSQL(SQL,True) Then
            Raise Exception.Create( MessageInfo );

      Except
         On E:Exception Do
            Begin
               Result := False;
               MessageInfo := E.Message;
            End;
      End;
   Finally
      cdsItem.Free;
      cdsOC.Free;
      cdsItemOC.Free;
      cdsAgregItemOC.Free;
      cdsPrazoPgtoOC.Free;
      cdsPrazoEntregaOC.Free;
      cdsSCItemOC.Free;
      CdsForn.Free;
      CdsAgregProd.Free;
   End;
end;




function TCtrlRecebMerc.GetItem(IdNFRecebDevol: Double): OleVariant;
begin
  with _DtmAlmox Do
    Begin
       splistItemRecMerc.Prepare;
       splistItemRecMerc.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

       Result := spListItemRecMerc.Data;
    End;
end;




function TCtrlRecebMerc.Gravar ( IdPessoa : Integer; UsaPlanoPrev,IntegraCAP,IntegraContab, IntegraLivro : Boolean;
IdModulo,IdUsuario,IdEspAcesso,IdPatro, IdPlanoPrev, IdPrograma,iUnidNegocPadrao : Double; ERecebimentoComOC, EnglobaParcela : Boolean;
sCCustoPadrao : String ) : Boolean;

var CodDocumento   : Double;
    rAbateValor    : Double;
    rTotImp        : Double;
    rTotRefCalculo : Double;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GravarRecebMerc( FIdNFRecebDevol,
                                                         IdPessoa, UsaPlanoPrev,IntegraCAP,IntegraContab, IntegraLivro,
                                                         IdUsuario,IdEspAcesso,IdPatro, IdPlanoPrev, IdPrograma,iUnidNegocPadrao,
                                                         ERecebimentoComOC, EnglobaParcela,sCCustoPadrao,
                                                         FcdsNota.Data,
                                                         FcdsItemNota.Data,
                                                         FcdsAgregItemTela.Data,
                                                         FcdsAgregNotaTela.Data,
                                                         FCdsCAP.Data,
                                                         FCdsNFCompl.Data,
                                                         FCdsContab.Data,
                                                         FCdsAgregNFCompl.Data,
                                                         FCdsValTotAgreg.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            //-------------------------------------------------------------------------------------------------------------------
            // Faz a Validaçoes da informações inserida na nota
            //-------------------------------------------------------------------------------------------------------------------
            If Not ValidaDadosNota( IntegraCAP ) Then
               Raise Exception.Create( MessageInfo );


            _OC.bRecebimentoComOC := ERecebimentoComOC;
            _OC.iIdModulo         := IdModulo;



            //-------------------------------------------------------------------------------------------------------------------
            // Faz todo o processamento de valor referente a nota
            //-------------------------------------------------------------------------------------------------------------------
            if not ProcessaNota(IdPessoa,iUnidNegocPadrao,rAbateValor,rTotImp,rTotRefCalculo,IntegraContab,IntegraLivro,sCCustoPadrao,
             { Parâmetros necessários à segregação e múltiplas contas de baixa.}
             IdPatro, IdPlanoPrev ) Then
               Raise Exception.Create( MessageInfo );

            //-------------------------------------------------------------------------------------------------------------------
            // Faz a Integração Contabil
            //-------------------------------------------------------------------------------------------------------------------
            PlnCodigo := 0;
            if ((IntegraContab) And (FcdsNota.FieldByName('VLRNOTAFISCAL').AsFloat > 0 )) then
               Begin
                  PlnCodigo := FazIntegraContab(IdPessoa, USaPlanoPrev, IdModulo,IdUsuario,IdPatro,IdPlanoPrev );
                  If PlnCodigo <= 0  Then
                     Raise Exception.Create( MessageInfo );
               end;

            //-------------------------------------------------------------------------------------------------------------------
            // Integração com o Contas a Pagar
            //-------------------------------------------------------------------------------------------------------------------
            CodDocumento := 0;
            if IntegraCAP then
               Begin
                  CodDocumento := FazIntegraCAP(IdPessoa,IdUsuario,IdEspAcesso,IdPatro,IdPlanoPrev, IdPrograma,
                                                PlnCodigo,rAbateValor,rTotImp,rTotRefCalculo,EnglobaParcela,USaPlanoPrev,IntegraContab);
                  If CodDocumento <= 0  Then
                     Raise Exception.Create( MessageInfo );
               end;

            //-------------------------------------------------------------------------------------------------------------------
            // Grava a Nota
            //-------------------------------------------------------------------------------------------------------------------
            FcdsNota.Edit;
            FcdsNota.FieldByName('PLNCODIGO').AsFloat    := plnCodigo;
            FcdsNota.FieldByName('CODDOCUMENTO').AsFloat := CodDocumento;
            FcdsNota.Post;

            CdsToDbObject(FcdsNota,_dbNota);
            If Not _dbNota.Insert Then
              Raise Exception.Create( _dbNota.MessageInfo );

            FIdNFRecebDevol := _dbNota.IDNFRECEBDEVOL.AsFloat;

            //-------------------------------------------------------------------------------------------------------------------
            // Grava efetivamente os Impostos do Item
            //-------------------------------------------------------------------------------------------------------------------
            FcdsItemNota.First;
            While Not FcdsItemNota.Eof Do
               Begin
                  CdsToDbObject(FcdsItemNota,_dbItemNota);
                  _dbItemNota.IDNFRECEBDEVOL.AsFloat := _dbNota.IDNFRECEBDEVOL.AsFloat;

                  //Caso não tenha integração com Livro não Gravar
                  IF Not IntegraLivro Then
                     _dbItemNota.CODFISCAL.Clear;

                  If Not _dbItemNota.Insert Then
                     Raise Exception.Create( _dbItemNota.MessageInfo );

                  //If Not ProcessaItemNota( _dbItemNota.IDITENSRECDEV.AsFloat,IdUsuario) Then
                  If Not ProcessaItemNota( _dbItemNota.IDITENSRECDEV.AsFloat,IdUsuario, ERecebimentoComOC ) Then

                     Raise Exception.Create( MessageInfo );

                  FcdsItemNota.Next;
               End;



            //-------------------------------------------------------------------------------------------------------------------
            // Caso Recebimento sem OC, gera OC automaticamente
            //-------------------------------------------------------------------------------------------------------------------
            FcdsItemNota.First;
            If FCdsItemNota.FieldByName('NUMOC').IsNull Then
               If Not GeraOCAuto( FIdNFRecebDevol, IdUsuario ) Then
                  Raise Exception.Create( MessageInfo );



            //-------------------------------------------------------------------------------------------------------------------
            // Grava efetivamente os Impostos do Item
            //-------------------------------------------------------------------------------------------------------------------
            FcdsAgregItemTela.First;
            While Not FcdsAgregItemTela.Eof Do
               Begin
                   If FcdsAgregItemTela.FieldByName('VALOR').AsFloat <> 0 Then
                      Begin
                         _dbAgregItemNota.IDITENSRECDEV.AsFloat     := FcdsAgregItemTela.FieldByName('IDITENSRECDEV').AsFloat;
                         _dbAgregItemNota.ICODTIPOCUSTAGREG.AsFloat := FcdsAgregItemTela.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                         _dbAgregItemNota.IALIQUOTA.AsFloat         := FcdsAgregItemTela.FieldByName('PERCENT').AsFloat;
                         _dbAgregItemNota.IBASECALCULO.AsFloat      := FcdsAgregItemTela.FieldByName('BASE').AsFloat;
                         _dbAgregItemNota.IVLRAGREGADO.AsFloat      := FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
                         _dbAgregItemNota.IVLRRECUPERADO.AsFloat    := FcdsAgregItemTela.FieldByName('VLRRECUPERADO').AsFloat;

                         If Not _dbAgregItemNota.Insert Then
                            Raise Exception.Create( _dbAgregItemNota.MessageInfo );
                      End;

                   FcdsAgregItemTela.Next;
               End;

            //-------------------------------------------------------------------------------------------------------------------
            // Grava efetivcamente os Impostos da Nota
            //-------------------------------------------------------------------------------------------------------------------
            FcdsAgregNotaTela.First;
            While Not FcdsAgregNotaTela.Eof Do
               Begin
                   If FcdsAgregNotaTela.FieldByName('VALOR').AsFloat <> 0 Then
                      Begin
                         _dbAgregNota.IDNFRECEBDEVOL.AsFloat    := _dbNota.IDNFRECEBDEVOL.AsFloat;
                         _dbAgregNota.CODTIPOCUSTAGREG.AsFloat  := FcdsAgregNotaTela.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                         _dbAgregNota.ALIQUOTA.AsFloat          := FcdsAgregNotaTela.FieldByName('PERCENT').AsFloat;
                         _dbAgregNota.BASECALCULO.AsFloat       := FcdsAgregNotaTela.FieldByName('BASE').AsFloat;
                         _dbAgregNota.VLRAGREGADO.AsFloat       := FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
                         _dbAgregNota.VLRRECUPERADO.AsFloat     := FcdsAgregNotaTela.FieldByName('VLRRECUPERADO').AsFloat;

                         If Not _dbAgregNota.Insert Then
                            Raise Exception.Create( _dbAgregNota.MessageInfo );
                      End;

                   FcdsAgregNotaTela.Next;
               End;
           //-------------------------------------------------------------------------------------------------------------------
            // Grava Nota Complementar
            //-------------------------------------------------------------------------------------------------------------------
            IF Not GravaNotaCompl(IdPessoa,IntegraCAP,IdUsuario,IdEspAcesso,IdPatro,IdPlanoPrev, IdPrograma,
                                  PlnCodigo,rAbateValor,rTotImp,rTotRefCalculo,EnglobaParcela,USaPlanoPrev,IntegraContab)
            Then
               Raise Exception.Create( MessageInfo );

            //-------------------------------------------------------------------------------------------------------------------
            // Grava Ativo Fixo
            //-------------------------------------------------------------------------------------------------------------------
            IF (FCdsAtivoFixo <> nil) And (Not FCdsAtivoFixo.IsEmpty) Then
               Begin
                  _AlmoxCAF.cdsBensPendentes := FCdsAtivoFixo;
                  If Not _AlmoxCAF.ExecutaEntradaBensPendentes Then
                     Raise Exception.Create( _AlmoxCAF.MessageInfo );
               End;

            Commit;

         Except
            On E:Exception Do
             Begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
             End;
         End;
      End;
end;




function TCtrlRecebMerc.FazIntegraContab( IdPessoa : Integer; UsaPlanoPrev : Boolean;
IdModulo,IdUsuario,IdPatro, IdPlanoPrev : Double ) : Double;
Var
   rPlnCodigo : Double;
   regContab : TObjContabil;
   iContaLanc : integer;
   procedure LimpaRegContab(var reg: TObjContabil);
   begin
     iContaLanc := 0;
     regContab.sTipoLanc := ' ';
     regContab.iUnidNegoc := 0;
     regContab.iSubContaD := 0;
     regContab.iSubContaC := 0;
     regContab.iPlanPrev  := 0;
     regContab.iPatro     := 0;
     regContab.iPlnCodigo := 0;
     regContab.iPlanilha  := 0;
     regContab.sDataLanc  := '';
     regContab.sNumDoc    := '';
     regContab.sHist1     := '';
     regContab.sHist2     := '';
     regContab.sHist3     := '';
     regContab.sHist4     := '';
     regContab.sHist5     := '';
     regContab.sCCustD    := '';
     regContab.sContaD    := '';
     regContab.sCCustC    := '';
     regContab.sContaC    := '';
     regContab.sHistorico := '';
     regContab.scodHistPadrao := '';
     regContab.sOrigApl   := '';
     regContab.sUneCodigo := '';
     regContab.sPlnCodigoExt := '';
     regContab.dValLanc      := 0;
     regContab.iIdSegregaCriter := 0;
     regContab.dDataSegregaCriter := date;
   end;
begin
   Result     := -1;
   rPlnCodigo := 0;
   Try
      FCdsContab.First;
      While Not FCdsContab.Eof Do
         Begin
            regContab.iPlanPrev  := FCdsContab.FieldByName('IDPLANOPREV').AsInteger;
            regContab.iPatro     := FCdsContab.FieldByName('IDPATRO').AsInteger;
            regContab.iPlnCodigo := trunc(rPlnCodigo);
            regContab.iPlanilha  := 0;
            regContab.sDataLanc  := FormatDateTime('dd/mm/yyyy',FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime);
            regContab.sNumDoc    := FCdsContab.FieldByName('LACNUMDOC').AsString;
            regContab.sHist1     := FCdsContab.FieldByName('HISTORICO').AsString;
            regContab.sHist2     := '';
            regContab.sHist3     := '';
            regContab.sHist4     := '';
            regContab.sHist5     := '';
            regContab.sHistorico := FCdsContab.FieldByName('HISTORICO').AsString;
            regContab.scodHistPadrao := '';
            regContab.sOrigApl   := '';
            regContab.sUneCodigo := '';
            regContab.sPlnCodigoExt := '';
            regContab.dValLanc      := FCdsContab.FieldByName('LACVALOR').AsFloat;
            regContab.iIdSegregaCriter := FCdsContab.FieldByName('IDSEGREGACRITER').AsInteger;
            regContab.dDataSegregaCriter := FCdsNota.FieldByName('DATAENTDEVOL').asDateTime;
            regContab.iUnidNegoc := FCdsContab.FieldByName('UNIDNEGOC').AsInteger;

            regContab.sTipoLanc := '2';
            If FCdsContab.FieldByName('LACDEBCRE').AsString = 'D' Then
            begin
              regContab.iSubContaD := FCdsContab.FieldByName('CODSUBCONTA').AsInteger;
              regContab.sCCustD    := FCdsContab.FieldByName('CODCENTROCUSTO').AsString;
              regContab.sContaD    := FCdsContab.FieldByName('PLACONTA').AsString;
              if not paramintegra.PartidaDobrada then
                regContab.sTipoLanc := '0'
              else if (iContaLanc < 2) then
                inc(iContaLanc);

            end
            else
            begin
              regContab.iSubContaC := FCdsContab.FieldByName('CODSUBCONTA').AsInteger;
              regContab.sCCustC    := FCdsContab.FieldByName('CODCENTROCUSTO').AsString;
              regContab.sContaC    := FCdsContab.FieldByName('PLACONTA').AsString;
              if not paramintegra.PartidaDobrada then
                regContab.sTipoLanc := '1'
              else if (iContaLanc < 2) then
                inc(iContaLanc);
            end;

            if Not ( FloatsEqual(FCdsContab.FieldByName('LACVALOR').AsFloat, ZERO ) ) Then
            begin
              if (regContab.sTipoLanc = '0') or (regContab.sTipoLanc = '1') then
              begin
                If Not _Lancamento.InsereLancaContab( regContab.sTipoLanc, IdPessoa, Sistema.IdModulo, IdUsuario,
                                                      FCdsContab.FieldByName('PLANO').AsInteger, regContab.iUnidNegoc,
                                                      regContab.iSubContaD, regContab.iSubContaC,
                                                      regContab.iPlanPrev, regContab.iPatro,
                                                      regContab.iPlnCodigo, 0,
                                                      regContab.sDataLanc, regContab.sNumDoc,
                                                      regContab.sHist1,
                                                      regContab.sHist2,
                                                      regContab.sHist3,
                                                      regContab.sHist4,
                                                      regContab.sHist5,
                                                      '03',
                                                      regContab.sCCustD, regContab.sContaD,
                                                      regContab.sCCustC,regContab.sContaC,
                                                      regContab.scodHistPadrao,
                                                      regContab.dValLanc,False,UsaPlanoPrev,
                                                      regContab.iIdSegregaCriter, StrToDate(regContab.sDataLanc) ) Then
                  Raise Exception.Create( _Lancamento.MessageInfo );

                rPlnCodigo := _Lancamento.RetornoPlnCodigo;
                LimpaRegContab(regContab);
              end;
            end;

            if Not ( FloatsEqual(FCdsContab.FieldByName('LACVALOR').AsFloat, ZERO ) ) Then
            begin
              if (regContab.sTipoLanc = '2') and (iContaLanc = 2) then
              begin
                If Not _Lancamento.InsereLancaContab( regContab.sTipoLanc, IdPessoa, Sistema.IdModulo, IdUsuario,
                                                       FCdsContab.FieldByName('PLANO').AsInteger, regContab.iUnidNegoc,
                                                       regContab.iSubContaD, regContab.iSubContaC,
                                                       regContab.iPlanPrev, regContab.iPatro,
                                                       regContab.iPlnCodigo, 0,
                                                       regContab.sDataLanc, regContab.sNumDoc,
                                                       regContab.sHist1,
                                                       regContab.sHist2,
                                                       regContab.sHist3,
                                                       regContab.sHist4,
                                                       regContab.sHist5,
                                                       '03',
                                                       regContab.sCCustD, regContab.sContaD,
                                                       regContab.sCCustC, regContab.sContaC,
                                                       regContab.scodHistPadrao,
                                                       regContab.dValLanc, False, UsaPlanoPrev,
                                                       regContab.iIdSegregaCriter, StrToDate(regContab.sDataLanc) ) Then
                   Raise Exception.Create( _Lancamento.MessageInfo );

                 rPlnCodigo := _Lancamento.RetornoPlnCodigo;
                 LimpaRegContab(regContab);
               end;
             end;




            FCdsContab.Next;
         End;// while
         Result := rPlnCodigo;

   Except
      On E:Exception Do
       Begin
          Result := -1;
          MessageInfo := E.Message;
       End;
   End;
end;




function TCtrlRecebMerc.ListContabilizacao(PlnCodigo: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spListContab.Prepare;
         spListContab.ParamByName('PLNCODIGO').AsFloat := PlnCodigo;

         Result := spListContab.Data;
      End;
end;




function TCtrlRecebMerc.ListDadosCAP(CodDocumento: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spListDadosCAP.Prepare;
         spListDadosCAP.ParamByName('CodDocumento').AsFloat := CodDocumento;

         Result := spListDadosCAP.Data;
      End;
end;




procedure TCtrlRecebMerc.OnCreateAppServer;
begin
  inherited;
  FcdsNota              := TClientDataSet.Create(nil);
  FcdsItemNota          := TClientDataSet.Create(nil);
  FCdsContab            := TClientDataSet.Create(nil);
  FcdsAgregItemTela     := TClientDataSet.Create(nil);
  FcdsAgregNotaTela     := TClientDataSet.Create(nil);
  FCdsCAP               := TClientDataSet.Create(nil);
  FCdsNFCompl           := TClientDataSet.Create(nil);
  FCdsAgregNFCompl      := TClientDataSet.Create(nil);
  FCdsValTotAgreg       := TClientDataSet.Create(nil);
end;




function TCtrlRecebMerc.Procurar(IdNFRecebDevol: Double): OleVariant;
begin
  with _DtmAlmox Do
    Begin
       splistRecMerc.Prepare;
       splistRecMerc.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

       Result := spListRecMerc.Data;
    End;
end;




procedure TCtrlRecebMerc.SetCdsContab(const Value: TClientDataSet);
begin
  FCdsContab := Value;
end;




procedure TCtrlRecebMerc.SetcdsItemNota(const Value: TClientDataSet);
Begin
  FcdsItemNota := Value;
End;




procedure TCtrlRecebMerc.SetcdsNota(const Value: TClientDataSet);
begin
  FcdsNota := Value;
end;




function TCtrlRecebMerc.BaixaOC(Quantidade: Double; FlgAtendida : String ) : Boolean;
Var
   SQL : String;
   _cds : TClientDataSet;
   bDeveAtualizar : Boolean;
begin
   Result := True;

   _cds := TClientDataSet.Create(nil);

   bDeveAtualizar := False;

   Try
      Quantidade := _UnMedida.QtdeToUnCustoMedio( FcdsItemNota.FieldByName('CODARTIGO').AsString,
                                                  FcdsItemNota.FieldByName('CODMEDIDA').AsString,
                                                  Quantidade );


      // Verifica se a qtde recebida total é igual à qtde pedida para poder dar o UPDATE abaixo
      _cds.Data := GetDataPacket('SELECT QTDEPEDIDA, NVL(QTDERECEBIDA,0) AS QTDERECEBIDA FROM ITEMOC ' +
                                 'WHERE IDITEMOC = ' + FCdsItemNota.FieldByName('IDITEMOC').AsString +
                                 '  AND NUMOC = '    + FCdsItemNota.FieldByName('NUMOC').AsString );



      if not _cds.IsEmpty then
      begin
                             // ...ou a quantidade recebida seja igual à quantidade solicitada
         bDeveAtualizar := ((_cds.FieldByName('QTDEPEDIDA').AsFloat - (_cds.FieldByName('QTDERECEBIDA').AsFloat + Quantidade) = 0) or
                             // ...ou o usuário descarte a quantidade pendente, indicando que foi atendido
                            (FlgAtendida = 'T'));
      end;



      SQL := ' UPDATE ITEMOC SET QTDERECEBIDA = NVL(QTDERECEBIDA,0) + '+FloatToStrCM(Quantidade)+
             ' WHERE (IDITEMOC = '+FCdsItemNota.FieldByName('IDITEMOC').AsString +')';

      If Not ExecSQL(SQL,True) then
         Raise Exception.Create( MessageInfo );

      if bDeveAtualizar then
      begin

         SQL := ' UPDATE ITEMOC SET FLGITEMATENDIDO = '+QuotedStr(FlgAtendida)+
                ' WHERE (IDITEMOC = '+FCdsItemNota.FieldByName('IDITEMOC').AsString +')' ;

         If Not ExecSQL(SQL,True) then
            Raise Exception.Create( MessageInfo );
      end;


      _cds.Data := GetDataPacket('SELECT NVL(COUNT(*),0) AS TOTAL FROM ITEMOC ' +
                                 'WHERE NUMOC = ' + FCdsItemNota.FieldByName('NUMOC').AsString +
                                 ' AND  FLGITEMATENDIDO = ''F''' );


      if _cds.FieldByName('TOTAL').AsInteger = 0 then
      begin
         SQL := 'UPDATE OC SET OCATENDIDA = ''T'' ' +
                ' WHERE (NUMOC = '+FCdsItemNota.FieldByName('NUMOC').AsString +')' ;

         If Not ExecSQL(SQL,True) then
            Raise Exception.Create( MessageInfo );

      end;
      _cds.Free;


   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;




function TCtrlRecebMerc.BaixaSCI(IdPessoa : Integer; IdItensRecDev : Double;
  CodAlmoxarifado: Integer; CodArtigo: String; UnidNegoc: Integer;
  CodCentroRespon: String; IdProdVari : Integer; ERecebimentoComOC : Boolean): Boolean;
Var
   rQtdeBaixada   : Double;
   rQtdeBaixadaIn : Double;
   rQtdePend      : Double;
   rSaldoAComp    : Double;
begin
   Result := True;
   CodCentroRespon := Copy(CodCentroRespon+ '                  ',1,10);
   CodArtigo       := Copy(CodArtigo+ '                  ',1,14);
   Try
      With _DtmAlmox Do
         Begin
            if FCdsItemNota.FieldByName('NUMOC').IsNull then
            begin
               spBaixaSCI.Prepare;
               spBaixaSCI.ParamByName('NUMSOLCOMPRA').Clear;

               if IdProdVari = 0 Then
                  spBaixaSCI.ParamByName('IDPRODVARI').ClearLine;

               if IdProdVari <> 0 Then
                  spBaixaSCI.ParamByName('IDPRODVARI').AsInteger := IdProdVari;

               spBaixaSCI.Prepare;

               spBaixaSCI.ParamByName('CODARTIGO').AsString        := CodArtigo;
               spBaixaSCI.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
               spBaixaSCI.ParamByName('UNIDNEGOC').AsInteger       := UnidNegoc;
               spBaixaSCI.ParamByName('CODCENTRORESPON').AsString  := CodCentroRespon;
               spBaixaSCI.ParamByName('IDPESSOA').AsInteger        := IdPessoa;

               if not FCdsItemNota.FieldByName('NUMSOLCOMPRA').IsNull then
                  spBaixaSCI.ParamByName('NUMSOLCOMPRA').AsInteger := FCdsItemNota.FieldByName('NUMSOLCOMPRA').AsInteger;

               _Cds.Data := spBaixaSCI.Data;
               spBaixaSCI.UnPrepare;
            end
            else
            begin
               spBaixaSCIComOC.Prepare;

               if IdProdVari = 0 Then
                  spBaixaSCIComOC.ParamByName('IDPRODVARI').ClearLine;

               if IdProdVari <> 0 Then
                  spBaixaSCIComOC.ParamByName('IDPRODVARI').AsInteger := IdProdVari;

               spBaixaSCIComOC.Prepare;

               spBaixaSCIComOC.ParamByName('PNUMOC').AsInteger          := FCdsItemNota.FieldByName('NUMOC').AsInteger;
               spBaixaSCIComOC.ParamByName('CODARTIGO').AsString        := CodArtigo;
               spBaixaSCIComOC.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
               spBaixaSCIComOC.ParamByName('UNIDNEGOC').AsInteger       := UnidNegoc;
               spBaixaSCIComOC.ParamByName('CODCENTRORESPON').AsString  := CodCentroRespon;
               spBaixaSCIComOC.ParamByName('IDPESSOA').AsInteger        := IdPessoa;

               if not FCdsItemNota.FieldByName('NUMSOLCOMPRA').IsNull then
                  spBaixaSCIComOC.ParamByName('NUMSOLCOMPRA').AsInteger := FCdsItemNota.FieldByName('NUMSOLCOMPRA').AsInteger;

               _Cds.Data := spBaixaSCIComOC.Data;

               spBaixaSCIComOC.UnPrepare;
            end;

            rQtdeBaixada := 0;

            _Cds.First;
            While Not _Cds.Eof Do
               Begin
                   rQtdeBaixadaIn := _UnMedida.QtdeToUnidade( FCdsItemNota.FieldByName('CODARTIGO').AsString,
                                                              FCdsItemNota.FieldByName('CODMEDIDA').AsString,
                                                              _Cds.FieldByName('CODMEDIDA').AsString,
                                                              FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat-rQtdeBaixada) ;

                   rQtdePend := _Cds.FieldByName('QTDEPENDENTE').asFloat - rQtdeBaixadaIn;

                   IF rQtdePend < 0 then
                      Begin
                         rQtdePend      := 0;
                         rQtdeBaixadaIn := _Cds.FieldByName('QTDEPENDENTE').asFloat;
                      end;

                   rQtdeBaixada := rQtdeBaixada + _UnMedida.QtdeToUnidade( FCdsItemNota.FieldByName('CODARTIGO').AsString,
                                                                           FCdsItemNota.FieldByName('CODMEDIDA').AsString,
                                                                           _Cds.FieldByName('CODMEDIDA').AsString,
                                                                           FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat-rQtdeBaixada {amf 24.04.2006 - rQtdeBaixadaIn} ) ;
                   If ERecebimentoComOC Then
                      rSaldoAComp := _Cds.FieldByName('SALDOACOMPRAR').asFloat
                   else
                      rSaldoAComp := _Cds.FieldByName('SALDOACOMPRAR').asFloat - rQtdeBaixadaIn;

                   If rSaldoAComp < 0 then
                      rSaldoAComp := 0;
                   //--------------------------------------------------------------------------------------------------
                   // Atualiza a tabela ITEMSOLI
                   //--------------------------------------------------------------------------------------------------
                   spAtuItemSoli.Prepare;
                   spAtuItemSoli.ParamByName('SALDOACOMPRAR').AsFloat := rSaldoAComp;
                   spAtuItemSoli.ParamByName('QTDEPENDENTE').AsFloat  := rQtdePend;
                   spAtuItemSoli.ParamByName('IDITEMSOLI').AsFloat    := _Cds.FieldByName('IDITEMSOLI').AsFloat;

                   if not FCdsItemNota.FieldByName('NUMSOLCOMPRA').IsNull then
                      spAtuItemSoli.ParamByName('NUMSOLCOMPRA').AsInteger := FCdsItemNota.FieldByName('NUMSOLCOMPRA').AsInteger;

                   If Not ExecSQL(spAtuItemSoli.SQLChanged,True ) Then
                      Raise Exception.Create( MessageInfo );

                   //--------------------------------------------------------------------------------------------------
                   // Insere na tabela SOLIBAIXADAS
                   //--------------------------------------------------------------------------------------------------

                      spInsertSoliBaixadas.Prepare;
                      spInsertSoliBaixadas.ParamByName('IDITENSRECDEV').AsFloat := IdItensRecDev;
                      spInsertSoliBaixadas.ParamByName('IDITEMSOLI').AsFloat    := _Cds.FieldByName('IDITEMSOLI').AsFloat;
                      spInsertSoliBaixadas.ParamByName('IDPESSOA').AsFloat      := IdPessoa;
                      spInsertSoliBaixadas.ParamByName('QTDEBAIXADA').AsFloat   := rQtdeBaixada;
                      spInsertSoliBaixadas.ParamByName('DATAEMISSOLI').AsDate   := FCdsNota.FieldByName('DATAEMISNF').AsDateTime;
                      spInsertSoliBaixadas.ParamByName('DATARECEB').AsDate      := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
                      spInsertSoliBaixadas.ParamByName('NUMDIAS').AsFloat       := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime - _Cds.FieldByName('DATAEMISSAO').AsDateTime;

                      If Not ExecSQL(spInsertSoliBaixadas.SQLChanged,True ) Then
                         Raise Exception.Create( MessageInfo );

                   If Format('%17.2f',[FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat]) = Format('%17.2f',[rQtdeBaixada]) then
                      Break;

                   _Cds.Next;
               End;
         End;
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;

end;




function TCtrlRecebMerc.AtualizaValUltCompra(CodArtigo: String;
  Valor: Double): Boolean;
Var
   SQL : String;
begin
   Result := True;
   Try
      SQL := ' UPDATE ARTIGO SET VALULTCOMPRA = '+FloatToStrCM(Valor)+
             ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')';

      IF Not ExecSQL(SQL,True) Then
         Raise Exception.Create( MessageInfo );

   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;

end;




procedure TCtrlRecebMerc.SetcdsAgregItemTela(const Value: TClientDataSet);
begin
  FcdsAgregItemTela := Value;
end;




procedure TCtrlRecebMerc.SetcdsAgregNotaTela(const Value: TClientDataSet);
begin
  FcdsAgregNotaTela := Value;
end;




function TCtrlRecebMerc.ValidaDadosNota(IntegraCAP: Boolean): Boolean;
begin
  Result := True;
  Try
     If FcdsNota.FieldByName('IDFORCLI').IsNull Then
        Raise Exception.Create( MSG_FORN_NAO_PREENCH );

     If FcdsNota.FieldByName('NUMNF').IsNull Then
        Raise Exception.Create( MSG_NUMNOTA_NAO_PREENCH );

     If FcdsItemNota.IsEmpty  Then
        Raise Exception.Create( MSG_NAO_HA_ITEMNOTA );

     If FcdsNota.FieldByName('DATAEMISNF').IsNull Then
        Raise Exception.Create( MSG_DATAEMISS_NAO_PREENCH );

     If FcdsNota.FieldByName('DATAENTDEVOL').IsNull Then
        Raise Exception.Create( MSG_DATAENTRADA_NAO_PREENCH );

     If ( IntegraCAP ) And (FcdsNota.FieldByName('DATAVENCTO').IsNull) Then
        Raise Exception.Create( MSG_DATAVENCTO_NAO_PREENCH );

     If ( IntegraCAP ) And (FcdsNota.FieldByName('DATAVENCTO').AsDateTime <  FcdsNota.FieldByName('DATAENTDEVOL').asDateTime) Then
        Raise Exception.Create( MSG_DATAVENCTO_MENOR );

     If _Documento.ExisteNumDoc('P',FcdsNota.FieldByName('IDFORCLI').AsInteger,
                                FcdsNota.FieldByName('IDPESSOA').asFloat,
                                FcdsNota.FieldByName('NUMNF').asFloat,
                                FcdsNota.FieldByName('COMPLNF').AsString )
     Then
        Raise Exception.Create( MSG_NOTA_JA_LANCADA );
  Except
     On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
  End;
end;




function TCtrlRecebMerc.ValidaDadosItem(IntegraLivro : Boolean): Boolean;
begin
  Result := True;
  Try

     If (IntegraLivro) And (Not TestaCodFiscal(FcdsItemNota.FieldByName('CODFISCAL').AsString)) Then
        Raise Exception.Create( MSG_CODFISCAL_INVALIDO );

     If (FcdsItemNota.FieldByName('FLGDESTINO').AsString = 'E') And ( FCdsItemNota.FieldByName('CODALMOXARIFADO').IsNull ) Then
        Raise Exception.Create( MSG_ALMOXDESTINO_NAO_PREENCH );

     If (FcdsItemNota.FieldByName('FLGDESTINO').AsString = 'C') And ( FCdsItemNota.FieldByName('CODCENTROCUSTO').IsNull ) Then
        Raise Exception.Create( MSG_CENTCUSTDESTINO_NAO_PREENCH );

     If FCdsItemNota.FieldByName('CODCENTRORESPON').IsNull Then
        Raise Exception.Create( MSG_CENTRESPON_NAO_PREENCH );

     If FCdsItemNota.FieldByName('UNIDNEGOC').IsNull Then
        Raise Exception.Create( MSG_UNIDNEGOC_NAO_PREENCH );


  Except
     On E:Exception Do
      Begin
         Result := False;
         MessageInfo := FcdsItemNota.FieldByName('DESCPROD').AsString +' - '+ E.Message;
      End;
  End;
end;




function TCtrlRecebMerc.TestaCodFiscal(CodFiscal: String): Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT CODFISCAL FROM CLASFISC '+
          ' WHERE (RTRIM(CODFISCAL) = '+ QuotedStr(CodFiscal)+')';

   _Cds.Data := GetDataPacket( SQL );

   Result :=  Not _Cds.IsEmpty;
end;




function TCtrlRecebMerc.FazIntegraCAP(IdPessoa : Integer; IdUsuario,IdEspAcesso,IdPatro,
IdPlanoPrev,IdPrograma, IdPlnCodigo,rAbateValor,rTotImp,rTotRefCalculo : Double;
bEnglobaParcela,bUsaPlanoPatro,IntegraContab : Boolean) : Double;
Var
   sOperacao  : String;
   rValorLanc : Double;
   rTotValor  : Double;
   rValRef    : Double;
   sNumSlip   : String;
   sContaForn     : String;
   sCCustoForn    : String;
   iSubContaForn  : Integer;
   iUnidNegocForn : Integer;
   iPlanoForn     : Integer;
   sSql,sMascaraDoc,sMascaraDoc1,sNumFatura : String;

   { Variáveis necessárias à segregação e múltiplas contas de baixa.}
   bMultiplasContasBaixa : boolean;
   _IdSegregaCriter : integer;
   cdsContasBaixa : TCMClientDataset;
   bExiste : boolean;
begin
     _Cds.Data := _ListCAPCAR.ListaDadosForn(IdPessoa,FCdsNota.FieldByName('IDFORCLI').AsFloat);

     sContaForn     := _Cds.FieldByName('CONTACFORN').AsString;
     sCCustoForn    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
     iSubContaForn  := _Cds.FieldByName('CODSUBCONTA').AsInteger;
     iUnidNegocForn := _Cds.FieldByName('UNIDNEGOC').AsInteger;
     iPlanoForn     := _Cds.FieldByName('PLANO').AsInteger;



   Try
      sNumSlip := '';
      If _iNumSlip > 0 Then
         sNumSlip := FloatToStr( _iNumSlip );

      If bEnglobaParcela then
         begin
            sOperacao := '1 ';
            _Documento.Prepare(OpDocumento,odlAParcelar,sdocAberto);
         end
      Else
         begin
            sOperacao := '2 ';
            _Documento.Prepare(OpDocumento,odlEfetivo,sdocAberto);
         end;
      _Documento.IdEspAcesso := IdEspAcesso;
      _Documento.IdUsuario   := IdUsuario;
      _Documento.IdModulo    := Sistema.IdModulo;

      { Verifica se haverá múltiplas contas de baixa (recuperando, ainda, o último critério recuperado.}
      bMultiplasContasBaixa := MultiplasContasBaixa( _IdSegregaCriter );

      _Documento.SetValues(0,
                           FCdsNota.FieldByName('NUMNF').AsFloat,
                           FCdsNota.FieldByName('COMPLNF').AsString,
                           '',
                           'P',
                           sOperacao,
                           sNumSlip,
                           FCdsCap.FieldByName('NUMLEITCODBARRAS').AsString,
                           sContaForn,
                           sCCustoForn,
                           '',
                           FCdsCap.FieldByName('NUMDIGCODBARRAS').AsString,
                           '',
                           '',
                           '',
                           '',
                           FCdsCAP.FieldByName('REFERENCIA').AsString,
                           FCdsCap.FieldByName('OBS').AsString,
                           FCdsNota.FieldByName('DATAVENCTO').asDateTime,
                           FCdsNota.FieldByName('DATAENTDEVOL').asDateTime,
                           FCdsNota.FieldByName('DATAVENCTO').asDateTime,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           FCdsCAP.FieldByName('CODTIPDOC').AsInteger,
                           IdPessoa,
                           Sistema.IdModulo,
                           FCdsNota.FieldByName('IDFORCLI').AsInteger,
                           0,
                           CdsCAP.FieldByName('IDCBANCARIA').asInteger,
                           iUnidNegocForn,
                           iPlanoForn,
                           0,
                           FCdsCAP.FieldByName('NUMAPGR').AsInteger,
                           0,
                           0,
                           0,
                           Trunc(_Documento.IdUsuario),
                           IdPessoa,
                           0,
                           0,
                           iSubContaForn,
                           FCdsCAP.FieldByName('CODPORTFORMA').AsInteger,
                           0,
                           0,
                           FCdsCAP.FieldByName('CODFORMA').AsInteger,
                           { Parâmetro necessário à segregação e múltiplas contas de baixa.}
                           _IdSegregaCriter );


         //Segregação e Múltiplas Contas de Baixa (Início)

         //Se houver múltiplas contas de baixa, faz a conatbilização por cada uma.
         if bMultiplasContasBaixa then
         begin

           //Criação do ClientDataSet que conterá as contas de baixa
           cdsContasBaixa := TCMClientDataSet.Create( nil );
           try

             //Criação da estrutura do ClientDataSet
             cdsContasBaixa.Data := GetDataPacket(
              ' select ''                  '' as PLACONTA,        ' +
              '        0                      as PLANO,           ' +
              '        0                      as UNIDNEGOC,       ' +
              '        0                      as IDSEGREGACRITER, ' +
              '        0                      as IDPLANOPREV,     ' +
              '        0                      as IDPATRO,         ' +
              '        0                      as VALOR            ' +
              ' from   DUAL                                       ' +
              ' where  1 = 2                                      ' );


             //Enquanto houverem lançamentos, acumula-os nas respectivas contas de baixa
             FCdsContab.First;
             while not FCdsContab.Eof do
             begin

               bExiste := False;

               //Varre as conta de baixa (para verificar se estas já foram inseridas).
               cdsContasBaixa.First;
               while not cdsContasBaixa.Eof do
               begin
                 //Se já foi inserida (e for crédito)...
                 if   ( cdsContasBaixa.FieldByName('PLACONTA').AsString         = FCdsContab.FieldByName('PLACONTA').AsString         )
                  and ( cdsContasBaixa.FieldByName('PLANO').AsInteger           = FCdsContab.FieldByName('PLANO').AsInteger           )
                  and ( cdsContasBaixa.FieldByName('UNIDNEGOC').AsInteger       = FCdsContab.FieldByName('UNIDNEGOC').AsInteger       )
                  and ( cdsContasBaixa.FieldByName('IDSEGREGACRITER').AsInteger = FCdsContab.FieldByName('IDSEGREGACRITER').AsInteger )
                  and ( cdsContasBaixa.FieldByName('IDPLANOPREV').AsInteger     = FCdsContab.FieldByName('IDPLANOPREV').AsInteger     )
                  and ( cdsContasBaixa.FieldByName('IDPATRO').AsInteger         = FCdsContab.FieldByName('IDPATRO').AsInteger         )
                  and ( FCdsContab.FieldByName('LACDEBCRE').AsString            = 'C'                                                 ) then
                 begin
                   //...apenas acumula no registro já criado.
                   cdsContasBaixa.Edit;
                   cdsContasBaixa.FieldByName('VALOR').AsFloat := cdsContasBaixa.FieldByName('VALOR').AsFloat + FCdsContab.FieldByName('LACVALOR').AsFloat;
                   cdsContasBaixa.Post;

                   //Indica a existência da conta de baixa
                   bExiste := True;

                   break;
                 end;
                 cdsContasBaixa.Next;
               end;

               //Se não foi inserida (e for crédito), cria um novo registro.
               if   ( not bExiste ) and ( FCdsContab.FieldByName('LACDEBCRE').AsString = 'C' ) then
               begin
                 cdsContasBaixa.Insert;
                 cdsContasBaixa.FieldByName('PLACONTA').AsString         := FCdsContab.FieldByName('PLACONTA').AsString;
                 cdsContasBaixa.FieldByName('PLANO').AsInteger           := FCdsContab.FieldByName('PLANO').AsInteger;
                 cdsContasBaixa.FieldByName('UNIDNEGOC').AsInteger       := FCdsContab.FieldByName('UNIDNEGOC').AsInteger;
                 cdsContasBaixa.FieldByName('IDSEGREGACRITER').AsInteger := FCdsContab.FieldByName('IDSEGREGACRITER').AsInteger;
                 cdsContasBaixa.FieldByName('IDPLANOPREV').AsInteger     := FCdsContab.FieldByName('IDPLANOPREV').AsInteger;
                 cdsContasBaixa.FieldByName('IDPATRO').AsInteger         := FCdsContab.FieldByName('IDPATRO').AsInteger;
                 cdsContasBaixa.FieldByName('VALOR').AsFloat             := FCdsContab.FieldByName('LACVALOR').AsFloat;
                 cdsContasBaixa.Post;
                cdsContasBaixa.Next;
               end;

               FCdsContab.Next;
             end;

             //Faz a contabilização de cada conta de baixa
             cdsContasBaixa.First;
             while not cdsContasBaixa.Eof do
             begin
               _Documento.CcBaixasxDocum.SetValues( cdsContasBaixa.FieldByName('VALOR').AsFloat,
                                                    0,
                                                    Sistema.IdEmpresa,
                                                    0,
                                                    cdsContasBaixa.FieldByName('UNIDNEGOC').AsInteger,
                                                    cdsContasBaixa.FieldByName('PLANO').AsInteger,




                                                    cdsContasBaixa.FieldByName('IDPLANOPREV').AsInteger,
                                                    cdsContasBaixa.FieldByName('IDPATRO').AsInteger,


                                                    cdsContasBaixa.FieldByName('IDSEGREGACRITER').AsInteger,
                                                    cdsContasBaixa.FieldByName('PLACONTA').AsString );
               cdsContasBaixa.Next;
             end;

           finally
             cdsContasBaixa.Free;
           end;
         end;

         //Segregação e Múltiplas Contas de Baixa (Fim)


         sMascaraDoc := '';
         sMascaraDoc1:= '';
         sSql := 'SELECT DECODE(MASCARANODOCUM,NULL,MASCARANODOCUM, '+
                 '       REPLACE(REPLACE(REPLACE(MASCARANODOCUM,''.''),''/''),''-'')) AS MASCARANODOCUM, '+
                 '       MASCARANODOCUM as MASCARA  '+
                 'FROM PARAMCAP WHERE RECPAG = ''P'' AND (IDPESSOA = '+FloatToStr(IdPessoa)+')';
         OpenDataSet(sSql);
         if (not _lDataSet.IsEmpty) and (not _lDataSet.FieldByName('MASCARANODOCUM').isNull) then
         begin
            sMascaraDoc  := trim(_lDataSet.FieldByName('MASCARANODOCUM').AsString);
            sMascaraDoc1 := trim(_lDataSet.FieldByName('MASCARA').AsString)+';0;';
         end;
         sNumFatura := '';
         if sMascaraDoc <> '' then
         begin
            sNumFatura := FormatMaskText(sMascaraDoc1,StrPadLeft(trim(FloatToStr(FCdsNota.FieldByName('NUMNF').AsFloat)),Length(sMascaraDoc),'0'));
         end;
      _Documento.Lanctodocum.SetValues(FCdsNota.FieldByName('DATAENTDEVOL').asDateTime,0,0,
                                       (FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor-rTotImp),0,
                                       FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor,
                                       0,trunc(IdPlnCodigo),0,trunc(_Documento.IdUsuario),
                                       FCdsNota.FieldByName('IDPESSOA').AsInteger,0,0,0,0,0,sOperacao,
                                       '','',sNumFatura,FCdsCAP.FieldByName('HISTORICOCOMPL').AsString,'','','','C', Sistema.IdModulo, 0, bUsaPlanoPatro,False,
                                       FCdsCAP.FieldByName('CODPORTFORMA').AsInteger);

      rTotValor := FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor;
      FcdsItemNota.First;
      While not FcdsItemNota.Eof Do
         Begin
            rValRef := (FCdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);
            rValorLanc  := 0;
            if rTotRefCalculo <> 0 then
               rValorLanc :=(((FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor)*rValRef)/rTotRefCalculo);
            rValorLanc:= StrToFloat(Format('%17.2f',[rValorLanc]));
            rTotValor := rTotValor - rValorLanc;
            _Documento.Rateiodocum.SetValues(rValorLanc,0,0,0,idPessoa,0,
                                             FCdsItemNota.FieldByName('UNIDNEGOC').AsInteger,0, Trunc(_Documento.IdUsuario),

                                             FCdsItemNota.FieldByName('IDRESERVAORCAMEN').AsInteger,

                                             0,

                                             FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                                             FCdsItemNota.FieldByName('IDPATRO').AsInteger,
                                             FCdsItemNota.FieldByName('IDPROGRAMA').AsInteger,

                                             0,
                                             IdPessoa,FcdsItemNota.FieldByName('CODTIPRECDES').AsString,
                                             'P',FcdsItemNota.FieldByName('CODCENTRORESPON').AsString,
                                             FcdsItemNota.FieldByName('CODCENTROCUSTO').AsString,'');
            FcdsItemNota.Next;
         End;
         // Ajusta problemas de arredondamento no limite do valor.
         if strToFloat(formatFloat('#,##0.00', rTotValor)) <> 0 Then
         Begin
            _Documento.Rateiodocum.SetValues(rTotValor,0,0,0,idPessoa,0,
                                             FCdsItemNota.FieldByName('UNIDNEGOC').AsInteger,0, Trunc(_Documento.IdUsuario),0,0,
                                             FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                                             FCdsItemNota.FieldByName('IDPATRO').AsInteger,
                                             FCdsItemNota.FieldByName('IDPROGRAMA').AsInteger,

                                             0,
                                             IdPessoa,FcdsItemNota.FieldByName('CODTIPRECDES').AsString,
                                             'P',FcdsItemNota.FieldByName('CODCENTRORESPON').AsString,
                                             FcdsItemNota.FieldByName('CODCENTROCUSTO').AsString,'');
         End;
      If Not _Documento.Insert Then
         Raise Exception.Create( _Documento.MessageInfo );


      _ImpostoRetido.IdEmpresa         := IdPessoa;
      _ImpostoRetido.RecPag            := 'P';
      _ImpostoRetido.DataProgramada    := FCdsNota.FieldByName('DATAVENCTO').AsDateTime;
      _ImpostoRetido.OperacaoDocumento := sOperacao;
      _ImpostoRetido.IdForCli          := FCdsNota.FieldByName('IDFORCLI').AsInteger;
      _ImpostoRetido.CodDocumento      := Trunc(_Documento.CodDocumento);
      _ImpostoRetido.NumLancto         := _Documento.Lanctodocum.NumLancto;
      _ImpostoRetido.ValorLancto       := (FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat -rAbateValor);
      _ImpostoRetido.ValorLiquido      := (FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor-rTotImp);
      _ImpostoRetido.DataLancto        := FCdsNota.FieldByName('DATAENTDEVOL').AsDateTime;
      _ImpostoRetido.DataEmissao       := FCdsNota.FieldByName('DATAEMISNF').AsDateTime;
      _ImpostoRetido.CodTipoDoc        := FCdsCAP.FieldByName('CODTIPDOC').AsInteger;
      _ImpostoRetido.IntegraContab     := IntegraContab;
      _ImpostoRetido.IdModulo          := Sistema.IdModulo;
      _ImpostoRetido.IdUsuario         := Trunc(IdUsuario);
      _ImpostoRetido.Incluir;

      Result :=_Documento.CodDocumento;
   Except
      On E:Exception Do
         Begin
            Result := -1;
            MessageInfo := E.Message;
         End;
   End;
end;




procedure TCtrlRecebMerc.SetCdsCAP(const Value: TClientDataSet);
begin
  FCdsCAP := Value;
end;




function TCtrlRecebMerc.FezBaixaDireta(IdMov: Double) : Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT IDMOV FROM MOVIMENT WHERE (IDMOVENTRADA = '+FloatToStr(IdMov)+')';

   _Cds.Data := GetDataPacket(SQL);

   Result := Not _Cds.IsEmpty;

end;




function TCtrlRecebMerc.PegaQtdeDevol(IdNFRecebDevol: Double;
  CodArtigo: String; IdProdVari: Double): Double;
Var
   SQL : TStringList;
begin
    Result := 0;
    CodArtigo := Copy(CodArtigo + '              ',1,14);

    SQL := TStringList.Create;
    Try
       SQL.Clear;
       SQL.Add(' SELECT I.CODMEDIDA, SUM(I.QTDERECEBDEVOL) AS QTDEDEVOL ');
       SQL.Add(' FROM ITENSRECEBDEVOL I, NFRECEBDEVOL N ');
       SQL.Add(' WHERE (N.IDNFREFERENCIA = '+FloatToStr(IdNFRecebDevol)+')');
       SQL.Add('   AND (N.FLGTIPONOTA = ''D'') ');
       SQL.Add('   AND (I.CODARTIGO = '+QuotedStr(CodArtigo)+') ');
       SQL.Add('   AND (N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL) ');
       If idProdVari > 0 Then
          SQL.Add(' AND (I.IDPRODVARI = '+FloatToStr(idProdVari)+')');
       SQL.Add(' GROUP BY I.CODMEDIDA');

       _Cds.Data := GetDataPacket(SQL.Text);

       If Not _Cds.IsEmpty Then
          Begin
             _Cds.First;
             While not _Cds.EOF Do
                Begin
                   Result := Result +  _UnMedida.QtdeToUnCustoMedio( CodArtigo, _Cds.FieldByName('CODMEDIDA').AsString, _Cds.FieldByName('QTDEDEVOL').AsFloat );
                   _Cds.Next;
                End;
          End;
    Finally
       SQL.Free;
    End;
end;




function TCtrlRecebMerc.ExcluiBaixaSCI(IdItensRecDev: Double;
  CodArtigo: String; IdProdVari: Integer;
  ERecebimentoComOC: Boolean): Boolean;
Var
   SQL            : String;
   rQtdeBaixadaIn : Double;
   rQtdePend      : Double;
   rSaldoAComp    : Double;
   CdsAux         : TClientDataSet;
begin
  Result := True;
  CodArtigo := Copy(CodArtigo+ '                  ',1,14);
  CdsAux := TClientDataSet.Create(NIL);
  Try
     Try
        With _DtmAlmox Do
           Begin
              spDelBaixaSCI.Prepare;

             if IdProdVari = 0 Then
                spDelBaixaSCI.ParamByName('IDPRODVARI').ClearLine;

             if IdProdVari <> 0 Then
                spDelBaixaSCI.ParamByName('IDPRODVARI').AsInteger := IdProdVari;

             spDelBaixaSCI.Prepare;

             spDelBaixaSCI.ParamByName('CODARTIGO').AsString    := CodArtigo;
             spDelBaixaSCI.ParamByName('IDITENSRECDEV').AsFloat := IdItensRecDev;

             _Cds.Data := spDelBaixaSCI.Data;

             spDelBaixaSCI.UnPrepare;

             _Cds.First;
             While Not _Cds.Eof Do
                Begin
                   rQtdeBaixadaIn := _Cds.FieldByName('QTDEBAIXADA').AsFloat;

                   SQL := ' SELECT SALDOACOMPRAR,QTDEPENDENTE FROM ITEMSOLI '+
                          ' WHERE (IDITEMSOLI = '+_Cds.FieldByName('IDITEMSOLI').AsString+')';

                   CdsAux.Data := GetDataPacket(SQL);

                   rQtdePend := CdsAux.FieldByName('QTDEPENDENTE').asFloat + rQtdeBaixadaIn;

                   if rQtdePend < 0 then
                    Begin
                       rQtdePend      := 0;
                       rQtdeBaixadaIn := CdsAux.FieldByName('QTDEPENDENTE').asFloat;
                    end;

                    if (rQtdePend > CdsAux.FieldByName('SALDOACOMPRAR').AsFloat) then
                       rQtdePend := CdsAux.FieldByName('SALDOACOMPRAR').AsFloat;

                    If ERecebimentoComOC then
                       rSaldoAComp := CdsAux.FieldByName('SALDOACOMPRAR').asFloat
                    Else
                       rSaldoAComp := CdsAux.FieldByName('SALDOACOMPRAR').asFloat + rQtdeBaixadaIn;

                    If rSaldoAComp < 0 then
                       rSaldoAComp := 0;
                    //---------------------------------------------------------------------------------------
                    // Devolve a quantidade pendente para a solicitação
                    //---------------------------------------------------------------------------------------
                    SQL := ' UPDATE ITEMSOLI SET ' +
                           '  QTDEPENDENTE  = ' + FloatToStrCM(rQtdePend) +
                           ' WHERE (IDITEMSOLI =  '+ _Cds.FieldByName('IDITEMSOLI').AsString +') ';

                    IF Not ExecSQL(SQL,True ) Then
                       Raise Exception.Create( MessageInfo );

                    //---------------------------------------------------------------------------------------
                    // Deleta as solicitações baixadas
                    //---------------------------------------------------------------------------------------
                    SQL := ' DELETE FROM SOLIBAIXADAS '+
                           ' WHERE (IDITENSRECDEV = '+FloatToStrCM( IdItensRecDev )+')'+
                           '   AND (IDITEMSOLI = '+_Cds.FieldByName('IDITEMSOLI').AsString+')';

                    IF Not ExecSQL(SQL,True ) Then
                       Raise Exception.Create( MessageInfo );

                   _Cds.Next;
                End;
           End;
     Except
        On E:Exception Do
           Begin
              Result := False;
              MessageInfo := E.Message;
           End;
     End;
  Finally
     CdsAux.Free;
  End;

end;




function TCtrlRecebMerc.ExcluiAvaliacaoForn(
  IdNFRecebDevol: Double): boolean;
Var
   SQL : String;
begin
  Result := True;
  Try
     SQL := ' SELECT IDAVALIACAO FROM AVALIACAO '+
            ' WHERE (IDNFRECEBDEVOL = '+FloatToStr( IdNFRecebDevol )+')';

     _Cds.Data := GetDataPacket( SQL );

     IF Not _Cds.IsEmpty Then
        Begin
           SQL := 'DELETE FROM ITEMAVALIACAO WHERE (IDAVALIACAO = '+_Cds.FieldByName('IDAVALIACAO').AsString+')';
           if Not ExecSQL(SQL, True) Then
              Raise Exception.Create( MessageInfo );

           SQL := ' DELETE FROM AVALIACAO WHERE (IDNFRECEBDEVOL = '+FloatToStr( IdNFRecebDevol )+')';
           if Not ExecSQL(SQL, True) Then
              Raise Exception.Create( MessageInfo );
        End;
  Except
     On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
  End;

end;




function TCtrlRecebMerc.ExcluiMoviment(IdMov: Double;
  DataValidade : TDateTime): Boolean;
Var
   i         : Integer;
   IdMovAux  : Double;
begin
   Result := True;
   Try
      With _DtmAlmox Do
         Begin
            spBaixaDir.Prepare;
            spBaixaDir.ParamByName('IDMOV').AsFloat := IdMov;

            _Cds.Data := spBaixaDir.Data;

            For i := 1 to 2 Do
               Begin
                  _Cds.First;
                  While Not _Cds.Eof Do
                     Begin
                        If ((i = 1) And (_Cds.FieldByName('QTDEMOV').AsFloat < 0)) or
                           ((i = 2) And (_Cds.FieldByName('QTDEMOV').AsFloat > 0))
                        Then
                           Begin
                              IdMovAux := _MovEstoque.GeraMovimento(tlEntradaCusto,
                                                                 _Cds.FieldByName('IDPESSOA').AsInteger,
                                                                 _Cds.FieldByName('VALORMOV').AsFloat*-1,
                                                                 _Cds.FieldByName('QTDEMOV').AsFloat*-1,
                                                                 _Cds.FieldByName('CODCUSTEIO').AsInteger,
                                                                 _Cds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                 _Cds.FieldByName('CODARTIGO').AsString,
                                                                 '',
                                                                 _Cds.FieldByName('CODTIPOMOV').AsString,
                                                                 _Cds.FieldByName('CODMEDCUSTO').AsString,
                                                                 DataValidade,
                                                                 _Cds.FieldByName('DATAMOV').AsDateTime,
                                                                 _Cds.FieldByName('NUMDOCUMENTO').AsString,
                                                                 _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                                                 _Cds.FieldByName('IDEMPRESA').AsInteger,
                                                                 _Cds.FieldByName('CODALMOXTRANSF').AsInteger,
                                                                 _Cds.FieldByName('UNIDNEGOC').asInteger);

                              If IdMovAux < 0 Then
                                 Raise Exception.Create( _MovEstoque.MessageInfo );

                              If Not _MovEstoque.UpdMovimento(IdMovAux,IdMov,-1) Then
                                 Raise Exception.Create( _MovEstoque.MessageInfo );

                              If Not _MovEstoque.UpdMovimento(_Cds.FieldByName('IDMOV').AsFloat,IdMov,-1) Then
                                 Raise Exception.Create( _MovEstoque.MessageInfo );
                           End;
                        _Cds.Next;
                     End;
               End;
         End;
   Except
     On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
   End;
end;




function TCtrlRecebMerc.GetNotaComplementar(IdNFReferencia: Double): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spGetNotaCompl.Prepare;
        spGetNotaCompl.ParamByName('IDNFREFERENCIA').AsFloat := IdNFReferencia;
        Result := spGetNotaCompl.Data;
     End;
end;




procedure TCtrlRecebMerc.SetCdsNFCompl(const Value: TClientDataSet);
begin
  FCdsNFCompl := Value;
end;




function TCtrlRecebMerc.ProcessaNota(IdPessoa,iUnidNegocPadrao : Double; var rAbateValor, rTotImp,
  rTotRefCalculo: Double; IntegraContab,IntegraLivro : Boolean; sCCustoPadrao : String;
  { Parâmetros necessários à segregação e múltiplas contas de baixa.}
  iIdPatro, iIdPlanoPrev : Double ): Boolean;
var rTotal           : Double;
    rTotalCusto      : Double;
    rTotalRecup      : Double;
    rTotContaDeb     : Double;
    rTotContaCre     : Double;
    rAbateVlrCompl   : Double;
    rValRecup        : Double;
    rValEstoque      : Double;
    rValRef          : Double;
    rDifer           : Double;
    sHistorico       : String;
    sNomeForn        : String;
    sNomeFantForn    : String;
    sContaForn       : String;
    sCCustoForn      : String;
    iSubContaForn    : Double;
    iUnidNegocForn   : Double;
    iPlanoForn       : Double;
    sCCustoGrava     : String;
    sContaEntrada    : String;
    iUnidNegGrava    : Double;
    iSubContaEntrada : Integer;
    rValAgregItem    : Double;
    sNomeTipoDoc     : String;
    sNumOC           : String;
    sTipoDoc         : String;
    sNumSlip         : String;
    sSql             : String;

    { Variáveis necessárias à segregação e múltiplas contas de baixa.}
    sContaContabil   : String;
    iIdSegregaCriter : integer;
    sAux             : string;
    i, item          : integer;
    rTotalProd       : Double;
begin
  Result := True;
  Try
     //Apagando os lançamentos contábeis
     FCdsContab.First;
     While not FCdsContab.EOF do
        FCdsContab.Delete;

      sSql := 'SELECT E.PLANO, E.CODSUBCONTA,E.CONTACDESPESA, E.UNIDNEGOC, '+
           '       E.CONTACFORN,E.CODCENTROCUSTO,P.RAZAOSOCIAL,P.NOME, '+
           '       P.NUMDOCUMENTO,P.IDDOCUMENTO,D.NOMEDOCUMENTO,   '+
           '       E.IDFORCLI '+
           'FROM PESSOA P, TIPODOCPESSOA D,FORNSERV F, EMPRESAFORN E '+
           'WHERE (P.IDDOCUMENTO = D.IDDOCUMENTO(+))    '+
           '  AND (P.IDPESSOA = E.IDFORCLI)             '+
           '  AND (P.IDPESSOA = F.IDPESSOA)             '+
           '  AND (E.IDPESSOA = '+FloatToStr(IdPessoa)+')'+
           '  AND (P.IDPESSOA = '+FloatToStr(FCdsNota.FieldByName('IDFORCLI').AsFloat)+') ';

     _Cds.Data     := GetDataPacket( sSql );
     sNomeForn     := _Cds.FieldByName('RAZAOSOCIAL').AsString;
     sNomeFantForn := _Cds.FieldByName('NOME').AsString;
     sContaForn    := _Cds.FieldByName('CONTACFORN').AsString;
     sCCustoForn   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
     iSubContaForn := _Cds.FieldByName('CODSUBCONTA').AsFloat;
     iUnidNegocForn:= _Cds.FieldByName('UNIDNEGOC').AsFloat;
     iPlanoForn    := _Cds.FieldByName('PLANO').AsFloat;


     // Segregação e Múltiplas Contas de Baixa (Início)
     iIdSegregaCriter := 0;
     rTotalProd := 0;
     FCdsItemNota.First;
     SetLength( aSegregacao, 0 );
     while not FCdsItemNota.EOF do
     begin

        //Totaliza o valor dos produtos
        rTotalProd := rTotalProd + ( FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat * FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat );

        //Recupera a conta contábil do item (D)
        _Cds.Close;
        _Cds.Data := _IntegracaoContabil.PegaContaContab( Trunc(IdPessoa),
                                                          FCdsItemNota.FieldByName('CODARTIGO').AsString,
                                                          FCdsItemNota.FieldByName('CODCENTROCUSTO').AsString,
                                                          Modulo.iCodAlmoxa,
                                                          FCdsItemNota.FieldByName('CODGRUPOPROD').AsString );

       if FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'C' then
         sContaContabil := _Cds.FieldByName('CONTASAIDA').AsString
       else
         sContaContabil := _Cds.FieldByName('CONTAENTRADA').AsString;

       //Recupera o IDSEGREGACRITER referente à conta contábil do item (D)
       iIdSegregaCriter := _Segregacao.RetornaSegregaCriter( _cds.FieldByName('PLANO').AsInteger,
                                                             FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                                                             FCdsItemNota.FieldByName('IDPATRO').AsInteger,
                                                             sContaContabil,
                                                             sAux );
       _Cds.Close;

       //Caso não tenha recuperado nenhum critério, recupera o IDSEGREGACRITER referente ao fornecedor (C)
       if iIdSegregaCriter = -1 then
         iIdSegregaCriter := _Segregacao.RetornaSegregaCriter( trunc( iPlanoForn ),
                                                               FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                                                               FCdsItemNota.FieldByName('IDPATRO').AsInteger,
                                                               sContaForn,
                                                               sAux );

       //Preenche o array de critérios de segregação totalizando por critério

       //Verifica se o critério já está no array...
       //(-1) indica que o critério ainda não foi incluído
       item := -1;
       for i := 0 to High( aSegregacao ) do
       begin
         if aSegregacao[i].IdSegregaCriter = iIdSegregaCriter then
         begin
           item := i;
           break;
         end;
       end;

       //Se não encontrou, adiciona o critério ao array...
       if (item = -1) or
          (aSegregacao[item].IdPlanoPrev <> FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger) or
          (aSegregacao[item].IdPatro <> FCdsItemNota.FieldByName('IDPATRO').AsInteger) then
       begin
         SetLength( aSegregacao, length( aSegregacao ) + 1 );
         item := High( aSegregacao );
         aSegregacao[item].IdSegregaCriter := iIdSegregaCriter;
         aSegregacao[item].Total := 0;
         aSegregacao[item].IdPlanoPrev  := FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger;
         aSegregacao[item].IdPatro      := FCdsItemNota.FieldByName('IDPATRO').AsInteger;
       end;

       //Soma o valor atual ao total do respectivo critério
       aSegregacao[item].Total := aSegregacao[item].Total +
                                 ( FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat * FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat );

       //Relaciona ao item o respectivo IDSEGREGACRITER
       FCdsItemNota.Edit;
       FCdsItemNota.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
       FCdsItemNota.Post;

       FCdsItemNota.Next;
     end;

     //Preenche os percentuais dos critérios relativamente ao valor total dos produtos
     for i := 0 to High( aSegregacao ) do
       aSegregacao[i].Percentual := ( aSegregacao[i].Total * 100 ) / rTotalProd;

     //Segregação e Múltiplas Contas de Baixa (Fim)



     //------------------------------------------------------------------------------------------------------
     // Pega a descrição  do tipo de documento
     //------------------------------------------------------------------------------------------------------
     sTipoDoc := FCdsCAP.FieldByName('CODTIPDOC').AsString;
     If Trim( sTipoDoc ) <> '' Then
        Begin
           _Cds.Data    := GetDataPacket('SELECT DESCRICAO FROM TIPODOCRECPAG WHERE CODTIPDOC = '+sTipoDoc);

           sNomeTipoDoc := _Cds.FieldByName('DESCRICAO').AsString;
        End
     Else
        sNomeTipoDoc := '';
     //------------------------------------------------------------------------------------------------------
     // Pega a descrição o número do slip
     //------------------------------------------------------------------------------------------------------
     sNumSlip   := '';
     _cds.Data  := GetDataPacket(' SELECT FLGSLIPAUTO FROM PARAMCAP '+
                                 ' WHERE (RECPAG = ''P'') AND (IDPESSOA = '+FloatToStr(IdPessoa)+')');

     If _cds.FieldByName('FLGSLIPAUTO').AsString = 'S' Then
        _iNumSlip := GetSequence('SLIPDOCUMENTO')
     Else
        _iNumSlip := 0;

     if _iNumSlip <> 0 then
        sNumSlip := FloatToStr(_iNumSlip);
     //------------------------------------------------------------------------------------------------------

     //Verificando Total da Nota
     rTotal         := 0;
     rTotalCusto    := 0;
     rTotalRecup    := 0;
     rTotContaDeb   := 0;
     rTotContaCre   := 0;
     rTotRefCalculo := 0;
     rTotImp        := 0;
     rAbateValor    := 0;
     rAbateVlrCompl := 0;
     //---------------------------------------------------------------------------------------
     // Verifica se o total dos Impostos do Item Bate
     //---------------------------------------------------------------------------------------
     FCdsValTotAgreg.First;
     While Not FCdsValTotAgreg.Eof Do
        Begin
           rValAgregItem  := 0;
           FcdsAgregItemTela.First;
           While  Not FcdsAgregItemTela.Eof Do
              Begin
                 If FCdsValTotAgreg.FieldByName('CODTIPOCUSTAGREG').AsInteger = FcdsAgregItemTela.FieldByName('CODTIPOCUSTAGREG').AsInteger Then
                    rValAgregItem := rValAgregItem + FcdsAgregItemTela.FieldByName('VALOR').AsFloat;

                 FcdsAgregItemTela.Next;
              End;
           If Format('%17.2f',[rValAgregItem]) <> Format('%17.2f',[FCdsValTotAgreg.FieldByName('VLRAGREGADO').AsFloat]) then
              Begin
                  rDifer := (rValAgregItem - FCdsValTotAgreg.FieldByName('VLRAGREGADO').AsFloat);

                  If Not((rDifer >= -MAX_DIFERENCA  ) and (rDifer <= MAX_DIFERENCA)) Then
                     Raise  Exception.Create( Trim(FCdsValTotAgreg.FieldByName('DESCCUSTAGREG').AsString)+ MSG_NAO_CONFERE_VALTOT );
              End;
           FCdsValTotAgreg.Next;
        End;
     //---------------------------------------------------------------------------------------
     FCdsItemNota.First;
     While not FCdsItemNota.EOF do
     Begin
        if not ValidaDadosItem(IntegraLivro) then
           Raise Exception.Create( MessageInfo );

        if FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'C' then
           Begin
              FCdsItemNota.Edit;
              FCdsItemNota.FieldByName('CODALMOXARIFADO').AsInteger:=FCdsItemNota.FieldByName('CODALMOXARIFADOLOGIN').AsInteger;
              FCdsItemNota.Post;
           end;

        rTotal:=rTotal + (FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);
        rTotRefCalculo := rTotRefCalculo + (FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);

        FCdsItemNota.Next;
     end;
     //
     FcdsAgregNotaTela.First;
     While not FcdsAgregNotaTela.EOF do
     Begin
        //
        if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '3') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '4') then
           Begin
              rTotal :=rTotal  + FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
              rTotImp:=rTotImp + FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
           end
        else
           Begin
              if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '6') then
                 rTotal := rTotal - FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
           end;
        //
        _Cds.Data := ListaImposto(IdPessoa,FcdsAgregNotaTela.FieldByName('CODTIPOCUSTAGREG').AsFloat);
        //
        sHistorico := trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                      ' s/ NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                      trim(sNomeForn);

        sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,3,
                                         sHistorico,
                                         [ FCdsNota.FieldByName('NUMNF').AsString,
                                           FCdsNota.FieldByName('COMPLNF').AsString,
                                           _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                           sNomeForn,
                                           sNomeFantForn,
                                           sNumSlip
                                          ]);
        //
        if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '1') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '7') then
        Begin
           if IntegraContab
            and ( not _Cds.IsEmpty ) then
           begin
              { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
              for i := 0 to High( aSegregacao ) do
                InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                _Cds.FieldByName('CODSUBCONTA').AsFloat,'C',_Cds.FieldByName('PLACONTA').AsString,
                                _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                ( FcdsAgregNotaTela.FieldByName('VALOR').AsFloat * aSegregacao[i].Percentual ) / 100,
                                aSegregacao[i].IdSegregaCriter,
                                aSegregacao[i].IdPlanoPrev,
                                aSegregacao[i].IdPatro);
           end;
           if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '7') then
              rAbateValor:=rAbateValor+FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
        end;
        //
        if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '2') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '3') then
        Begin
           rTotalRecup:=rTotalRecup + FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
           FcdsAgregNotaTela.Edit;
           FcdsAgregNotaTela.FieldByName('VLRRECUPERADO').AsFloat:=0;
           FcdsAgregNotaTela.Post;
           //Contabilização dos Agregados da Nota que Recuperam Imposto
           FCdsItemNota.First;
           While not FCdsItemNota.EOF do
           Begin
              rValRef:=(FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);
              if FCdsItemNota.FieldByName('CONSUMOREVENDA').AsString = 'R' then
              Begin
                 rValRecup:=0;
                 if rTotRefCalculo <> 0 then
                    rValRecup:=(FcdsAgregNotaTela.FieldByName('VALOR').AsFloat*rValRef/rTotRefCalculo);
                 //
                 FcdsAgregNotaTela.Edit;
                 FcdsAgregNotaTela.FieldByName('VLRRECUPERADO').AsFloat:=FcdsAgregNotaTela.FieldByName('VLRRECUPERADO').AsFloat+rValRecup;
                 FcdsAgregNotaTela.Post;
                 //
                 if IntegraContab
                    and ( not _Cds.IsEmpty )  then
                 begin
                   { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
                   for i := 0 to High( aSegregacao ) do
                      InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                     _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                     _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                     ( rValRecup * aSegregacao[i].Percentual ) / 100,
                     aSegregacao[i].IdSegregaCriter,
                     aSegregacao[i].IdPlanoPrev,
                     aSegregacao[i].IdPatro);

                 end;
              end;
              FCdsItemNota.Next;
           end;
        end;
        if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '1') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '3') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '4') or
           (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '5') then
           rTotalCusto:=rTotalCusto + FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
        if (FcdsAgregNotaTela.FieldByName('CODTRATFISCE').AsString = '6') then
           rTotalCusto:=rTotalCusto - FcdsAgregNotaTela.FieldByName('VALOR').AsFloat;
        FcdsAgregNotaTela.Next;
     end;
     //
     FCdsAgregNFCompl.First;
     While not FCdsAgregNFCompl.EOF do
     Begin
        //
        _Cds.Data := ListaImposto(IdPessoa,FCdsAgregNFCompl.FieldByName('CODTIPOCUSTAGREG').AsFloat);
        //
        sHistorico:=trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                    ' s/ NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                    trim(sNomeForn);

        sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,3,
                                         sHistorico,
                                         [ FCdsNota.FieldByName('NUMNF').AsString,
                                           FCdsNota.FieldByName('COMPLNF').AsString,
                                           _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                           sNomeForn,
                                           sNomeFantForn,
                                           sNumSlip
                                          ]);
        //
        if (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '1') or
           (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '7') then
        Begin
           if IntegraContab
            and ( not _Cds.IsEmpty ) then
           begin
              { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
              for i := 0 to High( aSegregacao ) do
                InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                _Cds.FieldByName('CODSUBCONTA').AsFloat,'C',_Cds.FieldByName('PLACONTA').AsString,
                                _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                ( FCdsAgregNFCompl.FieldByName('VALOR').AsFloat * aSegregacao[i].Percentual ) / 100,
                                aSegregacao[i].IdSegregaCriter,
                                aSegregacao[i].IdPlanoPrev,
                                aSegregacao[i].IdPatro);

           end;
           //
           if (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '7') then
              rAbateVlrCompl:=rAbateVlrCompl+FCdsAgregNFCompl.FieldByName('VALOR').AsFloat;
        end;
        //
        if (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '2') or
           (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '3') then
        Begin
           rTotalRecup:=rTotalRecup + FCdsAgregNFCompl.FieldByName('VALOR').AsFloat;
           FCdsAgregNFCompl.Edit;
           FCdsAgregNFCompl.FieldByName('VLRRECUPERADO').AsFloat:=0;
           FCdsAgregNFCompl.Post;
           //Contabilização dos Agregados da Nota que Recuperam Imposto
           FCdsItemNota.First;
           While not FCdsItemNota.EOF do
           Begin
              rValRef:=(FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);
              if FCdsItemNota.FieldByName('CONSUMOREVENDA').AsString = 'R' then
              Begin
                 rValRecup:=0;
                 if rTotRefCalculo <> 0 then
                    rValRecup:=(FCdsAgregNFCompl.FieldByName('VALOR').AsFloat*rValRef/rTotRefCalculo);
                 FCdsAgregNFCompl.Edit;
                 FCdsAgregNFCompl.FieldByName('VLRRECUPERADO').AsFloat:=FCdsAgregNFCompl.FieldByName('VLRRECUPERADO').AsFloat+rValRecup;
                 FCdsAgregNFCompl.Post;
                 //
                 if IntegraContab
                  and ( not _Cds.IsEmpty ) then
                 begin
                   { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
                   for i := 0 to High( aSegregacao ) do
                     InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                     _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                                     _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                     ( rValRecup * aSegregacao[i].Percentual ) / 100,
                                     aSegregacao[i].IdSegregaCriter,
                                     aSegregacao[i].IdPlanoPrev,
                                     aSegregacao[i].IdPatro);
                 end;
              end;
              FCdsItemNota.Next;
           end;
        end;
        //
        if (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '1') or
           (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '3') or
           (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '4') or
           (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '5') then
           rTotalCusto:=rTotalCusto + FCdsAgregNFCompl.FieldByName('VALOR').AsFloat;
        //
        if (FCdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '6') then
           rTotalCusto:=rTotalCusto - FCdsAgregNFCompl.FieldByName('VALOR').AsFloat;
        FCdsAgregNFCompl.Next;
     end;
     //
     FcdsAgregItemTela.First;
     While not FcdsAgregItemTela.EOF do
     Begin
        //
        _Cds.Data := ListaImposto(IdPessoa,FcdsAgregItemTela.FieldByName('CODTIPOCUSTAGREG').AsFloat);
        //
        sHistorico:=trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                    ' s/ NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                    trim(sNomeForn);

        sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,3,
                                         sHistorico,
                                         [ FCdsNota.FieldByName('NUMNF').AsString,
                                           FCdsNota.FieldByName('COMPLNF').AsString,
                                           _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                           sNomeForn,
                                           sNomeFantForn,
                                           sNumSlip
                                          ]);

        If (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '7') then
        Begin
           If IntegraContab
            and ( not _Cds.IsEmpty ) then
           begin
              { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
              for i := 0 to High( aSegregacao ) do
                InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                _Cds.FieldByName('CODSUBCONTA').AsFloat,'C',_Cds.FieldByName('PLACONTA').AsString,
                                _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                ( FcdsAgregItemTela.FieldByName('VALOR').AsFloat * aSegregacao[i].Percentual ) / 100,
                                aSegregacao[i].IdSegregaCriter,
                                aSegregacao[i].IdPlanoPrev,
                                aSegregacao[i].IdPatro);
           end;
           //
           rAbateValor:=rAbateValor+FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
        end;
        if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '3') or
           (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '4') then
           rTotal:=rTotal + FcdsAgregItemTela.FieldByName('VALOR').AsFloat;

        if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '6') then
           rTotal:=rTotal - FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
        FcdsAgregItemTela.Next;
     end;
     rDifer := (rTotal - FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat);
     if (rDifer < -0.02) or (rDifer > 0.02) then
        Raise Exception.Create( 'Total de Nota Fiscal não Confere. Verifique. Diferença: '+Format('%17.2f',[rDifer]) );
     //
     sCCustoGrava:=sCCustoForn;
     if sCCustoGrava = '' then
        sCCustoGrava:=sCCustoPadrao;
     iUnidNegGrava:=iUnidNegocForn;
     if iUnidNegGrava = 0 then
        iUnidNegGrava:=iUnidNegocPadrao;

     //Inserindo na Contabilidade o Valor a pagar da Nota
     sHistorico:='Lançamento NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                 trim(sNomeForn);

     sNumOC := '';

      FCdsItemNota.First;
      While not FCdsItemNota.EOF do
         Begin
             If Not FCdsItemNota.FieldByName('NUMOC').IsNull Then
                If sNumOC <> '' Then
                   sNumOC := sNumOC + ', ' + FCdsItemNota.FieldByName('NUMOC').AsString
                Else
                   sNumOC := FCdsItemNota.FieldByName('NUMOC').AsString;

             FCdsItemNota.Next;
         End;

    sHistorico:= GetHistoricoAlmox( _ModeloHist,
                                    Sistema.IdEmpresa,
                                    Sistema.IdModulo,
                                    0,
                                    sHistorico,
                                      [ FCdsNota.FieldByName('NUMNF').AsString,
                                        FCdsNota.FieldByName('COMPLNF').AsString,
                                        sNomeTipoDoc,
                                        sNomeForn,
                                        sNomeFantForn,
                                        sNumSlip,
                                        FCdsNota.FieldByName('DATAVENCTO').AsString,
                                        FCdsNota.FieldByName('DATAEMISNF').AsString,
                                        FcdsCAP.FieldByName('HISTORICOCOMPL').AsString,
                                        sNumOC
                                       ]);
     //
     { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
     if not paramintegra.PartidaDobrada then
       for i := 0 to High( aSegregacao ) do
         InsereCdsContab(iPlanoForn,iUnidNegGrava,iSubContaForn,'C',sContaForn,
                       sCCustoGrava,sHistorico,
                       ( ( FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat - rAbateValor ) * aSegregacao[i].Percentual ) / 100,
                       aSegregacao[i].IdSegregaCriter,
                       aSegregacao[i].IdPlanoPrev,
                       aSegregacao[i].IdPatro);
     //
     //Inserindo na Contabilidade o Valor a pagar da Nota Complementar
     FCdsNFCompl.First;
     While not FCdsNFCompl.EOF do
     Begin
        _Cds.Data := _ListCAPCAR.ListaDadosForn(IdPessoa,FCdsNFCompl.FieldByName('IDFORCLI').AsFloat);
        //
        sCCustoGrava:=_Cds.FieldByName('CODCENTROCUSTO').AsString;
        if sCCustoGrava = '' then
           sCCustoGrava:=sCCustoPadrao;
        //
        iUnidNegGrava:=_Cds.FieldByName('UNIDNEGOC').AsFloat;
        if iUnidNegGrava = 0 then
           iUnidNegGrava:=iUnidNegocPadrao;
        //
        sHistorico:='Lançamento NF. '+trim(FCdsNFCompl.FieldByName('NUMNF').AsString)+'/'+FCdsNFCompl.FieldByName('COMPLNF').AsString+' '+trim(_Cds.FieldByName('RAZAOSOCIAL').AsString);
        //
        sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,2,
                                         sHistorico,
                                         [ FCdsNFCompl.FieldByName('NUMNF').AsString,
                                           FCdsNFCompl.FieldByName('COMPLNF').AsString,
                                           _Cds.FieldByName('RAZAOSOCIAL').AsString,
                                           _Cds.FieldByName('NOME').AsString,
                                           FCdsNota.FieldByName('NUMNF').AsString,
                                           FCdsNota.FieldByName('COMPLNF').AsString,
                                           sNomeTipoDoc,
                                           sNomeForn,
                                           sNomeFantForn,
                                           sNumOC
                                          ]);

        { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
        if not _Cds.IsEmpty then
        begin
          for i := 0 to High( aSegregacao ) do
            InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,iUnidNegGrava,
                            _cds.FieldByName('CODSUBCONTA').AsFloat,'C',
                            _cds.FieldByName('CONTACFORN').AsString,
                            sCCustoGrava,sHistorico,
                            ( ( FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat - rAbateVlrCompl ) * aSegregacao[i].Percentual ) / 100,
                            aSegregacao[i].IdSegregaCriter,
                            aSegregacao[i].IdPlanoPrev,
                            aSegregacao[i].IdPatro);
        end;

        FCdsNFCompl.Next;
     end;
     //
     //Calculando o Valor do Estoque de Cada Item
     sContaEntrada    := '';
     iSubContaEntrada := 0;
     //
     FCdsItemNota.First;
     While not FCdsItemNota.EOF do
     Begin
        rValRef:=(FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);
        rValEstoque:=rValRef;
        if rTotRefCalculo <> 0 then
        Begin
           if (FCdsItemNota.FieldByName('CONSUMOREVENDA').AsString = 'R') then
              rValEstoque:=rValEstoque-(rTotalRecup*rValRef/rTotRefCalculo);
           rValEstoque:=rValEstoque+(rTotalCusto*rValRef/rTotRefCalculo);
        end;
        //
        FcdsAgregItemTela.First;
        While not FcdsAgregItemTela.EOF do
        Begin
           if FcdsAgregItemTela.FieldByName('IDITENSRECDEV').AsInteger = FCdsItemNota.FieldByName('IDITENSRECDEV').AsInteger then
           Begin
              //
              _Cds.Data := ListaImposto(IdPessoa,FcdsAgregItemTela.FieldByName('CODTIPOCUSTAGREG').AsFloat);
              //
              sHistorico:=trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                               ' s/ NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                               trim(sNomeForn);

              sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,3,
                                               sHistorico,
                                               [ FCdsNota.FieldByName('NUMNF').AsString,
                                                 FCdsNota.FieldByName('COMPLNF').AsString,
                                                 _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                                 sNomeForn,
                                                 sNomeFantForn,
                                                 sNumSlip
                                                ]);
              //
              if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '3') or
                 (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '4') then
                 rTotImp:=rTotImp + FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
              //
              if (IntegraContab) and (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '1') then
              Begin
                if not _Cds.IsEmpty then
                begin
                   { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
                   for i := 0 to High( aSegregacao ) do
                     InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                     _cds.FieldByName('CODSUBCONTA').AsFloat,'C',
                                     _cds.FieldByName('PLACONTA').AsString,
                                     _cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                     ( FcdsAgregItemTela.FieldByName('VALOR').AsFloat * aSegregacao[i].Percentual ) / 100,
                                     aSegregacao[i].IdSegregaCriter,
                                     aSegregacao[i].IdPlanoPrev,
                                     aSegregacao[i].IdPatro);
                end;
              end;
              if FCdsItemNota.FieldByName('CONSUMOREVENDA').AsString = 'R' then
              Begin
                 if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '2') or
                    (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '3') then
                 Begin
                    rValEstoque:=rValEstoque-FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
                    FcdsAgregItemTela.Edit;
                    FcdsAgregItemTela.FieldByName('VLRRECUPERADO').AsFloat:=FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
                    FcdsAgregItemTela.Post;
                    //
                    if IntegraContab
                        and ( not _Cds.IsEmpty ) then
                    Begin
                      { Divide proporcionalmente o lançamento por todos os critérios de segregação.}
                      for i := 0 to High( aSegregacao ) do
                        InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                        _cds.FieldByName('CODSUBCONTA').AsFloat,'D',
                                        _cds.FieldByName('PLACONTA').AsString,
                                         _cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                        ( FcdsAgregItemTela.FieldByName('VALOR').AsFloat * aSegregacao[i].Percentual ) / 100,
                                        aSegregacao[i].IdSegregaCriter,
                                        aSegregacao[i].IdPlanoPrev,
                                        aSegregacao[i].IdPatro);
                    end;
                 end;
              end;
              if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '1') or
                 (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '3') or
                 (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '4') or
                 (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '5') then
                 rValEstoque:=rValEstoque + FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
              if (FcdsAgregItemTela.FieldByName('CODTRATFISCE').AsString = '6') then
                 rValEstoque:=rValEstoque - FcdsAgregItemTela.FieldByName('VALOR').AsFloat;
           end;
           FcdsAgregItemTela.Next;
        end;
        FCdsItemNota.Edit;
        FCdsItemNota.FieldByName('VLRESTOQUE').AsFloat:=rValEstoque;
        FCdsItemNota.Post;
        _Cds.Data := _IntegracaoContabil.PegaContaContab(Trunc(IdPessoa), FCdsItemNota.FieldByName('CODARTIGO').AsString,
                                                         FCdsItemNota.FieldByName('CODCENTROCUSTO').AsString,
                                                         Modulo.iCodAlmoxa,
                                                         FCdsItemNota.FieldByName('CODGRUPOPROD').AsString);
        if FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'C' then
           begin
              sContaEntrada    := _Cds.FieldByName('CONTASAIDA').AsString;
              iSubContaEntrada := _Cds.FieldByName('SUBCONTASAIDA').AsInteger;
           end
        else
           begin
              sContaEntrada    := _Cds.FieldByName('CONTAENTRADA').AsString;
              iSubContaEntrada := _Cds.FieldByName('SUBCONTAENTRADA').AsInteger;
           end;
        sHistorico:='Lançamento NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+
                     trim(sNomeForn);

        sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,Sistema.IdModulo,0,
                                         sHistorico,
                                         [ FCdsNota.FieldByName('NUMNF').AsString,
                                           FCdsNota.FieldByName('COMPLNF').AsString,
                                           sNomeTipoDoc,
                                           sNomeForn,
                                           sNomeFantForn,
                                           sNumSlip,
                                           FCdsNota.FieldByName('DATAVENCTO').AsString,
                                           FCdsNota.FieldByName('DATAEMISNF').AsString,
                                           FcdsCAP.FieldByName('HISTORICOCOMPL').AsString,
                                           sNumOC
                                          ]);


        sCCustoGrava:=FCdsItemNota.FieldByName('CODCENTROCUSTO').AsString;
        if sCCustoGrava = '' Then
           sCCustoGrava:=sCCustoPadrao;
        //
        { Indica o critério de segregação utilizado.}
       if not _Cds.IsEmpty  then
       begin
         InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                         iSubContaEntrada,'D', sContaEntrada, sCCustoGrava,sHistorico,
                         rValEstoque,
                         FCdsItemNota.FieldByName('IDSEGREGACRITER').AsFloat,
                         FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                         FCdsItemNota.FieldByName('IDPATRO').AsInteger);
       if paramintegra.PartidaDobrada then
       begin
         InsereCdsContab(iPlanoForn,iUnidNegGrava,iSubContaForn,'C',sContaForn,
                         sCCustoGrava,sHistorico,
                         rValEstoque,
                         FCdsItemNota.FieldByName('IDSEGREGACRITER').AsFloat,
                         FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                         FCdsItemNota.FieldByName('IDPATRO').AsInteger);
       end;

       end;
        //
        FCdsItemNota.Next;
     end;
     //
     If IntegraContab then
        Begin
           FCdsContab.First;
           While not FCdsContab.EOF do
           Begin
              if FCdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
                 rTotContaDeb:=rTotContaDeb+FCdsContab.FieldByName('LACVALOR').AsFloat
              else
                 rTotContaCre:=rTotContaCre+FCdsContab.FieldByName('LACVALOR').AsFloat;
              FCdsContab.Next;
           end;
           if (Format('%17.2f',[rTotContaDeb]) <> Format('%17.2f',[rTotContaCre])) then
           begin
              rDifer:=(rTotContaCre - rTotContaDeb);
              if (rDifer >= -0.02) and (rDifer <= 0.02) then
                 Begin
                    { Seta o último critério de segregação para a diferença de centavos.}
                    if not _Cds.IsEmpty  then
                      InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                      iSubContaEntrada,'D', sContaEntrada, sCCustoGrava,sHistorico,
                                      rDifer,
                                      iIdSegregaCriter,
                                      FCdsItemNota.FieldByName('IDPLANOPREV').AsInteger,
                                      FCdsItemNota.FieldByName('IDPATRO').AsInteger);
                    //
                    FCdsItemNota.Edit;
                    FCdsItemNota.FieldByName('VLRESTOQUE').AsFloat:=FCdsItemNota.FieldByName('VLRESTOQUE').AsFloat+rDifer;
                    FCdsItemNota.Post;
                    //
                 end
              else
                 Begin
                    Raise Exception.Create('Débito não bateu com o crédito na contabilização. Provavelmente existe algum cadastro sem conta ou o cadastro de custos agregados não foi feito de maneira correta. Verifique. Diferença: '+Format('%17.2f',[rDifer]) );
                 end;
           end;
        end;
   Except
     On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
   end;
end;




function TCtrlRecebMerc.ListaImposto(IdPessoa,
  CodCustAgreg: Double): OleVariant;
Var sSql : String;
begin
   sSql := 'SELECT T.DESCCUSTAGREG,C.CODCENTROCUSTO,C.CODSUBCONTA, '+
           '       C.PLACONTA,C.UNIDNEGOC,C.PLANO '+
           'FROM TIPOAGRE T,TIPCUSTAGREGCONTA C '+
           'WHERE (C.CODTIPOCUSTAGREG = '+FloatToStr(CodCustAgreg)+')'+
           '  AND (C.IDPESSOA = '+FloatToStr(IdPessoa)+') '+
           '  AND (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
   Result := GetDataPacket(sSql);
end;




function TCtrlRecebMerc.InsereCdsContab(iPlano, UnidNegoc, CodSubConta: Double; sDebCre, sConta, sCentroCusto,
                                        sHistorico: String; Valor: Double;
                                        { Parâmetros necessários à segregação e múltiplas contas de baixa.}
                                        iIdSegregaCriter : double; iIdPlanoPrev, iIdPatro : Integer) : Boolean;
begin
   Result := True;
   FCdsContab.First;
   While (not FCdsContab.Eof) do
   Begin
      if
         (Trim(FCdsContab.FieldByName('PLACONTA').AsString) = Trim(sConta)) AND
         (Trim(FCdsContab.FieldByName('CODCENTROCUSTO').AsString)= Trim(sCentroCusto)) AND
         (FCdsContab.FieldByName('UNIDNEGOC').AsFloat = UnidNegoc) AND
         (FCdsContab.FieldByName('CODSUBCONTA').AsFloat = CodSubConta) AND
         (FCdsContab.FieldByName('LACDEBCRE').AsString = sDebCre) AND
         (Trim(FCdsContab.FieldByName('HISTORICO').AsString) = Trim(sHistorico) ) AND
         { Faz a contabilização por critério de segregação.}
         ( FCdsContab.FieldByName('IDSEGREGACRITER').AsFloat = iIdSegregaCriter )
         AND ( FCdsContab.FieldByName('IDPLANOPREV').AsInteger   = iIdPlanoPrev ) AND
         ( FCdsContab.FieldByName('IDPATRO').AsInteger       = iIdPatro )

         then
      Begin
         FCdsContab.Edit;
         FCdsContab.FieldByName('LACVALOR').AsFloat := FCdsContab.FieldByName('LACVALOR').AsFloat + Valor;
         FCdsContab.Post;
         exit;
      End;
      FCdsContab.Next;
   End;
   FCdsContab.Append;
   FCdsContab.FieldByName('PLACONTA').AsString       := sConta;
   FCdsContab.FieldByName('PLANO').AsFloat           := iPlano;
   FCdsContab.FieldByName('CODCENTROCUSTO').AsString := sCentroCusto;
   FCdsContab.FieldByName('UNIDNEGOC').AsFloat       := UnidNegoc;

   { Arredonda para não dar valores "quebrados".}
   FCdsContab.FieldByName('LACVALOR').AsFloat        := StrToFloat( FormatFloat( '#0.00', Valor ) );

   FCdsContab.FieldByName('HISTORICO').AsString      := sHistorico;
   FCdsContab.FieldByName('LACNUMDOC').AsString      := trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString);
   FCdsContab.FieldByName('LACDEBCRE').AsString      := sDebCre;
   FCdsContab.FieldByName('CODSUBCONTA').AsFloat     := CodSubConta;

   { Indica o critério de segregação do lançamento.}
   FCdsContab.FieldByName('IDSEGREGACRITER').AsFloat := iIdSegregaCriter;

   FCdsContab.FieldByName('IDPLANOPREV').AsInteger   := iIdPlanoPrev;
   FCdsContab.FieldByName('IDPATRO').AsInteger       := iIdPatro;

   If sDebCre = 'D' then
      FCdsContab.FieldByName('LACTIPO').AsString := '0'
   Else
      FCdsContab.FieldByName('LACTIPO').AsString := '1';
   FCdsContab.Post;
end;




procedure TCtrlRecebMerc.SetCdsAgregNFCompl(const Value: TClientDataSet);
begin
  FCdsAgregNFCompl := Value;
end;

function TCtrlRecebMerc.ListChecaValorTotal: OleVariant;
Var
   SQL : String;
begin
   SQL := 'SELECT T.CODTIPOCUSTAGREG,T.DESCCUSTAGREG,A.VLRAGREGADO '+
          ' FROM TIPOAGRE T,AGRITENSRECDEV A '+
          ' WHERE ' +
          '     (A.IDAGRITENSRECDEV(+) = 0 ) '+
          ' AND (T.FLGINCIDERECEB = ''S'')   '+
          ' AND (T.TOTALITEM = ''I'')        '+
          ' AND (T.FLGCHECATOTAL = ''S'')    '+
          ' AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))';

  Result := GetDataPacket( SQL );
end;




function TCtrlRecebMerc.ListAgregNFComplementar(
  IdNFRecebDevol: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spListAgregNFCompl.Prepare;
         spListAgregNFCompl.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spListAgregNFCompl.Data;
      End;
end;




function TCtrlRecebMerc.GetAgregItem(IdNFRecebDevol : Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spGetAgregItem.Prepare;
         spGetAgregItem.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spGetAgregItem.Data;
      End;
end;




function TCtrlRecebMerc.GetAgregNota(IdNFRecebDevol: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spGetAgregNota.Prepare;
         spGetAgregNota.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spGetAgregNota.Data;
      End;

end;




function TCtrlRecebMerc.GetAgregItemForItem(
  IdNFRecebDevol: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spGetAgregItemForItem.Prepare;
         spGetAgregItemForItem.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spGetAgregItemForItem.Data;
      End;

end;




procedure TCtrlRecebMerc.SetCdsValTotAgreg(const Value: TClientDataSet);
begin
  FCdsValTotAgreg := Value;
end;




function TCtrlRecebMerc.ProcessaItemNota(IdItensRecDev, IdUsuario : Double; bERecebimentoComOC: boolean ): Boolean;
Var
   IdMovEntrada : Double;
   IdMov        : Double;
   SQL          : String;
begin
   Result := True;
   Try
        //-------------------------------------------------------------------------------------------------------------------
        // Baixa  a Solicitação de Compra
        //-------------------------------------------------------------------------------------------------------------------
        If Not BaixaSCI( FCdsNota.FieldByName('IDPESSOA').AsInteger,
                         IdItensRecDev,
                         // Não estava sendo passado o almoxarifado, por isso a query nao retornava
                         // itens a serem baixados na SCI e a quantidade pendente ficava igual a
                         // quantidade pedida
                         Modulo.IcodAlmoxa,


                         FCdsItemNota.FieldByName('CODARTIGO').AsString,
                         FCdsItemNota.FieldByName('UNIDNEGOC').AsInteger,
                         FCdsItemNota.FieldByName('CODCENTRORESPON').AsString,
                         FCdsItemNota.FieldByName('IDPRODVARI').AsInteger,
                         Not FCdsItemNota.FieldByName('NUMOC').IsNull )
        Then
           Raise Exception.Create( MessageInfo );
        //-------------------------------------------------------------------------------------------------------------------
        // Gera OC Automática ou Baixa OC
        //-------------------------------------------------------------------------------------------------------------------

         if bERecebimentoComOC then
         begin
            If Not FCdsItemNota.FieldByName('NUMOC').IsNull Then
            Begin
               If Not BaixaOC(FCdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat, FCdsItemNota.FieldByName('FLGPARCTOT').AsString ) Then
                  Raise Exception.Create( MessageInfo );

              //-------------------------------------------------------------------
              // Exclui a Previsão no Contas a Pagar
              //-------------------------------------------------------------------
              IF Not _OC.DeletaPrevisaoCAP(FCdsNota.FieldByName('IDPESSOA').AsInteger,FCdsItemNota.FieldByName('NUMOC').AsInteger) Then
                 Raise Exception.Create(_OC.MessageInfo );

            End;
         end;




        //-------------------------------------------------------------------------------------------------------------------
        // Atualiza o valor de última compra
        //-------------------------------------------------------------------------------------------------------------------
           If Not AtualizaValUltCompra( FCdsItemNota.FieldByName('CODARTIGO').AsString,
                                        FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat)
           Then
              Raise Exception.Create( MessageInfo );

        //-------------------------------------------------------------------------------------------------------------------
        // Gera a Movimentação de Estoque
        //-------------------------------------------------------------------------------------------------------------------
        IdMovEntrada := 0;
        If FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'E' Then
           Begin
              IdMovEntrada := _MovEstoque.GeraMovimento(tlEntrada,
                                                        _dbNota.IDPESSOA.AsInteger,
                                                        _dbItemNota.VLRESTOQUE.AsFloat,
                                                        _dbItemNota.QTDERECEBDEVOL.AsFloat,
                                                        FCdsItemNota.FieldByName('CODCUSTEIO').AsInteger,
                                                        _dbItemNota.CODALMOXARIFADO.AsInteger,
                                                        _dbItemNota.CODARTIGO.AsString,
                                                        '',
                                                        'A',
                                                        _dbItemNota.CODMEDIDA.AsString,
                                                        _dbItemNota.DATAVALIDADE.AsDateTime,
                                                        _dbNota.DATAENTDEVOL.AsDateTime,
                                                        _dbNota.NUMNF.AsString+'/'+_dbNota.COMPLNF.AsString,
                                                        '',
                                                        -1,
                                                        -1,
                                                        _dbItemNota.UNIDNEGOC.AsInteger);
               If IdMovEntrada < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
           End;
        If FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'C' Then
           Begin
              IdMovEntrada := _MovEstoque.GeraMovimento(tlEntradaCusto,
                                                        _dbNota.IDPESSOA.AsInteger,
                                                        _dbItemNota.VLRESTOQUE.AsFloat,
                                                        _dbItemNota.QTDERECEBDEVOL.AsFloat,
                                                        Modulo.iCodCusteio,
                                                        Modulo.iCodAlmoxa,
                                                        _dbItemNota.CODARTIGO.AsString,
                                                        '',
                                                        'A',
                                                        _dbItemNota.CODMEDIDA.AsString,
                                                        _dbItemNota.DATAVALIDADE.AsDateTime,
                                                        _dbNota.DATAENTDEVOL.AsDateTime,
                                                        _dbNota.NUMNF.AsString+'/'+_dbNota.COMPLNF.AsString,
                                                        '',
                                                        -1,
                                                        -1,
                                                        _dbItemNota.UNIDNEGOC.AsInteger);
               If IdMovEntrada < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
              //------------------------------------------------------------------------------------------------------------
              // Entrada direta para custo
              //------------------------------------------------------------------------------------------------------------
               IdMov :=  _MovEstoque.GeraMovimento(tlSaida,
                                                   _dbNota.IDPESSOA.AsInteger,
                                                   // Os valores abaixo estavam sendo passados já multiplicados por (-1)
                                                   // Dentro da GeraMovimento, há um if que verifica se é saída e
                                                   //   novamente multiplica por (-1)
                                                   _dbItemNota.VLRESTOQUE.AsFloat,
                                                   _dbItemNota.QTDERECEBDEVOL.AsFloat,
                                                   Modulo.iCodCusteio,
                                                   Modulo.iCodAlmoxa,
                                                   _dbItemNota.CODARTIGO.AsString,
                                                   '',
                                                   'E',
                                                   _dbItemNota.CODMEDIDA.AsString,
                                                   _dbItemNota.DATAVALIDADE.AsDateTime,
                                                   _dbNota.DATAENTDEVOL.AsDateTime,
                                                   _dbNota.NUMNF.AsString+'/'+_dbNota.COMPLNF.AsString,
                                                   _dbItemNota.CODCENTROCUSTO.AsString,
                                                   _dbNota.IDPESSOA.AsInteger,
                                                   -1,
                                                   _dbItemNota.UNIDNEGOC.AsInteger);
               If IdMov < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

               If Not _MovEstoque.UpdMovimento(IdMov,IdMovEntrada,Trunc(plnCodigo)) Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

           End;

           If FCdsItemNota.FieldByName('FLGDESTINO').AsString <> 'A' Then
              Begin
                 SQL := ' UPDATE ITENSRECEBDEVOL SET IDMOV = '+ FloatToStr(IdMovEntrada)+
                        ' WHERE (IDITENSRECDEV = '+FloatToStr(IdItensRecDev)+')';
                 If Not ExecSQL (SQL,True) Then
                    Raise Exception.Create( MessageInfo );
              End;

           //------------------------------------------------------------------------------------------------------------
           // Atualiza os Impostos do Item com o ID verdadeiro
           //------------------------------------------------------------------------------------------------------------
           Try
             FcdsAgregItemTela.Filter := 'IDITENSRECDEV ='+FCdsItemNota.FieldByName('IDITENSRECDEV').AsString;
             FcdsAgregItemTela.Filtered := True;
             FcdsAgregItemTela.First;
             While Not FcdsAgregItemTela.Eof Do
                Begin
                   FcdsAgregItemTela.Edit;
                   FcdsAgregItemTela.FieldByName('IDITENSRECDEV').AsFloat := IdItensRecDev;
                   FcdsAgregItemTela.Post;
                   //---------------------------------------------------------------------
                   // Não pode colocar o NEXT pois estamos filtrando os registros
                   // então ao efetuar o POST, o registro some.
                   //---------------------------------------------------------------------
                End;
           Finally
              FcdsAgregItemTela.Filter   := '';
              FcdsAgregItemTela.Filtered := False;
           End;
          //------------------------------------------------------------------------------------------------------------
          // Atualiza os dados do Ativo Fixo com o ID verdadeiro
          //------------------------------------------------------------------------------------------------------------
           If FCdsItemNota.FieldByName('FLGDESTINO').AsString = 'A' Then
              Begin
                 Try
                   FCdsAtivoFixo.Filter := 'IDITENSRECDEV ='+FCdsItemNota.FieldByName('IDITENSRECDEV').AsString;
                   FCdsAtivoFixo.Filtered := True;
                   FCdsAtivoFixo.First;
                   While Not FCdsAtivoFixo.Eof Do
                      Begin
                         FCdsAtivoFixo.Edit;
                         FCdsAtivoFixo.FieldByName('IDITENSRECDEV').AsFloat := IdItensRecDev;
                         FCdsAtivoFixo.Post;
                         //---------------------------------------------------------------------
                         // Não pode colocar o NEXT pois estamos filtrando os registros
                         // então ao efetuar o POST, o registro some.
                         //---------------------------------------------------------------------
                      End;
                 Finally
                    FCdsAtivoFixo.Filter   := '';
                    FCdsAtivoFixo.Filtered := False;
                 End;
              End;

           //------------------------------------------------------------------------------------------------------------
           // Efetiva o Compromisso Orcamentário
           //------------------------------------------------------------------------------------------------------------
           If Not FCdsItemNota.FieldByName('IDRESERVAORCAMEN').IsNull Then
              Begin
                 _Orcamento.IdEmpresa := FCdsNota.FieldByName('IDPESSOA').AsInteger;
                 _Orcamento.IdUsuario := Trunc(IdUsuario);
                 If _Orcamento.EfetivaCompromisso(_Orcamento.BuscaIdNumReserva(FCdsItemNota.FieldByName('IDRESERVAORCAMEN').AsInteger,0,False),
                    FCdsItemNota.FieldByName('VLRESTOQUE').AsFloat,True) <> 0
                 Then
                    Raise Exception.Create( _Orcamento.MessageInfo );
              End;
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;




function TCtrlRecebMerc.Alterar(IdPessoa: Integer; IdNFRecebDevol: Double;
  UsaPlanoPrev, IntegraCAP, IntegraContab, IntegraLivro: Boolean; IdModulo,
  IdUsuario, IdEspAcesso, IdPatro, IdPlanoPrev, IdPrograma,
  iUnidNegocPadrao: Double; ERecebimentoComOC, EnglobaParcela : Boolean;
  sCCustoPadrao: String): Boolean;

var
   sSQLAux: string;


begin
  OldTransaction := Self.OpenTransaction;
  Result := True;
  If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AlterarRecebMerc(IdPessoa, IdNFRecebDevol,UsaPlanoPrev,
                                                         IntegraCAP,IntegraContab,IntegraLivro,
                                                         IdUsuario,IdEspAcesso,IdPatro,
                                                         IdPlanoPrev,IdPrograma,iUnidNegocPadrao,
                                                         ERecebimentoComOC, EnglobaParcela,sCCustoPadrao,
                                                         FcdsNota.Data,
                                                         FcdsItemNota.Data,
                                                         FcdsAgregItemTela.Data,
                                                         FcdsAgregNotaTela.Data,
                                                         FCdsCAP.Data,
                                                         FCdsNFCompl.Data,
                                                         FCdsContab.Data,
                                                         FCdsAgregNFCompl.Data ,
                                                         FCdsValTotAgreg.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Self.OpenTransaction := False;

            //----------------------------------------------------------------------------
            // Para gerar as novas OC´s automáticas pois as antigas foram canceladas
            //----------------------------------------------------------------------------
            FCdsItemNota.First;

            if not ERecebimentoComOC then
            begin

               While Not FCdsItemNota.Eof Do
               Begin
                  FCdsItemNota.Edit;
                  FCdsItemNota.FieldByName('NUMOC').Clear;
                  FCdsItemNota.Post;
                  FCdsItemNota.Next;
               End;

            end;

            FcdsItemNota.First;
            while not FcdsItemNota.Eof do
            begin
               sSQLAux :=  ' UPDATE '            +
                           '    ITEMSOLI '       +
                           ' SET '               +
                           '    QTDEPENDENTE = ' + FloatToStr(FcdsItemNota.FieldByName('QTDERECEBDEVOL').OldValue +
                                                              FcdsItemNota.FieldByName('QTDEPENDENTE').AsFloat    -
                                                              FcdsItemNota.FieldByName('QTDERECEBDEVOL').NewValue) +
                           ' WHERE '             +
                           '    NUMSOLCOMPRA = ' + FcdsItemNota.FieldByName('NUMSOLCOMPRA').AsString;

               if not ExecSQL(sSQLAux) then
                  raise Exception.Create('Não foi possível atualizar a quantidade pendente do produto ' + FcdsItemNota.FieldByName('DESCPROD').AsString  );

               FcdsItemNota.Next;
            end;




            //----------------------------------------------------------------------------
            // Exclui a nota para inseri-la de novo
            //----------------------------------------------------------------------------
            If Not Excluir( IdNFRecebDevol, IdEspAcesso, IdUsuario, UsaPlanoPrev ) Then
               Raise Exception.Create( MessageInfo );
            //----------------------------------------------------------------------------
            // Inseri a Nota
            //----------------------------------------------------------------------------
            IF Not Gravar( IdPessoa,
                           UsaPlanoPrev,
                           IntegraCAP,
                           IntegraContab,
                           IntegraLivro,
                           IdModulo,
                           IdUsuario,
                           IdEspAcesso,
                           IdPatro,
                           IdPlanoPrev,
                           IdPrograma,
                           iUnidNegocPadrao,
                           ERecebimentoComOC,
                           EnglobaParcela,
                           sCCustoPadrao )
            Then
               Raise Exception.Create( MessageInfo );

            Self.OpenTransaction := OldTransaction;
            Commit;


            FIdNFRecebDevol := _dbNota.IDNFRECEBDEVOL.AsFloat;

         Except
            On E:Exception Do
             Begin
                Self.OpenTransaction := OldTransaction;
                Rollback;
                Result := False;
                MessageInfo := E.Message;
             End;
         End;
      End;
end;




function TCtrlRecebMerc.GravaNotaCompl(IdPessoa: Double; IntegraCAP: Boolean;
IdUsuario, IdEspAcesso, IdPatro, IdPlanoPrev, IdPrograma, IdPlnCodigo,rAbateValor,
rTotImp, rTotRefCalculo : Double; bEnglobaParcela, bUsaPlanoPatro,IntegraContab : Boolean) : Boolean;
Var
   sOperacao  : String;
   rValorLanc : Double;
   rValRef    : Double;

    { Variáveis necessárias à segregação e múltiplas contas de baixa.}
    bMultiplasContasBaixa : boolean;
   _IdSegregaCriter : integer;
begin
   Result := True;
   Try
      FCdsNFCompl.First;
      while Not FCdsNFCompl.Eof do
         Begin
            If Not IsFloatZero(FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat) Then
               Begin
                  //--------------------------------------------------------------------------------------
                  // Faz a Integração com o contas a pagar
                  //--------------------------------------------------------------------------------------
                  If IntegraCAP Then
                     Begin

                        sOperacao := '2 ';
                        _Documento.Prepare(OpDocumento,odlEfetivo,sdocAberto);

                        _Documento.IdEspAcesso := IdEspAcesso;
                        _Documento.IdUsuario   := IdUsuario;
                        _Documento.IdModulo    := Sistema.IdModulo;
                        //

                        { Verifica se haverá múltiplas contas de baixa (recuperando, ainda, o último critério recuperado.}
                        bMultiplasContasBaixa := MultiplasContasBaixa( _IdSegregaCriter );

                        _Documento.SetValues(0,FCdsNFCompl.FieldByName('NUMNF').AsFloat,FCdsNFCompl.FieldByName('COMPLNF').AsString,'',
                                             'P',sOperacao,'','','','','','','','','','','','',
                                             FCdsNFCompl.FieldByName('DATAVENCTO').asDateTime,FCdsNFCompl.FieldByName('DATAENTDEVOL').asDateTime,
                                             FCdsNFCompl.FieldByName('DATAVENCTO').asDateTime,0,0,0,0,0,0,0,0,FCdsCAP.FieldByName('CODTIPDOC').AsInteger,
                                             Trunc(IdPessoa),Sistema.IdModulo,FCdsNFCompl.FieldByName('IDFORCLI').AsInteger,
                                             0,0, 0,0,0,0,0,0,0,Trunc(_Documento.IdUsuario),Trunc(IdPessoa),0,0,0,0,0,0,0,
                                             _IdSegregaCriter );
                        //
                        _Documento.Lanctodocum.SetValues(FCdsNFCompl.FieldByName('DATAENTDEVOL').asDateTime,0,0,
                                                         (FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor-rTotImp),0,
                                                         FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor,
                                                         0,trunc(IdPlnCodigo),0,trunc(_Documento.IdUsuario),
                                                         FCdsNFCompl.FieldByName('IDPESSOA').AsInteger,0,0,0,0,0,sOperacao,
                                                         '','','','','','','','C', Sistema.IdModulo, 0, bUsaPlanoPatro);

                        FcdsItemNota.First;
                        While not FcdsItemNota.Eof Do
                           Begin
                              rValRef := (FCdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat*FCdsItemNota.FieldByName('VLRUNITARIO').AsFloat);

                              rValorLanc  := 0;
                              if rTotRefCalculo <> 0 then
                                 rValorLanc :=(((FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor)*rValRef)/rTotRefCalculo);
                              rValorLanc:= StrToFloat(Format('%17.2f',[rValorLanc]));

                              _Documento.Rateiodocum.SetValues(rValorLanc,0,0,0,Trunc(IdPessoa),0,
                                                              FCdsItemNota.FieldByName('UNIDNEGOC').AsInteger,0, Trunc(_Documento.IdUsuario),0,0,
                                                              Trunc(IdPlanoPrev),
                                                              Trunc(IdPatro),
                                                              Trunc(IdPrograma),0,
                                                              Trunc(IdPessoa),FcdsItemNota.FieldByName('CODTIPRECDES').AsString,
                                                              'P',FcdsItemNota.FieldByName('CODCENTRORESPON').AsString,
                                                              FcdsItemNota.FieldByName('CODCENTROCUSTO').AsString,'');

                              FcdsItemNota.Next;
                           End;

                        If Not _Documento.Insert Then
                           Raise Exception.Create( _Documento.MessageInfo );

                        _ImpostoRetido.IdEmpresa         := Trunc(IdPessoa);
                        _ImpostoRetido.RecPag            := 'P';
                        _ImpostoRetido.DataProgramada    := FCdsNFCompl.FieldByName('DATAVENCTO').AsDateTime;
                        _ImpostoRetido.OperacaoDocumento := sOperacao;
                        _ImpostoRetido.IdForCli          := FCdsNFCompl.FieldByName('IDFORCLI').AsInteger;
                        _ImpostoRetido.CodDocumento      := Trunc(_Documento.CodDocumento);
                        _ImpostoRetido.NumLancto         := _Documento.Lanctodocum.NumLancto;
                        _ImpostoRetido.ValorLancto       := (FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat -rAbateValor);
                        _ImpostoRetido.ValorLiquido      := (FCdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor-rTotImp);
                        _ImpostoRetido.DataLancto        := FCdsNFCompl.FieldByName('DATAENTDEVOL').AsDateTime;
                        _ImpostoRetido.DataEmissao       := FCdsNFCompl.FieldByName('DATAEMISNF').AsDateTime;
                        _ImpostoRetido.CodTipoDoc        := FCdsCAP.FieldByName('CODTIPDOC').AsInteger;
                        _ImpostoRetido.IntegraContab     := IntegraContab;
                        _ImpostoRetido.IdModulo          := Sistema.IdModulo;
                        _ImpostoRetido.IdUsuario         := Trunc(IdUsuario);
                        _ImpostoRetido.Incluir;

                     End;
                  //--------------------------------------------------------------------------------------
                  // Faz a inclusão da nota complementar propriamente dita
                  //--------------------------------------------------------------------------------------
                  CdsToDbObject(FCdsNFCompl,_dbNota);

                  _dbNota.CODDOCUMENTO.AsFloat   := _Documento.CodDocumento;
                  _dbNota.PLNCODIGO.AsFloat      := plnCodigo;
                  _dbNota.FLGTIPONOTA.AsString   := 'A';
                  _dbNota.IDPESSOA.AsFloat       := IdPessoa;
                  _dbNota.IDNFREFERENCIA.AsFloat := FIdNFRecebDevol;

                  If Not _dbNota.Insert Then
                     Raise Exception.Create( _dbNota.MessageInfo );

                  //--------------------------------------------------------------------------------------
                  // Faz a inclusão dos impostos da a nota complementar
                  //--------------------------------------------------------------------------------------
                  FCdsAgregNFCompl.First;
                  While Not FCdsAgregNFCompl.Eof Do
                     Begin
                         If FCdsAgregNFCompl.FieldByName('VALOR').AsFloat <> 0 Then
                            Begin
                               _dbAgregNota.IDNFRECEBDEVOL.AsFloat    := _dbNota.IDNFRECEBDEVOL.AsFloat;
                               _dbAgregNota.CODTIPOCUSTAGREG.AsFloat  := FCdsAgregNFCompl.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                               _dbAgregNota.ALIQUOTA.AsFloat          := FCdsAgregNFCompl.FieldByName('PERCENT').AsFloat;
                               _dbAgregNota.BASECALCULO.AsFloat       := FCdsAgregNFCompl.FieldByName('VALOR').AsFloat;
                               _dbAgregNota.VLRAGREGADO.AsFloat       := FCdsAgregNFCompl.FieldByName('BASE').AsFloat;
                               _dbAgregNota.VLRRECUPERADO.AsFloat     := FCdsAgregNFCompl.FieldByName('VLRRECUPERADO').AsFloat;

                               If Not _dbAgregNota.Insert Then
                                  Raise Exception.Create( _dbAgregNota.MessageInfo );
                            End;
                         FCdsAgregNFCompl.Next;
                     End;
               End;

            FCdsNFCompl.Next;
         End;
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;




function TCtrlRecebMerc.MontaClassFiscal(IdPessoa,
  IdForCli: Double): String;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Add('SELECT DECODE(SUM(IDESTADO),SUM(ESTADOFORN),''1'',''2'') AS CODIGO ');
      SQL.Add('FROM                                        ');
      SQL.Add('(SELECT CI.IDESTADO AS IDESTADO,            ');
      SQL.Add('       (0) AS ESTADOFORN                    ');
      SQL.Add(' FROM  PESSOA P,                            ');
      SQL.Add('       EndPess EN,                          ');
      SQL.Add('       CIDADES CI                           ');
      SQL.Add(' WHERE                                      ');
      SQL.Add('      (P.IDPESSOA = '+FloatToStr(IdPessoa)+') ');
      SQL.Add('  AND (P.IDENDCOMERCIAL = EN.IDENDERECO)    ');
      SQL.Add('  AND (EN.IDCIDADES = CI.IDCIDADES)         ');
      SQL.Add(' UNION                                      ');
      SQL.Add(' SELECT (0) AS IDESTADO,                    ');
      SQL.Add('        CI.IDESTADO AS ESTADOFORN           ');
      SQL.Add(' FROM  PESSOA P,                            ');
      SQL.Add('       EndPess EN,                          ');
      SQL.Add('       CIDADES CI                           ');
      SQL.Add(' WHERE                                      ');
      SQL.Add('      (P.IDPESSOA = '+FloatToStr(IdForCli)+')');
      SQL.Add('  AND (P.IDENDCOMERCIAL = EN.IDENDERECO)    ');
      SQL.Add('  AND (EN.IDCIDADES = CI.IDCIDADES) )       ');

      _Cds.Data := GetDataPacket(SQL.Text);

      Result := _Cds.fieldByName('CODIGO').AsString
  Finally
     SQL.Free;
  End;
end;




procedure TCtrlRecebMerc.SetCdsAtivoFixo(const Value: TClientDataSet);
begin
  FCdsAtivoFixo := Value;
end;




{ Função que indicará se o lançamento do documento atual se dará por múltiplas
  contas de baixa. O parâmetro "receive" trará o último critério verificado.}
function TCtrlRecebMerc.MultiplasContasBaixa( var IdSegregaCriter : integer ) : boolean;
var
  aLista : array of string;
  i : integer;
  sPrimeiro : string;
begin
  Result := False;
  IdSegregaCriter := -1;

  FCdsContab.First;

  while True do
  begin

    if FCdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
    begin
      FCdsContab.Next;
      if FCdsContab.Eof then
        break
      else
        Continue;
    end;

    if sPrimeiro = '' then
      sPrimeiro := FCdsContab.FieldByName('PLACONTA').AsString + ';' +
                   FCdsContab.FieldByName('IDSEGREGACRITER').AsString;

    IdSegregaCriter := FCdsContab.FieldByName('IDSEGREGACRITER').AsInteger;
    FCdsContab.Next;

    if FCdsContab.Eof then exit;

    // contas de débito não devem ser testadas em múltiplas contas de baixa
    if FCdsContab.FieldByName('LACDEBCRE').AsString = 'C' then begin
      if sPrimeiro <> FCdsContab.FieldByName('PLACONTA').AsString + ';' + FCdsContab.FieldByName('IDSEGREGACRITER').AsString then
      begin
        Result := True;
        exit;
      end;
    end;

  end;

end;

function TCtrlRecebMerc.ObtemArtigoNaOC(IdItemOc: double): OleVariant;
Var sSql : String;
begin
   sSql := 'SELECT IOC.QTDEPEDIDA, IOC.QTDERECEBIDA                  '+
           'FROM ITEMOC IOC                                          '+
           'WHERE (IOC.IDITEMOC = '+FloatToStr(IdItemOc)+          ')';
   Result := GetDataPacket(sSql);
end;

function TCtrlRecebMerc.GetNomePlanoPrev(iIdPlanoPrev: integer): string;
var
  sSQL: string;
  cdsPlanPrev: TClientDataSet;
begin
   try
      Result := '';
      cdsPlanPrev := TClientDataSet.Create(nil);
      sSQL := 'select nome from PLANPREVCONTABIL where idplanoprev = '+ IntToStr(iIdPlanoPrev);
      cdsPlanPrev.Data := GetDataPacket(sSQL);
      Result := cdsPlanPrev.FieldByName('nome').AsString;
   finally
      FreeAndNil(cdsPlanPrev);
   end;
end;

end.
