inherited frmCadHistFuncPartCS: TfrmCadHistFuncPartCS
  Left = 1
  Top = 136
  Caption = 'Cadastro de Histórico Funcional do Participante'
  ClientHeight = 460
  ClientWidth = 786
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 786
    Height = 374
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 205
      Width = 784
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object dbgHistFuncPrev: TwwDBGrid
      Left = 1
      Top = 208
      Width = 784
      Height = 165
      Selected.Strings = (
        'SEQHISTFUNC'#9'5'#9'Seq.'#9'No'
        'DATAINICIO'#9'10'#9'Data de ~Início'#9'No'
        'DATAFINAL'#9'9'#9'Data ~Final'#9'No'
        'FLGCONCOMITANTE'#9'4'#9'Conc.'#9'No'
        'EMPRESA'#9'28'#9'Empresa'#9'No'
        'MATRICULA'#9'12'#9'Matrícula'#9'No'
        'TEMPOCALC'#9'9'#9'Tempo dias~Calculado'#9'No'
        'FLGCONTATS'#9'5'#9'Tempo~Válido'#9'No'
        'FATOR'#9'5'#9'Fator'#9'No')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsHistFuncPrev
      MultiSelectOptions = [msoAutoUnselect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgHistFuncPrevDblClick
      IndicatorColor = icYellow
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 784
      Height = 42
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 240
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 4
        Width = 24
        Height = 13
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 115
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 602
        Top = 4
        Width = 64
        Height = 13
        Caption = 'Sequencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 504
        Top = 4
        Width = 85
        Height = 13
        Caption = 'Data Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edParticipante: TEdit
        Left = 240
        Top = 17
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object bbtnProcurar: TBitBtn
        Left = 681
        Top = 8
        Width = 80
        Height = 31
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object edMatricula: TEdit
        Left = 115
        Top = 17
        Width = 116
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbedSeqHistFunc: TwwDBEdit
        Left = 602
        Top = 17
        Width = 72
        Height = 21
        Color = clSilver
        DataField = 'SEQHISTFUNC'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edDocumento: TMaskEdit
        Left = 14
        Top = 17
        Width = 91
        Height = 21
        EditMask = '999.999.999-99;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 4
      end
      object dtAdmissao: TCMDateTimePicker
        Left = 505
        Top = 17
        Width = 91
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 43
      Width = 784
      Height = 162
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 12
        Top = 3
        Width = 83
        Height = 13
        Caption = 'Data de Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 146
        Top = 3
        Width = 59
        Height = 13
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmpresa: TLabel
        Left = 529
        Top = 3
        Width = 49
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object label5: TLabel
        Left = 12
        Top = 43
        Width = 34
        Height = 13
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 12
        Top = 83
        Width = 213
        Height = 13
        Caption = 'Tipo de Periculosidade/Insalubridade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 123
        Width = 184
        Height = 13
        Caption = 'Tipo de documento apresentado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 269
        Top = 123
        Width = 75
        Height = 13
        Caption = 'Número Doc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 631
        Top = 123
        Width = 132
        Height = 13
        Caption = 'Tempo Total Calculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 737
        Top = 146
        Width = 26
        Height = 13
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 269
        Top = 83
        Width = 43
        Height = 13
        Caption = 'Função'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 529
        Top = 83
        Width = 124
        Height = 13
        Caption = 'Vínculo Empregatício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 269
        Top = 43
        Width = 40
        Height = 13
        Caption = 'Salário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 379
        Top = 146
        Width = 38
        Height = 13
        Caption = 'Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Label18Click
      end
      object Label4: TLabel
        Left = 398
        Top = 43
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedEmpresa: TwwDBEdit
        Left = 529
        Top = 18
        Width = 233
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMPRESA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkpcmbPatro: TwwDBLookupCombo
        Left = 529
        Top = 18
        Width = 233
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Patrocinadora')
        DataField = 'IDPESSJUR'
        DataSource = ds
        LookupTable = qryPatroFund
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbedDataInicio: TCMDateTimePicker
        Left = 12
        Top = 18
        Width = 116
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINICIO'
        DataSource = ds
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        OnExit = dbedDataInicioExit
      end
      object dbedDataFinal: TCMDateTimePicker
        Left = 146
        Top = 18
        Width = 116
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAFINAL'
        DataSource = ds
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        OnExit = dbedDataFinalExit
      end
      object dbchkFlgContaTS: TDBCheckBox
        Left = 379
        Top = 123
        Width = 238
        Height = 17
        Caption = 'Período conta para tempo de serviço'
        DataField = 'FLGCONTATS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dblkpcmbCodTpInsalubri: TwwDBLookupCombo
        Left = 12
        Top = 97
        Width = 250
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Tipo de Insalubridade'
          'FATOR'#9'10'#9'Fator ')
        DataField = 'CODTPINSALUBRI'
        DataSource = ds
        LookupTable = qryTpInsalubri
        LookupField = 'CODTPINSALUBRI'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkpcmbIdDocumento: TwwDBLookupCombo
        Left = 12
        Top = 140
        Width = 250
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'Tipo de Documento')
        DataField = 'IDDOCUMENTO'
        DataSource = ds
        LookupTable = qryTipoDocPessoa
        LookupField = 'IDDOCUMENTO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkpcmbIdDocumentoChange
      end
      object dbedNumDocumento: TwwDBEdit
        Left = 269
        Top = 137
        Width = 99
        Height = 21
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCargo: TwwDBEdit
        Left = 12
        Top = 58
        Width = 250
        Height = 21
        DataField = 'CARGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedFuncao: TwwDBEdit
        Left = 269
        Top = 97
        Width = 252
        Height = 21
        DataField = 'FUNCAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbVincEmp: TwwDBComboBox
        Left = 529
        Top = 97
        Width = 233
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'VINCEMPREG'
        DataSource = ds
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        Items.Strings = (
          'Funcionário Público'#9'0'
          'Iniciativa Privada (CLT)'#9'1')
        ParentFont = False
        Sorted = False
        TabOrder = 10
        UnboundDataType = wwDefault
      end
      object dbedValor: TwwDBEdit
        Left = 269
        Top = 58
        Width = 121
        Height = 21
        DataField = 'VALORCARGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rgrpTipoEmpresa: TRadioGroup
        Left = 269
        Top = 4
        Width = 251
        Height = 35
        Caption = 'Tipo de Empresa '
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 1
        Items.Strings = (
          'Patrocinadora'
          'Outra')
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = rgrpTipoEmpresaClick
      end
      object dbedMatricula: TwwDBEdit
        Left = 398
        Top = 58
        Width = 121
        Height = 21
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object PnlTempoTotal: TPanel
        Left = 634
        Top = 137
        Width = 102
        Height = 21
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
      end
    end
  end
  inherited Dock972: TDock97
    Width = 786
  end
  inherited Dock971: TDock97
    Top = 421
    Width = 786
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 599
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 431
      DockPos = 431
      inherited ToolbarSep971: TToolbarSep97
        Left = 77
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 77
      end
      inherited bbtnCancelar: TBitBtn
        Left = 80
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 331
    Top = 4
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  EMPRESA = :EMPRESA,'
      '  VALORCARGO = :VALORCARGO,'
      '  FUNCAO = :FUNCAO,'
      '  CODTPINSALUBRI = :CODTPINSALUBRI,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  TEMPOCALCINSALUB = :TEMPOCALCINSALUB,'
      '  CARGO = :CARGO,'
      '  FLGCONTATS = :FLGCONTATS,'
      '  VINCEMPREG = :VINCEMPREG,'
      '  MATRICULA = :MATRICULA,'
      '  TEMPOCALC = :TEMPOCALC,'
      '  FLGCONCOMITANTE = :FLGCONCOMITANTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    InsertSQL.Strings = (
      'insert into HISTFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO, DATAFINAL, EMPR' +
        'ESA, VALORCARGO, '
      
        '   FUNCAO, CODTPINSALUBRI, IDDOCUMENTO, NUMDOCUMENTO, TEMPOCALCI' +
        'NSALUB, '
      
        '   CARGO, FLGCONTATS, VINCEMPREG, MATRICULA, TEMPOCALC, FLGCONCO' +
        'MITANTE)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :DATAINICIO, :DATAFINAL,' +
        ' :EMPRESA, '
      
        '   :VALORCARGO, :FUNCAO, :CODTPINSALUBRI, :IDDOCUMENTO, :NUMDOCU' +
        'MENTO, '
      
        '   :TEMPOCALCINSALUB, :CARGO, :FLGCONTATS, :VINCEMPREG, :MATRICU' +
        'LA, :TEMPOCALC, '
      '   :FLGCONCOMITANTE)')
    DeleteSQL.Strings = (
      'delete from HISTFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    Left = 261
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P.NOME'
      'H.SEQHISTFUNC'
      'P2.NOME'
      'EL.MATRICULA'
      'H.EMPRESA'
      'H.DATAINICIO'
      'H.DATAFINAL'
      'P.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Funcionário'
      'Seq.'
      'Patrocinadora Atual'
      'Matrícula Atual'
      'Empresa'
      'Data de Início'
      'Data Término'
      'Documento Nº'
      'Inscrição Numero')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA P2'
      'ELEGPATRO EL'
      'HISTFUNCPREV H'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'H.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'H.SEQHISTFUNC'
      'H.IDPESSJUR')
    Filtro.Strings = (
      'H.IDPESSOA = P.IDPESSOA'
      'H.IDPESSOA = EL.IDPESSOA'
      'EL.IDPESSJUR = P2.IDPESSOA'
      'P.IDPESSOA = PARTPREVPLAN.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '5'
      '60'
      '15'
      '60'
      '10'
      '10'
      '15'
      '10')
    Left = 385
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      
        '  IDPESSOA,   IDPESSJUR,  SEQHISTFUNC,    DATAINICIO,  DATAFINAL' +
        ',    EMPRESA,'
      
        '  VALORCARGO, FUNCAO,     CODTPINSALUBRI, IDDOCUMENTO, NUMDOCUME' +
        'NTO, TEMPOCALCINSALUB,'
      
        '  CARGO,      FLGCONTATS, VINCEMPREG,     MATRICULA,   TEMPOCALC' +
        ',    FLGCONCOMITANTE'
      'FROM'
      '  HISTFUNCPREV'
      'WHERE'
      '  IDPESSOA     = :PIDPESSOA    AND'
      '  SEQHISTFUNC  = :PSEQHISTFUNC'
      ' ')
    PictureMasks.Strings = (
      
        'VALORCARGO'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]}'#9'T'#9'F')
    Left = 294
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PSEQHISTFUNC'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qrySEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
    end
    object qryDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 60
    end
    object qryCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object qryVALORCARGO: TFloatField
      FieldName = 'VALORCARGO'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###########0.00'
    end
    object qryFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryCODTPINSALUBRI: TStringField
      FieldName = 'CODTPINSALUBRI'
      Size = 10
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryTEMPOCALCINSALUB: TFloatField
      FieldName = 'TEMPOCALCINSALUB'
    end
    object qryFLGCONTATS: TFloatField
      FieldName = 'FLGCONTATS'
    end
    object qryVINCEMPREG: TStringField
      FieldName = 'VINCEMPREG'
      Size = 2
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTEMPOCALC: TFloatField
      FieldName = 'TEMPOCALC'
    end
    object qryFLGCONCOMITANTE: TFloatField
      FieldName = 'FLGCONCOMITANTE'
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'CPF'
      'Inscrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO EL'
      'PESSOA P'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'EL.MATRICULA'
      'EL.DATAADMISSAO'
      'EL.IDPESSJUR')
    Filtro.Strings = (
      'P.TIPO = '#39'F'#39
      'P.IDPESSOA = EL.IDPESSOA'
      'P.IDPESSOA = PARTPREVPLAN.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 466
    Top = 4
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 482
    Top = 266
  end
  object qryTpInsalubri: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTPINSALUBRI,    DESCRICAO,       FATOR, IDREGRAINSALUBRI,'
      '  TEMPOPERMANMINIMO, FLGTEMPOCONTINUO'
      'FROM'
      '  TPINSALUBRI'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 17
    Top = 196
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      'ORDER BY NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 276
    Top = 230
  end
  object QryHistFuncPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  H.IDPESSOA,   H.IDPESSJUR,  H.SEQHISTFUNC, H.IDDOCUMENTO, H.CO' +
        'DTPINSALUBRI,'
      
        '  H.FLGCONTATS, H.DATAINICIO, H.DATAFINAL,   H.CARGO,       H.VA' +
        'LORCARGO,'
      
        '  H.FUNCAO,     H.VINCEMPREG, H.MATRICULA,   H.EMPRESA,     H.TE' +
        'MPOCALC,'
      '  H.FLGCONCOMITANTE, H.NUMDOCUMENTO AS CPF,  TI.FATOR,'
      
        '  EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, EL.TEMPONAOCREDITAD' +
        'O, P.NOME'
      'FROM'
      '  PESSOA P,'
      '  ELEGPATRO EL,'
      '  HISTFUNCPREV H,'
      '  TPINSALUBRI TI'
      'WHERE'
      '  (H.IDPESSOA  = :pIDPESSOA)   AND'
      '  (EL.IDPESSOA = H.IDPESSOA)   AND'
      '  (P.IDPESSOA  = H.IDPESSOA)   AND'
      '  (H.CODTPINSALUBRI = TI.CODTPINSALUBRI(+))'
      'ORDER BY H.DATAINICIO, H.SEQHISTFUNC'
      ' ')
    ControlType.Strings = (
      'ChkConc;CheckBox;True;False'
      'FLGCONCOMITANTE;CheckBox;1;0'
      'FLGCONTATS;CheckBox;1;0')
    ValidateWithMask = True
    Left = 707
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object QryHistFuncPrevSEQHISTFUNC: TFloatField
      DisplayLabel = 'Seq.'
      DisplayWidth = 5
      FieldName = 'SEQHISTFUNC'
      Origin = '"CM.HISTFUNCPREV".SEQHISTFUNC'
    end
    object QryHistFuncPrevDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = '"CM.HISTFUNCPREV".DATAINICIO'
    end
    object QryHistFuncPrevDATAFINAL: TDateTimeField
      DisplayLabel = 'Data ~Final'
      DisplayWidth = 9
      FieldName = 'DATAFINAL'
      Origin = '"CM.HISTFUNCPREV".DATAFINAL'
    end
    object QryHistFuncPrevFLGCONCOMITANTE: TFloatField
      DisplayLabel = 'Conc.'
      DisplayWidth = 4
      FieldName = 'FLGCONCOMITANTE'
    end
    object QryHistFuncPrevEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 28
      FieldName = 'EMPRESA'
      Origin = '"CM.HISTFUNCPREV".EMPRESA'
      Size = 60
    end
    object QryHistFuncPrevMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 12
      FieldName = 'MATRICULA'
      Size = 13
    end
    object QryHistFuncPrevTEMPOCALC: TFloatField
      DisplayLabel = 'Tempo dias~Calculado'
      DisplayWidth = 9
      FieldName = 'TEMPOCALC'
    end
    object QryHistFuncPrevFLGCONTATS: TFloatField
      DisplayLabel = 'Tempo~Válido'
      DisplayWidth = 5
      FieldName = 'FLGCONTATS'
      Origin = '"CM.HISTFUNCPREV".FLGCONTATS'
    end
    object QryHistFuncPrevFATOR: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 5
      FieldName = 'FATOR'
      Origin = 'HISTFUNCPREV.IDPESSOA'
    end
    object QryHistFuncPrevTempoSer: TIntegerField
      DisplayLabel = 'Tempo de ~Serviço'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'TempoSer'
      Visible = False
      Calculated = True
    end
    object QryHistFuncPrevTemposeresp: TIntegerField
      DisplayLabel = 'Tempo de ~Sit. Especial'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Temposeresp'
      Visible = False
      Calculated = True
    end
    object QryHistFuncPrevTemposernaocred: TIntegerField
      DisplayLabel = 'Tempo Não ~Creditado'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Temposernaocred'
      Visible = False
      Calculated = True
    end
    object QryHistFuncPrevChkConc: TBooleanField
      DisplayLabel = 'Concomitante'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ChkConc'
      ReadOnly = True
      Visible = False
      Calculated = True
    end
    object QryHistFuncPrevCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 40
      FieldName = 'CARGO'
      Origin = '"CM.HISTFUNCPREV".CARGO'
      Visible = False
      Size = 40
    end
    object QryHistFuncPrevIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.HISTFUNCPREV".IDPESSOA'
      Visible = False
    end
    object QryHistFuncPrevIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = '"CM.HISTFUNCPREV".IDPESSJUR'
      Visible = False
    end
    object QryHistFuncPrevIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = '"CM.HISTFUNCPREV".IDDOCUMENTO'
      Visible = False
    end
    object QryHistFuncPrevCODTPINSALUBRI: TStringField
      FieldName = 'CODTPINSALUBRI'
      Origin = '"CM.HISTFUNCPREV".CODTPINSALUBRI'
      Visible = False
      Size = 10
    end
    object QryHistFuncPrevVALORCARGO: TFloatField
      FieldName = 'VALORCARGO'
      Origin = '"CM.HISTFUNCPREV".VALORCARGO'
      Visible = False
    end
    object QryHistFuncPrevFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = '"CM.HISTFUNCPREV".FUNCAO'
      Visible = False
      Size = 40
    end
    object QryHistFuncPrevVINCEMPREG: TStringField
      FieldName = 'VINCEMPREG'
      Origin = '"CM.HISTFUNCPREV".VINCEMPREG'
      Visible = False
      Size = 2
    end
    object QryHistFuncPrevTEMPOSERVANTERIOR: TFloatField
      FieldName = 'TEMPOSERVANTERIOR'
      Origin = '"CM.ELEGPATRO".TEMPOSERVANTERIOR'
      Visible = False
    end
    object QryHistFuncPrevTEMPOSITESPECIAL: TFloatField
      FieldName = 'TEMPOSITESPECIAL'
      Origin = '"CM.ELEGPATRO".TEMPOSITESPECIAL'
      Visible = False
    end
    object QryHistFuncPrevTEMPONAOCREDITADO: TFloatField
      FieldName = 'TEMPONAOCREDITADO'
      Origin = '"CM.ELEGPATRO".TEMPONAOCREDITADO'
      Visible = False
    end
    object QryHistFuncPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Visible = False
      Size = 60
    end
    object QryHistFuncPrevCPF: TStringField
      FieldName = 'CPF'
      Origin = '"CM.HISTFUNCPREV".NUMDOCUMENTO'
      Visible = False
      Size = 18
    end
  end
  object dsHistFuncPrev: TwwDataSource
    DataSet = QryHistFuncPrev
    Left = 738
    Top = 293
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 390
    Top = 284
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 516
    Top = 266
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDPESSOA,H.IDPESSJUR,H.SEQHISTFUNC,H.IDDOCUMENTO,H.CODT' +
        'PINSALUBRI,H.DATAINICIO,'
      
        '       H.DATAFINAL,H.EMPRESA,H.CARGO,H.VALORCARGO,H.FUNCAO,H.FLG' +
        'CONTATS,H.VINCEMPREG,'
      
        '       EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL,EL.TEMPONAOCRED' +
        'ITADO, P.NOME,'
      '       H.NUMDOCUMENTO AS CPF'
      'FROM   HISTFUNCPREV H, ELEGPATRO EL, PESSOA P'
      'WHERE  H.IDPESSOA = :pIdPessoa    AND'
      '       EL.IDPESSOA =  H.IDPESSOA  AND'
      '       P.IDPESSOA = H.IDPESSOA'
      'ORDER BY H.SEQHISTFUNC')
    ValidateWithMask = True
    Left = 551
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
        Value = 64081
      end>
  end
  object qryPatroFund: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA P, PATRO PT'
      'WHERE'
      '  PT.IDFUNDACAO = :IDFUNDACAO AND'
      '  P.IDPESSOA = PT.IDPESSOA')
    ValidateWithMask = True
    Left = 534
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = 1
      end>
  end
end
