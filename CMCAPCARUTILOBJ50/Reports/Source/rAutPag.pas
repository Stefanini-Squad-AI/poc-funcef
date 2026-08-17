{*******************************************************************************

                        Sistema - Contas a Receber

********************************************************************************
-------------------------------- ALTERAÇÕES -------------------------------------
 N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007065)
 Dt Alterações.: 11/11/2025
 Responsável...: Paulo Nobre
 Descrição.....: Ajuste no sql da função em: CrmRptCMBeforePrint, incluindo
                 recurso para limitar o tamanho do resultado do select, devido
                 erro reportado pelo ORACLE no uso da função: "listagg".
---------------------------------------------------------------------------------
 N. SIG.............: 118992 e 118993
 Data da Alteração..: 17/09/2021
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo Cod. Dossiê
--------------------------------------------------------------------------------
Rotina........: (dfm CdsDemGestAutPag, Ppautpagdoc)
N. SIG........: 117602
Data..........: 19/08/2021
Responsável...: Edilaine
Descrição.....: aumentar campo relativo aos códigos do FDO Digital
--------------------------------------------------------------------------------
Rotina........: CrmRptCMBeforePrint
N. SIG........: 115077
Data..........: 19/07/2021
Responsável...: Edilaine
Descrição.....: Imprimir código do FDO Digital
--------------------------------------------------------------------------------
Rotina........: GravaBancoAg
N. SIG........: 100380
Data..........: 10/06/2020
Responsável...: Edilaine
Descrição.....: Erro verificação do usuario do inclusao, quando feito via ETL
--------------------------------------------------------------------------------
Rotina........: SqlAutPagDoc
N. SIG........: 46608/88515
Data..........: 03/07/2019
Responsável...: Everson Cunha
Descrição.....: Disponibilizar NOMEMODULO
--------------------------------------------------------------------------------
Data      : 12/03/2018
Autor     : Everson Luiz Pereira da Cunha
SIG       : SIG TIBERO
Descrição : Melhoria em adequação ao TIBERO.
            Inserir alias nas tabelas e campos.
            Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------
Rotina........: bbtnSelecionaClick 
N. SIG........: 37065
Data..........: 05/01/2017
Responsável...: Peterson Victor
Descrição.....: Deixar no Memo apenas o documento selecionado
--------------------------------------------------------------------------------
Rotina.......: CrmRptCMBeforePrint
N. do SIG....:  26501
Data.........: 20/09/2016
Responsável..: Darivaldo Alencar
Descrição....: A pedido pela Tesouraria, solicitamos que quando da impressão da
               autorização de pagamento AP - modelo 2, for feita utilizando o
               parâmetro utilizar mais de um documento por centro de responsa-
               bilidade, o número de páginas seja quebrado por número de AP.
--------------------------------------------------------------------------------
Rotina........: CrmRptCMBeforePrint
N. Sol........: 244390
N. Kintana....: 618021
Data..........: 26/12/2014
Responsável...: Marcio Sanches Spinosa SOL 244390 PPM 618021
Descrição.....: Ajuste para gerar a AP para grupos.
--------------------------------------------------------------------------------
Rotina........: CrmRptCMBeforePrint
N. Sol........: 187024
N. Kintana....: 1766935
Data..........: 15/08/2012
Responsável...: Otacilio Aquino
Descrição.....: Ao gerar PDF o campo "Observação" estava sendo cortado.
--------------------------------------------------------------------------------
Rotina............: CrmRptCMBeforePrint
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
-------------------------------------------------------------------------------}

//Marcus Oliveira P.26056 09/08/2007 Corrigido o valor do IR.
//início - André Tavares - pendência 16330 - 30/04/2004 - não deixar imprimir AP
//para aqueles documentos que possuem o flg FLGIMPRIMEAP = 'N'

Unit rAutPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBTables, uCMClientDataSet, uCmSqlParams, ppTypes,
  uCtrlRelatoriosCAPCAR, uCtrlDocumento, uCtrlParamIntegra, Mask , Math,
  TXRB, ppSubRpt, StdCtrls, ppModule, raCodMod, ppParameter;

Type
  TRptAutPag = Class(TFrmCmReport)
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
    Rptautpagdoc: TppReport;
    CdsDemGestAutPag: TClientDataSet;
    CdsDemGestAutPagNUMFATURA: TFloatField;
    CdsDemGestAutPagCODDOCUMENTO: TFloatField;
    CdsDemGestAutPagNUMAPGR: TFloatField;
    CdsDemGestAutPagREFERENCIA: TStringField;
    CdsDemGestAutPagNODOCUMENTO: TFloatField;
    CdsDemGestAutPagCOMPLDOCUMENTO: TStringField;
    CdsDemGestAutPagDATAVENCTO: TDateTimeField;
    CdsDemGestAutPagNUMDOCUMENTO: TStringField;
    CdsDemGestAutPagVALOR: TFloatField;
    CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField;
    CdsDemGestAutPagRAZAOSOCIAL: TStringField;
    CdsDemGestAutPagDESCRICAO: TStringField;
    CdsDemGestAutPagVALORRATEIO: TFloatField;
    CdsDemGestAutPagDESCTDR: TStringField;
    CdsDemGestAutPagNOMEAP: TStringField;
    CdsDemGestAutPagNOMECR: TStringField;
    CdsDemGestAutPagNOMECC: TStringField;
    CdsDemGestAutPagOBS: TMemoField;
    CdsDemGestAutPagNUMBANCO: TStringField;
    CdsDemGestAutPagNUMAGENCIA: TStringField;
    CdsDemGestAutPagCONTACORRENTE: TStringField;
    CdsDemGestAutPagFLGDOCBANCARIO: TStringField;
    CdsDemGestAutPagVLACRE: TFloatField;
    CdsDemGestAutPagVLDEC: TFloatField;
    CdsDemGestAutPagVLIMP: TFloatField;
    CdsDemGestAutPagVLLIQ: TFloatField;
    CdsDemGestAutPagTRGUSERINCLUSAO: TStringField;
    CdsDemGestAutPagNOMEUSUARIO: TStringField;
    CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField;
    CdsDemGestAutPagTOTVALORBRUTO: TFloatField;
    CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagTOTVALORAPAGAR: TFloatField;
    CdsDemGestAutPagSUMVALORBRUTO: TFloatField;
    CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagSUMVALORAPAGAR: TFloatField;
    CdsDemGestAutPagNUMIMOVEL: TStringField;
    CdsDemGestAutPagNOMEPATRO: TStringField;
    CdsDemGestAutPagDESCPLANO: TStringField;
    CdsDemGestAutPagDESCPROGRAMA: TStringField;
    CdsDemGestAutPagDATAEMISSAO: TDateTimeField;
    CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField;
    CdsDemGestAutPagIDFORCLI: TFloatField;
    CdsDemGestAutPagVALOLANCTOLIQ: TFloatField;
    CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField;
    SqlAutPagDoc: TCMSqlParams;
    CdsAutPagDoc: TCMClientDataSet;
    SqlDemGestAutPag: TCMSqlParams;
    SqlNomeUsuario: TCMSqlParams;
    CdsNomeUsuario: TCMClientDataSet;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    CdsAlteraParcOrigem: TCMClientDataSet;
    SqlAlteraParcOrigem: TCMSqlParams;
    CdsAutPagDocAlt: TCMClientDataSet;
    SqlAutPagDocAlt: TCMSqlParams;
    SqlDocumFilhosAP: TCMSqlParams;
    CdsDocumFilhosAP: TCMClientDataSet;
    PpDocumFilhoAP: TppBDEPipeline;
    DsDocumFilhoAP: TwwDataSource;
    SqlDocumFilhoAR: TCMSqlParams;
    CdsDocumFilhosAR: TCMClientDataSet;
    PpDocumFilhoAR: TppBDEPipeline;
    DsDocumFilhoAR: TwwDataSource;
    CdsDocumFilhosARCODDOCUMENTO: TFloatField;
    CdsDocumFilhosARCARDOCUMENTO: TFloatField;
    CdsDocumFilhosARCODTIPRECDES: TStringField;
    CdsDocumFilhosARRECPAG: TStringField;
    CdsDocumFilhosARIDPESSOA: TFloatField;
    CdsDocumFilhosARIDRESERVAORCAMEN: TFloatField;
    CdsDocumFilhosARCODCENTRORESPON: TStringField;
    CdsDocumFilhosARCODEXTERNOCR: TStringField;
    CdsDocumFilhosARUNIDNEGOC: TFloatField;
    CdsDocumFilhosARMOECODIGO: TFloatField;
    CdsDocumFilhosARVALOR: TFloatField;
    CdsDocumFilhosARVALOROUTRAMOEDA: TFloatField;
    CdsDocumFilhosARPLACONTACREDITO: TStringField;
    CdsDocumFilhosARIDUSUARIOINCLUSAO: TFloatField;
    CdsDocumFilhosARNOME: TStringField;
    CdsDocumFilhosARNOME_1: TStringField;
    CdsDocumFilhosARCODCENTROCUSTO: TStringField;
    CdsDocumFilhosARCODEXTERNOCC: TStringField;
    CdsDocumFilhosARIDRATEIODOCUM: TFloatField;
    CdsDocumFilhosARDESCRICAO: TStringField;
    CdsDocumFilhosARMOESIGLA: TStringField;
    CdsDocumFilhosARNOMECENTROCUSTO: TStringField;
    CdsDocumFilhosARPLANO: TFloatField;
    CdsDocumFilhosARIDPATRO: TFloatField;
    CdsDocumFilhosARIDPROGRAMA: TFloatField;
    CdsDocumFilhosARFLGTIPOPROGRAMA: TStringField;
    CdsDocumFilhosARNUMIMOVEL: TStringField;
    CdsDocumFilhosARNOMEPATRO: TStringField;
    CdsDocumFilhosARDESCPLANO: TStringField;
    CdsDocumFilhosARDESCPROGRAMA: TStringField;
    CdsDocumFilhosARHITCODHIST: TStringField;
    CdsDocumFilhosARIDPLANOPREV: TFloatField;
    CdsDocumFilhosARNUMRESERVA: TFloatField;
    CdsDocumFilhosARFLGOBRIGARESERVA: TStringField;
    CdsDocumFilhosARNUMRESERVAOLD: TFloatField;
    CdsDocumFilhosARVALORRESERVAOLD: TFloatField;
    CdsDocumFilhosARVLRRESORCAMEN: TFloatField;
    CdsDocumFilhosARIDSEGREGACRITER: TFloatField;
    CdsDocumFilhosARCODSUBCONTA: TFloatField;
    CdsDocumFilhosARCODSUBCONTAPASS: TFloatField;
    CdsDocumFilhosARIDPLANOVIRTUAL: TFloatField;
    CdsDocumFilhosARIDSEGREGACONTR: TFloatField;
    CdsDocumFilhosARFLGOBRQTDECOTAS: TStringField;
    CdsDocumFilhosARIDPATROORIGEM: TFloatField;
    CdsDocumFilhosARIDPLANOORIGEM: TFloatField;
    CdsDocumFilhosARNOMEPATROORIGEM: TStringField;
    CdsDocumFilhosARDESCPLANOORIGEM: TStringField;
    CdsDocumFilhosAPCODDOCUMENTO: TFloatField;
    CdsDocumFilhosAPCAPDOCUMENTO: TFloatField;
    CdsDocumFilhosAPCODTIPRECDES: TStringField;
    CdsDocumFilhosAPRECPAG: TStringField;
    CdsDocumFilhosAPIDPESSOA: TFloatField;
    CdsDocumFilhosAPIDRESERVAORCAMEN: TFloatField;
    CdsDocumFilhosAPCODCENTRORESPON: TStringField;
    CdsDocumFilhosAPCODEXTERNOCR: TStringField;
    CdsDocumFilhosAPUNIDNEGOC: TFloatField;
    CdsDocumFilhosAPMOECODIGO: TFloatField;
    CdsDocumFilhosAPVALOR: TFloatField;
    CdsDocumFilhosAPVALOROUTRAMOEDA: TFloatField;
    CdsDocumFilhosAPPLACONTACREDITO: TStringField;
    CdsDocumFilhosAPIDUSUARIOINCLUSAO: TFloatField;
    CdsDocumFilhosAPNOME: TStringField;
    CdsDocumFilhosAPNOME_1: TStringField;
    CdsDocumFilhosAPCODCENTROCUSTO: TStringField;
    CdsDocumFilhosAPCODEXTERNOCC: TStringField;
    CdsDocumFilhosAPIDRATEIODOCUM: TFloatField;
    CdsDocumFilhosAPDESCRICAO: TStringField;
    CdsDocumFilhosAPMOESIGLA: TStringField;
    CdsDocumFilhosAPNOMECENTROCUSTO: TStringField;
    CdsDocumFilhosAPPLANO: TFloatField;
    CdsDocumFilhosAPIDPATRO: TFloatField;
    CdsDocumFilhosAPIDPROGRAMA: TFloatField;
    CdsDocumFilhosAPFLGTIPOPROGRAMA: TStringField;
    CdsDocumFilhosAPNUMIMOVEL: TStringField;
    CdsDocumFilhosAPNOMEPATRO: TStringField;
    CdsDocumFilhosAPDESCPLANO: TStringField;
    CdsDocumFilhosAPDESCPROGRAMA: TStringField;
    CdsDocumFilhosAPHITCODHIST: TStringField;
    CdsDocumFilhosAPIDPLANOPREV: TFloatField;
    CdsDocumFilhosAPNUMRESERVA: TFloatField;
    CdsDocumFilhosAPFLGOBRIGARESERVA: TStringField;
    CdsDocumFilhosAPNUMRESERVAOLD: TFloatField;
    CdsDocumFilhosAPVALORRESERVAOLD: TFloatField;
    CdsDocumFilhosAPVLRRESORCAMEN: TFloatField;
    CdsDocumFilhosAPIDSEGREGACRITER: TFloatField;
    CdsDocumFilhosAPCODSUBCONTA: TFloatField;
    CdsDocumFilhosAPCODSUBCONTAPASS: TFloatField;
    CdsDocumFilhosAPIDPLANOVIRTUAL: TFloatField;
    CdsDocumFilhosAPIDSEGREGACONTR: TFloatField;
    CdsDocumFilhosAPFLGOBRQTDECOTAS: TStringField;
    CdsDocumFilhosAPIDPATROORIGEM: TFloatField;
    CdsDocumFilhosAPIDPLANOORIGEM: TFloatField;
    CdsDocumFilhosAPNOMEPATROORIGEM: TStringField;
    CdsDocumFilhosAPDESCPLANOORIGEM: TStringField;
    ppParameterList1: TppParameterList;
    PpautpagdocppField49: TppField;
    CdsDemGestAutPagNOMEMODULO: TStringField;
    ppHeaderBand12: TppHeaderBand;
    ppLabel51: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLabel54: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel72: TppLabel;
    ppLabel80: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLine34: TppLine;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppLine38: TppLine;
    ppLabel83: TppLabel;
    ppLabel86: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel110: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppDBText93: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel117: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLine46: TppLine;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLabel125: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLine50: TppLine;
    ppLabel129: TppLabel;
    ppDBText101: TppDBText;
    ppRegion2: TppRegion;
    ppLabel130: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion4: TppRegion;
    ppLabel131: TppLabel;
    ppDBText102: TppDBText;
    ppRegion5: TppRegion;
    ppDBText104: TppDBText;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppDBText105: TppDBText;
    ppLabel136: TppLabel;
    ppDBText106: TppDBText;
    ppRegFDO: TppRegion;
    ppLabel4: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    SubDocumAR: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel26: TppLabel;
    ppLine2: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppSubDocumFilhoAP: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDetailBand1: TppDetailBand;
    ppLabel3: TppLabel;
    ppDBText12: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    raCodeModule1: TraCodeModule;
    ppdbFDO: TppDBMemo;
    ppCalc29: TppSystemVariable;
    ppLine3: TppLine;
    plblDossie: TppLabel;
    pdbtxtCODDOSSIE: TppDBText;
    ppCODDOSSIE: TppField;
    CdsDemGestAutPagCODDOSSIE: TStringField;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure ppDBText92Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; Var Text: String);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure ppDBCalc2Print(Sender: TObject);
  private
    { Private declarations }
    sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    rVLDEC, rVLACRE, rVLIMP, rVLLIQ: real;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    Documento: TCtrlDocumento;
    // função de arredondamento de valores
    function  Arredonda(pNumero : double; pCasas : byte) : double;

    Procedure montaregistro;
    Procedure BuscaContaDoc(CodDocumento: Real);
    Procedure GravaBancoAg;
    function Parametriza(iTipo: Integer): String; //Darivaldo Alencar SIG 26501
  public
    { Public declarations }
  End;

Var
  RptAutPag: TRptAutPag;

Implementation

Uses dBaseDados, uString, uSistema;

{$R *.DFM}

Procedure TRptAutPag.CrmRptCMBeforePrint(Sender: TObject);
Var
  x: integer;
  sParametriza: String; //Darivaldo Alencar SIG 26501
Begin
  Inherited;

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
//    SQL.Add('SELECT /*+ RULE */ NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');   //Everson TIBERO
//    SQL.Add('SELECT NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');               //Everson TIBERO //Everson Cunha - SIG46608/88515
    SQL.Add('SELECT NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO, NOMEMODULO,  ');                      //Everson Cunha - SIG46608/88515
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO,       ');
    SQL.Add('  CODDOSSIE,                                                                   '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('  round(VALOR,2) as valor, round(VALOROUTRAMOEDA,2) as VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO, round(VALORRATEIO,2) as VALORRATEIO, ');
    SQL.Add('  DESCTDR, NOMEAP, NOMECR, NOMECC, OBS, FLGDOCBANCARIO, round(VLACRE,2) as VLACRE,                ');
    SQL.Add('  round(VLDEC,2) AS VLDEC, round(VLIMP,2) as VLIMP, round(VLLIQ,2) as VLLIQ, TRGUSERINCLUSAO,                                        ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,  ');
    SQL.Add('  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,     ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,         ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,   ');
    SQL.Add('  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA,        ');
    SQL.Add('  IDFORCLI, (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ,                     ');
    SQL.Add('  ''                    '' AS NOMEUSUARIO,                                     ');
    SQL.Add('  ''                    '' AS NUMBANCO,                                        ');
    SQL.Add('  ''                    '' AS NUMAGENCIA,                                      ');
    SQL.Add('  ''                    '' AS CONTACORRENTE,                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('  NOMEPATROORIGEM, DESCPLANOORIGEM,                                            ');
    // Fim Ricardo

    //
    //edilaine SIG115077 : inicio
    if ParamIntegra.RecPag = 'P' then
    begin
      SQL.Add('  ( select listagg(fdd.cod_fdo || '' '' || bxd.mes_ano_servico, '' | '')     ');
      SQL.Add('           within group (order by bxd.numero_baixa) "FDO"                    ');
      SQL.Add('      from user_integracao_orcamentaria.fdo_digital fdd                      ');
      SQL.Add('      join user_integracao_orcamentaria.baixa_fdo bxd                        ');
      SQL.Add('        on bxd.id_fdo = fdd.id_fdo                                           ');
      SQL.Add('     where bxd.numero_baixa = coddocumento                                   ');
      SQL.Add('           and ROWNUM <= 10000                                               ');      // Paulo Nobre - MIGRACAO-ORACLE-2025
      SQL.Add('  ) AS FDO                                                                   ');
    end
    else
      SQL.Add('  ''             '' AS FDO                                                   ');
    //edilaine SIG115077 : fim

    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                ');
//    SQL.Add('          D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,        ');               //Everson Cunha - SIG46608/88515
    SQL.Add('          D.NODOCUMENTO, M.NOMEMODULO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,        ');   //Everson Cunha - SIG46608/88515
    SQL.Add('          D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                    ');
    SQL.Add('          D.CODDOSSIE,                                                         '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('          decode(d.recpag, ''P'', decode(l.debcre,''C'',round(L.VALOR,2) ,round(l.valor,2)*-1),   ');
    SQL.Add('             decode(l.debcre, ''D'', round(L.VALOR,2), round(l.valor,2) * -1)) as valor, ');
    SQL.Add('          decode(d.recpag,''P'',decode(l.debcre,''C'',round(L.VALOROUTRAMOEDA,2),       ');
    SQL.Add('             round(L.VALOROUTRAMOEDA,2)*-1),                                            ');
    SQL.Add('             decode(l.debcre,''D'',round(L.VALOROUTRAMOEDA,2),round(L.VALOROUTRAMOEDA,2)*-1 )    ');
    SQL.Add('                ) valoroutramoeda,                                          ');
    SQL.Add('          P.RAZAOSOCIAL, F.DESCRICAO, round(SUM(round(RD.VALOR,2)),2) AS VALORRATEIO,            ');
    SQL.Add('          TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP, CR.NOME AS NOMECR,      ');

    //Marcus Oliveira P. 26056 09/08/2007
    SQL.Add('          (CC.NOME) AS NOMECC,              ');

    SQL.Add('          D.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE,         ');
    SQL.Add('         (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO,          ');
    SQL.Add('         D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,               ');
    SQL.Add('         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA, D.IDFORCLI,           ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('          PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM       ');
    // fim Ricardo

    SQL.Add('   FROM PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,    ');
    SQL.Add('        FORMARECPAG F, TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP,       ');
    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add('        CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA , TIPODOCRECPAG TPD    ');
    //fim - André Tavares - pendência 16330 - 30/04/2004

    // Ricardo A. SOL 122623 KTN 603580
//    SQL.Add('        , PLANPREVCONTABIL PLANOO, PESSOA PATROO                             ');  //Everson Cunha - SIG46608/88515
    SQL.Add('        , PLANPREVCONTABIL PLANOO, PESSOA PATROO, MODULO M                     ');  //Everson Cunha - SIG46608/88515
    // fim Ricardo

    SQL.Add('   WHERE                                                                       ');
    SQL.Add('-- #ADF1                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add(' d.CODTIPDOC = tpd.CODTIPDOC and ');
    SQL.Add('  ((tpd.FLGIMPRIMEAP IS NULL) OR (tpd.FLGIMPRIMEAP = ''S'')) and ' );
    //fim    - André Tavares - pendência 16330 - 30/04/2004

//    Darivaldo Alencar SIG 26501 -inicio
//    If (Not CmpRptCM.ParamValues[1].IsNull) Or (Not CmpRptCM.ParamValues[2].IsNull) Then
//    Begin
//      Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
//        0: SQL.Add('   (d.numapgr is not null) and ');
//        1: SQL.Add('   (d.numapgr is  null) and ');
//      End;
//
//      If (Not CmpRptCM.ParamValues[1].IsNull) Then
//      //Marcio Sanches Spinosa SOL 244390 PPM 618021 - Inicio
//      //  SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(CmpRptCM.ParamValues[1].AsString, 10) + #39 + ' and ');
//        SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Trim(CmpRptCM.ParamValues[1].AsString) + #39 + ' and ');
//      //Marcio Sanches Spinosa SOL 244390 PPM 618021 - Fim
//
//      //If (Not CmpRptCM.ParamValues[2].IsNull) Then
//        //SQL.Add('   to_char(d.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + CmpRptCM.ParamValues[2].AsString + #39 + ' and ');
//    End
  sParametriza:= Parametriza(1);
  if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza)
  Else if (CmpRptCM.ParamValues[0].AsString <> EmptyStr) then
  //Darivaldo Alencar SIG 26501 fim
      SQL.Add('   d.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + '  and ');
    SQL.Add('        D.CODTIPDOC IN                                                         ');
    SQL.Add('    (SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           NOT EXISTS(SELECT *                                                 ');
    SQL.Add('                      FROM USUARIOXTPDOCTO B                                   ');
    SQL.Add('                      WHERE RECPAG= :RECPAG AND                                ');
    SQL.Add('                            B.IDUSUARIO = :IDUSUARIO                           ');
    SQL.Add('                      )                                                        ');
    SQL.Add('     UNION                                                                     ');
    SQL.Add('     SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           EXISTS (SELECT *                                                    ');
    SQL.Add('                   FROM USUARIOXTPDOCTO B                                      ');
    SQL.Add('                   WHERE RECPAG = :RECPAG AND                                  ');
    SQL.Add('                         A.CODTIPDOC = B.CODTIPDOC AND                         ');
    SQL.Add('                         B.IDUSUARIO = :IDUSUARIO                              ');
    SQL.Add('                  )                                                            ');
    SQL.Add('     ) AND                                                                     ');
    SQL.Add('      (d.numfatura is null) and                                                ');
    SQL.Add('      (L.ESTORNO IS NULL) AND                                                  ');
    SQL.Add('      (D.RECPAG = :RECPAG) AND                                                 ');
    SQL.Add('      (D.IDPESSOA =  :IDPESSOA) AND                                            ');
    SQL.Add('      (D.IDMODULO = M.IDMODULO) AND                                            ');  //Everson Cunha - SIG46608/88515
    SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                    ');
    SQL.Add('      (D.OPERACAO = L.OPERACAO) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                   ');
    SQL.Add('      (P.IDPESSOA = D.IDFORCLI) AND                                            ');
    SQL.Add('      (D.CODFORMA = F.CODFORMA(+)) AND                                         ');
    SQL.Add('      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                           ');
    SQL.Add('      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                     ');
    SQL.Add('      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                              ');
    SQL.Add('      (TDR.RECPAG(+) = RD.RECPAG) AND                                          ');
    SQL.Add('      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                      ');
    SQL.Add('      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                     ');
    SQL.Add('      (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                         ');
    SQL.Add('      (CR.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                              ');
    SQL.Add('      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                             ');
    SQL.Add('      (PATRO.IDPESSOA(+) = RD.IDPATRO)                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('      AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                           ');
    SQL.Add('      AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                              ');
    // fim Ricardo
    //William M. Santos - Ini
    SQL.Add('      AND NOT EXISTS (SELECT 1                                                 ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim
    SQL.Add('    GROUP BY L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR,                  ');
//    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, D.COMPLDOCUMENTO,                    '); //Everson Cunha - SIG46608/88515
    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, M.NOMEMODULO, D.COMPLDOCUMENTO,      ');   //Everson Cunha - SIG46608/88515
    SQL.Add('             D.DATAVENCTO, D.DATAEMISSAO, D.DATAPROGRAMADA,                    ');
    SQL.Add('             P.NUMDOCUMENTO, d.recpag, l.debcre, L.VALOROUTRAMOEDA,            ');
    SQL.Add('             D.CODDOSSIE,                                                      '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('             P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO, AP.NOME,               ');
    SQL.Add('             CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS, D.TRGUSERINCLUSAO,  ');
    SQL.Add('             D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME, PLANO.NOME,            ');
    SQL.Add('             PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                 ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('             , PATROO.NOME, PLANOO.NOME                                          ');
    // fim Ricardo

    SQL.Add('    UNION                                                                      ');
    SQL.Add('    SELECT Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,           ');
//    SQL.Add('           Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,                   '); //Everson Cunha - SIG46608/88515
    SQL.Add('           Q1.NODOCUMENTO, Q1.NOMEMODULO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,    ');   //Everson Cunha - SIG46608/88515
    //SQL.Add('           Q1.DATAEMISSAO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, round(Q1.VALOR,2) AS VALOR,       ');       //Everson Cunha - SIG118992 e 118993
    SQL.Add('           Q1.DATAEMISSAO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.CODDOSSIE, round(Q1.VALOR,2) AS VALOR, '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('           Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,                   ');
    SQL.Add('           round(SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)),2) AS VALORRATEIO,              ');
    SQL.Add('           Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS,                ');
    SQL.Add('           Q1.FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,       ');
    SQL.Add('           (0) AS VLLIQ, Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO,                 ');
    SQL.Add('           Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA,          ');
    SQL.Add('           Q1.IDFORCLI                                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('           , Q2.NOMEPATROORIGEM, Q2.DESCPLANOORIGEM                            ');
    // fim Ricardo

    SQL.Add('    FROM                                                                       ');
    SQL.Add('        (SELECT DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR, DOC.REFERENCIA,  ');
//    SQL.Add('            DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO,               '); //Everson Cunha - SIG46608/88515
    SQL.Add('            DOC.NODOCUMENTO, M.NOMEMODULO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO, ');   //Everson Cunha - SIG46608/88515
    SQL.Add('            DOC.DATAEMISSAO, DOC.DATAPROGRAMADA, P.NUMDOCUMENTO,               ');
    SQL.Add('            DOC.CODDOSSIE,                                                     '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',                   ');
    SQL.Add('              round(Lan.VALOR,2),round(lan.valor,2)*-1),                                         ');
    SQL.Add('              decode(lan.debcre,''D'',round(Lan.VALOR,2),round(lan.valor,2)*-1)) as valor,       ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',Lan.VALOROUTRAMOEDA,');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1),decode(lan.debcre,''D'',               ');
    SQL.Add('                Lan.VALOROUTRAMOEDA,                                           ');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1)) as valoroutramoeda,                   ');
    SQL.Add('            P.RAZAOSOCIAL, F.DESCRICAO, DOC.OBS,                               ');
    SQL.Add('            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC,');
    SQL.Add('            (0) AS VLIMP, (0) AS VLLIQ, DOC.TRGUSERINCLUSAO,                   ');
    SQL.Add('            DOC.TRGDTINCLUSAO, DOC.IDFORCLI                                    ');
//    SQL.Add('          FROM PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F         ');  //Everson Cunha - SIG46608/88515
    SQL.Add('         FROM PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F, MODULO M');    //Everson Cunha - SIG46608/88515
    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF2                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

//    Darivaldo Alencar SIG 26501 inicio
//    If (Not CmpRptCM.ParamValues[1].IsNull) Or (Not CmpRptCM.ParamValues[2].IsNull) Then
//    Begin
//      If (Not CmpRptCM.ParamValues[2].IsNull) Then
//        SQL.Add('   to_char(doc.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + CmpRptCM.ParamValues[2].AsString + #39 + ' and ');
//      Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
//        0: SQL.Add('   (doc.numapgr is not null) and ');
//        1: SQL.Add('   (doc.numapgr is null) and ');
//      End;
  sParametriza:= Parametriza(2);
  if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza)
  Else if (CmpRptCM.ParamValues[0].AsString <> EmptyStr) then
  //Darivaldo Alencar SIG 26501 fim
      SQL.Add('   doc.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + ' and ');
    SQL.Add('            DOC.CODTIPDOC IN                                                   ');
    SQL.Add('            (SELECT CODTIPDOC                                                  ');
    SQL.Add('              FROM TIPODOCRECPAG A                                             ');
    SQL.Add('              WHERE A.RECPAG = :RECPAG AND                                     ');
    SQL.Add('                NOT EXISTS(SELECT *                                            ');
    SQL.Add('                           FROM USUARIOXTPDOCTO B                              ');
    SQL.Add('                           WHERE RECPAG = :RECPAG AND                          ');
    SQL.Add('                                 B.IDUSUARIO = :IDUSUARIO)                     ');
    SQL.Add('UNION                                                                          ');
    SQL.Add('             SELECT CODTIPDOC                                                  ');
    SQL.Add('             FROM TIPODOCRECPAG A                                              ');
    SQL.Add('             WHERE A.RECPAG = :RECPAG AND                                      ');
    SQL.Add('                   EXISTS(SELECT *                                             ');
    SQL.Add('                          FROM USUARIOXTPDOCTO B                               ');
    SQL.Add('                          WHERE RECPAG = :RECPAG AND                           ');
    SQL.Add('                                A.CODTIPDOC = B.CODTIPDOC AND                  ');
    SQL.Add('                                B.IDUSUARIO = :IDUSUARIO)                      ');
    SQL.Add('            ) AND                                                              ');
    SQL.Add('            (LAN.ESTORNO IS NULL) AND                                          ');
    SQL.Add('            (DOC.RECPAG = :RECPAG) AND                                         ');
    SQL.Add('            (DOC.IDPESSOA = :IDPESSOA) AND                                     ');
    SQL.Add('            (P.IDPESSOA = DOC.IDFORCLI)AND                                     ');
    SQL.Add('            (DOC.IDMODULO = M.IDMODULO) AND                                    ');  //Everson Cunha - SIG46608/88515
    SQL.Add('            (DOC.CODFORMA = F.CODFORMA(+)) AND                                 ');
    SQL.Add('            (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                        ');
    SQL.Add('            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                              ');
    //William M. Santos - Ini
    SQL.Add('              AND NOT EXISTS (SELECT 1                                         ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE DOC.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim

    SQL.Add('        ) Q1,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA,(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',      ');
    SQL.Add('                  round(Rd.VALOR,2), round(Rd.VALOR,2) * -1),                                    ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', round(Rd.VALOR,2), round(Rd.VALOR,2) * -1))) as valor,   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('            CR.NOME AS NOMECR,                                                 ');
    SQL.Add('            (CC.NOME) AS NOMECC,            ');
    SQL.Add('            RD.NUMIMOVEL,PATRO.NOME AS NOMEPATRO,                              ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                              ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM   ');
    // fim Ricardo

    SQL.Add('          FROM PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,       ');
    SQL.Add('            TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR,   ');
    SQL.Add('            PLANPREVCONTABIL PLANO, PROGRAMA                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PLANPREVCONTABIL PLANOO, PESSOA PATROO                           ');
    // fim Ricardo

    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF3                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
//  Darivaldo Alencar SIG 26501 -inicio
//    If (Not CmpRptCM.ParamValues[1].IsNull) Then
//    //Marcio Sanches Spinosa SOL 244390 PPM 618021 - Inicio
//    //  SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(CmpRptCM.ParamValues[1].AsString, 10) + #39 + ' and ');
//      SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Trim(CmpRptCM.ParamValues[1].AsString) + #39 + ' and ');
//    //Marcio Sanches Spinosa SOL 244390 PPM 618021 - Fim
    sParametriza:= Parametriza(3);
    if (sParametriza <> EmptyStr) then
     SQL.Add(sParametriza);
//  Darivaldo Alencar SIG 26501 -fim

    SQL.Add('            (D.RECPAG = :RECPAG) AND                                           ');
    SQL.Add('            d.coddocumento=l.coddocumento and                                  ');
    SQL.Add('            l.operacao=d.operacao and                                          ');
    SQL.Add('            (D.IDPESSOA =  :IDPESSOA) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL) AND                                      ');
    SQL.Add('            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                     ');
    SQL.Add('            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                               ');
    SQL.Add('            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                             ');
    SQL.Add('            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                        ');
    SQL.Add('            (TDR.RECPAG(+) = RD.RECPAG) AND                                    ');
    SQL.Add('            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                ');
    SQL.Add('            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                               ');
    SQL.Add('            (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                 ');
    SQL.Add('            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                   ');
    SQL.Add('            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                        ');
    SQL.Add('            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                       ');
    SQL.Add('            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                               ');
    SQL.Add('            (CR.IDPESSOA(+) = RD.IDPESSOA)                                     ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                     ');
    sql.Add('            AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                        ');
    // fim Ricardo

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('        ) Q2,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA, sum(decode(d.recpag, ''P'', decode(l.debcre,      ');
    SQL.Add('                  ''C'', round(L.VALOR,2), round(l.valor,2)*-1), decode(l.debcre, ''D'', round(L.VALOR,2),');
    SQL.Add('                  round(l.valor,2)*-1))) as valor                                       ');
    SQL.Add('          FROM DOCUMENTO D, LANCTODOCUM L                                      ');
    SQL.Add('          WHERE (L.ESTORNO IS NULL) AND                                        ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                            ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                       ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                          ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                              ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                          ');

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('          GROUP BY D.NUMFATURA                                                 ');
    SQL.Add('        ) Q3                                                                   ');
    SQL.Add('      WHERE                                                                    ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                      ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                          ');
    SQL.Add('      GROUP BY                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,              ');
//    SQL.Add('        Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO,      ');
    SQL.Add('        Q1.NODOCUMENTO, Q1.NOMEMODULO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO, ');  //Everson Cunha - SIG46608/88515
    SQL.Add('        Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,      ');
    SQL.Add('        Q1.CODDOSSIE,                                                          '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('        Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR,        ');
    SQL.Add('        Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO, Q1.TRGUSERINCLUSAO,              ');
    SQL.Add('        Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO,            ');
    SQL.Add('        Q2.DESCPROGRAMA,Q1.IDFORCLI                                            ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('        , Q2.DESCPLANOORIGEM, Q2.NOMEPATROORIGEM)                                ');
    // fim Ricardo

    sql.Add(' ORDER BY CODDOCUMENTO, DESCPLANO                                              ');
    Prepare;
    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    //SQL.SaveToFile('C:\Planus\Temp\teste1.txt');//remover
    Open;

    //William M. Santos - 26/01/2010 - Ini
    //Query para trazer os documentos filhos referentes a Contas a Pagar
    With SqlDocumFilhosAP Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO, DF.NODOCUMENTO as CAPDOCUMENTO,                       ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF    WHERE                                                   ');

      if not (Trim(CmpRptCM.ParamValues[0].AsString) = EmptyStr) then//Marcio Sanches Spinosa SOL 244390 PPM 618021
        SQL.Add(' (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ')    AND      ')
      else
//    Darivaldo Alencar SIG 26501 -inicio
//        SQL.Add('( R.CODCENTRORESPON = ' + CmpRptCM.ParamValues[1].AsString + ') and (df.trgdtinclusao = to_date( '''+ CmpRptCM.ParamValues[2].AsString + ''', ''dd/mm/yyyy'')) AND ');
  sParametriza:= Parametriza(4);
  if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza);
//      Darivaldo Alencar SIG 26501 -fim

      SQL.Add('       (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''P''                                                   ');
      // SQL.SaveToFile('c:\teste.txt');
      //SQL.SaveToFile('C:\Planus\Temp\teste2.txt');//remover
      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;


    //Query para trazer os documentos filhos referentes a Contas a Receber
    With SqlDocumFilhoAR Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,                         ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF  where                                                       ');

      if not (Trim(CmpRptCM.ParamValues[0].AsString) = EmptyStr) then//Marcio Sanches Spinosa SOL 244390 PPM 618021
//      Darivaldo Alencar SIG 26501 -inicio
//        SQL.Add(' (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ')         ')
        SQL.Add(' (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ') AND ')
      else
//        SQL.Add(' R.CODCENTRORESPON = ' + CmpRptCM.ParamValues[1].AsString + ' and df.trgdtinclusao = to_date( '''+ CmpRptCM.ParamValues[2].AsString + ''', ''dd/mm/yyyy'')  ');
  sParametriza:= Parametriza(5);
  if (sParametriza <> EmptyStr) then
     SQL.Add(sParametriza);
//      SQL.Add('      AND (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('     (T.CODTIPRECDES = R.CODTIPRECDES) AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)  ');
//      Darivaldo Alencar SIG 26501 -fim
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');
      //  SQL.SaveToFile('c:\teste1.txt');
      //SQL.SaveToFile('C:\Planus\Temp\teste3.txt');//remover
      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;
    //William M. Santos - 26/01/2010 - Fim
  End;
  OldDoc := '';
  SqlDemGestAutPag.Open;
  While Not CdsAutPagDoc.Eof Do
  Begin
    MontaRegistro;

    CdsDemGestAutPag.Append;
    For X := 0 To CdsAutPagDoc.FieldCount - 1 Do
    Begin
      If CdsDemGestAutPag.FindField(CdsAutPagDoc.Fields[x].FieldName) <> Nil Then
        Case CdsAutPagDoc.FieldByName(CdsAutPagDoc.Fields[x].FieldName).DataType Of
          ftBoolean:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsBoolean := CdsAutPagDoc.Fields[x].AsBoolean;
          ftSmallint, ftInteger, ftWord, ftBytes:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsInteger := CdsAutPagDoc.Fields[x].AsInteger;
          ftFloat, ftCurrency:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsFloat := CdsAutPagDoc.Fields[x].AsFloat;
          ftString:
            //CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsString := CdsAutPagDoc.Fields[x].AsString;       //edilaine SIG115077
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsString := Trim(CdsAutPagDoc.Fields[x].AsString);   //edilaine SIG115077
          ftDate, ftTime, ftDateTime:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsDateTime := CdsAutPagDoc.Fields[x].AsDateTime;
        Else
          // SOL 187024 KNT 1766935 Otacilio ** Inicio **
          // Foi simulado a tecla enter ao passar o valor para o cds por que
          // ao gerar o PDF estava cortando o campo OBSERVAACAO
          CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).Value := CdsAutPagDoc.Fields[x].Value + #13 + #13 + #13;
          // SOL 187024 KNT 1766935 Otacilio ** Fim **
        End;
    End;
    CdsDemGestAutPag.Post;
    CdsAutPagDoc.Next;
  End;
End;

procedure TRptAutPag.montaregistro;
var
  rSaldo: real;
  iNumApGr: Integer;
  Doc: String;
begin
  CdsAutPagDoc.Edit;
  Doc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;

  if OldDoc <> CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString Then
  begin

    OldDoc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;
    if CdsAutPagDoc.FieldByName( 'NUMAPGR' ).IsNull Then
    begin

      // Ricardo Alves SOL: 98935 Kintana: 428807
      // gera o número da AP e armazena em iNumApGr
      if not CtrlRelatoriosCAPCAR.SetSEQAPGR(
        StrToInt( OldDoc ), CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsString,
        iNumApGr ) then
        Abort;

      CdsAutPagDoc.FieldByName( 'NUMAPGR' ).AsInteger := iNumApGr;
    end
    else
      doc := CdsAutPagDoc.FieldByName( 'CodDocumento' ).AsString;

    CdsAutPagDocAlt.Close;
    CdsAlteraParcOrigem.Close;
    Documento.Saldo.CalculaSaldo( StrToInt( Doc ) );
    rSaldo := Arredonda( Documento.Saldo.Valor, 2 );

    if not CdsAutPagDoc.FieldByName( 'NUMFATURA' ).IsNull then
    begin
      SqlAlteraParcOrigem.Prepare;
      SqlAlteraParcOrigem.Params[ 0 ].AsFloat := StrToInt( Doc );
      SqlAlteraParcOrigem.Params[ 1 ].AsFloat :=
        CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsFloat;
      SqlAlteraParcOrigem.Open;
      CdsAutPagDoc.FieldByName( 'valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat -
        CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat ),
        2
        );
      CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    SqlAutPagDocAlt.Prepare;
    SqlAutPagDocAlt.Params[ 0 ].AsFloat := StrToInt( Doc );
    SqlAutPagDocAlt.Open;

    if CdsAutPagDoc.FieldByName( 'NumFatura' ).IsNull then
    begin
      CdsAutPagDoc.FieldByName( 'Valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.fieldbyname( 'Valor' ).AsFloat ), 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valdecr' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valacre' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valimp' ).AsFloat ), 2 );

    if strtofloat( Format( '%17.2f', [
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat ] ) ) = 0 Then
    begin
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat ),
        2
        );
    end;

    rVLDEC  := Arredonda( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat, 2 );
    rVLACRE := Arredonda( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat, 2 );
    rVLIMP  := Arredonda( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat, 2 );
    rVLLIQ  := Arredonda( CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat, 2);
  end
  else
  begin
    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat  := rVLDEC;
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat := rVLACRE;
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat  := rVLIMP;
    CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat  := rVLLIQ;
  end;
  GravaBancoAg;
  CdsAutPagDoc.post;
end;

Procedure TRptAutPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
End;

Procedure TRptAutPag.BuscaContaDoc(CodDocumento: Real);
Begin
  If CdsBuscaContaDoc.Active Then
    CdsBuscaContaDoc.Close;
  SqlBuscaContaDoc.Prepare;
  SqlBuscaContaDoc.Params[0].AsFloat := CodDocumento;
  SqlBuscaContaDoc.Open;
  If Not CdsBuscaContaDoc.IsEmpty Then
  Begin
    Id := CdsBuscaContaDoc.FieldByName('IDCBANCARIA').AsFloat;
    sBanco := CdsBuscaContaDoc.FieldByName('NUMBANCO').AsString;
    sNomeBanco := CdsBuscaContaDoc.FieldByName('NOMEBANCO').AsString;
    sAgencia := CdsBuscaContaDoc.FieldByName('NUMAGENCIA').AsString;
    sNomeagencia := CdsBuscaContaDoc.FieldByName('NOMEAGENCIA').AsString;
    sNumero := CdsBuscaContaDoc.FieldByName('CONTACORRENTE').AsString;
    sDescTipo := CdsBuscaContaDoc.FieldByName('DESCTIPOCONTA').AsString;
    sTipo := CdsBuscaContaDoc.FieldByName('TIPOCONTA').AsString;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraConta := '';
      sNumeroFormat := sNumero;
    End
    Else
    Begin
      sMascaraConta := CdsBuscaContaDoc.FieldByName('MASCARACC').AsString + ';0; ';
      sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
    End;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraAgencia := '';
      sAgenciaFormat := sAgencia;
    End
    Else
    Begin
      sMascaraAgencia := CdsBuscaContaDoc.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
      sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
    End;
  End
  Else
  Begin
    If CdsBuscaContaDocForn.Active Then
      CdsBuscaContaDocForn.Close;

    SqlBuscaContaDocForn.Prepare;
    SqlBuscaContaDocForn.Params[0].AsFloat := CodDocumento;
    SqlBuscaContaDocForn.Open;
    If Not CdsBuscaContaDocForn.IsEmpty Then
    Begin
      Id := CdsBuscaContaDocForn.FieldByName('IDCBANCARIA').AsFloat;
      sBanco := CdsBuscaContaDocForn.FieldByName('NUMBANCO').AsString;
      sNomeBanco := CdsBuscaContaDocForn.FieldByName('NOMEBANCO').AsString;
      sAgencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
      sNomeagencia := CdsBuscaContaDocForn.FieldByName('NOMEAGENCIA').AsString;
      sNumero := CdsBuscaContaDocForn.FieldByName('CONTACORRENTE').AsString;
      sDescTipo := CdsBuscaContaDocForn.FieldByName('DESCTIPOCONTA').AsString;
      sTipo := CdsBuscaContaDocForn.FieldByName('TIPOCONTA').AsString;

      If CdsBuscaContaDocForn.FieldByName('MASCARACC').IsNull Then
      Begin
        sMascaraConta := '';
        sNumeroFormat := sNumero;
      End
      Else
      Begin
        sMascaraConta := CdsBuscaContaDocForn.FieldByName('MASCARACC').AsString + ';0; ';
        sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
      End;

      If CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').IsNull Then
      Begin
        sMascaraAgencia := '';
        sAgenciaFormat := sAgencia;
      End
      Else
      Begin
        sMascaraAgencia := CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
        sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
      End;
    End
    Else
    Begin
      Id := -1;
      sBanco := '';
      sNomeBanco := '';
      sAgencia := '';
      sNomeagencia := '';
      sNumero := '';
      sDescTipo := '';
      sTipo := '0';
      sMascaraConta := '';
      sMascaraAgencia := '';
      sAgenciaFormat := '';
      sNumeroFormat := '';
    End;
  End;
End;

Procedure TRptAutPag.GravaBancoAg;
Begin
  If Not CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').IsNull Then
  Begin
    //edilaine SIG100380 : inicio
    if copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 1,2) <> 'CM' then
       CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString
    else If CdsNomeUsuario.Active Then
    begin
      CdsNomeUsuario.Close;
      SqlNomeUsuario.Prepare;
      SqlNomeUsuario.Params[0].AsFloat := StrToFloat(Copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 3,
        Length(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString)));
      SqlNomeUsuario.Open;
      CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsNomeUsuario.Fields[0].AsString;
    end;
    //edilaine SIG100380 : fim
  End
  Else
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := '';

  If (CdsAutPagDoc.AutoCalcFields) And
    (CdsAutPagDoc.FieldByName('FLGDOCBANCARIO').AsString = 'S') Then
  Begin
    BuscaContaDoc(CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsFloat);
    CdsAutPagDoc.FieldByName('NUMBANCO').AsString := sBanco;
    CdsAutPagDoc.FieldByName('NUMAGENCIA').AsString := sAgenciaFormat;
    CdsAutPagDoc.FieldByName('CONTACORRENTE').AsString := sNumeroFormat;
  End;
End;

Procedure TRptAutPag.ppDBText92Format(Sender: TObject;
  DisplayFormat: String; DataType: TppDataType; Value: Variant;
  Var Text: String);
Var
  sTmp: String;
Begin
  Inherited;
  If VarType(Value) = varString Then
  Begin
    sTmp := trim(VarAsType(Value, varString));
    If length(sTmp) = 11 Then
    Begin
      // CPF
      sTmp := copy(sTmp, 1, 3) +
        '.' +
        copy(sTmp, 4, 3) +
        '.' +
        copy(sTmp, 7, 3) +
        '-' +
        copy(sTmp, 10, 2);
    End
    Else If length(sTmp) = 14 Then
    Begin
      // CGC = CNPJ
      sTmp := copy(sTmp, 1, 2) +
        '.' +
        copy(sTmp, 3, 3) +
        '.' +
        copy(sTmp, 6, 3) +
        '/' +
        copy(sTmp, 9, 4) +
        '-' +
        copy(sTmp, 13, 2);
    End;
    Text := sTmp;
  End;
End;

function TRptAutPag.Arredonda(pNumero : double;pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := round( p );
  p := p / Power( 10, pCasas );
  result:=p;
end;

procedure TRptAutPag.ppDBCalc1Print(Sender: TObject);
begin
  inherited;
   ppLabel14.Caption := ppDBCalc1.Text;
end;

procedure TRptAutPag.ppDBCalc2Print(Sender: TObject);
begin
  inherited;
  ppLabel26.Caption := ppDBCalc2.Text;
end;

//Darivaldo Alencar SIG 26501 -inicio
function TRptAutPag.Parametriza(iTipo: Integer): String;
var
  sSQL: String;
  sTabela: array[1..4] of string;
begin
  sSQL := EmptyStr;
  //Apelidando as 04 tabelas utilizadas, quando vazio não utilizada
  case iTipo of
    1 : begin
         sTabela[1]:= 'D';
         sTabela[2]:= 'L';
         sTabela[3]:= 'TPD';
         sTabela[4]:= 'RD';
       end;
    2: begin
         sTabela[1]:= 'DOC';
         sTabela[2]:= 'LAN';
         sTabela[3]:= EmptyStr;
         sTabela[4]:= EmptyStr;
       end;
    3: begin
         sTabela[1]:= 'D';
         sTabela[2]:= 'L';
         sTabela[3]:= EmptyStr;
         sTabela[4]:= 'RD';
       end;
    else begin
         sTabela[1]:= 'DOC';
         sTabela[2]:= EmptyStr;
         sTabela[3]:= EmptyStr;
         sTabela[4]:= 'R';
       end;
  end;
  If ( Not CmpRptCM.ParamValues[1].IsNull ) or
     ( Not CmpRptCM.ParamValues[11].IsNull) or
     ( Not CmpRptCM.ParamValues[12].IsNull) or
     ( Not CmpRptCM.ParamValues[13].IsNull) or
     ( Not CmpRptCM.ParamValues[14].IsNull) or
     ( Not CmpRptCM.ParamValues[19].IsNull) or
     ( Not CmpRptCM.ParamValues[20].IsNull) or
     ( Not CmpRptCM.ParamValues[21].IsNull) or
     ((Not CmpRptCM.ParamValues[2].IsNull ) and (Not CmpRptCM.ParamValues[4].IsNull )) or
     ((Not CmpRptCM.ParamValues[5].IsNull ) and (Not CmpRptCM.ParamValues[6].IsNull )) or
     ((Not CmpRptCM.ParamValues[7].IsNull ) and (Not CmpRptCM.ParamValues[8].IsNull )) or
     ((Not CmpRptCM.ParamValues[9].IsNull ) and (Not CmpRptCM.ParamValues[10].IsNull)) or
     ((Not CmpRptCM.ParamValues[15].IsNull) and (Not CmpRptCM.ParamValues[16].IsNull)) or
     ((Not CmpRptCM.ParamValues[17].IsNull) and (Not CmpRptCM.ParamValues[18].IsNull)) then
   Begin
     if (CmpRptCM.ParamValues[3].AsString <> EmptyStr) and
        (sTabela[1] <> EmptyStr) then
       begin
          Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
            1:  sSQL := sSQL + ' ('+sTabela[1]+'.NUMAPGR IS  NULL) AND ';    //não autorizados
            2:  sSQL := sSQL + ' ('+sTabela[1]+'.NUMAPGR IS NOT NULL) AND '; //autorizado
          End;
       end;

      If (Not CmpRptCM.ParamValues[1].IsNull) and (sTabela[4] <> EmptyStr) Then
         sSQL := sSQL + ' RTRIM('+sTabela[4]+'.CODCENTRORESPON) = ' + QuotedStr(CmpRptCM.ParamValues[1].AsString) + ' AND ';

//**remover estes comentários
//      If (Not CmpRptCM.ParamValues[2].IsNull) and (Not CmpRptCM.ParamValues[4].IsNull) and (sTabela[1]<> EmptyStr) Then
//         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.TRGDTINCLUSAO,''DD/MM/RRRR'') BETWEEN ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) +' AND '+ QuotedStr(CmpRptCM.ParamValues[4].AsString) + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[20].IsNull) and (Not CmpRptCM.ParamValues[21].IsNull) and (sTabela[1] <> EmptyStr) Then
//         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAEMISSAO,''DD/MM/RRRR'') BETWEEN ' + QuotedStr(CmpRptCM.ParamValues[20].AsString) +' AND '+ QuotedStr(CmpRptCM.ParamValues[21].AsString) + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[5].IsNull) and (Not CmpRptCM.ParamValues[6].IsNull) and (sTabela[2]<> EmptyStr) Then
//         sSQL := sSQL + ' TO_DATE('+sTabela[2]+'.DATALANCTO,''DD/MM/RRRR'') BETWEEN ' + QuotedStr(CmpRptCM.ParamValues[5].AsString) +' AND '+ QuotedStr(CmpRptCM.ParamValues[6].AsString) + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[7].IsNull) and (Not CmpRptCM.ParamValues[8].IsNull) and (sTabela[1]<> EmptyStr) Then
//         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAVENCTO,''DD/MM/RRRR'') BETWEEN ' + QuotedStr(CmpRptCM.ParamValues[7].AsString) +' AND '+ QuotedStr(CmpRptCM.ParamValues[8].AsString) + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[9].IsNull) and (Not CmpRptCM.ParamValues[10].IsNull)  and (sTabela[1]<> EmptyStr) Then
//         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAPROGRAMADA,''DD/MM/RRRR'') BETWEEN ' + QuotedStr(CmpRptCM.ParamValues[9].AsString) +' AND '+ QuotedStr(CmpRptCM.ParamValues[10].AsString) + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[15].IsNull) and (Not CmpRptCM.ParamValues[16].IsNull) and (sTabela[1]<> EmptyStr) Then
//         sSQL := sSQL + ' '+sTabela[1]+'.NODOCUMENTO BETWEEN ' + CmpRptCM.ParamValues[15].AsString +' AND '+ CmpRptCM.ParamValues[16].AsString + ' AND ';
//
//      If (Not CmpRptCM.ParamValues[17].IsNull) and (Not CmpRptCM.ParamValues[18].IsNull)  and (sTabela[2]<> EmptyStr) Then
//         sSQL := sSQL + ' '+sTabela[2]+'.VALOR BETWEEN ' + CmpRptCM.ParamValues[17].AsString +' AND '+ CmpRptCM.ParamValues[18].AsString + ' AND ';
//****fim ccomentarios a remover

      If (Not CmpRptCM.ParamValues[2].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.TRGDTINCLUSAO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[4].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.TRGDTINCLUSAO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[4].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[20].IsNull) and (sTabela[1] <> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAEMISSAO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[20].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[21].IsNull) and (sTabela[1] <> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAEMISSAO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[21].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[5].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[2]+'.DATALANCTO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[5].AsString) + ' AND ';
      If (Not CmpRptCM.ParamValues[6].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[2]+'.DATALANCTO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[6].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[7].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAVENCTO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[7].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[8].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAVENCTO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[8].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[9].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAPROGRAMADA,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[9].AsString)  + ' AND ';
      If (Not CmpRptCM.ParamValues[10].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAPROGRAMADA,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[15].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.NODOCUMENTO >= ' + CmpRptCM.ParamValues[15].AsString + ' AND ';
      If (Not CmpRptCM.ParamValues[16].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.NODOCUMENTO <= ' + CmpRptCM.ParamValues[16].AsString + ' AND ';

      If (Not CmpRptCM.ParamValues[17].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[2]+'.VALOR >= ' + CmpRptCM.ParamValues[17].AsString +' AND ';
      If (Not CmpRptCM.ParamValues[18].IsNull)  and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[2]+'.VALOR <= ' + CmpRptCM.ParamValues[18].AsString + ' AND ';
///***
      If (Not CmpRptCM.ParamValues[19].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDFORCLI = ' + Trim(CmpRptCM.ParamValues[19].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[11].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.CODPORTFORMA  = ' + Trim(CmpRptCM.ParamValues[11].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[12].IsNull) and (sTabela[3]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[3]+'.CODTIPDOC  = ' + Trim(CmpRptCM.ParamValues[12].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[13].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDMODULO  = ' + Trim(CmpRptCM.ParamValues[13].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[14].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDUSUARIOINCLUSAO  = ' + Trim(CmpRptCM.ParamValues[14].AsString) +' AND ';
   end;
   result := sSQL;
end;
//Darivaldo Alencar SIG 26501 -fim
End.


