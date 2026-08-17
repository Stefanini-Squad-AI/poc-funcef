unit dRelEstruturaRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE,FPRelEstruturaRubrica;

type
  TdtmRelEstruturaRubricas = class(TdtmReports)
    pplEstrutura: TppBDEPipeline;
    dsEstrutura: TwwDataSource;
    qryEstrutura: TwwQuery;
    ppEstrutura: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryEstruturaIDESTRUTURA: TFloatField;
    qryEstruturaIDREGRA: TFloatField;
    qryEstruturaIDRUBRICAEXIBICAO: TFloatField;
    qryEstruturaDESCRICAO: TStringField;
    qryEstruturaIDRUBRICA: TFloatField;
    qryEstruturaGRUPOCALCULO: TStringField;
    qryEstruturaNOMEREGRA: TStringField;
    qryEstruturaRUBESTRUTURA: TStringField;
    qryEstruturaRUBESTXRUB: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    ppfundacao: TppBDEPipeline;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    rpBenefAlterDBImage1: TppDBImage;
    rpBenefAlterDBText9: TppDBText;
    rpBenefAlterDBText10: TppDBText;
    rpBenefAlterDBText11: TppDBText;
    rpBenefAlterLabel9: TppLabel;
    rpBenefAlterDBText13: TppDBText;
    rpBenefAlterDBText14: TppDBText;
    rpBenefAlterDBText16: TppDBText;
    ppLabel1: TppLabel;
    qryEstruturaCODPROVDESC: TStringField;
    ppLabel2: TppLabel;
    ppDBText8: TppDBText;
     function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelEstruturaRubricas: TdtmRelEstruturaRubricas;

implementation

{$R *.DFM}
 function TdtmRelEstruturaRubricas.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UpperCase(Form) = 'FRMPRELESTRUTURARUBRICA' Then
    Frm := TfrmPRelEstruturaRubrica.Create(Application)
   else
    frm:=nil;

  If Frm = Nil Then
    Result := True
  Else
  Begin
    With Frm Do
    Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;
end.
