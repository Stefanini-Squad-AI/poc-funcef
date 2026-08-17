// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelbenHistSINT e qryrelbenhistANAL filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit drelbenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE,uSistema, UAdmPrevFB;

type
  TdtmRelBenef = class(TdtmReports)
    qryRelbenHistSINT: TwwQuery;
    dsRelbenhistSINT: TwwDataSource;
    RelbenhistSINT: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    RelResFolhaLabel1: TppLabel;
    RelResFolhaLine1: TppLine;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1FooterBand1: TppFooterBand;
    RelResFolhaGroup1: TppGroup;
    RelResFolhaGroupHeaderBand1: TppGroupHeaderBand;
    RelResFolhaGroupFooterBand1: TppGroupFooterBand;
    RelResFolhaGroup2: TppGroup;
    RelResFolhaGroupHeaderBand2: TppGroupHeaderBand;
    RelResFolhaGroupFooterBand2: TppGroupFooterBand;
    pipeRelbenhistsINT: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    pipeRelbenHistANAL: TppBDEPipeline;
    qryrelbenhistANAL: TwwQuery;
    relbenhistANAL: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText2: TppDBText;
    dsrelbenhistANAL: TwwDataSource;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    VERSAO: TppLabel;
    ppLabel9: TppLabel;
    rpBenefAlterDBCalc1: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppDBText10: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    function MostraParam(Form: string): boolean; override;
    procedure qryrelbenhistANALBeforeOpen(DataSet: TDataSet);
    procedure qryRelbenHistSINTBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure pAbreFundacao;
  public
    { Public declarations }
    tiporelhistbenef : Integer;
  end;

var
  dtmRelBenef: TdtmRelBenef;

implementation

uses FParamRelBenefHist;

{$R *.DFM}

procedure TdtmRelBenef.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

function TdtmRelBenef.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     If UPPERCASE(Form) = 'RELBENHISTSINT' then
        begin
             tiporelhistbenef  := 0;
             frm := TFrmPRelHistBen.Create(Application);
             frm.HelpContext := 180080;
        end
     else if UPPERCASE(Form) = 'RELBENHISTANAL' then
        begin
           tiporelhistbenef  := 1;
           frm := TFrmPRelHistBen.Create(Application);
           frm.HelpContext := 180079;
        end
     else frm := nil;

     if frm = nil then Result := true
     else
      begin
        with frm do
         begin
           Result := (ShowModal = mrOk);
           free;
         end;
      end;
end;

procedure TdtmRelBenef.qryrelbenhistANALBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelBenef.qryRelbenHistSINTBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14483                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDAÇÃO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}

