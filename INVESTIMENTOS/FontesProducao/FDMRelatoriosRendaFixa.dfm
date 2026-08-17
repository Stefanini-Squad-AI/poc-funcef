inherited DmRelatoriosRendaFixa: TDmRelatoriosRendaFixa
  Left = 160
  Top = 180
  Width = 293
  Height = 285
  Caption = 'DmRelatoriosRendaFixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited rpExemplo: TppReport
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 20373
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 31750
      end
      inherited Line1: TppLine
        mmTop = 19844
      end
      inherited LblEmpresa: TppLabel
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
      end
      object ppLCarteira: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
  end
end
