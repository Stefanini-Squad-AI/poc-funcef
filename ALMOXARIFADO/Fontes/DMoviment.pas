unit DMoviment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, CMSQLScript;

type
  TDtmMoviment = class(TDataModule)
    qryTestaValdiade: TwwQuery;
    qryInfoSaldoRep: TwwQuery;
    qryTestaValdiadeLOTEVALIDADE: TStringField;
    qryVerifIntContab: TwwQuery;
    qryVerifIntContabDATAULTINTEGRA: TDateTimeField;
    qryVerifDtInvent: TwwQuery;
    qryVerifDtInventDATAULTINVENTARIO: TDateTimeField;
    qryVerifDtRepresa: TwwQuery;
    qryVerifDtRepresaDATAREPRESA: TDateTimeField;
    qryCalcSaldo: TwwQuery;
    qryCalcSaldoSALDOQTDE: TFloatField;
    qryInsertSaldo: TwwQuery;
    qryUpdSaldo: TwwQuery;
    qryCalcCustoMed: TwwQuery;
    qryCalcCustoMedCUSTOMEDIO: TFloatField;
    qryCalcCustoMedSALDOQTDEUC: TFloatField;
    qryUpdCustoMed: TwwQuery;
    qryInsertCustoMed: TwwQuery;
    qryInsertMov: TwwQuery;
    qrySaldo: TwwQuery;
    qryCustoMed: TwwQuery;
    qryCustoMedCODCUSTEIO: TFloatField;
    qryCustoMedCUSTOMEDIOMOV: TFloatField;
    qrySaldoSALDO: TFloatField;
    qryMoviment: TwwQuery;
    qryMovimentIDMOV: TFloatField;
    qryMovimentCODTIPOMOV: TStringField;
    qryMovimentCODARTIGO: TStringField;
    qryMovimentCODALMOXARIFADO: TFloatField;
    qryMovimentDATAMOV: TDateTimeField;
    qryMovimentQTDEMOV: TFloatField;
    qryMovimentVALORMOV: TFloatField;
    qryMovimentCUSTOMEDIOMOV: TFloatField;
    qryMovimentSALDOQTDEMOV: TFloatField;
    qryMovimentIDPESSOA: TFloatField;
    qryMovimentCODALMOXTRANSF: TFloatField;
    qryEntraLoteVali: TwwQuery;
    qryEntraLoteValiSALDOLOTE: TFloatField;
    qryEntraLoteValiCODARTIGO: TStringField;
    qryEntraLoteValiCODALMOXARIFADO: TFloatField;
    qryEntraLoteValiDATAVALIDADE: TDateTimeField;
    updEntraLoteVali: TUpdateSQL;
    qrySaiLoteVali: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    updSaiLoteVali: TUpdateSQL;
    qryDataTrava: TwwQuery;
    qryFatorCM: TwwQuery;
    qryFatorCusto: TwwQuery;
    qryFatorCustoFATOR: TFloatField;
    qryFatorCustoLOTEVALIDADE: TStringField;
    qryFatorCustoCODMEDCUSTO: TStringField;
    qryUpdValores: TwwQuery;
    qrySaldoRep: TwwQuery;
    qryAtuSaldo: TwwQuery;
    qrySaldoRepSALDO: TFloatField;
    qryAtuSaldoIDMOV: TFloatField;
    qryAtuSaldoDATAMOV: TDateTimeField;
    qryAtuSaldoQTDEMOV: TFloatField;
    qryAtuSaldoSALDOQTDEMOV: TFloatField;
    qryUltDataMovRep: TwwQuery;
    qryUpdMov: TwwQuery;
    qryInfoSaldoMov: TwwQuery;
    qryInfoSaldoRepSALDOQTDE: TFloatField;
    qryInfoSaldoMovSALDOQTDEMOV: TFloatField;
    qryUpdSaldoMov: TwwQuery;
    qryUpdMovVal: TwwQuery;
    qryAtuPrecoSug: TwwQuery;
    updAtuPrecoSug: TUpdateSQL;
    qryAtuPrecoSugCODARTIGO: TStringField;
    qryAtuPrecoSugVLRCUSTO: TFloatField;
    qryAtuPrecoSugPERCLUCRO: TFloatField;
    qryAtuPrecoSugPRECOSUG: TFloatField;
    qryCustoArt: TwwQuery;
    qryCustoArtCODARTIGO: TStringField;
    qryCustoArtCUSTOMEDIO: TFloatField;
    qryCustoArtCUSTOREP: TFloatField;
    qryAtuPrecoSugFATOR: TFloatField;
    qryModChef: TwwQuery;
    qryModChefCODARTIGOBUFFET: TStringField;
    qryModChefBUFFETQTDPREVISTA: TFloatField;
    qryModChefCODARTIGO: TStringField;
    qryModChefQTDE: TFloatField;
    updModChef: TUpdateSQL;
    qryModChefVLRCUSTO: TFloatField;
    qryModChefPRECOSUG: TFloatField;
    qryModChefIDMODCHEFBUFFET: TFloatField;
    qryMovimentFLGENTRADACUSTO: TStringField;
    qryFichaTec: TwwQuery;
    qryFichaTecCODARTIGOSEC: TStringField;
    qryFichaTecQTDE: TFloatField;
    qryFichaTecCODARTIGOPRINC: TStringField;
    qryFichaTecVLRCUSTO: TFloatField;
    qryUpdFichaTec: TwwQuery;
    procedure DtmMovimentCreate(Sender: TObject);
    procedure DtmMovimentDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmMoviment: TDtmMoviment;

implementation

{$R *.DFM}

procedure TDtmMoviment.DtmMovimentCreate(Sender: TObject);
Var
    x : Integer;
Begin
   For x := 0 To ComponentCount - 1 Do
     Begin
        IF (Components[x] is TwwQuery) Then
           Begin
              If Not (Components[x] as TwwQuery).Prepared Then
                 (Components[x] as TwwQuery).Prepare;
           End;
     End;
End;

procedure TDtmMoviment.DtmMovimentDestroy(Sender: TObject);
Var
    x : Integer;
Begin
  For x := 0 To ComponentCount - 1 Do
    Begin
       IF (Components[x] is TwwQuery) Then
          Begin
             (Components[x] as TwwQuery).Close;
             If (Components[x] as TwwQuery).Prepared Then
                (Components[x] as TwwQuery).Unprepare;
          End;
    End;
end;

end.
