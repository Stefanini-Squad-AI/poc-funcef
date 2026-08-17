inherited frmExecAcrescimoNovo: TfrmExecAcrescimoNovo
  Left = 677
  Top = 287
  HelpContext = 540006
  Caption = 'Acréscimo de Valor'
  ClientHeight = 437
  ClientWidth = 751
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 751
    Height = 404
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 308
      Height = 24
      Caption = 'Acréscimo de Valor [ Seleção ]'
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
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 38
      Width = 751
      Height = 366
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Bevel2: TBevel
          Left = 16
          Top = 307
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 424
          Top = 18
          Width = 85
          Height = 13
          Caption = 'Tipo de Imóvel'
        end
        object Label6: TLabel
          Left = 16
          Top = 18
          Width = 100
          Height = 13
          Caption = 'Grupo de Imóveis'
        end
        object Label12: TLabel
          Left = 424
          Top = 152
          Width = 174
          Height = 13
          Caption = 'Observações do Evento / CAF'
        end
        object Label2: TLabel
          Left = 568
          Top = 78
          Width = 132
          Height = 13
          Caption = 'Valor (Moeda Corrente)'
        end
        object Label3: TLabel
          Left = 424
          Top = 78
          Width = 108
          Height = 13
          Caption = 'Data do Acréscimo'
        end
        object Label14: TLabel
          Left = 16
          Top = 77
          Width = 25
          Height = 13
          Caption = 'Bem'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 536
          Top = 326
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object btnAtualizar: TfcShapeBtn
          Left = 16
          Top = 326
          Width = 89
          Height = 29
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
            000024884222222448888877FF788888877F888800002244222222222488887F
            7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
            2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
            887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
            8888887777777888888888880000888888888888888888888888888888FFFFFF
            00008888888888844444488FFFF888888777777F0000A444888888A222224877
            77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
            48888844222248878878FFFF7788887F00008A222444442222224887F8877777
            888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
            A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
            0000}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 8
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAtualizarClick
        end
        object DBcboTipoImovel: TwwDBLookupCombo
          Left = 424
          Top = 32
          Width = 297
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL'#9'F')
          LookupTable = dtmLookImobiliario.qryLookTipoImovel
          LookupField = 'CODTIPIMOVEL'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          OnCloseUp = DBcboTipoImovelCloseUp
        end
        object DBcboGrupo: TwwDBLookupCombo
          Left = 16
          Top = 32
          Width = 377
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRRDESCRICAO'#9'60'#9'Descrição')
          LookupTable = dtmLookImobiliario.qryLookGrupoRateio
          LookupField = 'IDGRUPORATEIO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboGrupoCloseUp
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 135
          Width = 401
          Height = 162
          Caption = 'Parâmetros CAF - para novos bens '
          TabOrder = 5
          object Label52: TLabel
            Left = 15
            Top = 113
            Width = 51
            Height = 13
            Caption = 'Situação'
          end
          inline molLocalizacao1: TmolLocalizacao
            Left = 6
            Top = 16
            inherited label1: TLabel
              Width = 69
            end
          end
          inline molClasseBem1: TmolClasseBem
            Left = 6
            Top = 64
            TabOrder = 1
            inherited label1: TLabel
              Width = 84
            end
          end
          object DBcboSituacao: TwwDBLookupCombo
            Left = 15
            Top = 127
            Width = 368
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSITUACAO'#9'45'#9'DESCSITUACAO')
            LookupTable = dtmLookImobiliario.qryLookSituacao
            LookupField = 'IDSITUACAO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object meObsEvento: TMemo
          Left = 424
          Top = 168
          Width = 297
          Height = 113
          MaxLength = 2000
          TabOrder = 6
        end
        object edtVlrOper: TRealEdit
          Left = 568
          Top = 92
          Width = 153
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtDataLanc: TCMDateTimePicker
          Left = 424
          Top = 92
          Width = 113
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
          TabOrder = 3
        end
        object dbCboBem: TwwDBLookupCombo
          Left = 16
          Top = 91
          Width = 377
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'#9'F'
            'CLASSE'#9'15'#9'Classe'#9'F')
          LookupTable = qryGrupo
          LookupField = 'IDGRUPO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagGruposContabeis'
        object Bevel4: TBevel
          Left = 16
          Top = 307
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label9: TLabel
          Left = 16
          Top = 319
          Width = 111
          Height = 13
          Caption = 'Total da Aquisição:'
        end
        object Label11: TLabel
          Left = 160
          Top = 319
          Width = 102
          Height = 13
          Caption = 'Total dos Grupos:'
        end
        object Panel4: TPanel
          Left = 16
          Top = 15
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'RETIRADO TALVEZ NO FUTURO'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object fcShapeBtn4: TfcShapeBtn
            Left = 615
            Top = 1
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
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
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 17
          Top = 41
          Width = 703
          Height = 240
          Selected.Strings = (
            'NOME'#9'67'#9'Nome'#9'F'
            'CLASSE'#9'15'#9'Classe'#9'F'
            'PERCENT'#9'12'#9'% Rateio'#9'F'
            'VALOR'#9'15'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsGruposContabeis
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object edtTotalCompra: TRealEdit
          Left = 16
          Top = 334
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotalGrupo: TRealEdit
          Left = 160
          Top = 334
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object fcShapeBtn8: TfcShapeBtn
          Left = 440
          Top = 326
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn8Click
        end
        object fcShapeBtn3: TfcShapeBtn
          Left = 536
          Top = 326
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object Bevel3: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label15: TLabel
          Left = 16
          Top = 318
          Width = 110
          Height = 13
          Caption = 'Total do Acréscimo'
        end
        object Label16: TLabel
          Left = 160
          Top = 318
          Width = 90
          Height = 13
          Caption = 'Total dos Bens:'
        end
        object Bevel5: TBevel
          Left = 16
          Top = 307
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object btnVoltar: TfcShapeBtn
          Left = 440
          Top = 326
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object Panel3: TPanel
          Left = 14
          Top = 15
          Width = 707
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object btnTotaliza: TfcShapeBtn
            Left = 617
            Top = 1
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
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
            OnClick = btnTotalizaClick
          end
          object btnInsert: TfcShapeBtn
            Left = 1
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Inserir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnInsertClick
          end
          object btnExclui: TfcShapeBtn
            Left = 78
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Excluir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnExcluiClick
          end
          object btnTrazer: TfcShapeBtn
            Left = 155
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Trazer'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
        end
        object btnContinuarLanc: TfcShapeBtn
          Left = 536
          Top = 326
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarLancClick
        end
        object Panel1: TPanel
          Left = 368
          Top = 244
          Width = 353
          Height = 27
          BevelOuter = bvNone
          TabOrder = 3
          object Label4: TLabel
            Left = 136
            Top = 6
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total:'
          end
          object edtTotalLanc: TRealEdit
            Left = 176
            Top = 2
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object OME: TwwDBGrid
          Left = 15
          Top = 40
          Width = 705
          Height = 240
          Selected.Strings = (
            'IMOVEL_EXTENSO'#9'89'#9'Imóvel'#9'T'
            'VALOR'#9'14'#9'Valor'#9'F'
            'DSC_MOVIMENTACAO'#9'6'#9'Tipo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object edtTotalAcrescimo: TRealEdit
          Left = 16
          Top = 334
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotalBens: TRealEdit
          Left = 160
          Top = 334
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagAP'
        object Bevel1: TBevel
          Left = 16
          Top = 307
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label22: TLabel
          Left = 16
          Top = 10
          Width = 97
          Height = 13
          Caption = 'Tipo de Despesa'
        end
        object Label5: TLabel
          Left = 528
          Top = 50
          Width = 83
          Height = 13
          Caption = 'Nº Documento'
        end
        object lblContaBancaria: TLabel
          Left = 392
          Top = 90
          Width = 88
          Height = 13
          Caption = 'Conta Bancária'
          Enabled = False
        end
        object Label10: TLabel
          Left = 16
          Top = 90
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object Label17: TLabel
          Left = 16
          Top = 194
          Width = 129
          Height = 13
          Caption = 'Referência / Processo'
        end
        object Label18: TLabel
          Left = 16
          Top = 234
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Label19: TLabel
          Left = 360
          Top = 194
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 632
          Top = 326
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
            0400000000000001000000000000000000001000000010000000000000000000
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
          OnClick = fcShapeBtn1Click
        end
        object fcShapeBtn2: TfcShapeBtn
          Left = 16
          Top = 326
          Width = 89
          Height = 29
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
            000024884222222448888877FF788888877F888800002244222222222488887F
            7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
            2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
            887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
            8888887777777888888888880000888888888888888888888888888888FFFFFF
            00008888888888844444488FFFF888888777777F0000A444888888A222224877
            77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
            48888844222248878878FFFF7788887F00008A222444442222224887F8877777
            888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
            A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
            0000}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn2Click
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 16
          Top = 24
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
          LookupTable = dtmLookImobiliario.qryLookTipoRecDes
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        inline molFornecedor1: TmolFornecedor
          Left = 8
          Top = 48
          Width = 513
          TabOrder = 1
          inherited btnBuscaForn: TBitBtn
            Left = 456
            OnClick = molFornecedor1btnBuscaFornClick
          end
          inherited btnLimpaForn: TBitBtn
            Left = 480
          end
          inherited edtRazaoSocial: TEdit
            Width = 289
          end
        end
        object edtNumDocumento: TEdit
          Left = 528
          Top = 64
          Width = 193
          Height = 21
          TabOrder = 2
        end
        object dbCboContaBancaria: TwwDBLookupCombo
          Left = 392
          Top = 104
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CONTACORRENTE'#9'15'#9'Cta. Corrente'#9'F'
            'NUMBANCO'#9'10'#9'Banco'#9'F'
            'NUMAGENCIA'#9'10'#9'Agência'#9'F'
            'FLGCONTAPREF'#9'5'#9'     Pref.'#9'F')
          LookupTable = dtmLookImobiliario.qryLookContaBancaria
          LookupField = 'IDCBANCARIA'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 113
          Enabled = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboFormaRecPag: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO')
          LookupTable = dtmLookImobiliario.qryLookFormaRecPag
          LookupField = 'CODFORMA'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = DBcboFormaRecPagCloseUp
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 128
          Width = 705
          Height = 61
          TabOrder = 5
          object Label7: TLabel
            Left = 360
            Top = 16
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object lblDataVencimento: TLabel
            Left = 240
            Top = 16
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label8: TLabel
            Left = 16
            Top = 16
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label13: TLabel
            Left = 536
            Top = 16
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object edtDataLancamento: TCMDateTimePicker
            Left = 360
            Top = 30
            Width = 105
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
            Enabled = False
            ShowButton = True
            TabOrder = 3
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 240
            Top = 30
            Width = 105
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
            TabOrder = 2
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 30
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object edtVlrTotal: TRealEdit
            Left = 536
            Top = 30
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cboMes: TComboBox
            Left = 16
            Top = 30
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
        object edtReferenciaAP: TEdit
          Left = 16
          Top = 208
          Width = 329
          Height = 21
          MaxLength = 30
          TabOrder = 6
        end
        object DBcboCentroCusto: TwwDBLookupCombo
          Left = 16
          Top = 248
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = dtmLookImobiliario.qryLookCentroCusto
          LookupField = 'CODCENTROCUSTO'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object memObs: TMemo
          Left = 360
          Top = 208
          Width = 361
          Height = 62
          MaxLength = 1000
          TabOrder = 8
        end
        object fcShapeBtn5: TfcShapeBtn
          Left = 440
          Top = 326
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
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
          TabOrder = 11
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn5Click
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 751
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryTipoImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   GR.IDGRUPORATEIO, I.CODTIPIMOVEL, COUNT(*)'
      'FROM '
      '   GRUPORATEIO GR, GRUPOXIMOVEL GI, IMOVEL I'
      'WHERE'
      '   ( GR.IDGRUPORATEIO = GI.IDGRUPORATEIO )'
      '   AND ( GI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( GR.IDGRUPORATEIO = :PIDGRUPORATEIO )'
      'GROUP BY'
      '   GR.IDGRUPORATEIO, I.CODTIPIMOVEL')
    ValidateWithMask = True
    Left = 561
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end>
    object qryTipoImovelIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
    end
    object qryTipoImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryTipoImovelCOUNT: TFloatField
      FieldName = 'COUNT(*)'
    end
  end
  object updGruposContabeis: TUpdateSQL
    Left = 345
    Top = 354
  end
  object dsGruposContabeis: TwwDataSource
    DataSet = qryGruposContabeisMORREU
    Left = 345
    Top = 339
  end
  object qryGruposContabeisMORREU: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '-- ESTA QUERY É REESCRITA EM TEMPO DE EXECUÇÃO DEVIDO A CLÁUSULA' +
        ' IN'
      'SELECT'
      
        '   G.IDGRUPO, G.NOME, G.CLASSE, G.FLGSEMPLACA, G.DEPRECIACAO, 0 ' +
        'AS PERCENT, 0 AS VALOR,'
      
        '   0 AS PERCENT_EFETIVO, -1 AS PLACACAF,  '#39'                     ' +
        '    '#39' AS NOME_BEM, '#39' '#39' AS GRUPO_BEM'
      'FROM'
      '   GRUPO G'
      'WHERE'
      '   ( G.FLGIMOVEL = 1 )'
      '   AND ( TIPO = '#39'A'#39' )'
      '   AND ( G.IDGRUPO IN (:PIDGRUPOS) )'
      'ORDER BY'
      '   G.NOME, G.CLASSE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updGruposContabeis
    ValidateWithMask = True
    Left = 344
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDGRUPOS'
        ParamType = ptInput
      end>
    object qryGruposContabeisMORREUIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      ReadOnly = True
    end
    object qryGruposContabeisMORREUNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 60
    end
    object qryGruposContabeisMORREUCLASSE: TStringField
      FieldName = 'CLASSE'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryGruposContabeisMORREUVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryGruposContabeisMORREUPERCENT: TFloatField
      FieldName = 'PERCENT'
      DisplayFormat = '#,##0.0000'
      EditFormat = '#,##0.0000'
    end
    object qryGruposContabeisMORREUPLACACAF: TFloatField
      FieldName = 'PLACACAF'
    end
    object qryGruposContabeisMORREUFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
    end
    object qryGruposContabeisMORREUDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
    end
    object qryGruposContabeisMORREUPERCENT_EFETIVO: TFloatField
      FieldName = 'PERCENT_EFETIVO'
    end
    object qryGruposContabeisMORREUNOME_BEM: TStringField
      FieldName = 'NOME_BEM'
      FixedChar = True
      Size = 25
    end
    object qryGruposContabeisMORREUGRUPO_BEM: TStringField
      FieldName = 'GRUPO_BEM'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   CODTIPIMOVEL   = :PCODTIPIMOVEL,'
      '   IMODATACOMPRA  = :PIMODATACOMPRA,'
      '   IMOVLRCOMPRA   = :PIMOVLRCOMPRA,'
      '   IMOMOEDACOMPRA = :PIMOMOEDACOMPRA,'
      '   FLGSTATUS      = '#39'N'#39',  -- IMÓVEL EM CARTEIRA'
      '   FLGATIVO       = 1'
      'WHERE'
      '   IDIMOVEL = :PIDIMOVEL'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 473
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOMOEDACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.NOME,'
      '       G.CLASSE,'
      '       C.DESCRICAO AS NOMECLASSE,'
      '       G.FLGSEMPLACA,'
      '       G.DEPRECIACAO'
      '  FROM GRUPO G, CLASSEDEBEM C'
      ' WHERE G.CLASSE = C.CODHIERARQ(+)'
      '   AND G.FLGIMOVEL = 1'
      '   AND G.TIPO = '#39'A'#39
      
        '   AND G.IDGRUPO IN ( -1 )   -- QUERY EM TEMPO DE EXECUÇÃO ID DO' +
        'S GRUPOS'
      ''
      'ORDER BY'
      '   G.NOME, G.CLASSE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 104
    object qryGrupoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryGrupoCLASSE: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 15
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGrupoIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryGrupoFLGSEMPLACA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSEMPLACA'
      Visible = False
    end
    object qryGrupoDEPRECIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'DEPRECIACAO'
      Visible = False
    end
    object qryGrupoNOMECLASSE: TStringField
      FieldName = 'NOMECLASSE'
      Size = 60
    end
  end
  object qryBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS NUM_MOVIMENTACAO, IDIMOVEL, IMOVEL_EXTENSO, NOME_MESTRE,'
      '   IXBGRUPO, '#39'                         '#39' AS NOME_BEM,'
      '   '#39'     '#39' AS DSC_MOVIMENTACAO,'
      '   PLACA,'
      '   0 AS VALOR,'
      '   0 AS SLD_BEM,'
      '   IDBEM'
      '  , IDGRUPO'
      ' , IDCONJUNTO'
      ', DESCCONJUNTO'
      'FROM'
      '   VWBEMXIMOVEL'
      'WHERE'
      '   1=2'
      ' '
      ' '
      ' ')
    UpdateObject = updBens
    ValidateWithMask = True
    Left = 201
    Top = 353
    object qryBensNUM_MOVIMENTACAO: TFloatField
      FieldName = 'NUM_MOVIMENTACAO'
    end
    object qryBensIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryBensIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryBensNOME_BEM: TStringField
      FieldName = 'NOME_BEM'
      FixedChar = True
      Size = 25
    end
    object qryBensPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBensVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryBensIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryBensIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBensNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryBensSLD_BEM: TFloatField
      FieldName = 'SLD_BEM'
    end
    object qryBensDSC_MOVIMENTACAO: TStringField
      FieldName = 'DSC_MOVIMENTACAO'
      FixedChar = True
      Size = 5
    end
    object qryBensIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBensIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryBensDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      FixedChar = True
      Size = 50
    end
  end
  object dsBens: TwwDataSource
    DataSet = qryBens
    Left = 201
    Top = 339
  end
  object updBens: TUpdateSQL
    Left = 202
    Top = 325
  end
  object qryLookBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXBGRUPO, PLACA, IDBEM, IDCONJUNTO'
      '   , IDGRUPO, DESCCONJUNTO'
      'FROM'
      '   VWBEMXIMOVEL'
      'WHERE'
      '   ( (:PIDIMOVEL IS NULL) OR (IDIMOVEL = :PIDIMOVEL) )'
      '   AND ( (:PIXBGRUPO IS NULL) OR (IXBGRUPO = :PIXBGRUPO) )'
      ' ')
    ValidateWithMask = True
    Left = 97
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIXBGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIXBGRUPO'
        ParamType = ptUnknown
      end>
    object qryLookBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryLookBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.PLACA'
    end
    object qryLookBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.IDBEM'
    end
    object qryLookBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.IDCONJUNTO'
    end
    object qryLookBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.IDGRUPO'
    end
    object qryLookBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = 'BASEDADOS.VWBEMXIMOVEL.DESCCONJUNTO'
    end
  end
  object qryLookGrupoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   GI.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, IM.IMONOME||'#39' - '#39'||I.' +
        'IMONOME AS IMOVEL_EXTENSO, GI.GXIPERCENTRATEIO'
      'FROM'
      '   GRUPORATEIO GR, GRUPOXIMOVEL GI, IMOVEL I, IMOVEL IM'
      'WHERE'
      
        '   ( (:PIDGRUPORATEIO IS NULL) OR (GR.IDGRUPORATEIO = :PIDGRUPOR' +
        'ATEIO) )'
      '   AND (GR.IDGRUPORATEIO = GI.IDGRUPORATEIO)'
      '   AND (GI.IDIMOVEL = I.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      'ORDER BY'
      '   GI.GXIPERCENTRATEIO'
      ' ')
    ValidateWithMask = True
    Left = 97
    Top = 349
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end>
    object qryLookGrupoXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.GRUPOXIMOVEL.IDIMOVEL'
    end
    object qryLookGrupoXImovelGXIPERCENTRATEIO: TFloatField
      FieldName = 'GXIPERCENTRATEIO'
      Origin = 'BASEDADOS.GRUPOXIMOVEL.GXIPERCENTRATEIO'
    end
    object qryLookGrupoXImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
    object qryLookGrupoXImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 60
    end
  end
  object QryVerificaMovimentacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 369
    Top = 184
  end
end
