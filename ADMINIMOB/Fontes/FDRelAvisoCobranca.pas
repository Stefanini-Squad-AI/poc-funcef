{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.18 / 5.10.17 / 5.10.16
Pendência    : 27228
Responsável  : Daniel Simões
Data         : 21/01/2008
Descrição    : Inclusão do campo 'VALOR_OUTROS' na query 'qryDiscriminado' ...
--------------------------------------------------------------------------------
Padrão      : 5.10.19
Pendência   : 26812
Responsável : Daniel Simões
Data        : 06/12/2007
Descrição   : Ajuste na query do relatório para não trazer registros
              discriminados duplicados e mudança no layout...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FDRelAvisoCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus,

  ppEndUsr, ppCache, ppDB, ppDBBDE, ppForms,
  ppComm, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, Pptypes,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, FCadastroCSImob, FDRel, DBCtrls, ppRelatv, ppDBPipe,
  CmEventosCadastro, ImgList, OleServer, Word97;

type
  TfrmDesenhoRelAvisoCobranca = class(TfrmDesenhoRel)
    qryIDCARTACOBRANCA: TFloatField;
    qryMODELOCARTA: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryFLGTIPOCARTA: TStringField;
    DBrdgTipoCobranca: TDBRadioGroup;
    qryCobranca: TwwQuery;
    qryCobrancaDESCALC: TStringField;
    qryCobrancaDataPagamento: TDateField;
    qryCobrancadataatual: TStringField;
    qryCobrancadatajuros: TStringField;
    qryCobrancadatames: TStringField;
    qryCobrancaContratoExtenso: TStringField;
    qryCobrancaIMONOME: TStringField;
    qryCobrancaCONNUMERO: TStringField;
    qryCobrancaCONNOME: TStringField;
    qryCobrancaCONDIASTOLERANCIA: TFloatField;
    qryCobrancaFLGTIPODIATOLERA: TStringField;
    qryCobrancaNOME_IMOVEL: TStringField;
    qryCobrancaRAZAOSOCIAL: TStringField;
    qryCobrancaNOME_CONTATO: TStringField;
    qryCobrancaCONTA_CORRENTE: TStringField;
    qryCobrancaNOME_BANCO: TStringField;
    qryCobrancaNUMBANCO: TStringField;
    qryCobrancaNUMAGENCIA: TStringField;
    qryCobrancaVLRMULTA: TFloatField;
    qryCobrancaVLRJUROS: TFloatField;
    qryCobrancaVLRCORRECAOMON: TFloatField;
    qryCobrancaMESREFERENCIA: TFloatField;
    qryCobrancaANOREFERENCIA: TFloatField;
    qryCobrancaMESCOMPETENCIA: TFloatField;
    qryCobrancaANOCOMPETENCIA: TFloatField;
    qryCobrancaDATALANCAMENTO: TDateTimeField;
    qryCobrancaDATAVENCIMENTO: TDateTimeField;
    qryCobrancaDATACORRECAO: TDateTimeField;
    qryCobrancaDESCCUSTORECIMO: TStringField;
    qryCobrancaOPERACAO: TStringField;
    qryCobrancaDATALANCTO: TDateTimeField;
    qryCobrancaDESCRICAO: TStringField;
    qryCobrancaVALOR: TFloatField;
    qryCobrancaNOME_AGENCIA: TStringField;
    qryCobrancaDATA: TDateTimeField;
    qryCobrancaNOME_MESTRE: TStringField;
    qryCobrancaNOME_EXTENSO: TStringField;
    qryCobrancaCODESTADO: TStringField;
    qryCobrancadesc: TStringField;
    qryCobrancaValorExtenso: TStringField;
    qryCobrancames: TStringField;
    qryConsolidado: TwwQuery;
    qryConsolidadoDESCALC: TStringField;
    qryConsolidadoDataPagamento: TDateField;
    qryConsolidadodataatual: TStringField;
    qryConsolidadodatajuros: TStringField;
    qryConsolidadodatames: TStringField;
    qryConsolidadoContratoExtenso: TStringField;
    qryConsolidadodesc: TStringField;
    qryConsolidadoValorExtenso: TStringField;
    qryConsolidadomes: TStringField;
    qryConsolidadoCONNUMERO: TStringField;
    qryConsolidadoCONNOME: TStringField;
    qryConsolidadoCONDIASTOLERANCIA: TFloatField;
    qryConsolidadoFLGTIPODIATOLERA: TStringField;
    qryConsolidadoCODESTADO: TStringField;
    qryConsolidadoRAZAOSOCIAL: TStringField;
    qryConsolidadoNOME_CONTATO: TStringField;
    qryConsolidadoCONTA_CORRENTE: TStringField;
    qryConsolidadoNOME_BANCO: TStringField;
    qryConsolidadoNOME_AGENCIA: TStringField;
    qryConsolidadoNUMBANCO: TStringField;
    qryConsolidadoNUMAGENCIA: TStringField;
    qryConsolidadoMESREFERENCIA: TFloatField;
    qryConsolidadoANOREFERENCIA: TFloatField;
    qryConsolidadoMESCOMPETENCIA: TFloatField;
    qryConsolidadoANOCOMPETENCIA: TFloatField;
    qryConsolidadoDATAVENCIMENTO: TDateTimeField;
    qryConsolidadoDATACORRECAO: TDateTimeField;
    qryConsolidadoOPERACAO: TStringField;
    qryConsolidadoDATALANCTO: TDateTimeField;
    qryConsolidadoDATA: TDateTimeField;
    qryConsolidadoDESCRICAO: TStringField;
    qryConsolidadoVALOR: TFloatField;
    qryDiscriminado: TwwQuery;
    qryDiscriminadoDESCCUSTORECIMO: TStringField;
    qryDiscriminadoCONNUMERO: TStringField;
    qryDiscriminadoCONNOME: TStringField;
    qryDiscriminadoCODESTADO: TStringField;
    qryDiscriminadoRAZAOSOCIAL: TStringField;
    qryDiscriminadoNOME_CONTATO: TStringField;
    qryDiscriminadoCONTA_CORRENTE: TStringField;
    qryDiscriminadoNOME_BANCO: TStringField;
    qryDiscriminadoNOME_AGENCIA: TStringField;
    qryDiscriminadoNUMBANCO: TStringField;
    qryDiscriminadoNUMAGENCIA: TStringField;
    qryDiscriminadoMESREFERENCIA: TFloatField;
    qryDiscriminadoANOREFERENCIA: TFloatField;
    qryDiscriminadoMESCOMPETENCIA: TFloatField;
    qryDiscriminadoANOCOMPETENCIA: TFloatField;
    qryDiscriminadoDATAVENCIMENTO: TDateTimeField;
    qryDiscriminadoVALOR: TFloatField;
    qryDiscriminadoVALOR_MULTA: TFloatField;
    qryDiscriminadoVALOR_JUROS: TFloatField;
    qryDiscriminadoVALOR_CORRMON: TFloatField;
    qryDiscriminadoValorTotal2: TCurrencyField;
    qryDiscriminadoMes2: TStringField;
    qryDiscriminadoValorExtenso2: TStringField;
    qryDiscriminadoContratoExtenso2: TStringField;
    qryDiscriminadoCONDATAASSINATURA: TDateTimeField;
    qryDiscriminadoCONDATAINICIO: TDateTimeField;
    qryDiscriminadoCONDATAREAJUSTE: TDateTimeField;
    qryDiscriminadoVLR_ATUAL_CONTRATO: TFloatField;
    qryDiscriminadoVLR_ANT_CONTRATO: TFloatField;
    qryConsolidadoCONDATAREAJUSTE: TDateTimeField;
    qryConsolidadoVLR_ATUAL_CONTRATO: TFloatField;
    qryConsolidadoVLR_ANT_CONTRATO: TFloatField;
    qryCobrancaCONDATAREAJUSTE: TDateTimeField;
    qryCobrancaVLR_ATUAL_CONTRATO: TFloatField;
    qryCobrancaVLR_ANT_CONTRATO: TFloatField;
    qryDiscriminadoENDERECO: TStringField;
    qryConsolidadoENDERECO: TStringField;
    qryCobrancaENDERECO: TStringField;
    qryConsolidadoDESCCUSTORECIMO: TStringField;
    qryConsolidadoCONINDICEREAJUSTE: TFloatField;
    qryConsolidadoCONPERREAJUSTE: TFloatField;
    qryDiscriminadoCONINDICEREAJUSTE: TFloatField;
    qryDiscriminadoCONPERREAJUSTE: TFloatField;
    WordLetterContent1: TWordLetterContent;
    qryCobrancaCONINDICEREAJUSTE: TFloatField;
    qryCobrancaCONPERREAJUSTE: TFloatField;
    qryDiscriminadoDesc: TStringField;
    qryConsolidadoAREA_LOCADA: TFloatField;
    qryConsolidadoNOME_CIDADE: TStringField;
    qryConsolidadoCEP: TStringField;
    qryDiscriminadoDATAPROGRAMADA: TDateTimeField;
    qryCobrancaDATAPROGRAMADA: TDateTimeField;
    qryConsolidadoDATAPROGRAMADA: TDateTimeField;
    qryCobrancaCEP: TStringField;
    qryCobrancaAREA_LOCADA: TFloatField;
    qryCobrancaDatasAnteriores: TStringField;
    qryConsolidadoDatasAnteriores: TStringField;
    qryDiscriminadoDatasAnteriores: TStringField;
    qryCobrancaDATAPROGRAMADA_1: TDateTimeField;
    qryCobrancaImovelLocado: TStringField;
    qryDiscriminadoImovelLocado: TStringField;
    qryConsolidadoImovelLocado: TStringField;
    qryDiscriminadoCEP: TStringField;
    qryDiscriminadoAREA_LOCADA: TFloatField;
    qryDiscriminadoIDCONTRATOIMOVEL: TFloatField;
    qryDiscriminadoCODDOCUMENTO: TFloatField;
    qryDiscriminadoVALOR_OUTROS: TFloatField;
    qryDiscriminadoVALOR_BAIXA: TFloatField;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);

    function GetCmCartaCob: string;
    procedure FormCreate(Sender: TObject);
    procedure mnifilePrintToFileSetupClick(Sender: TObject);
    procedure mnifilePrintClick(Sender: TObject);
    procedure mnifilePageSetupClick(Sender: TObject);
    procedure btnDesenhoClick(Sender: TObject);


  private { Private declarations }
    RptCM       : TppReport;
    
  public { Public declarations }

  end;



var
  frmDesenhoRelAvisoCobranca: TfrmDesenhoRelAvisoCobranca;



implementation
{$R *.DFM}
uses
   uSistema, uDataBase, uMensErro, uFuncoesImob;



procedure TfrmDesenhoRelAvisoCobranca.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('PCARTACOBRANCA').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmDesenhoRelAvisoCobranca.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   CmeCadastro.RepetirInsert := false;  
   memReports.Lines.Clear;
   memReports.Lines.Text := GetCMCartaCob;
   memReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);

   qryIdCartaCobranca.asFloat := LeUltRegistro(nil,'CARTACOBRANCA');
   qryIDREPORTS.asInteger     := LeUltRegistro(nil,'REPORTS');
   qryORIGEMCM.asInteger      := 0;
   qryFLGTIPOCARTA.asString   := 'I';
end;



procedure TfrmDesenhoRelAvisoCobranca.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryReports.Close;

   if not(qryReports.Prepared) then qryReports.Prepare;
   qryReports.ParamByName('PREPORT').asInteger     := qryIDREPORTS.asInteger;
   qryReports.ParamByName('PORIGEMCM').asInteger   := qryORIGEMCM.asInteger;
   qryReports.Open;

   memReports.Lines.Clear;

   // Carrega no Memo o texto DFM do modelo de relatório
   memReports.Lines.Text := qryReportsTEMPLATE.asString;
end;



function TfrmDesenhoRelAvisoCobranca.GetCmCartaCob: string;
var
   sTemp : tStringList;
begin
   // Carrega o texto DFM de um modelo de relatório padrão em uma StringList

   sTemp:= tStringList.Create;

   with sTemp do begin
      Clear;

      Add('object TppReport');
      Add('  DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('  PrinterSetup.BinName = ''Default''');
      Add('  PrinterSetup.DocumentName = ''PpModeloReport1''');
      Add('  PrinterSetup.PaperName = ''A4-ISO (210 x 297 mm)''');
      Add('  PrinterSetup.PrinterName = ''Default''');
      Add('  PrinterSetup.mmMarginBottom = 6350');
      Add('  PrinterSetup.mmMarginLeft = 6350');
      Add('  PrinterSetup.mmMarginRight = 6350');
      Add('  PrinterSetup.mmMarginTop = 6350');
      Add('  PrinterSetup.mmPaperHeight = 297127');
      Add('  PrinterSetup.mmPaperWidth = 210079');
      Add('  SaveAsTemplate = True');
      Add('  Template.FileName = ''C:\WINDOWS\TEMP\AvisoCobranca.tmp''');
      Add('  Template.Format = ftASCII');
      Add('  AllowPrintToArchive = True');
      Add('  AllowPrintToFile = True');
      Add('  Language = lgPortugueseBrazil');
      Add('  Version = ''3.52''');
      Add('  mmColumnWidth = 197300');
      Add('  object ppDetailBand1: TppDetailBand');
      Add('    mmBottomOffset = 0');
      Add('    mmHeight = 5027');
      Add('    mmPrintPosition = 0');
      Add('    object rpCartaCobrancaDBText3: TppDBText');
      Add('      Alignment = taRightJustify');
      Add('      DataField = ''MESCOMPETENCIA''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 11906');
      Add('      mmTop = 529');
      Add('      mmWidth = 3440');
      Add('      BandType = 4');
      Add('    end');
      Add('    object rpCartaCobrancaDBText5: TppDBText');
      Add('      DataField = ''DESCCUSTORECIMO''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 80963');
      Add('      mmTop = 529');
      Add('      mmWidth = 36248');
      Add('      BandType = 4');
      Add('    end');
      Add('    object rpCartaCobrancaDBText7: TppDBText');
      Add('      Alignment = taCenter');
      Add('      DataField = ''DATALANCTO''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      DisplayFormat = ''dd/mm/yyyy''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      ParentDataPipeline = False');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 119063');
      Add('      mmTop = 529');
      Add('      mmWidth = 15081');
      Add('      BandType = 4');
      Add('    end');
      Add('    object rpCartaCobrancaDBText8: TppDBText');
      Add('      Alignment = taRightJustify');
      Add('      DataField = ''VALOR''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      ParentDataPipeline = False');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 135996');
      Add('      mmTop = 529');
      Add('      mmWidth = 16140');
      Add('      BandType = 4');
      Add('    end');
      Add('    object DBText4: TppDBText');
      Add('      DataField = ''NOME_IMOVEL''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      ParentDataPipeline = False');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 24871');
      Add('      mmTop = 529');
      Add('      mmWidth = 54504');
      Add('      BandType = 4');
      Add('    end');
      Add('    object rpCartaCobrancaDBText4: TppDBText');
      Add('      DataField = ''DESCCALC''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      ParentDataPipeline = False');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 153988');
      Add('      mmTop = 529');
      Add('      mmWidth = 36777');
      Add('      BandType = 4');
      Add('    end');
      Add('    object DBText1: TppDBText');
      Add('      DataField = ''ANOCOMPETENCIA''');
      Add('      DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 16933');
      Add('      mmTop = 529');
      Add('      mmWidth = 7144');
      Add('      BandType = 4');
      Add('    end');
      Add('    object Label2: TppLabel');
      Add('      Caption = '' / ''');
      Add('      Font.Charset = DEFAULT_CHARSET');
      Add('      Font.Color = clBlack');
      Add('      Font.Name = ''Arial''');
      Add('      Font.Size = 8');
      Add('      Font.Style = []');
      Add('      Transparent = True');
      Add('      mmHeight = 3704');
      Add('      mmLeft = 15081');
      Add('      mmTop = 529');
      Add('      mmWidth = 2117');
      Add('      BandType = 4');
      Add('    end');
      Add('  end');
      Add('  object rpCartaCobrancaGroup1: TppGroup');
      Add('    BreakName = ''RAZAOSOCIAL''');
      Add('    DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('    NewPage = True');
      Add('    ResetPageNo = True');
      Add('    mmNewColumnThreshold = 0');
      Add('    mmNewPageThreshold = 0');
      Add('    object rpCartaCobrancaGroupHeaderBand1: TppGroupHeaderBand');
      Add('      mmBottomOffset = 0');
      Add('      mmHeight = 96838');
      Add('      mmPrintPosition = 0');
      Add('      object rpCartaCobrancaLabel1: TppLabel');
      Add('        Caption = ''     ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12700');
      Add('        mmTop = 24077');
      Add('        mmWidth = 14023');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel2: TppLabel');
      Add('        Caption = ''A/Ao''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12700');
      Add('        mmTop = 30427');
      Add('        mmWidth = 7938');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaDBText1: TppDBText');
      Add('        AutoSize = True');
      Add('        DataField = ''RAZAOSOCIAL''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12700');
      Add('        mmTop = 34660');
      Add('        mmWidth = 26988');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel3: TppLabel');
      Add('        Caption = ''Att.''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12700');
      Add('        mmTop = 38894');
      Add('        mmWidth = 5556');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel7: TppLabel');
      Add('        Caption = ''Contrato:''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12700');
      Add('        mmTop = 50536');
      Add('        mmWidth = 15875');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaDBText2: TppDBText');
      Add('        AutoSize = True');
      Add('        DataField = ''CONNUMERO''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 32808');
      Add('        mmTop = 50536');
      Add('        mmWidth = 25665');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaMemo1: TppMemo');
      Add('        CharWrap = False');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Lines.Strings = (');
      Add('');
      Add('            ''Discriminamos abaixo aviso de cobrança de obrigações contratuais'' +');
      Add('            '' referentes aos meses indicados:'')');
      Add('        Transparent = True');
      Add('        mmHeight = 5027');
      Add('        mmLeft = 12435');
      Add('        mmTop = 76994');
      Add('        mmWidth = 178065');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('        mmBottomOffset = 0');
      Add('        mmOverFlowOffset = 0');
      Add('        mmLeading = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel8: TppLabel');
      Add('        Alignment = taRightJustify');
      Add('        Caption = ''Prezado(s) Senhor(es),     ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 12435');
      Add('        mmTop = 62442');
      Add('        mmWidth = 46038');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel10: TppLabel');
      Add('        Caption = ''Imóvel''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 24871');
      Add('        mmTop = 92075');
      Add('        mmWidth = 9790');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel11: TppLabel');
      Add('        Caption = ''Despesa''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 80963');
      Add('        mmTop = 92075');
      Add('        mmWidth = 12700');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel13: TppLabel');
      Add('        Caption = ''Data Venc.''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 119063');
      Add('        mmTop = 92075');
      Add('        mmWidth = 15081');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel14: TppLabel');
      Add('        Caption = ''Valor''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 144463');
      Add('        mmTop = 92075');
      Add('        mmWidth = 7673');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaDBText9: TppDBText');
      Add('        Alignment = taRightJustify');
      Add('        DataField = ''DATAATUAL''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 10');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4233');
      Add('        mmLeft = 119063');
      Add('        mmTop = 24077');
      Add('        mmWidth = 71438');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Label1: TppLabel');
      Add('        Caption = ''Mês''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 11906');
      Add('        mmTop = 92075');
      Add('        mmWidth = 6350');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object ppLine1: TppLine');
      Add('        Weight = 0.75');
      Add('        mmHeight = 529');
      Add('        mmLeft = 11906');
      Add('        mmTop = 95779');
      Add('        mmWidth = 179123');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object ppLine2: TppLine');
      Add('        Weight = 0.75');
      Add('        mmHeight = 529');
      Add('        mmLeft = 11906');
      Add('        mmTop = 96044');
      Add('        mmWidth = 179123');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel4: TppLabel');
      Add('        Caption = ''Descrição''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 153988');
      Add('        mmTop = 92075');
      Add('        mmWidth = 14288');
      Add('        BandType = 3');
      Add('        GroupNo = 0');
      Add('      end');
      Add('    end');
      Add('    object rpCartaCobrancaGroupFooterBand1: TppGroupFooterBand');
      Add('      mmBottomOffset = 0');
      Add('      mmHeight = 76994');
      Add('      mmPrintPosition = 0');
      Add('      object rpCartaCobrancaLabel5: TppLabel');
      Add('        Caption = ''O valor indicado acima pode ser pago sem acréscimo até o dia ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 10848');
      Add('        mmTop = 19315');
      Add('        mmWidth = 110331');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Shape2: TppShape');
      Add('        mmHeight = 5821');
      Add('        mmLeft = 121179');
      Add('        mmTop = 2910');
      Add('        mmWidth = 32015');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Shape1: TppShape');
      Add('        mmHeight = 5292');
      Add('        mmLeft = 121444');
      Add('        mmTop = 3175');
      Add('        mmWidth = 31485');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel22: TppLabel');
      Add('        Caption = ''Atenciosamente,''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 10848');
      Add('        mmTop = 38100');
      Add('        mmWidth = 28840');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel23: TppLabel');
      Add('        Alignment = taCenter');
      Add('        Caption = ''                    ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 10583');
      Add('        mmTop = 53975');
      Add('        mmWidth = 72496');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaLabel24: TppLabel');
      Add('        Alignment = taCenter');
      Add('        Caption = ''                 ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 10583');
      Add('        mmTop = 58738');
      Add('        mmWidth = 72496');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Line3: TppLine');
      Add('        Weight = 0.75');
      Add('        mmHeight = 529');
      Add('        mmLeft = 11906');
      Add('        mmTop = 529');
      Add('        mmWidth = 179123');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Line4: TppLine');
      Add('        Weight = 0.75');
      Add('        mmHeight = 529');
      Add('        mmLeft = 11906');
      Add('        mmTop = 794');
      Add('        mmWidth = 179123');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Line5: TppLine');
      Add('        Weight = 0.75');
      Add('        mmHeight = 529');
      Add('        mmLeft = 10583');
      Add('        mmTop = 53711');
      Add('        mmWidth = 72496');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object DBCalc1: TppDBCalc');
      Add('        Alignment = taRightJustify');
      Add('        DataField = ''VALOR''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        DisplayFormat = ''###,###,###,0.00;(###,###,###,0.00)''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = []');
      Add('        ParentDataPipeline = False');
      Add('        Transparent = True');
      Add('        ResetGroup = rpCartaCobrancaGroup1');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 130969');
      Add('        mmTop = 3969');
      Add('        mmWidth = 21167');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object rpCartaCobrancaDBText6: TppDBText');
      Add('        AutoSize = True');
      Add('        DataField = ''DataPagamento''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        DisplayFormat = ''dd/mm/yyyy''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 120915');
      Add('        mmTop = 19315');
      Add('        mmWidth = 28046');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Label3: TppLabel');
      Add('        Caption = ''Total: ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 8');
      Add('        Font.Style = [fsBold]');
      Add('        Transparent = True');
      Add('        mmHeight = 3704');
      Add('        mmLeft = 122502');
      Add('        mmTop = 3969');
      Add('        mmWidth = 8731');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object Label4: TppLabel');
      Add('        Caption = ''Valores calculados até  ''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 10848');
      Add('        mmTop = 25929');
      Add('        mmWidth = 41010');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('      object DBText2: TppDBText');
      Add('        AutoSize = True');
      Add('        DataField = ''DATACORRECAO''');
      Add('        DataPipeline = frmCadAvisoCobranca.ppConsulta');
      Add('        DisplayFormat = ''dd/mm/yyyy''');
      Add('        Font.Charset = DEFAULT_CHARSET');
      Add('        Font.Color = clBlack');
      Add('        Font.Name = ''Arial''');
      Add('        Font.Size = 11');
      Add('        Font.Style = []');
      Add('        Transparent = True');
      Add('        mmHeight = 4498');
      Add('        mmLeft = 51594');
      Add('        mmTop = 25929');
      Add('        mmWidth = 33073');
      Add('        BandType = 5');
      Add('        GroupNo = 0');
      Add('      end');
      Add('    end');
      Add('  end');
      Add('end');

   end;

   Result := stemp.Text;
end;



procedure TfrmDesenhoRelAvisoCobranca.FormCreate(Sender: TObject);
begin
   inherited;
   // Variável declarada no Form PAI e inicializada aqui.
   ArqModelo := 'AvisoCobranca.tmp';

   if not(qry.Prepared) then qry.Prepare;
   if not(qryReports.Prepared) then qryReports.Prepare;

   qry.Open;
end;



procedure TfrmDesenhoRelAvisoCobranca.mnifilePageSetupClick(Sender: TObject);
var
   lPageSetupDlg: TppCustomPageSetupDialog;
   lFormClass: TFormClass;
begin
   // Este evento não está sendo utilizado
   inherited;

   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass     := ppGetFormClass(TppCustomPageSetupDialog);
   lPageSetupDlg  := TppCustomPageSetupDialog(lFormClass.Create(Self));

   lPageSetupDlg.Report := DsgnCM.CurrentReport;
   lPageSetupDlg.ShowModal;

   lPageSetupDlg.Free;
end;



procedure TfrmDesenhoRelAvisoCobranca.mnifilePrintClick(Sender: TObject);
begin
   inherited;
   // Este evento não está sendo utilizado
   if (DsgnCM.Report = nil) then Exit;
   DsgnCM.PrintReport;
end;



procedure TfrmDesenhoRelAvisoCobranca.mnifilePrintToFileSetupClick(Sender: TObject);
var
   lTextFileDialog   : TppCustomPrintToFileSetupDialog;
   lFormClass        : TFormClass;
begin
   // Este evento não está sendo utilizado
   inherited;
   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass        := ppGetFormClass(TppCustomPrintToFileSetupDialog);
   lTextFileDialog   := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

   lTextFileDialog.Report        := DsgnCM.Report;
   lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;

   lTextFileDialog.ShowModal;

   lTextFileDialog.Free;
end;



procedure TfrmDesenhoRelAvisoCobranca.btnDesenhoClick(Sender: TObject);
begin
   // Dependendo da opção selecionada para o TIPO DE MODELO, associa um DATASOURCE
   // a QUERY correspondente.
   case qryFLGTIPOCARTA.AsString[1] of
      'I': begin
              dsConsulta.DataSet := qryCobranca;
              inherited;
           end;
      'S': begin
              dsConsulta.DataSet := qryConsolidado;
              inherited;
           end;
      'D': begin
              dsConsulta.DataSet := qryDiscriminado;
              inherited;
           end;
   else
      MsgDlg ('Antes de desenhar o modelo o tipo deve ser preenchido.','Tipo Modelo Inválido',mtwarning,[mbok],0);
      DBrdgTipoCobranca.SetFocus;
   end;
end;

end.


