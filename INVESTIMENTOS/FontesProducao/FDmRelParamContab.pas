//******************************************************************************
// Data      : 28/09/2007
// Código    : AL_2
// Pendencia : 26386
// SOL       :
// Motivo    : Implementação do Plano/Patrocinadora
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_1
// Pendencia : 21303
// SOL       : 20264
// Motivo    : Implementação da identificação do usuário que cadastrou ou alterou
//             o registro
//******************************************************************************

unit FDmRelParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;
                                                                                   
type
  TDmRelParamContab = class(TDmRelatoriosInv)
    QryContabil: TwwQuery;
    QryContabilTIPOINVESTIMENTO: TStringField;
    QryContabilDESCTITULO: TStringField;
    QryContabilCODTIPTITULO: TStringField;
    QryContabilHISTORICO: TStringField;
    QryContabilTIPOLANCTO: TStringField;
    QryContabilTIPDESCRICAO: TStringField;
    QryContabilTIPODESEMBOLSO: TStringField;
    QryContabilCENTRORESP: TStringField;
    QryContabilCENCUSTDINVEST: TStringField;
    QryContabilCODSUBCONTAD: TFloatField;
    QryContabilCONTADEBITO: TStringField;
    QryContabilNOMECTADEBITO: TStringField;
    QryContabilCODSUBCONTAC: TFloatField;
    QryContabilCENCUSTCINVEST: TStringField;
    QryContabilCONTACREDITO: TStringField;
    QryContabilNOMECTACREDITO: TStringField;
    QryContabilDESCCLASSETIT: TStringField;
    QryContabilDESCITEMRENFIX: TStringField;
    QryContabilDESCTIPODESPINV: TStringField;
    QryContabilDESCTIPOOPERACAO: TStringField;
    QryContabilDESCCARTINVEST: TStringField;
    BdeContabil: TppBDEPipeline;
    DsContabil: TwwDataSource;
    RptContabil: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel103: TppLabel;
    ppLabel220: TppLabel;
    ppLCarteiraContabil: TppLabel;
    ppLabel224: TppLabel;
    ppDBImage3: TppDBImage;
    ppLPeriodoContabil: TppLabel;
    ppDetailBand29: TppDetailBand;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppLine142: TppLine;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppDBText135: TppDBText;
    RptContabilLabel277: TppLabel;
    ppDBText134: TppDBText;
    ppDBDescClasseTit: TppDBText;
    ppDBText115: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine143: TppLine;
    ppLabel276: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable21: TppSystemVariable;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppDBText120: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    QryAux1: TwwQuery;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    QryContabilNOMEUSUARIO: TStringField;
    shpPosFundosCab: TppShape;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel270: TppLabel;
    ppLabel271: TppLabel;
    ppLabel272: TppLabel;
    ppLabel269: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLine7: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppDBText2: TppDBText;
    QryContabilPLANPRVCONTABPATRO: TStringField;
    ppDBDescTitulo: TppDBText;
    ppLine1: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine22: TppLine;
    ppLabel3: TppLabel;
    ppLine5: TppLine;
    ppLine14: TppLine;
    ppLine20: TppLine;
    procedure ppDetailBand29BeforePrint(Sender: TObject);
    procedure RptContabilBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelParamContab: TDmRelParamContab;

implementation

{$R *.DFM}

uses UBibliotecaInvest, USistema;

procedure TDmRelParamContab.ppDetailBand29BeforePrint(Sender: TObject);
begin
  inherited;
   // AL_2
   RptContabilLabel277.Visible := True;
   if Trim(QryContabilDESCITEMRENFIX.AsString) <> '' then
      RptContabilLabel277.Caption := QryContabilDESCTIPOOPERACAO.AsString + ' - ' + QryContabilDESCITEMRENFIX.AsString
   else
      RptContabilLabel277.Caption := QryContabilDESCTIPOOPERACAO.AsString;
   ppDBText135.Visible := False;

end;

procedure TDmRelParamContab.RptContabilBeforePrint(Sender: TObject);
begin
  inherited;
   QryAux1.SQL.Clear;
   QryAux1.SQL.Text := 'SELECT MASCARA,PARAMCONTAB.PLANO '+
                       'FROM  PLANO, PARAMCONTAB '+
                       'WHERE PARAMCONTAB.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+
                       'AND  PLANO.PLANO=PARAMCONTAB.PLANO';
   QryAux1.Open;
   ppDBText126.DisplayFormat :=
                               QryAux1.FieldByName('MASCARA').AsString + ';0; ';
   ppDBText127.DisplayFormat :=
                               QryAux1.FieldByName('MASCARA').AsString + ';0; ';
   QryAux1.Close;
end;

end.
