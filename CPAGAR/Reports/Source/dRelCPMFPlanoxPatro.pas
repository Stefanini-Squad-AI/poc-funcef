unit dRelCPMFPlanoxPatro;

//========================================================================
//  Autor     : Marcus Oliveira
//  Data      : 11/05/2007
//  Pendência : 25233
//  Descrição : A data da emissão foi corrigida, estava passando a data de
//              emissão do documento e o correto é data de emissão do pagamento
//              (Lote ou baixa de documento)
//
//========================================================================
//
//  Autor     : Rodolpho da Silva
//  Data      : 18/02/2005
//  Pendência : 18544
//  Descrição : Ordernar a qry de CMPF por data de geração
//
//========================================================================




interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uCmSqlParams, uSistema, DBClient, uCMClientDataSet;

type
  TdtmRelCPMFPlanoxPatro = class(TdtmReports)
    pplLogoEmpresa: TppDBPipeline;
    CdsLogoEmpresa: TCMClientDataSet;
    SqlLogoEmpresa: TCMSqlParams;
    dsLogoEmpresa: TwwDataSource;
    dsCPMFPlano: TwwDataSource;
    SqlCPMFPlano: TCMSqlParams;
    CdsCPMFPlano: TCMClientDataSet;
    pplCPMFPLano: TppDBPipeline;
    rptCPMFPlano: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDbLogo: TppDBImage;
    ppLbEmpresa: TppLabel;
    ppLbTituloRelatorio: TppLabel;
    ppLbPeriodo: TppLabel;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLbNomeSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppShape2: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppLine5: TppLine;
    ppDBText10: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppShpCorLinha: TppShape;
    ppLbPlano: TppLabel;
    ppLbPatro: TppLabel;
    ppLbContaBancaria: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine6: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel12: TppLabel;
    procedure ppLbEmpresaPrint(Sender: TObject);
    procedure ppLbNomeSistemaPrint(Sender: TObject);
    procedure ppShpCorLinhaPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelCPMFPlanoxPatro: TdtmRelCPMFPlanoxPatro;

implementation

uses cRelCPFMPlanoxPatro;

{$R *.DFM}

function TdtmRelCPMFPlanoxPatro.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelcpmfplanoxpatro') then
   begin

      frm := tcfgRelCPMFPlanoxPatro.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;




procedure TdtmRelCPMFPlanoxPatro.ppLbEmpresaPrint(Sender: TObject);
begin
  inherited;
  ppLbEmpresa.Caption := Sistema.NomeEmpresa;
end;



procedure TdtmRelCPMFPlanoxPatro.ppLbNomeSistemaPrint(Sender: TObject);
begin
  inherited;
  ppLbNomeSistema.Caption := Sistema.NomeCompleto;
end;



procedure TdtmRelCPMFPlanoxPatro.ppShpCorLinhaPrint(Sender: TObject);
begin
  inherited;
  if ppShpCorLinha.Brush.Color = clWhite then
     ppShpCorLinha.Brush.Color := $00C6FFC6
  else
     ppShpCorLinha.Brush.Color := clWhite;   

end;



end.
