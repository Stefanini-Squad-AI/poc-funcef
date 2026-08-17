inherited frmConsAtuarial: TfrmConsAtuarial
  Left = 3
  Top = -2
  HelpContext = 790572
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 553
  ClientWidth = 800
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 514
    inherited bvlSepTit: TBevel
      Width = 798
    end
    inherited pnlTitulo: TPanel
      Width = 798
      inherited lbNomDescricao: TfcLabel
        Width = 357
        Caption = 'Cálculo  Atuarial dos Investimentos'
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 45
      Width = 798
      Height = 415
      Align = alClient
      TabOrder = 1
      object pnlFiltros: TPanel
        Left = 1
        Top = 1
        Width = 796
        Height = 90
        Align = alTop
        TabOrder = 0
        object Label5: TLabel
          Left = 586
          Top = 44
          Width = 81
          Height = 13
          Caption = 'Taxa de Juros'
        end
        object Label4: TLabel
          Left = 383
          Top = 4
          Width = 167
          Height = 13
          Caption = 'Regra de Cálculo - Indexador'
        end
        object Label6: TLabel
          Left = 193
          Top = 4
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object Label7: TLabel
          Left = 8
          Top = 4
          Width = 120
          Height = 13
          Caption = 'Tipo de Investimento'
        end
        object Label8: TLabel
          Left = 383
          Top = 44
          Width = 141
          Height = 13
          Caption = 'Regra de Cálculo - Juros'
        end
        object Label3: TLabel
          Left = 288
          Top = 44
          Width = 20
          Height = 13
          Caption = 'Fim'
        end
        object Label1: TLabel
          Left = 194
          Top = 44
          Width = 34
          Height = 13
          Caption = 'Início'
        end
        object Label9: TLabel
          Left = 8
          Top = 44
          Width = 44
          Height = 13
          Caption = 'Emissor'
        end
        object Label2: TLabel
          Left = 645
          Top = 22
          Width = 10
          Height = 13
          Alignment = taRightJustify
          Caption = '%'
        end
        object edtJuros: TRealEdit
          Left = 586
          Top = 59
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 8
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object dblkRegra: TwwDBLookupCombo
          Left = 383
          Top = 19
          Width = 199
          Height = 21
          Hint = 'Descrição da Moeda'
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loColLines, loRowLines, loTitles]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblInvestimento: TwwDBLookupCombo
          Left = 192
          Top = 19
          Width = 187
          Height = 21
          Hint = 'Descrição da Moeda'
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblInvestimentoExit
        end
        object dblTipoInvest: TwwDBLookupCombo
          Left = 8
          Top = 19
          Width = 179
          Height = 21
          Hint = 'Descrição da Moeda'
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento'#9'F')
          LookupTable = qryTipoInvest
          LookupField = 'IDTIPOINVEST'
          Options = [loColLines, loRowLines, loTitles]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblTipoInvestCloseUp
        end
        object dblRegraJur: TwwDBLookupCombo
          Left = 383
          Top = 59
          Width = 198
          Height = 21
          Hint = 'Descrição da Moeda'
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
          LookupTable = qryRegraJur
          LookupField = 'IDREGRA'
          Options = [loColLines, loRowLines, loTitles]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dtDtaInicio: TCMDateTimePicker
          Left = 192
          Top = 59
          Width = 90
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
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
          TabOrder = 3
        end
        object dtDtaFim: TCMDateTimePicker
          Left = 288
          Top = 59
          Width = 91
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clWhite
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
          TabOrder = 4
        end
        object edtValor: TEdit
          Left = 673
          Top = 59
          Width = 110
          Height = 21
          TabOrder = 10
          Visible = False
        end
        object dblConsEmissor: TwwDBLookupCombo
          Left = 8
          Top = 59
          Width = 180
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SIGLAEMISSOR'#9'20'#9'Descrição'#9'F')
          LookupTable = qryEmissor
          LookupField = 'IDEMISSOR'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblConsEmissorExit
        end
        object spePercentual: TSpinEdit
          Left = 586
          Top = 18
          Width = 53
          Height = 22
          Hint = 'Percentual sobre a Moeda'
          MaxValue = 0
          MinValue = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Value = 100
        end
        object chkPassoaPasso: TdxCheckEdit
          Left = 671
          Top = 12
          Width = 73
          Style.BorderStyle = xbsNone
          Style.ButtonStyle = bts3D
          Style.ButtonTransparence = ebtNone
          Style.HotTrack = False
          Style.Shadow = False
          TabOrder = 9
          Alignment = taLeftJustify
          Caption = 'Passo a Passo'
          MultiLine = True
          NullStyle = nsUnchecked
          StoredValues = 1
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 91
        Width = 796
        Height = 323
        Align = alClient
        TabOrder = 1
        object dbgAtuarial: TwwDBGrid
          Left = 1
          Top = 1
          Width = 794
          Height = 321
          Selected.Strings = (
            'DATAMOVCARTINV'#9'10'#9'Data'
            'HISTMOVCARTINV'#9'40'#9'Histórico'
            'VLRMOV'#9'15'#9'Valor~Movimentado'
            'QTDMOV'#9'15'#9'Quantidade~Movimentada'
            'FATORINDICE'#9'12'#9'Fator Índice'
            'DIFDIAS'#9'13'#9'Dias~ no Período'
            'DIFDIASACU'#9'10'#9'Dias~ Totais'
            'RENTPERIODO'#9'16'#9'Rentabilidade~no Período'
            'RENTACU'#9'16'#9'Rentabilidade~Acumulada'
            'FATORJUROS'#9'15'#9'Fator de Juros'
            'FATORTOTAL'#9'16'#9'Fator de Correção'
            'QTDCOTAS'#9'24'#9'Quantdade de Cotas'
            'VALORCORRIGIDO'#9'17'#9'Valor Corrigído')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DmRelAtuarial.dsAtuarial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
          ParentFont = False
          PopupMenu = ppmAtuarial
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 460
      Width = 798
      Height = 53
      Align = alBottom
      TabOrder = 2
      object grpValorCorrigido: TGroupBox
        Left = 537
        Top = 1
        Width = 260
        Height = 51
        Align = alRight
        Caption = ' P.U. Atuarial '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblPUAtuarial: TfcLabel
          Left = 2
          Top = 18
          Width = 256
          Height = 31
          Align = alClient
          Caption = 'R$ 0,000000000'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          PopupMenu = pmnCopiarPU
          TextOptions.Alignment = taCenter
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
        end
      end
      object grpValorAtuarial: TGroupBox
        Left = 1
        Top = 1
        Width = 250
        Height = 51
        Align = alLeft
        Caption = ' Valor Atuarial '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblValorCorrigido: TfcLabel
          Left = 2
          Top = 18
          Width = 246
          Height = 31
          Align = alClient
          Caption = 'R$ 0,00'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          PopupMenu = pmnCopiarValor
          TextOptions.Alignment = taCenter
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
        end
      end
      object grpQuantidade: TGroupBox
        Left = 251
        Top = 1
        Width = 286
        Height = 51
        Align = alClient
        Caption = ' Quantidade '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lblQuantidade: TfcLabel
          Left = 2
          Top = 18
          Width = 282
          Height = 31
          Align = alClient
          Caption = '0'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taCenter
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 628
      DockPos = 954
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 375
      DockPos = 700
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bbtnImprimirClick
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
    Left = 427
    Top = 3
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object regAtuarial: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 493
    Top = 3
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 557
    Top = 4
  end
  object qryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVEST, DESCTIPOINVEST'
      'FROM TIPOINVEST'
      
        'WHERE (((:IDTIPOINVEST IS NOT NULL) AND (IDTIPOINVEST = :IDTIPOI' +
        'NVEST)) OR'
      '        (:IDTIPOINVEST IS NULL))'
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 129
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object qryTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 217
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryRegraJur: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 289
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraJurIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
    end
    object qryRegraJurNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, MID.MINDATA, MAD.' +
        'MAXDATA, IV.IDEMISSOR'
      'FROM HISTCARTINV HC,'
      '     (SELECT MIN(DATAMOVCARTINV) AS MINDATA, IDINVESTIMENTO'
      '      FROM HISTCARTINV'
      '      WHERE TIPMOVCARTINV = '#39'OPE'#39
      '      GROUP BY IDINVESTIMENTO) MID,'
      '     (SELECT MAX(DATAMOVCARTINV) AS MAXDATA, IDINVESTIMENTO'
      '      FROM HISTCARTINV'
      '      WHERE TIPMOVCARTINV = '#39'OPE'#39
      '      GROUP BY IDINVESTIMENTO) MAD,'
      '     INVESTIMENTO IV'
      'WHERE IV.IDTIPOINVEST = :IDTIPOINVEST'
      '  AND IV.IDINVESTIMENTO = HC.IDINVESTIMENTO'
      '  AND IV.IDINVESTIMENTO = MID.IDINVESTIMENTO'
      '  AND IV.IDINVESTIMENTO = MAD.IDINVESTIMENTO'
      
        'GROUP BY IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, MID.MINDATA, MA' +
        'D.MAXDATA, IV.IDEMISSOR'
      ''
      'ORDER BY DESCINVESTIMENTO, MID.MINDATA, MAD.MAXDATA '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoMINDATA: TDateTimeField
      FieldName = 'MINDATA'
      Visible = False
    end
    object qryInvestimentoMAXDATA: TDateTimeField
      FieldName = 'MAXDATA'
      Visible = False
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object ppmAtuarial: TPopupMenu
    OnPopup = ppmAtuarialPopup
    Left = 621
    Top = 5
    object FixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      OnClick = FixarColunaClick
    end
    object LiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      OnClick = LiberarColunaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LiberarTodasColunas: TMenuItem
      Caption = 'Liberar Todas as Colunas'
      OnClick = LiberarTodasColunasClick
    end
  end
  object pmnCopiarValor: TPopupMenu
    Left = 669
    Top = 5
    object CopiarValor: TMenuItem
      Caption = 'Copiar'
      OnClick = CopiarValorClick
    end
  end
  object pmnCopiarPU: TPopupMenu
    Left = 717
    Top = 5
    object CopiarPU: TMenuItem
      Caption = 'Copiar'
      OnClick = CopiarPUClick
    end
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR FROM EMISSOR'
      'ORDER BY SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 56
    Top = 211
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object QryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #39'99/99/9999'#39'   AS DATAMOVCARTINV,'
      
        #39'12345678901234567890123456789012345678901234567890123456789'#39'   ' +
        'AS HISTMOVCARTINV,'
      '0     AS IDINVESTIMENTO,'
      '0     AS VLRMOV,'
      '0     AS QTDCOTAS,'
      '0     AS QTD,'
      #39'N'#39'   AS FLGOPDIREITO,'
      #39'N'#39'   AS NATUREZAOPERACAO'
      'FROM '
      ''
      'DUAL'
      ''
      ' '
      ' ')
    UpdateObject = UpdDados
    ValidateWithMask = True
    Left = 56
    Top = 280
    object QryDadosDATAMOVCARTINV: TStringField
      FieldName = 'DATAMOVCARTINV'
      FixedChar = True
      Size = 10
    end
    object QryDadosHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      FixedChar = True
      Size = 60
    end
    object QryDadosVLRMOV: TFloatField
      FieldName = 'VLRMOV'
    end
    object QryDadosQTDCOTAS: TFloatField
      FieldName = 'QTDCOTAS'
    end
    object QryDadosQTD: TFloatField
      FieldName = 'QTD'
    end
    object QryDadosFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      FixedChar = True
      Size = 1
    end
    object QryDadosNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryDadosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
  object DsDados: TwwDataSource
    AutoEdit = False
    DataSet = QryDados
    Left = 56
    Top = 388
  end
  object UpdDados: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  HISTMOVCARTINV = :HISTMOVCARTINV,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  VLRMOV = :VLRMOV,'
      '  QTDCOTAS = :QTDCOTAS,'
      '  QTD = :QTD,'
      '  FLGOPDIREITO = :FLGOPDIREITO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV and'
      '  HISTMOVCARTINV = :OLD_HISTMOVCARTINV')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (DATAMOVCARTINV, HISTMOVCARTINV, IDINVESTIMENTO, VLRMOV, '
      'QTDCOTAS, QTD, '
      '   FLGOPDIREITO, NATUREZAOPERACAO)'
      'values'
      '  (:DATAMOVCARTINV, :HISTMOVCARTINV, :IDINVESTIMENTO, :VLRMOV, '
      ':QTDCOTAS, '
      '   :QTD, :FLGOPDIREITO, :NATUREZAOPERACAO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV and'
      '  HISTMOVCARTINV = :OLD_HISTMOVCARTINV')
    Left = 56
    Top = 333
  end
  object QryVerInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVCARTINV) AS DATAMOVCARTINV'
      'FROM'
      '    HISTCARTINV HC'
      'WHERE'
      '      (HC.IDINVESTIMENTO  = :IDINVESTIMENTO)             AND'
      '      (HC.DATAMOVCARTINV >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))  AND'
      '      (HC.TIPMOVCARTINV IN ('#39'OPE'#39'))'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object QrySaldoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,'
      
        '   H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART' +
        ', H1.SALDOVLRINVCART, H1.SALDOATU,'
      
        '   H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND, H1.SALDOVARIACAO, H1' +
        '.SALDOJUROS, H1.SALDOPREMIO,'
      
        '   H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAP' +
        'U, H1.SALDOAGIO'
      'FROM'
      '   HISTCARTINV H1'
      'WHERE'
      '   (IDCARTEIRAGERENC IS NULL) AND'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      
        '   (((NULL IS NOT NULL) AND (IDLOTE = NULL) ) OR ((NULL IS NULL)' +
        ' AND (IDLOTE IS NULL))) AND'
      '   (H1.IDHISTCARTINV = (SELECT MAX(H2.IDHISTCARTINV)'
      '                        FROM HISTCARTINV H2'
      '                        WHERE '
      '                              ( H2.IDCARTEIRAGERENC IS NULL) AND'
      
        '                              ( H2.IDINVESTIMENTO = :IDINVESTIME' +
        'NTO ) AND'
      
        '                              (((H1.IDLOTE IS NOT NULL) AND (H2.' +
        'IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NU' +
        'LL))) AND'
      '                              (H2.IDHISTCARTINV < 9999999) AND'
      
        '                              (H2.DATAMOVCARTINV = (SELECT MAX(H' +
        '3.DATAMOVCARTINV)'
      
        '                                                    FROM HISTCAR' +
        'TINV H3'
      '                                                    WHERE '
      
        '                                                          (H3.ID' +
        'CARTEIRAGERENC IS NULL) AND'
      
        '                                                          (H3.ID' +
        'INVESTIMENTO = :IDINVESTIMENTO ) AND'
      
        '                                                          (((H2.' +
        'IDLOTE IS NOT NULL) AND (H3.IDLOTE = H2.IDLOTE) ) OR ( (H2.IDLOT' +
        'E IS NULL) AND (H3.IDLOTE IS NULL) )) AND'
      
        '                                                          ((H3.D' +
        'ATAMOVCARTINV < TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ) OR ( H3.DATAMOVCAR' +
        'TINV = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ) AND ( H3.IDHISTCARTINV < 99' +
        '99999 )))))) AND'
      '   (SALDOVLRINVCART IS NOT NULL )'
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' ')
    ValidateWithMask = True
    Left = 552
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object QryInvestimentoEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO'
      'FROM'
      '   INVESTIMENTO'
      'WHERE'
      '   IDEMISSOR =:IDEMISSOR     ')
    ValidateWithMask = True
    Left = 661
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
  end
end
