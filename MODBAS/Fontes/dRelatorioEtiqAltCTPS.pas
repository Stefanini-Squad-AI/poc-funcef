unit dRelatorioEtiqAltCTPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBBDE, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppComm,
  ppProd, ppReport, ppEndUsr, StdCtrls, ppForms, ppTypes, ppPrvDlg, ppDBPipe, ppRelatv;

type
  TdtmRelatorioEtiqAltCTPS = class(TForm)
    dsgnEtiquetasAltCTPS: TppDesigner;
    rpEtiquetasAltCTPS: TppReport;
    rpEtiquetasColHdrBnd1: TppColumnHeaderBand;
    rpEtiquetasDtlBnd1: TppDetailBand;
    EtiquetasAltCTPSDBTxt1: TppDBText;
    EtiquetasAltCTPSDBTxt3: TppDBText;
    EtiquetasAltCTPSDBTxt4: TppDBText;
    EtiquetasAltCTPSDBTxt5: TppDBText;
    rpEtiquetasAltCTPSLbl1: TppLabel;
    rpEtiquetasAltCTPSDBTxt2: TppDBText;
    rpEtiquetasAltCTPSLbl2: TppLabel;
    rpEtiquetasAltCTPSLbl3: TppLabel;
    rpEtiquetasAltCTPSLbl4: TppLabel;
    rpEtiquetasAltCTPSLine1: TppLine;
    rpEtiquetasAltCTPSLbl6: TppLabel;
    rpEtiquetasColFootBnd1: TppColumnFooterBand;
    rpEtiquetasSmryBnd1: TppSummaryBand;
    ppEtiquetasAltCTPS: TppBDEPipeline;
    dsEtiquetasAltCTPS: TwwDataSource;
    qryEtiquetasAltCTPS: TwwQuery;
    procedure qryEtiquetasAltCTPSAfterOpen(DataSet: TDataSet);
    procedure qryEtiquetasAltCTPSAfterScroll(DataSet: TDataSet);
    procedure qryEtiquetasAltCTPSBeforeOpen(DataSet: TDataSet);
    procedure rpEtiquetasSmryBnd1AfterPrint(Sender: TObject);
  public
    function GetLayoutPadrao: TStringList;
  end;

var
  dtmRelatorioEtiqAltCTPS: TdtmRelatorioEtiqAltCTPS;

implementation

uses uSistema, uDataBase, uMensErro, uFuncoesUteisRH, fAguarde;

{$R *.DFM}

procedure TdtmRelatorioEtiqAltCTPS.qryEtiquetasAltCTPSBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Etiquetas para Atualização de CTPS');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatorioEtiqAltCTPS.qryEtiquetasAltCTPSAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := qryEtiquetasAltCTPS.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatorioEtiqAltCTPS.qryEtiquetasAltCTPSAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatorioEtiqAltCTPS.rpEtiquetasSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

function TdtmRelatorioEtiqAltCTPS.GetLayoutPadrao: TStringList;
var
  LayoutPadrao: TStringList;
begin
  LayoutPadrao := TStringList.Create;

  with (LayoutPadrao) do
  begin
    Clear;
    Add('object rpEtiquetasAltCTPS: TppReport');
    Add('  AutoStop = False');
    Add('  Columns = 3');
    Add('  ColumnPositions.Strings = (');
    Add('    ''6350''');
    Add('    ''101116''');
    Add('    ''195882'')');
    Add('  DataPipeline = ppEtiquetasAltCTPS');
    Add('  PrinterSetup.BinName = ''Default''');
    Add('  PrinterSetup.DocumentName = ''Emissão de Etiquetas''');
    Add('  PrinterSetup.PaperName = ''A4''');
    Add('  PrinterSetup.PrinterName = ''Default''');
    Add('  PrinterSetup.mmMarginBottom = 4350');
    Add('  PrinterSetup.mmMarginLeft = 6350');
    Add('  PrinterSetup.mmMarginRight = 6350');
    Add('  PrinterSetup.mmMarginTop = 6350');
    Add('  PrinterSetup.mmPaperHeight = 297000');
    Add('  PrinterSetup.mmPaperWidth = 210000');
    Add('  PrinterSetup.PaperSize = 9');
    Add('  Template.Format = ftASCII');
    Add('  Units = utMillimeters');
    Add('  AllowPrintToArchive = True');
    Add('  AllowPrintToFile = True');
    Add('  CachePages = True');
    Add('  DeviceType = ''Screen''');
    Add('  Left = 57');
    Add('  Top = 49');
    Add('  Version = ''5.5''');
    Add('  mmColumnWidth = 94766');
    Add('  object rpEtiquetasColHdrBnd1: TppColumnHeaderBand');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 0');
    Add('    mmPrintPosition = 0');
    Add('  end');
    Add('  object rpEtiquetasDtlBnd1: TppDetailBand');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 27252');
    Add('    mmPrintPosition = 0');
    Add('    object EtiquetasAltCTPSDBTxt1: TppDBText');
    Add('      UserName = ''EtiquetasAltCTPSDBTxt1''');
    Add('      DataField = ''DATA''');
    Add('      DataPipeline = ppEtiquetasAltCTPS');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 26723');
    Add('      mmTop = 1058');
    Add('      mmWidth = 17198');
    Add('      BandType = 4');
    Add('    end');
    Add('    object EtiquetasAltCTPSDBTxt3: TppDBText');
    Add('      UserName = ''EtiquetasAltCTPSDBTxt3''');
    Add('      DataField = ''NOVAFUNCAO''');
    Add('      DataPipeline = ppEtiquetasAltCTPS');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 24871');
    Add('      mmTop = 5556');
    Add('      mmWidth = 51594');
    Add('      BandType = 4');
    Add('    end');
    Add('    object EtiquetasAltCTPSDBTxt4: TppDBText');
    Add('      UserName = ''EtiquetasAltCTPSDBTxt4''');
    Add('      DataField = ''CBO''');
    Add('      DataPipeline = ppEtiquetasAltCTPS');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 13494');
    Add('      mmTop = 10054');
    Add('      mmWidth = 9790');
    Add('      BandType = 4');
    Add('    end');
    Add('    object EtiquetasAltCTPSDBTxt5: TppDBText');
    Add('      UserName = ''EtiquetasAltCTPSDBTxt5''');
    Add('      DataField = ''MOTIVO''');
    Add('      DataPipeline = ppEtiquetasAltCTPS');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      WordWrap = True');
    Add('      mmHeight = 7938');
    Add('      mmLeft = 5821');
    Add('      mmTop = 10054');
    Add('      mmWidth = 70644');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLbl1: TppLabel');
    Add('      UserName = ''rpEtiquetasAltCTPSLbl1''');
    Add('      Caption = ''Aumentado em:''');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 5821');
    Add('      mmTop = 1058');
    Add('      mmWidth = 19844');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSDBTxt2: TppDBText');
    Add('      UserName = ''rpEtiquetasAltCTPSDBTxt2''');
    Add('      DataField = ''NOVOSALARIO''');
    Add('      DataPipeline = ppEtiquetasAltCTPS');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 59267');
    Add('      mmTop = 1058');
    Add('      mmWidth = 17198');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLbl2: TppLabel');
    Add('      UserName = ''rpEtiquetasAltCTPSLbl2''');
    Add('      AutoSize = False');
    Add('      Caption = ''para R$''');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 47361');
    Add('      mmTop = 1058');
    Add('      mmWidth = 10583');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLbl3: TppLabel');
    Add('      UserName = ''rpEtiquetasAltCTPSLbl3''');
    Add('      Caption = ''Na função de:''');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 5821');
    Add('      mmTop = 5556');
    Add('      mmWidth = 17992');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLbl4: TppLabel');
    Add('      UserName = ''rpEtiquetasAltCTPSLbl4''');
    Add('      Caption = ''CBO:''');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 5821');
    Add('      mmTop = 10054');
    Add('      mmWidth = 6615');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLine1: TppLine');
    Add('      UserName = ''rpEtiquetasAltCTPSLine1''');
    Add('      Weight = 0.75');
    Add('      mmHeight = 1058');
    Add('      mmLeft = 9790');
    Add('      mmTop = 21696');
    Add('      mmWidth = 55563');
    Add('      BandType = 4');
    Add('    end');
    Add('    object rpEtiquetasAltCTPSLbl6: TppLabel');
    Add('      UserName = ''rpEtiquetasAltCTPSLbl6''');
    Add('      Caption = ''Assinatura do Empregador''');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 8');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3704');
    Add('      mmLeft = 20638');
    Add('      mmTop = 22490');
    Add('      mmWidth = 34131');
    Add('      BandType = 4');
    Add('    end');
    Add('  end');
    Add('  object rpEtiquetasColFootBnd1: TppColumnFooterBand');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 0');
    Add('    mmPrintPosition = 0');
    Add('  end');
    Add('  object rpEtiquetasSmryBnd1: TppSummaryBand');
    Add('    AfterPrint = rpEtiquetasSmryBnd1AfterPrint');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 529');
    Add('    mmPrintPosition = 0');
    Add('  end');
    Add('end');
  end;

  Result := LayoutPadrao;
end;

end.
