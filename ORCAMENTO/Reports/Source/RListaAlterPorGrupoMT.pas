unit RListaAlterPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlTransacoesPorGrupo,
  uCtrlPadroes, Db, DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, MontaSelect, ppBands,
  ppCache, ppCtrls, ppPrnabl, ppVar, uSistema, uModulo, uDiasUteis, TXRB;

type
  TRptListaAlterPorGrupoMT = class(TFrmCmReport)
    Cds: TCMClientDataSet;
    CdsImagem: TCMClientDataSet;
    RptAlterPorGrupo: TppReport;
    pplCds: TppBDEPipeline;
    pplCdsImagem: TppBDEPipeline;
    ds: TDataSource;
    dsImagem: TDataSource;
    msGrupoOrigem: TMontaSelect;
    msGrupoDestino: TMontaSelect;
    lbEmpresa: TppLabel;
    lbDescricao: TppLabel;
    lbAdicionais: TppLabel;
    ppLine1: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine4: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBImage1: TppDBImage;
    ppSummaryBand1: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel13: TppLabel;
    ppDBCalc2: TppDBCalc;
    shpCorZebra: TppShape;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText6: TppDBText;
    ppDBText15: TppDBText;
    ppDBText11: TppDBText;
    ppLabel18: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText16: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpCorZebraPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo: TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  RptListaAlterPorGrupoMT: TRptListaAlterPorGrupoMT;

implementation

{$R *.DFM}




procedure TRptListaAlterPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
   CtrlTransacoesPorGrupo.InitializeAs(Padroes);
   CdsImagem.Data         := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);
   msGrupoOrigem.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   msGrupoDestino.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   CmpRptCM.ParamValues[4].TextDefault := FormatDateTime('yyyy',now);
end;




procedure TRptListaAlterPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;




procedure TRptListaAlterPorGrupoMT.CrmRptCMBeforePrint(Sender: TObject);
var
   iGOrigem,iGDestino: integer;
   sPerIni, sPerFim: string;
   
begin
  inherited;
  if CmpRptCM.ParamValues[0].IsNull then
     iGOrigem := -1
  else
     iGOrigem := StrToInt(CmpRptCM.ParamValues[0].MontaSelect.ValoresChave[0]);

  if CmpRptCM.ParamValues[1].IsNull then
     iGDestino := -1
  else
     iGDestino := StrToInt(CmpRptCM.ParamValues[1].MontaSelect.ValoresChave[0]);

  case (CmpRptCM.ParamValues[2].AsInteger + 1) of
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
  case (CmpRptCM.ParamValues[3].AsInteger + 1) of
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
  lbAdicionais.Caption := 'Período de ' + sPerIni + ' à ' + sPerFim + ' de ' + CmpRptCM.ParamValues[4].AsString;
  
  Cds.Data := CtrlTransacoesPorGrupo.ListaAlterOrcamenPorGrupo('T',
                                                               Sistema.IdEmpresa,
                                                               iGOrigem,
                                                               iGDestino,
                                                              (CmpRptCM.ParamValues[2].AsInteger + 1),
                                                              (CmpRptCM.ParamValues[3].AsInteger + 1),
                                                               CmpRptCM.ParamValues[4].AsInteger,
                                                               CmpRptCM.ParamValues[5].AsInteger);
                                                               

end;




procedure TRptListaAlterPorGrupoMT.shpCorZebraPrint(Sender: TObject);
begin
  inherited;
  if shpCorZebra.Brush.Color = $00EBEBEB then
     shpCorZebra.Brush.Color := clWhite
  else
     shpCorZebra.Brush.Color := $00EBEBEB;
end;




end.
