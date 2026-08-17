// Alterações:
{-------------------------------------------------------------------------------
Autor(a)  : Marcos Merola
Data      : 11/10/2011
Pendência : SOL 136386/4901 Kintana 1278330
Rotina    : ppHistPagBeneficio, ppHistPagBeneficioAgrupa,
            rpHistPagBeneficio, rpHistPagBeneficioAgrupa.
Descricao : Alterações no LayOut dos relatórios Agrupado e Normal.;
--------------------------------------------------------------------------------// }
unit DRelatorioHistPagBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppBands, ppClass, ppCtrls, ppReport, ppStrtch, ppSubRpt,
  ppVar, ppPrnabl, ppCache, ppProd, Db, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppModule, daDataModule, ppMemo,
  ppParameter;

type
  TdtmRelatorioHistPagBenef = class(TdtmReports)
    rpHistPagBeneficio: TppReport;
    ppHistPagBeneficio: TppBDEPipeline;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    dsHistPagBeneficio: TwwDataSource;
    qryHistPagBeneficio: TwwQuery;
    qryHistPagBeneficioAgrupa: TwwQuery;
    qryHistPagBeneficioAgrupaMES: TStringField;
    qryHistPagBeneficioAgrupaVALPAGBENEF: TFloatField;
    qryHistPagBeneficioAgrupaVALPAGCONTRIB: TFloatField;
    qryHistPagBeneficioMESREF: TStringField;
    qryHistPagBeneficioMESCOBR: TStringField;
    qryHistPagBeneficioDESCRUBBENEF: TStringField;
    qryHistPagBeneficioRUBBENEF: TStringField;
    qryHistPagBeneficioVALPAGBENEF: TFloatField;
    qryHistPagBeneficioDESCRUBCONTRIB: TStringField;
    qryHistPagBeneficioRUBCONTRIB: TStringField;
    qryHistPagBeneficioVALPAGCONTRIB: TFloatField;
    DSHistPagBeneficioAgrupa: TwwDataSource;
    ppHistPagBeneficioAgrupa: TppBDEPipeline;
    rpHistPagBeneficioAgrupa: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel15: TppLabel;
    ppLine5: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel16: TppLabel;
    ppDBText20: TppDBText;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape2: TppShape;
    ppLine7: TppLine;
    ppLabel21: TppLabel;
    ppLabel25: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine8: TppLine;
    ppLabel29: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    daDataModule2: TdaDataModule;
    ppVariable6: TppVariable;
    ppVariable7: TppVariable;
    ppVariable8: TppVariable;
    ppLabel22: TppLabel;
    ppVariable9: TppVariable;
    ppLabel18: TppLabel;
    ppVariable10: TppVariable;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    ppLabel30: TppLabel;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    rpBoletasDBImage1: TppDBImage;
    rpDBText1: TppDBText;
    rpDBText2: TppDBText;
    rpDBText31: TppDBText;
    rpDBText32: TppDBText;
    rpDBText33: TppDBText;
    rpDBText34: TppDBText;
    rpDBText35: TppDBText;
    rpBoletasLabel24: TppLabel;
    rpDBText36: TppDBText;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape1: TppShape;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel27: TppLabel;
    ppVariable1: TppVariable;
    ppLabel4: TppLabel;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppLabel24: TppLabel;
    ppVariable12: TppVariable;
    ppMemo1: TppMemo;
    ppLabel7: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure rpHistPagBeneficioBeforePrint(Sender: TObject);
    procedure rpHistPagBeneficioAgrupaBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    sAnoMesRefTela, sAnoMesCobrancaTela : string;
    { Public declarations }
  end;

var
  dtmRelatorioHistPagBenef: TdtmRelatorioHistPagBenef;

implementation

uses FConsHistPagBeneficio;

{$R *.DFM}

procedure TdtmRelatorioHistPagBenef.ppHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
   //--Marcos SOL  136386/4901 Kintana 1278330 07/10
   ppvariable12.value   := FrmConsHistPagBeneficio.MontaSelect.ValoresChave[0];
   ppvariable3.Value    := FrmConsHistPagBeneficio.MontaSelect.ValoresChave[2];
   ppvariable1.Value    := dtmRelatorioHistPagBenef.sAnoMesRefTela;
   ppvariable2.Value    := dtmRelatorioHistPagBenef.sAnoMesCobrancaTela;
   ppvariable4.Value    := FrmConsHistPagBeneficio.qryPlano.Fieldbyname('NOME').asString;
end;

procedure TdtmRelatorioHistPagBenef.ppHeaderBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
    //--Marcos SOL  136386/4901 Kintana 1278330 07/10
   if (FrmConsHistPagBeneficio.cbRubBenef.Checked) then begin
    //  ppLabel26.Visible   := False;
   end
   else
   begin
      ppLabel25.Visible   := False;
   end;

   ppvariable6.value    := FrmConsHistPagBeneficio.MontaSelect.ValoresChave[0];
   ppVariable9.value    := FrmConsHistPagBeneficio.MontaSelect.ValoresChave[2];
   ppVariable7.value    := dtmRelatorioHistPagBenef.sAnoMesRefTela;
   ppVariable10.value   := dtmRelatorioHistPagBenef.sAnoMesCobrancaTela;
   ppVariable8.value    := FrmConsHistPagBeneficio.qryPlano.Fieldbyname('NOME').asString;
end;

procedure TdtmRelatorioHistPagBenef.rpHistPagBeneficioBeforePrint(
  Sender: TObject);
  var i : integer;
begin
  inherited;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10
    ppMemo1.Text   := '';

   //Beneficio Checked
   if (FrmConsHistPagBeneficio.cbRubBenef.Checked) then begin
      ppLabel10.Visible   := True;
      ppLabel11.Visible   := True;
      ppLabel12.Visible   := True;

      ppLabel7.Visible    := False;
      ppLabel13.Visible   := False;
      ppLabel14.Visible   := False;
      ppLabel9.Left       := 0.9792;
      ppdbText5.Left      := 1.0313;
   end;

   //Contribuição checked
   if (FrmConsHistPagBeneficio.cbRubContr.Checked) then begin
      ppLabel7.Visible    := True;
      ppLabel13.Visible   := True;
      ppLabel14.Visible   := True;

      ppLabel10.Visible   := false;
      ppLabel11.Visible   := false;
      ppLabel12.Visible   := false;

      ppLabel7.Left       := ppLabel10.Left;
      ppLabel13.Left      := ppLabel11.Left;
      ppLabel14.Left      := ppLabel12.Left;

      ppDBText10.Left     := ppDBText11.Left;
      ppDBText9.Left      := ppDBText6.Left;
      ppDBText8.Left      := ppDBText7.Left;
   end;

   //--Marcos Merola SOL  136386/4901 Kintana 1278330 25/10 inicio
   //Beneficio Checked   e    //Contribuição checked
   if (FrmConsHistPagBeneficio.cbRubBenef.Checked) and
      (FrmConsHistPagBeneficio.cbRubContr.Checked) then begin
      ppLabel10.Visible   := True;
      ppLabel11.Visible   := True;
      ppLabel12.Visible   := True;

      ppLabel7.Visible    := True;
      ppLabel13.Visible   := True;
      ppLabel14.Visible   := True;
      ppLabel9.Left       := 0.9583;
      ppDBText5.Left      := 1.0313;

      ppLabel7.Left       := 6.5625;
      ppLabel13.Left      := 7.6146;
      ppLabel14.Left      := 10.1875;

      ppDBText10.Left     := 6.5625;
      ppDBText9.Left      := 7.6354;
      ppDBText8.Left      := 10.1979;
    end;
    //--Marcos Merola SOL  136386/4901 Kintana 1278330 25/10 fim

    FrmConsHistPagBeneficio.qrybeneficio.first;
    while not(FrmConsHistPagBeneficio.qrybeneficio.eof) do
    begin
       ppMemo1.Lines.Add(FrmConsHistPagBeneficio.qrybeneficio.fieldbyname('Beneficio').asstring);
       FrmConsHistPagBeneficio.qrybeneficio.next;
    end;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10
end;

procedure TdtmRelatorioHistPagBenef.rpHistPagBeneficioAgrupaBeforePrint(Sender: TObject);
begin
  inherited;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 11/10
   ppMemo2.Text   := '';

   FrmConsHistPagBeneficio.qryBeneficio.First;

   While not (FrmConsHistPagbeneficio.qrybeneficio.eof) do
   begin
      ppMemo2.Lines.Add(FrmConsHistPagBeneficio.qryBeneficio.Fieldbyname('Beneficio').asString);
      FrmConsHistPagbeneficio.QryBeneficio.next;
   end;

   //Beneficio Checked
   if (FrmConsHistPagBeneficio.cbRubBenef.Checked) then begin
      ppLabel25.Visible   := True;
      ppLabel30.Visible   := False;
   end;

   //Contribuição checked
   if (FrmConsHistPagBeneficio.cbRubContr.Checked) then begin
      ppLabel25.Visible   := False;
      ppLabel30.Visible   := True;
   end;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 11/10

   //--Marcos Merola SOL  136386/4901 Kintana 1278330 26/10 inicio
   //Beneficio Checked   e    //Contribuição checked
   if (FrmConsHistPagBeneficio.cbRubBenef.Checked) and
      (FrmConsHistPagBeneficio.cbRubContr.Checked) then begin
      ppLabel25.Visible   := True;
      ppLabel30.Visible   := True;
   end;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 26/10 fim
        
end;

end.




