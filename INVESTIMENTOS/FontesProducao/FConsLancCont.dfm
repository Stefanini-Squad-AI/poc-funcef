inherited frmConsLancCont: TfrmConsLancCont
  Left = 6
  Top = 23
  HelpContext = 790576
  Caption = 'Consulta Lançamentos Contábeis'
  ClientHeight = 520
  ClientWidth = 785
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 503
    Top = 29
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  inherited pnlFundo: TPanel
    Width = 785
    Height = 481
    object pnlCombos: TPanel
      Left = 1
      Top = 1
      Width = 783
      Height = 52
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 4
        Width = 93
        Height = 13
        Caption = 'Data Movimento'
      end
      object Label1: TLabel
        Left = 299
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label4: TLabel
        Left = 531
        Top = 3
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object Label5: TLabel
        Left = 107
        Top = 4
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object edData: TCMDateTimePicker
        Left = 7
        Top = 19
        Width = 98
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
        OnExit = edDataExit
      end
      object dblConsCarteira: TwwDBLookupCombo
        Left = 299
        Top = 19
        Width = 230
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira')
        LookupTable = qryConsCarteira
        LookupField = 'IDCARTEIRAINVEST'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblConsCarteiraExit
      end
      object dblConsOperacao: TwwDBLookupCombo
        Left = 531
        Top = 19
        Width = 238
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Operação'#9'F'
          'IDTIPOOPERACAO'#9'10'#9'IDTIPOOPERACAO'#9'F')
        LookupTable = qryOperacoes
        LookupField = 'IDTIPOOPERACAO'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblTipoInvest: TwwDBLookupCombo
        Left = 107
        Top = 19
        Width = 190
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'60'#9'DESCTIPOINVEST'#9'F')
        LookupTable = qryConsTipoInvest
        LookupField = 'IDTIPOINVEST'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblTipoInvestExit
      end
    end
    object pnlOperacoes: TPanel
      Left = 1
      Top = 53
      Width = 783
      Height = 295
      Align = alClient
      TabOrder = 1
      object dbgLancCont: TDBGrid
        Left = 1
        Top = 1
        Width = 781
        Height = 271
        Align = alClient
        DataSource = DmRelatorios.dsLancCont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'PAPEL'
            Title.Alignment = taCenter
            Title.Caption = 'Aplicação'
            Title.Color = clSilver
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCTIPOOPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Operação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 241
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDEMOVINVCART'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRMOVCARTINV'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRVARIACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Variação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRJUROS'
            Title.Alignment = taCenter
            Title.Caption = 'Juros'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end>
      end
      object dbgTotais: TDBGrid
        Left = 1
        Top = 272
        Width = 781
        Height = 22
        Align = alBottom
        Color = clBtnFace
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Totais'
            Title.Color = clHighlight
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clYellow
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 309
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 148
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 106
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end>
      end
    end
    object pnlLancamentos: TPanel
      Left = 1
      Top = 348
      Width = 783
      Height = 132
      Align = alBottom
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 781
        Height = 105
        Align = alClient
        DataSource = DmRelatorios.dsLancContItens
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'PLACONTA'
            Title.Alignment = taCenter
            Title.Caption = 'Conta'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Alignment = taCenter
            Title.Caption = 'Histórico'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 347
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LACVALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LACDEBCRE'
            Title.Alignment = taCenter
            Title.Caption = 'D/C'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 46
            Visible = True
          end>
      end
      object pnlGTotLancItem: TPanel
        Left = 1
        Top = 106
        Width = 781
        Height = 25
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object pnlGTLIDebitos: TPanel
          Left = 393
          Top = 2
          Width = 386
          Height = 21
          Align = alRight
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object fcLabel3: TfcLabel
            Left = 2
            Top = 2
            Width = 109
            Height = 17
            Align = alLeft
            Caption = '  Total deCréditos: '
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TextOptions.Alignment = taRightJustify
            TextOptions.VAlignment = vaVCenter
          end
          object lblTotCreditos: TfcLabel
            Left = 111
            Top = 2
            Width = 273
            Height = 17
            Align = alClient
            Caption = '0,00  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taRightJustify
            TextOptions.VAlignment = vaVCenter
          end
        end
        object pnlGTLICreditos: TPanel
          Left = 2
          Top = 2
          Width = 385
          Height = 21
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object lblTotDebitos: TfcLabel
            Left = 112
            Top = 2
            Width = 271
            Height = 17
            Align = alClient
            Caption = '0,00  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taRightJustify
            TextOptions.VAlignment = vaVCenter
          end
          object fcLabel2: TfcLabel
            Left = 2
            Top = 2
            Width = 110
            Height = 17
            Align = alLeft
            Caption = '  Total de Débitos: '
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TextOptions.Alignment = taRightJustify
            TextOptions.VAlignment = vaVCenter
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 481
    Width = 785
    inherited tb97Fundo: TToolbar97
      Left = 554
      DockPos = 554
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 304
      DockPos = 304
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bt_Imprime: TBitBtn
        Left = 165
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 49
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryConsCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   IDCARTEIRAINVEST,'
      '   DESCCARTINVEST'
      'FROM'
      '('
      'SELECT'
      '   CA.IDCARTEIRAINVEST,'
      '   CA.DESCCARTINVEST'
      'FROM'
      '   CARTEIRAINVEST CA, HISTFUNDO HF'
      'WHERE'
      '   CA.IDCARTEIRAINVEST = HF.IDCARTEIRAINVEST AND'
      '   HF.IDTIPOINVEST     = :TIPOINVEST         AND'
      '   HF.DATAMOVFUNDO     = :DATAMOV'
      ''
      'UNION'
      ''
      'SELECT'
      '   CA.IDCARTEIRAINVEST,'
      '   CA.DESCCARTINVEST'
      'FROM'
      '   CARTEIRAINVEST CA, HISTCARTINV HV'
      'WHERE'
      '   CA.IDCARTEIRAINVEST = HV.IDCARTEIRAINVEST AND'
      '   HV.IDTIPOINVEST     = :TIPOINVEST         AND'
      '   HV.DATAMOVCARTINV   = :DATAMOV) CARTEIRA'
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 365
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryConsCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object qryConsCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
  end
  object dtsConsCarteira: TwwDataSource
    DataSet = qryConsCarteira
    Left = 448
    Top = 8
  end
  object qryOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     DESCTIPOOPERACAO, IDTIPOOPERACAO'
      'FROM'
      '('
      'SELECT'
      '     TP.DESCTIPOOPERACAO, TP.IDTIPOOPERACAO'
      'FROM'
      '    HISTCARTINV HV, TIPOOPERACAO TP'
      'WHERE'
      
        '    (((HV.TIPMOVCARTINV = '#39'ATU'#39') AND (DECODE(HV.IDTIPOINVEST,1,-' +
        '2,-1)= TP.IDTIPOOPERACAO )) OR'
      
        '      ((NOT HV.IDTIPOOPERACAO IS NULL)   AND (TP.IDTIPOOPERACAO ' +
        '= HV.IDTIPOOPERACAO))) AND'
      '      TP.IDTIPOINVEST     = :TIPOINVEST  AND'
      '      HV.IDTIPOINVEST     = :TIPOINVEST  AND'
      '      HV.DATAMOVCARTINV   = :DATAMOV     AND'
      '      HV.IDCARTEIRAINVEST = :CARTEIRA'
      ''
      'UNION'
      ''
      'SELECT'
      '     TP.DESCTIPOOPERACAO, TP.IDTIPOOPERACAO'
      'FROM'
      '    HISTFUNDO HF, TIPOOPERACAO TP'
      'WHERE'
      
        '    (((HF.TIPMOVFUNDO = '#39'ATU'#39') AND (DECODE(HF.IDTIPOINVEST,1,-2,' +
        '-1)= TP.IDTIPOOPERACAO )) OR'
      
        '      ((NOT HF.IDTIPOOPERACAO IS NULL) AND (TP.IDTIPOOPERACAO = ' +
        'HF.IDTIPOOPERACAO))) AND'
      '      TP.IDTIPOINVEST = :TIPOINVEST  AND'
      '      HF.IDTIPOINVEST = :TIPOINVEST  AND'
      '      HF.DATAMOVFUNDO = :DATAMOV     AND'
      '      HF.IDCARTEIRAINVEST =:CARTEIRA) OPERACAO'
      ''
      'ORDER BY DESCTIPOOPERACAO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 685
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end>
    object qryOperacoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperacoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 473
    Top = 94
  end
  object qryConsTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    DESCTIPOINVEST, IDTIPOINVEST'
      'FROM '
      ''
      '('
      'SELECT '
      '     TI.DESCTIPOINVEST, TI.IDTIPOINVEST'
      'FROM HISTCARTINV HV, TIPOINVEST TI'
      'WHERE '
      '      HV.IDTIPOINVEST   = TI.IDTIPOINVEST AND'
      '      HV.DATAMOVCARTINV = :DATAMOV'
      ''
      'UNION'
      ''
      'SELECT  '
      '     TI.DESCTIPOINVEST, TI.IDTIPOINVEST'
      'FROM HISTFUNDO HF, TIPOINVEST TI'
      'WHERE '
      '      HF.IDTIPOINVEST = TI.IDTIPOINVEST AND'
      '      HF.DATAMOVFUNDO = :DATAMOV) TIPOINVEST'
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 165
    Top = 9
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryConsTipoInvestDESCTIPOINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryConsTipoInvestIDTIPOINVEST: TFloatField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
end
