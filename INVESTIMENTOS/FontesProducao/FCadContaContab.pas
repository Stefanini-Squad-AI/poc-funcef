//******************************************************************************
// Rotina     : Procedure HabBtn
// SOL        : 171206
// Kintana    : 1533850
// Data       : 09/01/2012
// Responsável: Otacilio aquino
// Descrição  : Implementação de ajuste integração contábil/financeira permitindo
//              alteração do tipo de rubrica sem a seleção da mesma.
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_30
// Pendencia : 27768
// SOL       : 83307
// Motivo    : Implementação de ajuste na busca por tipo de títulos para Fundo
//             de Investimentos.
//******************************************************************************
// Data	     : 03/03/2008
// Codigo    : AL_29
// Pendência : 27514
// Desc      : Retirado o tratamento para tipo de rúbrica para Fundos de R. Fixa.
//             Implementado um ajuste na QryTipoTitulo, estava ocorrendo duplicidade de
//              tipos de fundos.
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_27
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação do controle de processos para os fundos do tipo FMI
//******************************************************************************
//******************************************************************************
// Data      : 08/11/2007
// Código    : AL_26
// Pendencia : 26386
// Motivo    : Inclusão de Fundo de Investimento
//******************************************************************************
// Data      : 27/09/2007
// Código    : AL_25
// Pendencia : 26386
// Motivo    : Inclusão de Plano/Patrocinadora
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_24
// Motivo    : Implementação para buscar tipos de titulos para Fundo de FIDC, com qlq
//             nomenclatura(QryTipoTitulo)
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_23
// Pendencia : 23954
// Motivo    : Implementação dos tipos de titulo de Fundos: (FICDC,FFIDC,FRFPA) - QryTipoTitulo
//******************************************************************************
// Data      : 22/11/2006
// Código    : AL_22
// Pendencia : 23213
// SOL       : 45954
// Motivo    : Alteração nos centros de custo: Centro de Custo de Conta a Crédito
//               se tornou o Centro de Custo Único para Financeiro e Contábil
//             Alterado o DFM.
//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_21
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Incluido o tipo de fundo FIP(10), na query QryBuscaTipoInvestimento
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_20
// Motivo    : Alterado a busca do usuário que fez o lançamento ou a atualização
//             contábil na qryDetalhe.
//******************************************************************************
// Data      : 12/06/2006
// Código    : AL_19
// Motivo    : Acerto na filtragem de Renda Fixa quando não tem item
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_18
// Motivo    : Retirada querys não utilizadas(QryBuscaRegra,qryPlanoConta,QryTipoPer e
 //            QryBuscaUsuario) e otimização na entrada da tela
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_17
// Pendencia : 21303
// SOL       : 20264
// Motivo    : Implementação da identificação do usuário que cadastrou ou alterou
//             o registro
//******************************************************************************
// Data      : 24/05/2006
// Código    : AL_16
// Motivo    : Ajuste na identificação do tipo de rubrica, para caraimbar o
//             resgistro corretamente
//******************************************************************************
// Data      : 15/05/2006
// Código    : AL_15
// Motivo    : Acerto na alteração do tipo de lançamento na gravação do RCPAG
//******************************************************************************
//Data   : 22/09/2005
//Código : AL_14
//Função : Implantação da rubrica para o Fundo de FIDC.
//********************************************************************************************************
//Data   : 24/08/2005
//Código : AL_13
//Função : Atualização do tipo de desenbolso conforme o tipo de lançamento
//********************************************************************************************************
//Data   : 27/06/2005
//Código : AL_12
//Função : Acerto na qryDetalhe para filtra o IDTIPOINVEST da TIPOOPERACAO pois estava causando Cartesiano
//         quando Fundos de Investimento
//********************************************************************************************************
//Data   : 21/06/2005
//Código : AL_11
//Função : QryTipoTitulo - Implementação do tipo de título FRFIP - Fundo de Inv. em Participação
//********************************************************************************************************
//Data   : 01/06/2005
//Código : AL_10
//Função : retirado do insert da updDetalhe a trigger "TRGUSERINCLUSAO"
//********************************************************************************************************
//Data   : 18/05/2005
//Código : AL_9
//Função : Liberado o ComboBox de Tipo de Rubrica para Fundo de Ações.
//********************************************************************************************************
//Data   : 02/02/2005
//Código : AL_8
//Função : Liberado o ComboBox de Tipo de Titulo para todos os Fundos.
//********************************************************************************************************
//Data   : 29/12/2004
//Função : Permitido AllowClearKey nas combos DBcboTipoRecebimento, DbLkcCentRespon
//******************************************************************************
//Data   : 21/12/2004
//Código : AL_
//Motivo : Ajuste no MontaSelect para fazer OuterJoin do Nome do Usuário e
//           trazer 'CM' para quem não for reconhecido
//         Somente no DFM
//******************************************************************************
//Data   : 17/12/2004
//Código : AL_6
//Motivo : Criado o Botão para efetuar Cópia de um registro do parametro com outro ID
//         Criada Rotina para Selecionar o Registro na Tela
//******************************************************************************
//Data   : 23/11/2004
//Código : AL_5
//Motivo : Volta o Combo de Investimento de Renda Variável
//         Acerto geral de lay-out
//         Retirada dos investimentos de RF de dentro da QryBuscaInvestimento (DFM)
//         Criação da Rotina de Habilitação dos botões de Alteração do Registro para
//                critica de quando o registro pode ser alterado
//         Inclusão das descrições dos Combos na query Detalhe(DFM)
//         Inclusão das descrições dos Combos no GRID
//********************************************************************************************************
//Data          :    13/10/2004
//Função        :    QryDetalhe, implementação do DISTINCT
//********************************************************************************************************
//Data          :    13/10/2004
// AL_4
//Função        :    Incluido o Campo DESCTIPOOPERACAO na qryDetalhe e no GrdDetalhe
//********************************************************************************************************
//Data          :    17/08/2004
// AL_4
//Função        :    Cadastrou, mas não colocou a conta, o plano não é gravado
//********************************************************************************************************
//Data          :    13/08/2004
// AL_4
//Função        :    Implementacao de Form de Paramentro fora do DMRelatorio
//********************************************************************************************************
//Data          :    05/08/2004
// AL_3
//Função        :    Acerto no Lay-out para mostrar o Tipo de Titulo qdo Fundo de R.Fixa
//********************************************************************************************************
//Data          :    28/07/2004
//Função        :    Ajuste no SQL da QryDetalhe.
//                   Ajuste da pesquisa da QryDetalhe
//********************************************************************************************************
//Data	 	: 08/07/2004
//Linha         : AL_2
//Função        : Filtra o Investimento de Renda Fixa pela Classe Selecionada (PAS e DFM)
//                Ajuste no Posicionamento do Filtro de Investimentos (PAS)
//                Ajuste no TabOrder para correta digitação de dados na tela (DFM)
//******************************************************************************
// Data         : 14/07/2004
// Motivo       : Trocado o Nome da qry K para qryPlanoConta
//                Retirado o Owner CM. das qrys : qryPlanoConta , QryBuscaTipoInvestimento,
//                QryBuscaTipoOperacao, QryDetalhe, updDetalhe, QryBuscaRegra
//********************************************************************************************************
//Data	 	: 07/07/2004
//Linha         : AL_1
//Função        : A Refer passou a utilizar o Renda Fixa novo - Morre a distinção
//********************************************************************************************************
//Data          :    20/05/2004
//Função        :    Implementado HabilitaCombos ao invés de MontaMenuRendaFixa
//                   Acerto no Lay-out
//********************************************************************************************************
//Data          :    19/05/2004
//Função        :    Retirado os componentes do Renda Fixa Antigo
//********************************************************************************************************
//Data          :      28/04/2004
//Função        :   *  O Tipo de Investimento passa a vir já preenchido e o foco posicionado
//                  *  Habilita os controles de RF antigos e novos para implantação da Refer
//*******************************************************************************
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário Cadastro de Contas Contabeis
// Form     .: FrmCadContaContab - Unit .: FCadContaContab
// Data     .: 09/02/1999
//------------------------------------------------------------------

Unit FCadContaContab;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls,
   wwdblook, ComCtrls, CMTree, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti,
   IvEMulti, wwdbedit, Wwdotdot, Wwdbcomb, FOkCancelar, FPreview, fcLabel,
   wwdbdatetimepicker, CMDateTimePicker;

Type
   TFrmCadContaContab = Class(TfrmOkCancelar)
      QryBuscaTipoOperacao: TwwQuery;
      QryBuscaTipoInvestimento: TwwQuery;
      DsBuscaTipoInvestimento: TwwDataSource;
      //AL_18
      QryCCusto: TwwQuery;
      QryAux: TwwQuery;
      QryBuscaAtividade: TwwQuery;
      QryBuscaCentRespon: TwwQuery;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      Panel1: TPanel;
      GrdDetalhe: TwwDBGrid;
      Dock977: TDock97;
      Toolbar974: TToolbar97;
      BtIncDet: TSpeedButton;
      BtAltDet: TSpeedButton;
      BtDelDet: TSpeedButton;
      DsDetalhe: TwwDataSource;
      QryDetalhe: TwwQuery;
      QrySubConta: TwwQuery;
      QryTipoRecebDesem: TwwQuery;
      QryTipoRecebDesemDESCRICAO: TStringField;
      QryTipoRecebDesemCODTIPRECDES: TStringField;
      QryTipoRecebDesemRECPAG: TStringField;
      MontaSelectConta: TMontaSelect;
      QryCCustoD_Desuso: TwwQuery;
      QryAux2: TwwQuery;
      QryDetalheIDPADRLANCCONT: TFloatField;
      QryDetalheIDTIPOINVEST: TFloatField;
      QryDetalheIDTIPOOPERACAO: TFloatField;
      QryDetalheHISTLANCINVEST: TStringField;
      QryDetalheIDEMPRESA: TFloatField;
      QryDetalheIDPESSOA: TFloatField;
      QryDetalhePLANO: TFloatField;
      QryDetalheCONTADOPERFIN: TStringField;
      QryDetalheCONTACOPERFIN: TStringField;
      QryDetalheCENCUSTDINVEST: TStringField;
      QryDetalheCENCUSTCINVEST: TStringField;
      QryDetalheFLGPAGRECNAO: TStringField;
      QryDetalheCODCENTRORESPON: TStringField;
      QryDetalheRECPAG: TStringField;
      QryDetalheCODTIPRECDES: TStringField;
      QryDetalheCODSUBCONTAC: TFloatField;
      QryDetalheCODSUBCONTAD: TFloatField;
      QryDetalheIDFORCLI: TFloatField;
      QryDetalheTIPMOVCARTINV: TStringField;
      QryDetalheTIPLANCINVEST: TStringField;
      QryDetalheUNIDNEGOC: TFloatField;
      QryDetalheIDCARTEIRAINVEST: TFloatField;
      QryDetalheIDTIPODESPINVEST: TFloatField;
      QryCarteiraInvest: TwwQuery;
      QryTipoDespesa: TwwQuery;
      DsBuscaTipoOperacao: TwwDataSource;
      PnlMestre: TPanel;
      Label2: TLabel;
      DbLkcTipoInvestimento: TwwDBLookupCombo;
      Label17: TLabel;
      DbLkcCarteira: TwwDBLookupCombo;
      DbLkcTipoDespesa: TwwDBLookupCombo;
      lblTipodeRubrica: TLabel;
      lblTipoDoTitulo: TLabel;
      DbLkcTipoOperacao: TwwDBLookupCombo;
      Label5: TLabel;
      Label19: TLabel;
      //AL_18
      QryDetalheTIPCODIGO: TStringField;
      DbLkcTipoTitulo: TwwDBLookupCombo;
      QryTipoTitulo: TwwQuery;
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      MontaSelect: TMontaSelect;
      Label21: TLabel;
      lblInvestimento: TLabel;
      QryBuscaInvestimento: TwwQuery;
      DsTipoTitulo: TwwDataSource;
      QryDetalheIDINVESTIMENTO: TFloatField;
      QryBuscaTipoInvestimentoIDTIPOINVEST: TFloatField;
      QryBuscaTipoInvestimentoDESCTIPOINVEST: TStringField;
      sbtnImprimir: TToolbarButton97;
      lblClasseDoTitulo: TLabel;
      dblkClasseDoTitulo: TwwDBLookupCombo;
      qryClasseDoTitulo: TwwQuery;
      qryClasseDoTituloIDCLASSETIT: TFloatField;
      qryClasseDoTituloDESCCLASSETIT: TStringField;
      QryDetalheIDCLASSETIT: TFloatField;
      QryDetalheIDITEMRENFIX: TFloatField;
      dblkItemRenFix: TwwDBLookupCombo;
      lblItemDeRendaFixa: TLabel;
      qryItemRenfix: TwwQuery;
      qryItemRenfixIDITEMRENFIX: TFloatField;
      qryItemRenfixDESCITEMRENFIX: TStringField;
      DbLkcInvestRenFix: TwwDBLookupCombo;
      qryInvestRenFix: TwwQuery;
      qryInvestRenFixIDINVESTIMENTO: TFloatField;
      qryInvestRenFixDESCINVESTIMENTO: TStringField;
      fcLOperador: TfcLabel;
      QryDetalheTRGUSERINCLUSAO: TStringField;
      //AL_18
      QryBuscaTipoOperacaoIDTIPOINVEST: TFloatField;
      QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField;
      QryBuscaTipoOperacaoIDMERCADO: TFloatField;
      QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField;
      QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField;
      QryBuscaTipoOperacaoTIPOCUSTODIA: TStringField;
      QryTipoDespesaIDTIPODESPINVEST: TFloatField;
      QryTipoDespesaDESCTIPODESPINV: TStringField;
      updDetalhe: TUpdateSQL;
      Panel2: TPanel;
      Panel3: TPanel;
      Dock978: TDock97;
      Toolbar975: TToolbar97;
      BtOkDet: TBitBtn;
      BtCancDet: TBitBtn;
      BtVoltaDet: TBitBtn;
      Panel4: TPanel;
      PageControl2: TPageControl;
      TabSheet2: TTabSheet;
      Bevel4: TBevel;
      PageControl3: TPageControl;
      TabSheet4: TTabSheet;
      Bevel1: TBevel;
      Label3: TLabel;
      BtCCDebito: TSpeedButton;
      Label8: TLabel;
      LbSubConta: TLabel;
      edContaContabilD: TMaskEdit;
      lbDescricaoContaD: TPanel;
      DbLkcBuscaAtividadeD: TwwDBLookupCombo;
      DbLkcSubContaD: TwwDBLookupCombo;
      TabSheet5: TTabSheet;
      Bevel2: TBevel;
      Label10: TLabel;
      Label6: TLabel;
      Label12: TLabel;
      BtCCCredito: TSpeedButton;
      edContaContabil: TMaskEdit;
      lbDescricaoConta: TPanel;
      DbLkcBuscaAtividade: TwwDBLookupCombo;
      DbLkcSubConta: TwwDBLookupCombo;
      TabSheet3: TTabSheet;
      Bevel3: TBevel;
      Label13: TLabel;
      Label9: TLabel;
      DBcboTipoRecebimento: TwwDBLookupCombo;
      dbRGTipoLancamento: TDBRadioGroup;
      DbLkcCentRespon: TwwDBLookupCombo;
      Panel5: TPanel;
      DbLkcTipoLancamento: TwwDBComboBox;
      Label14: TLabel;
      dbeHistoricolancto: TDBEdit;
      Label1: TLabel;
      DbLkTipoOperacao: TwwDBLookupCombo;
      Label20: TLabel;
      QryDetalheDESCTIPOOPERACAO: TStringField;
      DbLkcInvestimento: TwwDBLookupCombo;
      QryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
      QryCarteiraInvestDESCCARTINVEST: TStringField;
      QryBuscaInvestimentoIDINVESTIMENTO: TFloatField;
      QryBuscaInvestimentoDESCINVESTIMENTO: TStringField;
      QryBuscaInvestimentoTIPOTITULO: TStringField;
      QryDetalheDESCCARTINVEST: TStringField;
      QryDetalheDESCITEMRENFIX: TStringField;
      QryDetalheDESCCLASSETIT: TStringField;
      QryDetalheDESCTIPODESPINV: TStringField;
      sbtnCopiar: TToolbarButton97;
      qryCopiaParametro: TwwQuery;
      //AL_17
      QryDetalheNOMEUSUARIO: TStringField;
      QryDetalheIDUSUARIO: TFloatField;
      DBText1: TDBText;
      QryTipoPer: TwwQuery;
      QryTipoPerTIPDESCRICAO: TStringField;
      QryTipoPerTIPCODIGO: TStringField;
      Label11: TLabel;
      DbCmbCCusto: TwwDBLookupCombo;
      dblkcPlanoPatro: TwwDBLookupCombo;
      lblPlanPatro: TLabel;
      qryPlanoPatro: TwwQuery;
      qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
      qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
      QryDetalheIDPLANPREVCTBPATR: TFloatField;
      QryDetalhePLANPRVCONTABPATRO: TStringField;
      QryDetalheDESCINVESTIMENTO: TStringField;
      lbltipofundo: TLabel;
      lblfundo: TLabel;
      QryBuscaFundoInvest: TwwQuery;
      dblcFundoInvest: TwwDBLookupCombo;
      DtsBuscaFundoInvest: TDataSource;
      QryBuscaFundoInvestIDFUNDOINVEST: TFloatField;
      QryBuscaFundoInvestDESCFUNDOINVEST: TStringField;
      QryDetalheDESCFUNDOINVEST: TStringField;
      QryDetalheIDFUNDOINVEST: TFloatField;
      lblDataVigencia: TLabel;
      QryDetalheDATAVIGENCIA: TDateTimeField;
      qryVigencia: TwwQuery;
      qryVigenciaDATAVIGENCIA: TDateTimeField;
      DbLkcDataVigencia: TwwDBLookupCombo;
      qrySegmentacao: TwwQuery;
      qrySegmentacaoIDSEGMENTACAO: TFloatField;
      qrySegmentacaoDESCSEGMENTACAO: TStringField;
      QryDetalheIDSEGMENTACAO: TFloatField;
      QryDetalheDESCSEGMENTACAO: TStringField;
      GrdDetalheIButton: TwwIButton;
      DbLkcSegmentacao: TwwDBLookupCombo;
      Label4: TLabel;
      qryVigenciaPLANOCONTABIL: TFloatField;
      qryVigenciaPERMITE: TStringField;
      QryDetalheIDTIPOFUNDOINVEST: TFloatField;
      QryDetalheDESCTIPOFUNDOINV: TStringField;
      QryTipoTituloIDTIPOFUNDOINVEST: TFloatField;
      QryTipoTituloDESCTITULO: TStringField;
      qryTipoAcao: TwwQuery;
      qryTipoAcaoCODTIPOACAO: TStringField;
      DbLkcTipoAcao: TwwDBLookupCombo;
      QryDetalheCODTIPTITULO: TStringField;
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure BtCCDebitoClick(Sender: TObject);
      Procedure BtIncDetClick(Sender: TObject);
      Procedure BtAltDetClick(Sender: TObject);
      Procedure BtDelDetClick(Sender: TObject);
      Procedure BtOkDetClick(Sender: TObject);
      Procedure BtCancDetClick(Sender: TObject);
      Procedure dbRGTipoLancamentoChange(Sender: TObject);
      Procedure BtCCCreditoClick(Sender: TObject);
      Procedure edContaContabilChange(Sender: TObject);
      Procedure edContaContabilDChange(Sender: TObject);
      Procedure DbLkcTipoLancamentoChange(Sender: TObject);
      Procedure DbLkcTipoTituloChange(Sender: TObject);
      Procedure DbLkcInvestimentoChange(Sender: TObject);
      Procedure DbLkcTipoOperacaoChange(Sender: TObject);
      Procedure DbLkcCredorChange(Sender: TObject);
      Procedure DbLkcCarteiraChange(Sender: TObject);
      Procedure DbLkcTipoDespesaChange(Sender: TObject);
      Procedure DbLkcTipoInvestimentoExit(Sender: TObject);
      Procedure sbtnImprimirClick(Sender: TObject);
      Procedure dblkClasseDoTituloChange(Sender: TObject);
      Procedure dblkItemRenFixChange(Sender: TObject);
      Procedure DbLkcInvestRenFixChange(Sender: TObject);
      Procedure HabilitaCombos(iIdTipoInvest: Integer);
      //AL_18
      Procedure FormCreate(Sender: TObject);
      Procedure dblkClasseDoTituloExit(Sender: TObject);
      Procedure DbLkcTipoTituloExit(Sender: TObject);
      Procedure DbLkcTipoInvestimentoCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure QryDetalheAfterScroll(DataSet: TDataSet);
      Procedure QryDetalheAfterOpen(DataSet: TDataSet);
      Procedure DsDetalheStateChange(Sender: TObject);
      Procedure sbtnCopiarClick(Sender: TObject);
      Procedure dblkcPlanoPatroChange(Sender: TObject);
      //AL_26
      Procedure dblcFundoInvestChange(Sender: TObject);
      Procedure dbDtVigenciaKeyPress(Sender: TObject; Var Key: Char);
      Procedure DbLkcDataVigenciaChange(Sender: TObject);
      Procedure wwDBLookupCombo1Change(Sender: TObject);
      Procedure DbLkcSegmentacaoExit(Sender: TObject);

   Private
      { Private declarations }
      bModal: Boolean;
      //AL_26
      //AL_25
      //AL_6
      Procedure Sel(iTipoInvest: Integer = 0; iTipoOperacao: Integer = 0;
         sCodTipTitulo: String = ''; iCarteirainvest: Integer = 0;
         iTipoDespInvest: Integer = 0; iInvestimento: Integer = 0;
         iClasseTit: Integer = 0; iItemRenFix: Integer = 0;
         iPlanoPatro: Integer = 0; iFundoInvest: Integer = 0;
         sDataVigencia: String = ''; iSegmentacao: Integer = 0; sTipoAcao: String = '');
      Procedure AbreQry;
      Procedure LimpaLookUps;
      Procedure SetModal(bMod: Boolean);
      Procedure HabBtn;
      Function OperRF: String;
      Function Duplicado: boolean;
   Published
      { Published declarations }
      Property fModal: boolean Read bModal Write SetModal;
   Public
      { Public declarations }
   End;

Var
   FrmCadContaContab: TFrmCadContaContab;

Implementation

Uses UDataBase, USistema, UModulo, UMensErro, UBibliotecaInvest, dBaseDados,
   // AL_25
   FPrincipal, UOperComum, FDmRelParamContab, uCtrlParamInvest;

Var
   wIdPlano: Integer;
   wObrigaContaC, wObrigaContaD: Char;
   bInserir: Boolean;
   sTipoInvest: String;

   {$R *.DFM}

   //AL_25
   //AL_6

Procedure TFrmCadContaContab.Sel(iTipoInvest: Integer = 0; iTipoOperacao: Integer = 0;
   sCodTipTitulo: String = ''; iCarteirainvest: Integer = 0;
   iTipoDespInvest: Integer = 0; iInvestimento: Integer = 0;
   iClasseTit: Integer = 0; iItemRenFix: Integer = 0;
   iPlanoPatro: Integer = 0; iFundoInvest: Integer = 0;
   sDataVigencia: String = ''; iSegmentacao: Integer = 0;
   sTipoAcao: String = '');
Begin
   Try
      // Não reabre a qryDetalhe até que o TAG volte a ser Zero
      QryDetalhe.Tag := 1;
      // AL_5
      DbLkcTipoInvestimento.Clear;
      If iTipoInvest <> 0 Then
         Begin
            If QryBuscaTipoInvestimento.Locate('IDTIPOINVEST', iTipoInvest, [loPartialKey]) Then
               Begin
                  DbLkcTipoInvestimento.Text := QryBuscaTipoInvestimento.FieldByName('DESCTIPOINVEST').AsString;
                  DbLkcTipoInvestimento.PerformSearch;
               End;
         End;

      DbLkcTipoOperacao.Clear;
      If iTipoOperacao <> 0 Then
         Begin
            If QryBuscaTipoOperacao.Locate('IDTIPOOPERACAO', iTipoOperacao, [loPartialKey]) Then
               Begin
                  DbLkcTipoOperacao.Text := QryBuscaTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
                  DbLkcTipoOperacao.PerformSearch;
               End;
         End;

      DbLkcSegmentacao.Clear;
      If iTipoOperacao <> 0 Then
         Begin
            If qrySegmentacao.Locate('IDSEGMENTACAO', iSegmentacao, [loPartialKey]) Then
               Begin
                  DbLkcSegmentacao.Text := qrySegmentacao.FieldByName('DESCSEGMENTACAO').AsString;
                  DbLkcSegmentacao.PerformSearch;
               End;
         End;

      DbLkcTipoAcao.Clear;
      If sTipoAcao <> '' Then
         Begin
            DbLkcTipoAcao.Text := sTipoAcao;
            DbLkcTipoAcao.PerformSearch;
         End;

      DbLkcDataVigencia.Clear;
      If sDataVigencia <> '' Then
         Begin
            DbLkcDataVigencia.Text := sDataVigencia;
            DbLkcDataVigencia.PerformSearch;
         End;

      // TipoTitulo
      DbLkcTipoTitulo.Clear;
      If sCodTipTitulo <> '' Then
         Begin
            If QryTipoTitulo.Locate('IDTIPOFUNDOINVEST', sCodTipTitulo, [loPartialKey]) Then
               Begin
                  DbLkcTipoTitulo.Text := QryTipoTitulo.FieldByName('DESCTITULO').AsString;
                  DbLkcTipoTitulo.PerformSearch;
               End;
         End;

      // CarteiraInvest
      DbLkcCarteira.Clear;
      If iCarteirainvest <> 0 Then
         Begin
            If QryCarteiraInvest.Locate('IDCARTEIRAINVEST', iCarteirainvest, [loPartialKey]) Then
               Begin
                  DbLkcCarteira.Text := QryCarteiraInvest.FieldByName('DESCCARTINVEST').AsString;
                  DbLkcCarteira.PerformSearch;
               End;
         End;

      // TipoDespInvest
      DbLkcTipoDespesa.Clear;
      If iTipoDespInvest <> 0 Then
         Begin
            If QryTipoDespesa.Locate('IDTIPODESPINVEST', iTipoDespInvest, [loPartialKey]) Then
               Begin
                  DbLkcTipoDespesa.Text := QryTipoDespesa.FieldByName('DESCTIPODESPINV').AsString;
                  DbLkcTipoDespesa.PerformSearch;
                  OperComum.LimpaParametros(QryBuscaInvestimento);
                  QryBuscaInvestimento.Open;
               End
         End;

      // Investimento
      DbLkcInvestimento.Clear;
      If iInvestimento = 0 Then
         Begin
            If QryBuscaInvestimento.Locate('IDINVESTIMENTO', iInvestimento, [loPartialKey]) Then
               Begin
                  DbLkcInvestimento.Text := QryBuscaInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
                  DbLkcInvestimento.PerformSearch;
               End;
         End;

      // ClasseTitulo
      dblkClasseDoTitulo.Clear;
      If iClasseTit = 0 Then
         Begin
            If qryClasseDoTitulo.Locate('IDCLASSETIT', iClasseTit, [loPartialKey]) Then
               Begin
                  dblkClasseDoTitulo.Text := qryClasseDoTitulo.FieldByName('DESCCLASSETIT').AsString;
                  dblkClasseDoTitulo.PerformSearch;
               End;
         End;

      // ItemRenfix
      dblkItemRenFix.Clear;
      If iItemRenFix = 0 Then
         Begin
            If qryItemRenfix.Locate('IDITEMRENFIX', iItemRenFix, [loPartialKey]) Then
               Begin
                  dblkItemRenFix.Text := qryItemRenfix.FieldByName('DESCITEMRENFIX').AsString;
                  dblkItemRenFix.PerformSearch;
               End;
         End;
      // AL_5 - Fim

      // AL_25
      //Plano / Patrocinadora
      dblkcPlanoPatro.Clear;
      If iPlanoPatro = 0 Then
         Begin
            If qryPlanoPatro.Locate('IDPLANPREVCTBPATR', iPlanoPatro, [loPartialKey]) Then
               Begin
                  dblkcPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
                  dblkcPlanoPatro.PerformSearch;
               End;
         End;
      // AL_25 - Fim

      // AL_26
      // Fundo de Investimento
      dblcFundoInvest.Clear;
      If iFundoInvest = 0 Then
         Begin
            If QryBuscaFundoInvest.Locate('IDFUNDOINVEST', iFundoInvest, [loPartialKey]) Then
               Begin
                  dblcFundoInvest.Text := QryBuscaFundoInvest.FieldByName('DESCFUNDOINVEST').AsString;
                  dblcFundoInvest.PerformSearch;
               End;
         End;
      // AL_26 - Fim

      QryDetalhe.Tag := 0;
      AbreQry;
   Except
      QryDetalhe.Close;
   End;
End;
//AL_6 - Fim

Procedure TFrmCadContaContab.AbreQry;
Var wSQL: String;
Begin
   Inherited;
   //AL_25
   QryDetalhe.DisableControls; // Fim AL_25
   // AL_6
   If QryDetalhe.Tag = 0 Then
      Begin
         OperComum.LimpaParametros(QryDetalhe);

         // Filtra Tipo de Investimento
         If (DbLkcTipoInvestimento.Text <> '') And (DbLkcTipoInvestimento.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger := StrToInt(DbLkcTipoInvestimento.LookupValue);

         // Filtra Tipo de Operação
         If (DbLkcTipoOperacao.Text <> '') And (DbLkcTipoOperacao.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DbLkcTipoOperacao.LookupValue)
         Else
            QryDetalhe.ParamByName('IDTIPOOPERACAO').Value := null;

         //Filtra Segmentacao de Mercado
         If (DbLkcSegmentacao.Text <> '') And (DbLkcSegmentacao.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDSEGMENTACAO').AsInteger := StrToInt(DbLkcSegmentacao.LookupValue)
         Else
            QryDetalhe.ParamByName('IDSEGMENTACAO').Value := null;

         // Filtra Tipo de Titulo
         If (DbLkcTipoTitulo.Text <> '') And (DbLkcTipoTitulo.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDTIPOFUNDOINVEST').AsString := DbLkcTipoTitulo.LookupValue;
         //   ryDetalhe.ParamByName('CODTIPTITULO').AsString := DbLkcTipoTitulo.LookupValue;

         // Filtra Carteira
         If (DbLkcCarteira.Text <> '') And (DbLkcCarteira.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDCARTEIRAINVEST').AsInteger := StrToInt(DbLkcCarteira.LookupValue);

         // Filtra Tipo de Despesa
         If (DbLkcTipoDespesa.Text <> '') And (DbLkcTipoDespesa.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDTIPODESPINVEST').AsInteger := StrToInt(DbLkcTipoDespesa.LookupValue);

         If (DbLkcTipoAcao.Text <> '') And (DbLkcTipoAcao.LookupValue <> '') Then
            QryDetalhe.ParamByName('CODTIPTITULO').AsString := DbLkcTipoAcao.LookupValue;

         //Filtra data de Vigência
         If (DbLkcDataVigencia.Text <> '') And (DbLkcDataVigencia.LookupValue <> '') Then
            QryDetalhe.ParamByName('DATAVIGENCIA').AsString := DbLkcDataVigencia.LookupValue
         Else
            qryDetalhe.ParamByName('DATAVIGENCIA').Value := Null;

         // AL_1 - 07/07/2004 - Acaba a distinção
         // AL_5
         If FPrincipal.TipoMenuInvest = 'F' Then // Renda Fixa
            Begin
               // Filtra Investimento do Renda Fixa Novo
               If (DbLkcInvestRenFix.Text <> '') And (DbLkcInvestRenFix.LookupValue <> '') Then
                  QryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(DbLkcInvestRenFix.LookupValue);
            End
         Else
            Begin
               // Filtra Investimento do Renda Variável
               If (DbLkcInvestimento.Text <> '') And (DbLkcInvestimento.LookupValue <> '') Then
                  QryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(DbLkcInvestimento.LookupValue);
            End;
         // AL_5 - Fim
         // AL_1 - Fim

         // Filtra Classe do Titulo
         If (dblkClasseDoTitulo.Text <> '') And (dblkClasseDoTitulo.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblkClasseDoTitulo.LookupValue);

         // Filtra Item de Renda Fixa
         If (dblkItemRenFix.Text <> '') And (dblkItemRenFix.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDITEMRENFIX').AsInteger := StrToInt(dblkItemRenFix.LookupValue);

         // Filtra Plano Patrocinadora
         If (dblkcPlanoPatro.Text <> '') And (dblkcPlanoPatro.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkcPlanoPatro.LookupValue);

         //Fim AL_25

         // AL_26
         If (dblcFundoInvest.Text <> '') And (dblcFundoInvest.LookupValue <> '') Then
            QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblcFundoInvest.LookupValue); //Fim AL_26

         QryDetalhe.Open;
         QryDetalhe.First;
         //AL_25
      End;
   QryDetalhe.EnableControls; // Fim AL_25

End;

//--------------------------------------------------------------
// Botao de Procurar

Procedure TFrmCadContaContab.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;

   //AL_6
   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
      Begin
         Sel(StrToInt(OperComum.IIF(MontaSelect.ValoresChave[0] = '', '0', MontaSelect.ValoresChave[0])),
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[1] = '', '0', MontaSelect.ValoresChave[1])),
            MontaSelect.ValoresChave[2],
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[3] = '', '0', MontaSelect.ValoresChave[3])),
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[4] = '', '0', MontaSelect.ValoresChave[4])),
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[5] = '', '0', MontaSelect.ValoresChave[5])),
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[6] = '', '0', MontaSelect.ValoresChave[6])),
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[7] = '', '0', MontaSelect.ValoresChave[7]))
            //AL_25
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[8] = '', '0', MontaSelect.ValoresChave[8])),
            0,
            MontaSelect.ValoresChave[9], // Fim AL_25
            StrToInt(OperComum.IIF(MontaSelect.ValoresChave[10] = '', '0', MontaSelect.ValoresChave[10])));

         AbreQry;
      End
   Else
      Begin
         DbLkcTipoInvestimento.Text := '';
         DbLkcTipoOperacao.Text := '';
         DbLkcTipoTitulo.Text := '';
         DbLkcCarteira.Text := '';
         DbLkcTipoDespesa.Text := '';
         // AL_25
         dblkcPlanoPatro.Text := ''; // AL_25
         QryDetalhe.Close;
         QryDetalhe.Open;
      End;
   // AL_6 - Fim
End;

Procedure TFrmCadContaContab.HabilitaCombos(iIdTipoInvest: Integer);
Begin
   // Desabilita tudo
   //Renda Fixa Novo
   lblClasseDoTitulo.Visible := False;
   dblkClasseDoTitulo.Visible := False;
   lblItemDeRendaFixa.Visible := False;
   dblkItemRenFix.Visible := False;
   lblInvestimento.Visible := False;
   DbLkcInvestRenFix.Visible := False;
   //Renda Fixa Velho e Renda Variável e BM&F
   lblTipoDoTitulo.Visible := False;
   DbLkcTipoTitulo.Visible := False;
   DbLkcTipoAcao.Visible := False; //Cgpc
   lblTipoDoTitulo.Enabled := False;
   DbLkcTipoTitulo.Enabled := False;
   DbLkcTipoAcao.Enabled := False;
   lblTipodeRubrica.Visible := False;
   DbLkcTipoDespesa.Visible := False;
   // AL_5
   DbLkcInvestimento.Visible := False;
   DbLkcInvestimento.Enabled := False;
   // AL_5 - Fim
   //AL_25
   dblkcPlanoPatro.Visible := False;
   dblkcPlanoPatro.Enabled := False;
   //AL_25 fim
   //AL_26
   lblTipoFundo.Enabled := False;
   lblTipoFundo.Visible := False;
   lblfundo.Enabled := False;
   lblfundo.Visible := False;
   dblcFundoInvest.visible := False;
   //AL_26 fim

// AL_3
   If iIdTipoInvest = 1 Then // Renda Fixa
      Begin
         // Renda Fixa Novo
         lblClasseDoTitulo.Visible := True;
         dblkClasseDoTitulo.Visible := True;
         lblItemDeRendaFixa.Visible := True;
         dblkItemRenFix.Visible := True;
         lblInvestimento.Visible := True;
         DbLkcInvestRenFix.Visible := True;
         //AL_26
         lblTipoFundo.Enabled := False;
         lblTipoFundo.Visible := False;
         dblcFundoInvest.visible := False;
         //AL_26 fim

      End
   Else If ((iIdTipoInvest = 2) Or (iIdTipoInvest = 8)) Then // Renda Variavel e BMF
      Begin

         lblTipodeRubrica.Visible := True;
         DbLkcTipoDespesa.Visible := True;
         dblkClasseDoTitulo.Visible := False;
         lblTipoDoTitulo.Visible := True;
         lblTipoDoTitulo.Enabled := True;
         If iIdTipoInvest <> 2 Then Begin
               DbLkcTipoTitulo.Visible := True;
               DbLkcTipoTitulo.Enabled := True;
            End;
         If iIdtipoinvest = 2 Then Begin
               DbLkcTipoAcao.Visible := True;
               dbLkcTipoAcao.Enabled := True;
            End;
         // AL_5
         lblInvestimento.Visible := True;
         DbLkcInvestimento.Visible := True;
         DbLkcInvestimento.Enabled := True;
         // AL_5 - Fim
         //AL_26
         lblTipoFundo.Enabled := False;
         lblTipoFundo.Visible := False;
         dblcFundoInvest.visible := False;
         //AL_26 fim
      End
         //AL_21
   Else If (iIdTipoInvest In [5, 6, 7, 9, 10]) Then // Fundos
      Begin
         lblTipoDoTitulo.Visible := True;
         DbLkcTipoTitulo.Visible := True;
         //AL_26
         // AL_8 - Lucas - 02/02/2005 - Liberar combo para todos os Fundos.
         lblTipoDoTitulo.Visible := False;
         lblTipoDoTitulo.Enabled := False;
         DbLkcTipoTitulo.Enabled := True;
         lblTipoFundo.Enabled := True;
         lblTipoFundo.Visible := True;
         lblfundo.Enabled := True;
         lblfundo.Visible := True;
         dblcFundoInvest.visible := True;
         //AL_21
         //Al_14
         //Al_9
         If (iIdTipoInvest In [6, 7, 9, 10]) Then
            Begin
               lblTipodeRubrica.Visible := True;
               DbLkcTipoDespesa.Visible := True;
            End;
      End;
   //AL_25
   dblkcPlanoPatro.Visible := True;
   dblkcPlanoPatro.Enabled := True;
   //AL_25 fim
End;

//--------------------------------------------------------------
// Mostra Formulario

Procedure TFrmCadContaContab.FormShow(Sender: TObject);
Begin
   Inherited;
   QryBuscaTipoInvestimento.Close;
   QryBuscaTipoInvestimento.ParamByName('sTipoInvest').AsString := FPrincipal.TipoMenuInvest;
   QryBuscaTipoInvestimento.Open;
   //AL_26
   QryBuscaTipoInvestimento.Locate('IDTIPOINVEST', CtrlPinv.IdTipoInvest, [loPartialKey]); // Fim AL_26
   DbLkcTipoInvestimento.Text := QryBuscaTipoInvestimentoDESCTIPOINVEST.AsString;
   DbLkcTipoInvestimento.PerformSearch;
   If DbLkcTipoInvestimento.CanFocus Then
      DbLkcTipoInvestimento.SetFocus;

   // Habilita Combos pelo Tipo de Investimento
   HabilitaCombos(QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger);

   // Parametros
   QryAux.SQL.Clear;
   QryAux.SQL.Text := 'SELECT MASCARA,PARAMCONTAB.PLANO ' +
      'FROM  PLANO, PARAMCONTAB ' +
      'WHERE PARAMCONTAB.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) +
      'AND  PLANO.PLANO=PARAMCONTAB.PLANO';
   QryAux.open;
   If (Not QryAux.EOF) Then Begin
         edContaContabil.EditMask := QryAux.FieldByName('MASCARA').AsString + ';0; ';
         edContaContabilD.EditMask := QryAux.FieldByName('MASCARA').AsString + ';0; ';
         wIdPlano := QryAux.FieldByName('PLANO').AsInteger;
      End Else Begin
         MsgDlg('Erro ao ler parâmetros contábeis', 'Erro', mtError, [mbOK], 0);
      End;

   // Abre Querys
   QryBuscaAtividade.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   QryBuscaAtividade.Open;
   QryBuscaCentRespon.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   QryBuscaCentRespon.Open;
   QrySubConta.ParamByName('EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
   QrySubConta.Open;
   QryTipoRecebDesem.Open;

   // Abre Querys
   QryTipoPer.Open;
   // AL_25
   QryBuscaTipoOperacao.close;
   QryBuscaTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
   QryBuscaTipoOperacao.Open;

   QrySegmentacao.close;
   QrySegmentacao.SQL.Clear;
   QrySegmentacao.SQL.Add('SELECT SM.IDSEGMENTACAO,SM.DESCSEGMENTACAO FROM SEGMENTACAOMERCADO SM, GRUPOSEGMENTACAOMERCADO SGM, TIPOFUNDOINVEST TP ');
   QrySegmentacao.SQL.Add('WHERE SM.IDGRUPO = SGM.IDGRUPO');
   QrySegmentacao.SQL.Add('AND SM.IDSEGMENTACAO = TP.IDSEGMENTACAO(+)');
   QrySegmentacao.Sql.Add('AND ((:IDTIPOFUNDOINVEST IS NULL) OR (TP.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))');
   If ((CtrlPinv.IdTipoInvest = 1) Or (CtrlPinv.IdTipoInvest = 2)) Then Begin
         QrySegmentacao.SQL.Add(' AND SGM.IDGRUPO =  2');
         QrySegmentacao.SQL.Add(' ORDER BY SM.IDSEGMENTACAO,SM.DESCSEGMENTACAO');
      End Else Begin
         QrySegmentacao.SQL.Add(' AND TP.IDTIPOINVEST = :IDTIPOINVEST');
         QrySegmentacao.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
         QrySegmentacao.SQL.Add(' GROUP BY SM.IDSEGMENTACAO,SM.DESCSEGMENTACAO');
         QrySegmentacao.SQL.Add(' ORDER BY SM.IDSEGMENTACAO,SM.DESCSEGMENTACAO');
      End;
   qrySegmentacao.ParamByName('IDTIPOFUNDOINVEST').DataType := ftInteger;
   qrySegmentacao.Open;

   QryVigencia.Open;
   DbLkcDataVigencia.Text := QryVigencia.fieldByName('DATAVIGENCIA').AsString;
   DbLkcDataVigencia.LookupValue := QryVigencia.fieldByName('DATAVIGENCIA').AsString;

   qryTipoAcao.Open;

   //AL_18
   QryTipoDespesa.Open;
   QryCarteiraInvest.Open;
   QryTipoTitulo.Open;
   //AL_18
   QryBuscaInvestimento.Open;
   qryInvestRenfix.Open;
   qryItemRenfix.Open;
   qryClasseDoTitulo.Open;
   //AL_22
   QryCCusto.Open;
   //AL_25
   QryPlanoPatro.Open; // Fim AL_25
   QryBuscaFundoInvest.Open;

   // Inclui Filtros no Monta Select

   If FPrincipal.TipoMenuInvest = 'I' Then
      MontaSelect.Filtro.Add('PADRLANCCONTINV.IDTIPOINVEST IN (5,6,7,9)')
   Else
      MontaSelect.Filtro.Add('PADRLANCCONTINV.IDTIPOINVEST = ' + IntToStr(QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger));

   // Mostra Tela de Cadastro
   Panel1.Visible := False;
   GrdDetalhe.Visible := True;
   // Acerta Pagina
   PageControl2.ActivePage := TabSheet2;
   PageControl3.ActivePage := TabSheet4;
   // Habilita Painel do Fundo
   PnlFundo.Enabled := True;

   wObrigaContaC := 'N';
   wObrigaContaD := 'N';

   // Move o foco para o próximo componente
   //AL_18
   If DbLkcTipoInvestimento.CanFocus Then
      SelectNext(ActiveControl, True, True)
   Else
      QryDetalhe.Open;

   AbreQry;
End;

//--------------------------------------------------------------
// Fecha Formulario

Procedure TFrmCadContaContab.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   // Fecha Querys
   QryTipoPer.Close;
   QryBuscaTipoInvestimento.Close;
   QryBuscaTipoOperacao.Close;
   //AL_18
   QryBuscaAtividade.Close;
   QryBuscaCentRespon.Close;
   QryDetalhe.Close;
   QryDetalhe.UnPrepare;
   QrySubConta.Close;
   QryTipoRecebDesem.Close;
   QryCCusto.Close;
   QryTipoTitulo.Close;
   QryTipoDespesa.Close;
   QryCarteiraInvest.Close;
   qryItemRenfix.Close;
   qryClasseDoTitulo.Close;
   qryInvestRenFix.Close;
   //AL_25
   QryPlanoPatro.Close; // Fim AL_25
   //AL_26
   QryBuscaFundoInvest.Close; // Fim AL_26
   qryVigencia.Close;
   qrySegmentacao.Close;
   qryTipoAcao.Close;
End;

Procedure TFrmCadContaContab.BtCCDebitoClick(Sender: TObject);
Begin
   Inherited;
   // Executa Mostra Select

   MontaSelectConta.Executar;
   Repaint;
   // Caso Retorne Valor Altera a Conta Contabil
   If MontaSelectConta.RetornouValor Then Begin
         If MontaSelectConta.ValoresChave[4] = 'S' Then Begin
               MsgDlg('Conta Contábil não pode ser do tipo sintética.', 'Erro', mtError, [mbOK], 0);
               Exit;
            End;
         edContaContabilD.Text := MontaSelectConta.ValoresChave[0];
         lbDescricaoContaD.Caption := ' ' + MontaSelectConta.ValoresChave[1];
         QryDetalhe.FieldByName('CENCUSTDINVEST').Clear;
         If MontaSelectConta.ValoresChave[2] = 'S' Then Begin
               wObrigaContaD := 'S';
            End Else Begin
               wObrigaContaD := 'N';
            End;
      End;
End;

Procedure TFrmCadContaContab.BtIncDetClick(Sender: TObject);
Begin
   Inherited;
   MontaSelectConta.Filtro.Text := '';
   MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + QryVigencia.FieldByname('PlanoContabil').AsString); //Thiago Passos CGPC 28
   bInserir := True;

   // Acerta Pagina
   PageControl2.ActivePage := TabSheet2;
   //AL_25
   // Testa Campos de Filtro
   If (DbLkcTipoInvestimento.Text = '') And (DbLkcTipoOperacao.Text = '') And
      (DbLkcTipoTitulo.Text = '') And
      (DbLkcCarteira.Text = '') And (DbLkcTipoDespesa.Text = '') And
      (dblkcPlanoPatro.text = '') Then Begin
         MsgDlg('Filtros não preenchidos .... ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         Exit;
      End;
   If (DbLkcTipoOperacao.Text = '') Then //AL_26
      Begin
         MsgDlg('É necessário informar a Operação. ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcTipoOperacao.canfocus Then DbLkcTipoOperacao.setfocus;
         Exit;
      End;

   If (DbLkcDataVigencia.Text = '') Then
      Begin
         MsgDlg('É necessário informar a Data de Vigência. ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcDataVigencia.CanFocus Then DbLkcDataVigencia.SetFocus;
         Exit;
      End Else If qryVigencia.FieldByName('PERMITE').AsString = 'N' Then
      Begin
         MsgDlg('Não é possível incluir parâmetros de integração contábil para a Vigência : ' +
            qryVigencia.FieldByName('DATAVIGENCIA').AsString + ' - Plano:' + qryVigencia.FieldByName('PLANOCONTABIL').AsString + '.', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcDataVigencia.CanFocus Then DbLkcDataVigencia.CanFocus;
         Exit;
      End;

   If (DbLkcSegmentacao.Text = '') And (DbLkcTipoOperacao.LookupValue <> '-109') Then
      Begin
         MsgDlg('É necessário informar a Segmentação de Mercado. ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcSegmentacao.CanFocus Then DbLkcSegmentacao.CanFocus;
         Exit;
      End Else If (DbLkcSegmentacao.Text <> '') And (DbLkcTipoOperacao.LookupValue = '-109') Then Begin
         MsgDlg('Esta Operação não aceita Segmentação de Mercado. ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcSegmentacao.CanFocus Then DbLkcSegmentacao.CanFocus;
         Exit;
      End;

   // Inabilita Botoes
   BtIncDet.Enabled := False;
   BtAltDet.Enabled := False;
   BtDelDet.Enabled := False;
   // Mostra Tela de Cadastro
   GrdDetalhe.Visible := False;
   Panel1.Visible := True;
   // Inclui Registro
   QryDetalhe.Append;
   // Limpa Dados
   edContaContabil.Text := '';
   DbCmbCCusto.Text := '';
   edContaContabilD.Text := '';
   lbDescricaoConta.Caption := ' ';
   lbDescricaoContaD.Caption := ' ';
   If dbeHistoricolancto.CanFocus Then
      dbeHistoricolancto.SetFocus;

   PnlMestre.Enabled := False;
End;

Procedure TFrmCadContaContab.BtAltDetClick(Sender: TObject);
Begin
   Inherited;
   bInserir := False;
   MontaSelectConta.Filtro.Text := '';
   MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + QryVigencia.FieldByname('PlanoContabil').AsString); //Thiago Passos CGPC 28

   //AL_25
 // Testa Campos de Filtro
   If (DbLkcTipoInvestimento.Text = '') And (DbLkcTipoOperacao.Text = '') And
      (DbLkcTipoTitulo.Text = '') And
      (DbLkcCarteira.Text = '') And (DbLkcTipoDespesa.Text = '') And
      (dblkcPlanoPatro.text = '') Then Begin
         MsgDlg('Filtros não preenchidos .... ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtAltDet.Down := False;
         Exit;
      End;
      
   PageControl2.ActivePage := TabSheet2;
   PageControl3.ActivePage := TabSheet4;
   // Caso Tabela vazia sai
   If QryDetalhe.IsEmpty Then Begin
         MsgDlg('Tabela está vazia ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtAltDet.Down := False;
         Exit;
      End;
   // Heranca
   Inherited;
   // Preenche Contas Contabeis
   edContaContabil.Text := QryDetalhe.FieldByName('CONTACOPERFIN').AsString;
   edContaContabilD.Text := QryDetalhe.FieldByName('CONTADOPERFIN').AsString;
   // Inabilita Botoes
   BtIncDet.Enabled := False;
   BtAltDet.Enabled := False;
   BtDelDet.Enabled := False;
   // Mostra Tela de Cadastro
   GrdDetalhe.Visible := False;
   Panel1.Visible := True;
   // Inclui Registro
   QryDetalhe.Edit;

   If DbLkcTipoLancamento.ItemIndex = 0 Then //A pagar
      dbRGTipoLancamento.Value := 'P'
   Else If DbLkcTipoLancamento.ItemIndex = 1 Then //A receber
      dbRGTipoLancamento.Value := 'R'
   Else //Nenhum
      dbRGTipoLancamento.Value := '';

   //AL_13
   If dbRGTipoLancamento.ItemIndex = 0 Then
      Begin
         Label13.Caption := 'Tipo do Recebimento';
         If QryDetalhe.State In ([DsInsert, DsEdit]) Then
            Begin
               If Not QryDetalhe.IsEmpty Then
                  Begin
                     FazQuery(QryTipoRecebDesem,
                        'SELECT CODTIPRECDES, RECPAG, DESCRICAO ' +
                        '  FROM TIPORECEBDESEMB ' +
                        '  WHERE (IDPESSOA = ''' + IntToStr(Sistema.IdEmpresa) + ''') AND ' +
                        '        (RECPAG   = ''R'') AND ' +
                        '        (ANASINT  = ''A'')     ' +
                        '  ORDER BY DESCRICAO           ');
                  End;
            End;
      End
   Else
      Begin
         Label13.Caption := 'Tipo do Desembolso';
         If QryDetalhe.State In ([DsInsert, DsEdit]) Then
            Begin
               If Not QryDetalhe.IsEmpty Then
                  Begin
                     FazQuery(QryTipoRecebDesem,
                        'SELECT CODTIPRECDES, RECPAG, DESCRICAO ' +
                        '  FROM TIPORECEBDESEMB ' +
                        '  WHERE (IDPESSOA = ''' + IntToStr(Sistema.IdEmpresa) + ''') AND ' +
                        '        (RECPAG   = ''P'') AND ' +
                        '        (ANASINT  = ''A'')     ' +
                        '  ORDER BY DESCRICAO            ');
                  End;
            End;
      End;
   //AL_13 - Fim

   If dbeHistoricolancto.CanFocus Then
      dbeHistoricolancto.SetFocus;

   PnlMestre.Enabled := False;
End;

Procedure TFrmCadContaContab.BtDelDetClick(Sender: TObject);
Begin
   Inherited;
   // Caso Tabela vazia sai
   If QryDetalhe.IsEmpty Then Begin
         MsgDlg('Tabela está vazia ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtDelDet.Down := False;
         Exit;
      End;
   If qryVigencia.FieldByName('PERMITE').AsString = 'N' Then
      Begin
         MsgDlg('Não é possível excluir parâmetros de integração contábil para Vigência: ' +
            qryVigencia.FieldByName('DataVigencia').AsString + ' - Plano: ' + qryVigencia.FieldByName('PLANOCONTABIL').AsString + '.', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcDataVigencia.CanFocus Then
            DbLkcDataVigencia.CanFocus;
         Exit;
      End;

   // Heranca
   Inherited;
   // Inabilita Botoes
   BtDelDet.Down := False;
   // Confirma Exclusao ou Nao
   // Se Confirmar, Exclui Registro Posicionado
   If MsgDlg('Confirma Exclusão ', 'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;

   // Exclui Registro
   Try
      QryDetalhe.Delete;
      QryDetalhe.ApplyUpdates;
      QryDetalhe.CommitUpdates;
      dtmbasedados.dbBaseDados.Commit;
   Except
      MsgDlg('Registro não pode ser Excluido ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
   End;
End;

Procedure TFrmCadContaContab.BtOkDetClick(Sender: TObject);
Var
   QryUpd: TQuery; //Renan Cristiano - Sol 132401 Kintana 762732.
   sSql: String;   //Renan Cristiano - Sol 132401 Kintana 762732.
Begin
   Inherited;
      // Acerta Pagina
   //Renan Cristiano - Sol 132822 | Kintana 771645 inicio.
   If qryVigencia.FieldByName('PERMITE').AsString = 'N' Then
      Begin
         MsgDlg('Não é possível alterar parâmetros de integração contábil para Vigência: ' +
            qryVigencia.FieldByName('DataVigencia').AsString + ' - Plano: ' + qryVigencia.FieldByName('PLANOCONTABIL').AsString + '.', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
         BtIncDet.Down := False;
         If DbLkcDataVigencia.CanFocus Then DbLkcDataVigencia.CanFocus;
         Exit;
      End;
   //Renan Cristiano - Sol 132822 | Kintana 771645 Fim.
   // Testa parametros
   If (dbeHistoricolancto.Text = '') Then Begin
         ShowMessage('Faltam preencher campo Histórico do Lançamento.');
         If dbeHistoricolancto.CanFocus Then
            dbeHistoricolancto.SetFocus;
         Exit;
      End;
   If (DbLkcTipoLancamento.GetComboValue(DbLkcTipoLancamento.Text) <> 'N') Then Begin
         If (dbRGTipoLancamento.ItemIndex <> -1) And (DBcboTipoRecebimento.Text = '') Then Begin
               ShowMessage('Faltam preencher campo Tipo do Recebimento.');
               PageControl2.ActivePage := TabSheet3;
               If DBcboTipoRecebimento.CanFocus Then
                  DBcboTipoRecebimento.SetFocus;
               Exit;
            End;
         If (dbRGTipoLancamento.ItemIndex = -1) And (DBcboTipoRecebimento.Text <> '') Then Begin
               ShowMessage('Faltam preencher campos Tipo do Recebimento.');
               PageControl2.ActivePage := TabSheet3;
               If dbRGTipoLancamento.CanFocus Then
                  dbRGTipoLancamento.SetFocus;
               Exit;
            End;
         If (DbLkcBuscaAtividadeD.Text = '') Then Begin
               ShowMessage('Faltam preencher campo Atividade.');
               PageControl2.ActivePage := TabSheet2;
               PageControl3.ActivePage := TabSheet4;
               If DbLkcBuscaAtividadeD.CanFocus Then
                  DbLkcBuscaAtividadeD.SetFocus;
               Exit;
            End;

         If (DbLkcCentRespon.Text = '') Then Begin
               ShowMessage('Faltam preencher campo Centro de Responsabilidade .');
               PageControl2.ActivePage := TabSheet3;
               If DbLkcCentRespon.CanFocus Then
                  DbLkcCentRespon.SetFocus;
               Exit;
            End;
      End;

   // Testa se Contas obrigam a subconta de Debito
   If (wObrigaContaD = 'S') And (DbLkcSubContaD.Text = '') Then Begin
         ShowMessage('A Conta Débito obriga o cadastramento da Sub-Conta.');
         PageControl2.ActivePage := TabSheet4;
         Exit;
      End;
   // Testa se Contas obrigam a subconta de Credito
   If (wObrigaContaC = 'S') And (DbLkcSubConta.Text = '') Then Begin
         ShowMessage('A Conta Crédito obriga o cadastramento da Sub-Conta.');
         PageControl2.ActivePage := TabSheet4;
         Exit;
      End;

   // Critica Contas Contabeis
   If ((EdContaContabilD.Text <> '') And (EdContaContabil.Text = '')) Or
      ((EdContaContabil.Text <> '') And (EdContaContabilD.Text = '')) Then Begin
         ShowMessage('Contas devem ser Preenchidas ...');
         PageControl2.ActivePage := TabSheet4;
         PageControl3.ActivePage := TabSheet4;
         Exit;
      End;

   //Alt_4
   // Caso Tenha Conta Contabil...
   If (EdContaContabilD.Text <> '') And (EdContaContabil.Text <> '') Then
      If Trim(DbLkcDataVigencia.Text) = '' Then
         QryDetalhe.FieldByName('PLANO').AsInteger := wIdPlano // Se a combo de vigencia nao foi informada pega o plano vigente, senão pega o plano da vigencia   Thiago Passos CGPC 28
      Else
         QryDetalhe.FieldByName('PLANO').AsInteger := QryVigencia.FieldByname('PlanoContabil').Asinteger; //Thiago Passos CGPC 28

   // Atribui Valores
   QryDetalhe.FieldByName('CONTADOPERFIN').AsString := EdContaContabilD.Text;
   QryDetalhe.FieldByName('CONTACOPERFIN').AsString := EdContaContabil.Text;

   //Al_16
   // Preenche Tipo de Acordo com o Tipo de Registro
   If Trim(DbLkcTipoDespesa.Text) = '' Then
      QryDetalhe.FieldByName('TIPMOVCARTINV').AsString := 'OPE'
   Else
      QryDetalhe.FieldByName('TIPMOVCARTINV').AsString := 'DOP';

   QryDetalhe.FieldByName('TIPLANCINVEST').AsString := 'N';

   If (DBcboTipoRecebimento.Value <> '') Then
      QryDetalhe.FieldByName('CODTIPRECDES').AsString := QryTipoRecebDesem.FieldByName('CODTIPRECDES').AsString;

   //Al_15
   QryDetalhe.FieldByName('RECPAG').Clear;
   If DbLkcTipoLancamento.ItemIndex = 0 Then //A pagar
      QryDetalhe.FieldByName('RECPAG').AsString := 'P'
   Else If DbLkcTipoLancamento.ItemIndex = 1 Then //A receber
      QryDetalhe.FieldByName('RECPAG').AsString := 'R';

   //Al_AL_17
   QryDetalhe.FieldByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;

   Try
      // Caso Inserindo
      If QryDetalhe.State = DsInsert Then
         Begin
            // Inclui dados Referenciais
            QryDetalhe.FieldByName('IDPADRLANCCONT').AsInteger := LeUltRegistro(Nil, 'PADRLANCCONTINV');

            // Preenche Tabelas com os Filtros....
            //AL_26
            If (dblcFundoInvest.Text <> '') Then
               QryDetalhe.FieldByName('IDFUNDOINVEST').AsString := QryBuscaFundoInvest.FieldByName('IDFUNDOINVEST').AsString;
            //Fim AL_26

            //AL_25
            If (dblkcPlanoPatro.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsString :=
                     QryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString;
               End; //Fim AL_25

            If (DbLkcTipoInvestimento.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDTIPOINVEST').AsString :=
                     QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString;
               End;
            If (DbLkcTipoOperacao.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDTIPOOPERACAO').AsString :=
                     QryBuscaTipoOperacao.FieldByName('IDTIPOOPERACAO').AsString;
               End;
            If (DbLkcSegmentacao.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDSEGMENTACAO').AsString :=
                     qrySegmentacao.FieldByName('IDSEGMENTACAO').AsString;
               End;
            If (DbLkcDataVigencia.Text <> '') Then Begin
                  QryDetalhe.FieldByName('DATAVIGENCIA').AsString :=
                     DbLkcDataVigencia.Text;
               End;

            If (DbLkcTipoAcao.Text <> '') Then Begin
                  QryDetalhe.FieldByName('CODTIPTITULO').AsString :=
                     qryTipoAcao.FieldByName('CODTIPOACAO').AsString;
               End;

            If (DbLkcTipoTitulo.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsString :=
                     QryTipoTitulo.FieldByName('IDTIPOFUNDOINVEST').AsString;
               End;

            If (DbLkcCarteira.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsString :=
                     QryCarteiraInvest.FieldByName('IDCARTEIRAINVEST').AsString;
               End;
            If (DbLkcTipoDespesa.Text <> '') Then Begin
                  QryDetalhe.FieldByName('IDTIPODESPINVEST').AsString :=
                     QryTipoDespesa.FieldByName('IDTIPODESPINVEST').AsString;
               End;

            // AL_1 - 07/07/2004

            If FPrincipal.TipoMenuInvest = 'F' Then // Renda Fixa
               Begin
                  If (DbLkcInvestRenFix.Text <> '') Then
                     Begin
                        QryDetalhe.FieldByName('IDINVESTIMENTO').AsString :=
                           QryInvestRenFix.FieldByName('IDINVESTIMENTO').AsString;
                     End;
               End
            Else
               Begin
                  If (DbLkcInvestimento.Text <> '') Then
                     Begin
                        QryDetalhe.FieldByName('IDINVESTIMENTO').AsString :=
                           QryBuscaInvestimento.FieldByName('IDINVESTIMENTO').AsString;
                     End;
               End;
            // AL_1 - Fim
            If (dblkClasseDoTitulo.Text <> '') Then
               QryDetalhe.FieldByName('IDCLASSETIT').AsString := qryClasseDoTitulo.FieldByName('IDCLASSETIT').AsString;

            // Alterado para Cadastramento de Operações sem seleção de Item
            If (dblkItemRenFix.Text <> '') Then
               QryDetalhe.FieldByName('IDITEMRENFIX').AsString := qryItemRenfix.FieldByName('IDITEMRENFIX').AsString
            Else If OperRF = 'A' Then
               // Se Aplicação insere o item -1 (Principal)
               QryDetalhe.FieldByName('IDITEMRENFIX').AsInteger := -1
            Else If OperRF = 'D' Then
               // Se Resgate insere o item -5 (Valor Liquido)
               QryDetalhe.FieldByName('IDITEMRENFIX').AsInteger := -5;

            QryDetalhe.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
            QryDetalhe.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;

            //Se já existir um registro com a mesma chave,
            If Duplicado Then
               If MsgDlg('Já existe um registro lançado com esses parâmetros.' +
                          chr(13) + 'Tem certeza que deseja lançar em duplicidade ?',
                          'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                  Begin
                     Abort;
                  End;


            //Renan Cristiano - Sol 132401 Kintana 762732 inicio.

            sSql := 'INSERT INTO PADRLANCCONTINV                                             ' + #13 +
               '(IDPADRLANCCONT,IDTIPOINVEST, IDTIPOOPERACAO, HISTLANCINVEST, IDEMPRESA,     ' + #13 +
               'IDPESSOA, PLANO,                                                             ' + #13 +
               '   CONTADOPERFIN, CONTACOPERFIN, TIPLANCINVEST, CENCUSTDINVEST,              ' + #13 +
               'CENCUSTCINVEST,                                                              ' + #13 +
               '   CODCENTRORESPON, RECPAG, CODTIPRECDES, CODSUBCONTAC,                      ' + #13 +
               'CODSUBCONTAD, FLGPAGRECNAO,                                                  ' + #13 +
               '   IDFORCLI, TIPMOVCARTINV, UNIDNEGOC,                                       ' + #13 +
               'IDCARTEIRAINVEST,                                                            ' + #13 +
               '   IDTIPODESPINVEST, TIPCODIGO, IDINVESTIMENTO, IDCLASSETIT,                 ' + #13 +
               'IDITEMRENFIX,                                                                ' + #13 +
               '   IDUSUARIO,IDPLANPREVCTBPATR,IDFUNDOINVEST,DATAVIGENCIA, IDSEGMENTACAO,    ' + #13 +
               'IDTIPOFUNDOINVEST, CODTIPTITULO)                                             ' + #13 +
               'values                                                                       ' + #13 +
               '  (:IDPADRLANCCONT, :IDTIPOINVEST, :IDTIPOOPERACAO, :HISTLANCINVEST, :IDEMPRESA, ' + #13 +
               ':IDPESSOA,                                                                   ' + #13 +
               '   :PLANO, :CONTADOPERFIN, :CONTACOPERFIN, :TIPLANCINVEST,                   ' + #13 +
               ':CENCUSTDINVEST,                                                             ' + #13 +
               '   :CENCUSTCINVEST, :CODCENTRORESPON, :RECPAG, :CODTIPRECDES,                ' + #13 +
               ':CODSUBCONTAC,                                                               ' + #13 +
               '   :CODSUBCONTAD, :FLGPAGRECNAO, :IDFORCLI, :TIPMOVCARTINV,                  ' + #13 +
               ':UNIDNEGOC, :IDCARTEIRAINVEST, :IDTIPODESPINVEST, :TIPCODIGO,                ' + #13 +
               '   :IDINVESTIMENTO,                                                          ' + #13 +
               ':IDCLASSETIT, :IDITEMRENFIX, :IDUSUARIO, :IDPLANPREVCTBPATR,:IDFUNDOINVEST,  ' + #13 +
               '  :DATAVIGENCIA, :IDSEGMENTACAO, :IDTIPOFUNDOINVEST, :CODTIPTITULO)          ' + #13;

            QryUpd := TQuery.Create(Self);
            QryUpd.DatabaseName := 'BaseDados';

            With QryUpd Do
               Begin
                  Close;
                  Sql.clear;
                  sql.Add(sSql);
                  ParamByName('IDPADRLANCCONT').DataType := ftInteger;
                  ParamByName('IDTIPOINVEST').DataType := ftInteger;
                  ParamByName('IDTIPOOPERACAO').DataType := ftInteger;
                  ParamByName('HISTLANCINVEST').DataType := ftString;
                  ParamByName('IDEMPRESA').DataType := ftInteger;
                  ParamByName('IDEMPRESA').DataType := ftInteger;
                  ParamByName('IDPESSOA').DataType := ftInteger;
                  ParamByName('PLANO').DataType := ftString;
                  ParamByName('CONTADOPERFIN').DataType := ftString;
                  ParamByName('CONTACOPERFIN').DataType := ftString;
                  ParamByName('TIPLANCINVEST').DataType := ftString;
                  ParamByName('IDTIPOOPERACAO').DataType := ftInteger;
                  ParamByName('HISTLANCINVEST').DataType := ftString;
                  ParamByName('CENCUSTDINVEST').DataType := ftString;
                  ParamByName('CENCUSTCINVEST').DataType := ftString;
                  ParamByName('CODCENTRORESPON').DataType := ftString;
                  ParamByName('RECPAG').DataType := ftString;
                  ParamByName('CODTIPRECDES').DataType := ftString;
                  ParamByName('CODSUBCONTAC').DataType := ftString;
                  ParamByName('CODSUBCONTAD').DataType := ftString;
                  ParamByName('FLGPAGRECNAO').DataType := ftString;
                  ParamByName('IDFORCLI').DataType := ftInteger;
                  ParamByName('TIPMOVCARTINV').DataType := ftString;
                  ParamByName('UNIDNEGOC').DataType := ftString;
                  ParamByName('IDCARTEIRAINVEST').DataType := ftInteger;
                  ParamByName('IDTIPODESPINVEST').DataType := ftInteger;
                  ParamByName('TIPCODIGO').DataType := ftString;
                  ParamByName('IDINVESTIMENTO').DataType := ftInteger;
                  ParamByName('IDCLASSETIT').DataType := ftInteger;
                  ParamByName('IDITEMRENFIX').DataType := ftInteger;
                  ParamByName('IDUSUARIO').DataType := ftInteger;
                  ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;
                  ParamByName('IDFUNDOINVEST').DataType := ftInteger;
                  ParamByName('DATAVIGENCIA').DataType := ftString;
                  ParamByName('IDSEGMENTACAO').DataType := ftInteger;
                  ParamByName('IDTIPOFUNDOINVEST').DataType := ftInteger;
                  ParamByName('CODTIPTITULO').DataType := ftString;

                  If Not (QryDetalhe.FieldByName('IDPADRLANCCONT').IsNull) Then
                     ParamByName('IDPADRLANCCONT').AsInteger := QryDetalhe.FieldByName('IDPADRLANCCONT').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDTIPOINVEST').IsNull) Then
                     ParamByName('IDTIPOINVEST').AsInteger := QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDTIPOOPERACAO').IsNull) Then
                     ParamByName('IDTIPOOPERACAO').AsInteger := QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger;

                  If Not (QryDetalhe.FieldByName('HISTLANCINVEST').IsNull) Then
                     ParamByName('HISTLANCINVEST').AsString := QryDetalhe.FieldByName('HISTLANCINVEST').AsString;

                  If Not (QryDetalhe.FieldByName('IDEMPRESA').IsNull) Then
                     ParamByName('IDEMPRESA').AsInteger := QryDetalhe.FieldByName('IDEMPRESA').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDPESSOA').IsNull) Then
                     ParamByName('IDPESSOA').AsInteger := QryDetalhe.FieldByName('IDPESSOA').AsInteger;

                  If Not (QryDetalhe.FieldByName('PLANO').IsNull) Then
                     ParamByName('PLANO').AsString := QryDetalhe.FieldByName('PLANO').AsString;

                  If Not (QryDetalhe.FieldByName('CONTADOPERFIN').IsNull) Then
                     ParamByName('CONTADOPERFIN').AsString := QryDetalhe.FieldByName('CONTADOPERFIN').AsString;

                  If Not (QryDetalhe.FieldByName('CONTACOPERFIN').IsNull) Then
                     ParamByName('CONTACOPERFIN').AsString := QryDetalhe.FieldByName('CONTACOPERFIN').AsString;

                  If Not (QryDetalhe.FieldByName('TIPLANCINVEST').IsNull) Then
                     ParamByName('TIPLANCINVEST').AsString := QryDetalhe.FieldByName('TIPLANCINVEST').AsString;

                  If Not (QryDetalhe.FieldByName('IDTIPOOPERACAO').IsNull) Then
                     ParamByName('IDTIPOOPERACAO').AsInteger := QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger;

                  If Not (QryDetalhe.FieldByName('HISTLANCINVEST').IsNull) Then
                     ParamByName('HISTLANCINVEST').AsString := QryDetalhe.FieldByName('HISTLANCINVEST').AsString;

                  If Not (QryDetalhe.FieldByName('CENCUSTDINVEST').IsNull) Then
                     ParamByName('CENCUSTDINVEST').AsString := QryDetalhe.FieldByName('CENCUSTDINVEST').AsString;

                  If Not (QryDetalhe.FieldByName('CENCUSTCINVEST').IsNull) Then
                     ParamByName('CENCUSTCINVEST').AsString := QryDetalhe.FieldByName('CENCUSTCINVEST').AsString;

                  If Not (QryDetalhe.FieldByName('CODCENTRORESPON').IsNull) Then
                     ParamByName('CODCENTRORESPON').AsString := QryDetalhe.FieldByName('CODCENTRORESPON').AsString;

                  If Not (QryDetalhe.FieldByName('RECPAG').IsNull) Then
                     ParamByName('RECPAG').AsString := QryDetalhe.FieldByName('RECPAG').AsString;

                  If Not (QryDetalhe.FieldByName('CODTIPRECDES').IsNull) Then
                     ParamByName('CODTIPRECDES').AsString := QryDetalhe.FieldByName('CODTIPRECDES').AsString;

                  If Not (QryDetalhe.FieldByName('CODSUBCONTAC').IsNull) Then
                     ParamByName('CODSUBCONTAC').AsString := QryDetalhe.FieldByName('CODSUBCONTAC').AsString;

                  If Not (QryDetalhe.FieldByName('CODSUBCONTAD').IsNull) Then
                     ParamByName('CODSUBCONTAD').AsString := QryDetalhe.FieldByName('CODSUBCONTAD').AsString;

                  If Not (QryDetalhe.FieldByName('FLGPAGRECNAO').IsNull) Then
                     ParamByName('FLGPAGRECNAO').AsString := QryDetalhe.FieldByName('FLGPAGRECNAO').AsString;

                  If Not (QryDetalhe.FieldByName('IDFORCLI').IsNull) Then
                     ParamByName('IDFORCLI').AsInteger := QryDetalhe.FieldByName('IDFORCLI').AsInteger;

                  If Not (QryDetalhe.FieldByName('TIPMOVCARTINV').IsNull) Then
                     ParamByName('TIPMOVCARTINV').AsString := QryDetalhe.FieldByName('TIPMOVCARTINV').AsString;

                  If Not (QryDetalhe.FieldByName('UNIDNEGOC').IsNull) Then
                     ParamByName('UNIDNEGOC').AsString := QryDetalhe.FieldByName('UNIDNEGOC').AsString;

                  If Not (QryDetalhe.FieldByName('IDCARTEIRAINVEST').IsNull) Then
                     ParamByName('IDCARTEIRAINVEST').AsInteger := QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDTIPODESPINVEST').IsNull) Then
                     ParamByName('IDTIPODESPINVEST').AsInteger := QryDetalhe.FieldByName('IDTIPODESPINVEST').AsInteger;

                  If Not (QryDetalhe.FieldByName('TIPCODIGO').IsNull) Then
                     ParamByName('TIPCODIGO').AsString := QryDetalhe.FieldByName('TIPCODIGO').AsString;

                  If Not (QryDetalhe.FieldByName('IDINVESTIMENTO').IsNull) Then
                     ParamByName('IDINVESTIMENTO').AsInteger := QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDCLASSETIT').IsNull) Then
                     ParamByName('IDCLASSETIT').AsInteger := QryDetalhe.FieldByName('IDCLASSETIT').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDITEMRENFIX').IsNull) Then
                     ParamByName('IDITEMRENFIX').AsInteger := QryDetalhe.FieldByName('IDITEMRENFIX').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDUSUARIO').IsNull) Then
                     ParamByName('IDUSUARIO').AsInteger := QryDetalhe.FieldByName('IDUSUARIO').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDPLANPREVCTBPATR').IsNull) Then
                     ParamByName('IDPLANPREVCTBPATR').AsInteger := QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDFUNDOINVEST').IsNull) Then
                     ParamByName('IDFUNDOINVEST').AsInteger := QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;

                  If Not (QryDetalhe.FieldByName('DATAVIGENCIA').IsNull) Then
                     ParamByName('DATAVIGENCIA').AsString := QryDetalhe.FieldByName('DATAVIGENCIA').AsString;

                  If Not (QryDetalhe.FieldByName('IDSEGMENTACAO').IsNull) Then
                     ParamByName('IDSEGMENTACAO').AsInteger := QryDetalhe.FieldByName('IDSEGMENTACAO').AsInteger;

                  If Not (QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').IsNull) Then
                     ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

                  If Not (QryDetalhe.FieldByName('CODTIPTITULO').IsNull) Then
                     ParamByName('CODTIPTITULO').AsString := QryDetalhe.FieldByName('CODTIPTITULO').AsString;

                  ExecSQL;

                  //Renan Cristiano - Sol 132401 Kintana 762732 Fim.
               End;
         End
      Else
         Begin
            QryDetalhe.Post;
            QryDetalhe.ApplyUpdates;
            QryDetalhe.CommitUpdates;
         End;

      dtmbasedados.dbBaseDados.Commit;
   Except
      Raise;
      BtCancDet.Click;
      Exit;
   End;
   //Al_AL_17
   // Caso Inserindo ou alterado
   // Fecha e Abre a Query
   QryDetalhe.Close;
   QryDetalhe.Open;

   // Abilita Botoes
   BtIncDet.Enabled := True;
   BtAltDet.Enabled := True;
   BtDelDet.Enabled := True;
   // Sobe Botoes
   BtIncDet.Down := False;
   BtAltDet.Down := False;
   BtDelDet.Down := False;
   // Mostra Treeview
   Panel1.Visible := False;
   GrdDetalhe.Visible := True;

   PnlMestre.Enabled := True;

   AbreQry;

End;

Procedure TFrmCadContaContab.BtCancDetClick(Sender: TObject);
Begin
   Inherited;

   // Cancela Alteracao
   QryDetalhe.Cancel;

   // Mostra Treeview
   Panel1.Visible := False;
   GrdDetalhe.Visible := True;
   // Abilita Botoes
   BtIncDet.Enabled := True;
   BtAltDet.Enabled := True;
   BtDelDet.Enabled := True;
   // Sobe Botoes
   BtIncDet.Down := False;
   BtAltDet.Down := False;
   BtDelDet.Down := False;
   // Esconde o Painel
   If GrdDetalhe.CanFocus Then
      GrdDetalhe.SetFocus;

   If DbLkcTipoInvestimento.CanFocus Then
      DbLkcTipoInvestimento.SetFocus;

   PnlMestre.Enabled := True;
End;

Procedure TFrmCadContaContab.dbRGTipoLancamentoChange(Sender: TObject);
Begin
   Inherited;
   // Recebimento
   If dbRGTipoLancamento.ItemIndex = -1 Then
      Begin
         DbLkcCentRespon.Text := '';
         Label13.Enabled := False;
         DBcboTipoRecebimento.Enabled := False;
         Label9.Enabled := False;
         DbLkcCentRespon.Enabled := False;
      End
   Else
      Begin
         Label13.Enabled := True;
         DBcboTipoRecebimento.Enabled := True;
         Label9.Enabled := True;
         DbLkcCentRespon.Enabled := True;
      End;

   If dbRGTipoLancamento.ItemIndex = 0 Then
      Begin
         Label13.Caption := 'Tipo do Recebimento';
         If QryDetalhe.State In ([DsInsert, DsEdit]) Then
            Begin
               If Not QryDetalhe.IsEmpty Then
                  Begin
                     FazQuery(QryTipoRecebDesem,
                        'SELECT CODTIPRECDES, RECPAG, DESCRICAO ' +
                        '  FROM TIPORECEBDESEMB ' +
                        '  WHERE (IDPESSOA = ''' + IntToStr(Sistema.IdEmpresa) + ''') AND ' +
                        '        (RECPAG   = ''R'') AND ' +
                        '        (ANASINT  = ''A'')     ' +
                        '  ORDER BY DESCRICAO           ');
                  End;
            End;
      End
   Else
      Begin
         Label13.Caption := 'Tipo do Desembolso';
         If QryDetalhe.State In ([DsInsert, DsEdit]) Then
            Begin
               If Not QryDetalhe.IsEmpty Then
                  Begin
                     FazQuery(QryTipoRecebDesem,
                        'SELECT CODTIPRECDES, RECPAG, DESCRICAO ' +
                        '  FROM TIPORECEBDESEMB ' +
                        '  WHERE (IDPESSOA = ''' + IntToStr(Sistema.IdEmpresa) + ''') AND ' +
                        '        (RECPAG   = ''P'') AND ' +
                        '        (ANASINT  = ''A'')     ' +
                        '  ORDER BY DESCRICAO            ');
                  End;
            End;
      End;
End;

Procedure TFrmCadContaContab.BtCCCreditoClick(Sender: TObject);
Begin
   Inherited;
   // Executa Mostra Select
   MontaSelectConta.Executar;
   Repaint;
   // Caso Retorne Valor Altera a Conta Contabil
   If MontaSelectConta.RetornouValor Then Begin
         If MontaSelectConta.ValoresChave[4] = 'S' Then Begin
               MsgDlg('Conta Contábil não pode ser do tipo sintética.', 'Erro', mtError, [mbOK], 0);
               Exit;
            End;

         edContaContabil.Text := MontaSelectConta.ValoresChave[0];
         lbDescricaoConta.Caption := ' ' + MontaSelectConta.ValoresChave[1];
         QryDetalhe.FieldByName('CENCUSTCINVEST').Clear;
         If MontaSelectConta.ValoresChave[2] = 'S' Then Begin
               wObrigaContaC := 'S';
            End Else Begin
               wObrigaContaC := 'N';
            End;
      End;
End;

Procedure TFrmCadContaContab.edContaContabilChange(Sender: TObject);
Begin
   Inherited;
   // Busca Subcontas da Conta
   If EdContaContabil.Text <> '' Then Begin
         FazQuery(QryAux2, 'SELECT PLANOME FROM PLANOCONTA WHERE PLANO = ''' +
            QryVigencia.fieldByName('planocontabil').AsString + ''' AND ' + //Thiago Passos CGPC 28
            '  PLACONTA = ''' + EdContaContabil.Text + '''');
         lbDescricaoConta.Caption := ' ' + QryAux2.FieldByName('PLANOME').AsString;
      End;
End;

Procedure TFrmCadContaContab.edContaContabilDChange(Sender: TObject);
Begin
   Inherited;
   // Busca Subcontas da Conta
   If EdContaContabilD.Text <> '' Then Begin
         FazQuery(QryAux2, 'SELECT PLANOME FROM PLANOCONTA WHERE PLANO = ''' +
            QryVigencia.fieldByName('planocontabil').AsString + ''' AND ' + //Thiago Passos CGPC 28
            '  PLACONTA = ''' + EdContaContabilD.Text + '''');
         lbDescricaoContaD.Caption := ' ' + QryAux2.FieldByName('PLANOME').AsString;
      End;
End;

Procedure TFrmCadContaContab.DbLkcTipoLancamentoChange(Sender: TObject);
Begin
   Inherited;
   If DbLkcTipoLancamento.ItemIndex = 0 Then //A pagar
      dbRGTipoLancamento.Value := 'P'
   Else If DbLkcTipoLancamento.ItemIndex = 1 Then //A receber
      dbRGTipoLancamento.Value := 'R'
   Else //Nenhum
      Begin
         dbRGTipoLancamento.Value := '';
         DBcboTipoRecebimento.Text := '';
      End;
End;

Procedure TFrmCadContaContab.DbLkcTipoTituloChange(Sender: TObject);
Begin
   Inherited;
   // Verificar o funcionamento (não havia este código na Refer)
   //AL_5
   OperComum.LimpaParametros(QryBuscaInvestimento);
   If Trim(DbLkcTipoTitulo.Text) <> '' Then
      Begin
         //QryBuscaInvestimento.ParamByName('CODTIPTITULO').AsString :=
             //                        QryTipoTitulo.FieldByName('DESCTITULO').AsString;
               //                    QryTipoTitulo.FieldByName('CODTIPTITULO').AsString;
      End;
   // AL_5 - Fim
   QryBuscaInvestimento.Open;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcTipoOperacaoChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcCredorChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcCarteiraChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcTipoDespesaChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcTipoInvestimentoExit(Sender: TObject);
Begin
   Inherited;
   If (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 3) Or
      (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 4) Or
      (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 5) Or
      (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 6) Or
      (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 7) Or
      (QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 8) Then
      DbLkcInvestimento.Enabled := False
   Else
      DbLkcInvestimento.Enabled := True;

   // AL_26
   If (CtrlPinv.IdTipoInvest In [5, 6, 7, 9, 10]) Then // Fundos de Investimento
      Begin
         QryBuscaFundoInvest.Close;
         QryBuscaFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := QryBuscaTipoInvestimentoIdTipoInvest.AsInteger;
         QryBuscaFundoInvest.Open;

         qrySegmentacao.Close;
         qrySegmentacao.ParamByName('IDTIPOINVEST').AsInteger := QryBuscaTipoInvestimentoIdTipoInvest.AsInteger;
         qrySegmentacao.Open;

         QryTipoTitulo.Close;
         QryTipoTitulo.ParamByName('IDTIPOINVEST').AsInteger := QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger;
         qryTipoTitulo.Open;
      End;

   QryBuscaTipoOperacao.close;
   QryBuscaTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger;
   QryBuscaTipoOperacao.open;
   // AL_26 fim

   // Habilita Combos pelo Tipo de Investimento
   HabilitaCombos(QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger);

   AbreQry;

End;

Procedure TFrmCadContaContab.sbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   //AL_4
   With DmRelParamContab Do
      Begin
         QryContabil.Close;
         If Trim(DbLkcDataVigencia.Text) = '' Then // Se ele não informar o plano na combo, pega o plano vigente, senão pega o da combo  Thiago Passos CGPC 28
            QryContabil.ParamByName('PLANO').AsInteger := wIdPlano
         Else
            QryContabil.ParamByName('PLANO').AsInteger := QryVigencia.FieldByname('PlanoContabil').AsInteger; //Thiago Passos CGPC 28

         If FPrincipal.TipoMenuInvest = 'A' Then
            QryContabil.ParamByName('IDTIPOINVEST').Clear // Todos
         Else If FPrincipal.TipoMenuInvest = 'V' Then
            QryContabil.ParamByName('IDTIPOINVEST').AsInteger := 2 // Renda Variavel
         Else If FPrincipal.TipoMenuInvest = 'B' Then
            QryContabil.ParamByName('IDTIPOINVEST').AsInteger := 8 // BM&F
         Else If FPrincipal.TipoMenuInvest = 'F' Then
            QryContabil.ParamByName('IDTIPOINVEST').AsInteger := 1 // Renda Fixa
         Else If FPrincipal.TipoMenuInvest = 'I' Then
            Begin
               QryContabil.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
            End;
         QryContabil.Open;

         // AL_1 - 07/07/2004
         // Renda Fixa Novo
         ppDBDescClasseTit.Visible := True;
         // Renda Fixa Velho
         ppDBDescTitulo.Visible := False;
         // AL_1 - Fim

         // AL_25 - Tocando a label para indicar a exibição da classe do renda fixa
         If CtrlPinv.IdTipoInvest = 1 Then
            Begin
               pplabel3.visible := True;
               pplabel263.visible := False;
            End
         Else
            Begin
               pplabel3.visible := False;
               pplabel263.visible := True;
            End;
         // Fim AL_25

         If Not bModal Then
            TFrmPreview.CreateModalPreview(Application,
               DmRelParamContab.RptContabil,
               DmRelParamContab.RptContabil.PrinterSetup.DocumentName)
         Else
            DmRelParamContab.RptContabil.PrintToDevices;

         QryContabil.Close;
         If bModal Then
            bbtnSair.Click;
      End;
End;

Procedure TFrmCadContaContab.dblkClasseDoTituloChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.dblkItemRenFixChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.DbLkcInvestRenFixChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

//AL_18

Function TFrmCadContaContab.OperRF: String;
Begin
   // Verifica se é uma operação de Renda Fixa
   Result := 'N';
   If QryBuscaTipoOperacaoIDTIPOINVEST.AsInteger = 1 Then
      Begin
         If (QryBuscaTipoOperacaoNATUREZAOPERACAO.AsString <> 'N') And
            (QryBuscaTipoOperacaoTIPOCUSTODIA.AsString <> 'N') Then
            Result := QryBuscaTipoOperacaoNATUREZAOPERACAO.AsString;
      End;
End;

Procedure TFrmCadContaContab.LimpaLookUps;
Begin
   DbLkcTipoOperacao.Clear;
   //DbLkcDataVigencia.Clear;
   DbLkcSegmentacao.Clear;
   DbLkcTipoTitulo.Clear;
   DbLkcTipoDespesa.Clear;
End;

Procedure TFrmCadContaContab.FormCreate(Sender: TObject);
Begin
   //AL_17
   If (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50 {Tamanho da barra de tarefas e barra de staus}) Or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) Then
      WindowState := wsMaximized
   Else
      WindowState := wsNormal;

   Inherited;
End;

Procedure TFrmCadContaContab.dblkClasseDoTituloExit(Sender: TObject);
Begin
   Inherited;
   // AL_2 - 08/07/2004
   OperComum.LimpaParametros(qryInvestRenFix);
   If Trim(dblkClasseDoTitulo.Text) <> '' Then
      qryInvestRenFix.ParamByName('IDCLASSETIT').AsInteger := qryClasseDoTitulo.FieldByName('IDCLASSETIT').AsInteger;
   qryInvestRenFix.Open;
   // AL_2 - Fim
End;

Procedure TFrmCadContaContab.DbLkcTipoTituloExit(Sender: TObject);
Begin
   Inherited;
   // AL_5
   // AL_2 - 08/07/2004
   OperComum.LimpaParametros(QryBuscaInvestimento);
   If Trim(DbLkcTipoTitulo.Text) <> '' Then
      Begin
         //QryBuscaInvestimento.ParamByName('CODTIPTITULO').AsString :=
             //                        QryTipoTitulo.FieldByName('CODTIPTITULO').AsString;
      End;
   // AL_5 - Fim
   QryBuscaInvestimento.Open;
   // AL_2 - Fim

   If (DbLkcTipoTitulo.Text <> '') And (DbLkcSegmentacao.Text = '') Then Begin
         QrySegmentacao.close;
         QrySegmentacao.ParamByName('IDTIPOFUNDOINVEST').AsString := DbLkcTipoTitulo.LookupValue;
         QrySegmentacao.Open;
      End;
End;

Procedure TFrmCadContaContab.DbLkcTipoInvestimentoCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   //AL_26
   QryBuscaTipoOperacao.close;
   QryBuscaTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger;
   QryBuscaTipoOperacao.open; // Fim AL_26

   // Habilita Combos pelo Tipo de Investimento
   HabilitaCombos(QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger);

   LimpaLookUps;

   If Modified Then
      AbreQry;
End;

Procedure TFrmCadContaContab.SetModal(bMod: Boolean);
Begin
   bModal := bMod;
End;

// AL_5

Procedure TFrmCadContaContab.HabBtn;
Var bHab: Boolean;
Begin
   bHab := True;

   //AL_25
   // Plano Patrocinadora
   If Trim(dblkcPlanoPatro.Text) = '' Then
      Begin
         If Not QryDetalheIDPLANPREVCTBPATR.IsNull Then
            bHab := False;
      End
   Else
      Begin
         If QryPlanoPatroIDPLANPREVCTBPATR.AsInteger <> QryDetalheIDPLANPREVCTBPATR.AsInteger Then
            bHab := False;
      End; // AL_25

   // Tipo de Operação
   If Trim(DbLkcTipoOperacao.Text) = '' Then
      Begin
         If Not QryDetalheIDTIPOOPERACAO.IsNull Then
            bHab := False;
      End
   Else
      Begin
         If QryBuscaTipoOperacaoIDTIPOOPERACAO.AsInteger <> QryDetalheIDTIPOOPERACAO.AsInteger Then
            bHab := False;
      End;

   // Carteira de Investimento
   If bHab Then
      Begin
         If Trim(DbLkcCarteira.Text) = '' Then
            Begin
               If Not QryDetalheIDCARTEIRAINVEST.IsNull Then
                  bHab := False;
            End
         Else
            Begin
               If QryCarteiraInvestIDCARTEIRAINVEST.AsInteger <> QryDetalheIDCARTEIRAINVEST.AsInteger Then
                  bHab := False;
            End;
      End;

   //Tipo de Título
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger In [2, 5, 6, 7, 8] Then // Renda Variavel,BMF e fundos
            Begin
               If Trim(DbLkcTipoTitulo.Text) = '' Then
                  Begin
                     If Not QryDetalheIDTIPOFUNDOINVEST.IsNull Then
                        bHab := False;
                  End
               Else
                  Begin
                     If QryTipoTituloIDTIPOFUNDOINVEST.AsInteger <> QryDetalheIDTIPOFUNDOINVEST.AsInteger Then
                        bHab := False;
                  End;
            End;
      End;

   // Item de Renda Fixa
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger = 1 Then // Renda Fixa
            Begin
               If Trim(dblkItemRenFix.Text) = '' Then
                  Begin
                     If Not QryDetalheIDITEMRENFIX.IsNull Then
                        bHab := False;
                  End
               Else
                  Begin
                     If qryItemRenfixIDITEMRENFIX.AsInteger <> QryDetalheIDITEMRENFIX.AsInteger Then
                        bHab := False;
                  End;
            End;
      End;

   // Classe de Título de Renda Fixa
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger = 1 Then // Renda Fixa
            Begin
               //AL_19
               If Trim(dblkClasseDoTitulo.Text) = '' Then
                  Begin
                     If Not QryDetalheIDCLASSETIT.IsNull Then
                        bHab := False;
                  End
               Else
                  Begin
                     If qryClasseDoTituloIDCLASSETIT.AsInteger <> QryDetalheIDCLASSETIT.AsInteger Then
                        bHab := False;
                  End;
            End;
      End;

   //Tipo de Despesa
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger In [2, 8] Then // Renda Variavel e BMF
            Begin
               If Trim(DbLkcTipoDespesa.Text) = '' Then
                  Begin
                     If Not QryDetalheIDTIPODESPINVEST.IsNull Then
                        bHab := False;
                  End
               Else
                  Begin
                     If QryTipoDespesaIDTIPODESPINVEST.AsInteger <> QryDetalheIDTIPODESPINVEST.AsInteger Then
                        bHab := False;
                  End;
            End;
      End;

   // Investimento
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger = 1 Then // Renda Fixa
            Begin
               If Trim(DbLkcInvestRenFix.Text) = '' Then
                  Begin
                     If Not QryDetalheIDINVESTIMENTO.IsNull Then
                        bHab := False;
                  End
               Else
                  Begin
                     If qryInvestRenFixIDINVESTIMENTO.AsInteger <> QryDetalheIDINVESTIMENTO.AsInteger Then
                        bHab := False;
                  End;
            End
         Else
            If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger = 2 Then // Renda Variavel
               Begin
                  If Trim(DbLkcInvestimento.Text) = '' Then
                     Begin
                        If Not QryDetalheIDINVESTIMENTO.IsNull Then
                           bHab := False;
                     End
                  Else
                     Begin
                        If QryBuscaInvestimentoIDINVESTIMENTO.AsInteger <> QryDetalheIDINVESTIMENTO.AsInteger Then
                           bHab := False;
                     End;
               End;
      End;

   // SOL 171206 Kintana 1533850 - Otacilio Aquino ** INICIO **
   If bHab Then
      Begin
         If QryBuscaTipoInvestimentoIDTIPOINVEST.AsInteger in [6, 7, 9, 10] Then // Fundo Renda Variavel, Fundo de Direito Creditório, Fundo Imobiliario,  Fundo Estruturado
            Begin
               If Trim(DbLkcTipoDespesa.Text) = '' Then
                  Begin
                     If Trim(QryDetalheDESCTIPODESPINV.AsString) = '' Then
                          bHab := True
                     else
                       If Not QryTipoTituloIDTIPOFUNDOINVEST.IsNull Then
                          bHab := False;
                  End
               Else
                  Begin
                     If QryTipoDespesaIDTIPODESPINVEST.AsInteger <> QryDetalheIDTIPODESPINVEST.AsInteger Then
                        bHab := False;
                  End;
            End;
      End;
   // SOL 171206 Kintana 1533850 - Otacilio Aquino ** FIM **

   BtAltDet.Enabled := bHab;
   //AL_6
   sbtnCopiar.Enabled := ((DsDetalhe.State = dsBrowse) And (Not DsDetalhe.DataSet.IsEmpty) And (bHab));


End;

Procedure TFrmCadContaContab.QryDetalheAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   HabBtn;
End;

Procedure TFrmCadContaContab.QryDetalheAfterOpen(DataSet: TDataSet);
Begin
   Inherited;
   HabBtn;


End;
// AL_5 - Fim


Procedure TFrmCadContaContab.DsDetalheStateChange(Sender: TObject);
Begin
   Inherited;
   //AL_6
   sbtnCopiar.Enabled := ((DsDetalhe.State = dsBrowse) And
      (Not DsDetalhe.DataSet.IsEmpty) And
      (qryDetalhe.RecordCount = 1));
End;

Procedure TFrmCadContaContab.sbtnCopiarClick(Sender: TObject);
Var i, iPadrLancContInv: Integer;

Begin
   Inherited;
   Try
      Try
         // Abre Transasção
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Capta Novo ID que depois poderá ser alterado
         iPadrLancContInv := LeUltRegistro(Nil, 'PADRLANCCONTINV');

         // Fecha e prepara a query para Insert
         OperComum.LimpaParametros(qryCopiaParametro);
         // Faz Loop nos fields da query origem
         For i := 0 To QryDetalhe.FieldCount - 1 Do
            Begin
               // Joga Valores nos parametros identificando-os pelo nome do Field Origem
               If QryDetalhe.Fields[I].FieldName = 'IDPADRLANCCONT' Then
                  qryCopiaParametro.Params.FindParam(QryDetalhe.Fields[I].FieldName).Value := iPadrLancContInv
               Else
                  Begin
                     If qryCopiaParametro.Params.FindParam(QryDetalhe.Fields[I].FieldName) <> Nil Then
                        qryCopiaParametro.Params.FindParam(QryDetalhe.Fields[I].FieldName).Value := QryDetalhe.Fields[I].Value;
                  End;
            End;

         // Executa e Comita

         qryCopiaParametro.ExecSQL;
         DtmBaseDados.dbBaseDados.Commit;

         QryDetalhe.Close;
         QryDetalhe.Filter := 'IDPADRLANCCONT = ' + intToStr(iPadrLancContInv);
         QryDetalhe.Filtered := True;
         QryDetalhe.Open;

         MsgDlg('Data de vigência: ' +
            QryDetalhe.FieldByName('DATAVIGENCIA').AsString, 'Mensagem do Sistema', mtwarning, [mbOk], 0);

         QryDetalhe.Filtered := False;

         // Reabri a query para trazer o novo registro Localiza para visualização
         QryDetalhe.Close;
         QryDetalhe.Open;
      Except
         DtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Não foi possível copiar esta operação.', 'Erro', mtError, [mbOK], 0);
      End;
   Finally
      sbtnCopiar.Down := False;
   End;
End;

//AL_25

Procedure TFrmCadContaContab.dblkcPlanoPatroChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End; // Fim AL_25

//AL_26

Procedure TFrmCadContaContab.dblcFundoInvestChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;
// Fim AL_26

Procedure TFrmCadContaContab.dbDtVigenciaKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   Inherited;
   If Not (key In ['0'..'9']) Then Begin
         key := #0;
      End;
End;

Procedure TFrmCadContaContab.DbLkcDataVigenciaChange(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Procedure TFrmCadContaContab.wwDBLookupCombo1Change(Sender: TObject);
Begin
   Inherited;
   AbreQry;
End;

Function TFrmCadContaContab.Duplicado: boolean;
Var
   QryAux: TwwQuery;
   sSQL: String;
Begin

   QryAux := TwwQuery.Create(Nil);
   QryAux.DataBaseName := 'BaseDados';
   //Arrumar os campos que nao são obrigatorios para is null
   sSQL := ' SELECT  count(1) duplicado FROM PADRLANCCONTINV ';
   If QryDetalhe.FieldByName('IDPESSOA').AsString <> '' Then
      sSQL := sSQL + ' WHERE IDPESSOA = ' + QryDetalhe.FieldByName('IDPESSOA').AsString
   Else
      sSQL := sSQL + ' WHERE IDPESSOA IS NULL ';

   If QryDetalhe.FieldByName('IDEMPRESA').AsString <> '' Then
      sSQL := sSQL + ' AND IDEMPRESA = ' + QryDetalhe.FieldByName('IDEMPRESA').AsString
   Else
      sSQL := sSQL + ' AND IDEMPRESA IS NULL ';

   If QryDetalhe.FieldByName('IDTIPOINVEST').AsString <> '' Then
      sSQL := sSQL + ' AND IDTIPOINVEST = ' + QryDetalhe.FieldByName('IDTIPOINVEST').AsString
   Else
      sSQL := sSQL + ' AND IDTIPOINVEST IS NULL ';

   If QryDetalhe.FieldByName('TIPMOVCARTINV').AsString <> '' Then
      sSQL := sSQL + ' AND TIPMOVCARTINV =' + QuotedStr(QryDetalhe.FieldByName('TIPMOVCARTINV').AsString)
   Else
      sSQL := sSQL + ' AND TIPMOVCARTINV IS NULL';

   If QryDetalhe.FieldByName('IDTIPODESPINVEST').AsString <> '' Then
      sSQL := sSQL + ' AND IDTIPODESPINVEST = ' + QryDetalhe.FieldByName('IDTIPODESPINVEST').AsString
   Else
      sSQL := sSQL + ' AND IDTIPODESPINVEST IS NULL ';

   If QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsString <> '' Then
      sSQL := sSQL + ' AND IDPLANPREVCTBPATR = ' + QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsString
   Else
      sSQL := sSQL + ' AND IDPLANPREVCTBPATR IS NULL ';

   If QryDetalhe.FieldByName('IDTIPOOPERACAO').AsString <> '' Then
      sSQL := sSQL + ' AND IDTIPOOPERACAO = ' + QryDetalhe.FieldByName('IDTIPOOPERACAO').AsString
   Else
      sSQL := sSQL + ' AND IDTIPOOPERACAO IS NULL ';

   If QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsString <> '' Then
      sSQL := sSQL + ' AND IDCARTEIRAINVEST = ' + QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsString
   Else
      sSQL := sSQL + ' AND IDCARTEIRAINVEST IS NULL ';

   If QryDetalhe.FieldByName('IDINVESTIMENTO').AsString <> '' Then
      sSQL := sSQL + ' AND IDINVESTIMENTO = ' + QryDetalhe.FieldByName('IDINVESTIMENTO').AsString
   Else
      sSQL := sSQL + ' AND IDINVESTIMENTO IS NULL ';

   If QryDetalhe.FieldByName('IDCLASSETIT').AsString <> '' Then
      sSQL := sSQL + ' AND IDCLASSETIT = ' + QryDetalhe.FieldByName('IDCLASSETIT').AsString
   Else
      sSQL := sSQL + ' AND IDCLASSETIT IS NULL ';

   If QryDetalhe.FieldByName('IDITEMRENFIX').AsString <> '' Then
      sSQL := sSQL + ' AND IDITEMRENFIX = ' + QryDetalhe.FieldByName('IDITEMRENFIX').AsString
   Else
      sSQL := sSQL + ' AND IDITEMRENFIX IS NULL ';

   If QryDetalhe.FieldByName('DATAVIGENCIA').AsString <> '' Then
      sSQL := sSQL + ' AND DATAVIGENCIA = TO_DATE(' + QuotedStr(QryDetalhe.FieldByName('DATAVIGENCIA').AsString) + ', ''DD/MM/YYYY'')'
   Else
      sSQL := sSQL + ' AND DATAVIGENCIA IS NULL ';

   If QryDetalhe.FieldByName('IDSEGMENTACAO').AsString <> '' Then
      sSQL := sSQL + ' AND IDSEGMENTACAO = ' + QryDetalhe.FieldByName('IDSEGMENTACAO').AsString
   Else
      sSQL := sSQL + ' AND IDSEGMENTACAO IS NULL ';

   If QryDetalhe.FieldByName('CONTACOPERFIN').AsString <> '' Then
      sSQL := sSQL + ' AND CONTACOPERFIN = ' + QryDetalhe.FieldByName('CONTACOPERFIN').AsString
   Else
      sSQL := sSQL + ' AND CONTACOPERFIN IS NULL ';

   If QryDetalhe.FieldByName('PLANO').AsString <> '' Then
      sSQL := sSQL + ' AND PLANO = ' + QryDetalhe.FieldByName('PLANO').AsString
   Else
      sSQL := sSQL + ' AND PLANO IS NULL ';

   If QryDetalhe.FieldByName('CONTADOPERFIN').AsString <> '' Then
      sSQL := sSQL + ' AND CONTADOPERFIN = ' + QryDetalhe.FieldByName('CONTADOPERFIN').AsString
   Else
      sSQL := sSQL + ' AND CONTADOPERFIN IS NULL ';

   FazQuery(QryAux, sSQL);

   If (QryDetalhe.State In [dsInsert]) And (QryAux.FieldByName('duplicado').AsInteger > 0) Then
      result := True
   Else
      If (QryDetalhe.State In [dsEdit]) And (QryAux.FieldByName('duplicado').AsInteger > 1) Then
         Result := True
      Else
         Result := False;

End;

Procedure TFrmCadContaContab.DbLkcSegmentacaoExit(Sender: TObject);
Begin
   Inherited;
   If (DbLkcSegmentacao.Text <> '') And (DbLkcTipoTitulo.Text = '') Then Begin
         qryTipoTitulo.close;
         qryTipoTitulo.ParamByName('IDSEGMENTACAO').AsString := DbLkcSegmentacao.LookupValue;
         qryTipoTitulo.Open;
      End;
End;

End.

