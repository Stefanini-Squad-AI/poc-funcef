inherited relTreinCurso: TrelTreinCurso
  Left = 229
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relatório da Atividade de Treinamento por Curso'
  ClientHeight = 340
  ClientWidth = 428
  Font.Style = [fsBold]
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel [0]
    Left = 0
    Top = 0
    Width = 428
    Height = 301
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 3
    object rgSelTudo: TRadioGroup
      Left = 34
      Top = 20
      Width = 360
      Height = 45
      Caption = 'Selecionar Cursos'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Por Curso'
        'Por Tipo'
        'Por Grupo')
      TabOrder = 0
      OnClick = rgSelTudoClick
    end
    object gbxCurso: TGroupBox
      Left = 34
      Top = 65
      Width = 360
      Height = 216
      Caption = 'Cursos'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Visible = False
      object dblcCurso: TwwDBLookupCombo
        Left = 30
        Top = 21
        Width = 295
        Height = 21
        Hint = 'Informe Grupo(s) Desejado(s)'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        LookupTable = qryCurso
        LookupField = 'DESCRICAO'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
        OnCloseUp = dblcCursoCloseUp
      end
      object lstCurso: TListBox
        Left = 30
        Top = 48
        Width = 295
        Height = 160
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstCursoKeyDown
      end
    end
  end
  inherited qr: TQuickRep
    Top = -3
    Width = 653
    Height = 845
    BeforePrint = qrBeforePrint
    DataSet = tblCurso
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
    ReportTitle = 'Atividade de Treinamento por Curso'
    Zoom = 80
    inherited PageFooterBand1: TQRBand
      Left = 30
      Top = 250
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
      Height = 60
      Size.Values = (
        198.4375
        1961.22395833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 224
        Top = 7
        Width = 145
        Height = 19
        Size.Values = (
          62.8385416666667
          740.833333333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 207
        Top = 29
        Width = 178
        Height = 19
        Size.Values = (
          62.8385416666667
          684.609375
          95.9114583333333
          588.697916666667)
        FontSize = 14
      end
    end
    object qrbTotais: TQRBand [2]
      Left = 30
      Top = 208
      Width = 593
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 0
      AlignToBottom = False
      BeforePrint = qrbTotaisBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        138.90625
        1961.22395833333)
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 6
        Top = 6
        Width = 77
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          19.84375
          19.84375
          254.661458333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Cursos:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 6
        Top = 24
        Width = 90
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          19.84375
          79.375
          297.65625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Participantes:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 409
        Top = 24
        Width = 60
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1352.68229166667
          79.375
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Custo Total)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 216
        Top = 24
        Width = 71
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          714.375
          79.375
          234.817708333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Horas:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotPes: TQRLabel
        Left = 105
        Top = 24
        Width = 18
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          347.265625
          79.375
          59.53125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotPes'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotCur: TQRLabel
        Left = 105
        Top = 6
        Width = 20
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          347.265625
          19.84375
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotCur'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotHor: TQRLabel
        Left = 302
        Top = 24
        Width = 38
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          998.802083333333
          79.375
          125.677083333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotCus: TQRLabel
        Left = 345
        Top = 24
        Width = 55
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1141.015625
          79.375
          181.901041666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotCus'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbSubTot: TQRBand [3]
      Left = 30
      Top = 188
      Width = 593
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbSubTotBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        66.1458333333333
        1961.22395833333)
      BandType = rbGroupFooter
      object qrlSubCus: TQRLabel
        Left = 345
        Top = 4
        Width = 55
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1141.015625
          13.2291666666667
          181.901041666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubCus'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlSubHor: TQRLabel
        Left = 302
        Top = 4
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          998.802083333333
          13.2291666666667
          125.677083333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlMdCurs: TQRLabel
        Left = 528
        Top = 4
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1746.25
          13.2291666666667
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MdCur'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 67
        Top = 4
        Width = 64
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          221.588541666667
          13.2291666666667
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totais do Curso:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 439
        Top = 4
        Width = 66
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1451.90104166667
          13.2291666666667
          218.28125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação Média:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlSubPes: TQRLabel
        Left = 136
        Top = 4
        Width = 34
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          449.791666666667
          13.2291666666667
          112.447916666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 175
        Top = 4
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          578.776041666667
          13.2291666666667
          135.598958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pessoa(s)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited qrCabecalho: TQRBand
      Left = 30
      Top = 90
      Width = 593
      Height = 32
      Size.Values = (
        105.833333333333
        1961.22395833333)
      inherited QrLabel4: TQRLabel
        Left = 46
        Top = 7
        Width = 71
        Height = 12
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 1
        Top = 7
        Width = 130
        Height = 12
        Size.Values = (
          39.6875
          3.30729166666667
          23.1510416666667
          429.947916666667)
        Caption = 'Curso / Participante do Curso'
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 214
        Top = 8
        Width = 20
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          707.760416666667
          26.4583333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Início'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 264
        Top = 8
        Width = 18
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          873.125
          26.4583333333333
          59.53125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Final'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 314
        Top = 8
        Width = 24
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1038.48958333333
          26.4583333333333
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Horas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 365
        Top = 8
        Width = 23
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1207.16145833333
          26.4583333333333
          76.0677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Custo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 413
        Top = 8
        Width = 64
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1365.91145833333
          26.4583333333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aval.Aluno (T/P)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 527
        Top = 8
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1742.94270833333
          26.4583333333333
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aval. Curso'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 480
        Top = 8
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1587.5
          26.4583333333333
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 148
      Width = 593
      Height = 20
      AfterPrint = DetailBand1AfterPrint
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        66.1458333333333
        1961.22395833333)
      object QRDBText1: TQRDBText
        Left = 0
        Top = 4
        Width = 62
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          0
          13.2291666666667
          205.052083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCurso
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited qrMestre: TQRGroup
      Left = 30
      Top = 122
      Width = 593
      Height = 26
      Size.Values = (
        85.9895833333333
        1961.22395833333)
    end
    object qrsubdt: TQRSubDetail
      Left = 30
      Top = 168
      Width = 593
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsubdtBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.1458333333333
        1961.22395833333)
      Master = qr
      DataSet = tblHsttrn
      FooterBand = qrbSubTot
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText3: TQRDBText
        Left = 17
        Top = 4
        Width = 185
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          56.2239583333333
          13.2291666666667
          611.848958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblPessoal
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 209
        Top = 4
        Width = 37
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          691.223958333333
          13.2291666666667
          122.369791666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DATREINI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 257
        Top = 4
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          849.973958333333
          13.2291666666667
          135.598958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DATREFIM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 345
        Top = 4
        Width = 55
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1141.015625
          13.2291666666667
          181.901041666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'TOT_CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlAvTeor: TQRLabel
        Left = 408
        Top = 4
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1349.375
          13.2291666666667
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvTeor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlAvPrat: TQRLabel
        Left = 442
        Top = 4
        Width = 27
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1461.82291666667
          13.2291666666667
          89.296875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvPrat'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlResult: TQRLabel
        Left = 480
        Top = 4
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1587.5
          13.2291666666667
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 302
        Top = 4
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          998.802083333333
          13.2291666666667
          125.677083333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DUR_TOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlAvCurs: TQRLabel
        Left = 528
        Top = 4
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1746.25
          13.2291666666667
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvCurs'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 301
    Width = 428
    Height = 39
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object pnBotoes: TPanel
      Left = 181
      Top = 1
      Width = 246
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnBotoes'
      TabOrder = 0
      object bbtnOk: TBitBtn
        Left = 3
        Top = 2
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnOkClick
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FF030303030303030303
          03030303030303040403030303030303030303030303030303F8F8FF03030303
          03030303030303030303040202040303030303030303030303030303F80303F8
          FF030303030303030303030303040202020204030303030303030303030303F8
          03030303F8FF0303030303030303030304020202020202040303030303030303
          0303F8030303030303F8FF030303030303030304020202FA0202020204030303
          0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
          040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
          03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
          FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
          0303030303030303030303FA0202020403030303030303030303030303F8FF03
          03F8FF03030303030303030303030303FA020202040303030303030303030303
          0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
          03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
          030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
          0202040303030303030303030303030303F8FF03F8FF03030303030303030303
          03030303FA0202030303030303030303030303030303F8FFF803030303030303
          030303030303030303FA0303030303030303030303030303030303F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCancela: TBitBtn
        Left = 84
        Top = 2
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelaClick
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303F8F80303030303030303030303030303030303FF03030303030303030303
          0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
          03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
          030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
          FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
          030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
          F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
          010101F8030303030303030303F8FF030303030303FFF8030303030303030303
          030101010101F80303030303030303030303F8FF0303030303F8030303030303
          0303030303F901010101F8030303030303030303030303F8FF030303F8030303
          0303030303030303F90101010101F8030303030303030303030303F803030303
          F8FF030303030303030303F9010101F8010101F803030303030303030303F803
          03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
          03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
          03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
          0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
          030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
          03030303030303030303030303030303030303030303030303F8F8F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnAjuda: TmaHelpBitBtn
        Left = 165
        Top = 2
        Width = 80
        Height = 33
        Caption = '&Ajuda'
        TabOrder = 2
        Kind = bkHelp
        ClickHelpContext = 0
      end
    end
  end
  object lstCodCurso: TListBox [3]
    Left = 311
    Top = 142
    Width = 40
    Height = 30
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 58
    Top = 183
  end
  object tblHsttrn: TwwTable
    OnCalcFields = tblHsttrnCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = ds2
    TableName = 'CM.HSTTRN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 119
    Top = 267
    object tblHsttrnTOT_CUSTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOT_CUSTO'
      DisplayFormat = '0.00'
      Currency = False
      Calculated = True
    end
    object tblHsttrnIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tblHsttrnIDCURSO: TFloatField
      FieldName = 'IDCURSO'
      Required = True
    end
    object tblHsttrnDATREINI: TDateTimeField
      FieldName = 'DATREINI'
      Required = True
    end
    object tblHsttrnDATREFIM: TDateTimeField
      FieldName = 'DATREFIM'
    end
    object tblHsttrnDATPLINI: TDateTimeField
      FieldName = 'DATPLINI'
    end
    object tblHsttrnDATPLFIM: TDateTimeField
      FieldName = 'DATPLFIM'
    end
    object tblHsttrnDUR_TEOR: TFloatField
      FieldName = 'DUR_TEOR'
    end
    object tblHsttrnDUR_PRAT: TFloatField
      FieldName = 'DUR_PRAT'
    end
    object tblHsttrnDUR_TOT: TFloatField
      FieldName = 'DUR_TOT'
    end
    object tblHsttrnFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Required = True
    end
    object tblHsttrnFLGAVALCURS: TFloatField
      FieldName = 'FLGAVALCURS'
      Required = True
    end
    object tblHsttrnAVALCURSO: TFloatField
      FieldName = 'AVALCURSO'
    end
    object tblHsttrnFLGAVALTEOR: TFloatField
      FieldName = 'FLGAVALTEOR'
      Required = True
    end
    object tblHsttrnAVALTEOR: TFloatField
      FieldName = 'AVALTEOR'
    end
    object tblHsttrnFLGAVALPRAT: TFloatField
      FieldName = 'FLGAVALPRAT'
      Required = True
    end
    object tblHsttrnAVALPRAT: TFloatField
      FieldName = 'AVALPRAT'
    end
    object tblHsttrnVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object tblHsttrnDESP_VIAG: TFloatField
      FieldName = 'DESP_VIAG'
    end
    object tblHsttrnDESP_ESTAD: TFloatField
      FieldName = 'DESP_ESTAD'
    end
    object tblHsttrnDESP_OUTR: TFloatField
      FieldName = 'DESP_OUTR'
    end
    object tblHsttrnIDENTIDINSTR: TFloatField
      FieldName = 'IDENTIDINSTR'
    end
    object tblHsttrnNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    OnFilterRecord = tblCursoFilterRecord
    IndexFieldNames = 'IDCURSO'
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 183
    Top = 267
  end
  object ds: TwwDataSource
    DataSet = tblHsttrn
    Left = 38
    Top = 267
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 245
    Top = 266
  end
  object ds2: TwwDataSource
    DataSet = tblCurso
    Left = 81
    Top = 267
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 322
    Top = 263
  end
  object qryFuncio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select  IDPESSOA, CODCENTROCUSTO'
      'from FUNCIONARIO '
      'where IDPESSOA = :idpessoa')
    ValidateWithMask = True
    Left = 386
    Top = 263
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
end
