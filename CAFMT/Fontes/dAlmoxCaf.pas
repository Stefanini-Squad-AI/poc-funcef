unit dAlmoxCaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmAlmoxCaf = class(TDataModule)
    qryRegistraBensPend: TwwQuery;
    qryParamCaf: TwwQuery;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafGERARREQMAT: TFloatField;
    qryParamCafDATAULTDEP: TDateTimeField;
    qryParamCafDATARECALCDEP: TDateTimeField;
    qryParamCafDTAULTALUG: TDateTimeField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafEDITACODGRUPO: TFloatField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafDATAINICIAL: TDateTimeField;
    qryParamCafULTTXTCONTAB: TDateTimeField;
    qryParamCafFLGCALCCM: TFloatField;
    qryParamCafFLGTIPOCALC: TStringField;
    qryParamCafMASCARACLASSE: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryParamCafPLANOVIGENTE: TFloatField;
    qryParamCafFLGREAVAL: TStringField;
    qryParamCafTIPOPERCTB: TStringField;
    qryParamCafFLGREMOVEPLANCTB: TStringField;
    qryParamCafATIVPROJETO: TFloatField;
    qryParamCafPROXIMAPLACA: TFloatField;
    qryParamCafFLGCLSDESBEM: TFloatField;
    qryAux: TwwQuery;
    qryBem: TwwQuery;
    qryBemIDBEM: TFloatField;
    qryBemIDPESSOA: TFloatField;
    qryBemIDCONJUNTO: TFloatField;
    qryBemIDTERCEIRO: TFloatField;
    qryBemIDGRUPO: TFloatField;
    qryBemCODSUBCONTA: TFloatField;
    qryBemIDCLASSEBEM: TFloatField;
    qryBemIDMODULO: TFloatField;
    qryBemIDITENSRECDEV: TFloatField;
    qryBemIDFORNSERV: TFloatField;
    qryBemIDSITUACAO: TFloatField;
    qryBemIDIMAGEM: TFloatField;
    qryBemREGISTRO: TStringField;
    qryBemCONTROLE: TStringField;
    qryBemPLACA: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemIDNOTA: TStringField;
    qryBemCOMPLNOTA: TStringField;
    qryBemDTANOTA: TDateTimeField;
    qryBemNUMSERIE: TStringField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemVALHISTORICO: TFloatField;
    qryBemVALORG: TFloatField;
    qryBemCMBEM: TFloatField;
    qryBemVALFIS: TFloatField;
    qryBemVALGER: TFloatField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemVALDEPINI: TFloatField;
    qryBemTAXADEP: TFloatField;
    qryBemDEPLANC: TFloatField;
    qryBemCMDEP: TFloatField;
    qryBemDEPFIS: TFloatField;
    qryBemDEPGER: TFloatField;
    qryBemDATAULTDEP: TDateTimeField;
    qryBemDATARECALCDEP: TDateTimeField;
    qryBemFLGDEPREC: TFloatField;
    qryBemPROPBAIXA: TFloatField;
    qryBemBAIXATOTAL: TStringField;
    qryBemVALCTB: TFloatField;
    qryBemIDOPCIONAL: TStringField;
    qryBemUNIDNEGOC: TFloatField;
    updBem: TUpdateSQL;
    qryEstornaValMov: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qryEstornaBem: TwwQuery;
    qryEstornaBensPend: TwwQuery;
    qryExcluiItemRecDev: TwwQuery;
    qrySituacao: TwwQuery;
    procedure dtmAlmoxCafCreate(Sender: TObject);
    procedure dtmAlmoxCafDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAlmoxCaf: TdtmAlmoxCaf;

implementation

{$R *.DFM}

procedure TdtmAlmoxCaf.dtmAlmoxCafCreate(Sender: TObject);
begin
   qryBem.Close;
   qryParamCaf.Close;
   qryAux.Close;
end;
//========================================================================================
procedure TdtmAlmoxCaf.dtmAlmoxCafDestroy(Sender: TObject);
begin
   qryBem.Close;
   qryParamCaf.Close;
   qryAux.Close;
   //-------------------------------------------------------------------------------------
   qryBem.UnPrepare;
   qryParamCaf.UnPrepare;
   qryAux.UnPrepare;
   qryRegistraBensPend.UnPrepare;
   qryEstornaBem.UnPrepare;
   qryEstornaBensPend.UnPrepare;
   qryEstornaValMov.UnPrepare;
   qryExcluiItemRecDev.UnPrepare;
end;

end.
