inherited relCursos: TrelCursos
  Left = 139
  Top = 163
  Caption = 'relCursos'
  ClientHeight = 293
  ClientWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = -21
    Top = -1
    Width = 653
    Height = 845
    DataSet = qryCurso
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.PaperSize = Letter
    Page.Values = (
      100
      2794
      100
      2159
      100
      100
      0)
    ReportTitle = 'Listagem de Cursos'
    Zoom = 80
    inherited PageFooterBand1: TQRBand
      Left = 30
      Top = 178
      Width = 593
      Height = 32
      Size.Values = (
        105.833333333333
        1961.22395833333)
      inherited QRSysData1: TQRSysData
        Left = 548
        Top = 17
        Width = 45
        Height = 12
        Size.Values = (
          39.6875
          1812.39583333333
          56.2239583333333
          148.828125)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 271
        Top = 17
        Width = 50
        Height = 12
        Size.Values = (
          39.6875
          896.276041666667
          56.2239583333333
          165.364583333333)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Top = 17
        Width = 127
        Height = 12
        Size.Values = (
          39.6875
          0
          56.2239583333333
          420.026041666667)
        FontSize = 8
      end
    end
    inherited PageHeaderBand1: TQRBand
      Left = 30
      Top = 30
      Width = 593
      Height = 52
      Size.Values = (
        171.979166666667
        1961.22395833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 224
        Top = 7
        Width = 145
        Height = 18
        Size.Values = (
          59.53125
          740.833333333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 207
        Top = 29
        Width = 178
        Height = 18
        Size.Values = (
          59.53125
          684.609375
          95.9114583333333
          588.697916666667)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Left = 30
      Top = 82
      Width = 593
      Height = 26
      Size.Values = (
        85.9895833333333
        1961.22395833333)
      inherited QrLabel4: TQRLabel
        Left = 46
        Top = 7
        Width = 8
        Height = 12
        Size.Values = (
          39.6875
          150.8125
          23.8125
          26.4583333333333)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 151
        Top = 10
        Width = 69
        Height = 12
        Size.Values = (
          39.6875
          499.401041666667
          33.0729166666667
          228.203125)
        Caption = 'Título do Curso'
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 523
        Top = 7
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1729.71354166667
          23.1510416666667
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Abreviado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 31
        Top = 10
        Width = 32
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          102.526041666667
          33.0729166666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Código'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 108
      Width = 593
      Height = 17
      Size.Values = (
        56.2239583333333
        1961.22395833333)
      object QRDBText1: TQRDBText
        Left = 14
        Top = 2
        Width = 48
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          47.625
          7.9375
          158.75)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryCurso
        DataField = 'IDCURSO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 104
        Top = 2
        Width = 62
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          343.958333333333
          6.61458333333333
          205.052083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryCurso
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 524
        Top = 2
        Width = 37
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1733.02083333333
          6.61458333333333
          122.369791666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryCurso
        DataField = 'ABREV'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbDescricao: TQRChildBand
      Left = 30
      Top = 125
      Width = 593
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbDescricaoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.453125
        1961.22395833333)
      ParentBand = DetailBand1
      object qrdbDescricao: TQRDBText
        Left = 60
        Top = 5
        Width = 360
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          198.4375
          15.875
          1190.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tblCurso
        DataField = 'OBSERVACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 30
      Top = 146
      Width = 593
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1961.22395833333)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 31
        Top = 10
        Width = 114
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          102.526041666667
          33.0729166666667
          377.03125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Cursos Listados:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 151
        Top = 8
        Width = 36
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          499.401041666667
          26.4583333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    OnFilterRecord = qryCursoFilterRecord
    SQL.Strings = (
      'Select * from CURSO order by IDCURSO')
    ValidateWithMask = True
    Left = 566
    Top = 10
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 492
    Top = 9
  end
end
