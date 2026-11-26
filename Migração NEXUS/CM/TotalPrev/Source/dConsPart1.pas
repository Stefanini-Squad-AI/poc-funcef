{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-----------------------------------------------------------------------------
Nº SIG:........... 21866
Data da Alteração: 28/09/2016
Responsável......: Michelle Suellyn Mota 
Descrição........: Atualizado qryTelefones - data de inclusao
--------------------------------------------------------------------------------
Pendência   : SOL 269351  PPM 1297538
Responsável : Douglas Siqueira
Data        : 23/2/2016
Descrição   : As contribuições tratadas estão sendo apresentadas na consulta
geral de pessoa  histórico de contribuições. Favor ajustar a consulta incluindo
a condição `AND HST.SITRECEBIMENTO <> 4
--------------------------------------------------------------------------------
Pendência   : SOL 267191  PPM 1233520
Responsável : Peterson Victor
Data        : 11/1/2016
Descrição   : Ajuste da query no qrycontribprev
--------------------------------------------------------------------------------
Pendência   : SOL 253577/17604 PPM 999484
Responsável : Helio Lima Custódio
Descrição   : Inclusão de campos na qryBeneficios
--------------------------------------------------------------------------------
Pendência   : SOL 236032 Kintana 462869
Responsável : Willamy Henrique de Oliveira
Descrição   : Alteração na grafia(apenas dfm)
--------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Pendência   : SOL 201305 Kintana 1958008
Responsável : Fernando Xavier
Data        : 11/03/2013
Descrição   : alterada a qryDadosTitular incluido alter join no PPP.IDPLANOPREV = :IDPLANOPREV
--------------------------------------------------------------------------------
Pendência   : SOL 37791/4261 Kintana 1187530
Responsável : Renato Visoni
Descrição   : Alteração na QryplanPrev.
--------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 149847/7401
Nº KINTANA..: 1529806
Data........: 03/12/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Atualizar o campo MOTRETENC  ( qryMovBenef / qryBeneficios)
-----------------------------------------------------------------------------------------------------
Pendência   : SOL 37791  KINTANA 523676
Responsável : Marcelo Almeida
Data        : 20/10/2010
Descrição   : Incluir na qrycontribprev as informações de cadastros anteriores do participante.
--------------------------------------------------------------------------------
Pendência   : SOL 148127 Kintana 1036903
Responsável : Renato Visoni
Descrição   : Foram Acrescentadas algumas informações no Histórico de Contribuições
              do Previdenciário, foi criada a QryMesCobranca e QryContribuicao,
              e alterada a qrycontribprev.
--------------------------------------------------------------------------------
Pendência   : SOL 153714 Kintana 1162815
Responsável : BRUNO AZEVEDO
Data        : 25/02/2011
Descrição   : Ajuste na qryEnderecos.
--------------------------------------------------------------------------------
Pendência   : SOL 136383 - Kintana 815815
Responsável : Marcelo Almeida
Data        : 28/09/2010
Descrição   : Implementação de uma rotina de registro e gerenciamento de
              revisões realizadas pela COABE.
--------------------------------------------------------------------------------
Pendência   : SOL 136621  KINTANA 824157
Responsável : Fernando Santana
Data        : 02/08/2010
Descrição   : Alteração na qrySitBenefPlano para buscar corretamente a situação
             do beneficíario no plano.
--------------------------------------------------------------------------------
Pendência   : kintana 893944  sol 141432
Responsável : Fernando Santana
Data        : 10/08/2010
Descrição   : A query qryendereco não busca dados das pessoas que não tinha a
             cidade informada.
--------------------------------------------------------------------------------
Pendência   : 23535
Responsável : Daniel Simões
Data        : 26/02/2007
Descrição   : Acerto na exibição dos campos no plano do titular no form
              "Consulta Geral de Pessoas" e ajuste na formatação do campo
              "Salário de Manutenção"...
--------------------------------------------------------------------------------
Pendência   : 18686
Responsável : André Pontes
Data        : 16/05/2005
Descrição   : Os objetos data-aware do FConsPessoaGeral (cds, dts, qry e dsp)
              foram passados para o dtmConsPart1, para permitir persistência do
              resultado da pesquisa.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dConsPart1;

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
    dsRes: TDataSource;
    qryRes: TwwQuery;
    qryplanprevDATAOPCAOIR: TDateTimeField; 
    qryplanprevPATROCINADORA: TStringField;
    qryplanprevTIPOOPCAOIR: TStringField;
    qrySitBenefPlano: TwwQuery;
    dsSitBenefPlano: TDataSource;
    qrycontribprevIDTIPORECURSO: TFloatField;
    qrycontribprevORIGEMRECURSO: TStringField;
    qrycontribprevNOME_2: TStringField;
    CdsIDPESSOA: TFloatField;
    CdsNOME: TStringField;
    CdsPATRO: TStringField;
    CdsSITPATRO: TStringField;
    CdsSITFUND: TStringField;
    CdsIDSITPART: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsEMAIL: TStringField;
    CdsMATRICULA: TStringField;
    CdsPLANO: TStringField;
    CdsIDPLANOPREV: TFloatField;
    CdsSEQPROPOSTA: TFloatField;
    CdsCLASSIFICACAO: TStringField;
    CdsIDPESSJUR: TFloatField;
    CdsIDTITULAR: TFloatField;
    CdsINSCRICAONUMERO: TFloatField;
    CdsNUMDOCUMENTO: TStringField;
    CdsSITUACAONOPLANO: TStringField;
    qryenderecoORDENACAO: TFloatField;
    qryenderecoTIPOENDERECO: TStringField;
    qryplanprevCODPATRO: TFloatField;
    dsMesCobranca: TDataSource;
    QryMesCobranca: TQuery;
    QryContribuicao: TQuery;
    dsContribuicao: TDataSource;
    qryplanprevMATRICULA: TStringField;
    qryBeneficiosVLRBSATUAL: TFloatField;
    qryBeneficiosVLRBSTOTAL: TFloatField;
    qryBeneficiosVLRFABATUAL: TFloatField;
    qryBeneficiosVLRFABTOTAL: TFloatField;
    qryBeneficiosVLRBASEDEFICIT: TFloatField;
    qryBeneficiosFLGAPRESENTABSFAB: TFloatField;
    qryBeneficiosFLGAPRESENTADEFICIT: TFloatField;///SOL 37791/4261 Kintana 1187530
    procedure qryplanprevAfterScroll(DataSet: TDataSet);
    procedure qryBeneficiosAfterScroll(DataSet: TDataSet);
  private
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    vOnQryBeneficiosAntesAfterScroll : TDataSetNotifyEvent;
    vOnQryBeneficiosAfterScroll : TDataSetNotifyEvent;
    procedure SetOnQryBeneficiosAntesAfterScroll(Value : TDataSetNotifyEvent);
    procedure SetOnQryBeneficiosAfterScroll(Value : TDataSetNotifyEvent);
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
  public
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    property OnQryBeneficiosAntesAfterScroll : TDataSetNotifyEvent read vOnQryBeneficiosAntesAfterScroll write SetOnQryBeneficiosAntesAfterScroll;
    property OnQryBeneficiosAfterScroll      : TDataSetNotifyEvent read vOnQryBeneficiosAfterScroll write SetOnQryBeneficiosAfterScroll;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
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
  //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
  if Assigned(vOnQryBeneficiosAntesAfterScroll) then
        vOnQryBeneficiosAntesAfterScroll(DataSet);
  //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484

  //Marcelo Almeida - SOL 136383 - Kintana 815815 - Comentário para alteração da funcionalidade.
  dtmConsPart.qryMovBenef.Close;
  dtmConsPart.qryMovBenef.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidTitular, -1);
  dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
  dtmConsPart.qryMovBenef.Open;
  //Marcelo Almeida - SOL 136383 - Kintana 815815

  //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
  if Assigned(vOnQryBeneficiosAfterScroll) then
        vOnQryBeneficiosAfterScroll(DataSet);
  //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
end; 

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TDtmconsPart1.SetOnQryBeneficiosAfterScroll(Value : TDataSetNotifyEvent);
begin
       vOnQryBeneficiosAfterScroll := Value;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TDtmconsPart1.SetOnQryBeneficiosAntesAfterScroll(Value : TDataSetNotifyEvent);
begin
       vOnQryBeneficiosAntesAfterScroll := Value;
end;

end.

{ QryDadosTitular
SELECT
  PJ.NOME AS PATRO,
  SF.DESCRICAO AS SITUACAONAPATRO,
  SIT.DESCRICAO SITPART,
  PPP.IDPESSJUR
FROM ELEGPATRO EL, SITFUNC SF, SITPART SIT, PARTPREVPLAN PPP, PESSOA PJ
WHERE (EL.IDPESSOA   = :IDTITULAR)
AND   (EL.IDPESSOA   = PPP.IDPESSOA(+))
AND   (EL.IDPESSJUR  = PPP.IDPESSJUR(+))
AND   (SF.IDSITFUNC  = EL.IDSITFUNC)
AND   (PPP.IDSITPART = SIT.IDSITPART(+))
AND   ((PPP.FLGDESATIVADO = 1 AND PPP.IDPESSOA NOT IN
       (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1
        WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND PPP1.IDPESSOA = PPP1.IDPESSOA AND PPP.IDPESSJUR = PPP1.IDPESSJUR
          AND NVL(PPP1.FLGDESATIVADO, 0) = 0 )) OR NVL(PPP.FLGDESATIVADO, 0) = 0)
AND   (EL.IDPESSJUR = PJ.IDPESSOA)


}
