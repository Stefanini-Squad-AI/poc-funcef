unit dRelOrcamentoCivil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppModule, raCodMod, ppVar, ppBands, ppClass, ppCtrls,
  ppPrnabl, ppCache, ppDB, Grids, DBGrids, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager,
  TXComp, CmParamReport, fCMReportMTImob, uCtrlRelIndicadores, TXRB;

type
  TdtmRelOrcamentoCivil = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppOrcamentoCivil: TppReport;
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
    vTGP12: TppVariable;
    vTGR12: TppVariable;
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
    pVarGGM: TppVariable;
    pVarGGA: TppVariable;
    vTGPM: TppVariable;
    vTGRM: TppVariable;
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
    ppLabel17: TppLabel;
    pplMesIni: TppLabel;
    pplMesFim: TppLabel;
    ppLabel16: TppLabel;
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
    pVarGM: TppVariable;
    pVarGA: TppVariable;
    vTPM: TppVariable;
    vTRM: TppVariable;
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
    vPM: TppVariable;
    vRM: TppVariable;
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
    pVarTM: TppVariable;
    pVarTA: TppVariable;
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
    pVarM: TppVariable;
    pVarA: TppVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

    procedure DefineQuebraDeGrupo;
    procedure PreencheCabecalhoColuna(const iMesIni:Integer);

  public
    { Public declarations }
  end;

var
  dtmRelOrcamentoCivil: TdtmRelOrcamentoCivil;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelOrcamentoCivil.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelOrcamento(
                                 3622,                                 // idReport
                                 CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                 CmpRptCM.ParamValues[1].AsInteger,    // Ano Referencia
                                 CmpRptCM.ParamValues[11].AsInteger,   // mes de referencia inicial
                                 CmpRptCM.ParamValues[12].AsInteger,   // Qtde de meses para média
                                 CmpRptCM.ParamValues[7].AsInteger,    // Ordem de Apresentação
                                 CmpRptCM.ParamValues[2].AsBoolean,    // flg Receita
                                 CmpRptCM.ParamValues[3].AsBoolean,    // flg Despesa
                                 CmpRptCM.ParamValues[4].AsBoolean,    // flg Previsto
                                 CmpRptCM.ParamValues[5].AsBoolean,    // flg Realizado
                                 CmpRptCM.ParamValues[6].AsBoolean);   // flg Desempenho

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[8].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[9].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[10].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  DefineQuebraDeGrupo;
  PreencheCabecalhoColuna(CmpRptCM.ParamByName('iMesIni').AsInteger);

  // Carrega o Logotipo
  if ModuloIndicadores.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloIndicadores.LogoTipo.Picture
  else ppLogotipo.Picture := nil;
end;

procedure TdtmRelOrcamentoCivil.DefineQuebraDeGrupo;
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

procedure TdtmRelOrcamentoCivil.PreencheCabecalhoColuna(const iMesIni: Integer);
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

   pplMesIni.Caption := CmpRptCM.ParamByName('sMesIni').AsString + ' e ';
   pplMesFim.Caption := CmpRptCM.ParamByName('sMesFim').AsString;
end;



procedure TdtmRelOrcamentoCivil.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelOrcamentoCivil.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelOrcamentoCivil.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;


end.
