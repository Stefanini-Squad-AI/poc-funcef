// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//******************************************************************************
//Rotina     : DesfazRegistroArquivoPagtoCNB240
//Data       : 12/08/2020
//SIG        : 101541
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Desfazer remessa quando FLGENVIADO <> C
//------------------------------------------------------------------------------
//Rotina             : 
//N. SIG..........   : 60540
//Data da Alteração: : 09/08/2020
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Adaptação da funcionalidade para importação de arquivos no formato SIACC 240.
//------------------------------------------------------------------------------
//Nº SIG.....: 99365
//Data.......: 08/04/2019
//Responsável: Andre Imakawa
//Descrição..: Passar o parametro FLGTIPOFOLHA para a rotina DesfazRubricaIndividual
//------------------------------------------------------------------------------
//Nº SIG.....: 98188
//Data.......: 10/03/2019
//Responsável: Andre Imakawa
//Descrição..: Não atualizar o campo LOTEPREVIA na tabela TMPDESC.
//------------------------------------------------------------------------------
//Nº SIG.....: 83911
//Data.......: 08/02/2019
//Responsável: Andre Imakawa
//Descrição..: Retornar o FLGDESATIVADO conforme valor enconrado na tabela LOG_PLANUS
//------------------------------------------------------------------------------
//Nº SIG.....: SIG80034
//Data.......: 08/02/2019
//Responsável: Fabio Sampaio
//Descrição..: Correção para quanto alterar a Versão de Pagamento da Folha de
//             Benefícios", seja feita a verificação para habilitar o botão
//             Processar.
//------------------------------------------------------------------------------
//Nº SIG.....: SIG TIBERO
//Data.......: 21/02/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição..: Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Alteração  : DesfazRubricaIndividual
//Nº SIG.....: SIG49023
//Data.......: 20/06/2017
//Responsável: Fernando Xavier
//Descrição..: Tratamento para voltar a Rubrica individual conforme LOG_PLANUS
//------------------------------------------------------------------------------
//Alteração  : atualizaHstPrazoAcumulacaoFolha
//Nº SIG.....: 47459
//Data.......: 08/06/2017
//Responsável: Andre Imakawa
//Descrição..: HSTPRAZOACUMULACAOFOLHA deve ser atualizada apenas folha Resgate
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 207789/16618 PPM 554284
// Data        : 02/07/2015
// Descricao   : **IMPORTAÇÃO ARQUIVO RETORNO PLANUS** Atualmente no módulo Folha, não existe um
//               mecanismo de leitura e batimento do retorno da fita de crédito do pagamento a
//               assistidos, este processo é feito em um programa em separado. Diante disso, solicitamos
//               implementação no modulo folha de um mecanismo que permite leitura deste retorno e
//               caso haja alguma inconsistencia este seja apontada pelo módulo folha e dando a
//               possibilidade de efetuar um lançamento no contas a receber e quando da regularização
//               um pagamento atraves do contas a pagar, este mecanismo deverá ser implementado em toda
//                a folha de beneficios.
//---------------------------------------------------------------------------------------------------
//Pendência   : 41892
//Responsável : André Imakawa
//Data        : 12/03/2017
//Descrição   : HSTPRAZOACUMULACAOFOLHA e HSTCALCULOPMPFOLHA devem ser estornadas
//              independente de tipo de Folha e/ou tipo de IR.
//------------------------------------------------------------------------------
//Nº SOL.....: 270393
//PPM........: 1348254
//Data ......: 01/04/2016
//Alteração..: apenas executa HSTPRAZOACUMULACAOFOLHA e HSTCALCULOPMPFOLHA
//             quando for folha de resgate/resgate parcelado.
//             Alterado FLGPROCESSADO para gravar 2 (Previa)
//Responsável: André Imakawa
//Descrição:  Erro Previa e Efetivação PRAZO ACUMULACAO FOLHA Identificamos que os processos de
//            previa e efetivação da folha de benefícios estão alterando registros da tabela
//            HSTPRAZOACUMULACAOFOLHA pertencentes exclusivamente a folha de resgate. Esse erro
//            tem ocasionado frequentes inconsistências no calculo do IR para resgates. Além do
//            exposto acima, identificamos também que a rotina de efetivação do resgate não esta
//            alimentando os campos FLGPROCESSADO e IDHSTFOLHABENEF
//------------------------------------------------------------------------------
//Pendência   : SOL 255246 PPM 816785
//Responsável : Fernando Xavier
//Data        : 08/06/2015
//Descrição   : **PROCESSO ESTORNO FOLHA DE BENEFICIOS** Solicito verificar o processo
//              de estorno da folha de benefícios, pois quando este é executado alguns
//              processos de rubricaindividuais, tmpdesc, in1343, não estão retornando
//              corretamente. O sistema não desfaz o financeiro e contábil.
//------------------------------------------------------------------------------
//Pendência   : SOL 252458 KINTANA 754788
//Responsável : BRUNO AZEVEDO
//Data        : 22/04/2015
//Descrição   : AO ESTORNAR A FOLHA, DELETAR APENAS OS REGISTROS DA BASEDEPAGAMENTOEFETIVACAO
//              QUE PERTENCEM AO LOTE QUE ESTÁ SENDO ESTORNADO.
//------------------------------------------------------------------------------
//Pendência   : SOL 247171 PPM 649840
//Responsável : Fernando Xavier
//Data        : 23/01/2015
//Descrição   : ** PROJETO MELHORIA DE PERFORMANCE DA FOLHA DE BENEFÍCIOS Quando
//              o estorno for completo ele deve considerar apenas o IDHSTFOLHABENEF.
//------------------------------------------------------------------------------
//Pendência   : SOL 151061-10442 - KINTANA 1105188
//Responsável : Helio Lima Custodio
//Data        : 10/06/2014
//Descrição   : Tratamento do IR Regressivo
//------------------------------------------------------------------------------
//Pendência   : SOL 151061 - KINTANA 1105188
//Responsável : MARCIO MORAIS
//Data        : 16/11/2012
//Descrição   : Tratamento do IR Regressivo
//------------------------------------------------------------------------------
//Pendência   : SOL 136569 KINTANA 820997
//Responsável : MARCIO DENILSON
//Data        : 27/02/2012
//Descrição   : Retornar estado das rubricas registradas na tabela CM.RUBRICAINDIVEXCESSODEB
//              pela procedure CM.TU_LOG_RUBINDIV_ALTERAEXCESSSO
//--------------------------------------------------------------------------------
//Pendência   : SOL 136569 KINTANA 820997
//Responsável : MARCIO DENILSON
//Data        : 16/02/2012
//Descrição   : Rotina tratamento excesso de débito
//--------------------------------------------------------------------------------
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//**************************************************************************************************
// Autor(a)    :  Otacilio Aquino
// Pendência   :  SOL 197568 Kintana 1893484
// Descrição   :  O sistema estorna incorretamente informações de número de
//                ocorrências de rubricas individuais.
//------------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Pendência   :  SOL 143380 Kintana 943521
// Descrição   :  Se eu efetivar duas versões de adto Extra folha, e estornar
// uma o sistema não considera a versão que foi considerado o estorno e apagas
// todas as rubricas individuais da tabela RubricaIndiv.
// Ficando assim sem a cobrança devida na próxima folha normal.
//------------------------------------------------------------------------------
// Autor(a)    :  Daniel Begnami
// Data        :  18/09/2009
// Pendência   :  SOL 122512 Kintana 602764
// Descrição   :  Ajustar a procedure mapa da folha de beneficios para concilia-
//                ção contábil,de forma que seja liberado automaticamente após
//                efetivação da Folha.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 28/09/2009
// Rotina      : DesfazRubricaIndividual
// Pendência   : SOL 124945 KINTANA 639847
// Descricao   : Estava ocorrendo um erro de SQL e o processo não estava termi-
//               nando.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 04/05/2009
// Rotina      : DesfazRubricaIndividual
// Pendência   : Sol 114975 Kintana 541732
// Descricao   : O sistema não estava tratando se a rubrica ja tinha sido
//               processada ou não, pois quando nao tiver nenhum processamento
//               os valores devem ser igual a NULL.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 21/05/2007
// Rotina      : bbtnProcessar
// Pendência   : 19430 (Reabertura)
// Descricao   : Ao estorna não será mais lançado um alterador, será refeito
//               todo o documento
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 19/03/2007
// Rotina      : bbtnProcessar
// Pendência   : 19430 (Reabertura)
// Descricao   : Ao estorna não será mais lançado um alterador, será refeito
//               todo o documento
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/03/2006
// Rotina      : ProcessaRetornos
// Pendência   : 24728
// Descricao   : Ajuste na atualização do saldo total de IR compensado.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 15/11/2006
// Rotina      : bbtnProcessar
// Pendência   : 19430
// Descricao   : Ao estorna não será mais lançado um alterador, será refeito
//               todo o documento
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 14/09/2006
// Rotina      : EstornoReprocessamento
// Pendência   : 20516
// Descricao   : Criada a opção de retorno a previa ou ao preparo no estorno
//               de reprocessamento.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2006
// Rotina      : Seleção do Estado do Registro
// Pendência   : 19744
// Descricao   : Permitir gravar valor do FLGENVIADO = 8 referente a
//               individualização do convênio de INSS.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : EstornoErroProcesso
//  Pendência  : 20889
//  Data       : 22/12/2005
//  Descricao  : Caso o estorno seja de recebedor de pensão alimentícia só marcar
//               o flgestorno com 9 na histrubsal, e não desfazer o preparo.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : LancaContabilizacaoRecebedor
//  Pendência  : 20829
//  Data       : 28/11/2005
//  Descricao  : Colocar join na query que busca os dados para provisão de abono
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : Várias que lançam documento
//  Pendência  : 20827
//  Data       : 28/11/2005
//  Descricao  : Lançar UNIDNEGOC na CCBAIXASXDOCUM. Quando a UNIDNEGOC não é
//               necessária usar o valor padrão ao invés de -1.
//------------------------------------------------------------------------------

unit fEstornaFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, ExtCtrls, TREdit,
  Db, DBTables, Wwquery, StdCtrls, wwdblook, ComCtrls, MAHlpBtn, Buttons,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, TB97Tlbr, TB97,
  TEdNum,
  uCtrlPadroes, uCtrlDocumento, uCtrlLancamento, uCtrlPeriodo, 
  uIntegraBack, MontaSelect, fcButton, fcImgBtn,
  fcShapeBtn, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Menus, fcLabel,
  fFrameProgresso, Provider, DBClient, UObjFolha, DBaseDados, USistema,
  UMensErro, UDatabase, uAdmPrevFB,
  uCtrlContab, uCtrlFinanc, //SOL 255246 PPM 816785
  UFuncoesFolha,
  dContabil, UFuncoesUteisFB, uDesfazerPreparo, uConstFolha, uMovReservaFB, uCmfileUtils;

type
  TfrmEstornaFolha = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;

    Splitter1: TSplitter;
    Splitter2: TSplitter;

    msRecebedor: TMontaSelect;

    dsCAPParticip: TwwDataSource;
    dsCAP: TwwDataSource;
    dsPlanil: TwwDataSource;
    dsContab: TwwDataSource;
    qryContab: TwwQuery;
    qryContabPERNUMERO: TFloatField;
    qryContabPEREXERCICIO: TFloatField;
    qryContabPLNPLANIL: TFloatField;
    qryContabPLNTOTDEB: TFloatField;
    qryContabLACDEBCRE: TStringField;
    qryContabLACVALOR: TFloatField;
    qryContabPLACONTA: TStringField;
    qryContabPLANOME: TStringField;
    qryContabLACHIST1: TStringField;
    qryContabLACHIST2: TStringField;
    qryContabLACHIST3: TStringField;
    qryContabLACHIST4: TStringField;
    qryPlanilha: TwwQuery;
    qryPlanilhaPLNCODIGO: TFloatField;
    qryPlanilhaPERNUMERO: TFloatField;
    qryPlanilhaPEREXERCICIO: TFloatField;
    qryPlanilhaPLNPLANIL: TFloatField;
    qryPlanilhaPLNTOTDEB: TFloatField;
    qryCAP: TwwQuery;
    qryCAPPLACONTA: TStringField;
    qryCAPCODDOCUMENTO: TFloatField;
    qryCAPCODPORTFORMA: TFloatField;
    qryCAPNODOCUMENTO: TFloatField;
    qryCAPDATAPROGRAMADA: TDateTimeField;
    qryCAPVALORLANC: TFloatField;
    qryCAPSALDO: TFloatField;
    qryCAPNOME: TStringField;
    qryCAPNOMETXT: TStringField;
    qryCAPIDFORCLI: TFloatField;
    qryCAPParticip: TwwQuery;
    qryHist: TwwQuery;
    qryParticip: TwwQuery;
    qryPortPagamento: TwwQuery;
    qryAlterador: TwwQuery;
    qryTipoDesembolso: TwwQuery;
    qryTipoRecebimento: TwwQuery;
    qryPortRecebimento: TwwQuery;
    qryAlteradorCAPOriginal: TwwQuery;
    qryUnidNegoc: TwwQuery;
    qryCentRespon: TwwQuery;
    qryAux: TwwQuery;
    qryAlteraCompIRRF: TwwQuery;
    qryDocumentos: TwwQuery;

    dbgrCAP: TwwDBGrid;
    dbgrCAPParticip: TwwDBGrid;
    dbgPlanilha: TwwDBGrid;
    dbgContabilidade: TwwDBGrid;
    dblkFolha: TwwDBLookupCombo;
    dblkUnidNegoc: TwwDBLookupCombo;
    dblkCentRespon: TwwDBLookupCombo;
    dblkAlteradorUmParticip: TwwDBLookupCombo;
    dblkTipoDesemb: TwwDBLookupCombo;
    dblkNovoPortForma: TwwDBLookupCombo;
    dblkTipoEvento: TwwDBLookupCombo;
    dblkCARPortadorForma: TwwDBLookupCombo;
    dblkCARTipoRecebimento: TwwDBLookupCombo;
    dblkCARCentroRespon: TwwDBLookupCombo;
    dblkCARUnidNegoc: TwwDBLookupCombo;

    pgCtrlEstorno: TPageControl;
    pgctrlDadosEstorno: TPageControl;

    tbsDadosIndividual: TTabSheet;
    tbsCAP: TTabSheet;
    tbsContabilizacao: TTabSheet;
    tbsIndividualCAR: TTabSheet;
    tbsIndividualAlterador: TTabSheet;
    tbsIndividualNovoCAP: TTabSheet;

    pnlSelecaoVersao: TPanel;
    pnlDesktop: TPanel;
    pnlDocumentos: TPanel;
    pnlRubricaIndividual: TPanel;
    pnlRecebedor: TPanel;
    pnlPlanilha: TPanel;
    pnlContabilidade: TPanel;

    gbOpcaoIndividual: TGroupBox;
    gbOpcoesEstorno: TGroupBox;
    gbEvento: TGroupBox;

    rbErroProcesso: TRadioButton;
    rbPagamentoPendente: TRadioButton;
    rbEstornoCompleto: TRadioButton;
    rbEstornoIndividual: TRadioButton;
    rbNovoCAP: TRadioButton;

    redInformacao: TRichEdit;
    mmMotivo: TMemo;
    edNome: TEdit;
    dtvenctoCAP: TCMDateTimePicker;
    dtenvioCAP: TCMDateTimePicker;
    dtLanctoCAR: TCMDateTimePicker;
    dtVenctoCAR: TCMDateTimePicker;

    lblTotCAPParticip: TLabel;
    lblTituloVersao: TLabel;
    lblTituloMotivo: TLabel;
    lblCAP: TLabel;
    lblCAPParticip: TLabel;
    lblTituloRecebedor: TLabel;
    lblTituloPlanilha: TLabel;
    lblTituloContabilidade: TLabel;
    lblValorLiquido: TLabel;
    lblUnidNegoc: TLabel;
    lblCentRespon: TLabel;
    lblAlteradorUmParticip: TLabel;
    lblValor: TLabel;
    lblValorNovoCAP: TLabel;
    lbldtvencto: TLabel;
    lbldtenvio: TLabel;
    lblTipoDesemb: TLabel;
    lblNovoPortForma: TLabel;
    lblTodoProcesso: TLabel;
    lblCARProcessoPortForma: TLabel;
    lblProcessoTipoReceb: TLabel;
    lblProcessoDtLancto: TLabel;
    lblProcessodtVencto: TLabel;
    lblTituloValorCAR: TLabel;
    lblCARProcUnidNegoc: TLabel;
    lblCARProcCRespon: TLabel;
    lblValorCAR: TLabel;
    lblValorCAP: TLabel;

    fcsbtnProcurar: TfcShapeBtn;
    fcsbtnLimpa: TfcShapeBtn;
    bbtnProcessar: TBitBtn;
    edTipoPessoa: TEdit;
    lblContaLiquidoRecebedor: TLabel;
    tbsResultado: TTabSheet;
    frameProgresso: TfrmFrameProgresso;
    qryAux1: TwwQuery;
    qryCAPPLNCODIGO: TFloatField;
    dtEvento: TCMDateTimePicker;
    lbAlterador: TLabel;
    bbtnOutro: TBitBtn;
    qryPlano: TwwQuery;
    Label2: TLabel;
    dblkCARTipoDoc: TwwDBLookupCombo;
    qryTipoDocCAR: TwwQuery;
    qryTipoDocCAP: TwwQuery;
    Label3: TLabel;
    dblkCAPTipoDoc: TwwDBLookupCombo;
    UpdateSQL1: TUpdateSQL;
    qryCAPHISTORICOCOMPL: TStringField;
    rbReprocessamento: TRadioButton;
    tbsIndividualReprocessamento: TTabSheet;
    qryCtrlInterface: TwwQuery;
    dsCtrlinterface: TDataSource;
    qryLotes: TwwQuery;
    rbAlterarFormaPag: TRadioButton;
    tbsIndividualFormaPag: TTabSheet;
    dblkPortForma: TwwDBLookupCombo;
    Label7: TLabel;
    dtDataProg: TCMDateTimePicker;
    Label8: TLabel;
    dblkContaRecebedor: TwwDBLookupCombo;
    Label9: TLabel;
    qryContaRecebedor: TwwQuery;
    EditVlAlterador: TRealEdit;
    GroupBox2: TGroupBox;
    lblContabil: TLabel;
    lblfinanc: TLabel;
    qryCAPParticipMES: TStringField;
    qryCAPParticipCODSUBCONTA: TFloatField;
    qryCAPParticipUNIDNEGOC: TFloatField;
    qryCAPParticipCODIGO: TFloatField;
    qryCAPParticipRUBRICA: TStringField;
    qryCAPParticipCODRUBEXIBICAO: TStringField;
    qryCAPParticipDESCRUBEXIBICAO: TStringField;
    qryCAPParticipESTADO: TStringField;
    qryCAPParticipVALORPROVENTO: TFloatField;
    qryCAPParticipVALOR: TFloatField;
    qryFundacao: TwwQuery;
    qryAux2: TwwQuery;
    qryCAPParticipSITUACAO: TStringField;
    qryCAPParticipFLGESTORNO: TFloatField;
    qryCAPParticipIDPLANOCONTABIL: TFloatField;
    qryCAPParticipPLACONTAC: TStringField;
    qryCAPParticipPLACONTAD: TStringField;
    qryCAPParticipCODCENTROCUSTOC: TStringField;
    qryCAPParticipCODCENTROCUSTOD: TStringField;
    qryAux3: TwwQuery;
    ckVoltaPreparo: TCheckBox;
    qryHstLote: TwwQuery;
    pnlReprocessamento: TPanel;
    lblDescLote: TLabel;
    dbtDescricao: TDBText;
    lbMesReferencia: TLabel;
    dbtMesref: TDBText;
    lbDtPagamento: TLabel;
    dbtDataPagto: TDBText;
    lb: TLabel;
    dbtDatacria: TDBText;
    cmbLote: TwwDBLookupCombo;
    qryEstorno: TwwQuery;
    qryTipoEventoDocum: TwwQuery;
    qryTipoEventoDocumIDTIPOEVENTODOCUM: TFloatField;
    qryTipoEventoDocumIDMODULO: TFloatField;
    qryTipoEventoDocumDESCRICAO: TStringField;
    qryTipoEventoDocumFLGATIVO: TFloatField;
    gbAlterador: TGroupBox;
    Label4: TLabel;
    lblTituloValorAlterador: TLabel;
    lblValorAlterador: TLabel;
    Label10: TLabel;
    dblkAlteradorCAPOriginal: TwwDBLookupCombo;
    dtAlterador: TCMDateTimePicker;
    qryCAPQTD: TFloatField;

    procedure dblkFolhaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkFolhaExit(Sender: TObject);
    procedure dbgrCAPCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dblkCARCentroResponChange(Sender: TObject);
    procedure fcsbtnProcurarClick(Sender: TObject);
    procedure rbEstornoClick(Sender: TObject);
    procedure HabilitaProcessar(Sender: TObject);
    procedure fcsbtnLimpaClick(Sender: TObject);
    procedure rbEstornoIndividualClick(Sender: TObject);
    procedure qryPlanilhaAfterScroll(DataSet: TDataSet);
    procedure dtLanctoCARExit(Sender: TObject);
    procedure bbtnOutroClick(Sender: TObject);
    procedure cmbLoteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckVoltaPreparoClick(Sender: TObject);
    procedure redInformacaoMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
    ctrlDocumento: tctrlDocumento;
    ctrlLancamento: tctrlLancamento;
    ctrlPeriodo: tctrlPeriodo;
    ctrlContab: tctrlContab;
    CtrlFinanc: TCtrlFinanc; // SOL 255246 PPM 816785
    lidVersao: longint;
    smatricula: string;
    sInscricao: string;
    sNomeTitular: string;
    snomerecebedor: string;
    snomeplano: string;
    lidTitular: longint;
    lidpessoa: longint;
    lidRecebedor: longint;
    ctipopessoa: char;
    lidPatro: longint;
    lidPlanoPrev: longint;
    lidPagador: longint;
    lidTipoPagador: longint;
    lidbeneficio: longint;
    lcoddocumento: longint;
    lplncodigo: longint;
    dvalor: double;
    bbaixado: boolean;
    scontaliquido: string;
    liEmpresa: longint;
    liExercicio: longint;
    liPeriodo: longint;
    sDocUnico: string;
    ioperacao: integer;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}

    iIdLote,
    iNumRegs: integer;
    dValorTotalLote: double; // valor total de beneficios do lote
    Procedure ClearDbLookups;
    procedure VerificaFornec(idForCli: Integer);
    procedure VerificaCliente(idForCli: Integer);
    procedure AchaContaLiquido;
    procedure AbreCAPrecebedor;
    procedure AbreQryCAP;
    procedure VerificaStatusDocumentosVersao;
    procedure HabilitaEstornoIndividual;
    function HabilitaTipoEstorno(IdHstFolhaBenef : Integer): Boolean;
    function LancaDoc(iCodLancCAPCAR, PlnCodigo, iidPessoa,
      idblkNovoPortForma, iUnidNegoc, iCodTipDoc : integer; sdtenvio, sdtvencto,
      sNoDocumento, smmMotivo, sTipRecDes, sCentroRespon, sContaCliFor,
      RecPag: string; valor: real; aicodforma: integer): Boolean;
    function GeraAlterador: boolean;
    function GeraCAP(var lCodLancCAPCAR, lNumLancto : longint): boolean;
    function GeraCAR(aiplnestorno: integer): boolean;
    function ProcessaCompensacao: boolean;   // Compensação Judicial de IRRF
    function EstornoFolhaCompleto: boolean;
    function EstornoPagamentoPendente(aistatusdoc : integer): boolean;
    function EstornoErroProcesso(aistatusdoc : integer): boolean;
    function AlterarFormaPagamento(aistatusdoc : integer): boolean;
    function EstornoNovoCAP(aistatusdoc : integer): boolean;
    function EstornoReprocessamento(aistatusdoc : integer): boolean;
    function GravaMotivoEstorno: boolean;
    function VerificaContabilizacao: boolean;
    function LancaContabilizacaoRecebedor(aistatusdoc : integer; var aiplncodigo: integer): boolean;
    function DesfazRubricaIndividual(bcompleto: boolean; aidtitular, aidrecebedor: integer; iTipoFolha : integer = 0 ): boolean;  //Renato Visoni Sol 114975 Kintana 541732
    Function Exec_SP_ExcessoDebito(iLote: Integer; sMes, sDataInicio, sDataProgramada: String): String;
    procedure EstornaMapaFolhaBenef(pIDVersao : String); // SOL:122512 - Daniel Begnami

    //MARCIO DENILSON SOL 151061 KINTANA 1105188
    procedure processaIRRegressivo(psMes: String; piIdHstFolhaBenef: Integer);
    procedure atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef: Integer);
    procedure atualizaHstCalculoPMPFolha(piIdHstFolhaBenef: Integer); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
    //procedure atualizaBasePagamentoPrevia(psMes: String; piIdHstFolhaBenef: Integer); //comentario do SOL 207789/16618 PPM 554284
    procedure atualizaBasePagamento(psMes: String; piIdHstFolhaBenef: Integer); //SOL 207789/16618 PPM 554284
    //procedure atualizaBasePagamentoEfetivacao(psMes: String; piIdHstFolhaBenef: Integer); //BRUNO AZEVEDO SOL 252458 KINTANA 754788 //comentario do SOL 207789/16618 PPM 554284
    //FIM MARCIO DENILSON SOL 151061 KINTANA 1105188
                                                                                                       
    procedure DesfazRegistroArquivoPagtoCNB240(pCodDocumento: Integer);//Cássio Rovaroto - SIG nº 60540
  public
    { Public declarations }
    //VERIFICAR SE TMPDESC FOI BAIXADA
    function VerificaTmpDesc(asmes: string; aidversao, aidtitular,
      aidresponsavel: integer): boolean;
  end;

var
  frmEstornaFolha: TfrmEstornaFolha;
  bDocIndividual : Boolean; 

implementation

{$R *.DFM}

{-------------------------------------------------------------------------------
| MÉTODOS PRIVATE DO FORM                                                      |
-------------------------------------------------------------------------------}

Procedure TfrmEstornaFolha.ClearDbLookups;
Var I : Integer;
begin
  For I:= 0 to ComponentCount -1 do
   If Components[I] is TwwDBLookupCombo then
    If UpperCase(TwwDBLookupCombo(Components[I]).Name)<>'DBLKFOLHA' then
      TwwDBLookupCombo(Components[I]).LookupValue:= '';

  For I:= 0 to ComponentCount -1 do
  If Components[I] is TCMDateTimePicker then
    TCMDateTimePicker(Components[I]).Text:='';
end;

procedure TfrmEstornaFolha.VerificaFornec(idForCli: Integer);
begin
  if not FazQuery(qryAux, 'SELECT IDFORCLI FROM EMPRESAFORN '+
                          'WHERE IDFORCLI = '+inttostr(idForCli)+
                          ' AND IDPESSOA = '+inttostr(Sistema.IdEmpresa)) then
    ctrlDocumento.ForCli.Inserir(idForCli, Sistema.IdEmpresa,
      -1,IntegraBack.Plano, prmIdRamoTipoFor, '', '', '', '' , tfcFornecedor);
end;

procedure TfrmEstornaFolha.VerificaCliente(idForCli: Integer);
begin
  if not FazQuery(qryAux, 'SELECT IDFORCLI FROM EMPRESACLIENTE '+
                          'WHERE IDFORCLI = '+inttostr(idForCli)+
                          ' AND IDPESSOA = '+inttostr(Sistema.IdEmpresa)) then
    ctrlDocumento.ForCli.Inserir(idForCli, Sistema.IdEmpresa,
      -1,IntegraBack.Plano, prmIdRamoTipoCli, '', '', '', '' , tfcCliente); 
end;

procedure TfrmEstornaFolha.AchaContaLiquido;
begin
  //Identificando o beneficio
  scontaliquido:='';
  lidbeneficio:=0;
  if FazQuery(qryAux,'SELECT BP.IDBENEFICIO, H.IDRUBRICA '+
                     'FROM HISTRUBSAL H, PROVDESC PD, BENEFPLANPREV BP '+
                     'WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' '+
                     'AND H.IDTITULAR = '+inttostr(lidtitular)+' '+
                     'AND H.IDRUBRICA = PD.IDPROVENTO '+
                     'AND PD.FLGDESCONTO = 0 '+
                     'AND (H.IDRUBRICA = BP.IDRUBRICA OR '+
                          'H.IDRUBRICA = BP.IDRUBRICAATRASO OR '+
                          'H.IDRUBRICA = BP.IDRUBABONO OR '+
                          'H.IDRUBRICA = BP.IDRUBABONOFIM OR '+
                          'H.IDRUBRICA = BP.IDRUBDEVOLUCAO OR '+
                          'H.IDRUBRICA = BP.IDRUBRICADIF OR '+
                          'H.IDRUBRICA = BP.IDRUBRICACORRECAO OR '+
                          'H.IDRUBRICA = BP.IDRUBRICAREVISAO OR '+
                          'H.IDRUBRICA = BP.IDRUBANTECABONO OR '+
                          'H.IDRUBRICA = BP.IDRUBDEVOLABONO OR '+
                          'H.IDRUBRICA = BP.IDRUBDEVOLADIANT OR '+
                          'H.IDRUBRICA = BP.IDRUBADIANT OR '+
                          'H.IDRUBRICA = BP.IDRUBADIANT13 OR '+
                          'H.IDRUBRICA = BP.IDRUBDEVADIANT13 OR '+
                          'H.IDRUBRICA = BP.IDRUBATRACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBDEVACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBREVACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBADTACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBDADACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13ACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13DESACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13PGAN1ACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13DVANACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13ADTACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUB13DADACJUD OR '+
                          'H.IDRUBRICA = BP.IDRUBDESCANTECAB ) '+
                     'AND H.IDPLANOPREV = BP.IDPLANOPREV ') then
    lidbeneficio:=qryAux.fieldbyname('IDBENEFICIO').asinteger;
  //Identifica a Conta Contabil de Liquido associada ao plano/patro do recebedor
  if lidbeneficio > 0 then
  begin
    //Conta de liquido do Beneficio parametrizado por plano e patro
    if FazQuery(qryAux, 'SELECT PLACONTAC FROM BENEFPLANPATRO '+
                        'WHERE IDPESSJUR = '+inttostr(lidPatro)+
                        ' AND IDBENEFICIO = '+inttostr(lidbeneficio)+
                        ' AND IDPLANOPREV = '+inttostr(lidPlanoPrev)) then
    begin
      scontaliquido:=qryAux.fieldbyname('PLACONTAC').asstring;
      If (scontaliquido <> '') then
         exit
      else
      begin
           //Conta de liquido do Beneficio parametrizado apenas por plano
           if FazQuery(qryAux, 'SELECT PLACONTAC FROM BENEFPLANPREV '+
                               'WHERE IDPLANOPREV = '+inttostr(lidPlanoPrev)+
                               ' AND IDBENEFICIO = '+inttostr(lidbeneficio)) then
           begin
                scontaliquido:=qryAux.fieldbyname('PLACONTAC').asstring;
                exit;
           end;
      end;
    end;
  end;

  //Conta de liquido do parametrizada por plano e patro
  if FazQuery(qryAux, 'SELECT PLACONTALIQFLHBEN FROM PLANPREVPATRO '+
                      'WHERE IDPESSJUR = '+inttostr(lidPatro)+
                      ' AND IDPLANOPREV = '+inttostr(lidPlanoPrev)) then
    scontaliquido:=qryAux.fieldbyname('PLACONTALIQFLHBEN').asstring;
end;

procedure TfrmEstornaFolha.AbreCAPrecebedor;
 var snome: string;
     lRefCF: TRegContFinan;
     splaconta: string;
     sccusto: string;
begin
  //QUERY MODIFICADA PARA INCLUIR FLGESTORNO DA HISTRUBSAL COM DESCRIÇÃO DO ESTADO NO GRID DE RUBRICAS
  qryCAPParticip.Close;
  qryCAPParticip.ParamByName('PIDHSTFOLHABENEF').AsInteger:=lidVersao;
  qryCAPParticip.ParamByName('PIDRESPONSAVEL').AsInteger  :=lidRecebedor;
  qryCAPParticip.ParamByName('PIDTITULAR').AsInteger      :=lidTitular;
  qryCAPParticip.Open;

  dValor:=0;
  scontaliquido:='';

  qryCAPParticip.disablecontrols;
  while not qryCAPParticip.eof do
  begin
    if qryCAPParticip.fieldbyname('ESTADO').asstring = 'P' then
      dValor:=dValor+qryCAPParticip.fieldbyname('VALOR').asfloat
    else
      if qryCAPParticip.fieldbyname('ESTADO').asstring = 'D' then
        dValor:=dValor-qryCAPParticip.fieldbyname('VALOR').asfloat;

    qryCAPParticip.Edit;
    //UTILIZAR OS PARÂMETROS CONTABEIS DA HISTRUBSAL
    if qryCAPParticipESTADO.asstring <> 'I' then
    begin
      dtmContabil.PegaParamCF(lidpatro, lidplanoprev,
        qryCAPParticipCODIGO.asinteger, lidTitular, lidRecebedor,
        qryCAPParticip.fieldbyname('MES').asstring, lRefCF);

      if qryCAPParticipESTADO.asstring = 'P' then
      begin
        if scontaliquido = '' then
        begin
          if not qryCAPParticipPLACONTAC.isnull then
            scontaliquido:=qryCAPParticipPLACONTAC.asstring
          else
            AchaContaLiquido;
        end;
        if qryCAPParticipPLACONTAC.isnull then
          qryCAPParticipPLACONTAC.asstring:=scontaliquido;
        if qryCAPParticipPLACONTAD.isnull then
          qryCAPParticipPLACONTAD.asstring:=lRefCF.PlaContaD;
        if qryCAPParticipCODSUBCONTA.isnull then
          qryCAPParticipCODSUBCONTA.asinteger:=lRefCF.SubConta;
        if qryCAPParticipCODCENTROCUSTOD.isnull then
          qryCAPParticipCODCENTROCUSTOD.asstring:=lRefCF.CentroCustoD;
      end
      else
      begin
        if scontaliquido = '' then
        begin
          if not qryCAPParticipPLACONTAD.isnull then
            scontaliquido:=qryCAPParticipPLACONTAD.asstring
          else
            AchaContaLiquido;
        end;
        if qryCAPParticipPLACONTAC.isnull then
          qryCAPParticipPLACONTAC.asstring:=lRefCF.PlaContaC;
        if qryCAPParticipPLACONTAD.isnull then
          qryCAPParticipPLACONTAD.asstring:=scontaliquido;
        if qryCAPParticipCODSUBCONTA.isnull then
          qryCAPParticipCODSUBCONTA.asinteger:=lRefCF.SubConta;
        if qryCAPParticipCODCENTROCUSTOC.isnull then
          qryCAPParticipCODCENTROCUSTOC.asstring:=lRefCF.CentroCustoC;
      end;

      if qryCAPParticipUNIDNEGOC.isnull then
        qryCAPParticipUNIDNEGOC.asinteger:=lRefCF.UnidNegoc;
    end;
    qryCAPParticip.post;

    qryCAPParticip.next;
  end;
  qryCAPParticip.first;
  qryCAPParticip.enablecontrols;

  lblValorLiquido.caption:='Valor Líquido: R$ '+formatfloat('#0.00', dValor)+'  ';
  lblValorAlterador.caption:=formatfloat('#0.00', dValor)+'  ';
  lblValorCAR.caption:=formatfloat('#0.00', dValor)+'  ';
  lblValorCAP.caption:=formatfloat('#0.00', dValor)+'  ';

  lblContaLiquidoRecebedor.visible:=true;
  if scontaliquido = '' then
    lblContaLiquidoRecebedor.caption:='Conta Contábil de Líquido associada ao '+
      'pagamento do Recebedor não encontrada'
  else
  begin
    snome:='';
    if FazQuery(qryAux, 'SELECT PLANOME FROM PLANOCONTA '+
         'WHERE PLACONTA = '+QuotedStr(scontaliquido)+
         ' AND PLANO = '+inttostr(IntegraBack.Plano)) then
      snome:=qryAux.fieldbyname('PLANOME').asstring;
    lblContaLiquidoRecebedor.caption:='Conta Contábil de Líquido associada ao '+
      'pagamento do Recebedor: '+scontaliquido+' - '+snome;
  end;
end;

procedure TfrmEstornaFolha.AbreQryCAP;
begin
  qryCAP.Close;
  qryCAP.SQL.Clear;
  if lidrecebedor = 0 then
    qryCAP.SQL.Text := 'SELECT D.NODOCUMENTO, D.DATAPROGRAMADA,LANC.VALORLANC, '+
                       'D.IDFORCLI, PFAV.NOME, H.NOMETXT, SALD.SALDO , D.PLACONTA, '+
                       'D.CODDOCUMENTO, D.CODPORTFORMA, LANC.PLNCODIGO, LANC.HISTORICOCOMPL '+
                       ', CONT.QTD '+ 
                       'FROM HSTFOLHABENEFCAP H,DOCUMENTO D, PESSOA PFAV, '+
//                       '(SELECT L1.CODDOCUMENTO, L1.PLNCODIGO, L1.HISTORICOCOMPL, SUM(DECODE(L1.DEBCRE,''C'',VALOR,VALOR*-1)) VALORLANC'+     //Everson TIBERO
                       '(SELECT L1.CODDOCUMENTO, L1.PLNCODIGO, L1.HISTORICOCOMPL, SUM(DECODE(L1.DEBCRE,''C'',L1.VALOR,L1.VALOR*-1)) VALORLANC'+ //Everson TIBERO
                       ' FROM LANCTODOCUM L1, DOCUMENTO D1 , HSTFOLHABENEFCAP H1'+
                       ' WHERE H1.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                       ' H1.CODDOCUMENTO = D1.CODDOCUMENTO AND'+
                       ' D1.CODDOCUMENTO = L1.CODDOCUMENTO AND'+
                       ' L1.OPERACAO <> ''5'''+
                       ' GROUP BY L1.CODDOCUMENTO, L1.PLNCODIGO, L1.HISTORICOCOMPL) LANC, '+
//                       '(SELECT L2.CODDOCUMENTO,SUM(DECODE(L2.DEBCRE,''C'',VALOR,VALOR*-1)) SALDO'+     //Everson TIBERO
                       '(SELECT L2.CODDOCUMENTO,SUM(DECODE(L2.DEBCRE,''C'',L2.VALOR,L2.VALOR*-1)) SALDO'+ //Everson TIBERO
                       ' FROM LANCTODOCUM L2, DOCUMENTO D2, HSTFOLHABENEFCAP H2'+
                       ' WHERE H2.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                       ' H2.CODDOCUMENTO = D2.CODDOCUMENTO AND'+
                       ' D2.CODDOCUMENTO = L2.CODDOCUMENTO'+
                       ' GROUP BY L2.CODDOCUMENTO) SALD '+
                       ',(SELECT COUNT(DISTINCT IDRESPONSAVEL) AS QTD, H.CODDOCUMENTO '+
                       '  FROM HISTRUBSAL H '+
                       '  WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+
                       '  AND H.FLGESTORNO      = 0 '+
                       '  GROUP BY H.CODDOCUMENTO) CONT '+
                       'WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                       ' H.CODDOCUMENTO = D.CODDOCUMENTO AND'+
                       ' D.IDFORCLI = PFAV.IDPESSOA AND'+
                       ' D.CODDOCUMENTO = LANC.CODDOCUMENTO AND'+
                       ' D.CODDOCUMENTO = SALD.CODDOCUMENTO'+
                       ' AND H.CODDOCUMENTO    = CONT.CODDOCUMENTO ' 
  else
  begin
    qryCAP.SQL.Text := 'SELECT DISTINCT D.NODOCUMENTO, D.DATAPROGRAMADA,LANC.VALORLANC, D.IDFORCLI, '+
                       'PFAV.NOME, H.NOMETXT, SALD.SALDO, D.PLACONTA, D.CODDOCUMENTO, '+
                       'D.CODPORTFORMA, LANC.PLNCODIGO, LANC.HISTORICOCOMPL '+
                       ', CONT.QTD '+ 
                       'FROM HSTFOLHABENEFCAP H,DOCUMENTO D, PESSOA PFAV, HISTRUBSAL HS, '+
//                       '(SELECT L.CODDOCUMENTO,L.PLNCODIGO, L.HISTORICOCOMPL, SUM(DECODE(L.DEBCRE,''C'',VALOR,VALOR*-1)) VALORLANC'+    //Everson TIBERO
                       '(SELECT L.CODDOCUMENTO,L.PLNCODIGO, L.HISTORICOCOMPL, SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)) VALORLANC'+  //Everson TIBERO
                       ' FROM LANCTODOCUM L, DOCUMENTO D1 , HSTFOLHABENEFCAP H'+
                       ' WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                       ' H.CODDOCUMENTO  = D1.CODDOCUMENTO AND'+
                       ' D1.CODDOCUMENTO = L.CODDOCUMENTO AND'+
                       ' L.OPERACAO <> ''5''' +
                       ' GROUP BY L.CODDOCUMENTO,L.PLNCODIGO,L.HISTORICOCOMPL) LANC,'+
//                       '(SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',VALOR,VALOR*-1)) SALDO'+    //Everson TIBERO
                       '(SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)) SALDO'+  //Everson TIBERO
                       ' FROM LANCTODOCUM L, DOCUMENTO D1, HSTFOLHABENEFCAP H'+
                       ' WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                       ' H.CODDOCUMENTO  = D1.CODDOCUMENTO AND'+
                       ' D1.CODDOCUMENTO = L.CODDOCUMENTO'+
                       ' GROUP BY L.CODDOCUMENTO) SALD'+
                       ',(SELECT COUNT(DISTINCT IDRESPONSAVEL) AS QTD, H.CODDOCUMENTO '+
                       '  FROM HISTRUBSAL H '+
                       '  WHERE H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+
                       '  AND H.FLGESTORNO      = 0 '+
                       '  GROUP BY H.CODDOCUMENTO) CONT '+
                       ' WHERE HS.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                            ' HS.IDRESPONSAVEL = '+inttostr(lidRecebedor)+' AND'+
                            ' HS.IDTITULAR = '+inttostr(lidTitular)+' AND'+
                            ' HS.CODDOCUMENTO = D.CODDOCUMENTO AND'+
                            ' H.IDHSTFOLHABENEF = '+inttostr(lidVersao)+' AND'+
                            ' HS.CODDOCUMENTO = H.CODDOCUMENTO AND'+
                            ' D.IDFORCLI = PFAV.IDPESSOA AND'+
                            ' D.CODDOCUMENTO = LANC.CODDOCUMENTO AND'+
                            ' D.CODDOCUMENTO = SALD.CODDOCUMENTO'+
                            ' AND H.CODDOCUMENTO    = CONT.CODDOCUMENTO '; 
    AbreCAPRecebedor;
  end;
  qryCAP.Open;
  lidPagador:=qryCAP.fieldbyname('IDFORCLI').asinteger;
  lcoddocumento:=qryCAP.fieldbyname('CODDOCUMENTO').asinteger;
  lPlncodigo:=qryCAP.fieldbyname('PLNCODIGO').asinteger;
  qryPlanilha.Close;
  qryPlanilha.ParamByName('IDHSTFOLHABENEF').AsInteger:=lidVersao;
  qryPlanilha.Open;
end;

procedure TfrmEstornaFolha.VerificaStatusDocumentosVersao;
begin
  qryDocumentos.close;
  qryDocumentos.ParamByName('pidhstfolhabenef').asinteger:=lidVersao;
  qryDocumentos.open;

(* Se o valor for igual a zero, O Documento é lançado baixado *)
(* Neste caso não impedir que se faça o estorno completo *)
  bbaixado:=false;
  while not qryDocumentos.Eof do
  begin
    bbaixado:=bbaixado or
    ((qryDocumentos.Fieldbyname('status').AsInteger <> 0)And
      (qryDocumentos.Fieldbyname('Valor').AsFloat > 0));
    qryDocumentos.next;
  end;

  rbEstornoCompleto.enabled:= ((Not FazQuery(qryAux,
                               'SELECT IDHSTFOLHABENEF'+
                               ' FROM MOTIVOESTORNOFB '+
                               ' WHERE IDHSTFOLHABENEF = '+IntToStr(lidVersao))) and
                                (Not bbaixado));
  // Alterado por FHBS - 07/02/2019 - SIG80034
  if not rbEstornoCompleto.Enabled and rbEstornoCompleto.Checked then
    rbEstornoCompleto.Checked := False;
  // Fim - Alterado por FHBS - 07/02/2019 - SIG80034
//Cássio Rovaroto - SIG n 60540 - Início
//Desabilitando a habilitação do campos Estorno individual
//  (* Se versão efetivada, FlgEstado = 1, libera rbEstornoIndividual *)
//  rbEstornoIndividual.Checked:=False;
//  rbEstornoIndividual.enabled:= FazQuery(qryAux,'SELECT FLGESTADO'+
//                                 ' FROM HSTFOLHABENEF'+
//                                 ' WHERE (IDHSTFOLHABENEF = '+IntToStr(lidVersao)+') AND'+
//                                 ' (FLGESTADO=1)');
//Cássio Rovaroto - SIG n 60540 - Fim
  EdNome.Text:='';
  EdTipoPessoa.Text:='';
end;

procedure TfrmEstornaFolha.HabilitaEstornoIndividual;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}
begin
  sDocUnico:='';
  rbPagamentoPendente.enabled:=false;
  rbErroProcesso.enabled:=false;
  rbNovoCAP.enabled:=false;
  rbReprocessamento.enabled:=false;
  rbAlterarFormaPag.Checked:=false;
  rbAlterarFormaPag.enabled:=false;
  tbsIndividualAlterador.tabvisible:=false;
  tbsIndividualCAR.tabvisible:=false;
  tbsIndividualNovoCAP.tabvisible:=false;
  tbsIndividualReprocessamento.tabvisible:=false;
  tbsIndividualFormaPag.tabvisible:=false;
  //Identificando estado do documento no qual o recebedor está inserido
  if qryDocumentos.Locate('CODDOCUMENTO',
                          qryCAP.fieldbyname('CODDOCUMENTO').asinteger,[]) then
  begin
    bbaixado:=qryDocumentos.fieldbyname('STATUS').asinteger <> 0;
    ioperacao:=(ord(bbaixado)+1)*10;
    //HABILITA APENAS SE RUBRICA NÃO ESTORNADA. 
    rbPagamentoPendente.enabled:=
      (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger = 0);

    rbErroProcesso.enabled:=true;

    //HABILITA APENAS SE RUBRICA NÃO ESTORNADA.
    rbNovoCAP.enabled:=(qryCAPParticip.fieldbyname('FLGESTORNO').asinteger = 0) and
                       not bbaixado;

    if (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger = 0) then
      If Not rbnovoCAP.Enabled then
        rbNovoCAP.enabled:=Not FazQuery(qryAux,'SELECT H.IDHSTFOLHABENEF'+
                                ' FROM HISTRUBSAL H, DOCUMENTO D'+
                                ' WHERE'+
                                ' (H.IDPESSOA = '+IntToStr(lidRecebedor)+') AND'+
                                ' (H.IDPESSOA = D.IDPESSOA) AND'+
                                ' (H.CODDOCUMENTO = D.CODDOCUMENTO) AND'+
                                ' (H.IDHSTFOLHABENEF = '+IntToStr(lidVersao)+')');

    //{HABILITA APENAS SE RUBRICA NÃO ESTORNADA.
    rbReprocessamento.enabled:=
      (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger = 0) and
      //PERMITIR ESTE ESTORNO MESMO SE DOC FOI BAIXADO
      HabilitaTipoEstorno(lidVersao);

    If (StrToIntDef(qryCap.FieldByName('IDFORCLI').AsString,0)=lIdRecebedor) and
       (not bBaixado) then
    begin
      sDocUnico:=qryCap.FieldByName('CODDOCUMENTO').AsString;
      //HABILITA APENAS SE RUBRICA NÃO ESTORNADA.
      rbAlterarFormaPag.enabled:=(qryCAPParticip.fieldbyname('FLGESTORNO').asinteger = 0);
    end;

    redInformacao.visible:=false;
  end
  else
    redInformacao.visible:=true;
    redInformacao.lines.text:='  Nenhuma opção para Estorno Individual está '+
      'disponível, pois não foi possível identificar o Documento Original do '+
      'Recebedor na Versão de Pagamento';
end;

Function TfrmEstornaFolha.LancaDoc(iCodLancCAPCAR, PlnCodigo, iidPessoa,
  idblkNovoPortForma, iUnidNegoc, iCodTipDoc : Integer; sdtenvio, sdtvencto, sNoDocumento,
  smmMotivo, sTipRecDes, sCentroRespon, sContaCliFor, RecPag: String;
  valor: Real; aicodforma: integer): Boolean;
var lNumLancto: longint;
    ssql, sDebCre: String;
    lidcbancaria: integer;
begin
  Result:=true;
  if IntegraBack.ObrigaCRespon = 'N' then
    if sCentroRespon = '' then
      sCentroRespon := prmCodCentroRespon;
  if IntegraBack.ObrigaABC = 'N' then
    if iUnidNegoc = 0 then
      iUnidNegoc := prmUnidNegoc;
  if Sistemafolha.FLGINTEGRAFINANC = 1 then
  begin
    try
      lidcbancaria:=0;
      if RecPag = 'P' then
      begin
        //VINCULAR CONTA BANCARIA AO DOCUMENTO A PAGAR
        try
          ssql:='SELECT IDCBANCARIA FROM CONTABANCARIA WHERE (IDPESSOA = '+
            inttoStr(iidpessoa)+') AND (FLGCONTAPREF = 1)';
          if FazQuery(qryAux1, ssql) then
            lidcbancaria:=qryAux1.fields[0].asinteger;
        except
        end;
      end;
      CtrlDocumento.SetValues(
        icodlanccapcar, //licoddocumento
        strtofloat(snodocumento), //nodocumento
        '',  //scompldocumento
        '0', // sStatus
        recpag, // recpag
        '2', // sOperacao
        '',  //sNumslip,
        '',  //sNumleitcodbarras,
        sContaCliFor, //sPlaconta,
        '',  //sCodcentrocusto,
        '',  //sNossonumero,
        '',  //sNumdigcodbarras,
        '',  //sGrupodoc,
        '',  //sFlgemitelancbaix,
        '',  //sFlgconfirmarecpag,
        '',  //sEmisbloq,
        '',  //sReferencia,
        '',  //sObs
        strtodate(sdtvencto), //dDatavencto,
        strtodate(sdtenvio), //dDataemissao,
        strtodate(sdtvencto), //dDataprogramada,
        0,  //dDataremessa,
        0,  //dDatalimite,
        0,  //dDatacorrecao,
        0,  //rVlrmulta,
        0,  //rValorjuros,
        0,  //rValordesconto,
        0,  //rPercjurossimples,
        0,  //rPercjurosatuarial
        iCodTipDoc, //liCodtipdoc,
        Sistema.IdEmpresa, //liIdpessoa,
        Sistema.idmodulo, //liIdmodulo,
        iidPessoa, //liIdforcli,
        0, //liNumfatura,
        lidcbancaria, //liIdcbancaria,
        prmUnidNegoc, //-1, //liUnidnegoc, 
        IntegraBack.Plano, //liPlano,
        0, //liNumcpbaixa,
        0, //liNumapgr,
        0, //liMoecodigo,
        0, //liLotetransmissao,
        0, //liIndicecorrecao,
        Sistema.Idusuario, //liIdusuarioinclusao,
        Sistema.IdEmpresa, //liIdempresa,
        0, //liFlgnaoconciliado,
        0, //liControleremessa,
        0, //liCodsubconta,
        idblkNovoPortForma, //liCodportforma,
        0, //liCodgrupocnab,
        0, //liCodgeradorinss,
        aicodforma //liCodforma
         );

      if RecPag = 'P' then
        sDebCre:='C'
      else
        sDebCre:='D';

      CtrlDocumento.Lanctodocum.SetValues(
        strtodate(sdtenvio), //dDatalancto
        icodlanccapcar, //licoddocumento
        0, //liNumlancto
        valor, //rVlrliquido,
        0, //rValorOM
        valor, //rValor
        prmUnidNegoc, //-1, //liUnidnegoc, 
        PlnCodigo, //liPlncodigo
        0, //liNumlotemanual,
        Sistema.Idusuario, //liIdusuarioinclusao,
        Sistema.IdEmpresa, //liIdempresa,
        0, //liIdnflivro,
        0, //liEstorno,
        0, //liCodtipdoc,
        0, //liCoddocinss,
        0, //liCodalterador
        '2', //sOperacao,
        '', //sNumrecibo,
        '', //sNumnf,
        '', //sNumfatura,
        copy(smmMotivo,1,60), //sHistoricocompl,
        '', //sFlgtipofatura,
        '', //sFlgrecebeunf,
        '', //sFlgfatemitida,
        sdebcre, //sDebcre
        Sistema.idmodulo, //liIdModulo
        IntegraBack.Plano, //liPlanoConta
        Sistema.UsaPlanoPatro, //bUsaPlanoPatro
        false, //bContabiliza
        idblkNovoPortForma, //iCodPortForma,
        0, //iDiasFloat
        '', //sContaBaixa
        0 //liSubContaBaixa
        );

      CtrlDocumento.Rateiodocum.SetValues(
        valor, //rValor,
        0, //rValorOM,
        0, //rVlrresorcamen: Double;
        0, //liIdrateiodocum,
        Sistema.Idempresa, //liIdpessoa,
        icodlanccapcar, //licoddocumento
        iUnidNegoc, //liUnidnegoc,
        0, //liMoecodigo,
        Sistema.Idusuario, //liIdusuarioinclusao,
        0, //liIdreservaorcamen,
        Integraback.Plano, //liPlano,
        lIdPlanoprev, //liIdplanoprev,
        lIdPatro, //liIdpatro,
        SistemaFolha.IdProgramaFolha, //liIdprograma,
        0, //liIdprocesso,
        Sistema.idempresa, //liIdempresa
        sTipRecDes, //sCodtiprecdes,
        recpag, //sRecpag,
        sCentroRespon, //sCodcentrorespon,
        SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
        '' //sNumimovel
        );

      if not CtrlDocumento.Insert then
      begin
        frameProgresso.ExibeMensagem('Erro ao criar documento.');
        frameProgresso.ExibeMensagem('Favorecido:'+inttostr(iidPessoa));
        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+inttostr(idblkNovoPortForma));
        frameProgresso.ExibeMensagem(CtrlDocumento.MessageInfo);
        Result:=false;
      end;
    except
      on E:Exception do
      begin
        frameProgresso.ExibeMensagem('Erro ao criar documento.');
        frameProgresso.ExibeMensagem('Favorecido:'+inttostr(iidPessoa));
        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+inttostr(idblkNovoPortForma));
        frameProgresso.ExibeMensagem('Mensagem de erro : '+E.Message);
        Result:=false;
      end;
    end;
  end;
end;

function TfrmEstornaFolha.GeraAlterador: boolean;
Var sSQL, sHistorico, sEventoDocum : String;
    iNumLancto : Integer;
begin
  {Criação de alterador para o documento original - documento está em aberto}
  try
    If Not bDocIndividual Then 
    Begin
      sEventoDocum := 'Evento de estorno da ' + edNome.Text +
                      '(' + edTipoPessoa.Text + ') ' + 
                       ' no valor de R$ ';

      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      CtrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario:=Sistema.IdUsuario;
      CtrlDocumento.CodDocumento := qryCap.FieldByName('CODDOCUMENTO').AsInteger;

      // Grava Documento
      sSQL := ' SELECT CODDOCUMENTO, IDPESSOA, CODPORTFORMA, PLANO, PLACONTA, IDEMPRESA, ' + #13 +
              '        IDFORCLI, IDMODULO, CODTIPDOC, RECPAG, NODOCUMENTO, DATAEMISSAO, ' + #13 +
              '        DATAVENCTO, DATAPROGRAMADA, STATUS, OPERACAO, IDUSUARIOINCLUSAO, ' + #13 +
              '        CODFORMA, DATADISPONIB, IDPROCESSO ' + #13 +
              ' FROM DOCUMENTO  ' + #13 +
              ' WHERE CODDOCUMENTO = ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger );

      qryEstorno.Close;
      qryEstorno.SQL.Clear;
      qryEstorno.SQL.Add(sSQL);
      qryEstorno.Open; 

      CtrlDocumento.SetValues(
            qryEstorno.FieldByName('CODDOCUMENTO').AsInteger,      //licoddocumento
            qryEstorno.FieldByName('NODOCUMENTO').AsFloat,         //rnodocumento
            '',                                                    //scompldocumento
            qryEstorno.FieldByName('STATUS').AsString,             // sStatus
            qryEstorno.FieldByName('RECPAG').AsString,             // recpag
            qryEstorno.FieldByName('OPERACAO').AsString,           // sOperacao
            '',                                                    //sNumslip,
            '',                                                    //sNumleitcodbarras,
            qryEstorno.FieldByName('PLACONTA').AsString,           //sPlaconta,
            '',                                                    //sCodcentrocusto,
            '',                                                    //sNossonumero,
            '',                                                    //sNumdigcodbarras,
            '',                                                    //sGrupodoc,
            '',                                                    //sFlgemitelancbaix,
            '',                                                    //sFlgconfirmarecpag,
            '',                                                    //sEmisbloq,
            '',                                                    //sReferencia,
            '',                                                    //sObs
            qryEstorno.FieldByName('DATAVENCTO').AsDateTime,       //dDatavencto,
            qryEstorno.FieldByName('DATAEMISSAO').AsDateTime,      //dDataemissao,
            qryEstorno.FieldByName('DATAPROGRAMADA').AsDateTime,   //dDataprogramada,
            0,                                                     //dDataremessa,
            0,                                                     //dDatalimite,      
            0,                                                     //dDatacorrecao,
            0,                                                     //rVlrmulta,
            0,                                                     //rValorjuros,
            0,                                                     //rValordesconto,
            0,                                                     //rPercjurossimples,
            0,                                                     //rPercjurosatuarial
            qryEstorno.FieldByName('CODTIPDOC').AsInteger,         //liCodtipdoc,
            qryEstorno.FieldByName('IDPESSOA').AsInteger,          //liIdpessoa,
            qryEstorno.FieldByName('IDMODULO').AsInteger,          //liIdmodulo,
            qryEstorno.FieldByName('IDFORCLI').AsInteger,          //liIdforcli,
            0,                                                     //liNumfatura,
            0,                                                     //liIdcbancaria,
            0,                                                     //liUnidnegoc,
            qryEstorno.FieldByName('PLANO').AsInteger,             //liPlano,
            0,                                                     //liNumcpbaixa,
            0,                                                     //liNumapgr,
            0,                                                     //liMoecodigo,
            0,                                                     //liLotetransmissao,
            0,                                                     //liIndicecorrecao,
            qryEstorno.FieldByName('IDUSUARIOINCLUSAO').AsInteger, //liIdusuarioinclusao,
            qryEstorno.FieldByName('IDEMPRESA').AsInteger,         //liIdempresa,
            0,                                                     //liFlgnaoconciliado,
            0,                                                     //liControleremessa,
            0,                                                     //liCodsubconta,
            qryEstorno.FieldByName('CODPORTFORMA').AsInteger,      //liCodportforma,
            0,                                                     //liCodgrupocnab,
            0,                                                     //liCodgeradorinss,
            qryEstorno.FieldByName('CODFORMA').AsInteger );        //liCodforma

      // Grava a LanctoDocum
      sSQL := ' SELECT NUMLANCTO, HISTORICOCOMPL FROM LANCTODOCUM ' + #13 +
              ' WHERE CODDOCUMENTO = ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger );

      qryEstorno.Close;
      qryEstorno.SQL.Clear;
      qryEstorno.SQL.Add(sSQL);
      qryEstorno.Open;

      iNumLancto := qryEstorno.FieldByName('NUMLANCTO').AsInteger;
      sHistorico := qryEstorno.FieldByName('HISTORICOCOMPL').AsString;

      sSQL := ' SELECT SUM(DECODE(HRS.FLGDESCONTO,0,HRS.VALORPROVENTO,1,-HRS.VALORPROVENTO,0)) AS VALOR, ' + #13 +
              '        HFB.PLNCODIGO, HRS.CODDOCUMENTO  ' + #13 +
              ' FROM HISTRUBSAL HRS, HSTFOLHABENEF HFB ' + #13 +
              ' WHERE HRS.IDHSTFOLHABENEF = HFB.IDHSTFOLHABENEF ' + #13 +
              '   AND HRS.CODDOCUMENTO    = ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) + #13 +
              '   AND HRS.FLGESTORNO      = 0 ' + #13 +
              '   AND HRS.IDHSTFOLHABENEF = ' + IntToStr( lidVersao ) + #13 +
              ' GROUP BY HFB.PLNCODIGO, HRS.CODDOCUMENTO ';

      qryEstorno.Close;
      qryEstorno.SQL.Clear;
      qryEstorno.SQL.Add(sSQL);
      qryEstorno.Open;

      sEventoDocum := sEventoDocum + FormatFloat( '#,###,###,###,##0.00' , qryEstorno.FieldByName('VALOR').AsFloat );  

      CtrlDocumento.Lanctodocum.SetValues(
        dtEvento.Date,                                    // dDatalancto
        qryEstorno.FieldByName('CODDOCUMENTO').AsInteger, // liCoddocumento,
        iNumLancto,                                       // liNumlancto
        qryEstorno.FieldByName('VALOR').AsFloat,          // rVlrliquido,
        0,                                                // rValorOM
        qryEstorno.FieldByName('VALOR').AsFloat,          // rValor
        prmUnidNegoc,                                     // liUnidnegoc,
        qryEstorno.FieldByName('PLNCODIGO').AsInteger,    // liPlncodigo
        0,                                                // liNumlotemanual,
        Sistema.Idusuario,                                // liIdusuarioinclusao,
        Sistema.IdEmpresa,                                // liIdempresa,
        0,                                                // liIdnflivro,
        0,                                                // liEstorno,
        0,                                                // liCodtipdoc,
        0,                                                // liCoddocinss,
        0,                                                // liCodalterador
        '2',                                              // sOperacao,
        '',                                               // sNumrecibo,
        '',                                               // sNumnf,
        '',                                               // sNumfatura,
        Copy(sHistorico,1,60),                            // sHistoricocompl,
        '',                                               // sFlgtipofatura,
        '',                                               // sFlgrecebeunf,
        '',                                               // sFlgfatemitida,
        'C',                                              // sDebcre
        Sistema.IdModulo,                                 // liIdModulo
        IntegraBack.Plano,                                // liPlanoConta
        True,                                             // bUsaPlanoPatro
        False,                                            // bContabiliza
        0,                                                // iCodPortForma,
        0,                                                // iDiasFloat
        '',                                               // splacontabaixa, //sContaBaixa 
        0 );                                              // liSubContaBaixa

      // Grava a RateioDocum
      sSQL := ' SELECT SUM(DECODE(H.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR, ' + #13 +
              '        H.IDPATRO, H.IDPLANOCONTABIL, H.CODTIPRECDES, ' + #13 +
              '        H.CODCENTRORESPON, H.UNIDNEGOC ' + #13 +
              ' FROM HISTRUBSAL H ' + #13 +
              ' WHERE CODDOCUMENTO    = ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) + #13 +
              '   AND FLGESTORNO      = 0 ' + #13 +
              '   AND IDHSTFOLHABENEF = ' + IntToStr( lidVersao ) + #13 +
              '   AND H.FLGESPECIAL = 0      ' + #13 +
              '   AND H.FLGDESCONTO IN (0,1) '  + #13 +
              ' GROUP BY H.IDPATRO, H.IDPLANOCONTABIL, H.CODTIPRECDES, ' + #13 +
              '          H.CODCENTRORESPON, H.UNIDNEGOC ';

      qryEstorno.Close;
      qryEstorno.SQL.Clear;
      qryEstorno.SQL.Add(sSQL);
      qryEstorno.Open;

      While Not qryEstorno.EOF do
      Begin
        ctrlDocumento.RateioDocum.SetValues(
          qryEstorno.fieldbyname('VALOR').AsFloat,             // rvalor,
          0,                                                   // rvalorom,
          0,                                                   // rvlrresorcamen:
          0,                                                   // liidrateiodocum,
          Sistema.IdEmpresa,                                   // liidpessoa,
          qryCap.FieldByName('CODDOCUMENTO').AsInteger,        // licoddocumento,
          qryEstorno.FieldByName('UNIDNEGOC').AsInteger,       // liunidnegoc,
          0,                                                   // limoecodigo,
          Sistema.IdUsuario,                                   // liidusuarioinclusao,
          0,                                                   // liidreservaorcamen,
          IntegraBack.Plano,                                   // liplano,
          qryEstorno.FieldByName('IDPLANOCONTABIL').AsInteger, // liidplanoprev,
          qryEstorno.FieldByName('IDPATRO').AsInteger,         // liidpatro,
          SistemaFolha.IdProgramaFolha,                        // liidprograma,
          0,                                                   // liidprocesso,
          Sistema.IdEmpresa,                                   // liidempresa
          qryEstorno.FieldByName('CODTIPRECDES').AsString,     // scodtiprecdes,
          'P',                                                 // srecpag,
          qryEstorno.FieldByName('CODCENTRORESPON').AsString,  // scodcentrorespon,
          SistemaFolha.CodCCustoFinan,                         // scodcentrocusto,
          '' );

          qryEstorno.Next;
      End;

      // Grava a CCBaixaXDocum
      sSQL := ' SELECT SUM(DECODE(FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR, ' + #13 +
              '        UNIDNEGOC, IDPLANOCONTABIL, IDPATRO, ' + #13 +
              '        TRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD)) AS PLACONTA ' + #13 +
              ' FROM HISTRUBSAL H ' + #13 +
              ' WHERE CODDOCUMENTO    = ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) + #13 +
              '   AND FLGESTORNO      = 0 ' + #13 +
              '   AND IDHSTFOLHABENEF = ' + IntToStr( lidVersao ) + #13 +
              '   AND H.FLGESPECIAL = 0      ' + #13 +
              '   AND H.FLGDESCONTO IN (0,1) '  + #13 +
              ' GROUP BY UNIDNEGOC, IDPLANOCONTABIL, IDPATRO, ' + #13 +
              '          TRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD)) ';

      qryEstorno.Close;
      qryEstorno.SQL.Clear;
      qryEstorno.SQL.Add(sSQL);
      qryEstorno.Open;

      While Not qryEstorno.EOF do
      Begin
        ctrlDocumento.CCBaixasxDocum.SetValues(
          qryEstorno.FieldByName('VALOR').AsFloat,             // rvalor,
          0,                                                   // liidccbaixasxdocum,
          Sistema.IdEmpresa,                                   // liidpessoa,
          qryCap.FieldByName('CODDOCUMENTO').AsInteger,        // licoddocumento,
          qryEstorno.FieldByName('UNIDNEGOC').AsInteger,       // liunidnegoc,
          IntegraBack.Plano,                                   // liplano,
          qryEstorno.FieldByName('IDPLANOCONTABIL').AsInteger, // liidplanoprev,
          qryEstorno.FieldByName('IDPATRO').AsInteger,         // liidpatro,
          -1,                                                  // liidsegregacriter,
          qryEstorno.FieldByName('PLACONTA').AsString );       // splaconta

        qryEstorno.Next;
      End;

      If Not CtrlDocumento.Update then
      Begin
        frameProgresso.ExibeMensagem( 'Erro ao criar ao recriar o documento. ');
        frameProgresso.ExibeMensagem( 'Código do Documento:'+inttostr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Contas Caixa x Forma Pagto:' + inttostr( qryCap.FieldByName('CODPORTFORMA').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Tipo de Evento:' + dblkTipoEvento.LookupValue );
        frameProgresso.ExibeMensagem( 'Mensagem de erro : ' + CtrlDocumento.MessageInfo );
        result:=false;
        Exit;
      End
      Else
        Result := True;

      If Result Then
      Begin
        sSQL := ' INSERT INTO EVENTOXDOCUM  ' + #13 +
                '     (IDEVENTOXDOCUM, IDTIPOEVENTODOCUM, IDUSUARIO, CODDOCUMENTO, DESCRICAO, DATAEVENTO) ' + #13 +
                ' VALUES ' + #13 +
                '     ( ' + IntToStr( LeUltRegistro (nil,'EVENTOXDOCUM') ) + ', ' + #13 +                                    // IDEVENTOXDOCUM
                  '       ' + dblkTipoEvento.LookupValue + ', ' + #13 +                                              // IDTIPOEVENTODOCUM
                '       ' + IntToStr( Sistema.IdUsuario ) + ', ' + #13 +                                                     // IDUSUARIO
                '       ' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) + ', ' + #13 +                          // CODDOCUMENTO
                '       ' + QuotedStr( sEventoDocum ) + ', ' + #13 +                                                         // DESCRICAO
                  '       TO_DATE(' + QuotedStr( FormatDateTime('dd/mm/yyyy', dtEvento.Date ) ) +  ', ''dd/mm/yyyy'' ) ) '; // DATAEVENTO

        If Not ExecutarQuery( qryEstorno, sSQL ) then
        Begin
          frameProgresso.ExibeMensagem( 'Erro ao gravar o evento do estorno' );
          Result := False;
        End
        Else
        Begin
          Result := True;
        End;
      End;
    End
    Else
    Begin
      CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario := Sistema.IdUsuario;
      CtrlDocumento.Lanctodocum.SetValues(
        StrToDate(dtAlterador.Text),                    // dDatalancto
        qryCap.FieldByName('CODDOCUMENTO').AsInteger,   // licoddocumento
        0,                                              // liNumlancto
        dvalor,                                         // rVlrliquido,
        0,                                              // rValorOM
        dvalor,                                         // rValor
        prmUnidNegoc, //-1,                             // liUnidnegoc,  
        lPlnCodigo,                                     // liPlncodigo
        0,                                              // liNumlotemanual,
        Sistema.Idusuario,                              // liIdusuarioinclusao,
        Sistema.IdEmpresa,                              // liIdempresa,
        0,                                              // liIdnflivro,
        0,                                              // liEstorno,
        0,                                              // liCodtipdoc,
        0,                                              // liCoddocinss,
        strtoint(dblkAlteradorCAPOriginal.LookupValue), // liCodalterador
        '4',                                            // sOperacao,
        '',                                             // sNumrecibo,
        '',                                             // sNumnf,
        '',                                             // sNumfatura,
        copy(mmMotivo.Text,1,60),                       // sHistoricocompl,
        '',                                             // sFlgtipofatura,
        '',                                             // sFlgrecebeunf,
        '',                                             // sFlgfatemitida,
        'D',                                            // sDebcre
        Sistema.idmodulo,                               // liIdModulo
        IntegraBack.Plano,                              // liPlanoConta
        Sistema.UsaPlanoPatro,                          // bUsaPlanoPatro
        false,                                          // bContabiliza
        qryCap.FieldByName('CODPORTFORMA').AsInteger,   // iCodPortForma,
        0,                                              // iDiasFloat
        '',                                             // sContaBaixa
        0 );                                            // liSubContaBaixa

      If Not CtrlDocumento.Insert Then
      Begin
        frameProgresso.ExibeMensagem( 'Erro ao criar alterador para documento.' );
        frameProgresso.ExibeMensagem( 'Código do Documento:' + IntToStr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Contas Caixa x Forma Pagto:' + IntToStr( qryCap.FieldByName('CODPORTFORMA').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Alterador:' + dblkAlteradorCAPOriginal.LookupValue );
        frameProgresso.ExibeMensagem( CtrlDocumento.MessageInfo );
        Result:=false;
      End
      Else
        Result := True;
    End;
  Except
    on E:Exception do
    Begin
      If bDocIndividual Then
      Begin
        frameProgresso.ExibeMensagem( 'Erro ao criar alterador para documento. ');
        frameProgresso.ExibeMensagem( 'Código do Documento:' + inttostr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Contas Caixa x Forma Pagto:' + inttostr( qryCap.FieldByName('CODPORTFORMA').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Alterador:' + dblkAlteradorCAPOriginal.LookupValue );
        frameProgresso.ExibeMensagem( 'Mensagem de erro : ' + E.Message );
        result:=false;
      End
      Else
      Begin
        frameProgresso.ExibeMensagem( 'Erro ao criar ao recriar o documento. ');
        frameProgresso.ExibeMensagem( 'Código do Documento:' + inttostr( qryCap.FieldByName('CODDOCUMENTO').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Contas Caixa x Forma Pagto:' + inttostr( qryCap.FieldByName('CODPORTFORMA').AsInteger ) );
        frameProgresso.ExibeMensagem( 'Tipo de Evento:' + dblkTipoEvento.LookupValue );
        frameProgresso.ExibeMensagem( 'Mensagem de erro : ' + E.Message );
        result:=false;
      End;
    End;
  End;
end;

function TfrmEstornaFolha.GeraCAP(var lCodLancCAPCAR, lNumLancto : longint): boolean;
 var ssql, sNoDocumento, sContaDeb, sContaCred: string;
begin
  result:=false;

  ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
  ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
  ctrlDocumento.IdUsuario:=Sistema.IdUsuario;

  //pegar a conta liquido vinculada ao beneficiario
  VerificaFornec(lidRecebedor);

  lCodLancCAPCAR:=Ctrldocumento.GetSequenceDocumento;
  sNoDocumento:=inttostr(lCodLancCAPCAR);

  if not LancaDoc(lCodLancCAPCAR,
           -1, //NÃO VINCULAR PLANILHA ORIGINAL AO NOVO DOCUMENTO A PAGAR
           lidRecebedor,
           StrtoInt(dblkNovoPortForma.LookupValue), StrtoInt(dblkUnidNegoc.LookupValue),
           qryTipoDocCAP.fieldbyname('CODTIPDOC').asinteger,
           DateToStr(StrToDate(dtenvioCAP.text)), DateToStr(StrToDate(dtvenctoCAP.Text)),
           sNoDocumento, dblkFolha.Text, dblkTipoDesemb.LookupValue,
           dblkCentRespon.LookupValue,
           sContaLiquido, 
           'P', dvalor,
           qryPortPagamento.fieldbyname('CODFORMA').asinteger 
           ) then
  begin
    frameProgresso.ExibeMensagem('Erro na criação do Novo Contas a Pagar.');
    exit;
  end;

  if dblkAlteradorUmParticip.LookupValue <> ''  then
  begin
    if EditVlAlterador.Value = 0 then
    begin
      frameProgresso.ExibeMensagem('Valor do alterador do novo contas a pagar não pode ser zero.');
      exit;
    end;

    try
      {Incluir alterador no novo Contas a Pagar}
      if qryAlterador.FieldByName('ACRESDECRES').AsString = 'C' then
      begin
        sContaDeb:=qryAlterador.FieldByName('PLACONTA').AsString; {conta do alterador}
        //pegar a conta liquido vinculada ao beneficiario
        sContaCred:=sContaLiquido;
      end
      else
      begin
        sContaCred:=qryAlterador.FieldByName('PLACONTA').AsString; {conta do alterador}
        //pegar a conta liquido vinculada ao beneficiario
        sContaDeb:=sContaLiquido;
      end;

      CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
      CtrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario:=Sistema.IdUsuario;
      CtrlDocumento.Lanctodocum.SetValues(
        StrToDate(dtenvioCAP.text), //dDatalancto
        lCodLancCAPCAR, //licoddocumento
        0, //liNumlancto
        EditVlAlterador.Value, //rVlrliquido,
        0, //rValorOM
        EditVlAlterador.Value, //rValor
        prmUnidNegoc, //-1, //liUnidnegoc, 
        -1, //liPlncodigo //NÃO VINCULAR PLANILHA ORIGINAL AO NOVO DOCUMENTO A PAGAR
        0, //liNumlotemanual,
        Sistema.Idusuario, //liIdusuarioinclusao,
        Sistema.IdEmpresa, //liIdempresa,
        0, //liIdnflivro,
        0, //liEstorno,
        0, //liCodtipdoc,
        0, //liCoddocinss,
        StrtoInt(dblkAlteradorUmParticip.LookupValue), //liCodalterador
        '4', //sOperacao,
        '', //sNumrecibo,
        '', //sNumnf,
        '', //sNumfatura,
        copy(mmMotivo.Text, 1, 60), //sHistoricocompl,
        '', //sFlgtipofatura,
        '', //sFlgrecebeunf,
        '', //sFlgfatemitida,
        'C', //sDebcre
        Sistema.idmodulo, //liIdModulo
        IntegraBack.Plano, //liPlanoConta
        Sistema.UsaPlanoPatro, //bUsaPlanoPatro
        true, //bContabiliza
        StrtoInt(dblkNovoPortForma.LookupValue), //iCodPortForma,
        0, //iDiasFloat
        '', //sContaBaixa
        0 //liSubContaBaixa
        );

      if not CtrlDocumento.Insert then
      begin
        frameProgresso.ExibeMensagem('Erro ao criar alterador para documento.');
        frameProgresso.ExibeMensagem('Código do Documento:'+inttostr(lCodLancCAPCAR));
        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+dblkNovoPortForma.LookupValue);
        frameProgresso.ExibeMensagem('Alterador:'+dblkAlteradorUmParticip.LookupValue);
        frameProgresso.ExibeMensagem(CtrlDocumento.MessageInfo);
        exit;
      end;
    except
      on E:Exception do
      begin
        frameProgresso.ExibeMensagem('Erro ao criar alterador para documento.');
        frameProgresso.ExibeMensagem('Código do Documento:'+inttostr(lCodLancCAPCAR));
        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+dblkNovoPortForma.LookupValue);
        frameProgresso.ExibeMensagem('Alterador:'+dblkAlteradorUmParticip.LookupValue);
        frameProgresso.ExibeMensagem('Mensagem de erro : '+E.Message);
        exit;
      end;
    end;
  end;

  //Grava CÓDIGO DO DOCUMENTO na tabela de MotivoEstornoFB
  ssql:='UPDATE MOTIVOESTORNOFB '+
        'SET CODDOCUMENTOCAR = '+inttostr(lCodLancCAPCAR)+' '+
        'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+
        'AND IDPESSJUR = '+inttostr(lidPatro)+' '+
        'AND IDPLANOPREV = '+inttostr(lidPlanoPrev)+' '+
        'AND IDTITULAR = '+inttostr(lidTitular)+' '+
        'AND IDRECEBEDOR = '+inttostr(lidRecebedor)+' '+
        'AND TIPOESTORNO = '+inttostr(ioperacao)+' ';
  if not ExecutarQuery(qryAux, ssql) then
    frameProgresso.ExibeMensagem('Erro ao gravar código do documento do estorno')
  else
    result:=true;
end;

function TfrmEstornaFolha.GeraCAR(
           aiplnestorno: integer 
           ): boolean;
 var ssql, sNoDocumento: string;
     lCodLancCAPCAR: longint;
begin
  {Criação de Contas a Receber - o documento original já foi baixado}
  result:=false;
  if lIdPagador = 0 then
  begin
    frameProgresso.ExibeMensagem('Erro na criação do Contas a Receber novo - Pagador não identificado');
    exit;
  end;

  ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
  ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
  ctrlDocumento.IdUsuario:=Sistema.IdUsuario;

  //pegar a conta liquido vinculada ao beneficiario
  VerificaCliente(lIdPagador);

  lCodLancCAPCAR:=Ctrldocumento.GetSequenceDocumento;
  sNoDocumento:=inttostr(lCodLancCAPCAR);

  if not LancaDoc(lCodLancCAPCAR, aiplnestorno, lIdPagador,
           StrtoInt(dblkCARPortadorForma.LookupValue),
           StrtoInt(dblkCARUnidNegoc.LookupValue),
           qryTipoDocCAR.fieldbyname('CODTIPDOC').asinteger,
           DateToStr(StrToDate(dtLanctoCAR.text)),
           DateToStr(StrToDate(dtVenctoCAR.Text)), sNoDocumento, dblkFolha.Text,
           dblkCARTipoRecebimento.LookupValue, dblkCARCentroRespon.LookupValue,
           sContaLiquido, 
           'R', dvalor,
           qryPortRecebimento.fieldbyname('CODFORMA').asinteger 
           ) then
  begin
    frameProgresso.ExibeMensagem('Erro na criação do Contas a Receber');
    exit;
  end;

  //Grava CÓDIGO DO DOCUMENTO na tabela de MotivoEstornoFB
  ssql:='UPDATE MOTIVOESTORNOFB '+
        'SET CODDOCUMENTOCAR = '+inttostr(lCodLancCAPCAR)+' '+
        'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+
        'AND IDPESSJUR = '+inttostr(lidPatro)+' '+
        'AND IDPLANOPREV = '+inttostr(lidPlanoPrev)+' '+
        'AND IDTITULAR = '+inttostr(lidTitular)+' '+
        'AND IDRECEBEDOR = '+inttostr(lidRecebedor)+' '+
        'AND TIPOESTORNO = '+inttostr(ioperacao)+' ';
  if not ExecutarQuery(qryAux, ssql) then
    frameProgresso.ExibeMensagem('Erro ao gravar código do documento do estorno')
  else
    result:=true;
end;

function TfrmEstornaFolha.GravaMotivoEstorno: boolean;
 var ssql : string;
     iIdMotivoEstorno : Integer;
begin
  result:=false;
  frameProgresso.ResetaFrame(1, 1);
  frameProgresso.MarcaInicioFase('Gravando motivo do Estorno [MOTIVOESTORNOFB]');
  iIdMotivoEstorno := LeUltRegistro(Nil,'MOTIVOESTORNOFB');
  ssql:='INSERT INTO MOTIVOESTORNOFB '+
      '(IDMOTIVOESTORNOFB, IDHSTFOLHABENEF, IDPESSJUR, IDPLANOPREV, IDTITULAR, '+
       ' IDRECEBEDOR, TIPOESTORNO, DATAESTORNO, IDUSUARIO, MOTIVO) VALUES ('+
       IntToStr(iIdMotivoEstorno)+','+
       inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+',';
  ssql:=ssql+inttostr(lidPatro)+',';
  ssql:=ssql+inttostr(lidPlanoPrev)+',';
  ssql:=ssql+inttostr(lidTitular)+',';
  ssql:=ssql+inttostr(lidRecebedor)+',';
  ssql:=ssql+inttostr(ioperacao)+','+
       'TO_DATE('+QuotedStr(formatdatetime('dd/mm/yyyy',Now))+',''DD/MM/YYYY''),'+
       inttostr(Sistema.Idusuario)+','+
       QuotedStr(mmMotivo.text)+')';
  if not ExecutarQuery(qryAux, ssql) then
    frameProgresso.ExibeMensagem('Erro ao gravar motivo do estorno')
  else
    result:=true;

  frameProgresso.Passo;
  frameProgresso.MarcaFinalFase('Gravando motivo do Estorno [MOTIVOESTORNOFB]');
end;

function TfrmEstornaFolha.ProcessaCompensacao: boolean;
 var ssql,ssql1 : string;
begin
  result:=false;
  if (prmIDRUBIRRFCOMPIR > 0) then
  begin
    frameProgresso.ResetaFrame(1, 1);
    frameProgresso.MarcaInicioFase('Processando acerto do valor de compensação de IRRF.');

    ssql:=
      'SELECT '+
      '  IDPESSOA, '+
      '  IDRESPONSAVEL, '+
      '  IDTITULAR, '+
      '  VALORINFO, '+
      '  VALORPROVENTO, '+ 
      '  MESCOBRANCA '+
      'FROM HISTRUBSAL '+
          'WHERE (IDRUBRICA = '+inttostr(prmIDRUBIRRFCOMPIR)+') '+
          'AND (IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+') ';

    if ioperacao > 10 then
      ssql:=ssql+'AND (IDTITULAR = '+inttostr(lidtitular)+') '+
                 'AND (IDRESPONSAVEL = '+inttostr(lidRecebedor)+') ';

    if FazQuery(qryAux, ssql) then
    begin
        // Exclui a linha inserida no mes em questão
        qryAlteraCompIRRF.close;
        qryAlteraCompIRRF.sql.clear;
        ssql1 := ' DELETE HSTCOMPENSAIRRF WHERE '+
                 ' IDPESSOA = '+ Inttostr(qryAux.fieldbyname('IDTITULAR').asInteger) + ' AND ' +
                 ' MESREF = '+ QuotedStr(qryAux.fieldbyname('MESCOBRANCA').asString);
        qryAlteraCompIRRF.SQL.add(ssql1);
        try
          qryAlteraCompIRRF.execsql;
        except
          frameProgresso.ExibeMensagem('Erro ao excluir registro de detalhe na tabela de historico de compensação de IRRF');
          exit;
        end;
        // Acerta o Saldo
        qryAlteraCompIRRF.close;
        qryAlteraCompIRRF.sql.clear;
        ssql1 := ' UPDATE COMPENSAIRRF ' +
                 ' SET SALDOCOMP = SALDOCOMP - ' +
                    OraNumero(FloattoStr(qryAux.fieldbyname('VALORPROVENTO').asFloat))+
                 ' WHERE IDPESSOA = '+ Inttostr(qryAux.fieldbyname('IDTITULAR').asInteger);
        qryAlteraCompIRRF.SQL.add(ssql1);
        try
          qryAlteraCompIRRF.execsql;
        except
          frameProgresso.ExibeMensagem('Erro ao atualizar o saldo do IRRF a compensar ');
          exit;
        end;
    end;
    frameProgresso.Passo;
    frameProgresso.MarcaInicioFase('Acerto do valor de compensação de IRRF realizado com sucesso.');
  end;
  result:=true;
end;

//Marcio Denilson - SOL 136569 - KINTANA 820997
function TfrmEstornaFolha.Exec_SP_ExcessoDebito(iLote: Integer; sMes,sDataInicio, sDataProgramada: String): String;
Var
   SP_ERRO,SP_LOG: String;
   SP_PROC: TStoredProc;
Begin
   Try
      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName := 'BaseDados';

      SP_PROC.StoredProcName := 'CM.SP_FB_EXCESSODEBITO_ESTORNAR';   //SP_FB_CONTROLEEXCESSODEBITO

      SP_PROC.Params.CreateParam(ftInteger, 'pIDLOTE', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pMES', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pDATA_INICIO', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pDATA_PROGRAMADA', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pOutERRO', ptOutput);
      SP_PROC.Params.CreateParam(ftString, 'pOutLOG', ptOutput);

      SP_PROC.ParamByName('pIDLOTE').AsInteger          := iLote;
      SP_PROC.ParamByName('pMES').AsString              := sMes;
      SP_PROC.ParamByName('pDATA_INICIO').AsString      := sDataInicio;
      SP_PROC.ParamByName('pDATA_PROGRAMADA').AsString  := sDataProgramada;

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      SP_ERRO := SP_PROC.ParamByName('pOutERRO').AsString;
      SP_LOG  := SP_PROC.ParamByName('pOutLOG').AsString;

      SP_PROC.Close;

      frameProgresso.ExibeMensagem('LOG EXECUÇAO PROCEDURE:' + SP_LOG);

      Result := SP_ERRO;

   Finally
      FreeAndNil(SP_PROC);
   End;
end;
// FIM


function TfrmEstornaFolha.DesfazRubricaIndividual(bcompleto: boolean;
  aidtitular, aidrecebedor: integer;iTipoFolha : integer = 0): boolean;
 var ssql, sMes, sERRO_EXEC_SP: string;
     {iMes, iAno,} lcont: integer;
begin
  result:=false;
  //  ROTINA REESCRITA PARA QUE O LAÇO PRINCIPAL SEJA DOS REGISTROS NA HISTRUBSAL

  //Marcio Denilson - SOL 136569 - KINTANA 820997

   sERRO_EXEC_SP := '';
   // As rubricas inseridas não estavam sendo deletadas, o acerto foi inclido na procedure de excesso de debito
   sERRO_EXEC_SP := Self.Exec_SP_ExcessoDebito( qryHist.fieldbyname('IDHSTFOLHABENEF').asinteger
                                                ,qryHist.fieldbyname('MESREFERENCIA').asstring
                                                ,qryHist.fieldbyname('DATAPREVPAGTO').asstring
                                                ,qryHist.fieldbyname('DATAPREVPAGTO').asstring );

   if trim(sERRO_EXEC_SP) <> '' then
      frameProgresso.ExibeMensagem('Erro ao atualizar Rubrica Individual: ('+sERRO_EXEC_SP+')');

   frameProgresso.MarcaFinalFase('Término atualização das rubricas alteradas pelo excesso de débito [RUBRICAINDIV]');

  // FIM - SOL 136569 - KINTANA 820997


  if iTipoFolha = 2 then begin
    ssql:=

    'SELECT COUNT(r.idrubrica) QUANT, H.IDTITULAR, H.IDRESPONSAVEL, R.IDRUBRICA, '+_clinefeed+
    '   R.IDSEQINTERNOFB AS SEQORIGINAL, R.NUMOCORRENCIAS '+_clinefeed+ //Renato Visoni SOL 124945 KINTANA 639847
    ' FROM RUBRICAINDIV R, histrubsal h, hstfolhabenef HS '+_clinefeed+
    ' WHERE H.IDRESPONSAVEL = R.IDPESSOA '+_clinefeed+
    '  AND H.IDTITULAR = R.IDTITULAR '+_clinefeed+
    '  AND h.idhstfolhabenef = hs.idhstfolhabenef '+_clinefeed+
    '  AND H.IDPLANOCONTABIL = R.IDPLANOCONTABIL '+_clinefeed+
    '  AND h.idhstfolhabenef = '+IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger)+' '+_clinefeed+
//    '  AND anomesref = mescobranca '+_clinefeed+    //Everson TIBERO
    '  AND R.anomesref = H.mescobranca '+_clinefeed+  //Everson TIBERO
    '  AND H.SEQORIGINAL =  R.IDSEQINTERNOFB '+_clinefeed+  //Renato Visoni SOL 143380 Kintana 943521
    '  AND hs.flgestado = 1 '+_clinefeed+
    '  AND FLGTPRUBMANUT = 1 '+_clinefeed;

     if not bcompleto then
      ssql:=ssql+
        'AND H.IDTITULAR = '+inttostr(lidtitular)+' '+_clinefeed+
        'AND H.IDRESPONSAVEL = '+inttostr(lidrecebedor)+_clinefeed;

      ssql :=ssql+ '  GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, R.IDRUBRICA, '+_clinefeed+
                   '         R.IDSEQINTERNOFB, R.NUMOCORRENCIAS '+_clinefeed; //Renato Visoni SOL 124945 KINTANA 639847

  end else begin
    ssql:=
      ' SELECT COUNT(*) AS QUANT, H.IDTITULAR, H.IDRESPONSAVEL, H.IDRUBRICA,'+_clinefeed+
      '       H.SEQORIGINAL, R.NUMOCORRENCIAS, R.ROWID, NVL(R.FLGCONTROLASALDO,0) AS FLGCONTROLASALDO '+_clinefeed+    //SIG49023 add campo rowid
      ' FROM HISTRUBSAL H, RUBRICAINDIV R '+_clinefeed+
      ' WHERE H.IDHSTFOLHABENEF = '+IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger)+' '+_clinefeed+
      ' AND H.FLGTIPODESC = ''Y'' '+_clinefeed+
      ' AND R.FLGTPRUBMANUT = ''1'' '+_clinefeed+
      ' AND H.IDTITULAR = R.IDTITULAR '+_clinefeed+
      ' AND H.IDRESPONSAVEL = R.IDPESSOA '+_clinefeed+
      ' AND H.SEQORIGINAL = R.IDSEQINTERNOFB '+_clinefeed+
      ' AND H.IDRUBRICA = R.IDRUBRICA '+_clinefeed;

    if not bcompleto then
      ssql:=ssql+
        ' AND H.IDTITULAR = '+inttostr(lidtitular)+' '+_clinefeed+
        ' AND H.IDRESPONSAVEL = '+inttostr(lidrecebedor)+_clinefeed;

    ssql:=ssql+
      ' GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, H.IDRUBRICA, '+_clinefeed+
      '         H.SEQORIGINAL, R.NUMOCORRENCIAS, R.ROWID, NVL(R.FLGCONTROLASALDO,0)  '+_clinefeed;
  end;


  if FazQuery(qryAux, ssql) then
  begin
    frameProgresso.ResetaFrame(1, qryAux.recordcount);
    frameProgresso.MarcaInicioFase('Atualizando Rubricas Individuais [RUBRICAINDIV]');
    while not qryAux.eof do
    begin
      lcont:=qryAux.fieldbyname('QUANT').asinteger;
      if (qryAux.fieldbyname('NUMOCORRENCIAS').asinteger-lcont <= 0) then
        lcont:=0
      else
        lcont:=qryAux.fieldbyname('NUMOCORRENCIAS').asinteger-lcont;

      //USAR ROTINA PARA PEGAR O MES ANTERIOR
      sMes:=SAnoMesAnterior(qryHist.FieldByname('MESREFERENCIA').AsString);


      if iTipoFolha = 2 then begin //Renato Visoni Sol 114975 Kintana 541732
        ssql:= ' DELETE FROM RUBRICAINDIV '+
               '  WHERE FLGTPRUBMANUT = ''1'' '+
               '  AND IDSEQINTERNOFB ='+qryAux.FieldByname('SEQORIGINAL').asString +
               '  AND IDTITULAR ='+qryAux.FieldByname('IDTITULAR').asString +
               '  AND IDPESSOA  ='+qryAux.FieldByname('IDRESPONSAVEL').asString +
               '  AND IDRUBRICA ='+qryAux.FieldByname('IDRUBRICA').asString ;

      end else begin
        // Renato Visoni Sol 114975 Kintana 541732
        //SIG49023 Inicio
        ssql:=  'select ri.ultmespreparo,' +_clinefeed+
                '       ri.numocorrencias,' +_clinefeed+
                '       ri.flgdesativado, ri.VLRTOTALPROC ' +_clinefeed+
                '  from previa p' +_clinefeed+
//                ' inner join log_planus_rubricaindiv ri' +_clinefeed+            SIG TIBERO
                ' inner join logplanus.log_planus_rubricaindiv ri' +_clinefeed+  //SIG TIBERO
                '    on (ri.idpessoa = p.idpessoa and ri.idtitular = p.idtitular and' +_clinefeed+
                '       ri.idrubrica = p.idrubrica)' +_clinefeed+
                ' where ri.trgdtalteracao > (select h.trgdtinclusao from hstfolhabenef h where h.idhstfolhabenef = '+IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger)+')' +_clinefeed+
                '   and p.IDLOTE in ( select IDLOTE from LOTEXHSTFOLHABENEF LH where LH.Idhstfolhabenef = '+qryHist.FieldByName('IDHSTFOLHABENEF').asString+')'+_clinefeed+
                '   and ri.rowidorigem = '+QuotedStr(qryAux.fieldbyname('ROWID').asstring) +_clinefeed+
                ' AND ri.IDSEQINTERNOFB = '+inttostr(qryAux.fieldbyname('SEQORIGINAL').asinteger)+' '+_clinefeed+
                ' AND ri.IDTITULAR = '+inttostr(qryAux.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
                ' AND ri.IDPESSOA = '+inttostr(qryAux.fieldbyname('IDRESPONSAVEL').asinteger)+' '+_clinefeed+
                ' AND ri.IDRUBRICA = '+inttostr(qryAux.fieldbyname('IDRUBRICA').asinteger)+' '+_clinefeed+
                ' order by ri.trgdtalteracao asc ';

        if FazQuery(qryAux1, ssql) then
        begin
              ssql:=' UPDATE RUBRICAINDIV  '+_clinefeed+
                    ' SET NUMOCORRENCIAS = ' + qryAux1.fieldbyname('NUMOCORRENCIAS').Asstring + ', ' +_clinefeed +
                        ' ULTMESPREPARO =  ' + QuotedStr(qryAux1.fieldbyname('ultmespreparo').Asstring) + ', ' +_clinefeed +  // Andre Imakawa - SIG 83911
                        ' FLGDESATIVADO =  ' + QuotedStr(qryAux1.fieldbyname('flgdesativado').Asstring) +_clinefeed;          // Andre Imakawa - SIG 83911

              if (qryAux.fieldbyname('FLGCONTROLASALDO').asinteger = 1) then
              begin
                    ssql:= ssql + ' , VLRTOTALPROC = '+qryAux1.fieldbyname('VLRTOTALPROC').AsString +_clinefeed;
              end;

              ssql:= ssql + ' WHERE FLGTPRUBMANUT = ''1'' '+_clinefeed+
                    ' AND IDSEQINTERNOFB = '+inttostr(qryAux.fieldbyname('SEQORIGINAL').asinteger)+' '+_clinefeed+
                    ' AND IDTITULAR = '+inttostr(qryAux.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
                    ' AND IDPESSOA = '+inttostr(qryAux.fieldbyname('IDRESPONSAVEL').asinteger)+' '+_clinefeed+
                    ' AND IDRUBRICA = '+inttostr(qryAux.fieldbyname('IDRUBRICA').asinteger)+' '+_clinefeed;
        end
        else
        begin // SIG49023 Final
              ssql:=' UPDATE RUBRICAINDIV  '+_clinefeed+
                    // SOL 197568 KTN 1893484 Otacilio ** Inicio **
                    ' SET NUMOCORRENCIAS = ' + inttostr(lcont) + ', ' +_clinefeed +
                        //' ULTMESPREPARO =  ' + QuotedStr(sMes) + _clinefeed + // SOL 255246 PPM 816785
                        ' ULTMESPREPARO =  NULL '+_clinefeed+      // SOL 255246 PPM 816785
                        //' FLGUSADO = NULL, '+_clinefeed+
                        //' VLRTOTALPROC = NULL'+_clinefeed+ //Renato Visoni SOL 124945 KINTANA 639847
                    // SOL 197568 KTN 1893484 Otacilio ** Fim **
                    ' WHERE FLGTPRUBMANUT = ''1'' '+_clinefeed+
                    ' AND IDSEQINTERNOFB = '+inttostr(qryAux.fieldbyname('SEQORIGINAL').asinteger)+' '+_clinefeed+
                    ' AND IDTITULAR = '+inttostr(qryAux.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
                    ' AND IDPESSOA = '+inttostr(qryAux.fieldbyname('IDRESPONSAVEL').asinteger)+' '+_clinefeed+
                    ' AND IDRUBRICA = '+inttostr(qryAux.fieldbyname('IDRUBRICA').asinteger)+' '+_clinefeed;
        end;  // SIG49023
        // FIM
        // FIM
      end;

      if not ExecutarQuery(qryAux1, ssql) then
        frameProgresso.ExibeMensagem('Erro ao atualizar Rubrica Individual: ('+
           'TITULAR='+inttostr(qryAux.fieldbyname('IDTITULAR').asinteger)+
           ';RESPONSAVEL='+inttostr(qryAux.fieldbyname('IDRESPONSAVEL').asinteger)+
           ';SEQINTERNOFB='+inttostr(qryAux.fieldbyname('SEQORIGINAL').asinteger)+
           ';IDRUBRICA='+inttostr(qryAux.fieldbyname('IDRUBRICA').asinteger));
      frameProgresso.Passo;
      qryAux.next;
    end;
    frameProgresso.MarcaFinalFase('Término atualização das Rubricas Individuais Temporárias [RUBRICAINDIV]');
  end;

  ssql:='WHERE FLGTPRUBMANUT = ''1'' '+
        'AND IDRUBRICA = '+inttostr(prmIDRUBARREDMESANT)+' '+
        'AND FLGPERMANENTE = 0 AND FLGUSADO = 0 '+
        'AND PARCELAS = 1 AND NUMOCORRENCIAS = 0 '+
        'AND ANOMESREF = '+QuotedStr(qryHist.fieldbyname('MESREFERENCIA').asstring)+' ';

  if not bcompleto then
    ssql:=ssql+'AND IDTITULAR = '+inttostr(lidtitular)+' '+
               'AND IDPESSOA = '+inttostr(lidrecebedor);

  if not frameProgresso.ProcessaQuery('RUBRICAINDIV',
           'DELETE FROM RUBRICAINDIV ', ssql,
           'Eliminando rubricas de compensação de arredondamento [RUBRICAINDIV]', -1) then
    exit;

  result:=true;
end;

//VERIFICAR SE TMPDESC FOI BAIXADA
function TfrmEstornaFolha.VerificaTmpDesc(asmes: string; aidversao, aidtitular,
  aidresponsavel: integer): boolean;
var ssql: string;
begin
  ssql:=
    'SELECT COUNT(*) '+_clinefeed+
    'FROM TMPDESC T '+_clinefeed+
    'WHERE T.MESCOBRANCA = '+quotedstr(asmes)+_clinefeed+
    'AND T.LOTEPREVIA IN '+_clinefeed+
    '  (SELECT L.IDLOTE '+_clinefeed+
    '   FROM LOTEXHSTFOLHABENEF L '+_clinefeed+
    '   WHERE L.IDHSTFOLHABENEF = '+inttostr(aidversao)+' '+_clinefeed+
    '   AND L.FLGTIPOLOTE = ''B'')'+_clinefeed+
    'AND T.SITENVIO NOT IN (''0'',''1'',''2'')'+_clinefeed;

  if (aidtitular <> 0) and (aidresponsavel <> 0) then
    ssql:=ssql+
     'AND T.IDTITULAR = '+inttostr(aidtitular)+' '+_clinefeed+
     'AND T.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA '+_clinefeed+
     '                   FROM BFCIARIOTITPLAN B '+_clinefeed+
     '                   WHERE B.IDRESPONSAVEL = '+inttostr(aidresponsavel)+' '+_clinefeed+
     '                   AND B.IDTITULAR = T.IDTITULAR '+_clinefeed+
     '                   AND B.IDPESSJUR = T.IDPESSJUR '+_clinefeed+
     '                   AND B.IDPLANOPREV = T.IDPLANOPREV '+_clinefeed+
     '                   AND B.SEQPROPOSTA = T.SEQPROPOSTA) '+_clinefeed;

  if FazQuery(qryAux, ssql) then
    result:=(qryAux.fields[0].asinteger = 0)
  else
    result:=false;
end;

function TfrmEstornaFolha.EstornoFolhaCompleto: boolean;
var lcont, li, lCodDocum, lCodAnterior, lNumLancto: longint;
    bLote, bEfetivada, bEstorno: Boolean;
    sMes,
    sMesAtual, sAnoAtual,
    sMesNovo, sAnoNovo : String;
    ssql,
    sIdLote : String;
    sIdHstFolha: String;
    lLaco: longint;
    ctrlLancamento: tctrlLancamento;
   query:TwwQuery;//SOL205224 douglas.siqueira
begin


  query := TwwQuery.Create(Application);//SOL205224 douglas.siqueira
  query.DataBaseName := 'BaseDados';//SOL205224 douglas.siqueira
  result:=false;
  sIdHstFolha:=IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger);

  frameProgresso.Iniciar('Estorno completo da Versão: '+sIdHstFolha+
    '  (Operação: '+inttostr(ioperacao)+')', true);

  If StrToIntDef(sIdHstFolha,0)<=0 then
  begin
    frameProgresso.ExibeMensagem('Erro na versão da Folha!');
    Exit;
  end;

  {==> VERIFICAR SE EXISTE TMPDESC COM SITENVIO = 9 NA TMPDESC
   DE LOTES VINCULADOS A VERSÃO DE PAGAMENTO QUE VAI SER ESTORNADA.}

  //VERIFICAR SE TMPDESC FOI BAIXADA
  if not VerificaTmpDesc(qryHist.FieldByName('MESREFERENCIA').asstring,
           qryHist.FieldByName('IDHSTFOLHABENEF').asInteger, 0, 0) then
  begin
    frameProgresso.ExibeMensagem('Estorno não é possível pois lançamentos temporários processados ');
    frameProgresso.ExibeMensagem('nesta versão foram baixados pelo sistema de origem.');
    frameProgresso.ExibeMensagem('Deve-se desfazer estes recebimentos no sistema de origem para poder continuar.');
    Exit;
  end;

  (* -1 Significa que não vai fazer commit quando executar ProcessaQueryDeLista *)
  lLaco:=-1;

  sIdLote:='';

  bLote:=FazQuery(qryLotes,'SELECT DISTINCT IDLOTE FROM LOTEXHSTFOLHABENEF'+
      ' WHERE (IDHSTFOLHABENEF = '+sIdHstFolha+') AND'+
      ' (FLGTIPOLOTE =''B'')');

  If qryHist.FieldByName('FLGTIPOFOLHA').AsInteger <> 2 Then
  Begin
    If Not bLote then
      bLote:=FazQuery(qryLotes,'SELECT DISTINCT IDLOTE FROM HSTBENEFBFCIARIO '+
              'WHERE IDHSTFOLHABENEF = '+sIdHstFolha+
              ' AND (IDLOTE IS NOT NULL)');

    If (qryLotes.IsEmpty) or (not bLote) then
    begin
      frameProgresso.ExibeMensagem('Erro na versão da Folha!');
      Exit;
    end;
  End;

  (* VERIFICA SE VERSÃO DA FOLHA FOI EFETIVADA *)
  bEfetivada:=FazQuery(qryAux,'SELECT FLGESTADO'+
                       ' FROM HSTFOLHABENEF'+
                       ' WHERE (IDHSTFOLHABENEF = '+sIdHstFolha+') AND'+
                       ' (FLGESTADO=1)');

  If Not dtmBaseDados.dbBaseDados.InTransaction then
  begin
   dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  
  try
    If Not GravaMotivoEstorno then Exit;

    If not frameProgresso.ProcessaQuery('HSTFOLHABENEF',
      //COLOCAR PLANILHA DE PROVISÃO COMO NULA
      'UPDATE HSTFOLHABENEF SET PLNCODIGO = NULL, PLNPROVISABONO = NULL',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha,
      'Atualizando registro da versão [HSTFOLHABENEF]', llaco) then exit;

    //EXCLUI PLANILHA DE PROVISÃO
    if not qryHist.fieldbyname('PLNPROVISABONO').isnull then
    begin
      ctrlLancamento:=tctrlLancamento.create;
      ctrlLancamento.InitializeAs(Padroes);
      frameProgresso.ResetaFrame(1, 1);
      frameProgresso.MarcaInicioFase('Exclusão da planilha de provisão de abono anual.');
      try
        if not ctrlLancamento.ExcluiLancaContab(Sistema.Idusuario,
                 qryHist.fieldbyname('PLNPROVISABONO').asinteger,
                 Sistema.Idmodulo, 0, true, false) then
        begin
          frameProgresso.ExibeMensagem('Erro na exclusão da planilha de provisão de abono anual.');
          frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
          frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
          exit;
        end;
      except
        on e:exception do
        begin
          frameProgresso.ExibeMensagem('Erro na exclusão da planilha de provisão de abono anual.');
          frameProgresso.ExibeMensagem(e.message);
          frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
          exit;
        end;
      end;
      frameProgresso.MarcaFinalFase('Exclusão da planilha de provisão de abono anual concluída com sucesso.');
      ctrlLancamento.free;
    end;

    If Not ProcessaCompensacao then Exit;

    //EFETUA O ESTORNO DE POSSÍVEIS ALIMENTAÇÕES DE RESERVA
    if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then
    begin
      ssql:=
        'SELECT DISTINCT H.IDTITULAR '+_clinefeed+
        'FROM HISTRUBSAL H '+_clinefeed+
        'WHERE H.IDHSTFOLHABENEF = '+IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger)+' '+_clinefeed+
        'AND H.FLGTIPODESC = ''B'' '+_clinefeed;

      if FazQuery(qryAux, ssql) then
      begin
        frameProgresso.ResetaFrame(1, qryAux.recordcount);
        frameProgresso.MarcaInicioFase('Verificando e desfazendo abatimento de reserva dos benefícios.');
        while not qryAux.eof do
        begin
          if not EstornaAlimentacaoReserva(qryAux1, qryAux2,
                   qryAux.fieldbyname('IDTITULAR').asinteger,
                   qryHist.FieldByName('IDHSTFOLHABENEF').asinteger,
                   qryHist.FieldByName('MESREFERENCIA').asstring) then
          begin
            frameProgresso.ExibeMensagem('Erro ao desfazer a reserva: ('+
              'TITULAR='+inttostr(qryAux.fieldbyname('IDTITULAR').asinteger)+')');
            exit;
          end;
          frameProgresso.Passo;
          qryAux.next;
        end;
        frameProgresso.MarcaFinalFase('Desfazer abatimento de reserva concluída com sucesso.');
      end;
    end;

    If not frameProgresso.ProcessaQuery('HISTRUBSAL',
      'UPDATE HISTRUBSAL SET CODDOCUMENTO=NULL',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha,
      'Atualizando documentos no Histórico de Rubricas [HISTRUBSAL]', llaco) then
     Exit;

    //ALGUNS TRATAMENTOS SÓ DEVEM SER FEITOS PARA FOLHAS NORMAIS
    if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 2) or // Renato Visoni Sol 114975 Kintana 541732
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then
    begin
      If Not frameProgresso.ProcessaQuery('HSTBENEFBFCIARIO',
        'UPDATE HSTBENEFBFCIARIO SET FLGENVIADO=0, IDREGRAABATERESE=NULL, '+
        'DTEFETPGTO=NULL, VLBENEFPGTO=NULL, CODDOCUMENTO=NULL, IDHSTFOLHABENEF=NULL',
        'WHERE IDHSTFOLHABENEF = '+sIdHstFolha+' AND FLGENVIADO = 1 ',
        'Atualizando Histórico de Benefícios [HSTBENEFBFCIARIO]', llaco) then Exit;

      (* SE VERSAO DA FOLHA FOI EFETIVADA *)
      If bEfetivada then
      begin
        if (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 2) then begin
          if not DesfazRubricaIndividual(true,0,0,2) then exit; // Renato Visoni Sol 114975 Kintana 541732 // SOL 255246 PPM 816785 // Andre Imakawa - SIG 99365
        end else begin
          if not DesfazRubricaIndividual(true,0,0) then exit;
        end;
      end; {bEfetivada}
    end;

    If not frameProgresso.ProcessaQuerydeLista(qryDocumentos, 'HSTFOLHABENEFCAP', 'CODDOCUMENTO',
      'DELETE FROM HSTFOLHABENEFCAP', 'WHERE CODDOCUMENTO = ',
      'Excluindo controle de documentos [HSTFOLHABENEFCAP]', llaco) then
     Exit;

    qryDocumentos.first;
    while not qryDocumentos.eof do
    begin
      //Cássio Rovaroto - SIG nº 60540 - Início

      frameProgresso.MarcaInicioFase('Exclusão de registros do arquivo de pagamento relacionado.');
      DesfazRegistroArquivoPagtoCNB240(qryDocumentos.FieldByName('CODDOCUMENTO').asInteger);
      frameProgresso.MarcaFinalFase('Exclusão de registros do arquivo de pagamento relacionado.');
      //Cássio Rovaroto - SIG nº 60540 - Fim

      ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
      ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
      ctrlDocumento.IdUsuario:=Sistema.IdUsuario;
      ctrlDocumento.CodDocumento:=qryDocumentos.fieldbyname('CODDOCUMENTO').asinteger;
      ctrlDocumento.Delete;
      qryDocumentos.next;
    end;

    //ALGUNS TRATAMENTOS SÓ DEVEM SER FEITOS PARA FOLHAS NORMAIS
    if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then
    begin
      qryLotes.First;
      While not qryLotes.Eof do
      begin
        sIdLote:=IntToStr(qryLotes.fieldbyname('IDLOTE').asinteger);

        If not frameProgresso.ProcessaQuery('TMPDESC',
          //'UPDATE TMPDESC SET VALORRECEBIDO = NULL, SITENVIO = ''0'', LOTEPREVIA = NULL ', // Andre Imakawa - SIG 98188
          'UPDATE TMPDESC SET VALORRECEBIDO = NULL, SITENVIO = ''0'' ', // Andre Imakawa - SIG 98188
          'WHERE LOTEPREVIA = '+sIdLote+' AND SITENVIO IN (''1'',''2'')','Atualizando descontos do lote '+
          sIdLote+'[TMPDESC]', llaco) then Exit;

        //IMPLEMENTAR FLGIDATMP = 0 SE NÃO EXISTE PREVIA E = 1 SE EXISTE PREVIA
        If FazQuery(qryAux, 'SELECT COUNT(*) AS QTDE FROM PREVIA WHERE IDLOTE = '+sIdLote) Then
        Begin
//SOL205224 douglas.siqueira
         query.close;
         query.SQL.Clear;
         query.SQL.Add('UPDATE HSTBITRIBUTACAO');
         query.SQL.Add('SET IDHSTFOLHABENEF = 0');
         query.SQL.Add('WHERE');
         query.SQL.Add('IDLOTE ='+sIdLote);
         query.ExecSQL;

         query.close;
         query.SQL.Clear;
         query.SQL.Add('UPDATE HSTDEDIDADEBITRIB');
         query.SQL.Add('SET IDHSTFOLHABENEF = 0');
         query.SQL.Add('WHERE');
         query.SQL.Add('IDLOTE ='+sIdLote);
         query.ExecSQL;
//SOL205224 douglas.siqueira
          If qryAux.FieldByName('QTDE').AsInteger > 0 Then
          Begin
            If not frameProgresso.ProcessaQuery('CTRLINTERFACE',
              'UPDATE CTRLINTERFACE SET FLGIDATMP = 1, FLGVOLTATMP = 0, '+
              'DATAIDATMP = NULL, DATAVOLTATMP = NULL, '+
              //TIRA O BLOQUEIO DOS LOTES
              'RESPCHKLIST = NULL, USUCHKLIST = NULL, DTCHKLIST = NULL ',
              'WHERE IDLOTE = '+sIdLote,'Atualizando Controle de Lote [CTRLINTERFACE]',
              llaco) then Exit;
          End
          Else
          Begin
            If not frameProgresso.ProcessaQuery('CTRLINTERFACE',
              'UPDATE CTRLINTERFACE SET FLGIDATMP = 0, FLGVOLTATMP = 0, '+
              'DATAIDATMP = NULL, DATAVOLTATMP = NULL, '+
              //TIRA O BLOQUEIO DOS LOTES
              'RESPCHKLIST = NULL, USUCHKLIST = NULL, DTCHKLIST = NULL ',
              'WHERE IDLOTE = '+sIdLote,'Atualizando Controle de Lote [CTRLINTERFACE]',
              llaco) then Exit;
          End;
        End;

        qryLotes.next;
      end; {While}
    end;

    qryLotes.Close;

  //MARCIO DENILSON SOL 151061 KINTANA 1105188
  frameProgresso.ExibeMensagem('Inicio fase: IRRegressivo');
  processaIRRegressivo(qryHist.FieldByName('MESREFERENCIA').asstring
                      ,qryHist.FieldByName('IDHSTFOLHABENEF').asInteger );
  frameProgresso.ExibeMensagem('Final fase: IRRegressivo');
  //FIM MARCIO DENILSON SOL 151061 KINTANA 1105188

    If not frameProgresso.ProcessaQuery('HISTRUBSAL',
      'DELETE FROM HISTRUBSAL ',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha,
      'Excluindo o Histórico de Rubricas [HISTRUBSAL]',1000{llaco}) then Exit;

    If not frameProgresso.ProcessaQuery('LOTEXHSTFOLHABENEF',
      'DELETE FROM LOTEXHSTFOLHABENEF',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha,
      'Excluindo relação de lotes com a versão [LOTEXHSTFOLHABENEF]',llaco) then Exit;

    (* Marca FlgEstado em HstFolhaBenef com 2 = Versão Estornada *)
    If not frameProgresso.ProcessaQuery('HSTFOLHABENEF',
      'UPDATE HSTFOLHABENEF SET FLGESTADO = 2',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha,
      'Atualizando lote da versão [HSTFOLHABENEF]', llaco) then exit;

  // SOL:122512 - Daniel Begnami
  // Estorna MapaFolhaBenef
  frameProgresso.ExibeMensagem('Inicio fase: Excluindo Mapa da Folha de Benefício [MAPAFOLHABENEF]');
  Self.EstornaMapaFolhaBenef(sIdHstFolha);
  frameProgresso.ExibeMensagem('Final fase: Excluindo Mapa da Folha de Benefício [MAPAFOLHABENEF]');
  // FIM

  Result:=true;
  finally
    If dtmBaseDados.dbBaseDados.Intransaction then
    begin
      If Result then
      begin
        frameProgresso.Terminar('Término Estorno Completo da versão com sucesso.', true);
        dtmBaseDados.dbBaseDados.commit;
      end
      else
      begin
        frameProgresso.Terminar('Estorno Completo interrompido por erro.', true);
        dtmBaseDados.dbBaseDados.rollback;
      end;
    end;
  end;

query.Destroy;//SOL205224 douglas.siqueira
end;

function TfrmEstornaFolha.EstornoPagamentoPendente(aistatusdoc : integer): boolean;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}
begin
  result:=false;
  frameProgresso.Iniciar('Estorno individual colocando pagamento como pendente.'+
    #13+'Versão: '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
    '  (Operação: '+inttostr(ioperacao)+')'+
    #13+'Titular (Matrícula: '+smatricula+' - Inscrição: '+sinscricao+')  Recebedor: '+snomerecebedor, true);

  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  try
    if not GravaMotivoEstorno then
      exit;

    if not frameProgresso.ProcessaQuery('HISTRUBSAL',
             'UPDATE HISTRUBSAL SET FLGESTORNO = 1 ',
             'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
             ' AND IDTITULAR = '+inttostr(lidTitular)+
             ' AND IDRESPONSAVEL = '+inttostr(lidRecebedor),
             'Marcando o Histórico de Rubricas como estornado para pagamento posterior [HISTRUBSAL]', -1) then
      exit;

    frameProgresso.ResetaFrame(1, 1);
    if (aistatusdoc = 1)And(Not bbaixado) then
    begin
      frameProgresso.MarcaInicioFase('Lançando alterador para o documento.');

      if not GeraAlterador then
        exit;

      frameProgresso.MarcaFinalFase('Alterador para o documento lançado com sucesso.');
    end
    else
    begin
      frameProgresso.MarcaInicioFase('Gerando Contas a Receber.');
      if not GeraCAR(0) then
        exit;
      frameProgresso.MarcaFinalFase('Contas a Receber gerado com sucesso.');
    end;

    result:=true;
  finally
    if dtmBaseDados.dbBaseDados.Intransaction then
    begin
      if result then
      begin
        frameProgresso.Terminar('Término Estorno Individual com sucesso.', true);
        dtmBaseDados.dbBaseDados.commit;
      end
      else
      begin
        frameProgresso.Terminar('Estorno Individual interrompido por erro.', true);
        dtmBaseDados.dbBaseDados.rollback;
      end;
    end;
  end;
end;

function TfrmEstornaFolha.EstornoErroProcesso(aistatusdoc : integer): boolean;
var bLote: Boolean;
    bPensaoAlim : Boolean;
    lcont: longint;
    lii: integer;
    sversoes: string;
    lstversaodesfazer: tstringlist;
    sMesAbono,
    sIdLote,
    sIdHstFolha,
    sMesRef,
    sMesPreparoAnt,
    sUltMesPreparo : String;
    iTipoFolha     : Integer;
    liplnestorno: integer;
    bErroDesfazPreparo : Boolean;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}

  Procedure UltimoMesPreparo(asmesref: string);
  Var iMes, iAno: Integer;
      sMes: String[2];
  begin
    iAno           := 0;
    sMes           := '';
    sMesAbono      := '';
    sMesPreparoAnt := '';
    iMes           := StrToIntDef(Copy(asMesRef, 6, 2), 0);
    If iMes In [1..12] Then
     iAno := StrToIntDef(Copy(asMesRef, 1, 4), 0);
    If (iAno > 0) And (iMes In [1..12]) Then
    Begin
      sMesAbono := IntToStr(iAno) + '/13';
      iMes      := iMes - 1;
      If iMes <= 0 Then
      Begin
        iMes := 12;
        Dec(iAno, 1);
      End;
      sMes := IntToStr(iMes);
      If iMes < 10 Then sMes := '0' + sMes;
      sMesPreparoAnt := IntToStr(iAno) + '/' + sMes;
    End;
  end;

  Procedure BuscaDados;

    Procedure RegistraErro(Ms:String);
    begin
      FrameProgresso.ExibeMensagem(Ms);
      bErroDesfazPreparo := True;
    end;

  begin
    sIdLote            := '';
    sUltMesPreparo     := '';
    sIdHstFolha        := IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').AsInteger);
    sMesRef            := qryHist.FieldByname('MESREFERENCIA').AsString;
    bErroDesfazPreparo := False;
    bLote              := FazQuery(qryLotes, 'SELECT DISTINCT IDLOTE FROM LOTEXHSTFOLHABENEF'+
                                         ' WHERE (IDHSTFOLHABENEF = '+sIdHstFolha+') AND'+
                                         ' (FLGTIPOLOTE =''B'')');

    If bLote Then
      sIdLote := qryLotes.FieldByName('IDLOTE').AsString;

    UltimoMesPreparo(smesref);

    If qryHist.FieldByName('FLGTIPOFOLHA').AsInteger <> 2 Then
    Begin
      If Not bLote Then
        bLote := FazQuery(qryLotes, 'SELECT DISTINCT IDLOTE FROM HSTBENEFBFCIARIO ' +
                                    'WHERE IDHSTFOLHABENEF = ' + sIdHstFolha +
                                    '  AND (IDLOTE IS NOT NULL)' )
      Else
        sIdlote := qryLotes.FieldByName('IDLOTE').AsString;

      If (qryLotes.IsEmpty) Or (Not bLote) Or (sMesRef = '') Or (sIdHstFolha = '') Then
      Begin
        RegistraErro('Erro na versão da Folha!');
        Exit;
      End;
    End;

    If FazQuery(qryAux3, ' select e.matricula, pp.inscricaonumero, p.nome '+
                         ' from partprevplan pp, elegpatro e, pessoa p '+
                         ' where e.idpessoa     = '+IntToStr(lIdTitular)+
                         '   and e.idpessoa     = p.idpessoa '+
                         '   and pp.idpessoa    = e.idpessoa '+
                         '   and pp.idplanoprev = '+IntToStr(lIdPlanoPrev)+
                         '   and pp.idpessjur   = '+IntToStr(lIdPatro)) Then
    Begin
      sNomeTitular := qryAux3.FieldByName('NOME').AsString;
      sInscricao   := qryAux3.FieldByName('INSCRICAONUMERO').AsString;
    End;

    If FazQuery(qryAux3, ' SELECT MESREFERENCIA, FLGTIPOFOLHA '+
                        ' FROM CTRLINTERFACE WHERE IDLOTE = '+sIdLote) Then
    Begin
      sUltMesPreparo := qryAux3.FieldByName('MESREFERENCIA').AsString;
      iTipoFolha     := qryAux3.FieldByName('FLGTIPOFOLHA').AsInteger;
    End
    Else
    Begin
      RegistraErro('Erro ao verificar o Mês de Referência');
      Exit;
    End;
  end;

  procedure ProcessaVersaoParaDesfazer(aiversao: integer);
  var q1: twwquery;
  begin
    q1:=TwwQuery.Create(Application);
    q1.DatabaseName:='BaseDados';

    try
      if FazQuery(q1, 'SELECT DISTINCT HH.IDHSTFOLHABENEF, HH.FLGTIPOFOLHA'+#13#10+
                      'FROM HISTRUBSAL H, HSTFOLHABENEF HH'+#13#10+
                      'WHERE H.IDTITULAR = '+IntToStr(lidTitular)+#13#10+
                      'AND H.IDRESPONSAVEL = '+inttostr(lidRecebedor)+#13#10+
                      'AND H.IDVERSAOPAGTO = '+inttostr(aiversao)+#13#10+
                      'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF'+#13#10+
                      'AND H.IDMODULO = 18') then
      begin
        while not q1.eof do
        begin
          if q1.fieldbyname('FLGTIPOFOLHA').asinteger = 1 then
          begin
            ProcessaVersaoParaDesfazer(q1.FieldByName('IDHSTFOLHABENEF').asinteger);
          end
          else
          begin
            lstversaodesfazer.Add(q1.FieldByName('IDHSTFOLHABENEF').asstring);
          end;
          q1.next;
        end;
      end;
    finally
      q1.free;
    end;
  end;

begin
  result:=false;

  frameProgresso.Iniciar('Estorno individual por erro de processo.'+
    #13+'Versão: '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
    '  (Operação: '+inttostr(ioperacao)+')'+
    #13+'Titular (Matrícula: '+smatricula+' - Inscrição: '+sinscricao+')  Recebedor: '+snomerecebedor, true);

  {==> VERIFICAR SE EXISTE TMPDESC COM SITENVIO = 9 NA TMPDESC
   DE LOTES VINCULADOS A VERSÃO DE PAGAMENTO QUE VAI SER ESTORNADA.}

  //VERIFICAR SE TMPDESC FOI BAIXADA
  if not VerificaTmpDesc(qryHist.FieldByName('MESREFERENCIA').asstring,
    qryHist.FieldByName('IDHSTFOLHABENEF').asInteger, lIdTitular, lidRecebedor) then
  begin
    frameProgresso.ExibeMensagem('Estorno não é possível pois lançamentos temporários desta pessoa ');
    frameProgresso.ExibeMensagem('processados nesta versão foram baixados pelo sistema de origem.');
    frameProgresso.ExibeMensagem('Deve-se desfazer estes recebimentos no sistema de origem para poder continuar.');
    Exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

  try
    if not GravaMotivoEstorno then
      exit;

    if not ProcessaCompensacao then
      exit;

    frameProgresso.ResetaFrame(1, 1);

    frameProgresso.MarcaInicioFase('Lançando contabilização para compensar as rubricas do recebedor.');
    if not LancaContabilizacaoRecebedor(aistatusdoc, liplnestorno) then
      exit;
    frameProgresso.MarcaFinalFase('Lançando contabilização para compensar as rubricas do recebedor.');

    if not frameProgresso.ProcessaQuery('HISTRUBSAL',
           'UPDATE HISTRUBSAL SET FLGESTORNO = 9 ',
            'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
            ' AND IDTITULAR = '+inttostr(lidTitular)+
            ' AND IDRESPONSAVEL = '+inttostr(lidRecebedor),
            'Marcando o Histórico de Rubricas como estornado pagamento indevido [HISTRUBSAL]', -1) then
      exit;

    //CASO JÁ TENHA OCORRIDO ESTORNO POR PAGAMENTO PENDENTE NÃO PRECISA MAIS ACERTAR O FINANCEIRO.
    if (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
    begin
      if aistatusdoc = 1 then
      begin
        frameProgresso.MarcaInicioFase('Lançando alterador para o documento.');
        if not GeraAlterador then
          exit;
        frameProgresso.MarcaFinalFase('Alterador para o documento lançado com sucesso.');
      end
      else
      begin
        frameProgresso.MarcaInicioFase('Gerando Contas a Receber.');
        if not GeraCAR(liplnestorno) then
          exit;
        frameProgresso.MarcaFinalFase('Contas a Receber gerado com sucesso.');
      end;
    end;

    lstversaodesfazer:=tstringlist.create;
    //ENCONTRANDO LOTES DE PAGAMENTO NORMAIS QUE DEVEM SER DESFEITOS POIS FORAM
    // PAGOS EM PAGAMENTOS PENDENTES POSTERIORES
    if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 1) then
    begin
      frameProgresso.MarcaInicioFase('Identificando lotes para serem desfeitos.');
      ProcessaVersaoParaDesfazer(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger);

      //AGRUPAR TODOS OS LOTES EM ORDEM DECRESCENTE DE MESREFERENCIA PELA CONTROLE DE INTERFACE
      sversoes:='';
      for lii:=0 to lstversaodesfazer.count-1 do
      begin
        if trim(lstversaodesfazer[lii]) <> '' then
          sversoes:=sversoes+trim(lstversaodesfazer[lii])+',';
      end;
      if sversoes <> '' then
      begin
        delete(sversoes, length(sversoes), 1);

        if FazQuery(qryAux, 'SELECT IDHSTFOLHABENEF, MESREFERENCIA, DATAPREVPAGTO '+#13#10+
                            'FROM HSTFOLHABENEF '+#13#10+
                            'WHERE IDHSTFOLHABENEF IN ('+ sversoes + ')'+#13#10+
                            'ORDER BY MESREFERENCIA') then
        begin
          BuscaDados;

          while not qryAux.eof do
          begin
            if not EstornaAlimentacaoReserva(qryAux1, qryAux2, lidtitular,
                     qryAux.FieldByName('IDHSTFOLHABENEF').asinteger,
                     qryAux.FieldByName('MESREFERENCIA').asstring) then
            begin
              frameProgresso.ExibeMensagem('Erro ao desfazer a reserva: ('+
                'VERSÃO = '+inttostr(qryAux.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+
                'TITULAR = '+inttostr(lidtitular)+')');
              Result:=False;
              Exit;
            end;

            bLote:=FazQuery(qryAux1,
              'SELECT DISTINCT C.IDLOTE, C.FLGCONCESSAO '+#13#10+
              'FROM LOTEXHSTFOLHABENEF L, CTRLINTERFACE C'+#13#10+
              'WHERE L.IDHSTFOLHABENEF = '+inttostr(qryAux.FieldByName('IDHSTFOLHABENEF').asinteger)+#13#10+
              'AND L.IDLOTE = C.IDLOTE '+#13#10+
              'AND L.FLGTIPOLOTE = ''B'''+#13#10+
              'ORDER BY C.FLGCONCESSAO');
            if not bLote then
              bLote:=FazQuery(qryAux1,
                'SELECT DISTINCT C.IDLOTE, C.FLGCONCESSAO '+#13#10+
                'FROM HSTBENEFBFCIARIO L, CTRLINTERFACE C'+#13#10+
                'WHERE H.IDHSTFOLHABENEF = '+inttostr(qryAux.FieldByName('IDHSTFOLHABENEF').asinteger)+#13#10+
                'AND H.IDLOTE = C.IDLOTE '+#13#10+
                'ORDER BY C.FLGCONCESSAO');

            if not frameProgresso.ProcessaQuery('TMPDESC T',
              'UPDATE TMPDESC T SET T.VALORRECEBIDO = NULL, '+
                                   //'T.SITENVIO = ''0'', T.LOTEPREVIA = NULL, '+  // Andre Imakawa - SIG 98188
                                   'T.SITENVIO = ''0'', '+    // Andre Imakawa - SIG 98188
                                   'T.DATARECEBIMENTO = NULL ',
              'WHERE T.LOTEPREVIA = '+inttostr(qryAux1.fieldbyname('IDLOTE').asinteger)+
              ' AND T.IDTITULAR = '+inttostr(lidtitular)+
              ' AND T.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
              ' WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
              ' AND B.IDTITULAR = T.IDTITULAR AND B.IDPESSJUR = T.IDPESSJUR '+
              ' AND B.IDPLANOPREV = T.IDPLANOPREV AND B.SEQPROPOSTA = T.SEQPROPOSTA) ',
              'Atualizando os lançamentos temporários do '+sIdLote+
              '[TMPDESC]', -1) then Exit;

            sUltMesPreparo:=qryAux.FieldByName('MESREFERENCIA').AsString;
            UltimoMesPreparo(qryAux.FieldByName('MESREFERENCIA').asstring);

            if not DesfazerPreparoIndividual(qryAux2, qryAux3, lIdTitular,
                     qryAux1.fieldbyname('IDLOTE').asinteger,
                     False, sUltMesPreparo, sMesPreparoAnt,
                     sMesAbono, sInscricao, sNomeTitular,
                     qryAux.FieldByName('DATAPREVPAGTO').asdatetime,
                     FrameProgresso.redResultado.Lines, True) then
            begin
              frameProgresso.ExibeMensagem('Erro ao desfazer preparo: ('+
                'LOTE='+inttostr(qryAux1.fieldbyname('IDLOTE').asinteger)+' '+
                'TITULAR='+inttostr(lidtitular)+')');
              Result:=False;
              Exit;
            end;

            //ATUALIZANDO REGISTROS DE CONCESSÃO
            if not frameProgresso.ProcessaQuery('HSTBENEFBFCIARIO H',
              ' UPDATE HSTBENEFBFCIARIO H SET H.FLGENVIADO=0, H.IDREGRAABATERESE = NULL,'+
              ' H.DTEFETPGTO = NULL, H.VLBENEFPGTO = NULL, H.CODDOCUMENTO = NULL, '+
              ' H.IDHSTFOLHABENEF = NULL ',
              ' WHERE IDHSTFOLHABENEF = '+inttostr(qryAux.FieldByName('IDHSTFOLHABENEF').asinteger)+
              ' AND H.IDTITULAR       = '+inttostr(lidTitular)+
              ' AND H.FLGCONCESSAO    = 1 '+
              ' AND H.FLGENVIADO = 1 '+
              ' AND H.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
              '                    WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
              '                    AND B.IDTITULAR     = H.IDTITULAR AND B.IDPESSJUR = H.IDPESSJUR '+
              '                    AND B.IDPLANOPREV   = H.IDPLANOPREV AND B.IDBENEFICIO = H.IDBENEFICIO '+
              '                    AND B.SEQPROPOSTA   = H.SEQPROPOSTA) ',
              'Colocando Histórico de Benefícios no novo lote de pagamento '+
              '[HSTBENEFBFCIARIO]',-1) then Exit;

            qryAux.next;
          end;
        end;
        //PROCESSA TRATAMENTO PARA CADA LOTE DA LISTA DE LOTES A DESFAZER
      end;
    end;

    //ALGUNS TRATAMENTOS SÓ DEVEM SER FEITOS PARA FOLHAS NORMAIS
    if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
       (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then
    begin
      //EFETUA O ESTORNO DE POSSÍVEIS ALIMENTAÇÕES DE RESERVA PARA O TITULAR
      frameProgresso.MarcaInicioFase('Verificando e desfazendo abatimento de reserva dos benefícios.');
      if not EstornaAlimentacaoReserva(qryAux1, qryAux2, lidtitular,
               qryHist.FieldByName('IDHSTFOLHABENEF').asinteger,
               qryHist.FieldByName('MESREFERENCIA').asstring) then
      begin
        frameProgresso.ExibeMensagem('Erro ao desfazer a reserva: ('+
          'TITULAR='+inttostr(lidtitular)+')');
        exit;
      end;
      frameProgresso.MarcaFinalFase('Verificação concluída com sucesso.');

      bPensaoAlim := FazQuery(qryAux, ' SELECT * '+
                                      ' FROM HISTRUBSAL '+
                                      ' WHERE IDTITULAR = '+inttostr(lidtitular)+
                                        ' AND IDRESPONSAVEL = '+inttostr(lidrecebedor)+
                                        ' AND IDHSTFOLHABENEF = '+qryHist.FieldByName('IDHSTFOLHABENEF').AsString+
                                        ' AND FLGPENSAOALIM = 2 ');
      if not bPensaoAlim Then
      Begin
        bLote:=FazQuery(qryAux, 'SELECT DISTINCT IDLOTE FROM LOTEXHSTFOLHABENEF '+
          'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
          ' AND FLGTIPOLOTE = ''B''');
        if not bLote then
          bLote:=FazQuery(qryAux, 'SELECT DISTINCT IDLOTE FROM HSTBENEFBFCIARIO '+
           'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger));

        if bLote then
        begin
          while not qryAux.eof do
          begin
            If Not frameProgresso.ProcessaQuery('TMPDESC T',
              'UPDATE TMPDESC T SET T.VALORRECEBIDO = NULL, '+
                                   //'T.SITENVIO = ''0'', T.LOTEPREVIA = NULL ', // Andre Imakawa - SIG 98188
                                   'T.SITENVIO = ''0'' ', // Andre Imakawa - SIG 98188
              'WHERE T.LOTEPREVIA = '+inttostr(qryAux.fieldbyname('IDLOTE').asinteger)+
              ' AND T.IDTITULAR = '+inttostr(lidtitular)+
              ' AND T.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
              ' WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
              ' AND B.IDTITULAR = T.IDTITULAR AND B.IDPESSJUR = T.IDPESSJUR '+
              ' AND B.IDPLANOPREV = T.IDPLANOPREV AND B.SEQPROPOSTA = T.SEQPROPOSTA) ',
              'Atualizando os lançamentos temporários do '+inttostr(qryAux.fieldbyname('IDLOTE').asinteger)+
              '[TMPDESC]', -1) then Exit;
            qryAux.next;
          end;
        end;
      End; {if not bPensaoAlim Then}
    end;

    //ALGUNS TRATAMENTOS SÓ DEVEM SER FEITOS PARA FOLHAS NORMAIS
    If not bPensaoAlim Then
      if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
         (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 2) or//Renato Visoni Sol 114975 Kintana 541732
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then


         if (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 2) then begin
           if not DesfazRubricaIndividual(false, lidtitular, lidrecebedor,2) then exit; // Renato Visoni Sol 114975 Kintana 541732 // SOL 255246 PPM 816785 // Andre Imakawa - SIG 99365
         end else begin
	   if not DesfazRubricaIndividual(false, lidtitular, lidrecebedor) then exit;
         end;

    //ALGUNS TRATAMENTOS SÓ DEVEM SER FEITOS PARA FOLHAS NORMAIS
    If not bPensaoAlim Then
    Begin
      if (qryHist.FieldByName('FLGTIPOFOLHA').AsInteger = 0) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 3) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 4) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 5) or
         (qryHist.fieldbyname('FLGTIPOFOLHA').asinteger = 6) then
      begin
        (**** DESFAZ PREPARO INDIVIDUAL ****)
        BuscaDados;
        If Not DesfazerPreparoIndividual(qryAux1, qryAux2, lIdTitular, StrToInt(sIdLote),
                 False, sUltMesPreparo, sMesPreparoAnt,
                 sMesAbono, sInscricao, sNomeTitular,
                 qryHist.FieldByName('DATAPREVPAGTO').asdatetime,
                 FrameProgresso.redResultado.Lines, True) Then
        Begin
          Result := False;
          Exit;
        End;

	If Not frameProgresso.ProcessaQuery('HSTBENEFBFCIARIO H',
          ' UPDATE HSTBENEFBFCIARIO H SET H.FLGENVIADO=0, H.IDREGRAABATERESE = NULL,'+
          ' H.DTEFETPGTO = NULL, H.VLBENEFPGTO = NULL, H.CODDOCUMENTO = NULL, '+
          ' H.IDHSTFOLHABENEF = NULL ',
          ' WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
            ' AND H.IDTITULAR       = '+inttostr(lidTitular)+
            ' AND H.FLGCONCESSAO    = 1 '+
            ' AND H.FLGENVIADO = 1 '+
            ' AND H.IDPESSOA       IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
                                     ' WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
                                      ' AND B.IDTITULAR     = H.IDTITULAR AND B.IDPESSJUR = H.IDPESSJUR '+
                                      ' AND B.IDPLANOPREV   = H.IDPLANOPREV AND B.IDBENEFICIO = H.IDBENEFICIO '+
                                      ' AND B.SEQPROPOSTA   = H.SEQPROPOSTA) ',
          'Colocando Histórico de Benefícios no novo lote de pagamento '+
          '[HSTBENEFBFCIARIO]',-1) then Exit;
      end;
    End; {If not bPensaoAlim Then}
    Result:=true;
  Finally
    lstversaodesfazer.free;
    If dtmBaseDados.dbBaseDados.Intransaction then
    begin
      If (Result)And(Not bErroDesfazPreparo) then
      begin
        frameProgresso.Terminar('Término Estorno Individual com sucesso.', true);
        dtmBaseDados.dbBaseDados.commit;
      end
      else
      begin
        frameProgresso.Terminar('Estorno Individual interrompido por erro.', true);
        dtmBaseDados.dbBaseDados.rollback;
      end;
    end;
  end;
end;

function TfrmEstornaFolha.EstornoNovoCAP(aistatusdoc : integer): boolean;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}
 var lCodLancCAPCAR, lNumLancto, iidhstfolhabenefcap: longint;
begin
  result:=false;
  frameProgresso.Iniciar('Estorno individual criando novo contas a pagar.'+
    #13+'Versão: '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
    '  (Operação: '+inttostr(ioperacao)+')'+
    #13+'Titular (Matrícula: '+smatricula+' - Inscrição: '+sinscricao+')  Recebedor: '+snomerecebedor, true);

  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

  try
    if not GravaMotivoEstorno then
      exit;

    frameProgresso.ResetaFrame(1, 1);

    frameProgresso.MarcaInicioFase('Criando novo contas a pagar para o recebedor.');
    if not GeraCAP(lCodLancCAPCAR, lNumLancto) then
      exit;
    frameProgresso.MarcaFinalFase('Novo contas a pagar gerado com sucesso.');

    //INCLUSAO DA ALTERACAO DO CODPORTFORMA
    {Vinculação no histórico de rubricas deste novo Portador Forma e Contas a Pagar - HISTRUBSAL}
    if not frameProgresso.ProcessaQuery('HISTRUBSAL',
             'UPDATE HISTRUBSAL SET CODDOCUMENTO = ' + inttostr(lCodLancCAPCAR)+', '+
                'CODPORTFORMA = ' + inttostr(qryPortPagamento.fieldbyname('CODPORTFORMA').asinteger),
             'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
             ' AND IDTITULAR = '+inttostr(lidTitular)+
             ' AND IDRESPONSAVEL = '+inttostr(lidRecebedor),
             'Alterando novo portador forma e novo documento no Histórico de Rubricas [HISTRUBSAL]', -1) then
      exit;

    frameProgresso.MarcaInicioFase('Acertando controle dos documentos da versão.');
    iidHstFolhaBenefCap := LeUltRegistro(Nil, 'HSTFOLHABENEFCAP');
    if not ExecutarQuery(qryAux, 'INSERT INTO HSTFOLHABENEFCAP '+
             '(IDHSTFOLHABENEFCAP, CODDOCUMENTO, IDHSTFOLHABENEF, NUMREGISTROS, VALORDOC) VALUES( '+
             inttostr(iidHstFolhaBenefCap)+','+inttostr(lCodLancCAPCAR)+','+dblkFolha.LookupValue+','+
             '1,'+OraNumero(FloattoStr(dvalor))+')') then
    begin
      frameProgresso.ExibeMensagem('Erro ao criar controle do novo documento.');
      exit;
    end;

    {Diminuir 1 documento do HSTFOLHABENEFCAP anterior}
    if not ExecutarQuery(qryAux, 'UPDATE HSTFOLHABENEFCAP SET NUMREGISTROS = NUMREGISTROS - 1,'+
             ' VALORDOC = VALORDOC - '+OraNumero(FloattoStr(dvalor))+
             ' WHERE IDHSTFOLHABENEF = ' + dblkFolha.LookupValue+
             ' AND CODDOCUMENTO = '+inttostr(qryCap.FieldByName('CODDOCUMENTO').asinteger)) then
    begin
      frameProgresso.ExibeMensagem('Erro ao alterar controle do documento antigo.');
      exit;
    end;
    frameProgresso.MarcaFinalFase('Controle dos documentos da versão alterados com sucesso.');

    if aistatusdoc = 1 then
    begin
      frameProgresso.MarcaInicioFase('Lançando alterador para o documento.');
      if not GeraAlterador then
        exit;
      frameProgresso.MarcaFinalFase('Alterador para o documento lançado com sucesso.');
    end
    else
    begin
      frameProgresso.MarcaInicioFase('Gerando Contas a Receber.');
      if not GeraCAR(0) then
        exit;
      frameProgresso.MarcaFinalFase('Contas a Receber gerado com sucesso.');
    end;

    result:=true;
  finally
    if dtmBaseDados.dbBaseDados.Intransaction then
    begin
      if result then
      begin
        frameProgresso.Terminar('Término Estorno Individual com sucesso.', true);
        dtmBaseDados.dbBaseDados.commit;
      end
      else
      begin
        frameProgresso.Terminar('Estorno Individual interrompido por erro.', true);
        dtmBaseDados.dbBaseDados.rollback;
      end;
    end;
  end;
end;

function TfrmEstornaFolha.EstornoReprocessamento(aistatusdoc: integer): boolean;
 Var bLote: Boolean;
     lcont: integer;
     vlrdif: double;
     contdif: integer;
     sIdHstFolha,
     sIdLote, sBeneficiario,
     ssql, sUltMespreparo, sMesPreparoAtual, sMesPreparoAnt, sMesAbono: String;
     liplnestorno, iMes, iAno: integer;
     dtdatapagtoant : TDateTime;

    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}

     Procedure UltimoMesPreparo(asmesref: string);
     Var iMes, iAno: Integer;
         sMes: String[2];
     begin
       iAno           := 0;
       sMes           := '';
       sMesAbono      := '';
       sMesPreparoAnt := '';
       sUltMespreparo := asmesref;
       iMes           := StrToIntDef(Copy(asMesRef, 6, 2), 0);
       If iMes In [1..12] Then
        iAno := StrToIntDef(Copy(asMesRef, 1, 4), 0);
       If (iAno > 0) And (iMes In [1..12]) Then
       Begin
         sMesAbono := IntToStr(iAno) + '/13';
         iMes      := iMes - 1;
         If iMes <= 0 Then
         Begin
           iMes := 12;
           Dec(iAno, 1);
         End;
         sMes := IntToStr(iMes);
         If iMes < 10 Then sMes := '0' + sMes;
         sMesPreparoAnt := IntToStr(iAno) + '/' + sMes;
       End;

     end;
begin
  Result:=false;
  sIdHstFolha:=IntToStr(qryHist.FieldByName('IDHSTFOLHABENEF').asInteger);

  If ckVoltaPreparo.Checked Then
  Begin
     sSQL := 'SELECT DISTINCT P.NOME, H.FLGCONCESSAO, H.IDLOTE, H.IDPESSOA, ' +
             '       H.IDTITULAR, H.MESREFERENCIA, HF.DATAPREVPAGTO,        ' +
             '       H.MES                                                  ' +
             'FROM HSTBENEFBFCIARIO H,                                      ' +
             '     PESSOA P,                                                ' +
             '     LOTEXHSTFOLHABENEF LH,                                   ' +
             '     HSTFOLHABENEF      HF                                    ' +
             'WHERE (H.IDPESSOA         = P.IDPESSOA)                       ' +
             '  AND (LH.IDLOTE          = H.IDLOTE)                         ' +
             '  AND (LH.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF)                ' +
             '  AND (LH.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF)               ' +
             '  AND (H.IDTITULAR        = ' + IntToStr(lidTitular) + ')     ' +
             '  AND (H.IDHSTFOLHABENEF  = ' + sIdHstFolha + ')';

     FazQuery(qryHstLote, sSQL );

     If qryHstLote.FieldByName('FLGCONCESSAO').AsInteger <> 0 Then
     Begin
        frameProgresso.ExibeMensagem('Esse estorno não pode ser feito pela folha!');
        Exit;
     End;
  End;

  frameProgresso.Iniciar('Estorno individual para reprocessamento.'+
    #13+'Versão: '+sIdHstFolha+' (Operação: '+inttostr(ioperacao)+')'+
    #13+'Titular (Matrícula: '+smatricula+' - Inscrição: '+
    sinscricao+')  Recebedor: '+snomerecebedor, true);

  If StrToIntDef(sIdHstFolha,0)<=0 then
  begin
    frameProgresso.ExibeMensagem('Erro na versão da Folha!');
    Exit;
  end;

  {==> VERIFICAR SE EXISTE TMPDESC COM SITENVIO = 9 NA TMPDESC
   DE LOTES VINCULADOS A VERSÃO DE PAGAMENTO QUE VAI SER ESTORNADA.}

  //VERIFICAR SE TMPDESC FOI BAIXADA
  if not VerificaTmpDesc(qryHist.FieldByName('MESREFERENCIA').asstring,
    qryHist.FieldByName('IDHSTFOLHABENEF').asInteger, lIdTitular, lidRecebedor) then
  begin
    frameProgresso.ExibeMensagem('Estorno não é possível pois lançamentos temporários desta pessoa ');
    frameProgresso.ExibeMensagem('processados nesta versão foram baixados pelo sistema de origem.');
    frameProgresso.ExibeMensagem('Deve-se desfazer estes recebimentos no sistema de origem para poder continuar.');
    Exit;
  end;

  sIdLote:='';

  If Not dtmBaseDados.dbBaseDados.InTransaction then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  try
    If not GravaMotivoEstorno then Exit;

    If not ProcessaCompensacao then Exit;

    frameProgresso.ResetaFrame(1, 1);

    frameProgresso.MarcaInicioFase('Lançando contabilização para compensar as rubricas do recebedor.');
    if not LancaContabilizacaoRecebedor(aistatusdoc, liplnestorno) then
      exit;
    frameProgresso.MarcaFinalFase('Lançando contabilização para compensar as rubricas do recebedor.');

    If Not frameProgresso.ProcessaQuery('HISTRUBSAL',
      'UPDATE HISTRUBSAL SET FLGESTORNO = 4 ',
      'WHERE IDHSTFOLHABENEF = '+sIdHstFolha+
      ' AND IDTITULAR = '+inttostr(lidTitular)+
      ' AND IDRESPONSAVEL = '+inttostr(lidRecebedor),
      'Marcando o Histórico de Rubricas como pagamento estornado para reprocessamento '+
      '[HISTRUBSAL]', -1) then Exit;

    if aistatusdoc = 1 then
    begin
      frameProgresso.MarcaInicioFase('Lançando alterador para o documento.');
      If not GeraAlterador then
        Exit;
      frameProgresso.MarcaFinalFase('Alterador para o documento lançado com sucesso.');
    end
    else
    begin
      frameProgresso.MarcaInicioFase('Gerando Contas a Receber.');
      If not GeraCAR(liplnestorno) then
        Exit;
      frameProgresso.MarcaFinalFase('Contas a Receber gerado com sucesso.');
    end;

    bLote := FazQuery(qryLotes, 'SELECT DISTINCT IDLOTE FROM LOTEXHSTFOLHABENEF ' +
                                'WHERE (IDHSTFOLHABENEF = '+sIdHstFolha+') AND ' +
                                '      (FLGTIPOLOTE =''B'')');

    If qryHist.FieldByName('FLGTIPOFOLHA').AsInteger <> 2 Then
    Begin
      if not bLote then
      bLote:=FazQuery(qryLotes, 'SELECT DISTINCT IDLOTE FROM HSTBENEFBFCIARIO ' +
                                'WHERE IDHSTFOLHABENEF = ' + sIdHstFolha +
                                '  AND (IDLOTE IS NOT NULL)');

      if (qryLotes.IsEmpty) or (not bLote) then
      begin
        frameProgresso.ExibeMensagem('Erro na versão da Folha!');
        Exit;
      end;
    End;

    //POSICIONAR NOVAMENTE NO INICIO DO CURSOR, POIS A
    //   FUNÇÃO FAZQUERY COLOCA O CURSOR NO ÚLTIMO REGISTRO.

    If not ckVoltaPreparo.Checked Then
    Begin
       qryLotes.First;
       While Not qryLotes.Eof do
       begin
         sIdLote:=IntToStr(qryLotes.fieldbyname('IDLOTE').asinteger);

         If Not frameProgresso.ProcessaQuery('TMPDESC T',
           'UPDATE TMPDESC T SET T.VALORRECEBIDO = NULL, '+
                                //'T.SITENVIO = ''0'', T.LOTEPREVIA = NULL ',  // Andre Imakawa - SIG 98188
                                'T.SITENVIO = ''0'' ',  // Andre Imakawa - SIG 98188
           'WHERE T.LOTEPREVIA = '+sIdLote+
           ' AND T.IDTITULAR = '+inttostr(lidtitular)+
           ' AND T.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
           ' WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
           ' AND B.IDTITULAR = T.IDTITULAR AND B.IDPESSJUR = T.IDPESSJUR '+
           ' AND B.IDPLANOPREV = T.IDPLANOPREV AND B.SEQPROPOSTA = T.SEQPROPOSTA) ',
           'Atualizando os lançamentos temporários do '+sIdLote+
           '[TMPDESC]', -1) then Exit;

           qryLotes.next;
       end; {While}
       qryLotes.Close;
    End;

    If Not FazQuery(qryAux,
      ' SELECT COUNT(*) AS CONT, SUM(H.VALORPREV) AS VALOR '+
      ' FROM HSTBENEFBFCIARIO H '+
      ' WHERE H.IDHSTFOLHABENEF = '+sIdHstFolha+
      ' AND H.IDTITULAR = '+inttostr(lidTitular)+
      ' AND H.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
      ' WHERE B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
      ' AND B.IDTITULAR = H.IDTITULAR AND B.IDPESSJUR = H.IDPESSJUR '+
      ' AND B.IDPLANOPREV = H.IDPLANOPREV AND B.IDBENEFICIO = H.IDBENEFICIO '+
      ' AND B.SEQPROPOSTA = H.SEQPROPOSTA) ') then Exit
    else
    begin
      vlrdif:=qryAux.fieldbyname('valor').asfloat;
      contdif:=qryAux.fieldbyname('cont').asinteger;
    end;

    ssql := ' UPDATE HSTBENEFBFCIARIO H SET H.FLGENVIADO=0, H.IDREGRAABATERESE=NULL,'+
            ' H.DTEFETPGTO=NULL, H.VLBENEFPGTO=NULL, H.CODDOCUMENTO=NULL,'+
            ' H.IDHSTFOLHABENEF=NULL, ';

    If not ckVoltaPreparo.Checked Then
       ssql := ssql + ' H.IDLOTE=' + inttostr(qryCtrlinterface.fieldbyname('idlote').asinteger)
    Else
       sSql := Copy(sSql, 1, length(sSql)-2);

    If Not frameProgresso.ProcessaQuery('HSTBENEFBFCIARIO H', sSQL,
                                        ' WHERE H.IDHSTFOLHABENEF = '+sIdHstFolha+
                                        ' AND H.FLGENVIADO        = 1 '+
                                        ' AND H.IDTITULAR         = '+inttostr(lidTitular)+
                                        ' AND H.IDPESSOA IN (SELECT DISTINCT B.IDPESSOA FROM BFCIARIOTITPLAN B'+
                                        ' WHERE B.IDRESPONSAVEL   = '+inttostr(lidRecebedor)+
                                        ' AND B.IDTITULAR         = H.IDTITULAR AND B.IDPESSJUR = H.IDPESSJUR '+
                                        ' AND B.IDPLANOPREV       = H.IDPLANOPREV AND B.IDBENEFICIO = H.IDBENEFICIO '+
                                        ' AND B.SEQPROPOSTA       = H.SEQPROPOSTA) ',
                                        'Colocando Histórico de Benefícios no novo lote de pagamento '+
                                        '[HSTBENEFBFCIARIO]',-1) then Exit;

    if not DesfazRubricaIndividual(false, lidtitular, lidrecebedor) then
      exit;

    dValorTotalLote:=dValorTotalLote+vlrdif;
    iNumRegs:=iNumRegs+contdif;
    If Not frameProgresso.ProcessaQuery('CTRLINTERFACE',
      ' UPDATE CTRLINTERFACE '+
      ' SET NUMREG = '+IntToStr(iNumRegs)+', FLGPREPARADO = 1, '+
      ' VLRTOTAL = '+OraNumero(FloatToStr(dValorTotalLote)),
      ' WHERE (IDLOTE = '+IntToStr(iIdLote)+')',
      'Atualizando total e valor do lote [CTRLINTERFACE]', -1) then Exit;

    { Desfaz Preparo }
    If ckVoltaPreparo.Checked Then
    Begin
       qryHstLote.First;
       While Not qryHstLote.Eof do
       begin
          sMesAbono := '';
          sBeneficiario := qryHstLote.FieldByName('NOME').AsString;
          sIdLote:=IntToStr(qryHstLote.fieldbyname('IDLOTE').asinteger);

          UltimoMesPreparo( qryHstLote.FieldByName('MESREFERENCIA').AsString );
          sMesPreparoAtual := qryHstLote.FieldByName('MESREFERENCIA').AsString;
          sUltMespreparo   := qryHstLote.FieldByName('MES').AsString;

          If sMespreparoAnt = '' Then
             sMesAbono := qryHstLote.FieldByName('MESREFERENCIA').AsString;

          dtdatapagtoant:= qryHstLote.FieldByName('DATAPREVPAGTO').AsDateTime;

          If Not DesfazerPreparoIndividual(qryAux1,
                                           qryAux2,
                                           lidTitular,
                                           StrToInt(sIdLote),
                                           false,
                                           sUltMespreparo,
                                           sMespreparoAnt,
                                           sMesAbono,
                                           sinscricao,
                                           sBeneficiario,
                                           dtdatapagtoant,
                                           FrameProgresso.redResultado.Lines,
                                           True) Then
              FrameProgresso.redResultado.Lines.Add ('Erro no desfazer prepado para: ' + sBeneficiario);
          qryHstLote.Next;
       End;
    End;
    qryHstLote.Close;

    Result:=true;
    finally
      If dtmBaseDados.dbBaseDados.Intransaction then
      begin
        If Result then
        begin
          frameProgresso.Terminar('Término Estorno Individual com sucesso.', true);
          dtmBaseDados.dbBaseDados.commit;
        end
        else
        begin
          frameProgresso.Terminar('Estorno Individual interrompido por erro.', true);
          dtmBaseDados.dbBaseDados.rollback;
        end;
      end;
    end;
end;

function TfrmEstornaFolha.AlterarFormaPagamento(aistatusdoc : integer): boolean;
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}
Var lCodLancCAPCAR, lNumLancto: longint;
    sCodPortForma,
    sIdContaBancaria,
    sDataProgramada: String;
begin
  Result:=false;
  If StrToIntDef(sDocUnico,0)<=0 then Exit;
  sCodPortForma:=dblkPortForma.LookupValue;
  sIdContaBancaria:=dblkContaRecebedor.LookupValue;
  sDataProgramada:=dtDataProg.Text;
  If (StrToIntDef(sCodPortForma,0)<=0) then Exit;
  If (StrToIntDef(sIdContaBancaria,0)<=0) then sIdContaBancaria:='NULL';
  try
    StrToDate(sDataProgramada);
  except
    Exit;
  end;

  frameProgresso.Iniciar('Alteração da forma de pagamento.'+
    #13+'Versão: '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+
    '  (Operação: '+inttostr(ioperacao)+')'+
    #13+'Titular (Matrícula: '+smatricula+' - Inscrição: '+sinscricao+')  Recebedor: '+snomerecebedor, true);

  If not dtmBaseDados.dbBaseDados.InTransaction then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

  try
    If Not GravaMotivoEstorno then Exit;

    frameProgresso.ResetaFrame(1, 1);

    frameProgresso.MarcaInicioFase('Alterando forma de pagamento na versão.');

    If Not frameProgresso.ProcessaQuery('HISTRUBSAL',
      'UPDATE HISTRUBSAL SET DATAPAGAMENTO = '+
      'TO_DATE('+QuotedStr(sDataProgramada)+','+QuotedStr('DD/MM/YYYY')+'),'+
      'CODPORTFORMA = '+sCodPortForma+','+
      'IDCBANCARIA = '+sIdContaBancaria,
      'WHERE '+
      ' (CODDOCUMENTO = '+sDocUnico+') AND '+
      ' (IDTITULAR = '+inttostr(lidTitular)+') AND'+
      ' (IDRESPONSAVEL = '+IntToStr(lIdRecebedor)+') AND '+
      ' (IDHSTFOLHABENEF = '+
      Inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+')',
      'Alterando forma de pagamento no Histórico de Rubricas '+
      '[HISTRUBSAL]', -1) then
    begin
      frameProgresso.ExibeMensagem('Erro ao alterar Histórico de Rubricas [HISTRUBSAL]');
      Exit;
    end;

    If Not frameProgresso.ProcessaQuery('DOCUMENTO',
      'UPDATE DOCUMENTO SET DATAPROGRAMADA = '+
      'TO_DATE('+QuotedStr(sDataProgramada)+','+QuotedStr('DD/MM/YYYY')+'),'+
      'CODPORTFORMA = '+sCodPortForma+','+
      'IDCBANCARIA = '+sIdContaBancaria,
      'WHERE (CODDOCUMENTO = '+sDocUnico+')',
      'Alterando documento', -1) then
    begin
      frameProgresso.ExibeMensagem('Erro ao alterar documento');
      Exit;
    end;

  Result:=true;
  finally
    If dtmBaseDados.dbBaseDados.Intransaction then
    begin
      If result then
      begin
        frameProgresso.Terminar('Forma de Pagamento alterado com sucesso.', true);
        dtmBaseDados.dbBaseDados.commit;
      end
      else
      begin
        frameProgresso.Terminar('Erro na alteração da Forma de Pagamento!', true);
        dtmBaseDados.dbBaseDados.rollback;
      end;
    end;
  end;
end;

function TfrmEstornaFolha.VerificaContabilizacao: boolean;
begin
  result:=false;
  lblCAPParticip.caption:='  Rubricas do Recebedor selecionado (algumas rubricas estão sem parâmetros para contabilização)';
  lblCAPParticip.font.color:=clred;
  qryCAPParticip.disablecontrols;
  qryCAPParticip.first;
  while not qryCAPParticip.eof do
  begin
    if (qryCAPParticipESTADO.asstring <> 'I') then
      if qryCAPParticipVALORPROVENTO.asfloat > 0 then
      begin
        //FAZER VERIFICAÇÃO PARA CONTA CRÉDITO E DÉBITO
        if qryCAPParticipPLACONTAC.asstring = '' then
          exit;

        qryPlano.close;
        qryPlano.parambyname('placonta').asstring:=qryCAPParticipPLACONTAC.asstring;
        qryPlano.parambyname('plano').asinteger:=IntegraBack.Plano;
        try
          qryPlano.open;
        except
          exit;
        end;

        if qryPlano.fieldbyname('placcust').asstring = 'S' then
          if qryCAPParticipCODCENTROCUSTOC.asstring = '' then
            exit;

        if qryCAPParticipPLACONTAD.asstring = '' then
          exit;

        qryPlano.close;
        qryPlano.parambyname('placonta').asstring:=qryCAPParticipPLACONTAD.asstring;
        qryPlano.parambyname('plano').asinteger:=IntegraBack.Plano;
        try
          qryPlano.open;
        except
          exit;
        end;
        if qryPlano.fieldbyname('placcust').asstring = 'S' then
          if qryCAPParticipCODCENTROCUSTOD.asstring = '' then
            exit;
      end;

    qryCAPParticip.next;
  end;
  qryCAPParticip.enablecontrols;

  if scontaliquido = '' then
    exit;
  result:=true;
  lblCAPParticip.caption:='  Rubricas do Recebedor selecionado';
  lblCAPParticip.font.color:=clnavy;
end;

function TfrmEstornaFolha.LancaContabilizacaoRecebedor(aistatusdoc : integer; var aiplncodigo: integer): boolean;
 var lUnidNegoc : longint;
     sTipoDC, sDebCre, sdataproc,
     shist1, shist2, shist3, shist4, shist5 : string;
     cCCustD, cContaD, cCCustC, cContaC, sMens: string;
     ssql: string;
     dplntemp: double;
     liPrimeiroPagamento: integer; 
     regCF: TRegContFinan; 
     lsmsg: string;
begin
  result:=false;
  qryCAPParticip.disablecontrols;

  liExercicio:=0;
  liPeriodo  :=0;
  liEmpresa := Sistema.IdEmpresa;

  aiplncodigo:=0;
  //TRATA O CASO DO ESTORNO PARA ESTORNADOS POR PAGTO PEND.
  if (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
  begin
    if aistatusdoc = 1 then
      If bDocIndividual Then
        sdataproc:=dtAlterador.text
      Else
        sdataproc := dtEvento.text
    else
      sdataproc:=dtLanctoCAR.text;
  end
  else
    sdataproc:=formatdatetime('dd/mm/yyyy', date);

  If (Sistemafolha.FLGINTEGRACONTABIL = 1) then
  begin
    if not ctrlPeriodo.RetornaPeriodoExercicioDataProc(
         liEmpresa, sdataproc) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
      exit;
    end;

    if ctrlPeriodo.TestaPeriodoBloqueadoProc(liEmpresa, tbBloqOuInt,
         ctrlPeriodo.Periodo, ctrlPeriodo.Exercicio, False) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
      exit;
    end;

    if not ctrlContab.TestaDataBloqueadaProc(liEmpresa,
         Sistema.IdModulo, sdataproc) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlContab.MessageInfo);
      exit;
    end;
  end
  else
  begin
    //Não integrado com a contabilidade
    result:=true;
    exit;
  end;

  qryCAPParticip.first;
  while not qryCAPParticip.eof do
  begin
    if (qryCAPParticipESTADO.asstring <> 'I') and
       (qryCAPParticipVALORPROVENTO.asfloat > 0) then
    begin
      try
        //USAR CONTA CRÉDITO E DÉBITO
        cCCustD:=qryCAPParticipCODCENTROCUSTOD.asstring;
        cCCustC:=qryCAPParticipCODCENTROCUSTOC.asstring;
        cContaC:=qryCAPParticipPLACONTAC.asstring;
        cContaD:=qryCAPParticipPLACONTAD.asstring;
        lUnidNegoc:=qryCAPParticipUNIDNEGOC.asinteger;
        shist1:=copy(qryCAPParticipRUBRICA.asstring,1,40);
        shist2:=copy(sNomePlano,1,40);
        shist3:=copy(dblkFolha.text,1,40);
        shist4:=copy('Estorno pgto indev. Mat:'+smatricula+' Ins:'+sinscricao,1,40);
        shist5:=copy('Cod.Rub.: '+inttostr(qryCAPParticipCODIGO.asinteger),1,40);

        if not ctrlLancamento.InsereLancaContab(
             '2', //TipoLanc,
             liEmpresa, //IdEmpresa
             Sistema.IdModulo, //iModuloOrigem
             Sistema.IdUsuario, //liUsuario
             IntegraBack.Plano, //liCodPlano
             lUnidNegoc, //liUnidNegoc
             0, //liSubContaDeb
             0, //liSubContaCre
             qryCAPParticipIDPLANOCONTABIL.asinteger, //iPlanoPrev
             lidPatro, //iPatro
             aiplncodigo, //liPlnCodigo
             0, //iNumLan
             sDataProc, //sDataLanc
             '', //sNumDoc
             shist1, //sHist1
             shist2, //sHist2
             shist3, //sHist3
             shist4, //sHist4
             shist5, //sHist5
             prmTipCodigo, //sTipoOper
             cCCustC, //cCCustd-inversão do tipo pois é estorno
             cContaC, //cContad-inversão do tipo pois é estorno
             cCCustD, //cCCustc-inversão do tipo pois é estorno
             cContaD, //cContac-inversão do tipo pois é estorno
             '', //sCodHist
             qryCAPParticipVALORPROVENTO.asfloat, //rValLanc
             true, //bJunta
             Sistema.UsaPlanoPatro, //bUsaPlanoPatro
             -1, //iIdSegregaCriter
             -1 //dDataSegregaCriter
             ) then
        begin
          frameProgresso.ExibeMensagem('Erro no lançamento contábil.');
          frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
          exit;
        end;
        dplntemp:=ctrlLancamento.RetornoPlnCodigo;
        aiplncodigo:=round(dplntemp);
      except
        on e:exception do
        begin
          frameProgresso.ExibeMensagem('Erro no lançamento contábil.');
          frameProgresso.ExibeMensagem(e.message);
          exit;
        end;
      end;
    end;

    qryCAPParticip.next;
  end;

  //Grava número da planilha na tabela de MotivoEstornoFB
  //ESTORNA LANÇAMENTOS DE PROVISÃO DE ABONO
  if not qryHist.fieldbyname('PLNPROVISABONO').isnull then
  begin
    //VERIFICA SE PODE OBTER OS VALORES DE CONTABILIZAÇÃO GRAVADOS NA PRÉVIA
    ssql:=
      'SELECT SEQRUBRICA, IDRUBRICA '+_clinefeed+
      'FROM HISTRUBSAL '+_clinefeed+
      'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
      'AND IDTITULAR = '+inttostr(lidTitular)+' '+_clinefeed+
      'AND IDRESPONSAVEL = '+inttostr(lidRecebedor)+' '+_clinefeed+
      'MINUS '+_clinefeed+
      'SELECT P.SEQRUBRICA, P.IDRUBRICA '+_clinefeed+
      'FROM PREVIA P, LOTEXHSTFOLHABENEF L '+_clinefeed+
      'WHERE L.IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
      'AND L.IDLOTE = P.IDLOTE '+_clinefeed+
      'AND L.FLGTIPOLOTE = ''B'' '+_clinefeed+
      'AND P.IDTITULAR = '+inttostr(lidTitular)+' '+_clinefeed+
      'AND P.IDRESPONSAVEL = '+inttostr(lidRecebedor)+' '+_clinefeed;

    if not FazQuery(qryAux,ssql) then 
    //Efetua os lançamentos pela Previa original
    begin
      frameProgresso.MarcaInicioFase('Geração de contabilização da provisão de abono anual.');

      //* MONTA PLANILHA CONTABIL DE PROVISÃO EM PARTIDA DOBRADA DA PREVIA */
      ssql:=
        'SELECT SUM(H.VALORPROVENTO)/12 AS VALOR, HH.HISTORICO, ' +_clinefeed+ //COLOCAR 1 DOZE AVOS NO VALOR
        '       H.IDPATRO, H.IDPLANOCONTABIL, H.PLANO, ' +_clinefeed+
        '       H.PLACONTACPROVIS, '+_clinefeed+
        '       H.PLACONTADPROVIS, '+_clinefeed+
        '       H.CODCCUSTOCPROVIS, '+_clinefeed+
        '       H.CODCCUSTODPROVIS, '+_clinefeed+
        '       H.UNIDNEGOC, ' +_clinefeed+
        '       PL.NOME AS NOMEPLANO, ' +_clinefeed+
        '       H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' +_clinefeed+
        'FROM LOTEXHSTFOLHABENEF L, PREVIA H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL ' +_clinefeed+
        'WHERE L.IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
        'AND L.FLGTIPOLOTE = ''B'' '+_clinefeed+
        'AND L.IDLOTE = H.IDLOTE '+_clinefeed+
        'AND H.IDTITULAR = '+inttostr(lidTitular)+' '+_clinefeed+
        'AND H.IDRESPONSAVEL = '+inttostr(lidRecebedor)+' '+_clinefeed+
        'AND H.FLGTEMPROVISAO = 1 '+_clinefeed+
        'AND L.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' +_clinefeed+
        'AND H.IDRUBRICA = P.IDPROVENTO ' +_clinefeed+
        'AND H.FLGESPECIAL = 0 ' +_clinefeed+
        'AND H.FLGDESCONTO IN (0,1) ' +_clinefeed+
        'AND PL.IDPLANOPREV = H.IDPLANOCONTABIL ' +_clinefeed+
        'GROUP BY HH.HISTORICO, H.IDPATRO, H.IDPLANOCONTABIL, '+_clinefeed+
        '         H.PLANO, H.PLACONTACPROVIS, H.PLACONTADPROVIS, ' +_clinefeed+
        '         H.CODCCUSTOCPROVIS, H.CODCCUSTODPROVIS, '+_clinefeed+
        '         H.UNIDNEGOC, PL.NOME, ' +_clinefeed+
        '         H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' +_clinefeed+
        'HAVING SUM(H.VALORPROVENTO) > 0 ';

      if FazQuery(qryAux, ssql) then
      begin
        while not qryAux.eof do
        begin
          sHist1:=copy(qryAux.fieldbyname('CODPROVDESC').asstring+'-'+
                       qryAux.fieldbyname('DESCRICAO').asstring,1,40);
          sHist2:=copy(qryAux.fieldbyname('NOMEPLANO').asstring,1,40);
          sHist3:=copy(qryAux.fieldbyname('HISTORICO').asstring,1,40);
          if qryAux.fieldbyname('FLGDESCONTO').asinteger = 0 then
          begin
            sHist4:='Estorno provisão pagamento de';
            sHist5:='beneficio sobre abono anual';
          end
          else
          begin
            sHist4:='Estorno de provisão receita de';
            sHist5:='contribuição sobre abono anual';
          end;

          try
            if not ctrlLancamento.InsereLancaContab(
                 '2', //cTipoLanc
                 liEmpresa, //IdEmpresa
                 Sistema.IdModulo, //iModuloOrigem
                 Sistema.IdUsuario, //liUsuario
                 IntegraBack.Plano, //liCodPlano
                 qryAux.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                 0, //liSubContaDeb
                 0, //liSubContaCre
                 qryAux.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                 qryAux.fieldbyname('IDPATRO').asinteger, //iPatro
                 aiplncodigo, //liPlnCodigo
                 0, //iNumLan
                 sDataProc, //sDataLanc
                 '', //sNumDoc
                 shist1, //sHist1
                 shist2, //sHist2
                 shist3, //sHist3
                 shist4, //sHist4
                 shist5, //sHist5
                 prmTipCodigo, //sTipoOper
                 qryAux.fieldbyname('CODCCUSTOCPROVIS').asstring, //cCCustd-inversão do tipo pois é estorno
                 qryAux.fieldbyname('PLACONTACPROVIS').asstring, //cContad-inversão do tipo pois é estorno
                 qryAux.fieldbyname('CODCCUSTODPROVIS').asstring, //cCCustc-inversão do tipo pois é estorno
                 qryAux.fieldbyname('PLACONTADPROVIS').asstring, //cContac-inversão do tipo pois é estorno
                 '', //sCodHist
                 qryAux.fieldbyname('VALOR').AsFloat, //rValLanc
                 true, //bJunta
                 Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                 -1, //iIdSegregaCriter
                 -1 //dDataSegregaCriter
                 ) then
            begin
              frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para estorno da provisão de abono anual !!!');
              frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
              frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
              exit;
            end;
            dplntemp:=ctrlLancamento.RetornoPlnCodigo;
            aiplncodigo:=round(dplntemp);
          except
            on e:exception do
            begin
              frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para estorno da provisão de abono anual !!!');
              frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
              frameProgresso.ExibeMensagem(e.message);
              frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
              exit;
            end;
          end;
          qryAux.next;
        end;
      end;
    end
    else
    //Efetua os lançamentos obtendo os dados da parametrização corrente
    begin
      //VERIFICA SE É PRIMEIRO PAGAMENTO (CONCESSÃO)
      ssql:=
        'SELECT MIN(H.MES) AS MES '+_clinefeed+
        'FROM HSTBENEFBFCIARIO H, BFCIARIOTITPLAN B '+_clinefeed+
        'WHERE H.IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
        'AND B.IDPESSJUR = '+inttostr(lidPatro)+' '+_clinefeed+
        'AND B.IDPLANOPREV = '+inttostr(lidPlanoPrev)+' '+_clinefeed+
        'AND B.IDTITULAR = '+inttostr(lidTitular)+' '+_clinefeed+
        'AND B.IDRESPONSAVEL = '+inttostr(lidRecebedor)+' '+_clinefeed+
        'AND H.IDTITULAR = B.IDTITULAR '+_clinefeed+
        'AND H.IDPESSOA = B.IDPESSOA '+_clinefeed+
        'AND H.IDPLANOPREV = B.IDPLANOPREV '+_clinefeed+
        'AND H.IDPLANOORIGEM = B.IDPLANOORIGEM'+_clinefeed+
        'AND H.IDPESSJUR = B.IDPESSJUR '+_clinefeed+
        'AND H.IDBENEFICIO = B.IDBENEFICIO '+_clinefeed+
        'AND H.SEQPROPOSTA = B.SEQPROPOSTA '+_clinefeed;

      if FazQuery(qryAux, ssql) then
      begin
        if (qryAux.fieldbyname('MES').asstring = qryHist.FieldByName('MESREFERENCIA').asstring) then
          liPrimeiroPagamento:=1
        else
          liPrimeiroPagamento:=0;
      end
      else
        liPrimeiroPagamento:=0;

      ssql:=
        'SELECT SUM(H.VALORPROVENTO)/12 AS VALOR, HH.HISTORICO, ' +_clinefeed+ //COLOCAR 1 DOZE AVOS NO VALOR
        '       H.IDPATRO, H.IDPLANOCONTABIL, ' +_clinefeed+
        '       PL.NOME AS NOMEPLANO, ' +_clinefeed+
        '       H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' +_clinefeed+
        'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL ' +_clinefeed+
        'WHERE H.IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+_clinefeed+
        'AND H.IDTITULAR = '+inttostr(lidTitular)+' '+_clinefeed+
        'AND H.IDRESPONSAVEL = '+inttostr(lidRecebedor)+' '+_clinefeed+
        'AND H.FLGTIPODESC IN (''B'', ''P'') '+_clinefeed+
        'AND H.IDRUBRICA = P.IDPROVENTO ' +_clinefeed+
        'AND H.FLGESPECIAL = 0 ' +_clinefeed+
        'AND H.FLGDESCONTO IN (0,1) ' +_clinefeed+
        'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF '+_clinefeed+ 
        'AND SUBSTR(H.MES,6,2) <> ''13'' '+_clinefeed+
        'AND (   (H.FLGDESCONTO = 0 AND H.FLGTIPODESC = ''B'') '+_clinefeed+
        '     OR (H.FLGDESCONTO = 1 AND H.FLGTIPODESC = ''P'')) '+_clinefeed+
        'AND PL.IDPLANOPREV = H.IDPLANOCONTABIL ' +_clinefeed;

      if liPrimeiroPagamento = 0 then
        ssql:=ssql+
          'AND H.MES = H.MESCOBRANCA ' +_clinefeed;

      ssql:=ssql+
        'GROUP BY HH.HISTORICO, H.IDPATRO, H.IDPLANOCONTABIL, '+_clinefeed+
        '         PL.NOME, ' +_clinefeed+
        '         H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' +_clinefeed+
        'HAVING SUM(H.VALORPROVENTO) > 0 ';

      if FazQuery(qryAux, ssql) then
      begin
        while not qryAux.eof do
        begin
          sHist1:=copy(qryAux.fieldbyname('CODPROVDESC').asstring+'-'+
                       qryAux.fieldbyname('DESCRICAO').asstring,1,40);
          sHist2:=copy(qryAux.fieldbyname('NOMEPLANO').asstring,1,40);
          sHist3:=copy(qryAux.fieldbyname('HISTORICO').asstring,1,40);
          if qryAux.fieldbyname('FLGDESCONTO').asinteger = 0 then
          begin
            sHist4:='Estorno provisão pagamento de';
            sHist5:='beneficio sobre abono anual';
          end
          else
          begin
            sHist4:='Estorno de provisão receita de';
            sHist5:='contribuição sobre abono anual';
          end;

          fillchar(regCF, sizeof(regCF), 0);
          dtmContabil.PegaTipoDescP_Y(
            'P',
            false,
            qryAux.fieldbyname('IDPATRO').asinteger,
            qryAux.fieldbyname('IDPLANOCONTABIL').asinteger,
            qryAux.fieldbyname('IDPLANOCONTABIL').asinteger,
            qryAux.fieldbyname('IDRUBRICA').asinteger,
            qryAux.fieldbyname('FLGDESCONTO').asinteger,
            qryHist.FieldByName('MESREFERENCIA').asstring,
            qryHist.FieldByName('MESREFERENCIA').asstring, 
            0,
            0,
            true,
            '',
            true, 
            lidTitular, 
            regCF,
            lsmsg);

          try
            if not ctrlLancamento.InsereLancaContab(
                 '2', //cTipoLanc
                 liEmpresa, //IdEmpresa
                 Sistema.IdModulo, //iModuloOrigem
                 Sistema.IdUsuario, //liUsuario
                 IntegraBack.Plano, //liCodPlano
                 regCF.UnidNegoc, //liUnidNegoc
                 0, //liSubContaDeb
                 0, //liSubContaCre
                 qryAux.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                 qryAux.fieldbyname('IDPATRO').asinteger, //iPatro
                 aiplncodigo, //liPlnCodigo
                 0, //iNumLan
                 sDataProc, //sDataLanc
                 '', //sNumDoc
                 shist1, //sHist1
                 shist2, //sHist2
                 shist3, //sHist3
                 shist4, //sHist4
                 shist5, //sHist5
                 prmTipCodigo, //sTipoOper
                 regCF.CentroCustoCProvisAbono, //cCCustd-inversão do tipo pois é estorno
                 regCF.PlaContaCProvisAbono, //cContad-inversão do tipo pois é estorno
                 regCF.CentroCustoDProvisAbono, //cCCustc-inversão do tipo pois é estorno
                 regCF.PlaContaDProvisAbono, //cContac-inversão do tipo pois é estorno
                 '', //sCodHist
                 qryAux.fieldbyname('VALOR').AsFloat, //rValLanc
                 true, //bJunta
                 Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                 -1, //iIdSegregaCriter
                 -1 //dDataSegregaCriter
                 ) then
            begin
              frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para estorno da provisão de abono anual !!!');
              frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
              frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
              exit;
            end;
            dplntemp:=ctrlLancamento.RetornoPlnCodigo;
            aiplncodigo:=round(dplntemp);
          except
            on e:exception do
            begin
              frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para estorno da provisão de abono anual !!!');
              frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
              frameProgresso.ExibeMensagem(e.message);
              frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
              exit;
            end;
          end;
          qryAux.next;
        end;
      end;
    end;
  end;

  ssql:='UPDATE MOTIVOESTORNOFB '+
        'SET PLNCODIGO = '+inttostr(aiplncodigo)+' '+
        'WHERE IDHSTFOLHABENEF = '+inttostr(qryHist.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+
        'AND IDPESSJUR = '+inttostr(lidPatro)+' '+
        'AND IDPLANOPREV = '+inttostr(lidPlanoPrev)+' '+
        'AND IDTITULAR = '+inttostr(lidTitular)+' '+
        'AND IDRECEBEDOR = '+inttostr(lidRecebedor)+' '+
        'AND TIPOESTORNO = '+inttostr(ioperacao)+' ';
  if not ExecutarQuery(qryAux, ssql) then
    frameProgresso.ExibeMensagem('Erro ao gravar planilha contábil do estorno')
  else
    result:=true;

  qryCAPParticip.enablecontrols;
  result:=true;
end;

{-------------------------------------------------------------------------------
| EVENTOS ASSOCIADOS AO FORM                                                   |
-------------------------------------------------------------------------------}
procedure TfrmEstornaFolha.FormCreate(Sender: TObject);
var lssql: string;
begin
  inherited;
  ctrlDocumento:=tctrlDocumento.create;
  ctrlDocumento.InitializeAs(Padroes);
  ctrlLancamento:=tctrlLancamento.create;
  ctrlLancamento.InitializeAs(Padroes);
  ctrlPeriodo:=tctrlPeriodo.create;
  ctrlPeriodo.InitializeAs(Padroes);
  ctrlContab:=tctrlContab.create;
  ctrlContab.InitializeAs(Padroes);
  dtmcontabil.AlocaListas;

  CtrlFinanc:= TCtrlFinanc.Create(sistema.IdEmpresa, sistema.IdModulo, sistema.IdUsuario, true); // SOL 255246 PPM 816785
  CtrlFinanc.InitializeAs(Padroes); // SOL 255246 PPM 816785
  CtrlFinanc.OpenTransaction := False; // SOL 255246 PPM 816785

  lssql:=
    'SELECT H.MES, '+_clinefeed+
    '       H.PLACONTAC, '+_clinefeed+
    '       H.PLACONTAD, '+_clinefeed+
    '       H.CODCENTROCUSTOC, '+_clinefeed+
    '       H.CODCENTROCUSTOD, '+_clinefeed+
    '       H.CODSUBCONTA, '+_clinefeed+
    '       H.UNIDNEGOC, '+_clinefeed+
    '       PD.IDPROVENTO AS CODIGO, '+_clinefeed+
    '       PD.DESCRICAO AS RUBRICA, '+_clinefeed;

  if prmFLGUSACODRUBEXT = 0 then
    lssql:=lssql+
      '       TO_CHAR(PD.IDPROVENTO) AS CODRUBEXIBICAO, '+_clinefeed+
      '       PD.DESCRICAO AS DESCRUBEXIBICAO, '+_clinefeed
  else
    lssql:=lssql+
      '       PD.CODPROVDESC AS CODRUBEXIBICAO, '+_clinefeed+
      '       PD.DESCRPROVDESC AS DESCRUBEXIBICAO, '+_clinefeed;

  lssql:=lssql+
    '       DECODE(NVL(H.FLGESPECIAL,PD.FLGESPECIAL),0,'+
    'DECODE(NVL(H.FLGDESCONTO,PD.FLGDESCONTO),0,''P'',1,''D'',''I''),''I'') AS ESTADO, '+_clinefeed+
    '       H.VALORPROVENTO, '+_clinefeed+
    '       DECODE(H.FLGESTORNO, '+_clinefeed+
    '              Null, ''PAGAMENTO NORMAL'', '+_clinefeed+
    '              0,    ''PAGAMENTO NORMAL'', '+_clinefeed+
    '              1,    ''PAGAMENTO PENDENTE'') AS SITUACAO, '+_clinefeed+
    '       H.FLGESTORNO, '+_clinefeed+
    '       NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOCONTABIL, '+_clinefeed+
    '       H.VALORPROVENTO AS VALOR '+_clinefeed+
    'FROM HISTRUBSAL H, PROVDESC PD '+_clinefeed+
    'WHERE H.IDHSTFOLHABENEF = :PIDHSTFOLHABENEF '+_clinefeed+
    'AND H.IDTITULAR = :PIDTITULAR '+_clinefeed+
    'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL '+_clinefeed+
    'AND H.IDRUBRICA = PD.IDPROVENTO '+_clinefeed+
    'AND NVL(H.FLGESTORNO,0) IN (0,1) '+_clinefeed+
    'ORDER BY H.SEQRUBRICA '+_clinefeed;

  qryCAPParticip.sql.clear;
  qryCAPParticip.sql.add(lssql);
  qryCAPParticip.ParamByName('PIDHSTFOLHABENEF').datatype:=ftfloat;
  qryCAPParticip.ParamByName('PIDRESPONSAVEL').datatype:=ftfloat;
  qryCAPParticip.ParamByName('PIDTITULAR').datatype:=ftfloat;

  tbsDadosIndividual.tabvisible:=false;
  pgCtrlEstorno.activepage:=tbsCAP;
  lidRecebedor:=0;
  lidpessoa:=0;
  lIdPagador:=0;
  qryCtrlInterface.open;

  lssql:=
    'SELECT IDHSTFOLHABENEF, '+_clinefeed+
    '       IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO, '+_clinefeed+
    '       MESREFERENCIA, '+_clinefeed+
    '       DATAPREVPAGTO, '+_clinefeed+
    '       FLGESTADO, '+_clinefeed+
    '       FLGTIPOFOLHA, '+_clinefeed+
    '       PLNPROVISABONO '+_clinefeed+ 
    'FROM HSTFOLHABENEF '+_clinefeed+
    'WHERE (FLGESTADO IS NULL) OR (FLGESTADO IN (0,1)) '+_clinefeed+
    'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+_clinefeed+
    'ORDER BY IDHSTFOLHABENEF DESC '+_clinefeed;
  qryHist.sql.clear;
  qryHist.sql.add(lssql);
  qryHist.open;
  qryDocumentos.prepare;

  qryAlteradorCAPOriginal.close;
  qryAlteradorCAPOriginal.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAlteradorCAPOriginal.open;

  qryAlterador.close;
  qryAlterador.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAlterador.Open;

  qryPortPagamento.close;
  qryPortPagamento.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryPortPagamento.Open;

  qryPortRecebimento.close;
  qryPortRecebimento.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryPortRecebimento.Open;

  qryCentRespon.close;
  qryCentRespon.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCentRespon.Open;

  qryUnidNegoc.close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;

  qryTipoDesembolso.close;
  qryTipoDesembolso.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryTipoDesembolso.Open;

  qryTipoRecebimento.close;
  qryTipoRecebimento.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryTipoRecebimento.Open;

  qryTipoDocCAP.open;
  qryTipoDocCAR.open;

  qryTipoEventoDocum.Open;

  qryPlanilha.Prepare;
  qryContab.Prepare;
  qryParticip.Prepare;

  AbreQryCAP;

  dtmContabil.AbreQryContabFinan; 

  WindowState := wsMaximized;
end;

procedure TfrmEstornaFolha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ctrlDocumento.Free;
  ctrlLancamento.free;
  ctrlPeriodo.free;
  ctrlContab.free;
  dtmcontabil.DesalocaListas;

  frameProgresso.Encerra;
  qryHist.Close;
  qryCAP.Close;
  qryPlanilha.Close;
  qryContab.Close;
  qryParticip.Close;
end;

{-------------------------------------------------------------------------------
| EVENTOS ASSOCIADOS A VERSAO DA FOLHA                                         |
-------------------------------------------------------------------------------}
procedure TfrmEstornaFolha.dblkFolhaExit(Sender: TObject);
begin
  inherited;
  if bbtnSair.Focused then
    exit;
  if dblkfolha.LookupValue = '' then
  begin
    MsgDlg('Escolha um histórico de folha. ','Erro',mtError,[mbOk,mbHelp],0);
    dblkfolha.SetFocus;
    gbOpcoesEstorno.enabled:=false;
  end;
end;

procedure TfrmEstornaFolha.dblkFolhaChange(Sender: TObject);
begin
  inherited;
  if dblkfolha.LookupValue <> '' then
  begin
    lidVersao:=qryHist.fieldbyname('idhstfolhabenef').asinteger;
    mmMotivo.enabled:=true;
    gbOpcoesEstorno.enabled:=true;
    VerificaStatusDocumentosVersao;
    AbreQryCAP;
  end;

  HabilitaProcessar(sender); // Alterado por FHBS - 07/02/2019 - SIG80034
end;

procedure TfrmEstornaFolha.rbEstornoClick(Sender: TObject);
begin
  inherited;
  pnlRecebedor.visible:=rbEstornoIndividual.checked;
  pnlRubricaIndividual.visible:=lidrecebedor > 0;
  if rbEstornoCompleto.checked then
  begin
    lblCAP.caption:='  Documentos da Versão selecionada';
    if lidrecebedor > 0 then
      fcsbtnLimpaClick(Sender);
    ioperacao:=0;
  end;
  HabilitaProcessar(sender);
end;

procedure TfrmEstornaFolha.rbEstornoIndividualClick(Sender: TObject);
begin
  inherited;
  redInformacao.visible:=true;
  //CONTROLE VISIBILIDADE NO CASO DO ESTORNO PARA ESTORNADOS POR PAGTO PEND.
  if (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
  begin
    tbsIndividualAlterador.tabvisible:=not bbaixado;
    tbsIndividualCAR.tabvisible:=bbaixado;
  end
  else
  begin
    tbsIndividualAlterador.tabvisible:=false;
    tbsIndividualCAR.tabvisible:=false;
    bbtnProcessar.enabled:=true;
  end;
  tbsIndividualNovoCAP.tabvisible:=false;
  tbsIndividualReprocessamento.tabvisible:=false;
  tbsIndividualFormaPag.tabvisible:=False;

  (* Limpa DbLookups e DateTimePicker *)
  ClearDbLookups;

  EditVlAlterador.Value:=0;

  redInformacao.lines.text:='  Informações:'+#13;
  //CONTROLE VISIBILIDADE NO CASO DO ESTORNO PARA ESTORNADOS POR PAGTO PEND.
  if (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
  begin
    If Not rbAlterarFormaPag.checked then
    begin
      if (not bbaixado) then
        redInformacao.lines.text:=redInformacao.lines.text+
          '1) Preencher o alterador a ser lançado para o documento original, que '+
          'ainda não foi baixado, com o valor líquido do contra-cheque do Recebedor.'+#13
      else
      begin
        if lidrecebedor = lidPagador then
          redInformacao.lines.text:=redInformacao.lines.text+
            '1) Preencher os dados para o Contas a Receber contra o Banco, pois o '+
            'documento original já foi baixado, com o valor líquido do contra-cheque do Recebedor.'+#13
        else
          redInformacao.lines.text:=redInformacao.lines.text+
            '1) Preencher os dados para o Contas a Receber contra o Recebedor, '+
            'pois o documento original já foi baixado, com o valor líquido do contra-cheque do Recebedor.'+#13;
      end;
    end;
  end
  else
  begin
    redInformacao.lines.text:=redInformacao.lines.text+
      '1) Como já ocorreu anteriormente um estorno por pagamento pendente, '+
      'não é necessário o preenchimento de alterador ou contas a receber.'+#13;
  end;

  if rbPagamentoPendente.checked then
  begin
    ioperacao:=(ord(bbaixado)+1)*10+1;
    redInformacao.lines.text:=redInformacao.lines.text+
      '2) O histórico de rubricas do Recebedor fica marcado como pendente para posterior pagamento.'+#13+
      '3) Nada é realizado em termos contábeis.';
  end
  else
    if rbErroProcesso.checked then
    begin
      ioperacao:=(ord(bbaixado)+1)*10+2;
      redInformacao.lines.text:=redInformacao.lines.text+
        '2) O histórico de rubricas do Recebedor fica marcado como estornado como pagamento indevido.'+#13+
        '3) Lança a contabilização de inversa das respectivas rubricas.'+#13+
        '4) Verifique os parâmetros contábeis e financeiros associados às rubricas do recebedor.'+#13+
        '5) Caso algum parâmetro necessário esteja ausente é preciso se fazer a parametrização na tela de rubricas por plano.';
    end
    else
      if rbNovoCAP.checked then
      begin
        ioperacao:=(ord(bbaixado)+1)*10+3;
        tbsIndividualNovoCAP.tabvisible:=true;
        redInformacao.lines.text:=redInformacao.lines.text+
          '2) Preencher os dados para o novo Contas a Pagar para o Recebedor, '+
          'com o valor líquido do contra-cheque do Recebedor.'+#13+
          '3) O novo documento, que ficará em aberto no Contas a Pagar até '+
          'que seja efetivado o seu pagamento, passa a ser parte integrante '+
          'do histórico da Versão em questão.'+#13+
          '4) O histórico de rubricas do Recebedor fica inalterado.';
      end
      else
        if rbReprocessamento.checked then
        begin
          ioperacao:=(ord(bbaixado)+1)*10+4;
          tbsIndividualReprocessamento.tabvisible:=true;
          redInformacao.lines.text:=redInformacao.lines.text+
            '2) O histórico de rubricas do Recebedor fica marcado como estornado para reprocessamento.'+#13+
            '3) Lança a contabilização de inversa das respectivas rubricas.'+#13+
            '4) Verifique os parâmetros contábeis e financeiros associados às rubricas do recebedor.'+#13+
            '5) Caso algum parâmetro necessário esteja ausente é preciso se fazer a parametrização na tela de rubricas por plano.'+#13+
            '6) Os benefícios a serem pagos serão colocados no lote selecionado para reprocessamento.';
      end
      else
        if rbAlterarFormaPag.checked then
        begin
          ioperacao:=(ord(Not bBaixado)+1)*10+5;
          qryPortPagamento.First;
          tbsIndividualFormaPag.tabvisible:=Not bBaixado;
          tbsIndividualAlterador.tabvisible:=False;
          tbsIndividualAlterador.tabvisible:=False;
          tbsIndividualCAR.tabvisible:=False;
          tbsIndividualNovoCAP.tabvisible:=false;
          tbsIndividualReprocessamento.tabvisible:=false;
          With qryContaRecebedor do
          begin
            Close;
            ParamByName('IDPESSOA').Value:=lIdRecebedor;
            Open;
            {tbsIndividualFormaPag.tabvisible:=Not IsEmpty;}
            {If IsEmpty then
              MsgDlg('Não existe conta cadastrada para o recebedor.','Aviso',mtWarning,[mbOk,mbHelp],0);}
          end;
          redInformacao.lines.text:=redInformacao.lines.text+
          '1) Preencher os dados para alteração da Forma de Pagamento.';
        end;

  tbsIndividualCAR.enabled:=tbsIndividualCAR.tabvisible;
  tbsIndividualNovoCAP.enabled:=tbsIndividualNovoCAP.tabvisible;
  tbsIndividualAlterador.enabled:=tbsIndividualAlterador.tabvisible;
  tbsIndividualReprocessamento.enabled:=tbsIndividualReprocessamento.tabvisible;
  tbsIndividualFormaPag.enabled:=tbsIndividualFormaPag.tabvisible;

  HabilitaProcessar(sender);
end;

{-------------------------------------------------------------------------------
| EVENTOS DOS COMPONENTES                                                      |
-------------------------------------------------------------------------------}
procedure TfrmEstornaFolha.HabilitaProcessar(Sender: TObject);
    {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
     00 - estorno completo da folha
     11 - pagamento pendente com alterador (CAP não baixado)
     12 - estorno por erro com alterador (CAP não baixado)
     13 - novo CAP com alterador (CAP não baixado)
     14 - reprocessamento com alterador (CAP não baixado)
     21 - pagamento pendente com CAR (banco) (CAP baixado)
     22 - estorno por erro com CAR (pagador) (CAP baixado)
     23 - novo CAP com CAR (pagador) (CAP baixado)
     24 - reprocessamento com CAR (pagador) (CAP baixado)
     25 - alteração da forma de pagamento (documento com único recebedor}
begin
  bbtnProcessar.enabled:=false;

  If (trim(mmMotivo.text) = '') Then
  Begin
    exit;
  End;

  If rbEstornoCompleto.checked Then
  Begin
    bbtnProcessar.enabled:=true
  End  
  Else
  Begin
    If rbEstornoIndividual.checked Then
    Begin
      If lidrecebedor = 0 Then
      Begin
        exit;
      End;

      //verifica parametros do estorno individual
      Case ioperacao Of
        11: Begin
              If bDocIndividual Then
                bbtnProcessar.enabled := (dblkAlteradorCAPOriginal.text <> '') and (dtAlterador.text <> '')
              Else
                bbtnProcessar.enabled := (dblkTipoEvento.text <> '') and (dtEvento.text<>'');
            End;
        12: Begin
              //CONTROLE VISIBILIDADE NO CASO DO ESTORNO PARA ESTORNADOS POR PAGTO PEND.
              If (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
              Begin
                If bDocIndividual Then
                  bbtnProcessar.enabled := (dblkAlteradorCAPOriginal.text <> '') and (dtAlterador.text <> '')
                Else
                  bbtnProcessar.enabled := (dblkTipoEvento.text <> '') and (dtEvento.text<>'');
              End
              Else
              Begin
                bbtnProcessar.enabled:=VerificaContabilizacao;
              End;
            End;
        13: Begin
              If bDocIndividual Then
                bbtnProcessar.enabled:=(dblkAlteradorCAPOriginal.text<>'') and
                  (dblkNovoPortForma.text<>'') and
                  (dblkUnidNegoc.text<>'') and
                  (dblkCentRespon.text<>'') and
                  (dblkTipoDesemb.text<>'') and
                  (dblkCAPTipoDoc.text<>'') and
                  (dtenvioCAP.text<>'') and
                  (dtvenctoCAP.text <> '' )
              Else
                bbtnProcessar.enabled := ( dblkTipoEvento.text           <> '' ) and
                                         ( dblkNovoPortForma.text        <> '' ) and
                                         ( dblkUnidNegoc.text            <> '' ) and
                                         ( dblkCentRespon.text           <> '' ) and
                                         ( dblkTipoDesemb.text           <> '' ) and
                                         ( dblkCAPTipoDoc.text           <> '' ) and
                                         ( dtenvioCAP.text               <> '' ) and
                (dtvenctoCAP.text<>'');
            End;
        14: Begin
              If bDocIndividual Then
                bbtnProcessar.enabled:=(dblkAlteradorCAPOriginal.text<>'') and
                                       (dtAlterador.text <> '')  and
                                       ((ckVoltaPreparo.Checked) or (cmbLote.text<>'')) and
                                       VerificaContabilizacao
              Else
                bbtnProcessar.enabled := (dblkTipoEvento.text <> '') and
                                         (dtEvento.text<>'')and
                                         ((ckVoltaPreparo.Checked) or (cmbLote.text<>'')) and
                                         VerificaContabilizacao;
            End;
        21: Begin
              bbtnProcessar.enabled:=(dblkCARPortadorForma.text<>'') and
                (dblkCARUnidNegoc.text<>'') and
                (dblkCARCentroRespon.text<>'') and
                (dblkCARTipoRecebimento.text<>'') and
                (dblkCARTipoDoc.text<>'') and
                (dtLanctoCAR.text<>'') and
                (dtVenctoCAR.text<>'');
            End;
        22: Begin
              //CONTROLE VISIBILIDADE NO CASO DO ESTORNO PARA ESTORNADOS POR PAGTO PEND.
              If (qryCAPParticip.fieldbyname('FLGESTORNO').asinteger <> 1) then
              Begin
                bbtnProcessar.enabled:=(dblkCARPortadorForma.text<>'') and
                 (dblkCARUnidNegoc.text<>'') and
                 (dblkCARCentroRespon.text<>'') and
                 (dblkCARTipoRecebimento.text<>'') and
                 (dblkCARTipoDoc.text<>'') and
                 (dtLanctoCAR.text<>'') and
                 ( dtVenctoCAR.text            <> '' ) and
                 VerificaContabilizacao;
              End
              Else
              Begin
                bbtnProcessar.enabled:=VerificaContabilizacao;
              End;
            End;
        23: Begin
              bbtnProcessar.enabled:=(dblkCARPortadorForma.text<>'') and
                (dblkCARUnidNegoc.text<>'') and
                (dblkCARCentroRespon.text<>'') and
                (dblkCARTipoRecebimento.text<>'') and
                (dblkCARTipoDoc.text<>'') and
                (dtLanctoCAR.text<>'') and
                (dtVenctoCAR.text<>'') and
                (dblkNovoPortForma.text<>'') and
                (dblkUnidNegoc.text<>'') and
                (dblkCentRespon.text<>'') and
                (dblkTipoDesemb.text<>'') and
                (dblkCAPTipoDoc.text<>'');
            End;
        24: Begin
              bbtnProcessar.enabled:=(dblkCARPortadorForma.text<>'') and
                                     (dblkCARUnidNegoc.text<>'') and
                                     (dblkCARCentroRespon.text<>'') and
                                     (dblkCARTipoRecebimento.text<>'') and
                                     (dblkCARTipoDoc.text<>'') and
                                     (dtLanctoCAR.text<>'') and
                                     (dtVenctoCAR.text<>'') and
                                     (cmbLote.text<>'') and
                                     VerificaContabilizacao;
            End;
        25: Begin
              bbtnProcessar.enabled:=(dblkPortForma.LookupValue<>'') and
                (dtDataProg.text<>'');
            End;
      End;
    End;
  End;
end;

procedure TfrmEstornaFolha.dtLanctoCARExit(Sender: TObject);
 var sMens: string;
begin
  inherited;
  liExercicio:=0;
  liPeriodo  :=0;
  liEmpresa := Sistema.IdEmpresa;
  If (Sistemafolha.FLGINTEGRACONTABIL = 1) then
  begin
    if not ctrlPeriodo.RetornaPeriodoExercicioDataProc(
         liEmpresa, dtLanctoCAR.Text) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
      exit;
    end;

    if ctrlPeriodo.TestaPeriodoBloqueadoProc(liEmpresa, tbBloqOuInt,
         ctrlPeriodo.Periodo, ctrlPeriodo.Exercicio, False) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
      exit;
    end;

    if not ctrlContab.TestaDataBloqueadaProc(liEmpresa,
         Sistema.IdModulo, dtLanctoCAR.Text) then
    begin
      frameProgresso.ExibeMensagem('Erro ao gerar contabilização: ');
      frameProgresso.ExibeMensagem(ctrlContab.MessageInfo);
      exit;
    end;
  end;
end;

procedure TfrmEstornaFolha.dbgrCAPCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if ((Sender as TwwDBGrid).CalcCellCol) = 3 then
    ABrush.color:=clBackground;
end;

procedure TfrmEstornaFolha.qryPlanilhaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryContab.Close;
  qryContab.ParamByName('PLNCODIGO').AsInteger := qryPlanilha.FieldByName('PLNCODIGO').AsInteger;
  qryContab.Open;
end;

procedure TfrmEstornaFolha.dblkCARCentroResponChange(Sender: TObject);
begin
  inherited;
  if qryCentRespon.FieldByName('ANALITICOSINTET').AsString = 'S' then
  begin
    MsgDlg('Escolha SEMPRE um Centro de Responsabilidade Analítico. ','Erro', mtError, [mbOk,mbHelp], 0);
    (Sender as twwdblookupcombo).SetFocus;
  end;
end;

procedure TfrmEstornaFolha.fcsbtnProcurarClick(Sender: TObject);
 var lst: tstringlist;
begin
  inherited;
  rbPagamentoPendente.checked:=false;
  rbErroProcesso.checked:=false;
  rbNovoCAP.checked:=false;
  rbAlterarFormaPag.checked:=false;
  rbReprocessamento.checked:=false;

  lst:=tstringlist.create;
  try
    lst.addstrings(msRecebedor.filtro);
    msRecebedor.filtro.insert(0,'IDHSTFOLHABENEF = '+inttostr(lidVersao));
    msRecebedor.Executar;
    if msRecebedor.RetornouValor then
    begin
      sinscricao:=msRecebedor.ValoresChave[0];
      smatricula:=msRecebedor.ValoresChave[1];
      snomerecebedor:=msRecebedor.ValoresChave[3];
      lidTitular:=StrtoInt(msRecebedor.ValoresChave[4]);
      lidRecebedor:=StrtoInt(msRecebedor.ValoresChave[5]);
      lidPatro:=StrtoInt(msRecebedor.ValoresChave[8]);
      lidPlanoPrev:=StrtoInt(msRecebedor.ValoresChave[9]);
      lidpessoa:=StrtoInt(msRecebedor.ValoresChave[10]);
      snomeplano:=msRecebedor.ValoresChave[11];
      ctipopessoa:=IdentificaTipoPessoa(qryAux, lidTitular, lidRecebedor);
      case ctipopessoa of
        'P': edTipoPessoa.text:='Titular';
        'B': edTipoPessoa.text:='Beneficiário';
        'T': edTipoPessoa.text:='Tutor Responsável';
        'C': edTipoPessoa.text:='Consignatário';
        'N': edTipoPessoa.text:='Não Identificado';
      end;
      edNome.Text:=msRecebedor.ValoresChave[3];
      AbreQryCAP;

      bDocIndividual      := (qryCap.FieldByName('QTD').AsInteger = 1); 

      gbEvento.Left       := 305;
      gbAlterador.Left    := 305;

      gbAlterador.Visible := bDocIndividual;
      gbEvento.Visible    := Not gbAlterador.Visible;

      tbsDadosIndividual.tabvisible:=true;
      pnlRubricaIndividual.visible:=true;
      lblCAP.caption:='  Documento no Contas a Pagar onde está lançado o pagamento do Recebedor selecionado';
      HabilitaProcessar(sender);
      HabilitaEstornoIndividual;

      If FazQuery(qryAux, ' SELECT * FROM HISTRUBSAL WHERE FLGTIPODESC = ''Q'' '+
                          ' AND IDTITULAR = '+msRecebedor.ValoresChave[4]+
                          ' AND IDTITULAR <> IDPESSOA ') Then
        MsgDlg('Esse recebedor tem consignatário(s) de pensão alimentícia associado. Deve-se fazer o estorno do(s) consignatário(s) também.', 'Informação',
               mtInformation, [mbOk], 0);
    end;

  finally
    msRecebedor.filtro.clear;
    msRecebedor.filtro.addstrings(lst);
    lst.free;
  end;
end;

procedure TfrmEstornaFolha.fcsbtnLimpaClick(Sender: TObject);
begin
  inherited;
  smatricula:='';
  sinscricao:='';
  snomerecebedor:='';
  ctipopessoa:=#0;
  lidPagador:=0;
  lidTipoPagador:=0;
  lidbeneficio:=0;
  lcoddocumento:=0;
  lplncodigo:=0;
  dvalor:=0;
  bbaixado:=false;
  scontaliquido:='';
  liEmpresa:=0;
  liExercicio:=0;
  liPeriodo:=0;
  ioperacao:=0;
  lidTitular:=0;
  lidRecebedor:=0;
  lidpessoa:=0;
  lidPatro:=0;
  lidPlanoPrev:=0;
  edNome.text:='';
  edTipoPessoa.text:='';
  sDocUnico:='';
  lblCAP.caption:='  Documentos da Versão selecionada';
  tbsDadosIndividual.tabvisible:=false;
  pnlRubricaIndividual.visible:=false;
  AbreQryCAP;
  HabilitaProcessar(sender);
end;

procedure TfrmEstornaFolha.bbtnOutroClick(Sender: TObject);
begin
  inherited;
  //Reinicializar todos os elementos
  fcsbtnProcurar.Enabled:=True;
  fcsbtnLimpaClick(Sender);
  rbEstornoIndividual.checked:=false;
  rbEstornoCompleto.checked:=false;
  rbEstornoClick(sender);
  mmMotivo.lines.clear;
  rbPagamentoPendente.checked:=false;
  rbErroProcesso.checked:=false;
  rbNovoCAP.checked:=false;
  rbAlterarFormaPag.checked:=false;
  rbReprocessamento.checked:=false;

  (* Limpa DbLookups e DateTimePicker *)
  ClearDbLookups;

  lblValorAlterador.caption:='';

  lblValorCAR.caption:='';

  EditVlAlterador.Value:=0;

  lblValorCAP.caption:='';
  cmbLote.text:='';
  bbtnOutro.visible:=false;
  bbtnProcessar.visible:=true;
  pgCtrlEstorno.activepage:=tbsCAP;
end;

{-------------------------------------------------------------------------------
| EVENTOS DOS COMPONENTES PARA PROCESSO DO ESTORNO                             |
-------------------------------------------------------------------------------}
procedure TfrmEstornaFolha.bbtnProcessarClick(Sender: TObject);
 var ioperp1, ioperp2 : integer;
     Result: boolean; // SOL 255246 PPM 816785
begin
  Result := true; //SOL 255246 PPM 816785
  inherited;
  enabled:=false;

  //PARA INIBIR DESCONEXAO AUTOMATICA DO PADRAO
  tag:=9999;
  try
    if MsgDlg('O processo de estorno está pronto para iniciar. Deseja realmente continuar ? ',
              'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 1) = mrNo then
      Exit;
    dtmBaseDados.dbBaseDados.StartTransaction;
    if not Sistema.GravaLogOperacoes('Estorno de pagamento.') then
      Raise Exception.Create('Não foi possível gravar o log.')
    else
    begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
    //SOL 255246 PPM 816785 inicio
    if qryCap.FieldByName('DATAPROGRAMADA').AsDateTime  <> 0 then
    begin
      if not(CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, qryCap.FieldByName('DATAPROGRAMADA').AsDateTime)) then
      begin
          MsgDlg('O Documento não pode ser Alterado, Excluído ou Inserido Motivo: '+ CtrlFinanc.MessageInfo,
              'Aviso', mtInformation, [mbok], 0);
          exit;
      end;
    end;
    // SOL 255246 PPM 816785 Final 
    bbtnProcessar.visible:=false;
    pgCtrlEstorno.activepage:=tbsResultado;

    if rbEstornoCompleto.checked then
      EstornoFolhaCompleto
    else
      if rbEstornoIndividual.checked then
      begin
        {ioperacao: Este valor será gravado no campo TIPOESTORNO da tabela MOTIVOESTORNOFB
         00 - estorno completo da folha
         11 - pagamento pendente com alterador (CAP não baixado)
         12 - estorno por erro com alterador (CAP não baixado)
         13 - novo CAP com alterador (CAP não baixado)
         14 - reprocessamento com alterador (CAP não baixado)
         21 - pagamento pendente com CAR (banco) (CAP baixado)
         22 - estorno por erro com CAR (pagador) (CAP baixado)
         23 - novo CAP com CAR (pagador) (CAP baixado)
         24 - reprocessamento com CAR (pagador) (CAP baixado)
         25 - alteração da forma de pagamento (documento com único recebedor}
        ioperp1:=ioperacao div 10;
        ioperp2:=ioperacao mod 10;
        case ioperp2 of
          1 : EstornoPagamentoPendente(ioperp1);
          2 : EstornoErroProcesso(ioperp1);
          3 : EstornoNovoCAP(ioperp1);
          4 : EstornoReprocessamento(ioperp1);
          5 : AlterarFormaPagamento(ioperp1);
        end;
      end;

    bbtnOutro.visible:=true;
    fcsbtnProcurar.Enabled:=False;
  finally
    enabled:=true;
    tag:=0;
  end;
end;

procedure TfrmEstornaFolha.cmbLoteChange(Sender: TObject);
begin
  inherited;
  if cmbLote.text = '' then
  begin
    dbtDescricao.datasource:=nil;
    dbtMesref.datasource:=nil;
    dbtDataPagto.datasource:=nil;
    dbtDatacria.datasource:=nil;
    iIdLote:=0;
    iNumRegs:=0;
    dValorTotalLote:=0;
  end
  else
  begin
    dbtDescricao.datasource:=dsCtrlinterface;
    dbtMesref.datasource:=dsCtrlinterface;
    dbtDataPagto.datasource:=dsCtrlinterface;
    dbtDatacria.datasource:=dsCtrlinterface;
    iIdLote:=qryCtrlinterface.fieldbyname('idlote').asinteger;
    iNumRegs:=qryCtrlinterface.fieldbyname('numreg').asinteger;
    dValorTotalLote:=qryCtrlinterface.fieldbyname('vlrtotal').asfloat;
  end;
  HabilitaProcessar(sender);
end;

procedure TfrmEstornaFolha.FormShow(Sender: TObject);
begin
  inherited;
  If SistemaFolha.FLGINTEGRAFINANC = 1 then
  begin
    lblfinanc.Font.Color := clBlue;
    lblfinanc.caption := 'Integrado ao Financeiro';
  end else
  begin
    lblfinanc.Font.Color := clRed;
    lblfinanc.caption := 'Não Integrado ao Financeiro';
  end;

  If Sistemafolha.FLGINTEGRACONTABIL = 1 then
  begin
    lblContabil.Font.Color := clBlue;
    lblContabil.caption := 'Integrado a Contabilidade';
  end else
  begin
    lblContabil.Font.Color := clRed;
    lblContabil.caption := 'Não Integrado a Contabilidade';
  end;

  If SistemaFolha.FLGCAPCONTROLACPMF = 1 then
  begin
    If SistemafOLHA.CODCCUSTOFINAN = '' then
    begin
      MsgDlg('O parametro referente ao Centro de Custo para o Sistema '+#13#13+
             ' de Contas a Pagar não está preenchido. Verifique nos '+#13#13+
             'Parametros Globais do Sistema','Informação', mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;

    If SistemafOLHA.idprogramafolha = 0 then
    begin
      MsgDlg('O parametro referente ao Programa para o Sistema '+#13#13+
             ' de Contas a Pagar não está preenchido. Verifique nos '+#13#13+
             'Parametros Globais do Sistema','Informação', mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
  end;
  //Cássio Rovaroto -  SIG n 60540 - Início
  rbEstornoCompleto.Checked := True;
  rbEstornoCompleto.Enabled := False;
  rbEstornoIndividual.Enabled := False;
  gbOpcoesEstorno.Enabled := False;
  //Cássio Rovaroto -  SIG n 60540 - Fim
end;

function TfrmEstornaFolha.HabilitaTipoEstorno(IdHstFolhaBenef : Integer): Boolean;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(
  ' SELECT DISTINCT '+
    ' C.FLGTIPOFOLHA '+
  ' FROM '+
    ' LOTEXHSTFOLHABENEF L, '+
    ' CTRLINTERFACE C '+
  ' WHERE '+
//    ' IDHSTFOLHABENEF = '+IntToStr(IdHstFolhaBenef)+' AND '+ //Everson TIBERO
    ' L.IDHSTFOLHABENEF = '+IntToStr(IdHstFolhaBenef)+' AND '+ //Everson TIBERO
    ' L.IDLOTE        = C.IDLOTE ');
  qryAux.Open;
  If qryAux.FieldByName('FLGTIPOFOLHA').AsInteger In [1, 2] Then
    Result := False
  Else
    Result := True;
end;

procedure TfrmEstornaFolha.ckVoltaPreparoClick(Sender: TObject);
begin
   inherited;
   qryCtrlInterface.Close;
   
   If ckVoltaPreparo.Checked Then
      qryCtrlInterface.SQL[7] := 'AND (FLGTIPOFOLHA IN (0, 6))'
   Else
      qryCtrlInterface.SQL[7] := 'AND (FLGTIPOFOLHA = 6)';

   qryCtrlInterface.Open;

   pnlReprocessamento.Visible := Not ckVoltaPreparo.Checked;

   HabilitaProcessar(sender);
end;

procedure TfrmEstornaFolha.redInformacaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Screen.Cursor := crDefault;
end;

// SOL:122512 - Daniel Begnami
procedure TfrmEstornaFolha.EstornaMapaFolhaBenef(pIDVersao: String);
var
  qry : twwquery;
begin
  try
    qry :=TwwQuery.Create(Application);
    qry.DatabaseName:='BaseDados';
    qry.sql.Add('DELETE FROM MapaFolhaBenef ');
    qry.sql.Add('WHERE IDVERSAO = '+pIDVersao);
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;
// FIM
//MARCIO DENILSON SOL 151061 KINTANA 1105188

{comentario do SOL 207789/16618 PPM 554284 o sistema passara a trer somente a estrutura BASEDEPAGAMENTO
procedure TfrmEstornaFolha.atualizaBasePagamentoEfetivacao(psMes: String; piIdHstFolhaBenef: Integer); //BRUNO AZEVEDO SOL 252458 KINTANA 754788
var
  sSQL : String;
begin

  //BRUNO AZEVEDO SOL 252458 KINTANA 754788
  //sSQL := ' DELETE CM.BASEDEPAGAMENTOEFETIVACAO        '
  //      + ' WHERE MESCOBRANCA = :MESCOBRANCA           ';

  sSQL := ' DELETE CM.BASEDEPAGAMENTOEFETIVACAO       '
        + '  WHERE MESCOBRANCA     = :MESCOBRANCA     '
        + '    AND IDHSTFOLHABENEF = :IDHSTFOLHABENEF ';
  //BRUNO AZEVEDO SOL 252458 KINTANA 754788

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('MESCOBRANCA').AsString      := psMes;
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef; //BRUNO AZEVEDO SOL 252458 KINTANA 754788
     ExecSQL;
     Close;
     Free;
   end;
end; }

//MARCIO DENILSON SOL 151061 KINTANA 1105188
{no SOL 207789/16618 PPM 554284 o sistema passara a ter somente a estrutura BASEDEPAGAMENTO}
procedure TfrmEstornaFolha.atualizaBasePagamento(psMes: String; piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin

  //BRUNO AZEVEDO SOL 252458 KINTANA 754788
  //sSQL := ' UPDATE CM.BASEDEPAGAMENTO        '//SOL 207789/16618 PPM 554284
  //      + ' SET FLGEFETIVADO = 0                   '
  //      + '    ,IDHSTFOLHABENEF = NULL             '
  //      + ' WHERE MESCOBRANCA = :MESCOBRANCA       ';


  {comentario do SOL 207789/16618 PPM 554284
   O sistema deverá também atualizar o flag de processamento e a versão de pagamento da folha de benefícios da
   estrutura de base de pagamento, onde o flag deverá ser marcado como não processado e a versão de
   pagamento da folha de benefícios deverá ser nula (FLGEFETIVADO = 0 e IDHSTFOLHABENEF = NULL da estrutura BASEDEPAGAMENTO).}

  sSQL := ' UPDATE CM.BASEDEPAGAMENTO          '//SOL 207789/16618 PPM 554284
        + ' SET FLGEFETIVADO = 0                     '
        + '    ,IDHSTFOLHABENEF = NULL               '
        + ' WHERE MESCOBRANCA = :MESCOBRANCA         '
        + '   AND IDHSTFOLHABENEF = :IDHSTFOLHABENEF ';
  //BRUNO AZEVEDO SOL 252458 KINTANA 754788

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('MESCOBRANCA').AsString      := psMes;
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef; //BRUNO AZEVEDO SOL 252458 KINTANA 754788
     ExecSQL;
     Close;
     Free;
   end;
end;

//MARCIO DENILSON SOL 151061 KINTANA 1105188
procedure TfrmEstornaFolha.atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin   // SOL 247171 PPM 649840  inicio
  if rbEstornoIndividual.Checked then
  begin
  // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
  sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST         '
        + ' SET FLGPROCESSADO = 2                         '
        + '   , IDHSTFOLHABENEF =  NULL                   '
        + ' WHERE EXISTS                                  '
        + '(SELECT 1                                                   '
        + '         FROM PREVIA P                                      '
        + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
        + '          AND P.IDTITULAR = HST.IDTITULAR                   '
        + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
        + '          AND P.IDRESPONSAVEL = '+IntToStr(lidrecebedor)+ ' '
        + '          AND EXISTS (SELECT C.IDLOTE                       '
        + '                 FROM LOTEXHSTFOLHABENEF L                  '
        + '                INNER JOIN CTRLINTERFACE C                  '
        + '                   ON (C.IDLOTE = L.IDLOTE)                 '
        + '                WHERE (NVL(C.FLGRESGATE, 0) = 1 OR          '  // André Imakawa - SIG 41892 // Andre Imakawa - 47459
        + '                      NVL(C.FLGRESGATEPARCELADO, 0) = 1)    '  // André Imakawa - SIG 41892 // Andre Imakawa - 47459
        + '                  WHERE L.IDLOTE = P.IDLOTE                   '  // André Imakawa - SIG 41892
        + '                  AND L.IDHSTFOLHABENEF = :IDHSTFOLHABENEF))';
  // André Imakawa -  SOL 270393 - PPM 1348254 - Fim
  end
  else if rbEstornoCompleto.Checked then
  begin
     // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
     sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST         '
           + ' SET FLGPROCESSADO = 2                         '
           + '   , IDHSTFOLHABENEF =  NULL                   '
           + ' WHERE HST.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  ';
           //+ ' AND EXISTS (SELECT 1                      '
           //+ '                 FROM LOTEXHSTFOLHABENEF L                  '
           //+ '                INNER JOIN CTRLINTERFACE C                  '
           //+ '                   ON (C.IDLOTE = L.IDLOTE)                 '
           //+ '                WHERE (NVL(C.FLGRESGATE, 0) = 1 OR          '    // André Imakawa - SIG 41892
           //+ '                      NVL(C.FLGRESGATEPARCELADO, 0) = 1)    '    // André Imakawa - SIG 41892
           //+ '                  WHERE L.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF)'; // André Imakawa - SIG 41892
     // André Imakawa -  SOL 270393 - PPM 1348254 - Fim      
  end;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
     ExecSQL;
     Close;
     Free;
   end;
   // SOL 247171 PPM 649840 Final
end;

//Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
procedure TfrmEstornaFolha.atualizaHstCalculoPMPFolha(piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin

  if rbEstornoIndividual.Checked then
  begin
      // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
      sSQL := ' UPDATE CM.HSTCALCULOPMPFOLHA HST         '
            + ' SET FLGPROCESSADO = 2                         '
            + '   , IDHSTFOLHABENEF =  NULL                   '
            + ' WHERE EXISTS                                  '
            + '(SELECT 1                                                   '
            + '         FROM PREVIA P                                      '
            + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
            + '          AND P.IDTITULAR = HST.IDTITULAR                   '
            + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
            + '          AND P.IDRESPONSAVEL = '+IntToStr(lidrecebedor)+ ' '
            + '          AND EXISTS (SELECT C.IDLOTE                       '
            + '                 FROM LOTEXHSTFOLHABENEF L                  '
            + '                INNER JOIN CTRLINTERFACE C                  '
            + '                   ON (C.IDLOTE = L.IDLOTE)                 '
            //+ '                WHERE (NVL(C.FLGRESGATE, 0) = 1 OR          '    // André Imakawa - SIG 41892
            //+ '                      NVL(C.FLGRESGATEPARCELADO, 0) = 1)    '    // André Imakawa - SIG 41892
            + '                  WHERE L.IDLOTE = P.IDLOTE                   '    // André Imakawa - SIG 41892
            + '                  AND L.IDHSTFOLHABENEF = :IDHSTFOLHABENEF))';
      // André Imakawa -  SOL 270393 - PPM 1348254 - Fim

       with TwwQuery.Create(dtmBaseDados) do
       begin
         DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
         SQL.Add(sSQL);
         ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
         ExecSQL;
         Close;
         Free;
       end;
  end
  else if rbEstornoCompleto.Checked then
  begin
      // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
      sSQL := ' UPDATE CM.HSTCALCULOPMPFOLHA HST         '
            + ' SET FLGPROCESSADO = 2                         '
            + '   , IDHSTFOLHABENEF =  NULL                   '
            + ' WHERE HST.IDHSTFOLHABENEF = :IDHSTFOLHABENEF ';
      // André Imakawa -  SOL 270393 - PPM 1348254 - Fim

       with TwwQuery.Create(dtmBaseDados) do
       begin
         DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
         SQL.Add(sSQL);
         ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
         ExecSQL;
         Close;
         Free;
       end;
  end;
end;

//MARCIO DENILSON SOL 151061 KINTANA 1105188
procedure TfrmEstornaFolha.processaIRRegressivo(psMes: String;
  piIdHstFolhaBenef: Integer);
begin
  atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef);
  atualizaHstCalculoPMPFolha(piIdHstFolhaBenef); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
  //atualizaBasePagamentoPrevia(psMes,piIdHstFolhaBenef);   //comentario do SOL 207789/16618 PPM 554284 o sistema passara a trer somente a estrutura BASEDEPAGAMENTO
  atualizaBasePagamento(psMes,piIdHstFolhaBenef); //no SOL 207789/16618 PPM 554284 o sistema passara a trer somente a estrutura BASEDEPAGAMENTO
  //atualizaBasePagamentoEfetivacao(psMes, piIdHstFolhaBenef); //BRUNO AZEVEDO SOL 252458 KINTANA 754788 //comentario do SOL 207789/16618 PPM 554284 o sistema passara a trer somente a estrutura BASEDEPAGAMENTO
end;

procedure TfrmEstornaFolha.DesfazRegistroArquivoPagtoCNB240(
  pCodDocumento: Integer);
var
  sSQL: string;
  iIdArquivoPagto: Integer;
  qry: TwwQuery;
  qryArquivoPagto: TwwQuery;
begin
  qryArquivoPagto := TwwQuery.Create(nil);
  qry := TwwQuery.Create(nil);
  iIdArquivoPagto := 0;

  try
    qryArquivoPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    qry.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL :=  'SELECT DISTINCT AP.IDARQUIVOPAGTO as IDARQUIVOPAGTO       ' +#13#10+
             '  FROM ARQUIVOXDOCUM A                                    ' +#13#10+
             '  JOIN DOCUMENTOXPESSOAS D                                ' +#13#10+
             '    ON D.IDDOCUMENTOXPESSOAS = A.ID_DOC_CODBARRAS_PESSOAS ' +#13#10+
             '  JOIN ARQUIVOPAGTO AP                                    ' +#13#10+
             '    ON AP.IDARQUIVOPAGTO = A.IDARQUIVOPAGTO               ' +#13#10+
             //'   AND AP.FLGENVIADO = ''N''                              ' +#13#10+ // Andre Imakawa - SIG 101541
             '   AND AP.FLGENVIADO <> ''C''                              ' +#13#10+ // Andre Imakawa - SIG 101541
             ' WHERE D.CODDOCUMENTO = ' + IntToStr(pCodDocumento);
    //FazQuery(qry, sSQL);
    qry.SQL.Add(sSQL);
    qry.ExecSQL;
    qry.Open;

    if not qry.IsEmpty then
      iIdArquivoPagto := qry.FieldByName('IDARQUIVOPAGTO').AsInteger;

    if iIdArquivoPagto <> 0 then
    begin
      sSQL := 'DELETE FROM DOCUMENTOXPESSOAS                                    ' +#13#10+
              ' WHERE IDDOCUMENTOXPESSOAS IN (SELECT ID_DOC_CODBARRAS_PESSOAS   ' +#13#10+
              '                                 FROM ARQUIVOXDOCUM AD           ' +#13#10+
              '                                WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(iIdArquivoPagto) + ')';
      //FazQuery(qryArquivoPagto, sSQL);
      qryArquivoPagto.Close;
      qry.SQL.Clear;
      qryArquivoPagto.SQL.Add(sSQL);
      qryArquivoPagto.ExecSQL;


      sSQL := 'DELETE FROM TARIFAARQPAGTO ' +#13#10+
              ' WHERE IDARQUIVOPAGTO = ' + IntToStr(iIdArquivoPagto);
      //FazQuery(qryArquivoPagto, sSQL);
      qryArquivoPagto.Close;
      qryArquivoPagto.SQL.Clear;
      qryArquivoPagto.SQL.Add(sSQL);
      qryArquivoPagto.ExecSQL;

      sSQL := 'DELETE FROM ARQUIVOXDOCUM ' +#13#10+
              ' WHERE IDARQUIVOPAGTO = ' + IntToStr(iIdArquivoPagto);
      //FazQuery(qryArquivoPagto, sSQL);
      qryArquivoPagto.Close;
      qryArquivoPagto.SQL.Clear;
      qryArquivoPagto.SQL.Add(sSQL);
      qryArquivoPagto.ExecSQL;

      sSQL := 'DELETE FROM ARQUIVOPAGTO ' +#13#10+
              ' WHERE IDARQUIVOPAGTO = ' + IntToStr(iIdArquivoPagto);
      //FazQuery(qryArquivoPagto, sSQL);
      qryArquivoPagto.Close;
      qryArquivoPagto.SQL.Clear;
      qryArquivoPagto.SQL.Add(sSQL);
      qryArquivoPagto.ExecSQL;
    end;
  finally
    FreeAndNil(qryArquivoPagto);
    FreeAndNil(qry);
  end;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FESTORNAFOLHA                                                          |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TRATAR O ESTORNO DE PAGAMENTOS PELA FOLHA.                                 |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   NO ESTORNO COMPLETO E NO ESTORNO INDIVIDUAL INDEVIDO DEVE-SE ELIMINAR AS   |
| RUBRICAS INDIVIDUAIS DE COMPENSAÇÃO DE ARREDONDAMENTO.                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/02/2002 A 04/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NA GRAVAÇÃO DA TABELA MOTICOESTORNOFB                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2002 A 25/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO DE QUERYS COM COLUNA INVÁLIDA NO ESTORNO COMPLETO.                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/02/2002 A 26/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12d                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NÃO SE ELIMINA O REGISTRO NA TABELA HSTFOLHABENEF PARA O ESTORNO COMPLETO. |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/05/2002 A 10/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12p                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - VERIFICAR NOVO CONTAS A PAGAR NO ESTORNO DE CONSIGNATÁRIO.                 |
| - VINCULAR CONTA BANCARIA AO DOCUMENTO A PAGAR                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/05/2002 A 27/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12u                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSIDERAR RUBRICA DE ATRASO DO BENEFÍCIO PARA IDENTIFICAR A CONTA         |
| CONTÁBIL DE LÍQUIDO.                                                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI B MARINS                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/05/2002 A 07/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO DA ROTINA ESTORNO DE FOLHA COMPLETO NA ATUALIZAÇÃO DA TMPDESC       |
|   E CTRLINTERFACE.                                                           |
| - PERMITIR QUE SE FAÇA ESTORNO GERANDO NOVO CAP MESMO APÓS BAIXA DO          |
|   DOCUMENTO ORIGINAL.                                                        |
| - NOVA FUNÇÃO PARA PERMITIR A ALTERAÇÃO DO PORTADOR FORMA DE PAGAMENTO,      |
|   DA DATA PROGRAMADA E DA CONTA BANCÁRIA VINCULADA AO DOCUMENTO GERADO.      |
| - NA OPÇÃO DE ESTORNO DE PAGAMENTO INDEVIDO, ROTINA PARA EFETUAR UM          |
|   DESFAZER PREPARO INDIVIDUAL PARA O RECEBEDOR EM QUESTÃO.                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/06/2002 A 11/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12Z                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ATUALIZAÇÃO DO CAMPO ULTMESPREPARO DA RUBRICAINDIVn888. CRIAÇÃO DA ATUALIZAÇÃO |
|   DAS RUBRICAS INDIVIDUAIS PERMANENTES.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/07/2002 A 17/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13f                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Alteração da Função Documento.Rateio.Inserir, para passar os parametros   |
|     relativos a PATRO e ao PLANO                                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|| - Alterei o form  para contemplar os novos                                  |
|   parametros de integração contábil/financeira da folha                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/08/2002 A 08/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13M                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Resolução do problema da contabilização do estorno, que estava invertida. |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/11/2002 A 11/11/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.14L                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Pendência 10363 - gerar uma planilha distinta para cada estorno realizado. |
|   Alteração na qryPlanilha para obter as planilhas de estorno.               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/11/2002 A 28/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - O ESTORNO PARA REPROCESSAMENTO NÃO ESTÁ RETORNANDO O ULTMESPREPARO DAS     |
| DAS RUBRICAS INDIVIDUAIS.                                                    |
| - PENDENCIA 10423                                                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/12/2002 A 30/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) -  - Pendência 10645.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     - Testa na procura se o recebedor tem consignatário(s). Caso tenha,      |
|     mostrar uma mensagem informando que deve ser feito também estorno para   |
|     esse(s) consignatário(s).                                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/01/2003 A 02/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: () Pendência 11272.                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Permitir fazer estorno completo caso o valor do  |
|   Documento seja igual a zero.                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/05/2003 A 15/05/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.05b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   Pendência 13974.                                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/07/2003 A 16/07/2003                         |
| PENDÊNCIA: 14577                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07N                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - FILTRO NA QUERY DOS DOCUMENTOS PARA ESTORNO INDIVIDUAL POR IDTITULAR.      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/08/2003 A 08/08/2003                         |
| PENDÊNCIA: 10478                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR ESTORNO DE PAGAMENTO INDEVIDO MESMO QUE JÁ TENHA HAVIDO UM ESTORNO|
| PARA PAGAMENTO PENDENTE.                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/08/2003 A 08/08/2003                         |
| PENDÊNCIA: 14807                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - QUANDO O RECEBEDOR POSSUI MAIS DE UM PAGAMENTO A HISTRUBSAL ESTÁ SENDO AL- |
| TERADA TB PARA O PAGAMENTO DO OUTRO TITULAR A QUE O RECEBEDOR ESTÁ VINCULADO.|
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/05/2004 A 03/05/2004                         |
| PENDÊNCIA: 16705                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11d                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - OS DOCUMENTOS A PAGAR OU A RECEBER GERADOS NO ESTORNO ESTAVAM VINCULADOS   |
| A CONTA DE BAIXA DO DOCUMENTO ORIGINAL. ALTERAMOS PARA USAR COMO CONTA DE    |
| BAIXA A CONTA DE LÍQUIDO ASSOCIADA AO BENEFICIARIO.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/02/2005 A 02/02/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.02                                               |
| CLIENTE: (FCRT)                                                              |
| PENDÊNCIA: 18611                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   TROCAR O PARÂMETRO USADO NA PASSAGEM DA FUCTION INSERIR DA FORCLI DA       |
| CTRLDOCUMENTO. USAR AGORA PRMIDRAMOTIPOCLI AO ÍNVES DE PRMIDRAMOTIPOFOR      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2005 A 25/04/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.04a                                              |
| CLIENTE: (CBS)                                                               |
| PENDÊNCIA: 19108                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NA QUERY QUE BUSCA BFCIARIOTITPLAN, POIS ESTAVA SENDO UTILIZADO O   |
| CAMPO IDRECEBEDOR QUE NESTA TABELA NÃO EXISTE, O CORRETO É IDRESPONSAVEL     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/06/2005 A 07/06/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.04l                                              |
| CLIENTE: (CBS)                                                               |
| PENDÊNCIA: 19230                                                             |
| DESCRIÇÃO: Alteração na chamada da DesfazPreparoIndividual.                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/06/2005 A 17/06/2005                         |
| PENDÊNCIA: 19287                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.04n                                              |
| CLIENTE: (BRTPREV)                                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Atualizar a HstBenefBfCiario no estorno de paga_ |
|                             mento indevido.                                  |
|                                                                              |
|------------------------------------------------------------------------------}




