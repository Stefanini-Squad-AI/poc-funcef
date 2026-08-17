unit dEventoImovel;

interface
                                                       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type

  TdtmEventoImovel = class(TDataModule)
    qryMarcaRescisao: TwwQuery;
    qryInsertEventoImovel: TwwQuery;
    qryInsertEventoImovelIDREAJUSTECONIMO: TFloatField;
    qryInsertEventoImovelIDIMOVEL: TFloatField;
    qryInsertEventoImovelIDCONTRATOIMOVEL: TFloatField;
    qryInsertEventoImovelRCODATA: TDateTimeField;
    qryInsertEventoImovelFLGTIPOREAJUSTE: TStringField;
    qryInsertEventoImovelRCOVLRALUGUEL: TFloatField;
    qryInsertEventoImovelRCOVLRCONTRATO: TFloatField;
    qryInsertEventoImovelRCOMOTIVO: TStringField;
    qryInsertEventoImovelRCODATAPROXIMO: TDateTimeField;
    qryEventoImovel: TwwQuery;
    qryEventoImovelIDEVENTOIMOVEL: TFloatField;
    qryEventoImovelIDIMOVEL: TFloatField;
    qryEventoImovelEVIDATA: TDateTimeField;
    qryEventoImovelEVICABECALHO: TStringField;
    qryEventoImovelEVIDESCRICAO: TMemoField;
    qryEventoImovelIDUSUARIO: TFloatField;
    qryEventoImovelNOME_MESTRE: TStringField;
    qryEventoImovelNOME_IMOVEL: TStringField;
    qryEventoImovelIMOVEL_EXTENSO: TStringField;
    qryEventoImovelIMOCODIGO: TStringField;
    qryEventoImovelIMOMATRICULA: TStringField;
    qryEventoImovelCONNUMERO: TStringField;
    qryEventoImovelCONNOME: TStringField;
    qryEventoImovelNOMEUSUARIO: TStringField;
    qryEventoImovelNOME: TStringField;
    qryDeleteEventoImovel: TwwQuery;
    qryUpdateEventoImovel: TwwQuery;
    qryUpdateSituacao: TwwQuery;

  private { Private declarations }

  public { Public declarations }

  end;



var
  dtmEventoImovel: TdtmEventoImovel;



implementation
{$R *.DFM}




end.
