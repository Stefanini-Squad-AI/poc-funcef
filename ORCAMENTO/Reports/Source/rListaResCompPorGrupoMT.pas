unit rListaResCompPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlTransacoesPorGrupo,uCtrlPadroes,
  Db, DBClient, uCMClientDataSet, uModulo, uSistema, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl, ppDB,
  ppDBPipe, ppDBBDE, ppVar, TXRB;

type
  TRptListaResCompPorGrupoMT = class(TFrmCmReport)
    Cds: TCMClientDataSet;
    RptListaResComp: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    CdsImagem: TCMClientDataSet;
    ds: TDataSource;
    pplCds: TppBDEPipeline;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLine4: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBImage1: TppDBImage;
    lbEmpresa: TppLabel;
    lbDescricao: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLabel10: TppLabel;
    dsImagem: TDataSource;
    pplCdsImagem: TppBDEPipeline;
    lbAdicionais: TppLabel;
    ppDBText1: TppDBText;
    ppDBText11: TppDBText;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel15: TppLabel;
    ppDBText12: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;



var
  RptListaResCompPorGrupoMT: TRptListaResCompPorGrupoMT;

implementation

{$R *.DFM}



procedure TRptListaResCompPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CdsImagem.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);
end;




procedure TRptListaResCompPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;




procedure TRptListaResCompPorGrupoMT.CrmRptCMBeforePrint(Sender: TObject);
var
  sStatus,sPerIni,sPerFim: string;
begin
  inherited;
  sStatus  := '';

  // Aguardando
  if CmpRptCM.ParamValues[4].AsBoolean then
     sStatus := '''A''';

  // Efetivada
  if CmpRptCM.ParamValues[5].AsBoolean then
  begin
     if sStatus <> '' then
        sStatus := sStatus + ',' + '''E'''
     else
        sStatus := '''E''';
  end;

  // Cancelada
  if CmpRptCM.ParamValues[6].AsBoolean then
  begin
     if sStatus <> '' then
        sStatus := sStatus + ',' + '''C'''
     else
        sStatus := '''C''';
  end;

  if CmpRptCM.ParamValues[7].AsString = 'R' then
     lbDescricao.Caption := 'Listagem de Reservas Orçamentárias Por Grupo de Contas'
  else
     lbDescricao.Caption := 'Listagem de Compromissos Orçamentários Por Grupo de Contas';

  case CmpRptCM.ParamValues[0].AsInteger of
     1 : sPerIni := 'Janeiro';
     2 : sPerIni := 'Fevereiro';
     3 : sPerIni := 'Março';
     4 : sPerIni := 'Abril';
     5 : sPerIni := 'Maio';
     6 : sPerIni := 'Junho';
     7 : sPerIni := 'Julho';
     8 : sPerIni := 'Agosto';
     9 : sPerIni := 'Setembro';
     10: sPerIni := 'Outubro';
     11: sPerIni := 'Novembro';
     12: sPerIni := 'Dezembro';
  end;
  case CmpRptCM.ParamValues[1].AsInteger of
     1 : sPerFim := 'Janeiro';
     2 : sPerFim := 'Fevereiro';
     3 : sPerFim := 'Março';
     4 : sPerFim := 'Abril';
     5 : sPerFim := 'Maio';
     6 : sPerFim := 'Junho';
     7 : sPerFim := 'Julho';
     8 : sPerFim := 'Agosto';
     9 : sPerFim := 'Setembro';
     10: sPerFim := 'Outubro';
     11: sPerFim := 'Novembro';
     12: sPerFim := 'Dezembro';
  end;

  lbAdicionais.Caption := 'Período de ' + sPerIni + ' à ' + sPerFim + ' de ' + CmpRptCM.ParamValues[2].AsString;

  Cds.Data := CtrlTransacoesPorGrupo.ListaResCompPorGrupo(Modulo.iPlanoOrc,
                                                          Sistema.IdEmpresa,
                                                          CmpRptCM.ParamValues[0].AsInteger,
                                                          CmpRptCM.ParamValues[1].AsInteger,
                                                          CmpRptCM.ParamValues[2].AsInteger,
                                                          CmpRptCM.ParamValues[3].AsInteger,
                                                          CmpRptCM.ParamValues[8].AsInteger,
                                                          CmpRptCM.ParamValues[7].AsString,
                                                          sStatus);
end;

end.
