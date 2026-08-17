unit dRelatorioCartaComun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBBDE, ppBands, ppCtrls, ppClass, ppStrtch, ppMemo, ppPrnabl,
  ppCache, ppComm, ppProd, ppReport, ppEndUsr, ppDBPipe, ppRelatv, ppRichTx,
  uExtensoCM;

type
  TdtmRelatorioCartaComun = class(TForm)
    dsgnCartaComun: TppDesigner;
    rpCartaComun: TppReport;
    rpCartaComunHdrBnd6: TppHeaderBand;
    rpCartaComunDbTxtEMPRESA: TppDBText;
    rpCartaComunDtlBnd: TppDetailBand;
    rpCartaComunMemTEXTO: TppRichText;
    rpCartaComunFootBnd: TppFooterBand;
    rpCartaComunDbTxtEMPRESA2: TppDBText;
    rpCartaComunGroup1: TppGroup;
    rpCartaComunGrpHdrNOME: TppGroupHeaderBand;
    rpCartaComunLabel1: TppLabel;
    rpCartaComunDbTxtNOME: TppDBText;
    rpCartaComunDbTxtENDERECO: TppDBText;
    rpCartaComunDbTxtBAIRRO: TppDBText;
    rpCartaComunDbTxtCEPCID: TppDBText;
    rpCartaComunLabel2: TppLabel;
    rpCartaComunDbTxtASSUNTO: TppDBText;
    rpCartaComunLblDATA: TppLabel;
    rpCartaComunGroupFooterBand1: TppGroupFooterBand;
    ppCartaComun: TppBDEPipeline;
    dsCartaComun: TwwDataSource;
    qryCartaComun: TwwQuery;
    ExtensoCM: TExtensoCM;
    procedure qryCartaComunBeforeOpen(DataSet: TDataSet);
    procedure rpCartaComunBeforePrint(Sender: TObject);
    procedure rpCartaComunLblDATAPrint(Sender: TObject);
    procedure rpCartaComunGrpHdrNOMEAfterPrint(Sender: TObject);
  public
    bSelecPessoa: boolean;
    byNossoNome, byNomeEnd: byte;
    function GetLayoutPadrao: TStringList;
  end;

var
  dtmRelatorioCartaComun: TdtmRelatorioCartaComun;

implementation

uses fAguarde;

{$R *.DFM}

procedure TdtmRelatorioCartaComun.qryCartaComunBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Cartas ou Comunicados');
  frmAguarde.pbAguarde.Visible := false;
end;

procedure TdtmRelatorioCartaComun.rpCartaComunBeforePrint(Sender: TObject);
begin
  rpCartaComunDbTxtEMPRESA.Visible := (byNossoNome in [0,2]);
  rpCartaComunDbTxtEMPRESA2.Visible := (byNossoNome in [1,2]);
  rpCartaComunGrpHdrNOME.Visible := (byNomeEnd = 0);
  frmAguarde.Apaga;  
end;

procedure TdtmRelatorioCartaComun.rpCartaComunLblDATAPrint(Sender: TObject);
begin
  rpCartaComunLblDATA.Caption := FormatDateTime('dd "de" mmmm "de" yyyy',
    qryCartaComun.FieldByName('DTT').asDateTime);
end;

procedure TdtmRelatorioCartaComun.rpCartaComunGrpHdrNOMEAfterPrint(Sender: TObject);
var
  c: byte;
  iPos: integer;
  sTexto, sAux: string;  
begin
  sTexto := qryCartaComun.FieldByName('TEXTO').asString;

  // Substituo o valor do salário por extenso
  repeat
    iPos := Pos('<SAE>', sTexto);
    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 5);
      ExtensoCM.Valor := qryCartaComun.FieldByName('SAL').asFloat;
      ExtensoCM.Escreve;
      Insert(ExtensoCM.Extenso, sTexto, iPos);
    end;
  until (iPos < 1);

  // Substituo o Número da Faixa para o Cargo Oficial e Eventual
  for c:=1 to 2 do
  repeat
    if (c = 1) then
      iPos := Pos('<STC>', sTexto)
    else
      iPos := Pos('<STF>', sTexto);

    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 5);

      with (qryCartaComun) do
      begin
        if (FieldByName('FLGNIVELINDIV').asInteger = 0) then
        begin
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP1').asFloat) then
            sAux := '1'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP2').asFloat) then
            sAux := '2'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP3').asFloat) then
            sAux := '3'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP4').asFloat) then
            sAux := '4'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP5').asFloat) then
            sAux := '5'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP6').asFloat) then
            sAux := '6'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP7').asFloat) then
            sAux := '7'
          else
          if (FieldByName('SALARIOATUAL').asFloat <= FieldByName('FS'+IntToStr(c)+'_STEP8').asFloat) then
            sAux := '8'
          else
            sAux := '9';
        end
        else
          sAux := FieldByName('NIVELINDIV'+IntToStr(c)).asString;
      end;
      Insert(sAux, sTexto, iPos);
    end;
  until (iPos < 1);

  rpCartaComunMemTEXTO.RichText := sTexto;
end;

function TdtmRelatorioCartaComun.GetLayoutPadrao: TStringList;
var
  LayoutPadrao: TStringList;
begin
  LayoutPadrao := TStringList.Create;

  with (LayoutPadrao) do
  begin
    Clear;
    Add('object rpCartaComun: TppReport');
    Add('  AutoStop = False');
    Add('  DataPipeline = ppCartaComun');
    Add('  PrinterSetup.BinName = ''Default''');
    Add('  PrinterSetup.DocumentName = ''Cartas ou Comunicados''');
    Add('  PrinterSetup.PaperName = ''A4''');
    Add('  PrinterSetup.PrinterName = ''Default''');
    Add('  PrinterSetup.mmMarginBottom = 4350');
    Add('  PrinterSetup.mmMarginLeft = 6350');
    Add('  PrinterSetup.mmMarginRight = 6350');
    Add('  PrinterSetup.mmMarginTop = 6350');
    Add('  PrinterSetup.mmPaperHeight = 297000');
    Add('  PrinterSetup.mmPaperWidth = 210000');
    Add('  PrinterSetup.PaperSize = 9');
    Add('  Template.SaveTo = stDatabase');
    Add('  Units = utScreenPixels');
    Add('  AllowPrintToArchive = True');
    Add('  AllowPrintToFile = True');
    Add('  BeforePrint = rpCartaComunBeforePrint');
    Add('  CachePages = True');
    Add('  DeviceType = ''Screen''');
    Add('  Left = 126');
    Add('  Top = 44');
    Add('  Version = ''5.5''');
    Add('  mmColumnWidth = 197300');
    Add('  object rpCartaComunHdrBnd6: TppHeaderBand');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 10583');
    Add('    mmPrintPosition = 0');
    Add('    object rpCartaComunDbTxtEMPRESA: TppDBText');
    Add('      UserName = ''rpCartaComunDbTxtEMPRESA''');
    Add('      AutoSize = True');
    Add('      DataField = ''RZSE''');
    Add('      DataPipeline = ppCartaComun');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 10');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3969');
    Add('      mmLeft = 10583');
    Add('      mmTop = 3175');
    Add('      mmWidth = 9525');
    Add('      BandType = 0');
    Add('    end');
    Add('  end');
    Add('  object rpCartaComunDtlBnd: TppDetailBand');
    Add('    PrintHeight = phDynamic');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 27781');
    Add('    mmPrintPosition = 0');
    Add('    object rpCartaComunMemTEXTO: TppRichText');
    Add('      UserName = ''rpCartaComunMemTEXTO''');
    Add('      Caption = ''rpCartaComunMemTEXTO''');
    Add('      MailMerge = True');
    Add('      Stretch = True');
    Add('      Transparent = True');
    Add('      mmHeight = 26194');
    Add('      mmLeft = 1323');
    Add('      mmTop = 794');
    Add('      mmWidth = 194998');
    Add('      BandType = 4');
    Add('      mmBottomOffset = 0');
    Add('      mmOverFlowOffset = 0');
    Add('      mmStopPosition = 0');
    Add('    end');
    Add('  end');
    Add('  object rpCartaComunFootBnd: TppFooterBand');
    Add('    mmBottomOffset = 0');
    Add('    mmHeight = 10583');
    Add('    mmPrintPosition = 0');
    Add('    object rpCartaComunDbTxtEMPRESA2: TppDBText');
    Add('      UserName = ''rpCartaComunDbTxtEMPRESA2''');
    Add('      AutoSize = True');
    Add('      DataField = ''RZSE''');
    Add('      DataPipeline = ppCartaComun');
    Add('      Font.Charset = DEFAULT_CHARSET');
    Add('      Font.Color = clBlack');
    Add('      Font.Name = ''Arial''');
    Add('      Font.Size = 10');
    Add('      Font.Style = []');
    Add('      Transparent = True');
    Add('      mmHeight = 3969');
    Add('      mmLeft = 10583');
    Add('      mmTop = 3175');
    Add('      mmWidth = 9525');
    Add('      BandType = 8');
    Add('    end');
    Add('  end');
    Add('  object rpCartaComunGroup1: TppGroup');
    Add('    BreakName = ''NOM''');
    Add('    DataPipeline = ppCartaComun');
    Add('    NewPage = True');
    Add('    UserName = ''rpCartaComunGroup1''');
    Add('    mmNewColumnThreshold = 0');
    Add('    mmNewPageThreshold = 0');
    Add('    object rpCartaComunGrpHdrNOME: TppGroupHeaderBand');
    Add('      AfterPrint = rpCartaComunGrpHdrNOMEAfterPrint');
    Add('      PrintHeight = phDynamic');
    Add('      mmBottomOffset = 0');
    Add('      mmHeight = 53711');
    Add('      mmPrintPosition = 0');
    Add('      object rpCartaComunLabel1: TppLabel');
    Add('        UserName = ''rpCartaComunLabel1''');
    Add('        Caption = ''A''');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 4233');
    Add('        mmLeft = 10583');
    Add('        mmTop = 10848');
    Add('        mmWidth = 2381');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunDbTxtNOME: TppDBText');
    Add('        UserName = ''rpCartaComunDbTxtNOME''');
    Add('        AutoSize = True');
    Add('        DataField = ''NOM''');
    Add('        DataPipeline = ppCartaComun');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 16404');
    Add('        mmWidth = 8202');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunDbTxtENDERECO: TppDBText');
    Add('        UserName = ''rpCartaComunDbTxtENDERECO''');
    Add('        AutoSize = True');
    Add('        DataField = ''ENDERECO''');
    Add('        DataPipeline = ppCartaComun');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 21167');
    Add('        mmWidth = 20108');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunDbTxtBAIRRO: TppDBText');
    Add('        UserName = ''rpCartaComunDbTxtBAIRRO''');
    Add('        AutoSize = True');
    Add('        DataField = ''BAI''');
    Add('        DataPipeline = ppCartaComun');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 25929');
    Add('        mmWidth = 5821');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunDbTxtCEPCID: TppDBText');
    Add('        UserName = ''rpCartaComunDbTxtCEPCID''');
    Add('        AutoSize = True');
    Add('        DataField = ''CEPCID''');
    Add('        DataPipeline = ppCartaComun');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 30692');
    Add('        mmWidth = 13494');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunLabel2: TppLabel');
    Add('        UserName = ''rpCartaComunLabel2''');
    Add('        Caption = ''Assunto:''');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 41010');
    Add('        mmWidth = 14817');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunDbTxtASSUNTO: TppDBText');
    Add('        UserName = ''rpCartaComunDbTxtASSUNTO''');
    Add('        DataField = ''ASSUNTO''');
    Add('        DataPipeline = ppCartaComun');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 27517');
    Add('        mmTop = 41010');
    Add('        mmWidth = 157957');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('      object rpCartaComunLblDATA: TppLabel');
    Add('        OnPrint = rpCartaComunLblDATAPrint');
    Add('        UserName = ''rpCartaComunLblDATA''');
    Add('        Caption = ''rpCartaComunLblDATA''');
    Add('        Font.Charset = DEFAULT_CHARSET');
    Add('        Font.Color = clBlack');
    Add('        Font.Name = ''Arial''');
    Add('        Font.Size = 10');
    Add('        Font.Style = []');
    Add('        Transparent = True');
    Add('        mmHeight = 3969');
    Add('        mmLeft = 10583');
    Add('        mmTop = 1852');
    Add('        mmWidth = 37306');
    Add('        BandType = 3');
    Add('        GroupNo = 0');
    Add('      end');
    Add('    end');
    Add('    object rpCartaComunGroupFooterBand1: TppGroupFooterBand');
    Add('      mmBottomOffset = 0');
    Add('      mmHeight = 0');
    Add('      mmPrintPosition = 0');
    Add('    end');
    Add('  end');
    Add('end');
  end;

  Result := LayoutPadrao;
end;

end.
