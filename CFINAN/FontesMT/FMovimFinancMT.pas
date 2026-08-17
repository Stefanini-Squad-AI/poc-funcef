// ***************************** REGISTRO DE ALTERAÇÕES ************************
//******************************************************************************************
//N. WO ..........: 13599
//Data............: 02/10/2024
//Responsável.....: Leandro Pocebon
//Descrição.......: Inclusão combo rateio pré-definido
//******************************************************************************************
//N. WO ..........: 5952
//Data............: 06/09/2024
//Responsável.....: Helen V Bianchi
//Descrição.......: Permite inserir registros em datas não úteis, tanto da data de lançamento
//                  quanto da data de disponibilidade. Funcionalidade-CmeCadastroBeforeConfirma
//******************************************************************************************
//WO..............: WO12516 - Controle Financeiro - Movimento financeiro
//Responsável.....: Arnaldo V. Scarin em 07/08/2024
//Descrição.......: Implementação de replicação do ClientDataSet de Rateio para um novo
//                  Documento
//******************************************************************************************
//N. Sig..........: 114891
//Data............: 01/04/2021
//Responsável.....: Andre Imakawa
//Descrição.......: Ao alterar a data de lançamento da planilha o PERNUMERO e PEREXERCICIO
//                  tambem devem ser alterados.
//******************************************************************************************
//N. Sig..........: 96817/96822
//Data............: 18/03/2020
//Responsável.....: Ewerton Beltramini
//Descrição.......: Alteração na função MudaStatus - Acrescentada a variavel dDataLanc.
//                  Realizada alterações para suportar a mudança.
//******************************************************************************************
//N. SIG..........: 81430
//Data............: 30/01/2018
//Responsável.....: Taffarel Sevaybriker
//Descrição.......: Sistema não altera a data de disponibilidade ao acionar o botão OK.
//******************************************************************************************
//N. Sol..........: 204706
//N. Kintana......: 1979976
//Data............: 11/04/2013
//Responsável.....: Marcio Sanches Spinosa SOL 204706 Kintana 1979976
//Descrição.......: Carregar portadores somente ativos quando for inserção.
//******************************************************************************************
//N. Sol..........: 31714/13162
//N. Kintana......: 1887925
//Data............: 17/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para trazer saldos ajustados
//******************************************************************************************
//N. Sol..........: 31714/13082
//N. Kintana......: 1883867
//Data............: 12/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluindo DATACONCILIACAOBANCARIA no UPDATE da MOVIMFINANC
//******************************************************************************************
//N. Sol..........: 31714/12942
//N. Kintana......: 1879169
//Data............: 07/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Saldo de Bloqueios Judiciais, o correto é somar os dois saldos; - 
//A função de Regularização de Movimentos para a Conciliação Bancária não está atualizando os 
//dados em base de dados corretamente
//************************************************************************************************
//N. Sol..........: 31714/12902
//N. Kintana......: 1877578
//Data............: 04/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: O botão "Fechar Conciliação" não está habilitado passar a ser habilitado
//************************************************************************************************
//N. Sol..........: 31714/12862
//N. Kintana......: 1875635
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Trocando o botão de conciliação de lugar e alterando o
//                  campo CONCILIADO para 'D' (Definitivo)
//************************************************************************************************
//N. Sol..........: 31714_12382
//N. Kintana......: 1851098
//Data............: 07/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: setar base de dados
// *****************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 09/07/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir UPDATES para reabrir a conciliação bancária
// *****************************************************************************
//Rotina ......: cdsUnidNeg e CmeDetalheEdit
//SOL..........: 163982
//Kintana......: 1404974
//Data.........: 26/09/2011
//Responsável..: Vinicius Eduardo Nascimento Maciel
//Descrição....: Foram alteradas as rotinas para que elas retornem apenas as
//               rotinas ativas. E caso seja alterado um registro em que a
//               atividade esteja desativadas ele sera mostrado no combo (apenas
//               como display).
// *****************************************************************************
// Autor(a)    : Ricardo Freitas
// Data        : 27/05/2011
// Rotina      : CarregaCdsMestDet
// SOL_Kintana : 157289/5022_1288999
// Descricao   : Limita qtde de registro na consulta de documentos
// Rotina      : sqlConsultaDoc.SQL.Text
// Descricao   : Correção e otimização do SQL de select.
// Rotina      : btnListaDocClick
// Descricao   : Adicioando botão que lista todos os documento da baixa sem a
//               limitação de nº de registros.
// Rotina      : DFM
// Descricao   : Ajustado ao propriedade AutoDropDown = true para todos os
//               comboboxes no cadastro de Rateio
// *****************************************************************************

// Autor(a)    : Ricardo Freitas
// Data        : 19/05/2011
// Rotina      : CarregaCdsMestDet
// SOL_Kintana : 157289_1277983
// Descricao   : Retirando filtro anterior para realizar a reconsulta corretamente
//               na consulta de documentos.
//
// Rotina      : MontaSelectBeforeOpenCds
// Descricao   : Adicionado filtro de código de documento com a tabela recebtopagto
// *****************************************************************************
// Autor(a)    : Vinicius Maciel
// Data        : 23/07/2011
// Rotina      : Form(DFM)
// SOL_Kintana : 157286_1277621
// Descricao   : Ajustado ordem de tabOrdem nos edits do cadastro de rateio.
// *****************************************************************************
// Autor(a)    : Bruno Bastos
// Data        : 22/07/2010
// Rotina      : dbeDataLancExit
// SOL_Kintana : 140327_876766
// Descricao   : Comentário do código nessa rotina, permitindo incluir/alterar
//               registros com data posterior a data atual.
// *****************************************************************************
// Autor(a)    : Fábio Henrique Beccaria Sampaio
// Data        : 27/04/2010
// Rotina      : CmeCadastroEdit
// Pendência   : 134293_793596
// Descricao   : Retirada da crítica "Proibido Alterar Transferência entre
//               Contas. Exclua e Inclua novamente." para permitir a alteração
//               de uma transferência entre planos.
{********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 13/11/2009
Sol......: 129385
Kintana..: 708850
Descrição: Correção do erro na Tela de MOvimentação Financeira
           "A conta contábil "Segregação de Recursos" não permite critério para
           segregação." Esse erro ocorre pois o IdSegregaCriter fica com "sujeira"
           e acaba gerando a mensagem, quando não é feito a contabilização do
           rateio lancado no movimento
********************************************************************************}
{********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 13/11/2009
Kintana..: 575741
Sol......: 120617
Descrição: Melhoria de performance na abertura da tela de movimentação financeira
********************************************************************************}
Unit FMovimFinancMT;

// Alterações:
{--------------------------------------------------------------------------------------------------
Data        : 27/07/2009
SOL_Kintana : 121805_590324
Autor       : Cássio Camargo
Descrição   : Inclusão da opção "Não Identificado" e atribuição da Data de Lançamento da tela
              de Movimento Financeiro para a tela de Alteração de Status.
----------------------------------------------------------------------------------------------------
Data        : 08/04/2009
SOL_Kintana : 31424_526346
Autor       : Bruno Bastos
Descrição   : Retirar a proibição de alterar status de documento não identificado.
----------------------------------------------------------------------------------------------------
Data      : 30/10/2007
Pendência : 26352
Autor     : Hugo Luna
Descrição : Retirando o bloqueio do campo numero de documento na tela de Movimento financeiro. Mudando para pergunta se deseja prosseguir.
----------------------------------------------------------------------------------------------------
Data      : 21/02/2007
Pendência : 24458
Autor     : Marcus Oliveira
Descrição : Não permitir o estorno do documento com origem fora do Cfinan
----------------------------------------------------------------------------------------------------
Data      : 05/04/2006
Pendência : 21111
Autor     : André Tavares
Descrição : Criação do parâmetro FLGCTATPRECDES que faz com que o sistema assuma a conta contábil do tipo desembolso/recebimento
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 07/03/2006
Autor     : Rodolpho da Silva
Pendencia : 19904
Descrição : Passar a validar data de lançamento pela rotina da disponibilidade
            financeira, que também valida o bloqueio do período contábil, caso
            o CFinan integre com a Contabilidade
----------------------------------------------------------------------------------------------------
Data      : 22/02/2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendencia : 21548
Descrição : Acerto da contabilização e do saldo de rateio.
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 02/09/2005
Autor     : André Tavares
Pendencia : 20103
Descrição : deve continuar no procedimento para gerar a contabilização mesmo com a data de disponibidade nula.
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 30/12/2004
Autor     : Rodolpho da Silva
Pendencia : 18335
Descrição : Permitir que seja possível manter a data de disponibilidade em branco, caso
            o usuário concorde.
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 02/04/2004
Autor     : Marchetti
Pendencia : 15737
Descrição : Nào permitir a escolha de patro/plano que não estejam cadastrados no Global
----------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 29/01/2004
Autor     : Alex Pereira
Pendencia : 14451 - Nova Segregação de Recursos
Descrição : Ajustar a tela para acatar pendência - Rotina de Contabilização
            Colocar o plano e patro globais como default do rateio
----------------------------------------------------------------------------------------------------
Rotina    : Grid Rateio
Data      : 22/12/2003
Autor     : Alex Pereira
Pendencia : 14391
Descrição : Incluídos campos de Plano, Patro e Programa, na grid de Rateio
----------------------------------------------------------------------------------------------------
Rotina    : Botão Status(sbtnMudaStatus)
Data      : 28/08/2003
Autor     : Fabio Fagundes
Descrição : Incluido o campo dbeDataDisponib para Gravação e iclusao da funçào CtrlMovimFinanc.AlteraDispFinancDocBaixado
----------------------------------------------------------------------------------------------------
Rotina    : dbrConciliaChange
Data      : 07/08/2003
Autor(a)  : Gleyber
Pendência : 14800
Alteração : Alterado para quando um documento for escolhido como não identificado,
            verifica automaticamente se a conta está inativa ou não cadastrada.
----------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
---------------------------------------------------------------------------------------------------}

{ by Alex 01/07/2003 -

  Documentação do campo: MOVIMFINANC.STATUSCONCILIA

  N  - Não conciliado
  X  - Conciliado
  I  - Não Identificado
  C  - Na Casa

  J  - Lançamento que era não identificado e foi identificado pela tela de lançamento
  P  - Conciliação provisória ainda não batida
}

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
   wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, wwdblook,
   CMProcuraMask, uCtrlListTercFinanc, uCtrlHistPadrao, uCtrlMovimFinanc,
   uCtrlParamFinanc, uGeralFinanc, Provider, DBTables, Wwquery, {Rodolpho da Silva P: 19056 - 20/04/2005 =>} uDiasUteis,
   uCtrlGrupoRateioFluxo, //Leandro WO13599
   uCMTypes, uCmSqlParams, uCtrlFinanc, uCtrlPlanPrevContabPatro, JCLMath;

Const
   WM_AbandonaInclusaoDet = WM_User + 1;

Type
   TFrmMovimFinancMT = Class(TFrmCadastroMestreDetMT)
      dblcPortador: TwwDBLookupCombo;
      lblCaixaBanco: TLabel;
      lblMoeda: TLabel;
      edMoeda: TEdit;
      Label7: TLabel;
      dblcHistPad: TwwDBLookupCombo;
      dbeHistorico: TwwDBEdit;
      lblHistorico: TLabel;
      lblValorMoeda: TLabel;
      dbrEntradaSaida: TDBRadioGroup;
      lblValor: TLabel;
      lblDocumento: TLabel;
      dbeDocumento: TwwDBEdit;
      lblData: TLabel;
      dbeDataLanc: TCMDateTimePicker;
      dbrConcilia: TDBRadioGroup;
      cbNaoContabiliza: TCheckBox;
      Label8: TLabel;
      dbeData: TDBEdit;
      lblHistPad: TLabel;
      cdsPortadorConta: TCMClientDataSet;
      cdsHistPadrao: TCMClientDataSet;
      cdsUnidNeg: TCMClientDataSet;
      cdsCentroRespon: TCMClientDataSet;
      cdsTipoRecDes: TCMClientDataSet;
      cdsDet: TCMClientDataSet;
      cdsTipoDoc: TCMClientDataSet;
      cdsPatrocinador: TCMClientDataSet;
      cdsPlanoPrev: TCMClientDataSet;
      cdsPrograma: TCMClientDataSet;
      cdsCentroCusto: TCMClientDataSet;
      cdsSubConta: TCMClientDataSet;
      cdsContabil: TCMClientDataSet;
      dsContabil: TwwDataSource;
      tbsContabil: TTabSheet;
      pnlContabil: TPanel;
      pgcContabil: TPageControl;
      tbsBasicoContab: TTabSheet;
      lblValorMoedaCon: TLabel;
      lblValorCorrenteCon: TLabel;
      lblSubConta: TLabel;
      lblCCusto: TLabel;
      lblAtividade: TLabel;
      dbccConta: TCMProcuraMaskContabil;
      gbHistorico: TGroupBox;
      dbeHist1: TwwDBEdit;
      dbeHist2: TwwDBEdit;
      dbeHist3: TwwDBEdit;
      dbgDebitoCredito: TDBRadioGroup;
      dblcSubConta: TwwDBLookupCombo;
      dblcCCusto: TwwDBLookupCombo;
      dblcAtividade: TwwDBLookupCombo;
      tbsPrevidenciarioContab: TTabSheet;
      Label2: TLabel;
      Label3: TLabel;
      dblcPatrocinadorContabil: TwwDBLookupCombo;
      dblcPlanoPrevContabil: TwwDBLookupCombo;
      dbgrdContabil: TwwDBGrid;
      sbtnEstornar: TToolbarButton97;
      sbtnMudaStatus: TToolbarButton97;
      cdsDetBackup: TCMClientDataSet;
      dbeValorMoeda: TDBRealEdit;
      dbeValorCorrente: TDBRealEdit;
      dbeValorOMContab: TDBRealEdit;
      dbeValorCorrenteContab: TDBRealEdit;
      lblModulo: TLabel;
      lblNomeOrigem: TLabel;
      spTeste: TCMSqlParams;
      dbeUsuario: TDBEdit;
      sbtnCopiar: TToolbarButton97;
      cdsDetBack: TCMClientDataSet;
      cdsBack: TCMClientDataSet;
      cdsContabBack: TCMClientDataSet;
      dbeDataConciliacao: TDBEdit;
      Label4: TLabel;
      Label5: TLabel;
      dbeDataDisponib: TCMDateTimePicker;
      sqlAux: TCMSqlParams;
      tbsConsultaDoc: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      dsConsultaDoc: TwwDataSource;
      cdsConsultaDoc: TCMClientDataSet;
      sqlConsultaDoc: TCMSqlParams;
      CMSqlParams1: TCMSqlParams;
      Label20: TLabel;
      Label18: TLabel;
      dblcPrograma: TwwDBLookupCombo;
      dblcPatrocinadorRateio: TwwDBLookupCombo;
      dblcPlanoPrevRateio: TwwDBLookupCombo;
      Label19: TLabel;
      Label6: TLabel;
      lblUnidNegoc: TLabel;
      dblcUnidNegoc: TwwDBLookupCombo;
      lblCentroRespon: TLabel;
      dblcCentroRespon: TwwDBLookupCombo;
      lblTipoRD: TLabel;
      dblcTipoRD: TwwDBLookupCombo;
      Label13: TLabel;
      dblcTipoDocumento: TwwDBLookupCombo;
      lblMoedaDet: TLabel;
      edMoedaDet: TEdit;
      lblValorOutDet: TLabel;
      dbeValorMoedaDet: TDBRealEdit;
      lblValorDet: TLabel;
      dbeValorDet: TDBRealEdit;
      Label17: TLabel;
      wwDBLookupCombo6: TwwDBLookupCombo;
      sqlAux1: TCMSqlParams;
      sqlPlanoPrev: TCMSqlParams;
      sqlPatro: TCMSqlParams;
      cdsPlanPrev: TCMClientDataSet;
      cdsPatro: TCMClientDataSet;
      pnlConsultaDoc: TPanel;
      btnListaDoc: TBitBtn;
      lblTotDOc: TLabel;
      spbConciliado: TSpeedButton;
      txtSituacao: TStaticText;
      qryAux: TQuery;
    lblRateio: TLabel;
    btnRatear: TButton;
    cdsGrupoRateio: TCMClientDataSet;
    cdsGrupoRateioGRRFDESCRICAO: TStringField;
    cdsGrupoRateioIDGRUPORATEIOFLUXO: TFloatField;
    sqlGrupoRateio: TCMSqlParams;
    cdsGrupoRateioTIPORATEIO: TStringField;
    DBcboGrupoRateio: TwwDBLookupCombo;
    cdsPadraoRateioFluxo: TCMClientDataSet;

      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbccContaExit(Sender: TObject);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure sbtnMudaStatusClick(Sender: TObject);
      Procedure sbtnEstornarClick(Sender: TObject);
      Procedure CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure dblcPortadorExit(Sender: TObject);
      Procedure dblcSubContaEnter(Sender: TObject);
      Procedure dbrConciliaChange(Sender: TObject);
      Procedure dbeDataLancExit(Sender: TObject);
      Procedure CmeCadastroCancel(Sender: TObject);
      Procedure dbeValorMoedaEnter(Sender: TObject);
      Procedure dbeValorMoedaExit(Sender: TObject);
      Procedure dbeValorMoedaDetExit(Sender: TObject);
      Procedure dblcCCustoEnter(Sender: TObject);
      Procedure dbrEntradaSaidaChange(Sender: TObject);
      Procedure dblcHistPadExit(Sender: TObject);
      Procedure CmeCadastroEdit(Sender: TObject);
      Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure CmeDetalheEdit(Sender: TObject);
      Procedure CmeDetalheDelete(Sender: TObject);
      Procedure CmeDetalheBeforeConfirma(sender: TObject; Var Accept: Boolean);
      Procedure dblcUnidNegocChange(Sender: TObject);
      Procedure dblcCCustoChange(Sender: TObject);
      Procedure dblcAtividadeChange(Sender: TObject);
      Procedure dblcPortadorChange(Sender: TObject);
      Procedure tbcDetalheChange(Sender: TObject);
      Procedure CmeCadastroConfirma(Sender: TObject);
      Procedure dblcTipoDocumentoEnter(Sender: TObject);
      Procedure CmeDetalheConfirma(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure cdsContabilAfterScroll(DataSet: TDataSet);
      Procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure cdsDetAfterScroll(DataSet: TDataSet);
      Procedure sbtnCopiarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure CmeDetalheCancel(Sender: TObject);
      Procedure bbtnVoltarDetClick(Sender: TObject);
      Procedure dbeValorDetKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dblcTipoRDChange(Sender: TObject);
      Procedure CmeCadastroDelete(Sender: TObject);
      Procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure MontaSelectAfterOpenCds(oCds: TClientDataSet);
      Procedure MontaSelectBeforeOpenCds(Var sqlText: String;
         strListParams: TStringList);

      Procedure filtraRecDes(Const bEditInser: Boolean = false);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure btnListaDocClick(Sender: TObject);
      Procedure spbConciliadoClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure DBcboGrupoRateioExit(Sender: TObject);
    procedure btnRatearClick(Sender: TObject); // Sol  31714_38358  Kintana 523349_523362 - Paulo Nobre
   protected
      // WO12516 - Arnaldo V. Scarin inicio
      idCodCentroRespon,
      sDescrCentroRespon : String;
      idCodTipoDoc       : Integer;
      idAtividade        : Integer;
      idCodTipRecDes,
      sRecPagTipRecDes,
      sDescrTipRecDes    : String;
      idCentroCusto      : String;
      idPatro            : Integer;
      idPrograma         : String;
      idPlanoPrev        : Integer;
      // WO12516 - Arnaldo V. Scarin fim

   Private { Private declarations }

      bAlterou: boolean;
      bUsaUnidNeg: Boolean;
      bUsaCRespon: Boolean;
      bRegNaoIdent: Boolean;
      bEstorna: Boolean;
      bCalcImposto: Boolean;
      sContaBanco: String;
      sCCustoBanco: String;
      rSubContaBanco: Double;
      sContaNI: String;
      sCCustoNI: String;
      rValorCotacao: Double;
      rSubContaNI: Double;
      rCodPortador: Double;
      rValorLancBackup: Double;
      rSomaRatMoeCorr: Double;
      rSomaRatOutraMoe: Double;
      rPrxVlrRateioCorr: Double;
      rPrxVlrRateioOM: Double;
      rSvValor: Double;
      rSvValorOut: Double;
      dDataLancFinanc: TDateTime;
      dDataDisponib: TDateTime;
      sEntradaSaida: String;
      CtrlMovimFinanc: TCtrlMovimFinanc;
      CtrlListTerceiros: TCtrlListTercFinanc;
      CtrlHistPadrao: TCtrlHistPadrao;
      CtrlParamFinanc: TCtrlParamFinanc;
      CtrlGrupoRateioFluxo: TCtrlGrupoRateioFluxo; //Leandro WO13599
      GeralFinanc: TGeralFinanc;
      _CtrlFinanc: TCtrlFinanc;

      iIdModulo: Integer;
      CtrlPlanPrevContabPatro: TCtrlPlanPrevContabPatro;
      bIntegraComDispon: boolean;

      bIncluido: Boolean;
      bEstornado: Boolean;
      DadosRateioVazio: OleVariant;

      DadosContabVazio: OleVariant;

      FlgCtaTpRecDes, sPlacontaAux: String;

      Procedure CarregaComboTRD;
      Procedure CarregaCdsMestDet(rCodLancFinanc: Double);
      Procedure TestaUnNegCentroRespon;
      Procedure DesfazImposto;
      Procedure AbortaInclusaoDet(Var Msg: TMessage); Message WM_AbandonaInclusaoDet;
      Procedure TotalizaRateio;
      Procedure FillContaContabil;
      Function ResultSetToString(rs: olevariant): String;

      // WO12516 - Controle Financeiro - Movimento financeiro
      // Alterado por Arnaldo V. Scarin em 07/08/2024
      procedure SalvaDadosUltimoRateio;
      procedure RecuperaDadosUltimoRateio;

      //Leandro WO13599
      procedure HabilitaRateioPreDefinido(habilita : boolean);
      function  Arredonda(const fValor     : Extended;
                          const iDecimais  : word
                         ): Extended;


   Public { Public declarations }

      Constructor Create(AOwner: TComponent; bRegularizaNI: Boolean); Reintroduce;
      //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
      Procedure HabilitaListarDoc;

      procedure MensErroMT(sMessageInfo: String);

   End;

Var
   FrmMovimFinancMT: TFrmMovimFinancMT;

Implementation
{$R *.DFM}
Uses
   dBaseDados, uSistema, uMensErro, FMudaStatusMT, FEstornoFinancMT, uCtrlParamIntegra;

Constructor TFrmMovimFinancMT.Create(AOwner: TComponent; bRegularizaNI: Boolean);
Begin
   bRegNaoIdent := bRegularizaNI;
   Inherited Create(AOwner);
   If bRegularizaNI Then MontaSelect.Filtro.Add('MOVIMFINANC.STATUSCONCILIA = ''I''');
End;

Procedure TFrmMovimFinancMT.FormCreate(Sender: TObject);
Var
   rUnidNeg: Double;
   cdsAux, cdsaux1: TCMClientDataSet;
Begin
   Inherited;

   FlgCtaTpRecDes := '';
   sPlacontaAux := '';

   sContaBanco := '';
   sCCustobanco := '';
   rSubContaBanco := 0;

   sContaNI := '';
   sCCustoNI := '';
   rSubContaNI := 0;

   sEntradaSaida := 'E';
   dDataLancFinanc := Date;
   dDataDisponib := dDataLancFinanc;
   rCodPortador := 0;

   rPrxVlrRateioCorr := 0;
   rPrxVlrRateioOM := 0;

   rSomaRatMoeCorr := 0;
   rSomaRatOutraMoe := 0;

   pgctrlDetalhe.ActivePageIndex := 0;
   pgcContabil.ActivePageIndex := 0;

   pnlMestre.Enabled := False;

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc := TCtrlMovimFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros := TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados, True);

   //Inicializa CtrlHistPadrao
   CtrlHistPadrao := TCtrlHistPadrao.Create;
   CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados, True);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

   //Inicializa GeralFinanc
   GeralFinanc := TGeralFinanc.Create;
   GeralFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

   //Inicializa CtrlFinanc
   _CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, True);
   _CtrlFInanc.InitiAlizeAs(ParamIntegra);

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(ParamIntegra);

   //Carrega cds do Combo de Contas Bancárias
   cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);
   //Carrega cds do Combo de Históricos Padrões
   cdsHistPadrao.Data := CtrlHistPadrao.ListHsitoricoPadrao(0);

   cdsAux := TCMClientDataSet.Create(Nil);
   Try
      //Carrega cds dos Combos de Unidades de Negócio e Centros de Responsabilidade
      cdsAux.Data := CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);
      bUsaUnidNeg := (cdsAux.FieldByName('USAABC').AsString = 'S');
      bUsaCRespon := (cdsAux.FieldByName('USACRESPON').AsString = 'S');
      rUnidNeg := cdsAux.FieldByName('UNIDNEGOC').AsFloat;

      dblcUnidNegoc.Enabled := bUsaUnidNeg;
      If bUsaUnidNeg Then
         cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, 0, 'A', '')
      Else
         //cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,rUnidNeg,'','');
         cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, rUnidNeg, 'A', ''); //VINICIUS MACIEL - SOL 163982 KTN 140497
      dblcCentroRespon.Enabled := bUsaCRespon;
      If bUsaCRespon Then
         Begin
            //Carrega o cds de Centros de Responsabilidade com todos os centros de Responsabilidade
            // permitidos ao usuário corrente.
            //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
            //todos os centros de responsabilidade serão carregados

            cdsCentroRespon.Data := CtrlListTerceiros.ListCentroResponxUsuario(Sistema.IdEmpresa,
               Sistema.IdUsuario, ParamIntegra.PlanoCentroRespon);
            cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(-1, '', 'E'); //Vazio
         End
      Else
         Begin
            cdsCentroRespon.Data := CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa, 'A', '', '9999999999', ParamIntegra.PlanoCentroRespon);
            cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
               '9999999999', 'E')
         End;

      //Lê Parâmetros da Contabilidade
      If (ParamIntegra.IntegraContab) Then
         Begin
            tbsContabil.Enabled := True;
            dbccConta.Plano := ParamIntegra.Plano;
            dbccConta.Mascara := ParamIntegra.MascaraPlano;

            cdsAux.Close;
            cdsAux.Data := CtrlListTerceiros.ListParamContab(Sistema.IdEmpresa);
            bEstorna := (cdsAux.FieldByName('PACESTORNA').AsString = 'S');
         End
      Else
         tbsContabil.Enabled := False;

      //Lê Parametros do Movimento Financeiro (usados na Regularização de Não Identif.)
      cdsAux.Close;
      cdsAux.Data := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

      sContaNI := cdsAux.FieldByName('CONTALANCNAOIDENT').AsString;
      sCCustoNI := cdsAux.FieldByName('CCUSTOLANCNAOID').AsString;
      rSubContaNI := cdsAux.FieldByName('SUBCONTANAOIDENT').AsFloat;
      bCalcImposto := (cdsAux.FieldByName('FLGCALCIMPOSTO').AsString = 'S');

      bIntegraComDispon := (cdsAux.FieldByName('FLGINTDISPFIN').AsString = 'Y');

      FlgCtaTpRecDes := cdsAux.FieldByName('FLGCTATPRECDES').AsString;
      sPlacontaAux := cdsAux.FieldByName('CONTALANCNAOIDENT').AsString;

   Finally
      cdsAux.Free;
   End;

   //Carrega cds do combo de Tipos de Documento
   cdsTipoDoc.Data := CtrlListTerceiros.ListTipoDoc('');

   //Carrega cds do combo de Programas Previdenciários
   cdsPrograma.Data := CtrlListTerceiros.ListPrograma;

   //Carrega cds do combo de Patrocinadores
   cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;

   //Carrega cds do combo de Planos Previdenciários
   cdsPlanoPrev.Data := CtrlListTerceiros.ListPlanoPrev;

   //Carrega cds do combo de Centros de Custo
   cdsCentroCusto.Data := CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa, 0, '', ParamIntegra.PlanoCentroCusto); //vazio

   //Carrega cds do Combo de SubContas
   cdsSubConta.Data := CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa, ParamIntegra.Plano, ''); //vazio

   //Carrega cds's Principais
   CarregaCdsMestDet(0);
   DadosRateioVazio := cdsDet.Data;
   DadosContabVazio := cdsContabil.Data;

   // WO12516 - Controle Financeiro - Movimento financeiro
   // Alterado por Arnaldo V. Scarin em 07/08/2024
   // DadosRateioPreenchido := cdsDet.Data;

   //Leandro WO13599 - inicio
   //Carrega cds rateio pre-definido
   CtrlGrupoRateioFluxo := TCtrlGrupoRateioFluxo.Create;
   CtrlGrupoRateioFluxo.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                  MensErroMT);

   HabilitaRateioPreDefinido(False); 

   sqlGrupoRateio.open;
   //Leandro WO13599 - fim


   //Cds's de Backup
   cdsBack.Data := Cds.Data;
   cdsDetBack.Data := cdsDet.Data;
   cdsContabBack.Data := cdsContabil.Data;

   MontaSelect.Filtro.Add('MOVIMFINANC.IDPESSOA = ' + FloatToStr(Sistema.idempresa));

   //Associa Cds's
   CtrlMovimFinanc.CdsMovimFinanc := cds;
   CtrlMovimFinanc.CdsRateioFinanc := cdsDet;
   CtrlMovimFinanc.CdsContabil := cdsContabil;

   //Acerta Título do Form conforme o tipo de operação escolhida
   If bRegNaoIdent Then
      Begin
         Self.Caption := 'Regularização de Lançamentos Não Identificados';
         HelpContext := 90009;
         bbtnAjuda.HelpContext := 90009;
      End
   Else
      Begin
         Self.Caption := 'Movimento Financeiro';
         HelpContext := 90005;
         bbtnAjuda.HelpContext := 90005;
      End;

   lblModulo.Caption := 'Sistema que originou este lançamento: Controle Financeiro';

   tbsPrevidenciarioContab.Enabled := (Sistema.UsaPlanoPatro);

   sbtnCopiar.Enabled := False;
   bIncluido := False;
   bEstornado := False;
   spbConciliado.Enabled := False;
   txtSituacao.Visible := False;
End;

Procedure TFrmMovimFinancMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;

   CtrlPlanPrevContabPatro.Free;

   CtrlListTerceiros.Free;
   CtrlMovimFinanc.Free;
   CtrlHistPadrao.Free;
   CtrlParamFinanc.Free;
   GeralFinanc.Free;
   _CtrlFinanc.Free;

   CtrlGrupoRateioFluxo.Free; // Leandro WO13599

   Inherited;
End;

Procedure TFrmMovimFinancMT.dblcPortadorExit(Sender: TObject);
Var
   cdsAux: TCMClientDataSet;
Begin
   Inherited;
   If (cds.State In ([dsInsert, dsEdit])) Then
      Begin
         If (Trim(dblcPortador.Text) <> '') Then
            Begin
               If (ParamIntegra.IntegraContab) And (cds.FieldByName('IDMODULO').AsFloat = 9) Then
                  Begin
                     If (Trim(cdsPortadorConta.FieldByName('PLACONTA').AsString) = '') Then
                        Begin
                           MsgDlg('Como a contabilidade está integrada, é obrigatório ' +
                              'preencher a conta contabil desta Conta Bancária/Caixa',
                              'Erro', mtError, [mbOk], 0);
                           bbtnCancelarClick(Self);
                           Exit;
                        End;

                     If bRegNaoIdent Then
                        Begin
                           sContaBanco := sContaNI;
                           sCCustoBanco := sCCustoNI;
                           rSubContaBanco := rSubContaNI;
                        End
                     Else
                        Begin
                           sContaBanco := cdsPortadorConta.FieldByName('PLACONTA').AsString;
                           sCCustoBanco := cdsPortadorConta.FieldByName('CODCENTROCUSTO').AsString;
                           rSubContaBanco := cdsPortadorConta.FieldByName('CODSUBCONTA').AsFloat;
                        End;
                  End;

               cds.FieldByName('MOECODIGO').Clear;

               If (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat <> 0) Then
                  Begin
                     cds.FieldByName('MOECODIGO').AsFloat := cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;

                     cdsAux := TCMClientDataSet.Create(Nil);
                     Try
                        cdsAux.Data := CtrlListTerceiros.ListMoeda(cdsPortadorConta.FieldByName('MOECODIGO').AsFloat, False);
                        edMoeda.Text := cdsAux.FieldByName('MOESIGLA').AsString;
                        dbeValorMoeda.Enabled := True;
                        dbeValorCorrente.Enabled := False;
                     Finally
                        cdsAux.Free;
                     End;
                  End
               Else
                  Begin
                     dbeValorMoeda.Value := 0;
                     dbeValorMoeda.Enabled := False;
                     dbeValorCorrente.Enabled := True;
                  End;
            End;
      End;
End;

Procedure TFrmMovimFinancMT.dblcPortadorChange(Sender: TObject);
Begin
   If (cds.State In [dsInsert, dsEdit]) Then
      cds.FieldByName('DESCPORTADOR').AsString := dblcPortador.Text;
End;

Procedure TFrmMovimFinancMT.dbrEntradaSaidaChange(Sender: TObject);
Begin
   If trim(CdsDet.FieldByName('CODCENTRORESPON').AsString) <> '' Then
      cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
         CdsDet.FieldByName('CODCENTRORESPON').AsString,
         dbrEntradaSaida.Value)
   Else
      cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, '',
         dbrEntradaSaida.Value);

   //pendência 27218
   filtraRecDes((cds.state In [dsEdit, dsInsert]));
End;

Procedure TFrmMovimFinancMT.dbeDataLancExit(Sender: TObject);
Begin
   {Bruno Bastos - Sol: 140327 - Kintana: 876766
    if (dbeDataLanc.Date>Date) then
     begin
        MsgDlg('Proibido Data de Lançamento maior que a Data de Hoje','Erro',mtError,[mbOk],0);
        dbeDataLanc.SetFocus;
        Exit;
     end;
     }
End;

Procedure TFrmMovimFinancMT.dblcHistPadExit(Sender: TObject);
Begin
   If Trim(dbeHistorico.Text) = '' Then
      Begin
         dbeHistorico.Text := dblcHistPad.Text;
         cds.FieldByName('HISTORICO').AsString := dblcHistPad.Text;
      End;
End;

Procedure TFrmMovimFinancMT.dbrConciliaChange(Sender: TObject);
Var
   cdsAux: TCMClientDataSet;
Begin
   FillContaContabil;

   If dbrConcilia.ItemIndex = 2
      Then Begin
         cdsAux := TCMClientDataSet.Create(Nil);
         Try
            sqlAux.SQL.Clear;

            sqlAux.SQL.Add('SELECT PLATIPO,PLANOME,PLACCUST,PLASUBCONTA ');
            sqlAux.SQL.Add('FROM PLANOCONTA ');
            sqlAux.SQL.Add('WHERE (PLANO = ' + FloatToStr(ParamIntegra.Plano) + ') ');
            sqlAux.SQL.Add('  AND (PLAINATIVA = ' + QuotedStr('A') + ') ');
            sqlAux.SQL.Add('  AND (PLACONTA = ' + QuotedStr(sContaNI) + ') ');

            sqlAux.ClientDataSet := cdsAux;

            sqlAux.Open;

            If cdsAux.IsEmpty Then
               Begin
                  ShowMessage('Conta de conciliação NÃO IDENTIFICADA (' + Trim(sContaNI) + ') ' + #13 + #10 +
                     'não cadastrada ou inativa. Verifique.');
                  Repaint;
                  bbtnCancelarClick(Self);
               End;
         Finally
            cdsAux.Free;
         End;
      End;

   If (ParamIntegra.IntegraContab) And (cds.FieldByName('STATUSCONCILIA').AsString = 'I') And
      (sContaNI = '') Then cbNaoContabiliza.Checked := True;

End;

Procedure TFrmMovimFinancMT.dbeValorMoedaEnter(Sender: TObject);
Begin
   GeralFinanc.TestaCotacaoMoeda(cdsPortadorConta.FieldByName('MOECODIGO').AsFloat,
      dbeDataLanc.Date, True, rValorCotacao);
   If (rValorCotacao = 0) Then dbeDataLanc.SetFocus;
End;

Procedure TFrmMovimFinancMT.dbeValorMoedaExit(Sender: TObject);
Begin
   cds.FieldByName('VALORLANCFINAN').AsFloat := cds.FieldByName('VALOROUTRAMOEDA').AsFloat * rValorCotacao;
End;

Procedure TFrmMovimFinancMT.dblcUnidNegocChange(Sender: TObject);
Begin
   If (cdsDet.State In [dsInsert, dsEdit]) Then
      cdsDet.FieldByName('DESCUNIDNEG').AsString := cdsUnidNeg.FieldByName('NOME').AsString;
End;

Procedure TFrmMovimFinancMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If (cdsDet.State In [dsInsert, dsEdit]) Then
      Begin
         cdsDet.FieldByName('CODTIPDOC').Clear;
         cdsDet.FieldByName('DESCRICAO').AsString := dblcTipoRD.Text;
         cdsDet.FieldByName('RECPAG').AsString := cdsTipoRecDes.FieldByName('RECPAG').AsString;
      End;
End;

Procedure TFrmMovimFinancMT.dblcTipoDocumentoEnter(Sender: TObject);
Begin
   If (cdsDet.State In [dsInsert, dsEdit]) Then
      Begin
         //Filtra cds de tipos de Documento
         cdsTipoDoc.Filtered := False;
         cdsTipoDoc.Filter := 'RECPAG = ''' + cdsDet.FieldByName('RECPAG').AsString + '''';
         cdsTipoDoc.Filtered := True;
         If cdsTipoDoc.Locate('CODTIPDOC', cdsDet.FieldByName('CODTIPDOC').AsFloat, []) Then
            dblcTipoDocumento.Text := cdsTipoDoc.FieldByName('DESCRICAO').AsString
         Else
            dblcTipoDocumento.Clear;
      End;
End;

Procedure TFrmMovimFinancMT.tbcDetalheChange(Sender: TObject);
Begin
   If (Not (ParamIntegra.IntegraContab) Or (cbNaoContabiliza.Checked)) And (tbcDetalhe.TabIndex = 1) Then
      tbcDetalhe.TabIndex := 2;

   Inherited;
   If (cds.FieldByName('IDMODULO').AsFloat = 9) And (cds.State In [dsInsert, dsEdit]) And
      (pgctrlDetalhe.ActivePageIndex = 1) Then
      Begin
         cdsContabil.EmptyDataSet;
         CtrlMovimFinanc.GeraContabilizacao(sContaBanco, sCCustoBanco, rSubContaBanco,
            sContaNI, sCCustoNI, rSubContaNI, bRegNaoIdent,
            ParamIntegra.Plano);
      End;
   CmeDetalhe.AtualizaBotoes(Self);

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;
End;

Procedure TFrmMovimFinancMT.dbccContaExit(Sender: TObject);
Begin
   If (dbccConta.Valida <> VcOk) Then
      Begin
         dbccConta.SetFocus;
         exit;
      End
   Else
      Begin
         If (dbccConta.Conta.ObrigaCentrodeCusto) Then
            Begin
               cdsCentroCusto.Data := CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
                  ParamIntegra.Plano,
                  dbccConta.Conta.Numero, ParamIntegra.PlanoCentroCusto);
               cdsCentroCusto.First;
               If (cdsCentroCusto.RecordCount = 1) Then
                  dblcCCusto.LookupValue := Trim(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString);

               dblcCCusto.Enabled := True;
               dblcCCusto.SetFocus;
            End
         Else
            Begin
               dblcCCusto.Enabled := False;
               cdsContabil.FieldByName('CODCENTROCUSTO').Clear;
               cdsContabil.FieldByName('IDEMPRESA').Clear;
            End;

         If dbccConta.Conta.ObrigaSubConta Then
            Begin
               dblcSubConta.Enabled := True;
               dblcSubConta.SetFocus;
            End
         Else
            Begin
               dblcSubConta.Enabled := False;
               cdsContabil.FieldByName('CODSUBCONTA').Clear;
            End;
      End;
End;

Procedure TFrmMovimFinancMT.dblcSubContaEnter(Sender: TObject);
Begin
   Inherited;
   cdsSubConta.Data := CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa, ParamIntegra.Plano,
      Trim(dbccConta.Conta.Numero));
End;

Procedure TFrmMovimFinancMT.dblcCCustoEnter(Sender: TObject);
Begin
   //Carrega cds do combo de Centros de Custo
   cdsCentroCusto.Data := CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
      ParamIntegra.Plano,
      dbccConta.Conta.Numero, ParamIntegra.PlanoCentroCusto);
End;

Procedure TFrmMovimFinancMT.dblcCCustoChange(Sender: TObject);
Begin
   If (cdsContabil.State In [dsInsert, dsEdit]) Then
      cdsContabil.FieldByName('DESCCCUSTO').AsString := dblcCCusto.Text;
End;

Procedure TFrmMovimFinancMT.dblcAtividadeChange(Sender: TObject);
Begin
   If (cdsContabil.State In [dsInsert, dsEdit]) Then
      cdsContabil.FieldByName('DESCUNIDNEG').AsString := dblcAtividade.Text;
End;

Procedure TFrmMovimFinancMT.dbeValorMoedaDetExit(Sender: TObject);
Begin
   If (cdsdet.State In [dsInsert, dsEdit]) Then
      cdsdet.FieldByName('VALOR').AsFloat := cdsdet.FieldByName('VALOROUTRAMOEDA').AsFloat * rValorCotacao;
End;

Procedure TFrmMovimFinancMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
   Inherited;

   sbtnCopiar.Enabled := ((Cds.State In [dsInsert]) And bIncluido);

   sbtnMudaStatus.Enabled := False;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;

   If (cds.FieldByName('CODLANCFINANC').AsFloat <> 0) Then
      Begin
         sbtnMudaStatus.Enabled := (Not (sbtnInserir.Down) And
            Not (CtrlMovimFinanc.TestaRegularizado(cds.FieldByName('CODLANCFINANC').AsFloat)) And
            Not (bEstornado));

         sbtnAlterar.Enabled := ((cds.FieldByName('IDMODULO').AsFloat = Sistema.IdModulo) And
            Not (CtrlMovimFinanc.TestaRegularizado(cds.FieldByName('CODLANCFINANC').AsFloat)) And
            Not (bEstornado));

         sbtnApagar.Enabled := (cds.FieldByName('IDMODULO').AsFloat = Sistema.IdModulo) And
            Not (bEstornado) And
            Not ((ParamIntegra.IntegraContab) And Not (sbtnInserir.Down) And Not (sbtnAlterar.Down) And
            Not (sbtnApagar.Down) And bEstorna) And
            Not (CtrlMovimFinanc.TestaRegularizado(cds.FieldByName('CODLANCFINANC').AsFloat));

         //       sbtnEstornar.Enabled:=not(CtrlMovimFinanc.TestaRegularizado(cds.FieldByName('CODLANCFINANC').AsFloat)) and
         //                             not(bEstornado) ;

      End;

   If bRegNaoIdent Then
      Begin
         sbtnMudaStatus.Enabled := False;
         sbtnInserir.Enabled := False;
         sbtnApagar.Enabled := False;
         //      sbtnEstornar.Enabled  :=False;

         sbtnMudaStatus.Visible := False;
         sbtnInserir.Visible := False;
         sbtnApagar.Visible := False;
         //      sbtnEstornar.Visible  :=False;

         sbtnAlterar.Left := 0;
         sbtnProcurar.Left := 60;
         sbtnAlterar.Width := 68;
         sbtnAlterar.Caption := '&Regularizar';
      End;

   //Desabilita o botão, caso não tenha nenhum registro selecionado
//   if Cds.IsEmpty and sbtnEstornar.Enabled then
//      sbtnEstornar.Enabled := false;
End;

Procedure TFrmMovimFinancMT.sbtnMudaStatusClick(Sender: TObject);
var   qryConsulta, qryTemp: TwwQuery;
Begin
   {Bruno Bastos - Comentei esse código para a reolução do SOL: 31424 - Kintana: 526346
    if (cds.FieldByName('STATUSCONCILIA').AsString='I') then
       MsgDlg('Para Alterar o Status de um lançamento não Identificado deve-se ir '+
              'a Opção "Regulariza Lançamentos Não Identificados"','Erro',mtWarning,[mbOk],0)
    else
    }
   With TfrmMudaStatusMT.Create(Self) Do
      Begin
         Try
            Case dbrConcilia.ItemIndex Of
               0: rgStatus.ItemIndex := 0;
               1: rgStatus.ItemIndex := 1;
               //Cássio - SOL Nº121805 KINTANA Nº 590324 - Início
               2: rgStatus.ItemIndex := 2;
               3: rgStatus.ItemIndex := 3;
            End;

            //Taffarel - SIG81430 - início
            //If cds.FieldByName('ENTRADASAIDA').AsString <> 'E' Then // CAR
            //   dbeDataDisponib.Enabled := False;
            //Taffarel - SIG81430 - fim

            //Ewerton Beltramini - Sig 96817/96822 - 18/03/2020 - Inicio...
            bDataContabilFechada := false;
            if (cds.FieldByName('DATALANCFINAN').AsDateTime <> null) then
            begin
                dbeDataLanc.Date := cds.FieldByName('DATALANCFINAN').AsDateTime;
                if VerificaFechamento(dbeDataLanc.date, cds.FieldByName('IDMODULO').Asstring) then
                begin
                   dbeDataLanc.ReadOnly := True;
                   dbeDataLanc.Color := clBtnFace;
                end;
            end
            else
                dbeDataLanc.Date := 0;
            //Ewerton Beltramini - Sig 96817/96822 - 18/03/2020 - Fim.

            dbeDataDisponib.Date := cds.FieldByName('DATADISPFINANC').AsDateTime;
            dbedDataConcilia.Date := cds.FieldByName('DATALANCFINAN').AsDateTime;
            sIdModulo:= cds.FieldByName('IDMODULO').Asstring;
            //Cássio - SOL Nº121805 KINTANA Nº 590324 - Fim
            ShowModal;
            If (ModalResult = mrOk) Then
               Begin
                  If Not (CtrlMovimFinanc.MudaStatus(Cds.FieldByName('CODLANCFINANC').AsFloat,
                     sStatus, dbedDataConcilia.Date, dbeDataDisponib.Date
                     ,dbeDataLanc.Date)) Then  //Ewerton Beltramini - Sig 96817/96822 - 18/03/2020 - Acrescentado a variavel...
                     MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0)
                  else
                  begin

                       //Ewerton Beltramini - Sig 96817/96822 - 12/05/2020 - inicio...
                       qryConsulta := TwwQuery.Create(Nil);
                       qryConsulta.DataBaseName := 'Basedados';
                       qryTemp := TwwQuery.Create(Nil);
                       qryTemp.DataBaseName := 'Basedados';

                       Try
                            Try

                                 qryConsulta.SQL.Clear;
                                 qryConsulta.SQL.Add(' SELECT MO.CODLANCFINANC, MO.NUMCHQBORDERO, LD.CODDOCUMENTO, D.NODOCUMENTO, MO.DATALANCFINAN, MO.DATADISPFINANC, LD.DATALANCTO, P.PLNDATDIA, P.PLNCODIGO ');
                                 qryConsulta.SQL.Add(' FROM CM.MOVIMFINANC MO ');
                                 qryConsulta.SQL.Add(' JOIN CM.RECBTOPAGTO RB ON MO.CODLANCFINANC = RB.CODLANCFINANC ');
                                 qryConsulta.SQL.Add(' JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = RB.CODDOCUMENTO ');
                                 qryConsulta.SQL.Add(' JOIN CM.LANCTODOCUM LD ON LD.CODDOCUMENTO = RB.CODDOCUMENTO AND LD.NUMLANCTO = RB.NUMLANCTO ');
                                 qryConsulta.SQL.Add(' LEFT JOIN CM.PLANILHA P ON P.PLNCODIGO = LD.PLNCODIGO ');
                                 qryConsulta.SQL.Add(' WHERE MO.CODLANCFINANC = ' + QuotedStr(Cds.FieldByName('CODLANCFINANC').AsString));
                                 qryConsulta.Open;

                                 if qryConsulta.RecordCount > 0 then
                                 begin
                                      If Not dtmBaseDados.dbBaseDados.Intransaction Then
                                         dtmBaseDados.dbBaseDados.StartTransaction;

                                      //repeat
                                             //Atualizando a Tabela: LANCTODOCUM
                                             qryTemp.Close;
                                             qryTemp.SQL.Clear;
                                             qryTemp.SQL.Add('update (SELECT LD.DATALANCTO AS DATALANCTO_old ');
                                             qryTemp.SQL.Add('          FROM CM.MOVIMFINANC MO');
                                             qryTemp.SQL.Add('               JOIN CM.RECBTOPAGTO RB ON MO.CODLANCFINANC = RB.CODLANCFINANC');
                                             qryTemp.SQL.Add('               JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = RB.CODDOCUMENTO');
                                             qryTemp.SQL.Add('               JOIN CM.LANCTODOCUM LD ON LD.CODDOCUMENTO = RB.CODDOCUMENTO AND LD.NUMLANCTO = RB.NUMLANCTO');
                                             qryTemp.SQL.Add('         WHERE MO.CODLANCFINANC = ' + QuotedStr(qryConsulta.FieldByName('CODLANCFINANC').AsString) + ') as tb');
                                             qryTemp.SQL.Add('set tb.DATALANCTO_old = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', qryConsulta.FieldByName('DATALANCFINAN').AsDateTime)));
                                             qryTemp.ExecSQL;

                                             //Atualizando a Tabela: PLANILHA
                                             qryTemp.Close;
                                             qryTemp.SQL.Clear;
                                             qryTemp.SQL.Add(' update cm.PLANILHA ');
                                             qryTemp.SQL.Add(' set PLNDATDIA = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', qryConsulta.FieldByName('DATALANCFINAN').AsDateTime)));
                                             qryTemp.SQL.Add(' , PERNUMERO = ' + QuotedStr(FormatDateTime('mm',qryConsulta.FieldByName('DATALANCFINAN').AsDateTime)) );       // Andre Imakawa - SIG 114891
                                             qryTemp.SQL.Add(' , PEREXERCICIO = ' + QuotedStr(FormatDateTime('yyyy',qryConsulta.FieldByName('DATALANCFINAN').AsDateTime)) );  // Andre Imakawa - SIG 114891
                                             qryTemp.SQL.Add(' where plncodigo = ' + qryConsulta.FieldByName('PLNCODIGO').AsString );
                                             qryTemp.ExecSQL;

                                             //qryConsulta.Next;
                                      // until not (qryConsulta.Eof);

                                       If dtmBaseDados.dbBaseDados.Intransaction Then
                                          dtmBaseDados.dbBaseDados.Commit;
                                 end;

                            Except
                               If dtmBaseDados.dbBaseDados.Intransaction Then
                                  dtmBaseDados.dbBaseDados.Rollback;
                            End
                       Finally
                            FreeAndNil(qryTemp);
                            FreeAndNil(qryConsulta);
                       End;
                       //Ewerton Beltramini - Sig 96817/96822 - 12/05/2020 - Fim.

                       CarregaCdsMestDet(Cds.FieldByName('CODLANCFINANC').AsFloat);
                  end;

                  CtrlMovimFinanc.AlteraDispFinancDocBaixado(cds.FieldByName('ENTRADASAIDA').AsString,
                     Cds.FieldByName('CODLANCFINANC').AsInteger,
                     dbeDataDisponib.Date);
               End;
         Finally
            Free;
         End;
      End;
   sbtnMudaStatus.Down := False;
End;

Procedure TFrmMovimFinancMT.sbtnCopiarClick(Sender: TObject);
Var
   iCampo: Integer;
   sNomeCampo: String;
Begin
   For iCampo := 0 To cdsBack.FieldCount - 1 Do
      Begin
         sNomeCampo := cdsBack.Fields[iCampo].FieldName;
         Cds.FieldByName(sNomeCampo).Value := cdsBack.FieldByName(sNomeCampo).Value;
      End;

   cdsDet.Close;
   cdsDet.Data := cdsDetBack.Data;
   cdsContabil.Close;
   cdsContabil.Data := cdsContabBack.Data;
   sbtnCopiar.Down := False;
   CmeCadastroAtualizaBotoes(Nil);
   CmeDetalheAtualizaBotoes(Nil);
End;

Procedure TFrmMovimFinancMT.sbtnEstornarClick(Sender: TObject);
Begin
   If Not (iIdModulo = 9) Then
      Begin
         MsgDlg('Não é possível estornar um documento que a origem seja diferente do Controle Financeiro. ', 'Erro', mtError, [mbOk], 0);
         sbtnEstornar.Down := false;
         Exit;
      End;

   With TfrmEstornoFinancMT.Create(Self, cds.FieldByName('CODLANCFINANC').AsFloat, bRegNaoIdent) Do
      Try
         ShowModal;
      Finally
         Free;
      End;
   sbtnEstornar.Down := False;
   sbtnEstornar.Enabled := false;
End;

Procedure TFrmMovimFinancMT.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   dbrConcilia.Enabled := Not (bRegNaoIdent);
   pnlMestre.Enabled := True;
   dblcPortador.SetFocus;
   //Cássio - SOL Nº121805 KINTANA Nº 590324 - Início
   //cds.FieldByName('STATUSCONCILIA').AsString := 'N';
   cds.FieldByName('STATUSCONCILIA').AsString := 'I';
   ////Cássio - SOL Nº121805 KINTANA Nº 590324 - Fim
   cds.FieldByName('CODPORTADOR').AsFloat := rCodPortador;
   cds.FieldByName('DATALANCFINAN').AsDateTime := dDataLancFinanc;
   //Cássio - SOL Nº121805 KINTANA Nº 590324 - Início
   //cds.FieldByName('DATADISPFINANC').AsDateTime := dDataLancFinanc;
   cds.FieldByName('DATADISPFINANC').AsDateTime := dDataDisponib;
   //Cássio - SOL Nº121805 KINTANA Nº 590324 - Início
   cds.FieldByName('ENTRADASAIDA').AsString := sEntradaSaida;
   cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
   cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   cds.FieldByName('IDUSUARIOINCLUSAO').AsFloat := Sistema.IdUsuario;
   cds.FieldByName('VALORLANCFINAN').AsFloat := 0;
   cbNaoContabiliza.Checked := False;

   //Limpa Todos os campos dos Destalhes
   cdsDet.Close;

   cdsDet.Data := DadosRateioVazio;

   cdsContabil.Close;
   cdsContabil.Data := DadosContabVazio;

   lblModulo.Caption := 'Sistema que originou este lançamento: Controle Financeiro';

   rSomaRatMoeCorr := 0;
   rSomaRatOutraMoe := 0;
   rPrxVlrRateioCorr := 0;
   rPrxVlrRateioOM := 0;
   rSvValor := 0;
   rSvValorOut := 0;
   bEstornado := False;

   dbrEntradaSaida.OnChange(self);

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;

End;

Procedure TFrmMovimFinancMT.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   pnlMestre.Enabled := True;
   dbrConcilia.Enabled := False;
   If bRegNaoIdent Then
      Begin
         cds.FieldByName('STATUSCONCILIA').AsString := 'X';
         cds.FieldByName('DATALANCFINAN').AsDateTime := Date;

         //Exclui Linhas da Contabilização
         cdsContabil.Close;
         cdsContabil.Data := DadosContabVazio;

         dblcPortador.ReadOnly := True;
         dbrEntradaSaida.ReadOnly := True;
         dbeValorMoeda.ReadOnly := True;
         dbeValorCorrente.ReadOnly := True;
         // Alterado por FHBS - SOL: 134293 KTN: 793596 - 27/04/2010
         //    end
         //   else
         //    if (cds.FieldByName('CODLANCTRANSF').AsFloat<>0) then
         //     begin
         //        MsgDlg('Proibido Alterar Transferência entre Contas. Exclua e Inclua novamente.',
         //               'Erro',mtError,[mbOk],0);
         //        bbtnCancelarClick(Self);
         //        Exit;
      End;
   dblcPortador.SetFocus;

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;

End;

Procedure TFrmMovimFinancMT.CmeCadastroApplyDelete(sender: TObject;
   Var Accept: Boolean);

Begin
   Inherited;

   Accept := CtrlMovimFinanc.ExcluiFinanceiro(StrToFloat(MontaSelect.ValoresChave[0]));

   If Not (Accept) Then
      MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);

   //Limpa Detalhes
   cdsDet.Close;
   cdsDet.Data := DadosRateioVazio;
   cdsContabil.Close;
   cdsContabil.Data := DadosContabVazio;

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;
End;

Procedure TFrmMovimFinancMT.CmeCadastroCancel(Sender: TObject);
Begin
   pnlMestre.Enabled := False;
   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;

   Inherited;
End;

Procedure TFrmMovimFinancMT.CmeCadastroFind(Sender: TObject);
Var
   cdsAux: TCMClientDataSet;
Begin
   If MontaSelect.RetornouValor Then
      Begin
         CarregaCdsMestDet(StrToFloat(MontaSelect.ValoresChave[0]));
         cdsAux := TCMClientDataSet.Create(Nil);
         Try
            cdsAux.Data := CtrlListTerceiros.ListModulo(cds.FieldByName('IDModulo').AsFloat);
            lblNomeOrigem.Caption := cdsAux.FieldByName('NOMEMODULO').AsString;
            iIdModulo := cdsaux.FieldByName('IDModulo').AsInteger;
            cdsAux.Close;
            // Sol  31714/12862 KTN 1875635 - Paulo Nobre
            // Sol 31714/13162  KTN 1887925 - Paulo Nobre
            spbConciliado.Enabled := (cds.FieldByName('CONCILIADO').AsString <> 'D');
            txtSituacao.Visible := (cds.FieldByName('CONCILIADO').AsString = 'D');
         Finally
            cdsAux.Free;
         End;
      End;

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;

End;

Procedure TFrmMovimFinancMT.CmeCadastroBeforeConfirma(sender: TObject;
   Var Accept: Boolean);
Var
   rTotalImposto: Double;
   cdsParametros: TCMClientDataSet;

Begin
   Try
      //  Cria e preenche o cds de parâmetros
      cdsParametros := TCMClientDataSet.Create(Nil);
      cdsParametros.Data := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

      If Trim(dblcPortador.text) = '' Then
         Begin
            MsgDlg('Obrigatório preencher o Banco/Caixa', 'Erro', mtError, [mbOk], 0);
            dblcPortador.SetFocus;
            Accept := False;
            Exit;
         End;

      If Trim(dbeDataLanc.text) = '' Then
         Begin
            MsgDlg('Obrigatório preencher a Data de Lançamento', 'Erro', mtError, [mbOk], 0);
            dbeDataLanc.SetFocus;
            Accept := False;
            Exit;
         End;

      If Trim(dbeDataDisponib.text) = '' Then
         Begin
            //  Se o flg estiver marcado, entra no bloco
            If cdsParametros.FieldByName('FLGINTDISPFIN').AsString = 'Y' Then
               Begin
                  //  Informa a mensagem ao usuário
                  If MsgDlg('  A data da disponibilidade não foi informada. Caso este documento prescise ' + #13 +
                     'sensibilizar a disponibilide favor informá-la. ' + #13 +
                     'Deseja continuar sem o preenchimento da data?', Sistema.NomeAplicativo, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then

                     //  Caso concorde...
                     Begin
                        Accept := true;
                     End
                  Else
                     //  Caso não concorde...
                     Begin
                        Accept := False;
                        If dbeDataDisponib.CanFocus Then
                           dbeDataDisponib.SetFocus;
                        Exit;
                     End;
               End;
         End;

      If (trim(dbeDataDisponib.text) <> '') And (dbeDataDisponib.Date < dbeDataLanc.Date) Then
         Begin
            MsgDlg('A data de Disponibilidade não pode ser inferior a de Lançamento.', 'Erro', mtError, [mbOk], 0);
            dbeDataDisponib.SetFocus;
            Accept := False;
            Exit;
         End;

      If Not DiasUteis.DiaUtil(Sistema.IdEmpresa, dbeDataLanc.Date, True, False, False) Then
         Begin
            //WO5952 - Helen V Bianchi - Inicio
            //MsgDlg('A data de lançamento não é um dia útil.', 'Erro', mtError, [mbOk], 0);
            //dbeDataLanc.SetFocus;
            //Accept := False;
            //Exit;
            If MsgDlg(' A data de lançamento não é um dia útil. ' + #13 +
                      ' Deseja continuar ?', Sistema.NomeAplicativo, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then

            Begin
                   Accept := true;
            End
            Else
            begin
            dbeDataLanc.SetFocus;
            Accept := False;
            Exit;
         End;
            //WO5952 - Helen V Bianchi - Fim
         End;

      If (trim(dbeDataDisponib.text) <> '') And (Not DiasUteis.DiaUtil(Sistema.IdEmpresa, dbeDataDisponib.Date, True, False, False)) Then
         Begin
            //WO5952 - Helen V Bianchi - Inicio
            //MsgDlg('A data da disponibilidade não é um dia útil.', 'Erro', mtError, [mbOk], 0);
            //dbeDataDisponib.SetFocus;
            //Accept := False;
            //Exit;
            If MsgDlg(' A data da disponibilidade não é um dia útil. ' + #13 +
                      ' Deseja continuar ?', Sistema.NomeAplicativo, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then

            Begin
                Accept := true;
            end
            else
            begin
            dbeDataDisponib.SetFocus;
            Accept := False;
            Exit;
         End;
            //WO5952 - Helen V Bianchi - Fim
         End;

      If (dbeValorMoeda.Value = 0) And (cds.FieldByName('MOECODIGO').AsFloat <> 0) Then
         Begin
            MsgDlg('Obrigatório preencher o Valor em Outra Moeda', 'Erro', mtError, [mbOk], 0);
            dbeValorMoeda.SetFocus;
            Accept := False;
            exit;
         End;

      If (dbeValorCorrente.Value = 0) Then
         Begin
            If MsgDlg('Confirma que o Valor em Moeda Corrente = 0,00',
               'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = MrNo Then
               Begin
                  dbeValorCorrente.SetFocus;
                  Accept := False;
                  Exit;
               End;
         End;

      If (Trim(dblcHistPad.text) = '') Then
         Begin
            MsgDlg('Obrigatório preencher o Histórico Padrão', 'Erro', mtError, [mbOk], 0);
            dblcHistPad.SetFocus;
            Accept := False;
            Exit;
         End;

      If (Trim(dbeHistorico.text) = '') Then
         Begin
            MsgDlg('Obrigatório preencher o Histórico do Lançamento', 'Erro', mtError, [mbOk], 0);
            dbeHistorico.SetFocus;
            Accept := False;
            Exit;
         End;

      If (Trim(dbeDocumento.Text) = '') Then
         Begin
            If MsgDlg('Numero do Documento não informado. Deseja prosseguir assim mesmo?', 'Informação', mtInformation, [mbNo, mbYes], 1) = mrNo Then
               Begin
                  dbeDocumento.SetFocus;
                  Accept := False;
                  Exit;
               End;
         End;

      //Faz backup do Rateio e do Valor do Lançamento
      rValorLancBackup := cds.FieldByName('VALORLANCFINAN').AsFloat;
      cdsDetBackup.Data := cdsDet.Data;

      If (bCalcImposto) And (cds.state In [dsInsert]) Then
         Begin
            //Gera linhas de Imposto
            If Not (CtrlMovimFinanc.GeraImpostoRateio(rTotalImposto)) Then
               Begin
                  MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);
                  Exit;
               End
            Else
               Begin
                  cds.FieldByName('VALORLANCFINAN').AsFloat :=
                     cds.FieldByName('VALORLANCFINAN').AsFloat + rTotalImposto;
                  cdsContabil.EmptyDataSet;
               End;
         End;

      //Gera linhas de Contabilização
      If cbNaoContabiliza.Checked Then
         Begin
            //Limpa cds de Contabilização (cdsContabil)
            cdsContabil.EmptyDataSet;
         End
      Else
         // Alterado por Arnaldo V. Scarin em 13/11/2009
         // Sol: 129385 Kintana: 708850
         // Correção do erro na Tela de MOvimentação Financeira
         // "A conta contábil "Segregação de Recursos" não permite critério para
         // segregação." Esse erro ocorre pois o IdSegregaCriter fica com "sujeira"
         // e acaba gerando a mensagem, quando não é feito a contabilização do
         // rateio lancado no movimento
         //if (ParamIntegra.IntegraContab) and (cds.FieldByName('IDMODULO').AsFloat=Sistema.IdModulo) and
         //   (cdsContabil.IsEmpty) and (Trim(dblcPortador.Text) <> '') then
         If (ParamIntegra.IntegraContab) And
            (cds.FieldByName('IDMODULO').AsFloat = Sistema.IdModulo) And
            (Trim(dblcPortador.Text) <> '') Then
            Begin
               cdsContabil.EmptyDataSet;
               If Not (CtrlMovimFinanc.GeraContabilizacao(sContaBanco, sCCustoBanco, rSubContaBanco,
                  sContaNI, sCCustoNI, rSubContaNI, bRegNaoIdent,
                  ParamIntegra.Plano)) Then
                  Begin
                     MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);
                     Exit;
                  End;
            End;

      If Not (cbNaoContabiliza.Checked) And (ParamIntegra.IntegraContab) And
         (cds.FieldByName('IDMODULO').AsFloat = 9) Then
         Begin
            If cdsContabil.IsEmpty Then
               Begin
                  MsgDlg('Obrigatório ter Lançamento Contábil', 'Erro', mtError, [mbOk], 0);
                  dbeDocumento.SetFocus;
                  DesfazImposto;
                  Accept := False;
                  Exit;
               End;

            //Verifica Linhas Contábeis
            Accept := CtrlMovimFinanc.VerificaContabilizacao(ParamIntegra.Plano,
               sContaBanco,
               rSubContaBanco, ParamIntegra.PlanoCentroCusto);
            If Not (Accept) Then
               Begin
                  MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);
                  DesfazImposto;
                  Exit;
               End;
         End;

      If (dbrConcilia.ItemIndex = 2) And (cds.State In [dsInsert, dsEdit]) Then
         Cds.FieldByName('DATACONCILIACAO').AsDateTime := Cds.FieldByName('DATALANCFINAN').AsDateTime;
      //Cássio - SOL Nº121805 KINTANA Nº 590324
      dDataDisponib := dbeDataDisponib.Date;

      FillContaContabil;
      Inherited;

   Finally
      //  Destroi o cds
      FreeAndNil(cdsParametros);
   End;
End;

Procedure TFrmMovimFinancMT.CmeCadastroConfirma(Sender: TObject);
Var
   iCampo: Integer;
   sNomeCampo: String;
   bResposta: Boolean;
Begin
   CmeDetalhe.Confirma(Self);
   bbtnVoltarDetClick(Self);
   cdsContabil.First;

   If (sbtnInserir.Down) Then
      Begin
         sEntradaSaida := cds.FieldByName('ENTRADASAIDA').AsString;
         rCodPortador := cds.FieldByName('CODPORTADOR').AsFloat;
         dDataLancFinanc := cds.FieldByName('DATALANCFINAN').AsDateTime;
         dDataDisponib := cds.FieldByName('DATADISPFINANC').AsDateTime;
      End;

   bResposta := True;
   // Inclusão ou Regularização
   If (sbtnInserir.Down) Or (bRegNaoIdent) Then
      Begin
         //Limpa cds's de backup para a cópia
         cdsBack.EmptyDataSet;
         cdsDetBack.EmptyDataSet;
         cdsContabBack.EmptyDataSet;

         //Transfere dados do cds
         cdsBack.Append;
         For iCampo := 0 To cdsBack.FieldCount - 1 Do
            Begin
               sNomeCampo := cdsBack.Fields[iCampo].FieldName;
               cdsBack.FieldByName(sNomeCampo).Value := cds.FieldByName(sNomeCampo).Value;
            End;

         cdsDetBack.Data := cdsDet.Data;
         cdsContabBack.Data := cdsContabil.Data;

         bResposta := CtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent,
            opInclusao,
            ParamIntegra.Plano,
            ParamIntegra.IntegraContab,
            bCalcImposto);
         bIncluido := bResposta;
      End;

   // Alteração
   If (sbtnAlterar.Down) And Not (bRegNaoIdent) Then
      bResposta := CtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent,
         opAlteracao,
         ParamIntegra.Plano,
         ParamIntegra.IntegraContab,
         bCalcImposto);

   If Not (bResposta) Then
      Begin
         MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);
         DesfazImposto;
         Abort;
      End;

   If (sbtnAlterar.Down) Then
      Begin
         dblcPortador.ReadOnly := False;
         dbrEntradaSaida.ReadOnly := False;
         dbeValorMoeda.ReadOnly := False;
         dbeValorCorrente.ReadOnly := False;
      End;

   //Taffarel - SIG81430 - início
   If Not (CtrlMovimFinanc.MudaStatus(Cds.FieldByName('CODLANCFINANC').AsFloat,
      Cds.FieldByName('STATUSCONCILIA').AsString,
      Cds.FieldByName('DATALANCFINAN').AsDateTime,
      Cds.FieldByName('DATADISPFINANC').AsDateTime,
      Cds.FieldByName('DATALANCFINAN').AsDateTime)) Then    //Ewerton Beltramini - Sig 96817/96822 - 18/03/2020 - Acrescentado a variavel...
      MsgDlg(CtrlMovimFinanc.MessageInfo, 'Erro', mtError, [mbOk], 0);
   //Taffarel - SIG81430 - fim


   pnlMestre.Enabled := False;
   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;

   Inherited;
End;

Procedure TFrmMovimFinancMT.CmeDetalheInsert(Sender: TObject);
var bUsaUltimoRateio : Boolean;     // WO12516 - Arnaldo V. Scarin em 07/08/2024
Begin
   FillContaContabil;
   pgcContabil.ActivePageIndex := 0;
   bUsaUltimoRateio := True;       // WO12516 - Arnaldo V. Scarin em 07/08/2024

   Case pgctrlDetalhe.ActivePageIndex Of
      0: Begin

            If (cdsDet.IsEmpty) Then
            Begin
               If (rPrxVlrRateioCorr = 0) Then
                  rPrxVlrRateioCorr := cds.FieldByName('VALORLANCFINAN').AsFloat;
               If (rPrxVlrRateioOM = 0) And (cdsDet.IsEmpty) Then
                  rPrxVlrRateioOM := cds.FieldByName('VALOROUTRAMOEDA').AsFloat;
               bUsaUltimoRateio := False;       // WO12516 - Arnaldo V. Scarin em 07/08/2024
            End;

            Inherited;

            cdsDet.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

            cdsDet.FieldByName('VALOR').AsFloat := cds.FieldByName('VALORLANCFINAN').AsFloat - rSomaRatMoeCorr;
            cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat := cds.FieldByName('VALOROUTRAMOEDA').AsFloat - rSomaRatOutraMoe;

            cdsDet.FieldByName('IDPLANOPREV').AsInteger := ParamIntegra.PlanoPrevGlobal;
            cdsDet.FieldByName('IDPATRO').AsInteger := ParamIntegra.PatroGlobal;

            If (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat <> 0) Then
            Begin
               cdsDet.FieldByName('MOECODIGO').AsFloat :=
                  cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;
               dbeValorMoedaDet.Enabled := True;
               dbeValorDet.Enabled := False;
            End
            Else
            Begin
               dbeValorMoedaDet.Enabled := False;
               dbeValorDet.Enabled := True;
            End;

            // WO12516 - Controle Financeiro - Movimento financeiro
            // Alterado por Arnaldo V. Scarin em 07/08/2024
            if bUsaUltimoRateio then
               RecuperaDadosUltimoRateio;


            //Testa se o cds de Unidade de Neg. e/ou o cds de Centro de Respon. têm
            //apenas um registro. Caso só exista um, atribui estes aos respectivos campos.
            TestaUnNegCentroRespon;

            If dblcUnidNegoc.Enabled Then
               dblcUnidNegoc.SetFocus
            Else
            Begin
              If dblcCentroRespon.Enabled Then
                dblcCentroRespon.SetFocus
              Else
                dblcTipoRD.SetFocus;
            End;

            cdsDet.FieldByName('MOECODIGO').Clear;
            edMoeda.Clear;

            If (cds.FieldByName('MOECODIGO').AsFloat <> 0) Then
            Begin
              cdsDet.FieldByName('MOECODIGO').AsFloat := cds.FieldByName('MOECODIGO').AsFloat;
              edMoedaDet.Text := edMoeda.Text;
            End
            Else
              cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat := 0;

            rPrxVlrRateioCorr := cds.FieldByName('VALORLANCFINAN').AsFloat - rSomaRatMoeCorr;
            rPrxVlrRateioOM := cds.FieldByName('VALOROUTRAMOEDA').AsFloat - rSomaRatOutraMoe;

         End;

      1: Begin
            Inherited;

            dblcSubConta.Enabled := False;
            dblcCCusto.Enabled := False;

            cdsContabil.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

            If cds.FieldByName('ENTRADASAIDA').AsString = 'S' Then
               Begin
                  cdsContabil.FieldByName('LACDEBCRE').AsString := 'D';
                  cdsContabil.FieldByName('LACTIPO').AsString := '0';
               End
            Else
               Begin
                  cdsContabil.FieldByName('LACDEBCRE').AsString := 'C';
                  cdsContabil.FieldByName('LACTIPO').AsString := '1';
               End;

            cdsContabil.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
            cdsContabil.FieldByName('LACNUMDOC').AsString := dbeDocumento.Text;

            If (cds.FieldByName('MOECODIGO').AsFloat <> 0) Then
               Begin
                  dbeValorOMContab.Enabled := True;
                  dbeValorCorrenteContab.Enabled := False;
               End
            Else
               Begin
                  dbeValorOMContab.Enabled := False;
                  dbeValorCorrenteContab.Enabled := True;
               End;
         End;
   End;
End;

Procedure TFrmMovimFinancMT.CmeDetalheEdit(Sender: TObject);
Begin
   Inherited;
   //Vinicius Maciel - SOL 163982 KTN 1404974
   If ((dblcUnidNegoc.Text = '') And (dblcUnidNegoc.LookupValue <> '')) Then
      dblcUnidNegoc.Text := CtrlListTerceiros.recuperaAtividadePerd(dblcUnidNegoc.LookupValue);
   //Vinicius Maciel - SOL 163982 KTN 1404974 - FIM
   Case pgctrlDetalhe.ActivePageIndex Of
      0: Begin //TAB de Rateio
            If (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat <> 0) Then
               Begin
                  cdsDet.FieldByName('MOECODIGO').AsFloat :=
                     cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;
                  dbeValorMoedaDet.Enabled := True;
                  dbeValorDet.Enabled := False;
               End
            Else
               Begin
                  dbeValorMoedaDet.Enabled := False;
                  dbeValorDet.Enabled := True;
               End;

            cdsDet.FieldByName('MOECODIGO').Clear;
            edMoedaDet.Clear;

            //Carrega Combo de Tipo de Recebimento Desembolso
            CarregaComboTRD;

            //Testa se o cds de Unidade de Neg. e/ou o cds de Centro de Respon. têm
            //apenas um registro. Caso só exista um, atribui estes aos respectivos campos.
            TestaUnNegCentroRespon;

            If dblcUnidNegoc.Enabled Then
               dblcUnidNegoc.SetFocus
            Else
               Begin
                  If dblcCentroRespon.Enabled Then
                     dblcCentroRespon.SetFocus
                  Else
                     dblcTipoRD.SetFocus;
               End;

            If (cds.FieldByName('MOECODIGO').AsFloat <> 0) Then
               Begin
                  cdsDet.FieldByName('MOECODIGO').AsFloat := cds.FieldByName('MOECODIGO').AsFloat;
                  edMoedaDet.Text := edMoeda.Text;
               End
            Else
               dbeValorMoedaDet.Value := 0;

            //Atualiza cds de Tipo de Documento
            dblcTipoDocumentoEnter(Nil);
         End;

      1: Begin //TAB de Contabilização
            If cdsContabil.FieldByName('CODCENTROCUSTO').IsNull Then
               dblcCCusto.Enabled := False
            Else
               dblcCCusto.Enabled := True;

            If cdsContabil.FieldByName('CODSUBCONTA').IsNull Then
               dblcSubConta.Enabled := False
            Else
               dblcSubConta.Enabled := True;

            If (cds.FieldByName('MOECODIGO').AsInteger <> 0) Then
               Begin
                  dbeValorOMContab.Enabled := True;
                  dbeValorCorrenteContab.Enabled := False;
                  If (cdsContabil.FieldByName('LACVALHIST').AsFloat = 0) Then
                     cdsContabil.FieldByName('LACVALHIST').AsFloat :=
                        cdsContabil.FieldByName('LACVALOR').AsFloat / rValorCotacao;
               End
            Else
               Begin
                  dbeValorOMContab.Enabled := False;
                  dbeValorCorrenteContab.Enabled := True;
                  cdsContabil.FieldByName('LACVALHIST').Clear;
               End;

            pnlContabil.BringToFront;
            pgcContabil.ActivePageIndex := 0;
         End;
   End;
End;

Procedure TFrmMovimFinancMT.CmeDetalheDelete(Sender: TObject);
Begin
   If (pgctrlDetalhe.ActivePageIndex = 0) Then
      Begin
         rSomaRatMoeCorr := rSomaRatMoeCorr - cdsDet.FieldByName('VALOR').AsFloat;
         rSomaRatOutraMoe := rSomaRatOutraMoe - cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;

         rPrxVlrRateioCorr := cds.FieldByName('VALORLANCFINAN').AsFloat - rSomaRatMoeCorr;
         rPrxVlrRateioOM := cds.FieldByName('VALOROUTRAMOEDA').AsFloat - rSomaRatOutraMoe;
      End;
   Inherited;
End;

// WO12516 - Controle Financeiro - Movimento financeiro
// Alterado por Arnaldo V. Scarin em 07/08/2024
Procedure TFrmMovimFinancMT.SalvaDadosUltimoRateio;
begin
  idCodCentroRespon  := cdsDet.FieldByName('CODCENTRORESPON').asString;
  sDescrCentroRespon := cdsDet.FieldByName('DESCCRESPON').AsString;

  idCodTipoDoc       := cdsDet.FieldByName('CODTIPDOC').asInteger;

  idAtividade        := cdsDet.FieldByName('UNIDNEGOC').asInteger;
  idCodTipRecDes     := cdsDet.FieldByName('CODTIPRECDES').asString;
  sRecPagTipRecDes   := cdsDet.FieldByName('RECPAG').asString;
  sDescrTipRecDes    := cdsDet.FieldByName('Descricao').asString;
  idCentroCusto      := cdsDet.FieldByName('CODCENTROCUSTO').asString;
  idPatro            := cdsDet.FieldByName('IDPATRO').asInteger;
  idPrograma         := cdsDet.FieldByName('IDPROGRAMA').asString;
  idPlanoPrev        := cdsDet.FieldByName('IDPLANOPREV').asInteger;
end;

// WO12516 - Controle Financeiro - Movimento financeiro
// Alterado por Arnaldo V. Scarin em 07/08/2024
procedure TFrmMovimFinancMT.RecuperaDadosUltimoRateio;
begin
  cdsDet.FieldByName('CODCENTRORESPON').asString := idCodCentroRespon;
  cdsDet.FieldByName('DESCCRESPON').AsString     := sDescrCentroRespon;

  cdsDet.FieldByName('CODTIPDOC').asInteger      := idCodTipoDoc;
  cdsDet.FieldByName('UNIDNEGOC').asInteger      := idAtividade;

  cdsDet.FieldByName('CODTIPRECDES').asString    := idCodTipRecDes;
  cdsDet.FieldByName('Descricao').asString       := sDescrTipRecDes;
  cdsDet.FieldByName('RECPAG').asString          := sRecPagTipRecDes;

  cdsDet.FieldByName('CODCENTROCUSTO').asString  := idCentroCusto;
  cdsDet.FieldByName('IDPATRO').asInteger        := idPatro;
  cdsDet.FieldByName('IDPROGRAMA').asString      := idPrograma;
  cdsDet.FieldByName('IDPLANOPREV').asInteger    := idPlanoPrev;

  // Ajuste para o Tipo de Documento
  cdsTipoDoc.Filtered := False;
  cdsTipoDoc.Filter := 'RECPAG = ''' + cdsDet.FieldByName('RECPAG').AsString + '''';
  cdsTipoDoc.Filtered := True;
  If cdsTipoDoc.Locate('CODTIPDOC', cdsDet.FieldByName('CODTIPDOC').AsFloat, []) Then
     dblcTipoDocumento.Text := cdsTipoDoc.FieldByName('DESCRICAO').AsString
  Else
     dblcTipoDocumento.Clear;
end;


Procedure TFrmMovimFinancMT.CmeDetalheBeforeConfirma(sender: TObject; Var Accept: Boolean);
Begin
   If (cds.State In ([dsInsert, dsEdit])) Then
      Begin
         pgcContabil.ActivePageIndex := 0;

         Case pgctrlDetalhe.ActivePageIndex Of
            0: Begin
                  If (cdsDet.State In ([dsInsert, dsEdit])) Then
                     Begin
                        If Trim(dblcUnidNegoc.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher a Atividade', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcUnidNegoc.SetFocus;
                              abort;
                           End;

                        If Trim(dblcCentroRespon.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher o Centro de Responsabilidade', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcCentroRespon.SetFocus;
                              abort;
                           End;

                        If Trim(dblcTipoRD.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcTipoRD.SetFocus;
                              abort;
                           End;

                        If Trim(dblcTipoDocumento.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher o Tipo de Documento', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcTipoDocumento.SetFocus;
                              abort;
                           End;

                        If (dbeValorMoedaDet.Value = 0) And (cds.FieldByName('MOECODIGO').AsInteger <> 0) Then
                           Begin
                              MsgDlg('Obrigatório preencher o Valor em Outra Moeda', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dbeValorMoedaDet.SetFocus;
                              abort;
                           End;

                        If (dbeValorDet.Value = 0) Then
                           Begin
                              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente', 'Erro', mtError, [mbOk], 0);
                              dbeValorDet.SetFocus;
                              Accept := False;
                              abort;
                           End;

                        If (Sistema.UsaPlanoPatro) Then
                           Begin
                              If (dblcPrograma.Value = '') And (dbrConcilia.ItemIndex <> 2) Then
                                 Begin
                                    MsgDlg('Obrigatório preencher o Programa', 'Erro', mtError, [mbOk], 0);
                                    Accept := False;
                                    //pgcRateio.ActivePageIndex:=1;
                                    dblcPrograma.SetFocus;
                                    abort;
                                 End;

                              If dblcPatrocinadorRateio.Value = '' Then
                                 Begin
                                    MsgDlg('Obrigatório preencher o Patrocinador', 'Erro', mtError, [mbOk], 0);
                                    Accept := False;
                                    //pgcRateio.ActivePageIndex:=1;
                                    dblcPatrocinadorRateio.SetFocus;
                                    abort;
                                 End;

                              If dblcPlanoPrevRateio.Value = '' Then
                                 Begin
                                    MsgDlg('Obrigatório preencher o Plano Previdenciário', 'Erro', mtError, [mbOk], 0);
                                    Accept := False;
                                    dblcPlanoPrevRateio.SetFocus;
                                    abort;
                                 End;

                              // restringir plano / patro se um deles for comum o outro também deve ser
                              If ParamIntegra.SegregaVirtual Then Begin
                                    If (ParamIntegra.PatroGlobal = cdsDet.FieldByName('IDPATRO').AsInteger) Or
                                       (ParamIntegra.PlanoPrevGlobal = cdsDet.FieldByName('IDPLANOPREV').AsInteger) Or
                                       (ParamIntegra.PlanoPrevAdm = cdsDet.FieldByName('IDPLANOPREV').AsInteger) Then Begin
                                          If (Not ((ParamIntegra.PlanoPrevGlobal = cdsDet.FieldByName('IDPLANOPREV').AsInteger) Or
                                             (ParamIntegra.PlanoPrevAdm = cdsDet.FieldByName('IDPLANOPREV').AsInteger))) Or
                                             (ParamIntegra.PatroGlobal <> cdsDet.FieldByName('IDPATRO').AsInteger) Then Begin

                                                MsgDlg('Se o Plano Previdenciário for o "COMUM"/"ADMINISTRATIVO" a Patrocinadora também deve ser a "COMUM", e vice-versa!', 'Controle Financeiro', mtwarning, [mbok], 0);
                                                If dblcPatrocinadorRateio.CanFocus Then dblcPatrocinadorRateio.SetFocus;
                                                abort;
                                             End;
                                       End;
                                 End;

                              If Not (CtrlPlanPrevContabPatro.ValidaPlanoPatro(cdsDet.FieldByName('IDPATRO').AsInteger, cdsDet.FieldByName('IDPLANOPREV').AsInteger)) Then
                                 Begin
                                    MsgDlg('Não existe o relacionamento entre a Patrocinadora e o Plano escolhidos.', 'Controle Financeiro', mtError, [mbok], 0);
                                    If dblcPatrocinadorRateio.CanFocus Then dblcPatrocinadorRateio.SetFocus;
                                    abort;
                                 End;
                           End;

                        cdsDet.FieldByName('MOESIGLA').AsString := edMoedaDet.Text;

                        If cdsDet.FieldByName('CODCENTROCUSTO').IsNull Then
                           cdsDet.FieldByName('IDEMPRESA').Clear
                        Else
                           cdsDet.FieldByName('IDEMPRESA').Asfloat := Sistema.IdEmpresa;
                        // WO12516 - Controle Financeiro - Movimento financeiro
                        // Alterado por Arnaldo V. Scarin em 07/08/2024
                        SalvaDadosUltimoRateio;
                     End;
               End;

            1: Begin
                  If cdsContabil.State In ([dsInsert, dsEdit]) Then
                     Begin
                        If Trim(dbccConta.Conta.Numero) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher a Conta Contábil', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dbccConta.SetFocus;
                              abort;
                           End;

                        If (dbccConta.Conta.ObrigaSubConta) And (Trim(dblcSubConta.Text) = '') Then
                           Begin
                              MsgDlg('Obrigatório preencher a Sub-Conta', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcSubConta.SetFocus;
                              abort;
                           End;

                        If (dbccConta.Conta.ObrigaCentrodeCusto) And (Trim(dblcCCusto.Text) = '') Then
                           Begin
                              MsgDlg('Obrigatório preencher o Centro de Custo', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcCCusto.SetFocus;
                              abort;
                           End;

                        If Trim(dblcAtividade.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher a Atividade', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dblcAtividade.SetFocus;
                              abort;
                           End;

                        If Trim(dbeHist1.Text) = '' Then
                           Begin
                              MsgDlg('Obrigatório preencher pelo menos a primeira linha do histórico', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dbeHist1.SetFocus;
                              abort;
                           End;

                        If (dbeValorOMContab.Value = 0) And (cds.FieldByName('MOECODIGO').AsInteger <> 0) Then
                           Begin
                              MsgDlg('Obrigatório preencher o Valor em Outra Moeda', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dbeValorOMContab.SetFocus;
                              abort;
                           End;

                        If dbeValorCorrenteContab.Value = 0 Then
                           Begin
                              MsgDlg('Obrigatório preencher o Valor', 'Erro', mtError, [mbOk], 0);
                              Accept := False;
                              dbeValorCorrenteContab.SetFocus;
                              abort;
                           End;

                        If Sistema.UsaPlanoPatro Then
                           Begin
                              If (dblcPatrocinadorContabil.Value = '') Then
                                 Begin
                                    MsgDlg('Obrigatório preencher o Patrocinador', 'Erro', mtError, [mbOk], 0);
                                    Accept := False;
                                    pgcContabil.ActivePageIndex := 1;
                                    dblcPatrocinadorContabil.SetFocus;
                                    abort;
                                 End;

                              If (dblcPlanoPrevContabil.Value = '') Then
                                 Begin
                                    MsgDlg('Obrigatório preencher o Plano Previdenciário', 'Erro', mtError, [mbOk], 0);
                                    Accept := False;
                                    pgcContabil.ActivePageIndex := 1;
                                    dblcPlanoPrevContabil.SetFocus;
                                    abort;
                                 End;
                           End; //Usa Plano Patro
                     End; //cdsContabil.State
               End; // 1:
         End; // case
      End; // cds.State
   Inherited;
End;

Procedure TFrmMovimFinancMT.CmeDetalheConfirma(Sender: TObject);
Begin
   If (pgctrlDetalhe.ActivePageIndex = 0) And (cdsDet.State In [dsInsert, dsEdit]) Then
      Begin
         cdsDet.FieldByName('NOME_PATRO').AsString := dblcPatrocinadorRateio.Text;
         cdsDet.FieldByName('NOME_PLANO').AsString := dblcPlanoPrevRateio.Text;
         cdsDet.FieldByName('DESCPROGRAMA').AsString := dblcPrograma.Text;

         TotalizaRateio;

         //Calcula os próximos valores de Rateio para inclusões
         rPrxVlrRateioCorr := cds.FieldByName('VALORLANCFINAN').AsFloat - rSomaRatMoeCorr;
         rPrxVlrRateioOM := cds.FieldByName('VALOROUTRAMOEDA').AsFloat - rSomaRatOutraMoe;
      End;
   Inherited;
End;

Procedure TFrmMovimFinancMT.CarregaComboTRD;
Begin
   If (Cds.FieldByName('ENTRADASAIDA').AsString = 'E') Then
      Begin
         cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
            dblcCentroRespon.LookupValue, 'E');
      End
   Else
      Begin
         cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
            dblcCentroRespon.LookupValue, 'S');
      End;
   //pendência 27218
   filtraRecDes;
End;

Procedure TFrmMovimFinancMT.CarregaCdsMestDet(rCodLancFinanc: Double);
Var sFiltro: String;
Begin
   //Carrega cds Mestre e Detalhes
   cds.Close;
   cds.Data := CtrlMovimFinanc.ListMovimFinanc(rCodLancFinanc);

   cdsDet.Close;
   cdsDet.Data := CtrlMovimFinanc.ListRateioFinanc(rCodLancFinanc);
   TFloatField(cdsDet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
   TFloatField(cdsDet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
   TStringField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask := ParamIntegra.MascaraCC + ';0; ';
   cdsContabil.Close;
   cdsContabil.Data := CtrlMovimFinanc.ListContabil(cds.FieldByName('PLNCODIGO').AsFloat);
   TFloatField(cdsContabil.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
   TFloatField(cdsContabil.FieldByName('LACVALHIST')).DisplayFormat := '#,##0.00';
   TStringField(cdsContabil.FieldByName('PLACONTA')).EditMask := ParamIntegra.MascaraPlano + ';0; ';

   //Ricardo Freitas SOL: 157289 - Kintana: 1277983
   SqlConsultaDoc.SQL.Text := StringReplace(sqlConsultaDoc.SQL.Text, 'AND 1 = 2', ':Filtro', [rfReplaceAll, rfIgnoreCase]);
   SqlConsultaDoc.SQL.Text := StringReplace(sqlConsultaDoc.SQL.Text, 'AND 1 = 1', ':Filtro', [rfReplaceAll, rfIgnoreCase]);

   // Alterado por Arnaldo V. Scarin em 13/11/2009
   // Kintana: 575741 Sol: 120617
   // Melhoria de performance na abertura da tela de movimentação financeira
   If rCodLancFinanc = 0 Then
      sFiltro := 'AND 1 = 2'
   Else
      sFiltro := 'AND 1 = 1';

   SqlConsultaDoc.SQL.Text := StringReplace(sqlConsultaDoc.SQL.Text, ':Filtro', sFiltro, [rfReplaceAll, rfIgnoreCase]);

   sqlConsultaDoc.Prepare;
   sqlConsultaDoc.ParamByName('CODLANCFINANC').AsFloat := rCodLancFinanc;

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   //Limite a Qtde de registros na consulta de documentos para 50
   SqlConsultaDoc.SQL.Text := StringReplace(sqlConsultaDoc.SQL.Text, ':Qtde_Registro', ' <= 50 ', [rfReplaceAll, rfIgnoreCase]);

   sqlConsultaDoc.Open;
   TFloatField(cdsConsultaDoc.FieldByName('VALOR')).DisplayFormat := '#,##0.00';

   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   lblTotDOc.Caption := 'Total: ' + IntToStr(cdsConsultaDoc.RecordCount);

   If (cdsContabil.IsEmpty) And Not (cdsDet.IsEmpty) Then
      cbNaoContabiliza.Checked := True
   Else
      cbNaoContabiliza.Checked := False;

   rSomaRatMoeCorr := 0;
   rSomaRatOutraMoe := 0;

   If (rCodLancFinanc > 0) Then
      Begin
         While Not (cdsDet.Eof) Do
            Begin
               If ((cdsDet.FieldByName('RECPAG').AsString = 'R') And
                  (cds.FieldByName('ENTRADASAIDA').AsString = 'E')) Or
                  ((cdsDet.FieldByName('RECPAG').AsString = 'P') And
                  (cds.FieldByName('ENTRADASAIDA').AsString = 'S')) Then
                  Begin
                     rSomaRatMoeCorr := rSomaRatMoeCorr + cdsDet.FieldByName('VALOR').AsFloat;
                     rSomaRatOutraMoe := rSomaRatOutraMoe + cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
                  End
               Else
                  Begin
                     rSomaRatMoeCorr := rSomaRatMoeCorr - cdsDet.FieldByName('VALOR').AsFloat;
                     rSomaRatOutraMoe := rSomaRatOutraMoe - cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
                  End;
               cdsDet.Next;
            End;
         cdsDet.First;
      End;

   //Calcula os próximos valores de Rateio para inclusões
   rPrxVlrRateioCorr := cds.FieldByName('VALORLANCFINAN').AsFloat - rSomaRatMoeCorr;
   rPrxVlrRateioOM := cds.FieldByName('VALOROUTRAMOEDA').AsFloat - rSomaRatOutraMoe;

   bEstornado := (cds.FieldByName('FLGESTORNADO').AsString = 'S');

End;

Procedure TFrmMovimFinancMT.TestaUnNegCentroRespon;
Begin
   dblcUnidNegoc.Enabled := True;
   dblcCentroRespon.Enabled := True;

   //Testa se existe apenas uma atividade e um Centro de Responsabilidade
   cdsUnidNeg.First;
   If (cdsUnidNeg.RecordCount = 1) Then
      Begin
         dblcUnidNegoc.Enabled := False;
         cdsDet.FieldByName('UNIDNEGOC').AsFloat := cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;
         cdsDet.FieldByName('DESCUNIDNEG').AsString := cdsUnidNeg.FieldByName('NOME').AsString;
      End;

   cdsCentroRespon.First;
   If (cdsCentroRespon.RecordCount = 1) Then
      Begin
         dblcCentroRespon.Enabled := False;
         cdsDet.FieldByName('CODCENTRORESPON').AsString :=
            cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
         cdsDet.FieldByName('DESCCRESPON').AsString :=
            cdsCentroRespon.FieldByName('NOME').AsString;
      End;
End;

Procedure TFrmMovimFinancMT.DesfazImposto;
Begin
   If Not (cdsDet.IsEmpty) Then
      Begin
         cdsDet.Close;
         cdsDet.Data := cdsDetBackup.Data;
      End;
End;

Procedure TFrmMovimFinancMT.bbtnOkDetClick(Sender: TObject);
Var
   Accept: Boolean;
Begin
   If (cdsDet.State In [dsInsert, dsEdit]) Or (cdsContabil.State In [dsInsert, dsEdit]) Then
      CmeDetalheBeforeConfirma(Nil, Accept);

   Inherited;
End;

Procedure TFrmMovimFinancMT.cdsDetAfterScroll(DataSet: TDataSet);
Begin
   dblcCentroRespon.Update;
End;

Procedure TFrmMovimFinancMT.cdsContabilAfterScroll(DataSet: TDataSet);
Begin
   dblcCCusto.Update;
End;

Procedure TFrmMovimFinancMT.AbortaInclusaoDet(Var Msg: TMessage);
Begin
   bbtnVoltarDetClick(Nil);
End;

Procedure TFrmMovimFinancMT.bbtnConfirmarClick(Sender: TObject);
Var
   dData: TDateTime;
Begin
   If bIntegraComDispon Then
      dData := Cds.FieldByName('DATADISPFINANC').AsDateTime
   Else
      dData := Cds.FieldByName('DATALANCFINAN').AsDateTime;

   If Not _CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, dData) Then
      Begin
         MsgDlg(_CtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
         Exit;
      End;

   Inherited;

End;

Procedure TFrmMovimFinancMT.CmeDetalheCancel(Sender: TObject);
Begin
   Inherited;
   cdsDet.Cancel
End;

Procedure TFrmMovimFinancMT.bbtnVoltarDetClick(Sender: TObject);
Begin
   Inherited;
   HabilitaRateioPreDefinido(True); // Leandro WO13599

   cdsDet.Cancel
End;

Procedure TFrmMovimFinancMT.TotalizaRateio;
Begin
   If cdsDet.State = dsEdit Then
      Begin
         If FloatsEqual(rSomaRatMoeCorr, cds.FieldByName('VALORLANCFINAN').Value) Then
            rSomaRatMoeCorr := rSomaRatMoeCorr - cdsDet.FieldByName('VALOR').Value
         Else
            Begin
               If bAlterou Then
                  rSomaRatMoeCorr := rSomaRatMoeCorr + cdsDet.FieldByName('VALOR').Value
               Else
                  rSomaRatMoeCorr := rSomaRatMoeCorr - cdsDet.FieldByName('VALOR').Value
            End;

         If FloatsEqual(rSomaRatOutraMoe, cds.FieldByName('VALOROUTRAMOEDA').Value) Then
            rSomaRatOutraMoe := rSomaRatOutraMoe - cdsDet.FieldByName('VALOROUTRAMOEDA').Value
         Else
            rSomaRatOutraMoe := rSomaRatOutraMoe + cdsDet.FieldByName('VALOROUTRAMOEDA').Value
      End
   Else
      Begin
         rSomaRatMoeCorr := rSomaRatMoeCorr + cdsDet.FieldByName('VALOR').Value;
         rSomaRatOutraMoe := rSomaRatOutraMoe + cdsDet.FieldByName('VALOROUTRAMOEDA').Value;
      End;

   If rSomaRatMoeCorr > cds.FieldByName('VALORLANCFINAN').Value Then
      Begin
         rSomaRatMoeCorr := cds.FieldByName('VALORLANCFINAN').Value;
         rPrxVlrRateioCorr := 0;
      End;

   bAlterou := False;
End;

Procedure TFrmMovimFinancMT.dbeValorDetKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   Inherited;
   bAlterou := True;
End;

Procedure TFrmMovimFinancMT.FillContaContabil;
Begin
   If (trim(FlgCtaTpRecDes) = 'S') And (dbrConcilia.Value = 'I') Then // lançamento não identificado
      Begin
         If cdsDet.Active Then
            If (cdsDet.RecordCount > 1) And (cdsDet.State In [dsEdit, dsInsert]) Then
               Begin
                  cdsDet.RevertRecord;
                  MsgDlg(' Para LANÇAMENTOS NÃO IDENTIFICADOS não pode haver mais de um rateio,' +
                         ' pois está parametrizado para utilizar preferencialmente a conta contábil do Tipo de Recebimento/Desembolso.', 'Erro', mtError, [mbOk], 0);
               End;

         If trim(cdsTipoRecDes.fieldByName('PLACONTA').asString) <> '' Then
            sContaNI := cdsTipoRecDes.fieldByName('PLACONTA').asString
         Else
            sContaNI := sPlacontaAux;

      End //if
   Else sContaNI := sPlacontaAux;
End;

Procedure TFrmMovimFinancMT.dblcTipoRDChange(Sender: TObject);
Begin
   Inherited;
   FillContaContabil;
End;

Procedure TFrmMovimFinancMT.CmeCadastroDelete(Sender: TObject);
Var
   cdsaux1: TCMClientDataSet;
Begin
   cdsAux1 := TCMClientDataSet.Create(Nil);
   Try
      sqlAux1.SQL.Clear;

      sqlAux1.SQL.Add('SELECT CODLANCFINANCE,CODLANCFINANCS  ');
      sqlAux1.SQL.Add('FROM TRANSFFUNDOS');
      sqlAux1.SQL.Add('WHERE ( CODLANCFINANCE = ' + cds.fieldbyname('CODLANCFINANC').asstring + ') ');
      sqlAux1.SQL.Add('  OR  ( CODLANCFINANCS  = ' + cds.fieldbyname('CODLANCFINANC').asstring + ') ');

      sqlAux1.ClientDataSet := cdsAux1;

      sqlAux1.Open;

      If Not cdsAux1.IsEmpty Then
         Begin
            ShowMessage(' Para Excluir Transferências Bancárias, Favor Utilizar a Tela de Exclusão ' + #13 + #10 +
               ' de Transferência para Desfazer esta Operação.');
            Repaint;
            bbtnCancelarClick(Self);
         End
      Else Inherited;

      cdsDet.Close;
      cdsDet.Data := DadosRateioVazio;
      cdsContabil.Close;
      cdsContabil.Data := DadosContabVazio;
   Finally
      cdsAux1.Free;
   End;
End;

Procedure TFrmMovimFinancMT.dblcCentroResponCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If (cdsDet.State In [dsInsert, dsEdit]) Then
      Begin
         cdsDet.FieldByName('DESCCRESPON').AsString := cdsCentroRespon.FieldByName('NOME').AsString;
         cdsDet.FieldByName('CODTIPRECDES').Clear;
         cdsDet.FieldByName('CODTIPDOC').Clear;
         CarregaComboTRD;
      End;
End;

Procedure TFrmMovimFinancMT.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   Inherited;
   CarregaCdsMestDet(Cds.FieldByName('CODLANCFINANC').AsFloat);
   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;
End;

//pendência 25060 - 27/11/2007

Function TFrmMovimFinancMT.ResultSetToString(rs: olevariant): String;
Var cd: TClientDataset;
Begin
   result := '';
   cd := TClientDataset.Create(Nil);
   Try
      cd.data := rs;
      cd.first;
      While Not cd.eof Do
         Begin
            result := result + cd.fields[0].asString;
            If cd.recNo < cd.RecordCount Then
               result := result + '; ';
            cd.next;
         End;
   Finally
      cd.free;
   End;
End;

//pendência 25060 - 27/11/2007

Procedure TFrmMovimFinancMT.MontaSelectAfterOpenCds(oCds: TClientDataSet);
Begin
   Inherited;
   ocds.disableControls;
   Try
      ocds.First;
      While Not oCds.Eof Do
         Begin
            cdsPlanPrev.Close;
            sqlPlanoPrev.Prepare;
            sqlPlanoPrev.ParamByName('CODLANCFINANC').asInteger := oCds.fieldByName('C10').asInteger;
            sqlPlanoPrev.Open;
            cdsPatro.Close;
            sqlPatro.Prepare;
            sqlPatro.ParamByName('CODLANCFINANC').asInteger := oCds.fieldByName('C10').asInteger;
            sqlPatro.Open;

            ocds.Edit;
            ocds.FieldByName('C12').asString := ResultSetToString(cdsPlanPrev.data); //plano
            ocds.FieldByName('C13').asString := ResultSetToString(cdsPatro.data); //patro
            ocds.Post;
            ocds.Next;
         End;
   Finally
      ocds.First;
      ocds.EnableControls;
   End;

End;

//pendência 25060 - 04/12/2007

Procedure TFrmMovimFinancMT.MontaSelectBeforeOpenCds(Var sqlText: String; strListParams: TStringList);
Var i: integer;
   s, sCodDocumento, sSinal: String;
   lst: TStringList;
Begin

   s := montaselect.Text;
   i := pos('LOWER(''PLANOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'') LIKE', s);

   If i > 0 Then
      Begin
         delete(s, i - 2, 112);
         insert('MOVIMFINANC.CODLANCFINANC IN ( SELECT CODLANCFINANC FROM RATEIOFINANC R, PLANPREVCONTABIL PP WHERE R.IDPLANOPREV = PP.IDPLANOPREV AND LOWER(PP.NOME)  ', s, i - 2);
      End;

   i := pos('LOWER(''PATROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'') LIKE', s);
   If i > 0 Then
      Begin
         delete(s, i - 2, 112);
         insert('MOVIMFINANC.CODLANCFINANC IN ( SELECT CODLANCFINANC FROM RATEIOFINANC R, PATRO PT, PESSOA P WHERE R.IDPATRO = PT.IDPESSOA AND P.IDPESSOA = PT.IDPESSOA AND LOWER(P.NOME)  ', s, i - 2);
      End;

   sqlText := s;

   //Ricardo Freitas SOL: 157289 - Kintana: 1277983
   //Filtrar pelo código de documento caso informado
   //Verifica se usuário informou código de documento na tela de busca
   If Pos('(0', sqlText) > 0 Then
      Begin
         Try
            lst := TStringList.Create;
            lst.Text := sqlText;

            //Descobre índice da stringlist onde está a clásula where do código do documento
            For i := 0 To lst.Count - 1 Do
               Begin
                  //(0 > 1221)
                  If Pos('(0 ', lst[i]) > 0 Then
                     Begin
                        //Descobre a operação do sinal do where
                        sSinal := Copy(lst[i], Pos('0', lst[i]) + 3, 1);
                        If Trim(Copy(lst[i], Pos('0', lst[i]) + 4, 1)) <> '' Then
                           sSinal := sSinal + Copy(lst[i], Pos('0', lst[i]) + 4, 1);
                        sSinal := Trim(sSinal);

                        //Descobre qual código de documento foi informado na tela de busca
                        sCodDocumento := Trim(Copy(lst[i], Pos(sSinal, lst[i]) + Length(sSinal), Length(lst[i])));
                        sCodDocumento := Trim(StringReplace(sCodDocumento, ')', '', [rfReplaceAll]));
                        sCodDocumento := Trim(StringReplace(sCodDocumento, 'AND', '', [rfReplaceAll]));
                        Break;
                     End;
               End;

            //Limpa a condição where do código de documento
            lst[i] := '';

            //Tem que garantir que a clásula de cod de documento seja a ultima clasula do bloco where
            //Indice do order by
            i := (lst.Count - 1);
            //Replica order by
            lst.Add(lst[i]);
            //Substitui a clasula where no orber bty antigo
            lst[i] := ' (MOVIMFINANC.CODLANCFINANC IN ( ' +
               ' SELECT DISTINCT CODLANCFINANC FROM RECBTOPAGTO ' +
               ' WHERE CODDOCUMENTO ' + sSinal + ' ' + sCodDocumento + ' )) ';

            sqlText := lst.Text;

         Finally
            FreeAndNil(lst);
         End;

      End;
   //Ricardo Freitas - Fim

   Inherited;
End;

Procedure TFrmMovimFinancMT.filtraRecDes(Const bEditInser: Boolean = false);
Begin
   //pendência 27218
   If (bEditInser) Then
      Begin
         cdsTipoRecDes.Filtered := false;
         If (dbrEntradaSaida.Value = 'E') Then
            Begin
               cdsTipoRecDes.Filter := ' RECPAG = ''R'' ';
               cdsTipoRecDes.Filtered := true;
            End
         Else
            Begin
               cdsTipoRecDes.Filter := ' RECPAG = ''P'' ';
               cdsTipoRecDes.Filtered := true;
            End;
      End;
End;

Procedure TFrmMovimFinancMT.sbtnInserirClick(Sender: TObject);
Begin
   Inherited;
   cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0, 'ATIVOS');//Marcio Sanches Spinosa SOL 204706 Kintana 1979976
   filtraRecDes(true);
   HabilitaRateioPreDefinido(True);
End;

Procedure TFrmMovimFinancMT.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;
   filtraRecDes(true);
End;

Procedure TFrmMovimFinancMT.FormShow(Sender: TObject);
Begin
   Inherited;
   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   HabilitaListarDoc;
End;

Procedure TFrmMovimFinancMT.HabilitaListarDoc;
Begin
   //Ricardo de Freitas SOL: 157289/5022 kintana: 1288999
   pnlConsultaDoc.Visible := ((pgctrlDetalhe.ActivePage = tbsConsultaDoc) And
      (CmeCadastro.Operacao <> opInserir) And
      (CmeCadastro.Operacao <> opAlterar));
   Application.ProcessMessages;

End;

Procedure TFrmMovimFinancMT.btnListaDocClick(Sender: TObject);
Begin
   Inherited;

   If (cdsConsultaDoc.IsEmpty) Then
      Exit;

   If (Application.MessageBox(PChar('A consulta poderá demorar devido a quantidade de documentos que poderão estar vinculados a baixa.' + #13 +
      'Deseja prosseguir?'), 'Atenção', 36) = 6) Then
      Begin
         Try
            Screen.Cursor := crHourGlass;

            //sqlConsultaDoc.Prepare;
            SqlConsultaDoc.SQL.Text := StringReplace(sqlConsultaDoc.SQL.Text, ' <= 50 ', ' <>  0 ', [rfReplaceAll, rfIgnoreCase]);
            sqlConsultaDoc.Open;
            TFloatField(cdsConsultaDoc.FieldByName('VALOR')).DisplayFormat := '#,##0.00';

            lblTotDOc.Caption := 'Total: ' + IntToStr(cdsConsultaDoc.RecordCount);
         Finally
            Screen.Cursor := crDefault;
         End;
      End;
End;

Procedure TFrmMovimFinancMT.spbConciliadoClick(Sender: TObject);
Var _qryAux: TwwQuery;
Begin
   // Sol  31714_38358  Kintana 523349_523362 - Paulo Nobre
   If MsgDlg('Este Documento está sendo lançado em substituição' + #13 +
      'a outro com Conciliação Bancária já realizada ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
      Begin
         _qryAux := TwwQuery.Create(Nil);
         // Sol  31714_12382  Kintana 1851098 - Paulo Nobre
         _qryAux.DataBaseName := 'Basedados';
         Try
            Try
               // Sol  31714/12862 - 1875635 - Paulo Nobre
                // Sol..........: 31714/12942 - Paulo Nobre
               If Not dtmBaseDados.dbBaseDados.Intransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               // SOL 31714/13082  KTN 1883867 - Paulo Nobre
               _qryAux.SQL.Clear;
               _qryAux.SQL.Add('UPDATE MOVIMFINANC SET CONCILIADO = ''D'' '); // Lançamento Definitivo alterado após a conciliação
               _qryAux.SQL.ADD(', DATACONCILIACAOBANCARIA = ' + quotedstr(datetostr(date)));
               _qryAux.SQL.Add('WHERE CODLANCFINANC = ' + cds.FieldByName('CODLANCFINANC').AsString);
               _qryAux.ExecSQL;

               If dtmBaseDados.dbBaseDados.Intransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

               CarregaCdsMestDet(Cds.FieldByName('CODLANCFINANC').AsFloat);
               HabilitaListarDoc;
               spbConciliado.Enabled := (cds.FieldByName('CONCILIADO').AsString <> 'D');
               txtSituacao.Visible := (cds.FieldByName('CONCILIADO').AsString = 'D');

            Except
               If dtmBaseDados.dbBaseDados.Intransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;
            End
         Finally
            FreeAndNil(_qryAux);
         End;
      End;
End;

Procedure TFrmMovimFinancMT.sbtnProcurarClick(Sender: TObject);
Begin
   cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);//Marcio Sanches Spinosa SOL 204706 Kintana 1979976
   // Sol 31714/13162  KTN 1887925 - Paulo Nobre
   spbConciliado.Enabled := False;
   txtSituacao.Visible := False;

   Inherited;

End;

procedure TFrmMovimFinancMT.bbtnCancelarClick(Sender: TObject);
begin
  cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);//Marcio Sanches Spinosa SOL 204706 Kintana 1979976
  inherited;

   HabilitaRateioPreDefinido(False); //Leandro WO13599

end;

procedure TFrmMovimFinancMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  HabilitaRateioPreDefinido(False); // Leandro WO13599

end;

procedure TFrmMovimFinancMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabilitaRateioPreDefinido(True); // Leandro WO13599

end;

procedure TFrmMovimFinancMT.HabilitaRateioPreDefinido(habilita : boolean);
Begin
  lblRateio.Visible        := habilita;
  DBcboGrupoRateio.Visible := habilita;
  btnRatear.Visible        := habilita;
End;


procedure TFrmMovimFinancMT.DBcboGrupoRateioExit(Sender: TObject);
begin
  inherited;

   if DBcboGrupoRateio.LookupValue <> '' then
   begin
      cdsPadraoRateioFluxo.Data := CtrlGrupoRateioFluxo.LookupPadraoRateioFluxo(StrToInt(DBcboGrupoRateio.LookupValue),
                                                                    Sistema.IDEmpresa);
   end;
end;

procedure TFrmMovimFinancMT.btnRatearClick(Sender: TObject);
var
   fTotalRateado  : Extended;
   fVlrRateio     : Extended;
   Accept: Boolean;
begin
   inherited;

   if (cdsPadraoRateioFluxo.Active) and not(cdsPadraoRateioFluxo.IsEmpty) and (dbeValorCorrente.Value > 0)then
   begin
      cdsPadraoRateioFluxo.First;
      CdsDet.DisableControls;

      while not(cdsPadraoRateioFluxo.EOF) do
      begin
         fTotalRateado  := Cds.FieldByName('VALORLANCFINAN').AsCurrency;

         if cdsGrupoRateio.FieldByName('TIPORATEIO').AsString = ' P' then
           fVlrRateio     := Arredonda(fTotalRateado * cdsPadraoRateioFluxo.FieldByName('PERCENTRATEIO').AsCurrency / 100, 2)
         else
         begin
           if cdsPadraoRateioFluxo.RecordCount = 1 then
             fVlrRateio     := fTotalRateado
           else
             fVlrRateio     := 0;
         end;

         // inserção do Rateio
         CdsDet.Insert;

         CdsDet.FieldByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;
         CdsDet.FieldByName('CODLANCFINANC').AsInteger   := Cds.FieldByName('CODLANCFINANC').AsInteger;
         CdsDet.FieldByName('UNIDNEGOC').AsInteger       := cdsPadraoRateioFluxo.FieldByName('UNIDNEGOC').AsInteger;
         CdsDet.FieldByName('CODTIPRECDES').AsStrIng     := cdsPadraoRateioFluxo.FieldByName('CODTIPRECDES').AsString;
         CdsDet.FieldByName('RECPAG').AsString           := ParamIntegra.RecPag;
         CdsDet.FieldByName('CODCENTRORESPON').AsString  := cdsPadraoRateioFluxo.FieldByName('CODCENTRORESPON').AsString;
         If (cds.FieldByName('MOECODIGO').AsFloat <> 0) Then
           cdsDet.FieldByName('MOECODIGO').AsFloat       := cds.FieldByName('MOECODIGO').AsFloat;
         CdsDet.FieldByName('VALOR').Value               := fVlrRateio;
         CdsDet.FieldByName('IDEMPRESA').AsInteger       := Sistema.IdEmpresa;
         //CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng   := cdsPadraoRateioFluxo.FieldByName('CODCENTRORESPON').AsString;
         CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng   := '71279';

         CdsDet.FieldByName('IDPROGRAMA').AsInteger      := cdsPadraoRateioFluxo.FieldByName('IDPROGRAMA').AsInteger;
         CdsDet.FieldByName('IDPLANOPREV').AsInteger     := cdsPadraoRateioFluxo.FieldByName('IDPLANOPREV').AsInteger;
         CdsDet.FieldByName('IDPATRO').AsInteger         := cdsPadraoRateioFluxo.FieldByName('IDPATRO').AsInteger;
         CdsDet.FieldByName('CODTIPDOC').AsInteger       := cdsPadraoRateioFluxo.FieldByName('CODTIPDOC').AsInteger;

         cdsDet.FieldByName('DESCRICAO').AsString        := cdsPadraoRateioFluxo.FieldByName('TIPODESEMBOLSO').AsString;
         cdsDet.FieldByName('NOME_PATRO').AsString       := cdsPadraoRateioFluxo.FieldByName('PATRO').AsString;
         cdsDet.FieldByName('NOME_PLANO').AsString       := cdsPadraoRateioFluxo.FieldByName('PLANPREV').AsString;
         cdsDet.FieldByName('DESCPROGRAMA').AsString     := cdsPadraoRateioFluxo.FieldByName('PROGRAMA').AsString;


         CdsDet.Post;

         cdsPadraoRateioFluxo.Next;
      end;

      CdsDet.EnableControls;

      CmeDetalheAtualizaBotoes(Nil);

   end;
end;

function TFrmMovimFinancMT.Arredonda(const fValor     : Extended;
                                     const iDecimais  : Word
                                    ): Extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;

procedure TFrmMovimFinancMT.MensErroMT(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Controle Financeiro', mtWarning, [mbOk], 0);
  Repaint;
end;

End.

