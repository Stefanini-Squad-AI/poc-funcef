unit FExecTrataParcela;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : WO29270
Responsável : Paulo Nobre
Data        : 19/12/2025
Descrição   : Na qryHistMov, inclusão do CAST na coluna ANOMES.    
--------------------------------------------------------------------------------
Pendência   : WO19836
Responsável : Luis Ferrari
Data        : 07/05/2025
Descrição   : Inclusao da apropriação de pagamento parcial e nova funcinalidade
              ProcessaApropriacao para pagamento parcial da parcela.
--------------------------------------------------------------------------------
Pendência   : SIG 128773
Responsável : Luis Ferrari
Data        : 26/12/2022
Descrição   : Inclusão de filtros de parcelas e itens
--------------------------------------------------------------------------------
Pendência   : SOL 260658 PPM 1039277
Responsável : William Moreira da Silva
Data        : 25/08/2015
Descrição   : Ajuste apos reestruturação HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : Sol: 253185 PPM: 2040335
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 197911 Kintana 1896919
Responsável : William Moreira da Silva
Data        : 04/01/2013
Descrição   : O sistema não esta contando o dia atual
--------------------------------------------------------------------------------
Pendência   : SOL 153390 Kintana 1158919
Responsável : Douglas.Siqueira
Data        : 30/07/2012
Descrição   : Tratamentos\Tratamento Individual de Parcelas.
--------------------------------------------------------------------------------
Pendência   : SOL 139920 Kintana 870396
Responsável : BRUNO AZEVEDO
Data        : 04/10/2010
Descrição   : Ajustado a query principal para trazer os itens das parcelas.
--------------------------------------------------------------------------------
Pendência   : SOL 142594 KTN 912858
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não exibir suspensão que não seja apenas de concessão na tela de
              Inscrição / Concessão / Renovação
--------------------------------------------------------------------------------
Pendência   : SOL 88590 KINTANA 523383
Responsável : Fernando Santana
Data        : 08/06/2010
Descrição   : Quando o botão btnSuspensao estiver desabilitado, desabilitar o componente DBcboTipoSuspXContr.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jésica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : SOL 100479 \	Kintana 445459
Responsável : Renato Visoni
Data        : 20/11/2008
Descrição   : Criação dos campos tipo de recurso e origem do recurso.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : btnContinuaConfirmaClick
Data      : 13/08/2007
Autor     : Marchetti
Pendencia : 26085
Descrição : Ajuste na totalização do Edit de Valores a Enviar.
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    : InsereDiferencaHist
Data      : 01/02/2007
Autor     : Marchetti
Pendência : 24380
Descrição : Só insere diferença se Valor arredondado for diferente de ZERO.
--------------------------------------------------------------------------------
Rotina    : btnAbonoClick
Data      : 23/06/2006
Autor     : Alberto Carvalho
Pendência : 22671
Descrição : Grava em HISTMOVEMPTMO.IDUSUARIOESTORNO o usuário que efetuou o
            abono.
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 29/05/2006
Autor     : Marchetti
Pendência : 21225
Descrição : Fazer o envio para o CAR utilizando ou não Forma de Recebimento
            Diferenciada.
--------------------------------------------------------------------------------
Rotina    :
Data      : 05/04/2006 a 06/04/2006
Autor     : André Pontes
Pendência : 21885
Descrição : Reaberta após conversa com Luciana em 05/04, que esclareceu a
            situação. São 2 problemas:
            1) Como o tratamento é POR PARCELA, ao selecionar-se item de IOF ou
               Seguro Complementar, marca automaticamente a prestação de mesmo
               nº;
            2) Pelo acima, trata também item suspenso, o que não deveria.

            Não permitir tratamento de item suspenso (se não for liberação).
            Não permitir tratamento de itens "misturados" (prestação/encargos
            com outros itens).
--------------------------------------------------------------------------------
Rotina    : btnDesfazBaixaClick(...)
Data      : 04/04/2006
Autor     : André Pontes
Pendência :
Descrição : Baixa manual não verifica bloqueio contábil.
--------------------------------------------------------------------------------
Rotina    : btnDesfazBaixaClick(...)
Data      : 17/03/2006
Autor     : André Pontes
Pendência :
Descrição : Chamada da rotina de acerto da situação contratual.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 26/01/2006
Autor     : André Pontes
Pendência : 21331
Descrição : Verificação de registros baixados ainda não recebidos.
--------------------------------------------------------------------------------
Rotina    : btnSuspensaoClick
Data      : 28/09/2005
Autor     : André Pontes
Pendência : 20126
Descrição : Supender TODOS os itens da parcela.
--------------------------------------------------------------------------------
Rotina    : Envio de itens conforme escolha do usuário
Data      : 26/09/2005
Autor     : Marchetti
Pendência : 19909
Descrição : Criada nova página com os itens a serem enviados quando mudança de
            vencimento com encargos.
--------------------------------------------------------------------------------
Rotina    : btnSuspensaoClick / btnLiberaSuspensaoClick
Data      : 21/06/2005
Autor     : André Pontes
Pendência : 19459
Descrição : Bloqueio de suspensão e liberação de suspensão de acordo com
            parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 13/06/2005
Autor     : André Pontes
Pendência : 19459
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : ProcessaMudancaVencimento
Data      : 14/09/2004
Autor     : André Pontes
Pendencia : -
Descrição : Correção do estorno do Documento (estava tentando excluir)
--------------------------------------------------------------------------------
Rotina    : ProcessaMudancaVencimento
Data      : 11/04/2004
Autor     : Marchetti
Pendencia : 18037
Descrição : na mudança de vencimento sem encargos, ao finalizar o processo chama
            a rotina para efetuar o envio.
--------------------------------------------------------------------------------
Rotina    : ProcessaMudancaVencimento
Data      : 03/03/2004
Autor     : André Pontes
Pendencia : -
Descrição : Criada opção para alterar vencimento sem gerar encargos.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 17/07/2003
Autor     : Marchetti
Pendencia : 21496 (3S)
Descrição : Chamada da rotina de estorno de provisão de perdas.
--------------------------------------------------------------------------------
Rotina    : Alteração de Vencimento
Data      : 04/02/2003
Autor     : André Pontes
Descrição : Itens não são mais contabilizados nesse momento. Serão
            contabilizados em bloco no Tratamento de Divergências.
--------------------------------------------------------------------------------
Rotina    : btnSuspensaoClick e btnLiberaSuspensaoClick
Data      : 11/01/2003
Autor     : André Pontes
Descrição : Habilitação dos botões e implementação das rotinas (apenas
            marcar/desmarcar flgSuspensao)
--------------------------------------------------------------------------------
Rotina    : BaixaManualCAR
Data      : 11/12/2002
Autor     : André Pontes
Descrição : Fim da restrição de baixa manual de registros que estejam ligados a
            um documento de Contas a Receber.
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Envia os itens para o CAP/CAR, independente se calculou divergência,
            pois pode ocorrer somente a mudança de vencimento, sem recálculo de
            encargos.
--------------------------------------------------------------------------------
Rotina    : BaixaManualFolha / BaixaManualCAR
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Itens baixados manualmente recebem FLGENVIO = NULL
--------------------------------------------------------------------------------
Rotina    : ContabilizaAbono
Data      : 07/10/2002
Autor     : Marchetti
Descrição : Colocado o número do contrato na mensagem para contabilização.
--------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick
Data      : 07/10/2002
Autor     : André Pontes
Descrição : checkbox + parametro PFLGBAIXAMANUAL que regula a exibição de itens
            baixados manualmente.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, wwdbedit, uCtrlContab, uCtrlPadroes, UAutorizacao,
   uTypesEmptmo, Wwdbspin,uCmMath;

type
   TTipoTratamento = (ttAbono, ttBaixa, ttDesvioFolha, ttSuspensao, ttLiberaSuspensao, ttVencto, ttDesvioCAR);

   TNovosDados = record
      Valor          : Double;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
      DataVencto     : TDateTime;
   end;

   TfrmExecTrataParcela = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      btnVolta: TfcShapeBtn;
      btnContinua: TfcShapeBtn;
      Panel4: TPanel;
      pnlInformaFinal: TPanel;
      btnVoltaInicio: TfcShapeBtn;
      dts: TwwDataSource;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovANOMES: TStringField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      lblData: TLabel;
      edtDataProcesso: TCMDateTimePicker;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      Bevel1: TBevel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      qryHistMovVirtual: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      DBgrdHistMovVirtual: TwwDBGrid;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryAux: TwwQuery;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovVirtualTRATAMENTO: TStringField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualPARCELA: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEDATAPREVISTA: TStringField;
      qryHistMovVirtualDESCRICAO: TStringField;
      edtDataVencto: TCMDateTimePicker;
      Label2: TLabel;
      DBgrdHistMovIButton: TwwIButton;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryAgrupaDocs: TwwQuery;
      updHistMov: TUpdateSQL;
      qryHistMovPLNCODIGO: TFloatField;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      qryHistMovFORMACOBRANCA: TStringField;
      qryAgrupaDocsCODDOCUMENTO: TFloatField;
      qryAgrupaDocsDATAVENCTO: TDateTimeField;
      qryAgrupaDocsCODPORTFORMA: TFloatField;
      qryAgrupaDocsGRUPODOC: TStringField;
      Label5: TLabel;
      edtVlrSelecao: TRealEdit;
      qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label9: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      edtVlrRecebido: TRealEdit;
      Label13: TLabel;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      Label14: TLabel;
      qryHistMovFLGENVIO: TFloatField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovSTATUS: TStringField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      Label51: TLabel;
      DBEdit4: TDBEdit;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovVirtualHMEDATAVENCTO: TStringField;
      qryHistMovVirtualVALOR: TFloatField;
      chkBaixaManual: TCheckBox;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      chkSuspensao: TCheckBox;
      qryHistMovFLGSUSPENSAO: TFloatField;
      qryDesMarcaSuspensao: TwwQuery;
      qryMarcaSuspensao: TwwQuery;
      Label19: TLabel;
      btnDesvio: TfcShapeBtn;
      btnAbono: TfcShapeBtn;
      btnAlteraVencto: TfcShapeBtn;
      btnDesfazBaixa: TfcShapeBtn;
      btnBaixaManual: TfcShapeBtn;
      btnAlteraVencSemEnc: TfcShapeBtn;
      chkEncargos: TCheckBox;
      Label20: TLabel;
      qryHistMovHMEPARCELAALT: TFloatField;
      DBcboTipoSuspXContr: TwwDBLookupCombo;
      Label23: TLabel;
      btnLiberaSuspensao: TfcShapeBtn;
      btnSuspensao: TfcShapeBtn;
      Bevel2: TBevel;
      Bevel3: TBevel;
      qryHistMovTSEDESCRICAO: TStringField;
      qryHistMovFLGATUALSALDOPARC: TFloatField;
      Label15: TLabel;
      DBcboTipoDocRec: TwwDBLookupCombo;
      chkAgrupaParcela: TCheckBox;
      chkNaoEnvia: TCheckBox;
      btnConfirmar: TfcShapeBtn;
      btnVoltaTudo: TfcShapeBtn;
      Panel1: TPanel;
      dbgItensEnviar: TwwDBGrid;
      btnContinuaConfirma: TfcShapeBtn;
      updItensGerados: TUpdateSQL;
      qryItensGerados: TwwQuery;
      dsItensGerados: TwwDataSource;
      edtVlrEnviar: TRealEdit;
      Label24: TLabel;
      qryItensGeradosIDHISTMOVEMPTMO: TFloatField;
      qryItensGeradosITEDESCRICAO: TStringField;
      qryItensGeradosANOMES: TStringField;
      qryItensGeradosHMEANOCOMPETENCIA: TFloatField;
      qryItensGeradosHMEMESCOMPETENCIA: TFloatField;
      qryItensGeradosHMESEQCOBRANCA: TFloatField;
      qryItensGeradosHMETIPOMOV: TFloatField;
      qryItensGeradosIDCONTRATOEMPTMO: TFloatField;
      qryItensGeradosIDITEMEMPTMO: TFloatField;
      qryItensGeradosFLGBAIXADO: TFloatField;
      qryItensGeradosHMEDATAPREVISTA: TDateTimeField;
      qryItensGeradosHMEVLRPREVISTO: TFloatField;
      qryItensGeradosHMESALDODEV: TFloatField;
      qryItensGeradosPLNCODIGO: TFloatField;
      qryItensGeradosHMETXJUROS: TFloatField;
      qryItensGeradosHMEPARCELA: TFloatField;
      qryItensGeradosHMEPARCELAALT: TFloatField;
      qryItensGeradosHMENUMPARCELAS: TFloatField;
      qryItensGeradosHMEDATAATUALIZA: TDateTimeField;
      qryItensGeradosHMEDATAEFETIVA: TDateTimeField;
      qryItensGeradosHMEVLREFETIVO: TFloatField;
      qryItensGeradosHMERECPAG: TStringField;
      qryItensGeradosIDITEMCENTRALIZA: TFloatField;
      qryItensGeradosIDREGRA: TFloatField;
      qryItensGeradosHMEORIGEM: TFloatField;
      qryItensGeradosHMEPRIORIDADE: TFloatField;
      qryItensGeradosEVENTO: TStringField;
      qryItensGeradosHMEFORMACOBRANCA: TStringField;
      qryItensGeradosIDRUBRICA: TFloatField;
      qryItensGeradosIDPATRO: TFloatField;
      qryItensGeradosCODDOCUMENTO: TFloatField;
      qryItensGeradosHMECENTRALIZA: TFloatField;
      qryItensGeradosHMEDESTACADO: TFloatField;
      qryItensGeradosHMEANOCOBRANCA: TFloatField;
      qryItensGeradosHMEMESCOBRANCA: TFloatField;
      qryItensGeradosHMEDATAVENCTO: TDateTimeField;
      qryItensGeradosFLGENVIO: TFloatField;
      qryItensGeradosFLGBAIXAMANUAL: TFloatField;
      qryItensGeradosFLGSUSPENSAO: TFloatField;
      qryItensGeradosFORMACOBRANCA: TStringField;
      qryItensGeradosSTATUS: TStringField;
      qryItensGeradosTSEDESCRICAO: TStringField;
      qryItensGeradosFLGATUALSALDOPARC: TFloatField;
      btnInverteEnvio: TBitBtn;
      btnMarcaTodosEnvio: TBitBtn;
      qryItensSuspensao: TwwQuery;
      qryItensSuspensaoIDHISTMOVEMPTMO: TFloatField;
      qryHistMovXDocum: TwwQuery;
      qryHistMovXDocumQUANT: TFloatField;
      qryHistMovIDTMPDESC: TFloatField;
      chkPrestacaoEncargo: TCheckBox;
      chkNAOSuspensao: TCheckBox;
      btnPrestacaoSim: TBitBtn;
      qryHistMovFLGESCOLHA: TFloatField;
      qryItensGeradosFLGESCOLHA: TFloatField;
      btnPrestacaoNao: TBitBtn;
    Label25: TLabel;
    Label26: TLabel;
    Bevel4: TBevel;
    Label27: TLabel;
    Bevel9: TBevel;
    Label28: TLabel;
    EdOrigemRecurso: TEdit;
    cboTipoRecurso: TwwDBLookupCombo;
    qryTipoRecurso: TwwQuery;
    QryAuxiliar: TwwQuery;
    chkParcela: TCheckBox;
    spnParcela: TwwDBSpinEdit;
    chkFiltroItem: TCheckBox;
    DBcboItem: TwwDBLookupCombo;
    chkFaixaDatas: TCheckBox;
    edtDataIni: TCMDateTimePicker;
    Label73: TLabel;
    edtDataFim: TCMDateTimePicker;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaClick(Sender: TObject);
      procedure btnVoltaClick(Sender: TObject);
      procedure btnVoltaInicioClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure btnDesvioClick(Sender: TObject);
      procedure btnBaixaManualClick(Sender: TObject);
      procedure btnAbonoClick(Sender: TObject);
      procedure btnSuspensaoClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure btnAlteraVenctoClick(Sender: TObject);
      procedure DBgrdHistMovExit(Sender: TObject);
      procedure btnInverteSelecaoClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnDesfazBaixaClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnLiberaSuspensaoClick(Sender: TObject);
      procedure btnAlteraVenctoSemEncClick(Sender: TObject);

      // Marchetti - Pendencia 19909
      procedure btnContinuaConfirmaClick(Sender: TObject);
      procedure dbgItensEnviarExit(Sender: TObject);
      procedure qryItensGeradosFLGESCOLHAChange(Sender: TField);
      procedure btnMarcaTodosEnvioClick(Sender: TObject);
      procedure btnInverteEnvioClick(Sender: TObject);
      procedure btnPrestacaoSimClick(Sender: TObject);
      procedure btnPrestacaoNaoClick(Sender: TObject);
      procedure qryHistMovFLGESCOLHAChange(Sender: TField);
    procedure cboTipoRecursoChange(Sender: TObject);
      // Fim Marchetti - Pendencia 19909
      procedure AbreQueriesHistorico;
    procedure chkParcelaClick(Sender: TObject);
    procedure chkFiltroItemClick(Sender: TObject);
    procedure DBcboItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edtDataIniExit(Sender: TObject);
    procedure edtDataIniCloseUp(Sender: TObject);
    procedure edtDataFimCloseUp(Sender: TObject);
    procedure edtDataFimExit(Sender: TObject);
    procedure chkFaixaDatasClick(Sender: TObject);        //SIG 128773 Ferrari


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      sCentroCusto         : String;
      iPrograma            : Integer;
      iMoedaCorrente       : Integer;

      rContrato            : TDadosContrato;
      vLista               : TListaItem;
      vListaCompleta       : TListaItem;
      pbOk                 : Boolean;
      pbExclui             : Boolean;
      IDContrato           : Extended;
      sNomePatro           : String;
      iContMarcados        : Integer;
      Parcela              : TStringList;//douglas.siqueira SOL153390
      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;
      sRegistros           : String;

      rLogTotalPrev        : TLogTotalPrev;

      bHabilitado          : Boolean;

      // Pendência 24818 - 21/03/2007 - Alberto
      bConfirmarHabilitado : Boolean;
      bItemApropriado , bItemDiferenca     : Boolean; //WO19836  Ferrari

      Apropriacao:Boolean ; //WO19836 - Ferrari

      procedure Sel(i: Extended);
      procedure AbreQueriesDebito;
      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

{      function CriaListaOpcoes(const CheckList: TCheckListBox; const Lista: TStringList;
      var Valor: string; Separador: string; EntrePliques: boolean;
      UsaNames: boolean = false): word;       }


      function VerificaPreenchimento(TipoTratamento: TTipoTratamento): Boolean;

      procedure PreencheTabelaVirtual(bAbreTabela : Boolean);

      procedure ProcessaMudancaVencimento(bEncargos: Boolean = True; bApropriacao: Boolean = False);

      procedure PreencheDadosContrato(const qryContrato      : TwwQuery;
                                      var   rDadosContrato   : TDadosContrato
                                     );

      procedure PreencheTabelaVirtualVencimento(bAbreTabela : Boolean);
      function  ContabilizaAbono : Int64;

      function DesviarParaFolha: Boolean;   // altera forma de cobrança da parcela para folha de benefícios
      function DesviarParaCAR: Boolean;     // altera forma de cobrança da parcela para contas a receber
      function BaixaManualCAR: Boolean;     // baixa manual car
      function BaixaManualFolha: Boolean;   // baixa manual folha de benefícios

      function  VerificaBaixa: Boolean;
      function  VerificaTMPDESC: Boolean;
      procedure InsereDiferencaHist(qryLocal:TwwQuery; NovosDados:TNovosDados);

      procedure MarcaRegistros;

      function  RegistroComDocumento: Boolean;

      function  AtualizaSitPart(const iIDHistMovEmptmo: Extended)  : Boolean;
          function VerificaAgendamento(IDCONTRATOEMPTMO:string;NPARCELA:STRING):Boolean ;

      function ProcessaApropriacao: Boolean; // Apropriacao Parcial da Parcela - WO19836 - Ferrari


   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;
      DataTratado:string ;
      DataVencimento:String ;



   end;


var
  frmExecTrataParcela: TfrmExecTrataParcela;
  TipoTratamento     : TTipoTratamento;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uCalcEmptmo, UMensErro, USistema, dBaseDados, UIntegraEmptmo, dIntegraEmptmo,
   dEmptmo, DLookEmptmo, FProgresso, uDocumento, uDatabase, uDiasUteis, uVerificaPreenchimento,
   dMS, fAguarde, uLancContab, fExecBuscaContrato, dAtualizacaoDiaria, FExecSelecionaContrato,
   uIntegraModulo;

{function TfrmExecTrataParcela.CriaListaOpcoes(const CheckList: TCheckListBox;
  const Lista: TStringList; var Valor: string; Separador: string; EntrePliques: boolean;
  UsaNames: boolean): word;
var
  wAux: word;
  I, K: integer;
  AuxValor: string;
begin
  AuxValor := '';
  K := 1;
  wAux := 0;
  for I:=0 to CheckList.Items.Count-1 do
    if (CheckList.Checked[I]) then
    begin
      if (K = 1) then
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := Lista[I];
        end;
        Inc(K);
      end
      else
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := AuxValor +Separador+ QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := AuxValor +Separador+ Lista[I];
        end;
      end;
      Inc(wAux);
    end;

  Valor := AuxValor;
  Result := wAux;
end;   }

procedure TfrmExecTrataParcela.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   ntbPrincipal.PageIndex     := 0;
   iContMarcados              := 0;
   Parcela :=TStringList.Create;
   Parcela.Clear;


   Autorizacao.AutorizarForm(self, afNormal);

   bHabilitado                := btnContinuaSelecao.Enabled;
   btnContinuaSelecao.Enabled := False;

   //Pendência 24818 - 21/03/2007 - Alberto
   bConfirmarHabilitado       := btnConfirmar.Enabled;
   DBcboTipoSuspXContr.Enabled := btnSuspensao.Enabled; // Fernando Santana SOL 88590 KINTANA 523383
   AbreQueriesDebito;
//   ListaParcela := TStringList.Create;
end;



procedure TfrmExecTrataParcela.FormActivate(Sender: TObject);
begin
   inherited;

   edtDataProcesso.ButtonWidth      := 21;
   edtDataProcesso.Date             := SysDate;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
end;



procedure TfrmExecTrataParcela.HabilitaBotoes;
begin
   btnContinua.Enabled         := True;
   btnVolta.Enabled            := True;
   btnVoltaInicio.Enabled      := True;

   // Pendência 24818 - 21/03/2007 - Alberto
   btnConfirmar.Enabled        := bConfirmarHabilitado;

   bbtnAjuda.Enabled           := True;
   bbtnSair.Enabled            := True;

   ntbPrincipal.Enabled        := True;
   Screen.Cursor               := crDefault;
   
   btnContinuaConfirma.Enabled := True;
end;



procedure TfrmExecTrataParcela.DesabilitaBotoes;
begin
   Screen.Cursor               := crHourGlass;
   ntbPrincipal.Enabled        := False;

   btnContinua.Enabled         := False;
   btnVolta.Enabled            := False;
   btnVoltaInicio.Enabled      := False;
   btnConfirmar.Enabled        := False;

   bbtnAjuda.Enabled           := False;
   bbtnSair.Enabled            := False;

   btnContinuaConfirma.Enabled := False;
end;



function TfrmExecTrataParcela.VerificaPreenchimento(TipoTratamento: TTipoTratamento): Boolean;
var
   sMsg           : String;
   sDataLanc      : String;
   sMsgContab     : String;
   iTipoMovIni    : Integer;
   iTipoMovAtu    : Integer;
   iStatusDoc     : Integer;
   iEmpresa       : Integer;
   iExercicio     : Integer;
   iPeriodo       : Integer;
   bSelecionado   : Boolean;
begin
	Result := False;

   try
      // -------------------------------------------------------------------------------------------

      // André Pontes - 26/01/2006
      if TipoTratamento in [ttAbono, ttDesvioCaR, ttDesvioFolha, ttSuspensao, ttVencto] then
      begin
         bSelecionado := False;

         qryHistMov.DisableControls;
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               bSelecionado := True;
               Break;
            end;

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)

         qryHistMov.EnableControls;

         if not(bSelecionado) then
            raise EValidacao.CreateVal('É necessário selecionar pelo menos 1 item para tratamento!', DBgrdHistMov);
      end;
      // FIM André Pontes - 26/01/2006

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      // André Pontes - 05/04/2006 - pendência 21885
      // Para evitar problemas, não permitir o tratamento de outros itens que não prestação/encargos
      // junto com prestação/encargos

      if TipoTratamento in [ttVencto] then
      begin
         bSelecionado := False;

         qryHistMov.DisableControls;
         qryHistMov.First;

         iTipoMovIni := qryHistMovHMETIPOMOV.AsInteger;
         if iTipoMovIni = 4 then iTipoMovIni := 1;

         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               iTipoMovAtu := qryHistMovHMETIPOMOV.AsInteger;
               if iTipoMovAtu = 4 then iTipoMovAtu := 1;

               if iTipoMovAtu <> iTipoMovIni then
               begin
                  bSelecionado := True;
                  Break;
               end;
            end;

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)

         qryHistMov.EnableControls;

         if bSelecionado then
            raise EValidacao.CreateVal('Não é permitido tratar de uma só vez itens de eventos distintos!', DBgrdHistMov);
      end;
      // André Pontes - 05/04/2006

      // -------------------------------------------------------------------------------------------

      // André Pontes - 05/04/2006 - pendência 21422 - específica FUNCEF
      if Sistema.TipoCliente = 19991 then
      begin
         if TipoTratamento in [ttDesvioFolha, ttVencto] then
         begin
            qryHistMov.DisableControls;
            qryHistMov.First;
            while not(qryHistMov.EOF) do
            begin
               if qryHistMovFLGESCOLHA.AsInteger = 0 then
               begin
                  qryHistMov.Next;
                  Continue;
               end;

               if not(qryHistMovCODDOCUMENTO.IsNull) then
               begin
                  begin
                     iStatusDoc := IntegraEmptmo.VerificaDocumento(qryHistMovCODDOCUMENTO.AsFloat, sMsg);

                     if (iStatusDoc = -5) or (iStatusDoc = -2) or (iStatusDoc = -1) or (iStatusDoc = 0) then
                     begin
                        sMsg := 'Pelo menos um dos itens selecionados pertence a um Documento ainda não recebido!';
                        raise EValidacao.CreateVal(sMsg, DBgrdHistMov);
                     end;
                  end
               end;

               qryHistMov.Next;
            end;  // while not(qryHistMov.EOF)
            qryHistMov.EnableControls;
         end;
      end;  // if Sistema.TipoCliente = 19991
      // FIM André Pontes - 05/04/2006 - pendência 21422 - específica FUNCEF

      // -------------------------------------------------------------------------------------------

      // André Pontes - 26/01/2006 - pendência 21331
      if TipoTratamento in [ttAbono, ttDesvioCaR, ttDesvioFolha, ttSuspensao, ttVencto] then
      begin
         qryHistMov.DisableControls;
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 0 then
            begin
               qryHistMov.Next;
               Continue;
            end;

            if not(qryHistMovCODDOCUMENTO.IsNull) then
            begin
               if IntegraEmptmo.VlrBaixadoDoc(qryHistMovCODDOCUMENTO.AsFloat) > 0 then
               begin
                  sMsg := 'Pelo menos um dos itens selecionados pertence a um Documento que está recebido (parcial ou totalmente)!';
                  raise EValidacao.CreateVal(sMsg, DBgrdHistMov);
               end;
            end;

            if not(qryHistMovIDTMPDESC.IsNull) then
            begin
               if IntegraEmptmo.VlrBaixadoTMPDESC(qryHistMovIDTMPDESC.AsFloat) <> 0 then
               begin
                  sMsg := 'Pelo menos um dos itens selecionados já foi recebido na Folha!';
                  raise EValidacao.CreateVal(sMsg, DBgrdHistMov);
               end;
            end;

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)
         qryHistMov.EnableControls;
      end;
      // FIM André Pontes - 26/01/2006 - pendência 21331

      // -------------------------------------------------------------------------------------------

      // André Pontes - pendência 20261 - 28/09/2005
      if TipoTratamento in [ttAbono] then
      begin
         qryHistMov.DisableControls;
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 0 then
            begin
               qryHistMov.Next;
               Continue;
            end;

            if (qryHistMovHMETIPOMOV.AsInteger <> 4) then
            begin
               sMsg := 'Só é permitido o abono de encargos.' + #13 + 'E necessário corrigir a seleção de itens.';
               raise EValidacao.CreateVal(sMsg, edtDataVencto);
            end;

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)
         qryHistMov.EnableControls;
      end;  // if TipoTratamento
      // FIM André Pontes - pendência 20261 - 28/09/2005

      // Marchetti - Pendencia 22755 - 10/04/2007
      // Colocada a critica para obrigar o preenchimento da data de abono
      if TipoTratamento = ttAbono then
         if length(trim(edtDataVencto.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Data de Abono!', edtDataVencto);

      // Marchetti - Pendencia 22162
      if TipoTratamento in [ttAbono] then
      begin
         qryHistMov.DisableControls;
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 0 then
            begin
               qryHistMov.Next;
               Continue;
            end;

            if (StrToDate(edtDataVencto.Text) < qryHistMovHMEDATAPREVISTA.AsDateTime) then
            begin
               sMsg := 'A data do Abono deve ser igual ou superior à Data Prevista do Item.' + #13 + 'É necessário corrigir a data informada.';
               raise EValidacao.CreateVal(sMsg, edtDataVencto);
            end;

            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)
         qryHistMov.EnableControls;
      end;  // if TipoTratamento
      // Fim Marchetti - Pendencia 22162

      // -------------------------------------------------------------------------------------------

      if TipoTratamento in [ttAbono, ttBaixa, ttSuspensao] then
         if length(trim(edtDataProcesso.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Data do Processo!', edtDataProcesso);

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then
      begin
         if edtVlrRecebido.Value = 0 then
         begin
            // se valor recebido = ZERO, baixa pelo valor previsto
            if MsgDlg('O Valor Recebido está zerado! ' + #13 +
                      'Isso acarretará a baixa o(s) registro(s) selecionado(s) pelo valor previsto.' + #13 + #13 +
                      'Deseja prosseguir com a baixa?', 'Empréstimo', mtConfirmation, [mbyes, mbNo], 0) = mrNo then
            begin
               Repaint;
               raise EValidacao.CreateVal('É necessário indicar o Valor Recebido!', edtVlrRecebido);
            end;
            Repaint;
         end
         else
         begin
            // se valor recebido preenchido, só pode selecionar 1 registro
            // *** isso precisa ser refeito posteriormente para ratear o valor informado pelos reistros ***
            if iContMarcados > 1 then
               raise EValidacao.CreateVal('Só é possível baixar 1 registro por vez, com valor recebido informado!', edtVlrRecebido);
         end;
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then
      begin
         sMsg  := 'A Baixa Manual de um Item não produz contabilização. ' + #13 +
                  'O Item será meramente marcado como "baixado". ' + #13 + #13 +
                  'Deseja realmente prosseguir?';

         if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         begin
            Repaint;
            raise EValidacao.CreateVal('Baixa cancelada!', btnBaixaManual);
         end;
         Repaint;
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttBaixa then
      begin
         // se data de vencimento não indicada, baixa na data do processo
         if length(trim(edtDataVencto.Text)) = 0 then
               raise EValidacao.CreateVal('É necessário indicar a Nova Data de Vencimento!', edtDataVencto);
      end;

      // -------------------------------------------------------------------------------------------

      if TipoTratamento = ttVencto then
         if length(trim(edtDataVencto.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a Nova Data de Vencimento!', edtDataVencto);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 13/06/2005 - pendência 19459
      // -------------------------------------------------------------------------------------------
      // André Pontes - 04/04/2006 -
      // A pedido de Sandra (CBS), não há mais trava contábil em caso de baixa manual

      // Marchetti - Pendencia 22755 - 10/04/2007
      // Não utiliza mais a data do processo para verificar a contabilização
      if (TipoTratamento in [ttBaixa, ttVencto]) or ((TipoTratamento in [{ttBaixa, }ttVencto]) and (Sistema.TipoCliente = 19981)) then
      begin
         // ----------------------------------------------------------------------------------------

         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataProcesso.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível usar a Data Processo indicada:' + #13 + '"' + sMsgContab + '"', edtDataProcesso);

         // André Pontes - 03/06/2005 - pendência 19404
         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível usar a Data Processo indicada:' + #13 + '"' + sMsgContab + '"', edtDataProcesso);
         end;
      end;

         // ----------------------------------------------------------------------------------------

      // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
      // estorno na data de cancelamento indicada
      // Marchetti - Pendencia 22755 - 10/04/2007
      // Utiliza a data do vencimento (abono) para verificar a contabilização
      if (TipoTratamento in [ttAbono, ttBaixa, ttVencto]) or ((TipoTratamento in [{ttBaixa, }ttAbono, ttVencto]) and (Sistema.TipoCliente = 19981)) then
      begin
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível usar a Data de Vencimento/Efetiva indicada:' + #13 + '"' + sMsgContab + '"', edtDataVencto);

         // André Pontes - 03/06/2005 - pendência 19404
         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível usar a Data de Vencimento/Efetiva indicada:' + #13 + '"' + sMsgContab + '"', edtDataVencto);
         end;
      end;  // if TipoTratamento in [ttBaixa, ttVencto]
      // ----------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // FIM André Pontes - 13/06/2005 - pendência 19459
      // -------------------------------------------------------------------------------------------

      // André Pontes - 25/08/2005 - pendência 20025
      if TipoTratamento = ttSuspensao then
      begin
         if not(dtmLookEmptmo.qryLookTipoSusp.Active) or
            (
            (DBcboTipoSuspXContr.LookupValue = '') and
            not(dtmLookEmptmo.qryLookTipoSusp.IsEmpty)
            ) then
         begin
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Suspensão!', DBcboTipoSuspXContr);
         end;
      end;  // if TipoTratamento = ttSuspensao 
      // FIM André Pontes - 25/08/2005 - pendência 20025

	except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TfrmExecTrataParcela.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;

      cboTipoRecurso.LookupValue := FieldByname('idTipoRecurso').asstring;  //Renato Visoni SOL 100479 \	Kintana 445459
      EdOrigemRecurso.Text       := FieldByname('OrigemRecurso').asstring;  //Renato Visoni SOL 100479 \	Kintana 445459
   end;
end;



procedure TfrmExecTrataParcela.AbreQueriesDebito;
begin
   // abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR 
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



procedure TfrmExecTrataParcela.btnBuscaContratoClick(Sender: TObject);
var
iIdBenef:  integer;
begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));

         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         iIdBenef := frmExecBuscaContrato.qryResultadoC12.AsInteger;
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

         frmExecBuscaContrato.Free;

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := bHabilitado;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;

            MsgDlg('O Contrato selecionado ainda não foi efetivado.' + #13 +
                   'Não é possível tratar parcelas', 'Empréstimo', mtWarning,[mbOk],0);
            Repaint;
         end;  // if VerificaBaixa

         Screen.Cursor     := crDefault;

      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;

      // Redesenha o form na volta do MontaSelect
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

         iIdBenef := (StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[23]));
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := bHabilitado;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;

            MsgDlg('O Contrato selecionado ainda não foi efetivado.' + #13 +
                   'Não é possível tratar parcelas', 'Empréstimo', mtWarning,[mbOk],0);
            Repaint;
         end;  // if VerificaBaixa

         Screen.Cursor     := crDefault;

      end; // if MontaSelect.RetornouValor
   end;
end;



function TfrmExecTrataParcela.VerificaBaixa: Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   // Cria a Query Auxiliar 
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                           + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '   + #13 +
   'FROM '                             + #13 +
   '  HISTMOVEMPTMO '                  + #13 +
   'WHERE '                            + #13 +
   '      ( IDCONTRATOEMPTMO  = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) '  + #13 +
   '  AND ( HMETIPOMOV        = 0 ) '  + #13 +
   '  AND ( HMECENTRALIZA     = 1 ) ';

   qryAux.SQL.Text := sSql;

   try

      qryAux.Open;
      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then
      begin
         // Participante já recebeu o Crédito do EP, logo pode quitar o EP
         Result := True;
      end
      else
      begin
         // Participante NÃO recebeu o Crédito do EP
         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '', // Data do Saldo - Saldo Atual
                                     'P', // RecPag
                                     fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then
         begin
            Result := True;
         end
         else
         begin
            Result := False;
         end;

      end;  // if not DataEfetiva

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaSelecaoClick(Sender: TObject);
var
   iDias : Integer;
   dAux : tDateTime; //William Moreira da Silva SOL 197911 Kintana 1896919
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   iContMarcados := 0;

   // ----------------------------------------------------------------------------------------------

   // Marchetti - Pendencia 22755 - 10/04/2007
   // Com a obrigatoriedade de preenchimento da data de abono, inicializa com a data do processo
   edtDataVencto.Date := edtDataProcesso.Date;
   // Fim Marchetti - Pendencia 22755 - 10/04/2007

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      iDias := 3;
      if Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString) then inc(iDias);

      //William Moreira da Silva SOL 197911 Kintana 1896919 - Begin
      dAux := Sysdate;
      if not DiasUteis.DiaUtil (Sistema.IdEmpresa,
                              dAux,
                              true,
                              true,
                              false) then
      begin
           dAux := DiasUteis.PrimeiroDiaUtilPosterior (Sistema.IDEmpresa, dAux, true, true, false);
      end;

      dAux := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                             dAux,
                                             iDias,
                                             True,
                                             True,
                                             False
                                            );
      {edtDataVencto.Date := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                                    Sysdate,
                                                    iDias,
                                                    True,
                                                    True,
                                                    False
                                                   );}

       edtDataVencto.Date := dAux;
       //William Moreira da Silva SOL 197911 Kintana 1896919 - End
   end;

   // ----------------------------------------------------------------------------------------------

   if not(dtmEmptmo.qryDadosContrato.Active) then
   begin
      MsgDlg('É necessário selecionar um Contrato!', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;
   end
   else
   begin
      // abre a query HistMov com os parâmetros passados
      with qryHistMov do
      begin
         LimpaParametros(qryHistMov);

         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;

         ParamByName('PFLGBAIXAMANUAL').AsInteger     := ord(chkBaixaManual.Checked);
         ParamByName('PFLGSUSPENSAO').AsInteger       := ord(chkSuspensao.Checked);
         ParamByName('PFLGENCARGOS').AsInteger        := ord(chkEncargos.Checked);

         ParamByName('PFLGPARCENC').AsInteger         := ord(chkPrestacaoEncargo.Checked);

         ParamByName('PFLGNAOSUSP').AsInteger         := ord(chkNAOSuspensao.Checked);
         // Parcela SIG 128773
         if chkParcela.Checked then
           ParamByName('PHMEPARCELA').AsInteger := trunc(spnParcela.Value);
         // Item SIG 128773
         if chkFiltroItem.Checked then
          begin
             ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(DBcboItem.LookupValue);
          end;
          // Datas -------------------------------------------------------------------------------------
          if chkFaixaDatas.Checked then
          begin
             if ( (length(trim(edtDataIni.Text)) > 0) or (length(trim(edtDataFim.Text)) > 0) ) then
             begin
                ParamByName('PFILTRODATA').AsInteger := 1;
                if length(trim(edtDataIni.Text)) > 0 then ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
                if length(trim(edtDataFim.Text)) > 0 then ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
             end;
          end;

         Open;
      end;

      // qryHistMov.SQL.SaveToFile(ftempregra + '\' + 'qryHistMov.txt');
      // André Pontes - 25/08/2005 - pendência 20025
      // Abre a tabela de tipos de suspensão
      with dtmLookEmptmo.qryLookTipoSusp do
      begin
         LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rContrato.IDTipoContrEmptmo;
         ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
         Open;
      end;
      // FIM André Pontes - 25/08/2005 - pendência 20025

      edtVlrSelecao.Value        := 0;
      edtVlrEnviar.Value         := 0;

      DBgrdHistMov.Enabled       := True;
      ntbPrincipal.PageIndex     := 1;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaClick(Sender: TObject);
begin
   inherited;

   //Renato Visoni SOL 100479 \	Kintana 445459
   if cboTipoRecurso.Text = '' then begin
     cboTipoRecurso.Text := 'PRÓPRIO';
   end;
   //Renato Visoni SOL 100479 \	Kintana 445459

   IDContrato  := dtmEmptmo.qryDadosContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   sNomePatro  := dtmEmptmo.qryDadosContrato.FieldByName('PATRO').AsString;

   PreencheTabelaVirtual(True);

   ntbPrincipal.PageIndex      := 2;
   //Pendência 24818 - 21/03/2007 - Alberto
   if bConfirmarHabilitado then btnConfirmar.Enabled := pbOk;

   btnContinuaConfirma.Enabled := pbOk;

   try
   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtual(bAbreTabela : Boolean);
var
   lsMesCobranca  : String;
begin

   if bAbreTabela or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   // preenche a parcela tratada
   lsMesCobranca   := FormatFloat('0000', qryHistMov.FieldByName('HMEANOCOBRANCA').AsFloat) + '/' +
                      FormatFloat('00', qryHistMov.FieldByName('HMEMESCOBRANCA').AsFloat);

   qryHistMovVirtual.Insert;

   qryHistMovVirtualANOMES.AsString                := lsMesCobranca;

   // Marchetti - Pendencia 22755 - 10/04/2007
   // Passa a utlizar a data de vencimento como data de abono
   if ( (TipoTratamento <> ttVencto) and (TipoTratamento <> ttBaixa) and (TipoTratamento <> ttAbono) ) then
   begin
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataProcesso.Date;
   end
   else
   begin
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencto.Date;
   end;

   qryHistMovVirtualHMEPARCELA.AsInteger        := qryHistMov.FieldByName('HMEPARCELA').AsInteger;

   if TipoTratamento = ttAbono then
   begin
      // Seleciona o ítem abonado
      qryHistMovVirtualDESCRICAO.AsString        := qryHistMov.FieldByName('ITEDESCRICAO').AsString;
   end
   else
   begin
      qryHistMovVirtualDESCRICAO.AsString        := 'Parcela';
   end;

   // tipo de tratamento
   case TipoTratamento of
      ttDesvioFolha     : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio Folha';
      ttDesvioCAR       : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio CaR';
      ttBaixa           : qryHistMovVirtualTRATAMENTO.AsString := 'Baixa Manual';
      ttAbono           : qryHistMovVirtualTRATAMENTO.AsString := 'Abono';
      ttSuspensao       : qryHistMovVirtualTRATAMENTO.AsString := 'Suspensão';
      ttLiberaSuspensao : qryHistMovVirtualTRATAMENTO.AsString := 'Liberação de Suspensão';
      ttVencto          : qryHistMovVirtualTRATAMENTO.AsString := 'Mudança de Vencimento';
   end;

   qryHistMovVirtual.Post;
end;



procedure TfrmExecTrataParcela.btnVoltaClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecTrataParcela.btnVoltaInicioClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

  qryHistMovVirtual.Close;

  qryHistMov.Close;

  iContMarcados            := 0;

  ntbPrincipal.PageIndex   := 0;
  edtVlrRecebido.Value     := 0;
  edtVlrSelecao.Value      := 0;
  edtVlrEnviar.Value       := 0;
end;



procedure TfrmExecTrataParcela.DBrdgDebitoClick(Sender: TObject);
begin
	inherited;

   if DBrdgDebito.ItemIndex = 0 then
   begin
      AtualizaConjunto(True,pnlCAR);
   end else begin
      AtualizaConjunto(False,pnlCAR);
   end;
end;



procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas 
   if qryHistMov.IsEmpty then Exit;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else // if State <> [gdSelected]
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecTrataParcela.btnDesvioClick(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento(ttDesvioFolha)) and
      not(VerificaPreenchimento(ttDesvioCaR)) then Exit;

   try
      DesabilitaBotoes;

      // Forma de desvio: HMEFORMACOBRANCA = {C,F}

      pbOk := True;

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      try
         with qryHistMov do
         begin
            DisableControls;
            First;
            while not(qryHistMov.EOF) do
            begin
               if qryHistMovFLGESCOLHA.AsInteger = 1 then
               begin
                  try
                     case qryHistMovHMEFORMACOBRANCA.AsString[1] of
                        'C': pbOk := DesviarParaFolha;
                        'F': pbOk := DesviarParaCAR;
                     end;
                  except
                     if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

                     Raise;
                     Repaint;

                     Exit;
                  end;

                  PreencheTabelaVirtual(False);
               end;
               qryHistMov.Next;
            end;
            EnableControls;
         end;

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 7;
         rLogTotalPrev.Operacao   := 'Desvio de forma de cobrança';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // Marchetti - pendencia 22042
         IntegraModulo.iEvento         := 6;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

         // ----------------------------------------------------------------------------------------

         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

         pbOk := False;

         Raise;
         Repaint;
      end;

      if not(pbOk) then pnlInformaFinal.Caption := 'Parcela NÃO tratada!';

      if pbOk then begin
         pnlInformaFinal.Color   := clNavy;
      end else begin
         pnlInformaFinal.Color   := clMaroon;
      end;

      ntbPrincipal.PageIndex  := 2;

      // Pendência 24818 - 21/03/2007 - Alberto
      if bConfirmarHabilitado then btnConfirmar.Enabled  := pbOk;
      btnContinuaConfirma.Visible := False;
   finally
      HabilitaBotoes;
   end;
end;



function TfrmExecTrataParcela.DesviarParaFolha: Boolean;
var
   sMsg     : String;
   iRetorno : Integer;
begin
   { 1º Passo: Verifica se foi enviado e exclui Documento              }
   { 2º Passo: Alterar tabela HISTMONEMPTMO                            }
   { OBS.: Não trata envio.}

   TipoTratamento := ttDesvioFolha;
   Result := True;

   // 1º Passo -------------------------------------------------------------------------------------
   if not(qryHistMovCODDOCUMENTO.IsNull) then
   begin
      iRetorno := IntegraEmptmo.ExcluiFinanceiro(qryHistMov.FieldByName('CODDOCUMENTO').AsInteger, sMsg);

      if iRetorno <> 0 then
      begin
         MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         Result := False;
         Exit;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 11/01/2006 - LogDocumento - OK

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryHistMovIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.CodPlanDoc := qryHistMovCODDOCUMENTO.AsFloat;
   rLogTotalPrev.Origem     := 7;
   rLogTotalPrev.Operacao   := 'DesviarParaFolha';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------

   // 2º Passo -------------------------------------------------------------------------------------
   qryAux.SQL.Clear;
   qryAux.SQL.Text :=
   'UPDATE '                                                                     + #13 +
   '  HISTMOVEMPTMO '                                                            + #13 +
   'SET '                                                                        + #13 +
   '  HMEFORMACOBRANCA     = ''F'', '                                            + #13 +
   '  HMETIPOFOLHA         = ''P'', '                                            + #13 +
   '  IDTMPDESC            = NULL,  '                                            + #13 +
   '  CODDOCUMENTO         = NULL,  '                                            + #13 +
   '  FLGENVIO             = 0 '                                                 + #13 +
   'WHERE '                                                                      + #13 +
   '      IDCONTRATOEMPTMO = ' + FloatToStr(qryHistMovIDCONTRATOEMPTMO.AsFloat)  + #13 +
   '  AND IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);
   // ----------------------------------------------------------------------------------------------

   try
      qryAux.ExecSql;
      AtualizaSitPart(qryHistMovIDHISTMOVEMPTMO.AsFloat);
   except
      Result := False;
   end;
end;



function TfrmExecTrataParcela.DesviarParaCAR: Boolean;
var
   sSQL : String;
begin
   {1º Passo: Verifica se foi enviado (TMPDESC)
              Ir na TMPDESC através de rubricas. Portanto, saber quais rubricas
              foram inseridas. }
   {2º Passo: Excluir da TmpDesc as parcelas não enviadas.
              Para setar os registros na TMPDESC não utilizo o campo MESREFERENCIA,
              pois devo pegar todos os registros daquela parcela.              }
   {3º Passo: Alterar tabela HISTMOVEMPTMO                            }
   {OBS.: Não trata envio.
          Ao desviar uma parcela, será considerada todas àquelas que possuirem
          o mesmo MESCOBRANCA.}

   TipoTratamento := ttDesvioCAR;

   with qryAux do
   begin
      sSQL :=
      'UPDATE '                                                                     + #13 +
      '  HISTMOVEMPTMO '                                                            + #13 +
      'SET '                                                                        + #13 +
      '  HMEFORMACOBRANCA     = ''C'', '                                            + #13 +
      '  HMETIPOFOLHA         = NULL, '                                             + #13 +
      '  IDTMPDESC            = NULL, '                                             + #13 +
      '  FLGENVIO             = 0 '                                                 + #13 +
      'WHERE '                                                                      + #13 +
      '      IDCONTRATOEMPTMO = ' + FloatToStr(qryHistMovIDCONTRATOEMPTMO.AsFloat)  + #13 +
      '  AND IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);

      SQL.Clear;
      SQL.Text := sSQL;

      try
         ExecSql;
      except
         Result := False;
      end;
   end; // with qryAux do

   // ----------------------------------------------------------------------------------------------

   if qryHistMovFLGENVIO.IsNull then IntegraEmptmo.ExcluiTMPDESCPorMes(qryHistMovIDCONTRATOEMPTMO.AsFloat,
                                                                       qryHistMovIDHISTMOVEMPTMO.AsFloat,
                                                                       '',
                                                                       True
                                                                      );

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecTrataParcela.btnBaixaManualClick(Sender: TObject);
var
   sErro : String;
begin
   inherited;

   TipoTratamento := ttBaixa;

   if not(VerificaPreenchimento(ttBaixa)) then Exit;

   if MsgDlg('Confirma a baixa do(s) item(ns) selecionado(s)?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;

   try
      DesabilitaBotoes;

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               try
                  case qryHistMovHMEFORMACOBRANCA.AsString[1] of
                    'F': pbOk := BaixaManualFolha;
                    'C': pbOk := BaixaManualCAR;
                  end;
               except
                  if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

                  Raise;
                  Repaint;

                  Exit;
               end;

               PreencheTabelaVirtual(False);
            end;
            qryHistMov.Next;
         end;
         EnableControls;
      end;

      // -------------------------------------------------------------------------------------------
      //    Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------
      CalcEmptmo.AcertaSituacaoContratual(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);
      // -------------------------------------------------------------------------------------------
      //    FIM Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------

      if pbOk then
      begin
         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         // Marchetti - pendencia 22042
         IntegraModulo.iEvento         := 6;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - pendencia 22042

      end
      else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

   finally
      qryHistMov.Close;
      qryHistMov.Open;
      btnContinuaConfirma.Visible := False;
      qryHistMovVirtual.Close;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.InsereDiferencaHist(qryLocal: TwwQuery; NovosDados:TNovosDados);
var
   rContrato         : TDadosContrato;
   ItemContrato      : TItemRecDep;
   iIdHistMovEmptmo  : Extended;
   DataAtual, ProximoMes: TDateTime;  //WO19836 - Ferrari
   iAno ,iMes ,iDia  : Word;           //WO19836 - Ferrari
begin

   // Marchetti - Pendencia 24380
   if Arredonda(NovosDados.Valor,2) <> 0 then
   begin
      try
        // Limpa o registro com os dados do Contrato
        LimpaRegistroContrato(rContrato);
        // Marchetti - pendencia 26558
        LimpaRegistro(ItemContrato);
        // Fim Marchetti - pendencia 26558

        // Inicializa o registro com os dados do Contrato
        rContrato.IDContratoEmptmo      := qryLocal.FieldByName('IDCONTRATOEMPTMO').AsFloat;

        // Preenche dados do Item
        ItemContrato.Parcela            := qryLocal.FieldByName('HMEPARCELA').AsInteger;
        ItemContrato.CodigoItem         := qryLocal.FieldByName('IDITEMEMPTMO').AsInteger;
        ItemContrato.RecPag             := qryLocal.FieldByName('HMERECPAG').AsString;
        ItemContrato.FormaCobranca      := qryLocal.FieldByName('HMEFORMACOBRANCA').AsString;
        ItemContrato.IdItemCentraliza   := qryLocal.FieldByName('IDITEMCENTRALIZA').AsInteger;

        ItemContrato.DataPrevista       := qryLocal.FieldByName('HMEDATAPREVISTA').AsDateTime;
        //Inicio WO19836 - Ferrari
        if bItemApropriado then
        begin
           // Obter a data atual
           DataAtual := Now;
           // Adicionar um mês
           ProximoMes := IncMonth(DataAtual,1);
          // Extrair o dia, mês e ano do próximo mês
           DecodeDate(ProximoMes, iAno, iMes, iDia);
//           ItemContrato.DataVencto      := StrToDate('20/' + InttoStr(iMes)+'/'+InttoStr(iAno));
           ItemContrato.DataVencto      := NovosDados.DataVencto;  //  StrToDate(edtDataVencto.Text);
           if (qryLocal.FieldByName('HMETIPOMOV').asInteger = 1) and (bItemDiferenca = False)   then
           begin
               ItemContrato.FlgSuspensao    := 1 ;
               itemContrato.idTipoSuspemptmo:= 9 ;
           end
           else
           begin
               ItemContrato.FlgSuspensao    := 0 ;
               itemContrato.idTipoSuspemptmo:= 0 ;
           end;
           ItemContrato.ParcelaAlt:= qryLocal.FieldByName('HMEPARCELAALT').AsInteger;
        end
        else
          //WO19836 Ferrari - Fim
          begin
            ItemContrato.DataVencto       := qryLocal.FieldByName('HMEDATAVENCTO').AsDateTime;
          end;
        ItemContrato.DataUltAtualiza    := qryLocal.FieldByName('HMEDATAATUALIZA').AsDateTime;
        ItemContrato.DataEfetiva        := 0;
        ItemContrato.DataReceb          := 0;
        ItemContrato.FlgEnvio         := 0;         // WO19836 Ferrari

        ItemContrato.AnoCompetencia     := qryLocal.FieldByName('HMEANOCOMPETENCIA').AsInteger;
        ItemContrato.MesCompetencia     := qryLocal.FieldByName('HMEMESCOMPETENCIA').AsInteger;

        ItemContrato.AnoCobranca        := qryLocal.FieldByName('HMEANOCOBRANCA').AsInteger;
        ItemContrato.MesCobranca        := qryLocal.FieldByName('HMEMESCOBRANCA').AsInteger;

        ItemContrato.Valor              := NovosDados.Valor;
        ItemContrato.ValorEfetivo       := 0;
        ItemContrato.SaldoDevedor       := qryLocal.FieldByName('HMESALDODEV').AsFloat;
        ItemContrato.TxJuros            := qryLocal.FieldByName('HMETXJUROS').AsFloat;
        ItemContrato.Regra              := qryLocal.FieldByName('IDREGRA').AsInteger;
        ItemContrato.Rubrica            := qryLocal.FieldByName('IDRUBRICA').AsInteger;

        ItemContrato.iEvento            := qryLocal.FieldByName('HMETIPOMOV').AsInteger;
        ItemContrato.Origem             := 7;
        ItemContrato.Prioridade         := qryLocal.FieldByName('HMEPRIORIDADE').AsInteger;
        ItemContrato.SeqCobranca        := (qryLocal.FieldByName('HMESEQCOBRANCA').AsInteger + 1);
        ItemContrato.FlgCentraliza      := qryLocal.FieldByName('HMECENTRALIZA').AsInteger;

        ItemContrato.FlgTipoDiverg      := 1;
        ItemContrato.FlgBaixado         := NovosDados.FlgBaixado;
        ItemContrato.FlgDivergPend      := NovosDados.FlgDivergPend;

        ItemContrato.ParcResta          := qryLocal.FieldByName('HMENUMPARCELAS').AsInteger;
        ItemContrato.FlgDestacado       := qryLocal.FieldByName('HMEDESTACADO').AsInteger;


         // função que grava as informações pertinentes a um contrato no histórico de movimento
         //  de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
         //  bem sucedida e False caso negativo
         if not(CalcEmptmo.InsertMovEmptmo(ItemContrato, rContrato)) then
         begin
            MsgDlg('ERRO ao incluir Histórico.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
         end;

      finally
         // Limpa o registro com os dados do Contrato
         LimpaRegistroContrato(rContrato);
      end;
   end;
   // Fim Marchetti - Pendencia 24380
end;



function TfrmExecTrataParcela.BaixaManualCAR: Boolean;
var
   dDataBaixa        : TDateTime;
   sDataBaixa        : String;
   fVlrRecebido      : Currency;
   sFlgBaixado       : String;
   sFlgDivergPend    : String;
   sFlgTipoDiverg    : String;
   sMsg              : String;
   NovosDadosParcela : TNovosDados;
begin
{
   1º Passo: Verifica se CODDOCUMENTO esta preenchido, se FLGDIVERGPEND = 1,
              algum caso afirmativo não faz.
   2º Passo: Verifica se PLNCODIGO esta preenchido algum caso afirmativo não faz.
   3º Passo: Marcar FLGBAIXADO  = NULL
}
   Result := True;

   // atribui a data de baixa
   dDataBaixa := edtDataVencto.Date;
   sDataBaixa := FormatDateTime('dd/mm/yyyy', dDataBaixa);

   // atribui o valor recebido
   if edtVlrRecebido.Value <> 0 then fVlrRecebido := edtVlrRecebido.Value;

   // se o previsto for negativo, presume que o valor digitado está em valor absoluto,
   // logo, inverte o sinal para compatibilizar
   if qryHistMovHMEVLRPREVISTO.AsCurrency < 0 then fVlrRecebido := fVlrRecebido * (-1);


   with qryAux do
   begin
      sFlgBaixado    := 'NULL';
      sFlgDivergPend := '0';
      sFlgTipoDiverg := 'NULL';

      if dDataBaixa > qryHistMovHMEDATAVENCTO.AsDateTime then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '5';
      end;

      // só poderá haver divergência de valores se o valor recebido estiver preenchido
      if edtVlrRecebido.Value > 0 then
      begin
         if abs(edtVlrRecebido.Value) < abs(qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            sFlgDivergPend := '1';
            sFlgTipoDiverg := '3';
         end;

         if abs(edtVlrRecebido.Value) > abs(qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            sFlgDivergPend := '1';
            sFlgTipoDiverg := '4';
         end;
      end
      else
      begin
         // se o valor recebido não estiver preenchido, o valor recebido será o valo previsto
         fVlrRecebido := qryHistMovHMEVLRPREVISTO.AsCurrency;
      end;

      if (sFlgTipoDiverg = '3') or (sFlgTipoDiverg = '4') then
      begin
         NovosDadosParcela.Valor         := abs(qryHistMovHMEVLRPREVISTO.AsCurrency) - abs(fVlrRecebido);

         // faz a jogada do valor negativo
         if qryHistMovHMEVLRPREVISTO.AsCurrency < 0 then NovosDadosParcela.Valor := NovosDadosParcela.Valor * (-1);

         NovosDadosParcela.FlgBaixado    := 0;
         NovosDadosParcela.FlgDivergPend := 1;

         InsereDiferencaHist(qryHistMov, NovosDadosParcela);
      end;

      // -- 3ºPasso --------------------------------------------------------------------------------
      if Result then
      begin
         sFlgBaixado    := 'NULL';
         sFlgDivergPend := '0';
         sFlgTipoDiverg := 'NULL';

         SQL.Clear;
         SQL.Add(' UPDATE HISTMOVEMPTMO '+
                 ' SET FLGBAIXADO         = ' + sFlgBaixado + ',' +
                 '     HMEDATAEFETIVA     = TO_DATE(''' + sDataBaixa + ''',''DD/MM/YYYY''), '+
                 '     FLGENVIO           = NULL, ' +
                 '     FLGDIVERGPEND      = ' + sFlgDivergPend + ',' +
                 '     FLGBAIXAMANUAL     = 1, ' +
                 '     FLGTIPODIVERG      = ' + sFlgTipoDiverg + ',' +
                 '     HMEVLREFETIVO      = ' + NumeroIngles(fVlrRecebido) +
                 ' WHERE IDHISTMOVEMPTMO  = ' + qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString);
         try
            ExecSql;
         except;
            MsgDlg('Erro ao atualizar o Histórico.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Result := False;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      rLogTotalPrev.Origem     := 7;
      rLogTotalPrev.Operacao   := 'Baixa manual';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

     {FIM - 3ºPasso}

   end; // with qryAux do

   // quitação
   if ( (qryHistMovHMECENTRALIZA.AsInteger = 1) and (qryHistMovHMETIPOMOV.AsInteger = 3) and
        (qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency = fVlrRecebido) ) then
   begin
      CalcEmptmo.AtualizaFlgSituacao(qryHistMovIDCONTRATOEMPTMO.AsFloat, 'CONTRATOEMPTMO', 'Q', sMsg);
   end;
end;



function TfrmExecTrataParcela.BaixaManualFolha: Boolean;
var
   dDataBaixa        : TDateTime;
   sDataBaixa        : String;
   fVlrRecebido      : Currency;
   sFlgBaixado       : String;
   sFlgDivergPend    : String;
   sFlgTipoDiverg    : String;
   sMsg              : String;
   NovosDadosParcela : TNovosDados;
begin
   {1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)}
   {2º Passo: Excluir todos os ítems do mesmo MESCOBRANCA!}
   {3º Passo: Marcar FLGBAIXADO  = NULL           }

   // atribui a data de baixa
   dDataBaixa := edtDataVencto.Date;
   sDataBaixa := FormatDateTime('dd/mm/yyyy', dDataBaixa);

   // atribui o valor recebido
   if edtVlrRecebido.Value > 0 then fVlrRecebido := edtVlrRecebido.Value;

   // -- 1ºPasso -----------------------------------------------------------------------------------
   Result := True;

   sFlgBaixado    := 'NULL';
   sFlgDivergPend := '0';
   sFlgTipoDiverg := 'NULL';

   // só poderá haver divergência de valores se o valor recebido estiver preenchido
   if edtVlrRecebido.Value > 0 then
   begin
      if edtVlrRecebido.Value < qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '3';
      end;

      if edtVlrRecebido.Value > qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency then
      begin
         sFlgDivergPend := '1';
         sFlgTipoDiverg := '4';
      end;
   end
   else
   begin
      // se o valor recebido não estiver preenchido, o valor recebido será o valo previsto
      fVlrRecebido := qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency;
   end;

   // se recebido a menor ou recebido a maior
   if ( (sFlgTipoDiverg = '3') or (sFlgTipoDiverg = '4') ) then
   begin
      NovosDadosParcela.Valor         := qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency - fVlrRecebido;
      NovosDadosParcela.FlgBaixado    := 0;
      NovosDadosParcela.FlgDivergPend := 1;

      InsereDiferencaHist(qryHistMov, NovosDadosParcela);
   end;

   with qryAux do
   begin
      if Result then
      begin
         sFlgBaixado    := 'NULL';
         sFlgDivergPend := '0';
         sFlgTipoDiverg := 'NULL';

         SQL.Clear;
         SQL.Add(' UPDATE HISTMOVEMPTMO ' +
                 ' SET FLGBAIXADO         = ' + sFlgBaixado + ',' +
                 '     HMEDATAEFETIVA     = TO_DATE(''' + sDataBaixa + ''',''DD/MM/YYYY''), '+
                 '     FLGENVIO           = NULL, ' +
                 '     FLGDIVERGPEND      = ' + sFlgDivergPend + ',' +
                 '     FLGBAIXAMANUAL     = 1, ' +
                 '     FLGTIPODIVERG      = ' + sFlgTipoDiverg + ',' +
                 '     HMEVLREFETIVO      = ' + NumeroIngles(fVlrRecebido) +
                 ' WHERE IDHISTMOVEMPTMO  = ' + qryHistMovIDHISTMOVEMPTMO.AsString);
         try
            ExecSQL;
         except;
            MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Result := False;
            Exit;
         end;
      end;
   end;


   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem     := 7;
   rLogTotalPrev.Operacao   := 'Baixa manual';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------


   // quitação
   if ( (qryHistMovHMECENTRALIZA.AsInteger = 1) and (qryHistMovHMETIPOMOV.AsInteger = 3) and
        (qryHistMov.FieldByname('HMEVLRPREVISTO').AsCurrency = fVlrRecebido) ) then
   begin
      CalcEmptmo.AtualizaFlgSituacao(qryHistMovIDCONTRATOEMPTMO.AsFloat, 'CONTRATOEMPTMO', 'Q', sMsg);
   end;
end;



procedure TfrmExecTrataParcela.btnAbonoClick(Sender: TObject);
var
   iPlanilha      : Int64;
   sDataAbono     : String;
   sErro          : String;
   sMotivoAbono   : String;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------
   //
   // 1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)
   // 2º Passo: Tratar ítem (válido) atualizando na tabela.
   // 3º Passo: Preparar entrada para contabilidade.
   //
   // ----------------------------------------------------------------------------------------------

   // 1ºPasso --------------------------------------------------------------------------------------

   TipoTratamento := ttAbono;
   if not(VerificaPreenchimento(ttAbono)) then Exit;

   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   // Pede para o usuário informar o motivo do abono
   InputQuery('Empréstimo', 'Motivo do Abono', sMotivoAbono);

   with qryHistMov do
   begin
      DisableControls;

      // Acerta tela de acompanhamento
      frmAguarde.Max := RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando Abono. Aguarde...');

      First;
      while not(qryHistMov.EOF) do
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;

         // Caso não tenha sido selecionado pula
         if qryHistMovFLGESCOLHA.AsInteger = 0 then
         begin
            qryHistMov.Next;
            Continue;
         end;

         pbOk := True;

         // 1º Passo -------------------------------------------------------------------------------
         if pbOk then
         begin
            if (qryHistMov.FieldByName('HMETIPOMOV').AsInteger <> 4) then
            begin
               MsgDlg('Só é permitido o abono de encargos.' + #13 +
                      'Não é possível efetuar operação.', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
               pbOk := False;
               PreencheTabelaVirtual(False);

               qryHistMov.Next;
               Continue;
            end;
         end;

         // exibe controle para informar DATAEFETIVA
         lblData.Caption := 'Data Efetiva';

         //Pendência 22755 - 27/07/2006 - Alberto
         sDataAbono := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);

         if sMotivoAbono <> '' then sMotivoAbono := sMotivoAbono + #13 + #10;

         with qryAux do
         begin
            if pbOk then
            begin
               SQL.Clear;
               SQL.Text :=
               'UPDATE '                                                                           + #13 +
               '  HISTMOVEMPTMO '                                                                  + #13 +
               'SET '                                                                              + #13 +
               '  FLGABONADO           = 1, '                                                      + #13 +
               '  FLGDIVERGPEND        = 0, '                                                      + #13 +
               '  FLGTIPODIVERG        = NULL, '                                                   + #13 +
               '  FLGENVIO             = NULL, '                                                   + #13 +

               // Pendência 22671 - 23/06/2006 - Alberto
               '  IDUSUARIOESTORNO     = ' + IntToStr(sistema.IdUsuario) + ', '                    + #13 +

               '  HMEOBSERVACAO        = HMEOBSERVACAO || ' + QuotedStr(sMotivoAbono) + ', '       + #13 +
               '  HMEDATAQUITABONO     = TO_DATE(' + QuotedStr(sDataAbono) + ', ''DD/MM/YYYY'') '  + #13 +
               'WHERE '                                                                            + #13 +
               '      IDCONTRATOEMPTMO = ' + FloatToStr(qryHistMovIDCONTRATOEMPTMO.AsFloat)        + #13 +
               '  AND HMEPARCELA       = ' + IntToStr(qryHistMovHMEPARCELA.AsInteger)              + #13 +
               '  AND IDITEMEMPTMO     = ' + IntToStr(qryHistMovIDITEMEMPTMO.AsInteger)            + #13 +
               '  AND IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);

               try
                  ExecSql;
               except;
                  MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', mtError, [mbOk], 0);
                  pbOk := False;
               end;

            end; // if lbOk

         end; // with qryAux


         // 2º Passo -------------------------------------------------------------------------------

         if pbOk then
         begin
            if ( (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
                 not(qryHistMovPLNCODIGO.IsNull) and
                 not(dtmEmptmo.qryParamEmptmoFLGCONTABENCARGO.AsInteger = 1) and
                 (Sistema.TipoCliente <> 19991)
               ) then
            begin
               if (qryHistMovFLGESCOLHA.AsInteger = 1) and (FieldByName('HMETIPOMOV').AsInteger = 4) then
               begin
                  iPlanilha := ContabilizaAbono;

                  if iPlanilha > 0 then
                  begin
                     with qryAux do
                     begin
                        SQL.Clear;
                        SQL.Text :=
                        'UPDATE HISTMOVEMPTMO '     +
                        'SET PLNCODIGOESTORNO   = ' + IntToStr(iPlanilha) +
                        'WHERE IDCONTRATOEMPTMO = ' + qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString   +
                        '  AND HMEPARCELA       = ' + qryHistMov.FieldByName('HMEPARCELA').AsString         +
                        '  AND IDITEMEMPTMO     = ' + qryHistMov.FieldByName('IDITEMEMPTMO').AsString;

                        try
                           ExecSql;
                        except;
                           MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo',MtError,[mbOk],0);
                           pbOk := False;
                        end;

                        // -------------------------------------------------------------------------
                        // André Pontes - 19/01/2006 - LogPlanilha - OK

                        LimpaRegistroLog(rLogTotalPrev);

                        rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                        rLogTotalPrev.IDContrato := -1;
                        rLogTotalPrev.IDHistMov  := -1;
                        rLogTotalPrev.CodPlanDoc := iPlanilha;
                        rLogTotalPrev.Origem     := 7;
                        rLogTotalPrev.Operacao   := 'ContabilizaAbono (planilha estorno)';
                        rLogTotalPrev.Data       := SysDate;
                        rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                        rLogTotalPrev.Versao     := Sistema.Versao;

                        GravaLogTotalPrev(rLogTotalPrev);

                        // -------------------------------------------------------------------------
                     end;

                  end; // if iPlanilha > 0

               end;
            end;
         end; // if pbOk

         {FIM - 3ºPasso}
         PreencheTabelaVirtual(False);

         Next;
      end; // while not(EOF)

      EnableControls;
      frmAguarde.Apaga;
   end;


   // ----------------------------------------------------------------------------------------------
   //    Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------
   CalcEmptmo.AcertaSituacaoContratual(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := -1;
   rLogTotalPrev.Origem     := 7;
   rLogTotalPrev.Operacao   := 'Suspensão de parcela';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------


   if pbOk then
   begin
      // Só "commita" se não houver transacao anterior
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      pnlInformaFinal.Color   := clNavy;
   end
   else
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

      pnlInformaFinal.Color   := clMaroon;
      pnlInformaFinal.Caption := 'Parcela NÃO tratada!';
   end;

   // Marchetti - pendencia 22042
   IntegraModulo.iEvento         := 6;
   IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   // Fim Marchetti - pendencia 22042

   btnContinuaConfirma.Visible := False;   
   pnlInformaFinal.Update;
   ntbPrincipal.PageIndex  := 2;
end;



// verifica se existe parcela e se foi enviada na TMPDESC
function TfrmExecTrataParcela.VerificaTMPDESC: Boolean;
var
   lbOk           : Boolean;
   lsMesCobranca  : String;
begin
   // 1ºPasso -----------------------------------------------------------------------------------
   lsMesCobranca   := FormatFloat('0000', qryHistMov.FieldByName('HMEANOCOBRANCA').AsFloat) + '/' +
                      FormatFloat('00', qryHistMov.FieldByName('HMEMESCOBRANCA').AsFloat);

   lbOk     := True;
   pbExclui := True;

   with qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS OCORRENCIA, SITENVIO FROM TMPDESC WHERE '+
              '     MESCOBRANCA = '+ QuotedStr(lsMesCobranca) +
              ' AND IDDESCONTO  = '+ qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString +
              ' AND IDMODULO    = '+ IntToStr(Sistema.IdModulo) +
              ' GROUP BY SITENVIO ');
      try
        Open;
      except
        lbOk := False;
        MsgDlg('Erro ao abrir tabela.', 'Empréstimo', mtError, [mbOk], 0);
      end;

      // SE RETORNAR MAIS DE UM REGISTRO PODE HAVER INCONSISTÊNCIA,
      // POIS, PARA UM MESCOBRANCA EXISTE UMA RUBRICA ENVIADA E OUTRA NÃO.
      if RecordCount > 1 then
      begin
         MsgDlg('Existem problemas no Envio.', 'Empréstimo',MtError,[mbOk],0);
         lbOk := False;
      end;

      // uma linha não eviada.
      lbOk := (RecordCount = 1) and (FieldByName('SITENVIO').AsInteger = 0);

      if (not lbOk) and (not IsEmpty) then
         MsgDlg('A parcela já foi Enviada pela Folha de Benefícios'+#13+
                'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0)
      else if IsEmpty then
      begin
         lbOk :=  MsgDlg('Não há registros enviados para Folha de Benefícios.'+#13+
                         'Deseja continuar o processo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes;
         pbExclui := False;
      end;
   end;

   Result := lbOk;
end;



procedure TfrmExecTrataParcela.btnSuspensaoClick(Sender: TObject);
var
   iAno        : Word;
   iMes        : Word;
   iDia        : Word;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   dDataLanc   : TDateTime;
   dDataAtuDia : TDateTime;
begin
   inherited;

   TipoTratamento := ttSuspensao;
   if not(VerificaPreenchimento(ttSuspensao)) then Exit;

   try
      DesabilitaBotoes;

      // separa as datas
      DecodeDate(edtDataProcesso.Date, iAno, iMes, iDia);

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      if MsgDlg('A Suspensão de Cobrança não terá efeito se o(s) Item(ns) selecionados já estiver(em) enviado(s).' + #13 + #13 +
                'Deseja prosseguir com a Suspensão?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;
      // -------------------------------------------------------------------------------------------

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               // ----------------------------------------------------------------------------------
               // André Pontes - pendência 19459 - 21/06/2005
               // ----------------------------------------------------------------------------------

               if dtmLookEmptmo.qryLookTipoSuspFLGATUALSALDOPARC.AsInteger = 1 then  // André Pontes - 02/09/2005
               begin
                  // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
                  // estorno na data de cancelamento indicada
                  dDataLanc   := qryHistMovHMEDATAPREVISTA.AsDateTime;
                  sDataLanc   := FormatDateTime('dd/mm/yyyy', dDataLanc);
                  iEmpresa    := Sistema.idEmpresa;
                  sMsgContab  := '';

                  if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
                  begin
                     MsgDlg('Não é possível suspender prestações com data de ' + sDataLanc + ': ' + #13 + '"' +
                            sMsgContab + '"', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;

                     qryHistMov.Next;
                     Continue;
                  end;

                  if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
                  begin
                     sMsgContab := Contab.MessageInfo;

                     MsgDlg('Não é possível suspender prestações com data de ' + sDataLanc + ': ' + #13 + '"' +
                            sMsgContab + '"', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;

                     qryHistMov.Next;
                     Continue;
                  end;  // if not(Contab...
               end;  // if qryHistMovFLGATUALSALDOPARC.AsInteger = 1
               // ----------------------------------------------------------------------------------
               // FIM André Pontes - pendência 19459 - 21/06/2005
               // ----------------------------------------------------------------------------------

               try
                  // -------------------------------------------------------------------------------

                  with qryMarcaSuspensao do
                  begin
                     LimpaParametros(qryMarcaSuspensao);
                     ParamByName('PIDCONTRATOEMPTMO').AsFloat        := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                     ParamByName('PIDHISTMOVEMPTMO').AsFloat         := qryHistMovIDHISTMOVEMPTMO.AsFloat;

                     // André Pontes - 25/08/2005 - pendência 20025
                     if DBcboTipoSuspXContr.LookupValue <> '' then
                        ParamByName('PIDTIPOSUSPEMPTMO').AsInteger   := StrToInt(DBcboTipoSuspXContr.LookupValue);
                     // FIM André Pontes - 25/08/2005 - pendência 20025

                     ParamByName('PHMEANOSUSPENSAO').AsInteger       := iAno;
                     ParamByName('PHMEMESSUSPENSAO').AsInteger       := iMes;

                     ExecSQL;
                  end;

                  // -------------------------------------------------------------------------------

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                  rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                  rLogTotalPrev.Origem     := 7;
                  rLogTotalPrev.Operacao   := 'Suspensão';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------

                  // André Pontes - 28/09/2005 - pendência 20126
                  if (dtmLookEmptmo.qryLookTipoSuspFLGATUALSALDOPARC.AsInteger = 1) and
                     (qryHistMovHMETIPOMOV.AsInteger = 1) and
                     (qryHistMovHMESEQCOBRANCA.AsInteger = 1) then
                  begin
                     with qryItensSuspensao do
                     begin
                         LimpaParametros(qryItensSuspensao);
                         ParamByName('PIDCONTRATOEMPTMO').AsFloat    := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                         ParamByName('PHMEPARCELA').AsInteger        := qryHistMovHMEPARCELA.AsInteger;
                         ParamByName('PHMETIPOMOV').AsInteger        := qryHistMovHMETIPOMOV.AsInteger;
                         ParamByName('PHMEDATAPREVISTA').AsDateTime  := qryHistMovHMEDATAPREVISTA.AsInteger;
                         Open;
                     end;

                     qryItensSuspensao.First;
                     while not(qryItensSuspensao.EOF) do
                     begin
                        with qryMarcaSuspensao do
                        begin
                           LimpaParametros(qryMarcaSuspensao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat        := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PIDHISTMOVEMPTMO').AsFloat         := qryItensSuspensaoIDHISTMOVEMPTMO.AsFloat;

                           // André Pontes - 25/08/2005 - pendência 20025
                           if DBcboTipoSuspXContr.LookupValue <> '' then
                              ParamByName('PIDTIPOSUSPEMPTMO').AsInteger   := StrToInt(DBcboTipoSuspXContr.LookupValue);
                           // FIM André Pontes - 25/08/2005 - pendência 20025

                           ParamByName('PHMEANOSUSPENSAO').AsInteger       := iAno;
                           ParamByName('PHMEMESSUSPENSAO').AsInteger       := iMes;

                           ExecSQL;
                        end;
                     end;
                     // FIM André Pontes - 28/09/2005 - pendência 20126

                     // ----------------------------------------------------------------------------
                  end;


                  // -------------------------------------------------------------------------------

                  // André Pontes - 25/08/2005 - pendência 20025
                  if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) and (Sistema.TipoCliente = 19991) then
                  begin
                     dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(rContrato.IDContratoEmptmo, -1);

                     dtmAtualizacaoDiaria.ExecutaAtuDia(rContrato.IDContratoEmptmo, // Contrato
                                                        Sistema.IDModulo,
                                                        -1,                         // Tipo Contr
                                                        -1,                         // Tipo Emptmo
                                                        -1,                         // Patro
                                                        -1,                         // Plano
                                                        1,                          // Estorno
                                                        0,                          // Prov Perda
                                                        1,                          // Atu Saldo
                                                        -1,                         // In Arquivo
                                                        -1,                         // Not In Arquivo
                                                        dDataLanc,                  // Data Ini
                                                        dDataAtuDia,                // Data Fim
                                                        dDataLanc - 1               // Data Considera
                                                       );
                  end;
                  // FIM André Pontes - 25/08/2005 - pendência 20025

                  // -------------------------------------------------------------------------------

               except

                  RollBackTransacao;

                  MsgDlg('Ocorreu um ERRO ao tentar suspender o item!', 'Empréstimo', mtError, [mbOK], 0);
                  Repaint;

                  PreencheTabelaVirtual(False);
                  Exit;
               end;
            end;

            PreencheTabelaVirtual(True);
            qryHistMov.Next;

         end;  // while not(qryHistMov.EOF) do

         EnableControls;

      end;  // with qryHistMov do

      // Só "commita" se não houver transacao anterior
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      // Marchetti - pendencia 22042
      IntegraModulo.iEvento         := 6;
      IntegraModulo.iContratoEmptmo := rContrato.IDContratoEmptmo;
      // Fim Marchetti - pendencia 22042

   finally
      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;
      btnContinuaConfirma.Visible := False;
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.ProcessaMudancaVencimento(bEncargos: Boolean = True; bApropriacao: Boolean = False);
var
   iParcela             : Integer;
   iParcelaAlt          : Integer;
   iParcAnt             : Integer;

   fSaldo               : Real;
   fSaldoOutraMoeda     : Real;

   sSQL                 : String;
   sDataVencto          : String;
   sNovaFormaCobranca   : String;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   sAnoMesCompet        : String;
   sNovaDataCobranca    : String;
   sMsg                 : String;
   sTipoTrat            : String;
   dData                : TDateTime;
begin
   pbOk := True;

   // Passos do processamento:
   //   1 - Selecionar todos os itens da parcela
   //   2 - Chamar regra de atualização de valores dos itens
   //   3 - Desfazer o envio da parcela
   //   4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento
   //   5 - Excluir documento anterior


   // ----------------------------------------------------------------------------------------------
   // PASSO 1 - Selecionar todos os itens da parcela
   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   sRegistros  := '';
   // Inicio WO19836 Ferrari
   if bApropriacao then
     begin
       dData := StrToDate(edtDataVencto.Text);
       dData := dData - 1; // Subtrai 1 dia
       edtDataVencto.Text := DateToStr(dData);
       sDataVencto := QuotedStr(edtDataVencto.Text);
     end
   else
     sDataVencto := QuotedStr(edtDataVencto.Text);
   // Fim WO19836 Ferrari
   try
      Sel(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat);

      // Varre todo historico de Divergencias e trata as escolhidas
      with qryHistMov do
      begin
         DisableControls;

         // Acerta tela de acompanhamento
         frmAguarde.Max := RecordCount;
         frmAguarde.Pos := 0;

         if bEncargos then frmAguarde.Mostra('Processando, Aguarde...');

         First;
         iParcAnt := -1;

         while not(qryHistMov.EOF) do
         begin
            // Atualiza tela de acompanhamento
            if bEncargos then frmAguarde.Pos := frmAguarde.Pos + 1;

            // Caso não tenha sido selecionado pula
            if qryHistMovFLGESCOLHA.AsInteger = 0 then
            begin
               Next;
               Continue;
            end;

            sNovaFormaCobranca := 'C'; // FieldByName('HMEFORMACOBRANCA').AsString;

            sNovaDataCobranca  := edtDataVencto.Text;

            sNovoMesCobranca   := Copy(sNovaDataCobranca, 4, 2);
            sNovoAnoCobranca   := Copy(sNovaDataCobranca, 7, 4);

            // Preenche registro com os dados do Contrato
            PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

            iParcela       := qryHistMovHMEPARCELA.AsInteger;
            iParcelaAlt    := qryHistMovHMEPARCELAALT.AsInteger;

            sAnoMesCompet  := FormatFloat('0000', qryHistMovHMEANOCOMPETENCIA.AsFloat) +
                              FormatFloat('00', qryHistMovHMEMESCOMPETENCIA.AsFloat);


            // -------------------------------------------------------------------------------------
            // PASSO 2 - Chamar regra de atualização de valores dos itens
            // -------------------------------------------------------------------------------------

            // André Pontes - 03/03/2004
            if bEncargos then
            begin
            // FIM André Pontes - 03/03/2004
               if iParcela <> iParcAnt then
               begin
                  if not(CalcEmptmo.CalculaItensDiverg(rContrato,
                                                       7,            // Origem
                                                       iParcela,
                                                       iParcelaAlt,
                                                       qryHistMovHMENUMPARCELAS.AsInteger,
                                                       DiasUteis.ExtraiAno(edtDataVencto.Date),
                                                       DiasUteis.ExtraiMes(edtDataVencto.Date),
                                                       edtDataVencto.Date,
                                                       edtDataVencto.Date,
                                                       edtDataVencto.Date,
                                                       sNovaFormaCobranca,
                                                       vLista,
                                                       True,
                                                       False
                                                      )) then
                  begin
                     // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                     //   por Cancelamento do Usuário, logo o procedimento será abortado
                     pbOk := False;
                     frmAguarde.Apaga;
                     Exit;
                  end;

                  PreencheTabelaVirtualVencimento(False);
               end;  // if iParcela <> iParcAnt

               sTipoTrat := '4';
            end
            else  // if bEncargos
            begin
               sTipoTrat := '5';
            end;  // if bEncargos



            // -------------------------------------------------------------------------------------
            // PASSO 4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento
            // -------------------------------------------------------------------------------------
            if sRegistros <> '' then sRegistros := sRegistros + ',';
            sRegistros := sRegistros + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);

            if not(qryHistMovCODDOCUMENTO.IsNull) then
            begin
               //Pendência 25624 - 18/06/2007 - Alberto
               //if not(ExisteHistMovXDocum(qryHistMovCODDOCUMENTO.AsFloat,
               if not(CalcEmptmo.ExisteHistMovXDocum(qryHistMovCODDOCUMENTO.AsFloat,
                                          qryHistMovIDHISTMOVEMPTMO.AsFloat
                                         )) then
               //Fim Pendência 25624
               begin
                  try
                     with dtmIntegraEmptmo.qryHistMovXDocum do
                     begin
                        LimpaParametros(dtmIntegraEmptmo.qryHistMovXDocum);
                        ParamByName('PIDHISTMOVEMPTMO').AsFloat   := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                        ParamByName('PHMDCODDOCUMENTO').AsFloat   := qryHistMovCODDOCUMENTO.AsFloat;
                        ParamByName('PHMDDATA').AsDateTime        := SysDate;
                        ExecSQL;
                     end;

                     // ----------------------------------------------------------------------------
                     // André Pontes - 11/01/2006 - LogDocumento - OK

                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.CodPlanDoc := qryHistMovCODDOCUMENTO.AsFloat;
                     rLogTotalPrev.Origem     := 7;
                     rLogTotalPrev.Operacao   := 'HistMovXDocum';
                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);

                     // ----------------------------------------------------------------------------

                  except
                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.CodPlanDoc := qryHistMovCODDOCUMENTO.AsFloat;
                     rLogTotalPrev.Origem     := 7;
                     rLogTotalPrev.Operacao   := 'Erro ao inserir na HistMovXDocum';
                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);
                  end;
               end;
            end;
            // -------------------------------------------------------------------------------------



            // -------------------------------------------------------------------------------------
            // PASSO 5 - ESTORNA documento anterior
            // -------------------------------------------------------------------------------------
            if not(qryHistMovCODDOCUMENTO.IsNull) then
            begin
               Documento.Saldo.GetSaldoDoc(qryHistMovCODDOCUMENTO.AsInteger,
                                           '',     // Data do Saldo - Saldo Atual
                                           //Pendência 24162 - 25/02/2007 - Alberto
                                           //'P',    // RecPag
                                           'R',    // RecPag
                                           //Fim Pendência 24162
                                           fSaldo,
                                           fSaldoOutraMoeda
                                          );

               if fSaldo <> 0 then  // André Pontes - 23/01/2006
               begin
                  IntegraEmptmo.EfetuaBaixaCAR(qryHistMovCODDOCUMENTO.AsInteger);
                  // FIM André Pontes - 14/09/2004

                  // ----------------------------------------------------------------------------------
                  // André Pontes - 11/01/2006 - LogDocumento - OK

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                  rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                  rLogTotalPrev.CodPlanDoc := qryHistMovCODDOCUMENTO.AsFloat;
                  rLogTotalPrev.Origem     := 7;
                  rLogTotalPrev.Operacao   := 'EfetuaBaixaCaR';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // ----------------------------------------------------------------------------------
               end;
            end;
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------
            // FlgTipoTratIndiv
            //    0: Suspensão
            //    1: Liberação de Suspensão
            //    2: Abono
            //    3: Desvio
            //    4: Alteração de Vencimento
            //    5: Alteração de Vencimento sem encargos
            //    6: Baixa Manual
            //    7: Desfazer Baixa Manual
            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------
            // PASSO 6 - Desfazer a flag envio da parcela
            // -------------------------------------------------------------------------------------
            sSQL :=
            'UPDATE '                                                                        + #13 +
            '  HISTMOVEMPTMO '                                                               + #13 +
            'SET '                                                                           + #13 +
            '  HMEOBSERVACAO    = (HMEOBSERVACAO || '' '' || SYSDATE || '' - '' || '         +
                                   QuotedStr(FormatFloat('#0', Sistema.IDUsuario))           +
                                 ' || '' - Alteracao de Vencto de '' || '                    +
                                 ' TO_CHAR(HMEDATAVENCTO, ''DD/MM/YYYY'') '                  +
                                 ' || '' para '' || ' + sDataVencto + '), '                  + #13 +

            '  HMEDATAVENCTO    = ' + 'TO_DATE(' + sDataVencto + ', ''DD/MM/YYYY''), '       + #13 +
            '  HMEANOCOBRANCA   = ' + sNovoAnoCobranca   + ', '                              + #13 +
            '  HMEMESCOBRANCA   = ' + sNovoMesCobranca   + ', '                              + #13 +
            '  HMEFORMACOBRANCA = ' + QuotedStr(sNovaFormaCobranca)  + ', '                  + #13 +

            // André Pontes - 14/09/2004
            '  HMETIPOFOLHA     = NULL, '                                                    + #13 +

            // Marchetti - 05/08/2005
            '  HMERECPAG        = ''R'', '                                                   + #13 +

            '  FLGENVIO         = 0, '                                                       + #13 +
            '  FLGSUSPENSAO     = NULL, '                                                    + #13 +
            '  FLGDIVERGPEND    = 0, '                                                       + #13 +
            '  FLGDIVERGTRAT    = 1, '                                                       + #13 +

            '  FLGTRATINDIV     = 1, '                                                       + #13 +
            '  FLGTIPOTRATINDIV = ' + sTipoTrat + ', '                                       + #13 +
            '  HMEDATATRATINDIV = SYSDATE, '                                                 + #13 +
            '  IDUSUARIOINDIV   = ' + IntToStr(Sistema.IDUsuario) + ', '                     + #13 +

            '  IDTMPDESC        = NULL, '                                                    + #13 +
            '  CODDOCUMENTO     = NULL '                                                     + #13 +
            'WHERE '                                                                         + #13 +
            '  IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);

            with dtmEmptmo.qryAuxEmptmo do
            begin
               Close;
               SQL.Clear;
               SQL.Text := sSQL;
               ExecSQL;
            end;

            // -------------------------------------------------------------------------------------
            // André Pontes - 11/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
            rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
            rLogTotalPrev.CodPlanDoc := -1;
            rLogTotalPrev.Origem     := 7;
            rLogTotalPrev.Operacao   := 'ProcessaMudancaVencimento - Update CodDocumento para NULL';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------

           iParcAnt := iParcela;
            qryHistMov.Next;
         end;  // while not(qryHistMov.EOF)

         First;
         EnableControls;
      end;  // with qryHistMov

   except
      //
   end;

   if not(bEncargos) then
   begin
      // Marchetti - Pendencia 18037
      frmAguarde.Apaga;

      // Marchetti - Pendencia 19909
      qryItensGerados.close;         // WO19836 Ferrari
      LimpaParametros(qryItensGerados);
      qryItensGerados.SQL.Add('ORDER BY HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMETIPOMOV, HME.HMESEQCOBRANCA');  // WO19836 Ferrari

      qryItensGerados.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      qryItensGerados.ParamByName('PDATAVENCTO').AsDateTime    := edtDataVencto.Date;
      qryItensGerados.Open;
      // Fim Marchetti - Pendencia 19909

      btnConfirmarClick(Self);

      // Fim Marchetti - Pendencia 18037

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      ntbPrincipal.PageIndex := 0;
      Repaint;
   end
   else
   begin
      btnConfirmar.Visible        := True;
      btnContinuaConfirma.Visible := True;

      // Pendência 24818 - 21/03/2007 - Alberto
      btnConfirmar.Enabled        := bConfirmarHabilitado;
   end;

   frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtualVencimento(bAbreTabela : Boolean);
var
   i : Integer;
   j : Integer;
   sMesCobranca  : String;
begin
   if (bAbreTabela) or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   j := length(vListaCompleta);

   sMesCobranca   := Copy(edtDataVencto.Text, 7, 4) + '/' + Copy(edtDataVencto.Text, 4, 2) ;

   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to High(vLista) do
   begin

      // Marchetti - pendencia 22666
      if vLista[i].Valor < 0 then
         vLista[i].RecPag := 'R';
      // fim Marchetti - pendencia 22666

      try
         SetLength(vListaCompleta, (j + i + 1));
         vListaCompleta[(j + i)] := vLista[i];

         // Marchetti - pendencia 22666
         vListaCompleta[(j + i)].RecPag := vLista[i].RecPag;
         // Fim Marchetti - pendencia 22666

      except

      end;

      qryHistMovVirtual.Insert;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := qryHistMovIDCONTRATOEMPTMO.AsFloat;
      qryHistMovVirtualIDHISTMOVEMPTMO.AsFloat     := 0;
      qryHistMovVirtualDESCRICAO.AsString          := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMesCobranca;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencto.Date;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;
      qryHistMovVirtualPARCELA.AsInteger           := vLista[i].Parcela;
      qryHistMovVirtualTRATAMENTO.AsString         := 'Mudança de Vencimento';
      qryHistMovVirtualHMEDATAVENCTO.AsString      := qryHistMovHMEDATAVENCTO.AsString;
      qryHistMovVirtualVALOR.AsCurrency            := vLista[i].Valor;

      qryHistMovVirtual.Post;

   end;  // for i := 0 to High(vLista)
end;



procedure TfrmExecTrataParcela.btnConfirmarClick(Sender: TObject);
var
   sAnoCobranca     : String;
   sMesCobranca     : String;
   sSQL             : String;
   sSQLAgrupaDocs   : String;
   sResult, sErro   : TStringList;
   i                : Integer;
   iPlanilha        : Integer;
   sMensagem        : String;
   sDocumentos      : String;
   IDHistMovEmptmo  : Extended;
   IDContratoEmptmo : Extended;
begin
   // Passos:
   //   1 - Gravar Historico
   //   3 - Gerar CAR
   //   4 - Fazer envio (agrupado ou individual)

   sAnoCobranca := Copy(edtDataVencto.Text, 7, 4);
   sMesCobranca := Copy(edtDataVencto.Text, 4, 2);

   sRegistros := '';
   qryItensGerados.DisableControls;
   qryItensGerados.First;
   while not qryItensGerados.eof do
   begin

      if qryItensGerados.FieldByName('FLGESCOLHA').AsInteger = 1 then
      begin
         if sRegistros <> '' then sRegistros := sRegistros + ',';

         sRegistros := sRegistros + qryItensGerados.FieldByName('IDHISTMOVEMPTMO').AsString;

      end;
      qryItensGerados.Next;
   end;
   qryItensGerados.First;
   qryItensGerados.EnableControls;


   inherited;

   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO  , '                       + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMESALDODEV, '              + #13 +
   '  HME.HMETIPOMOV, HME.HMEPARCELA, '                                                      + #13 +
   '  CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                          + #13 +                  //edilaine WO29270
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS VARCHAR(7)) AS ANOMESCOMPETENCIA, '       + #13 +   //edilaine WO29270
   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, CNT.IDTIPOSUSPEMPTMO, '           + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOPREV, '                                                   + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOORIGEM, HME.IDPATROANT AS IDPATRO, '                      + #13 +
   '  CNT.IDBENEF, CNT.IDPESSOA, 0 AS FLGATUALSALDOENV, '                                    + #13 +
   '  ''               '' AS MATRICULA,  '                                                   + #13 +
   '  CNT.CODFORMAPAG, CNT.PORTFORMAPAG, DECODE(HME.IDCBANCARIA,NULL,CNT.IDCBANCARIADEB,HME.IDCBANCARIA) AS IDCBANCARIADEB, ' + #13 +
   '  CNT.IDCBANCARIA, TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, '                            + #13;

   if DBcboFormaRecebimento.LookupValue <> '' then
        sSQL := sSQL + DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAREC '               + #13
   else sSQL := sSQL + 'CNT.PORTFORMAREC '                                                   + #13;

   sSQL := sSQL +
   'FROM '                                                                                   + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.HMEFORMACOBRANCA       = ''C'' '                                          + #13 +
   '      AND    H.FLGENVIO               = 0 '                                              + #13 +
   '      AND    H.HMEVLREFETIVO          IS NULL '                                          + #13 +

   //Pendência 24593 - 27/02/2007 - Alberto
   '      AND    NVL(H.FLGESTORNADO, 0) = 0 '                                                + #13 +
   '      AND    NVL(H.FLGABONADO, 0)   = 0 '                                                + #13 +
   '      AND    NVL(H.FLGQUITADO, 0)   = 0 '                                                + #13 +
   //FIm Pendência 24593

   '      AND    (H.HMECENTRALIZA         = 1 OR H.HMEDESTACADO = 1) '                       + #13 +
   '      AND    (H.IDHISTMOVEMPTMO IN (' + sRegistros + ')) '                               + #13 +
   '      UNION   ALL '                                                                      + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '      AND    H.HMEFORMACOBRANCA       = ''C'' '                                          + #13 +
   '      AND    H.FLGENVIO               = 0 '                                              + #13 +
   '      AND    H.HMEVLREFETIVO          IS NULL '                                          + #13 +

   //Pendência 24593 - 27/02/2007 - Alberto
   '      AND    NVL(H.FLGESTORNADO, 0) = 0 '                                              + #13 +
   '      AND    NVL(H.FLGABONADO, 0)   = 0 '                                              + #13 +
   '      AND    NVL(H.FLGQUITADO, 0)   = 0 '                                              + #13 +
   //Fim Pendência 24593

   '      AND    (H.HMECENTRALIZA         = 1 OR H.HMEDESTACADO = 1) '                       + #13 +
   '      AND    (H.IDHISTMOVEMPTMO IN (' + sRegistros + ')) '                               + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       ( CNT.FLGSITUACAO        <> ''C'' ) '                                             + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO   = CNT.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = IRC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13;
   //Fim Pendência 23255

   try
      sResult   := TStringList.Create;
      sErro     := TStringList.Create;

      iPlanilha := 0;

      // prepara o Histórico-padrão que será passado adiante
      sMensagem  := 'Mudanca de vencimento de Parcela de Emprestimo para: ' + edtDataVencto.Text;

      if not(chkNaoEnvia.Checked) then
      begin
         IntegraEmptmo.EnviaCAPCAR(sSql,
                                   sMensagem,
                                   Sysdate,  // edtDataProcesso.Date,
                                   StrToInt(DBcboTipoDocRec.LookupValue),
                                   iMoedaCorrente,
                                   sCentroCusto,
                                   iPrograma,
                                   iPlanilha,
                                   sResult,
                                   sErro
                                  );

      // ----------------------------------------------------------------------------------------------
      // ----------------------------------------------------------------------------------------------


         // -------------------------------------------------------------------------------------------
         // PASSO 3 - Fazer envio (agrupado ou individual)
         // -------------------------------------------------------------------------------------------

         // Busca os documentos gerados
         with qryAux do
         begin
            SQL.Clear;
            sSQL :=
            'SELECT DISTINCT CODDOCUMENTO '                                                        + #13 +
            'FROM   HISTMOVEMPTMO'                                                                 + #13 +
            'WHERE '                                                                               + #13 +
            '       ( HMEFORMACOBRANCA = ''C'' ) '                                                 + #13 +
            '   AND ( CODDOCUMENTO     IS NOT NULL ) '                                             + #13 +
            '   AND ( FLGENVIO         IS NULL ) '                                                 + #13 +
            '   AND ( FLGDIVERGPEND    IS NULL OR FLGDIVERGPEND = 0 ) '                            + #13 +
            '   AND ( HMEANOCOBRANCA   = ' + sAnoCobranca + ' ) '                                  + #13 +
            '   AND ( HMEMESCOBRANCA   = ' + sMesCobranca + ' ) '                                  + #13 +
            '   AND ( IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) ' + #13;

            SQL.Text := sSQL;
            Open;
         end;
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------


         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         if chkAgrupaParcela.Checked then
         begin
            // Seleção dos documentos para gerar boleto
            sSQLAgrupaDocs :=
            'SELECT ' + #13 +
            '   CODDOCUMENTO, DATAVENCTO, CODPORTFORMA, GRUPODOC '     + #13 +
            'FROM '                                                    + #13 +
            '   DOCUMENTO '                                            + #13 +
            'WHERE '                                                   + #13 +
            '       ( (EMISBLOQ <> ''S'') OR (EMISBLOQ IS NULL) ) '    + #13 +
            '   AND ( (RTRIM(STATUS) <> ''2'') OR (STATUS IS NULL) ) ' + #13 +
            '   AND ( DATAVENCTO = TO_DATE(' + QuotedStr(edtDataVencto.Text) + ',' + QuotedStr('dd/mm/yyyy')+') )' + #13;

            with qryAux do
            begin
               sDocumentos := '';
               while not(EOF) do
               begin
                  sDocumentos := sDocumentos + qryAux.FieldByname('CODDOCUMENTO').AsString;
                  Next;
                  if not(EOF) then sDocumentos := sDocumentos + ',';
               end;
               Close;
            end;

            with qryAgrupaDocs do
            begin
               SQL.Text := sSQLAgrupaDocs + '   AND ( CODDOCUMENTO IN (' + sDocumentos + ') )' + #13;
            end;

            // agrupa todos os documentos daquele contrato que tenham o mesmo vencimento
            // e já altera o EMISBLOQ para 'N'
            Documento.IntBanco.AgrupaDocCNAB(qryAgrupaDocs, True, True, True, True, ['DATAVENCTO']);
         end;
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------

      end;  // if not(chkNaoEnvia.Checked)


      try
         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 7;
         rLogTotalPrev.Operacao   := 'Mudança de vencimento';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         if Apropriacao then
           if not chkParcela.Checked then
             begin
               MsgDlg('É necessário Indicar o nº da parcela no campo "Filtrar por nº da Parcela!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
             end
           else
             ProcessaApropriacao;

         // Marchetti - pendencia 22042
         IntegraModulo.iEvento         := 6;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - pendencia 22042

      except
         Raise;
         Repaint;

         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

   finally
      sResult.Free;
      sErro.Free;
   end;

   btnConfirmar.Visible        := False;
   btnContinuaConfirma.Visible := False;
   btnVoltaInicioClick(Self);
end;



procedure TfrmExecTrataParcela.btnAlteraVenctoClick(Sender: TObject);
var
  Tratar:Boolean ;
begin
inherited;
   MarcaRegistros;
   vListaCompleta := nil;
   Tratar:=True ;
   Apropriacao := false; //WO19836 - Ferrari


   IF VerificaAgendamento(qryHistMov.fieldbyname('IDCONTRATOEMPTMO').AsString,qryHistMov.fieldbyname('HMEPARCELA').AsString) then
      Begin    // função que verifica tratamento   Flávio Nogueira
         if MsgDlg('Este item já foi tratado em ' +DataTratado+' e tem vencimento previsto para '+DataVencimento+'.Deseja '+#13 +
                  'tratá-lo novamente? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
               Tratar:=False ;
      end;

   if Tratar then
      Begin
         if RegistroComDocumento then
         begin
            if MsgDlg('Pelo menos um dos registros selecionados já consta em um documento. ' + #13 +
                      'Deseja prosseguir? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            begin
               Repaint;
               Exit;
            end;
            Repaint;
         end;
         if Sistema.TipoCliente = 19991 then // FUNCEF
            DBrdgDebito.ItemIndex := 0;

         TipoTratamento := ttVencto;
         if not(VerificaPreenchimento(ttVencto)) then Exit;

         //WO19836 - Ferrari - Inicio - Add o apropriacao de parcela
         //ProcessaMudancaVencimento(True);
         if edtVlrRecebido.value > 0 then
         begin
            if not chkParcela.Checked then
            begin
                MsgDlg('É necessário Indicar o nº da parcela no campo "Filtrar por nº da Parcela!', 'Empréstimo', mtError, [mbOk], 0);
                Repaint;
                Exit;
            end
            else
            begin
                Apropriacao := true;
                ProcessaMudancaVencimento(True,Apropriacao);
                DBcboFormaRecebimento.LookupValue := FloatToStr(dtmLookEmptmo.qryLookPortadorFormaRCODPORTFORMA.AsFloat);
                DBcboFormaRecebimento.Text        := dtmLookEmptmo.qryLookPortadorFormaRDESCRICAO.AsString;
                cboTipoRecurso.Text               := QryTipoRecurso.FieldByname('Nome').asstring;
                EdOrigemRecurso.Text              := cboTipoRecurso.Text;
                btnContinuaConfirmaClick(Self);
                btnConfirmarClick(Self);
            end
         end
         else
         begin
            Apropriacao := false ;
            ProcessaMudancaVencimento(True,Apropriacao);
            btnConfirmar.Visible          := True;
            btnContinuaConfirma.Enabled   := True;
            btnContinuaConfirma.Visible   := True;
            ntbPrincipal.PageIndex        := 2;
         end;
      end;
if  Apropriacao = false then   //WO19836 - FErrari
parcela.clear;
end;



procedure TfrmExecTrataParcela.DBgrdHistMovExit(Sender: TObject);
begin
   inherited;
   if qryHistMov.State in dsEditModes then qryHistMov.Post;
end;



function TfrmExecTrataParcela.ContabilizaAbono: Int64;
var
   sSQL              : String;
   sMes              : String;
   sAno              : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
begin
   Result := 0;

   // Pendência 23255 - 01/02/2007 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL   :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '       + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +
   '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, '                                        + #13 +
   '  HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, '                                             + #13 +
   '  HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA, '                                              + #13 +
   '  HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, '                                               + #13 +
   '  HME.HMESEQCOBRANCA, '                                                                  + #13 +
   '  HME.HMEPARCELA, HME.HMESALDODEV, HME.HMETXJUROS, HME.HMEFORMACOBRANCA,'                + #13 +
   '  HME.FLGESTORNADO, '                                                                    + #13 +
   '  TC.IDTIPOCONTREMPTMO, '                                                                + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOPREV, '                                                   + #13 +
   '  HME.IDPATROANT AS IDPATRO, HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                      + #13 +
   '  ITC.TIPCODIGO '                                                                        + #13 +
   'FROM '                                                                                   + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TC,  '                                                                 + #13 +
   '  TIPOEMPTMO      TE,  '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAQUITABONO) '               + #13 +
//   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat)      + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.asFloat) + #13 +
   '      UNION   ALL '                                                                      + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAQUITABONO) '                         + #13 +
//   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat)      + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.asFloat) + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                           + #13 +
   '      HME.IDCONTRATOEMPTMO   = CNT.IDCONTRATOEMPTMO  '                                            + #13 +
   '  AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO  '                                                + #13 +
   '  AND ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO  '                                                + #13 +
   '  AND HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO  '                                                + #13 +
   '  AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO  '                                           + #13 +
   '  AND CNT.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO  '                                            + #13 +
   '  AND TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO  '                                                 + #13;

   // Marchetti - Pendencia 22755 - 10/04/2007
   // passou a utilizar a data de vencimento como data de abono
   sMes := Copy(edtDataVencto.Text,1,2);

   if Length(sMes) = 1 then sMes := '0' + sMes;

   sAno := FormatFloat('0000', StrToInt(Copy(edtDataVencto.Text,7,4)));
   // Fim Marchetti - Pendencia 22755 - 10/04/2007

   sHistoricoContab := 'EMPRESTIMOS DE PARTICIPANTES - Abono - Contrato nº ' + qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString + ' - Referência ' + sMes + '/' + sAno;

   IntegraEmptmo.ContabilizaItens('C',
                                  'A',
                                  sSQL,
                                  sHistoricoContab,
                                  // Marchetti - Pendencia 22755 - 10/04/2007
                                  // passou a utilizar a data de vencimento como data de abono
                                  StrToDate(edtDataVencto.Text),
                                  // Fim Marchetti - Pendencia 22755 - 10/04/2007
                                  sResult,
                                  sErro,
                                  iPlanilhaResult );

   Result := iPlanilhaResult;
end;



procedure TfrmExecTrataParcela.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if qryHistMov.RecordCount > 100 then begin

      qryHistMov.DisableControls;

      { Acerta tela de acompanhamento }
      frmAguarde.Max := qryHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      bMostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do begin

      qryHistMov.Edit;
      if qryHistMovFLGESCOLHA.AsInteger = 1 then begin
         qryHistMovFLGESCOLHA.AsInteger := 0;
      end else begin
         qryHistMovFLGESCOLHA.AsInteger := 1;
      end;

      qryHistMov.Next;

      // Atualiza tela de acompanhamento 
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if qryHistMov.RecordCount > 100 then
   begin
     qryHistMov.DisableControls;
     { Acerta tela de acompanhamento }
     frmAguarde.Max := qryHistMov.RecordCount;
     frmAguarde.Pos := 0;

     frmAguarde.Mostra('Processando, Aguarde...');

     Mostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do
   begin
     qryHistMov.Edit;
      qryHistMovFLGESCOLHA.AsInteger := 1;
     qryHistMov.Post;

     qryHistMov.Next;

      if Mostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataParcela.PreencheDadosContrato(const qryContrato     : TwwQuery;
                                                     var   rDadosContrato  : TDadosContrato);
begin
   LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := qryContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;

   // É nulo na Concessão 
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IdPessoa          := qryContrato.FieldByName('IDPESSOA').AsInteger;
   rDadosContrato.IDTipoContrEmptmo := qryContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rDadosContrato.IDTipoEmptmo      := qryContrato.FieldByName('IDTIPOEMPTMO').AsInteger;
   rDadosContrato.IdPlanoPrev       := qryContrato.FieldByName('IDPLANOPREV').AsInteger;
   rDadosContrato.IdPatro           := qryContrato.FieldByName('IDPATRO').AsInteger;

   // Número da Inscrição
   rDadosContrato.IDInscricaoEmptmo := qryContrato.FieldByName('IDINSCRICAOEMPTMO').AsFloat;

   // É nulo
   rDadosContrato.IDVerba := -1;

   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo e do Beneficiário no caso de Pensionista
   rDadosContrato.IdBenef := qryContrato.FieldByName('IDBENEF').AsInteger;

   if qryContrato.FieldByName('FLGFORMAPAG').AsString = 'C' then
   begin
      rDadosContrato.IDCBancaria    := qryContrato.FieldByName('IDCBANCARIA').AsInteger;
      rDadosContrato.IDCBancariaDeb := qryContrato.FieldByName('IDCBANCARIADEB').AsInteger;
   end else begin
      // É nulo
      rDadosContrato.IDCBancaria    := -1;
      rDadosContrato.IDCBancariaDeb := -1;
   end;

   if qryContrato.FieldByName('CODFORMAPAG').AsString <> '' then
   begin
      rDadosContrato.CodFormaPag  := qryContrato.FieldByName('CODFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAPAG').AsString <> '' then
   begin
      rDadosContrato.PortFormaPag := qryContrato.FieldByName('PORTFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAREC').AsString <> '' then
   begin
      rDadosContrato.PortFormaRec := qryContrato.FieldByName('PORTFORMAREC').AsInteger;
   end else begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.Indexador      := qryContrato.FieldByName('MOECODIGO').AsInteger;
   rDadosContrato.SiglaIndexador := qryContrato.FieldByName('MOESIGLA').AsString;

   rDadosContrato.NumParcelas    := qryContrato.FieldByName('NUMPARCELAS').AsInteger;
   rDadosContrato.DataCredito    := qryContrato.FieldByName('DATACREDITO').AsDateTime;
   rDadosContrato.DataSituacao   := qryContrato.FieldByName('DATASITUACAO').AsDateTime;
   rDadosContrato.DataAssinatura := qryContrato.FieldByName('DATAASSINATURA').AsDateTime;
   rDadosContrato.DataPrimParc   := qryContrato.FieldByName('DATAPRIMPARC').AsDateTime;

   // Data nula
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := qryContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rDadosContrato.VlrParcela  := qryContrato.FieldByName('VLRPARCELA').AsCurrency;
   rDadosContrato.Txjuros     := qryContrato.FieldByName('TXJUROS').AsFloat;
   rDadosContrato.FlgSituacao := qryContrato.FieldByName('FLGSITUACAO').AsString;

   if qryContrato.FieldByName('VLRSALBASE').AsString <> '' then
   begin
      rDadosContrato.VlrSalBase := qryContrato.FieldByName('VLRSALBASE').AsCurrency;
   end else begin
      rDadosContrato.VlrSalBase := 0;
   end;

   if qryContrato.FieldByName('VLRMARGEM').AsString <> '' then
   begin
      rDadosContrato.VlrMargem := qryContrato.FieldByName('VLRMARGEM').AsCurrency;
   end else begin
      rDadosContrato.VlrMargem := 0;
   end;

   if qryContrato.FieldByName('VLRMAXPERMIT').AsString <> '' then
   begin
      rDadosContrato.VlrMaxPermit := qryContrato.FieldByName('VLRMAXPERMIT').AsCurrency;
   end else begin
      rDadosContrato.VlrMaxPermit := 0;
   end;

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha 
   rDadosContrato.flgFormaRec := qryContrato.FieldByName('FLGFORMAREC').AsString;

   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rDadosContrato.flgFormaPag := qryContrato.FieldByName('FLGFORMAPAG').AsString;

   rDadosContrato.IDPlanoOrigem := qryContrato.FieldByName('IDPLANOORIGEM').AsInteger;
end;



procedure TfrmExecTrataParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Parcela.Destroy;//douglas.siqueira SOL153390
   dtmEmptmo.qryDadosContrato.Close;
   UFuncoesEmptmo.bBuscaMutuario := false;
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404

   inherited;
end;



procedure TfrmExecTrataParcela.btnDesfazBaixaClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Deseja realmente desfazer a Baixa Manual?', 'Empréstimo', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;
   Repaint;

   try
      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      try
         qryHistMov.First;
         while not(qryHistMov.EOF) do
         begin
            if (qryHistMovFLGESCOLHA.AsInteger = 1) and (qryHistMovFLGBAIXAMANUAL.AsInteger = 1) then
            begin
               with qryAux do
               begin
                  // exclui o item criado pela diferença, em caso de baixa parcial
                  SQL.Clear;
                  SQL.Text :=
                  'DELETE FROM '                                                                          + #13 +
                  '    HISTMOVEMPTMO '                                                                    + #13 +
                  'WHERE '                                                                                + #13 +
                  '    HMEANOCOMPETENCIA     = ' + qryHistMov.FieldByName('HMEANOCOMPETENCIA').AsString   + #13 +
                  'AND HMEMESCOMPETENCIA     = ' + qryHistMov.FieldByName('HMEMESCOMPETENCIA').AsString   + #13 +
                  'AND HMEPARCELA            = ' + qryHistMov.FieldByName('HMEPARCELA').AsString          + #13 +
                  'AND IDCONTRATOEMPTMO      = ' + qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString    + #13 +
                  'AND HMEORIGEM             = 7 '                                                        + #13 +
                  'AND HMEDATAEFETIVA        IS NULL '                                                    + #13 +
                  'AND NVL(HMEVLREFETIVO, 0) = 0 '                                                        + #13 +
                  'AND FLGBAIXADO            = 0 '                                                        + #13 +
                  'AND FLGRECEBIMENTO        IS NULL '                                                    + #13 +
                  'AND IDITEMEMPTMO          = ' + qryHistMov.FieldByName('IDITEMEMPTMO').AsString        + #13 +
                  'AND HMESEQCOBRANCA        > ' + qryHistMov.FieldByName('HMESEQCOBRANCA').AsString      + #13;

                  try
                     ExecSql;
                  except;
                     MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', MtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;


                  SQL.Clear;
                  SQL.Text :=
                  'UPDATE '                    + #13 +
                  '  HISTMOVEMPTMO '           + #13 +
                  'SET '                       + #13 +
                  '  FLGBAIXADO      = 0, '    + #13 +
                  '  HMEDATAEFETIVA  = NULL, ' + #13 +
                  '  FLGDIVERGPEND   = 1, '    + #13 +
                  '  FLGBAIXAMANUAL  = NULL, ' + #13 +
                  '  FLGTIPODIVERG   = NULL, ' + #13 +
                  '  HMEVLREFETIVO   = NULL  ' + #13 +
                  'WHERE '                     + #13 +
                  '  IDHISTMOVEMPTMO = ' + qryHistMovIDHISTMOVEMPTMO.AsString;

                  try
                     ExecSql;
                  except;
                     MsgDlg('Erro ao atualizar Histórico.', 'Empréstimo', MtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;

               end; // with qryAux

            end; // if flgEscolha and flgBaixaManual

            // -------------------------------------------------------------------------------------

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
            rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
            rLogTotalPrev.Origem     := 7;
            rLogTotalPrev.Operacao   := 'Desfazer baixa manual';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------

            qryHistMov.Next;
         end; // while


         // -------------------------------------------------------------------------------------

         // André Pontes - 17/03/2006
         // ----------------------------------------------------------------------------------------
         //    Acerto da situação do Contrato
         // ----------------------------------------------------------------------------------------
         CalcEmptmo.AcertaSituacaoContratual(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         // Marchetti - pendencia 22042
         IntegraModulo.iEvento         := 6;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - pendencia 22042

      except
         Raise;
         Repaint;

         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

   finally

      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;

      iContMarcados := 0;

      edtVlrRecebido.Value    := 0;
      edtVlrSelecao.Value     := 0;
      edtVlrEnviar.Value      := 0;
      btnContinuaConfirma.Visible := False;
   end;
end;



procedure TfrmExecTrataParcela.FormShow(Sender: TObject);
begin
	inherited;
   Apropriacao := False;   // WO19836 Ferrari
   dtmLookEmptmo.qryLookTipoDocRec.Open;
   dtmLookEmptmo.qryLookItemEmprestimo.Open;

   ParametrosSistema;

   qryTipoRecurso.Close; //Renato Visoni SOL 100479 \	Kintana 445459
   qryTipoRecurso.Open;  //Renato Visoni SOL 100479 \	Kintana 445459

   iPrograma      := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
   sCentroCusto   := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;

   iPais          := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado        := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade        := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   with dtmEmptmo.qryParamGlobal do
   begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
   end;

   dtmLookEmptmo.qryLookTipoDocRec.Locate('CODTIPDOC',dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger,[]);
   DBcboTipoDocRec.LookupValue := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsString;


   chkNaoEnvia.Checked        := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   chkAgrupaParcela.Enabled   := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 19 then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := bHabilitado;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;

            MsgDlg('O Contrato selecionado ainda não foi efetivado.' + #13 +
                   'Não é possível tratar parcelas', 'Empréstimo', mtWarning,[mbOk],0);
            Repaint;
         end;  // if VerificaBaixa

         Screen.Cursor     := crDefault;
      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



procedure TfrmExecTrataParcela.btnLiberaSuspensaoClick(Sender: TObject);
var
   iAno        : Word;
   iMes        : Word;
   iDia        : Word;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   dDataLanc   : TDateTime;
   dDataAtuDia : TDateTime;
begin
   inherited;

   TipoTratamento := ttLiberaSuspensao;
   if not(VerificaPreenchimento(ttLiberaSuspensao)) then Exit;

   try
      DesabilitaBotoes;

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      if MsgDlg('Deseja prosseguir com a Liberação de Suspensão?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;

      Repaint;

      with qryHistMov do
      begin
         DisableControls;
         First;
         while not(qryHistMov.EOF) do
         begin
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
               try
                  // -------------------------------------------------------------------------------
                  // André Pontes - pendência 19459 - 21/06/2005
                  // -------------------------------------------------------------------------------

                  if qryHistMovFLGATUALSALDOPARC.AsInteger = 1 then  // André Pontes - 02/09/2005
                  begin
                     // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s)
                     // de estorno na data de cancelamento indicada
                     dDataLanc   := qryHistMovHMEDATAPREVISTA.AsDateTime;
                     sDataLanc   := FormatDateTime('dd/mm/yyyy', dDataLanc);
                     iEmpresa    := Sistema.idEmpresa;
                     sMsgContab  := '';

                     if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
                     begin
                        MsgDlg('Não é possível liberar suspensão de prestações com data de ' + sDataLanc + ': ' + #13 + '"' +
                               sMsgContab + '"', 'Empréstimo', mtWarning, [mbOk], 0);
                        Repaint;

                        qryHistMov.Next;
                        Continue;
                     end;  // if TestaPeriodo(...

                     if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
                     begin
                        sMsgContab := Contab.MessageInfo;

                        MsgDlg('Não é possível suspender prestações com data de ' + sDataLanc + ': ' + #13 + '"' +
                               sMsgContab + '"', 'Empréstimo', mtWarning, [mbOk], 0);
                        Repaint;

                        qryHistMov.Next;
                        Continue;
                     end;  // if not(Contab...
                  end;  // if qryHistMovFLGATUALSALDOPARC.AsInteger = 1
                  // -------------------------------------------------------------------------------
                  // FIM André Pontes - pendência 19459 - 21/06/2005
                  // -------------------------------------------------------------------------------

                  with qryDesMarcaSuspensao do
                  begin
                     LimpaParametros(qryDesMarcaSuspensao);
                     ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                     ParamByName('PIDHISTMOVEMPTMO').AsFloat    := qryHistMovIDHISTMOVEMPTMO.AsFloat;

                     ExecSQL;
                  end;

                  // André Pontes - 26/08/2005 - pendência 20025
                  if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) and (Sistema.TipoCliente = 19991) then
                  begin
                     dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(rContrato.IDContratoEmptmo, -1);

                     dtmAtualizacaoDiaria.ExecutaAtuDia(rContrato.IDContratoEmptmo, // Contrato
                                                        Sistema.IDModulo,
                                                        -1,                         // Tipo Contr
                                                        -1,                         // Tipo Emptmo
                                                        -1,                         // Patro
                                                        -1,                         // Plano
                                                        1,                          // Estorno
                                                        0,                          // Prov Perda
                                                        1,                          // Atu Saldo
                                                        -1,                         // In Arquivo
                                                        -1,                         // Not In Arquivo
                                                        dDataLanc,                  // Data Ini
                                                        dDataAtuDia,                // Data Fim
                                                        dDataLanc - 1               // Data Considera
                                                       );
                  end;
                  // FIM André Pontes - 26/08/2005 - pendência 20025

                  // -------------------------------------------------------------------------------

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := qryHistMovIDCONTRATOEMPTMO.AsFloat;
                  rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                  rLogTotalPrev.Origem     := 7;
                  rLogTotalPrev.Operacao   := 'Liberação de Suspensão';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------

               except
                  RollBackTransacao;

                  MsgDlg('Ocorreu um ERRO ao tentar suspender o item!', 'Empréstimo', mtError, [mbOK], 0);
                  Repaint;

                  PreencheTabelaVirtual(False);
                  Exit;
               end;
            end;

            PreencheTabelaVirtual(True);
            qryHistMov.Next;
         end;
         EnableControls;
      end;

      // Só "commita" se não houver transacao anterior
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      // Marchetti - pendencia 22042
      IntegraModulo.iEvento         := 6;
      IntegraModulo.iContratoEmptmo := rContrato.IDContratoEmptmo;
      // Fim Marchetti - pendencia 22042

   finally
      qryHistMov.Close;
      qryHistMov.Open;

      qryHistMovVirtual.Close;
      btnContinuaConfirma.Visible := False;
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.btnAlteraVenctoSemEncClick(Sender: TObject);
var
   iParcela : Integer;
   iRecno   : TBookMark;
begin
   inherited;

   MarcaRegistros;

   // ----------------------------------------------------------------------------------------------

   if RegistroComDocumento then
   begin
      if MsgDlg('Pelo menos um dos registros selecionados já consta em um documento. ' + #13 +
                'Deseja prosseguir? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;
   end;

   // ----------------------------------------------------------------------------------------------

   TipoTratamento := ttVencto;
   if not(VerificaPreenchimento(ttVencto)) then Exit;

   ProcessaMudancaVencimento(False,False);

   MsgDlg('Data de Vencimento alterada.', 'Empréstimo', mtInformation, [mbOk], 0);
   Repaint;
   
   qryHistMov.Close;
   qryHistMov.Open;
end;



procedure TfrmExecTrataParcela.MarcaRegistros;
var
   iTipoMovIni : Integer;
   iTipoMovAtu : Integer;
   iParcela    : Integer;
   iRecno      : TBookMark;
begin
   qryHistMov.First;
   qryHistMov.DisableControls;

   //qryHistMov.Filtered := false;
   //qryHistMov.Filter := 'FLGESCOLHA = 1';
   //qryHistMov.Filtered := true;

   try
      while not(qryHistMov.EOF) do
      begin
         if qryHistMovFLGESCOLHA.AsInteger = 1 then
         begin
            iTipoMovIni := qryHistMovHMETIPOMOV.AsInteger;      // André Pontes - 06/04/2006 - pendência 21885
            if iTipoMovIni = 4 then iTipoMovIni := 1;

            iParcela    := qryHistMovHMEPARCELA.AsInteger;
            iRecno      := qryHistMov.GetBookMark;

            //William Moreira da Silva - SOL 260658 PPM 1039277 - Inicio
            // -------------------------------------------------------------------------------------
            //qryHistMov.Filter := 'FLGESCOLHA = 0 AND HMEPARCELA = '+ inttoStr(iParcela);
            //qryHistMov.Filtered := true;

            //if qryHistMovFLGESCOLHA.AsInteger = 0 then
            //begin
            //   Next;
            //   Continue;
            //end;


              qryHistMov.First;
              while not(qryHistMov.EOF) do
              begin
                //William Moreira da Silva - SOL 260658 PPM 1039277 - inicio
                 if qryHistMovFLGESCOLHA.AsInteger = 1 then
                 begin
                      qryHistMov.Next;
                      Continue;
                 end;
                 //William Moreira da Silva - SOL 260658 PPM 1039277 - Fim

                 iTipoMovAtu := qryHistMovHMETIPOMOV.AsInteger;
                 if iTipoMovAtu = 4 then iTipoMovAtu := 1;

                 if (qryHistMovHMEPARCELA.AsInteger = iParcela) and
                    (qryHistMovFLGESCOLHA.AsInteger = 0) and //William Moreira da Silva - SOL 260658 PPM 1039277
                    (iTipoMovIni = iTipoMovAtu) and                 // André Pontes - 06/04/2006 - pendência 21885
                    (qryHistMovFLGSUSPENSAO.AsInteger <> 1) then    // André Pontes - 05/04/2006 - pendência 21885
                 begin
                    qryHistMov.Edit;
                    qryHistMovFLGESCOLHA.AsInteger := 1;
                    iRecno := qryHistMov.GetBookMark; //William Moreira da Silva - SOL 260658 PPM 1039277
                    qryHistMov.Post;
                 end;
                 qryHistMov.Next;
              end;  // while not(qryHistMov.EOF)
              // -------------------------------------------------------------------------------------

            //qryHistMov.Filter := 'FLGESCOLHA = 1';
            //qryHistMov.Filtered := false;

            qryHistMov.GotoBookMark(iRecno);
            qryHistMov.FreeBookMark(iRecno);
         end;  // if qryHistMovFLGESCOLHA.AsInteger = 1

         qryHistMov.Next;
      end;  // while not(qryHistMov.EOF)
      //William Moreira da Silva - SOL 260658 PPM 1039277 - Fim

   finally
      //qryHistMov.Filtered := false;
      qryHistMov.First;
      qryHistMov.EnableControls;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaConfirmaClick(Sender: TObject);
var
   sAnoCobranca     : String;
   sMesCobranca     : String;
   sSQL             : String;
   sSQLAgrupaDocs   : String;
   sMensErro        : String; //Renato Visoni SOL 100479 \	Kintana 445459
   sResult, sErro   : TStringList;
   i                : Integer;
   iPlanilha        : Integer;
   sMensagem        : String;
   sDocumentos      : String;
   IDHistMovEmptmo  : Extended;
   IDContratoEmptmo : Extended;
begin
   // Passos:
   //   1 - Gravar Historico
   //   3 - Gerar CAR
   //   4 - Fazer envio (agrupado ou individual)

   inherited;

   sAnoCobranca := Copy(edtDataVencto.Text, 7, 4);
   sMesCobranca := Copy(edtDataVencto.Text, 4, 2);

   // PASSO 1 - Gravar Historico -----------------------------------------------------------------

   //Renato Visoni SOL 100479 \	Kintana 445459
   
   if (trim(cboTipoRecurso.Text)='') then begin
     sMensErro := 'O campo tipo de origem do recurso é de preenchimento obrigatório';
     MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
     Repaint;
     Exit;
   end;

   if ((Trim(cboTipoRecurso.Text)='PRÓPRIO') and (trim(EdOrigemRecurso.Text) = '')) then begin
     sMensErro := 'O campo origem do recurso é de preenchimento obrigatório';
     MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
     Repaint;
     Exit;
   end;
   
   rContrato.TipoRecurso   := cboTipoRecurso.LookupValue;
   rContrato.OrigemRecurso := EdOrigemRecurso.Text;
   //Renato Visoni SOL 100479 \	Kintana 445459


   if qryHistMovVirtual.Active then
   begin
      with qryHistMovVirtual do
      begin
         First;
         IDContratoEmptmo := 0;

         while not(qryHistMovVirtual.EOF) do
         begin
            if IDContratoEmptmo <> FieldByName('IDCONTRATOEMPTMO').AsFloat then
            begin
               IDContratoEmptmo := FieldByName('IDCONTRATOEMPTMO').AsFloat;

               sAnoCobranca     := Copy(edtDataVencto.Text, 7, 4);
               sMesCobranca     := Copy(edtDataVencto.Text, 4, 2);

               CalcEmptmo.GravaMovEmptmo(rContrato,
                                         vListaCompleta,
                                         4,                       // = Atualização
                                         -1,                      // FieldByName('HMEPARCELA').AsInteger,
                                         -1,                      // Ano Competencia
                                         -1,                      // Mes Competencia
                                         StrToInt(sAnoCobranca),
                                         StrToInt(sMesCobranca),
                                         -1,                      // nº de parcelas remanescentes
                                         FieldByName('HMEDATAPREVISTA').AsDateTime,
                                         FieldByName('HMEDATAPREVISTA').AsDateTime,
                                         '',
                                         '',
                                         False                    // mostra progresso
                                        );

               for i := 0 to high(vLista) do
               begin
                  if sRegistros <> '' then sRegistros := sRegistros + ',';
                  sRegistros := sRegistros + FormatFloat('#0', vLista[i].IdHistMovEmptmo);
               end;

            end;  // IDContratoEmptmo <> FieldByName('IDCONTRATOEMPTMO')

            qryHistMovVirtual.Next;
         end;  // while not(qryHistMovVirtual.EOF)
      end;  // with qryHistMovVirtual
   end;  // if qryHistMovVirtual.Active

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   qryItensGerados.close;    // WO19836 Ferrari
   LimpaParametros(qryItensGerados);
   if Apropriacao then
     begin
       qryItensGerados.SQL.Add('AND HMEPARCELA = :Parcela');  // WO19836 Ferrari
       qryItensGerados.ParamByName('Parcela').AsInteger := trunc(spnParcela.Value);   // WO19836 Ferrari
     end;
   qryItensGerados.SQL.Add('ORDER BY HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMETIPOMOV, HME.HMESEQCOBRANCA');  // WO19836 Ferrari
   qryItensGerados.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   qryItensGerados.ParamByName('PDATAVENCTO').AsDateTime    := edtDataVencto.Date;
   qryItensGerados.Open;

   qryItensGerados.DisableControls;
   qryItensGerados.First;

// Marchetti - Pendencia 26085
// Inibidas as linha abaixo devido a chamada do método que marca todos os itens a serem enviados
// totalizando o edit de forma correta
   edtVlrEnviar.Value := 0;
   btnMarcaTodosEnvioClick(Self);
// Fim Marchetti - Pendencia 26085

   qryItensGerados.First;
   qryItensGerados.EnableControls;

//   if not(Apropriacao) then             // WO19836 Ferrari
     ntbPrincipal.PageIndex      := 3;

   // Pendência 24818 - 21/03/2007 - Alberto
   if bConfirmarHabilitado then btnConfirmar.Enabled := pbOk;
end;



procedure TfrmExecTrataParcela.dbgItensEnviarExit(Sender: TObject);
begin
   inherited;
   if qryItensGerados.State in dsEditModes then qryItensGerados.Post;
end;




procedure TfrmExecTrataParcela.qryItensGeradosFLGESCOLHAChange(
  Sender: TField);
begin
  inherited;
   if qryItensGeradosFLGESCOLHA.Asinteger = 1 then
   begin
      inc(iContMarcados);
      edtVlrEnviar.Value := edtVlrEnviar.Value + qryItensGeradosHMEVLRPREVISTO.AsCurrency;
   end
   else
   begin
      dec(iContMarcados);
      edtVlrEnviar.Value := edtVlrEnviar.Value - qryItensGeradosHMEVLRPREVISTO.AsCurrency;
   end;

   // Mostra ou não Opcoes
   if iContMarcados > 1 then
   begin
      DBrdgDebito.Enabled   := False;
      DBrdgDebito.ItemIndex := 2;
   end
   else
   begin
      DBrdgDebito.Enabled   := True;
   end;

end;

procedure TfrmExecTrataParcela.btnMarcaTodosEnvioClick(Sender: TObject);
begin
   inherited;
   edtVlrEnviar.Value := 0;
   qryItensGerados.DisableControls;
   qryItensGerados.First;

   while not qryItensGerados.eof do
   begin
      qryItensGerados.Edit;
      qryItensGeradosFLGESCOLHA.AsInteger := 1;
      qryItensGerados.Post;
      qryItensGerados.Next;
   end;

   qryItensGerados.First;
   qryItensGerados.EnableControls;
end;



procedure TfrmExecTrataParcela.btnInverteEnvioClick(Sender: TObject);
begin
  inherited;

   qryItensGerados.DisableControls;
   qryItensGerados.First;

   while not qryItensGerados.eof do
   begin
      qryItensGerados.Edit;
      if qryItensGeradosFLGESCOLHA.AsInteger = 0 then
         qryItensGeradosFLGESCOLHA.AsInteger := 1
      else
         qryItensGeradosFLGESCOLHA.AsInteger := 0;
      qryItensGerados.Post;
      qryItensGerados.Next;
   end;
   qryItensGerados.First;
   qryItensGerados.EnableControls;
end;



function TfrmExecTrataParcela.RegistroComDocumento: Boolean;
begin
   Result := False;

   if not(qryHistMov.Active) then Exit;

   try
      qryHistMov.DisableControls;
      qryHistMov.First;

      while not(qryHistMov.EOF) do
      begin
         if (qryHistMovFLGESCOLHA.AsInteger = 1) and not(qryHistMovCODDOCUMENTO.IsNull) then
         begin
            Result := True;
            Exit;
         end;

         qryHistMov.Next;
      end;

   finally
      qryHistMov.First;
      qryHistMov.EnableControls;
   end;
end;



function TfrmExecTrataParcela.AtualizaSitPart(const iIDHistMovEmptmo: Extended): Boolean;
var
   sSQL        : String;
   qryAux      : TwwQuery;
begin
   Result := True;

   MostraEspera('Atualizando forma de envio de acordo com a Situação do Participante...');

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try
         // ----------------------------------------------------------------------------------------
         // Se Excepcional, muda o forma de cobranca das parcelas atrasadas para a forma original do contrato
         if dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            sSQL :=
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            'UPDATE '                   + #13 +
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
            '   HISTMOVEMPTMO H '                                                               + #13 +
            'SET '                                                                              + #13 +

            '   HMETIPOFOLHA              = (SELECT DECODE(C.FLGFORMAREC, ''F'', ''P'', NULL) FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO), '  + #13 +
            '   HMEFORMACOBRANCA          = (SELECT C.FLGFORMAREC FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO), '                              + #13 +
            '   CODDOCUMENTO              = NULL '                                              + #13 +
            'WHERE '                                                                            + #13 +
            '       IDHISTMOVEMPTMO       = ' + FormatFloat('#0', iIDHistMovEmptmo)             + #13;

            qryAux.SQL.Clear;
            qryAux.SQL.Text := sSQL;
          //Jéssica Lana SOL 61360 24/04/2009
          //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-TratParcela-UpdateFormaOrigem.txt');
            qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-TratParcela-UpdateFormaOrigem.txt');
            qryAux.ExecSQL;

            // -------------------------------------------------------------------------------------
            // André Pontes - 11/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.CodPlanDoc := -1;
            rLogTotalPrev.Origem     := 19;
            rLogTotalPrev.Operacao   := 'Trat Parcela - Desvio Folha (AtualizaSitPart-UpdateFormaOrigem) ';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------
         end;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // Folha da Patrocinadora - AT

         // André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1 then sSQL :=
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
         'UPDATE '                       + #13
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
         else sSQL :=
         'UPDATE '                                                                              + #13;
         // FIM André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints

         sSQL := sSQL +
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMETIPOFOLHA              = ''P'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       IDHISTMOVEMPTMO       = ' + FormatFloat('#0', iIDHistMovEmptmo)                + #13;

         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13;

         // André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1 then sSQL := sSQL +
         //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
         '       SELECT '                + #13
         //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
         else sSQL := sSQL +
         '       SELECT '                                                                       + #13;
         // FIM André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints

         sSQL := sSQL +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13 +

         //  NAO Assistido
         '-- NAO Assistido '                                                                    + #13 +
         '          AND SP.FLGINTERNO          <> ''AS'' '                                      + #13 +
         '---------------------------------------------------------------------------------- '  + #13 +

         //  Mutuario = Titular (proprio)
         '-- Mutuario = Titular (proprio) '                                                     + #13 +
         '          AND CON.IDPESSOA            = CON.IDBENEF '                                 + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
         //  Ativo na Patro
         '-- Ativo na Patro '                                                                   + #13 +
         '          AND SF.TIPOSIT              = ''A'' '                                       + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
         //  Ativo na Patro ou cedido a Fundacao '
         '-- Ativo na Patro ou Ativo/Afastado na Fundação ou cedido a Fundacao '                + #13 +
         '          AND ( '                                                                     + #13 +
         '              SF.TIPOSIT              = ''A'' OR '                                    + #13 +
         '              ELP.IDPESSJURCEDIDO     = ' + IntToStr(Sistema.IDEmpresa) + ' OR '      + #13 +
         '              (CON.IDPATRO            = ' + IntToStr(Sistema.IDEmpresa) + ' AND '     + #13 +
         '               SF.TIPOSIT             IN (''A'', ''F'') ) '                           + #13 +
         '              ) '                                                                     + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         sSQL := sSQL +

         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         '          AND PPP.FLGDESATIVADO       = 0 '                                           + #13 +
         '          AND CON.IDCONTRATOEMPTMO    = HISTMOVEMPTMO.IDCONTRATOEMPTMO '              + #13;

         sSQL := sSQL +
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-TratParcela-UpdateSitFormaPatro.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-TratParcela-UpdateSitFormaPatro.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // Folha de Benefícios - AS, CA (pensionista)

         sSQL :=
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
         'UPDATE '                       + #13 +
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMETIPOFOLHA              = ''B'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       IDHISTMOVEMPTMO       = ' + FormatFloat('#0', iIDHistMovEmptmo)                + #13;

         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13 +
         '       SELECT '                                                                       + #13 +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13 +

         //  Assistido ou Pensionista
         '-- Assistido ou Pensionista '                                                         + #13 +
         '          AND ( '                                                                     + #13 +
         '              ( SP.FLGINTERNO         = ''AS'' ) '                                    + #13 +
         '           OR ( SP.FLGINTERNO         = ''CA'' AND CON.IDPESSOA <> CON.IDBENEF ) '    + #13 +
         '              ) '                                                                     + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         '          AND PPP.FLGDESATIVADO       = 0 '                                           + #13 +
         '          AND CON.IDCONTRATOEMPTMO    = HISTMOVEMPTMO.IDCONTRATOEMPTMO '              + #13 + 
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-TratParcela-UpdateSitFormaFolha.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-TratParcela-UpdateSitFormaFolha.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

      except
         on E:Exception do
         begin
            Result := False;
            EscondeEspera;
            Exit;
         end;
      end;

   finally
      qryAux.Free;

      EscondeEspera;
   end;
end;



procedure TfrmExecTrataParcela.btnPrestacaoSimClick(Sender: TObject);
var
   iParcela : Integer;
begin
   inherited;

   iParcela := qryHistMovHMEPARCELA.AsInteger;

   // ----------------------------------------------------------------------------------------------
   // 1 - Localiza o primeiro registro da parcela
   // ----------------------------------------------------------------------------------------------
   while not(qryHistMov.BOF) and (qryHistMovHMEPARCELA.AsInteger = iParcela) do
   begin
      qryHistMov.Prior;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 2 - Vai até o fim, marcando todos os registros da parcela
   // ----------------------------------------------------------------------------------------------
   repeat
      // if qryHistMovHMEPARCELA.AsInteger = iParcela then
      if (qryHistMovHMEPARCELA.AsInteger = iParcela)
         and (qryHistMovFLGBAIXAMANUAL.AsInteger <> 1) then        // WO19836 Ferrari
      begin
         qryHistMov.Edit;
         qryHistMovFLGESCOLHA.AsInteger := 1;
         qryHistMov.Post;
      end;

      qryHistMov.Next;
   until
      (qryHistMovHMEPARCELA.AsInteger <> iParcela) or (qryHistMov.EOF);
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecTrataParcela.btnPrestacaoNaoClick(Sender: TObject);
var
   iParcela : Integer;
begin
   inherited;

   iParcela := qryHistMovHMEPARCELA.AsInteger;

   // ----------------------------------------------------------------------------------------------
   // 1 - Localiza o primeiro registro da parcela
   // ----------------------------------------------------------------------------------------------
   while not(qryHistMov.BOF) and (qryHistMovHMEPARCELA.AsInteger = iParcela) do
   begin
      qryHistMov.Prior;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 2 - Vai até o fim, marcando todos os registros da parcela
   // ----------------------------------------------------------------------------------------------
   repeat
      if qryHistMovHMEPARCELA.AsInteger = iParcela then
      begin
         qryHistMov.Edit;
         qryHistMovFLGESCOLHA.AsInteger := 0;
         qryHistMov.Post;
      end;

      qryHistMov.Next;
   until
      (qryHistMovHMEPARCELA.AsInteger <> iParcela) or (qryHistMov.EOF);
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecTrataParcela.qryHistMovFLGESCOLHAChange(Sender: TField);
begin
   inherited;


   if qryHistMovFLGESCOLHA.AsInteger = 1 then
   begin
      inc(iContMarcados);
      edtVlrSelecao.Value := edtVlrSelecao.Value + qryHistMovHMEVLRPREVISTO.AsCurrency;
      if parcela.IndexOf(qryHistMovHMEPARCELA.AsString)=(-1) then
         parcela.add(qryHistMovHMEPARCELA.AsString);
   end
   else
   begin
      dec(iContMarcados);
      edtVlrSelecao.Value := edtVlrSelecao.Value - qryHistMovHMEVLRPREVISTO.AsCurrency;

      if parcela.IndexOf(qryHistMovHMEPARCELA.AsString)>=0 then
         parcela.delete(parcela.IndexOf(qryHistMovHMEPARCELA.AsString));


   end;

   // Mostra ou não Opcoes
   if iContMarcados > 1 then
   begin
      DBrdgDebito.Enabled   := False;
      DBrdgDebito.ItemIndex := 2;
   end
   else
   begin
      DBrdgDebito.Enabled   := True;
   end;
end;



procedure TfrmExecTrataParcela.cboTipoRecursoChange(Sender: TObject);
begin
  inherited;
  cboTipoRecurso.Text := QryTipoRecurso.FieldByname('Nome').asstring; //Renato Visoni SOL 100479 \	Kintana 445459
end;


 {Função criada para verificar se já houve agendamento data especificação
 Kitana 1158919 Sol  153390   Flávio Nogueira  25/05/2011 as 12:00 }

function TfrmExecTrataParcela.VerificaAgendamento(IDCONTRATOEMPTMO,
  NPARCELA: STRING): Boolean;
begin         
  Result:=False ;
  DataTratado:='';
  DataVencimento:='';
  With QryAuxiliar  do
     begin
         Close ;                       //HMEDATADIVERGTRAT     CORRETO HMEDATATRATINDIV
         Sql.Clear;
         Sql.Add('SELECT   NVL(HMEDATATRATINDIV,HMEDATADIVERGTRAT) AS HMEDATADIVERGTRAT,HMEDATAVENCTO, FLGTRATINDIV ');
//         Sql.Add('SELECT   HMEDATADIVERGTRAT,HMEDATAVENCTO, FLGTRATINDIV ');
         Sql.Add('FROM    HISTMOVEMPTMO');
         Sql.Add('WHERE   IDCONTRATOEMPTMO=:IDCONTRATOEMPTMO');
         Sql.Add('AND   HMEDATAVENCTO >= sysdate'); //RN 7.1

         Sql.Add('AND  hmecentraliza=1  AND  FLGENVIO=0'); //RN 7.3
//         Sql.Add('and  hmecentraliza=1  AND HMEPARCELA=:PARCELA AND FLGENVIO=0'); //RN 7.3
         Sql.Add('AND  FLGTRATINDIV=1'); //RN 7.1
         Sql.Add('AND  HMEPARCELA in ('+parcela.CommaText+')'); //RN 7.1
///         ParamByName('PARCELA').AsString:=NPARCELA ; tirei
         ParamByName('IDCONTRATOEMPTMO').AsString:= IDCONTRATOEMPTMO;
         open;
         If recordcount > 0 then
            begin
            if ((Fieldbyname('HMEDATADIVERGTRAT').IsNull) or (Trim(Fieldbyname('HMEDATADIVERGTRAT').AsString)=' '))  then
                DataTratado:='       '
            else
                DataTratado:=FormatDateTime('dd/mm/yyyy', Fieldbyname('HMEDATADIVERGTRAT').AsDateTime )+' '+FormatDateTime('hh:nn:ss', Fieldbyname('HMEDATADIVERGTRAT').AsDateTime ) ;



            DataVencimento:= FormatDateTime('dd/mm/yyyy', Fieldbyname('HMEDATAVENCTO').AsDateTime ) ;
            Result:=True ;
            end
          else
            Result:=false;
     end;

end;



// Inicio Sig 128773 Ferrari

procedure TfrmExecTrataParcela.AbreQueriesHistorico;
var
   sMes : String;
   sAno : String;
begin

end;


procedure TfrmExecTrataParcela.chkParcelaClick(Sender: TObject);
begin
  inherited;
  if not chkParcela.Checked then
    spnParcela.Value := 0;
  btnContinuaSelecaoClick(Self);
end;

procedure TfrmExecTrataParcela.chkFiltroItemClick(Sender: TObject);
begin
  inherited;
  if not chkFiltroItem.Checked then
    DBcboItem.Text := '';
  btnContinuaSelecaoClick(Self);
end;

procedure TfrmExecTrataParcela.DBcboItemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if chkFiltroItem.Checked then btnContinuaSelecaoClick(Self);
end;

procedure TfrmExecTrataParcela.edtDataIniExit(Sender: TObject);
begin
  inherited;
   if ((edtDataIni.Modified) or (edtDataFim.Modified)) and chkFaixaDatas.Checked then btnContinuaSelecaoClick(Self);

end;

procedure TfrmExecTrataParcela.edtDataIniCloseUp(Sender: TObject);
begin
  inherited;
   if ((edtDataIni.Modified) or (edtDataFim.Modified)) and chkFaixaDatas.Checked then btnContinuaSelecaoClick(Self);

end;

procedure TfrmExecTrataParcela.edtDataFimCloseUp(Sender: TObject);
begin
  inherited;
   if ((edtDataIni.Modified) or (edtDataFim.Modified)) and chkFaixaDatas.Checked then btnContinuaSelecaoClick(Self);

end;

procedure TfrmExecTrataParcela.edtDataFimExit(Sender: TObject);
begin
  inherited;
   if ((edtDataIni.Modified) or (edtDataFim.Modified)) and chkFaixaDatas.Checked then btnContinuaSelecaoClick(Self);

end;
// Fim SIG 128773
procedure TfrmExecTrataParcela.chkFaixaDatasClick(Sender: TObject);
begin
  inherited;
  if not chkFaixaDatas.Checked then
    begin
      edtDataIni.Text := '';
      edtDataFim.Text := '';
    end;
  btnContinuaSelecaoClick(Self);

end;
//WO19836 - Ferrari
function TfrmExecTrataParcela.ProcessaApropriacao: Boolean;
var
   sDataEfet   : String;
   TotalSelecionado , VlApropriacao , PorcVlItem, NovoVlItem , TotalParc,VlApropItem,
   TotVlApropItem,QtdRegistro, IncReg ,TotNovoVlItem  :Double;
   NovosDadosParcela : TNovosDados;
   dData, DataAtual, ProximoMes,NovaDataVencto: TDateTime;
   iAno ,iMes ,iDia  : Word;
begin
   PorcVlItem     := 0;
   NovoVlItem     := 0;
   TotalParc      := 0;
   TotVlApropItem := 0;
   QtdRegistro    := 0;
   IncReg         := 0;
   TotNovoVlItem  := 0;
   TotalSelecionado := 0;
   dData := StrToDate(edtDataVencto.Text);
   dData := dData + 1; // Soma 1 dia
   edtDataVencto.Text := DateToStr(dData);
   sDataEfet  := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
   qryHistMov.Close;
   qryHistMov.Open;
   btnPrestacaoNaoClick(Self);
   btnPrestacaoSimClick(Self);
   TotalSelecionado := edtVlrEnviar.value;  // edtVlrSelecao.value;
   VlApropriacao    := edtVlrRecebido.value;

    if TotalSelecionado <= VlApropriacao then
   begin
      MsgDlg('O Valor apropriado deve ser menor que o Total da(s) Parcela(s) Selecionado!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   if MsgDlg('Confirma o pagamento parcial do(s) item(ns) selecionado(s)?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;

   try
      DesabilitaBotoes;
       // -------------------------------------------------------------------------------------------
      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;
      QtdRegistro := qryHistMov.RecordCount;
      // Obter a data atual
      DataAtual := Now;
      // Adicionar um mês
      ProximoMes := IncMonth(DataAtual,1);
      // Extrair o dia, mês e ano do próximo mês
      DecodeDate(ProximoMes, iAno, iMes, iDia);
//      NovaDataVencto      := StrToDate('20/' + InttoStr(iMes)+'/'+InttoStr(iAno));
      NovaDataVencto      := StrToDate(edtDataVencto.Text);
      with qryHistMov do
      begin
         DisableControls;
         First;
         // Acerta tela de acompanhamento
         frmAguarde.Max := RecordCount;
         frmAguarde.Pos := 0;
         frmAguarde.Mostra('Processando, Aguarde...');
         while not(qryHistMov.EOF) do
         begin
            // Atualiza tela de acompanhamento
            frmAguarde.Pos  := frmAguarde.Pos + 1;
            bItemApropriado := False;
            bItemDiferenca  := False;
            IncReg          := IncReg + 1 ;
            if qryHistMovFLGESCOLHA.AsInteger = 1 then
            begin
                try
                  PorcVlItem     := (qryHistMovHMEVLRPREVISTO.asfloat * 100 ) / TotalSelecionado;
                  VlApropItem    := ((VlApropriacao *  PorcVlItem ) / 100)    ;
                  VlApropItem    := RoundCM(VlApropItem, 2);
                  NovoVlItem     := (qryHistMovHMEVLRPREVISTO.asfloat - VlApropItem);
                  NovoVlItem     :=  RoundCM(NovoVlItem, 2);
                  TotalParc      := TotalParc + NovoVlItem;
                  totVlApropItem := totVlApropItem + VlApropItem ;
                  TotNovoVlItem  := TotNovoVlItem + NovoVlItem  ;
                  if  QtdRegistro =  IncReg then
                  begin
                     if totVlApropItem > edtVlrRecebido.value then
                     begin
                         VlApropItem := VlApropItem - ( totVlApropItem - edtVlrRecebido.value);
                     end;
                     if totVlApropItem < edtVlrRecebido.value then
                     begin
                         VlApropItem := VlApropItem + ( edtVlrRecebido.value - totVlApropItem );
                     end;

                     if TotNovoVlItem > (TotalSelecionado - edtVlrRecebido.value) then
                     begin
                        NovoVlItem := NovoVlItem - (TotNovoVlItem - ( TotalSelecionado - edtVlrRecebido.value ));
                     end;
                     if TotNovoVlItem < (TotalSelecionado - edtVlrRecebido.value) then
                     begin
                        NovoVlItem := NovoVlItem + (( TotalSelecionado - edtVlrRecebido.value ) - TotNovoVlItem );
                     end;
                  end;

                  qryAux.SQL.Clear;
                  qryAux.SQL.Text :=
                  'UPDATE '                                                                     + #13 +
                  '  HISTMOVEMPTMO '                                                            + #13 +
                  'SET FLGBAIXADO         = 0 ,'                                                + #13 +
                //  '   HMEVLREFETIVO       = '+ NumeroIngles(VlApropItem)                        + #13 +
                  '   HMEDATAVENCTO       = ' + QuotedStr(DateTimeToStr(qryHistMovHMEDATAVENCTO.AsDateTime)) + ',' + #13 +
                  '   FLGENVIO           = 1,    '                                             + #13 +
                  '   FLGDIVERGPEND      =  0 ,  '                                             + #13 +
                  '   FLGBAIXAMANUAL     =  1 ,  '                                             + #13 +
                  '   FLGTIPODIVERG      = NULL ,'                                             + #13 +
                  '   FLGQUITADO         = 1   ,'                                              + #13 +
                  '   HMEDATAQUITABONO   = ' + QuotedStr(DateTimeToStr(qryHistMovHMEDATAVENCTO.AsDateTime))        + #13 +

                  'WHERE '                                                                      + #13 +
                  '      IDCONTRATOEMPTMO = ' + FloatToStr(qryHistMovIDCONTRATOEMPTMO.AsFloat)  + #13 +
                  '  AND IDHISTMOVEMPTMO  = ' + FloatToStr(qryHistMovIDHISTMOVEMPTMO.AsFloat);
                  qryAux.ExecSql;

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
                  rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
                  //rLogTotalPrev.CodPlanDoc := -1;
                  rLogTotalPrev.CodPlanDoc := qryHistMovCODDOCUMENTO.AsFloat;
                  rLogTotalPrev.Origem     := 7;
                  rLogTotalPrev.Operacao   := 'ProcessaMudancaVencimento - Update Apropriação de Parcelas';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------
                  //Item suspenso
                  NovosDadosParcela.Valor         := NovoVlItem;
                  NovosDadosParcela.FlgBaixado    := 0;
                  NovosDadosParcela.FlgDivergPend := 1;
                  NovosDadosParcela.DataVencto    := qryHistMovHMEDATAVENCTO.AsDateTime;
                  bItemApropriado := true;
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);
                  //Item que será gerado para cobrança
                  NovosDadosParcela.Valor         := VlApropItem;
                  NovosDadosParcela.FlgBaixado    := 0;
                  NovosDadosParcela.FlgDivergPend := 1;
                  NovosDadosParcela.DataVencto    := NovaDataVencto;
                  bItemApropriado := true;
                  bItemDiferenca  := true;
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);
               except
                  frmAguarde.Apaga;
                  RollBackTransacao;

                  MsgDlg('Ocorreu um ERRO ao tentar Alterar Vencimento (Apropriação de Parcela(s)) !', 'Empréstimo', mtError, [mbOK], 0);
                  Repaint;
                  Exit;
               end;
            end;
            qryHistMov.Next;

         end;  // while not(qryHistMov.EOF) do
        EnableControls;

      end;  // with qryHistMov do

      // Só "commita" se não houver transacao anterior
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      MsgDlg('Apropriação de parcelas realizada com sucesso. ', 'Empréstimo', mtInformation, [mbOk], 0);

      IntegraModulo.iEvento         := 6;
      IntegraModulo.iContratoEmptmo := rContrato.IDContratoEmptmo;
   finally
      qryHistMov.Close;
      qryHistMov.Open;
      bItemApropriado            := False;
      qryHistMovVirtual.Close;
      btnContinuaConfirma.Visible := False;
      HabilitaBotoes;
      frmAguarde.Apaga;
      parcela.clear;
   end;
end;
end.
