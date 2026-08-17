unit DInterface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TdtmInterface = class(TDataModule)
    qryEscreveRubrica: TwwQuery;
    qryCodProvDesc: TwwQuery;
    qryTmpDesc: TwwQuery;
    qryUpdTmpDesc: TwwQuery;
    qryRubricasPatro: TwwQuery;
    qrySalPart: TwwQuery;
    qrySalBenef: TwwQuery;
    qrySalario: TwwQuery;
    qryDatas: TwwQuery;
    qryCodProvDescCODPROVDESC: TStringField;
    qryRubricasPatroIDRUBSALBENEFICIO: TFloatField;
    qryRubricasPatroIDREGRASALBENEFI: TFloatField;
    qryRubricasPatroIDRUBREMTOTAL: TFloatField;
    qryRubricasPatroIDREGRAREMTOTAL: TFloatField;
    qryRubricasPatroIDREGRACALCSALPA: TFloatField;
    qryRubricasPatroIDRUBSALPARTICIP: TFloatField;
    qryRubricasPatroIDRUBSALMANUT: TFloatField;
    qryRubricasPatroIDRUBSALMANUTPARC: TFloatField;
    qryRubricasPatroIDRUBSALAUXDOENCA: TFloatField;
    qryTmpDescVALOR: TFloatField;
    qryTmpDescORDEM: TFloatField;
    qryTmpDescFLGTIPODESC: TStringField;
    qryTmpDescFLGDESCFOLHA: TStringField;
    qryTmpDescMESREFERENCIA: TStringField;
    qryTmpDescMESCOBRANCA: TStringField;
    qryTmpDescIDLOTE: TFloatField;
    qrySalPartIDPESSOA: TFloatField;
    qrySalPartMESCOBRANCA: TStringField;
    qrySalPartIDMOTIVO: TFloatField;
    qrySalPartMES: TStringField;
    qrySalPartIDPESSJUR: TFloatField;
    qrySalPartREFERENCIA: TStringField;
    qrySalPartIDRUBRICA: TFloatField;
    qrySalPartCODPROVDESC: TStringField;
    qrySalPartCODMOEDA: TFloatField;
    qrySalPartVALORPROVENTO: TFloatField;
    qrySalPartIDREGRACALCULO: TFloatField;
    qrySalPartFLGCOMPOESALPART: TFloatField;
    qrySalPartFLGCOMPOESALBENEF: TFloatField;
    qrySalPartFLGIRRF: TFloatField;
    qrySalPartVALORCOTAS: TFloatField;
    qrySalarioIDPESSOA: TFloatField;
    qrySalarioMESCOBRANCA: TStringField;
    qrySalarioIDMOTIVO: TFloatField;
    qrySalarioMES: TStringField;
    qrySalarioIDPESSJUR: TFloatField;
    qrySalarioREFERENCIA: TStringField;
    qrySalarioIDRUBRICA: TFloatField;
    qrySalarioCODPROVDESC: TStringField;
    qrySalarioCODMOEDA: TFloatField;
    qrySalarioVALORPROVENTO: TFloatField;
    qrySalarioIDREGRACALCULO: TFloatField;
    qrySalarioFLGCOMPOESALPART: TFloatField;
    qrySalarioFLGCOMPOESALBENEF: TFloatField;
    qrySalarioFLGIRRF: TFloatField;
    qrySalarioVALORCOTAS: TFloatField;
    qryDatasIDPESSJUR: TFloatField;
    qryDatasSITFUNDACAO: TStringField;
    qryDatasDIACOBNORMAL: TFloatField;
    qryDatasIDPLANOPREV: TFloatField;
    qryDatasFLGUTILNORMAL: TStringField;
    qryDatasFLGANTERIORNORMAL: TStringField;
    qryDatasFLGMESCOBNORMAL: TStringField;
    qrySalBenefIDPESSOA: TFloatField;
    qrySalBenefMESCOBRANCA: TStringField;
    qrySalBenefIDMOTIVO: TFloatField;
    qrySalBenefMES: TStringField;
    qrySalBenefIDPESSJUR: TFloatField;
    qrySalBenefREFERENCIA: TStringField;
    qrySalBenefIDRUBRICA: TFloatField;
    qrySalBenefCODPROVDESC: TStringField;
    qrySalBenefCODMOEDA: TFloatField;
    qrySalBenefVALORPROVENTO: TFloatField;
    qrySalBenefIDREGRACALCULO: TFloatField;
    qrySalBenefFLGCOMPOESALPART: TFloatField;
    qrySalBenefFLGCOMPOESALBENEF: TFloatField;
    qrySalBenefFLGIRRF: TFloatField;
    qrySalBenefVALORCOTAS: TFloatField;
    qryMantidos1: TwwQuery;
    qryMantidos2: TwwQuery;
    qryMantidos1IDPESSOA: TFloatField;
    qryMantidos1IDPESSJUR: TFloatField;
    qryMantidos1IDPLANOPREV: TFloatField;
    qryMantidos1FLGSALVIRTBENEF: TFloatField;
    qryMantidos1SALMANTIDO: TFloatField;
    qryMantidos1SALAUXDOENCA: TFloatField;
    qryMantidos1FLGINTERNO: TStringField;
    qryMantidos1MATRICULA: TStringField;
    qryMantidos2IDPESSOA: TFloatField;
    qryMantidos2IDPESSJUR: TFloatField;
    qryMantidos2IDPLANOPREV: TFloatField;
    qryMantidos2FLGSALVIRTBENEF: TFloatField;
    qryMantidos2SALMANTIDO: TFloatField;
    qryMantidos2SALAUXDOENCA: TFloatField;
    qryMantidos2FLGINTERNO: TStringField;
    qryMantidos2MATRICULA: TStringField;
    qryUpdCtrlInterf1: TwwQuery;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    qryUpdCtrlInterf2: TwwQuery;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    qryInsTmpDesc: TwwQuery;
    qryContribRubrica: TwwQuery;
    qryTmpDescIDDESCONTO: TFloatField;
    qryTmpDescNUMPRIORIDADE: TFloatField;
    qryTmpDescIDPESSOA: TFloatField;
    qryTmpDescPrev: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    qryAux: TwwQuery;
    qryGravaRubricas: TwwQuery;
    qryTmpDescIDPESSJUR: TFloatField;
    qryTmpDescIDPLANOPREV: TFloatField;
    qryTmpDescSEQPROPOSTA: TFloatField;
    qryTmpDescIDCONTRIBUICAO: TFloatField;
    qryTmpDescIDPROVENTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmInterface: TdtmInterface;

implementation

{$R *.DFM}

end.
