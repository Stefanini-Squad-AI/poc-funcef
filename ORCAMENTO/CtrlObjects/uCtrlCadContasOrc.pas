// Alterações:
{
{
--------------------------------------------------------------------------------
Rotina......: SelecionaFilhos, AbreQueries, ListaRelacionamentos
Nº SOL......: 219324
Nº KINTANA..: 2051326
Data........: 04/12/2013
Responsável.: Thiago Melo
Descrição...: melhora de performance da tela
 -------------------------------------------------------------------------------
Rotina......: FazerQryPrincipal, AlteraGrupoContasOrcamen, ValoresDefault
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 15/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
--------------------------------------------------------------------------------
Rotina......: ExcluiGrupoOrcamen
Nº SOL......: 187700
Nº KINTANA..: 1767662
Data........: 15/08/2012
Responsável.: Helen Bianchi / Edilaine Ferraresi
Descrição...: Foi adicionado Commit
--------------------------------------------------------------------------------------------------
Rotina......: ExcluiGrupoOrcamen
Nº SOL......: 161099
Nº KINTANA..: 1715076
Data........: 02/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: chamar rotina de exclusão no cadastro de grupos orcamentários e acrescentando
              parametro referente a exclusão de dados na tabela SALDOORCADO
{ --------------------------------------------------------------------------------------------------
// Rotina........: AbreQueries
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario na cdsGrupo
---------------------------------------------------------------------------------------------------}
// Autor......: Vinicius Eduardo Nascimento Maciel
// Data.......: 22/11/2011
// Sol........: 163982/7003
// Kintana....: 1489901
// Rotina.....: AbreQueries
// Descrição..: Foi alterada esta rotina para que o combo Box Atividade/
//               Projeto retorne apenas as atividades analiticas e Ativas.
//------------------------------------------------------------------------------
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 18/08/2011
// Nº SOL........: 159219
// Nº KINTANA....: 1337821
// Rotina........: ListaRelacionamentos
// Descrição.....: Retornar campos de Programa e Tipo de Despesa na consulta
//                 de Fluxo de Caixa.
//------------------------------------------------------------------------------
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 18/08/2011
// Nº SOL........: 159215
// Nº KINTANA....: 1337816
// Rotina........: ListaRelacionamentos
// Descrição.....: Retornar campos de Programa e Tipo de Despesa
//------------------------------------------------------------------------------
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 17/08/2011
// Nº SOL........: 159212
// Nº KINTANA....: 1337867
// Rotina........: ListaRelacionamentos
// Descrição.....: Retornar campos de Programa e Tipo de Despesa
//------------------------------------------------------------------------------
// Autor......: Ricardo de Freitas Araújo
// Data.......: 08/07/2011
// Sol........: 1349788
// Kintana....: 160539/5501
// Rotina.....: ListaRelacionamentos
// Descrição..: Adicionado join cam a tabela de composição contábil nas contas
//              orçamentérias na consulta de parâmetro de contas
// Rotina.....: SelecionaFilhos
// Descrição..: Na consulta de contas contábeis trazer nomes de plano,patro,
//              centro de custa vazios.
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 08/09/2009
// Sol........: 123436
// Kintana....: 616983
// Descrição..: Alteração da Rotina de Centro de Custos, para desvincular a
//              obrigatoriedade de informar as contas de centro de custos quando
//              o flag de centro de custos estiver desmarcado.
//
//------------------------------------------------------------------------------
{Rotina.........: TCtrlCadContasOrc.ExcluiGrupoOrcamen
N. Sol..........: 109826
N. Kintana......: 498982
Data............: 26/03/2009
Responsável.....: Marilza Colpani
Descrição.......: Otimização de query
********************************************************
{
Rotina    : AlteraGrupoContasOrcamen
Data      : 30/08/2005
Autor     : Rodolpho da Silva
Pendencia : 20069
Descrição : Ao alterar um grupo de contas orçamentarias, aplicar as alterações em todas as contas do
            grupo e em suas composições.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaFormula, TestaCaracteres
Data      : 19/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Funções passam a tratar 'G' como indicador de Grupo orçamentário,
            além do 'C', indicador de Conta orçamentária
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TrazContaOrc
Data      : 03/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novo filtro por Centro de Responsabilidade. Retirados Centro de Custo, Ativ/Projeto,
            Plano e Patro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TrazContaOrc
Data      : 29/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Função criada para, a partir dos parâmetros da Conta, trazer apenas 1 Conta Orçamentária
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 19/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Reorganização de todo o código
---------------------------------------------------------------------------------------------------}

unit uCtrlCadContasOrc;

interface

uses
   DB, uDataBase, stdctrls, uCmControlObject, dbclient, sysutils, wwQuery, provider,
   uMidasUtil, udtmCadContasOrcamen, wwdbedit, uString, Mask, ComCtrls,
   uDbContasOrcamen, uDbSaldoOrcado, uDbCompContasOrcamen, uDbDataView, uCMTypes,
   classes, Parser10,
   DBaseDados;    //essa linha

type
   TCtrlCadContasOrc = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;




   private

      _dbContasOrcamen     : TdbContasOrcamen;
      _dbSaldoOrcado       : TdbSaldoOrcado;
      _dbCompContasOrcamen : TdbCompContasOrcamen;

      _dbDet               : TdbCompContasOrcamen;
      _dbDetCond           : TdbCompContasOrcamen;
      _dbDetContaOrc       : TdbCompContasOrcamen;
      _dbDetContaRea       : TdbCompContasOrcamen;
      _dbDetFluxo          : TdbCompContasOrcamen;
      _DbDataView          : TdbDataView;

      FidEmpresa           : Integer;

      // Thiago Melo SOL 219324 Kintana 2051326
      idEmpresaAux,
      iIdGrupoOrcAux,
      iIdEmpresaAux : Integer;
      iPlanoOrcAux : LongInt;
      sCodContaOrcAux : String;
      IdGrupoOrcamenAux : Integer;
      // Thiago Melo SOL 219324 Kintana 2051326

      FiPlanoOrc           : LongInt;
      FiPos                : LongInt;
      FiAbrePar            : LongInt;
      FiFechaPar           : LongInt;
      FiConsulta           : LongInt;
      FbInicioConta        : Boolean;
      FsCodContaOrc        : String;
      FsConta              : String;
      FMensagem            : TEdit;
      FConfirmado          : Boolean;
      FsMascaraGrupo       : String;
      FpgbStatus           : TProgressBar;


      //Somente usado no controle
      FCdsAuxContab        : TClientDataSet;
      bPorGrupo            : boolean;

      FCds                 : TClientDataSet;
      FCdsAux              : TClientDataSet;
      FCdsCCusto           : TClientDataSet;
      FCdsCCustoConta      : TClientDataSet;
      FCdsCCustoFluxo      : TClientDataSet;
      FCdsCenRespConta     : TClientDataSet;
      FCdsCentroRespon     : TClientDataSet;
      FCdsContaCondFim     : TClientDataSet;
      FCdsContaCondIni     : TClientDataSet;
      FCdsContaCondRes     : TClientDataSet;
      FCdsContaContab      : TClientDataSet;
      FCdsContaContabil    : TClientDataSet;
      FCdsContasOrc        : TClientDataSet;
      FCdsContasRef        : TClientDataSet;
      FCdsDataView         : TClientDataSet;
      FCdsDet              : TClientDataSet;
      FCdsDetCond          : TClientDataSet;
      FCdsDetContaOrc      : TClientDataSet;
      FCdsDetContaRea      : TClientDataSet;
      FCdsDetFluxo         : TClientDataSet;
      FCdsGrupo            : TClientDataSet;
      FCdsGrupoAux         : TClientDataSet;
      FCdsMovOrcamento     : TClientDataSet;
      FCdsPatro            : TClientDataSet;
      FCdsPatroConta       : TClientDataSet;
      FCdsPlanoContabil    : TClientDataSet;
      FCdsPlanoPrev        : TClientDataSet;
      FCdsPlanoPrevConta   : TClientDataSet;
      FCdsTestaComposicao  : TClientDataSet;
      FCdsTipoRD           : TClientDataSet;
      FCdsTodoDet          : TClientDataSet;
      FCdsUnidNegoc        : TClientDataSet;
      FCdsUnidNegocConta   : TClientDataSet;

    FCdsFormulaApuracao  : TClientDataSet;
    FIdGrupoOrcamen: Integer;
    FcdsOrcContabPlanos: TClientDataSet;
    FCdsTipoDespesaConta: TClientDataSet;
    FCdsProgramaConta: TClientDataSet;
    FCdsTipoDespesa: TClientDataSet;
    FCdsPrograma: TClientDataSet;
    FCdsTipoDespesaFluxo: TClientDataSet;
    FCdsProgramaFluxo: TClientDataSet;
    FDesvincularContorcamen: boolean;

      function  PegaUltimoCaracter(edt           : TwwDBEdit;
                                    var pMensagem : String): char;

      procedure CdsCalcFields(DataSet: TDataSet);
      procedure CdsDetCondCalcFields(DataSet: TDataSet);

      procedure SetCdsAuxContab       (const Value: TClientDataSet);

      procedure SetCds                (const Value: TClientDataSet);
      procedure SetCdsAux             (const Value: TClientDataSet);
      procedure SetCdsCCusto          (const Value: TClientDataSet);
      procedure SetCdsCCustoConta     (const Value: TClientDataSet);
      procedure SetCdsCCustoFluxo     (const Value: TClientDataSet);
      procedure SetCdsCenRespConta    (const Value: TClientDataSet);
      procedure SetCdsCentroRespon    (const Value: TClientDataSet);
      procedure SetCdsContaCondFim    (const Value: TClientDataSet);
      procedure SetCdsContaCondIni    (const Value: TClientDataSet);
      procedure SetCdsContaCondRes    (const Value: TClientDataSet);
      procedure SetCdsContaContab     (const Value: TClientDataSet);
      procedure SetCdsContaContabil   (const Value: TClientDataSet);
      procedure SetCdsContasOrc       (const Value: TClientDataSet);
      procedure SetCdsContasRef       (const Value: TClientDataSet);
      procedure SetCdsDataView        (const Value: TClientDataSet);
      procedure SetCdsDet             (const Value: TClientDataSet);
      procedure SetCdsDetCond         (const Value: TClientDataSet);
      procedure SetCdsDetContaOrc     (const Value: TClientDataSet);
      procedure SetCdsDetContaRea     (const Value: TClientDataSet);
      procedure SetCdsDetFluxo        (const Value: TClientDataSet);
      procedure SetCdsGrupo           (const Value: TClientDataSet);
      procedure SetCdsGrupoAux        (const Value: TClientDataSet);
      procedure SetCdsMovOrcamento    (const Value: TClientDataSet);
      procedure SetCdsPatro           (const Value: TClientDataSet);
      procedure SetCdsPatroConta      (const Value: TClientDataSet);
      procedure SetCdsPlanoContabil   (const Value: TClientDataSet);
      procedure SetCdsPlanoPrev       (const Value: TClientDataSet);
      procedure SetCdsPlanoPrevConta  (const Value: TClientDataSet);
      procedure SetCdsTestaComposicao (const Value: TClientDataSet);
      procedure SetCdsTipoRD          (const Value: TClientDataSet);
      procedure SetCdsTodoDet         (const Value: TClientDataSet);
      procedure SetCdsUnidNegoc       (const Value: TClientDataSet);
      procedure SetCdsUnidNegocConta  (const Value: TClientDataSet);

      procedure pgbStatusAtualiza(pPos: Integer);  

      procedure SetCdsFormulaApuracao(const Value: TClientDataSet);
    procedure SetIdGrupoOrcamen(const Value: Integer);
    procedure SetcdsOrcContabPlanos(const Value: TClientDataSet);
    procedure SetCdsPrograma(const Value: TClientDataSet);
    procedure SetCdsProgramaConta(const Value: TClientDataSet);
    procedure SetCdsTipoDespesa(const Value: TClientDataSet);
    procedure SetCdsTipoDespesaConta(const Value: TClientDataSet);
    procedure SetCdsProgramaFluxo(const Value: TClientDataSet);
    procedure SetCdsTipoDespesaFluxo(const Value: TClientDataSet);
    procedure SetDesvincularContorcamen(const Value: boolean);


   public

      dtmCadContasOrcamen : TdtmCadContasOrcamen;


      Constructor Create; override;
      Destructor  Destroy;override;

      function AplicaOperacaoCadContasOrcDelete : Boolean;

      function AplicaOperacaoCadContasOrcGravar : Boolean;

      function Procurar(idContasOrcamen : String): OleVariant;

      function VerificaFormula(edt           : TwwDBEdit;
                               var pMensagem : String): Boolean;

      function  TestaCaracteres(edt           : TwwDBEdit;
                                sCaracter     : Char;
                                iPos          : Integer;
                                var pMensagem : String): Boolean;

      function VerificaLinhaGrid(Cds               : TClientDataSet;
                                 iTagChave         : Integer;
                                 iTagVazio         : Integer;
                                 sTabelaMensagem   : String;
                                 bPermiteChaveVazia: Boolean
                                ): Boolean;

      procedure FazerQryPrincipal;
      procedure SelecionaFilhos;

      procedure ProcessaConfirma(bAtualizaGrupo: boolean = false);

      function RetornaPlanContabEmVigor(iIdEmpresa: integer): integer;
      function ListaRelacionamentos(iIdGrupoOrc,iIdEmpresa: integer): OleVariant;

      function ListaContasOrcamen(iIdPlanoOrc: integer): OleVariant;

      procedure AbreQueries(bPorGrupoOrc: boolean = false);

      procedure CadastroDelete;
      procedure AbreQryMovOrcamento;
      procedure ValoresDefault;

      procedure CadastroConfirma(pdbeCodigoContaOrc : String;
                                 pmemSQLLines       : String);

      procedure ProcessaDetalheConfirma1(psePosIni1   : Real;
                                         psePosFim1   : Real;
                                         pedConteudo1 : String;
                                         prPerc       : Real);

      procedure ProcessaDetalheConfirma2(psePosIni2   : Real;
                                         psePosFim2   : Real;
                                         pedConteudo2 : String;
                                         prPerc       : Real);

      procedure AbreqryAuxContab;

      procedure btnImportaContabClick(var pdbeNomeContaOrc   : String;
                                      var pdbeCodigoContaOrc : String;
                                      var sConta             : String
                                     );

      procedure ProcessabtnTransfClick1;
      procedure ProcessabtnTransfClick2;


      function AlteraGrupoContasOrcamen: boolean;

      function ExcluiGrupoOrcamen(iIdGrupo: integer;
                                  const bExcSaldoOrc : boolean = false  // Edilaine - SOL 161099 / KTN 1715076
                                  ): Boolean;



      function  TrazContaOrc(const IDPlanoOrcamen  : String;
                             const IDGrupoOrcamen  : String;
                             const IDEmpresaProp   : String;
                             const sCentroRespon   : String = '';
                             const sCentroCusto    : String = '';
                             const sUnidNegocio    : String = '';
                             const sPlano          : String = '';
                             const sPatro          : String = ''
                            ): OleVariant;

      property               Mensagem      : TEdit        read FMensagem      write FMensagem;
      property idEmpresa     : Integer      read FidEmpresa     write FidEmpresa;

      property Confirmado    : Boolean      read FConfirmado    write FConfirmado;
      property iPlanoOrc     : LongInt      read FiPlanoOrc     write FiPlanoOrc;
      property iPos          : LongInt      read FiPos          write FiPos;
      property iAbrePar      : LongInt      read FiAbrePar      write FiAbrePar;
      property iFechaPar     : LongInt      read FiFechaPar     write FiFechaPar;
      property iConsulta     : LongInt      read FiConsulta     write FiConsulta;
      property bInicioConta  : Boolean      read FbInicioConta  write FbInicioConta;
      property sCodContaOrc  : String       read FsCodContaOrc  write FsCodContaOrc;
      property sConta        : String       read FsConta        write FsConta;
      property sMascaraGrupo : String       read FsMascaraGrupo write FsMascaraGrupo;
      property pgbStatus     : TProgressBar read FpgbStatus     write FpgbStatus;

      //Ricardo SOl 1349788 Kintana 160539/5501
      property IdGrupoOrcamen:Integer read FIdGrupoOrcamen write SetIdGrupoOrcamen;

      // Somenteusado no controle
      property CdsAuxContab       : TClientDataSet read FCdsAuxContab       write SetCdsAuxContab;

      property Cds                : TClientDataSet read FCds                write SetCds;
      property CdsAux             : TClientDataSet read FCdsAux             write SetCdsAux;
      property CdsCCusto          : TClientDataSet read FCdsCCusto          write SetCdsCCusto;
      property CdsCCustoConta     : TClientDataSet read FCdsCCustoConta     write SetCdsCCustoConta;
      property CdsCCustoFluxo     : TClientDataSet read FCdsCCustoFluxo     write SetCdsCCustoFluxo;
      property CdsCenRespConta    : TClientDataSet read FCdsCenRespConta    write SetCdsCenRespConta;
      property CdsCentroRespon    : TClientDataSet read FCdsCentroRespon    write SetCdsCentroRespon;
      property CdsContaCondFim    : TClientDataSet read FCdsContaCondFim    write SetCdsContaCondFim;
      property CdsContaCondIni    : TClientDataSet read FCdsContaCondIni    write SetCdsContaCondIni;
      property CdsContaCondRes    : TClientDataSet read FCdsContaCondRes    write SetCdsContaCondRes;
      property CdsContaContab     : TClientDataSet read FCdsContaContab     write SetCdsContaContab;
      property CdsContaContabil   : TClientDataSet read FCdsContaContabil   write SetCdsContaContabil;
      property CdsContasOrc       : TClientDataSet read FCdsContasOrc       write SetCdsContasOrc;
      property CdsContasRef       : TClientDataSet read FCdsContasRef       write SetCdsContasRef;
      property CdsDataView        : TClientDataSet read FCdsDataView        write SetCdsDataView;
      property CdsDet             : TClientDataSet read FCdsDet             write SetCdsDet;
      property CdsDetCond         : TClientDataSet read FCdsDetCond         write SetCdsDetCond;
      property CdsDetContaOrc     : TClientDataSet read FCdsDetContaOrc     write SetCdsDetContaOrc;
      property CdsDetContaRea     : TClientDataSet read FCdsDetContaRea     write SetCdsDetContaRea;
      property CdsDetFluxo        : TClientDataSet read FCdsDetFluxo        write SetCdsDetFluxo;
      property CdsGrupo           : TClientDataSet read FCdsGrupo           write SetCdsGrupo;
      property CdsGrupoAux        : TClientDataSet read FCdsGrupoAux        write SetCdsGrupoAux;
      property CdsMovOrcamento    : TClientDataSet read FCdsMovOrcamento    write SetCdsMovOrcamento;
      property CdsPatro           : TClientDataSet read FCdsPatro           write SetCdsPatro;
      property CdsPatroConta      : TClientDataSet read FCdsPatroConta      write SetCdsPatroConta;
      property CdsPlanoContabil   : TClientDataSet read FCdsPlanoContabil   write SetCdsPlanoContabil;
      property CdsPlanoPrev       : TClientDataSet read FCdsPlanoPrev       write SetCdsPlanoPrev;
      property CdsPlanoPrevConta  : TClientDataSet read FCdsPlanoPrevConta  write SetCdsPlanoPrevConta;
      property CdsTestaComposicao : TClientDataSet read FCdsTestaComposicao write SetCdsTestaComposicao;
      property CdsTipoRD          : TClientDataSet read FCdsTipoRD          write SetCdsTipoRD;
      property CdsTodoDet         : TClientDataSet read FCdsTodoDet         write SetCdsTodoDet;
      property CdsUnidNegoc       : TClientDataSet read FCdsUnidNegoc       write SetCdsUnidNegoc;
      property CdsUnidNegocConta  : TClientDataSet read FCdsUnidNegocConta  write SetCdsUnidNegocConta;

      //Ricardo SOl 159215 Kintana 1337816
      property CdsPrograma          : TClientDataSet read FCdsPrograma write SetCdsPrograma;
      property CdsProgramaConta     : TClientDataSet read FCdsProgramaConta write SetCdsProgramaConta;
      property CdsProgramaFluxo: TClientDataSet read FCdsProgramaFluxo write SetCdsProgramaFluxo;

      property CdsTipoDespesa       : TClientDataSet read FCdsTipoDespesa write SetCdsTipoDespesa;
      property CdsTipoDespesaConta  : TClientDataSet read FCdsTipoDespesaConta write SetCdsTipoDespesaConta;
      property CdsTipoDespesaFluxo: TClientDataSet read FCdsTipoDespesaFluxo write SetCdsTipoDespesaFluxo;
      property DesvincularContorcamen:boolean read FDesvincularContorcamen write SetDesvincularContorcamen; //Rodar rotina de desvinculação
      //Ricardo SOl 159215 Kintana 1337816 - fim

      property CdsFormulaApuracao : TClientDataSet read FCdsFormulaApuracao write SetCdsFormulaApuracao;


   end;



implementation



procedure TCtrlCadContasOrc.OnCreateAppServer;
begin
   inherited;

   Cds                := TClientDataSet.Create(nil);
   CdsAux             := TClientDataSet.Create(nil);
   CdsCCusto          := TClientDataSet.Create(nil);
   CdsCCustoConta     := TClientDataSet.Create(nil);
   CdsCCustoFluxo     := TClientDataSet.Create(nil);
   CdsCenRespConta    := TClientDataSet.Create(nil);
   CdsCentroRespon    := TClientDataSet.Create(nil);
   CdsContaCondFim    := TClientDataSet.Create(nil);
   CdsContaCondIni    := TClientDataSet.Create(nil);
   CdsContaCondRes    := TClientDataSet.Create(nil);
   CdsContaContab     := TClientDataSet.Create(nil);
   CdsContaContabil   := TClientDataSet.Create(nil);
   CdsContasOrc       := TClientDataSet.Create(nil);
   CdsContasRef       := TClientDataSet.Create(nil);
   CdsDataView        := TClientDataSet.Create(nil);
   CdsDet             := TClientDataSet.Create(nil);
   CdsDetCond         := TClientDataSet.Create(nil);
   CdsDetContaOrc     := TClientDataSet.Create(nil);
   CdsDetContaRea     := TClientDataSet.Create(nil);
   CdsDetFluxo        := TClientDataSet.Create(nil);
   CdsGrupo           := TClientDataSet.Create(nil);
   CdsGrupoAux        := TClientDataSet.Create(nil);
   CdsMovOrcamento    := TClientDataSet.Create(nil);
   CdsPatro           := TClientDataSet.Create(nil);
   CdsPatroConta      := TClientDataSet.Create(nil);
   CdsPlanoContabil   := TClientDataSet.Create(nil);
   CdsPlanoPrev       := TClientDataSet.Create(nil);
   CdsPlanoPrevConta  := TClientDataSet.Create(nil);
   CdsTestaComposicao := TClientDataSet.Create(nil);
   CdsTipoRD          := TClientDataSet.Create(nil);
   CdsTodoDet         := TClientDataSet.Create(nil);
   CdsUnidNegoc       := TClientDataSet.Create(nil);
   CdsUnidNegocConta  := TClientDataSet.Create(nil);

   pgbStatus          := TProgressBar.Create(nil);
end;



procedure TCtrlCadContasOrc.DoChangeDataBase;
begin
   inherited;

   _dbContasOrcamen.DatabaseName     := DataBaseName;
   _dbSaldoOrcado.DatabaseName       := DataBaseName;
   _dbCompContasOrcamen.DatabaseName := DataBaseName;
   _dbDet.DatabaseName               := DataBaseName;
   _dbDetCond.DatabaseName           := DataBaseName;
   _dbDetContaOrc.DatabaseName       := DataBaseName;
   _dbDetContaRea.DatabaseName       := DataBaseName;
   _dbDetFluxo.DatabaseName          := DataBaseName;
   _DbDataView.DatabaseName          := DataBaseName;
end;



constructor TCtrlCadContasOrc.Create;
begin
   inherited;

   dtmCadContasOrcamen := TdtmCadContasOrcamen.Create(nil);

   _dbContasOrcamen     := TDbContasOrcamen.Create(Self);
   _dbSaldoOrcado       := TdbSaldoOrcado.Create(Self);
   _dbCompContasOrcamen := TdbCompContasOrcamen.Create(Self);
   _dbDet               := TdbCompContasOrcamen.Create(Self);
   _dbDetCond           := TdbCompContasOrcamen.Create(Self);
   _dbDetContaOrc       := TdbCompContasOrcamen.Create(Self);
   _dbDetContaRea       := TdbCompContasOrcamen.Create(Self);
   _dbDetFluxo          := TdbCompContasOrcamen.Create(Self);
   _DbDataView          := TdbDataView.Create(Self);


   //Ricardo SOl 159215 Kintana 1337816
   FIdGrupoOrcamen := 0;


   // Cds somente usados no controle
   FCdsAuxContab := TClientDataSet.Create(nil);

   // Thiago Melo SOL 219324 Kintana 2051326
   idEmpresaAux := 0;
   iIdGrupoOrcAux := -1;
   iIdEmpresaAux  := -1;
   iPlanoOrcAux := -1;
   sCodContaOrcAux := '';
   IdGrupoOrcamenAux := 0;
   // Thiago Melo SOL 219324 Kintana 2051326
end;



destructor TCtrlCadContasOrc.Destroy;
begin
   inherited;

   _DbContasOrcamen.Free;
   _dbSaldoOrcado.Free;
   _dbCompContasOrcamen.Free;
   _dbDet.Free;
   _dbDetCond.Free;
   _dbDetContaOrc.Free;
   _dbDetContaRea.Free;
   _dbDetFluxo.Free;
   _DbDataView.Free;

   FreeCds([FCdsAuxContab]);

   if (isAppServer) then
   begin
      FreeCds([FCds,                FCdsAux,           FCdsCCusto,       FCdsCCustoConta,
               FCdsCCustoFluxo,     FCdsCenRespConta,  FCdsCentroRespon, FCdsContaCondFim,
               FCdsContaCondIni,    FCdsContaCondRes,  FCdsContaContab,  FCdsContaContabil,
               FCdsContasOrc,       FCdsContasRef,     FCdsDataView,     FCdsDet,
               FCdsDetCond,         FCdsDetContaOrc,   FCdsDetContaRea,  FCdsDetFluxo,
               FCdsGrupo,           FCdsGrupoAux,      FCdsMovOrcamento, FCdsPatro,
               FCdsPatroConta,      FCdsPlanoContabil, FCdsPlanoPrev,    FCdsPlanoPrevConta,
               FCdsTestaComposicao, FCdsTipoRD,        FCdsTodoDet,      FCdsUnidNegoc,
               FCdsUnidNegocConta,
               //Ricardo SOl 159215 Kintana 1337816
               FCdsPrograma, FCdsProgramaConta, FCdsProgramaFluxo,
               FCdsTipoDespesa, FCdsTipoDespesaConta, FCdsTipoDespesaFluxo
               //Ricardo SOl 159215 Kintana 1337816 - fim
               ]);

      pgbStatus.Free;
   end;
end;



function  TCtrlCadContasOrc.TrazContaOrc(const IDPlanoOrcamen  : String;
                                         const IDGrupoOrcamen  : String;
                                         const IDEmpresaProp   : String;
                                         const sCentroRespon   : String = '';
                                         const sCentroCusto    : String = '';
                                         const sUnidNegocio    : String = '';
                                         const sPlano          : String = '';
                                         const sPatro          : String = ''
                                       ): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '   MIN(COR.IDCONTAORCAMEN) AS IDCONTAORCAMEN '                + #13 +
   'FROM '                                                        + #13 +
   '   CONTASORCAMEN COR '                                        + #13 +
   'WHERE '                                                       + #13 +
   '       COR.IDPLANOORCAMEN    = ' + IDPlanoOrcamen             + #13 +
   '   AND COR.IDGRUPOORCAMEN    = ' + IDGrupoOrcamen             + #13 +
   '   AND COR.IDPESSOA          = ' + IDEmpresaProp;

   if sCentroRespon <> '' then sSQL := sSQL + #13 +
   '   AND COR.CODCENTRORESPON   = ' + QuotedStr(sCentroRespon);

   if sCentroCusto <> '' then sSQL := sSQL + #13 +
   '   AND COR.CODCENTROCUSTO    = ' + QuotedStr(sCentroCusto)    + #13 +
   '   AND COR.IDEMPRESA         = ' + IDEmpresaProp;

   if sUnidNegocio <> '' then sSQL := sSQL + #13 +
   '   AND COR.UNIDNEGOC         = ' + sUnidNegocio;

   if sPlano <> '' then sSQL := sSQL + #13 +
   '   AND COR.IDPLANOPREV       = ' + sPlano;

   if sPatro <> '' then sSQL := sSQL + #13 +
   '   AND COR.IDPATRO    = ' + sPatro;

   Result := GetDataPacket(sSQL);
end;



function TCtrlCadContasOrc.Procurar(idContasOrcamen : String): OleVariant;
begin
   _DbContasOrcamen.IdContaOrcamen.AsString := idContasOrcamen;
   Result := GetDataPacket(_DbContasOrcamen.SSqlSelect);
end;



procedure TCtrlCadContasOrc.FazerQryPrincipal;
begin
  if (iPlanoOrcAux <> iPlanoOrc) or (sCodContaOrcAux <> sCodContaOrc) then begin
     Cds.Data := GetDataPacket('SELECT ' +
                               '   C.IDCONTAORCAMEN, ' +
                               '   C.IDPLANOORCAMEN, ' +
                               '   C.IDGRUPOORCAMEN, ' +
                               '   C.NOMECONTAORCAMEN, ' +
                               '   C.TIPOCALCREALIZADO, ' +
                               '   C.TIPOCALCORCADO, ' +
                               '   C.FORMULAREALIZADO, ' +
                               '   C.FORMULAORCADO, ' +
                               '   C.OBSERVACAO, ' +
                               '   C.VLRINFORMADOREAL, ' +
                               '   C.VLRINFORMADOORC, ' +
                               '   C.FLGCONTAMONETARIA, ' +
                               '   C.IDPESSOA, ' +
                               '   C.FLGSINALCONTA, ' +
                               '   C.FLGCALCORCADO, ' +
                               '   C.FLGCALCREAL, ' +
                               '   C.CODCENTRORESPON, ' +
                               '   C.FLGINFDIAMES, ' +
                               '   C.ORIGEMCMDV, ' +
                               '   C.IDDATAVIEW, ' +
                               '   C.FLGACUMULADO, ' +
                               '   C.FLGTRANSFSALDO, ' +
                               '   C.FLGATIVA, ' +
                               '   C.DATAATIVA, ' +
                               '   C.DATAINATIVA, ' +
                               '   G.CODGRUPOORC, ' +
                               '   C.CODCENTROCUSTO, ' +
                               '   C.IDEMPRESA, ' +
                               '   C.UNIDNEGOC, ' +
                               '   C.IDPATRO, ' +
                               '   C.IDPLANOPREV, ' +
                               '   C.IDFORMORCADO, ' +
                               '   C.FLGTRANSFORIGDIF, '+  // Edilaine - SOL 190311 / KTN 1799290
                               '    ''                                                                           '' As DESCGRUPO ' +
                               'FROM ' +
                               '   CONTASORCAMEN C, ' +
                               '   GRUPOORCAMEN G ' +
                               'WHERE ' +
                               '   C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ' AND ' +
                               '   C.IDCONTAORCAMEN = ' + QuotedStr(sCodContaOrc) + ' AND ' +
                               '   C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN ');
  end else if ((iPlanoOrc = -1) and (sCodContaOrc = '')) then begin
     Cds.Data := GetDataPacket('SELECT ' +
                               '   C.IDCONTAORCAMEN, ' +
                               '   C.IDPLANOORCAMEN, ' +
                               '   C.IDGRUPOORCAMEN, ' +
                               '   C.NOMECONTAORCAMEN, ' +
                               '   C.TIPOCALCREALIZADO, ' +
                               '   C.TIPOCALCORCADO, ' +
                               '   C.FORMULAREALIZADO, ' +
                               '   C.FORMULAORCADO, ' +
                               '   C.OBSERVACAO, ' +
                               '   C.VLRINFORMADOREAL, ' +
                               '   C.VLRINFORMADOORC, ' +
                               '   C.FLGCONTAMONETARIA, ' +
                               '   C.IDPESSOA, ' +
                               '   C.FLGSINALCONTA, ' +
                               '   C.FLGCALCORCADO, ' +
                               '   C.FLGCALCREAL, ' +
                               '   C.CODCENTRORESPON, ' +
                               '   C.FLGINFDIAMES, ' +
                               '   C.ORIGEMCMDV, ' +
                               '   C.IDDATAVIEW, ' +
                               '   C.FLGACUMULADO, ' +
                               '   C.FLGTRANSFSALDO, ' +
                               '   C.FLGATIVA, ' +
                               '   C.DATAATIVA, ' +
                               '   C.DATAINATIVA, ' +
                               '   G.CODGRUPOORC, ' +
                               '   C.CODCENTROCUSTO, ' +
                               '   C.IDEMPRESA, ' +
                               '   C.UNIDNEGOC, ' +
                               '   C.IDPATRO, ' +
                               '   C.IDPLANOPREV, ' +
                               '   C.IDFORMORCADO, ' +
                               '   C.FLGTRANSFORIGDIF, '+  // Edilaine - SOL 190311 / KTN 1799290
                               '    ''                                                                           '' As DESCGRUPO ' +
                               'FROM ' +
                               '   CONTASORCAMEN C, ' +
                               '   GRUPOORCAMEN G ' +
                               'WHERE 1 = 2');
  end else if Cds.IsEmpty then begin
     Cds.Data := GetDataPacket('SELECT ' +
                               '   C.IDCONTAORCAMEN, ' +
                               '   C.IDPLANOORCAMEN, ' +
                               '   C.IDGRUPOORCAMEN, ' +
                               '   C.NOMECONTAORCAMEN, ' +
                               '   C.TIPOCALCREALIZADO, ' +
                               '   C.TIPOCALCORCADO, ' +
                               '   C.FORMULAREALIZADO, ' +
                               '   C.FORMULAORCADO, ' +
                               '   C.OBSERVACAO, ' +
                               '   C.VLRINFORMADOREAL, ' +
                               '   C.VLRINFORMADOORC, ' +
                               '   C.FLGCONTAMONETARIA, ' +
                               '   C.IDPESSOA, ' +
                               '   C.FLGSINALCONTA, ' +
                               '   C.FLGCALCORCADO, ' +
                               '   C.FLGCALCREAL, ' +
                               '   C.CODCENTRORESPON, ' +
                               '   C.FLGINFDIAMES, ' +
                               '   C.ORIGEMCMDV, ' +
                               '   C.IDDATAVIEW, ' +
                               '   C.FLGACUMULADO, ' +
                               '   C.FLGTRANSFSALDO, ' +
                               '   C.FLGATIVA, ' +
                               '   C.DATAATIVA, ' +
                               '   C.DATAINATIVA, ' +
                               '   G.CODGRUPOORC, ' +
                               '   C.CODCENTROCUSTO, ' +
                               '   C.IDEMPRESA, ' +
                               '   C.UNIDNEGOC, ' +
                               '   C.IDPATRO, ' +
                               '   C.IDPLANOPREV, ' +
                               '   C.IDFORMORCADO, ' +
                               '   C.FLGTRANSFORIGDIF, '+  // Edilaine - SOL 190311 / KTN 1799290
                               '    ''                                                                           '' As DESCGRUPO ' +
                               'FROM ' +
                               '   CONTASORCAMEN C, ' +
                               '   GRUPOORCAMEN G ' +
                               'WHERE ' +
                               '   C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ' AND ' +
                               '   C.IDCONTAORCAMEN = ' + QuotedStr(sCodContaOrc) + ' AND ' +
                               '   C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN ');  
  end;
  iPlanoOrcAux := iPlanoOrc;
  sCodContaOrcAux := sCodContaOrc;
end;

procedure TCtrlCadContasOrc.SelecionaFilhos;
begin
   //Seleciona os registros das Tabelas Filhas

   //Consulta do Banco de Dados de Arquivos Genéricos
   CdsDataView.Data := GetDataPacket('SELECT ' +
                                     '   NAME, IDDATAVIEW, CLASSNAME, ORIGEMCMDV, TEMPLATE ' +
                                     'FROM ' +
                                     '   CM.DATAVIEW ' +
                                     'WHERE ' +
                                     '   (IDDATAVIEW = ' + IntToStr(iConsulta) + ') AND ' +
                                     '   (ORIGEMCMDV = ''0'') ');

   //Composição de Contas Orçamentárias de Contabilidade
   if (iPlanoOrcAux <> iPlanoOrc) or (IdGrupoOrcamenAux <> FIdGrupoOrcamen) then begin // Thiago Melo SOL 219324 Kintana 2051326
     // Thiago Melo SOL 219324 Kintana 2051326
     (*CdsDet.Data := GetDataPacket('SELECT ' +
                                '  DISTINCT ' +
                                '  C.PLANO, ' +
                                '  C.PLACONTA, ' +
                                '  P.PLANOME, ' +
                                '  C.IDPESSOA, ' +
                                '  C.IDPLANOORCAMEN, ' +
                                //Ricardo SOl 159215 Kintana 1337816 - comentado
                                {'  C.UNIDNEGOC, ' +
                                '  C.CODCENTROCUSTO, ' +
                                '  C.IDPLANOPREV, ' +
                                '  C.IDPATRO, ' +
                                '  C.IDEMPRESA, ' +
                                '  C.IDPROGRAMAORCAMEN, '  +
                                '  C.IDTIPO_DEPESAORCAMEN, ' +
                                '  C.IDCONTAORCAMEN, ' +
                                '  C.IDCOMPCONTASORC, ' +}
                                //Ricardo SOl 159215 Kintana 1337816

                                //Ricardo SOl 159215 Kintana 1337816
                                '  0 AS UNIDNEGOC, ' +
                                '  0 AS CODCENTROCUSTO, ' +
                                '  0 AS IDPLANOPREV, ' +
                                '  0 AS IDPATRO, ' +
                                '  0 AS IDEMPRESA, ' +
                                '  0 AS IDPROGRAMAORCAMEN, '  +
                                '  0 AS IDTIPO_DEPESAORCAMEN, ' +
                                '  0 AS IDCONTAORCAMEN, ' +
                                '  0 AS IDCOMPCONTASORC, ' +
                                //Ricardo SOl 159215 Kintana 1337816




                                //Ricardo SOl 1349788 Kintana 160539/5501 - comentado
                                {'  CC.NOME AS NOMECC, ' +
                                '  U.NOME  AS NOMEAP, ' +
                                '  PP.NOME AS NOMEPLANO, ' +
                                '  PT.NOME AS NOMEPATRO, '
                                '  U.UNECODIGO, ' + }
                                //Fim

                                //Ricardo SOl 1349788 Kintana 160539/5501
                                ' ' + QuotedStr('                                             ') + ' AS NOMECC, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEAP, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEPLANO, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEPATRO, ' +
                                ' ' + QuotedStr('                                             ') + ' AS PROGRAMA, ' +
                                ' ' + QuotedStr('                                             ') + ' AS TIPODESPESA, ' +
                                ' ' + QuotedStr('                                             ') + ' AS UNECODIGO, ' +

                                //Ricardo SOl 159215 Kintana 1337816 - fim

                                 '  PC.DESCPLANO ' +
                                'FROM COMPCONTASORCAMEN C, PLANOCONTA P, ' +

                                //Ricardo SOl 159215 Kintana 1337816 - comentado
                                {'     ,CENTCUST CC, UNIDNEGOCIO U, ' +
                                '     PLANPREV PP,PESSOA PT,}

                                ' PLANO PC ' +

                                {' CM.PROGRAMAORCAMEN PR,CM.TIPO_DESPESAORCAMEN TD ' +}
                                //Ricardo SOl 159215 Kintana 1337816 - comentado

                                'WHERE (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') ' +

                                //Ricardo SOl 159215 Kintana 1337816 - comentado
                                //'  AND (C.IDCONTAORCAMEN = ' + QuotedStr(sCodContaOrc) + ') ' +

                                //Ricardo SOl 159215 Kintana 1337816
                                '  AND (C.IDCONTAORCAMEN IN (SELECT  DISTINCT IDCONTAORCAMEN FROM ' +
                                ' CONTASORCAMEN WHERE IDGRUPOORCAMEN = ' + IntToStr(FidGrupoOrcamen) + ')) ' +
                                //Ricardo SOl 159215 Kintana 1337816 - fim

                                '  AND (C.PLACONTA IS NOT NULL) ' +
                                '  AND (C.PLACONTA       = P.PLACONTA(+)) ' +
                                '  AND (C.PLANO          = P.PLANO(+)) '  +
                                '  AND (C.PLANO          = PC.PLANO(+)) '

                                //Ricardo SOl 159215 Kintana 1337816 - comentado
                                {'  AND (C.UNIDNEGOC      = U.UNIDNEGOC(+)) ' +
                                '  AND (C.IDPESSOA       = U.IDPESSOA(+)) ' +
                                '  AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ' +
                                '  AND (C.IDEMPRESA      = CC.IDEMPRESA(+)) ' +
                                '  AND (C.IDPATRO        = PT.IDPESSOA(+)) ' +
                                '  AND (C.IDPLANOPREV    = PP.IDPLANOPREV(+)) ' +
                                '  AND (C.IDPROGRAMAORCAMEN    = PR.IDPROGRAMAORCAMEN(+)) ' +
                                '  AND (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+)) ' }
                                //Ricardo SOl 159215 Kintana 1337816 - fim
                                );*)
     CdsDet.Data := GetDataPacket('SELECT ' +
                                  '  DISTINCT ' +
                                  '  C.PLANO, ' +
                                  '  C.PLACONTA, ' +
                                  '  P.PLANOME, ' +
                                  '  C.IDPESSOA, ' +
                                  '  C.IDPLANOORCAMEN, ' +
                                  '  0 AS UNIDNEGOC, ' +
                                  '  0 AS CODCENTROCUSTO, ' +
                                  '  0 AS IDPLANOPREV, ' +
                                  '  0 AS IDPATRO, ' +
                                  '  0 AS IDEMPRESA, ' +
                                  '  0 AS IDPROGRAMAORCAMEN, '  +
                                  '  0 AS IDTIPO_DEPESAORCAMEN, ' +
                                  '  0 AS IDCONTAORCAMEN, ' +
                                  '  0 AS IDCOMPCONTASORC, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS NOMECC, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS NOMEAP, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS NOMEPLANO, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS NOMEPATRO, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS PROGRAMA, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS TIPODESPESA, ' +
                                  ' ' + QuotedStr('                                             ') + ' AS UNECODIGO, ' +
                                  '  PC.DESCPLANO ' +
                                  '  FROM COMPCONTASORCAMEN C ' +
                                  '  JOIN CONTASORCAMEN CO ON CO.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) +
                                  '   AND CO.IDCONTAORCAMEN = C.IDCONTAORCAMEN ' +
                                  '   AND CO.IDPROGRAMAORCAMEN = C.IDPROGRAMAORCAMEN ' +
                                  '  LEFT JOIN PLANOCONTA P ' +
                                  '    ON (P.PLANO = C.PLANO) ' +
                                  '   AND (P.PLACONTA = C.PLACONTA) ' +
                                  '  LEFT JOIN PLANO PC ' +
                                  '    ON (PC.PLANO = C.PLANO) ' +
                                  ' WHERE (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') ' +
                                  '   AND CO.IDGRUPOORCAMEN = ' + IntToStr(FidGrupoOrcamen) +
                                  '   AND (C.PLACONTA IS NOT NULL)');
   end else if (iPlanoOrcAux = -1) and (IdGrupoOrcamenAux = 0) then begin
     CdsDet.Data := GetDataPacket('SELECT ' +
                                '  DISTINCT ' +
                                '  C.PLANO, ' +
                                '  C.PLACONTA, ' +
                                '  P.PLANOME, ' +
                                '  C.IDPESSOA, ' +
                                '  C.IDPLANOORCAMEN, ' +
                                '  0 AS UNIDNEGOC, ' +
                                '  0 AS CODCENTROCUSTO, ' +
                                '  0 AS IDPLANOPREV, ' +
                                '  0 AS IDPATRO, ' +
                                '  0 AS IDEMPRESA, ' +
                                '  0 AS IDPROGRAMAORCAMEN, '  +
                                '  0 AS IDTIPO_DEPESAORCAMEN, ' +
                                '  0 AS IDCONTAORCAMEN, ' +
                                '  0 AS IDCOMPCONTASORC, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMECC, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEAP, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEPLANO, ' +
                                ' ' + QuotedStr('                                             ') + ' AS NOMEPATRO, ' +
                                ' ' + QuotedStr('                                             ') + ' AS PROGRAMA, ' +
                                ' ' + QuotedStr('                                             ') + ' AS TIPODESPESA, ' +
                                ' ' + QuotedStr('                                             ') + ' AS UNECODIGO, ' +
                                 '  PC.DESCPLANO ' +
                                'FROM COMPCONTASORCAMEN C, PLANOCONTA P, ' +
                                ' PLANO PC ' +
                                'WHERE 1 = 2');
   end;
   iPlanoOrcAux := iPlanoOrc;
   IdGrupoOrcamenAux := FIdGrupoOrcamen;
   // Thiago Melo SOL 219324 Kintana 2051326

   //Composição de Contas Orçamentárias Orçadas
   CdsDetContaOrc.Data := GetDataPacket('SELECT C.IDCONTAREFORCADO, C.PERCCONTAREFORC, C.IDCONTAORCAMEN, ' +
                                        '       C.IDPLANOORCAMEN, C.IDCOMPCONTASORC, CO.NOMECONTAORCAMEN ' +
                                        'FROM COMPCONTASORCAMEN C, CONTASORCAMEN CO ' +
                                        'WHERE (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + ') ' +
                                        '  AND (C.IDCONTAORCAMEN = ' + QuotedStr(sCodContaOrc) + ') ' +
                                        '  AND (C.IDCONTAREFORCADO IS NOT NULL) ' +
                                        '  AND (C.IDCONTAREFORCADO = CO.IDCONTAORCAMEN(+)) ' +
                                        '  AND (C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN(+)) ');


   //Composição de Contas Orçamentárias Realizadas
   CdsDetContaRea.Data := GetDataPacket('SELECT C.IDCONTAREFREAL, C.PERCCONTAREFREA, C.IDCONTAORCAMEN, ' +
                                        '       C.IDPLANOORCAMEN, C.IDCOMPCONTASORC, CO.NOMECONTAORCAMEN ' +
                                        'FROM COMPCONTASORCAMEN C, CONTASORCAMEN CO ' +
                                        'WHERE (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + ') ' +
                                        '  AND (C.IDCONTAORCAMEN = ' + QuotedStr(sCodContaOrc) + ') ' +
                                        '  AND (C.IDCONTAREFREAL IS NOT NULL) ' +
                                        '  AND (C.IDCONTAREFREAL = CO.IDCONTAORCAMEN(+)) ' +
                                        '  AND (C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN(+)) ');


   //Composição de Contas Orçamentárias Condicionais
   CdsDetCond.Data := GetDataPacket('SELECT ''                                           ' +
                                    '                                                    ' +
                                    '                              ''  AS CONDDESCRICAO, ' +
                                    '   IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES, CONDICAO,' +
                                    '   TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, ' +
                                    '   IDCONTAORCAMEN, IDPLANOORCAMEN, IDCOMPCONTASORC, ' +
                                    '   IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES ' +
                                    'FROM ' +
                                    '  COMPCONTASORCAMEN ' +
                                    'WHERE IDPLANOORCAMEN  = ' + IntToStr(iPlanoOrc) +
                                    ' AND  IDCONTAORCAMEN  = ' + QuotedStr(sCodContaOrc) +
                                    ' AND  DECODE(IDCONTACONDINI,'''',IDGRUPOCONDINI,IDCONTACONDINI) IS NOT NULL ');


   //Composição de Contas Orçamentárias Fluxo de Caixa
   CdsDetFluxo.Data := GetDataPacket('SELECT ' +
                                     '  C.CODTIPRECDES, ' +
                                     '  C.RECPAG, ' +
                                     '  C.CODCENTRORESPON, ' +
                                     '  C.IDCONTAORCAMEN, ' +
                                     '  C.IDPLANOORCAMEN, ' +
                                     '  C.IDPLANOPREV, ' +
                                     '  C.IDPATRO, ' +
                                     '  C.IDCOMPCONTASORC, ' +
                                     '  C.UNIDNEGOC, ' +
                                     '  C.IDPESSOA, ' +
                                     '  C.IDEMPRESA, ' +

                                     //Ricardo SOl 159219 Kintana 1337821
                                     '  C.IDPROGRAMAORCAMEN, '  +
                                     '  C.IDTIPO_DEPESAORCAMEN, ' +
                                     //Ricardo SOl 159219 Kintana 1337821 - fim
            

                                     '  C.CODCENTROCUSTO, ' +
                                     '  T.DESCRICAO AS NOMETR, ' +
                                     '  CC.NOME AS NOMECC, ' +
                                     '  U.NOME AS NOMEAP, ' +

                                     //Ricardo SOl 159219 Kintana 1337821
                                     ' PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
                                     ' TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA, ' +
                                     //Ricardo SOl 159219 Kintana 1337821 - fim

                                     '  PP.NOME AS NOMEPLANO, ' +
                                     '  PT.NOME AS NOMEPATRO, ' +
                                     '  CR.NOME AS NOMECR ' +
                                     'FROM ' +
                                     '  COMPCONTASORCAMEN C, ' +
                                     '  TIPORECEBDESEMB T, ' +
                                     '  CENTCUST CC, ' +
                                     '  UNIDNEGOCIO U, ' +
                                     '  PLANPREV PP, ' +
                                     '  PESSOA PT, ' +
                                     '  CENTRESPON CR, ' +

                                     //Ricardo SOl 159219 Kintana 1337821
                                     ' CM.PROGRAMAORCAMEN PR,CM.TIPO_DESPESAORCAMEN TD ' +
                                     //Ricardo SOl 159219 Kintana 1337821 - fim

                                     'WHERE ' +
                                     '  ( C.IDPLANOORCAMEN  = ' + IntToStr(iPlanoOrc)     + ' )     AND ' +
                                     '  ( C.IDCONTAORCAMEN  = ' + QuotedStr(sCodContaOrc) + ')      AND ' +
                                     '  ( C.CODTIPRECDES    IS NOT NULL)            AND ' +
                                     '  ( C.CODTIPRECDES    = T.CODTIPRECDES(+))    AND ' +
                                     '  ( C.RECPAG          = T.RECPAG(+))          AND ' +
                                     '  ( C.IDPESSOA        = T.IDPESSOA(+))        AND ' +
                                     '  ( C.IDPESSOA        = U.IDPESSOA(+))        AND ' +
                                     '  ( C.UNIDNEGOC       = U.UNIDNEGOC(+))       AND ' +
                                     '  ( C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
                                     '  ( C.IDEMPRESA       = CC.IDEMPRESA(+))      AND ' +
                                     '  ( C.IDPATRO         = PT.IDPESSOA(+))       AND ' +
                                     '  ( C.IDPLANOPREV     = PP.IDPLANOPREV(+))    AND ' +
                                     '  ( C.IDPESSOA        = CR.IDPESSOA(+))       AND ' +
                                     '  ( C.CODCENTRORESPON = CR.CODCENTRORESPON(+))    ' +

                                     //Ricardo SOl 159219 Kintana 1337821
                                     '  AND (C.IDPROGRAMAORCAMEN    = PR.IDPROGRAMAORCAMEN(+)) ' +
                                     '  AND (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+)) '
                                     //Ricardo SOl 159219 Kintana 1337821 - fim
                                     );
end;



function TCtrlCadContasOrc.VerificaFormula(edt           : TwwDBEdit;
                                           var pMensagem : String): Boolean;
var
   i, j, k, iInicio, iFim, iTamanho : Integer;
   sTeste : string;
   pParser: TParser;

begin
   //Faz a Verificação Final da fórmula
   Result := true;

   sTeste := edt.text;

   if (iAbrePar <> iFechaPar) then
   begin
      pMensagem   := 'Parênteses não balanceados. Verifique.';
      Result      := False;
   end;

   if PegaUltimoCaracter(edt, pMensagem) in ['.', '+', '-', '*', '/', '^', 'C', 'G', '('] then
   begin
      pMensagem   := 'Fórmula terminada incorretamente. Verifique.';
      Result      := False;
   end;

   //Pega as Contas presentes na fórmula (C) e as transforma no valor 1
   //para serem verificadas pelo parser

   iTamanho := length(sTeste);

   //Faz a varredura das contas e as substitui
   for k := 1 to length(sTeste) do
   begin
      for i := 1 to iTamanho do
      begin
         if sTeste[i] in ['C', 'G'] then
         begin
            iInicio := i;
            for j := (i + 1) to iTamanho do
            begin
               if not(sTeste[j] in ['0'..'9', 'C', 'G']) then
               begin
                  iFim := j;

                  delete(sTeste, iInicio, iFim-iInicio);
                  insert('1', sTeste, iInicio);
                  iTamanho := length(sTeste);
                  Break;
               end;  // if not(sTeste[j] in ['0'..'9', 'C'])
            end;  // for j := (i + 1) to iTamanho
            Break;
         end;  // if sTeste[i] in ['C']
      end;  // for i := 1 to iTamanho
   end;  // for k := 1 to length(sTeste)

   // Caso haja uma conta no final da fórmula, faz a varredura dela também
   for i := 1 to length(sTeste) do
   begin
      if sTeste[i] in ['C', 'G'] then
      begin
         iInicio := i;

         delete(sTeste, iInicio, length(sTeste));
         insert('1', sTeste, iInicio);
      end;
   end;  


   try

      try
         pParser := TParser.Create(nil);
         pParser.Expression := sTeste;

      except
         pMensagem := 'Existem erros na Fórmula. Verifique.';
         result := False;
      end;

   finally
      FreeAndNil(pParser);
   end;
end;



function TCtrlCadContasOrc.PegaUltimoCaracter(    edt       : TwwDBEdit;
                                              var pMensagem : String
                                             ): Char;
var
   sTexto   : String;
   iTamanho : Integer;
begin
   // Retorna qual é o último caracter da caixa de texto
   sTexto   := edt.text;
   iTamanho := length(sTexto);
   if iTamanho <> 0 then Result := sTexto[iTamanho] else Result := #0;
end;



function TCtrlCadContasOrc.TestaCaracteres(    edt       : TwwDBEdit;
                                               sCaracter : Char;
                                               iPos      : Integer;
                                           var pMensagem : String): Boolean;
var
   sSQL        : String;
   sContaAux   : String;
begin
   Result := true;

   // Verifica se o caracter digitado é válido
   if not(sCaracter in ['0'..'9', '+', '-', '*', '/', '^', 'C', 'G', '(', ')', '.']) then
   begin
      pMensagem   := 'Este caracter não pode ser usado na fórmula.';
      Result      := False;
      Exit;
   end;

   //Verifica se o primeiro caracter não é um operador
   if (iPos = 1) and not(sCaracter in ['0'..'9', 'C', 'G', '(', ')']) then
   begin
      pMensagem   := 'Este caracter não pode ser usado no início da fórmula.';
      Result      := False;
      Exit;
   end;

   // Verifica se o caracter após o ")" é válido
   if (iPos > 1) and (sCaracter in ['0'..'9', '.', 'C', 'G']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) in [')'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se o caracter antes do "(" é válido
   if (iPos > 1) and (sCaracter in ['(']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) in ['0'..'9', '.', 'C', 'G'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se não estão sendo digitados dois operadores iguais (ex.: 66++7)
   if (iPos > 1) and not(sCaracter in ['0'..'9', '(', ')']) then
   begin
      if PegaUltimoCaracter(edt, pMensagem) = sCaracter then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Verifica se o operador está numa posição correta
   if (iPos > 1) and not(sCaracter in ['0'..'9', 'C', 'G', '(', ')']) then
   begin
      if (PegaUltimoCaracter(edt, pMensagem)) in ['.', '+', '-', '*', '/', '^', 'C', 'G'] then
      begin
         pMensagem   := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result      := False;
         Exit;
      end;
   end;

   //Condições indicadoras de que a digitação corrente é de uma conta Orçamentária
   if bInicioConta = True then if not(sCaracter in ['0'..'9']) then bInicioConta := False;

   // ----------------------------------------------------------------------------------------------
   //    Verificação de Conta/Grupo
   // ----------------------------------------------------------------------------------------------
   if sCaracter in ['C'] then
   begin
      bInicioConta   := True;
      sConta         := '';
   end;

   if bInicioConta = True then sConta := sConta + sCaracter;

   //Verifica se a conta Orçamentária digitada é válida
   if (iPos = 1) or (sCaracter in ['.', '+', '-', '*', '/', '^', 'C', 'G', '(', ')']) then
   begin
      if sConta <> 'C' then
      begin
         sContaAux := copy(sConta, 2, (length(sConta) - 1));

         sSQL :=
         'SELECT '                                          + #13 +
         '   IDCONTAORCAMEN '                               + #13 +
         'FROM '                                            + #13 +
         '   CONTASORCAMEN '                                + #13 +
         'WHERE '                                           + #13 +
         '       IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)   + #13 +
         '   AND IDCONTAORCAMEN = ' + QuotedStr(sContaAux);

         with dtmCadContasOrcamen.qryAux do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
            Prepare;
            CdsAux.Data := Data;
         end;

         bInicioConta := False;

         if CdsAux.IsEmpty then
         begin
            pMensagem   := 'Conta Orçamentária não cadastrada.';
            Result      := False;
            sConta      := '';
            Exit;
         end;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   if sCaracter in ['G'] then
   begin
      bInicioConta   := True;
      sConta         := '';
   end;

   if bInicioConta = True then sConta := sConta + sCaracter;

   //Verifica se a conta Orçamentária digitada é válida
   if (iPos = 1) or (sCaracter in ['.', '+', '-', '*', '/', '^', 'C', 'G', '(', ')']) then
   begin
      if sConta <> 'C' then
      begin
         sContaAux := copy(sConta, 2, (length(sConta) - 1));

         sSQL :=
         'SELECT '                                          + #13 +
         '   IDGRUPOORCAMEN '                               + #13 +
         'FROM '                                            + #13 +
         '   GRUPOORCAMEN '                                 + #13 +
         'WHERE '                                           + #13 +
         '       IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)   + #13 +
         '   AND CODGRUPOORC    = ' + QuotedStr(sContaAux);

         with dtmCadContasOrcamen.qryAux do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
            Prepare;
            CdsAux.Data := Data;
         end;

         bInicioConta := False;

         if CdsAux.IsEmpty then
         begin
            pMensagem   := 'Grupo Orçamentário não cadastrado.';
            Result      := False;
            sConta      := '';
            Exit;
         end;
      end;
   end;
   // ----------------------------------------------------------------------------------------------
   //    FIM Verificação de Conta/Grupo
   // ----------------------------------------------------------------------------------------------

   //Verificação de balanceamento de parêntesis
   if sCaracter = '(' then iAbrePar  := iAbrePar  + 1;
   if sCaracter = ')' then iFechaPar := iFechaPar + 1;
end;



procedure TCtrlCadContasOrc.ProcessaConfirma(bAtualizaGrupo: boolean = false);
begin
   pgbStatus.Position   := 0;
   pgbStatus.Min        := 0;
   pgbStatus.Max        := 5;

   with dtmCadContasOrcamen do
   begin
      if Cds.FieldByName('CODCENTROCUSTO').isNull then
      begin
         Cds.FieldByName('IDEMPRESA').Clear;
      end
      else
      begin
         Cds.FieldByName('IDEMPRESA').AsInteger := idEmpresa;
      end;

      CdsDet.First;
      while not(CdsDet.EOF) do
      begin

         with QryTestaComposicao do
         begin
            SQL.Clear;
            //Marilza Colpani 26/03/2009 N.Sol 109826/N.Kintana 498982
            // inlcusão do comando rule, pois o oracle está buscando o índice errado
            SQL.Add('SELECT /*+rule*/ IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
            SQL.Add('WHERE (IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN').AsString+''')');
            SQL.Add('  AND (IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
            SQL.Add('  AND (PLACONTA = '''+Espaco(CdsDet.FieldByName('PLACONTA').AsString, 18)+''')');
            SQL.Add('  AND (PLANO = '+ CdsDet.FieldByName('PLANO').AsString+')');

            if not(CdsDet.FieldByName('IDPLANOPREV').isNull) then
               SQL.Add('  AND (IDPLANOPREV = '+ CdsDet.FieldByName('IDPLANOPREV').AsString + ')')
            else
               SQL.Add('  AND (IDPLANOPREV IS NULL)');

            if not(CdsDet.FieldByName('IDPATRO').isNull) then
               SQL.Add('  AND (IDPATRO = ' + CdsDet.FieldByName('IDPATRO').AsString+')')
            else
               SQL.Add('  AND (IDPATRO IS NULL)');

            if not(CdsDet.FieldByName('UNIDNEGOC').isNull) then
            begin
               SQL.Add('  AND (UNIDNEGOC = '+CdsDet.FieldByName('UNIDNEGOC').AsString+')');
               SQL.Add('  AND (IDPESSOA = '+CdsDet.FieldByName('IDPESSOA').AsString+')');
            end
            else
            begin
               SQL.Add('  AND (UNIDNEGOC IS NULL)');
            end;

            if (not(CdsDet.FieldByName('CODCENTROCUSTO').isNull) and not(CdsDet.FieldByName('IDEMPRESA').isNull)) then
            begin
               SQL.Add('  AND (CODCENTROCUSTO = '''+ CdsDet.FieldByName('CODCENTROCUSTO').AsString + ''')');
               SQL.Add('  AND (IDEMPRESA = ' + CdsDet.FieldByName('IDEMPRESA').AsString + ')');
            end else begin

              //Marilza Colpani 26/03/2009 N.Sol 109826/N.Kintana 498982
              //substutído a condição de is null para '='
               SQL.Add('  AND (CODCENTROCUSTO = '''')');
            end;
            CdsTestaComposicao.Data := Data;

            if not(CdsTestaComposicao.isEmpty) then
            begin
               // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
               // e esta atualiza a propriedade 'Confirmado'
               Mensagem.Text := 'Existe Composição de Contabilidade Repetida com a Conta Orçamentária ' +
                                CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString + '. Confirma?';

               if not(Confirmado) then Exit;
            end;
         end;

         CdsDet.Next;
      end;
     //

     pgbStatusAtualiza(2);

     CdsDetContaOrc.First;
     while (not CdsDetContaOrc.EOF) do begin
        CdsDetContaOrc.Edit;

        if (CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').isNull) and (not bAtualizaGrupo)then
            CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

        if CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').isNull then
           CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

        if CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').isNull then
           CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

        CdsDetContaOrc.Post;
        CdsDetContaOrc.Next;
     end;

     //
     pgbStatusAtualiza(3);
     CdsDetFluxo.First;
     while (not CdsDetFluxo.EOF) do begin
        CdsDetFluxo.Edit;

        if (CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger = 0) and (not bAtualizaGrupo) then
            CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

        if CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString = '' then
           CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

        if CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger = 0 then
           CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

        CdsDetFluxo.Post;
        //
        with QryTestaComposicao do begin

           SQL.Clear;
           SQL.Add('SELECT IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
           SQL.Add('WHERE (IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN').AsString+''')');
           SQL.Add('  AND (IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
           SQL.Add('  AND (CODTIPRECDES = '''+Espaco(CdsDetFluxo.FieldByName('CODTIPRECDES').AsString,15)+''')');
           SQL.Add('  AND (RECPAG = '''+CdsDetFluxo.FieldByName('RECPAG').AsString+''')');
           SQL.Add('  AND (IDPESSOA = '+CdsDetFluxo.FieldByName('IDPESSOA').AsString+')');
           if not CdsDetFluxo.FieldByName('IDPLANOPREV').isNull then
              SQL.Add('  AND (IDPLANOPREV = '+CdsDetFluxo.FieldByName('IDPLANOPREV').AsString+')')
           else
              SQL.Add('  AND (IDPLANOPREV IS NULL)');
           if not CdsDetFluxo.FieldByName('IDPATRO').isNull then
              SQL.Add('  AND (IDPATRO = '+CdsDetFluxo.FieldByName('IDPATRO').AsString+')')
           else
              SQL.Add('  AND (IDPATRO IS NULL)');
           if not CdsDetFluxo.FieldByName('UNIDNEGOC').isNull then
              SQL.Add('  AND (UNIDNEGOC = '+CdsDetFluxo.FieldByName('UNIDNEGOC').AsString+')')
           else
              SQL.Add('  AND (UNIDNEGOC IS NULL)');
           if not CdsDetFluxo.FieldByName('CODCENTRORESPON').isNull then
              SQL.Add('  AND (CODCENTRORESPON = '''+CdsDetFluxo.FieldByName('CODCENTRORESPON').AsString+''')')
           else
              SQL.Add('  AND (CODCENTRORESPON IS NULL)');
           if not CdsDetFluxo.FieldByName('CODCENTROCUSTO').isNull then begin
              SQL.Add('  AND (CODCENTROCUSTO = '''+CdsDetFluxo.FieldByName('CODCENTROCUSTO').AsString+''')');
              SQL.Add('  AND (IDEMPRESA = '+CdsDetFluxo.FieldByName('IDEMPRESA').AsString+')');
           end else begin
              SQL.Add('  AND (CODCENTROCUSTO IS NULL)');
           end;
           CdsTestaComposicao.Data := Data;

            if not(CdsTestaComposicao.isEmpty) then
            begin
               // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
               // e esta atualiza a propriedade 'Confirmado'
               Mensagem.Text := 'Existe Composição de Fluxo de Caixa Repetida com a Conta Orçamentária ' +
                                CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString +
                                '. Confirma?';

               if not(Confirmado) then Exit;
            end;
         end;
         CdsDetFluxo.Next;
      end;

      pgbStatusAtualiza(4);

      CdsDetContaRea.First;
      while not(CdsDetContaRea.EOF) do
      begin
         CdsDetContaRea.Edit;

         if (CdsDetContaRea.FieldByName('IDCOMPCONTASORC').isNull) and (not bAtualizaGrupo)then
             CdsDetContaRea.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

         if CdsDetContaRea.FieldByName('IDCONTAORCAMEN').isNull  then
            CdsDetContaRea.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

         if CdsDetContaRea.FieldByName('IDPLANOORCAMEN').isNull  then
            CdsDetContaRea.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

         CdsDetContaRea.Post;
         CdsDetContaRea.Next;
      end;

      pgbStatusAtualiza(5);
      CdsDetCond.First;

      while not(CdsDetCond.EOF) do
      begin
         CdsDetCond.Edit;

         if (CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger < 1) and (not bAtualizaGrupo) then
             CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

         if CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString = '' then
            CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

         if CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger < 1 then
            CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

         CdsDetCond.Post;
         CdsDetCond.Next;
      end;
   end;
end;


procedure TCtrlCadContasOrc.AbreQueries(bPorGrupoOrc: boolean = false);
var
   sSQL: string;
begin
   pgbStatusAtualiza(3);
   bPorGrupo := bPorGrupoOrc;

   CdsAuxContab.Data := GetDataPacket('SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(idEmpresa));

   //Seleciona os Grupos Orçamentários

   // Thiago Melo SOL 219324 Kintana 2051326
   if CdsGrupo.IsEmpty then begin
     CdsGrupo.Data := GetDataPacket('SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, ' +
                                    '       IDPLANOORCAMEN, ' +  // Edilaine - SOL 172383-7764 / KTN 1556975
                                    '       FLGANALSINT, CODGRUPOORC, FLGSINALGRUPO ' +
                                    'FROM GRUPOORCAMEN ');
   end;
   // Thiago Melo SOL 219324 Kintana 2051326

   if idEmpresaAux <> idEmpresa then begin // Thiago Melo SOL 219324 Kintana 2051326
     //Seleciona os Centros de Responsabilidade das Contas Orçamentários
     if bPorGrupoOrc then
        sSQL := 'SELECT CODCENTRORESPON, NOME, CODEXTERNO, NVL(ATIVO, ''S'') AS ATIVO ' +
                'FROM CENTRESPON ' +
                'WHERE (IDPESSOA = ' + IntToStr(idEmpresa) + ')  AND ' +
                //pendência 26820 - 24/11/2007 - este filtro foi retirado porque nas telas
                //de cadastro não estava sendo possível visualizar os centros de responsabilidade
                //que formam cadastrados para as contas e que posteriormente foram desativados
  //              '      (ATIVO    = ''S'') AND ' +
                '      (ANALITICOSINTET = ''A'') ' +
                ' ORDER BY NOME '
     else
        sSQL := 'SELECT CODCENTRORESPON, NOME, CODEXTERNO, NVL(ATIVO, ''S'') AS ATIVO ' +
                'FROM CENTRESPON ' +
                'WHERE (IDPESSOA = ' + IntToStr(idEmpresa) + ') ' +
                //pendência 26820 - 24/11/2007 - este filtro foi retirado porque nas telas
                //de cadastro não estava sendo possível visualizar os centros de responsabilidade
                //que formam cadastrados para as contas e que posteriormente foram desativados
  //              '      (ATIVO    = ''S'') ' +
                ' ORDER BY NOME ';

     CdsCenRespConta.Data := GetDataPacket(sSQL);
   end; // Thiago Melo SOL 219324 Kintana 2051326


   pgbStatusAtualiza(6);
   if bPorGrupoOrc then
   begin
      //Seleciona Grupos Orçamentários
      // O alias foi implementado aqui somente para manter a compatibilidade das outras telas que chamam este método
      CdsContasOrc.Data := GetDataPacket('SELECT IDGRUPOORCAMEN AS IDCONTAORCAMEN,CODGRUPOORC, ' +
                                         'NOMEGRUPOORCAMEN AS NOMECONTAORCAMEN ' +
                                         'FROM GRUPOORCAMEN ' +
                                         'WHERE IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) +
                                         'ORDER BY CODGRUPOORC ');
      CdsContaContab.Data := CdsContasOrc.Data;
   end
   else
      //Seleciona as Contas Orçamentários
      CdsContasOrc.Data := GetDataPacket('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN FROM CONTASORCAMEN WHERE IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ' ORDER BY NOMECONTAORCAMEN');

   //Seleciona as Contas Orçamentárias das Condições
   pgbStatusAtualiza(7);
   CdsContaCondIni.Data := CdsContasOrc.Data;

   pgbStatusAtualiza(8);
   CdsContaCondFim.Data := CdsContasOrc.Data;

   pgbStatusAtualiza(9);
   CdsContaCondRes.Data := CdsContasOrc.Data;

   //Seleciona Tipos de Recebimento
   pgbStatusAtualiza(10);


   if idEmpresaAux <> idEmpresa then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsTipoRD.Data := GetDataPacket('SELECT * FROM TIPORECEBDESEMB WHERE IDPESSOA = ' + IntToStr(idEmpresa) + ' ORDER BY DESCRICAO, RECPAG,CODTIPRECDES');
   end;


   //Seleciona Centros de Responsabilidade
   pgbStatusAtualiza(11);
   CdsCentroRespon.Data := CdsCenRespConta.Data;

   //Seleciona Unidades de Negócio
   pgbStatusAtualiza(12);
   if idEmpresaAux <> idEmpresa then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsUnidNegoc.Data := GetDataPacket(' SELECT UNIDNEGOC, NOME, UNECODIGO, UNETIPO ' +

                                        ' FROM UNIDNEGOCIO ' +
                                        //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
                                        //'WHERE IDPESSOA = ' + IntToStr(idEmpresa) + ' ORDER BY NOME');
                                        ' WHERE IDPESSOA = ' + IntToStr(idEmpresa) +
                                        ' AND UNETIPO = '+ QuotedStr('A') +
                                        ' AND ATIVO = '+ QuotedStr('S') +
                                        ' ORDER BY NOME');
                                        //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM

     //Seleciona Unidades de Negócio
     pgbStatusAtualiza(13);
     CdsUnidNegocConta.Data := CdsUnidNegoc.Data;
   end; // Thiago Melo SOL 219324 Kintana 2051326

   //Seleciona os Centros de Custo
   pgbStatusAtualiza(14);
   if idEmpresaAux <> idEmpresa then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsCCusto.Data := GetDataPacket('SELECT CODCENTROCUSTO, NOME,CODEXTERNO ' +
                                     'FROM CENTCUST ' +
                                     'WHERE IDEMPRESA = ' + IntToStr(idEmpresa) + ' AND ' +
                                     '      ATIVO     = ''S'' ORDER BY NOME ');
     CdsCCustoConta.Data := CdsCCusto.Data;
   end;

   //Seleciona os Centros de Custo do Fluxo de Caixa
   pgbStatusAtualiza(16);

   if idEmpresaAux <> idEmpresa then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsCCustoFluxo.Data := GetDataPacket('SELECT CODCENTROCUSTO, NOME ' +
                                          'FROM CENTCUST ' +
                                          'WHERE IDEMPRESA = ' + IntToStr(idEmpresa) + ' AND ' +
                                          '      ATIVO <> ''N'' ORDER BY NOME');
   end;

   idEmpresaAux := idEmpresa; // Thiago Melo SOL 219324 Kintana 2051326

   // Plano Contábil
   pgbStatusAtualiza(17);
   if CdsPlanoContabil.IsEmpty then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsPlanoContabil.Data := GetDataPacket('SELECT PLANO, DESCPLANO, MASCARA FROM PLANO ORDER BY PLANO DESC');
   end;

   // Plano Previdenciário
   pgbStatusAtualiza(18);

   if CdsPlanoPrev.IsEmpty then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsPlanoPrev.Data      := GetDataPacket('SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME');
     CdsPlanoPrevConta.Data := CdsPlanoPrev.Data;
   end;

   // Patrocinadora
   pgbStatusAtualiza(20);
   if CdsPatro.IsEmpty then begin // Thiago Melo SOL 219324 Kintana 2051326
     CdsPatro.Data      := GetDataPacket('SELECT P.NOME, PT.IDPESSOA FROM PESSOA P, PATRO PT WHERE (P.IDPESSOA = PT.IDPESSOA)');
     CdsPatroConta.Data := CdsPatro.Data;
   end;

   //Ricardo SOl 159215 Kintana 1337816
   if cdsPrograma.IsEmpty then begin // Thiago Melo SOL 219324 Kintana 2051326
     cdsPrograma.Data      := GetDataPacket('SELECT IDPROGRAMAORCAMEN,DESCRICAO_PROGRAMAORCAMEN AS NOME FROM CM.PROGRAMAORCAMEN ORDER BY IDPROGRAMAORCAMEN');
     cdsProgramaConta.Data := CdsPrograma.Data;
     CdsProgramaFluxo.Data := CdsPrograma.Data;
   end;
   
   if cdsTipoDespesa.IsEmpty then begin // Thiago Melo SOL 219324 Kintana 2051326
     cdsTipoDespesa.Data      := GetDataPacket('SELECT IDTIPO_DEPESAORCAMEN,DESCRICAO_TIPO_DEPESAOCAMEN AS NOME FROM CM.TIPO_DESPESAORCAMEN ORDER BY IDTIPO_DEPESAORCAMEN');
     CdsTipoDespesaConta.Data := CdsTipoDespesa.Data;
     CdsTipoDespesaFluxo.Data := CdsTipoDespesa.Data;
   end;
   //Ricardo SOl 159215 Kintana 1337816 - fim

   Cds.OnCalcFields             := CdsCalcFields;
   CdsDetCond.OnCalcFields      := CdsDetCondCalcFields;
   CdsTodoDet.OnCalcFields      := CdsCalcFields;
   CdsMovOrcamento.OnCalcFields := CdsCalcFields;
end;



procedure TCtrlCadContasOrc.CdsCalcFields(DataSet: TDataSet);
begin
   with dtmCadContasOrcamen.qryGrupoAux do
   begin
      SQL.Clear;
      SQL.Add('SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC, ');
      SQL.Add('       IDPLANOORCAMEN ');  // Edilaine - SOL 172383-7764 / KTN 1556975
      SQL.Add('FROM GRUPOORCAMEN WHERE IDGRUPOORCAMEN =:IDGRUPOORCAMEN');
      Prepare;
      ParamByName('IDGRUPOORCAMEN').asInteger := Cds.FieldByName('IDGRUPOORCAMEN').asInteger;

      CdsGrupoAux.Data := Data;

      Cds.FieldByName('DESCGRUPO').asString := FormatMaskText((Trim(sMascaraGrupo) + ';0;_'),
                                               CdsGrupoAux.FieldByName('CODGRUPOORC').asString) + ' - ' +
                                               CdsGrupoAux.FieldByName('NOMEGRUPOORCAMEN').asString;
   end;
end;



procedure TCtrlCadContasOrc.CdsDetCondCalcFields(DataSet: TDataSet);
var
   sDescricao : String;
begin
   inherited;

   sDescricao := '';

   with CdsDetCond do
   begin
      if bPorGrupo then
         sDescricao := sDescricao + 'Se o Grupo ' + FieldByName('IDCONTACONDINI').asString
      else
         sDescricao := sDescricao + 'Se a Conta ' + FieldByName('IDCONTACONDINI').asString;

      if FieldByName('CONDICAO').asString = '<=' then sDescricao := sDescricao + ' for menor ou igual ';
      if FieldByName('CONDICAO').asString = '<'  then sDescricao := sDescricao + ' for menor ';
      if FieldByName('CONDICAO').asString = '='  then sDescricao := sDescricao + ' for igual ';
      if FieldByName('CONDICAO').asString = '>=' then sDescricao := sDescricao + ' for maior ou igual ';
      if FieldByName('CONDICAO').asString = '>'  then sDescricao := sDescricao + ' for maior ';
      if FieldByName('CONDICAO').asString = '<>' then sDescricao := sDescricao + ' for diferente ';

      if FieldByName('TIPOCONDINI').asString = 'V' then sDescricao := sDescricao + 'que o Valor ' + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDINI').asFloat);

      if bPorGrupo then
      begin
         if FieldByName('TIPOCONDINI').asString = 'C' then
            sDescricao := sDescricao + 'que o Grupo ' + FieldByName('IDCONTACONDFIM').asString;
      end
      else
         if FieldByName('TIPOCONDINI').asString = 'C' then sDescricao := sDescricao + 'que a Conta ' + FieldByName('IDCONTACONDFIM').asString;
         
      sDescricao := sDescricao + ' então a condição receberá o Valor ';

      if FieldByName('TIPOCONDRES').asString = 'V' then sDescricao := sDescricao + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDRES').asFloat);

      if bPorGrupo then
      begin
         if FieldByName('TIPOCONDRES').asString = 'C' then sDescricao :=
            sDescricao + 'do Grupo ' + FieldByName('IDCONTACONDRES').asString;
      end
      else
         if FieldByName('TIPOCONDRES').asString = 'C' then sDescricao := sDescricao + 'da Conta ' + FieldByName('IDCONTACONDRES').asString;

      FieldByName('CONDDESCRICAO').asString := sDescricao;
   end;
end;





procedure TCtrlCadContasOrc.CadastroDelete;
begin
   // Faz a deleção em cascata dos registros filhos e depois do pai

   with dtmCadContasOrcamen do
   begin
      QryTodoDet.Prepare;
      QryTodoDet.ParamByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      QryTodoDet.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
      CdsTodoDet.Data := qryTodoDet.Data;

      CdsTodoDet.First;
      while not(CdsTodoDet.EOF) do CdsTodoDet.Delete;

      CdsMovOrcamento.First;
      while not(CdsMovOrcamento.EOF) do CdsMovOrcamento.Delete;

      Cds.Delete;
   end;

   AplicaOperacaoCadContasOrcDelete;
end;



procedure TCtrlCadContasOrc.AbreQryMovOrcamento;
begin
   with dtmCadContasOrcamen do
   begin
      QryMovOrcamento.Prepare;
      QryMovOrcamento.ParamByName('IDCONTAORCAMEN').AsString  := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      QryMovOrcamento.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
      CdsMovOrcamento.Data := qryMovOrcamento.Data;
   end;
end;



procedure TCtrlCadContasOrc.ValoresDefault;
begin
   // Inicializa os valores default's da tela de cadastro
   Cds.FieldByName('TIPOCALCREALIZADO').AsString := 'V';
   Cds.FieldByName('TIPOCALCORCADO').AsString    := 'V';
   Cds.FieldByName('FLGCONTAMONETARIA').AsString := 'S';
   Cds.FieldByName('FLGINFDIAMES').AsString      := 'P';
   Cds.FieldByName('FLGACUMULADO').AsString      := 'S';
   Cds.FieldByName('FLGTRANSFSALDO').AsString    := 'N';
   Cds.FieldByName('FLGATIVA').AsString          := 'A';
   Cds.FieldByName('IDPLANOORCAMEN').AsInteger   := iPlanoOrc;
   Cds.FieldByName('IDPESSOA').AsInteger         := idEmpresa;
   Cds.FieldByName('FLGSINALCONTA').AsString     := 'P';
   Cds.FieldByName('FLGTRANSFORIGDIF').AsString  := 'N';  // Edilaine - SOL 190311 / KTN 1799290
end;



procedure TCtrlCadContasOrc.CadastroConfirma(pdbeCodigoContaOrc : String;
                                              pmemSQLLines       : String);
var
   iNovaConsulta : LongInt;
begin
   // iNovaConsulta := 0;
   if Cds.FieldByName('TIPOCALCREALIZADO').asString = 'G' then
   begin
      with CdsDataView do
      begin

      Data := dtmCadContasOrcamen.qryDataView.Data;

      if Cds.FieldByName('IDDATAVIEW').asInteger = 0 then //Cds.State = dsInsert then begin
      begin
         Append;
         iNovaConsulta := GetSequence('DATAVIEW');
      end
      else
      begin // if Cds.State = dsEdit then begin
         Edit;
         iNovaConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;
      end;

      // if Cds.State in ([dsEdit, dsInsert]) then begin

         FieldByName('NAME').asString              := 'Consulta do Orçamento Conta ' + pdbeCodigoContaOrc;
         FieldByName('IDDATAVIEW').asInteger       := iNovaConsulta;
         FieldByName('CLASSNAME').asString         := 'Orçamento';
         FieldByName('ORIGEMCMDV').asString        := '0';
         FieldByName('TEMPLATE').asString          := pmemSQLLines;

         Post;

         Cds.FieldByName('IDDATAVIEW').asInteger   := iNovaConsulta;
         Cds.FieldByName('ORIGEMCMDV').asString    := '0';

      // end
      end;
   end;

   AplicaOperacaoCadContasOrcGravar;
end;



procedure TCtrlCadContasOrc.ProcessaDetalheConfirma1(psePosIni1   : Real;
                                                     psePosFim1   : Real;
                                                     pedConteudo1 : String;
                                                     prPerc       : Real);
begin
   CdsDetContaOrc.Delete;

   with dtmCadContasOrcamen.qryContasRef do
   begin
      Unprepare;
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
      SQL.Add('FROM CONTASORCAMEN  ');
      SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1) + ',' + FloatToStr(psePosFim1)+') IN ('+trim(pedConteudo1)+')) ');
      SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
      Prepare;

      CdsContasRef.Data := Data;
   end;

   CdsContasRef.First;
   while not(CdsContasRef.EOF) do
   begin
      CdsDetContaOrc.Insert;
      CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString := CdsContasRef.FieldByName('IDCONTAORCAMEN').AsString;
      CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasRef.FieldByName('NOMECONTAORCAMEN').AsString;
      CdsDetContaOrc.FieldByName('PERCCONTAREFORC').AsFloat   := prPerc;
      CdsContasRef.Next;
   end;

   CdsDetContaOrc.Edit;
end;



procedure TCtrlCadContasOrc.ProcessaDetalheConfirma2(psePosIni2   : Real;
                                                     psePosFim2   : Real;
                                                     pedConteudo2 : String;
                                                     prPerc       : Real);
begin
   CdsDetContaRea.Delete;

   with dtmCadContasOrcamen.qryContasRef do
   begin
      Unprepare;
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
      SQL.Add('FROM CONTASORCAMEN  ');
      SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni2)+','+FloatToStr(psePosFim2)+') IN ('+trim(pedConteudo2)+')) ');
      SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
      Prepare;

      CdsContasRef.Data := Data;
   end;

   CdsContasRef.First;
   while not(CdsContasRef.EOF) do
   begin
      CdsDetContaRea.Insert;
      CdsDetContaRea.FieldByName('IDCONTAREFREAL').AsString   := CdsContasRef.FieldByName('IDCONTAORCAMEN').AsString;
      CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasRef.FieldByName('NOMECONTAORCAMEN').AsString;
      CdsDetContaRea.FieldByName('PERCCONTAREFREA').AsFloat   := prPerc;
      CdsContasRef.Next;
   end;

   CdsDetContaRea.Edit;
end;



procedure TCtrlCadContasOrc.AbreqryAuxContab;
begin
   with dtmCadContasOrcamen.qryAuxContab do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := idEmpresa;

      CdsAuxContab.Data := Data;
   end;
end;



procedure TCtrlCadContasOrc.btnImportaContabClick(var pdbeNomeContaOrc   : String;
                                                  var pdbeCodigoContaOrc : String;
                                                  var sConta             : String
                                                 );
begin
   with dtmCadContasOrcamen.qryContaContab do
   begin
      Prepare;
      ParamByName('PLANO').asInteger   := CdsAuxContab.FieldByName('PLANO').asInteger;
      ParamByName('PLACONTA').asString := Trim(sConta);

      CdsContaContab.Data := Data;
   end;

   Cds.FieldByName('NOMECONTAORCAMEN').asString := CdsContaContab.FieldByName('PLANOME').asString;
   Cds.FieldByName('IDCONTAORCAMEN').asString   := CdsContaContab.FieldByName('PLACONTA').asString;

   pdbeNomeContaOrc   := CdsContaContab.FieldByName('PLANOME').asString;
   pdbeCodigoContaOrc := CdsContaContab.FieldByName('PLACONTA').asString;
end;



procedure TCtrlCadContasOrc.ProcessabtnTransfClick1;
begin
   with CdsDetContaRea do
   begin
      First;
      while not(EOF) do
      begin
         CdsDetContaOrc.Append;

         CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString := FieldByName('IDCONTAREFREAL').AsString;
         CdsDetContaOrc.FieldByName('PERCCONTAREFORC').AsFloat   := FieldByName('PERCCONTAREFREA').AsFloat;
         CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');
         CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').AsString   := FieldByName('IDCONTAORCAMEN').AsString;
         CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger  := FieldByName('IDPLANOORCAMEN').AsInteger;
         CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString := FieldByName('NOMECONTAORCAMEN').AsString;
         CdsDetContaOrc.Post;

         Next;
      end;
   end;
end;



procedure TCtrlCadContasOrc.ProcessabtnTransfClick2;
begin
   with CdsDetContaOrc do
   begin
      First;
      while not EOF do
      begin
         CdsDetContaRea.Append;
         CdsDetContaRea.FieldByName('IDCONTAREFREAL').asString  := FieldByName('IDCONTAREFORCADO').asString;
         CdsDetContaRea.FieldByName('PERCCONTAREFREA').asFloat   := FieldByName('PERCCONTAREFORC').asFloat;
         CdsDetContaRea.FieldByName('IDCOMPCONTASORC').asInteger := GetSequence('COMPCONTASORCAMEN');
         CdsDetContaRea.FieldByName('IDCONTAORCAMEN').asString   := FieldByName('IDCONTAORCAMEN').asString;
         CdsDetContaRea.FieldByName('IDPLANOORCAMEN').asInteger  := FieldByName('IDPLANOORCAMEN').asInteger;
         CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').asString := FieldByName('NOMECONTAORCAMEN').asString;
         CdsDetContaRea.Post;

         Next;
      end;
   end;
end;



function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcDelete : Boolean ;
var
   Msg : String;
begin
   if (ConnectionSide = cnsClient) then
   begin
      Result := Connection.AppServer.AplicaOperacaoCadContasOrcDelete(FCdsMovOrcamento.Data, FCdsTodoDet.Data, FCds.Data);

      if not(Result) then
      begin
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         StartTransaction;

      // itens Filhos
      Result := ApplyCds(FCdsMovOrcamento, _dbSaldoOrcado,
                          [_dbContasOrcamen.IdPessoa, _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen],
                          [_dbSaldoOrcado.IdPessoa,   _dbSaldoOrcado.IdPlanoOrcamen,   _dbSaldoOrcado.IdContaOrcamen]);

      Msg    := _dbSaldoOrcado.MessageInfo;
      if (not Result) then begin

        raise Exception.Create(Msg);
      end;

         // itens Filhos
         Result := ApplyCds(FCdsTodoDet,
                            _dbCompContasOrcamen,
                            [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen],
                            [_dbCompContasOrcamen.IdPlanoOrcamen, _dbCompContasOrcamen.IdContaOrcamen]
                           );

         Msg := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         // Pai
         Result := ApplyCds(FCds, _dbContasOrcamen, [], []);
         Msg    := _dbContasOrcamen.MessageInfo;

         if (not Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

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



function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcGravar: Boolean;
var
   Msg, s : String;


begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCadContasOrcGravar(FCds.Data,
                                                                      FCdsDet.Data,
                                                                      FCdsDetContaOrc.Data,
                                                                      FCdsDetFluxo.Data,
                                                                      FCdsDetContaRea.Data,
                                                                      FCdsDetCond.Data,
                                                                      FCdsDataView.Data
                                                                     );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

       { pendência 27286 - 24/01/2007 - ???? - comentei o código abaixo pois estava dando erro, mesmo se não desse erro
         não serveria para nada.

         // Se por algum motivo (queda de energia, travamento do sistema, etc...)
         //a conta-espelho não for excluída, deletar a mesma.
         _Cds.Data := GetDataPacket('SELECT IDCONTAORCAMEN FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = -1');
         if not _Cds.IsEmpty then
         begin
             if not ExecSQL('DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = -1') then
                raise Exception.Create(MessageInfo);

             if not ExecSQL('DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = -1') then
                raise Exception.Create(MessageInfo);
         end;
         }


         // Pai ------------------------------------------------------------------------------------
         Result := ApplyCds(FCds, _dbContasOrcamen, [], []);
         Msg    := _dbContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);

         // ----------------------------------------------------------------------------------------

         // itens Filhos
         Result := ApplyCds(FCdsDet, _dbDet, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDet.IdPlanoOrcamen, _dbDet.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetContaOrc, _dbDetContaOrc, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaOrc.IdPlanoOrcamen, _dbDetContaOrc.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetFluxo, _dbDetFluxo, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetFluxo.IdPlanoOrcamen, _dbDetFluxo.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetContaRea, _dbDetContaRea, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaRea.IdPlanoOrcamen, _dbDetContaRea.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDetCond, _dbDetCond, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetCond.IdPlanoOrcamen, _dbDetCond.IdContaOrcamen]);
         Msg    := _dbCompContasOrcamen.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Result := ApplyCds(FCdsDataView, _dbDataView, [], []);
         Msg    := _dbDataView.MessageInfo;

         if not(Result) then raise Exception.Create(Msg);
         // ----------------------------------------------------------------------------------------

         Commit;

      except
         on E:Exception do begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



procedure TCtrlCadContasOrc.pgbStatusAtualiza(pPos : Integer);
begin
   //pgbStatus.Visible  := True;   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentado
   pgbStatus.Position := pPos;
   pgbStatus.Repaint;
end;



function TCtrlCadContasOrc.VerificaLinhaGrid(Cds                : TClientDataSet;
                                             iTagChave          : Integer;
                                             iTagVazio          : Integer;
                                             sTabelaMensagem    : String;
                                             bPermiteChaveVazia : Boolean
                                            ): Boolean;
var
   X          : Integer;
   sChave     : String;
   ListaChave : TStrings;
begin
   ListaChave := TStringList.Create;

   if Cds.IsEmpty then
   begin
      Result := True;
      Exit;
   end;

   try
      Cds.First;

      while not(Cds.EOF) do
      begin
         sChave := '';

         for X:=0 To Cds.FieldCount - 1 do
         begin
            if (Cds.Fields[X].Tag = iTagChave) Or (Cds.Fields[X].Tag = iTagVazio) then
            begin
               sChave  := sChave + Trim(Cds.Fields[X].AsString);

               if not(bPermiteChaveVazia) and (Cds.Fields[X].Tag <> iTagVazio) then
               begin
                  if Cds.Fields[X].IsNull then
                  begin
                    MessageInfo := 'O Campo ' + Cds.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado';
                    Result := False;
                    Exit;
                  end;
               end;

            end;
         end;

         if ListaChave.IndexOf(sChave) <> -1 then
         begin
            MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido';
            Result      := False;
            Exit;
         end
         else
         begin
            if sChave = '' then
            begin
               MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido';
               Result      := False;
               Exit;
            end
            else
            begin
               ListaChave.Add(sChave);
            end;
         end;

         Cds.Next;
      end;

      Cds.First;
      Result := True;

   finally
      ListaChave.Free;
   end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlCadContasOrc.SetCds(const Value : TClientDataSet) ;
begin
   FCds := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDet(const Value: TClientDataSet);
begin
   FCdsDet := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetCond(const Value: TClientDataSet);
begin
   FCdsDetCond := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCustoConta(const Value: TClientDataSet);
begin
   FCdsCCustoConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCenRespConta(const Value: TClientDataSet);
begin
   FCdsCenRespConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPatroConta(const Value: TClientDataSet);
begin
   FCdsPatroConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoPrevConta(const Value: TClientDataSet);
begin
   FCdsPlanoPrevConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsUnidNegocConta(const Value: TClientDataSet);
begin
   FCdsUnidNegocConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsGrupo(const Value: TClientDataSet);
begin
   FCdsGrupo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaContabil(const Value: TClientDataSet);
begin
   FCdsContaContabil := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDataView(const Value: TClientDataSet);
begin
   FCdsDataView := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetContaOrc(const Value: TClientDataSet);
begin
   FCdsDetContaOrc := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetContaRea(const Value: TClientDataSet);
begin
   FCdsDetContaRea := Value;
end;

procedure TCtrlCadContasOrc.SetCdsDetFluxo(const Value: TClientDataSet);
begin
   FCdsDetFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsMovOrcamento(const Value: TClientDataSet);
begin
   FCdsMovOrcamento := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTodoDet(const Value: TClientDataSet);
begin
   FCdsTodoDet := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContasRef(const Value: TClientDataSet);
begin
   FCdsContasRef := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContasOrc(const Value: TClientDataSet);
begin
   FCdsContasOrc := Value;
end;

procedure TCtrlCadContasOrc.SetCdsAuxContab(const Value: TClientDataSet);
begin
   FCdsAuxContab := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaContab(const Value: TClientDataSet);
begin
   FCdsContaContab := Value;
end;

procedure TCtrlCadContasOrc.SetCdsAux(const Value: TClientDataSet);
begin
   FCdsAux := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCusto(const Value: TClientDataSet);
begin
   FCdsCCusto := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCCustoFluxo(const Value: TClientDataSet);
begin
   FCdsCCustoFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsCentroRespon(const Value: TClientDataSet);
begin
   FCdsCentroRespon := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondFim(const Value: TClientDataSet);
begin
   FCdsContaCondFim := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondIni(const Value: TClientDataSet);
begin
   FCdsContaCondIni := Value;
end;

procedure TCtrlCadContasOrc.SetCdsContaCondRes(const Value: TClientDataSet);
begin
   FCdsContaCondRes := Value;
end;

procedure TCtrlCadContasOrc.SetCdsGrupoAux(const Value: TClientDataSet);
begin
   FCdsGrupoAux := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPatro(const Value: TClientDataSet);
begin
   FCdsPatro := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoContabil(const Value: TClientDataSet);
begin
   FCdsPlanoContabil := Value;
end;

procedure TCtrlCadContasOrc.SetCdsPlanoPrev(const Value: TClientDataSet);
begin
   FCdsPlanoPrev := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTestaComposicao( const Value: TClientDataSet);
begin
   FCdsTestaComposicao  := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTipoRD(const Value: TClientDataSet);
begin
   FCdsTipoRD := Value;
end;

procedure TCtrlCadContasOrc.SetCdsUnidNegoc(const Value: TClientDataSet);
begin
   FCdsUnidNegoc := Value;
end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------


procedure TCtrlCadContasOrc.SetCdsFormulaApuracao(const Value: TClientDataSet);
begin
  FCdsFormulaApuracao := Value;
end;




function TCtrlCadContasOrc.AlteraGrupoContasOrcamen: boolean;
var
  CdsContasOrcamen,
  CdsDetAux,
  CdsDetContaOrcAux,
  CdsDetContaReaAux,
  CdsDetFluxoAux,
  CdsDetCondAux : TClientDataSet;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteraGrupoContasOrcamen(FCds.Data,
                                                              FCdsDet.Data,
                                                              FCdsDetContaOrc.Data,
                                                              FCdsDetFluxo.Data,
                                                              FCdsDetContaRea.Data,
                                                              FCdsDetCond.Data,
                                                              FCdsDataView.Data
                                                             );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;
         // Exclui a conta-espelho, caso exista a mesma
        
         if not ExecSQL('DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ') then
            raise Exception.Create(MessageInfo);
         if not ExecSQL('DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ') then
            raise Exception.Create(MessageInfo);

         Result            := True;
         CdsContasOrcamen  := TClientDataSet.Create(nil);
         CdsDetAux         := TClientDataSet.Create(nil);
         CdsDetContaOrcAux := TClientDataSet.Create(nil);
         CdsDetContaReaAux := TClientDataSet.Create(nil);
         CdsDetFluxoAux    := TClientDataSet.Create(nil);
         CdsDetCondAux     := TClientDataSet.Create(nil);

         CdsContasOrcamen.Data := GetDataPacket('SELECT * FROM CONTASORCAMEN ' +
                                               ' WHERE IDGRUPOORCAMEN = -1');
         // Pega os DataPackets dos Cds's somente para pegar sua estrutura
         CdsDetAux.Data         := FCdsDet.Data;
         CdsDetContaOrcAux.Data := FCdsDetContaOrc.Data;
         CdsDetContaReaAux.Data := FCdsDetContaRea.Data;
         CdsDetFluxoAux.Data    := FCdsDetFluxo.Data;
         CdsDetCondAux.Data     := FCdsDetCond.Data;

         // Zera os Cds's
         CdsDetAux.EmptyDataSet;
         CdsDetContaOrcAux.EmptyDataSet;
         CdsDetContaReaAux.EmptyDataSet;
         CdsDetFluxoAux.EmptyDataSet;
         CdsDetCondAux.EmptyDataSet;

         // Cria um registro novo para servir de conta-espelho na tabela CONTASORCAMEN
         //identificado pela chave '-1'
         CdsContasOrcamen.Append;
         //CdsContasOrcamen.Edit;
         CdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString    := '-1';
         CdsContasOrcamen.FieldByName('IDGRUPOORCAMEN').AsInteger   := FCds.FieldByName('IDGRUPOORCAMEN').AsInteger;
         CdsContasOrcamen.FieldByName('IDPLANOORCAMEN').AsInteger   := FCds.FieldByName('IDPLANOORCAMEN').AsInteger;
         CdsContasOrcamen.FieldByName('IDPESSOA').AsInteger         := FCds.FieldByName('IDPESSOA').AsInteger;
         CdsContasOrcamen.FieldByName('NOMECONTAORCAMEN').AsString  := FCds.FieldByName('NOMECONTAORCAMEN').AsString;
         CdsContasOrcamen.FieldByName('CODCENTRORESPON').AsString   := FCds.FieldByName('CODCENTRORESPON').AsString;
         CdsContasOrcamen.FieldByName('TIPOCALCORCADO').AsString    := FCds.FieldByName('TIPOCALCORCADO').AsString;
         CdsContasOrcamen.FieldByName('TIPOCALCREALIZADO').AsString := FCds.FieldByName('TIPOCALCREALIZADO').AsString;
         CdsContasOrcamen.FieldByName('FLGACUMULADO').AsString      := FCds.FieldByName('FLGACUMULADO').AsString;
         CdsContasOrcamen.FieldByName('FLGTRANSFSALDO').AsString    := FCds.FieldByName('FLGTRANSFSALDO').AsString;
         CdsContasOrcamen.FieldByName('FLGCONTAMONETARIA').AsString := FCds.FieldByName('FLGCONTAMONETARIA').AsString;
         CdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString     := FCds.FieldByName('FLGSINALCONTA').AsString;
         CdsContasOrcamen.FieldByName('DATAATIVA').AsString         := FCds.FieldByName('DATAATIVA').AsString;
         CdsContasOrcamen.FieldByName('DATAINATIVA').AsString       := FCds.FieldByName('DATAINATIVA').AsString;
         CdsContasOrcamen.FieldByName('FLGATIVA').AsString          := FCds.FieldByName('FLGATIVA').AsString;
         CdsContasOrcamen.FieldByName('OBSERVACAO').AsString        := FCds.FieldByName('OBSERVACAO').AsString;
         CdsContasOrcamen.FieldByName('FORMULAORCADO').AsString     := FCds.FieldByName('FORMULAORCADO').AsString;
         CdsContasOrcamen.FieldByName('FORMULAREALIZADO').AsString  := FCds.FieldByName('FORMULAREALIZADO').AsString;
         CdsContasOrcamen.FieldByName('VLRINFORMADOREAL').AsString  := FCds.FieldByName('VLRINFORMADOREAL').AsString;
         CdsContasOrcamen.FieldByName('VLRINFORMADOORC').AsString   := FCds.FieldByName('VLRINFORMADOORC').AsString;
         CdsContasOrcamen.FieldByName('FLGTRANSFORIGDIF').AsString  := FCds.FieldByName('FLGTRANSFORIGDIF').AsString;   // Edilaine - SOL 190311 / KTN 1799290
         CdsContasOrcamen.Post;

         if not ApplyCds(CdsContasOrcamen, _dbContasOrcamen, [], []) then
            raise Exception.Create(_dbContasOrcamen.MessageInfo);

         // Cria as composições-espelho da conta pai
         //É necessário fazer estes Append's, pois se não fosse assim,
         //o UpdateStatus viria errado para o método ApplyCds
         FCdsDet.First;
         while not FCdsDet.Eof do
         begin
            CdsDetAux.Append;
            CdsDetAux.FieldByName('PLANO').AsFloat            := FCdsDet.FieldByName('PLANO').AsFloat;
            CdsDetAux.FieldByName('PLACONTA').AsString        := FCdsDet.FieldByName('PLACONTA').AsString;
            CdsDetAux.FieldByName('UNIDNEGOC').AsString       := FCdsDet.FieldByName('UNIDNEGOC').AsString;
            CdsDetAux.FieldByName('CODCENTROCUSTO').AsString  := FCdsDet.FieldByName('CODCENTROCUSTO').AsString;
            CdsDetAux.FieldByName('IDPLANOPREV').AsInteger    := FCdsDet.FieldByName('IDPLANOPREV').AsInteger;
            CdsDetAux.FieldByName('IDPATRO').AsInteger        := FCdsDet.FieldByName('IDPATRO').AsInteger;
            CdsDetAux.FieldByName('IDEMPRESA').AsInteger      := FCdsDet.FieldByName('IDEMPRESA').AsInteger;
            CdsDetAux.FieldByName('IDPESSOA').AsInteger       := FCdsDet.FieldByName('IDPESSOA').AsInteger;
            CdsDetAux.FieldByName('IDCONTAORCAMEN').AsString  := '-1';
            CdsDetAux.FieldByName('IDPLANOORCAMEN').AsInteger := FCdsDet.FieldByName('IDPLANOORCAMEN').AsInteger;
            CdsDetAux.FieldByName('PLANOME').AsString         := FCdsDet.FieldByName('PLANOME').AsString;
            CdsDetAux.FieldByName('NOMECC').AsString          := FCdsDet.FieldByName('NOMECC').AsString;
            CdsDetAux.FieldByName('NOMEAP').AsString          := FCdsDet.FieldByName('NOMEAP').AsString;
            CdsDetAux.FieldByName('NOMEPLANO').AsString       := FCdsDet.FieldByName('NOMEPLANO').AsString;
            CdsDetAux.FieldByName('NOMEPATRO').AsString       := FCdsDet.FieldByName('NOMEPATRO').AsString;
            CdsDetAux.FieldByName('UNECODIGO').AsString       := FCdsDet.FieldByName('UNECODIGO').AsString;
            CdsDetAux.FieldByName('DESCPLANO').AsString       := FCdsDet.FieldByName('DESCPLANO').AsString;
            CdsDetAux.Post;
            FCdsDet.Next;
         end;

         FCdsDetContaOrc.First;
         while not FCdsDetContaOrc.Eof do
         begin
            CdsDetContaOrcAux.Append;
            CdsDetContaOrcAux.FieldByName('IDCONTAREFORCADO').AsString := FCdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString;
            CdsDetContaOrcAux.FieldByName('PERCCONTAREFORC').AsString  := FCdsDetContaOrc.FieldByName('PERCCONTAREFORC').AsString;
            CdsDetContaOrcAux.FieldByName('IDCONTAORCAMEN').AsString   := '-1';
            CdsDetContaOrcAux.FieldByName('IDPLANOORCAMEN').AsInteger  := FCdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger;
            CdsDetContaOrcAux.FieldByName('NOMECONTAORCAMEN').AsString := FCdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString;
            CdsDetContaOrcAux.Post;
            FCdsDetContaOrc.Next;
         end;

         FCdsDetContaRea.First;
         while not FCdsDetContaRea.Eof do
         begin
            CdsDetContaReaAux.Append;
            CdsDetContaReaAux.FieldByName('IDCONTAREFREAL').AsString   := FCdsDetContaRea.FieldByName('IDCONTAREFREAL').AsString;
            CdsDetContaReaAux.FieldByName('PERCCONTAREFREA').AsString  := FCdsDetContaRea.FieldByName('PERCCONTAREFREA').AsString;
            CdsDetContaReaAux.FieldByName('IDCONTAORCAMEN').AsString   := '-1';
            CdsDetContaReaAux.FieldByName('IDPLANOORCAMEN').AsInteger  := FCdsDetContaRea.FieldByName('IDPLANOORCAMEN').AsInteger;
            CdsDetContaReaAux.FieldByName('NOMECONTAORCAMEN').AsString := FCdsDetContaRea.FieldByName('NOMECONTAORCAMEN').AsString;
            CdsDetContaReaAux.Post;
            FCdsDetContaRea.Next;
         end;

         FCdsDetFluxo.First;
         while not FCdsDetFluxo.Eof do
         begin
            CdsDetFluxoAux.Append;
            CdsDetFluxoAux.FieldByName('CODTIPRECDES').AsString    := FCdsDetFluxo.FieldByName('CODTIPRECDES').AsString;
            CdsDetFluxoAux.FieldByName('RECPAG').AsString          := FCdsDetFluxo.FieldByName('RECPAG').AsString;
            CdsDetFluxoAux.FieldByName('UNIDNEGOC').AsInteger      := FCdsDetFluxo.FieldByName('UNIDNEGOC').AsInteger;
            CdsDetFluxoAux.FieldByName('CODCENTROCUSTO').AsString  := FCdsDetFluxo.FieldByName('CODCENTROCUSTO').AsString;
            CdsDetFluxoAux.FieldByName('CODCENTRORESPON').AsString := FCdsDetFluxo.FieldByName('CODCENTRORESPON').AsString;
            CdsDetFluxoAux.FieldByName('IDPLANOPREV').AsInteger    := FCdsDetFluxo.FieldByName('IDPLANOPREV').AsInteger;
            CdsDetFluxoAux.FieldByName('IDPATRO').AsInteger        := FCdsDetFluxo.FieldByName('IDPATRO').AsInteger;
            CdsDetFluxoAux.FieldByName('IDEMPRESA').AsInteger      := FCdsDetFluxo.FieldByName('IDEMPRESA').AsInteger;
            CdsDetFluxoAux.FieldByName('IDPESSOA').AsInteger       := FCdsDetFluxo.FieldByName('IDPESSOA').AsInteger;
            CdsDetFluxoAux.FieldByName('IDCONTAORCAMEN').AsString  := '-1';
            CdsDetFluxoAux.FieldByName('IDPLANOORCAMEN').AsInteger := FCdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger;
            CdsDetFluxoAux.FieldByName('NOMETR').AsString          := FCdsDetFluxo.FieldByName('NOMETR').AsString;
            CdsDetFluxoAux.FieldByName('NOMECC').AsString          := FCdsDetFluxo.FieldByName('NOMECC').AsString;
            CdsDetFluxoAux.FieldByName('NOMEAP').AsString          := FCdsDetFluxo.FieldByName('NOMEAP').AsString;
            CdsDetFluxoAux.FieldByName('NOMEPLANO').AsString       := FCdsDetFluxo.FieldByName('NOMEPLANO').AsString;
            CdsDetFluxoAux.FieldByName('NOMEPATRO').AsString       := FCdsDetFluxo.FieldByName('NOMEPATRO').AsString;
            CdsDetFluxoAux.FieldByName('NOMECR').AsString          := FCdsDetFluxo.FieldByName('NOMECR').AsString;
            CdsDetFluxoAux.Post;
            FCdsDetFluxo.Next;
         end;

         FCdsDetCond.First;
         while not FCdsDetCond.Eof do
         begin
            CdsDetCondAux.Append;
            CdsDetCondAux.FieldByName('IDGRUPOCONDINI').AsInteger := FCdsDetCond.FieldByName('IDGRUPOCONDINI').AsInteger;
            CdsDetCondAux.FieldByName('IDGRUPOCONDFIM').AsInteger := FCdsDetCond.FieldByName('IDGRUPOCONDFIM').AsInteger;
            CdsDetCondAux.FieldByName('IDGRUPOCONDRES').AsInteger := FCdsDetCond.FieldByName('IDGRUPOCONDRES').AsInteger;
            CdsDetCondAux.FieldByName('IDCONTACONDINI').AsString  := FCdsDetCond.FieldByName('IDCONTACONDINI').AsString;
            CdsDetCondAux.FieldByName('IDCONTACONDFIM').AsString  := FCdsDetCond.FieldByName('IDCONTACONDFIM').AsString;
            CdsDetCondAux.FieldByName('IDCONTACONDRES').AsString  := FCdsDetCond.FieldByName('IDCONTACONDRES').AsString;
            CdsDetCondAux.FieldByName('CONDICAO').AsString        := FCdsDetCond.FieldByName('CONDICAO').AsString;
            CdsDetCondAux.FieldByName('TIPOCONDINI').AsString     := FCdsDetCond.FieldByName('TIPOCONDINI').AsString;
            CdsDetCondAux.FieldByName('TIPOCONDRES').AsString     := FCdsDetCond.FieldByName('TIPOCONDRES').AsString;
            CdsDetCondAux.FieldByName('VLRCONDINI').AsFloat       := FCdsDetCond.FieldByName('VLRCONDINI').AsFloat;
            CdsDetCondAux.FieldByName('VLRCONDRES').AsFloat       := FCdsDetCond.FieldByName('VLRCONDRES').AsFloat;
            CdsDetCondAux.FieldByName('IDCONTAORCAMEN').AsString  := '-1';
            CdsDetCondAux.FieldByName('IDPLANOORCAMEN').AsInteger := FCdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger;
            CdsDetCondAux.FieldByName('CONDDESCRICAO').AsString  := FCdsDetCond.FieldByName('CONDDESCRICAO').AsString;
            CdsDetCondAux.Post;
            FCdsDetCond.Next;
         end;

         // Grava as composições da conta-espelho pai...
         if not ApplyCds(CdsDetAux,_dbDet, [_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDet.IdPlanoOrcamen, _dbDet.Idcontaorcamen]) then
            raise Exception.Create(_dbDet.MessageInfo);

         if not ApplyCds(CdsDetContaOrcAux, _dbDetContaOrc,[_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaOrc.IdPlanoOrcamen, _dbDetContaOrc.IdContaOrcamen]) then
            raise Exception.Create(_dbDetContaOrc.MessageInfo);

         if not ApplyCds(CdsDetContaReaAux, _dbDetContaRea,[_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetContaRea.IdPlanoOrcamen, _dbDetContaRea.IdContaOrcamen]) then
            raise Exception.Create(_dbDetContaRea.MessageInfo);

         if not ApplyCds(CdsDetFluxoAux, _dbDetFluxo,[_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetFluxo.IdPlanoOrcamen, _dbDetFluxo.IdContaOrcamen]) then
            raise Exception.Create(_dbDetFluxo.MessageInfo);

         if not ApplyCds(CdsDetCondAux, _dbDetCond,[_dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen], [_dbDetCond.IdPlanoOrcamen, _dbDetCond.IdContaOrcamen]) then
            raise Exception.Create(_dbDetCond.MessageInfo);

                              
         Commit;
         FreeAndNil(CdsContasOrcamen);
         FreeAndNil(CdsDetAux);
         FreeAndNil(CdsDetContaOrcAux);
         FreeAndNil(CdsDetContaReaAux);
         FreeAndNil(CdsDetFluxoAux);
         FreeAndNil(CdsDetCondAux);
      except
         on E:exception do
         begin
             Rollback;
             Result      := false;
             MessageInfo := E.Message;
             FreeAndNil(CdsContasOrcamen);
             FreeAndNil(CdsDetAux);
             FreeAndNil(CdsDetContaOrcAux);
             FreeAndNil(CdsDetContaReaAux);
             FreeAndNil(CdsDetFluxoAux);
             FreeAndNil(CdsDetCondAux);
         end;
      end;
   end;
end;









function TCtrlCadContasOrc.ExcluiGrupoOrcamen(iIdGrupo: integer;
                                              const bExcSaldoOrc : boolean  // Edilaine - SOL 161099 / KTN 1715076
                                              ): Boolean;
var
   binTrans : boolean;    // Helen - SOL 187700 /KTN 1767662
begin
   binTrans := dtmBaseDados.dbBaseDados.InTransaction;  // Helen - SOL 187700 /KTN 1767662

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiGrupoOrcamen(iIdGrupo);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         If Not binTrans Then // Helen - SOL 187700 /KTN 1767662
           StartTransaction;

         // Exclui as contas orçamentárias do grupo
         {if not ExecSQL('DELETE FROM COMPCONTASORCAMEN ' +
                        'WHERE IDCONTAORCAMEN IN (SELECT IDCONTAORCAMEN ' +
                        '                         FROM CONTASORCAMEN    ' +
                        '                         WHERE IDGRUPOORCAMEN = ' + FloatToStr(iIdGrupo) + ' )') then}

         //Marilza Colpani 26/03/2009 N.Sol 109826/N.Kintana 498982

         // Edilaine - SOL 161099 / KTN 1715076
         if bExcSaldoOrc then
         begin
           if not ExecSQL('DELETE FROM SALDOORCADO SD  ' +
                          'WHERE EXISTS ( SELECT idcontaorcamen FROM CONTASORCAMEN CO  ' +
                                          ' WHERE IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) +
                                          ' AND SD.IDPLANOORCAMEN = CO.IDPLANOORCAMEN ' +
                                          ' AND SD.IDCONTAORCAMEN = CO.IDCONTAORCAMEN ' + ')') then

              raise Exception.Create(MessageInfo);
         end;
         // Edilaine - SOL 161099 / KTN 1715076 - fim

         if not ExecSQL('DELETE FROM COMPCONTASORCAMEN CP  ' +
                        'WHERE EXISTS ( SELECT idcontaorcamen FROM CONTASORCAMEN CO  ' +   // Edilaine - SOL 161099 / KTN 1715076
                                        'WHERE IDGRUPOORCAMEN = ' + FloatToStr(iIdGrupo) +
                                          ' AND CP.IDPLANOORCAMEN = CO.IDPLANOORCAMEN ' +
                                          ' AND CP.IDCONTAORCAMEN = CO.IDCONTAORCAMEN ' + ')') then

            raise Exception.Create(MessageInfo);

         if not ExecSQL('DELETE FROM CONTASORCAMEN ' +
                        'WHERE IDGRUPOORCAMEN = ' + FloatToStr(iIdGrupo)) then
            raise Exception.Create(MessageInfo);

         Result := True;

         If Not binTrans Then // Helen - SOL 187700 /KTN 1767662
            Commit;

      except
         on E:Exception do
         begin
            Rollback;
            Result      := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;




function TCtrlCadContasOrc.RetornaPlanContabEmVigor(iIdEmpresa: integer): integer;
begin
   _Cds.Data := GetDataPacket('SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(iIdEmpresa));

   Result := _Cds.FieldByName('PLANO').AsInteger;
end;




function TCtrlCadContasOrc.ListaRelacionamentos(iIdGrupoOrc,iIdEmpresa: integer): OleVariant;
var
  sSql : String;
begin
  if (iIdGrupoOrcAux <> iIdGrupoOrc) or (iIdEmpresaAux <> iIdEmpresa) then begin // Thiago Melo SOL 219324 Kintana 2051326
    sSql := 'SELECT ' +
            '    DISTINCT  ' + //Ricardo SOl 1349788 Kintana 160539/5501
            '    C.IDCONTAORCAMEN, ' +
            '    PPV.NOME AS PLANO, ' +
            '    P.NOME AS PATRO, ' +
            '    U.NOME AS ATIVPROJ, ' +
            '    TRIM(R.CODEXTERNO) ||  '' - '' || R.NOME AS CENTRORESPON, ' +
            '    TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
            '    TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

            'FROM ' +
            '    CONTASORCAMEN C, ' +
            '    PESSOA P, ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    PLANPREVCONTABIL PPV, ' +
            '    CENTRESPON R, ' +
            '    CENTCUST CC, ' +
            '    UNIDNEGOCIO U, ' +
            '    PARAMGLOBAL G, '+ //pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    COMPCONTASORCAMEN CO, ' +
            //Fim

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    CM.PROGRAMAORCAMEN PR, ' +
            '    CM.TIPO_DESPESAORCAMEN TD ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

            'WHERE ' +
            '    (C.IDPLANOPREV      = PPV.IDPLANOPREV) AND ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN (+) AND ' +
            '    C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN (+) AND ' +
            //'    (CO.IDPLANOPREV = PPV.IDPLANOPREV) ' +
            //Fim


            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    (C.IDPROGRAMAORCAMEN          = PR.IDPROGRAMAORCAMEN(+)) AND ' +
            '    (C.IDTIPO_DEPESAORCAMEN  = TD.IDTIPO_DEPESAORCAMEN(+)) AND ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


            '    (C.IDPATRO          = P.IDPESSOA(+)) AND ' +
            '    (C.CODCENTRORESPON  = R.CODCENTRORESPON(+)) AND ' +
            '    (C.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND ' +
            '    (C.UNIDNEGOC        = U.UNIDNEGOC(+)) AND ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            {'    AND (CO.IDPATRO = P.IDPESSOA(+)) ' +
            '    AND (CO.CODCENTRORESPON = R.CODCENTRORESPON(+)) ' +
            '    AND (CO.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ' +
            '    AND (CO.UNIDNEGOC = U.UNIDNEGOC(+)) AND ' +}
            //Fim

            //INÍCIO - pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes
            '    (G.IDPESSOA = C.IDPESSOA) AND ' ;


            //'    (G.IDPLANCRESPON = R.IDPLANCRESPON) AND '; //Ricardo SOl 1349788 Kintana 160539/5501 - comentado
            //FIM - pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes

            // Alterado por Arnaldo V. Scarin em 08/09/2009
            // Sol: 123436 Kintana: 616983
            // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
            // informar as contas de centro de custos quando o flag de centro de custos estiver
            // desmarcado.
            //Ricardo SOl 1349788 Kintana 160539/5501 - comentado
            {If Pos('X',sCodContaOrc) = 0 then
              sSql := sSql + '    (G.IDPLANCENTCUST = CC.IDPLANCENTCUST) AND ';}

            sSql := sSql +
                    '    (C.IDPESSOA         = ' + IntToStr(iIdEmpresa)  + ') AND ' +
                    '    (C.IDGRUPOORCAMEN   = ' + IntToStr(iIdGrupoOrc) + ') ';

            Result := GetDataPacket(sSql);
  // Thiago Melo SOL 219324 Kintana 2051326
  end else if ((iIdGrupoOrcAux = -1) and (iIdEmpresaAux = -1)) then begin
    sSql := 'SELECT ' +
            '    DISTINCT  ' +
            '    C.IDCONTAORCAMEN, ' +
            '    PPV.NOME AS PLANO, ' +
            '    P.NOME AS PATRO, ' +
            '    U.NOME AS ATIVPROJ, ' +
            '    TRIM(R.CODEXTERNO) ||  '' - '' || R.NOME AS CENTRORESPON, ' +
            '    TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
            '    PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
            '    TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
            'FROM ' +
            '    CONTASORCAMEN C, ' +
            '    PESSOA P, ' +
            '    PLANPREVCONTABIL PPV, ' +
            '    CENTRESPON R, ' +
            '    CENTCUST CC, ' +
            '    UNIDNEGOCIO U, ' +
            '    PARAMGLOBAL G, '+
            '    COMPCONTASORCAMEN CO, ' +
            '    CM.PROGRAMAORCAMEN PR, ' +
            '    CM.TIPO_DESPESAORCAMEN TD ' +
            'WHERE 1 = 2';
            Result := GetDataPacket(sSql);
  end else begin
    sSql := 'SELECT ' +
            '    DISTINCT  ' + //Ricardo SOl 1349788 Kintana 160539/5501
            '    C.IDCONTAORCAMEN, ' +
            '    PPV.NOME AS PLANO, ' +
            '    P.NOME AS PATRO, ' +
            '    U.NOME AS ATIVPROJ, ' +
            '    TRIM(R.CODEXTERNO) ||  '' - '' || R.NOME AS CENTRORESPON, ' +
            '    TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
            '    TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

            'FROM ' +
            '    CONTASORCAMEN C, ' +
            '    PESSOA P, ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    PLANPREVCONTABIL PPV, ' +
            '    CENTRESPON R, ' +
            '    CENTCUST CC, ' +
            '    UNIDNEGOCIO U, ' +
            '    PARAMGLOBAL G, '+ //pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    COMPCONTASORCAMEN CO, ' +
            //Fim

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    CM.PROGRAMAORCAMEN PR, ' +
            '    CM.TIPO_DESPESAORCAMEN TD ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

            'WHERE ' +
            '    (C.IDPLANOPREV      = PPV.IDPLANOPREV) AND ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            '    C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN (+) AND ' +
            '    C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN (+) AND ' +
            //'    (CO.IDPLANOPREV = PPV.IDPLANOPREV) ' +
            //Fim


            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            '    (C.IDPROGRAMAORCAMEN          = PR.IDPROGRAMAORCAMEN(+)) AND ' +
            '    (C.IDTIPO_DEPESAORCAMEN  = TD.IDTIPO_DEPESAORCAMEN(+)) AND ' +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


            '    (C.IDPATRO          = P.IDPESSOA(+)) AND ' +
            '    (C.CODCENTRORESPON  = R.CODCENTRORESPON(+)) AND ' +
            '    (C.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND ' +
            '    (C.UNIDNEGOC        = U.UNIDNEGOC(+)) AND ' +

            //Ricardo SOl 1349788 Kintana 160539/5501
            {'    AND (CO.IDPATRO = P.IDPESSOA(+)) ' +
            '    AND (CO.CODCENTRORESPON = R.CODCENTRORESPON(+)) ' +
            '    AND (CO.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ' +
            '    AND (CO.UNIDNEGOC = U.UNIDNEGOC(+)) AND ' +}
            //Fim

            //INÍCIO - pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes
            '    (G.IDPESSOA = C.IDPESSOA) AND ' ;


            //'    (G.IDPLANCRESPON = R.IDPLANCRESPON) AND '; //Ricardo SOl 1349788 Kintana 160539/5501 - comentado
            //FIM - pendência 27798 - 06/05/2008 - para buscar somente os CC e CR dos planos vigentes

            // Alterado por Arnaldo V. Scarin em 08/09/2009
            // Sol: 123436 Kintana: 616983
            // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
            // informar as contas de centro de custos quando o flag de centro de custos estiver
            // desmarcado.
            //Ricardo SOl 1349788 Kintana 160539/5501 - comentado
            {If Pos('X',sCodContaOrc) = 0 then
              sSql := sSql + '    (G.IDPLANCENTCUST = CC.IDPLANCENTCUST) AND ';}

            sSql := sSql +
                    '    (C.IDPESSOA         = ' + IntToStr(iIdEmpresa)  + ') AND ' +
                    '    (C.IDGRUPOORCAMEN   = ' + IntToStr(iIdGrupoOrc) + ') ';

            Result := GetDataPacket(sSql);  
  end;

  // Thiago Melo SOL 219324 Kintana 2051326
  iIdEmpresaAux  := iIdEmpresa;
  iIdGrupoOrcAux := iIdGrupoOrc;
  // Thiago Melo SOL 219324 Kintana 2051326
end;




function TCtrlCadContasOrc.ListaContasOrcamen(
  iIdPlanoOrc: integer): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    IDCONTAORCAMEN, NOMECONTAORCAMEN ' +
                           ' FROM ' +
                           '    CONTASORCAMEN ' +
                           ' WHERE ' +
                           '    IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) +
                           ' ORDER BY ' +
                           '    NOMECONTAORCAMEN ');

end;

procedure TCtrlCadContasOrc.SetIdGrupoOrcamen(const Value: Integer);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TCtrlCadContasOrc.SetcdsOrcContabPlanos(
  const Value: TClientDataSet);
begin
  FcdsOrcContabPlanos := Value;
end;


procedure TCtrlCadContasOrc.SetCdsPrograma(const Value: TClientDataSet);
begin
  FCdsPrograma := Value;
end;

procedure TCtrlCadContasOrc.SetCdsProgramaConta(
  const Value: TClientDataSet);
begin
  FCdsProgramaConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTipoDespesa(const Value: TClientDataSet);
begin
  FCdsTipoDespesa := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTipoDespesaConta(
  const Value: TClientDataSet);
begin
  FCdsTipoDespesaConta := Value;
end;

procedure TCtrlCadContasOrc.SetCdsProgramaFluxo(
  const Value: TClientDataSet);
begin
  FCdsProgramaFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetCdsTipoDespesaFluxo(
  const Value: TClientDataSet);
begin
  FCdsTipoDespesaFluxo := Value;
end;

procedure TCtrlCadContasOrc.SetDesvincularContorcamen(
  const Value: boolean);
begin
  FDesvincularContorcamen := Value;
end;

end.
