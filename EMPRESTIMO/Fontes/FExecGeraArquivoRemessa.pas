{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//***************************************************************************************
//Rotina.............: GeraArquivoFUNCEF_Novo, AlimentaQryDocTxt_Novo, bbtnConfirmarClick
//N. SIG.............: 78915
//Data da Alteração..: 06/12/2018
//Alteração Form.....: FExecGeraArquivoRemessa
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de geração do arquivo de remessa.
//***************************************************************************************
--------------------------------------------------------------------------------
Pendência   : SIG 77836 Tibero
Responsável : Everson Cunha
Data        : 05/11/2018
Descrição   : Inclusão do parâmetro de data no sql (qryHistMovEmptmo) que gera o 
			  arquivo, visando melhoria de performance.
--------------------------------------------------------------------------------
Pendência   : SOL 182277 KINTANA 1696776
Responsável : Monica Gonzaga
Data        : 15/02/2013
Descrição   : Inclusao da Mensagem que impede a geração de documentos mais de vez.
--------------------------------------------------------------------------------
Pendência   : SOL 149534 KINTANA 1074989
Responsável : BRUNO AZEVEDO
Data        : 23/12/2010
Descrição   : Ajuste na geração do arquivo de remessa para o contas a pagar.
--------------------------------------------------------------------------------
Autor(a)    :  Ádler Teodoro de Souza
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : AlimentaQryDocTxt
Data      : 22/01/2008
Autor     : Marchetti
Pendência : 27273
Descrição : Passa a armazenar a Forma de Pagamento ao invés do PortadorForma.
--------------------------------------------------------------------------------
Rotina    : qryContrato
Data      : 29/08/2006
Autor     : Alberto Carvalho
Pendência : 22924
Descrição : Inclusão de informações bancárias da conta débito na query.
--------------------------------------------------------------------------------
Rotina    : qryContrato
Data      : 08/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto da questão IDPLANOPREV/IDPLANOORIGEM:
            "CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS
             IDPLANOORIGEM,"
--------------------------------------------------------------------------------
Rotina    : -
Data      : 21/12/2004
Autor     : Marchetti
Pendência : 17884
Descrição : Colocado checkbox para visualizar ou não o arquivo gerado para
            alimentar a propriedade do CtrlIntBanco.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 20/05/2004
Autor     : André Pontes
Pendência : 16792
Descrição : Fechamento do cdsTxt, cuja falta ocasionava incremento dos registros
            do arquivo.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 08/04/2004
Autor     : Marchetti
Pendência : 16503
Descrição : Alteração no form para usar o CtrlIntBanco em 3 camadas.
--------------------------------------------------------------------------------
Rotina    : GeraArquivoFUNCEF
Data      : 27/08/2003
Autor     : Marchetti
Pendência :
Descrição : Criação da rotina específica para a FUNCEF para gerar todos os
            documentos em um único arquivo para o banco.
--------------------------------------------------------------------------------
Rotina    : GeraArquivo
Data      : 11/08/2003
Autor     : André Tavares
Pendência : 9933
Descrição : Convênio SICOV.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 23/07/2003
Autor     : André Pontes
Pendência : 14599
Descrição : Permitida indicação do caminho para gravação do arquivo.
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 11/07/2003
Autor     : André Pontes
Pendência : 14510
Descrição : Exibição de mensagem se não houver documentos para a faixa de datas
            selecionada.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecGeraArquivoRemessa;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
   wwdblook, wwdbdatetimepicker, Db, DBTables, Wwquery, Wwdatsrc,
   BfDialogs, BrowseFolder, uProcuraDir, uCtrlIntBanco, Provider, DBClient,
  uCMClientDataSet, uSistema, uCtrlMetodosEmptmo;

type
   TDadosRecebedor = Record
      sLogradouro    : String;
      sNumero        : String;
      sComplemento   : String;
      sBairro        : String;
      sCidade        : String;
      sCodestado     : String;
      sCep           : String;
      sNumdocumento  : String;
      sNomeRecebedor : String;
      sContaCorrente : String;
      sAgencia       : String;
      sBanco         : String;
      sTipoConta     : String;
      sNomeAgencia   : String;
   end;

   TfrmExecGeraArquivoRemessa = class(TfrmWizardMTEP)
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Label3: TLabel;
      Panel3: TPanel;
      DBgrdHistMov: TwwDBGrid;
      DBcboPortadorForma: TwwDBLookupCombo;
      qryDocTXT: TwwQuery;
      pnlPasta: TPanel;
      lblDiretorio: TLabel;
      btnEscolheDir: TBitBtn;
      Label1: TLabel;
      qryHistMovEmptmo: TwwQuery;
      qryDocOutros: TwwQuery;
      dtsDocumento: TwwDataSource;
      qryDocOutrosCODDOCUMENTO: TFloatField;
      qryDocOutrosIDPESSOA: TFloatField;
      qryDocOutrosCODPORTFORMA: TFloatField;
      qryDocOutrosIDFORCLI: TFloatField;
      qryDocOutrosIDMODULO: TFloatField;
      qryDocOutrosRECPAG: TStringField;
      qryDocOutrosNODOCUMENTO: TFloatField;
      qryDocOutrosCOMPLDOCUMENTO: TStringField;
      qryDocOutrosDATAVENCTO: TDateTimeField;
      qryDocOutrosSTATUS_DOC: TStringField;
      qryDocOutrosOPERACAO: TStringField;
      qryDocOutrosNUMAPGR: TFloatField;
      qryDocOutrosPORTADORFORMA: TStringField;
      qryDocOutrosNOME: TStringField;
      qryDocOutrosNUMBANCO: TStringField;
      qryHistMovEmptmoIDHISTMOVEMPTMO: TFloatField;
      qryHistMovEmptmoIDCONTRATOEMPTMO: TFloatField;
      qryHistMovEmptmoCODDOCUMENTO: TFloatField;
      qryHistMovEmptmoIDITEMEMPTMO: TFloatField;
      qryHistMovEmptmoHMETIPOMOV: TFloatField;
      qryHistMovEmptmoHMEORIGEM: TFloatField;
      qryHistMovEmptmoHMEPARCELA: TFloatField;
      qryHistMovEmptmoHMEFORMACOBRANCA: TStringField;
      qryHistMovEmptmoHMECENTRALIZA: TFloatField;
      qryHistMovEmptmoHMEDESTACADO: TFloatField;
      qryHistMovEmptmoHMEDATA: TDateTimeField;
      qryHistMovEmptmoHMEDATAPREVISTA: TDateTimeField;
      qryHistMovEmptmoHMEDATAVENCTO: TDateTimeField;
      qryHistMovEmptmoHMEDATAEFETIVA: TDateTimeField;
      qryHistMovEmptmoHMEDATAATUALIZA: TDateTimeField;
      qryHistMovEmptmoHMEANOCOMPETENCIA: TFloatField;
      qryHistMovEmptmoHMEMESCOMPETENCIA: TFloatField;
      qryHistMovEmptmoHMEANOCOBRANCA: TFloatField;
      qryHistMovEmptmoHMEMESCOBRANCA: TFloatField;
      qryHistMovEmptmoHMEVLRPREVISTO: TFloatField;
      qryHistMovEmptmoHMEVLREFETIVO: TFloatField;
      qryHistMovEmptmoHMESALDODEV: TFloatField;
      qryHistMovEmptmoHMETXJUROS: TFloatField;
      qryHistMovEmptmoFLGESTORNADO: TFloatField;
      qryHistMovEmptmoFLGBAIXADO: TFloatField;
      qryHistMovEmptmoFLGABONADO: TFloatField;
      qryHistMovEmptmoFLGENVIO: TFloatField;
      qryHistMovEmptmoHMERECPAG: TStringField;
      qryDadosRec: TwwQuery;
      qryContrato: TwwQuery;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoIDINSCRICAOEMPTMO: TFloatField;
      qryContratoIDCONTRQUITACAO: TFloatField;
      qryContratoIDVERBA: TFloatField;
      qryContratoFLGSITUACAO: TStringField;
      qryContratoFLGFORMAREC: TStringField;
      qryContratoPORTFORMAREC: TFloatField;
      qryContratoFLGFORMAPAG: TStringField;
      qryContratoCODFORMAPAG: TFloatField;
      qryContratoPORTFORMAPAG: TFloatField;
      qryContratoDATAASSINATURA: TDateTimeField;
      qryContratoDATACREDITO: TDateTimeField;
      qryContratoDATAPRIMPARC: TDateTimeField;
      qryContratoDATACANC: TDateTimeField;
      qryContratoDATASITUACAO: TDateTimeField;
      qryContratoPRAZO: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoVLRPARCELA: TFloatField;
      qryContratoTXJUROS: TFloatField;
      qryContratoVLRPARCELAMES: TFloatField;
      qryContratoVLRPARCATRASO: TFloatField;
      qryContratoVLRDEBITO: TFloatField;
      qryContratoVLRRESERVA: TFloatField;
      qryContratoVLRSALDODEV: TFloatField;
      qryContratoVLRPENDENCIA: TFloatField;
      qryContratoVLRSALBASE: TFloatField;
      qryContratoVLRMARGEM: TFloatField;
      qryContratoVLRMAXPERMIT: TFloatField;
      qryContratoDATASALDODEV: TDateTimeField;
      qryContratoDATAPENDENCIA: TDateTimeField;
      qryContratoFLGSUSPENSAOAUTO: TFloatField;
      qryContratoIDTIPOSUSPEMPTMO: TFloatField;
      qryContratoDATAINICIOSUSP: TDateTimeField;
      qryContratoDATAFIMSUSP: TDateTimeField;
      qryContratoANOSUSPENSAO: TFloatField;
      qryContratoMESSUSPENSAO: TFloatField;
      qryContratoUSUARIOLIBSUSP: TStringField;
      qryContratoDATALIBSUSP: TDateTimeField;
      qryContratoHORALIBSUSP: TStringField;
      qryContratoIDEMPRESAPROP: TFloatField;
      qryContratoIDPATRO: TFloatField;
      qryContratoIDPLANOPREV: TFloatField;
      qryContratoIDTIPOCONTREMPTMO: TFloatField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoIDPLANOORIGEM: TFloatField;
      qryContratoIDTIPOEMPTMO: TFloatField;
      qryContratoDESCTIPOEMPTMO: TStringField;
      qryContratoIDPESSOA: TFloatField;
      qryContratoIDBENEF: TFloatField;
      qryContratoIDCBANCARIA: TFloatField;
      qryContratoIDCBANCARIADEB: TFloatField;
      qryContratoMOECODIGO: TFloatField;
      qryContratoMATRICULA: TStringField;
      qryContratoMATRICULA_TIT: TStringField;
      qryContratoINSCRICAONUMERO: TFloatField;
      qryContratoSALPARTICIPACAO: TFloatField;
      qryContratoSALMANTIDO: TFloatField;
      qryContratoSALAUXDOENCA: TFloatField;
      qryContratoIDREGRAMARGEM: TFloatField;
      qryContratoIDREGRARESERVA: TFloatField;
      qryContratoIDREGRAELEG: TFloatField;
      qryContratoIDREGRALIMITES: TFloatField;
      qryContratoTCEDIASVALIDINSC: TFloatField;
      qryContratoTCEDIASTOLERAINSC: TFloatField;
      qryContratoTCEMAXCONTRATO: TFloatField;
      qryContratoTCEMAXINSCR: TFloatField;
      qryContratoTCEMAXPARC: TFloatField;
      qryContratoTCEMINPARC: TFloatField;
      qryContratoTCEMINQUIT: TFloatField;
      qryContratoTCEMINRENOVA: TFloatField;
      qryContratoFLGSEGURO: TStringField;
      qryContratoIDSITPART: TFloatField;
      qryContratoFLGINTERNO: TStringField;
      qryContratoSIT_TITULAR: TStringField;
      qryContratoSITDESCRICAO: TStringField;
      qryContratoIDUSUARIO: TStringField;
      qryContratoNOME_TITULAR: TStringField;
      qryContratoCPF_TITULAR: TStringField;
      qryContratoNOME: TStringField;
      qryContratoNOME_MUTUARIO: TStringField;
      qryContratoNUMDOCUMENTO: TStringField;
      qryContratoCPF_MUTUARIO: TStringField;
      qryContratoTIPOCONTA: TFloatField;
      qryContratoNUMAGENCIA: TStringField;
      qryContratoNOMEAGENCIA: TStringField;
      qryContratoNUMBANCO: TStringField;
      qryDadosRecLOGRADOURO: TStringField;
      qryDadosRecNUMERO: TStringField;
      qryDadosRecCOMPLEMENTO: TStringField;
      qryDadosRecBAIRRO: TStringField;
      qryDadosRecCIDADE: TStringField;
      qryDadosRecCODESTADO: TStringField;
      qryDadosRecCEP: TStringField;
      qryDadosRecNUMDOCUMENTO: TStringField;
      qryDadosRecNOME: TStringField;
      qryContratoCONTACORRENTE: TStringField;
      qryDocTXTIDPESSOA: TFloatField;
      qryDocTXTIDFORCLI: TFloatField;
      qryDocTXTCODDOCUMENTO: TFloatField;
      qryDocTXTVALOR: TFloatField;
      qryDocTXTVALORDESCONTO: TFloatField;
      qryDocTXTVALORJUROS: TFloatField;
      qryDocTXTDATAVENCTO: TStringField;
      qryDocTXTDATAPROGRAMADA: TStringField;
      qryDocTXTNODOCUMENTO: TFloatField;
      qryDocTXTCOMPLDOCUMENTO: TStringField;
      qryDocTXTCONTALIQUIDO: TStringField;
      qryDocTXTNOME: TStringField;
      qryDocTXTRAZAOSOCIAL: TStringField;
      qryDocTXTNUMDOCUMENTO: TStringField;
      qryDocTXTCONTACORRENTE: TStringField;
      qryDocTXTCODBANCOFAVORECIDO: TStringField;
      qryDocTXTNUMAGENCIA: TStringField;
      qryDocTXTLOGRADOURO: TStringField;
      qryDocTXTNUMERO: TStringField;
      qryDocTXTCOMPLEMENTO: TStringField;
      qryDocTXTBAIRRO: TStringField;
      qryDocTXTCIDADE: TStringField;
      qryDocTXTCODESTADO: TStringField;
      qryDocTXTCEP: TStringField;
      qryDocTXTTIPOMOEDA: TFloatField;
      qryDocTXTNUMLOTE: TFloatField;
      qryDocTXTCODPORTFORMA: TFloatField;
      qryDocTXTCODPORTADOR: TFloatField;
      qryDocTXTCODFORMAPAGTO: TFloatField;
      qryDocTXTCODTIPOPAGTO: TFloatField;
      qryDocTXTFLGEMITEAVISO: TStringField;
      qryDocTXTCODARQUIVOREMESSA: TFloatField;
      qryDocTXTIDBANCO: TFloatField;
      qryDocTXTNOCONTACORR: TStringField;
      qryDocTXTCODBARRA: TStringField;
      qryDocTXTCODBARRAVALOR: TStringField;
      qryDocTXTTIPO: TStringField;
      qryDocTXTNUMEMPRESABANCO: TStringField;
      qryDocTXTDEBCRE: TStringField;
      qryDocTXTTIPOCONTA: TStringField;
      qryDocTXTNOMEAGENCIA: TStringField;
      qryDocTXTLIVRE: TStringField;
      updDoc: TUpdateSQL;
      dlgCaminho: TProcuraDirDlg;
      qryDocFuncef: TwwQuery;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      StringField1: TStringField;
      FloatField6: TFloatField;
      StringField2: TStringField;
      DateTimeField1: TDateTimeField;
      StringField3: TStringField;
      StringField4: TStringField;
      FloatField7: TFloatField;
      StringField5: TStringField;
      StringField6: TStringField;
      StringField7: TStringField;
      cdsTxt: TCMClientDataSet;
      dsp: TDataSetProvider;
      qryDocTXTDMAISALT: TFloatField;
      qryDocTXTCODFORMAPGTOALT: TFloatField;
      qryDocTXTVALORMAXIMO: TFloatField;
      cdsTxtIDPESSOA: TFloatField;
      cdsTxtIDFORCLI: TFloatField;
      cdsTxtCODDOCUMENTO: TFloatField;
      cdsTxtVALOR: TFloatField;
      cdsTxtVALORDESCONTO: TFloatField;
      cdsTxtVALORJUROS: TFloatField;
      cdsTxtDATAVENCTO: TStringField;
      cdsTxtDATAPROGRAMADA: TStringField;
      cdsTxtNODOCUMENTO: TFloatField;
      cdsTxtCOMPLDOCUMENTO: TStringField;
      cdsTxtCONTALIQUIDO: TStringField;
      cdsTxtNOME: TStringField;
      cdsTxtRAZAOSOCIAL: TStringField;
      cdsTxtNUMDOCUMENTO: TStringField;
      cdsTxtCONTACORRENTE: TStringField;
      cdsTxtCODBANCOFAVORECIDO: TStringField;
      cdsTxtNUMAGENCIA: TStringField;
      cdsTxtLOGRADOURO: TStringField;
      cdsTxtNUMERO: TStringField;
      cdsTxtCOMPLEMENTO: TStringField;
      cdsTxtBAIRRO: TStringField;
      cdsTxtCIDADE: TStringField;
      cdsTxtCODESTADO: TStringField;
      cdsTxtCEP: TStringField;
      cdsTxtTIPOMOEDA: TFloatField;
      cdsTxtNUMLOTE: TFloatField;
      cdsTxtCODPORTFORMA: TFloatField;
      cdsTxtCODPORTADOR: TFloatField;
      cdsTxtCODFORMAPAGTO: TFloatField;
      cdsTxtCODTIPOPAGTO: TFloatField;
      cdsTxtFLGEMITEAVISO: TStringField;
      cdsTxtCODARQUIVOREMESSA: TFloatField;
      cdsTxtIDBANCO: TFloatField;
      cdsTxtNOCONTACORR: TStringField;
      cdsTxtCODBARRA: TStringField;
      cdsTxtCODBARRAVALOR: TStringField;
      cdsTxtTIPO: TStringField;
      cdsTxtNUMEMPRESABANCO: TStringField;
      cdsTxtDEBCRE: TStringField;
      cdsTxtTIPOCONTA: TStringField;
      cdsTxtNOMEAGENCIA: TStringField;
      cdsTxtLIVRE: TStringField;
      cdsTxtDMAISALT: TFloatField;
      cdsTxtCODFORMAPGTOALT: TFloatField;
      cdsTxtVALORMAXIMO: TFloatField;
      qryDocFuncefVALOR: TFloatField;
      qryDocOutrosVALOR: TFloatField;
      chkVisualiza: TCheckBox;
    qryContratoCONTACORRENTEDEB: TStringField;
    qryContratoTIPOCONTADEB: TFloatField;
    qryContratoNUMAGENCIADEB: TStringField;
    qryContratoNOMEAGENCIADEB: TStringField;
    qryContratoNUMBANCODEB: TStringField;
    qryDuplicadoFuncef: TwwQuery;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField8: TStringField;
    FloatField13: TFloatField;
    StringField9: TStringField;
    DateTimeField2: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField14: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField15: TFloatField;
    qryDuplicadoOutros: TwwQuery;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField15: TStringField;
    FloatField21: TFloatField;
    StringField16: TStringField;
    DateTimeField3: TDateTimeField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField22: TFloatField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    FloatField23: TFloatField;
    qryDuplicadoFuncefDATAEMISSAO: TDateTimeField;
    qryDuplicadoFuncefCONTROLEREMESSA: TFloatField;
    qryDuplicadoOutrosDATAEMISSAO: TDateTimeField;
    qryDuplicadoOutrosCONTROLEREMESSA: TFloatField;
    dtsDuplicado: TwwDataSource;
    bbbtnContinuar: TBitBtn;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnEscolheDirClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbbtnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);


   private  // Private declarations

      qryDocumento : TwwQuery;
      qryDuplicado : TwwQuery;
      dataVazia    : Boolean; //Monica

      Ieacm        : TCtrlIntBanco;

      cdsHistMovEmptmo, cdsPortadorForma, cdsContratoEmptmo, cdsDadosRecebedor: TCMClientDataSet;
      CtrlMetodosEmptmo: tCtrlMetodosEmptmo;

      procedure AbreQueries;
      function  VerificaPreenchimentoFiltro: Boolean;
      function  VerificaPreenchimentoArquivo: Boolean;

      function  AbreDocumentos: Boolean;

      procedure GeraArquivo;
      procedure GeraArquivoFUNCEF;
      procedure GeraArquivoFUNCEF_Novo;
      procedure AlimentaQryDocTxt;
      procedure AlimentaQryDocTxt_Novo(pNumDocumento: Double; pCodDocumento, pCodPortForma: Integer; pDataMov: TDateTime);
      procedure AtualizaDocumento(pCodDocumento: Integer);
   public   // Public declarations


   end;



var
  frmExecGeraArquivoRemessa: TfrmExecGeraArquivoRemessa;



implementation
{$R *.DFM}
uses
   fAguarde, uFuncoesEmptmo, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo, fProgresso;




procedure TfrmExecGeraArquivoRemessa.AbreQueries;
begin
   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      DBcboPortadorForma.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsString;
   end;
end;



function TfrmExecGeraArquivoRemessa.VerificaPreenchimentoFiltro: Boolean;
begin
   Result := False;
   dataVazia := False;

   try
      // data inicial
      if length(trim(edtDataIni.Text)) = 0 then
      begin
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);
      end;

      // data final
      if length(trim(edtDataFim.Text)) = 0 then
      begin
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);
      end;

   except
      on ev : EValidacao do
      begin
         dataVazia := True;
         Screen.Cursor := crDefault;
          if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;

         Exit;
      end;
   end;

   Result := True;
end;




function TfrmExecGeraArquivoRemessa.VerificaPreenchimentoArquivo: Boolean;
begin
   Result := False;

   try
      

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




procedure TfrmExecGeraArquivoRemessa.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   ParametrosSistema;

   edtDataIni.Date   := Date;
   edtDataFim.Date   := Date;

   AbreQueries;
end;



function TfrmExecGeraArquivoRemessa.AbreDocumentos: Boolean;
begin
   Result := False;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
       qryDuplicado := qryDuplicadoFuncef;
       qryDocumento := qryDocFuncef;
   end
   else
   begin
      qryDuplicado := qryDuplicadoOutros;
      qryDocumento := qryDocOutros;
   end;


   try
      with qryDocumento do
      begin
         LimpaParametros(qryDocumento);
         ParamByName('PDATAINI').AsDate := trunc(edtDataIni.Date);
         ParamByName('PDATAFIM').AsDate := trunc(edtDataFim.Date);
         if DBcboPortadorForma.LookupValue <> '' then ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
         Open;

         if not(IsEmpty) then Result := True;
      end;

       with qryDuplicado do
      begin
         LimpaParametros(qryDuplicado);
         ParamByName('PDATAINI').AsDate := trunc(edtDataIni.Date);
         ParamByName('PDATAFIM').AsDate := trunc(edtDataFim.Date);
         if DBcboPortadorForma.LookupValue <> '' then ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
         Open;

         if not(IsEmpty) then Result := True;
      end;

   except
      on E:Exception do
      begin
         MsgDlg('Ocorreu um ERRO ao buscar o(s) Documento(s): ' + E.Message + '!',
                'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;
   end;
end;



procedure TfrmExecGeraArquivoRemessa.AlimentaQryDocTxt;
var
   rDados : TDadosRecebedor;
begin
   rDados.sLogradouro   := '';
   rDados.sNumero       := '';
   rDados.sComplemento  := '';
   rDados.sBairro       := '';
   rDados.sCidade       := '';
   rDados.sCodEstado    := '';
   rDados.sCEP          := '';
   rDados.sNumDocumento := '';

   // ----------------------------------------------------------------------------------------------
   with qryContrato do
   begin
      LimpaParametros(qryContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryHistMovEmptmoIDCONTRATOEMPTMO.AsFloat;
      Open;
   end;
   // ----------------------------------------------------------------------------------------------

   rDados.sNomeRecebedor   := qryContratoNOME.AsString;

   //Pendência 22924 - 29/08/2006 - Alberto
   if qryHistMovEmptmoHMETIPOMOV.AsInteger = 0 then begin
   rDados.sContaCorrente   := qryContratoCONTACORRENTE.AsString;
   rDados.sTipoConta       := qryContratoTIPOCONTA.AsString;
   rDados.sNomeAgencia     := qryContratoNOMEAGENCIA.AsString;
   rDados.sBanco           := qryContratoNUMBANCO.AsString;
   rDados.sAgencia         := qryContratoNUMAGENCIA.AsString;
   end else begin
     rDados.sContaCorrente   := qryContratoCONTACORRENTEDEB.AsString;
     rDados.sTipoConta       := qryContratoTIPOCONTADEB.AsString;
     rDados.sNomeAgencia     := qryContratoNOMEAGENCIADEB.AsString;
     rDados.sBanco           := qryContratoNUMBANCODEB.AsString;
     rDados.sAgencia         := qryContratoNUMAGENCIADEB.AsString;
   end;
   //Fim Pendência 22924

   while length(rDados.sAgencia) < 5 do rDados.sAgencia := rDados.sAgencia + '&';

   // ----------------------------------------------------------------------------------------------
   with qryDadosRec do
   begin
      LimpaParametros(qryDadosRec);
      ParamByName('PIDPESSOA').AsInteger := qryContratoIDBENEF.AsInteger;
      Open;
   end;

   if not(qryDadosRec.IsEmpty) then
   begin
      rDados.sLogradouro    := qryDadosRecLOGRADOURO.AsString;
      rDados.sNumero        := qryDadosRecNUMERO.AsString;
      rDados.sComplemento   := qryDadosRecCOMPLEMENTO.AsString;
      rDados.sBairro        := qryDadosRecBAIRRO.AsString;
      rDados.sCidade        := qryDadosRecCIDADE.AsString;
      rDados.sCodEstado     := qryDadosRecCODESTADO.AsString;
      rDados.sCEP           := qryDadosRecCEP.AsString;
      rDados.sNumDocumento  := qryDadosRecNUMDOCUMENTO.AsString;

      while length(rDados.sNumDocumento) < 11 do rDados.sNumDocumento := '0' + rDados.sNumDocumento;
   end;
   // ----------------------------------------------------------------------------------------------

   try
     cdsTxt.Insert;
     cdsTxtCONTALIQUIDO.AsString       := '';
     cdsTxtIDPESSOA.AsInteger          := qryContratoIDBENEF.AsInteger;
     cdsTxtNOME.AsString               := rDados.sNomeRecebedor;
     cdsTxtRAZAOSOCIAL.AsString        := rDados.sNomeRecebedor;
     cdsTxtNUMDOCUMENTO.AsString       := rDados.sNumDocumento;
     cdsTxtCONTACORRENTE.AsString      := rDados.sContaCorrente;
     cdsTxtCODBANCOFAVORECIDO.AsString := rDados.sBanco;
     cdsTxtNUMAGENCIA.AsString         := rDados.sAgencia;
     cdsTxtIDFORCLI.AsInteger          := qryContratoIDBENEF.AsInteger;
     cdsTxtTIPOCONTA.AsString          := rDados.sTipoConta;
     cdsTxtNOMEAGENCIA.AsString        := rDados.sNomeAgencia;
     cdsTxtLOGRADOURO.AsString         := rDados.sLogradouro;
     cdsTxtNUMERO.AsString             := rDados.sNumero;
     cdsTxtCOMPLEMENTO.AsString        := rDados.sComplemento;
     cdsTxtBAIRRO.AsString             := rDados.sBairro;
     cdsTxtCIDADE.AsString             := rDados.sCidade;
     cdsTxtCODESTADO.AsString          := rDados.sCodEstado;
     cdsTxtCEP.AsString                := rDados.sCEP;

//início 11/08/2003 André Tavares - pendência 9933 - convênio SICOV
     cdsTxtCODDOCUMENTO.AsInteger      := qryDocumento.FieldByName('CODDOCUMENTO').AsInteger;

     dtmEmptmo.qryPortadorForma.Close;
     dtmEmptmo.qryPortadorForma.parambyName('PCODPORTFORMA').asInteger := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;
     dtmEmptmo.qryPortadorForma.Open;
//Fim 11/08/2003 André Tavares - pendência 9933 - convênio SICOV

     cdsTxtVALOR.AsFloat               := qryHistMovEmptmoHMEVLRPREVISTO.AsFloat;
     cdsTxtVALORDESCONTO.AsFloat       := 0;
     cdsTxtVALORJUROS.AsFloat          := 0;
     cdsTxtDATAVENCTO.AsString         := qryDocumento.FieldByName('DATAVENCTO').AsString;
     cdsTxtDATAPROGRAMADA.AsString     := qryDocumento.FieldByName('DATAVENCTO').AsString;
     cdsTxtTIPOMOEDA.AsInteger         := 0;
     cdsTxtNUMLOTE.AsInteger           := 0;
     cdsTxtCODPORTFORMA.AsInteger      := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;
     cdsTxtCODPORTADOR.AsInteger       := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;
     cdsTxtCODFORMAPAGTO.AsInteger     := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;

     cdsTxtCODTIPOPAGTO.AsInteger      := dtmEmptmo.qryPortadorFormaCODTIPOPAGTO.AsInteger;

     if not(dtmEmptmo.qryPortadorFormaFLGEMITEAVISO.IsNull) then
     begin
        cdsTxtFLGEMITEAVISO.AsString   := dtmEmptmo.qryPortadorFormaFLGEMITEAVISO.AsString;
     end;

     cdsTxtCODARQUIVOREMESSA.AsInteger := dtmEmptmo.qryPortadorFormaCODARQUIVOREMESSA.AsInteger;
     cdsTxtIDBANCO.AsInteger           := dtmEmptmo.qryPortadorFormaIDBANCO.AsInteger;
     cdsTxtNOCONTACORR.AsString        := dtmEmptmo.qryPortadorFormaNOCONTACORR.AsString;

     // Pendencia 16503
     cdsTxtDMAISALT.AsInteger          := dtmEmptmo.qryPortadorFormaDMAISALT.AsInteger;
     cdsTxtCODFORMAPGTOALT.AsInteger   := dtmEmptmo.qryPortadorFormaCODFORMAPGTOALT.AsInteger;
     cdsTxtVALORMAXIMO.AsFloat         := dtmEmptmo.qryPortadorFormaVALORMAXIMO.AsFloat;

     cdsTxtCODBARRA.AsString           := '';
     cdsTxtCODBARRAVALOR.AsString      := '';

     // Marchetti - 13/08/2003 - Conforme solicitação da FUNCEF, deve ser passado o contrato
     // Para que seja concatenado com o nome do Mutuário

     if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
        cdsTxtNODOCUMENTO.Asfloat         := qryHistMovEmptmoIDCONTRATOEMPTMO.AsFloat
     else
        cdsTxtNODOCUMENTO.Asfloat         := qryDocumento.FieldByName('NODOCUMENTO').AsFloat;       // Codigo que aparece no relatorio

     cdsTxtCOMPLDOCUMENTO.AsString     := '000';
     cdsTxtTIPO.AsString               := 'F';
     cdsTxtNUMEMPRESABANCO.AsString    := dtmEmptmo.qryPortadorFormaNUMEMPRESABANCO.AsString;
     cdsTxtDEBCRE.AsString             := '';
     cdsTxtLIVRE.AsString              := '';
     cdsTxt.Post;

   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecGeraArquivoRemessa.GeraArquivo;
var
   sPathArquivo   : String;

   iCodArquivo    : Integer;
   iControle      : Integer;

   iContador      : Integer;
   fVlrTotal      : Currency;
   sMensagem      : String;
begin
   // ----------------------------------------------------------------------------------------------
   try
      MostraEspera('Selecionando histórico para geração do arquivo...');

      try
         with qryHistMovEmptmo do
         begin
            LimpaParametros(qryHistMovEmptmo);
            ParamByName('PCODDOCUMENTO').AsInteger := qryDocumento.FieldByName('CODDOCUMENTO').AsInteger;
            ParamByName('PDATAPREVISTA').AsDate := qryDocumento.FieldByName('DATAVENCTO').AsDateTime; //Everson Cunha - SIG 77836 Tibero - 04/11/2018
            Open;

            if IsEmpty then
            begin
               MsgDlg('Não foram encontrados registros para geração do arquivo!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;

               Close;
               Exit;
            end;
         end;

      except
         on E:Exception do
         begin
            MsgDlg('Ocorreu um ERRO ao buscar o(s) histórico(s): ' + E.Message + '!',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            Exit;
         end;
      end;

   finally
      EscondeEspera;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   with dtmEmptmo.qryPortadorForma do
   begin
      LimpaParametros(dtmEmptmo.qryPortadorForma);
      ParamByName('PCODPORTFORMA').AsInteger := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;
      Open;

      iCodArquivo := dtmEmptmo.qryPortadorFormaCODARQUIVOREMESSA.AsInteger;
      iControle   := dtmEmptmo.qryPortadorFormaCONTROLEREMESSA.AsInteger;

      Close;
   end;
   // ----------------------------------------------------------------------------------------------

   iContador := 0;
   fVlrTotal := 0;

   // ----------------------------------------------------------------------------------------------
   qryDocTxt.Close;
   cdsTxt.Close;  // Andre Pontes - pendência 16792 - 20/05/2004
   cdsTxt.Open;
   // ----------------------------------------------------------------------------------------------

   MostraFormProgresso('Gerando arquivo de remessa...', 0, qryHistMovEmptmo.RecordCount, True, True);

   try
      qryHistMovEmptmo.First;
      while not(qryHistMovEmptmo.EOF) do
      begin
         inc(iContador);

         AndaFormProgresso(iContador);
         if frmProgresso.Cancelou then
         begin
            MsgDlg('Processo interrompido', 'Empréstimo', mtInformation, [mbOK], 0);
            Repaint;
            Exit;
         end;

         AlimentaQryDocTxt;

         qryHistMovEmptmo.Next;
      end;

   finally
      EscondeFormProgresso;
   end;



   try
      try

         Ieacm.FechaQryTexto  := False;
         Ieacm.StartTransaction;

         cdsTxt.First;

         // André Pontes - 23/07/2003 - pendência 14599
         sPathArquivo := pnlPasta.Caption;

         Ieacm.IndiceDoBanco  := iCodArquivo;

         if Ieacm.VerficaDadosEmpresa('P', qryDocumento.FieldByName('CODPORTFORMA').AsInteger) then
         begin
            if Ieacm.ValidaRemessa('P', cdsTxt.Data, False) then
            begin
               
               Ieacm.ExibeArquivoGerado       := chkVisualiza.Checked;
               Ieacm.IdentficaOrigem          := '15';
               Ieacm.DataPagamento            := FormatDateTime('dd/mm/yyyy', qryDocumento.FieldByName('DATAVENCTO').AsDateTime);

               if not Ieacm.MontaPagamentoEletronico(iCodArquivo, iControle, cdsTxt.Data, sPathArquivo) then
               begin
                  sMensagem := 'Erro ao gerar o arquivo de remessa';
                  Raise Exception.Create(sMensagem);
               end;
            end
            else
            begin
               sMensagem := 'Erro ao validar remessa';
               Raise Exception.Create(sMensagem);
            end;

         end
         else
         begin
            sMensagem := 'Erro ao Verificar dados da Empresa';
            Raise Exception.Create(sMensagem);
         end;
         Ieacm.Commit;
      except
         Ieacm.Rollback;
         MsgDlg(sMensagem, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;

   finally
      frmAguarde.Hide;
   end;
end;



procedure TfrmExecGeraArquivoRemessa.bbtnConfirmarClick(Sender: TObject);
begin

    ParametrosSistema;

   if VerificaPreenchimentoArquivo then
   begin

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         //Cássio Rovaroto - SIG nº 78915 - Início
         //GeraArquivoFUNCEF;
         GeraArquivoFUNCEF_Novo;
         //Cássio Rovaroto - SIG nº 78915 - Fim
      end
      else
      begin
         GeraArquivo;
      end;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         bbtnSairClick(Self);
      end
      else
      begin
         inherited;
      end;
   end;

end;



procedure TfrmExecGeraArquivoRemessa.btnContinuarClick(Sender: TObject);
var
  sData : String;
  sNSA : String;
  i:integer;
  f:Tform;
  result : Integer;
  iLarguraForm : Integer;


begin
   if VerificaPreenchimentoFiltro then
   begin
      Ieacm.ExibeArquivoGerado := chkVisualiza.Checked;
      if AbreDocumentos then
      begin
       //  inherited;
      end
      else
      begin
         MsgDlg('Não há Documentos para o período de datas indicado!', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
         abort;

      end;

   end;

//Monica Gonzaga - SOL182277 - KTN 1696776 - Inicio
   if dataVazia then exit;

   if qryDuplicado.IsEmpty then
   begin
    dtsDocumento.DataSet := qryDocumento;
    pgcControle.ActivePageIndex := 1;
    btnVoltar.Enabled := true;
    btnContinuar.Enabled :=false;
    bbtnConfirmar.Enabled :=true;
   end
   else
   begin
            sData:= '';
            sNSA := '';

            sData := qryDuplicado.fieldbyname('DATAEMISSAO').asString ;

            while not(qryDuplicado.EOF) do
            begin

             if Pos(qryDuplicado.fieldbyname('CONTROLEREMESSA').asString, sNSA) = 0 then
             begin
              sNSA := sNSA + qryDuplicado.fieldbyname('CONTROLEREMESSA').asString + ' ,';

               if Pos(qryDuplicado.fieldbyname('DATAEMISSAO').asString, sData) = 0  then
               begin
                sData := sData + ' ,' + qryDuplicado.fieldbyname('DATAEMISSAO').asString ;
               end;

             end;
             qryDuplicado.Next
            end;                           


            sNSA := Copy(sNSA, 1, length(sNSA) - 1);

             f:= createmessagedialog('Há número(s) de documento(s) já utilizado(s) no(s) arquivo(s) NSA ' + sNSA + ', gerado(s)  em  ' + sData + '. Escolha uma das seguintes opções:',
             mtconfirmation,[mbyes,mbno,mbok]);

            try
              for i:=0 to f.componentCount -1 do
               if f.components[i] is tbutton then
                with tbutton(f.components[i]) do
                 case modalresult of
                   mryes   : BEGIN
                               caption := '&Cancelar Operação';
                               Width   := 150;
                               iLarguraForm := f.Width - 504;

                               left    := iLarguraForm;

                             END;
                   mrno   : BEGIN
                               caption := '&Exibir Documentos';
                               Width   := 150;
                               iLarguraForm := f.Width - 352;
                               left    := iLarguraForm;

                            END;

                   mrok   : BEGIN
                               caption := '&Prosseguir';
                               Width   := 150;
                               iLarguraForm := f.Width - 200;
                               left    := iLarguraForm;

                            END;
                 end;
                f.caption := 'Empréstimo';
                f.showmodal;

                case f.ModalResult of
                   mryes  : Begin
                             result := 1;
                             pgcControle.ActivePageIndex := 0;
                             pgcControle.OnChange(self);
                            end;
                   mrno   : Begin
                              dtsDocumento.DataSet := qryDuplicado;
                              bbtnConfirmar.Enabled := false;
                              bbtnConfirmar.Visible:= false;

                              bbtnCancelar.Enabled := true;
                              bbtnCancelar.Visible := true;
                              bbtnCancelar.Width   := 81;
                              bbtnCancelar.Left   := 191;

                              pgcControle.ActivePageIndex := 1;
                              pgcControle.OnChange(self);

                              bbbtnContinuar.Enabled := false;
                              bbbtnContinuar.Visible := false;
                              bbbtnContinuar.Width   := 90;
                              bbbtnContinuar.Left   := 177;

                              btnVoltar.Enabled := true;
                              btnVoltar.Visible := true;

                              btnContinuar.Enabled := false;
                              btnContinuar.Visible:= true;

                              fcLabel1.caption :='Documentos Gerados Anteriormente';


                              Label1.caption := '';
                              pnlPasta.Enabled := false;
                              pnlPasta.Visible := false;
                              btnEscolheDir.Enabled := false;
                              btnEscolheDir.Visible := false;


                            end;
                   mrok   : Begin
                              result := 3;
                              if MsgDlg('Deseja Continuar?', 'Empréstimo',mtInformation,[mbno, mbyes], 0) = mryes  then
                              begin
                               dtsDocumento.DataSet := qryDocumento;
                               bbtnConfirmar.Enabled := true;
                               bbtnConfirmar.Visible:= true;

                               bbtnCancelar.Enabled := false;
                               bbtnCancelar.Visible := false;
                               bbtnCancelar.Width   := 81;
                               bbtnCancelar.Left   := 191;

                               pgcControle.ActivePageIndex := 1;
                               pgcControle.OnChange(self);

                               bbbtnContinuar.Enabled := false;
                               bbbtnContinuar.Visible := false;
                               bbbtnContinuar.Width   := 90;
                               bbbtnContinuar.Left   := 177;

                               btnVoltar.Enabled := true;
                               btnVoltar.Visible := true;

                               btnContinuar.Enabled := false;
                               btnContinuar.Visible:= true;

                               fcLabel1.caption :='Geração de Arquivo Eletrônico de Remessa [ seleção ]';


                               Label1.caption := 'Caminho para criação do arquivo';
                               pnlPasta.Enabled := True;
                               pnlPasta.Visible := True;
                               btnEscolheDir.Enabled := True;
                               btnEscolheDir.Visible := True;
                              end
                              else
                              begin
                                 bbtnCancelarClick(Sender);
                              end;
                            end;
                end;

            finally
              f.free;
            end;

   end;

 //Monica Gonzaga - SOL182277 - KTN 1696776 - Fim
end;



procedure TfrmExecGeraArquivoRemessa.btnEscolheDirClick(Sender: TObject);
begin
   inherited;
   dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory;
end;



procedure TfrmExecGeraArquivoRemessa.GeraArquivoFUNCEF;
var
   sPathArquivo   : String;

   iCodArquivo    : Integer;
   iControle      : Integer;

   iContador      : Integer;
   fVlrTotal      : Currency;
   sMensagem      : String;
   
begin
   // ----------------------------------------------------------------------------------------------
   qryDocTxt.Close;
   cdsTxt.Close;  // Andre Pontes - pendência 16792 - 20/05/2004
   cdsTxt.Open;
   // ----------------------------------------------------------------------------------------------

   qryDocTxt.Close;
   qryDocTxt.Open;

   try
      MostraEspera('Selecionando histórico para geração do arquivo...');

      qryDocumento.First;
      while not(qryDocumento.EOF) do
      begin
         with qryHistMovEmptmo do
         begin
            LimpaParametros(qryHistMovEmptmo);
            ParamByName('PCODDOCUMENTO').AsInteger := qryDocumento.FieldByName('CODDOCUMENTO').AsInteger;
           ParamByName('PDATAPREVISTA').AsDate := qryDocumento.FieldByName('DATAVENCTO').AsDateTime; //Everson Cunha - SIG 77836 Tibero - 04/11/2018
            Open;
         end;

         with dtmEmptmo.qryPortadorForma do
         begin
            LimpaParametros(dtmEmptmo.qryPortadorForma);
            ParamByName('PCODPORTFORMA').AsInteger := qryDocumento.FieldByName('CODPORTFORMA').AsInteger;
            Open;

            iCodArquivo := dtmEmptmo.qryPortadorFormaCODARQUIVOREMESSA.AsInteger;
            iControle   := dtmEmptmo.qryPortadorFormaCONTROLEREMESSA.AsInteger;

            Close;
         end;
          //----------------------------------------------------------------------------------------------

         iContador := 0;
         fVlrTotal := 0;

         MostraFormProgresso('Gerando arquivo de remessa...', 0, cdsHistMovEmptmo.RecordCount, True, True);

        //Pendência 26324 - 11/09/2007 - Alberto
        cdsTxt.EmptyDataSet;

         try
            qryHistMovEmptmo.First;
            while not(qryHistMovEmptmo.EOF) do
            begin
               inc(iContador);

               AndaFormProgresso(iContador);
               if frmProgresso.Cancelou then
               begin
                  MsgDlg('Processo interrompido', 'Empréstimo', mtInformation, [mbOK], 0);
                  Repaint;
                  Exit;
               end;

               AlimentaQryDocTxt;

               qryHistMovEmptmo.Next;
            end;
         finally
            EscondeFormProgresso;
         end;

         // ----------------------------------------------------------------------------------------

         // Marchetti - Pendencia 28071
         // Ao executar o processo de geração de arquivo, coloco em Transação, devido
         // ao select FOR UPDATE na tabela PORTADORFORMA
         try

            Ieacm.FechaQryTexto  := False;
            Ieacm.StartTransaction;

            cdsTxt.First;

            sPathArquivo := pnlPasta.Caption;

            Ieacm.IndiceDoBanco  := iCodArquivo;

            if Ieacm.VerficaDadosEmpresa('P', qryDocumento.FieldByName('CODPORTFORMA').AsInteger) then
            begin
               if Ieacm.ValidaRemessa('P', cdsTxt.Data, False) then
               begin
                  Ieacm.AtualizaDoc := True;
                  Ieacm.ExibeArquivoGerado       := chkVisualiza.Checked;
                  Ieacm.IdentficaOrigem          := '15';
                  Ieacm.DataPagamento            := FormatDateTime('dd/mm/yyyy', qryDocumento.FieldByName('DATAVENCTO').AsDateTime);

                  if not Ieacm.MontaPagamentoEletronico(iCodArquivo, iControle, cdsTxt.Data, sPathArquivo) then
                  begin
                     sMensagem := 'Erro ao gerar o arquivo de remessa';
                     Raise Exception.Create(sMensagem);
                  end;

                  //BRUNO AZEVEDO SOL 149534 KINTANA 1074989
                  AtualizaDocumento(qryDocumento.FieldByName('CODDOCUMENTO').AsInteger);
               end
               else
               begin
                  sMensagem := 'Erro ao validar remessa';
                  Raise Exception.Create(sMensagem);
               end;

            end
            else
            begin
               sMensagem := 'Erro ao Verificar dados da Empresa';
               Raise Exception.Create(sMensagem);
            end;
            Ieacm.Commit;
         except
            Ieacm.Rollback;
            MsgDlg(sMensagem, 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
         end;

         // ----------------------------------------------------------------------------------------

         qryDocumento.Next;
      end;
   finally
      EscondeEspera;
   end;

   try

   finally
      frmAguarde.Hide;
//      Ieacm.Free;
   end;
end;



procedure TfrmExecGeraArquivoRemessa.FormCreate(Sender: TObject);
begin
  inherited;
   lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   pnlPasta.Caption :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

   Ieacm := TCtrlIntBanco.Create;
   Ieacm.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   Ieacm.FechaQryTexto  := False;

   //Cássio
   cdsHistMovEmptmo := TCMClientDataSet.Create(nil);
   cdsPortadorForma := TCMClientDataSet.Create(nil);
   cdsContratoEmptmo := TCMClientDataSet.Create(nil);
   cdsDadosRecebedor := TCMClientDataSet.Create(nil);
   CtrlMetodosEmptmo := TCtrlMetodosEmptmo.Create;
   CtrlMetodosEmptmo.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

end;



procedure TfrmExecGeraArquivoRemessa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Ieacm.Free;
   FreeAndNil(cdsHistMovEmptmo);
   FreeAndNil(cdsPortadorForma);
   FreeAndNil(cdsContratoEmptmo);
   FreeAndNil(cdsDadosRecebedor);
   FreeAndNil(CtrlMetodosEmptmo);
   inherited;
end;

procedure TfrmExecGeraArquivoRemessa.AtualizaDocumento(pCodDocumento: Integer);
var
  xQryUpdate: TwwQuery;
  QryControleRemessa: TwwQuery;
begin
  try
    //Monica Gonzaga - SOL 182277 KINTANA 1696776
    QryControleRemessa := TwwQuery.Create(Self);
    QryControleRemessa.DatabaseName := 'BaseDados';
    QryControleRemessa.Close;
    QryControleRemessa.Sql.Clear();
    QryControleRemessa.Sql.Add('SELECT CONTROLEREMESSA FROM PORTADORFORMA WHERE CODPORTFORMA = '+ DBcboPortadorForma.LookupValue);
    QryControleRemessa.Open;
    //Monica Gonzaga - SOL 182277 KINTANA 1696776

    xQryUpdate := TwwQuery.Create(Self);
    xQryUpdate.DatabaseName := 'BaseDados';

    xQryUpdate.Close;
    xQryUpdate.Sql.Clear();
    xQryUpdate.Sql.Add('UPDATE DOCUMENTO SET EMISBLOQ = ''S'', CONTROLEREMESSA = '+ QryControleRemessa.FieldByName('CONTROLEREMESSA').asString +' WHERE CODDOCUMENTO = ' + IntToStr(pCodDocumento)); //Monica Gonzaga - SOL 182277 KINTANA 1696776
    xQryUpdate.ExecSql;
  finally
    FreeAndNil(xQryUpdate);
    FreeAndNil(QryControleRemessa);
  end;
end;
//Monica Gonzaga - SOL182277 - KTN 1696776 - Inicio
procedure TfrmExecGeraArquivoRemessa.bbtnCancelarClick(Sender: TObject);
begin
    pgcControle.ActivePageIndex := 0;
    pgcControle.OnChange(self);
    fcLabel1.caption :='Geração de Arquivo Eletrônico de Remessa [ seleção ]';

    btnVoltar.Enabled := false;
    btnVoltar.Visible := true;
    btnVoltar.Width   := 90;
    btnVoltar.Left   := 92;

    btnContinuar.Enabled := true;
    btnContinuar.Visible := true;
    btnContinuar.Width   := 90;
    btnContinuar.Left   := 177;

    bbbtnContinuar.Enabled := false;
    bbbtnContinuar.Visible := false;

   bbtnCancelar.Enabled := false;
   bbtnCancelar.Visible := false;

   bbtnConfirmar.Enabled := false;
   bbtnConfirmar.Visible:= true;

   // monica - mudar true e false
  Label1.caption := '';
  pnlPasta.Enabled := true;
  pnlPasta.Visible := true;
  btnEscolheDir.Enabled := true;;
  btnEscolheDir.Visible := true;

end;
//Monica Gonzaga - SOL182277 - KTN 1696776 - FIM
procedure TfrmExecGeraArquivoRemessa.bbbtnConfirmarClick(Sender: TObject);
begin
if MsgDlg('Deseja Continuar?', 'Empréstimo',mtInformation,[mbno, mbyes], 0) = mryes  then
begin
    
    ParametrosSistema;

   if VerificaPreenchimentoArquivo then
   begin

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         GeraArquivoFUNCEF;
      end
      else
      begin
         GeraArquivo;
      end;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         bbtnSairClick(Self);
      end
      else
      begin
         inherited;
      end;
   end;
end
else
begin
    bbtnCancelarClick(Sender) ;
end;

end;

procedure TfrmExecGeraArquivoRemessa.btnVoltarClick(Sender: TObject);
begin
  //Monica Gonzaga - SOL182277 - KTN 1696776 - Inicio
  inherited;
  fcLabel1.caption :='Geração de Arquivo Eletrônico de Remessa [ seleção ]';
  
   bbtnCancelar.Enabled := false;
   bbtnCancelar.Visible := false;

   bbtnConfirmar.Enabled := false;
   bbtnConfirmar.Visible:= true;


end;
  //Monica Gonzaga - SOL182277 - KTN 1696776 - FIM

procedure TfrmExecGeraArquivoRemessa.AlimentaQryDocTxt_Novo(pNumDocumento: Double; pCodDocumento, pCodPortForma: Integer; pDataMov: TDateTime);
var
   rDados : TDadosRecebedor;
begin
   rDados.sLogradouro   := '';
   rDados.sNumero       := '';
   rDados.sComplemento  := '';
   rDados.sBairro       := '';
   rDados.sCidade       := '';
   rDados.sCodEstado    := '';
   rDados.sCEP          := '';
   rDados.sNumDocumento := '';

   //cdsContratoEmptmo.Data := CtrlMetodosEmptmo.GetDadosContrato(pIdContratoEmptmo);
   rDados.sNomeRecebedor   := cdsHistMovEmptmo.FieldByName('NOME').AsString;

   if cdsHistMovEmptmo.FieldByName('HMETIPOMOV').AsInteger = 0 then
   begin
    rDados.sContaCorrente   := cdsHistMovEmptmo.FieldByName('CONTACORRENTE').AsString;
    rDados.sTipoConta       := cdsHistMovEmptmo.FieldByName('TIPOCONTA').AsString;
    rDados.sNomeAgencia     := cdsHistMovEmptmo.FieldByName('NOMEAGENCIA').AsString;
    rDados.sBanco           := cdsHistMovEmptmo.FieldByName('NUMBANCO').AsString;
    rDados.sAgencia         := cdsHistMovEmptmo.FieldByName('NUMAGENCIA').AsString;
   end
   else
   begin
    rDados.sContaCorrente   := cdsHistMovEmptmo.FieldByName('CONTACORRENTEDEB').AsString;
    rDados.sTipoConta       := cdsHistMovEmptmo.FieldByName('TIPOCONTADEB').AsString;
    rDados.sNomeAgencia     := cdsHistMovEmptmo.FieldByName('NOMEAGENCIADEB').AsString;
    rDados.sBanco           := cdsHistMovEmptmo.FieldByName('NUMBANCODEB').AsString;
    rDados.sAgencia         := cdsHistMovEmptmo.FieldByName('NUMAGENCIADEB').AsString;
   end;

   while Length(rDados.sAgencia) < 5 do
    rDados.sAgencia := rDados.sAgencia + '&';


   //cdsDadosRecebedor.Data := CtrlMetodosEmptmo.GetDadosRecebedor(cdsContratoEmptmo.FieldByName('IDBENEF').AsInteger);


//   if not(cdsDadosRecebedor.IsEmpty) then
   if not cdsHistMovEmptmo.FieldByName('LOGRADOURO').IsNull then
   begin
      rDados.sLogradouro    := cdsHistMovEmptmo.FieldByName('LOGRADOURO').AsString;
      rDados.sNumero        := cdsHistMovEmptmo.FieldByName('NUMERO').AsString;
      rDados.sComplemento   := cdsHistMovEmptmo.FieldByName('COMPLEMENTO').AsString;
      rDados.sBairro        := cdsHistMovEmptmo.FieldByName('BAIRRO').AsString;
      rDados.sCidade        := cdsHistMovEmptmo.FieldByName('CIDADE').AsString;
      rDados.sCodEstado     := cdsHistMovEmptmo.FieldByName('CODESTADO').AsString;
      rDados.sCEP           := cdsHistMovEmptmo.FieldByName('CEP').AsString;
      rDados.sNumDocumento  := cdsHistMovEmptmo.FieldByName('NUMDOCUMENTO').AsString;

      while length(rDados.sNumDocumento) < 11 do
        rDados.sNumDocumento := '0' + rDados.sNumDocumento;
   end;
   // ----------------------------------------------------------------------------------------------

   try
     cdsTxt.Insert;
     cdsTxtCONTALIQUIDO.AsString       := '';
     cdsTxtIDPESSOA.AsInteger          := cdsHistMovEmptmo.FieldByName('IDBENEF').AsInteger;
     cdsTxtNOME.AsString               := rDados.sNomeRecebedor;
     cdsTxtRAZAOSOCIAL.AsString        := rDados.sNomeRecebedor;
     cdsTxtNUMDOCUMENTO.AsString       := rDados.sNumDocumento;
     cdsTxtCONTACORRENTE.AsString      := rDados.sContaCorrente;
     cdsTxtCODBANCOFAVORECIDO.AsString := rDados.sBanco;
     cdsTxtNUMAGENCIA.AsString         := rDados.sAgencia;
     cdsTxtIDFORCLI.AsInteger          := cdsHistMovEmptmo.FieldByName('IDBENEF').AsInteger;
     cdsTxtTIPOCONTA.AsString          := rDados.sTipoConta;
     cdsTxtNOMEAGENCIA.AsString        := rDados.sNomeAgencia;
     cdsTxtLOGRADOURO.AsString         := rDados.sLogradouro;
     cdsTxtNUMERO.AsString             := rDados.sNumero;
     cdsTxtCOMPLEMENTO.AsString        := rDados.sComplemento;
     cdsTxtBAIRRO.AsString             := rDados.sBairro;
     cdsTxtCIDADE.AsString             := rDados.sCidade;
     cdsTxtCODESTADO.AsString          := rDados.sCodEstado;
     cdsTxtCEP.AsString                := rDados.sCEP;

     cdsTxtCODDOCUMENTO.AsInteger      := pCodDocumento;

     cdsTxtVALOR.AsFloat               := cdsHistMovEmptmo.FieldByName('HMEVLRPREVISTO').asFloat;
     cdsTxtVALORDESCONTO.AsFloat       := 0;
     cdsTxtVALORJUROS.AsFloat          := 0;
     cdsTxtDATAVENCTO.AsString         := DateToStr(pDataMov);
     cdsTxtDATAPROGRAMADA.AsString     := DateToStr(pDataMov);
     cdsTxtTIPOMOEDA.AsInteger         := 0;
     cdsTxtNUMLOTE.AsInteger           := 0;
     cdsTxtCODPORTFORMA.AsInteger      := pCodPortForma;
     cdsTxtCODPORTADOR.AsInteger       := pCodPortForma;
     cdsTxtCODFORMAPAGTO.AsInteger     := pCodPortForma;

     cdsTxtCODTIPOPAGTO.AsInteger      := cdsPortadorForma.FieldByName('CODTIPOPAGTO').AsInteger;

     if not(cdsPortadorForma.FieldByName('FLGEMITEAVISO').IsNull) then
     begin
        cdsTxtFLGEMITEAVISO.AsString   := cdsPortadorForma.FieldByName('FLGEMITEAVISO').AsString;
     end;

     cdsTxtCODARQUIVOREMESSA.AsInteger := cdsPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger;
     cdsTxtIDBANCO.AsInteger           := cdsPortadorForma.FieldByName('IDBANCO').AsInteger;
     cdsTxtNOCONTACORR.AsString        := cdsPortadorForma.FieldByName('NOCONTACORR').AsString;

     // Pendencia 16503
     cdsTxtDMAISALT.AsInteger          := cdsPortadorForma.FieldByName('DMAISALT').AsInteger;
     cdsTxtCODFORMAPGTOALT.AsInteger   := cdsPortadorForma.FieldByName('CODFORMAPGTOALT').AsInteger;
     cdsTxtVALORMAXIMO.AsFloat         := cdsPortadorForma.FieldByName('VALORMAXIMO').AsFloat;

     cdsTxtCODBARRA.AsString           := '';
     cdsTxtCODBARRAVALOR.AsString      := '';

     // Marchetti - 13/08/2003 - Conforme solicitação da FUNCEF, deve ser passado o contrato
     // Para que seja concatenado com o nome do Mutuário

     if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
        cdsTxtNODOCUMENTO.AsFloat         := cdsHistMovEmptmo.FieldByName('IDCONTRATOEMPTMO').AsFloat
     else
        cdsTxtNODOCUMENTO.AsFloat         := pNumDocumento;

     cdsTxtCOMPLDOCUMENTO.AsString     := '000';
     cdsTxtTIPO.AsString               := 'F';
     cdsTxtNUMEMPRESABANCO.AsString    := cdsPortadorForma.FieldByName('NUMEMPRESABANCO').AsString;
     cdsTxtDEBCRE.AsString             := '';
     cdsTxtLIVRE.AsString              := '';
     cdsTxt.Post;

   except
      Raise;
      Repaint;
   end;
end;

procedure TfrmExecGeraArquivoRemessa.GeraArquivoFUNCEF_Novo;
var
   sPathArquivo,
   sMensagem    : String;
   iCodArquivo,
   iControle,
   iContador    : Integer;
   fVlrTotal    : Currency;

   
begin
  cdsTxt.Close;
  cdsTxt.Open;
  qryDocTxt.Close;
  qryDocTxt.Open;

  try
    MostraEspera('Selecionando histórico para geração do arquivo...');

    qryDocumento.First;
    while not(qryDocumento.EOF) do
    begin
      cdsHistMovEmptmo.Data := CtrlMetodosEmptmo.GetDadosMovimento(qryDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                                   qryDocumento.FieldByName('DATAVENCTO').AsDateTime);

      cdsPortadorForma.Data := CtrlMetodosEmptmo.getPortadorForma(qryDocumento.FieldByName('CODPORTFORMA').AsInteger);

      iCodArquivo := cdsPortadorForma.FieldbyName('CODARQUIVOREMESSA').AsInteger;
      iControle   := cdsPortadorForma.FieldbyName('CONTROLEREMESSA').AsInteger;
      iContador := 0;
      fVlrTotal := 0;

      MostraFormProgresso('Gerando arquivo de remessa...', 0, cdsHistMovEmptmo.RecordCount, True, True);
      cdsTxt.EmptyDataSet;

      try
        cdsHistMovEmptmo.First;

        while not cdsHistMovEmptmo.Eof do
        begin
          Inc(iContador);
          AndaFormProgresso(iContador);

          if frmProgresso.Cancelou then
          begin
            MsgDlg('Processo interrompido.', 'Empréstimo', mtInformation, [mbOK], 0);
            Repaint;
            Exit;
          end;

          AlimentaQryDocTxt_Novo(qryDocumento.FieldByName('NODOCUMENTO').AsFloat,
                                 qryDocumento.FieldByName('CODDOCUMENTO').AsInteger, 
                                 qryDocumento.FieldByName('CODPORTFORMA').AsInteger,
                                 qryDocumento.FieldByName('DATAVENCTO').AsDateTime);
          cdsHistMovEmptmo.Next;
        end;

      finally
        EscondeFormProgresso;
      end;

      try    
        Ieacm.FechaQryTexto  := False;
        Ieacm.StartTransaction;
        Ieacm.IndiceDoBanco  := iCodArquivo;

        cdsTxt.First;
        sPathArquivo := pnlPasta.Caption;

        if Ieacm.VerficaDadosEmpresa('P', qryDocumento.FieldByName('CODPORTFORMA').AsInteger) then
        begin
          if Ieacm.ValidaRemessa('P', cdsTxt.Data, False) then
          begin
            Ieacm.AtualizaDoc := True;
            Ieacm.ExibeArquivoGerado       := chkVisualiza.Checked;
            Ieacm.IdentficaOrigem          := '15';
            Ieacm.DataPagamento            := FormatDateTime('dd/mm/yyyy', qryDocumento.FieldByName('DATAVENCTO').AsDateTime);

            if not Ieacm.MontaPagamentoEletronico(iCodArquivo, iControle, cdsTxt.Data, sPathArquivo) then
            begin
              sMensagem := 'Erro ao gerar o arquivo de remessa';
              Raise Exception.Create(sMensagem);
            end;

            AtualizaDocumento(qryDocumento.FieldByName('CODDOCUMENTO').AsInteger);
          end
          else
          begin
            sMensagem := 'Erro ao validar remessa';
            Raise Exception.Create(sMensagem);
          end;

        end
        else
        begin
          sMensagem := 'Erro ao Verificar dados da Empresa';
          Raise Exception.Create(sMensagem);
        end;

        Ieacm.Commit;
      except
        Ieacm.Rollback;
        MsgDlg(sMensagem, 'Empréstimo', mtError, [mbOk], 0);
        Repaint;
      end;

      qryDocumento.Next;
    end;
  finally
    EscondeEspera;
    frmAguarde.Hide;
  end;
end;

end.
