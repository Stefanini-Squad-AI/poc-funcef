// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
// Alteracao   : (dfm pnlDividaBenef)
// Pendência   : 136150
// Responsável : edilaine
// Data        : 20/07/2023
// Descrição   : Parametrizacao contabil e financeira para Dividas de Benefício
// --------------------------------------------------------------------------------
// Alteracao   : (dfm pnlDividaBenef) dblkpcmbPlanoCloseUp, GravaCamposPlano, PreencheCamposPlano
// Pendência   : 115304
// Responsável : edilaine
// Data MERGE  : 25/01/2023
// Data        : 21/10/2021
// Descrição   : Inclusão de tratamento para contabilização da Provisão de Perdas
// --------------------------------------------------------------------------------
// Pendência   : SOL 253577/17819 PPM 1104948
// Responsável : Helio Lima Custódio
// Data        : 08/12/2015
// DFM         : Inclusão da aba provisão de perdas, conta contab. trat. diver.
//               Aba atrasao em integração financeira.
// Descrição   : Inclusão de Provisão de Perdas, ajustes para o equacionamento
// --------------------------------------------------------------------------------
// Pendência   : SOL 164620/11384 KINTANA 1816211
// Responsável : William Santana
// Data        : 20/03/2014
// Descrição   : Contabilização da Folha de Benefícios
// --------------------------------------------------------------------------------
// Pendência   : SOL 123366/9801 KINTANA 1671674
// Responsável : BRUNO AZEVEDO
// Data        : 02/08/2012
// Descrição   : Criação nas parametrizações dos documentos filhos do PGA.
//--------------------------------------------------------------------------------
// Rotina......: -
// Nº SOL......: 163982/7081
// Nº KINTANA..: 1499847
// Data........: 29/11/2011
// Responsável.: Monica da Silva Gonzaga
// Descrição...: Filtrados os "selects" na combo Atividade/projeto(qryAtividade),
// para considerar apenas as ativas e analiticas.
//--------------------------------------------------------------------------------
//  Autor      : Ádler Souza
//  Rotina     : bbtnConfirmarClick
//  Data       : 21/10/2009
//  Pendencia  : 125769
//  Descrição  : Corrigir erro ao clicar em confirmar sem ter escolhido alguma
//               opção.
//------------------------------------------------------------------------------
//  Autor      : Ádler Souza
//  Rotina     : GravaCamposContribuicao
//  Data       : 15/10/2009
//  Pendencia  : 124865
//  Descrição  : Alteração de UPDATE para gravar "Centro de Custo" para Contribuições
//               de 13º(CODCENTROCUSTOD13).
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : CopiaContribuicao, CopiaBeneficio
//  Data       : 22/04/2008
//  Pendencia  : 27438
//  Descrição  : Incluir campos que não constavam na copia de parametros de beneficio e Contribuição
//------------------------------------------------------------------------------
//  Autor      : Hugo Luna
//  Rotina     : GravaCamposGerais
//  Data       : 11/04/2008
//  Pendencia  : 27503
//  Descrição  : Acertando o SQL que estava com um erro de sintaxe.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : GravaCamposGerais, GravaCamposContribuicao, GravaCamposBeneficio
//  Data       : 10/07/2007
//  Pendencia  : 25806
//  Descrição  : Trocado o Abort por Exit pois não estava retornando o erro como deveria.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : GravaCamposContribuicao
//  Data       : 30/11/2005
//  Pendencia  : 20494
//  Descrição  : Coloquei nas queries qryContribPatroPlano, qryContribPlano,
//               qryContribPessoa, o campo CODTIPRECEBDEV13, pois estava dando
//               field not found, quando este campo era testado no código.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : sbtnTpDesemb21Click, PreencheCamposContribuicao,
//               GravaCamposContribuicao e treeTpRecebExit
//  Data       : 09/09/2005
//  Pendencia  : 20169
//  Descrição  : Inclusão de um novo campo para rateio no contas a receber
//               (utilizado na devolução via folha ou banco).
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 13/07/2005
//  Descrição  : Acertos no cadastro por Pessoa
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : GravaCamposBeneficio
//  Data       : 21/06/2005
//  Pendencia  : 19481
//  Descrição  : Retirado o comentário das linhas que gravam a conta de crédito
//               para provisão de abono anual de benefícios
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 02/03/2005
//  Pendencia  : 15463
//  Descrição  : Alterar exibição de Centro de Custo e Centro de Responsabilidade
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     :
//  Data       : 10.12.2004
//  Pendencia  : 18269
//  Descrição  : colocar o nível de PLANPREVPATRO, conta de líquido da Folha
//               PLACONTALIQFLHBEN e PLANO.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : PreencheCamposContribuicao
//  Data       : 24/06/2004
//  Pendencia  : 17049
//  Descrição  : Correção para preencher o campo da conta contábil para débito -
//               Cobrança bancária
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Diversas
//  Data       : 22.03.2004
//  Pendencia  : 16303
//  Descrição  : Acrescentar centro de custo por contribuicao e beneficio
//               Segundo definido pelo Flavio, náo ha necessidade do centro de
//               custo para cada conta contabil. Logo, de todos os campos já
//               existentes, escolhemos um para ser o centro de custo a utilizar.
//               O campo escolhido foi CODCENTROCUSTOD
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : mnuCopiaPlanoClick
//  Data       : 22.03.2004
//  Pendencia  : ---- (FUNCEF)
//  Descrição  : não estava trazendo outros planos na mesma patrocinadora nem
//               o mesmo plano em outra               
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Diversas
//  Data       : 18.03.2004
//  Pendencia  : ---- (FUNCEF)
//  Descrição  : Acerto na gravação das contribuicoes x plano e inclusão dos
//               campos PLACONTACADT13 e PLACONTADADT13
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 18/02/2004
//  Descrição  : alteração na ordem da atribuição da propriedade dsContrib.DataSet, que
//               estava sendo atribuído após a abertura da query, e em eventos
//               deste query fazia referência a campos do dataset, que não havia sido atribuído.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : qryPatroPlano
//  Data       : 28/01/2004
//  Pendência  : 15836
//  Descrição  : Alterada a query para não rodar o comando TRIM - comando não
//               aceito pelo oracle da CBS.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : GravaCamposContribuicao              
//  Data       : 01/12/2003
//  Descrição  : Copy para pesquisa na qryTpPaga ficar do tamanho do campos DESCRICAO 
//------------------------------------------------------------------------------
unit FCadIntegracaoPREV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, CMTree, MontaSelect, ImgList,
  Menus;

type
  TfrmCadIntegracaoPREV = class(TfrmOkCancelar)
    qryNivelIntegracao: TwwQuery;
    qryPlano: TwwQuery;
    qryPatroPlano: TwwQuery;
    qryContribPlano: TwwQuery;
    dsContrib: TwwDataSource;
    pnlTopo: TPanel;
    Label1: TLabel;
    dblkpcmbNivelIntegracao: TwwDBLookupCombo;
    Label2: TLabel;
    lblPara: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbPatroPlano: TwwDBLookupCombo;
    edPessoa: TEdit;
    sbtnSelPessoa: TSpeedButton;
    sbtnSelBeneficio: TSpeedButton;
    qryContribPatroPlano: TwwQuery;
    pnlIntegracao: TPanel;
    pnlIntegDireita: TPanel;
    pgctrlIntegraContrib: TPageControl;
    tbsContribContabil: TTabSheet;
    lblDescSelecao: TLabel;
    pnlIntegEsquerda: TPanel;
    Label3: TLabel;
    dbgrdContrib: TwwDBGrid;
    tbsContribFinanceira: TTabSheet;
    pgctrlContribFinanc: TPageControl;
    tbsContribCobranca: TTabSheet;
    tbsDevolucao: TTabSheet;
    tbsContribGeral: TTabSheet;
    GroupBox8: TGroupBox;
    lblTpReceb: TLabel;
    sbtnTpReceb1: TSpeedButton;
    edTpReceb1: TEdit;
    pgctrlIntegraContribContabil: TPageControl;
    tbsContabilGeral: TTabSheet;
    tbsContabilProvisao: TTabSheet;
    GroupBox4: TGroupBox;
    Label43: TLabel;
    lblEntidadeContabil: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    dblkpcmbPlanPrevContab: TwwDBLookupCombo;
    GroupBox9: TGroupBox;
    lbAtividade: TLabel;
    lkcmbDescAtividade: TwwDBLookupCombo;
    lblFormaRecPag: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    lblcentrespon: TLabel;
    cmbcentrespon: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    Label12: TLabel;
    sbtnTpDesemb1: TSpeedButton;
    edTpDesemb1: TEdit;
    GroupBox11: TGroupBox;
    Label13: TLabel;
    sbtnTpDesemb2: TSpeedButton;
    edTpDesemb2: TEdit;
    tbsContabAtivo: TTabSheet;
    grpCreContab: TGroupBox;
    spdContaContabil1: TSpeedButton;
    lbConta1: TLabel;
    edContaContabil1: TMaskEdit;
    grbGrConta1: TGroupBox;
    lbDescricaoConta1: TLabel;
    tbsContaDevol: TTabSheet;
    grpContaDevol: TGroupBox;
    spdContaDevol: TSpeedButton;
    Label42: TLabel;
    edContaContabilDevol: TMaskEdit;
    GroupBox24: TGroupBox;
    lbDescricaoContaDevol: TLabel;
    grpContaDevolPatro: TGroupBox;
    spdContaDevolpatro: TSpeedButton;
    Label45: TLabel;
    edContaContabilDevolPatro: TMaskEdit;
    GroupBox26: TGroupBox;
    lbDescricaoContaDevolPatro: TLabel;
    pgctrlContabProvisao: TPageControl;
    tsProvNormal: TTabSheet;
    grpDebProvisao: TGroupBox;
    spdContaContabilProvisD: TSpeedButton;
    Label10: TLabel;
    edContaContabilProvisD: TMaskEdit;
    GroupBox18: TGroupBox;
    lbDescricaoContaProvisD: TLabel;
    grpCreProvisao: TGroupBox;
    spdContaContabilProvisC: TSpeedButton;
    Label20: TLabel;
    edContaContabilProvisC: TMaskEdit;
    GroupBox22: TGroupBox;
    lbDescricaoContaProvisC: TLabel;
    tsProvBenefProv: TTabSheet;
    grpDebProvisaoP: TGroupBox;
    spdContaContabilProvisPD: TSpeedButton;
    Label54: TLabel;
    edContaContabilProvisPD: TMaskEdit;
    GroupBox37: TGroupBox;
    lbDescricaoContaProvisPD: TLabel;
    grpCreProvisaoP: TGroupBox;
    spdContaContabilProvisPC: TSpeedButton;
    Label58: TLabel;
    edContaContabilProvisPC: TMaskEdit;
    GroupBox40: TGroupBox;
    lbDescricaoContaProvisPC: TLabel;
    dsTpPaga: TwwDataSource;
    dsContaContabil: TwwDataSource;
    dsTpReceb: TwwDataSource;
    sbtnSelContribuicao: TSpeedButton;
    qryGrava: TwwQuery;
    qryContribPessoa: TwwQuery;
    MontaSelectPessoa: TMontaSelect;
    pgctrlIntegraInfGerais: TPageControl;
    tbsIntegraInfGeraisContab: TTabSheet;
    tbsIntegraInfGeraisFinanc: TTabSheet;
    pgctrlInfGeraisFinanc: TPageControl;
    tbsInfGeraisFinancTipoDoc: TTabSheet;
    tbsInfGeraisFinancTipoCliente: TTabSheet;
    pgctrlInfGeraiContab: TPageControl;
    tbsInfGeraisContabExercAnterior: TTabSheet;
    tbsInfGeraisContabTipoOper: TTabSheet;
    GroupBox21: TGroupBox;
    Label46: TLabel;
    spdContaAnulaRec: TSpeedButton;
    edContaAnulaReceita: TMaskEdit;
    GroupBox29: TGroupBox;
    lblDescricaoContaAnulaReceita: TLabel;
    GroupBox28: TGroupBox;
    Label50: TLabel;
    spdContaAnulaDesp: TSpeedButton;
    edContaAnulaDespesa: TMaskEdit;
    GroupBox31: TGroupBox;
    lbDescricaoContaAnulaDespesa: TLabel;
    lbGrupo: TLabel;
    dblkTipoperenvio: TwwDBLookupCombo;
    Label5: TLabel;
    dblkTipopercobranca: TwwDBLookupCombo;
    Label15: TLabel;
    dblkTipoperdiverg: TwwDBLookupCombo;
    Label17: TLabel;
    dblkTipoperreserva: TwwDBLookupCombo;
    Label18: TLabel;
    dblkTipOperFlhBen: TwwDBLookupCombo;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label22: TLabel;
    dblkTipDocCAPFolhele: TwwDBLookupCombo;
    dblkTipDocCAPFolhind: TwwDBLookupCombo;
    GroupBox17: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    dblkTipDocCAPenvbanco: TwwDBLookupCombo;
    dblkTipDocCAPenvPatro: TwwDBLookupCombo;
    GroupBox33: TGroupBox;
    Label6: TLabel;
    dblkTipoDocConvFolha: TwwDBLookupCombo;
    GroupBox20: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    dblkTipDocCARRecbanco: TwwDBLookupCombo;
    dblkTipDocCARRecpatro: TwwDBLookupCombo;
    GroupBox12: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    dblkTipDocCARFolhele: TwwDBLookupCombo;
    dblkTipDocCARFolhind: TwwDBLookupCombo;
    qryTipoCli: TwwQuery;
    qryTipoFav: TwwQuery;
    GroupBox7: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dblkTipCliPatro: TwwDBLookupCombo;
    dblkTipCliAtivos: TwwDBLookupCombo;
    dblkTipCliMantidos: TwwDBLookupCombo;
    dblkTipCliAssistidos: TwwDBLookupCombo;
    dblkTipCliMantParc: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    dblkTipFavPatro: TwwDBLookupCombo;
    dblkTipFavAtivos: TwwDBLookupCombo;
    dblkTipFavMantidos: TwwDBLookupCombo;
    dblkTipFavAssistidos: TwwDBLookupCombo;
    dblkTipFavMantParc: TwwDBLookupCombo;
    dbgrdGerais: TwwDBGrid;
    dsGerais: TwwDataSource;
    qryGerais: TwwQuery;
    imList: TImageList;
    treeContaContabil: TCMTreeView;
    treeTpReceb: TCMTreeView;
    treeTpPaga: TCMTreeView;
    tbsIntegGeralFinancProvisao: TTabSheet;
    GroupBox35: TGroupBox;
    sbtnTpDesemb3: TSpeedButton;
    edTpDesemb3: TEdit;
    GroupBox42: TGroupBox;
    sbtnTpDesemb4: TSpeedButton;
    edTpDesemb4: TEdit;
    lblPlaContaD: TLabel;
    lblPlaContaDBanco: TLabel;
    Label56: TLabel;
    edContaContabil: TMaskEdit;
    GroupBox1: TGroupBox;
    lbDescricaoConta: TLabel;
    edPlaContaDBanco: TMaskEdit;
    grpPlaContaDBanco: TGroupBox;
    lblDescricaoPlaContaDBanco: TLabel;
    edContaContabilAcaoJudicial: TMaskEdit;
    GroupBox36: TGroupBox;
    lblDescricaoContaAcaoJudicial: TLabel;
    Label53: TLabel;
    edContaContabilFolhaAtrasado: TMaskEdit;
    GroupBox34: TGroupBox;
    lblDescricaoContaFolhaAtrasado: TLabel;
    spdContaContabil: TSpeedButton;
    spdFolhaAtrasada: TSpeedButton;
    sbtnPlaContaDBanco: TSpeedButton;
    spdFolhaJudicial: TSpeedButton;
    sbtnSelContribuicao13: TSpeedButton;
    sbtnSelBeneficio13: TSpeedButton;
    qryContribNucleo: TwwQuery;
    qryBuscaNucleo: TwwQuery;
    dbgrdBenef: TwwDBGrid;
    dsBenef: TwwDataSource;
    qryBenefPlano: TwwQuery;
    pgctrlIntegraBenef: TPageControl;
    tbsBenefContabil: TTabSheet;
    pgctrlBenefContabil: TPageControl;
    tbsBenefContabilGeral: TTabSheet;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    dblkSubcontaBenef: TwwDBLookupCombo;
    dblkpcmbPlanPrevContabBenef: TwwDBLookupCombo;
    tbsBenefContabilDespesa: TTabSheet;
    Label11: TLabel;
    Label21: TLabel;
    sbtnPlaContaDBenef: TSpeedButton;
    sbtnPlaContaCBenef: TSpeedButton;
    edPlaContaDBenef: TMaskEdit;
    GroupBox14: TGroupBox;
    lblPlaContaDBenef: TLabel;
    edPlaContaCBenef: TMaskEdit;
    GroupBox19: TGroupBox;
    lblPlaContaCBenef: TLabel;
    tbsBenefContabilProvisao: TTabSheet;
    pgctrlBenefContabilProvisao: TPageControl;
    tbsBenefContabilProvisaoAbono: TTabSheet;
    GroupBox23: TGroupBox;
    sbtnPLACONTADPROVIS: TSpeedButton;
    Label47: TLabel;
    edPLACONTADPROVIS: TMaskEdit;
    GroupBox25: TGroupBox;
    lblPLACONTADPROVIS: TLabel;
    GroupBox27: TGroupBox;
    sbtnPLACONTACPROVIS: TSpeedButton;
    Label49: TLabel;
    edPLACONTACPROVIS: TMaskEdit;
    GroupBox30: TGroupBox;
    lblPLACONTACPROVIS: TLabel;
    tbsBenefContabilProvisaoProvisorio: TTabSheet;
    GroupBox32: TGroupBox;
    sbtnPLACONTADPROVADT: TSpeedButton;
    Label52: TLabel;
    edPLACONTADPROVADT: TMaskEdit;
    GroupBox38: TGroupBox;
    lblPLACONTADPROVADT: TLabel;
    GroupBox39: TGroupBox;
    sbtnlblPLACONTACPROVADT: TSpeedButton;
    Label57: TLabel;
    edPLACONTACPROVADT: TMaskEdit;
    GroupBox41: TGroupBox;
    lblPLACONTACPROVADT: TLabel;
    TabSheet8: TTabSheet;
    pgctrlBenefFinanceiro: TPageControl;
    tbsBenefFinancGeral: TTabSheet;
    GroupBox47: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    lkcmbDescAtividadeBenef: TwwDBLookupCombo;
    dblkpcmbPortFormaBenef: TwwDBLookupCombo;
    cmbcentresponBenef: TwwDBLookupCombo;
    tbsBenefFinancPagamento: TTabSheet;
    GroupBox48: TGroupBox;
    Label67: TLabel;
    sbtnCODTIPRECEBCAP: TSpeedButton;
    edCODTIPRECEBCAP: TEdit;
    GroupBox49: TGroupBox;
    Label68: TLabel;
    sbtnCODTIPRECDESBenef: TSpeedButton;
    edCODTIPRECDESBenef: TEdit;
    tbsBenefFinancDevolucao: TTabSheet;
    GroupBox50: TGroupBox;
    Label69: TLabel;
    SpeedButton14: TSpeedButton;
    edCODTIPRECEBDEVOLBenef: TEdit;
    tbsBenefFinancProvisao: TTabSheet;
    GroupBox51: TGroupBox;
    sbtnCODTIPDESEMBPROV: TSpeedButton;
    edCODTIPDESEMBPROV: TEdit;
    GroupBox52: TGroupBox;
    sbtnCODTIPRECDESADT: TSpeedButton;
    edCODTIPRECDESADT: TEdit;
    Label14: TLabel;
    edPLACTAACJUD: TMaskEdit;
    GroupBox15: TGroupBox;
    lblPLACTAACJUD: TLabel;
    sbtnPLACTAACJUD: TSpeedButton;
    qryBenefPlanPatro: TwwQuery;
    qryBenefBfciario: TwwQuery;
    pmnu: TPopupMenu;
    mnuCopiaItem: TMenuItem;
    mnuCopiaPlano: TMenuItem;
    QryTpPaga: TwwQuery;
    qry: TwwQuery;
    qryTpReceb: TwwQuery;
    qrycontacontabil: TwwQuery;
    QryTpPagaCODTIPRECDES: TStringField;
    QryTpPagaDESCRICAO: TStringField;
    QryTpPagaANASINT: TStringField;
    qryTpRecebCODTIPRECDES: TStringField;
    qryTpRecebDESCRICAO: TStringField;
    qryTpRecebANASINT: TStringField;
    qrycontacontabilPLACONTA: TStringField;
    qrycontacontabilPLANOME: TStringField;
    qrycontacontabilPLATIPO: TStringField;
    qrycontacontabilPLACCUST: TStringField;
    lblTitPLACONTADADT13: TLabel;
    edPLACONTADADT13: TMaskEdit;
    sbtnPLACONTADADT13: TSpeedButton;
    grpPLACONTADADT13: TGroupBox;
    lblPLACONTADADT13: TLabel;
    lblTitPLACONTACADT13: TLabel;
    edPLACONTACADT13: TMaskEdit;
    sbtnPLACONTACADT13: TSpeedButton;
    grpPLACONTACADT13: TGroupBox;
    lblDescPLACONTACADT13: TLabel;
    Label8: TLabel;
    dblkpcmbBenefCCusto: TwwDBLookupCombo;
    Label9: TLabel;
    dblkpcmbContribCCusto: TwwDBLookupCombo;
    grpPlaContaDBenefGeral: TGroupBox;
    Label16: TLabel;
    edPlaContaDBenefGERAL: TMaskEdit;
    sbtnPlaContaDBenefGERAL: TSpeedButton;
    GroupBox13: TGroupBox;
    lblPlaContaDBenefGERAL: TLabel;
    qryPlanPrevPatro: TwwQuery;
    lblTitContaContabilDevol: TLabel;
    edPlaContaDevol: TMaskEdit;
    sbtnPlaContaDevol: TSpeedButton;
    grpPlaContaDevol: TGroupBox;
    lblPlaContaDevol: TLabel;
    GroupBox5: TGroupBox;
    Label29: TLabel;
    sbtnTpDesemb21: TSpeedButton;
    edTpReceb2: TEdit;
    tbsPGA: TTabSheet;
    GroupBox16: TGroupBox;
    GroupBox43: TGroupBox;
    GroupBox44: TGroupBox;
    SpeedButton1: TSpeedButton;
    edTpDesemb8: TEdit;
    GroupBox45: TGroupBox;
    SpeedButton2: TSpeedButton;
    edTpReceb5: TEdit;
    GroupBox46: TGroupBox;
    SpeedButton3: TSpeedButton;
    edTpDesemb9: TEdit;
    GroupBox53: TGroupBox;
    SpeedButton4: TSpeedButton;
    edTpReceb6: TEdit;
    tbsContasDespesa: TTabSheet;
    Label30: TLabel;
    edCCAbono: TMaskEdit;
    grp2: TGroupBox;
    lblContaContabAbono: TLabel;
    sbtnCCAbono: TSpeedButton;
    Label44: TLabel;
    edCCCorrMon: TMaskEdit;
    grp1: TGroupBox;
    lblContaContabCorrMon: TLabel;
    sbtnCCCorrMon: TSpeedButton;
    tbsContaProvPerdas: TTabSheet;
    grpContaProvPerdaD: TGroupBox;
    spdContaProvPerdaD: TSpeedButton;
    Label41: TLabel;
    edContaProvPerdaD: TMaskEdit;
    GroupBox55: TGroupBox;
    lbDescricaoContaProvPerdaD: TLabel;
    grpContaProvPerdaC: TGroupBox;
    spdContaProvPerdaC: TSpeedButton;
    Label51: TLabel;
    edContaProvPerdaC: TMaskEdit;
    GroupBox57: TGroupBox;
    lbDescricaoContaProvPerdaC: TLabel;
    grpContaProvPerda: TGroupBox;
    spdContaProvPerda: TSpeedButton;
    Label59: TLabel;
    edContaProvPerda: TMaskEdit;
    GroupBox59: TGroupBox;
    lbDescricaoContaProvPerda: TLabel;
    tbsEmAtraso: TTabSheet;
    GroupBox54: TGroupBox;
    lblTpRecebEmAtraso: TLabel;
    sbtnTpRecebEmAtraso: TSpeedButton;
    edTpRecebEmAtraso: TEdit;
    GroupBox56: TGroupBox;
    lblTpDesembEmAtraso: TLabel;
    sbtnTpDesembEmAtraso: TSpeedButton;
    edTpDesembEmAtraso: TEdit;
    sbtnSelDivBenef: TSpeedButton;
    pnlDividaBenef: TPanel;
    pcDividaBenef: TPageControl;
    tsDivBenefContab: TTabSheet;
    tsDivBenefFinanc: TTabSheet;
    GroupBox58: TGroupBox;
    sbtnPLACONTADFORMASDODIV: TSpeedButton;
    Label48: TLabel;
    Label62: TLabel;
    sbtnPLACONTACFORMASDODIV: TSpeedButton;
    Label72: TLabel;
    sbtnPLACONTADREVFORMASDODIV: TSpeedButton;
    Label90: TLabel;
    sbtnPLACONTACREVFORMASDODIV: TSpeedButton;
    edPLACONTADFORMASDODIV: TMaskEdit;
    GroupBox60: TGroupBox;
    lblPLACONTADFORMASDODIV: TLabel;
    edPLACONTACFORMASDODIV: TMaskEdit;
    GroupBox62: TGroupBox;
    lblPLACONTACFORMASDODIV: TLabel;
    edPLACONTADREVFORMASDODIV: TMaskEdit;
    GroupBox65: TGroupBox;
    lblPLACONTADREVFORMASDODIV: TLabel;
    edPLACONTACREVFORMASDODIV: TMaskEdit;
    GroupBox76: TGroupBox;
    lblPLACONTACREVFORMASDODIV: TLabel;
    GroupBox61: TGroupBox;
    sbtnPLACONTADBAIXADIV: TSpeedButton;
    Label60: TLabel;
    Label61: TLabel;
    sbtnPLACONTACBAIXADIV: TSpeedButton;
    Label70: TLabel;
    sbtnPLACONTADREVBAIXADIV: TSpeedButton;
    Label88: TLabel;
    sbtnPLACONTACREVBAIXADIV: TSpeedButton;
    edPLACONTADBAIXADIV: TMaskEdit;
    GroupBox63: TGroupBox;
    lblPLACONTADBAIXADIV: TLabel;
    edPLACONTACBAIXADIV: TMaskEdit;
    GroupBox64: TGroupBox;
    lblPLACONTACBAIXADIV: TLabel;
    edPLACONTADREVBAIXADIV: TMaskEdit;
    GroupBox66: TGroupBox;
    lblPLACONTADREVBAIXADIV: TLabel;
    edPLACONTACREVBAIXADIV: TMaskEdit;
    GroupBox75: TGroupBox;
    lblPLACONTACREVBAIXADIV: TLabel;
    GroupBox67: TGroupBox;
    sbtnPLACONTADPROVDIV: TSpeedButton;
    Label76: TLabel;
    Label77: TLabel;
    sbtnPLACONTACPROVDIV: TSpeedButton;
    Label78: TLabel;
    sbtnPLACONTADREVPROVDIV: TSpeedButton;
    Label84: TLabel;
    sbtnPLACONTACREVPROVDIV: TSpeedButton;
    edPLACONTADPROVDIV: TMaskEdit;
    GroupBox68: TGroupBox;
    lblPLACONTADPROVDIV: TLabel;
    edPLACONTACPROVDIV: TMaskEdit;
    GroupBox69: TGroupBox;
    lblPLACONTACPROVDIV: TLabel;
    edPLACONTADREVPROVDIV: TMaskEdit;
    GroupBox70: TGroupBox;
    lblPLACONTADREVPROVDIV: TLabel;
    edPLACONTACREVPROVDIV: TMaskEdit;
    GroupBox74: TGroupBox;
    lblPLACONTACREVPROVDIV: TLabel;
    GroupBox71: TGroupBox;
    sbtnPLACONTADATUREAJDIV: TSpeedButton;
    Label82: TLabel;
    Label83: TLabel;
    sbtnPLACONTACATUREAJDIV: TSpeedButton;
    edPLACONTADATUREAJDIV: TMaskEdit;
    GroupBox72: TGroupBox;
    lblPLACONTADATUREAJDIV: TLabel;
    edPLACONTACATUREAJDIV: TMaskEdit;
    GroupBox73: TGroupBox;
    lblPLACONTACATUREAJDIV: TLabel;
    GroupBox77: TGroupBox;
    btnPLACONTACBOLETO: TSpeedButton;
    Label55: TLabel;
    edPLACONTACBOLETO: TMaskEdit;
    GroupBox78: TGroupBox;
    lblPLACONTACBOLETO: TLabel;
    GroupBox80: TGroupBox;
    Label79: TLabel;
    sbtnTipoReembDivida: TSpeedButton;
    dblkpTipoReembDivida: TEdit;
    gbRubAcerto: TGroupBox;
    btnRubBaixaBol: TSpeedButton;
    dblkpRubBaixaBol: TwwDBLookupCombo;
    Label74: TLabel;
    dblkpCentresponDivida: TwwDBLookupCombo;
    Label75: TLabel;
    dblkpCentcustoDivida: TwwDBLookupCombo;
    Label71: TLabel;
    lblAltBaixaDoc: TLabel;
    dblkpAltBaixaBol: TwwDBLookupCombo;
    qryProventos: TwwQuery;
    qryAltBaixa: TwwQuery;
    MsProvento: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbNivelIntegracaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnSelContribuicaoClick(Sender: TObject);
    procedure spdContaContabil1Click(Sender: TObject);
    procedure spdContaContabilClick(Sender: TObject);
    procedure spdFolhaAtrasadaClick(Sender: TObject);
    procedure sbtnPlaContaDBancoClick(Sender: TObject);
    procedure spdFolhaJudicialClick(Sender: TObject);
    procedure spdContaContabilProvisDClick(Sender: TObject);
    procedure spdContaContabilProvisCClick(Sender: TObject);
    procedure spdContaContabilProvisPDClick(Sender: TObject);
    procedure spdContaContabilProvisPCClick(Sender: TObject);
    procedure spdContaDevolClick(Sender: TObject);
    procedure spdContaDevolpatroClick(Sender: TObject);
    procedure treeContaContabilDblClick(Sender: TObject);
    procedure treeContaContabilExit(Sender: TObject);
    procedure qryContribPlanoAfterScroll(DataSet: TDataSet);
    procedure qryContribPatroPlanoAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnSelPessoaClick(Sender: TObject);
    procedure qryContribPessoaAfterScroll(DataSet: TDataSet);
    procedure qryGeraisAfterScroll(DataSet: TDataSet);
    procedure spdContaAnulaRecClick(Sender: TObject);
    procedure spdContaAnulaDespClick(Sender: TObject);
    procedure sbtnTpReceb1Click(Sender: TObject);
    procedure sbtnTpDesemb1Click(Sender: TObject);
    procedure sbtnTpDesemb2Click(Sender: TObject);
    procedure sbtnTpDesemb3Click(Sender: TObject);
    procedure sbtnTpDesemb4Click(Sender: TObject);
    procedure treeTpPagaDblClick(Sender: TObject);
    procedure treeTpPagaExit(Sender: TObject);
    procedure treeTpRecebDblClick(Sender: TObject);
    procedure treeTpRecebExit(Sender: TObject);
    procedure edContaAnulaReceitaExit(Sender: TObject);
    procedure edContaAnulaDespesaExit(Sender: TObject);
    procedure edContaContabil1Exit(Sender: TObject);
    procedure edContaContabilExit(Sender: TObject);
    procedure edContaContabilFolhaAtrasadoExit(Sender: TObject);
    procedure edPlaContaDBancoExit(Sender: TObject);
    procedure edContaContabilAcaoJudicialExit(Sender: TObject);
    procedure edContaContabilProvisDExit(Sender: TObject);
    procedure edContaContabilProvisCExit(Sender: TObject);
    procedure edContaContabilProvisPDExit(Sender: TObject);
    procedure edContaContabilProvisPCExit(Sender: TObject);
    procedure edContaContabilDevolExit(Sender: TObject);
    procedure edContaContabilDevolPatroExit(Sender: TObject);
    procedure edTpDesemb1Exit(Sender: TObject);
    procedure sbtnSelContribuicao13Click(Sender: TObject);
    procedure qryContribPlanoBeforeScroll(DataSet: TDataSet);
    procedure qryContribNucleoAfterScroll(DataSet: TDataSet);
    procedure sbtnSelBeneficioClick(Sender: TObject);
    procedure qryBenefPlanoAfterScroll(DataSet: TDataSet);
    procedure qryBenefPlanoBeforeScroll(DataSet: TDataSet);
    procedure qryContribPatroPlanoBeforeScroll(DataSet: TDataSet);
    procedure qryContribNucleoBeforeScroll(DataSet: TDataSet);
    procedure qryContribPessoaBeforeScroll(DataSet: TDataSet);
    procedure sbtnPlaContaDBenefClick(Sender: TObject);
    procedure sbtnPlaContaCBenefClick(Sender: TObject);
    procedure sbtnPLACTAACJUDClick(Sender: TObject);
    procedure sbtnPLACONTADPROVISClick(Sender: TObject);
    procedure sbtnPLACONTACPROVISClick(Sender: TObject);
    procedure sbtnPLACONTADPROVADTClick(Sender: TObject);
    procedure sbtnlblPLACONTACPROVADTClick(Sender: TObject);
    procedure sbtnCODTIPRECDESBenefClick(Sender: TObject);
    procedure edCODTIPRECDESBenefExit(Sender: TObject);
    procedure sbtnCODTIPRECEBCAPClick(Sender: TObject);
    procedure edCODTIPRECEBCAPExit(Sender: TObject);
    procedure sbtnCODTIPDESEMBPROVClick(Sender: TObject);
    procedure edCODTIPDESEMBPROVExit(Sender: TObject);
    procedure sbtnCODTIPRECDESADTClick(Sender: TObject);
    procedure edCODTIPRECDESADTExit(Sender: TObject);
    procedure edPlaContaDBenefExit(Sender: TObject);
    procedure edPlaContaCBenefExit(Sender: TObject);
    procedure edPLACTAACJUDExit(Sender: TObject);
    procedure edPLACONTADPROVISExit(Sender: TObject);
    procedure edPLACONTACPROVISExit(Sender: TObject);
    procedure edPLACONTADPROVADTExit(Sender: TObject);
    procedure edPLACONTACPROVADTExit(Sender: TObject);
    procedure mnuCopiaItemClick(Sender: TObject);
    procedure sbtnSelBeneficio13Click(Sender: TObject);
    procedure mnuCopiaPlanoClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpcmbPatroPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnPLACONTADADT13Click(Sender: TObject);
    procedure edPLACONTADADT13Exit(Sender: TObject);
    procedure edPLACONTACADT13Exit(Sender: TObject);
    procedure sbtnPLACONTACADT13Click(Sender: TObject);
    procedure edPlaContaDBenefGERALExit(Sender: TObject);
    procedure sbtnPlaContaDBenefGERALClick(Sender: TObject);
    procedure qryPlanPrevPatroAfterScroll(DataSet: TDataSet);
    procedure sbtnPlaContaDevolClick(Sender: TObject);
    procedure edPlaContaDevolExit(Sender: TObject);
    procedure sbtnTpDesemb21Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbtnCCAbonoClick(Sender: TObject);
    procedure sbtnCCCorrMonClick(Sender: TObject);
    procedure edCCAbonoExit(Sender: TObject);
    procedure edCCCorrMonExit(Sender: TObject);
    procedure spdContaProvPerdaClick(Sender: TObject);
    procedure spdContaProvPerdaDClick(Sender: TObject);
    procedure spdContaProvPerdaCClick(Sender: TObject);
    procedure edContaProvPerdaExit(Sender: TObject);
    procedure edContaProvPerdaDExit(Sender: TObject);
    procedure edContaProvPerdaCExit(Sender: TObject);
    procedure sbtnTpRecebEmAtrasoClick(Sender: TObject);
    procedure sbtnTpDesembEmAtrasoClick(Sender: TObject);
    procedure sbtnPLACONTADFORMASDODIVClick(Sender: TObject);
    procedure sbtnPLACONTACFORMASDODIVClick(Sender: TObject);
    procedure sbtnPLACONTADREVFORMASDODIVClick(Sender: TObject);
    procedure sbtnPLACONTACREVFORMASDODIVClick(Sender: TObject);
    procedure sbtnPLACONTADBAIXADIVClick(Sender: TObject);
    procedure sbtnPLACONTACBAIXADIVClick(Sender: TObject);
    procedure sbtnPLACONTADREVBAIXADIVClick(Sender: TObject);
    procedure sbtnPLACONTACREVBAIXADIVClick(Sender: TObject);
    procedure sbtnPLACONTADPROVDIVClick(Sender: TObject);
    procedure sbtnPLACONTACPROVDIVClick(Sender: TObject);
    procedure sbtnPLACONTADREVPROVDIVClick(Sender: TObject);
    procedure sbtnPLACONTACREVPROVDIVClick(Sender: TObject);
    procedure sbtnPLACONTADATUREAJDIVClick(Sender: TObject);
    procedure sbtnPLACONTACATUREAJDIVClick(Sender: TObject);
    procedure sbtnSelDivBenefClick(Sender: TObject);
    procedure edPLACONTADFORMASDODIVExit(Sender: TObject);
    procedure edPLACONTACFORMASDODIVExit(Sender: TObject);
    procedure edPLACONTADREVFORMASDODIVExit(Sender: TObject);
    procedure edPLACONTACREVFORMASDODIVExit(Sender: TObject);
    procedure edPLACONTADBAIXADIVExit(Sender: TObject);
    procedure edPLACONTACBAIXADIVExit(Sender: TObject);
    procedure edPLACONTADREVBAIXADIVExit(Sender: TObject);
    procedure edPLACONTACREVBAIXADIVExit(Sender: TObject);
    procedure edPLACONTADPROVDIVExit(Sender: TObject);
    procedure edPLACONTACPROVDIVExit(Sender: TObject);
    procedure edPLACONTADREVPROVDIVExit(Sender: TObject);
    procedure edPLACONTACREVPROVDIVExit(Sender: TObject);
    procedure edPLACONTADATUREAJDIVExit(Sender: TObject);
    procedure edPLACONTACATUREAJDIVExit(Sender: TObject);
    procedure btnRubBaixaBolClick(Sender: TObject);
    procedure edPLACONTACBOLETOExit(Sender: TObject);
    procedure sbtnTipoReembDividaClick(Sender: TObject);
    procedure btnPLACONTACBOLETOClick(Sender: TObject);
  private
    { Private declarations }
    bAvisoGravacaoContrib : boolean;
    bClicouNoOKContrib    : boolean;
    bAvisoGravacaoBenef   : boolean;
    bClicouNoOKBenef      : boolean;
    procedure DesabilitaControles;
    procedure PreparaIntegracao;
    procedure PreencheCamposGerais;
    procedure PreencheCamposContribuicao;
    procedure PreencheCamposBeneficio;
    procedure PreencheCamposPlanPrevPatro;
    procedure AbreArvoreContabil       ( iControle, iTop, iLeft : integer;sValor : string);
    procedure AbreArvoreTipoRecebimento( iControle, iTop, iLeft : integer);
    procedure AbreArvoreTipoDesembolso ( iControle, iTop, iLeft : integer);
    procedure edContaContabilPadraoExit( sConta    : string;
                                         edConta   : TMaskEdit;
                                         lblConta  : TLabel );
    function  GravaCamposGerais                    : boolean;
    function  GravaCamposContribuicao              : boolean;
    function  GravaCamposBeneficio                 : boolean;

    function  GravaCamposPlano                     : boolean;     //edilaine SIG115304
    procedure PreencheCamposPlano;                                //edilaine SIG115304

    function SelecionaRubrica(MontaSelect : TMontaSelect): string;   //edilaine SIG136150

    function  CopiaContribuicao( piNivel                 : integer;
                                 piIdPessJurOrigem       : longint;
                                 piIdPlanoPrevOrigem     : longint;
                                 piIdContribuicaoOrigem  : longint;
                                 piIdPessJurDestino      : longint;
                                 piIdPlanoPrevDestino    : longint;
                                 piIdContribuicaoDestino : longint ) : boolean;
    function CopiaBeneficio   (  piNivel                 : integer;
                                 piIdPessJurOrigem       : longint;
                                 piIdPlanoPrevOrigem     : longint;
                                 piIdBENEFICIOOrigem     : longint;
                                 piIdPessJurDestino      : longint;
                                 piIdPlanoPrevDestino    : longint;
                                 piIdBENEFICIODestino    : longint ) : boolean;

  public
    { Public declarations }
  end;

var
  frmCadIntegracaoPREV: TfrmCadIntegracaoPREV;


implementation

uses DBaseDados, DIntegraCAPCAR, UIntegraBack, USistema, UMensErro,
     UAdmPrev, fAguarde, FCadIntegracaoPREVAux, UModulo, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadIntegracaoPREV.AbreArvoreContabil(iControle, iTop, iLeft : integer; sValor : string);
begin
  if (Trim(sValor) = '') or (not qryContaContabil.Locate('PlaConta', sValor, [loCaseInsensitive,loPartialKey]))
  then qryContaContabil.First;


  treeContaContabil.Tag     := iControle;
  treeContaContabil.Top     := iTop;
  treeContaContabil.Left    := iLeft;
  treeContaContabil.Visible := not treeContaContabil.Visible;
  if treeContaContabil.Visible then
     treeContaContabil.SetFocus;

end;

procedure TfrmCadIntegracaoPREV.AbreArvoreTipoRecebimento(iControle, iTop, iLeft : integer);
begin
  treeTpReceb.Tag     := iControle;
  treeTpReceb.Left    := iLeft;
  treeTpReceb.Top     := iTop;
  treeTpReceb.Visible := not treeTpReceb.Visible;
  if treeTpReceb.Visible then
     treeTpReceb.SetFocus;
end;

procedure TfrmCadIntegracaoPREV.AbreArvoreTipoDesembolso(iControle, iTop, iLeft : integer);
begin
  treeTpPaga.Tag     := iControle;
  treeTpPaga.Left    := iLeft;
  treeTpPaga.Top     := iTop;
  treeTpPaga.Visible := not treeTpPaga.Visible;
  if treeTpPaga.Visible then
     treeTpPaga.SetFocus;
end;

procedure TfrmCadIntegracaoPREV.DesabilitaControles;
begin
  lblPara.Visible                := False;
  dblkpcmbPlano.Visible          := False;
  dblkpcmbPatroPlano.Visible     := False;
  edPessoa.Visible               := False;
  sbtnSelPessoa.Visible          := False;
  sbtnSelContribuicao.Visible    := False;
  sbtnSelBeneficio.Visible       := False;
  sbtnSelContribuicao13.Visible  := False;
  sbtnSelBeneficio13.Visible     := False;
  sbtnSelDivBenef.Visible        := False;    //edilaine SIG115304
  sbtnSelContribuicao.Down       := False;
  sbtnSelBeneficio.Down          := False;
  sbtnSelContribuicao13.Down     := False;
  sbtnSelBeneficio13.Down        := False;
  sbtnSelDivBenef.Down           := False;    //edilaine SIG115304

  dblkpcmbPlano.Text             := '';
  dblkpcmbPatroPlano.Text        := '';
  edPessoa.Text                  := '';
  pnlIntegracao.Visible          := False;
  pgctrlIntegraContrib.Visible   := False;
  pgctrlIntegraInfGerais.Visible := False;
  pgctrlIntegraBenef.Visible     := False;
  dbgrdContrib.Visible           := False;
  dbgrdBenef.Visible             := False;

end; 

procedure TfrmCadIntegracaoPREV.PreparaIntegracao;
begin
   with dtmIntegraCAPCAR do
   begin
      qryTipoDocCAR.Close;    qryTipoDocCAR.Open;
      qryTipoDocCAP.Close;    qryTipoDocCAP.Open;
      qryFormaPag.Close;      qryFormaPag.Open;
      qryTipoCli.Close;       qryTipoCli.Open;
      qryTipoFav.Close;       qryTipoFav.Open;
      try
         qryContaContabil.Close;
         qryContaContabil.SQL.Clear;
         qryContaContabil.SQL.Add(' SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST '+
                                  ' FROM   PLANOCONTA                           '+
                                  ' WHERE  PLANO = '+IntToStr(IntegraBack.Plano));
         qryContaContabil.Open;
         treeContaContabil.Mascara       := IntegraBack.MascaraPlano;
         treeContaContabil.MontaArvore;

         edContaContabil1.EditMask             := IntegraBack.MascaraPlano + ';0; ';
         edContaContabil.EditMask              := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilFolhaAtrasado.EditMask := IntegraBack.MascaraPlano + ';0; ';
         edPlaContaDBanco.EditMask             := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilAcaoJudicial.EditMask  := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilProvisD.EditMask       := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilProvisC.EditMask       := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilProvisPD.EditMask      := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilProvisPC.EditMask      := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilDevol.EditMask         := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilDevolPatro.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edContaAnulaReceita.EditMask          := IntegraBack.MascaraPlano + ';0; ';
         edContaAnulaDespesa.EditMask          := IntegraBack.MascaraPlano + ';0; ';

         edPlaContaDBenef.EditMask             := IntegraBack.MascaraPlano + ';0; ';
         edPlaContaDBenefGERAL.EditMask        := IntegraBack.MascaraPlano + ';0; '; 
         edPlaContaCBenef.EditMask             := IntegraBack.MascaraPlano + ';0; ';
         edPLACTAACJUD.EditMask                := IntegraBack.MascaraPlano + ';0; ';

         edPlaContaDevol.EditMask              := IntegraBack.MascaraPlano + ';0; ';

         edPLACONTADADT13.EditMask             := IntegraBack.MascaraPlano + ';0; '; 
         edPLACONTACADT13.EditMask             := IntegraBack.MascaraPlano + ';0; '; 
         edPLACONTADPROVIS.EditMask            := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACPROVIS.EditMask            := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADPROVADT.EditMask           := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACPROVADT.EditMask           := IntegraBack.MascaraPlano + ';0; ';

         //Início - William Santana - SOL 164620.11384 KIN 1816211
         edCCAbono.EditMask          := IntegraBack.MascaraPlano + ';0; ';
         edCCCorrMon.EditMask          := IntegraBack.MascaraPlano + ';0; ';
         //Término - William Santana - SOL 164620.11384 KIN 1816211

         //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
         edContaProvPerda.EditMask   := IntegraBack.MascaraPlano + ';0; ';
         edContaProvPerdaD.EditMask  := IntegraBack.MascaraPlano + ';0; ';
         edContaProvPerdaC.EditMask  := IntegraBack.MascaraPlano + ';0; ';
         //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948

         //edilaine SIG115304 : inicio
         edPLACONTADFORMASDODIV.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACFORMASDODIV.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADREVFORMASDODIV.EditMask := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACREVFORMASDODIV.EditMask := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADBAIXADIV.EditMask       := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACBAIXADIV.EditMask       := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADREVBAIXADIV.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACREVBAIXADIV.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADPROVDIV.EditMask        := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACPROVDIV.EditMask        := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADREVPROVDIV.EditMask     := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACREVPROVDIV.EditMask     := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTADATUREAJDIV.EditMask     := IntegraBack.MascaraPlano + ';0; ';
         edPLACONTACATUREAJDIV.EditMask     := IntegraBack.MascaraPlano + ';0; ';
         //edilaine SIG115304 : fim
      except
         raise;
      end;

      //Verifica se a empresa utiliza o sistema ABC ( Custo Baseado na Atividade )
      if not (IntegraBack.ObrigaABC = 'S')    
      then begin                              
         lkcmbDescAtividade.Enabled := False;
         lkcmbDescAtividadeBenef.Enabled := False
      end
      else begin
         lkcmbDescAtividade.Enabled := True;
         lkcmbDescAtividadeBenef.Enabled := True;
         qryAtividade.Close;
         qryAtividade.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
         qryAtividade.Open;
      end;

      try
         qrytpreceb.close;
         qryTpReceb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
         qryTpReceb.Open;

         if not qryTpReceb.IsEmpty
         then begin
            treeTpReceb.Mascara := IntegraBack.MascaraDesemb;
            treeTpReceb.MontaArvore;
         end;
      except
         raise;
      end;

      try
         qrytpPaga.close;
         qryTpPaga.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
         qryTpPaga.Open;
         if not qryTpPaga.IsEmpty
         then begin
           treeTpPaga.Mascara := IntegraBack.MascaraDesemb;
           treeTpPaga.MontaArvore;
         end;
      except
         raise;
      end;

      qryCentRespon.Close;
      qryCentRespon.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);

      qryCentRespon.Open;

      qryCCusto.Close;
      qryCCusto.ParamByName('IDPLANCENTCUST').AsInteger := ParamIntegra.PlanoCentroCusto;
      qryCCusto.Open;


      qrySubConta.Close;
      qrySubConta.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
      qrySubConta.Open;

      qryPlanPrevContab.Close;
      qryPlanPrevContab.Open;

      qryTipoOper.Close;
      qryTipoOper.Open;

   end; 
end;

procedure TfrmCadIntegracaoPREV.PreencheCamposGerais;
begin
   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryGerais.FieldByName('TIPOPERENVIO').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperenvio.LookupValue := qryGerais.FieldByName('TIPOPERENVIO').AsString;
      dblkTipoperenvio.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperenvio.LookupValue := '';
      dblkTipoperenvio.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryGerais.FieldByName('TIPOPERCOBRANCA').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipopercobranca.LookupValue := qryGerais.FieldByName('TIPOPERCOBRANCA').AsString;
      dblkTipopercobranca.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipopercobranca.LookupValue := '';
      dblkTipopercobranca.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryGerais.FieldByName('TIPOPERDIVERG').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperdiverg.LookupValue := qryGerais.FieldByName('TIPOPERDIVERG').AsString;
      dblkTipoperdiverg.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperdiverg.LookupValue := '';
      dblkTipoperdiverg.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryGerais.FieldByName('TIPOPERRESERVA').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperreserva.LookupValue := qryGerais.FieldByName('TIPOPERRESERVA').AsString;
      dblkTipoperreserva.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperreserva.LookupValue := '';
      dblkTipoperreserva.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryGerais.FieldByName('TIPOPERFLHBEN').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperFlhBen.LookupValue := qryGerais.FieldByName('TIPOPERFLHBEN').AsString;
      dblkTipoperFlhBen.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperFlhBen.LookupValue := '';
      dblkTipoperFlhBen.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCPFLHBENELET').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPFolhele.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCPFLHBENELET').AsInteger);
      dblkTipDocCAPFolhele.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPFolhele.LookupValue := '';
      dblkTipDocCAPFolhele.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCPFLHBENINDIV').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPFolhind.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCPFLHBENINDIV').AsInteger);
      dblkTipDocCAPFolhind.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPFolhind.LookupValue := '';
      dblkTipDocCAPFolhind.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCPENVIOBANCO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPenvbanco.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCPENVIOBANCO').AsInteger);
      dblkTipDocCAPenvbanco.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPenvbanco.LookupValue := '';
      dblkTipDocCAPenvbanco.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCPENVIOPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPenvPatro.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCPENVIOPATRO').AsInteger);
      dblkTipDocCAPenvPatro.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPenvPatro.LookupValue := '';
      dblkTipDocCAPenvPatro.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCRFLHBENELET').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARFolhele.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCRFLHBENELET').AsInteger);
      dblkTipDocCARFolhele.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARFolhele.LookupValue := '';
      dblkTipDocCARFolhele.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCRFLHBENINDIV').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARFolhind.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCRFLHBENINDIV').AsInteger);
      dblkTipDocCARFolhind.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARFolhind.LookupValue := '';
      dblkTipDocCARFolhind.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCRRECBANCO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARRecbanco.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCRRECBANCO').AsInteger);
      dblkTipDocCARRecbanco.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARRecbanco.LookupValue := '';
      dblkTipDocCARRecbanco.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCRRECPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARRecpatro.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCRRECPATRO').AsInteger);
      dblkTipDocCARRecpatro.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARRecpatro.LookupValue := '';
      dblkTipDocCARRecpatro.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryGerais.FieldbyName('TPDOCPCONVENIO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipoDocConvFolha.LookupValue := InttoStr(qryGerais.FieldByName('TPDOCPCONVENIO').AsInteger);
      dblkTipoDocConvFolha.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipoDocConvFolha.LookupValue := '';
      dblkTipoDocConvFolha.Text        := '';
   end;

   if (qryTipoCli.Locate('idTipoCliente',qryGerais.FieldbyName('TIPOCLIPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipCliPatro.LookupValue := InttoStr(qryGerais.FieldByName('TIPOCLIPATRO').AsInteger);
      dblkTipCliPatro.text        := qryTipoCli.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipCliPatro.LookupValue := '';
      dblkTipCliPatro.Text        := '';
   end;

   if (qryTipoCli.Locate('idTipoCliente',qryGerais.FieldbyName('TIPOCLIATIVOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipCliAtivos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOCLIATIVOS').AsInteger);
      dblkTipCliAtivos.text        := qryTipoCli.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipCliAtivos.LookupValue := '';
      dblkTipCliAtivos.Text        := '';
   end;

   if (qryTipoCli.Locate('idTipoCliente',qryGerais.FieldbyName('TIPOCLIMANTIDOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipCliMantidos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOCLIMANTIDOS').AsInteger);
      dblkTipCliMantidos.text        := qryTipoCli.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipCliMantidos.LookupValue := '';
      dblkTipCliMantidos.Text        := '';
   end;

   if (qryTipoCli.Locate('idTipoCliente',qryGerais.FieldbyName('TIPOCLIASSISTIDOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipCliAssistidos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOCLIASSISTIDOS').AsInteger);
      dblkTipCliAssistidos.text        := qryTipoCli.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipCliAssistidos.LookupValue := '';
      dblkTipCliAssistidos.Text        := '';
   end;

   if (qryTipoCli.Locate('idTipoCliente',qryGerais.FieldbyName('TIPOCLIMANTPARC').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipCliMantParc.LookupValue := InttoStr(qryGerais.FieldByName('TIPOCLIMANTPARC').AsInteger);
      dblkTipCliMantParc.text        := qryTipoCli.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipCliMantParc.LookupValue := '';
      dblkTipCliMantParc.Text        := '';
   end;

   if (qryTipoFav.Locate('idRamoFornecedor',qryGerais.FieldbyName('TIPOFAVPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipFavPatro.LookupValue := InttoStr(qryGerais.FieldByName('TIPOFAVPATRO').AsInteger);
      dblkTipFavPatro.text        := qryTipoFav.Fieldbyname('DescRamoFornecedor').AsString;
   end
   else Begin
      dblkTipFavPatro.LookupValue := '';
      dblkTipFavPatro.Text        := '';
   end;

   if (qryTipoFav.Locate('idRamoFornecedor',qryGerais.FieldbyName('TIPOFAVATIVOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipFavAtivos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOFAVATIVOS').AsInteger);
      dblkTipFavAtivos.text        := qryTipoFav.Fieldbyname('DescRamoFornecedor').AsString;
   end
   else Begin
      dblkTipFavAtivos.LookupValue := '';
      dblkTipFavAtivos.Text        := '';
   end;

   if (qryTipoFav.Locate('idRamoFornecedor',qryGerais.FieldbyName('TIPOFAVMANTIDOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipFavMantidos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOFAVMANTIDOS').AsInteger);
      dblkTipFavMantidos.text        := qryTipoFav.Fieldbyname('DescRamoFornecedor').AsString;
   end
   else Begin
      dblkTipFavMantidos.LookupValue := '';
      dblkTipFavMantidos.Text        := '';
   end;

   if (qryTipoFav.Locate('idRamoFornecedor',qryGerais.FieldbyName('TIPOFAVASSISTIDOS').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipFavAssistidos.LookupValue := InttoStr(qryGerais.FieldByName('TIPOFAVASSISTIDOS').AsInteger);
      dblkTipFavAssistidos.text        := qryTipoFav.Fieldbyname('DescRamoFornecedor').AsString;
   end
   else Begin
      dblkTipFavAssistidos.LookupValue := '';
      dblkTipFavAssistidos.Text        := '';
   end;

   if (qryTipoFav.Locate('idRamoFornecedor',qryGerais.FieldbyName('TIPOFAVMANTPARC').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipFavMantParc.LookupValue := InttoStr(qryGerais.FieldByName('TIPOFAVMANTPARC').AsInteger);
      dblkTipFavMantParc.text        := qryTipoFav.Fieldbyname('DescRamoFornecedor').AsString;
   end
   else Begin
      dblkTipFavMantParc.LookupValue := '';
      dblkTipFavMantParc.Text        := '';
   end;

   if (qryGerais.FieldbyName('PLARECUPRECEXANT').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryGerais.FieldbyName('PLARECUPRECEXANT').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edContaAnulaReceita.Text := qryGerais.FieldbyName('PLARECUPRECEXANT').AsString;
      lblDescricaoContaAnulaReceita.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaAnulaReceita.Text              := '';
      lblDescricaoContaAnulaReceita.Caption := '';
   end;

   if (qryGerais.FieldbyName('PLARECUPDESPEXANT').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryGerais.FieldbyName('PLARECUPDESPEXANT').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edContaAnulaDespesa.Text := qryGerais.FieldbyName('PLARECUPDESPEXANT').AsString;
      lbDescricaoContaAnulaDespesa.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaAnulaDespesa.Text             := '';
      lbDescricaoContaAnulaDespesa.Caption := '';
   end;

   //Início - William Santana - SOL 164620.11384 KIN 1816211
   if (qryGerais.FieldbyName('PLACONTAABONO').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryGerais.FieldbyName('PLACONTAABONO').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edCCAbono.Text := qryGerais.FieldbyName('PLACONTAABONO').AsString;
      lblContaContabAbono.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edCCAbono.Text             := '';
      lblContaContabAbono.Caption := '';
   end;

   if (qryGerais.FieldbyName('PLACONTACORRECAO').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryGerais.FieldbyName('PLACONTACORRECAO').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edCCCorrMon.Text := qryGerais.FieldbyName('PLACONTACORRECAO').AsString;
      lblContaContabCorrMon.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edCCCorrMon.Text             := '';
      lblContaContabCorrMon.Caption := '';
   end;
   //Término - William Santana - SOL 164620.11384 KIN 1816211

end;

procedure TfrmCadIntegracaoPREV.PreencheCamposContribuicao;
begin

   frmAguarde.Mostra('Buscando Informações da Contribuição ...');
   with dsContrib.DataSet do
   begin
      if (FieldByName('CODSUBCONTA').AsInteger > 0) and
         (dtmIntegraCAPCAR.qrySubConta.Locate('CODSUBCONTA',FieldByName('CODSUBCONTA').AsInteger,[loCaseInsensitive]))
      then dblkSubconta.Text := dtmIntegraCAPCAR.qrySubConta.FieldByName('NOMESUBCONTA').AsString
      else dblkSubconta.Text := '';

      if (FieldByName('IDPLANPREVCONTAB').AsInteger > 0) and
         (dtmIntegraCAPCAR.qryPlanPrevContab.Locate('IDPLANPREVCONTAB', FieldByName('IDPLANPREVCONTAB').AsInteger,[loCaseInsensitive]))
      then dblkpcmbPlanPrevContab.Text := dtmIntegraCAPCAR.qryPlanPrevContab.FieldByName('NOME').AsString
      else dblkpcmbPlanPrevContab.Text := '';

      if (FieldByName('PLACONTAC').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAC').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabil1.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoConta1.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabil1.Text     := '';
         lbDescricaoConta1.Caption := '';
      end;


      if (FieldByName('PLACONTAD').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAD').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabil.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoConta.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabil.Text     := '';
         lbDescricaoConta.Caption := '';
      end;

      
      if (FieldByName('PLACONTADBANCO').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADBANCO').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPlaContaDBanco.Text              := qryContaContabil.FieldbyName('PLACONTA').AsString;
         lblDescricaoPlaContaDBanco.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
      end
      else begin
         edPlaContaDBanco.Text     := '';
         lblDescricaoPlaContaDBanco.Caption := '';
      end;
     

      if (FieldByName('PLACONTAOUTROMES').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAOUTROMES').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilFolhaAtrasado.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblDescricaoContaFolhaAtrasado.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilFolhaAtrasado.Text      := '';
         lblDescricaoContaFolhaAtrasado.Caption := '';
      end;

      if (FieldByName('PLACTAACJUD').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACTAACJUD').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilAcaoJudicial.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblDescricaoContaAcaoJudicial.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilAcaoJudicial.Text      := '';
         lblDescricaoContaAcaoJudicial.Caption := '';
      end;

      
      if (FieldByName('PLACONTACADT13').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACADT13').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPLACONTACADT13.Text         := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblDescPLACONTACADT13.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPLACONTACADT13.Text         := '';
         lblDescPLACONTACADT13.Caption := '';
      end;


      if (FieldByName('PLACONTADPROVIS').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADPROVIS').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisD.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisD.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisD.Text      := '';
         lbDescricaoContaProvisD.Caption  := '';
      end;


      if (FieldByName('PLACONTACPROVIS').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACPROVIS').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisC.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisC.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisC.Text      := '';
         lbDescricaoContaProvisC.Caption  := '';
      end;

      if (FieldByName('PLACONTADPROVADT').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADPROVADT').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisPD.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisPD.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisPD.Text      := '';
         lbDescricaoContaProvisPD.Caption  := '';
      end;

      if (FieldByName('PLACONTACPROVADT').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACPROVADT').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisPC.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisPC.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisPC.Text      := '';
         lbDescricaoContaProvisPC.Caption  := '';
      end;

      if (FieldByName('PLACONTADEVOL').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADEVOL').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilDevol.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaDevol.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilDevol.Text      := '';
         lbDescricaoContaDevol.Caption  := '';
      end;

      if (FieldByName('PLACONTADEVOLPAT').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADEVOLPAT').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilDevolPatro.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaDevolPatro.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilDevolPatro.Text      := '';
         lbDescricaoContaDevolPatro.Caption  := '';
      end;


      if (IntegraBack.ObrigaABC = 'S') and
         (FieldByName('UNIDNEGOC').AsInteger > 0 )            and
         (dtmIntegraCAPCAR.qryAtividade.Locate('UNIDNEGOC', FieldByName('UNIDNEGOC').AsInteger,[loCaseInsensitive,loPartialKey]))
      then lkcmbDescAtividade.Text := dtmIntegraCAPCAR.qryAtividade.FieldbyName('NOME').AsString
      else lkcmbDescAtividade.Text := '';

      if (FieldByName('CODPORTFORMA').AsInteger > 0 )            and
         (dtmIntegraCAPCAR.qryformapag.Locate('CODPORTFORMA', FieldByName('CODPORTFORMA').AsInteger,[loCaseInsensitive,loPartialKey]))
      then dblkpcmbPortForma.Text := dtmIntegraCAPCAR.qryformapag.FieldbyName('DESCRICAO').AsString
      else dblkpcmbPortForma.Text := '';

      if (FieldByName('CODCENTRORESPON').AsString <> '' )            and
         (dtmIntegraCAPCAR.qrycentrespon.Locate('CODCENTRORESPON', FieldByName('CODCENTRORESPON').AsString,[loCaseInsensitive,loPartialKey]))
      then cmbcentrespon.Text := dtmIntegraCAPCAR.qrycentrespon.FieldbyName('NOME').AsString
      else cmbcentrespon.Text := '';


      
      if (FieldByName('CODCENTROCUSTOD').AsString <> '' )            and
         (dtmIntegraCAPCAR.qryCCusto.Locate('CODCENTROCUSTO', FieldByName('CODCENTROCUSTOD').AsString,[loCaseInsensitive,loPartialKey]))
      then dblkpcmbContribCCusto.Text := dtmIntegraCAPCAR.qryCCusto.FieldbyName('NOME').AsString
      else dblkpcmbContribCCusto.Text := '';

      if (FieldByName('CODTIPRECDES').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPRECDES').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpReceb1.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edTpReceb1.Text := '';

      if (FieldByName('CODTIPDESEMBCAR').AsString <> '')            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPDESEMBCAR').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb1.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb1.Text := '';

      if (FieldByName('CODTIPDESEMBDEVOL').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPDESEMBDEVOL').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb2.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb2.Text := '';

      
      if (FieldByName('CODTIPRECEBDEV').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPRECEBDEV').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpReceb2.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edTpReceb2.Text := '';
     

      if (FieldByName('CODTIPDESEMBPROV').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPDESEMBPROV').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb3.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb3.Text := '';

      if (FieldByName('CODTIPRECDESADT').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPRECDESADT').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb4.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb4.Text := '';

      //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
      if (FieldByName('CODTIPREDDESPGAPAGAR').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPREDDESPGAPAGAR').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb8.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb8.Text := '';

      if (FieldByName('CODTIPREDDESPGARECEBER').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPREDDESPGARECEBER').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpReceb5.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edTpReceb5.Text := '';

      if (FieldByName('CODTIPREDDESPGADEVOLPAGAR').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPREDDESPGADEVOLPAGAR').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpDesemb9.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edTpDesemb9.Text := '';

      if (FieldByName('CODTIPREDDESPGADEVOLRECEBER').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPREDDESPGADEVOLRECEBER').AsString,[loCaseInsensitive,loPartialKey]))
      then edTpReceb6.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edTpReceb6.Text := '';
      //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

      //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
      if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
      if sbtnSelContribuicao.Down then
      begin
              if (FieldByName('PLACONTAPROVPERDA').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAPROVPERDA').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerda.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerda.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerda.Text         := '';
                 lbDescricaoContaProvPerda.Caption := '';
              end; 

              if (FieldByName('PLACONTADREVERSAO').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADREVERSAO').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerdaD.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerdaD.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerdaD.Text         := '';
                 lbDescricaoContaProvPerdaD.Caption := '';
              end;

              if (FieldByName('PLACONTACREVERSAO').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACREVERSAO').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerdaC.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerdaC.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerdaC.Text         := '';
                 lbDescricaoContaProvPerdaC.Caption := '';
              end;  

              if (FieldByName('CODTIPORECEBATRASO').AsString <> '' )            and
                 (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPORECEBATRASO').AsString,[loCaseInsensitive,loPartialKey]))
              then edTpRecebEmAtraso.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
              else edTpRecebEmAtraso.Text := '';

              if (FieldByName('CODTIPODESEMATRASO').AsString <> '' )            and
                 (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPODESEMATRASO').AsString,[loCaseInsensitive,loPartialKey]))
              then edTpDesembEmAtraso.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
              else edTpDesembEmAtraso.Text := '';

      end else
      begin
              if (FieldByName('PLACONTAPROVPERDA13').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAPROVPERDA13').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerda.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerda.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerda.Text         := '';
                 lbDescricaoContaProvPerda.Caption := '';
              end; 

              if (FieldByName('PLACONTADREVERSAO13').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADREVERSAO13').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerdaD.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerdaD.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerdaD.Text         := '';
                 lbDescricaoContaProvPerdaD.Caption := '';
              end;

              if (FieldByName('PLACONTACREVERSAO13').AsString <> '') and
                 (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACREVERSAO13').AsString,[loCaseInsensitive,loPartialKey]))
              then begin
                 edContaProvPerdaC.Text             := qryContaContabil.FieldbyName('PlaConta').AsString;
                 lbDescricaoContaProvPerdaC.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
              end
              else begin
                 edContaProvPerdaC.Text         := '';
                 lbDescricaoContaProvPerdaC.Caption := '';
              end;     

              if (FieldByName('CODTIPORECEBATRASO13').AsString <> '' )            and
                 (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPORECEBATRASO13').AsString,[loCaseInsensitive,loPartialKey]))
              then edTpRecebEmAtraso.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
              else edTpRecebEmAtraso.Text := '';

              if (FieldByName('CODTIPODESEMATRASO13').AsString <> '' )            and
                 (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPODESEMATRASO13').AsString,[loCaseInsensitive,loPartialKey]))
              then edTpDesembEmAtraso.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
              else edTpDesembEmAtraso.Text := '';
      end;
      //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948

    end;
   frmAguarde.Apaga;
end; 

procedure TfrmCadIntegracaoPREV.PreencheCamposPlanPrevPatro;
begin
   
   if grpPlaContaDBenefGeral.Visible
   then begin
      with qryPlanPrevPatro do
      begin
          if (FieldByName('PLACONTALIQFLHBEN').AsString <> '') and
             (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTALIQFLHBEN').AsString,[loCaseInsensitive,loPartialKey]))
          then begin
             edPlaContaDBenefGERAL.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
             lblPlaContaDBenefGERAL.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
          end
          else begin
             edPlaContaDBenefGERAL.Text     := '';
             lblPlaContaDBenefGERAL.Caption := '';
          end;
      end;
   end;
end;


procedure TfrmCadIntegracaoPREV.PreencheCamposBeneficio;
begin
   frmAguarde.Mostra('Buscando Informações do Benefício ...');
   with dsBenef.DataSet do
   begin
      if (FieldByName('CODSUBCONTA').AsInteger > 0) and
         (dtmIntegraCAPCAR.qrySubConta.Locate('CODSUBCONTA',FieldByName('CODSUBCONTA').AsInteger,[loCaseInsensitive]))
      then dblkSubcontaBenef.Text := dtmIntegraCAPCAR.qrySubConta.FieldByName('NOMESUBCONTA').AsString
      else dblkSubcontaBenef.Text := '';

      if (FieldByName('IDPLANPREVCONTAB').AsInteger > 0) and
         (dtmIntegraCAPCAR.qryPlanPrevContab.Locate('IDPLANPREVCONTAB', FieldByName('IDPLANPREVCONTAB').AsInteger,[loCaseInsensitive]))
      then dblkpcmbPlanPrevContabBenef.Text := dtmIntegraCAPCAR.qryPlanPrevContab.FieldByName('NOME').AsString
      else dblkpcmbPlanPrevContabBenef.Text := '';

      if (FieldByName('PLACONTAC').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAC').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPlaContaCBenef.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPlaContaCBenef.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPlaContaCBenef.Text     := '';
         lblPlaContaCBenef.Caption := '';
      end;


      
      if (FieldByName('PLACONTADEVOL').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADEVOL').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPlaContaDevol.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPlaContaDevol.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPlaContaDevol.Text     := '';
         lblPlaContaDevol.Caption := '';
      end;
      

      if (FieldByName('PLACONTAD').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTAD').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPlaContaDBenef.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPlaContaDBenef.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPlaContaDBenef.Text     := '';
         lblPlaContaDBenef.Caption := '';
      end;


      if (FieldByName('PLACTAACJUD').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACTAACJUD').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPLACTAACJUD.Text        := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPLACTAACJUD.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPLACTAACJUD.Text       := '';
         lblPLACTAACJUD.Caption  := '';
      end;

      
      if (FieldByName('PLACONTADADT13').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADADT13').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPLACONTADADT13.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPLACONTADADT13.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPLACONTADADT13.Text      := '';
         lblPLACONTADADT13.Caption  := '';
      end;
      
      if (FieldByName('PLACONTADPROVIS').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADPROVIS').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPLACONTADPROVIS.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPLACONTADPROVIS.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPLACONTADPROVIS.Text      := '';
         lblPLACONTADPROVIS.Caption  := '';
      end;

      if (FieldByName('PLACONTACPROVIS').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACPROVIS').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edPLACONTACPROVIS.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lblPLACONTACPROVIS.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edPLACONTACPROVIS.Text      := '';
         lblPLACONTACPROVIS.Caption  := '';
      end;

      if (FieldByName('PLACONTADPROVADT').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADPROVADT').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisPD.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisPD.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisPD.Text      := '';
         lbDescricaoContaProvisPD.Caption  := '';
      end;

      if (FieldByName('PLACONTACPROVADT').AsString <> '') and
         (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACPROVADT').AsString,[loCaseInsensitive,loPartialKey]))
      then begin
         edContaContabilProvisPC.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
         lbDescricaoContaProvisPC.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
      end
      else begin
         edContaContabilProvisPC.Text      := '';
         lbDescricaoContaProvisPC.Caption  := '';
      end;

      if (IntegraBack.ObrigaABC = 'S') and
         (FieldByName('UNIDNEGOC').AsInteger > 0 )            and
         (dtmIntegraCAPCAR.qryAtividade.Locate('UNIDNEGOC', FieldByName('UNIDNEGOC').AsInteger,[loCaseInsensitive,loPartialKey]))
      then lkcmbDescAtividade.Text := dtmIntegraCAPCAR.qryAtividade.FieldbyName('NOME').AsString
      else lkcmbDescAtividade.Text := '';

      if (FieldByName('CODPORTFORMA').AsInteger > 0 )            and
         (dtmIntegraCAPCAR.qryformapag.Locate('CODPORTFORMA', FieldByName('CODPORTFORMA').AsInteger,[loCaseInsensitive,loPartialKey]))
      then dblkpcmbPortFormaBenef.Text := dtmIntegraCAPCAR.qryformapag.FieldbyName('DESCRICAO').AsString
      else dblkpcmbPortFormaBenef.Text := '';

      if (FieldByName('CODCENTRORESPON').AsString <> '' )            and
         (dtmIntegraCAPCAR.qrycentrespon.Locate('CODCENTRORESPON', FieldByName('CODCENTRORESPON').AsString,[loCaseInsensitive,loPartialKey]))
      then cmbcentresponBenef.Text := dtmIntegraCAPCAR.qrycentrespon.FieldbyName('NOME').AsString
      else cmbcentresponBenef.Text := '';


      if (FieldByName('CODCENTROCUSTOD').AsString <> '' )            and
         (dtmIntegraCAPCAR.qryCCusto.Locate('CODCENTROCUSTO', FieldByName('CODCENTROCUSTOD').AsString,[loCaseInsensitive,loPartialKey]))
      then dblkpcmbBenefCCusto.Text := dtmIntegraCAPCAR.qryCCusto.FieldbyName('NOME').AsString
      else dblkpcmbBenefCCusto.Text := '';


      if (FieldByName('CODTIPRECDES').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPRECDES').AsString,[loCaseInsensitive,loPartialKey]))
      then edCODTIPRECDESBenef.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edCODTIPRECDESBenef.Text := '';


      if (FieldByName('CODTIPRECEBDEVOL').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPRECEBDEVOL').AsString,[loCaseInsensitive,loPartialKey]))
      then edCODTIPRECEBDEVOLBenef.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edCODTIPRECEBDEVOLBenef.Text := '';

      if (FieldByName('CODTIPRECEBCAP').AsString <> '' )            and
         (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPRECEBCAP').AsString,[loCaseInsensitive,loPartialKey]))
      then edCODTIPRECEBCAP.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
      else edCODTIPRECEBCAP.Text := '';


      if (FieldByName('CODTIPDESEMBPROV').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPDESEMBPROV').AsString,[loCaseInsensitive,loPartialKey]))
      then edCODTIPDESEMBPROV.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edCODTIPDESEMBPROV.Text := '';

      if (FieldByName('CODTIPRECDESADT').AsString <> '' )            and
         (qryTpPaga.Locate('CODTIPRECDES', FieldByName('CODTIPRECDESADT').AsString,[loCaseInsensitive,loPartialKey]))
      then edCODTIPRECDESADT.Text := qryTpPaga.FieldbyName('DESCRICAO').AsString
      else edCODTIPRECDESADT.Text := '';

   end; 

   frmAguarde.Apaga;
end; 

procedure TfrmCadIntegracaoPREV.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  inherited;
  qryNivelIntegracao.Close;
  qryNivelIntegracao.Open;
  qryPlano.Close;
  qryPlano.Open;
  qryPatroPlano.Close;
  qryPatroPlano.Open;

  //Leandro SIG1361503 - inicio
  qryProventos.Close;
  qryProventos.Open;
  qryAltBaixa.Close;
  qryAltBaixa.Open;
  //Leandro SIG136150 - fim

  DesabilitaControles;
  PreparaIntegracao;
  bAvisoGravacaoContrib := False;
  bClicouNoOKContrib    := False;
  bAvisoGravacaoBenef   := False;
  bClicouNoOKBenef      := False;

  
  lblTitPLACONTADADT13.Visible  := False;
  edPLACONTADADT13.Visible      := False;
  sbtnPLACONTADADT13.Visible    := False;
  grpPLACONTADADT13.Visible     := False;

  lblTitPLACONTACADT13.Visible  := False;
  edPLACONTACADT13.Visible      := False;
  sbtnPLACONTACADT13.Visible    := False;
  grpPLACONTACADT13.Visible     := False;

end;

procedure TfrmCadIntegracaoPREV.edContaContabilPadraoExit( sConta    : string;
                                                           edConta   : TMaskEdit;
                                                           lblConta  : TLabel );


begin
  with dtmIntegraCAPCAR do
  begin
      try
        lblConta.Caption  := '';
        if sConta <> '' 
        then if qryContaContabil.Active
             then if qryContaContabil.LOCATE('PLACONTA',sConta,[loCaseInsensitive,loPartialKey])
                  then begin
                     if (qryContaContabil.FieldByName('PLATIPO').asString = 'A')
                     then begin
                        lblConta.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
                     end
                     else begin
                     //   MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
                        MsgDlg('Conta contábil deve ser analítica','Erro',mtError,[mbOK],0);     //William Santana SOL 164620.11384 KIN 1816211
                        edConta.Text := '';
                        edConta.SetFocus;
                     end
                  end
                  else begin
                     MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
                     edConta.Text := '';
                     edConta.SetFocus;
                  end;
      except
        Raise;
      end;
  end;
end;

procedure TfrmCadIntegracaoPREV.dblkpcmbNivelIntegracaoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  DesabilitaControles;
  sbtnSelContribuicao.GroupIndex   := 0;
  sbtnSelBeneficio.GroupIndex      := 0;
  sbtnSelContribuicao.Down         := False;
  sbtnSelBeneficio.Down            := False;
  sbtnSelContribuicao13.GroupIndex := 0;
  sbtnSelBeneficio13.GroupIndex    := 0;
  sbtnSelContribuicao13.Down       := False;
  sbtnSelBeneficio13.Down          := False;

  sbtnSelDivBenef.GroupIndex       := 0;        //edilaine SIG115304
  sbtnSelDivBenef.Down             := False;    //edilaine SIG115304

  case qryNivelIntegracao.FieldByName('NIVEL').AsInteger of
       1 : begin
              lblPara.Visible                := False;
              dblkpcmbPlano.Visible          := False;
              dblkpcmbPatroPlano.Visible     := False;
              edPessoa.Visible               := False;
              sbtnSelPessoa.Visible          := False;
              pnlIntegracao.Visible          := True;
              pgctrlIntegraInfGerais.Visible := True;
              pgctrlIntegraContrib.Visible   := False;
              pgctrlIntegraBenef.Visible     := False;
              qryGerais.Close;
              qryGerais.ParamByName('IDFUNDACAO').AsInteger := Sistema.IdEmpresa;
              qryGerais.Open;
              dbgrdGerais.Visible            := True;
              lblEntidadeContabil.Visible    := False;
              dblkpcmbPlanPrevContab.Visible := False;
              grpPlaContaDBenefGeral.Visible := False;
           end;
       2 : begin
              lblPara.Visible                := True;
              dblkpcmbPlano.Visible          := True;
              dblkpcmbPatroPlano.Visible     := False;
              edPessoa.Visible               := False;
              sbtnSelPessoa.Visible          := False;
              sbtnSelContribuicao.Visible    := True;
              sbtnSelBeneficio.Visible       := True;
              sbtnSelContribuicao13.Visible  := True;
              sbtnSelBeneficio13.Visible     := True;
              dbgrdGerais.Visible            := False;
              lblEntidadeContabil.Visible    := False;
              dblkpcmbPlanPrevContab.Visible := False;
              mnuCopiaItem.Caption           := 'Copiar Parametrização de Outro &Item deste Plano';
              mnuCopiaPlano.Caption          := 'Copiar Parametrização de &Outro Plano';
              grpPlaContaDBenefGeral.Visible := False;
              sbtnSelDivBenef.Visible        := true;       //edilaine SIG115304
           end;
       3 : begin
              lblPara.Visible                := True;
              dblkpcmbPlano.Visible          := False;
              dblkpcmbPatroPlano.Visible     := True;
              edPessoa.Visible               := False;
              sbtnSelPessoa.Visible          := False;
              sbtnSelContribuicao.Visible    := True;
              sbtnSelBeneficio.Visible       := True;
              sbtnSelContribuicao13.Visible  := True;
              sbtnSelBeneficio13.Visible     := True;
              dbgrdGerais.Visible            := False;
              lblEntidadeContabil.Visible    := False;
              dblkpcmbPlanPrevContab.Visible := False;
              mnuCopiaItem.Caption           := 'Copiar Parametrização de Outro &Item desta Patrocinadora/Plano';
              mnuCopiaPlano.Caption          := 'Copiar Parametrização de &Outra Patrocinadora/Plano';
              grpPlaContaDBenefGeral.Visible := True; 
           end;
       4 : begin
              lblPara.Visible                := True;
              dblkpcmbPlano.Visible          := False;
              dblkpcmbPatroPlano.Visible     := False;
              edPessoa.Visible               := True;
              sbtnSelPessoa.Visible          := True;
              sbtnSelContribuicao.Visible    := True;
              sbtnSelBeneficio.Visible       := True;
              sbtnSelContribuicao13.Visible  := True;
              sbtnSelBeneficio13.Visible     := True;
              dbgrdGerais.Visible            := False;
              lblEntidadeContabil.Visible    := True;
              dblkpcmbPlanPrevContab.Visible := True;
              grpPlaContaDBenefGeral.Visible := False; 
           end;
       else DesabilitaControles;
  end; 
end;

procedure TfrmCadIntegracaoPREV.sbtnSelContribuicaoClick(Sender: TObject);
begin
  inherited;

  //edilaine - SIG115304 : inicio
  if pnlDividaBenef.visible then
  begin
    pnlDividaBenef.SendToBack;
    pnlDividaBenef.visible   := false;
    pnlIntegDireita.visible  := true;
    pnlIntegEsquerda.visible := true;
  end;
  //edilaine - SIG115304 : fim

  if sbtnSelContribuicao.GroupIndex = 0
  then begin
     sbtnSelContribuicao.GroupIndex   := 1;
     sbtnSelBeneficio.GroupIndex      := 1;
     sbtnSelContribuicao13.GroupIndex := 1;
     sbtnSelBeneficio13.GroupIndex    := 1;
     sbtnSelDivBenef.GroupIndex       := 1;       //edilaine SIG115304
     sbtnSelContribuicao.Down         := True;
  end;

  
  lblTitPLACONTACADT13.Visible  := False;
  edPLACONTACADT13.Visible      := False;
  sbtnPLACONTACADT13.Visible    := False;
  grpPLACONTACADT13.Visible     := False;


  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then begin
     if Trim(dblkpcmbPlano.Text) = ''
     then begin
        MsgDlg('Selecione o Plano Previdenciário desejado.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     dsContrib.DataSet := qryContribPlano;
     qryContribPlano.Close;
     qryContribPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryContribPlano.ParamByName('FLG13').AsInteger            := 0;
     qryContribPlano.ParamByName('FLGCOBRADECTERC1').AsInteger := 0;
     qryContribPlano.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
     qryContribPlano.Open;
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3
  then begin
     dsContrib.DataSet := qryContribPatroPlano;
     if Trim(dblkpcmbPatroPlano.Text) = ''
     then begin
        MsgDlg('Selecione a Patrocinadora e Plano Previdenciário desejados.','Erro',mtError,[mbOK],0);
        DesabilitaControles;
        Abort;
     end;
     qryContribPatroPlano.Close;
     qryContribPatroPlano.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryContribPatroPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryContribPatroPlano.ParamByName('FLG13').AsInteger            := 0;
     qryContribPatroPlano.ParamByName('FLGCOBRADECTERC1').AsInteger := 0;
     qryContribPatroPlano.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
     qryContribPatroPlano.Open;
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4
  then begin
     if MontaSelectPessoa.ValoresChave[2] = MontaSelectPessoa.ValoresChave[4] // titular = idpessoa
     then begin
        dsContrib.DataSet := qryContribPessoa;
        qryContribPessoa.Close;
        qryContribPessoa.ParamByName('IDPESSJUR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
        qryContribPessoa.ParamByName('IDPLANOPREV').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
        qryContribPessoa.ParamByName('IDPESSOA').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
        qryContribPessoa.ParamByName('SEQPROPOSTA').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[3]));
        qryContribPessoa.ParamByName('FLG13').AsInteger            := 0;
        qryContribPessoa.ParamByName('FLGCOBRADECTERC1').AsInteger := 0;
        qryContribPessoa.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
        qryContribPessoa.Open;
     end
     else begin
        qryBuscaNucleo.Close;
        qryBuscaNucleo.ParamByName('IDPESSJUR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
        qryBuscaNucleo.ParamByName('IDPLANOPREV').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
        qryBuscaNucleo.ParamByName('IDTITULAR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
        qryBuscaNucleo.ParamByName('SEQPROPOSTA').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[3]));
        qryBuscaNucleo.ParamByName('IDPESSOA').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[4]));
        qryBuscaNucleo.Open;

        dsContrib.DataSet := qryContribNucleo;

        qryContribNucleo.Close;
        if not qryBuscaNucleo.IsEmpty
        then qryContribNucleo.ParamByName('IDNUCLEOFAMILIAR').AsInteger := qryBuscaNucleo.FieldByName('IDNUCLEOFAMILIAR').AsInteger
        else qryContribNucleo.ParamByName('IDNUCLEOFAMILIAR').AsInteger := 0;
        qryContribNucleo.ParamByName('FLG13').AsInteger            := 0;
        qryContribNucleo.ParamByName('FLGCOBRADECTERC1').AsInteger := 0;
        qryContribNucleo.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
        qryContribNucleo.Open;
     end;
  end;
  PreencheCamposContribuicao;
  pnlIntegracao.Visible           := True;
  pgctrlIntegraContrib.Visible    := True;
  pgctrlIntegraInfGerais.Visible  := False;
  pgctrlIntegraBenef.Visible      := False;
  dbgrdContrib.Visible            := True;
  dbgrdBenef.Visible              := False;
  pgctrlIntegraContrib.ActivePage := tbsContribContabil;
  pgctrlIntegraContribContabil.ActivePage := tbsContabilGeral;
end;

procedure TfrmCadIntegracaoPREV.spdContaContabil1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(1, 203, 309, edContaContabil1.Text);
end;

procedure TfrmCadIntegracaoPREV.spdContaContabilClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(2, 180, 298, edContaContabil.Text);
end;


procedure TfrmCadIntegracaoPREV.sbtnPlaContaDBancoClick(Sender: TObject);
begin
  inherited;

  AbreArvoreContabil(3,314, 298, edPlaContaDBanco.Text);
end;

procedure TfrmCadIntegracaoPREV.spdFolhaAtrasadaClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(4, 246 , 298,edContaContabilFolhaAtrasado.Text);
end;

procedure TfrmCadIntegracaoPREV.spdFolhaJudicialClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(5, 382, 298,edContaContabilAcaoJudicial.Text);
end;

procedure TfrmCadIntegracaoPREV.spdContaContabilProvisDClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(6, 215, 310, edContaContabilProvisD.Text);
end;

procedure TfrmCadIntegracaoPREV.spdContaContabilProvisCClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(7, 325, 310, edContaContabilProvisC.Text);

end;

procedure TfrmCadIntegracaoPREV.spdContaContabilProvisPDClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(8, 215, 310, edContaContabilProvisPD.Text);

end;

procedure TfrmCadIntegracaoPREV.spdContaContabilProvisPCClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(9, 325, 310, edContaContabilProvisPC.Text);

end;

procedure TfrmCadIntegracaoPREV.spdContaDevolClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(10, 202, 306, edContaContabilDevol.Text);

end;

procedure TfrmCadIntegracaoPREV.spdContaDevolpatroClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(11, 301, 306, edContaContabilDevolPatro.Text);
end;

procedure TfrmCadIntegracaoPREV.spdContaAnulaRecClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(12, 196, 318,edContaAnulaReceita.Text);
end;

procedure TfrmCadIntegracaoPREV.spdContaAnulaDespClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(13, 345, 318,edContaAnulaDespesa.Text);

end;

procedure TfrmCadIntegracaoPREV.treeContaContabilDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
      if (qryContaContabil.FieldByName('PLATIPO').asString = 'A')
      then treeContaContabilExit(treeContaContabil)
      else Exit;
  end;
end;

procedure TfrmCadIntegracaoPREV.treeContaContabilExit(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    treeContaContabil.Visible := False;
    if (qryContaContabil.FieldByName('PLATIPO').asString = 'A') then
    begin
       case treeContaContabil.Tag of
          1 : Begin
               edContaContabil1.Text     := '';
               edContaContabil1.Text     := treeContaContabil.ValorChave;
               lbDescricaoConta1.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          2 : Begin
               edContaContabil.Text := '';
               edContaContabil.Text := treeContaContabil.ValorChave;
               lbDescricaoConta.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          3 : Begin
               edPlaContaDBanco.Text := '';
               edPlaContaDBanco.Text := treeContaContabil.ValorChave;
               lblDescricaoPlaContaDBanco.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          4 : Begin
               edContaContabilFolhaAtrasado.Text := '';
               edContaContabilFolhaAtrasado.Text := treeContaContabil.ValorChave;
               lblDescricaoContaFolhaAtrasado.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          5 : Begin
               edContaContabilAcaoJudicial.Text := '';
               edContaContabilAcaoJudicial.Text := treeContaContabil.ValorChave;
               lblDescricaoContaAcaoJudicial.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          6 : Begin
               edContaContabilProvisD.Text := '';
               edContaContabilProvisD.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          7 : Begin
               edContaContabilProvisC.Text := '';
               edContaContabilProvisC.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          8 : Begin
               edContaContabilProvisPD.Text := '';
               edContaContabilProvisPD.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisPD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          9 : Begin
               edContaContabilProvisPC.Text := '';
               edContaContabilProvisPC.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisPC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         10 : Begin
               edContaContabilDevol.Text := '';
               edContaContabilDevol.Text := treeContaContabil.ValorChave;
               lbDescricaoContaDevol.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         11 : Begin
               edContaContabilDevolPatro.Text := '';
               edContaContabilDevolPatro.Text := treeContaContabil.ValorChave;
               lbDescricaoContaDevolPatro.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         12 : Begin
               edContaAnulaReceita.Text := '';
               edContaAnulaReceita.Text := treeContaContabil.ValorChave;
               lblDescricaoContaAnulaReceita.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         13 : Begin
               edContaAnulaDespesa.Text := '';
               edContaAnulaDespesa.Text := treeContaContabil.ValorChave;
               lbDescricaoContaAnulaDespesa.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         14 : Begin
               edPlaContaDBenef.Text := '';
               edPlaContaDBenef.Text := treeContaContabil.ValorChave;
               lblPlaContaDBenef.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         15 : Begin
               edPlaContaCBenef.Text := '';
               edPlaContaCBenef.Text := treeContaContabil.ValorChave;
               lblPlaContaCBenef.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         16 : Begin
               edPLACTAACJUD.Text := '';
               edPLACTAACJUD.Text := treeContaContabil.ValorChave;
               lblPLACTAACJUD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         17 : Begin
               edPLACONTADPROVIS.Text := '';
               edPLACONTADPROVIS.Text := treeContaContabil.ValorChave;
               lblPLACONTADPROVIS.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         18 : Begin
               edPLACONTACPROVIS.Text := '';
               edPLACONTACPROVIS.Text := treeContaContabil.ValorChave;
               lblPLACONTACPROVIS.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         19 : Begin
               edPLACONTADPROVADT.Text := '';
               edPLACONTADPROVADT.Text := treeContaContabil.ValorChave;
               lblPLACONTADPROVADT.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         20 : Begin
               edPLACONTACPROVADT.Text := '';
               edPLACONTACPROVADT.Text := treeContaContabil.ValorChave;
               lblPLACONTACPROVADT.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         21 : Begin 
               edPLACONTADADT13.Text := '';
               edPLACONTADADT13.Text := treeContaContabil.ValorChave;
               lblPLACONTADADT13.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         22 : Begin 
               edPLACONTACADT13.Text := '';
               edPLACONTACADT13.Text := treeContaContabil.ValorChave;
               lblDescPLACONTACADT13.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         23 : Begin 
               edPlaContaDBenefGERAL.Text := '';
               edPlaContaDBenefGERAL.Text := treeContaContabil.ValorChave;
               lblPlaContaDBenefGERAL.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         
         24 : Begin
               edPlaContaDevol.Text     := '';
               edPlaContaDevol.Text     := treeContaContabil.ValorChave;
               lblPlaContaDevol.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

        //Início - William Santana -  SOL 164620.11384 KIN 1816211
         25 : Begin
               edCCAbono.Text     := '';
               edCCAbono.Text     := treeContaContabil.ValorChave;
               lblContaContabAbono.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         26 : Begin
               edCCCorrMon.Text     := '';
               edCCCorrMon.Text     := treeContaContabil.ValorChave;
               lblContaContabCorrMon.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
        //Término - William Santana -  SOL 164620.11384 KIN 1816211

        //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
         27 : Begin
               edContaProvPerda.Text     := '';
               edContaProvPerda.Text     := treeContaContabil.ValorChave;
               lbDescricaoContaProvPerda.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         28 : Begin
               edContaProvPerdaD.Text     := '';
               edContaProvPerdaD.Text     := treeContaContabil.ValorChave;
               lbDescricaoContaProvPerdaD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         29 : Begin
               edContaProvPerdaC.Text     := '';
               edContaProvPerdaC.Text     := treeContaContabil.ValorChave;
               lbDescricaoContaProvPerdaC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
        //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948

        //edilaine SIG115304 : inicio
         30 : Begin
               edPLACONTADFORMASDODIV.Text     := '';
               edPLACONTADFORMASDODIV.Text     := treeContaContabil.ValorChave;
               lbLPLACONTADFORMASDODIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         31 : Begin
               edPLACONTACFORMASDODIV.Text     := '';
               edPLACONTACFORMASDODIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACFORMASDODIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         32 : Begin
               edPLACONTADREVFORMASDODIV.Text     := '';
               edPLACONTADREVFORMASDODIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADREVFORMASDODIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         33 : Begin
               edPLACONTACREVFORMASDODIV.Text     := '';
               edPLACONTACREVFORMASDODIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACREVFORMASDODIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         34 : Begin
               edPLACONTADBAIXADIV.Text     := '';
               edPLACONTADBAIXADIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADBAIXADIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         35 : Begin
               edPLACONTACBAIXADIV.Text     := '';
               edPLACONTACBAIXADIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACBAIXADIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         36 : Begin
               edPLACONTADREVBAIXADIV.Text     := '';
               edPLACONTADREVBAIXADIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADREVBAIXADIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         37 : Begin
               edPLACONTACREVBAIXADIV.Text     := '';
               edPLACONTACREVBAIXADIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACREVBAIXADIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         38 : Begin
               edPLACONTADPROVDIV.Text     := '';
               edPLACONTADPROVDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADPROVDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         39 : Begin
               edPLACONTACPROVDIV.Text     := '';
               edPLACONTACPROVDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACPROVDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         40 : Begin
               edPLACONTADREVPROVDIV.Text     := '';
               edPLACONTADREVPROVDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADREVPROVDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         41 : Begin
               edPLACONTACREVPROVDIV.Text     := '';
               edPLACONTACREVPROVDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACREVPROVDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;

         42 : Begin
               edPLACONTADATUREAJDIV.Text     := '';
               edPLACONTADATUREAJDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTADATUREAJDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         43 : Begin
               edPLACONTACATUREAJDIV.Text     := '';
               edPLACONTACATUREAJDIV.Text     := treeContaContabil.ValorChave;
               lblPLACONTACATUREAJDIV.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         //leandro SIG136150 - INICIO
         44 : Begin
               edPLACONTACBOLETO.Text     := '';
               edPLACONTACBOLETO.Text     := treeContaContabil.ValorChave;
               lblPLACONTACBOLETO.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         //leandro SIG136150 - FIM

        //edilaine SIG115304 : fim
       end;
    end;
  end;
end;

procedure TfrmCadIntegracaoPREV.qryGeraisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := 'Parâmetros Gerais da Fundação '+qryGerais.FieldByName('FUNDACAO').AsString;
  PreencheCamposGerais;
end;

procedure TfrmCadIntegracaoPREV.qryContribPlanoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := dsContrib.DataSet.FieldByName('NOME').AsString;
  PreencheCamposContribuicao;
end;

procedure TfrmCadIntegracaoPREV.qryContribPatroPlanoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := dsContrib.DataSet.FieldByName('NOME').AsString;
  PreencheCamposContribuicao;
end;

procedure TfrmCadIntegracaoPREV.qryContribPessoaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := dsContrib.DataSet.FieldByName('NOME').AsString;
  PreencheCamposContribuicao;
end;

procedure TfrmCadIntegracaoPREV.qryContribNucleoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := dsContrib.DataSet.FieldByName('NOME').AsString;
  PreencheCamposContribuicao;
end;

procedure TfrmCadIntegracaoPREV.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  frmAguarde.Mostra('Gravando Informações ...');

  //SOL125769 - Ádler Souza
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger <> 1 then
    if not sbtnSelContribuicao.Down   and not sbtnSelBeneficio.Down and
       not sbtnSelDivBenef.Down       and                                            //edilaine SIG115304
       not sbtnSelContribuicao13.Down and not sbtnSelBeneficio13.Down then
    begin
      frmAguarde.Apaga;
      Abort;
    end;
  //Fim - SOL125769 - Ádler Souza

  dtmBaseDados.dbBaseDados.StartTransaction;
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 1
  then begin
     if not GravaCamposGerais
     then begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao gravar integração contábil/financeira geral.','Erro',mtError,[mbOK],0);
        Abort;
     end
     else begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.Commit;
     end;
  end
  //edilaine SIG115304 : inicio
  else if ( (sbtnSelDivBenef.Visible) and (sbtnSelDivBenef.Down) ) then
  begin
     //Leandro SIG136150 - Inicio
     if (edPLACONTACBOLETO.Visible     and (Trim(edPLACONTACBOLETO.Text) = '')) OR
        (dblkpCentresponDivida.Visible and (Trim(dblkpCentresponDivida.Text) = '')) OR
        (dblkpCentcustoDivida.Visible  and (Trim(dblkpCentcustoDivida.Text) = '')) OR
        (dblkpTipoReembDivida.Visible  and (Trim(dblkpCentcustoDivida.Text) = '')) OR
        (dblkpRubBaixaBol.Visible      and (Trim(dblkpRubBaixaBol.Text) = '')) OR
        (dblkpAltBaixaBol.Visible      and (Trim(dblkpAltBaixaBol.Text) = '')) then
     begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('É preciso preencher os dados de Integração Contábil/Financeira para Dívidas de Benefício.','Erro',mtError,[mbOK],0);
        Abort;
     end
     else
     begin
        if not GravaCamposPlano
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao gravar integração contábil/financeira para dívidas de benefício.','Erro',mtError,[mbOK],0);
           Abort;
        end
        else begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.Commit;
        end;
     end;
     //Leandro SIG136150 - Fim
  end
  //edilaine SIG115304 : fim
  else if ( (sbtnSelContribuicao.Visible)   and (sbtnSelContribuicao.Down) ) or
          ( (sbtnSelContribuicao13.Visible) and (sbtnSelContribuicao13.Down) )
  then begin
     bClicouNoOKContrib    := True;
     if not GravaCamposContribuicao
     then begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao gravar integração contábil/financeira de contribuição.','Erro',mtError,[mbOK],0);
        Abort;
     end
     else begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.Commit;
     end;
  end
  else begin
     bClicouNoOKBenef := True;
     if not GravaCamposBeneficio
     then begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao gravar integração contábil/financeira de benefício.','Erro',mtError,[mbOK],0);
        Abort;
     end
     else begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.Commit;
     end;
  end;
  frmAguarde.Apaga;
end;

function TfrmCadIntegracaoPREV.GravaCamposGerais : boolean;
var sSQL   : string;
    bkMark : TBookMark;
begin
   Result := False;
   sSQL := 'UPDATE PARAMAPREV SET ';

   if Trim(dblkTipoperenvio.text) <> '' then
     sSQL := sSQL +' TIPOPERENVIO ='''+ dblkTipoperenvio.LookupValue + ''''
   else
     sSQL := sSQL +' TIPOPERENVIO = NULL';

   if Trim(dblkTipopercobranca.text) <> '' then
     sSQL := sSQL +', TIPOPERCOBRANCA ='''+ dblkTipopercobranca.LookupValue + ''''
   else
     sSQL := sSQL +', TIPOPERCOBRANCA = NULL';

   if Trim(dblkTipoperdiverg.text) <> '' then
     sSQL := sSQL +', TIPOPERDIVERG ='''+ dblkTipoperdiverg.LookupValue + ''''
   else
     sSQL := sSQL +', TIPOPERDIVERG = NULL';

   if Trim(dblkTipoperreserva.text) <> '' then
     sSQL := sSQL +', TIPOPERRESERVA ='''+ dblkTipoperreserva.LookupValue + ''''
   else
     sSQL := sSQL +', TIPOPERRESERVA = NULL';

   if Trim(dblkTipoperFlhBen.text) <> '' then
     sSQL := sSQL +', TIPOPERFLHBEN ='''+ dblkTipoperFlhBen.LookupValue + ''''
   else
     sSQL := sSQL +', TIPOPERFLHBEN = NULL';

   
   if Trim(dblkTipDocCAPFolhele.text) <> '' then
     sSQL := sSQL +', TPDOCPFLHBENELET ='+ dblkTipDocCAPFolhele.LookupValue
   else
     sSQL := sSQL +', TPDOCPFLHBENELET = NULL';

    
   if Trim(dblkTipDocCAPFolhind.text) <> '' then
     sSQL := sSQL +', TPDOCPFLHBENINDIV ='+ dblkTipDocCAPFolhind.LookupValue
   else
     sSQL := sSQL +', TPDOCPFLHBENINDIV = NULL';

   
   if Trim(dblkTipDocCARFolhele.text) <> '' then
     sSQL := sSQL +', TPDOCRFLHBENELET ='+ dblkTipDocCARFolhele.LookupValue
   else
     sSQL := sSQL +', TPDOCRFLHBENELET = NULL';

   
   if Trim(dblkTipDocCARFolhind.text) <> '' then
     sSQL := sSQL +', TPDOCRFLHBENINDIV ='+ dblkTipDocCARFolhind.LookupValue
   else
     sSQL := sSQL +', TPDOCRFLHBENINDIV = NULL';

   
   if Trim(dblkTipDocCAPenvbanco.text) <> '' then
     sSQL := sSQL +', TPDOCPENVIOBANCO ='+ dblkTipDocCAPenvbanco.LookupValue
   else
     sSQL := sSQL +', TPDOCPENVIOBANCO = NULL';

    
   if Trim(dblkTipDocCAPenvPatro.text) <> '' then
     sSQL := sSQL +', TPDOCPENVIOPATRO ='+ dblkTipDocCAPenvPatro.LookupValue
   else
     sSQL := sSQL +', TPDOCPENVIOPATRO = NULL';

    
   if Trim(dblkTipoDocConvFolha.text) <> '' then
     sSQL := sSQL +', TPDOCPCONVENIO ='+ dblkTipoDocConvFolha.LookupValue
   else
     sSQL := sSQL +', TPDOCPCONVENIO = NULL';

    
   if Trim(dblkTipDocCARRecbanco.text) <> '' then
     sSQL := sSQL +', TPDOCRRECBANCO ='+ dblkTipDocCARRecbanco.LookupValue
   else
     sSQL := sSQL +', TPDOCRRECBANCO = NULL';

    
   if Trim(dblkTipDocCARRecpatro.text) <> '' then
     sSQL := sSQL +', TPDOCRRECPATRO ='+ dblkTipDocCARRecpatro.LookupValue
   else
     sSQL := sSQL +', TPDOCRRECPATRO = NULL';

   
   if Trim(dblkTipCliPatro.text) <> '' then
     sSQL := sSQL +', TIPOCLIPATRO ='+ dblkTipCliPatro.LookupValue
   else
     sSQL := sSQL +', TIPOCLIPATRO = NULL';

   
   if Trim(dblkTipCliAtivos.text) <> '' then
     sSQL := sSQL +', TIPOCLIATIVOS ='+ dblkTipCliAtivos.LookupValue
   else
     sSQL := sSQL +', TIPOCLIATIVOS = NULL';


   if Trim(dblkTipCliMantidos.text) <> '' then
     sSQL := sSQL +', TIPOCLIMANTIDOS ='+ dblkTipCliMantidos.LookupValue
   else
     sSQL := sSQL +', TIPOCLIMANTIDOS = NULL';

   
   if Trim(dblkTipCliAssistidos.text) <> '' then
     sSQL := sSQL +', TIPOCLIASSISTIDOS ='+ dblkTipCliAssistidos.LookupValue
   else
     sSQL := sSQL +', TIPOCLIASSISTIDOS = NULL';

   
   if Trim(dblkTipCliMantParc.text) <> '' then
     sSQL := sSQL +', TIPOCLIMANTPARC ='+ dblkTipCliMantParc.LookupValue
   else
     sSQL := sSQL +', TIPOCLIMANTPARC = NULL';

   
   if Trim(dblkTipFavPatro.text) <> '' then
     sSQL := sSQL +', TIPOFAVPATRO ='+ dblkTipFavPatro.LookupValue
   else
     sSQL := sSQL +', TIPOFAVPATRO = NULL';

   
   if Trim(dblkTipFavAtivos.text) <> '' then
     sSQL := sSQL +', TIPOFAVATIVOS ='+ dblkTipFavAtivos.LookupValue
   else
     sSQL := sSQL +', TIPOFAVATIVOS = NULL';

   
   if Trim(dblkTipFavMantidos.text) <> '' then
     sSQL := sSQL +', TIPOFAVMANTIDOS ='+ dblkTipFavMantidos.LookupValue
   else
     sSQL := sSQL +', TIPOFAVMANTIDOS = NULL';

   
   if Trim(dblkTipFavAssistidos.text) <> '' then
     sSQL := sSQL +', TIPOFAVASSISTIDOS ='+ dblkTipFavAssistidos.LookupValue
   else
     sSQL := sSQL +', TIPOFAVASSISTIDOS = NULL';

   if Trim(edContaAnulaReceita.text) <> '' then
     sSQL := sSQL + ', PLARECUPRECEXANT ='''+Trim(edContaAnulaReceita.text)+''''
   else
     sSQL := sSQL + ', PLARECUPRECEXANT = NULL';

   if Trim(edContaAnulaDespesa.text) <> '' then
     sSQL := sSQL + ', PLARECUPDESPEXANT ='''+Trim(edContaAnulaDespesa.text)+''''
   else
     sSQL := sSQL + ', PLARECUPDESPEXANT = NULL';

   if (Trim(edContaAnulaReceita.text) <> '') or
      (Trim(edContaAnulaDespesa.text) <> '') then
     sSQL := sSQL + ', PLANO = '+IntToStr(IntegraBack.Plano);


   if Trim(dblkTipFavMantParc.text) <> '' then
     sSQL := sSQL +', TIPOFAVMANTPARC ='+ dblkTipFavMantParc.LookupValue
   else
     sSQL := sSQL +', TIPOFAVMANTPARC = NULL';

   //Início - William Santana -  SOL 164620.11384 KIN 1816211
   if (Trim(edCCAbono.text) <> '') then
     sSQL := sSQL + ', PLACONTAABONO = '+ Trim(edCCAbono.text)
   else
     sSQL := sSQL + ', PLACONTAABONO = NULL';

   if (Trim(edCCCorrMon.text) <> '') then
     sSQL := sSQL + ', PLACONTACORRECAO = '+ Trim(edCCCorrMon.text)
   else
     sSQL := sSQL + ', PLACONTACORRECAO = NULL';
   //Término - William Santana -  SOL 164620.11384 KIN 1816211

   sSQL := ssQL +' WHERE IDFUNDACAO = '+IntToStr(Sistema.IdEmpresa); //CPrev - 27503 - 11/04/2008

   qryGrava.Close;
   qryGrava.SQL.Clear;
   qryGrava.SQL.Add(sSQL);

   try
      qryGrava.ExecSQL;
   except
     
     Exit;
     
   end;

   Result := True;
end; 

function TfrmCadIntegracaoPREV.GravaCamposContribuicao : boolean;
var sSQL   : string;
    bkMark : TBookMark;
begin
  Result := False;

  // ***************************************************************************
  // GRAVAR CONTRIBUIÇÕES
  // ( obs. ver no final do codigo as constraints pois existem várioas
  //   constraints usando o mesmo rolename )
  // ***************************************************************************

  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2 then
    sSQL := 'UPDATE CONTPREV      SET '
  else
    if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
      sSQL := 'UPDATE CONTPLANPATRO SET '
    else
      if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4 then
      begin
        if MontaSelectPessoa.ValoresChave[2] = MontaSelectPessoa.ValoresChave[4] then // titular = idpessoa
          sSQL := 'UPDATE CONTRIBPREVPARTP  SET '
        else
          sSQL := 'UPDATE CONTRIBPREVNUCLEO SET ';
  end;

  if Trim(dblkSubconta.Text) <> '' then
  begin
     if sbtnSelContribuicao.Down then
       sSQL := sSQL + 'CODSUBCONTA    = '+dtmIntegraCAPCAR.qrySubConta.FieldByName('CODSUBCONTA').AsString
     else
       sSQL := sSQL + 'CODSUBCONTA13  = '+dtmIntegraCAPCAR.qrySubConta.FieldByName('CODSUBCONTA').AsString
  end
  else
  begin
     if sbtnSelContribuicao.Down then
       sSQL := sSQL + 'CODSUBCONTA    = NULL'
     else
       sSQL := sSQL + 'CODSUBCONTA13  = NULL';
  end;

  if (dblkpcmbPlanPrevContab.Visible) and
     (Trim(dblkpcmbPlanPrevContab.Text) <> '') then
    sSQL := sSQL + ',IDPLANPREVCONTAB = '+dtmIntegraCAPCAR.qryPlanPrevContab.FieldByName('IDPLANPREVCONTAB').AsString
  else
    sSQL := sSQL + ',IDPLANPREVCONTAB = NULL';

  if Trim(edContaContabil1.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAC     = '''+Trim(edContaContabil1.Text)+''''
    else
      sSQL := sSQL + ',PLACONTAC13   = '''+Trim(edContaContabil1.Text)+''''
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAC     = NULL'
    else
      sSQL := sSQL + ',PLACONTAC13   = NULL';
  end;

  if Trim(edContaContabil.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAD = '''+Trim(edContaContabil.Text)+''''
    else
      sSQL := sSQL + ',PLACONTAD13 = '''+Trim(edContaContabil.Text)+''''
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAD   = NULL'
    else
      sSQL := sSQL + ',PLACONTAD13 = NULL';
  end;

  if Trim(edContaContabilFolhaAtrasado.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAOUTROMES = '''+Trim(edContaContabilFolhaAtrasado.Text)+''''
    else
      sSQL := sSQL + ',PLACTAOUTROMES13 = '''+Trim(edContaContabilFolhaAtrasado.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTAOUTROMES = NULL '
    else
      sSQL := sSQL + ',PLACTAOUTROMES13 = NULL ';
  end;

  if Trim(edPlaContaDBanco.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADBANCO = '''  +Trim(edPlaContaDBanco.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADBANCO13 = '''+Trim(edPlaContaDBanco.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADBANCO = NULL '
    else
      sSQL := sSQL + ',PLACONTADBANCO13 = NULL ';
  end;

  if Trim(edContaContabilAcaoJudicial.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACTAACJUD   = '''+Trim(edContaContabilAcaoJudicial.Text)+''''
    else
      sSQL := sSQL + ',PLACTAACJUD13 = '''+Trim(edContaContabilAcaoJudicial.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACTAACJUD   = NULL'
    else
      sSQL := sSQL + ',PLACTAACJUD13 = NULL';
  end;


  if Trim(edPLACONTACADT13.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACADT13   = '''+Trim(edPLACONTACADT13.Text)+''''
    else
      sSQL := sSQL + ',PLACONTACADT13 = '''+Trim(edPLACONTACADT13.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACADT13   = NULL'
    else
      sSQL := sSQL + ',PLACONTACADT13 = NULL';
  end;

  if Trim(edContaContabilProvisD.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADPROVIS    = '''+Trim(edContaContabilProvisD.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADPROVIS13  = '''+Trim(edContaContabilProvisD.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADPROVIS    = NULL'
    else
      sSQL := sSQL + ',PLACONTADPROVIS13  = NULL';
  end;

  if Trim(edContaContabilProvisC.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACPROVIS   = '''+Trim(edContaContabilProvisC.Text)+''''
    else
      sSQL := sSQL + ',PLACONTACPROVIS13 = '''+Trim(edContaContabilProvisC.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACPROVIS   = NULL'
    else
      sSQL := sSQL + ',PLACONTACPROVIS13 = NULL';
  end;

  if Trim(edContaContabilProvisPD.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADPROVADT = '''+Trim(edContaContabilProvisPD.Text)+''''
    else
      sSQL := sSQL + ',PLACTDPROVADT13  = '''+Trim(edContaContabilProvisPD.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADPROVADT = NULL'
    else
      sSQL := sSQL + ',PLACTDPROVADT13  = NULL';
  end;

  if Trim(edContaContabilProvisPC.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACPROVADT = '''+Trim(edContaContabilProvisPC.Text)+''''
    else
      sSQL := sSQL + ',PLACTCPROVADT13  = '''+Trim(edContaContabilProvisPC.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTACPROVADT = NULL'
    else
      sSQL := sSQL + ',PLACTCPROVADT13  = NULL';
  end;

  if Trim(edContaContabilDevol.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADEVOL   = '''+Trim(edContaContabilDevol.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADEVOL13 = '''+Trim(edContaContabilDevol.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADEVOL   = NULL'
    else
      sSQL := sSQL + ',PLACONTADEVOL13 = NULL';
  end;

  if Trim(edContaContabilDevolPatro.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADEVOLPAT  = '''+Trim(edContaContabilDevolPatro.Text)+''''
    else
      sSQL := sSQL + ',PLACTDEVOLPAT13   = '''+Trim(edContaContabilDevolPatro.Text)+'''';
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',PLACONTADEVOLPAT = NULL'
    else
      sSQL := sSQL + ',PLACTDEVOLPAT13  = NULL';
  end;

  if Trim(lkcmbDescAtividade.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',UNIDNEGOC   = '+dtmIntegraCAPCAR.qryAtividade.FieldByName('UNIDNEGOC').AsString
    else
      sSQL := sSQL + ',UNIDNEGOC13 = '+dtmIntegraCAPCAR.qryAtividade.FieldByName('UNIDNEGOC').AsString;
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',UNIDNEGOC   = NULL'
    else
      sSQL := sSQL + ',UNIDNEGOC13 = NULL';
  end;

  if Trim(dblkpcmbPortForma.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODPORTFORMA   = '+dtmIntegraCAPCAR.qryformapag.FieldByName('CODPORTFORMA').AsString
    else
      sSQL := sSQL + ',CODPORTFORMA13 = '+dtmIntegraCAPCAR.qryformapag.FieldByName('CODPORTFORMA').AsString;
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODPORTFORMA   = NULL'
    else
      sSQL := sSQL + ',CODPORTFORMA13 = NULL';
  end;

  if Trim(cmbcentrespon.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODCENTRORESPON   = '''+dtmIntegraCAPCAR.qrycentrespon.FieldByName('CODCENTRORESPON').AsString+''''
    else
      sSQL := sSQL + ',CODCENTRORESPON13 = '''+dtmIntegraCAPCAR.qrycentrespon.FieldByName('CODCENTRORESPON').AsString+''''
  end
  else
  begin
     if sbtnSelContribuicao.Down then
       sSQL := sSQL + ',CODCENTRORESPON   = NULL'
     else
       sSQL := sSQL + ',CODCENTRORESPON13 = NULL';
  end;


  if Trim(dblkpcmbContribCCusto.Text) <> '' then
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODCENTROCUSTOD  = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+''''
    else
    //SOL124865 -  Ádler Souza
    begin
      //sSQL := sSQL + ',CODCENTROCUSTOD  = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+'''';
      sSQL := sSQL + ',CODCENTROCUSTOD13 = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+'''';
      sSQL := sSQL + ',CODCENTROCUSTOC13 = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+'''';
    end;
    //Fim - SOL124865 -  Ádler Souza
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODCENTROCUSTOD  = NULL'
    else
    //SOL124865 -  Ádler Souza
    begin
      //sSQL := sSQL + ',CODCENTROCUSTOD  = NULL';
      sSQL := sSQL + ',CODCENTROCUSTOD13  = NULL';
      sSQL := sSQL + ',CODCENTROCUSTOC13  = NULL';
    end;
    //Fim - SOL124865 -  Ádler Souza
  end;

  if Trim(edTpReceb1.Text) <> '' then
  begin
    if qryTpReceb.Locate('DESCRICAO', Trim(edTpReceb1.Text),[loCaseInsensitive]) then
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPRECDES   = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODTIPRECDES13 = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPRECDES   = NULL'
      else
        sSQL := sSQL + ',CODTIPRECDES13 = NULL'
     end
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODTIPRECDES   = NULL'
    else
      sSQL := sSQL + ',CODTIPRECDES13 = NULL';
  end;

  if Trim(edTpDesemb1.Text) <> '' then
  begin
     
    if qryTpPaga.Locate('DESCRICAO', Trim(Copy(edTpDesemb1.Text,1,34)),[loCaseInsensitive, loPartialKey]) then
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPDESEMBCAR  = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODTIPDESEMB13   = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPDESEMBCAR  = NULL'
      else
        sSQL := sSQL + ',CODTIPDESEMB13   = NULL';
     end
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODTIPDESEMBCAR = NULL'
    else
      sSQL := sSQL + ',CODTIPDESEMB13  = NULL';
  end;

  if Trim(edTpDesemb2.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesemb2.Text),[loCaseInsensitive]) then
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPDESEMBDEVOL = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODDESEMBDEV13    = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
     end
     else
     begin
       if sbtnSelContribuicao.Down then
         sSQL := sSQL + ',CODTIPDESEMBDEVOL = NULL'
       else
         sSQL := sSQL + ',CODDESEMBDEV13    = NULL';
     end
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODTIPDESEMBDEVOL = NULL'
    else
      sSQL := sSQL + ',CODDESEMBDEV13    = NULL';
  end;

  
  if Trim(edTpReceb2.Text) <> ''
  then begin
     if qryTpReceb.Locate('DESCRICAO', Trim(edTpReceb2.Text),[loCaseInsensitive])
     then begin
        if sbtnSelContribuicao.Down then
          sSQL := sSQL + ',CODTIPRECEBDEV   = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
        else
          sSQL := sSQL + ',CODTIPRECEBDEV13 = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
     end
     else begin
        if sbtnSelContribuicao.Down then
          sSQL := sSQL + ',CODTIPRECEBDEV   = NULL'
        else
          sSQL := sSQL + ',CODTIPRECEBDEV13 = NULL';
     end
  end
  else begin
     if sbtnSelContribuicao.Down then
       sSQL := sSQL + ',CODTIPRECEBDEV   = NULL'
     else
       sSQL := sSQL + ',CODTIPRECEBDEV13 = NULL';
  end;

  if Trim(edTpDesemb3.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesemb3.Text),[loCaseInsensitive]) then
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPDESEMBPROV = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODDESEMBPROV13  = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPDESEMBPROV = NULL'
      else
        sSQL := sSQL + ',CODDESEMBPROV13  = NULL';
     end
  end
  else
  begin
     if sbtnSelContribuicao.Down then
       sSQL := sSQL + ',CODTIPDESEMBPROV = NULL'
     else
       sSQL := sSQL + ',CODDESEMBPROV13  = NULL';
  end;

  if Trim(edTpDesemb4.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesemb4.Text),[loCaseInsensitive]) then
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPRECDESADT = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODTIPRECADT13  = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelContribuicao.Down then
        sSQL := sSQL + ',CODTIPRECDESADT = NULL'
      else
        sSQL := sSQL + ',CODTIPRECADT13  = NULL';
     end
  end
  else
  begin
    if sbtnSelContribuicao.Down then
      sSQL := sSQL + ',CODTIPRECDESADT = NULL'
    else
      sSQL := sSQL + ',CODTIPRECADT13  = NULL';
  end;

  //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
  if Trim(edTpDesemb8.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesemb8.Text),[loCaseInsensitive]) then begin
      sSQL := sSQL + ',CODTIPREDDESPGAPAGAR = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
      sSQL := sSQL + ',RECPAGPGAPAGAR = ''P''';
    end else begin
      sSQL := sSQL + ',CODTIPREDDESPGAPAGAR = NULL';
      sSQL := sSQL + ',RECPAGPGAPAGAR = NULL';
    end;
  end else begin
    sSQL := sSQL + ',CODTIPREDDESPGAPAGAR = NULL';
    sSQL := sSQL + ',RECPAGPGAPAGAR = NULL';
  end;

  if Trim(edTpReceb5.Text) <> '' then
  begin
    if qryTpReceb.Locate('DESCRICAO', Trim(edTpReceb5.Text),[loCaseInsensitive]) then begin
      sSQL := sSQL + ',CODTIPREDDESPGARECEBER = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
      sSQL := sSQL + ',RECPAGPGARECEBER = ''R''';
    end else begin
      sSQL := sSQL + ',CODTIPREDDESPGARECEBER = NULL';
      sSQL := sSQL + ',RECPAGPGARECEBER = NULL';
    end;
  end else begin
    sSQL := sSQL + ',CODTIPREDDESPGARECEBER = NULL';
    sSQL := sSQL + ',RECPAGPGARECEBER = NULL';
  end;

  if Trim(edTpDesemb9.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesemb9.Text),[loCaseInsensitive]) then begin
      sSQL := sSQL + ',CODTIPREDDESPGADEVOLPAGAR = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
      sSQL := sSQL + ',RECPAGPGADEVOLPAGAR = ''P''';
    end else begin
      sSQL := sSQL + ',CODTIPREDDESPGADEVOLPAGAR = NULL';
      sSQL := sSQL + ',RECPAGPGADEVOLPAGAR = NULL';
    end;
  end else begin
    sSQL := sSQL + ',CODTIPREDDESPGADEVOLPAGAR = NULL';
    sSQL := sSQL + ',RECPAGPGADEVOLPAGAR = NULL';
  end;

  if Trim(edTpReceb6.Text) <> '' then
  begin
    if qryTpReceb.Locate('DESCRICAO', Trim(edTpReceb6.Text),[loCaseInsensitive]) then begin
      sSQL := sSQL + ',CODTIPREDDESPGADEVOLRECEBER = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
      sSQL := sSQL + ',RECPAGPGADEVOLRECEBER = ''R''';
    end else begin
      sSQL := sSQL + ',CODTIPREDDESPGADEVOLRECEBER = NULL';
      sSQL := sSQL + ',RECPAGPGADEVOLRECEBER = NULL';
    end;
  end else begin
    sSQL := sSQL + ',CODTIPREDDESPGADEVOLRECEBER = NULL';
    sSQL := sSQL + ',RECPAGPGADEVOLRECEBER = NULL';
  end;
  //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

  //   --------------------------------------------------------------------
  //   TRATAMENTO DE CAMPOS COMUNS ENTRE VÁRIAS CONSTRAINTS
  //   --------------------------------------------------------------------
  //   Nome Do Campo       Nome Do RoleName    Nome Do RoleName  Componente
  //   Principal           Para IdPessoa       Para RecPag
  //   --------------------------------------------------------------------
  //   CODSUBCONTA         IDEMPRESAPROP       -                 dblkSubconta
  //   CODSUBCONTA13       IDEMPRESAPROP13     -                 dblkSubconta
  //   CODCENTRORESPON     IDEMPRESAPROP       -                 cmbCentRespon
  //   CODCENTROCUSTOD     IDEMPERSA           -                 dblkpcmbContribCCusto
  //   CODCENTRORESPON13   IDEMPRESAPROP13     -                 cmbCentRespon
  //   CODTIPRECDES        IDEMPRESAPROP       RECPAG            edTpReceb1
  //   CODTIPRECDES13      IDEMPRESAPROP       RECPAG            edTpReceb1
  //   CODTIPRECDESADT     IDEMPRESAPROP       RECPAG            edTpDesemb4
  //   CODTIPRECADT13      IDEMPRESAPROP       RECPAG            edTpDesemb4
  //   CODTIPDESEMBCAR     IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb1
  //   CODTIPDESEMB13      IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb1
  //   CODTIPDESEMBDEVOL   IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb2
  //   CODDESEMBDEV13      IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb2
  //   CODTIPDESEMBPROV    IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb3
  //   CODDESEMBPROV13     IDEMPRESADESEMB     RECPAGDESEMB      edTpDesemb3
  if  (Trim(edTpReceb1.Text)   <> '')                                    or
      (Trim(edTpReceb2.Text)   <> '')                                    or
      (Trim(edTpDesemb4.Text)  <> '')                                    or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDES').AsString    <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDES13').AsString  <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDESADT').AsString <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECADT13').AsString  <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECEBDEV').AsString  <> '')  or 
      (dsContrib.DataSet.FieldbyName('CODTIPRECEBDEV13').AsString  <> '') then 
    sSQL := sSQL + ',RECPAG        = ''R'''
  else
    sSQL := sSQL + ',RECPAG        = NULL';

  if  (Trim(edTpReceb1.Text)   <> '')                                       or
      (Trim(edTpDesemb4.Text)  <> '')                                       or
      ((Trim(dblkSubconta.Text) <> '') and (sbtnSelContribuicao.Down) )     or
      ((Trim(cmbCentRespon.Text)<> '') and (sbtnSelContribuicao.Down) )     or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDES').AsString       <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDES13').AsString     <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECDESADT').AsString    <> '')  or
      (dsContrib.DataSet.FieldbyName('CODTIPRECADT13').AsString     <> '')  or
      (dsContrib.DataSet.FieldbyName('CODSUBCONTA').AsString        <> '')  or
      (dsContrib.DataSet.FieldbyName('CODCENTRORESPON').AsString    <> '') then
    sSQL := sSQL + ',IDEMPRESAPROP = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESAPROP = NULL';

  if  ((Trim(dblkSubconta.Text) <> '') and (sbtnSelContribuicao13.Down) )     or
      ((Trim(cmbCentRespon.Text)<> '') and (sbtnSelContribuicao13.Down) )     or
      (dsContrib.DataSet.FieldbyName('CODSUBCONTA13').AsString        <> '')  or
      (dsContrib.DataSet.FieldbyName('CODCENTRORESPON13').AsString    <> '') then
    sSQL := sSQL + ',IDEMPRESAPROP13 = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESAPROP13 = NULL';

  if  (Trim(edTpDesemb1.Text) <> '')                                      or
      (Trim(edTpDesemb2.Text) <> '')                                      or
      (Trim(edTpDesemb3.Text) <> '')                                      or
      (dsContrib.DataSet.FieldbyName('CODTIPDESEMBCAR').AsString   <> '') or
      (dsContrib.DataSet.FieldbyName('CODTIPDESEMB13').AsString    <> '') or
      (dsContrib.DataSet.FieldbyName('CODTIPDESEMBDEVOL').AsString <> '') or
      (dsContrib.DataSet.FieldbyName('CODDESEMBDEV13').AsString    <> '') or
      (dsContrib.DataSet.FieldbyName('CODTIPDESEMBPROV').AsString  <> '') or
      (dsContrib.DataSet.FieldbyName('CODDESEMBPROV13').AsString   <> '') then
  begin
     sSQL := sSQL + ',IDEMPRESADESEMB  = '+IntToStr(Sistema.IdEmpresa);
     sSQL := sSQL + ',RECPAGDESEMB     = ''P'''
  end
  else
  begin
     sSQL := sSQL + ',IDEMPRESADESEMB  = NULL';
     sSQL := sSQL + ',RECPAGDESEMB     = NULL';
  end;

  
  if  (Trim(dblkpcmbContribCCusto.Text) <> '') then
    sSQL := sSQL + ',IDEMPRESA     = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESA     = NULL ';

  if (Trim(edContaContabil1.Text)                                 <> '')     or
     (Trim(edContaContabil.Text)                                  <> '')     or
     (Trim(edContaContabilFolhaAtrasado.Text)                     <> '')     or
     (Trim(edContaContabilAcaoJudicial.Text)                      <> '')     or
     (Trim(edPLACONTACADT13.Text)                                 <> '')     or 
     (Trim(edContaContabilProvisD.Text)                           <> '')     or
     (Trim(edContaContabilProvisC.Text)                           <> '')     or
     (Trim(edContaContabilProvisPD.Text)                          <> '')     or
     (Trim(edContaContabilProvisPC.Text)                          <> '')     or
     (Trim(edContaContabilDevol.Text)                             <> '')     or
     (Trim(edContaContabilDevolPatro.Text)                        <> '')     or
     
     (dsContrib.DataSet.FieldbyName('CODTIPRECDES13').AsString    <> '')     or

     (dsContrib.DataSet.FieldbyName('PLACONTAC').AsString         <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTAD').AsString         <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTAOUTROMES').AsString  <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACTAOUTROMES13').AsString  <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACTAACJUD').AsString       <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTACADT13').AsString    <> '')     or 
     (dsContrib.DataSet.FieldbyName('PLACTAACJUD13').AsString     <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADPROVIS').AsString   <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADPROVIS13').AsString <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTACPROVIS').AsString   <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTACPROVIS13').AsString <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADPROVADT').AsString  <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACTDPROVADT13').AsString   <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTACPROVADT').AsString  <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACTCPROVADT13').AsString   <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADEVOL').AsString     <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADEVOL13').AsString   <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACONTADEVOLPAT').AsString  <> '')     or
     (dsContrib.DataSet.FieldbyName('PLACTDEVOLPAT13').AsString   <> '') then
    sSQL := sSQL + ',PLANO   = '+IntToStr(IntegraBack.Plano)
  else
    sSQL := sSQL + ',PLANO   = NULL ';

  if (sbtnSelContribuicao13.Down) and 
     ((Trim(edContaContabil1.Text)                                 <> '')     or
      (Trim(edContaContabil.Text)                                  <> '')     or
      (dsContrib.DataSet.FieldbyName('PLACONTAC13').AsString       <> '')     or
      (dsContrib.DataSet.FieldbyName('PLACONTAD13').AsString       <> '') ) then
    sSQL := sSQL + ',PLANO13   = '+IntToStr(IntegraBack.Plano)
  else
    sSQL := sSQL + ',PLANO13   = NULL ';

  //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
  begin
          if Trim(edContaProvPerda.Text) <> '' then
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTAPROVPERDA     = '''+Trim(edContaProvPerda.Text)+''''
            else
              sSQL := sSQL + ',PLACONTAPROVPERDA13   = '''+Trim(edContaProvPerda.Text)+''''
          end
          else
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTAPROVPERDA     = NULL'
            else
              sSQL := sSQL + ',PLACONTAPROVPERDA13   = NULL';
          end;

          if Trim(edContaProvPerdaD.Text) <> '' then
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTADREVERSAO     = '''+Trim(edContaProvPerdaD.Text)+''''
            else
              sSQL := sSQL + ',PLACONTADREVERSAO13   = '''+Trim(edContaProvPerdaD.Text)+''''
          end
          else
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTADREVERSAO     = NULL'
            else
              sSQL := sSQL + ',PLACONTADREVERSAO13   = NULL';
          end;
          
          if Trim(edContaProvPerdaC.Text) <> '' then
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTACREVERSAO     = '''+Trim(edContaProvPerdaC.Text)+''''
            else
              sSQL := sSQL + ',PLACONTACREVERSAO13   = '''+Trim(edContaProvPerdaC.Text)+''''
          end
          else
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',PLACONTACREVERSAO     = NULL'
            else
              sSQL := sSQL + ',PLACONTACREVERSAO13   = NULL';
          end;
          
          if Trim(edTpRecebEmAtraso.Text) <> '' then
          begin
            if qryTpReceb.Locate('DESCRICAO', Trim(edTpRecebEmAtraso.Text),[loCaseInsensitive]) then
            begin
              if sbtnSelContribuicao.Down then
                sSQL := sSQL + ',CODTIPORECEBATRASO   = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
              else
                sSQL := sSQL + ',CODTIPORECEBATRASO13 = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
             end
            else
            begin
              if sbtnSelContribuicao.Down then
                sSQL := sSQL + ',CODTIPORECEBATRASO   = NULL'
              else
                sSQL := sSQL + ',CODTIPORECEBATRASO13 = NULL'
             end
          end
          else
          begin
            if sbtnSelContribuicao.Down then
              sSQL := sSQL + ',CODTIPORECEBATRASO   = NULL'
            else
              sSQL := sSQL + ',CODTIPORECEBATRASO13 = NULL';
          end;

          if Trim(edTpDesembEmAtraso.Text) <> '' then
          begin
            if qryTpPaga.Locate('DESCRICAO', Trim(edTpDesembEmAtraso.Text),[loCaseInsensitive]) then
            begin
              if sbtnSelContribuicao.Down then
                sSQL := sSQL + ',CODTIPODESEMATRASO = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
              else
                sSQL := sSQL + ',CODTIPODESEMATRASO13  = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
             end
            else
            begin
              if sbtnSelContribuicao.Down then
                sSQL := sSQL + ',CODTIPODESEMATRASO = NULL'
              else
                sSQL := sSQL + ',CODTIPODESEMATRASO13  = NULL';
             end
          end
          else
          begin
             if sbtnSelContribuicao.Down then
               sSQL := sSQL + ',CODTIPODESEMATRASO = NULL'
             else
               sSQL := sSQL + ',CODTIPODESEMATRASO13  = NULL';
          end;
          
  end;
  //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948

  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2 then
    sSQL := sSQL + ' WHERE IDPLANOPREV    = '+dsContrib.DataSet.FieldByName('IDPLANOPREV').AsString+
                      ' AND   IDCONTRIBUICAO = '+dsContrib.DataSet.FieldByName('IDCONTRIBUICAO').AsString
  else
    if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
      sSQL := sSQL + ' WHERE IDPESSJUR      = '+dsContrib.DataSet.FieldByName('IDPESSJUR').AsString+
                      ' AND   IDPLANOPREV    = '+dsContrib.DataSet.FieldByName('IDPLANOPREV').AsString+
                      ' AND   IDCONTRIBUICAO = '+dsContrib.DataSet.FieldByName('IDCONTRIBUICAO').AsString
    else
      if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4 then
      begin
        if MontaSelectPessoa.ValoresChave[2] = MontaSelectPessoa.ValoresChave[4] then
          sSQL := sSQL + ' WHERE IDPESSJUR      = '+dsContrib.DataSet.FieldByName('IDPESSJUR').AsString+
                         ' AND   IDPLANOPREV    = '+dsContrib.DataSet.FieldByName('IDPLANOPREV').AsString+
                         ' AND   IDPESSOA       = '+dsContrib.DataSet.FieldByName('IDPESSOA').AsString+
                         ' AND   IDCONTRIBUICAO = '+dsContrib.DataSet.FieldByName('IDCONTRIBUICAO').AsString
        else
          sSQL := sSQL + ' WHERE IDNUCLEOFAMILIAR = '+ClienteNumero(qryBuscaNucleo.FieldByName('IDNUCLEOFAMILIAR').AsString);
  end;

  qryGrava.Close;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(sSQL);

  try
     qryGrava.ExecSQL;
  except

    Exit;

  end;

  bkMark := dsContrib.DataSet.GetBookmark;
  dsContrib.DataSet.Close;
  dsContrib.DataSet.Open;
  dsContrib.DataSet.GotoBookmark(bkMark);

  Result := True;
end;

function TfrmCadIntegracaoPREV.GravaCamposBeneficio : boolean;
var sSQL   : string;
    bkMark : TBookMark;
begin
  Result := False;

  // ***************************************************************************
  // GRAVAR BENEFICIOS
  // ( obs. ver no final do codigo as constraints pois existem várias
  //   constraints usando o mesmo rolename )
  // ***************************************************************************

  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2 then
    sSQL := 'UPDATE BENEFPLANPREV  SET '
  else
    if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
      sSQL := 'UPDATE BENEFPLANPATRO SET '
    else
      if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4 then
        sSQL := 'UPDATE BENEFBFCIARIO  SET ';

  if Trim(dblkSubcontaBenef.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + 'CODSUBCONTA     = '+dtmIntegraCAPCAR.qrySubConta.FieldByName('CODSUBCONTA').AsString
    else
      sSQL := sSQL + 'CODSUBCONTAABN  = '+dtmIntegraCAPCAR.qrySubConta.FieldByName('CODSUBCONTA').AsString
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + 'CODSUBCONTA     = NULL'
    else
      sSQL := sSQL + 'CODSUBCONTAABN  = NULL';
  end;


  if (dblkpcmbPlanPrevContabBenef.Visible) and (Trim(dblkpcmbPlanPrevContabBenef.Text) <> '') then
    sSQL := sSQL + ',IDPLANPREVCONTAB = '+dtmIntegraCAPCAR.qryPlanPrevContab.FieldByName('IDPLANPREVCONTAB').AsString
  else
    sSQL := sSQL + ',IDPLANPREVCONTAB = NULL';

  if Trim(edPlaContaCBenef.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTAC      = '''+Trim(edPlaContaCBenef.Text)+''''
    else
      sSQL := sSQL + ',PLACONTACABN   = '''+Trim(edPlaContaCBenef.Text)+''''
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTAC      = NULL'
    else
      sSQL := sSQL + ',PLACONTACABN   = NULL';
  end;

  
  if Trim(edPlaContaDevol.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTADEVOL      = '''+Trim(edPlaContaDevol.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADEVOL      = '''+Trim(edPlaContaDevol.Text)+''''
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTADEVOL  = NULL'
    else
      sSQL := sSQL + ',PLACONTADEVOL  = NULL';
  end;
  

  if Trim(edPlaContaDBenef.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTAD     = '''+Trim(edPlaContaDBenef.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADABN  = '''+Trim(edPlaContaDBenef.Text)+''''
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTAD     = NULL'
    else
      sSQL := sSQL + ',PLACONTADABN  = NULL';
  end;


  if Trim(edPLACTAACJUD.Text) <> ''
  then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACTAACJUD   = '''+Trim(edPLACTAACJUD.Text)+''''
    else
      sSQL := sSQL + ',PLACTAACJUD13 = '''+Trim(edPLACTAACJUD.Text)+'''';
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACTAACJUD   = NULL'
    else
      sSQL := sSQL + ',PLACTAACJUD13 = NULL';
  end;


  if Trim(edPLACONTADADT13.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',PLACONTADADT13   = '''+Trim(edPLACONTADADT13.Text)+''''
    else
      sSQL := sSQL + ',PLACONTADADT13 = '''+Trim(edPLACONTADADT13.Text)+'''';
  end
  else
  begin
    if sbtnSelBeneficio13.Down then
      sSQL := sSQL + ',PLACONTADADT13   = NULL'
    else
      sSQL := sSQL + ',PLACONTADADT13 = NULL';
  end;

  if edPLACONTADPROVIS.Visible then
  begin
    if Trim(edPLACONTADPROVIS.Text) <> '' then
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTADPROVIS    = '''+Trim(edPLACONTADPROVIS.Text)+'''';
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTADPROVIS    = NULL';
     end
  end;

  
  if (edPLACONTACPROVIS.Visible) then
  begin
    if Trim(edPLACONTACPROVIS.Text) <> '' then
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTACPROVIS   = '''+Trim(edPLACONTACPROVIS.Text)+'''';
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTACPROVIS   = NULL';
     end;
  end;

  if (edPLACONTADPROVADT.Visible) then
  begin
    if Trim(edPLACONTADPROVADT.Text) <> '' then
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTADPROVADT   = '''+Trim(edPLACONTADPROVADT.Text)+'''';
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',PLACONTADPROVADT   = NULL';
     end;
  end;

  if Trim(lkcmbDescAtividadeBenef.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',UNIDNEGOC    = '+dtmIntegraCAPCAR.qryAtividade.FieldByName('UNIDNEGOC').AsString
    else
      sSQL := sSQL + ',UNIDNEGOCABN = '+dtmIntegraCAPCAR.qryAtividade.FieldByName('UNIDNEGOC').AsString;
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',UNIDNEGOC    = NULL'
    else
      sSQL := sSQL + ',UNIDNEGOCABN = NULL';
  end;

  if Trim(dblkpcmbPortFormaBenef.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODPORTFORMA    = '+dtmIntegraCAPCAR.qryformapag.FieldByName('CODPORTFORMA').AsString
    else
      sSQL := sSQL + ',CODPORTFORMAABN = '+dtmIntegraCAPCAR.qryformapag.FieldByName('CODPORTFORMA').AsString;
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODPORTFORMA    = NULL'
    else
      sSQL := sSQL + ',CODPORTFORMAABN = NULL';
  end;

  if Trim(cmbcentresponBenef.Text) <> ''
  then begin
     if sbtnSelBeneficio.Down
    then
      sSQL := sSQL + ',CODCENTRORESPON   = '''+dtmIntegraCAPCAR.qrycentrespon.FieldByName('CODCENTRORESPON').AsString+''''
    else
      sSQL := sSQL + ',CODCENTRORESPONA  = '''+dtmIntegraCAPCAR.qrycentrespon.FieldByName('CODCENTRORESPON').AsString+''''
  end
  else begin
     if sbtnSelBeneficio.Down
    then
      sSQL := sSQL + ',CODCENTRORESPON   = NULL'
    else
      sSQL := sSQL + ',CODCENTRORESPONA  = NULL';
  end;

  
  if Trim(dblkpcmbBenefCCusto.Text) <> '' then
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODCENTROCUSTOD  = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+''''
    else
      sSQL := sSQL + ',CODCENTROCUSTOD  = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+''''
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODCENTROCUSTOD  = NULL'
    else
      sSQL := sSQL + ',CODCENTROCUSTOD  = NULL';
  end;

  if Trim(edCODTIPRECDESBenef.Text) <> '' then
  begin
    if qryTpPaga.Locate('DESCRICAO', Trim(edCODTIPRECDESBenef.Text),[loCaseInsensitive]) then
    begin
       if sbtnSelBeneficio.Down then
         sSQL := sSQL + ',CODTIPRECDES    = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+''''
       else
         sSQL := sSQL + ',CODTIPRECDESABN = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',CODTIPRECDES    = NULL'
      else
        sSQL := sSQL + ',CODTIPRECDESABN = NULL'
     end
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODTIPRECDES   = NULL'
    else
      sSQL := sSQL + ',CODTIPRECDESABN = NULL';
  end;

  if Trim(edCODTIPRECEBCAP.Text) <> '' then
  begin
    if qryTpReceb.Locate('DESCRICAO', Trim(edCODTIPRECEBCAP.Text),[loCaseInsensitive]) then
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',CODTIPRECEBCAP     = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
      else
        sSQL := sSQL + ',CODTIPRECEBCAP13   = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',CODTIPRECEBCAP     = NULL'
      else
        sSQL := sSQL + ',CODTIPRECEBCAP13   = NULL';
     end
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODTIPRECEBCAP        = NULL'
    else
      sSQL := sSQL + ',CODTIPRECEBCAP13      = NULL';
  end;

  if edCODTIPDESEMBPROV.Visible then
  begin
    if Trim(edCODTIPDESEMBPROV.Text) <> '' then
    begin
       if qryTpPaga.Locate('DESCRICAO', Trim(edCODTIPDESEMBPROV.Text),[loCaseInsensitive]) then
       begin
         if sbtnSelBeneficio.Down then
           sSQL := sSQL + ',CODTIPDESEMBPROV = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
        end
       else
       begin
         if sbtnSelBeneficio.Down then
           sSQL := sSQL + ',CODTIPDESEMBPROV = NULL';
        end
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',CODTIPDESEMBPROV = NULL';
     end;
  end;

  if edCODTIPRECDESADT.Visible then
  begin
    if Trim(edCODTIPRECDESADT.Text) <> '' then
    begin
       if qryTpPaga.Locate('DESCRICAO', Trim(edCODTIPRECDESADT.Text),[loCaseInsensitive]) then
       begin
         if sbtnSelBeneficio.Down then
           sSQL := sSQL + ',CODTIPRECDESADT = '''+qryTpPaga.FieldByName('CODTIPRECDES').AsString+'''';
        end
       else
       begin
         if sbtnSelBeneficio.Down then
           sSQL := sSQL + ',CODTIPRECDESADT = NULL';
        end
     end
    else
    begin
      if sbtnSelBeneficio.Down then
        sSQL := sSQL + ',CODTIPRECDESADT = NULL';
     end;
  end;

  if Trim(edCODTIPRECEBDEVOLBenef.Text) <> '' then
  begin
    if qryTpReceb.Locate('DESCRICAO', Trim(edCODTIPRECEBDEVOLBenef.Text),[loCaseInsensitive]) then
    begin
       if sbtnSelBeneficio.Down then
         sSQL := sSQL + ',CODTIPRECEBDEVOL = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
       else
         sSQL := sSQL + ',CODRECEBCAPABN   = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+'''';
     end
    else
    begin
       if sbtnSelBeneficio.Down then
         sSQL := sSQL + ',CODTIPRECEBDEVOL = NULL'
       else
         sSQL := sSQL + ',CODRECEBCAPABN   = NULL';
     end
  end
  else
  begin
    if sbtnSelBeneficio.Down then
      sSQL := sSQL + ',CODTIPRECEBDEVOL    = NULL'
    else
      sSQL := sSQL + ',CODRECEBCAPABN      = NULL';
  end;


  //   --------------------------------------------------------------------
  //   TRATAMENTO DE CAMPOS COMUNS ENTRE VÁRIAS CONSTRAINTS
  //   --------------------------------------------------------------------
  //   Nome Do Campo       Nome Do RoleName    Nome Do RoleName  Componente
  //   Principal           Para IdPessoa       Para RecPag
  //                       Ou Plano Contabil
  //   --------------------------------------------------------------------
  //   CODCENTRORESPON     IDEMPRESAPROP       -                 cmbcentresponBenef
  //   CODCENTROCUSTOD     IDEMPRESA           -                 dblkpcmbBenefCCusto
  //   CODCENTRORESPONA    IDEMPRESAPROPABN    -                 cmbcentresponBenef
  //   CODSUBCONTA         IDEMPRESAPROP       -                 dblkSubcontaBenef
  //   CODSUBCONTAABN      IDEMPRESAPROPABN    -                 dblkSubcontaBenef
  //   PLACONTAC           PLANO               -                 edPlaContaCBenef
  //   PLACONTAD           PLANO               -                 edPlaContaDBenef
  //   PLACONTACABN        PLANO               -                 edPlaContaCBenef
  //   PLACONTADABN        PLANO               -                 edPlaContaDBenef
  //   PLACTAACJUD         PLANO               -                 edPLACTAACJUD
  //   PLACONTADADT13      PLANO               -                 edPLACONTADADT13 
  //   PLACTAACJUD13       PLANO               -                 edPLACTAACJUD
  //   PLACONTADPROVIS     PLANO               -                 edPLACONTADPROVIS
  //   PLACONTACPROVIS     PLANO               -                 edPLACONTACPROVIS
  //   PLACONTADPROVADT    PLANO               -                 edPLACONTADPROVADT
  //   PLACONTACPROVADT    PLANO               -                 edPLACONTACPROVADT
  //   PLACONTADEVOL       PLANO               -                 edPLACONTADEVOL  
  //   CODTIPRECDES        IDEMPRESADESEMB     RECPAGDESEMB      edCODTIPRECDESBenef
  //   CODTIPRECDESABN     IDEMPRESADESEMB     RECPAGDESEMB      edCODTIPRECDESBenef
  //   CODTIPDESEMBPROV    IDEMPRESADESEMB     RECPAGDESEMB      edCODTIPDESEMBPROV
  //   CODTIPRECDESADT     IDEMPRESADESEMB     RECPAGDESEMB      edCODTIPRECDESADT
  //   CODTIPRECEBCAP      IDEMPRESAPROP       RECPAG            edCODTIPRECEBCAP
  //   CODTIPRECEBCAP13    IDEMPRESAPROP       RECPAG            edCODTIPRECEBCAP
  //   CODTIPRECEBDEVOL    IDEMPRESAPROP       RECPAG            edCODTIPRECEBDEVOLBenef
  //   CODRECEBCAPABN      IDEMPRESAPROP       RECPAG            edCODTIPRECEBDEVOLBenef

  if  (Trim(edCODTIPRECDESBenef.Text)  <> '')                          or
      (Trim(edCODTIPRECDESBenef.Text)  <> '')                          or
      (Trim(edCODTIPDESEMBPROV.Text)   <> '')                          or
      (Trim(edCODTIPRECDESADT.Text)    <> '')                          or
      (dsBenef.DataSet.FieldbyName('CODTIPRECDES').AsString     <> '') or
      ( (sbtnSelBeneficio.Down) and (dsBenef.DataSet.FieldbyName('CODTIPRECDES').AsString <>  '') ) or
      (dsBenef.DataSet.FieldbyName('CODTIPDESEMBPROV').AsString <> '') or
      (dsBenef.DataSet.FieldbyName('CODTIPRECDESADT').AsString  <> '') then
    sSQL := sSQL + ',RECPAGDESEMB        = ''P'''
  else
    sSQL := sSQL + ',RECPAGDESEMB        = NULL';

  if  (Trim(edCODTIPRECDESBenef.Text)  <> '')                          or
      (Trim(edCODTIPRECDESBenef.Text)  <> '')                          or
      (Trim(edCODTIPDESEMBPROV.Text)   <> '')                          or
      (Trim(edCODTIPRECDESADT.Text)    <> '')                          or
      (dsBenef.DataSet.FieldbyName('CODTIPRECDES').AsString     <> '') or
      ( (sbtnSelBeneficio.Down) and (dsBenef.DataSet.FieldbyName('CODTIPRECDES').AsString <>  '') ) or
      (dsBenef.DataSet.FieldbyName('CODTIPDESEMBPROV').AsString <> '') or
      (dsBenef.DataSet.FieldbyName('CODTIPRECDESADT').AsString  <> '') then
    sSQL := sSQL + ',IDEMPRESADESEMB     = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESADESEMB     = NULL';

  // CAMILLE - 22.03.2004
  if  (Trim(dblkpcmbBenefCCusto.Text) <> '') then
    sSQL := sSQL + ',IDEMPRESA     = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESA     = NULL ';

  if  (Trim(cmbcentresponBenef.Text)      <> '')                                or
      (Trim(dblkSubcontaBenef.Text)       <> '')                                or
      ((Trim(edCODTIPRECEBCAP.Text)       <> '') and (sbtnSelBeneficio.Down) )  or
      ((Trim(edCODTIPRECEBDEVOLBenef.Text)<> '') and (sbtnSelBeneficio.Down) )  or
      (dsBenef.DataSet.FieldbyName('CODCENTRORESPON').AsString       <> '')     or
      (dsBenef.DataSet.FieldbyName('CODSUBCONTA').AsString           <> '')     or
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBCAP').AsString        <> '')     or
      
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBCAP').AsString      <> '')     or
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBDEVOL').AsString      <> '')     or
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBDEVOL').AsString      <> '')     then
    sSQL := sSQL + ',IDEMPRESAPROP = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESAPROP = NULL';

  if  ((Trim(dblkSubcontaBenef.Text) <> '') and (sbtnSelBeneficio13.Down) )     or
      ((Trim(dblkSubcontaBenef.Text) <> '') and (sbtnSelBeneficio13.Down) )     or
      
      ( ( (sbtnSelBeneficio13.Down) and
          (dsBenef.DataSet.FieldbyName('CODSUBCONTA').AsString <> '') )         or
        ( (sbtnSelBeneficio13.Down) and
          
        (dsBenef.DataSet.FieldbyName('CODCENTRORESPON').AsString      <> '')) ) Then
    sSQL := sSQL + ',IDEMPRESAPROPABN = '+IntToStr(Sistema.IdEmpresa)
  else
    sSQL := sSQL + ',IDEMPRESAPROPABN = NULL';

  if  (Trim(edCODTIPRECEBCAP.Text)       <> '')                                 or
      (Trim(edCODTIPRECEBDEVOLBenef.Text)<> '')                                 or
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBCAP').AsString        <> '')     or
      
      ((sbtnSelBeneficio13.Down) and (dsBenef.DataSet.FieldbyName('CODTIPRECEBCAP').AsString <> ''))     or
      (dsBenef.DataSet.FieldbyName('CODTIPRECEBDEVOL').AsString      <> '')     or
      
      ( (sbtnSelBeneficio13.Down) and (dsBenef.DataSet.FieldbyName('CODTIPRECEBDEVOL').AsString <> '') ) then
    sSQL := sSQL + ',RECPAG        = ''R'' '
  else
    sSQL := sSQL + ',RECPAG        = NULL  ';

  if (Trim(edPlaContaCBenef.Text)                                  <> '')     or
     (Trim(edPlaContaDBenef.Text)                                  <> '')     or
     (Trim(edPlaContaCBenef.Text)                                  <> '')     or
     (Trim(edPlaContaDBenef.Text)                                  <> '')     or
     (Trim(edPLACTAACJUD.Text)                                     <> '')     or
     (Trim(edPLACONTADADT13.Text)                                  <> '')     or 
     (Trim(edPLACTAACJUD.Text)                                     <> '')     or
     (Trim(edPLACONTADPROVIS.Text)                                 <> '')     or
     (Trim(edPLACONTACPROVIS.Text)                                 <> '')     or
     (Trim(edPLACONTADPROVADT.Text)                                <> '')     or
     (Trim(edPLACONTACPROVADT.Text)                                <> '')     or
     (Trim(edPlaContaDevol.Text)                                   <> '')     or      
     (dsBenef.DataSet.FieldbyName('PLACONTAC').AsString            <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTAD').AsString            <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTAC').AsString            <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTAD').AsString            <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACTAACJUD').AsString          <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTADADT13').AsString       <> '')     or 
     (dsBenef.DataSet.FieldbyName('PLACTAACJUD').AsString          <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTADPROVIS').AsString      <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTACPROVIS').AsString      <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTADPROVADT').AsString     <> '')     or
     (dsBenef.DataSet.FieldbyName('PLACONTACPROVADT').AsString     <> '')     or
     (dsBenef.Dataset.FieldByName('PLACONTADEVOL').AsString        <> '') then        

    sSQL := sSQL + ',PLANO   = '+IntToStr(IntegraBack.Plano)
  else
    sSQL := sSQL + ',PLANO   = NULL ';


  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then
    sSQL := sSQL + ' WHERE IDPLANOPREV = '+dsBenef.DataSet.FieldByName('IDPLANOPREV').AsString+
                      ' AND   IDBENEFICIO    = '+dsBenef.DataSet.FieldByName('IDBENEFICIO').AsString
  else
    if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3 then
      sSQL := sSQL + ' WHERE IDPESSJUR   = '+dsBenef.DataSet.FieldByName('IDPESSJUR').AsString+
                      ' AND   IDPLANOPREV    = '+dsBenef.DataSet.FieldByName('IDPLANOPREV').AsString+
                      ' AND   IDBENEFICIO    = '+dsBenef.DataSet.FieldByName('IDBENEFICIO').AsString
    else
      if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4 then
      begin
     sSQL := sSQL + ' WHERE IDPESSJUR        = '+dsBenef.DataSet.FieldByName('IDPESSJUR').AsString+
                    ' AND   IDPLANOPREV      = '+dsBenef.DataSet.FieldByName('IDPLANOPREV').AsString+
                    ' AND   IDPESSOA         = '+dsBenef.DataSet.FieldByName('IDPESSOA').AsString+
                    ' AND   IDBENEFICIO      = '+dsBenef.DataSet.FieldByName('IDBENEFICIO').AsString;
  end;

  qryGrava.Close;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(sSQL);

  try
     qryGrava.ExecSQL;
  except

    Exit;

  end;

  bkMark := dsBenef.DataSet.GetBookmark;
  dsBenef.DataSet.Close;
  dsBenef.DataSet.Open;
  dsBenef.DataSet.GotoBookmark(bkMark);


  if grpPlaContaDBenefGeral.Visible then
  begin
     sSQL := ' UPDATE PLANPREVPATRO SET ';

    if Trim(edPlaContaDBenefGERAL.Text) <> '' then
    begin
        sSQL := sSQL + 'PLACONTALIQFLHBEN     = '''+Trim(edPlaContaDBenefGERAL.Text)+'''';
        sSQL := sSQL + ',PLANO   = '+IntToStr(IntegraBack.Plano);
     end
    else
    begin
        sSQL := sSQL + 'PLACONTALIQFLHBEN     = NULL';
        sSQL := sSQL + ',PLANO                = NULL';
     end;

     sSQL := sSQL + ' WHERE IDPESSJUR        = '+qryPlanPrevPatro.FieldByName('IDPESSJUR').AsString+
                    ' AND   IDPLANOPREV      = '+qryPlanPrevPatro.FieldByName('IDPLANOPREV').AsString;

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add(sSQL);

     try
        qryGrava.ExecSQL;
     except
      
      Exit;
      
     end;
     qryPlanPrevPatro.Close;
     qryPlanPrevPatro.Open;
  end;

  Result := True;
end; 

procedure TfrmCadIntegracaoPREV.sbtnSelPessoaClick(Sender: TObject);
begin
  inherited;
  MontaSelectPessoa.Executar;

  if (MontaSelectPessoa.ValoresChave.Count <=  0) or
     (MontaSelectPessoa.ValoresChave[0] = '')     then 
    Exit;

  if MontaSelectPessoa.ValoresChave[2] = MontaSelectPessoa.ValoresChave[4] then 
  begin
     edPessoa.Text := 'Matric.:'+MontaSelectPessoa.ValoresChave[5]+'-'+MontaSelectPessoa.ValoresChave[6]+'(Titular)';
  end
  else 
  begin
     edPessoa.Text := 'Matric.:'+MontaSelectPessoa.ValoresChave[5]+'-'+MontaSelectPessoa.ValoresChave[6]+'(Beneficiário)';
  end;

  
  if sbtnSelContribuicao.Down then 
    sbtnSelContribuicaoClick(Sender)
  else 
    if sbtnSelContribuicao13.Down then 
      sbtnSelContribuicao13Click(Sender)
    else 
      if sbtnSelBeneficio.Down then 
        sbtnSelBeneficioClick(Sender)
      else 
         if sbtnSelBeneficio13.Down then 
           sbtnSelBeneficio13Click(Sender);

end;

procedure TfrmCadIntegracaoPREV.sbtnTpReceb1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(1, 196, 305);
end;

procedure TfrmCadIntegracaoPREV.sbtnTpDesemb1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(1, 280, 305);
end;

procedure TfrmCadIntegracaoPREV.sbtnTpDesemb2Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(2, 202, 302);
end;


procedure TfrmCadIntegracaoPREV.sbtnTpDesemb21Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(4, 285, 251);
end;


procedure TfrmCadIntegracaoPREV.sbtnTpDesemb3Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(3, 196, 314);
end;

procedure TfrmCadIntegracaoPREV.sbtnTpDesemb4Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(4, 253, 314);
end;

procedure TfrmCadIntegracaoPREV.treeTpPagaDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
     if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then
        treeTpPagaExit(treeTpPaga)
     else Exit;
  end;
end;

procedure TfrmCadIntegracaoPREV.treeTpPagaExit(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    treeTpPaga.Visible := False;
    if (qryTpPaga.FieldByName('ANASINT').asString = 'A') then
    begin
       case treeTpPaga.Tag of
            1 : begin
                   edTpDesemb1.Text := '';
                   
                   edTpDesemb1.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            2 : begin
                   edTpDesemb2.Text := '';
                   
                   edTpDesemb2.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            3 : begin
                   edTpDesemb3.Text := '';
                   
                   edTpDesemb3.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            4 : begin
                   edTpDesemb4.Text := '';
                   
                   edTpDesemb4.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            5 : begin
                   edCODTIPRECDESBenef.Text := '';
                   
                   edCODTIPRECDESBenef.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            6 : begin
                   edCODTIPDESEMBPROV.Text := '';

                   edCODTIPDESEMBPROV.Text := qryTpPaga.FieldByName('DESCRICAO').asString
                end;
            7 : begin
                   edCODTIPRECDESADT.Text := '';

                   edCODTIPRECDESADT.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
            8 : begin
                   edTpDesemb8.Text := '';

                   edTpDesemb8.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;

            9 : begin
                   edTpDesemb9.Text := '';

                   edTpDesemb9.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

            //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
            10 : begin
                   edTpDesembEmAtraso.Text := '';

                   edTpDesembEmAtraso.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
                end;
            //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948


         end;
    end; 
  end;

end;

procedure TfrmCadIntegracaoPREV.treeTpRecebDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then
         treeTpRecebExit(treeTpReceb)
    else Exit;
  end;

end;

procedure TfrmCadIntegracaoPREV.treeTpRecebExit(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    treeTpReceb.Visible := false;
    if (qryTpReceb.FieldByName('ANASINT').asString = 'A')
    then begin
       case treeTpReceb.Tag of
            1 : begin
                  edTpReceb1.Text := '';
                  
                  edTpReceb1.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            2 : begin
                  edCODTIPRECEBCAP.Text := '';
                  
                  edCODTIPRECEBCAP.Text :=qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            3 : begin
                  edCODTIPRECEBDEVOLBenef.Text := '';
                  
                  edCODTIPRECEBDEVOLBenef.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;  
            
            4 : begin
                  edTpReceb2.Text := '';
                  edTpReceb2.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
            5 : begin
                  edTpReceb5.Text := '';
                  edTpReceb5.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;

            6 : begin
                  edTpReceb6.Text := '';
                  edTpReceb6.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            //BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

            //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
            7 : begin
                  edTpRecebEmAtraso.Text := '';
                  edTpRecebEmAtraso.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948

            //edilaine SIG136150 : inicio
            8 : begin
                  dblkpTipoReembDivida.text := '';
                  dblkpTipoReembDivida.text := qryTpReceb.FieldByName('DESCRICAO').asString;
                end;
            //edilaine SIG136150 : fim
       end;
    end; 
  end; 
end;

procedure TfrmCadIntegracaoPREV.edContaAnulaReceitaExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaAnulaReceita.Text,
                             edContaAnulaReceita,
                             lblDescricaoContaAnulaReceita);

end;

procedure TfrmCadIntegracaoPREV.edContaAnulaDespesaExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaAnulaDespesa.Text,
                             edContaAnulaDespesa,
                             lbDescricaoContaAnulaDespesa);
end;

procedure TfrmCadIntegracaoPREV.edContaContabil1Exit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabil1.Text,
                             edContaContabil1,
                             lbDescricaoConta1);
end;

procedure TfrmCadIntegracaoPREV.edContaContabilExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabil.Text,
                             edContaContabil,
                             lbDescricaoConta);
end;

procedure TfrmCadIntegracaoPREV.edContaContabilFolhaAtrasadoExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilFolhaAtrasado.Text,
                             edContaContabilFolhaAtrasado,
                             lblDescricaoContaFolhaAtrasado);

end;

procedure TfrmCadIntegracaoPREV.edPlaContaDBancoExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPlaContaDBanco.Text,
                             edPlaContaDBanco,
                             lblDescricaoPlaContaDBanco);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilAcaoJudicialExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilAcaoJudicial.Text,
                             edContaContabilAcaoJudicial,
                             lblDescricaoContaAcaoJudicial);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilProvisDExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilProvisD.Text,
                             edContaContabilProvisD,
                             lbDescricaoContaProvisD);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilProvisCExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilProvisC.Text,
                             edContaContabilProvisC,
                             lbDescricaoContaProvisC);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilProvisPDExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilProvisPD.Text,
                             edContaContabilProvisPD,
                             lbDescricaoContaProvisPD);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilProvisPCExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilProvisPC.Text,
                             edContaContabilProvisPC,
                             lbDescricaoContaProvisPC);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilDevolExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilDevol.Text,
                             edContaContabilDevol,
                             lbDescricaoContaDevol);

end;

procedure TfrmCadIntegracaoPREV.edContaContabilDevolPatroExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaContabilDevolPatro.Text,
                             edContaContabilDevolPatro,
                             lbDescricaoContaDevolPatro);

end;

procedure TfrmCadIntegracaoPREV.edTpDesemb1Exit(Sender: TObject);
begin
{   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpPaga.Visible)
         then begin
            if TEdit(Sender).Text <> ''
            then if qryTpPaga.Active
                 then if qryTpPaga.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpPaga.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
}
   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpReceb.Visible)
         then begin
            if TEdit(Sender).Text <> ''
            then if qryTpReceb.Active
                 then if qryTpReceb.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpReceb.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Recebimento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
end;

procedure TfrmCadIntegracaoPREV.sbtnSelContribuicao13Click(
  Sender: TObject);
begin
  inherited;

  //edilaine - SIG115304 : inicio
  if pnlDividaBenef.visible then
  begin
    pnlDividaBenef.SendToBack;
    pnlDividaBenef.visible   := false;
    pnlIntegDireita.visible  := true;
    pnlIntegEsquerda.visible := true;
  end;
  //edilaine - SIG115304 : fim

  if sbtnSelContribuicao13.GroupIndex = 0
  then begin
     sbtnSelContribuicao.GroupIndex   := 1;
     sbtnSelBeneficio.GroupIndex      := 1;
     sbtnSelContribuicao13.GroupIndex := 1;
     sbtnSelBeneficio13.GroupIndex    := 1;
     sbtnSelDivBenef.GroupIndex       := 1;       //edilaine SIG115304
     sbtnSelContribuicao13.Down       := True;
  end;

  
  lblTitPLACONTACADT13.Visible  := True;
  edPLACONTACADT13.Visible      := True;
  sbtnPLACONTACADT13.Visible    := True;
  grpPLACONTACADT13.Visible     := True;

  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then begin
     if Trim(dblkpcmbPlano.Text) = ''
     then begin
        MsgDlg('Selecione o Plano Previdenciário desejado.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     qryContribPlano.Close;
     qryContribPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryContribPlano.ParamByName('FLG13').AsInteger            := 1;
     qryContribPlano.ParamByName('FLGCOBRADECTERC1').AsInteger := 1;
     qryContribPlano.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
     dsContrib.DataSet := qryContribPlano; 
     qryContribPlano.Open;

  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3
  then begin
     if Trim(dblkpcmbPatroPlano.Text) = ''
     then begin
        MsgDlg('Selecione a Patrocinadora e Plano Previdenciário desejados.','Erro',mtError,[mbOK],0);
        DesabilitaControles;
        Abort;
     end;
     qryContribPatroPlano.Close;
     qryContribPatroPlano.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryContribPatroPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryContribPatroPlano.ParamByName('FLG13').AsInteger            := 1;
     qryContribPatroPlano.ParamByName('FLGCOBRADECTERC1').AsInteger := 1;
     qryContribPatroPlano.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
     dsContrib.DataSet := qryContribPatroPlano; 
     qryContribPatroPlano.Open;

  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4
  then begin
     if MontaSelectPessoa.ValoresChave[2] = MontaSelectPessoa.ValoresChave[4] 
     then begin
        dsContrib.DataSet := qryContribPessoa;
        qryContribPessoa.Close;
        qryContribPessoa.ParamByName('IDPESSJUR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
        qryContribPessoa.ParamByName('IDPLANOPREV').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
        qryContribPessoa.ParamByName('IDPESSOA').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
        qryContribPessoa.ParamByName('SEQPROPOSTA').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[3]));
        qryContribPessoa.ParamByName('FLG13').AsInteger            := 1;
        qryContribPessoa.ParamByName('FLGCOBRADECTERC1').AsInteger := 1;
        qryContribPessoa.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
        qryContribPessoa.Open;
     end
     else begin
        qryBuscaNucleo.Close;
        qryBuscaNucleo.ParamByName('IDPESSJUR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
        qryBuscaNucleo.ParamByName('IDPLANOPREV').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
        qryBuscaNucleo.ParamByName('IDTITULAR').AsInteger        := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
        qryBuscaNucleo.ParamByName('SEQPROPOSTA').AsInteger      := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[3]));
        qryBuscaNucleo.ParamByName('IDPESSOA').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[4]));
        qryBuscaNucleo.Open;

        dsContrib.DataSet := qryContribNucleo;

        qryContribNucleo.Close;
        if not qryBuscaNucleo.IsEmpty
        then qryContribNucleo.ParamByName('IDNUCLEOFAMILIAR').AsInteger := qryBuscaNucleo.FieldByName('IDNUCLEOFAMILIAR').AsInteger
        else qryContribNucleo.ParamByName('IDNUCLEOFAMILIAR').AsInteger := 0;
        qryContribNucleo.ParamByName('FLG13').AsInteger            := 1;
        qryContribNucleo.ParamByName('FLGCOBRADECTERC1').AsInteger := 1;
        qryContribNucleo.ParamByName('FLGCOBRADECTERC2').AsInteger := 1;
        qryContribNucleo.Open;
     end;
  end;

  PreencheCamposContribuicao;
  pnlIntegracao.Visible           := True;
  pgctrlIntegraContrib.Visible    := True;
  pgctrlIntegraInfGerais.Visible  := False;
  pgctrlIntegraBenef.Visible      := False;
  dbgrdContrib.Visible            := True;
  dbgrdBenef.Visible              := False;  
  pgctrlIntegraContrib.ActivePage := tbsContribContabil;
  pgctrlIntegraContribContabil.ActivePage := tbsContabilGeral;
end;

procedure TfrmCadIntegracaoPREV.qryContribPlanoBeforeScroll(
  DataSet: TDataSet);
var mrResult : TModalResult;
begin
  if (not bAvisoGravacaoContrib) and (not bClicouNoOKContrib)
  then begin
     mrResult := MsgDlg('Os dados da contribuição '+dsContrib.DataSet.FieldByName('NOME').AsString+' ainda não foram confirmados. '+#13+
                        'Deseja realmente mudar de contribuição ?','Confirmação',mtConfirmation,[mbYes,mbYesToAll,mbNo],0);
     if mrResult = mrYesToAll
     then bAvisoGravacaoContrib := True
     else begin
        if mrResult = mrNo
        then Abort;
     end;
  end;
  inherited;
end;


procedure TfrmCadIntegracaoPREV.sbtnSelBeneficioClick(Sender: TObject);
begin
  inherited;

  //edilaine - SIG115304 : inicio
  if pnlDividaBenef.visible then
  begin
    pnlDividaBenef.SendToBack;
    pnlDividaBenef.visible   := false;
    pnlIntegDireita.visible  := true;
    pnlIntegEsquerda.visible := true;
  end;
  //edilaine - SIG115304 : fim

  tbsBenefContabilProvisao.TabVisible:=false;
  tbsBenefFinancProvisao.TabVisible:=false;
  if sbtnSelBeneficio.GroupIndex = 0
  then begin
     sbtnSelContribuicao.GroupIndex   := 1;
     sbtnSelBeneficio.GroupIndex      := 1;
     sbtnSelContribuicao13.GroupIndex := 1;
     sbtnSelBeneficio13.GroupIndex    := 1;
     sbtnSelDivBenef.GroupIndex       := 1;       //edilaine SIG115304
     sbtnSelBeneficio.Down            := True;
  end;

  
  lblTitPLACONTADADT13.Visible := False;
  edPLACONTADADT13.Visible     := False;
  sbtnPLACONTADADT13.Visible   := False;
  grpPLACONTADADT13.Visible    := False;
  
  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then begin
     if Trim(dblkpcmbPlano.Text) = ''
     then begin
        MsgDlg('Selecione o Plano Previdenciário desejado.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     dsBenef.DataSet := qryBenefPlano;
     qryBenefPlano.Close;
     qryBenefPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryBenefPlano.ParamByName('FLG13').AsInteger            := 0;
     qryBenefPlano.ParamByName('FLGPOSSUIABONO1').AsInteger  := 0;
     qryBenefPlano.ParamByName('FLGPOSSUIABONO2').AsInteger  := 1;
     qryBenefPlano.Open;
     tbsBenefContabilProvisao.TabVisible:=true; 
     tbsBenefFinancProvisao.TabVisible:=true; 
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3
  then begin
     if Trim(dblkpcmbPatroPlano.Text) = ''
     then begin
        MsgDlg('Selecione a Patrocinadora e Plano Previdenciário desejados.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     qryPlanPrevPatro.Close;
     qryPlanPrevPatro.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryPlanPrevPatro.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryPlanPrevPatro.Open;

     dsBenef.DataSet := qryBenefPlanPatro;
     qryBenefPlanPatro.Close;
     qryBenefPlanPatro.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryBenefPlanPatro.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryBenefPlanPatro.ParamByName('FLG13').AsInteger            := 0;
     qryBenefPlanPatro.ParamByName('FLGPOSSUIABONO1').AsInteger  := 0;
     qryBenefPlanPatro.ParamByName('FLGPOSSUIABONO2').AsInteger  := 1;
     qryBenefPlanPatro.Open;
     tbsBenefContabilProvisao.TabVisible:=true; 
     tbsBenefFinancProvisao.TabVisible:=true; 
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4
  then begin
     dsBenef.DataSet := qryBenefBfciario;
     qryBenefBfciario.Close;
     qryBenefBfciario.ParamByName('IDPESSJUR').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
     qryBenefBfciario.ParamByName('IDPLANOPREV').AsInteger       := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
     qryBenefBfciario.ParamByName('IDPESSOA').AsInteger          := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
     qryBenefBfciario.ParamByName('FLG13').AsInteger             := 0;
     qryBenefBfciario.ParamByName('FLGPOSSUIABONO1').AsInteger   := 0;
     qryBenefBfciario.ParamByName('FLGPOSSUIABONO2').AsInteger   := 1;
     qryBenefBfciario.Open;
  end;
  PreencheCamposBeneficio;
  PreencheCamposPlanPrevPatro;
  pnlIntegracao.Visible                   := True;
  pgctrlIntegraInfGerais.Visible          := False;
  pgctrlIntegraContrib.Visible            := False;
  pgctrlIntegraBenef.Visible              := True;
  dbgrdContrib.Visible                    := False;
  dbgrdBenef.Visible                      := True;
  edCODTIPDESEMBPROV.Enabled              := True;   
  edCODTIPRECDESADT.Enabled               := True;   
  sbtnCODTIPDESEMBPROV.Enabled            := True;   
  sbtnCODTIPRECDESADT.Enabled             := True;  
  pgctrlIntegraBenef.ActivePage           := tbsBenefContabil;
  pgctrlBenefContabil.ActivePage          := tbsBenefContabilGeral;
end;

procedure TfrmCadIntegracaoPREV.sbtnSelBeneficio13Click(Sender: TObject);
begin
  inherited;

  //edilaine - SIG115304 : inicio
  if pnlDividaBenef.visible then
  begin
    pnlDividaBenef.SendToBack;
    pnlDividaBenef.visible   := false;
    pnlIntegDireita.visible  := true;
    pnlIntegEsquerda.visible := true;
  end;
  //edilaine - SIG115304 : fim

  tbsBenefContabilProvisao.TabVisible:=false;
  tbsBenefFinancProvisao.TabVisible:=false;
  if sbtnSelBeneficio13.GroupIndex = 0
  then begin
     sbtnSelContribuicao.GroupIndex   := 1;
     sbtnSelBeneficio.GroupIndex      := 1;
     sbtnSelContribuicao13.GroupIndex := 1;
     sbtnSelBeneficio13.GroupIndex    := 1;
     sbtnSelDivBenef.GroupIndex       := 1;       //edilaine SIG115304
     sbtnSelBeneficio13.Down          := True;
  end;

  
  lblTitPLACONTADADT13.Visible        := True;
  edPLACONTADADT13.Visible            := True;
  sbtnPLACONTADADT13.Visible          := True;
  grpPLACONTADADT13.Visible           := True;


  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then begin
     if Trim(dblkpcmbPlano.Text) = ''
     then begin
        MsgDlg('Selecione o Plano Previdenciário desejado.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     dsBenef.DataSet := qryBenefPlano;
     qryBenefPlano.Close;
     qryBenefPlano.ParamByName('IDPLANOPREV').AsInteger      := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryBenefPlano.ParamByName('FLG13').AsInteger            := 1;
     qryBenefPlano.ParamByName('FLGPOSSUIABONO1').AsInteger  := 1;
     qryBenefPlano.ParamByName('FLGPOSSUIABONO2').AsInteger  := 1;
     qryBenefPlano.Open;
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 3
  then begin
     if Trim(dblkpcmbPatroPlano.Text) = ''
     then begin
        MsgDlg('Selecione a Patrocinadora e Plano Previdenciário desejados.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     dsBenef.DataSet := qryBenefPlanPatro;
     qryBenefPlanPatro.Close;
     qryBenefPlanPatro.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryBenefPlanPatro.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryBenefPlanPatro.ParamByName('FLG13').AsInteger            := 1;
     qryBenefPlanPatro.ParamByName('FLGPOSSUIABONO1').AsInteger  := 1;
     qryBenefPlanPatro.ParamByName('FLGPOSSUIABONO2').AsInteger  := 1;
     qryBenefPlanPatro.Open;

     qryPlanPrevPatro.Close;
     qryPlanPrevPatro.ParamByName('IDPESSJUR').AsInteger        := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
     qryPlanPrevPatro.ParamByName('IDPLANOPREV').AsInteger      := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
     qryPlanPrevPatro.Open;
  end
  else if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 4
  then begin
     dsBenef.DataSet := qryBenefBfciario;
     qryBenefBfciario.Close;
     qryBenefBfciario.ParamByName('IDPESSJUR').AsInteger         := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[0]));
     qryBenefBfciario.ParamByName('IDPLANOPREV').AsInteger       := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[1]));
     qryBenefBfciario.ParamByName('IDPESSOA').AsInteger          := StrToInt(ClienteNumero(MontaSelectPessoa.ValoresChave[2]));
     qryBenefBfciario.ParamByName('FLG13').AsInteger             := 1;
     qryBenefBfciario.ParamByName('FLGPOSSUIABONO1').AsInteger   := 1;
     qryBenefBfciario.ParamByName('FLGPOSSUIABONO2').AsInteger   := 1;
     qryBenefBfciario.Open;
  end;
  PreencheCamposBeneficio;
  PreencheCamposPlanPrevPatro;
  pnlIntegracao.Visible                   := True;
  pgctrlIntegraInfGerais.Visible          := False;
  pgctrlIntegraContrib.Visible            := False;
  pgctrlIntegraBenef.Visible              := True;
  dbgrdContrib.Visible                    := False;
  dbgrdBenef.Visible                      := True;
  edCODTIPDESEMBPROV.Enabled              := False;
  edCODTIPRECDESADT.Enabled               := False;
  sbtnCODTIPDESEMBPROV.Enabled            := False;
  sbtnCODTIPRECDESADT.Enabled             := False;
  pgctrlIntegraBenef.ActivePage           := tbsBenefContabil;
  pgctrlBenefContabil.ActivePage          := tbsBenefContabilGeral;
end;

procedure TfrmCadIntegracaoPREV.qryContribPatroPlanoBeforeScroll(
  DataSet: TDataSet);
var mrResult : TModalResult;
begin
  if (not bAvisoGravacaoContrib) and (not bClicouNoOKContrib)
  then begin
     mrResult := MsgDlg('Os dados da contribuição '+dsContrib.DataSet.FieldByName('NOME').AsString+' ainda não foram confirmados. '+#13+
                        'Deseja realmente mudar de contribuição ?','Confirmação',mtConfirmation,[mbYes,mbYesToAll,mbNo],0);
     if mrResult = mrYesToAll
     then bAvisoGravacaoContrib := True
     else begin
        if mrResult = mrNo
        then Abort;
     end;
  end;
  inherited;
end;

procedure TfrmCadIntegracaoPREV.qryContribNucleoBeforeScroll(
  DataSet: TDataSet);
var mrResult : TModalResult;
begin
  if (not bAvisoGravacaoContrib) and (not bClicouNoOKContrib)
  then begin
     mrResult := MsgDlg('Os dados da contribuição '+dsContrib.DataSet.FieldByName('NOME').AsString+' ainda não foram confirmados. '+#13+
                        'Deseja realmente mudar de contribuição ?','Confirmação',mtConfirmation,[mbYes,mbYesToAll,mbNo],0);
     if mrResult = mrYesToAll
     then bAvisoGravacaoContrib := True
     else begin
        if mrResult = mrNo
        then Abort;
     end;
  end;
  inherited;
end;

procedure TfrmCadIntegracaoPREV.qryContribPessoaBeforeScroll(
  DataSet: TDataSet);
var mrResult : TModalResult;
begin
  if (not bAvisoGravacaoContrib) and (not bClicouNoOKContrib)
  then begin
     mrResult := MsgDlg('Os dados da contribuição '+dsContrib.DataSet.FieldByName('NOME').AsString+' ainda não foram confirmados. '+#13+
                        'Deseja realmente mudar de contribuição ?','Confirmação',mtConfirmation,[mbYes,mbYesToAll,mbNo],0);
     if mrResult = mrYesToAll
     then bAvisoGravacaoContrib := True
     else begin
        if mrResult = mrNo
        then Abort;
     end;
  end;
  inherited;
end;

procedure TfrmCadIntegracaoPREV.qryBenefPlanoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  lblDescSelecao.Caption := dsBenef.DataSet.FieldByName('NOME').AsString;
  PreencheCamposBeneficio;
end;

procedure TfrmCadIntegracaoPREV.qryBenefPlanoBeforeScroll(
  DataSet: TDataSet);
var mrResult : TModalResult;
begin
  if (not bAvisoGravacaoBenef) and (not bClicouNoOKBenef)
  then begin
     mrResult := MsgDlg('Os dados do benefício '+dsBenef.DataSet.FieldByName('NOME').AsString+' ainda não foram confirmados. '+#13+
                        'Deseja realmente mudar de benefício ?','Confirmação',mtConfirmation,[mbYes,mbYesToAll,mbNo],0);
     if mrResult = mrYesToAll
     then bAvisoGravacaoBenef := True
     else begin
        if mrResult = mrNo
        then Abort;
     end;
  end;
  inherited;
end;

procedure TfrmCadIntegracaoPREV.sbtnPlaContaDBenefClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(14, 171, 298, edPlaContaDBenef.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnPlaContaCBenefClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(15, 235, 298, edPlaContaCBenef.Text);

end;

procedure TfrmCadIntegracaoPREV.sbtnPLACTAACJUDClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(16, 298, 298, edPLACTAACJUD.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADPROVISClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(17, 216, 310, edPLACONTADPROVIS.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACPROVISClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(18, 324, 310, edPLACONTACPROVIS.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADPROVADTClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(19, 216, 310, edPLACONTADPROVADT.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnlblPLACONTACPROVADTClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(20, 324, 310, edPLACONTADPROVADT.Text);
end;

procedure TfrmCadIntegracaoPREV.sbtnCODTIPRECDESBenefClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(5, 202, 305);
end;

procedure TfrmCadIntegracaoPREV.edCODTIPRECDESBenefExit(Sender: TObject);
begin
  inherited;
   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpPaga.Visible)
         then begin
            if TEdit(Sender).Text <> '' 
            then if qryTpPaga.Active
                 then if qryTpPaga.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpPaga.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
end;

procedure TfrmCadIntegracaoPREV.sbtnCODTIPRECEBCAPClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(2, 284, 305);
end;

procedure TfrmCadIntegracaoPREV.edCODTIPRECEBCAPExit(Sender: TObject);
begin
   inherited;
   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpReceb.Visible)
         then begin
            if TEdit(Sender).Text <> ''
            then if qryTpReceb.Active
                 then if qryTpReceb.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpReceb.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Recebimento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
end;

procedure TfrmCadIntegracaoPREV.sbtnCODTIPDESEMBPROVClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(6, 197, 314);
end;

procedure TfrmCadIntegracaoPREV.edCODTIPDESEMBPROVExit(Sender: TObject);
begin
  inherited;
   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpPaga.Visible)
         then begin
            if TEdit(Sender).Text <> '' 
            then if qryTpPaga.Active
                 then if qryTpPaga.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpPaga.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
end;

procedure TfrmCadIntegracaoPREV.sbtnCODTIPRECDESADTClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(7, 254, 314);
end;

procedure TfrmCadIntegracaoPREV.edCODTIPRECDESADTExit(Sender: TObject);
begin
  inherited;
   with dtmIntegraCAPCAR do
   begin
      try
         if (not treeTpPaga.Visible)
         then begin
            if TEdit(Sender).Text <> '' 
            then if qryTpPaga.Active
                 then if qryTpPaga.LOCATE('DESCRICAO',TEdit(Sender).Text,[loCaseInsensitive,loPartialKey])
                 then if (qryTpPaga.FieldByName('ANASINT').asString <> 'A')
                      then begin
                         MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
                         TEdit(Sender).Text := '' ;
                         TEdit(Sender).SetFocus;
                      end;
         end;
      except
         raise;
      end;
   end;
end;

procedure TfrmCadIntegracaoPREV.edPlaContaDBenefExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPlaContaDBenef.Text,
                             edPlaContaDBenef,
                             lblPlaContaDBenef);

end;

procedure TfrmCadIntegracaoPREV.edPlaContaCBenefExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPlaContaCBenef.Text,
                             edPlaContaCBenef,
                             lblPlaContaCBenef);

end;

procedure TfrmCadIntegracaoPREV.edPLACTAACJUDExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACTAACJUD.Text,
                             edPLACTAACJUD,
                             lblPLACTAACJUD);

end;

procedure TfrmCadIntegracaoPREV.edPLACONTADPROVISExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADPROVIS.Text,
                             edPLACONTADPROVIS,
                             lblPLACONTADPROVIS);

end;

procedure TfrmCadIntegracaoPREV.edPLACONTACPROVISExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACPROVIS.Text,
                             edPLACONTACPROVIS,
                             lblPLACONTACPROVIS);

end;

procedure TfrmCadIntegracaoPREV.edPLACONTADPROVADTExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADPROVADT.Text,
                             edPLACONTADPROVADT,
                             lblPLACONTADPROVADT);

end;

procedure TfrmCadIntegracaoPREV.edPLACONTACPROVADTExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACPROVADT.Text,
                             edPLACONTACPROVADT,
                             lblPLACONTACPROVADT);

end;

procedure TfrmCadIntegracaoPREV.mnuCopiaItemClick(Sender: TObject);
var sSQL     : string;
    mrResult : TModalResult;
    sNome    : string;
    sTipo    : string;
    bkMark : TBookMark;
begin
  inherited;
  
  frmCadIntegracaoPrevAux := TfrmCadIntegracaoPrevAux.Create(Application);
  with frmCadIntegracaoPrevAux do
  begin
     if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
     then begin
        lblDescricao.Caption := 'Selecione a Contribuição Origem dos Dados a serem copiados ...';
        sNome                := dsContrib.DataSet.FieldByName('NOME').AsString;
        sTipo                := 'contribuição';
        if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
        then sSQL := ' SELECT CP.IDPLANOPREV, CP.IDCONTRIBUICAO, C.NOME '+
                     ' FROM   CONTPREV CP, CONTRIBUICAO C               '+
                     ' WHERE  CP.IDPLANOPREV   = '+qryPlano.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO      '+
                     ' ORDER BY C.NOME                                  '

        else sSQL := ' SELECT CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDCONTRIBUICAO, C.NOME '+
                     ' FROM   CONTPLANPATRO CP, CONTRIBUICAO C               '+
                     ' WHERE  CP.IDPESSJUR     = '+qryPatroPlano.FieldbyName('IDPESSJUR').AsString+
                     ' AND    CP.IDPLANOPREV   = '+qryPatroPlano.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO      '+
                     ' ORDER BY C.NOME                                  ';
     end
     else begin
        lblDescricao.Caption := 'Selecione o Benefício Origem dos Dados a serem copiados ...';
        sNome                := dsBenef.DataSet.FieldByName('NOME').AsString;
        sTipo                := 'benefício';
        if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
        then sSQL := ' SELECT BP.IDPLANOPREV, BP.IDBENEFICIO, B.NOME '+
                     ' FROM   BENEFPLANPREV BP, BENEFICIO B             '+
                     ' WHERE  BP.IDPLANOPREV   = '+qryPlano.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO         '+
                     ' ORDER BY B.NOME                                  '
        else sSQL := ' SELECT BP.IDPESSJUR, BP.IDPLANOPREV, BP.IDBENEFICIO, B.NOME '+
                     ' FROM   BENEFPLANPATRO BP, BENEFICIO B             '+
                     ' WHERE  BP.IDPESSJUR     = '+qryPatroPlano.FieldbyName('IDPESSJUR').AsString+
                     ' AND    BP.IDPLANOPREV   = '+qryPatroPlano.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO         '+
                     ' ORDER BY B.NOME                                  ';
     end;
     qryLista.Close;
     qryLista.SQL.Clear;
     qryLista.SQL.Add(sSQL);
     qryLista.Open;
     mrResult := ShowModal;
  end;

  if mrResult <> mrOK
  then begin
     MsgDlg('Cópia de '+sTipo+' cancelada.','Informação',mtInformation,[mbOK],0);
     Abort;
  end;

  if MsgDlg('Confirma a cópia dos dados de '+frmCadIntegracaoPrevAux.qryLista.FieldByName('NOME').AsString+#13+
            'para '+sNome+' ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
     MsgDlg('Cópia de '+sTipo+' cancelada.','Informação',mtInformation,[mbOK],0);
     Abort;
  end;

  if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
  then begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     if qryNivelIntegracao.FieldbyName('NIVEL').AsInteger = 2 // por plano
     then begin
        if not CopiaContribuicao( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  -1,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDCONTRIBUICAO').AsInteger,
                                  -1,
                                  dsContrib.DataSet.FieldByName('IDPLANOPREV').AsInteger,
                                  dsContrib.DataSet.FieldByName('IDCONTRIBUICAO').AsInteger)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados de '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end
     else begin 
        if not CopiaContribuicao( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPESSJUR').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDCONTRIBUICAO').AsInteger,
                                  dsContrib.DataSet.FieldByName('IDPESSJUR').AsInteger,
                                  dsContrib.DataSet.FieldByName('IDPLANOPREV').AsInteger,
                                  dsContrib.DataSet.FieldByName('IDCONTRIBUICAO').AsInteger)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados de '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end;
     GravaLogTOTALPREV ('Cópia de Parametrização Contábil/Financeira de '+sTipo+'[Destino:'+sNome+']');
     dtmBaseDados.dbBaseDados.Commit;
     bkMark := dsContrib.DataSet.GetBookmark;
     dsContrib.DataSet.Close;
     dsContrib.DataSet.Open;
     dsContrib.DataSet.GotoBookmark(bkMark);
  end
  else begin // beneficio
     dtmBaseDados.dbBaseDados.StartTransaction;
     if qryNivelIntegracao.FieldbyName('NIVEL').AsInteger = 2 
     then begin
        if not CopiaBeneficio   ( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  -1,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDBENEFICIO').AsInteger,
                                  -1,
                                  dsBenef.DataSet.FieldByName('IDPLANOPREV').AsInteger,
                                  dsBenef.DataSet.FieldByName('IDBENEFICIO').AsInteger)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados de '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end
     else begin // por patro x plano
        if not CopiaBeneficio   ( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPESSJUR').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDBENEFICIO').AsInteger,
                                  dsBenef.DataSet.FieldByName('IDPESSJUR').AsInteger,
                                  dsBenef.DataSet.FieldByName('IDPLANOPREV').AsInteger,
                                  dsBenef.DataSet.FieldByName('IDBENEFICIO').AsInteger)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados de '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end;
     GravaLogTOTALPREV ('Cópia de Parametrização Contábil/Financeira de '+sTipo+'[Destino:'+sNome+']');
     dtmBaseDados.dbBaseDados.Commit;
     bkMark := dsBenef.DataSet.GetBookmark;
     dsBenef.DataSet.Close;
     dsBenef.DataSet.Open;
     dsBenef.DataSet.GotoBookmark(bkMark);
  end;
  frmCadIntegracaoPrevAux.Free;
end;

function TfrmCadIntegracaoPrev.CopiaContribuicao(piNivel                 : integer;
                                                 piIdPessJurOrigem       : longint;
                                                 piIdPlanoPrevOrigem     : longint;
                                                 piIdContribuicaoOrigem  : longint;
                                                 piIdPessJurDestino      : longint;
                                                 piIdPlanoPrevDestino    : longint;
                                                 piIdContribuicaoDestino : longint ) : boolean;
var sSQL : string;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT       IDCONTRIBUICAO                                    '+
                    '        ,CODSUBCONTA                                       '+
                    '        ,CODSUBCONTA13                                     '+
                    '        ,IDPLANPREVCONTAB                                  '+
                    '        ,PLACONTAC                                         '+
                    '        ,PLACONTAC13                                       '+
                    '        ,PLACONTAD                                         '+
                    '        ,PLACONTAD13                                       '+
                    '        ,PLACONTAOUTROMES                                  '+
                    '        ,PLACTAOUTROMES13                                  '+
                    '        ,PLACTAACJUD                                       '+
                    '        ,PLACONTACADT13                                    '+ 
                    '        ,PLACTAACJUD13                                     '+
                    '        ,PLACONTADPROVIS                                   '+
                    '        ,PLACONTADPROVIS13                                 '+
                    '        ,PLACONTACPROVIS                                   '+
                    '        ,PLACONTACPROVIS13                                 '+
                    '        ,PLACONTADPROVADT                                  '+
                    '        ,PLACTDPROVADT13                                   '+
                    '        ,PLACONTACPROVADT                                  '+
                    '        ,PLACTCPROVADT13                                   '+
                    '        ,PLACONTADEVOL                                     '+
                    '        ,PLACONTADEVOL13                                   '+
                    '        ,PLACONTADEVOLPAT                                  '+
                    '        ,PLACTDEVOLPAT13                                   '+
                    '        ,PLACONTADBANCO                                    '+ //CPrev - 27438
                    '        ,PLACONTADBANCO13                                  '+ //CPrev - 27438
                    '        ,UNIDNEGOC                                         '+
                    '        ,UNIDNEGOC13                                       '+
                    '        ,CODPORTFORMA                                      '+
                    '        ,CODPORTFORMA13                                    '+
                    '        ,CODCENTRORESPON                                   '+
                    '        ,CODCENTRORESPON13                                 '+
                    '        ,CODTIPRECDES                                      '+
                    '        ,CODTIPRECDES13                                    '+
                    '        ,CODTIPDESEMBCAR                                   '+
                    '        ,CODTIPDESEMB13                                    '+
                    '        ,CODTIPDESEMBDEVOL                                 '+
                    '        ,CODDESEMBDEV13                                    '+
                    '        ,CODTIPDESEMBPROV                                  '+
                    '        ,CODDESEMBPROV13                                   '+
                    '        ,CODTIPRECDESADT                                   '+
                    '        ,CODTIPRECADT13                                    '+
                    '        ,CODCENTROCUSTOD                                   '+ //CPrev - 27438
                    '        ,CODTIPRECEBDEV                                    '+ //CPrev - 27438
                    '        ,CODTIPRECEBDEV13                                  '+ //CPrev - 27438
                    '        ,RECPAG                                            '+
                    '        ,IDEMPRESAPROP                                     '+
                    '        ,IDEMPRESAPROP13                                   '+
                    '        ,IDEMPRESADESEMB                                   '+
                    '        ,RECPAGDESEMB                                      '+
                    '        ,PLANO                                             '+
                    '        ,PLANO13                                           ');
   if piNivel = 2
   then qry.SQL.Add(' FROM  CONTPREV         '+
                    ' WHERE IDPLANOPREV    = '+IntToStr(piIdPlanoPrevOrigem))
   else qry.SQL.Add(' FROM  CONTPLANPATRO    '+
                    ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJurOrigem)+
                    ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrevOrigem));
   if piIdContribuicaoOrigem > 0
   then qry.SQL.Add(' AND   IDCONTRIBUICAO = '+IntToStr(piIdContribuicaoOrigem));

   qry.Open;

   if qry.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   while not qry.Eof do
   begin
      if piNivel = 2
      then sSQL := 'UPDATE CONTPREV      SET '
      else sSQL := 'UPDATE CONTPLANPATRO SET ';

      if Trim(qry.FieldByName('CODSUBCONTA').AsString)       <> '' then sSQL := sSQL+ ' CODSUBCONTA        = '''+qry.FieldByName('CODSUBCONTA').AsString          +'''' else sSQL := sSQL + '  CODSUBCONTA       = NULL ';
      if Trim(qry.FieldByName('CODSUBCONTA13').AsString)     <> '' then sSQL := sSQL+ ',CODSUBCONTA13      = '''+qry.FieldByName('CODSUBCONTA13').AsString        +'''' else sSQL := sSQL + ' ,CODSUBCONTA13     = NULL ';
      if Trim(qry.FieldByName('IDPLANPREVCONTAB').AsString)  <> '' then sSQL := sSQL+ ',IDPLANPREVCONTAB   = '''+qry.FieldByName('IDPLANPREVCONTAB').AsString     +'''' else sSQL := sSQL + ' ,IDPLANPREVCONTAB  = NULL ';
      if Trim(qry.FieldByName('PLACONTAC').AsString)         <> '' then sSQL := sSQL+ ',PLACONTAC          = '''+qry.FieldByName('PLACONTAC').AsString            +'''' else sSQL := sSQL + ' ,PLACONTAC         = NULL ';
      if Trim(qry.FieldByName('PLACONTAC13').AsString)       <> '' then sSQL := sSQL+ ',PLACONTAC13        = '''+qry.FieldByName('PLACONTAC13').AsString          +'''' else sSQL := sSQL + ' ,PLACONTAC13       = NULL ';
      if Trim(qry.FieldByName('PLACONTAD').AsString)         <> '' then sSQL := sSQL+ ',PLACONTAD          = '''+qry.FieldByName('PLACONTAD').AsString            +'''' else sSQL := sSQL + ' ,PLACONTAD         = NULL ';
      if Trim(qry.FieldByName('PLACONTAD13').AsString)       <> '' then sSQL := sSQL+ ',PLACONTAD13        = '''+qry.FieldByName('PLACONTAD13').AsString          +'''' else sSQL := sSQL + ' ,PLACONTAD13       = NULL ';
      if Trim(qry.FieldByName('PLACONTAOUTROMES').AsString)  <> '' then sSQL := sSQL+ ',PLACONTAOUTROMES   = '''+qry.FieldByName('PLACONTAOUTROMES').AsString     +'''' else sSQL := sSQL + ' ,PLACONTAOUTROMES  = NULL ';
      if Trim(qry.FieldByName('PLACTAOUTROMES13').AsString)  <> '' then sSQL := sSQL+ ',PLACTAOUTROMES13   = '''+qry.FieldByName('PLACTAOUTROMES13').AsString     +'''' else sSQL := sSQL + ' ,PLACTAOUTROMES13  = NULL ';
      if Trim(qry.FieldByName('PLACTAACJUD').AsString)       <> '' then sSQL := sSQL+ ',PLACTAACJUD        = '''+qry.FieldByName('PLACTAACJUD').AsString          +'''' else sSQL := sSQL + ' ,PLACTAACJUD       = NULL ';
      if Trim(qry.FieldByName('PLACONTACADT13').AsString)    <> '' then sSQL := sSQL+ ',PLACONTACADT13     = '''+qry.FieldByName('PLACONTACADT13').AsString       +'''' else sSQL := sSQL + ' ,PLACONTACADT13    = NULL ';
      if Trim(qry.FieldByName('PLACTAACJUD13').AsString)     <> '' then sSQL := sSQL+ ',PLACTAACJUD13      = '''+qry.FieldByName('PLACTAACJUD13').AsString        +'''' else sSQL := sSQL + ' ,PLACTAACJUD13     = NULL ';
      if Trim(qry.FieldByName('PLACONTADPROVIS').AsString)   <> '' then sSQL := sSQL+ ',PLACONTADPROVIS    = '''+qry.FieldByName('PLACONTADPROVIS').AsString      +'''' else sSQL := sSQL + ' ,PLACONTADPROVIS   = NULL ';
      if Trim(qry.FieldByName('PLACONTADPROVIS13').AsString) <> '' then sSQL := sSQL+ ',PLACONTADPROVIS13  = '''+qry.FieldByName('PLACONTADPROVIS13').AsString    +'''' else sSQL := sSQL + ' ,PLACONTADPROVIS13 = NULL ';
      if Trim(qry.FieldByName('PLACONTACPROVIS').AsString)   <> '' then sSQL := sSQL+ ',PLACONTACPROVIS    = '''+qry.FieldByName('PLACONTACPROVIS').AsString      +'''' else sSQL := sSQL + ' ,PLACONTACPROVIS   = NULL ';
      if Trim(qry.FieldByName('PLACONTACPROVIS13').AsString) <> '' then sSQL := sSQL+ ',PLACONTACPROVIS13  = '''+qry.FieldByName('PLACONTACPROVIS13').AsString    +'''' else sSQL := sSQL + ' ,PLACONTACPROVIS13 = NULL ';
      if Trim(qry.FieldByName('PLACONTADPROVADT').AsString)  <> '' then sSQL := sSQL+ ',PLACONTADPROVADT   = '''+qry.FieldByName('PLACONTADPROVADT').AsString     +'''' else sSQL := sSQL + ' ,PLACONTADPROVADT  = NULL ';
      if Trim(qry.FieldByName('PLACTDPROVADT13').AsString)   <> '' then sSQL := sSQL+ ',PLACTDPROVADT13    = '''+qry.FieldByName('PLACTDPROVADT13').AsString      +'''' else sSQL := sSQL + ' ,PLACTDPROVADT13   = NULL ';
      if Trim(qry.FieldByName('PLACONTACPROVADT').AsString)  <> '' then sSQL := sSQL+ ',PLACONTACPROVADT   = '''+qry.FieldByName('PLACONTACPROVADT').AsString     +'''' else sSQL := sSQL + ' ,PLACONTACPROVADT  = NULL ';
      if Trim(qry.FieldByName('PLACTCPROVADT13').AsString)   <> '' then sSQL := sSQL+ ',PLACTCPROVADT13    = '''+qry.FieldByName('PLACTCPROVADT13').AsString      +'''' else sSQL := sSQL + ' ,PLACTCPROVADT13   = NULL ';
      if Trim(qry.FieldByName('PLACONTADEVOL').AsString)     <> '' then sSQL := sSQL+ ',PLACONTADEVOL      = '''+qry.FieldByName('PLACONTADEVOL').AsString        +'''' else sSQL := sSQL + ' ,PLACONTADEVOL     = NULL ';
      if Trim(qry.FieldByName('PLACONTADEVOL13').AsString)   <> '' then sSQL := sSQL+ ',PLACONTADEVOL13    = '''+qry.FieldByName('PLACONTADEVOL13').AsString      +'''' else sSQL := sSQL + ' ,PLACONTADEVOL13   = NULL ';
      if Trim(qry.FieldByName('PLACONTADEVOLPAT').AsString)  <> '' then sSQL := sSQL+ ',PLACONTADEVOLPAT   = '''+qry.FieldByName('PLACONTADEVOLPAT').AsString     +'''' else sSQL := sSQL + ' ,PLACONTADEVOLPAT  = NULL ';
      if Trim(qry.FieldByName('PLACTDEVOLPAT13').AsString)   <> '' then sSQL := sSQL+ ',PLACTDEVOLPAT13    = '''+qry.FieldByName('PLACTDEVOLPAT13').AsString      +'''' else sSQL := sSQL + ' ,PLACTDEVOLPAT13   = NULL ';
      if Trim(qry.FieldByName('PLACONTADBANCO').AsString)    <> '' then sSQL := sSQL+ ',PLACONTADBANCO     = '''+qry.FieldByName('PLACONTADBANCO').AsString       +'''' else sSQL := sSQL + ' ,PLACONTADBANCO    = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('PLACONTADBANCO13').AsString)  <> '' then sSQL := sSQL+ ',PLACONTADBANCO13   = '''+qry.FieldByName('PLACONTADBANCO13').AsString     +'''' else sSQL := sSQL + ' ,PLACONTADBANCO13  = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('UNIDNEGOC').AsString)         <> '' then sSQL := sSQL+ ',UNIDNEGOC          = '''+qry.FieldByName('UNIDNEGOC').AsString            +'''' else sSQL := sSQL + ' ,UNIDNEGOC         = NULL ';
      if Trim(qry.FieldByName('UNIDNEGOC13').AsString)       <> '' then sSQL := sSQL+ ',UNIDNEGOC13        = '''+qry.FieldByName('UNIDNEGOC13').AsString          +'''' else sSQL := sSQL + ' ,UNIDNEGOC13       = NULL ';
      if Trim(qry.FieldByName('CODPORTFORMA').AsString)      <> '' then sSQL := sSQL+ ',CODPORTFORMA       = '''+qry.FieldByName('CODPORTFORMA').AsString         +'''' else sSQL := sSQL + ' ,CODPORTFORMA      = NULL ';
      if Trim(qry.FieldByName('CODPORTFORMA13').AsString)    <> '' then sSQL := sSQL+ ',CODPORTFORMA13     = '''+qry.FieldByName('CODPORTFORMA13').AsString       +'''' else sSQL := sSQL + ' ,CODPORTFORMA13    = NULL ';
      if Trim(qry.FieldByName('CODCENTRORESPON').AsString)   <> '' then sSQL := sSQL+ ',CODCENTRORESPON    = '''+qry.FieldByName('CODCENTRORESPON').AsString      +'''' else sSQL := sSQL + ' ,CODCENTRORESPON   = NULL ';
      if Trim(qry.FieldByName('CODCENTRORESPON13').AsString) <> '' then sSQL := sSQL+ ',CODCENTRORESPON13  = '''+qry.FieldByName('CODCENTRORESPON13').AsString    +'''' else sSQL := sSQL + ' ,CODCENTRORESPON13 = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDES').AsString)      <> '' then sSQL := sSQL+ ',CODTIPRECDES       = '''+qry.FieldByName('CODTIPRECDES').AsString         +'''' else sSQL := sSQL + ' ,CODTIPRECDES      = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDES13').AsString)    <> '' then sSQL := sSQL+ ',CODTIPRECDES13     = '''+qry.FieldByName('CODTIPRECDES13').AsString       +'''' else sSQL := sSQL + ' ,CODTIPRECDES13    = NULL ';
      if Trim(qry.FieldByName('CODTIPDESEMBCAR').AsString)   <> '' then sSQL := sSQL+ ',CODTIPDESEMBCAR    = '''+qry.FieldByName('CODTIPDESEMBCAR').AsString      +'''' else sSQL := sSQL + ' ,CODTIPDESEMBCAR   = NULL ';
      if Trim(qry.FieldByName('CODTIPDESEMB13').AsString)    <> '' then sSQL := sSQL+ ',CODTIPDESEMB13     = '''+qry.FieldByName('CODTIPDESEMB13').AsString       +'''' else sSQL := sSQL + ' ,CODTIPDESEMB13    = NULL ';
      if Trim(qry.FieldByName('CODTIPDESEMBDEVOL').AsString) <> '' then sSQL := sSQL+ ',CODTIPDESEMBDEVOL  = '''+qry.FieldByName('CODTIPDESEMBDEVOL').AsString    +'''' else sSQL := sSQL + ' ,CODTIPDESEMBDEVOL = NULL ';
      if Trim(qry.FieldByName('CODDESEMBDEV13').AsString)    <> '' then sSQL := sSQL+ ',CODDESEMBDEV13     = '''+qry.FieldByName('CODDESEMBDEV13').AsString       +'''' else sSQL := sSQL + ' ,CODDESEMBDEV13    = NULL ';
      if Trim(qry.FieldByName('CODTIPDESEMBPROV').AsString)  <> '' then sSQL := sSQL+ ',CODTIPDESEMBPROV   = '''+qry.FieldByName('CODTIPDESEMBPROV').AsString     +'''' else sSQL := sSQL + ' ,CODTIPDESEMBPROV  = NULL ';
      if Trim(qry.FieldByName('CODDESEMBPROV13').AsString)   <> '' then sSQL := sSQL+ ',CODDESEMBPROV13    = '''+qry.FieldByName('CODDESEMBPROV13').AsString      +'''' else sSQL := sSQL + ' ,CODDESEMBPROV13   = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDESADT').AsString)   <> '' then sSQL := sSQL+ ',CODTIPRECDESADT    = '''+qry.FieldByName('CODTIPRECDESADT').AsString      +'''' else sSQL := sSQL + ' ,CODTIPRECDESADT   = NULL ';
      if Trim(qry.FieldByName('CODTIPRECADT13').AsString)    <> '' then sSQL := sSQL+ ',CODTIPRECADT13     = '''+qry.FieldByName('CODTIPRECADT13').AsString       +'''' else sSQL := sSQL + ' ,CODTIPRECADT13    = NULL ';
      if Trim(qry.FieldByName('CODCENTROCUSTOD').AsString)   <> '' then sSQL := sSQL+ ',CODCENTROCUSTOD    = '''+qry.FieldByName('CODCENTROCUSTOD').AsString      +'''' else sSQL := sSQL + ' ,CODCENTROCUSTOD   = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('CODTIPRECEBDEV').AsString)    <> '' then sSQL := sSQL+ ',CODTIPRECEBDEV     = '''+qry.FieldByName('CODTIPRECEBDEV').AsString       +'''' else sSQL := sSQL + ' ,CODTIPRECEBDEV    = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('CODTIPRECEBDEV13').AsString)  <> '' then sSQL := sSQL+ ',CODTIPRECEBDEV13   = '''+qry.FieldByName('CODTIPRECEBDEV13').AsString     +'''' else sSQL := sSQL + ' ,CODTIPRECEBDEV13  = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('RECPAG').AsString)            <> '' then sSQL := sSQL+ ',RECPAG             = '''+qry.FieldByName('RECPAG').AsString               +'''' else sSQL := sSQL + ' ,RECPAG            = NULL ';
      if Trim(qry.FieldByName('IDEMPRESAPROP').AsString)     <> '' then sSQL := sSQL+ ',IDEMPRESAPROP      = '''+qry.FieldByName('IDEMPRESAPROP').AsString        +'''' else sSQL := sSQL + ' ,IDEMPRESAPROP     = NULL ';
      if Trim(qry.FieldByName('IDEMPRESAPROP13').AsString)   <> '' then sSQL := sSQL+ ',IDEMPRESAPROP13    = '''+qry.FieldByName('IDEMPRESAPROP13').AsString      +'''' else sSQL := sSQL + ' ,IDEMPRESAPROP13   = NULL ';
      if Trim(qry.FieldByName('IDEMPRESADESEMB').AsString)   <> '' then sSQL := sSQL+ ',IDEMPRESADESEMB    = '''+qry.FieldByName('IDEMPRESADESEMB').AsString      +'''' else sSQL := sSQL + ' ,IDEMPRESADESEMB   = NULL ';
      if Trim(qry.FieldByName('RECPAGDESEMB').AsString)      <> '' then sSQL := sSQL+ ',RECPAGDESEMB       = '''+qry.FieldByName('RECPAGDESEMB').AsString         +'''' else sSQL := sSQL + ' ,RECPAGDESEMB      = NULL ';
      if Trim(qry.FieldByName('PLANO').AsString)             <> '' then sSQL := sSQL+ ',PLANO              = '''+qry.FieldByName('PLANO').AsString                +'''' else sSQL := sSQL + ' ,PLANO             = NULL ';
      if Trim(qry.FieldByName('PLANO13').AsString)           <> '' then sSQL := sSQL+ ',PLANO13            = '''+qry.FieldByName('PLANO13').AsString              +'''' else sSQL := sSQL + ' ,PLANO13           = NULL ';

      if piNivel = 2
      then sSQL := sSQL + ' WHERE IDPLANOPREV    = '+IntToStr(piIdPlanoPrevDestino)
      else sSQL := sSQL + ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJurDestino)+
                          ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrevDestino);
      if piIdContribuicaoDestino > 0
      then sSQL := sSQL + ' AND   IDCONTRIBUICAO = '+IntToStr(piIdContribuicaoDestino)
      else sSQL := sSQL + ' AND   IDCONTRIBUICAO = '+qry.FieldByName('IDCONTRIBUICAO').AsString;

      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(sSQL);
      try
        qryGrava.ExecSQL;
      except
        Exit;
      end;
      qry.Next;
   end; // while
   Result := True;
end;

procedure TfrmCadIntegracaoPREV.mnuCopiaPlanoClick(Sender: TObject);
var sSQL     : string;
    mrResult : TModalResult;
    sNome    : string;
    sTipo    : string;
    bkMark : TBookMark;
begin
  inherited;

  if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
  then begin
     if MsgDlg('Esta opção só copiará a parametrização para contribuições de mesmo código. '+#13+
               'Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then Exit;
  end
  else begin
     if MsgDlg('Esta opção só copiará a parametrização para benefícios de mesmo código. '+#13+
               'Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then Exit;
  end;

  
  frmCadIntegracaoPrevAux := TfrmCadIntegracaoPrevAux.Create(Application);
  with frmCadIntegracaoPrevAux do
  begin
     if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
     then begin
        lblDescricao.Caption := 'Selecione o Plano Origem dos Dados a serem copiados ...';
        if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
        then sTipo           := 'Parametrização de Contribuições por Plano'
        else sTipo           := 'Parametrização de Benefícios por Plano';
        sNome                := qryPlano.FieldbyName('NOME').AsString;
     end
     else begin
        lblDescricao.Caption := 'Selecione a Patrocinadora-Plano Origem dos Dados a serem copiados ...';
        if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
        then sTipo           := 'Parametrização de Contribuições por Patrocinadora/Plano'
        else sTipo           := 'Parametrização de Benefícios por Patrocinadora/Plano';
        sNome                := qryPatroPlano.FieldbyName('DESCRICAOGERAL').AsString;
     end;

     if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
     then sSQL := ' SELECT PL.IDPLANOPREV, PL.NOME '+
                  ' FROM   PLANPREV PL             '+
                  ' WHERE  PL.IDPLANOPREV <> '+qryPlano.FieldByName('IDPLANOPREV').AsString+
                  ' ORDER BY PL.NOME               '
     else sSQL := ' SELECT P.NOME||''-''||PL.NOME AS NOME, PLP.IDPESSJUR, PLP.IDPLANOPREV '+
                  ' FROM   PESSOA P, PLANPREV PL, PLANPREVPATRO PLP                '+

                  
                  ' WHERE  PLP.IDPESSJUR||PLP.IDPLANOPREV    <> '+qryPatroPlano.FieldbyName('IDPESSJUR').AsString+qryPatroPlano.FieldbyName('IDPLANOPREV').AsString+
                  

                  ' AND    P.IDPESSOA       = PLP.IDPESSJUR          '+
                  ' AND    PL.IDPLANOPREV   = PLP.IDPLANOPREV        '+
                  ' ORDER BY P.NOME, PL.NOME                         ';
     qryLista.Close;
     qryLista.SQL.Clear;
     qryLista.SQL.Add(sSQL);
     qryLista.Open;
     mrResult := ShowModal;
  end;

  if mrResult <> mrOK
  then begin
     MsgDlg('Cópia de '+sTipo+' cancelada.','Informação',mtInformation,[mbOK],0);
     Abort;
  end;

  if MsgDlg('Confirma a cópia dos dados de '+frmCadIntegracaoPrevAux.qryLista.FieldByName('NOME').AsString+#13+
            'para '+sNome+' ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
     MsgDlg('Cópia de '+sTipo+' cancelada.','Informação',mtInformation,[mbOK],0);
     Abort;
  end;

  if (sbtnSelContribuicao.Down) or (sbtnSelContribuicao13.Down)
  then begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     if qryNivelIntegracao.FieldbyName('NIVEL').AsInteger = 2 
     then begin
        if not CopiaContribuicao( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  -1,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  -1,
                                  -1,
                                  qryPlano.FieldByName('IDPLANOPREV').AsInteger,
                                  -1)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados da '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end
     else begin // por patro x plano
        if not CopiaContribuicao( qryNivelIntegracao.FieldbyName('NIVEL').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPESSJUR').AsInteger,
                                  frmCadIntegracaoPrevAux.qryLista.FieldByName('IDPLANOPREV').AsInteger,
                                  -1,
                                  qryPatroPlano.FieldByName('IDPESSJUR').AsInteger,
                                  qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger,
                                  -1)
        then begin
           frmCadIntegracaoPrevAux.Free;
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Erro ao copiar dados da '+sTipo+'.','Erro',mtError,[mbOK],0);
           Abort;
        end;
     end;
     GravaLogTOTALPREV ('Cópia de '+sTipo+'[Destino:'+sNome+']');


     dtmBaseDados.dbBaseDados.Commit;
     bkMark := dsContrib.DataSet.GetBookmark;
     dsContrib.DataSet.Close;
     dsContrib.DataSet.Open;
     dsContrib.DataSet.GotoBookmark(bkMark);
  end
  else begin

  end;
  frmCadIntegracaoPrevAux.Free;
end;

function TfrmCadIntegracaoPrev.CopiaBeneficio(piNivel                 : integer;
                                                 piIdPessJurOrigem       : longint;
                                                 piIdPlanoPrevOrigem     : longint;
                                                 piIdBENEFICIOOrigem  : longint;
                                                 piIdPessJurDestino      : longint;
                                                 piIdPlanoPrevDestino    : longint;
                                                 piIdBENEFICIODestino : longint ) : boolean;
var sSQL : string;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT       IDBENEFICIO                          '+
                    '        ,CODSUBCONTA                          '+
                    '        ,CODSUBCONTAABN                       '+
                    '        ,IDPLANPREVCONTAB                     '+
                    '        ,PLACONTADEVOL                        '+ 
                    '        ,PLACONTAC                            '+
                    '        ,PLACONTACABN                         '+
                    '        ,PLACONTAD                            '+
                    '        ,PLACONTADABN                         '+
                    '        ,PLACTAACJUD                          '+
                    '        ,PLACONTADADT13                       '+ 
                    '        ,PLACTAACJUD13                        '+
                    '        ,PLACONTADPROVIS                      '+
                    '        ,PLACONTACPROVIS                      '+
                    '        ,PLACONTADPROVADT                     '+
                    '        ,PLACONTACPROVADT                     '+
                    '        ,UNIDNEGOC                            '+
                    '        ,UNIDNEGOCABN                         '+
                    '        ,CODPORTFORMA                         '+
                    '        ,CODPORTFORMAABN                      '+
                    '        ,CODCENTRORESPON                      '+
                    '        ,CODCENTRORESPONA                     '+
                    '        ,CODTIPRECDES                         '+
                    '        ,CODTIPRECDESABN                      '+
                    '        ,CODTIPRECEBCAP                       '+
                    '        ,CODTIPRECEBCAP13                     '+
                    '        ,CODTIPDESEMBPROV                     '+
                    '        ,CODTIPRECDESADT                      '+
                    '        ,CODTIPRECEBDEVOL                     '+
                    '        ,CODRECEBCAPABN                       '+
                    '        ,CODCENTROCUSTOD                      '+ //CPrev - 27438
                    '        ,RECPAGDESEMB                         '+
                    '        ,IDEMPRESADESEMB                      '+
                    '        ,IDEMPRESAPROP                        '+
                    '        ,IDEMPRESAPROPABN                     '+
                    '        ,RECPAG                               '+
                    '        ,PLANO                                ');
   if piNivel = 2
   then qry.SQL.Add(' FROM  BENEFPLANPREV    '+
                    ' WHERE IDPLANOPREV    = '+IntToStr(piIdPlanoPrevOrigem))
   else qry.SQL.Add(' FROM  BENEFPLANPATRO   '+
                    ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJurOrigem)+
                    ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrevOrigem));
   if piIdBENEFICIOOrigem > 0
   then qry.SQL.Add(' AND   IDBENEFICIO = '+IntToStr(piIdBENEFICIOOrigem));

   qry.Open;

   if qry.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   while not qry.Eof do
   begin
      if piNivel = 2
      then sSQL := 'UPDATE BENEFPLANPREV  SET '
      else sSQL := 'UPDATE BENEFPLANPATRO SET ';

      if Trim(qry.FieldByName('PLACONTADEVOL').AsString)    <> '' Then sSQL := sSQL+ '  PLACONTADEVOL      = '''+qry.FieldByName('PLACONTADEVOL').AsString     +'''' else sSQL := sSQL + '  PLACONTADEVOL    = NULL '; 
      if Trim(qry.FieldByName('CODSUBCONTA').AsString)      <> '' then sSQL := sSQL+ ', CODSUBCONTA        = '''+qry.FieldByName('CODSUBCONTA').AsString       +'''' else sSQL := sSQL + ' ,CODSUBCONTA      = NULL ';
      if Trim(qry.FieldByName('CODSUBCONTAABN').AsString)   <> '' then sSQL := sSQL+ ', CODSUBCONTAABN     = '''+qry.FieldByName('CODSUBCONTAABN').AsString    +'''' else sSQL := sSQL + ' ,CODSUBCONTAABN   = NULL ';
      if Trim(qry.FieldByName('IDPLANPREVCONTAB').AsString) <> '' then sSQL := sSQL+ ', IDPLANPREVCONTAB   = '''+qry.FieldByName('IDPLANPREVCONTAB').AsString  +'''' else sSQL := sSQL + ' ,IDPLANPREVCONTAB = NULL ';
      if Trim(qry.FieldByName('PLACONTAC').AsString)        <> '' then sSQL := sSQL+ ', PLACONTAC          = '''+qry.FieldByName('PLACONTAC').AsString         +'''' else sSQL := sSQL + ' ,PLACONTAC        = NULL ';
      if Trim(qry.FieldByName('PLACONTACABN').AsString)     <> '' then sSQL := sSQL+ ', PLACONTACABN       = '''+qry.FieldByName('PLACONTACABN').AsString      +'''' else sSQL := sSQL + ' ,PLACONTACABN     = NULL ';
      if Trim(qry.FieldByName('PLACONTAD').AsString)        <> '' then sSQL := sSQL+ ', PLACONTAD          = '''+qry.FieldByName('PLACONTAD').AsString         +'''' else sSQL := sSQL + ' ,PLACONTAD        = NULL ';
      if Trim(qry.FieldByName('PLACONTADABN').AsString)     <> '' then sSQL := sSQL+ ', PLACONTADABN       = '''+qry.FieldByName('PLACONTADABN').AsString      +'''' else sSQL := sSQL + ' ,PLACONTADABN     = NULL ';
      if Trim(qry.FieldByName('PLACTAACJUD').AsString)      <> '' then sSQL := sSQL+ ', PLACTAACJUD        = '''+qry.FieldByName('PLACTAACJUD').AsString       +'''' else sSQL := sSQL + ' ,PLACTAACJUD      = NULL ';
      if Trim(qry.FieldByName('PLACONTADADT13').AsString)   <> '' then sSQL := sSQL+ ', PLACONTADADT13     = '''+qry.FieldByName('PLACONTADADT13').AsString    +'''' else sSQL := sSQL + ' ,PLACONTADADT13   = NULL '; 
      if Trim(qry.FieldByName('PLACTAACJUD13').AsString)    <> '' then sSQL := sSQL+ ', PLACTAACJUD13      = '''+qry.FieldByName('PLACTAACJUD13').AsString     +'''' else sSQL := sSQL + ' ,PLACTAACJUD13    = NULL ';
      if Trim(qry.FieldByName('PLACONTADPROVIS').AsString)  <> '' then sSQL := sSQL+ ', PLACONTADPROVIS    = '''+qry.FieldByName('PLACONTADPROVIS').AsString   +'''' else sSQL := sSQL + ' ,PLACONTADPROVIS  = NULL ';
      if Trim(qry.FieldByName('PLACONTACPROVIS').AsString)  <> '' then sSQL := sSQL+ ', PLACONTACPROVIS    = '''+qry.FieldByName('PLACONTACPROVIS').AsString   +'''' else sSQL := sSQL + ' ,PLACONTACPROVIS  = NULL ';
      if Trim(qry.FieldByName('PLACONTADPROVADT').AsString) <> '' then sSQL := sSQL+ ', PLACONTADPROVADT   = '''+qry.FieldByName('PLACONTADPROVADT').AsString  +'''' else sSQL := sSQL + ' ,PLACONTADPROVADT = NULL ';
      if Trim(qry.FieldByName('PLACONTACPROVADT').AsString) <> '' then sSQL := sSQL+ ', PLACONTACPROVADT   = '''+qry.FieldByName('PLACONTACPROVADT').AsString  +'''' else sSQL := sSQL + ' ,PLACONTACPROVADT = NULL ';
      if Trim(qry.FieldByName('UNIDNEGOC').AsString)        <> '' then sSQL := sSQL+ ', UNIDNEGOC          = '''+qry.FieldByName('UNIDNEGOC').AsString         +'''' else sSQL := sSQL + ' ,UNIDNEGOC        = NULL ';
      if Trim(qry.FieldByName('UNIDNEGOCABN').AsString)     <> '' then sSQL := sSQL+ ', UNIDNEGOCABN       = '''+qry.FieldByName('UNIDNEGOCABN').AsString      +'''' else sSQL := sSQL + ' ,UNIDNEGOCABN     = NULL ';
      if Trim(qry.FieldByName('CODPORTFORMA').AsString)     <> '' then sSQL := sSQL+ ', CODPORTFORMA       = '''+qry.FieldByName('CODPORTFORMA').AsString      +'''' else sSQL := sSQL + ' ,CODPORTFORMA     = NULL ';
      if Trim(qry.FieldByName('CODPORTFORMAABN').AsString)  <> '' then sSQL := sSQL+ ', CODPORTFORMAABN    = '''+qry.FieldByName('CODPORTFORMAABN').AsString   +'''' else sSQL := sSQL + ' ,CODPORTFORMAABN  = NULL ';
      if Trim(qry.FieldByName('CODCENTRORESPON').AsString)  <> '' then sSQL := sSQL+ ', CODCENTRORESPON    = '''+qry.FieldByName('CODCENTRORESPON').AsString   +'''' else sSQL := sSQL + ' ,CODCENTRORESPON  = NULL ';
      if Trim(qry.FieldByName('CODCENTRORESPONA').AsString) <> '' then sSQL := sSQL+ ', CODCENTRORESPONA   = '''+qry.FieldByName('CODCENTRORESPONA').AsString  +'''' else sSQL := sSQL + ' ,CODCENTRORESPONA = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDES').AsString)     <> '' then sSQL := sSQL+ ', CODTIPRECDES       = '''+qry.FieldByName('CODTIPRECDES').AsString      +'''' else sSQL := sSQL + ' ,CODTIPRECDES     = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDESABN').AsString)  <> '' then sSQL := sSQL+ ', CODTIPRECDESABN    = '''+qry.FieldByName('CODTIPRECDESABN').AsString   +'''' else sSQL := sSQL + ' ,CODTIPRECDESABN  = NULL ';
      if Trim(qry.FieldByName('CODTIPRECEBCAP').AsString)   <> '' then sSQL := sSQL+ ', CODTIPRECEBCAP     = '''+qry.FieldByName('CODTIPRECEBCAP').AsString    +'''' else sSQL := sSQL + ' ,CODTIPRECEBCAP   = NULL ';
      if Trim(qry.FieldByName('CODTIPRECEBCAP13').AsString) <> '' then sSQL := sSQL+ ', CODTIPRECEBCAP13   = '''+qry.FieldByName('CODTIPRECEBCAP13').AsString  +'''' else sSQL := sSQL + ' ,CODTIPRECEBCAP13 = NULL ';
      if Trim(qry.FieldByName('CODTIPDESEMBPROV').AsString) <> '' then sSQL := sSQL+ ', CODTIPDESEMBPROV   = '''+qry.FieldByName('CODTIPDESEMBPROV').AsString  +'''' else sSQL := sSQL + ' ,CODTIPDESEMBPROV = NULL ';
      if Trim(qry.FieldByName('CODTIPRECDESADT').AsString)  <> '' then sSQL := sSQL+ ', CODTIPRECDESADT    = '''+qry.FieldByName('CODTIPRECDESADT').AsString   +'''' else sSQL := sSQL + ' ,CODTIPRECDESADT  = NULL ';
      if Trim(qry.FieldByName('CODTIPRECEBDEVOL').AsString) <> '' then sSQL := sSQL+ ', CODTIPRECEBDEVOL   = '''+qry.FieldByName('CODTIPRECEBDEVOL').AsString  +'''' else sSQL := sSQL + ' ,CODTIPRECEBDEVOL = NULL ';
      if Trim(qry.FieldByName('CODRECEBCAPABN').AsString)   <> '' then sSQL := sSQL+ ', CODRECEBCAPABN     = '''+qry.FieldByName('CODRECEBCAPABN').AsString    +'''' else sSQL := sSQL + ' ,CODRECEBCAPABN   = NULL ';
      if Trim(qry.FieldByName('CODCENTROCUSTOD').AsString)  <> '' then sSQL := sSQL+ ',CODCENTROCUSTOD     = '''+qry.FieldByName('CODCENTROCUSTOD').AsString   +'''' else sSQL := sSQL + ' ,CODCENTROCUSTOD  = NULL '; //CPrev - 27438
      if Trim(qry.FieldByName('RECPAGDESEMB').AsString)     <> '' then sSQL := sSQL+ ', RECPAGDESEMB       = '''+qry.FieldByName('RECPAGDESEMB').AsString      +'''' else sSQL := sSQL + ' ,RECPAGDESEMB     = NULL ';
      if Trim(qry.FieldByName('IDEMPRESADESEMB').AsString)  <> '' then sSQL := sSQL+ ', IDEMPRESADESEMB    = '''+qry.FieldByName('IDEMPRESADESEMB').AsString   +'''' else sSQL := sSQL + ' ,IDEMPRESADESEMB  = NULL ';
      if Trim(qry.FieldByName('IDEMPRESAPROP').AsString)    <> '' then sSQL := sSQL+ ', IDEMPRESAPROP      = '''+qry.FieldByName('IDEMPRESAPROP').AsString     +'''' else sSQL := sSQL + ' ,IDEMPRESAPROP    = NULL ';
      if Trim(qry.FieldByName('IDEMPRESAPROPABN').AsString) <> '' then sSQL := sSQL+ ', IDEMPRESAPROPABN   = '''+qry.FieldByName('IDEMPRESAPROPABN').AsString  +'''' else sSQL := sSQL + ' ,IDEMPRESAPROPABN = NULL ';
      if Trim(qry.FieldByName('RECPAG').AsString)           <> '' then sSQL := sSQL+ ', RECPAG             = '''+qry.FieldByName('RECPAG').AsString            +'''' else sSQL := sSQL + ' ,RECPAG           = NULL ';
      if Trim(qry.FieldByName('PLANO').AsString)            <> '' then sSQL := sSQL+ ', PLANO              = '''+qry.FieldByName('PLANO').AsString             +'''' else sSQL := sSQL + ' ,PLANO            = NULL ';

      if piNivel = 2
      then sSQL := sSQL + ' WHERE IDPLANOPREV    = '+IntToStr(piIdPlanoPrevDestino)
      else sSQL := sSQL + ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJurDestino)+
                          ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrevDestino);
      if piIdBENEFICIODestino > 0
      then sSQL := sSQL + ' AND   IDBENEFICIO = '+IntToStr(piIdBENEFICIODestino)
      else sSQL := sSQL + ' AND   IDBENEFICIO = '+qry.FieldByName('IDBENEFICIO').AsString;

      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(sSQL);
      try
        qryGrava.ExecSQL;
      except
        Exit;
      end;
      qry.Next;
   end; 
   Result := True;
end;

procedure TfrmCadIntegracaoPREV.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  
  AbreArvoreTipoRecebimento(3, 202, 302);
end;

procedure TfrmCadIntegracaoPREV.bbtnCancelarClick(Sender: TObject);
begin

  If dtmBaseDados.dbBaseDados.Intransaction Then
    dtmBaseDados.dbBaseDados.RollBack;

  inherited;

  if sbtnSelDivBenef.Down then        //edilaine SIG115304
     sbtnSelDivBenefClick(Sender);    //edilaine SIG115304

end;

procedure TfrmCadIntegracaoPREV.bbtnSairClick(Sender: TObject);
begin
  
  If dtmBaseDados.dbBaseDados.Intransaction Then
    dtmBaseDados.dbBaseDados.RollBack;
  inherited;
end;

procedure TfrmCadIntegracaoPREV.FormCreate(Sender: TObject);
begin
  inherited;
  
  tbsBenefContabilProvisao.TabVisible := False;
end;

procedure TfrmCadIntegracaoPREV.dblkpcmbPatroPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if sbtnSelContribuicao.Down
  then sbtnSelContribuicaoClick(Sender)
  else if sbtnSelContribuicao13.Down
       then sbtnSelContribuicao13Click(Sender)
       else if sbtnSelBeneficio.Down
            then sbtnSelBeneficioClick(Sender)
            else if sbtnSelBeneficio13.Down
                 then sbtnSelBeneficio13Click(Sender);
end;

procedure TfrmCadIntegracaoPREV.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  
  if sbtnSelContribuicao.Down
  then sbtnSelContribuicaoClick(Sender)
  else if sbtnSelContribuicao13.Down
       then sbtnSelContribuicao13Click(Sender)
       else if sbtnSelBeneficio.Down
            then sbtnSelBeneficioClick(Sender)
            else if sbtnSelBeneficio13.Down
                 then sbtnSelBeneficio13Click(Sender)
                 else if sbtnSelDivBenef.Down               //edilaine SIG115304
                      then sbtnSelDivBenefClick(Sender);    //edilaine SIG115304

end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADADT13Click(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(21, 427, 298, edPLACONTADADT13.Text);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADADT13Exit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADADT13.Text,
                             edPLACONTADADT13,
                             lblPLACONTADADT13);

end;

procedure TfrmCadIntegracaoPREV.edPLACONTACADT13Exit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACADT13.Text,
                             edPLACONTACADT13,
                             lblDescPLACONTACADT13);

end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACADT13Click(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(22, 451, 298,edContaContabilAcaoJudicial.Text);
end;

procedure TfrmCadIntegracaoPREV.edPlaContaDBenefGERALExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPlaContaDBenefGERAL.Text,
                             edPlaContaDBenefGERAL,
                             lblPlaContaDBenefGERAL);

end;

procedure TfrmCadIntegracaoPREV.sbtnPlaContaDBenefGERALClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(311, 308, 305, edPlaContaDBenefGERAL.Text);
end;

procedure TfrmCadIntegracaoPREV.qryPlanPrevPatroAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  PreencheCamposPlanPrevPatro;
end;

procedure TfrmCadIntegracaoPREV.sbtnPlaContaDevolClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(24, 360, 298, edPlaContaDevol.Text);
end;

procedure TfrmCadIntegracaoPREV.edPlaContaDevolExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPlaContaDevol.Text,
                             edPlaContaDevol,
                             lblPlaContaDevol);
end;

//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
procedure TfrmCadIntegracaoPREV.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(8, 220, 317);
end;
//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
procedure TfrmCadIntegracaoPREV.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(9, 365, 317);
end;
//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
procedure TfrmCadIntegracaoPREV.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(5, 270, 317);
end;
//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674
procedure TfrmCadIntegracaoPREV.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(6, 415, 317);
end;
//BRUNO AZEVEDO SOL 123366/9801 KINTANA 1671674

//Início - William Santana - SOL 164620.11384 KIN 1816211
procedure TfrmCadIntegracaoPREV.sbtnCCAbonoClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(25, 178, 295,edCCAbono.Text);

end;

procedure TfrmCadIntegracaoPREV.sbtnCCCorrMonClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(26, 257, 295,edCCCorrMon.Text);

end;

procedure TfrmCadIntegracaoPREV.edCCAbonoExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edCCAbono.Text,
                             edCCAbono,
                             lblContaContabAbono);
end;

procedure TfrmCadIntegracaoPREV.edCCCorrMonExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edCCCorrMon.Text,
                             edCCCorrMon,
                             lblContaContabCorrMon);

end;

//Término - William Santana -  SOL 164620.11384 KIN 1816211


//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.spdContaProvPerdaClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(27, 190, 310, edContaProvPerda.Text);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.spdContaProvPerdaDClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(28, 295, 310, edContaProvPerdaD.Text);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.spdContaProvPerdaCClick(Sender: TObject);
begin
  inherited;
  AbreArvoreContabil(29, 405, 310, edContaProvPerdaC.Text);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.edContaProvPerdaExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaProvPerda.Text,
                             edContaProvPerda,
                             lbDescricaoContaProvPerda);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.edContaProvPerdaDExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaProvPerdaD.Text,
                             edContaProvPerdaD,
                             lbDescricaoContaProvPerdaD);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.edContaProvPerdaCExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edContaProvPerdaC.Text,
                             edContaProvPerdaC,
                             lbDescricaoContaProvPerdaC);
end;


//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.sbtnTpRecebEmAtrasoClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(7, 196, 310);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmCadIntegracaoPREV.sbtnTpDesembEmAtrasoClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(10, 280, 310);
end;

//edilaine SIG115304 : inicio
procedure TfrmCadIntegracaoPREV.sbtnPLACONTADFORMASDODIVClick(
  Sender: TObject);
var
  iTop  : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(30, iTop, 115,  edPLACONTADFORMASDODIV.Text);  //edilaine SIG136150
  AbreArvoreContabil(30, iTop+5, TSpeedButton(Sender).Left+50,  edPLACONTADFORMASDODIV.Text);  //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACFORMASDODIVClick(Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(31, iTop, 115, edPLACONTACFORMASDODIV.Text);   //edilaine SIG136150
  AbreArvoreContabil(31, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACFORMASDODIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADREVFORMASDODIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(32, iTop, 115, edPLACONTADREVFORMASDODIV.Text);   //edilaine SIG136150
  AbreArvoreContabil(32, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADREVFORMASDODIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACREVFORMASDODIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(33, iTop, 115, edPLACONTACREVFORMASDODIV.Text);   //edilaine SIG136150
  AbreArvoreContabil(33, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACREVFORMASDODIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADBAIXADIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(34, iTop, 115, edPLACONTADBAIXADIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(34, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADBAIXADIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACBAIXADIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(35, iTop, 115, edPLACONTACBAIXADIV.Text);   //edilaine SIG136150
  AbreArvoreContabil(35, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACBAIXADIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADREVBAIXADIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(36, iTop, 115, edPLACONTADREVBAIXADIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(36, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADREVBAIXADIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACREVBAIXADIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(37, iTop, 115, edPLACONTACREVBAIXADIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(37, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACREVBAIXADIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADPROVDIVClick(Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(38, iTop, 115, edPLACONTADPROVDIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(38, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADPROVDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACPROVDIVClick(Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(39, iTop, 115, edPLACONTACPROVDIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(39, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACPROVDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADREVPROVDIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(40, iTop, 115, edPLACONTADREVPROVDIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(40, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADREVPROVDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACREVPROVDIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(41, iTop, 115, edPLACONTACREVPROVDIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(41, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACREVPROVDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTADATUREAJDIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(42, iTop, 115, edPLACONTADATUREAJDIV.Text);   //edilaine SIG136150
  AbreArvoreContabil(42, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTADATUREAJDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnPLACONTACATUREAJDIVClick(
  Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  //AbreArvoreContabil(43, iTop, 115, edPLACONTACATUREAJDIV.Text);    //edilaine SIG136150
  AbreArvoreContabil(43, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACATUREAJDIV.Text);   //edilaine SIG136150
end;

procedure TfrmCadIntegracaoPREV.sbtnSelDivBenefClick(Sender: TObject);
begin
  inherited;
  //edilaine SIG136150 : inicio
  pnlIntegracao.Visible    := false;
  pnlDividaBenef.visible   := true;
  pnlDividaBenef.bringToFront;

  {pnlIntegEsquerda.visible := false;
  pnlIntegDireita.visible  := false;
  }//edilaine SIG136150 : fim

  // 1 - 'Informações Gerais'
  // 2 - 'Parametrização por Plano'
  // 3 - 'Parametrização por Patrocinadora x Plano'
  // 4 - 'Parametrização por Pessoa (Exceções)'
  if qryNivelIntegracao.FieldByName('NIVEL').AsInteger = 2
  then begin
     if Trim(dblkpcmbPlano.Text) = ''
     then begin
        MsgDlg('Selecione o Plano Previdenciário desejado.','Erro',mtError,[mbOK],0);
        Abort;
     end;
  end;

  if sbtnSelDivBenef.GroupIndex = 0
  then begin
    sbtnSelContribuicao.GroupIndex   := 1;
    sbtnSelBeneficio.GroupIndex      := 1;
    sbtnSelContribuicao13.GroupIndex := 1;
    sbtnSelBeneficio13.GroupIndex    := 1;
    sbtnSelDivBenef.GroupIndex       := 1;
    sbtnSelDivBenef.Down             := True;
  end;

  PreencheCamposPlano;
end;


function TfrmCadIntegracaoPREV.GravaCamposPlano : boolean;
var sSQL   : string;
    bkMark : TBookMark;
begin
  Result := False;

  // ***************************************************************************
  // GRAVAR PLANOS
  // ( obs. ver no final do codigo as constraints pois existem várias
  //   constraints usando o mesmo rolename )
  // ***************************************************************************

  sSQL := 'UPDATE PLANPREV  SET ';

  if (edPLACONTADFORMASDODIV.Visible) then
  begin
    if Trim(edPLACONTADFORMASDODIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + 'PLACONTADDIVSALDO   = '''+Trim(edPLACONTADFORMASDODIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + 'PLACONTADDIVSALDO   = NULL';
     end;
  end;


  if (edPLACONTACFORMASDODIV.Visible) then
  begin
    if Trim(edPLACONTACFORMASDODIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVSALDO   = '''+Trim(edPLACONTACFORMASDODIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVSALDO   = NULL';
     end;
  end;

  if (edPLACONTADREVFORMASDODIV.Visible) then
  begin
    if Trim(edPLACONTADREVFORMASDODIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVSLDREV   = '''+Trim(edPLACONTADREVFORMASDODIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVSLDREV   = NULL';
     end;
  end;


  if (edPLACONTACREVFORMASDODIV.Visible) then
  begin
    if Trim(edPLACONTACREVFORMASDODIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVSLDREV   = '''+Trim(edPLACONTACREVFORMASDODIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVSLDREV   = NULL';
     end;
  end;


  if (edPLACONTADBAIXADIV.Visible) then
  begin
    if Trim(edPLACONTADBAIXADIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVBAIXA   = '''+Trim(edPLACONTADBAIXADIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVBAIXA   = NULL';
     end;
  end;

  if (edPLACONTACBAIXADIV.Visible) then
  begin
    if Trim(edPLACONTACBAIXADIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVBAIXA   = '''+Trim(edPLACONTACBAIXADIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVBAIXA   = NULL';
     end;
  end;

  if (edPLACONTADREVBAIXADIV.Visible) then
  begin
    if Trim(edPLACONTADREVBAIXADIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVBAIXAREV   = '''+Trim(edPLACONTADREVBAIXADIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVBAIXAREV   = NULL';
     end;
  end;

  if (edPLACONTACREVBAIXADIV.Visible) then
  begin
    if Trim(edPLACONTACREVBAIXADIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVBAIXAREV   = '''+Trim(edPLACONTACREVBAIXADIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVBAIXAREV   = NULL';
     end;
  end;


  if (edPLACONTADPROVDIV.Visible) then
  begin
    if Trim(edPLACONTADPROVDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVPROVISAO   = '''+Trim(edPLACONTADPROVDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVPROVISAO   = NULL';
     end;
  end;

  if (edPLACONTACPROVDIV.Visible) then
  begin
    if Trim(edPLACONTACPROVDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVPROVISAO   = '''+Trim(edPLACONTACPROVDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVPROVISAO   = NULL';
     end;
  end;


  if (edPLACONTADREVPROVDIV.Visible) then
  begin
    if Trim(edPLACONTADREVPROVDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVPROVREV   = '''+Trim(edPLACONTADREVPROVDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVPROVREV   = NULL';
     end;
  end;

  if (edPLACONTACREVPROVDIV.Visible) then
  begin
    if Trim(edPLACONTACREVPROVDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVPROVREV   = '''+Trim(edPLACONTACREVPROVDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVPROVREV   = NULL';
     end;
  end;

  if (edPLACONTADATUREAJDIV.Visible) then
  begin
    if Trim(edPLACONTADATUREAJDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVATUREAJ   = '''+Trim(edPLACONTADATUREAJDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTADDIVATUREAJ   = NULL';
     end;
  end;

  if (edPLACONTACATUREAJDIV.Visible) then
  begin
    if Trim(edPLACONTACATUREAJDIV.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVATUREAJ   = '''+Trim(edPLACONTACATUREAJDIV.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACDIVATUREAJ   = NULL';
     end;
  end;

  //edilaine SIG136150 : inicio
  if (edPLACONTACBOLETO.Visible) then
  begin
    if Trim(edPLACONTACBOLETO.Text) <> '' then
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACBOLETO  = '''+Trim(edPLACONTACBOLETO.Text)+'''';
     end
    else
    begin
      if sbtnSelDivBenef.Down then
        sSQL := sSQL + ',PLACONTACBOLETO  = NULL';
     end;
  end;

  if (dblkpCentresponDivida.Visible) then
  begin
    if Trim(dblkpCentresponDivida.Text) <> '' then
        sSQL := sSQL + ',CODCENTRORESPONDIVIDA  = '''+dtmIntegraCAPCAR.qrycentrespon.FieldByName('CODCENTRORESPON').AsString+''''
    else
        sSQL := sSQL + ',CODCENTRORESPONDIVIDA  = NULL';
  end;

  if (dblkpCentcustoDivida.Visible) then
  begin
    if Trim(dblkpCentcustoDivida.Text) <> '' then
        sSQL := sSQL + ',CODCENTROCUSTODIVIDA  = '''+dtmIntegraCAPCAR.qryCCusto.FieldByName('CODCENTROCUSTO').AsString+''''
    else
        sSQL := sSQL + ',CODCENTROCUSTODIVIDA  = NULL';
  end;

  //leandro SIG136150 INICIO
  if (dblkpTipoReembDivida.Visible) then
  begin
    if Trim(dblkpCentcustoDivida.Text) <> '' then
        sSQL := sSQL + ',CODTIPRECDESDIVIDA  = '''+qryTpReceb.FieldByName('CODTIPRECDES').AsString+''''
    else
        sSQL := sSQL + ',CODTIPRECDESDIVIDA  = NULL';
  end;
  //leandro SIG136150 FIM

  if (dblkpRubBaixaBol.Visible) then
  begin
    if Trim(dblkpRubBaixaBol.Text) <> '' then
        sSQL := sSQL + ',IDRUBRICARECBOLDIVIDA  = '+qryProventos.FieldByName('IDPROVENTO').AsString
    else
        sSQL := sSQL + ',IDRUBRICARECBOLDIVIDA  = NULL';
  end;

  if (dblkpAltBaixaBol.Visible) then
  begin
    if Trim(dblkpAltBaixaBol.Text) <> '' then
        sSQL := sSQL + ',CODALTERADORBAIXA  = '+qryAltBaixa.FieldByName('CODALTERADOR').AsString
    else
        sSQL := sSQL + ',CODALTERADORBAIXA  = NULL';
  end;
  //edilaine SIG136150 : fim

  sSQL := sSQL + ' WHERE IDPLANOPREV    = '+qryPlano.FieldByName('IDPLANOPREV').AsString;

  qryGrava.Close;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(sSQL);

  try
     qryGrava.ExecSQL;
  except
    Exit;
  end;

  Result := True;
end;


procedure TfrmCadIntegracaoPREV.PreencheCamposPlano;
begin
   frmAguarde.Mostra('Buscando Informações do Benefício ...');
   with qryPlano do
   begin
     if (FieldByName('PLACONTADDIVSALDO').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVSALDO').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADFORMASDODIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADFORMASDODIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADFORMASDODIV.Text      := '';
        lblPLACONTADFORMASDODIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVSALDO').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVSALDO').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACFORMASDODIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACFORMASDODIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACFORMASDODIV.Text      := '';
        lblPLACONTACFORMASDODIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVSLDREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVSLDREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADREVFORMASDODIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADREVFORMASDODIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADREVFORMASDODIV.Text      := '';
        lblPLACONTADREVFORMASDODIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVSLDREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVSLDREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACREVFORMASDODIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACREVFORMASDODIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACREVFORMASDODIV.Text      := '';
        lblPLACONTACREVFORMASDODIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVBAIXA').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVBAIXA').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADBAIXADIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADBAIXADIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADBAIXADIV.Text      := '';
        lblPLACONTADBAIXADIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVBAIXA').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVBAIXA').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACBAIXADIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACBAIXADIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACBAIXADIV.Text      := '';
        lblPLACONTACBAIXADIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVBAIXAREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVBAIXAREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADREVBAIXADIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADREVBAIXADIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADREVBAIXADIV.Text      := '';
        lblPLACONTADREVBAIXADIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVBAIXAREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVBAIXAREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACREVBAIXADIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACREVBAIXADIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACREVBAIXADIV.Text      := '';
        lblPLACONTACREVBAIXADIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVPROVISAO').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVPROVISAO').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADPROVDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADPROVDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADPROVDIV.Text      := '';
        lblPLACONTADPROVDIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVPROVISAO').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVPROVISAO').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACPROVDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACPROVDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACPROVDIV.Text      := '';
        lblPLACONTACPROVDIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVPROVREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVPROVREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADREVPROVDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADREVPROVDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADREVPROVDIV.Text      := '';
        lblPLACONTADREVPROVDIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVPROVREV').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVPROVREV').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACREVPROVDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACREVPROVDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACREVPROVDIV.Text      := '';
        lblPLACONTACREVPROVDIV.Caption  := '';
     end;

     if (FieldByName('PLACONTADDIVATUREAJ').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTADDIVATUREAJ').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTADATUREAJDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTADATUREAJDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTADATUREAJDIV.Text      := '';
        lblPLACONTADATUREAJDIV.Caption  := '';
     end;

     if (FieldByName('PLACONTACDIVATUREAJ').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACDIVATUREAJ').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACATUREAJDIV.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACATUREAJDIV.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACATUREAJDIV.Text      := '';
        lblPLACONTACATUREAJDIV.Caption  := '';
     end;

     //edilaine SIG136150 : inicio
     if (FieldByName('PLACONTACBOLETO').AsString <> '') and
        (qryContaContabil.Locate('PLACONTA',FieldByName('PLACONTACBOLETO').AsString,[loCaseInsensitive,loPartialKey]))
     then begin
        edPLACONTACBOLETO.Text      := qryContaContabil.FieldbyName('PlaConta').AsString;
        lblPLACONTACBOLETO.Caption  := qryContaContabil.FieldByName('PlaNome').AsString;
     end
     else begin
        edPLACONTACBOLETO.Text      := '';
        lblPLACONTACBOLETO.Caption  := '';
     end;

     if (FieldByName('CODCENTRORESPONDIVIDA').AsString <> '' )            and
        (dtmIntegraCAPCAR.qrycentrespon.Locate('CODCENTRORESPON', FieldByName('CODCENTRORESPONDIVIDA').AsString,[loCaseInsensitive,loPartialKey]))
     then dblkpCentresponDivida.Text := dtmIntegraCAPCAR.qrycentrespon.FieldbyName('NOME').AsString
     else dblkpCentresponDivida.Text := '';

     if (FieldByName('CODCENTROCUSTODIVIDA').AsString <> '' )            and
        (dtmIntegraCAPCAR.qryCCusto.Locate('CODCENTROCUSTO', FieldByName('CODCENTROCUSTODIVIDA').AsString,[loCaseInsensitive,loPartialKey]))
     then dblkpCentcustoDivida.Text := dtmIntegraCAPCAR.qryCCusto.FieldbyName('NOME').AsString
     else dblkpCentcustoDivida.Text := '';

     if (FieldByName('CODTIPRECDESDIVIDA').AsString <> '' )            and
        (qryTpReceb.Locate('CODTIPRECDES', FieldByName('CODTIPRECDESDIVIDA').AsString,[loCaseInsensitive,loPartialKey]))
     then dblkpTipoReembDivida.Text := qryTpReceb.FieldbyName('DESCRICAO').AsString
     else dblkpTipoReembDivida.Text := '';

     if (FieldByName('IDRUBRICARECBOLDIVIDA').AsString <> '' )            and
        (qryProventos.Locate('IDPROVENTO', FieldByName('IDRUBRICARECBOLDIVIDA').AsString,[loCaseInsensitive,loPartialKey]))
     then dblkpRubBaixaBol.Text := qryProventos.FieldbyName('DESCRICAO').AsString
     else dblkpRubBaixaBol.Text := '';

     if (FieldByName('CODALTERADORBAIXA').AsString <> '' )            and
        (qryAltBaixa.Locate('CODALTERADOR', FieldByName('CODALTERADORBAIXA').AsString,[loCaseInsensitive,loPartialKey]))
     then dblkpAltBaixaBol.Text := qryAltBaixa.FieldbyName('DESCRICAO').AsString
     else dblkpAltBaixaBol.Text := '';
     //edilaine SIG136150 : fim
     
   end;

   frmAguarde.Apaga;

end;

procedure TfrmCadIntegracaoPREV.edPLACONTADFORMASDODIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADFORMASDODIV.Text,
                             edPLACONTADFORMASDODIV,
                             lblPLACONTADFORMASDODIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACFORMASDODIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACFORMASDODIV.Text,
                             edPLACONTACFORMASDODIV,
                             lblPLACONTACFORMASDODIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADREVFORMASDODIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADREVFORMASDODIV.Text,
                             edPLACONTADREVFORMASDODIV,
                             lblPLACONTADREVFORMASDODIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACREVFORMASDODIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACREVFORMASDODIV.Text,
                             edPLACONTACREVFORMASDODIV,
                             lblPLACONTACREVFORMASDODIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADBAIXADIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADBAIXADIV.Text,
                             edPLACONTADBAIXADIV,
                             lblPLACONTADBAIXADIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACBAIXADIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACBAIXADIV.Text,
                             edPLACONTACBAIXADIV,
                             lblPLACONTACBAIXADIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADREVBAIXADIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADREVBAIXADIV.Text,
                             edPLACONTADREVBAIXADIV,
                             lblPLACONTADREVBAIXADIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACREVBAIXADIVExit(
  Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACREVBAIXADIV.Text,
                             edPLACONTACREVBAIXADIV,
                             lblPLACONTACREVBAIXADIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADPROVDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADPROVDIV.Text,
                             edPLACONTADPROVDIV,
                             lblPLACONTADPROVDIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACPROVDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACPROVDIV.Text,
                             edPLACONTACPROVDIV,
                             lblPLACONTACPROVDIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADREVPROVDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADREVPROVDIV.Text,
                             edPLACONTADREVPROVDIV,
                             lblPLACONTADREVPROVDIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACREVPROVDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACREVPROVDIV.Text,
                             edPLACONTACREVPROVDIV,
                             lblPLACONTACREVPROVDIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTADATUREAJDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTADATUREAJDIV.Text,
                             edPLACONTADATUREAJDIV,
                             lblPLACONTADATUREAJDIV);
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACATUREAJDIVExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACATUREAJDIV.Text,
                             edPLACONTACATUREAJDIV,
                             lblPLACONTACATUREAJDIV);
end;
                             

//edilaine SIG136150 : inicio
procedure TfrmCadIntegracaoPREV.btnRubBaixaBolClick(Sender: TObject);
begin
  inherited;
  dblkpRubBaixaBol.Text := SelecionaRubrica(MSProvento);
  dblkpRubBaixaBol.PerformSearch;
end;

function TfrmCadIntegracaoPREV.SelecionaRubrica(MontaSelect : TMontaSelect): string;
begin
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
     Result := MontaSelect.ValoresChave[1];
  End;
end;

procedure TfrmCadIntegracaoPREV.edPLACONTACBOLETOExit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit( edPLACONTACBOLETO.Text,
                             edPLACONTACBOLETO,
                             lblPLACONTACBOLETO);
end;

procedure TfrmCadIntegracaoPREV.sbtnTipoReembDividaClick(Sender: TObject);
begin
  inherited;
//  AbreArvoreTipoDesembolso(11, 202, 305);
  AbreArvoreTipoRecebimento(8, 202, 305)
end;

procedure TfrmCadIntegracaoPREV.btnPLACONTACBOLETOClick(Sender: TObject);
var
  iTop : integer;
begin
  inherited;
  iTop  := pnlTopo.Height + TGroupBox(TSpeedButton(Sender).Parent).top + TSpeedButton(Sender).Top + TSpeedButton(Sender).Height;

  AbreArvoreContabil(44, iTop+5, TSpeedButton(Sender).Left+50, edPLACONTACBOLETO.Text);
end;

end.

