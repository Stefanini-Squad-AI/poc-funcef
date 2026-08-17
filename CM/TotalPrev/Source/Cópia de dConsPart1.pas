unit dConsPart1;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 16/05/2005
Autor     : André Pontes
Pendência : 18686
Descrição : os objetos data-aware do FConsPessoaGeral (cds, dts, qry e dsp) foram passados para o
            dtmConsPart1, para permitir persistência do resultado da pesquisa
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, URegra, DBClient, Provider;

type
  TDtmconsPart1 = class(TDataModule)
    qryContatos: TwwQuery;
    qryContatosENDRECO: TStringField;
    qryContatosNOME: TStringField;
    qryContatosEMAIL: TStringField;
    qryContatosDDI: TStringField;
    qryContatosDDD: TStringField;
    qryContatosTELEFONE: TStringField;
    qryContatosCARGO: TStringField;
    qryContatosSETOR: TStringField;
    qryContatosNASCIMENTO: TDateTimeField;
    qryContatosOBS: TMemoField;
    DsContatos: TwwDataSource;
    qryBeneficios: TwwQuery;
    qryBeneficiosNOME: TStringField;
    qryBeneficiosDESCRICAO: TStringField;
    qryBeneficiosVALORATUAL: TFloatField;
    qryBeneficiosVALORATUAL_1: TFloatField;
    qryBeneficiosVALORATUALANT: TFloatField;
    qryBeneficiosDATAINICIO: TDateTimeField;
    qryBeneficiosDATAFINAL: TDateTimeField;
    qryBeneficiosVALORSRB: TFloatField;
    qryBeneficiosDATAFINALPREVISTA: TDateTimeField;
    qryBeneficiosVALORTOTAL: TFloatField;
    qryBeneficiosULTMESPREPARO: TStringField;
    qryBeneficiosULTMESREAJUSTE: TStringField;
    qryBeneficiosNUMEROPROCESSO: TFloatField;
    qryBeneficiosNUMPROCINSS: TStringField;
    qryBeneficiosDATAINICIOINSS: TDateTimeField;
    qryBeneficiosNOMEVALORBASE1: TStringField;
    qryBeneficiosVALORBASE1: TFloatField;
    qryBeneficiosNOMEVALORBASE2: TStringField;
    qryBeneficiosVALORBASE2: TFloatField;
    qryBeneficiosNOMEVALORBASE3: TStringField;
    qryBeneficiosVALORBASE3: TFloatField;
    qryBeneficiosBENEFMIN: TStringField;
    qryBeneficiosPERCENTUAL: TFloatField;
    qryBeneficiosMOTIVO: TStringField;
    qryBeneficiosDATAEMISSAORECAD: TDateTimeField;
    qryBeneficiosDATALIMITERECAD: TDateTimeField;
    qryBeneficiosDATARECEBRECAD: TDateTimeField;
    qryBeneficiosIDPESSOA: TFloatField;
    qryBeneficiosIDRESPONSAVEL: TFloatField;
    qryBeneficiosNOMEBEN: TStringField;
    qryBeneficiosNOMERESP: TStringField;
    qryBeneficiosDATANASC: TDateTimeField;
    qryBeneficiosDESCDEPEN: TStringField;
    qryBeneficiosDATAULTREAJUSTE: TDateTimeField;
    qryBeneficiosDEPENDENCIA: TStringField;
    qryBeneficiosIDPESSJUR: TFloatField;
    qryBeneficiosIDPLANOPREV: TFloatField;
    DsBeneficios: TwwDataSource;
    dsContaCorrente: TwwDataSource;
    qryContaCorrente: TwwQuery;
    qrycontrib: TwwQuery;
    qrycontribMES: TStringField;
    qrycontribPLANPREV: TStringField;
    qrycontribPLANASS: TStringField;
    qrycontribCONTRIB: TStringField;
    qrycontribVALORESPERADO: TFloatField;
    qrycontribVALORRECEBIDO: TFloatField;
    qrycontribDATA: TDateTimeField;
    qrycontribMESCOBRANCA: TStringField;
    qrycontribNOME: TStringField;
    qrycontribDESCRICAO: TStringField;
    qrycontribIDPLANOPREV: TFloatField;
    qrycontribIDPESSJUR: TFloatField;
    dscontrib: TwwDataSource;
    qryHstVersoes: TwwQuery;
    qryHstVersoesMES: TStringField;
    qryHstVersoesFLGDESCONTO: TStringField;
    qryHstVersoesVALORPROVENTO: TFloatField;
    qryHstVersoesIDRUBRICA: TFloatField;
    qryHstVersoesDESCPROVENTO: TStringField;
    qryHstVersoesIDTITULAR: TFloatField;
    qryHstVersoesIDRESPONSAVEL: TFloatField;
    qryHstVersoesIDPESSOA: TFloatField;
    qryHstVersoesVALORRECEBIDO: TFloatField;
    qryHstVersoesMESCOBRANCA: TStringField;
    qryHstVersoesLIQRECEBIDO: TFloatField;
    qryHstVersoesLIQPREVISTO: TFloatField;
    qryHstVersoesCODDOCUMENTO: TFloatField;
    qryHstVersoesRECEBEDOR: TStringField;
    qryHstVersoesNUMBANCO: TStringField;
    qryHstVersoesNUMAGENCIA: TStringField;
    qryHstVersoesCONTACORRENTE: TStringField;
    qryHstVersoesCODPORTFORMA: TFloatField;
    qryHstVersoesDESCPORTADOR: TStringField;
    qryHstVersoesNOMETXT: TStringField;
    qryHstVersoesSITDOCPAGTO: TStringField;
    qryHstVersoesDATAPROGRAMADA: TDateTimeField;
    dsVersoes: TwwDataSource;
    dsHstVersoes: TwwDataSource;
    qryVersoes: TwwQuery;
    qryVersoesHISTORICO: TStringField;
    qryVersoesIDHSTFOLHABENEF: TFloatField;
    qryVersoesDATAPREVPAGTO: TDateTimeField;
    qryVersoesMESREFERENCIA: TStringField;
    dsplanass: TwwDataSource;
    qryplanass: TwwQuery;
    qryplanassIDPLANASS: TFloatField;
    qryplanassNOME: TStringField;
    qryplanassDESCRICAO: TStringField;
    qryplanassNOME_1: TStringField;
    qryplanassDATACANCELAMENTO: TDateTimeField;
    dspartprev: TwwDataSource;
    qrypartprev: TwwQuery;
    qrypartprevIDPLANOORIGEM: TFloatField;
    qrypartprevIDPESSJUR2: TFloatField;
    qrypartprevMATRICULA: TStringField;
    qrypartprevNOMEBENEF: TStringField;
    qrypartprevIDPESSOA: TFloatField;
    qrypartprevPLANPREV: TStringField;
    qrypartprevDOCBEN: TStringField;
    qrypartprevLOGRADOURO: TStringField;
    qrypartprevNUMERO: TStringField;
    qrypartprevBAIRRO: TStringField;
    qrypartprevCEP: TStringField;
    qrypartprevCOMPLEMENTO: TStringField;
    qrypartprevNOME: TStringField;
    qrypartprevNOMEESTADO: TStringField;
    qrypartprevDDD: TStringField;
    qrypartprevNUMEROTEL: TStringField;
    qrypartprevTIPO: TStringField;
    qrypartprevNOMERESP: TStringField;
    qrypartprevIDRESPONSAVEL: TFloatField;
    qrypartprevBENEFICIO: TStringField;
    qrypartprevVALORBASE1: TFloatField;
    qrypartprevNOMEVALORBASE1: TStringField;
    qrypartprevNUMDOCBEN: TStringField;
    dsplanprev: TwwDataSource;
    qryplanprev: TwwQuery;
    qryplanprevIDPLANOPREV: TFloatField;
    qryplanprevNOME: TStringField;
    qryplanprevDESCRICAO: TStringField;
    qryplanprevSITPART: TStringField;
    qryplanprevINSCRICAODATA: TDateTimeField;
    qryplanprevINSCRICAONUMERO: TFloatField;
    qryplanprevSALPARTICIPACAO: TFloatField;
    qryplanprevSALMANTIDO: TFloatField;
    qryplanprevDATACANCELAMENTO: TDateTimeField;
    qryplanprevDATAINICIOMANUT: TDateTimeField;
    qryplanprevDTINICIOINSC: TDateTimeField;
    qryplanprevFLGFITESPECIAL: TFloatField;
    qryDocTitular: TwwQuery;
    qryDocTitularNOMEDOCUMENTO: TStringField;
    qryDocTitularNUMDOCUMENTO: TStringField;
    qryDocTitularDATAEMISSAO: TDateTimeField;
    qryDocTitularNOMEESTADO: TStringField;
    qryDocTitularNOMEPAIS: TStringField;
    qryDocTitularORGAO: TStringField;
    qryDocTitularUF: TStringField;
    dsDocTitular: TwwDataSource;
    qryendereco: TwwQuery;
    qryenderecoNOME: TStringField;
    qryenderecoLOGRADOURO: TStringField;
    qryenderecoNUMERO: TStringField;
    qryenderecoCOMPLEMENTO: TStringField;
    qryenderecoBAIRRO: TStringField;
    qryenderecoCIDADE: TStringField;
    qryenderecoESTADO: TStringField;
    qryenderecoUF: TStringField;
    qryenderecoCEP: TStringField;
    qryenderecoNOMEPAIS: TStringField;
    dsendereco: TwwDataSource;
    qryParcelamento: TwwQuery;
    dsParcelamento: TwwDataSource;
    dscontribprev: TwwDataSource;
    qrycontribprev: TwwQuery;
    qrycontribprevMESREFERENCIA: TStringField;
    qrycontribprevMESCOBRANCA: TStringField;
    qrycontribprevVALORESPERADO: TFloatField;
    qrycontribprevDATARECEBIMENTO: TDateTimeField;
    qrycontribprevVALORRECEBIDO: TFloatField;
    qrycontribprevQUANTCOTAS: TFloatField;
    qrycontribprevNOME: TStringField;
    qrycontribprevMATRICULA: TStringField;
    qrycontribprevPLANPREV: TStringField;
    qrycontribprevFLGDEVOLUCAO: TFloatField;
    qrycontribprevDESCRICAO: TStringField;
    qrycontribprevCONTRIB: TStringField;
    qrycontribprevDATAFINAL: TDateTimeField;
    qrycontribprevPARCELA: TFloatField;
    qrycontribprevNOME_1: TStringField;
    qrycontribprevFLGCALCRESERVA: TStringField;
    qrycontribprevMOTIVO: TStringField;
    qrycontribprevVALOROP1: TFloatField;
    qrycontribprevVALOROP2: TFloatField;
    qrycontribprevVALOROP3: TFloatField;
    qrycontribprevIDCONTRIBPAI: TFloatField;
    qrycontribprevIDCONTRIBPAI2: TFloatField;
    qrycontribprevIDCONTRIBPAI3: TFloatField;
    dsOutrasInforms: TwwDataSource;
    qryOutrasInforms: TwwQuery;
    qryOutrasInformsDESCRICAO: TStringField;
    qryOutrasInformsIDPARAM: TFloatField;
    qryOutrasInformsDATAINICIO: TDateTimeField;
    qryOutrasInformsDATAFIM: TDateTimeField;
    qryOutrasInformsVALOR: TStringField;
    qryOutrasInformsIDPESSOA: TFloatField;
    qryOutrasInformsTIPO: TStringField;
    qryOutrasInformsVALIDACAO: TStringField;
    qryContaCorrentePartPrev: TwwQuery;
    qryContaCorrentePartPrevNUMBANCO: TStringField;
    qryContaCorrentePartPrevNOMEBANCO: TStringField;
    qryContaCorrentePartPrevNUMAGENCIA: TStringField;
    qryContaCorrentePartPrevNOMEAGENCIA: TStringField;
    qryContaCorrentePartPrevCONTACORRENTE: TStringField;
    qryContaCorrentePartPrevCONTAPREF: TStringField;
    qryContaCorrentePartPrevIDBANCO: TFloatField;
    qryContaCorrentePartPrevTPCONTA: TStringField;
    qryContaCorrentePartPrevIDAGENCIA: TFloatField;
    qryContaCorrentePartPrevTIPOCONTA: TStringField;
    qryContaCorrentePartPrevFLGCONTACONJUNTA: TStringField;
    DsContaCorrentePartPrev: TwwDataSource;
    qryPlanoBenefciario: TwwQuery;
    dsPlanoBenefciario: TwwDataSource;
    qryMessagemFiario: TwwQuery;
    Regra1: TRegra;
    qryVidaFundacao: TwwQuery;
    dsVidaFundacao: TwwDataSource;
    qryVidaFundDet: TwwQuery;
    dsVidaFundDet: TwwDataSource;
    qryVidaFundDetINSCRICAONUMERO: TFloatField;
    qryVidaFundDetPLANO: TStringField;
    qryVidaFundDetFLGDESATIVADO: TStringField;
    qryVidaFundDetINSCRICAODATA: TDateTimeField;
    qryVidaFundDetDATACANCELAMENTO: TDateTimeField;
    qryVidaFundDetDATAINICIOASSIST: TDateTimeField;
    qryVidaFundDetDATAFIMASSIST: TDateTimeField;
    qryDadosTitular: TwwQuery;
    dsDadosTitular: TwwDataSource;
    qryPlanoContabAtivo: TwwQuery;
    dsPlanoContabAtivo: TwwDataSource;
    qryPlanoContabAssist: TwwQuery;
    dsPlanoContabAssist: TwwDataSource;
    QryBuscaCancPlano: TwwQuery;
    qryPlanPrevBenef: TwwQuery;
    dsPlanPrevBenef: TwwDataSource;
    qryPlanPrevBenefINSCRICAONUMERO: TFloatField;
    qryPlanPrevBenefSALMANTIDO: TFloatField;
    qryPlanPrevBenefSALPARTICIPACAO: TFloatField;
    qryPlanPrevBenefIDPLANOPREV: TFloatField;
    qryPlanPrevBenefPLANOPREV: TStringField;
    qryPlanPrevBenefDATAINSCRICAO: TDateTimeField;
    qryPlanPrevBenefDATACANCELAMENTO: TDateTimeField;
    dsContribSitAtualBeneficiario: TwwDataSource;
    qryContribSitAtualBeneficiario: TwwQuery;
    Dsp: TDataSetProvider;
    Cds: TClientDataSet;
    CdsPATRO: TStringField;
    CdsSITPATRO: TStringField;
    CdsMATRICULA: TStringField;
    CdsCLASSIFICACAO: TStringField;
    CdsNOME: TStringField;
    CdsNUMDOCUMENTO: TStringField;
    CdsINSCRICAONUMERO: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsIDPESSJUR: TFloatField;
    CdsIDTITULAR: TFloatField;
    dsRes: TDataSource;
    qryRes: TwwQuery;
    CdsIDSITPART: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsEMAIL: TStringField;
    CdsPLANO: TStringField;
    CdsIDPLANOPREV: TFloatField;
    CdsSEQPROPOSTA: TFloatField;
    procedure qryplanprevAfterScroll(DataSet: TDataSet);
    procedure qryBeneficiosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmconsPart1: TDtmconsPart1;

implementation

uses FConsPart, dConsPart;

{$R *.DFM}

procedure TDtmconsPart1.qryplanprevAfterScroll(DataSet: TDataSet);
begin
  fConsPart.sidplanoprevconspart := dtmConspart1.qryplanPrev.FieldByName('IdPlanoPrev').AsString;
  frmConsPart.AtualizaDadosPlano;
end;

procedure TDtmconsPart1.qryBeneficiosAfterScroll(DataSet: TDataSet);
begin
  dtmConsPart.qryMovBenef.Close;
  dtmConsPart.qryMovBenef.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidTitular, -1);
  dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
  dtmConsPart.qryMovBenef.Open;
end;

end.
