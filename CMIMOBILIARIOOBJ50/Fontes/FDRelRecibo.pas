unit FDRelRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus,ppEndUsr, ppCache, ppDB, ppDBBDE,ppForms,
  ppComm, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, Pptypes,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, FCadastroCSImob, FDRel, ppRelatv, ppDBPipe,
  CmEventosCadastro, ImgList;

type
  TfrmDesenhoRelRecibo = class(TfrmDesenhoRel)
    qrySql: TwwQuery;
    qryIDCARTACOBRANCA: TFloatField;
    qryMODELOCARTA: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryFLGTIPOCARTA: TStringField;
    qrySqlDataAtual: TStringField;
    qrySqlDataMes: TStringField;
    qrySqlValorRecibo: TCurrencyField;
    qrySqlValorExtenso: TStringField;
    qrySqlDescricao: TStringField;
    qrySqlRAZAOSOCIAL: TStringField;
    qrySqlNUMDOCUMENTO: TStringField;
    qrySqlCONNUMERO: TStringField;
    qrySqlCONNOME: TStringField;
    qrySqlNOME_CONTATO: TStringField;
    qrySqlLarguraRazaoSocial: TStringField;
    qrySqlENDERECO: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);

    function GetCmCartaCob: string;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnifilePrintToFileSetupClick(Sender: TObject);
    procedure mnifilePrintClick(Sender: TObject);
    procedure mnifilePageSetupClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmDesenhoRelRecibo: TfrmDesenhoRelRecibo;



implementation
{$R *.DFM}
uses
   uSistema, uDataBase, uMensErro, uFuncoesImob;



procedure TfrmDesenhoRelRecibo.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('PCARTACOBRANCA').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
         Open;
      end;
{
      with qryReports do begin
         LimpaParametros(qryReports);
         ParambyName('PIDREPORTS').asInteger := qry.FieldByName('IDREPORTS').asInteger;
         ParambyName('PORIGEMCM').asInteger  := qry.FieldByName('ORIGEMCM').asInteger;
         Open;

         memReports.Lines.Text := FieldByName('TEMPLATE').asString;
         memReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);
      end;
}
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmDesenhoRelRecibo.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   MemReports.Lines.Clear;
   MemReports.Lines.Text := GetCMCartaCob;
   MemReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);

   qryIdCartaCobranca.asFloat := LeUltRegistro(nil,'CARTACOBRANCA');
   qryIDREPORTS.asInteger     := LeUltRegistro(nil,'REPORTS');
   qryORIGEMCM.asInteger      := 0;
   qryFLGTIPOCARTA.asString   := 'B';
end;



procedure TfrmDesenhoRelRecibo.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryReports.Close;

   if not(qryReports.Prepared) then qryReports.Prepare;
   qryReports.ParamByName('PREPORT').asInteger     := qryIDREPORTS.asInteger;
   qryReports.ParamByName('PORIGEMCM').asInteger   := qryORIGEMCM.asInteger;
   qryReports.Open;

   MemReports.Lines.Clear;
   MemReports.Lines.Text := qryReportsTEMPLATE.asString;
end;



function TfrmDesenhoRelRecibo.GetCmCartaCob: string;
var
   sTemp : tStringList;
begin
   sTemp:= tStringList.Create;

   with sTemp do begin
      Clear;

      Add('object TppReport');
      Add('  DataPipeline = frmCadRecibo.ppConsulta');
      Add('  PrinterSetup.BinName = ''Default''');
      Add('  PrinterSetup.DocumentName = ''ppReport1''');
      Add('  PrinterSetup.PaperName = ''A4 210 x 297 mm''');
      Add('  PrinterSetup.PrinterName = ''Default''');
      Add('  PrinterSetup.mmMarginBottom = 15000');
      Add('  PrinterSetup.mmMarginLeft = 15000');
      Add('  PrinterSetup.mmMarginRight = 15000');
      Add('  PrinterSetup.mmMarginTop = 15000');
      Add('  PrinterSetup.mmPaperHeight = 297000');
      Add('  PrinterSetup.mmPaperWidth = 210000');
      Add('  SaveAsTemplate = True');
      Add('  Template.FileName = ''C:\TEMP\Recibo.tmp''');
      Add('  Template.Format = ftASCII');
      Add('  Units = utMillimeters');
      Add('  AllowPrintToArchive = True');
      Add('  AllowPrintToFile = True');
      Add('  Language = lgPortugueseBrazil');
      Add('  Version = ''3.52''');
      Add('  mmColumnWidth = 0');
      Add('  object ppReport1HeaderBand1: TppHeaderBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 31221');
      Add('    mmPrintPosition = 0');
      Add('    object ppReport1Label1: TppLabel');
      Add('      Caption = ''R E C I B O''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 16');
      Add('      Font.Style = [fsBold]');
      Add('      Transparent = True');
      Add('      mmHeight = 6350');
      Add('      mmLeft = 75406');
      Add('      mmTop = 5556');
      Add('      mmWidth = 29104');
      Add('      BandType = 0');
      Add('    end');
      Add('    object ppReport1DBText7: TppDBText');
      Add('      Alignment = taRightJustify');
      Add('      DataField = ''ValorRecibo''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 143934');
      Add('      mmTop = 17992');
      Add('      mmWidth = 23283');
      Add('      BandType = 0');
      Add('    end');
      Add('    object ppReport1Label8: TppLabel');
      Add('      Caption = ''Valor: ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = [fsBold]');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 123296');
      Add('      mmTop = 17992');
      Add('      mmWidth = 14817');
      Add('      BandType = 0');
      Add('    end');
      Add('    object Label1: TppLabel');
      Add('      Alignment = taCenter');
      Add('      Caption = ''R$ ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 137848');
      Add('      mmTop = 17992');
      Add('      mmWidth = 6350');
      Add('      BandType = 0');
      Add('    end');
      Add('    object Memo1: TppMemo');
      Add('      CharWrap = False');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Lines.Strings = (');
      Add('');
      Add('          ''123456789 123456789 123456789 123456789 123456789 123456789 1234'' +');
      Add('          ''56789 123''');
      Add('');
      Add('          ''456789 123456789 123456789 123456789 123456789 123456789 1234567'' +');
      Add('          ''89 123456''');
      Add('');
      Add('          ''789 123456789 123456789 123456789 123456789 123456789 123456789 '' +');
      Add('          ''123456789''');
      Add('        '''')');
      Add('      Transparent = True');
      Add('      Visible = False');
      Add('      mmHeight = 8467');
      Add('      mmLeft = 10054');
      Add('      mmTop = 22754');
      Add('      mmWidth = 155046');
      Add('      BandType = 0');
      Add('      mmBottomOffset = 0');
      Add('      mmOverFlowOffset = 0');
      Add('      mmLeading = 0');
      Add('    end');
      Add('  end');
      Add('  object ppReport1DetailBand1: TppDetailBand');
      Add('    PrintHeight = phDynamic');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 44186');
      Add('    mmPrintPosition = 0');
      Add('    object ppReport1Label2: TppLabel');
      Add('      AutoSize = False');
      Add('      Caption = ''Recebemos de ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 10054');
      Add('      mmTop = 1058');
      Add('      mmWidth = 27517');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText1: TppDBText');
      Add('      DataField = ''RAZAOSOCIAL''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 37306');
      Add('      mmTop = 1058');
      Add('      mmWidth = 127794');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label3: TppLabel');
      Add('      AutoSize = False');
      Add('      Caption = ''com sede à ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 10054');
      Add('      mmTop = 6085');
      Add('      mmWidth = 23283');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText2: TppDBText');
      Add('      DataField = ''ENDERECO''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 33073');
      Add('      mmTop = 6085');
      Add('      mmWidth = 132027');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label4: TppLabel');
      Add('      AutoSize = False');
      Add('      Caption = ''inscrita  no  CNPJ sob o nº''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 10054');
      Add('      mmTop = 11113');
      Add('      mmWidth = 57150');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText3: TppDBText');
      Add('      Alignment = taCenter');
      Add('      DataField = ''NUMDOCUMENTO''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      DisplayFormat = ''99.999.999/9999-99;0;''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 67204');
      Add('      mmTop = 11113');
      Add('      mmWidth = 40217');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label5: TppLabel');
      Add('      AutoSize = False');
      Add('      Caption = '', a  importância  supra  de''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 107156');
      Add('      mmTop = 11113');
      Add('      mmWidth = 57944');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label6: TppLabel');
      Add('      Caption = ''relativa ao pagamento do aluguel do mês de ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 10054');
      Add('      mmTop = 25929');
      Add('      mmWidth = 91017');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText6: TppDBText');
      Add('      Alignment = taCenter');
      Add('      DataField = ''datames''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 101600');
      Add('      mmTop = 25929');
      Add('      mmWidth = 36777');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBMemo1: TppDBMemo');
      Add('      CharWrap = True');
      Add('      DataField = ''Descricao''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 11');
      Add('      Font.Style = []');
      Add('      Stretch = True');
      Add('      Transparent = True');
      Add('      mmHeight = 13229');
      Add('      mmLeft = 12965');
      Add('      mmTop = 30956');
      Add('      mmWidth = 152136');
      Add('      BandType = 4');
      Add('      mmBottomOffset = 0');
      Add('      mmOverFlowOffset = 0');
      Add('      mmLeading = 0');
      Add('    end');
      Add('    object ppReport1Label9: TppLabel');
      Add('      Caption = ''referente a:''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 138907');
      Add('      mmTop = 25929');
      Add('      mmWidth = 26194');
      Add('      BandType = 4');
      Add('    end');
      Add('    object DBMemo1: TppDBMemo');
      Add('      CharWrap = False');
      Add('      DataField = ''ValorExtenso''');
      Add('      DataPipeline = frmCadRecibo.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Courier New''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 8996');
      Add('      mmLeft = 10054');
      Add('      mmTop = 16140');
      Add('      mmWidth = 155046');
      Add('      BandType = 4');
      Add('      mmBottomOffset = 0');
      Add('      mmOverFlowOffset = 0');
      Add('      mmLeading = 0');
      Add('    end');
      Add('  end');
      Add('  object ppReport1FooterBand1: TppFooterBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 0');
      Add('    mmPrintPosition = 0');
      Add('  end');
      Add('  object Group1: TppGroup');
      Add('    BreakName = ''CONNOME''');
      Add('    DataPipeline = frmCadRecibo.ppConsulta');
      Add('    NewPage = True');
      Add('    mmNewColumnThreshold = 0');
      Add('    mmNewPageThreshold = 0');
      Add('    object GroupHeaderBand1: TppGroupHeaderBand');
      Add('      mmBottomOffset = 0');
      Add('      mmHeight = 0');
      Add('      mmPrintPosition = 0');
      Add('    end');
      Add('    object GroupFooterBand1: TppGroupFooterBand');
      Add('      mmBottomOffset = 0');
      Add('      mmHeight = 59267');
      Add('      mmPrintPosition = 0');
      Add('      object ppReport1Label7: TppLabel');
      Add('        AutoSize = False');
      Add('        Caption = ''de propriedade deste instituto.''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Courier New''');
      Add('        Font.Size = 10');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4233');
      Add('        mmLeft = 10054');
      Add('        mmTop = 1058');
      Add('        mmWidth = 65617');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object ppReport1DBText8: TppDBText');
      Add('        Alignment = taRightJustify');
      Add('        AutoSize = True');
      Add('        DataField = ''dataatual''');
      Add('        DataPipeline = frmCadRecibo.ppConsulta');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Courier New''');
      Add('        Font.Size = 10');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4233');
      Add('        mmLeft = 148167');
      Add('        mmTop = 18785');
      Add('        mmWidth = 19050');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object ppReport1Label10: TppLabel');
      Add('        Caption = ''_________________''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 10');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4233');
      Add('        mmLeft = 75406');
      Add('        mmTop = 39158');
      Add('        mmWidth = 29104');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object ppReport1Label11: TppLabel');
      Add('        Caption = ''________________________''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 10');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4233');
      Add('        mmLeft = 65352');
      Add('        mmTop = 43921');
      Add('        mmWidth = 49213');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('    end');
      Add('  end');
      Add('end');

(*
      Add('object ppReport1: TppReport');
      Add('  DataPipeline = ppBDEPipeline1');
      Add('  PrinterSetup.BinName = ''Default''');
      Add('  PrinterSetup.DocumentName = ''ppReport1''');
      Add('  PrinterSetup.PaperName = ''A4 210 x 297 mm''');
      Add('  PrinterSetup.PrinterName = ''Default''');
      Add('  PrinterSetup.mmMarginBottom = 6350');
      Add('  PrinterSetup.mmMarginLeft = 6350');
      Add('  PrinterSetup.mmMarginRight = 6350');
      Add('  PrinterSetup.mmMarginTop = 6350');
      Add('  PrinterSetup.mmPaperHeight = 297000');
      Add('  PrinterSetup.mmPaperWidth = 210000');
      Add('  Left = 280');
      Add('  Top = 63');
      Add('  Version = ''3.52''');
      Add('  mmColumnWidth = 0');
      Add('  object ppReport1HeaderBand1: TppHeaderBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 25400');
      Add('    mmPrintPosition = 0');
      Add('    object ppReport1Label1: TppLabel');
      Add('      Caption = ''R E C I B O''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 16');
      Add('      Font.Style = [fsBold]');
      Add('      Transparent = True');
      Add('      mmHeight = 6350');
      Add('      mmLeft = 84138');
      Add('      mmTop = 5556');
      Add('      mmWidth = 29104');
      Add('      BandType = 0');
      Add('    end');
      Add('    object ppReport1DBText7: TppDBText');
      Add('      DataField = ''ValorRecibo''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 165894');
      Add('      mmTop = 18256');
      Add('      mmWidth = 28310');
      Add('      BandType = 0');
      Add('    end');
      Add('    object ppReport1Label8: TppLabel');
      Add('      Caption = ''Valor: ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = [fsBold]');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 153194');
      Add('      mmTop = 18256');
      Add('      mmWidth = 11113');
      Add('      BandType = 0');
      Add('    end');
      Add('  end');
      Add('  object ppReport1DetailBand1: TppDetailBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 115888');
      Add('    mmPrintPosition = 0');
      Add('    object ppReport1Label2: TppLabel');
      Add('      Caption = ''Recebemos de ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 4233');
      Add('      mmTop = 3969');
      Add('      mmWidth = 24077');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText1: TppDBText');
      Add('      DataField = ''RAZAOSOCIAL''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 29369');
      Add('      mmTop = 3969');
      Add('      mmWidth = 165100');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label3: TppLabel');
      Add('      Caption = ''com sede à ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 3969');
      Add('      mmTop = 8996');
      Add('      mmWidth = 19050');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText2: TppDBText');
      Add('      DataField = ''ENDERECO''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 23813');
      Add('      mmTop = 8996');
      Add('      mmWidth = 170657');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label4: TppLabel');
      Add('      Caption = ''inscrita no CGC sob o nº ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 3969');
      Add('      mmTop = 14023');
      Add('      mmWidth = 39158');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText3: TppDBText');
      Add('      DataField = ''NUMDOCUMENTO''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 43921');
      Add('      mmTop = 14023');
      Add('      mmWidth = 40481');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label5: TppLabel');
      Add('      Caption = '', a importância supra de ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 85196');
      Add('      mmTop = 14023');
      Add('      mmWidth = 38100');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText4: TppDBText');
      Add('      DataField = ''ValorRecibo''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 124090');
      Add('      mmTop = 14023');
      Add('      mmWidth = 32279');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText5: TppDBText');
      Add('      DataField = ''ValorExtenso''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 3969');
      Add('      mmTop = 18785');
      Add('      mmWidth = 190500');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label6: TppLabel');
      Add('      Caption = ''relativa ao pagamento do aluguel do mês de ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 3969');
      Add('      mmTop = 23548');
      Add('      mmWidth = 68263');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText6: TppDBText');
      Add('      DataField = ''datames''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 73025');
      Add('      mmTop = 23548');
      Add('      mmWidth = 48683');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBMemo1: TppDBMemo');
      Add('      CharWrap = False');
      Add('      DataField = ''Descricao''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 31750');
      Add('      mmLeft = 3969');
      Add('      mmTop = 28310');
      Add('      mmWidth = 190236');
      Add('      BandType = 4');
      Add('      mmBottomOffset = 0');
      Add('      mmOverFlowOffset = 0');
      Add('      mmLeading = 0');
      Add('    end');
      Add('    object ppReport1Label7: TppLabel');
      Add('      Caption = ''de propriedade deste instituto.''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 3969');
      Add('      mmTop = 60590');
      Add('      mmWidth = 46302');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label9: TppLabel');
      Add('      Caption = ''referente à:''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 122502');
      Add('      mmTop = 23548');
      Add('      mmWidth = 17198');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1DBText8: TppDBText');
      Add('      DataField = ''dataatual''');
      Add('      DataPipeline = ppBDEPipeline1');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 115888');
      Add('      mmTop = 75671');
      Add('      mmWidth = 78846');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label10: TppLabel');
      Add('      Caption = ''Jorge Costa Pondé''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 84138');
      Add('      mmTop = 102659');
      Add('      mmWidth = 29104');
      Add('      BandType = 4');
      Add('    end');
      Add('    object ppReport1Label11: TppLabel');
      Add('      Caption = ''DIRETOR DE INVESTIMENTOS''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 10');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 4233');
      Add('      mmLeft = 74083');
      Add('      mmTop = 107421');
      Add('      mmWidth = 49213');
      Add('      BandType = 4');
      Add('    end');
      Add('  end');
      Add('  object ppReport1FooterBand1: TppFooterBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 13229');
      Add('    mmPrintPosition = 0');
      Add('  end');
      Add('end');
*)
   end;

   Result := stemp.Text;
end;



procedure TfrmDesenhoRelRecibo.FormCreate(Sender: TObject);
begin
   inherited;

   ArqModelo := 'Recibo.tmp';

   if not(qry.Prepared) then qry.Prepare;
   if not(qryReports.Prepared) then qryReports.Prepare;

   qry.Open;
end;



procedure TfrmDesenhoRelRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if qry.Active then qry.Close;
   if qryReports.Active then qryReports.Close;

   if qry.Prepared then qry.unPrepare;
   if qryReports.Prepared then qryReports.unPrepare;

   inherited;
end;



procedure TfrmDesenhoRelRecibo.mnifilePageSetupClick(Sender: TObject);
var
   lPageSetupDlg: TppCustomPageSetupDialog;
   lFormClass: TFormClass;
begin
   inherited;

   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass     := ppGetFormClass(TppCustomPageSetupDialog);
   lPageSetupDlg  := TppCustomPageSetupDialog(lFormClass.Create(Self));

   lPageSetupDlg.Report := DsgnCM.CurrentReport;
   lPageSetupDlg.ShowModal;

   lPageSetupDlg.Free;
end;



procedure TfrmDesenhoRelRecibo.mnifilePrintClick(Sender: TObject);
begin
   inherited;

   if (DsgnCM.Report = nil) then Exit;
   DsgnCM.PrintReport;
end;



procedure TfrmDesenhoRelRecibo.mnifilePrintToFileSetupClick(Sender: TObject);
var
   lTextFileDialog   : TppCustomPrintToFileSetupDialog;
   lFormClass        : TFormClass;
begin
   inherited;
   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass        := ppGetFormClass(TppCustomPrintToFileSetupDialog);
   lTextFileDialog   := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

   lTextFileDialog.Report        := DsgnCM.Report;
   lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;

   lTextFileDialog.ShowModal;

   lTextFileDialog.Free;
end;



end.
