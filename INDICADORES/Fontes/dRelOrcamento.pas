unit dRelOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppModule, raCodMod, ppVar, ppBands, ppClass, ppCtrls,
  ppPrnabl, ppCache, ppDB, Grids, DBGrids, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager,
  TXComp, CmParamReport, fCMReportMTImob, uCtrlRelIndicadores, ExtCtrls,
  TeeProcs, TeEngine, Chart, ppChrt, ppStrtch, ppSubRpt, Series, TXRB;


Type TGrafico = Record
       sDesc    : string;
       idChave  : Integer;
       fVlrProp : Extended;
       fVlrReal : Extended;
     end;

type
  TdtmRelOrcamento = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppOrcamento: TppReport;
    CMspABL: TCMSqlParams;
    cdsABL: TClientDataSet;
    dsABL: TDataSource;
    pplABL: TppBDEPipeline;
    cdsGrafico: TClientDataSet;
    ppOrcamentoHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLogoTipo: TppImage;
    ppOrcamentoDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDscDetalhe: TppDBText;
    ppOrcamentoDBText3: TppDBText;
    ppOrcamentoDBText4: TppDBText;
    ppOrcamentoDBText5: TppDBText;
    ppOrcamentoDBText6: TppDBText;
    ppOrcamentoDBText7: TppDBText;
    ppOrcamentoDBText8: TppDBText;
    ppOrcamentoDBText9: TppDBText;
    ppOrcamentoDBText10: TppDBText;
    ppOrcamentoDBText11: TppDBText;
    ppOrcamentoDBText12: TppDBText;
    ppOrcamentoDBText13: TppDBText;
    ppOrcamentoDBText14: TppDBText;
    ppOrcamentoDBText15: TppDBText;
    vTot: TppVariable;
    ppDBText1: TppDBText;
    vVar: TppVariable;
    ppDBText17: TppDBText;
    ppOrcamentoFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppOrcamentoSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppLabel11: TppLabel;
    ppDBText18: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    vTGP1: TppVariable;
    vTGR1: TppVariable;
    vTGP2: TppVariable;
    vTGR2: TppVariable;
    vTGP3: TppVariable;
    vTGR3: TppVariable;
    vTGP4: TppVariable;
    vTGR4: TppVariable;
    vTGP5: TppVariable;
    vTGR5: TppVariable;
    vTGP6: TppVariable;
    vTGR6: TppVariable;
    vTGP7: TppVariable;
    vTGR7: TppVariable;
    vTGP8: TppVariable;
    vTGR8: TppVariable;
    vTGP9: TppVariable;
    vTGR9: TppVariable;
    vTGP10: TppVariable;
    vTGR10: TppVariable;
    vTGP11: TppVariable;
    vTGR11: TppVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
    vRP1: TppVariable;
    vRR1: TppVariable;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    vRP2: TppVariable;
    vRR2: TppVariable;
    ppDBText7: TppDBText;
    vRP3: TppVariable;
    vRR3: TppVariable;
    ppDBText8: TppDBText;
    vRP4: TppVariable;
    vRR4: TppVariable;
    ppDBText9: TppDBText;
    vRP5: TppVariable;
    vRR5: TppVariable;
    ppDBText10: TppDBText;
    vRP6: TppVariable;
    vRR6: TppVariable;
    ppDBText11: TppDBText;
    vRP7: TppVariable;
    vRR7: TppVariable;
    ppDBText12: TppDBText;
    vRP8: TppVariable;
    vRR8: TppVariable;
    ppDBText13: TppDBText;
    vRP9: TppVariable;
    vRR9: TppVariable;
    ppDBText14: TppDBText;
    vRP10: TppVariable;
    vRR10: TppVariable;
    ppDBText15: TppDBText;
    vRP11: TppVariable;
    vRR11: TppVariable;
    vTGP12: TppVariable;
    vTGR12: TppVariable;
    ppDBText16: TppDBText;
    vRP12: TppVariable;
    vRR12: TppVariable;
    vRRTot: TppVariable;
    vRPTot: TppVariable;
    vABLAno: TppVariable;
    vTGRTot: TppVariable;
    vTGPTot: TppVariable;
    vTGPAnt: TppVariable;
    vTGRAnt: TppVariable;
    vTGPVar: TppVariable;
    vTGRVar: TppVariable;
    ppLabel15: TppLabel;
    pVarGG1: TppVariable;
    pVarGG2: TppVariable;
    pVarGG3: TppVariable;
    pVarGG4: TppVariable;
    pVarGG5: TppVariable;
    pVarGG6: TppVariable;
    pVarGG7: TppVariable;
    pVarGG8: TppVariable;
    pVarGG9: TppVariable;
    pVarGG10: TppVariable;
    pVarGG11: TppVariable;
    pVarGG12: TppVariable;
    pVarGGT: TppVariable;
    pVarGGA: TppVariable;
    vTGPM: TppVariable;
    vTGRM: TppVariable;
    pVarGGM: TppVariable;
    vABLM: TppVariable;
    vRPM: TppVariable;
    vRRM: TppVariable;
    Grafico1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppGrafico1: TppTitleBand;
    ppGrfEvolDespesa: TppTeeChart;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    Grafico2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppGrafico2: TppTitleBand;
    ppGrfComparativo: TppTeeChart;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    Grafico3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppGrafico3: TppTitleBand;
    ppGrfDistrDespesas: TppTeeChart;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    Grafico4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppGrafico4: TppTitleBand;
    ppGrfDistrReceitas: TppTeeChart;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLabel1: TppLabel;
    ppMes1: TppLabel;
    ppMes2: TppLabel;
    ppMes11: TppLabel;
    ppMes10: TppLabel;
    ppMes3: TppLabel;
    ppMes4: TppLabel;
    ppMes5: TppLabel;
    ppMes6: TppLabel;
    ppMes7: TppLabel;
    ppMes8: TppLabel;
    ppMes9: TppLabel;
    ppMes12: TppLabel;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel16: TppLabel;
    pplMedia: TppLabel;
    pplFiltro: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppOrcamentoLabel18: TppLabel;
    ppOrcamentoLabel19: TppLabel;
    ppOrcamentoLabel20: TppLabel;
    vTP1: TppVariable;
    vTR1: TppVariable;
    vTP2: TppVariable;
    vTR2: TppVariable;
    vTP3: TppVariable;
    vTR3: TppVariable;
    vTP4: TppVariable;
    vTR4: TppVariable;
    vTP5: TppVariable;
    vTR5: TppVariable;
    vTP6: TppVariable;
    vTR6: TppVariable;
    vTP7: TppVariable;
    vTR7: TppVariable;
    vTP8: TppVariable;
    vTR8: TppVariable;
    vTP9: TppVariable;
    vTR9: TppVariable;
    vTP10: TppVariable;
    vTR10: TppVariable;
    vTP11: TppVariable;
    vTR11: TppVariable;
    vTP12: TppVariable;
    vTR12: TppVariable;
    vTPTot: TppVariable;
    vTRTot: TppVariable;
    vTPAnt: TppVariable;
    vTRAnt: TppVariable;
    ppDBText3: TppDBText;
    ppOrcamentoLine7: TppLine;
    ppOrcamentoLine8: TppLine;
    vTPVar: TppVariable;
    vTRVar: TppVariable;
    ppLabel14: TppLabel;
    pVarG1: TppVariable;
    pVarG2: TppVariable;
    pVarG3: TppVariable;
    pVarG4: TppVariable;
    pVarG5: TppVariable;
    pVarG6: TppVariable;
    pVarG7: TppVariable;
    pVarG8: TppVariable;
    pVarG9: TppVariable;
    pVarG10: TppVariable;
    pVarG11: TppVariable;
    pVarG12: TppVariable;
    pVarGT: TppVariable;
    pVarGA: TppVariable;
    vTPM: TppVariable;
    vTRM: TppVariable;
    pVarGM: TppVariable;
    ppGrpQuebra: TppGroup;
    ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand;
    ppDscQuebra: TppDBText;
    ppOrcamentoLine3: TppLine;
    ppOrcamentoGroupFooterBand1: TppGroupFooterBand;
    ppOrcamentoLine4: TppLine;
    ppOrcamentoLine6: TppLine;
    ppOrcamentoLabel15: TppLabel;
    ppOrcamentoLabel16: TppLabel;
    ppOrcamentoLabel17: TppLabel;
    vP1: TppVariable;
    vR1: TppVariable;
    vP2: TppVariable;
    vR2: TppVariable;
    vP3: TppVariable;
    vR3: TppVariable;
    vP4: TppVariable;
    vR4: TppVariable;
    vP5: TppVariable;
    vR5: TppVariable;
    vP6: TppVariable;
    vR6: TppVariable;
    vP7: TppVariable;
    vR7: TppVariable;
    vP8: TppVariable;
    vR8: TppVariable;
    vP9: TppVariable;
    vR9: TppVariable;
    vP10: TppVariable;
    vR10: TppVariable;
    vP11: TppVariable;
    vR11: TppVariable;
    vP12: TppVariable;
    vR12: TppVariable;
    vPTot: TppVariable;
    vRTot: TppVariable;
    vPAnt: TppVariable;
    vRAnt: TppVariable;
    vPVar: TppVariable;
    vRVar: TppVariable;
    ppLabel13: TppLabel;
    pVarT1: TppVariable;
    pVarT2: TppVariable;
    pVarT3: TppVariable;
    pVarT4: TppVariable;
    pVarT5: TppVariable;
    pVarT6: TppVariable;
    pVarT7: TppVariable;
    pVarT8: TppVariable;
    pVarT9: TppVariable;
    pVarT10: TppVariable;
    pVarT11: TppVariable;
    pVarT12: TppVariable;
    pVarTT: TppVariable;
    pVarTA: TppVariable;
    vPM: TppVariable;
    pVarTM: TppVariable;
    vRM: TppVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppsCor2: TppShape;
    ppLabel12: TppLabel;
    pVar1: TppVariable;
    pVar2: TppVariable;
    pVar3: TppVariable;
    pVar4: TppVariable;
    pVar5: TppVariable;
    pVar6: TppVariable;
    pVar7: TppVariable;
    pVar8: TppVariable;
    pVar9: TppVariable;
    pVar10: TppVariable;
    pVar11: TppVariable;
    pVar12: TppVariable;
    pVarT: TppVariable;
    pVarA: TppVariable;
    pVarM: TppVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure Grafico1Print(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure Grafico2Print(Sender: TObject);
    procedure Grafico3Print(Sender: TObject);
    procedure Grafico4Print(Sender: TObject);    
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    vTotDespPrev, vTotDespReal : Array[1..12] of Extended;
    vDesp : array of TGrafico;

    procedure DefineQuebraDeGrupo;
    procedure PreencheCabecalhoColuna(const iMesIni:Integer);
    procedure MontaVetorGrafico;
  public
    { Public declarations }
  end;

var
  dtmRelOrcamento: TdtmRelOrcamento;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     UModuloIndicadores;

{$R *.DFM}

procedure TdtmRelOrcamento.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data    := CtrlRelIndicadores.BuscaRelOrcamento(3435,                                 // idReport
                                                      CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                                      CmpRptCM.ParamValues[1].AsInteger,    // Ano Referencia
                                                      CmpRptCM.ParamValues[11].AsInteger,   // Mes Referencia
                                                      CmpRptCM.ParamValues[12].AsInteger,   // Qtde de meses para média
                                                      CmpRptCM.ParamValues[7].AsInteger,    // Ordem de Apresentação
                                                      CmpRptCM.ParamValues[2].AsBoolean,    // flg Receita
                                                      CmpRptCM.ParamValues[3].AsBoolean,    // flg Despesa
                                                      CmpRptCM.ParamValues[4].AsBoolean,    // flg Previsto
                                                      CmpRptCM.ParamValues[5].AsBoolean,    // flg Realizado
                                                      CmpRptCM.ParamValues[6].AsBoolean,    // flg Desempenho
                                                      CmpRptCM.ParamValues[20].AsString);   // indicadores

  cdsABL.Data := CtrlRelIndicadores.BuscaABLAno(CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                                CmpRptCM.ParamValues[1].AsInteger,    // Ano Referencia
                                                ModuloIndicadores.iIdIndABL);         // id do indicador de ABL

  // Prepara dados para os gráficos
  cdsGrafico.Data := cds.Data;
  MontaVetorGrafico;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[8].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[9].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[10].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  DefineQuebraDeGrupo;
  PreencheCabecalhoColuna(CmpRptCM.ParamValues[11].AsInteger);

  // Verifica Impressão de Gráficos
  ppGrafico1.Visible := CmpRptCM.ParamValues[13].AsBoolean;
  ppGrafico2.Visible := CmpRptCM.ParamValues[14].AsBoolean;
  ppGrafico3.Visible := CmpRptCM.ParamValues[15].AsBoolean;
  ppGrafico4.Visible := CmpRptCM.ParamValues[16].AsBoolean;

  // Carrega o Logotipo
  if ModuloIndicadores.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloIndicadores.LogoTipo.Picture
  else ppLogotipo.Picture := nil;
end;

procedure TdtmRelOrcamento.DefineQuebraDeGrupo;
begin
  if CmpRptCM.ParamValues[7].AsInteger = 1 then begin
    ppGrpQuebra.BreakName  := 'DSC_CCUSTO';
    ppDscQuebra.DataField  := 'DSC_CCUSTO';
    ppDscDetalhe.DataField := 'DSC_INDICADOR';
  end else begin
    ppGrpQuebra.BreakName  := 'DSC_INDICADOR';
    ppDscQuebra.DataField  := 'DSC_INDICADOR';
    ppDscDetalhe.DataField := 'DSC_CCUSTO';
  end;
end;

procedure TdtmRelOrcamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelOrcamento.ppsCorPrint(Sender: TObject);
begin
  inherited;
  if bCorLinha then begin
     if CorAtual = clWhite then begin
        CorAtual := CorLinha;
     end else begin
        CorAtual := clWhite;
     end;
  end else begin
     CorAtual := clWhite;
  end;
  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelOrcamento.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelOrcamento.PreencheCabecalhoColuna(const iMesIni: Integer);
begin
   ppMes1.Caption  := ComunsImobiliario.SiglaMes(iMesIni);
   ppMes2.Caption  := ComunsImobiliario.SiglaMes(iMesIni+1);
   ppMes3.Caption  := ComunsImobiliario.SiglaMes(iMesIni+2);
   ppMes4.Caption  := ComunsImobiliario.SiglaMes(iMesIni+3);
   ppMes5.Caption  := ComunsImobiliario.SiglaMes(iMesIni+4);
   ppMes6.Caption  := ComunsImobiliario.SiglaMes(iMesIni+5);
   ppMes7.Caption  := ComunsImobiliario.SiglaMes(iMesIni+6);
   ppMes8.Caption  := ComunsImobiliario.SiglaMes(iMesIni+7);
   ppMes9.Caption  := ComunsImobiliario.SiglaMes(iMesIni+8);
   ppMes10.Caption := ComunsImobiliario.SiglaMes(iMesIni+9);
   ppMes11.Caption := ComunsImobiliario.SiglaMes(iMesIni+10);
   ppMes12.Caption := ComunsImobiliario.SiglaMes(iMesIni+11);

   pplMedia.Caption := 'Média entre: ' + CmpRptCM.ParamValues[17].AsString + ' e ' + CmpRptCM.ParamValues[18].AsString;
   if CmpRptCM.ParamValues[21].AsBoolean = False then
        pplFiltro.Caption := 'Indicadores: < Todos >'
   else pplFiltro.Caption := 'Indicadores: < Seleção >';
end;

procedure TdtmRelOrcamento.Grafico1Print(Sender: TObject);
var iMesesMedia, i : Integer;
    fVlrMedio : Extended;
begin
   inherited;

// Daniel - 23390 - Início -----------------------------------------------------
   // Série Previsto
   ppGrfEvolDespesa.Chart.Series[0].Clear;
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[1]  / cdsABL.FieldByName('ABL01').AsFloat,2),  ppMes1.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[2]  / cdsABL.FieldByName('ABL02').AsFloat,2),  ppMes2.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[3]  / cdsABL.FieldByName('ABL03').AsFloat,2),  ppMes3.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[4]  / cdsABL.FieldByName('ABL04').AsFloat,2),  ppMes4.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[5]  / cdsABL.FieldByName('ABL05').AsFloat,2),  ppMes5.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[6]  / cdsABL.FieldByName('ABL06').AsFloat,2),  ppMes6.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[7]  / cdsABL.FieldByName('ABL07').AsFloat,2),  ppMes7.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[8]  / cdsABL.FieldByName('ABL08').AsFloat,2),  ppMes8.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[9]  / cdsABL.FieldByName('ABL09').AsFloat,2),  ppMes9.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[10] / cdsABL.FieldByName('ABL10').AsFloat,2), ppMes10.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[11] / cdsABL.FieldByName('ABL11').AsFloat,2), ppMes11.Caption);
   ppGrfEvolDespesa.Chart.Series[0].Add(ComunsImobiliario.Arredonda(vTotDespPrev[12] / cdsABL.FieldByName('ABL12').AsFloat,2), ppMes12.Caption);

   // Série Realizado
   ppGrfEvolDespesa.Chart.Series[1].Clear;
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[1]  / cdsABL.FieldByName('ABL01').AsFloat,2),  ppMes1.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[2]  / cdsABL.FieldByName('ABL02').AsFloat,2),  ppMes2.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[3]  / cdsABL.FieldByName('ABL03').AsFloat,2),  ppMes3.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[4]  / cdsABL.FieldByName('ABL04').AsFloat,2),  ppMes4.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[5]  / cdsABL.FieldByName('ABL05').AsFloat,2),  ppMes5.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[6]  / cdsABL.FieldByName('ABL06').AsFloat,2),  ppMes6.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[7]  / cdsABL.FieldByName('ABL07').AsFloat,2),  ppMes7.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[8]  / cdsABL.FieldByName('ABL08').AsFloat,2),  ppMes8.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[9]  / cdsABL.FieldByName('ABL09').AsFloat,2),  ppMes9.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[10] / cdsABL.FieldByName('ABL10').AsFloat,2), ppMes10.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[11] / cdsABL.FieldByName('ABL11').AsFloat,2), ppMes11.Caption);
   ppGrfEvolDespesa.Chart.Series[1].Add(ComunsImobiliario.Arredonda(vTotDespReal[12] / cdsABL.FieldByName('ABL12').AsFloat,2), ppMes12.Caption);

   iMesesMedia := CmpRptCM.ParamValues[12].AsInteger;
   fVlrMedio   := 0;
   for i := 1 to iMesesMedia do begin
      fVlrMedio := fVlrMedio + vTotDespReal[i];
   end;
   fVlrMedio := ComunsImobiliario.Arredonda(fVlrMedio / iMesesMedia, 2);

   // Série Média
   ppGrfEvolDespesa.Chart.Series[2].Clear;
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL01').AsFloat,2), ppMes1.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL02').AsFloat,2), ppMes2.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL03').AsFloat,2), ppMes3.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL04').AsFloat,2), ppMes4.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL05').AsFloat,2), ppMes5.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL06').AsFloat,2), ppMes6.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL07').AsFloat,2), ppMes7.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL08').AsFloat,2), ppMes8.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL09').AsFloat,2), ppMes9.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL10').AsFloat,2), ppMes10.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL11').AsFloat,2), ppMes11.Caption);
   ppGrfEvolDespesa.Chart.Series[2].Add(ComunsImobiliario.Arredonda(fVlrMedio / cdsABL.FieldByName('ABL12').AsFloat,2), ppMes12.Caption);

// Daniel - 23390 - Fim --------------------------------------------------------

end;

procedure TdtmRelOrcamento.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
  inherited;
  if cds.FieldByName('DSC_TIPOVALOR').AsString = 'DESPESAS' then begin
     vTotDespPrev[1]  := vTP1.Value;
     vTotDespPrev[2]  := vTP2.Value;
     vTotDespPrev[3]  := vTP3.Value;
     vTotDespPrev[4]  := vTP4.Value;
     vTotDespPrev[5]  := vTP5.Value;
     vTotDespPrev[6]  := vTP6.Value;
     vTotDespPrev[7]  := vTP7.Value;
     vTotDespPrev[8]  := vTP8.Value;
     vTotDespPrev[9]  := vTP9.Value;
     vTotDespPrev[10] := vTP10.Value;
     vTotDespPrev[11] := vTP11.Value;
     vTotDespPrev[12] := vTP12.Value;

     vTotDespReal[1]  := vTR1.Value;
     vTotDespReal[2]  := vTR2.Value;
     vTotDespReal[3]  := vTR3.Value;
     vTotDespReal[4]  := vTR4.Value;
     vTotDespReal[5]  := vTR5.Value;
     vTotDespReal[6]  := vTR6.Value;
     vTotDespReal[7]  := vTR7.Value;
     vTotDespReal[8]  := vTR8.Value;
     vTotDespReal[9]  := vTR9.Value;
     vTotDespReal[10] := vTR10.Value;
     vTotDespReal[11] := vTR11.Value;
     vTotDespReal[12] := vTR12.Value;
  end;
end;

procedure TdtmRelOrcamento.Grafico2Print(Sender: TObject);
var i :Integer;
begin
  inherited;

// Daniel - 23390 - Início -----------------------------------------------------
  ppGrfComparativo.Chart.Series[0].Clear;
  ppGrfComparativo.Chart.Series[1].Clear;
  for i := 0 to Length(vDesp) -1 do begin
      ppGrfComparativo.Chart.Series[0].Add(vDesp[i].fVlrProp, vDesp[i].sDesc, clRed);
      ppGrfComparativo.Chart.Series[1].Add(vDesp[i].fVlrReal, vDesp[i].sDesc, clBlue);
  end;
// Daniel - 23390 - Fim --------------------------------------------------------
end;

procedure TdtmRelOrcamento.Grafico3Print(Sender: TObject);
var i :Integer;
begin
  inherited;

// Daniel - 23390 - Início -----------------------------------------------------
  ppGrfDistrDespesas.Chart.Series[0].Clear;
  for i := 0 to Length(vDesp) -1 do begin
     if vDesp[i].fVlrProp > 0 then begin
        ppGrfDistrDespesas.Chart.Series[0].Add(vDesp[i].fVlrProp, vDesp[i].sDesc);
     end;
  end;
// Daniel - 23390 - Fim --------------------------------------------------------
end;


procedure TdtmRelOrcamento.Grafico4Print(Sender: TObject);
var i :Integer;
begin
  inherited;

// Daniel - 23390 - Início -----------------------------------------------------
  ppGrfDistrReceitas.Chart.Series[0].Clear;
  for i := 0 to Length(vDesp) -1 do begin
     if vDesp[i].fVlrReal > 0 then begin
        ppGrfDistrReceitas.Chart.Series[0].Add(vDesp[i].fVlrReal, vDesp[i].sDesc);
     end;
  end;
// Daniel - 23390 - Fim --------------------------------------------------------
end;


procedure TdtmRelOrcamento.MontaVetorGrafico;
var bGrupo, bNovoLancto : Boolean;
    i : Integer;
begin
  vDesp  := nil;
  bGrupo := CmpRptCM.ParamValues[19].AsInteger = 0;   // gráficos por grupo

  cdsGrafico.Filtered := False;
  cdsGrafico.Filter   := 'DSC_TIPOVALOR = ''DESPESAS'' ';
  cdsGrafico.Filtered := True;

  if bGrupo then
       cdsGrafico.IndexName := 'GRUPO'
  else cdsGrafico.IndexName := 'INDICADOR';

  cdsGrafico.First;
  while not cdsGrafico.Eof do begin
     bNovoLancto := True;
     for i := 0 to Length(vDesp)-1 do begin
        if bGrupo then begin
           if vDesp[i].idChave = cdsGrafico.FieldByName('IDGRPAPURACAO').AsInteger then begin
              bNovoLancto := False;
              if cdsGrafico.FieldByName('DSC_TIPOLANCA').AsString = 'PREV' then begin
                 vDesp[i].fVlrProp := vDesp[i].fVlrProp +
                                      cdsGrafico.FieldByName('VLR01').AsFloat +
                                      cdsGrafico.FieldByName('VLR02').AsFloat +
                                      cdsGrafico.FieldByName('VLR03').AsFloat +
                                      cdsGrafico.FieldByName('VLR04').AsFloat +
                                      cdsGrafico.FieldByName('VLR05').AsFloat +
                                      cdsGrafico.FieldByName('VLR06').AsFloat +
                                      cdsGrafico.FieldByName('VLR07').AsFloat +
                                      cdsGrafico.FieldByName('VLR08').AsFloat +
                                      cdsGrafico.FieldByName('VLR09').AsFloat +
                                      cdsGrafico.FieldByName('VLR10').AsFloat +
                                      cdsGrafico.FieldByName('VLR11').AsFloat +
                                      cdsGrafico.FieldByName('VLR12').AsFloat;
              end else begin
                 vDesp[i].fVlrReal := vDesp[i].fVlrReal + cdsGrafico.FieldByName('VLRANT').AsFloat;
              end;
           end;
        end else begin
           if vDesp[i].idChave = cdsGrafico.FieldByName('IDINDICADOR').AsInteger then begin
              bNovoLancto := False;
              if cdsGrafico.FieldByName('DSC_TIPOLANCA').AsString = 'PREV' then begin
                 vDesp[i].fVlrProp := vDesp[i].fVlrProp +
                                      cdsGrafico.FieldByName('VLR01').AsFloat +
                                      cdsGrafico.FieldByName('VLR02').AsFloat +
                                      cdsGrafico.FieldByName('VLR03').AsFloat +
                                      cdsGrafico.FieldByName('VLR04').AsFloat +
                                      cdsGrafico.FieldByName('VLR05').AsFloat +
                                      cdsGrafico.FieldByName('VLR06').AsFloat +
                                      cdsGrafico.FieldByName('VLR07').AsFloat +
                                      cdsGrafico.FieldByName('VLR08').AsFloat +
                                      cdsGrafico.FieldByName('VLR09').AsFloat +
                                      cdsGrafico.FieldByName('VLR10').AsFloat +
                                      cdsGrafico.FieldByName('VLR11').AsFloat +
                                      cdsGrafico.FieldByName('VLR12').AsFloat;
              end else begin
                 vDesp[i].fVlrReal := vDesp[i].fVlrReal + cdsGrafico.FieldByName('VLRANT').AsFloat;
              end;
           end;
        end;
     end;

     if bNovoLancto then begin
        SetLength(vDesp,(Length(vDesp)+1) );
        i := High(vDesp);
        if bGrupo then begin
           vDesp[i].IdChave := cdsGrafico.FieldByName('IDGRPAPURACAO').AsInteger;
           if cdsGrafico.FieldByName('DSC_CCUSTO').AsString <> '' then
                vDesp[i].sDesc := cdsGrafico.FieldByName('DSC_CCUSTO').AsString
           else vDesp[i].sDesc := 'Sem Classificação'; 
        end else begin
           vDesp[i].IdChave := cdsGrafico.FieldByName('IDINDICADOR').AsInteger;
           vDesp[i].sDesc   := cdsGrafico.FieldByName('DSC_INDICADOR').AsString;
        end;

        if cdsGrafico.FieldByName('DSC_TIPOLANCA').AsString = 'PREV' then begin
           vDesp[i].fVlrProp := cdsGrafico.FieldByName('VLR01').AsFloat +
                                cdsGrafico.FieldByName('VLR02').AsFloat +
                                cdsGrafico.FieldByName('VLR03').AsFloat +
                                cdsGrafico.FieldByName('VLR04').AsFloat +
                                cdsGrafico.FieldByName('VLR05').AsFloat +
                                cdsGrafico.FieldByName('VLR06').AsFloat +
                                cdsGrafico.FieldByName('VLR07').AsFloat +
                                cdsGrafico.FieldByName('VLR08').AsFloat +
                                cdsGrafico.FieldByName('VLR09').AsFloat +
                                cdsGrafico.FieldByName('VLR10').AsFloat +
                                cdsGrafico.FieldByName('VLR11').AsFloat +
                                cdsGrafico.FieldByName('VLR12').AsFloat;
        end else begin
           vDesp[i].fVlrReal := cdsGrafico.FieldByName('VLRANT').AsFloat;
        end;
     end;

     cdsGrafico.Next;
  end;
end;



end.
