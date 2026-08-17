unit RValoresCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, Db, DBClient, uCMClientDataSet, ppDB, ppDBPipe,
  ppVar, ppCtrls, ppPrnabl, ppBands, ppCache, uCtrlRelatoriosCAPCAR,
  uCtrlPadroes, uSistema, uCtrlParamIntegra;

type
  TRptValoresCCusto = class(TFrmCmReport)
    Rpt: TppReport;
    Cds: TCMClientDataSet;
    ppl: TppDBPipeline;
    ds: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    LbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    CdsLogo: TCMClientDataSet;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    LbFornCli: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBImage1: TppDBImage;
    ppLabel9: TppLabel;
    LbEmpresa: TppLabel;
    pplLogo: TppDBPipeline;
    dsLogo: TDataSource;
    ppLabel10: TppLabel;
    ppDBText12: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel11: TppLabel;
    LbAdicionais: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppShape3: TppShape;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppDBCalc4: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelatoriosCAPCAR : TCtrlRelatoriosCAPCAR;
  public
    { Public declarations }
  end;

var
  RptValoresCCusto: TRptValoresCCusto;

implementation

{$R *.DFM}




procedure TRptValoresCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.InitializeAs(Padroes);

  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('SELECT');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('   CODCENTROCUSTO,');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('   NOME');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('FROM');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('   CENTCUST');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('WHERE ATIVO = ''S''');
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Add('ORDER BY NOME');
end;




procedure TRptValoresCCusto.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelatoriosCAPCAR);
end;




procedure TRptValoresCCusto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  LbAdicionais.Caption := '';

  case ParamIntegra.RecPag of
    'R': LbFornCli.Caption := 'Cliente';
    'P': LbFornCli.Caption := 'Fornecedor';
  end;
   
  if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
     LbAdicionais.Caption := 'Centro de Custo: ' + Trim(CmpRptCM.ParamValues[0].AsString) + '     ';


  if CmpRptCM.ParamValues[1].AsInteger <> 0 then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Fornecedor: ' + Trim(CmpRptCM.ParamValues[1].DispalyText) + '     ';

  if CmpRptCM.ParamValues[3].AsDateTime <> 0 then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Data inicial: ' + Trim(CmpRptCM.ParamValues[3].DispalyText) + '     ';

  if CmpRptCM.ParamValues[4].AsDateTime <> 0 then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Data final: ' + Trim(CmpRptCM.ParamValues[4].DispalyText) + '     ';

  case CmpRptCM.ParamValues[2].AsInteger of
     0: LbAdicionais.Caption := LbAdicionais.Caption + 'Documentos em aberto';
     1: LbAdicionais.Caption := LbAdicionais.Caption + 'Documentos baixados';
  end;

  CdsLogo.Data := CtrlRelatoriosCAPCAR.ListaLogoEmpresa(Sistema.IdEmpresa);
  Cds.Data     := CtrlRelatoriosCAPCAR.ListaValoresxCCusto(CmpRptCM.ParamValues[3].AsDateTime,
                                                           CmpRptCM.ParamValues[4].AsDateTime,
                                                           Sistema.IdEmpresa,
                                                           Sistema.Idusuario,
                                                           CmpRptCM.ParamValues[1].AsInteger,
                                                           CmpRptCM.ParamValues[2].AsInteger,
                                                           ParamIntegra.RecPag,
                                                           CmpRptCM.ParamValues[0].AsString);
end;




end.
