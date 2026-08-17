unit RSuplemDeduPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppComm, ppRelatv,
  uCtrlTransacoesPorGrupo,uCtrlPadroes, ppProd, ppClass, ppReport, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE, Db, DBClient,
  uCMClientDataSet, uSistema, ppVar, MontaSelect, uModulo, TXRB;

type
  TRptSuplemDeduPorGrupoMT = class(TFrmCmReport)
    Rpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lbEmpresa: TppLabel;
    lbDescricao: TppLabel;
    lbAdicionais: TppLabel;
    ppLine1: TppLine;
    dsImagem: TDataSource;
    CdsImagem: TCMClientDataSet;
    pplCdsImagem: TppBDEPipeline;
    Cds: TCMClientDataSet;
    ppDBImage1: TppDBImage;
    pplCds: TppDBPipeline;
    ds: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppLabel6: TppLabel;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    shpCorZebra: TppShape;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    msGrupo: TMontaSelect;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpCorZebraPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  RptSuplemDeduPorGrupoMT: TRptSuplemDeduPorGrupoMT;

implementation

{$R *.DFM}

procedure TRptSuplemDeduPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CdsImagem.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);

  msGrupo.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TRptSuplemDeduPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;




procedure TRptSuplemDeduPorGrupoMT.CrmRptCMBeforePrint(Sender: TObject);
var
  dDataIni,dDataFim: TDateTime;
  iCodGrupoOrc: integer;
begin
  inherited;
  dDataIni     := CmpRptCM.ParamValues[0].AsDateTime;
  dDataFim     := CmpRptCM.ParamValues[1].AsDateTime;
  iCodGrupoOrc := CmpRptCM.ParamValues[2].AsInteger;

  if ((dDataIni = 0) and (dDataFim = 0)) then
     lbAdicionais.Caption := 'Todos os períodos';

  if ((dDataIni <> 0) and (dDataFim = 0)) then
     lbAdicionais.Caption := 'Período a partir de ' + DateToStr(dDataIni);

  if ((dDataIni = 0) and (dDataFim <> 0)) then
     lbAdicionais.Caption := 'Período inferior a ' + DateToStr(dDataFim);

  if ((dDataIni <> 0) and (dDataFim <> 0)) then
     lbAdicionais.Caption := 'Período entre ' + DateToStr(dDataIni) + ' à ' + DateToStr(dDataFim);

  Cds.Data := CtrlTransacoesPorGrupo.ListaAjustesOrcEfetuados(dDataIni,dDataFim,Sistema.IdEmpresa,iCodGrupoOrc,CmpRptCM.ParamValues[3].AsInteger);

end;




procedure TRptSuplemDeduPorGrupoMT.shpCorZebraPrint(Sender: TObject);
begin
  inherited;
  if shpCorZebra.Brush.Color = $00E2E2E2 then
     shpCorZebra.Brush.Color := clWhite
  else
     shpCorZebra.Brush.Color := $00E2E2E2;
end;

end.
