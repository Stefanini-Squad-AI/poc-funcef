inherited frmExecEnvioExcessoCobranca: TfrmExecEnvioExcessoCobranca
  Left = 285
  Top = 145
  HelpContext = 150009
  BorderStyle = bsSingle
  Caption = 'Excesso de Débitos'
  ClientHeight = 458
  ClientWidth = 706
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 706
    Height = 425
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 452
      Height = 24
      Caption = 'Tratamentos de Excesso de Débito [seleção]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object nbPrincipal: TNotebook
      Left = 0
      Top = 37
      Width = 706
      Height = 388
      Align = alBottom
      TabOrder = 0
      OnPageChanged = nbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object lbl1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object lbl2: TLabel
          Left = 360
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object lbl4: TLabel
          Left = 547
          Top = 383
          Width = 189
          Height = 13
          Caption = '(apenas marca como "enviados")'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object chkVerificaCobrancaAtraso: TCheckBox
          Left = 568
          Top = 366
          Width = 257
          Height = 17
          Caption = 'NÃO tratar limite de prestações em atraso'
          Checked = True
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          State = cbChecked
          TabOrder = 7
          Visible = False
        end
        object pnl1: TPanel
          Left = 432
          Top = 193
          Width = 257
          Height = 58
          TabOrder = 5
          object lbl5: TLabel
            Left = 24
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 168
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cbbMes: TComboBox
            Left = 24
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object btnContinuar: TfcShapeBtn
          Left = 568
          Top = 347
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 9
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 609
          Height = 41
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        object chkIntegraCaR: TCheckBox
          Left = 472
          Top = 374
          Width = 233
          Height = 17
          Caption = 'NÃO gerar Documentos de cobrança'
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 345
          Height = 97
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 78
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 88
          Width = 345
          Height = 94
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Top = 17
            Width = 329
            Height = 74
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
          end
        end
        object grpDataVencto: TGroupBox
          Left = 16
          Top = 263
          Width = 169
          Height = 49
          Caption = 'Nova Data de Vencimento'
          TabOrder = 6
          object edtDataVenctoIni: TwwDBDateTimePicker
            Left = 16
            Top = 18
            Width = 129
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object chkInArquivo: TCheckBox
          Left = 19
          Top = 361
          Width = 262
          Height = 17
          Caption = 'Considerar APENAS matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = chkInArquivoClick
        end
        object chkNotInArquivo: TCheckBox
          Left = 296
          Top = 361
          Width = 241
          Height = 17
          Caption = 'NÃO considerar matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = chkNotInArquivoClick
        end
        object rgNovoDestino: TRadioGroup
          Left = 16
          Top = 189
          Width = 393
          Height = 73
          Caption = 'Novo Destino'
          Items.Strings = (
            'Folha Patrocinadora'
            'Folha de Beneficio'
            'Financeiro a Receber')
          TabOrder = 12
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object bvl1: TBevel
          Left = 16
          Top = 332
          Width = 673
          Height = 3
          Shape = bsTopLine
        end
        object lblTotal: TLabel
          Left = 45
          Top = 174
          Width = 169
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos enviados: '
          Visible = False
        end
        object lbl7: TLabel
          Left = 384
          Top = 134
          Width = 182
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total dos Itens enviados: '
          Visible = False
        end
        object lbl8: TLabel
          Left = 15
          Top = 310
          Width = 199
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos NÃO enviados: '
          Visible = False
        end
        object btnVoltar: TfcShapeBtn
          Left = 504
          Top = 344
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object mmoResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object edtNumResult: TRealEdit
          Left = 216
          Top = 170
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 4
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtVlrTotParcela: TRealEdit
          Left = 560
          Top = 170
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object mmoErro: TMemo
          Left = 16
          Top = 224
          Width = 673
          Height = 81
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 6
        end
        object edtNumErro: TRealEdit
          Left = 216
          Top = 306
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 7
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object pnl2: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object pnl3: TPanel
          Left = 16
          Top = 198
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Erros encontrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 706
    inherited tb97Fundo: TToolbar97
      Left = 534
      DockPos = 565
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object wwQuery1: TwwQuery
    ValidateWithMask = True
    Left = 248
    Top = 317
  end
end
