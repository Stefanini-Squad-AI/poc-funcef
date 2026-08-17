unit dCalcEmptmo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwquery;

type
   TdtmCalcEmptmo = class(TDataModule)
      qrySaldoMesAnt: TwwQuery;
      qrySaldoMesAntHMESALDODEV: TFloatField;
      qrySaldoMesAntHMETXJUROS: TFloatField;
      qrySaldoMesAntHMEDATAATUALIZA: TDateTimeField;
      qrySaldoMesAntHMEPARCELA: TFloatField;
      qrySaldoMesAntHMENUMPARCELAS: TFloatField;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntHMEDATAATUALIZA: TDateTimeField;
      qrySaldoAntHMESALDODEV: TFloatField;
      qrySaldoAntHMETXJUROS: TFloatField;
      qrySaldoAntHMEPARCELA: TFloatField;
      qrySaldoAntHMENUMPARCELAS: TFloatField;
      qryParcelasEmAberto: TwwQuery;
      qryItens: TwwQuery;
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
      qryParcelasEmAbertoVALOR_DEVIDO: TFloatField;
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

   private { Private declarations }

   public { Public declarations }

   end;



var
  dtmCalcEmptmo: TdtmCalcEmptmo;



implementation
{$R *.DFM}



end.
