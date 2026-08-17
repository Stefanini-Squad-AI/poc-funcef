inherited frmGerProcMT: TfrmGerProcMT
  Left = 32
  Top = 127
  Caption = 'Gerenciamento de Processos'
  ClientHeight = 380
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 756
    Height = 341
    object Label3: TLabel
      Left = 321
      Top = 20
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object grpPeriodo: TGroupBox
      Left = 16
      Top = 16
      Width = 297
      Height = 65
      Caption = ' Período '
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 19
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 157
        Top = 19
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object edDataI: TCMDateTimePicker
        Left = 15
        Top = 34
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
      end
      object EdDataF: TCMDateTimePicker
        Left = 157
        Top = 34
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
      end
    end
    object dblcProc: TCMDBLookupCombo
      Left = 321
      Top = 36
      Width = 395
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição')
      LookupTable = cdsProc
      LookupField = 'IDTIPOPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object Pgc: TPageControl
      Left = 5
      Top = 88
      Width = 746
      Height = 248
      ActivePage = TbConsulta
      Align = alBottom
      TabOrder = 2
      object TbConsulta: TTabSheet
        Caption = 'Consulta'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 738
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          Caption = '`'
          TabOrder = 0
          object Grd: TwwDBGrid
            Left = 0
            Top = 28
            Width = 738
            Height = 192
            Selected.Strings = (
              'NOME'#9'60'#9'Tipo de Processo'#9'F'
              'NUMENT'#9'10'#9'Nº de~Entradas'#9'F'
              'NUMFIN'#9'10'#9'Nº de~Finalizações'#9'F'
              'NUMNOR'#9'10'#9'Nº de~Pendentes~(Normais) '#9'F'
              'NUMATR'#9'10'#9'Nº de~Pendentes~(Atraso)'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsConsulta
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 3
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 738
            Height = 28
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Estatística dos Processos'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object TbGraf: TTabSheet
        Caption = 'Gráfico'
        object Cht: TChart
          Left = 0
          Top = 0
          Width = 738
          Height = 220
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            '')
          Title.Visible = False
          LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
          LeftAxis.LabelsFont.Color = clBlack
          LeftAxis.LabelsFont.Height = -13
          LeftAxis.LabelsFont.Name = 'Arial'
          LeftAxis.LabelsFont.Style = [fsBold]
          LeftAxis.Title.Caption = 'Quantidade'
          LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
          LeftAxis.Title.Font.Color = clBlack
          LeftAxis.Title.Font.Height = -11
          LeftAxis.Title.Font.Name = 'Arial'
          LeftAxis.Title.Font.Style = [fsBold]
          Legend.Inverted = True
          Legend.TextStyle = ltsRightValue
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Series1: THorizBarSeries
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = [fsBold]
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clTeal
            BarStyle = bsRectGradient
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 756
    inherited tb97Fundo: TToolbar97
      Left = 369
      DockPos = 369
      inherited sep1: TToolbarSep97
        Left = 89
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 271
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 180
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 182
        Width = 89
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 273
        Width = 89
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Consultar'
        TabOrder = 2
        OnClick = BtnSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object BtnLimpar: TBitBtn
        Left = 91
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Limpar'
        TabOrder = 3
        OnClick = BtnLimparClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000012000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888000000888888078888888888000000888880D078888888880000008888
          0DD507888888880000008880DD705078888888000000880DD7DD050788888800
          000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
          607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
          0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
          000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
          E0888800000088888888880E0888880000008888888888808888880000008888
          88888888888888000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object sqlConsulta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      TP.IDTIPOPROCESSO,'
      '      TP.NOME,'
      '      ENTRADA.NUMENT,'
      '      FINALIZA.NUMFIN,'
      '      NORMAL.NUMNOR,'
      '      ATRASO.NUMATR'
      'FROM'
      '     RADTIPOPROCESSO TP,'
      '     ( SELECT'
      '             IDTIPOPROCESSO,'
      '             COUNT(*) AS NUMENT'
      '       FROM'
      '           RADINSTPROCESSO'
      '       WHERE'
      
        '              (DATAINIPROCESSO >= TO_DATE('#39'01/01/1998'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      
        '          AND (DATAINIPROCESSO <= TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      '       GROUP BY IDTIPOPROCESSO'
      '      ) ENTRADA,'
      '     ( SELECT'
      '             IDTIPOPROCESSO,'
      '             COUNT(*) AS NUMFIN'
      '       FROM'
      '           RADINSTPROCESSO'
      '       WHERE'
      
        '              (DATAFIMPROCESSO >= TO_DATE('#39'01/01/1998'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      
        '          AND (DATAFIMPROCESSO <= TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      '       GROUP BY IDTIPOPROCESSO'
      '      ) FINALIZA,'
      '     ( SELECT'
      '             IDTIPOPROCESSO,'
      '             COUNT(*) AS NUMNOR'
      '       FROM'
      '           RADINSTPROCESSO'
      '       WHERE'
      '              (FLGOK <> '#39'S'#39')'
      
        '          AND (DATAFIMPREV >= TO_DATE('#39'22/11/1999'#39','#39'DD/MM/YYYY'#39')' +
        ')'
      
        '          AND (DATAINIPROCESSO >= TO_DATE('#39'01/01/1998'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      
        '          AND (DATAINIPROCESSO <= TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      '       GROUP BY IDTIPOPROCESSO'
      '      ) NORMAL,'
      '     ( SELECT'
      '             IDTIPOPROCESSO,'
      '             COUNT(*) AS NUMATR'
      '       FROM'
      '           RADINSTPROCESSO'
      '       WHERE'
      '              (FLGOK <> '#39'S'#39')'
      '          AND (DATAFIMPREV < TO_DATE('#39'22/11/1999'#39','#39'DD/MM/YYYY'#39'))'
      
        '          AND (DATAINIPROCESSO >= TO_DATE('#39'01/01/1998'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      
        '          AND (DATAINIPROCESSO <= TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YY' +
        'YY'#39'))'
      '       GROUP BY IDTIPOPROCESSO'
      '      ) ATRASO'
      'WHERE'
      '      (1=2)'
      '  AND (TP.IDTIPOPROCESSO = ENTRADA.IDTIPOPROCESSO)'
      '  AND (TP.IDTIPOPROCESSO = FINALIZA.IDTIPOPROCESSO(+))'
      '  AND (TP.IDTIPOPROCESSO = NORMAL.IDTIPOPROCESSO(+))'
      '  AND (TP.IDTIPOPROCESSO = ATRASO.IDTIPOPROCESSO(+))'
      'ORDER BY TP.NOME')
    ClientDataSet = cdsConsulta
    Left = 181
    Top = 168
  end
  object cdsProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 18
  end
  object cdsConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 259
    Top = 173
  end
  object dsConsulta: TwwDataSource
    DataSet = cdsConsulta
    Left = 360
    Top = 173
  end
end
