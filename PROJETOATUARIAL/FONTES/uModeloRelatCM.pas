unit uModeloRelatCM;

interface

Uses
   Classes;

Type
   TModeloRelatCM = Class
   Protected
     Destructor Destroy; Override;
   private
     FCmDefault: TStrings;
   public
     Constructor Create;
     Property CmDefault: TStrings read FCmDefault Write FCmDefault;

end;

Var
  ModeloRelatCM: TModeloRelatCM;

implementation

Constructor TModeloRelatCM.Create;
Begin
  Inherited Create;
  FCmDefault := TStringList.Create;

  With FCmDefault Do
  Begin
     Add('object ppReport1: TppReport ');
     Add('DataPipeline = ppConsulta');
     Add('PrinterSetup.BinName = ''Default''');
     Add('PrinterSetup.DocumentName = ''ppReport1''');
     Add('PrinterSetup.PaperName = ''A4''');
     Add('PrinterSetup.PrinterName = ''Default''');
     Add('PrinterSetup.mmMarginBottom = 6350');
     Add('PrinterSetup.mmMarginLeft = 6350');
     Add('PrinterSetup.mmMarginRight = 6350');
     Add('PrinterSetup.mmMarginTop = 6350');
     Add('PrinterSetup.mmPaperHeight = 297000');
     Add('PrinterSetup.mmPaperWidth = 210000');
     Add('Template.FileName = ''C:\Teste.Txt''');
     Add('Template.Format = ftASCII');
     Add('AllowPrintToArchive = True');
     Add('AllowPrintToFile = True');
     Add('Language = lgPortugueseBrazil');
     Add('Left = 384');
     Add('Top = 199');
     Add('Version = ''3.52''');
     Add('mmColumnWidth = 0');
     Add('object ppReport1HeaderBand1: TppHeaderBand');
     Add('  mmBottomOffset = 0');
     Add('  mmHeight = 16404');
     Add('  mmPrintPosition = 0');
     Add('  object ppReport1Label1: TppLabel');
     Add('    Caption = ''Título do Relatório''');
     Add('    Font.Charset = DEFAULT_CHARSET');
     Add('    Font.Color = clBlack');
     Add('    Font.Name = ''Arial''');
     Add('    Font.Size = 14');
     Add('    Font.Style = []');
     Add('    Transparent = True');
     Add('    mmHeight = 5821');
     Add('    mmLeft = 78052');
     Add('    mmTop = 8467');
     Add('    mmWidth = 41275');
     Add('    BandType = 0');
     Add('  end');
     Add('  object ppReport1Line1: TppLine');
     Add('    ParentWidth = True');
     Add('    Weight = 0.75');
     Add('    mmHeight = 529');
     Add('    mmLeft = 0');
     Add('    mmTop = 15610');
     Add('    mmWidth = 197300');
     Add('    BandType = 0');
     Add('  end');
     Add('  object ppReport1Label2: TppLabel');
     Add('    Tag = 1');
     Add('    Caption = ''Empresa Proprietária''');
     Add('    Font.Charset = DEFAULT_CHARSET');
     Add('    Font.Color = clBlack');
     Add('    Font.Name = ''Arial''');
     Add('    Font.Size = 14');
     Add('    Font.Style = []');
     Add('    Transparent = True');
     Add('    mmHeight = 5821');
     Add('    mmLeft = 74877');
     Add('    mmTop = 265');
     Add('    mmWidth = 47361');
     Add('    BandType = 0');
     Add('  end');
     Add('end');
     Add('object ppReport1DetailBand1: TppDetailBand');
     Add('  mmBottomOffset = 0');
     Add('  mmHeight = 13229');
     Add('  mmPrintPosition = 0');
     Add('end');
     Add('object ppReport1FooterBand1: TppFooterBand');
     Add('  mmBottomOffset = 0');
     Add('  mmHeight = 13229');
     Add('  mmPrintPosition = 0');
     Add('  object ppReport1Calc1: TppCalc');
     Add('    CustomType = dtDate');
     Add('    Font.Charset = DEFAULT_CHARSET');
     Add('    Font.Color = clBlack');
     Add('    Font.Name = ''Arial''');
     Add('    Font.Size = 8');
     Add('    Font.Style = [fsBold]');
     Add('    Transparent = True');
     Add('    mmHeight = 3704');
     Add('    mmLeft = 183357');
     Add('    mmTop = 2117');
     Add('    mmWidth = 14288');
     Add('    BandType = 8');
     Add('  end');
     Add('  object ppReport1Calc2: TppCalc');
     Add('    CalcType = ctPageSetDesc');
     Add('    CustomType = dtString');
     Add('    Font.Charset = DEFAULT_CHARSET');
     Add('    Font.Color = clBlack');
     Add('    Font.Name = ''Arial''');
     Add('    Font.Size = 8');
     Add('    Font.Style = [fsBold]');
     Add('    Transparent = True');
     Add('    mmHeight = 3704');
     Add('    mmLeft = 89165');
     Add('    mmTop = 2117');
     Add('    mmWidth = 18785');
     Add('    BandType = 8');
     Add('  end');
     Add('  object LblModSisOrigem: TppLabel');
     Add('    Tag = 1');
     Add('    Caption = ''Sistema de Origem''');
     Add('    Font.Charset = DEFAULT_CHARSET');
     Add('    Font.Color = clBlack');
     Add('    Font.Name = ''Arial''');
     Add('    Font.Size = 8');
     Add('    Font.Style = [fsBold]');
     Add('    Transparent = True');
     Add('    mmHeight = 3704');
     Add('    mmLeft = 0');
     Add('    mmTop = 2117');
     Add('    mmWidth = 28046');
     Add('    BandType = 8');
     Add('  end');
     Add('  object ppReport1Line2: TppLine');
     Add('    ParentWidth = True');
     Add('    Weight = 0.75');
     Add('    mmHeight = 529');
     Add('    mmLeft = 0');
     Add('    mmTop = 0');
     Add('    mmWidth = 197300');
     Add('    BandType = 8');
     Add('  end');
     Add('end');
     Add('end');
  End;

End;

Destructor TModeloRelatCM.Destroy;
Begin
  FCmDefault.Free;
  Inherited Destroy;
End;

end.

