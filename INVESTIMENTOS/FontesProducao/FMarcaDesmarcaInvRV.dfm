inherited frmMarcaDesmarcaInvRV: TfrmMarcaDesmarcaInvRV
  Left = 353
  Top = 175
  HelpContext = 790310
  Caption = 'Operação'
  ClientHeight = 409
  ClientWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 578
    Height = 370
    inherited bvlSepTit: TBevel
      Width = 576
    end
    inherited pnlTitulo: TPanel
      Width = 576
      inherited lbNomDescricao: TfcLabel
        Width = 350
        Caption = 'Marca ou Desmarca Investimentos'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 576
      Height = 90
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object lblInvestimento: TLabel
        Left = 279
        Top = 5
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label3: TLabel
        Left = 279
        Top = 42
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object GroupBox1: TGroupBox
        Left = 103
        Top = 4
        Width = 170
        Height = 80
        Caption = 'Período'
        TabOrder = 1
        object Label1: TLabel
          Left = 7
          Top = 21
          Width = 21
          Height = 13
          Caption = 'De:'
        end
        object Label2: TLabel
          Left = 7
          Top = 55
          Width = 24
          Height = 13
          Caption = 'Até:'
        end
        object dDataIni: TCMDateTimePicker
          Left = 42
          Top = 17
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
          OnExit = dDataIniExit
        end
        object dDataFim: TCMDateTimePicker
          Left = 42
          Top = 51
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
      object dblInvestimento: TwwDBLookupCombo
        Left = 279
        Top = 21
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Descrição'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object rdgMarcaDesmarca: TRadioGroup
        Left = 8
        Top = 4
        Width = 89
        Height = 80
        ItemIndex = 0
        Items.Strings = (
          'Marca'
          'Desmarca')
        TabOrder = 0
        OnClick = rdgMarcaDesmarcaClick
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 279
        Top = 55
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'50'#9'Descrição'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object dbgBuscaMarcados: TwwDBGrid
      Left = 1
      Top = 135
      Width = 576
      Height = 187
      Hint = 'Clique com o botão direito para Fixar Colunas'
      Selected.Strings = (
        'DATAMOVCARTINV'#9'12'#9'Data'
        'PLANPRVCONTABPATRO'#9'36'#9'Plano / Patrocinadora'
        'DESCCARTINVEST'#9'44'#9'Carteira'
        'DESCINVESTIMENTO'#9'19'#9'Investimento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clWhite
      DataSource = dsBuscaMarcados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icYellow
    end
    inline fraMens: TfraMensagem
      Left = 1
      Top = 322
      Width = 576
      Height = 47
      Align = alBottom
      TabOrder = 3
      inherited pnlProgresso: TPanel
        Width = 576
        Height = 47
        inherited pnlProgressoMensagem: TPanel
          Width = 288
          Height = 45
          inherited lblProgressoMensagem: TfcLabel
            Width = 286
            Height = 43
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 289
          Width = 286
          Height = 45
          inherited pgbProcesso: TProgressBar
            Width = 284
            Height = 43
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 578
    inherited tb97Fundo: TToolbar97
      Left = 406
      DockPos = 743
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
      DockPos = 398
      inherited ToolbarSep971: TToolbarSep97
        Left = 173
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 89
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 257
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Consultar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 92
        OnClick = bbtnCancelarClick
      end
      object bbtnTodos: TBitBtn
        Left = 260
        Top = 0
        Width = 81
        Height = 33
        Hint = 'Desmarca Todos'
        Caption = '&Todos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnTodosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
          000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
          99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
          0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
          FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
          0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
          000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
          00FF3777773333F77733333333333000033F3333333337777333}
        NumGlyphs = 2
      end
      object bbtnUm: TBitBtn
        Left = 176
        Top = 0
        Width = 81
        Height = 33
        Hint = 'Desmarca o Selecionado'
        Caption = '&Um'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnUmClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 3
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM  INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 58
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryBuscaMarcados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       H.DATAMOVCARTINV, PP.PLANPRVCONTABPATRO, C.DESCCARTINVEST' +
        ', I.DESCINVESTIMENTO,'
      
        '       H.IDPLANPREVCTBPATR, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO' +
        ' '
      
        'FROM HISTCARTINV H, INVESTIMENTO I, CARTEIRAINVEST C, VWPLANPREV' +
        'CTBPATR PP'
      'WHERE (H.IDCARTEIRAGERENC IS NULL)'
      '  AND (H.IDHISTCARTINV IN'
      '            (SELECT MAX(H1.IDHISTCARTINV)'
      '             FROM HISTCARTINV H1'
      
        '             WHERE (((:FLGMARCADO IS NULL) AND (H1.FLGCALCSALDO ' +
        'IS NULL)) OR'
      '                    (H1.FLGCALCSALDO = :FLGMARCADO))'
      
        '               AND ((:IDCARTEIRAINVEST IS NULL) OR (H1.IDCARTEIR' +
        'AINVEST = :IDCARTEIRAINVEST))'
      '               AND (H1.IDCARTEIRAGERENC IS NULL)'
      
        '               AND ((:DATAINI IS NULL) OR (H1.DATAMOVCARTINV >= ' +
        'TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')))'
      
        '               AND ((:DATAFIM IS NULL) OR (H1.DATAMOVCARTINV <= ' +
        'TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      
        '               AND (( H1.IDPLANPREVCTBPATR || H1.IDCARTEIRAINVES' +
        'T || H1.IDINVESTIMENTO || H1.DATAMOVCARTINV) IN'
      
        '                         (SELECT H2.IDPLANPREVCTBPATR || H2.IDCA' +
        'RTEIRAINVEST || H2.IDINVESTIMENTO || MAX(H2.DATAMOVCARTINV)'
      '                          FROM HISTCARTINV H2'
      
        '                          WHERE (((:FLGMARCADO IS NULL) AND (H2.' +
        'FLGCALCSALDO IS NULL)) OR'
      
        '                                 (H2.FLGCALCSALDO = :FLGMARCADO)' +
        ')'
      
        '                            AND ((:IDCARTEIRAINVEST IS NULL) OR ' +
        '(H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      '                            AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                            AND ((:IDINVESTIMENTO IS NULL) OR (H' +
        '2.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                            AND ((:DATAINI IS NULL) OR (H2.DATAM' +
        'OVCARTINV >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')))'
      
        '                            AND ((:DATAFIM IS NULL) OR (H2.DATAM' +
        'OVCARTINV <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      
        '                          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCA' +
        'RTEIRAINVEST, H2.IDINVESTIMENTO))'
      
        '             GROUP BY H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAINVEST,' +
        ' H1.IDINVESTIMENTO))'
      '  AND (H.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      '  AND (H.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST)'
      '  AND (H.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      'ORDER BY H.DATAMOVCARTINV, C.DESCCARTINVEST, I.DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 482
    Top = 190
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGMARCADO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGMARCADO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGMARCADO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGMARCADO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryBuscaMarcadosDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaMarcadosPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 36
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaMarcadosDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 44
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaMarcadosDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 19
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaMarcadosIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryBuscaMarcadosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryBuscaMarcadosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object dsBuscaMarcados: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaMarcados
    Left = 486
    Top = 230
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCARTINVEST, IDCARTEIRAINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 92
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
end
