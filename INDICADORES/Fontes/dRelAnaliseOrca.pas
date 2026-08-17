unit dRelAnaliseOrca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppModule, raCodMod, ppVar, ppBands, ppClass, ppCtrls,
  ppPrnabl, ppCache, ppDB, Grids, DBGrids, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager,
  TXComp, CmParamReport, fCMReportMTImob, uCtrlRelIndicadores, ppStrtch,
  ppMemo, TXRB;

type
  TdtmRelAnaliseOrca = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppAnaliseOrca: TppReport;
    ppOrcamentoHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLogoTipo: TppImage;
    ppOrcamentoDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDscDetalhe: TppDBText;
    ppOrcamentoDBText4: TppDBText;
    ppOrcamentoDBText6: TppDBText;
    ppOrcamentoDBText7: TppDBText;
    ppVarItem: TppVariable;
    ppDBMemo1: TppDBMemo;
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
    pVarTotGG: TppVariable;
    pVlrTotRealGG: TppVariable;
    pVlrTotPrevGG: TppVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppMes1: TppLabel;
    ppOrcamentoLine2: TppLine;
    ppLabel17: TppLabel;
    pplMesIni: TppLabel;
    pplMesFim: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel1: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppOrcamentoLabel18: TppLabel;
    ppDBText3: TppDBText;
    ppOrcamentoLine7: TppLine;
    ppOrcamentoLine8: TppLine;
    pVlrTotGReal: TppDBCalc;
    pVlrTotGPrev: TppDBCalc;
    pVarTotG: TppVariable;
    ppGrpQuebra: TppGroup;
    ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand;
    ppDscQuebra: TppDBText;
    ppOrcamentoLine3: TppLine;
    ppOrcamentoGroupFooterBand1: TppGroupFooterBand;
    ppOrcamentoLine4: TppLine;
    ppOrcamentoLine6: TppLine;
    ppOrcamentoLabel15: TppLabel;
    pVlrTotReal: TppDBCalc;
    pVlrTotPrev: TppDBCalc;
    pVarTot: TppVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure ppVarItemCalc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    fTotDifRec, fTotDifPag: Extended;

    procedure DefineQuebraDeGrupo;
    procedure TotalizaDiferencas;

  public
    { Public declarations }
  end;

var
  dtmRelAnaliseOrca: TdtmRelAnaliseOrca;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelAnaliseOrca.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelAnaliseOrca(
                                 3435,                                         // idReport - mesmo do Orçamento - Encargos Comuns
                                 CmpRptCM.ParamByName('idImovel').AsInteger,   // idImovel
                                 CmpRptCM.ParamByName('iAno').AsInteger,       // Ano Referencia
                                 CmpRptCM.ParamByName('iMesIni').AsInteger,    // mes de referencia inicial
                                 CmpRptCM.ParamByName('iQtdeMeses').AsInteger, // Qtde de meses para média
                                 CmpRptCM.ParamByName('iOrdem').AsInteger);    // Ordem de Apresentação

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamByName('bSeparador').AsBoolean;
  bCorLinha  := CmpRptCM.ParamByName('bCorLinha').AsBoolean;
  iPosCor    := CmpRptCM.ParamByName('iCorLinha').AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  DefineQuebraDeGrupo;
  TotalizaDiferencas;

  pplMesIni.Caption := CmpRptCM.ParamByName('sMesIni').AsString + ' e ';
  pplMesFim.Caption := CmpRptCM.ParamByName('sMesFim').AsString;

  // Carrega o Logotipo
  if ModuloIndicadores.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloIndicadores.LogoTipo.Picture
  else ppLogotipo.Picture := nil;
end;

procedure TdtmRelAnaliseOrca.DefineQuebraDeGrupo;
begin
  if CmpRptCM.ParamByName('iOrdem').AsInteger = 1 then begin
    ppGrpQuebra.BreakName  := 'DSC_CCUSTO';
    ppDscQuebra.DataField  := 'DSC_CCUSTO';
    ppDscDetalhe.DataField := 'DSC_INDICADOR';
  end else begin
    ppGrpQuebra.BreakName  := 'DSC_INDICADOR';
    ppDscQuebra.DataField  := 'DSC_INDICADOR';
    ppDscDetalhe.DataField := 'DSC_CCUSTO';
  end;
end;


procedure TdtmRelAnaliseOrca.TotalizaDiferencas;
begin
   cds.First;
   while not cds.Eof do begin
      if cds.FieldByName('DSC_TIPOVALOR').AsString[1] = 'R' then
           fTotDifRec := fTotDifRec + cds.FieldByName('VLR_REALANT').AsFloat
      else fTotDifPag := fTotDifPag + cds.FieldByName('VLR_REALANT').AsFloat;
      cds.Next;
   end;
   cds.First;
end;


procedure TdtmRelAnaliseOrca.ppVarItemCalc(Sender: TObject; var Value: Variant);
begin
  inherited;
  if cds.FieldByName('DSC_TIPOVALOR').AsString[1] = 'R' then begin
     if fTotDifRec <> 0 then
          Value := (cds.FieldByName('VLR_PREVATU').AsFloat * 100) / fTotDifRec
     else Value := 0;
  end else begin
     if fTotDifRec <> 0 then
          Value := (cds.FieldByName('VLR_PREVATU').AsFloat * 100) / fTotDifPag
     else Value := 0;
  end;
  Value := ComunsImobiliario.Arredonda(Value,2);
end;

procedure TdtmRelAnaliseOrca.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelAnaliseOrca.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelAnaliseOrca.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;



end.
