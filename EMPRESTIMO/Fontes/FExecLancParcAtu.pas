unit FExecLancParcAtu;

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
Alteração   : Migracao-oracle
Autor(a)    : Leandro
Data        : 16/10/2025
Descrição   : Ajuste qryhistmov, qryauxhist
--------------------------------------------------------------------------------
Alteração   : VerificaPreenchimentoParcela, CalculaItensDiverg
Autor(a)    : Edilaine
Data        : 06/12/2023
Pendência   : WO4616
Descrição   : Erro no cálculo de multiplas parcelas
--------------------------------------------------------------------------------
Autor(a)    : Taffarel Sevaybriker
Data        : 07/05/2020
Pendência   : 99585
Descrição   : Erro no cálculo dos valores.
--------------------------------------------------------------------------------
Autor(a)    : William Moreira da Silva
Data        : 02/06/2016
Pendência   : 22067
Descrição   : Erro ao pesquisar (.DFM).
--------------------------------------------------------------------------------
Autor(a)    : Marcelo Cardoso
Data        : 12/05/2016
Pendência   : SIG20210
Descrição   : Ajuste na query qryHistMov.
------------------------------------------------------------------------------
Autor(a)    : André Oliveira
Data        : 27/03/2013
Pendência   : SOL 182696  KINTANA 1706883.
Descrição   : Ajustar a funcionalidade Lançamento de Prestações Atualizadas.
------------------------------------------------------------------------------
Pendência   : SOL 147162 KINTANA 1017036
Responsável : Fernando Santana
Descrição   : Corrigir sql do componente qryAbonaItem
------------------------------------------------------------------------------
Pendência   : SOL Nº 35989 Kintana Nº 523134
Responsável : Ádler Souza
Data        : 21/01/2010
Descrição   : Alteração no InsertMovEmptmo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : Varias
Data      : 05/06/2007
Autor     : Marchetti
Pendência : 24953
Descrição : Colocado o calculo e gravação dos itens de Multa e Juros de Mora.
--------------------------------------------------------------------------------
Rotina    : Varias
Data      : 05/06/2007
Autor     : Marchetti
Pendência : 24138
Descrição : Permitir o lançamento em separado de item de juros e correção
            monetária.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
   mListaPlano, mListaPatro, wwdblook, mContratoEmptmo, wwdbdatetimepicker,
   Db, DBTables, Wwquery, Wwdatsrc, CMDateTimePicker, Mask, DBCtrls,
   uTypesEmptmo, uCtrlContab, TREdit;

const
  _sSQL = ('SELECT   '+
          '   HME.IDHISTMOVEMPTMO, '+
          '  HME.Hmeparcela '+
          'FROM '+
          '   HISTMOVEMPTMO  HME '+
          'WHERE '+
          '   HME.IDCONTRATOEMPTMO          = :PIDCONTRATOEMPTMO '+
          '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO    = 1 )'+
          '   AND HME.HMEPARCELA IN ( :PHMEPARCELA )'+
          '   AND HME.HMETIPOMOV            = 4 '+
          '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '+
          '   AND NVL(HME.FLGABONADO, 0)    = 0 '+
          '   AND NVL(HME.FLGQUITADO, 0)    = 0 '+
          '   AND NVL(HME.FLGSUSPENSAO, 0)  = 0 ');


type
   TfrmExecLancaParcAtu = class(TfrmWizardMTEP)
      TabSheet3: TTabSheet;
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
      Label51: TLabel;
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
      DBEdit4: TDBEdit;
      Panel4: TPanel;
    DBgrdHistMov: TwwDBGrid;
      DBgrdHistMovIButton: TwwIButton;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovANOMES: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovPLNCODIGO: TFloatField;
      qryHistMovFORMACOBRANCA: TStringField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovFLGENVIO: TFloatField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovSTATUS: TStringField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      qryHistMovFLGSUSPENSAO: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      qryHistMovTSEDESCRICAO: TStringField;
      qryHistMovFLGATUALSALDOPARC: TFloatField;
      qryDadosContrato: TwwQuery;
      qryDadosContratoIDCONTRATOEMPTMO: TFloatField;
      qryDadosContratoIDINSCRICAOEMPTMO: TFloatField;
      qryDadosContratoIDCONTRQUITACAO: TFloatField;
      qryDadosContratoIDTIPOCONTREMPTMO: TFloatField;
      qryDadosContratoIDPATRO: TFloatField;
      qryDadosContratoIDPLANOPREV: TFloatField;
      qryDadosContratoIDPESSOA: TFloatField;
      qryDadosContratoIDBENEF: TFloatField;
      qryDadosContratoIDCBANCARIA: TFloatField;
      qryDadosContratoIDVERBA: TFloatField;
      qryDadosContratoFLGSITUACAO: TStringField;
      qryDadosContratoFLGFORMAREC: TStringField;
      qryDadosContratoPORTFORMAREC: TFloatField;
      qryDadosContratoFLGFORMAPAG: TStringField;
      qryDadosContratoCODFORMAPAG: TFloatField;
      qryDadosContratoPORTFORMAPAG: TFloatField;
      qryDadosContratoDATAASSINATURA: TDateTimeField;
      qryDadosContratoDATACREDITO: TDateTimeField;
      qryDadosContratoDATAPRIMPARC: TDateTimeField;
      qryDadosContratoDATACANC: TDateTimeField;
      qryDadosContratoDATASITUACAO: TDateTimeField;
      qryDadosContratoPRAZO: TFloatField;
      qryDadosContratoVLRCONTRATO: TFloatField;
      qryDadosContratoVLRPARCELA: TFloatField;
      qryDadosContratoTXJUROS: TFloatField;
      qryDadosContratoANOSUSPENSAO: TFloatField;
      qryDadosContratoMESSUSPENSAO: TFloatField;
      qryDadosContratoVLRPARCELAMES: TFloatField;
      qryDadosContratoVLRPARCATRASO: TFloatField;
      qryDadosContratoVLRDEBITO: TFloatField;
      qryDadosContratoVLRRESERVA: TFloatField;
      qryDadosContratoVLRSALDODEV: TFloatField;
      qryDadosContratoVLRPENDENCIA: TFloatField;
      qryDadosContratoVLRSALBASE: TFloatField;
      qryDadosContratoVLRMARGEM: TFloatField;
      qryDadosContratoDATASALDODEV: TDateTimeField;
      qryDadosContratoDATAPENDENCIA: TDateTimeField;
      qryDadosContratoTCEDESCRICAO: TStringField;
      qryDadosContratoIDTIPOEMPTMO: TFloatField;
      qryDadosContratoDESCTIPOEMPTMO: TStringField;
      qryDadosContratoIDEMPRESAPROP: TFloatField;
      qryDadosContratoMATRICULA: TStringField;
      qryDadosContratoINSCRICAONUMERO: TFloatField;
      qryDadosContratoSALPARTICIPACAO: TFloatField;
      qryDadosContratoSALMANTIDO: TFloatField;
      qryDadosContratoSALAUXDOENCA: TFloatField;
      qryDadosContratoSITDESCRICAO: TStringField;
      qryDadosContratoFLGINTERNO: TStringField;
      qryDadosContratoNOME_TITULAR: TStringField;
      qryDadosContratoCPF_TITULAR: TStringField;
      qryDadosContratoNOME: TStringField;
      qryDadosContratoNOME_MUTUARIO: TStringField;
      qryDadosContratoNUMDOCUMENTO: TStringField;
      qryDadosContratoCPF_MUTUARIO: TStringField;
      qryDadosContratoMATRICULA_MUTUARIO: TStringField;
      qryDadosContratoDESCSITCONTRATO: TStringField;
      qryDadosContratoPLANOPREV: TStringField;
      qryDadosContratoPATRO: TStringField;
      qryDadosContratoBANCO: TStringField;
      qryDadosContratoNUMBANCO: TStringField;
      qryDadosContratoCONTACORRENTE: TStringField;
      qryDadosContratoNUMAGENCIA: TStringField;
      qryDadosContratoAMODATAPREVISTA: TDateTimeField;
      qryDadosContratoFORMAPAGAMORT: TStringField;
      qryDadosContratoQUIDATAPREVISTA: TDateTimeField;
      qryDadosContratoFORMAPAGQUITA: TStringField;
      qryDadosContratoIDSITPART: TFloatField;
      qryDadosContratoIDREGRAMARGEM: TFloatField;
      qryDadosContratoIDREGRARESERVA: TFloatField;
      qryDadosContratoIDREGRAELEG: TFloatField;
      qryDadosContratoIDREGRALIMITES: TFloatField;
      qryDadosContratoTCEMINRENOVA: TFloatField;
      qryDadosContratoTCEDIASVALIDINSC: TFloatField;
      qryDadosContratoTCEDIASTOLERAINSC: TFloatField;
      qryDadosContratoTCEMAXCONTRATO: TFloatField;
      qryDadosContratoTCEMAXINSCR: TFloatField;
      qryDadosContratoTCEMAXPARC: TFloatField;
      qryDadosContratoTCEMINPARC: TFloatField;
      qryDadosContratoTCEMINQUIT: TFloatField;
      qryDadosContratoDATAULTATUALIZA: TDateTimeField;
      qryDadosContratoMOECODIGO: TFloatField;
      qryDadosContratoMOESIGLA: TStringField;
      qryDadosContratoVLRMAXPERMIT: TFloatField;
      qryDadosContratoNUMPARCELAS: TFloatField;
      qryDadosContratoDATAINSC: TDateTimeField;
      qryDadosContratoIDTIPOSUSPEMPTMO: TFloatField;
      qryDadosContratoDATAINICIOSUSP: TDateTimeField;
      qryDadosContratoDATAFIMSUSP: TDateTimeField;
      qryDadosContratoUSUARIOLIBSUSP: TStringField;
      qryDadosContratoDATALIBSUSP: TDateTimeField;
      qryDadosContratoHORALIBSUSP: TStringField;
      qryDadosContratoFLGSUSPENSAOAUTO: TFloatField;
      qryDadosContratoIDCBANCARIADEB: TFloatField;
      qryDadosContratoIDPLANOORIGEM: TFloatField;
      Label2: TLabel;
      Label5: TLabel;
      edtVlrJuros: TDBRealEdit;
      edtVlrCM: TDBRealEdit;
      rdgSelecao: TRadioGroup;
      Panel2: TPanel;
      edtDataVencto: TCMDateTimePicker;
      Label13: TLabel;
      qryItens: TwwQuery;
      qryItensIDITEMEMPTMO: TFloatField;
      qryItensHMETIPOMOV: TFloatField;
      qryItensHMEORIGEM: TFloatField;
      qryItensHMEPARCELA: TFloatField;
      qryItensHMENUMPARCELAS: TFloatField;
      qryItensHMECENTRALIZA: TFloatField;
      qryItensHMEDESTACADO: TFloatField;
      qryItensHMEDATA: TDateTimeField;
      qryItensHMEDATAPREVISTA: TDateTimeField;
      qryItensHMEDATAEFETIVA: TDateTimeField;
      qryItensHMEDATAATUALIZA: TDateTimeField;
      qryItensHMEDATAVENCTO: TDateTimeField;
      qryItensHMEANOCOMPETENCIA: TFloatField;
      qryItensHMEMESCOMPETENCIA: TFloatField;
      qryItensHMEANOCOBRANCA: TFloatField;
      qryItensHMEMESCOBRANCA: TFloatField;
      qryItensHMEVLRPREVISTO: TFloatField;
      qryItensHMEVLREFETIVO: TFloatField;
      qryItensHMESALDODEV: TFloatField;
      qryItensHMETXJUROS: TFloatField;
      qryItensHMEFORMACOBRANCA: TStringField;
      qryItensFLGENVIO: TFloatField;
      qryItensFLGBAIXADO: TFloatField;
      qryItensFLGESTORNADO: TFloatField;
      qryItensFLGQUITADO: TFloatField;
      qryItensFLGABONADO: TFloatField;
      qryItensFLGDIVERGPEND: TFloatField;
      qryItensITEDESCRICAO: TStringField;
      qryItensIDHISTMOVEMPTMO: TFloatField;
      qryItensFLGSUSPENSAO: TFloatField;
      qryItensORDENACAO: TFloatField;
      qryItensHMEPARCELAALT: TFloatField;
      qryBuscaItens: TwwQuery;
      qryBuscaItensIDITEMEMPTMO: TFloatField;
      qryBuscaItensFLGCENTRALIZA: TFloatField;
      qryBuscaItensITCRECPAG: TStringField;
      qryBuscaItensIDREGRACALC: TFloatField;
      qryBuscaItensITCPRIORIDADE: TFloatField;
      qryBuscaItensIDPROVENTON: TFloatField;
      qryBuscaItensITCEVENTO: TFloatField;
      qryBuscaItensITCSEQCALCULO: TFloatField;
      qryBuscaItensIDITEMCENTRALIZA: TFloatField;
      qryBuscaItensITEDESCRICAO: TStringField;
      qryBuscaItensITCTRATASALDODEV: TFloatField;
      qryBuscaItensFLGDESTACADO: TFloatField;
      qryBuscaItensFLGGRAVAZERO: TFloatField;
      qryBuscaItensORDENACAO: TFloatField;
      dts: TwwDataSource;
      grpAlternativo: TGroupBox;
      Bevel1: TBevel;
      edtDataBase: TCMDateTimePicker;
      edtVlrBase: TDBRealEdit;
      Label19: TLabel;
      Label20: TLabel;
      edtVlrBase2: TDBRealEdit;
      Label23: TLabel;
      Label24: TLabel;
      edtDataBase2: TCMDateTimePicker;
      Bevel2: TBevel;
      Bevel3: TBevel;
      edtTxJuros: TDBRealEdit;
      Label25: TLabel;
      Label26: TLabel;
      edtTxJuros2: TDBRealEdit;
      rdgTratamento: TRadioGroup;
      Image1: TImage;
      RadioGroup1: TRadioGroup;
      rdgLancamento: TRadioGroup;
      DBcboItem: TwwDBLookupCombo;
      Label27: TLabel;
      chkAbono: TCheckBox;
      Bevel4: TBevel;
      edtDataAbono: TCMDateTimePicker;
      qryLookItem: TwwQuery;
      qryLookItemITEDESCRICAO: TStringField;
      qryLookItemIDITEMEMPTMO: TFloatField;
      qryLookItemFLGDESTACADO: TFloatField;
      qryLookItemFLGCENTRALIZA: TFloatField;
      qryLookItemITCTRATASALDODEV: TFloatField;
      Label28: TLabel;
      edtSaldoAtual: TRealEdit;
      qryAbonaItem: TwwQuery;
      qryEncargosAbono: TwwQuery;
      qryEncargosAbonoIDHISTMOVEMPTMO: TFloatField;
      Label14: TLabel;
      cboItemJuros: TwwDBLookupCombo;
      Label15: TLabel;
      cboItemCM: TwwDBLookupCombo;
      chkTipoLancamento: TCheckBox;
      qryLookItemJuros: TwwQuery;
      qryLookItemCM: TwwQuery;
      qryLookItemCMIDITEMEMPTMO: TFloatField;
      qryLookItemCMITEDESCRICAO: TStringField;
      qryLookItemCMFLGDESTACADO: TFloatField;
      qryLookItemCMFLGCENTRALIZA: TFloatField;
      qryLookItemCMITCTRATASALDODEV: TFloatField;
      qryLookItemJurosIDITEMEMPTMO: TFloatField;
      qryLookItemJurosITEDESCRICAO: TStringField;
      qryLookItemJurosFLGDESTACADO: TFloatField;
      qryLookItemJurosFLGCENTRALIZA: TFloatField;
      qryLookItemJurosITCTRATASALDODEV: TFloatField;
      qryLookItemMulta: TwwQuery;
      qryLookItemMultaIDITEMEMPTMO: TFloatField;
      qryLookItemMultaITEDESCRICAO: TStringField;
      qryLookItemMultaFLGDESTACADO: TFloatField;
      qryLookItemMultaFLGCENTRALIZA: TFloatField;
      qryLookItemMultaITCTRATASALDODEV: TFloatField;
      qryLookItemMora: TwwQuery;
      qryLookItemMoraIDITEMEMPTMO: TFloatField;
      qryLookItemMoraITEDESCRICAO: TStringField;
      qryLookItemMoraFLGDESTACADO: TFloatField;
      qryLookItemMoraFLGCENTRALIZA: TFloatField;
      qryLookItemMoraITCTRATASALDODEV: TFloatField;
    Label30: TLabel;
    edtVlrMora: TDBRealEdit;
    Label31: TLabel;
    edtVlrMulta: TDBRealEdit;
    Label32: TLabel;
    cboItemMora: TwwDBLookupCombo;
    Label33: TLabel;
    cboItemMulta: TwwDBLookupCombo;
    qryEncargosAbonoHMEPARCELA: TFloatField;
    //inicio - André Oliveira SOL 182696  KINTANA 1706883.
    qryHistMovFLGESCOLHA: TStringField;
    Label34: TLabel;
    edtVlrFGQC: TDBRealEdit;
    Label35: TLabel;
    ckbVlrJuros: TCheckBox;
    ckbVlrMora: TCheckBox;
    ckbVlrMulta: TCheckBox;
    ckbVlrCM: TCheckBox;
    ckbVlrFGQC: TCheckBox;
    updHistMov: TUpdateSQL;
    qryAuxHist: TwwQuery;
    dsAuxHist: TwwDataSource;
    updAuxHist: TUpdateSQL;
    qryAuxHistFLGESCOLHA: TStringField;
    qryAuxHistEVENTO: TStringField;
    qryAuxHistANOMES: TStringField;
    qryAuxHistHMEPARCELA: TFloatField;
    qryAuxHistHMESEQCOBRANCA: TFloatField;
    qryAuxHistFORMACOBRANCA: TStringField;
    qryAuxHistITEDESCRICAO: TStringField;
    qryAuxHistHMEDATAVENCTO: TDateTimeField;
    qryAuxHistHMEVLRPREVISTO: TFloatField;
    qryAuxHistSTATUS: TStringField;
    qryAuxHistHMETXJUROS: TFloatField;
    qryAuxHistHMESALDODEV: TFloatField;
    qryAuxHistHMEANOCOMPETENCIA: TFloatField;
    qryAuxHistHMEMESCOMPETENCIA: TFloatField;
    qryAuxHistHMETIPOMOV: TFloatField;
    qryAuxHistHMEDATAPREVISTA: TDateTimeField;
    qryAuxHistIDCONTRATOEMPTMO: TFloatField;
    qryAuxHistIDITEMEMPTMO: TFloatField;
    qryAuxHistHMEFORMACOBRANCA: TStringField;
    qryAuxHistIDRUBRICA: TFloatField;
    qryAuxHistIDPATRO: TFloatField;
    qryAuxHistCODDOCUMENTO: TFloatField;
    qryAuxHistIDHISTMOVEMPTMO: TFloatField;
    qryAuxHistHMECENTRALIZA: TFloatField;
    qryAuxHistHMEDESTACADO: TFloatField;
    qryAuxHistHMEANOCOBRANCA: TFloatField;
    qryAuxHistHMEMESCOBRANCA: TFloatField;
    qryAuxHistHMEDATAATUALIZA: TDateTimeField;
    qryAuxHistHMENUMPARCELAS: TFloatField;
    qryAuxHistPLNCODIGO: TFloatField;
    qryAuxHistFLGENVIO: TFloatField;
    qryAuxHistFLGBAIXADO: TFloatField;
    qryAuxHistFLGBAIXAMANUAL: TFloatField;
    qryAuxHistHMEDATAEFETIVA: TDateTimeField;
    qryAuxHistHMEVLREFETIVO: TFloatField;
    qryAuxHistHMERECPAG: TStringField;
    qryAuxHistIDITEMCENTRALIZA: TFloatField;
    qryAuxHistIDREGRA: TFloatField;
    qryAuxHistHMEORIGEM: TFloatField;
    qryAuxHistHMEPRIORIDADE: TFloatField;
    qryAuxHistFLGSUSPENSAO: TFloatField;
    qryAuxHistHMEPARCELAALT: TFloatField;
    qryAuxHistTSEDESCRICAO: TStringField;
    qryAuxHistFLGATUALSALDOPARC: TFloatField;
    qryDadosContratoFLGPERDAEFETIVA: TFloatField;


    //fim - André Oliveira SOL 182696  KINTANA 1706883.

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure rdgTratamentoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure qryHistMovAfterScroll(DataSet: TDataSet);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure chkTipoLancamentoClick(Sender: TObject);
    //inicio - André Oliveira SOL 182696  KINTANA 1706883.
    procedure ckbVlrJurosClick(Sender: TObject);
    procedure ckbVlrMoraClick(Sender: TObject);
    procedure ckbVlrMultaClick(Sender: TObject);
    procedure ckbVlrCMClick(Sender: TObject);
    procedure ckbVlrFGQCClick(Sender: TObject);
    procedure DBgrdHistMovOnClick(Sender : TObject);
    procedure DBgrdHistMovKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBgrdHistMovMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBgrdHistMovFieldChanged(Sender: TObject; Field: TField);
    //fim - André Oliveira SOL 182696  KINTANA 1706883.

   private // Private declarations

      rContrato   : TDadosContrato;

      Contab      : TCtrlContab;
      iCount      : Integer;
      iTotParcelas :  Integer;     //edilaine WO4616

      procedure Sel(i: Extended);

      procedure AbreItens;

      procedure ContinuaSelecao;
      procedure Calcula;
      procedure ValorBase;

      function  VerificaBaixa: Boolean;
      function  VerificaPreenchimentoContrato: Boolean;
      function  VerificaPreenchimentoParcela: Boolean;
      function  VerificaPreenchimentoLancamento: Boolean;

      function  CalculaItensDiverg(const rContrato        : TDadosContrato;
                                   const iParcela         : Integer;
                                   const iParcelaAlt      : Integer;
                                   const iParcResta       : Integer;
                                   const iAnoCompetencia  : Integer;
                                   const iMesCompetencia  : Integer;
                                   const dDataDiverg      : TDateTime;
                                   const dDataVenc        : TDateTime;
                                   const dDataAtu         : TDateTime;
                                   var   vLista           : TListaItem;
                                   const bMostraMsg       : Boolean;
                                   const bMostraProgresso : Boolean;
                                   const IDItemEmptmo     : Integer;
                                   var   sValor           : String;
                                   bMultiplasParcelas     : boolean
                                  ): Boolean;


      function  AbonaPrestacao: Boolean;
      function  LancaAjusteSaldoDevedor: Boolean;
      function  AbonaEncargos: Boolean;

      function  AbonaItem(const IDHistMovEmptmo  : String;
                          const dDataAbono       : TDateTime
                         ): Boolean;

      procedure SelecionaEncargosAbono;
      procedure LimpaCampos;  //André Oliveira SOL 182696  KINTANA 1706883.

      function  AtualizaSaldoAposLancamento: Boolean;
      function  AtualizaSaldoAteLancamento: Boolean;

      // Marchetti - Pendencia 24138
      procedure HabilitaCombos;
      function  LancaAjusteSaldoDevedorPorItem(const iItem : Integer; const fValor : Currency; const iTipoLanc : Integer) : Boolean;
      // Fim Marchetti - Pendencia 24138


   public // Public declarations
   Parcela          : TStringList;
   ParcelaEncargo   : String;
      procedure SelecionaParcelas;
      procedure SelecionaParcelasEncargo;

   end;



var
  frmExecLancaParcAtu: TfrmExecLancaParcAtu;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo, dMS,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo, fExecBuscaContrato,
   fProgresso, uCalcEmptmo, uLancContab, dAtualizacaoDiaria;




procedure TfrmExecLancaParcAtu.Sel(i: Extended);
begin
   with qryDadosContrato do
   begin
      LimpaParametros(qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmExecLancaParcAtu.AbreItens;
begin
   with qryLookItem do
   begin
      LimpaParametros(qryLookItem);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PITCEVENTO').AsInteger          := 8;

      case rdgLancamento.ItemIndex of
         0: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;

   // Marchetti - Pendencia 24138
   with qryLookItemJuros do
   begin
      LimpaParametros(qryLookItemJuros);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PITCEVENTO').AsInteger          := 8;

      case rdgLancamento.ItemIndex of
         0: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;

   with qryLookItemCM do
   begin
      LimpaParametros(qryLookItemCM);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PITCEVENTO').AsInteger          := 8;

      case rdgLancamento.ItemIndex of
         0: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;
   // Fim Marchetti - Pendencia 24138

   // Marchetti - Pendencia 24953
   with qryLookItemMulta do
   begin
      LimpaParametros(qryLookItemMulta);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PITCEVENTO').AsInteger          := 8;

      case rdgLancamento.ItemIndex of
         0: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;

   with qryLookItemMora do
   begin
      LimpaParametros(qryLookItemMora);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PITCEVENTO').AsInteger          := 8;

      case rdgLancamento.ItemIndex of
         0: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;
   // Fim Marchetti - Pendencia 24953
end;



function TfrmExecLancaParcAtu.VerificaBaixa: Boolean;
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
      Result := not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull);
   finally
      qryAux.Free;
   end;
end;



function TfrmExecLancaParcAtu.VerificaPreenchimentoContrato: Boolean;
begin
   Result := False;

   try
      if not(qryDadosContrato.Active) then
         raise EValidacao.CreateVal('É necessário selecionar um Contrato!', btnBuscaContrato);

      if not(VerificaBaixa) then
         raise EValidacao.CreateVal('O Contrato selecionado ainda não foi efetivado!', btnBuscaContrato);

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



function  TfrmExecLancaParcAtu.VerificaPreenchimentoLancamento: Boolean;
var
   bSelecao : Boolean;
begin
   Result   := False;
   bSelecao := False;

   try
      // -------------------------------------------------------------------------------------------

      if DBcboItem.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário selecionar o Item para lançamento!', DBcboItem);

      if chkAbono.Checked then
         if length(trim(edtDataAbono.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar a data para abono dos encargos!', edtDataAbono);

      // -------------------------------------------------------------------------------------------

      // Marchetti - Pendencia 24138
      if not(chkTipoLancamento.Checked) then
      begin
         if cboItemJuros.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Item para lançamento de Juros!', cboItemJuros);

         if cboItemCM.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Item para lançamento de Correção Monetária!', cboItemCM);

         if cboItemJuros.LookupValue = DBcboItem.LookupValue then
            raise EValidacao.CreateVal('Item de Juros não pode ser o mesmo item de Incorporação/Abatimento de saldo!', cboItemJuros);

         if cboItemCM.LookupValue = DBcboItem.LookupValue then
            raise EValidacao.CreateVal('Item de Correção Monetária não pode ser o mesmo item de Incorporação/Abatimento de saldo!', cboItemCM);

         if cboItemCM.LookupValue = cboItemJuros.LookupValue then
            raise EValidacao.CreateVal('Item de Correção Monetária não pode ser o mesmo item de Juros!', cboItemCM);

         // Marchetti - Pendencia 24953

         if cboItemMora.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Item para lançamento de Juros de Mora!', cboItemMora);

         if cboItemMulta.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário selecionar o Item para lançamento de Multa!', cboItemMulta);

         if cboItemMora.LookupValue = DBcboItem.LookupValue then
            raise EValidacao.CreateVal('Item de Juros de Mora não pode ser o mesmo item de Incorporação/Abatimento de saldo!', cboItemMora);

         if cboItemMulta.LookupValue = DBcboItem.LookupValue then
            raise EValidacao.CreateVal('Item de Multa não pode ser o mesmo item de Incorporação/Abatimento de saldo!', cboItemMulta);

         if cboItemMulta.LookupValue = cboItemCM.LookupValue then
            raise EValidacao.CreateVal('Item de Multa não pode ser o mesmo item de Correção Monetária !', cboItemMulta);

         if cboItemMora.LookupValue = cboItemCM.LookupValue then
            raise EValidacao.CreateVal('Item de Juros de Mora não pode ser o mesmo item de Correção Monetária!', cboItemMora);

         if cboItemMulta.LookupValue = cboItemJuros.LookupValue then
            raise EValidacao.CreateVal('Item de Multa não pode ser o mesmo item de Juros!', cboItemMulta);

         if cboItemMora.LookupValue = cboItemJuros.LookupValue then
            raise EValidacao.CreateVal('Item de Juros de Mora não pode ser o mesmo item de Juros Remuneratórios!', cboItemMora);

         if cboItemMora.LookupValue = cboItemMulta.LookupValue then
            raise EValidacao.CreateVal('Item de Juros de Mora não pode ser o mesmo item de Multa!', cboItemMora);

         // Fim Marchetti - Pendencia 24953
      end;
      // Fim Marchetti - Pendencia 24138
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



function TfrmExecLancaParcAtu.VerificaPreenchimentoParcela: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;

   bSelecao    : Boolean;
begin
   Result   := False;


   try
      // -------------------------------------------------------------------------------------------

      if qryHistMov.IsEmpty then
         raise EValidacao.CreateVal('Não há prestações a atualizar!', btnContinuar);
     //Inicio - André Oliveira SOL 182696  KINTANA 1706883.
     iCount:= 0;
      qryHistMov.First;
      while not qryHistMov.Eof do
      begin
           if qryHistMov.FieldByName('FLGESCOLHA').AsInteger = 1 then
              iCount:= iCount +1;

           qryHistMov.Next;
      end;
      iTotParcelas := iCount;     //edilaine WO4616

      if(iCount = 0) then
       begin
          raise EValidacao.CreateVal('Selecione ao menos uma prestação para continuar.', btnContinuar);
       end;
      qryHistMov.First;
      //Fim - André Oliveira SOL 182696  KINTANA 1706883.
      // -------------------------------------------------------------------------------------------

      if (length(trim(edtDataBase.Text)) > 0) or (edtVlrBase.Value <> 0) or (edtTxJuros.Value <> 0) then
      begin
         if not(edtVlrBase.Value <> 0) then
            raise EValidacao.CreateVal('É necessário indicar o Valor-base!', edtVlrBase);

         if not(length(trim(edtDataBase.Text)) > 0) then
            raise EValidacao.CreateVal('É necessário indicar a Data-base!', edtDataBase);

         if not(edtTxJuros.Value <> 0) then
            raise EValidacao.CreateVal('É necessário indicar a Taxa de Juros!', edtTxJuros);
      end;

      // -------------------------------------------------------------------------------------------

      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a data para atualização!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // Pendência 24146 - 08/01/2007 - Alberto
      if rdgTratamento.ItemIndex <> 1 then
      begin
         if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
         begin
            // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
            // estorno na data de cancelamento indicada
            sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
            iEmpresa    := Sistema.idEmpresa;
            sMsgContab  := '';

            if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
               raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataVencto);

            if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
            begin
               sMsgContab := Contab.MessageInfo;
               raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataVencto);
            end;
         end;
      end;

      // -------------------------------------------------------------------------------------------

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



procedure TfrmExecLancaParcAtu.btnBuscaContratoClick(Sender: TObject);
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
         PreencheDadosContrato(qryDadosContrato, rContrato);

         frmExecBuscaContrato.Free;
         Screen.Cursor     := crDefault;
      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));
         PreencheDadosContrato(qryDadosContrato, rContrato);
         Screen.Cursor     := crDefault;
      end; // if MontaSelect.RetornouValor
   end;
end;



procedure TfrmExecLancaParcAtu.ContinuaSelecao;
begin
   inherited;

   // abre a query HistMov com os parâmetros passados
   with qryHistMov do
   begin
      LimpaParametros(qryHistMov);

      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;

      case rdgSelecao.ItemIndex of
         0: ParamByName('PABERTO').AsInteger       := 1;
      end;

      Open;
   end;

   with qryAuxHist do
   begin
      LimpaParametros(qryAuxHist);

      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;

      case rdgSelecao.ItemIndex of
         0: ParamByName('PABERTO').AsInteger       := 1;
      end;

      Open;
   end;


   DBgrdHistMov.Enabled := True;
end;



procedure TfrmExecLancaParcAtu.btnContinuarClick(Sender: TObject);
begin
   ParametrosSistema;

   case pgcControle.ActivePageIndex of

      0:
      if VerificaPreenchimentoContrato then
      begin
         edtVlrBase.Value := 0;
         edtDataBase.Clear;
         edtTxJuros.Value := 0;

         // Pendência 24098 - 04/01/2007 - Alberto
         grpAlternativo.Enabled := rdgTratamento.ItemIndex = 1;

         ContinuaSelecao;
         AbreItens;
         inherited;
         DBgrdHistMov.Enabled := True;//André Oliveira SOL 182696  KINTANA 1706883.
      end;

      1:
      if VerificaPreenchimentoParcela then
      begin
         edtVlrBase2.Value := edtVlrBase.Value;
         edtDataBase2.Date := edtDataBase.Date;
         edtTxJuros2.Value := edtTxJuros.Value;

         if rdgTratamento.ItemIndex = 0 then edtDataAbono.Date := edtDatavEncto.Date;

         // Marchetti - Pendencia 24138
         HabilitaCombos;

         Calcula;
         AbreItens;
         inherited;
      end;

   end;
end;



procedure TfrmExecLancaParcAtu.Calcula;
var
   vLista   : TListaItem;
   sVlrCM,sVlrJuros, sVlrMulta ,sVlrMora, sVlrFGQC : Double;//André Oliveira SOL 182696  KINTANA 1706883.
   sValor   : String;
begin

    //INICIO - André Oliveira SOL 182696  KINTANA 1706883.

   {
    CalculaItensDiverg(rContrato,
                      qryHistMovHMEPARCELA.AsInteger,
                      qryHistMovHMEPARCELAALT.AsInteger,
                      qryHistMovHMENUMPARCELAS.AsInteger,
                      DiasUteis.ExtraiAno(edtDataVencto.Date),
                      DiasUteis.ExtraiMes(edtDataVencto.Date),
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      vLista,
                      True,
                      True,
                      42,
                      sValor
                     );

   edtVlrCM.Value := StrToFloat(ConverteVirg(sValor));


   CalculaItensDiverg(rContrato,
                      qryHistMovHMEPARCELA.AsInteger,
                      qryHistMovHMEPARCELAALT.AsInteger,
                      qryHistMovHMENUMPARCELAS.AsInteger,
                      DiasUteis.ExtraiAno(edtDataVencto.Date),
                      DiasUteis.ExtraiMes(edtDataVencto.Date),
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      vLista,
                      True,
                      True,
                      43,
                      sValor
                     );

   edtVlrJuros.Value := StrToFloat(ConverteVirg(sValor));

   // ----------------------------------------------------------------------------------------------

   // Marchetti - pendencia 24953

   CalculaItensDiverg(rContrato,
                      qryHistMovHMEPARCELA.AsInteger,
                      qryHistMovHMEPARCELAALT.AsInteger,
                      qryHistMovHMENUMPARCELAS.AsInteger,
                      DiasUteis.ExtraiAno(edtDataVencto.Date),
                      DiasUteis.ExtraiMes(edtDataVencto.Date),
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      vLista,
                      True,
                      True,
                      44,
                      sValor
                     );
   edtVlrMulta.Value := StrToFloat(ConverteVirg(sValor));

   CalculaItensDiverg(rContrato,
                      qryHistMovHMEPARCELA.AsInteger,
                      qryHistMovHMEPARCELAALT.AsInteger,
                      qryHistMovHMENUMPARCELAS.AsInteger,
                      DiasUteis.ExtraiAno(edtDataVencto.Date),
                      DiasUteis.ExtraiMes(edtDataVencto.Date),
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      edtDataVencto.Date,
                      vLista,
                      True,
                      True,
                      46,
                      sValor
                     );

   edtVlrMora.Value := StrToFloat(ConverteVirg(sValor));

   edtSaldoAtual.Value := edtVlrBase2.Value + edtVlrJuros.Value + edtVlrCM.Value + edtVlrMora.Value + edtVlrMulta.Value;
   // Fim Marchetti - pendencia 24953

   // ----------------------------------------------------------------------------------------------
   }
   // ----------------------------------------------------------------------------------------------
   sVlrFGQC  := 0;
   sVlrMora  := 0;
   sVlrMulta := 0;
   sVlrJuros := 0;
   sVlrCM    := 0;

   qryHistMov.First;
   while not qryHistMov.Eof do
   begin
     if(qryHistMov.FieldByName('FLGESCOLHA').AsString <> '0')then
     begin


         CalculaItensDiverg(rContrato,
                            qryHistMovHMEPARCELA.AsInteger,
                            qryHistMovHMEPARCELAALT.AsInteger,
                            qryHistMovHMENUMPARCELAS.AsInteger,
                            DiasUteis.ExtraiAno(edtDataVencto.Date),
                            DiasUteis.ExtraiMes(edtDataVencto.Date),
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            vLista,
                            True,
                            True,
                            42,
                            sValor,
                            iTotParcelas > 1     //edilaine WO4616
                           );

         sVlrCM := sVlrCM + StrToFloat(ConverteVirg(sValor));

         CalculaItensDiverg(rContrato,
                            qryHistMovHMEPARCELA.AsInteger,
                            qryHistMovHMEPARCELAALT.AsInteger,
                            qryHistMovHMENUMPARCELAS.AsInteger,
                            DiasUteis.ExtraiAno(edtDataVencto.Date),
                            DiasUteis.ExtraiMes(edtDataVencto.Date),
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            vLista,
                            True,
                            True,
                            43,
                            sValor,
                            iTotParcelas > 1     //edilaine WO4616
                           );

         sVlrJuros := sVlrJuros+ StrToFloat(ConverteVirg(sValor));

         // ----------------------------------------------------------------------------------------------

         // Marchetti - pendencia 24953
         CalculaItensDiverg(rContrato,
                            qryHistMovHMEPARCELA.AsInteger,
                            qryHistMovHMEPARCELAALT.AsInteger,
                            qryHistMovHMENUMPARCELAS.AsInteger,
                            DiasUteis.ExtraiAno(edtDataVencto.Date),
                            DiasUteis.ExtraiMes(edtDataVencto.Date),
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            vLista,
                            True,
                            True,
                            44,
                            sValor,
                            iTotParcelas > 1     //edilaine WO4616
                           );

         sVlrMulta := sVlrMulta+ StrToFloat(ConverteVirg(sValor));

         CalculaItensDiverg(rContrato,
                            qryHistMovHMEPARCELA.AsInteger,
                            qryHistMovHMEPARCELAALT.AsInteger,
                            qryHistMovHMENUMPARCELAS.AsInteger,
                            DiasUteis.ExtraiAno(edtDataVencto.Date),
                            DiasUteis.ExtraiMes(edtDataVencto.Date),
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            vLista,
                            True,
                            True,
                            46,
                            sValor,
                            iTotParcelas > 1     //edilaine WO4616
                           );
         sVlrMora := sVlrMora +StrToFloat(ConverteVirg(sValor));

         CalculaItensDiverg(rContrato,
                            qryHistMovHMEPARCELA.AsInteger,
                            qryHistMovHMEPARCELAALT.AsInteger,
                            qryHistMovHMENUMPARCELAS.AsInteger,
                            DiasUteis.ExtraiAno(edtDataVencto.Date),
                            DiasUteis.ExtraiMes(edtDataVencto.Date),
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            edtDataVencto.Date,
                            vLista,
                            True,
                            True,
                            99,
                            sValor,
                            iTotParcelas > 1     //edilaine WO4616
                           );

         sVlrFGQC := sVlrFGQC + StrToFloat(ConverteVirg(sValor));


         edtVlrFGQC.Value  := sVlrFGQC;
         edtVlrMora.Value  := sVlrMora;
         edtVlrMulta.Value := sVlrMulta;
         edtVlrJuros.Value := sVlrJuros;
         edtVlrCM.Value    := sVlrCM;

     end;
       qryHistMov.Next;
  end;
  qryHistMov.First;

   edtSaldoAtual.Value := edtVlrBase2.Value;
   if (ckbVlrJuros.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrJuros.Value;
   if (ckbVlrCM.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrCM.Value;
   if (ckbVlrMora.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrMora.Value;
   if (ckbVlrMulta.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrMulta.Value;
   if (ckbVlrFGQC.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrFGQC.Value;
   // Fim Marchetti - pendencia 24953

   // ----------------------------------------------------------------------------------------------
end;



function TfrmExecLancaParcAtu.CalculaItensDiverg(const rContrato        : TDadosContrato;
                                                 const iParcela         : Integer;
                                                 const iParcelaAlt      : Integer;
                                                 const iParcResta       : Integer;
                                                 const iAnoCompetencia  : Integer;
                                                 const iMesCompetencia  : Integer;
                                                 const dDataDiverg      : TDateTime;
                                                 const dDataVenc        : TDateTime;
                                                 const dDataAtu         : TDateTime;
                                                 var   vLista           : TListaItem;
                                                 const bMostraMsg       : Boolean;
                                                 const bMostraProgresso : Boolean;
                                                 const IDItemEmptmo     : Integer;
                                                 var   sValor           : String;
                                                 bMultiplasParcelas     : boolean   //edilaine WO4616
                                                ): Boolean;
const
   iEvento        = 4;
   iOrigem        = 7;
   sFormaCobranca = 'C';
var
   bCabecalho              : Boolean;
   rSaldoDevAnt            : TSaldoDevAnt;
   fNovoSaldoDev           : Currency;
   sCabecalho              : String;
   sSQL, sSQLExec, sEstado : String;
   vSQL                    : array of String;
   i, j, k, iContador      : Integer;
   iPais, iCidade, iEstado : Int64;
begin
   Result := False;

   try
      ParametrosSistema;
      iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
      iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
      iEstado     := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
      sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

      sValor      := '0';
      sSQL        := '';
      i           := 0;
      k           := 0;
      iContador   := 0;

      // abertura da query dos itens de Divergência
      with qryBuscaItens do
      begin
         LimpaParametros(qryBuscaItens);
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rContrato.IDTipoContrEmptmo;
         ParamByName('PEVENTO').AsInteger             := iEvento;
         ParamByName('PIDITEMEMPTMO').AsInteger       := IDItemEmptmo;
         Open;
      end;


      if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando Itens de Divergência...',
                                                                True,
                                                                True,
                                                                True,
                                                                0,
                                                                qryBuscaItens.RecordCount
                                                               );

      // busca o saldo devedor anterior
      rSaldoDevAnt := CalcEmptmo.SaldoDevAnt(rContrato.IDContratoEmptmo,
                                             dDataDiverg,
                                             iAnoCompetencia,
                                             iMesCompetencia,
                                             False
                                            );

      // -------------------------------------------------------------------------------------------
      //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
      // -------------------------------------------------------------------------------------------

      SetLength(vSQL, i + 1);

      sSQL := '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
      'SELECT '                                                                                                      + #13 +
      '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   + #13 +
      '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  + #13 +
      '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       + #13 +
      '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        + #13 +
      '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          + #13 +
      '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          + #13 +

      '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         + #13 +

      '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             + #13 +
      '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            + #13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + #13 +

      '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             + #13 +
      '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          + #13 +
      '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          + #13 +

      '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       + #13 +
      '  -1'                                                                           +  ' AS EVENTOITEM, '         + #13 +
      '  -1'                                                                           +  ' AS ORIGEMITEM, '         + #13 +
      '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             + #13 +
      '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             + #13 +
      '  -1'                                                                           +  ' AS SEQCALCULO, '         + #13 +

      '  ' + IntToStr(rSaldoDevAnt.iParcelaAnt)                                        +  ' AS PARCATUAL, '          + #13 +
      ' 0' + IntToStr(rSaldoDevAnt.iParcRestaAnt)                                      +  ' AS NUMPARCELAS, '        + #13 +

      '  -1'                                                                           +  ' AS CENTRALIZA, '         + #13 +
      '  -1'                                                                           +  ' AS DESTACADO, '          + #13 +

      '  0'                                                                            +  ' AS FLGENVIO, '           + #13 +
      '  0'                                                                            +  ' AS FLGBAIXADO, '         + #13 +
      '  0'                                                                            +  ' AS FLGESTORNADO, '       + #13 +
      '  0'                                                                            +  ' AS FLGABONADO, '         + #13 +
      '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        + #13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                      +  ' AS DATAEVENTO, '         + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAPREVISTA, '       + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAEFETIVA, '        + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAATUALIZA, '       + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAVENCTO, '         + #13 +

      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COMPETENCIA, '        + #13 +
      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COBRANCA, '           + #13 +

      '  0'                                                                            +  ' AS FLGSUSPENSAO, '       +

      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLRPREVISTO, '        + #13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLREFETIVO, '         + #13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS SALDODEV, '           + #13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS '             + #13 +
      'FROM '                                                                                                        + #13 +
      '  DUAL ';

      // armazeno SQL montado no vetor
      vSQL[i] := sSQL;

      // incrementa a variável de índice do vetor
      inc(i);




      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens PENDENTES (de divergência)
      // -------------------------------------------------------------------------------------------

      with qryItens do
      begin
         LimpaParametros(qryItens);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
         ParamByName('PIDHISTMOVEMPTMO').AsFloat   := qryHistMovIDHISTMOVEMPTMO.AsFloat;

         // André Pontes - pendência 20261 - 07/10/2005

         Open;
         First;
         bCabecalho := True;
      end;


      while not(qryItens.EOF) do
      begin
         sCabecalho := '';
         if bCabecalho then
         begin
            // sCabecalho := '/* -------------- Itens Pendentes ------------------------------------------------ */ ' + #13;
            bCabecalho := False;
         end;

         SetLength(vSQL, i + 1); // array dinâmico

         sSQL := sCabecalho +
         'SELECT '                                                                                                   + #13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
         '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))         +  ' AS DATAFIMSUSP, '        + #13 +

         '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
         '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
         '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

         '  ' + IntToStr(qryItensIDITEMEMPTMO.AsInteger)                               +  ' AS IDITEMEMPTMO, '       + #13 +
         '  ' + IntToStr(qryItensHMETIPOMOV.AsInteger)                                 +  ' AS EVENTOITEM, '         + #13 +

         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         + #13 +
         '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
         '  0'                                                                         +  ' AS SEQCALCULO, '         + #13 +

         '  ' + IntToStr(qryItensHMEPARCELA.AsInteger)                                 +  ' AS PARCATUAL, '          + #13 +
         ' 0' + IntToStr(qryItensHMENUMPARCELAS.AsInteger)                             +  ' AS NUMPARCELAS, '        + #13 +

         '  ' + IntToStr(qryItensHMECENTRALIZA.AsInteger)                              +  ' AS CENTRALIZA, '         + #13 +
         '  ' + IntToStr(qryItensHMEDESTACADO.AsInteger)                               +  ' AS DESTACADO, '          + #13 +

         '  ' + IntToStr(qryItensFLGENVIO.AsInteger)                                   +  ' AS FLGENVIO, '           + #13 +
         '  0'                                                                         +  ' AS FLGBAIXADO, '         + #13 +

         '  ' + IntToStr(qryItensFLGESTORNADO.AsInteger)                               +  ' AS FLGESTORNADO, '       + #13 +
         '  ' + IntToStr(qryItensFLGABONADO.AsInteger)                                 +  ' AS FLGABONADO, '         + #13 +
         '  ' + QuotedStr(qryItensHMEFORMACOBRANCA.AsString)                           +  ' AS FLGFORMACOB, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                   +  ' AS DATAEVENTO, '         + #13;

         // ----------------------------------------------------------------------------------------

         //if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then                                //edilaine WO4616
         if ((edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0)) and (not bMultiplasParcelas) then   //edilaine WO4616
         begin
            sSQL := sSQL +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataBase.Date))              +  ' AS DATAPREVISTA, '    + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryItensHMEDATAPREVISTA.AsDateTime))     +  ' AS DATAPREVISTA, '    + #13;
         end;

         // ----------------------------------------------------------------------------------------

         sSQL := sSQL +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryItensHMEDATAEFETIVA.AsDateTime))      +  ' AS DATAEFETIVA, '     + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryItensHMEDATAATUALIZA.AsDateTime))     +  ' AS DATAATUALIZA, '    + #13;

         // ----------------------------------------------------------------------------------------

         //if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then                                //edilaine WO4616
         if ((edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0)) and (not bMultiplasParcelas) then   //edilaine WO4616
         begin
            sSQL := sSQL +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataBase.Date))              +  ' AS DATAVENCTO, '      + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryItensHMEDATAVENCTO.AsDateTime))       +  ' AS DATAVENCTO, '      + #13;
         end;

         // ----------------------------------------------------------------------------------------

         sSQL := sSQL +
         '  ' + QuotedStr(FormatFloat('0000', qryItensHMEANOCOMPETENCIA.AsFloat)       +
                FormatFloat('00', qryItensHMEMESCOMPETENCIA.AsFloat))                  +  ' AS COMPETENCIA, '        + #13 +
         '  ' + QuotedStr(FormatFloat('0000', qryItensHMEANOCOBRANCA.AsFloat)          +
                FormatFloat('00', qryItensHMEMESCOBRANCA.AsFloat))                     +  ' AS COBRANCA, '           + #13 +

         ' 0' + qryItensFLGSUSPENSAO.AsString                                          +  ' AS FLGSUSPENSAO, '       + #13;

         // ----------------------------------------------------------------------------------------

         //TAES - SIG99585
         {if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(edtVlrBase.Value)                                         +  ' AS VLRPREVISTO, '        + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(qryItensHMEVLRPREVISTO.AsFloat)                           +  ' AS VLRPREVISTO, '        + #13;
         end;}
         //TAES - SIG99585

         sSQL := sSQL +
         '  ' + NumeroIngles(qryItensHMEVLRPREVISTO.AsFloat)                           +  ' AS VLRPREVISTO, '        + #13; //TAES - SIG99585

         // ----------------------------------------------------------------------------------------

         sSQL := sSQL +
         '  0.00'                                                                      +  ' AS VLREFETIVO, '         + #13 +
         '  ' + NumeroIngles(qryItensHMESALDODEV.AsFloat)                              +  ' AS SALDODEV, '           + #13;

         if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(edtTxJuros.Value)                                         +  ' AS TXJUROS '             + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(qryItensHMETXJUROS.AsFloat)                               +  ' AS TXJUROS '             + #13;
         end;

         sSQL := sSQL +
         'FROM '                                                                                                         + #13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then
         begin
            edtVlrBase2.Value := edtVlrBase.Value;
            edtDataBase2.Date := edtDataBase.Date;
            edtTxJuros2.Value := edtTxJuros.Value;
         end
         else
         begin
            edtVlrBase2.Value := qryItensHMEVLRPREVISTO.AsFloat;
            edtDataBase2.Date := qryItensHMEDATAVENCTO.AsDateTime;
            edtTxJuros2.Value := qryHistMovHMETXJUROS.AsCurrency;
         end;


         // Existe uma ordem de sequência de cálculo e para cada item o resultado do item
         //   anteriormente calculado tem que ser passado no SQL que será submetido para a Regra.
         //   É usado este laço para juntar TODOS os SQLs, montando o SQL completo que será passado
         //   para Regra de cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then
            begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + #13 +#13 + ' UNION '  + #13 + #13 + vSQL[j];
            end;
         end;

         // incrementa a variável de índice do vetor
         inc(i);

         // Próximo item Aberto
         qryItens.Next;

      end;  // while not(qryItens.EOF


      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens de DE DIVERGÊNCIA
      // -------------------------------------------------------------------------------------------

      qryBuscaItens.First;
      bCabecalho := True;
      while not(qryBuscaItens.EOF) do
      begin
         if bMostraProgresso then
         begin
            frmProgresso.AndaFormProgresso(iContador);
            if frmProgresso.Cancelou then Exit;
         end;

         SetLength(vSQL, i + 1); // array dinâmico

         sSQL :=
         'SELECT '                                                                                                         + #13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + #13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + #13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + #13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + #13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + #13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + #13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))               +  ' AS DATAFIMSUSP, '        + #13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + #13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + #13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + #13 +

         '  ' + IntToStr(qryBuscaItensIDITEMEMPTMO.AsInteger)                                +  ' AS IDITEMEMPTMO, '       + #13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + #13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + #13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + #13 +
         '  ' + IntToStr(qryBuscaItensITCSEQCALCULO.AsInteger)                               +  ' AS SEQCALCULO, '         + #13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + #13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + #13 +

         '  ' + IntToStr(qryBuscaItensFLGCENTRALIZA.AsInteger)                               +  ' AS CENTRALIZA, '         + #13 +
         '  ' + IntToStr(qryBuscaItensFLGDESTACADO.AsInteger)                                +  ' AS DESTACADO, '          + #13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + #13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + #13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + #13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + #13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + #13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia)) +  ' AS COMPETENCIA, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + #13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         '  0'                                                                               +  ' AS VLRPREVISTO, '        + #13 +
         '  0'                                                                               +  ' AS VLREFETIVO, '         + #13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + #13;

         if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(edtTxJuros.Value)                                               +  ' AS TXJUROS '             + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                       +  ' AS TXJUROS '             + #13;
         end;

         sSQL := sSQL +
         'FROM '                                                                                                           + #13 +
         '  DUAL ';

         vSQL[i] := sSQL;

         // Como no caso dos itens de concessão, existe uma ordem de sequência de
         //   cálculo e para cada item o resultado do item anteriormente calculado
         //   tem que ser passado no SQL que será submetido para a Regra.  É usado
         //   este laço para juntar TODOS os SQLs, montando o SQL completo que será
         //   passado para Regra para cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
            end;
         end;

         sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO ';

         // ----------------------------------------------------------------------------------------

         if not(UtilizaRegraValor(qryBuscaItensIDREGRACALC.AsInteger, sSQLExec,
                                  'e ' + qryBuscaItensIteDescricao.AsString,
                                  sValor,(* Resultado da Regra passado como Referência *)
                                  bMostraMsg)) then
         begin
            (* Regra Executada com Erro *)
            Result := False;
            Exit;
         end;

         // ----------------------------------------------------------------------------------------

         try
            // Não gravar item com valor ZERO
            if (sValor = 'NULO') then
            begin
               // Próximo item
               qryBuscaItens.Next;

               // incrementa o Contador
               inc(iContador);

               // incrementa a variável de índice do vetor do SQL
               inc(i);

               if bMostraProgresso then frmProgresso.AndaFormProgresso(iContador);

               Continue;
            end;

         except
            MsgDlg('Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         // ----------------------------------------------------------------------------------------
         //
         //     SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO
         //
         //  Depois de executada a Regra a variável sValor já tem o VALOR do
         //  item calculado, logo é atualizado este valor na linha de SQL do
         //  vetor vSQL que acabou de ser executada pela regra.
         //
         // ----------------------------------------------------------------------------------------

         sCabecalho := '';
         if bCabecalho then
         begin
            sCabecalho := '/* -------------- Itens de Divergência ------------------------------------------- */ ' + #13;
            bCabecalho := False;
         end;

         sSQL := sCabecalho +
         'SELECT '                                                                                                         + #13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + #13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + #13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + #13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + #13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + #13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + #13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + #13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + #13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + #13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + #13 +

         '  ' + IntToStr(qryBuscaItensIDITEMEMPTMO.AsInteger)                  +  ' AS IDITEMEMPTMO, '       + #13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + #13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + #13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + #13 +
         '  ' + IntToStr(qryBuscaItensITCSEQCALCULO.AsInteger)                 +  ' AS SEQCALCULO, '         + #13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + #13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + #13 +

         '  ' + IntToStr(qryBuscaItensFLGCENTRALIZA.AsInteger)                 +  ' AS CENTRALIZA, '         + #13 +
         '  ' + IntToStr(qryBuscaItensFLGDESTACADO.AsInteger)                  +  ' AS DESTACADO, '          + #13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + #13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + #13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + #13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + #13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + #13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia))    +  ' AS COMPETENCIA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + #13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         // aqui ocorre a substituição do valor pelo valor calculado
         '  ' + sValor                                                                       +  ' AS VLRPREVISTO, '        + #13 +

         '  0'                                                                               +  ' AS VLREFETIVO, '         + #13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + #13;

         if (edtVlrBase.Value > 0) or (length(trim(edtDataBase.Text)) > 0) then
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                       +  ' AS TXJUROS '             + #13;
         end
         else
         begin
            sSQL := sSQL +
         '  ' + NumeroIngles(edtTxJuros.Value)                                               +  ' AS TXJUROS '             + #13;
         end;

         sSQL := sSQL +
         'FROM '                                                                                                           + #13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         // ----------------------------------------------------------------------------------------
         //    GRAVAÇÃO no Vetor que será o Result da função
         // ----------------------------------------------------------------------------------------

         SetLength(vLista, k + 1);

         vLista[k].CodigoItem       := qryBuscaItensIDItemEmptmo.AsInteger;
         vLista[k].Nome             := qryBuscaItensIteDescricao.AsString;
         vLista[k].iEvento          := iEvento;
         vLista[k].Origem           := iOrigem;

         vLista[k].SeqCobranca      := 1;
         vLista[k].Prioridade       := qryBuscaItensITCPRIORIDADE.AsInteger;

         vLista[k].FlgCentraliza    := qryBuscaItensFLGCENTRALIZA.AsInteger;
         vLista[k].FlgDestacado     := qryBuscaItensFLGDESTACADO.AsInteger;
         vLista[k].IdItemCentraliza := qryBuscaItensIdItemCentraliza.AsInteger;

         vLista[k].AnoCompetencia   := iAnoCompetencia;
         vLista[k].MesCompetencia   := iMesCompetencia;
         vLista[k].DataPrevista     := dDataVenc;

         vLista[k].Valor            := StrToFloat(ConverteVirg(sValor));

         vLista[k].Parcela          := iParcela;
         vLista[k].ParcelaAlt       := iParcelaAlt;
         vLista[k].ParcResta        := iParcResta;

         // Saldo Devedor
         fNovoSaldoDev              := rSaldoDevAnt.fSaldoDevAnt;

         // calcula o novo saldo devedor
         case qryBuscaItensITCTRATASALDODEV.AsInteger of
            0: begin (* Não Tratar *) end;
            1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor;  // Abater
            2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor;  // Incorporar
         end;

         vLista[k].SaldoDevedor     := fNovoSaldoDev;
         vLista[k].TxJuros          := rSaldoDevAnt.fTxJurosAnt;

         vLista[k].FormaCobranca    := sFormaCobranca;

         vLista[k].FlgBaixado       := 0;
         vLista[k].FlgDivergPend    := -1;

         vLista[k].RecPag           := qryBuscaItensITCRECPAG.AsString;

         vLista[k].Regra            := qryBuscaItensIDREGRACALC.AsInteger;

         vLista[k].FlgGravaZERO     := (qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

         vLista[k].Rubrica          := qryBuscaItensIDPROVENTON.AsInteger;


         qryBuscaItens.Next;
         inc(iContador);

         inc(i);  // incrementa a variável de índice do vetor do SQL
         inc(k);  // incrementa a variável de índice do vetor da Lista

      end;  // while qryBuscaItens

      Result := True;

   finally
      LimpaParametros(qryItens);
      LimpaParametros(qryBuscaItens);

      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;



procedure TfrmExecLancaParcAtu.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
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



procedure TfrmExecLancaParcAtu.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancaParcAtu.rdgTratamentoClick(Sender: TObject);
begin
   inherited;

   rdgLancamento.ItemIndex := rdgTratamento.ItemIndex;

   chkAbono.Enabled        := (rdgLancamento.ItemIndex = 0);
   edtDataAbono.Enabled    := (rdgLancamento.ItemIndex = 0);
   DBcboItem.Enabled       := (rdgLancamento.ItemIndex = 0);

   // Marchetti - Pendencia 21438
   if not(DBcboItem.Enabled) then
   begin
      chkTipoLancamento.Checked := True;
   end;
   HabilitaCombos;
   // Fim Marchetti - Pendencia 21438

   if rdgLancamento.ItemIndex > 0 then
   begin
      chkAbono.Checked := False;
      edtDataAbono.Clear;
      DBcboItem.LookupValue := '';
      DBcboItem.Clear;
   end;
end;



function TfrmExecLancaParcAtu.AbonaPrestacao: Boolean;
var abona : Boolean;
begin
   SelecionaParcelas;
   qryAbonaItem.SQL.Text:=( 'UPDATE                                               '+
                            '   HISTMOVEMPTMO HME                                 '+
                            ' SET                                                 '+
                            '   HME.FLGABONADO              = 1,                  '+
                            '   HME.HMEDATAQUITABONO        =:PHMEDATAQUITABONO,  '+
                            '   HME.FLGTIPODIVERG           = NULL,               '+
                            '   HME.FLGENVIO                = NULL,               '+
                            '   HME.HMEOBSERVACAO           = HMEOBSERVACAO || '' Abono (lancamento de prestacoes atualizadas) '' WHERE '+
                            '    Idcontratoemptmo           = :pIdcontratoemptmo  '+
                            ' AND hme.hmetipomov            = 1                   '+
                            ' and hme.hmeparcela            = :phmeparcela        '+
                            ' AND HME.FLGBAIXADO            = 0                   '+
                            ' AND HME.HMEDATAEFETIVA        IS NULL               '+
                            ' AND HME.HMEVLREFETIVO         IS NULL               '+
                            ' AND NVL(HME.FLGESTORNADO, 0)  = 0                   '+
                            ' AND NVL(HME.FLGABONADO, 0)    = 0                   '+
                            ' AND NVL(HME.FLGQUITADO, 0)    = 0                   '+
                            ' AND NVL(HME.FLGSUSPENSAO, 0)  = 0                   ');
   Abona := False;
   while (not qryHistMov.Eof)do begin
      if (qryHistMovFLGESCOLHA.AsString = '1') then begin
         Abona := AbonaItem(qryHistMovHMEPARCELA.AsString, edtDataVencto.Date);
         //Abona := True;
      end;
      qryHistMov.Next;
   end;
   Result :=  Abona;
end;



function TfrmExecLancaParcAtu.AbonaEncargos: Boolean;
var
   SqlText,SQLEncargo : String;

begin
   SqlText    := '';
   SQLEncargo := '';
   Result     := False;

   try
      SelecionaEncargosAbono;

      qryEncargosAbono.First;

      qryAbonaItem.SQL.Text :=('UPDATE                                   '+
                    '   HISTMOVEMPTMO HME                                '+
                    ' SET                                                '+
                    '   HME.FLGABONADO             = 1,                  '+
                    '   HME.HMEDATAQUITABONO       =:PHMEDATAQUITABONO,  '+
                    '   HME.FLGTIPODIVERG          = NULL,               '+
                    '   HME.FLGENVIO               = NULL,               '+
                    '   HME.HMEOBSERVACAO          = HMEOBSERVACAO || '' ABONO (LANCAMENTO DE PRESTACOES ATUALIZADAS) '' WHERE '+
                    ' IDCONTRATOEMPTMO          = :PIDCONTRATOEMPTMO     '+
                    ' AND HME.HMEDESTACADO          = 1                  '+
                    ' AND HME.HMETIPOMOV            = 4                  '+
                    ' AND HME.HMEPARCELA            IN (:PHMEPARCELA)    '+
                    ' AND HME.FLGBAIXADO            = 0                  '+
                    ' AND HME.HMEDATAEFETIVA        IS NULL              '+
                    ' AND HME.HMEVLREFETIVO         IS NULL              '+
                    ' AND NVL(HME.FLGESTORNADO, 0)  = 0                  '+
                    ' AND NVL(HME.FLGABONADO, 0)    = 0                  '+
                    ' AND NVL(HME.FLGQUITADO, 0)    = 0                  '+
                    ' AND NVL(HME.FLGSUSPENSAO, 0)  = 0                  ');



      //while not(qryEncargosAbono.EOF) do
      //begin

         //if not(AbonaItem(qryEncargosAbonoHMEPARCELA.Value, edtDataVencto.Date)) then Exit;
         if not(AbonaItem(qryEncargosAbonoHMEPARCELA.AsString, edtDataVencto.Date)) then Exit;

      //   qryEncargosAbono.Next;
      //end;

      Result := True;

   except
      Result := False;
   end;
end;



procedure TfrmExecLancaParcAtu.SelecionaEncargosAbono;
begin
  SelecionaParcelasEncargo;
  with qryEncargosAbono do
  begin
      //qryEncargosAbono.clear;
      sql.Text:= Stringreplace(_Ssql,':PIDCONTRATOEMPTMO', qryDadosContratoIDCONTRATOEMPTMO.AsString,[rfreplaceall]);
      sql.Text:= Stringreplace(sql.Text,':PHMEPARCELA', ParcelaEncargo,[rfreplaceall]);
{     LimpaParametros(qryEncargosAbono);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      sql.Strings[ 0 ] := '   AND PHMEPARCELA in (' + parcela+') ';
 }    sql.Text;
      //ParamByName('PHMEPARCELA').AsString     := (' HME.HMEPARCELA    in ('+ parcela+')');
  Open;
  end;
  qryHistMov.First;
end;
function TfrmExecLancaParcAtu.AbonaItem(const IDHistMovEmptmo  : string;
                                        const dDataAbono       : TDateTime
                                       ): Boolean;
var
   rLogTotalPrev : TLogTotalprev;
   i :Integer;
begin
   try
      for i := 0 to Parcela.Count-1 do begin
        with qryAbonaItem do begin
           LimpaParametros(qryAbonaItem);
           ParamByName('pIdcontratoemptmo').Value       := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
           ParamByName('phmeparcela').AsString          := Parcela[i];//IDHistMovEmptmo;
           ParamByName('PHMEDATAQUITABONO').AsDateTime  := dDataAbono;
           ExecSQL;
        end;
      end;

      LimpaRegistroLog(rLogTotalPrev);

      while not(qryHistMov.EOF)do
      begin
        if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          rLogTotalPrev.IDModulo   := Sistema.IDModulo;
          rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
          rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
          rLogTotalPrev.Origem     := 21;
          rLogTotalPrev.Operacao   := 'Abono - Lancamento de Prestacoes Atualizadas: ' + FormatDateTime('dd/mm/yyyy', dDataAbono);
          rLogTotalPrev.Data       := SysDate;
          rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
          rLogTotalPrev.Versao     := Sistema.Versao;

          GravaLogTotalPrev(rLogTotalPrev);
        end;
         qryHistMov.Next;
      end;
      Result := True;

   except
      Raise;
      Result := False;
   end;
end;



function TfrmExecLancaParcAtu.LancaAjusteSaldoDevedor: Boolean;
var
   rSaldo      : TSaldoDevAnt;
   rItem       : TItemRecDep;
   rContrato   : TDadosContrato;
begin
   Result := False;

   try
      LimpaRegistro(rItem);
      LimpaRegistroContrato(rContrato);

      rContrato.IDContratoEmptmo := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      // -------------------------------------------------------------------------------------------

      rSaldo := CalcEmptmo.SaldoDevAnt(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                       edtDataVencto.Date,
                                       -1,
                                       -1,
                                       True
                                      );

      rItem.ParcelaAlt        := rSaldo.iParcelaAltAnt;
      rItem.Parcela           := rSaldo.iParcelaAnt;
      rItem.ParcResta         := rSaldo.iParcRestaAnt;
      rItem.TxJuros           := rSaldo.fTxJurosAnt;

      // -------------------------------------------------------------------------------------------

      // preenche os campos necessários
      rItem.CodigoItem        := StrToInt(DBcboItem.LookupValue);

      rItem.iEvento           := 8;

      rItem.FlgEnvio          := -1;
      rItem.FlgBaixado        := -1;

      rItem.Origem            := 21;
      rItem.SeqCobranca       := 1;

      case rdgLancamento.ItemIndex of
         0: rItem.RecPag      := 'P';
      end;

      rItem.AnoCompetencia    := DiasUteis.ExtraiAno(edtDataVencto.Date);
      rItem.MesCompetencia    := DiasUteis.ExtraiMes(edtDataVencto.Date);
      rItem.AnoCobranca       := DiasUteis.ExtraiAno(edtDataVencto.Date);
      rItem.MesCobranca       := DiasUteis.ExtraiMes(edtDataVencto.Date);

      rItem.FlgCentraliza     := qryLookItemFLGCENTRALIZA.AsInteger;
      rItem.FlgDestacado      := qryLookItemFLGDESTACADO.AsInteger;

      rItem.DataPrevista      := edtDataVencto.Date;
      rItem.DataVencto        := edtDataVencto.Date;
      rItem.DataUltAtualiza   := edtDataVencto.Date;

      rItem.Valor             := edtSaldoAtual.Value;
      rItem.SaldoDevedor      := 0;

      // -------------------------------------------------------------------------------------------

      // faz o insert
      CalcEmptmo.InsertMovEmptmo(rItem, rContrato);

      // -------------------------------------------------------------------------------------------

      Result := True;

      // -------------------------------------------------------------------------------------------
   except
      Raise;
   end;
end;



procedure TfrmExecLancaParcAtu.bbtnConfirmarClick(Sender: TObject);
var
   bErro : Boolean;
begin
   if rdgTratamento.ItemIndex = 0 then
   begin
     //Inicio - André Oliveira SOL 182696  KINTANA 1706883.
     if  qryHistMov.Eof then
         inherited;
      //if(qryHistMov.FieldByName('FLGESCOLHA').AsString <> '0')then
      if (iCount <> 0) then
      begin
      //fim - André Oliveira SOL 182696  KINTANA 1706883.

         if MsgDlg('O(s) valor(es) será(ão) lançado(s). Deseja realmente prosseguir?',
                    'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
             Repaint;

             if VerificaPreenchimentoLancamento then
             begin
                // Inicia uma transação - só se não ouver transação iniciada
                if dtmBaseDados.dbBaseDados.InTransaction then
                begin
                   MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
                   Repaint;
                   Exit;
                end;

                StartTransacao;

                bErro := False;

                try
                   try
                      // ----------------------------------------------------------------------------------
                      if rdgTratamento.ItemIndex = 0 then
                      begin
                         bErro := not(AbonaPrestacao);

                         if bErro then
                         begin
                            MsgDlg('Erro ao "abonar" a prestação!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                         end
                         else
                         begin
                            if (chkAbono.Checked) then bErro := not(AbonaEncargos);

                            if bErro then
                            begin
                               MsgDlg('Erro ao abonar encargos da prestacão!', 'Empréstimo', mtError, [mbOk], 0);
                               Repaint;
                               Exit;
                            end;
                         end;
                      end;

                      // ----------------------------------------------------------------------------------

                      if not(bErro) then bErro := not(AtualizaSaldoAteLancamento);

                      if bErro then
                      begin
                         MsgDlg('Erro ao atualizar o saldo até a data do lançamento!', 'Empréstimo', mtError, [mbOk], 0);
                         Repaint;
                         Exit;
                      end;

                      // ----------------------------------------------------------------------------------

                      // Marchetti - Pendencia 24138
                      if chkTipoLancamento.Checked then
                      begin
                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(DBcboItem.LookupValue),edtSaldoAtual.Value,0));

                         if bErro then
                         begin
                            MsgDlg('Erro ao efetuar o lançamento!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                          end;

                      end
                      else
                      begin
                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(DBcboItem.LookupValue),edtVlrBase2.Value,0));

                      if bErro then
                      begin
                         MsgDlg('Erro ao efetuar o lançamento!', 'Empréstimo', mtError, [mbOk], 0);
                         Repaint;
                         Exit;
                      end;

                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(cboItemJuros.LookupValue),edtVlrJuros.Value,1));

                         if bErro then
                         begin
                            MsgDlg('Erro ao efetuar o lançamento de Juros!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                         end;

                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(cboItemCM.LookupValue),edtVlrCM.Value,2));

                         if bErro then
                         begin
                            MsgDlg('Erro ao efetuar o lançamento de Correção Monetária!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                         end;

                         // Marchetti - pendencia 24953

                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(cboItemMulta.LookupValue),edtVlrMulta.Value,3));

                         if bErro then
                         begin
                            MsgDlg('Erro ao efetuar o lançamento de Multa!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                         end;

                         if not(bErro) then bErro := not(LancaAjusteSaldoDevedorPorItem(StrToInt(cboItemMora.LookupValue),edtVlrMora.Value,4));

                         if bErro then
                         begin
                            MsgDlg('Erro ao efetuar o lançamento de Juros de Mora!', 'Empréstimo', mtError, [mbOk], 0);
                            Repaint;
                            Exit;
                         end;

                         // Fim Marchetti - pendencia 24953
                      end;
                      // Fim Marchetti - Pendencia 24138

                      // ----------------------------------------------------------------------------------

                      if not(bErro) then bErro := not(AtualizaSaldoAposLancamento);

                      if bErro then
                      begin
                         MsgDlg('Erro ao atualizar o saldo após o lançamento!', 'Empréstimo', mtError, [mbOk], 0);
                         Repaint;
                         Exit;
                      end;

                      // ----------------------------------------------------------------------------------

                      if not(bErro) then
                      begin
                         CommitTransacao;
                         MsgDlg('Sucesso', 'Empréstimo', mtInformation, [mbOk], 0);
                         Repaint;
                      end
                      else
                      begin
                         RollbackTransacao;
                         MsgDlg('Erro', 'Empréstimo', mtError, [mbOk], 0);
                         Repaint;
                      end;

                      // ----------------------------------------------------------------------------------
                   except
                     Raise;
                      RollbackTransacao;
                   end;

                finally
                   if bErro then RollbackTransacao;
                end;
            end;
         end;
      end;
      //Inicio - André Oliveira SOL 182696  KINTANA 1706883.

      if not   qryHistMov.Eof then
      begin
        // LimpaCampos;
         qryHistMov.Next;
      end
      else
          inherited;
      //Fim - André Oliveira SOL 182696  KINTANA 1706883.


      Repaint;
   end
   else
   begin
      inherited;
   end;
end;



function TfrmExecLancaParcAtu.AtualizaSaldoAteLancamento: Boolean;
var
   dDataAtuDia : TDateTime;
begin
   Result := False;

   if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
   begin
      dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                       edtDataVencto.Date
                                                      );

      if dDataAtuDia < edtDataVencto.Date then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,  // Contrato
                                            Sistema.IDModulo,
                                            -1,                   // Tipo Contr
                                            -1,                   // Tipo Emptmo
                                            -1,                   // Patro
                                            -1,                   // Plano
                                            1,                    // Estorno
                                            1,                    // Prov Perda
                                            1,                    // Atu Saldo
                                            -1,                   // In Arquivo
                                            -1,                   // Not In Arquivo
                                            dDataAtuDia + 1,      // Data Ini
                                            edtDataVencto.Date,   // Data Fim
                                            dDataAtuDia           // Data Considera
                                           );
      end;  // if dDataAtuDia < qryHMEDATAPREVISTA.AsDateTime
   end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

   Result := True;
end;



function TfrmExecLancaParcAtu.AtualizaSaldoAposLancamento: Boolean;
var
   dDataAtuDia : TDateTime;
begin
   Result := False;

   if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
   begin
      dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(qryDadosContratoIDCONTRATOEMPTMO.AsFloat, -1);

      dtmAtualizacaoDiaria.ExecutaAtuDia(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,  // Contrato
                                         Sistema.IDModulo,
                                         -1,                      // Tipo Contr
                                         -1,                      // Tipo Emptmo
                                         -1,                      // Patro
                                         -1,                      // Plano
                                         1,                       // Estorno
                                         1,                       // Prov Perda
                                         1,                       // Atu Saldo
                                         -1,                      // In Arquivo
                                         -1,                      // Not In Arquivo
                                         edtDataVencto.Date,      // Data Ini
                                         dDataAtuDia,             // Data Fim
                                         edtDataVencto.Date - 1   // Data Considera
                                        );

      dtmAtualizacaoDiaria.ExecutaAjusteSaldo(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                              edtDataVencto.Date,
                                              -1 // O saldo deve ser buscado
                                             );
   end;

   Result := True;
end;



procedure TfrmExecLancaParcAtu.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;
end;



procedure TfrmExecLancaParcAtu.qryHistMovAfterScroll(DataSet: TDataSet);
begin
   inherited;
{   if not(qryHistMov.IsEmpty) then
   begin
     // if (qryHistMovFLGESCOLHA.AsString = '1') then
     // if (qryHistMov.FieldByName('FLGESCOLHA').AsString = '1') then
      edtVlrBase.Value  := qryHistMovHMEVLRPREVISTO.AsCurrency + edtVlrBase.Value;

      edtDataBase.Date  := qryHistMovHMEDATAPREVISTA.AsDateTime;
      edtTxJuros.Value  := qryHistMovHMETXJUROS.AsCurrency;
   end;         }
   //ValorBase;
end;



procedure TfrmExecLancaParcAtu.FormCreate(Sender: TObject);
begin
   inherited;
   Parcela := TStringList.Create;
   Contab  := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;

   DBgrdHistMov.ControlStyle := DBgrdHistMov.ControlStyle + [csClickEvents];
  TForm(DBgrdHistMov).OnClick := DBgrdHistMovOnClick;

  qryEncargosAbono.SQL.text := _sSQL;

end;



procedure TfrmExecLancaParcAtu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Contab.Free;
end;



procedure TfrmExecLancaParcAtu.HabilitaCombos;
begin
   if chkTipoLancamento.Checked then
   begin
      cboItemJuros.LookupValue := '';
      cboItemCM.LookupValue    := '';
      cboItemMulta.LookupValue := '';
      cboItemMora.LookupValue  := '';

      cboItemJuros.Clear;
      cboItemCM.Clear;
      cboItemMulta.Clear;
      cboItemMora.Clear;
   end;

   cboItemJuros.Enabled  := not(chkTipoLancamento.Checked);
   cboItemCM.Enabled     := not(chkTipoLancamento.Checked);
   cboItemMulta.Enabled  := not(chkTipoLancamento.Checked);
   cboItemMora.Enabled   := not(chkTipoLancamento.Checked);
end;



procedure TfrmExecLancaParcAtu.chkTipoLancamentoClick(Sender: TObject);
begin
   inherited;
   HabilitaCombos;
end;



function TfrmExecLancaParcAtu.LancaAjusteSaldoDevedorPorItem(const iItem: Integer; const fValor: Currency; const iTipoLanc : Integer): Boolean;
var
   rSaldo      : TSaldoDevAnt;
   rItem       : TItemRecDep;
   rContrato   : TDadosContrato;
begin
   Result := False;

   try
      LimpaRegistro(rItem);
      LimpaRegistroContrato(rContrato);

      rContrato.IDContratoEmptmo := qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      // -------------------------------------------------------------------------------------------

      rSaldo := CalcEmptmo.SaldoDevAnt(qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                       edtDataVencto.Date,
                                       -1,
                                       -1,
                                       True
                                      );

      rItem.ParcelaAlt        := rSaldo.iParcelaAltAnt;
      rItem.Parcela           := rSaldo.iParcelaAnt;
      rItem.ParcResta         := rSaldo.iParcRestaAnt;
      rItem.TxJuros           := rSaldo.fTxJurosAnt;

      // -------------------------------------------------------------------------------------------

      // preenche os campos necessários
      rItem.CodigoItem        := iItem;

      rItem.iEvento           := 8;

      rItem.FlgEnvio          := -1;

      rItem.FlgBaixado        := -1;

      rItem.Origem            := 21;
      rItem.SeqCobranca       := 1;

      case rdgLancamento.ItemIndex of
         0: rItem.RecPag      := 'P';
      end;

      rItem.AnoCompetencia    := DiasUteis.ExtraiAno(edtDataVencto.Date);
      rItem.MesCompetencia    := DiasUteis.ExtraiMes(edtDataVencto.Date);
      rItem.AnoCobranca       := DiasUteis.ExtraiAno(edtDataVencto.Date);
      rItem.MesCobranca       := DiasUteis.ExtraiMes(edtDataVencto.Date);

      case iTipoLanc of
         0 : begin  // Item de Incorporação/Abatimento de saldo
                rItem.FlgCentraliza     := qryLookItemFLGCENTRALIZA.AsInteger;
                rItem.FlgDestacado      := qryLookItemFLGDESTACADO.AsInteger;
             end;

         1 : begin // Item de juros
                rItem.FlgCentraliza     := qryLookItemJurosFLGCENTRALIZA.AsInteger;
                rItem.FlgDestacado      := qryLookItemJurosFLGDESTACADO.AsInteger;
             end;

         2 : begin // Item de correção monetária
                rItem.FlgCentraliza     := qryLookItemCMFLGCENTRALIZA.AsInteger;
                rItem.FlgDestacado      := qryLookItemCMFLGDESTACADO.AsInteger;
             end;


         3 : begin // Item de Multa
                rItem.FlgCentraliza     := qryLookItemMultaFLGCENTRALIZA.AsInteger;
                rItem.FlgDestacado      := qryLookItemMultaFLGDESTACADO.AsInteger;
             end;

         4 : begin // Item de Juros de Mora
                rItem.FlgCentraliza     := qryLookItemMoraFLGCENTRALIZA.AsInteger;
                rItem.FlgDestacado      := qryLookItemMoraFLGDESTACADO.AsInteger;
             end;
      end;

      rItem.DataPrevista      := edtDataVencto.Date;
      rItem.DataEfetiva       := edtDataVencto.Date; //SOL 35989 -  Ádler Souza
      rItem.DataVencto        := edtDataVencto.Date;
      rItem.DataUltAtualiza   := edtDataVencto.Date;
      rItem.DataReceb         := 0; //SOL 35989 -  Ádler Souza

      rItem.Valor             := fValor;
      rItem.ValorEfetivo      := rItem.Valor; //SOL 35989 -  Ádler Souza
      rItem.SaldoDevedor      := 0;

      // -------------------------------------------------------------------------------------------

      // faz o insert se o valor for maior que 0.
      if (rItem.Valor > 0) then
        CalcEmptmo.InsertMovEmptmo(rItem, rContrato);

      // -------------------------------------------------------------------------------------------

      Result := True;

      // -------------------------------------------------------------------------------------------
   except
      Raise;
   end;
end;

 //Inicio - André Oliveira SOL 182696  KINTANA 1706883.


procedure TfrmExecLancaParcAtu.ckbVlrJurosClick(Sender: TObject);
begin
  inherited;
   if (ckbVlrJuros.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrJuros.Value
   else
      edtSaldoAtual.Value :=  edtSaldoAtual.Value - edtVlrJuros.Value;
end;

procedure TfrmExecLancaParcAtu.ckbVlrMoraClick(Sender: TObject);
begin
  inherited;

   if (ckbVlrMora.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrMora.Value
   else
       edtSaldoAtual.Value :=  edtSaldoAtual.Value - edtVlrMora.Value;
end;

procedure TfrmExecLancaParcAtu.ckbVlrMultaClick(Sender: TObject);
begin
  inherited;

   if (ckbVlrMulta.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrMulta.Value
   else
       edtSaldoAtual.Value :=  edtSaldoAtual.Value - edtVlrMulta.Value;

end;

procedure TfrmExecLancaParcAtu.ckbVlrCMClick(Sender: TObject);
begin
  inherited;

   if (ckbVlrCM.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrCM.Value
   else
       edtSaldoAtual.Value :=  edtSaldoAtual.Value - edtVlrCM.Value;

end;

procedure TfrmExecLancaParcAtu.ckbVlrFGQCClick(Sender: TObject);
begin
   if (ckbVlrFGQC.Checked  )then
      edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrFGQC.Value
   else
       edtSaldoAtual.Value :=  edtSaldoAtual.Value + edtVlrFGQC.Value;
end;

procedure TfrmExecLancaParcAtu.LimpaCampos;
begin
     ckbVlrJuros.Checked := False;
     ckbVlrCM.Checked    := False;
     ckbVlrMora.Checked  := False;
     ckbVlrMulta.Checked := False;
     ckbVlrFGQC.Checked  := False;

     cboItemJuros.LookupValue := '';
     cboItemCM.LookupValue    := '';
     cboItemMulta.LookupValue := '';
     cboItemMora.LookupValue  := '';
     cboItemJuros.Clear;
     cboItemCM.Clear;
     cboItemMulta.Clear;
     cboItemMora.Clear;

end;
//Fim - André Oliveira SOL 182696  KINTANA 1706883.

procedure TfrmExecLancaParcAtu.ValorBase;
begin

   if not(qryHistMov.IsEmpty) then
   begin
     qryHistMov.First;
     edtVlrBase.Value :=  00.00;
     while not qryHistMov.Eof do
        begin
           // if (qryHistMov.FieldByName('FLGESCOLHA').AsString = '1') then
           //     edtVlrBase.Value  := qryHistMov.FieldByName('HMEVLRPREVISTO').AsInteger + edtVlrBase.Value;
               if (qryHistMovFLGESCOLHA.AsString = '1') then     begin
                   edtVlrBase.Value  := qryHistMovHMEVLRPREVISTO.AsCurrency + edtVlrBase.Value;
                   edtDataBase.Date  := qryHistMovHMEDATAPREVISTA.AsDateTime;
                   edtTxJuros.Value  := qryHistMovHMETXJUROS.AsCurrency;
                end;
            qryHistMov.Next;
        end;
   end;
end;

procedure TfrmExecLancaParcAtu.DBgrdHistMovOnClick(Sender: TObject);
begin


   // if cdsRecebe.RecordCount > 0 then
{    if (not qryHistMov.IsEmpty)and (qryHistMov.State in [dsedit]) then  begin
     if (qryHistMovFLGESCOLHA.AsString = '1') then begin
        edtVlrBase.Value  := qryHistMovHMEVLRPREVISTO.AsCurrency + edtVlrBase.Value;
        edtDataBase.Date  := qryHistMovHMEDATAPREVISTA.AsDateTime;
        edtTxJuros.Value  := qryHistMovHMETXJUROS.AsCurrency;
       end;
    end;  }
end;

procedure TfrmExecLancaParcAtu.DBgrdHistMovKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;

   // ValorBase;
end;

procedure TfrmExecLancaParcAtu.DBgrdHistMovMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //inherited;
  qryHistMovFLGESCOLHA.AsString;
//  ValorBase;
end;

procedure TfrmExecLancaParcAtu.DBgrdHistMovFieldChanged(Sender: TObject;
  Field: TField);
var i:integer;
begin
  //inherited;

  qryHistMovFLGESCOLHA.AsString; // ok
 // ValorBase;

  if (qryHistMovFLGESCOLHA.AsString = '1') then     begin
      edtVlrBase.Value  := qryHistMovHMEVLRPREVISTO.AsCurrency + edtVlrBase.Value;
      edtDataBase.Date  := qryHistMovHMEDATAPREVISTA.AsDateTime;
      edtTxJuros.Value  := qryHistMovHMETXJUROS.AsCurrency;
  end
  else
  begin
      edtVlrBase.Value  := edtVlrBase.Value - qryHistMovHMEVLRPREVISTO.AsCurrency;
  end;

end;

procedure TfrmExecLancaParcAtu.SelecionaParcelas;
var vparcela, teste : String;
begin
  teste := '1';
  ParcelaEncargo :='';
  qryHistMov.First;

  while not(qryHistMov.EOF) do begin
      if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          Parcela.Add(qryHistMovHMEPARCELA.AsString);
          teste:='0';
      End;
      qryHistMov.Next;
  end;



  {while not(qryHistMov.EOF) and (teste='1')do begin
      if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          vparcela:= qryHistMovHMEPARCELA.AsString;
          teste:='0';
      End;
      qryHistMov.Next;
  end;

  while not(qryHistMov.EOF)do begin
      if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          vparcela:= vparcela+','+ qryHistMovHMEPARCELA.AsString;
      End;
      qryHistMov.Next;
  end; }
  //Parcela := vparcela;
  qryHistMov.First;
end;

procedure TfrmExecLancaParcAtu.SelecionaParcelasEncargo;
var vparcela, teste : String;
begin
  teste := '1';
  ParcelaEncargo :='';
  qryHistMov.First;

  while not(qryHistMov.EOF) and (teste='1')do begin
      if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          vparcela:= qryHistMovHMEPARCELA.AsString;
          teste:='0';
      End;
      qryHistMov.Next;
  end;

  while not(qryHistMov.EOF)do begin
      if (qryHistMovFLGESCOLHA.AsString = '1')then begin
          vparcela:= vparcela+','+ qryHistMovHMEPARCELA.AsString;
      End;
      qryHistMov.Next;
  end;
  ParcelaEncargo := vparcela;
  qryHistMov.First;
end;

end.
