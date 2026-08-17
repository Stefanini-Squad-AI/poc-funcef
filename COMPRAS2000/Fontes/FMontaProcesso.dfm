inherited FrmMontaProcesso: TFrmMontaProcesso
  Left = 10
  Top = 56
  Caption = 'Montagem do Processo de Compras'
  ClientHeight = 444
  ClientWidth = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 358
    object PgProc: TPageControl
      Left = 5
      Top = 5
      Width = 758
      Height = 348
      ActivePage = TabItens
      Align = alClient
      TabOrder = 0
      OnChange = PgProcChange
      object TabItens: TTabSheet
        Caption = 'Itens Pendentes'
        object plnComp: TPanel
          Left = 0
          Top = 102
          Width = 750
          Height = 218
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'plnComp'
          TabOrder = 0
          object plnOpItem: TPanel
            Left = 715
            Top = 0
            Width = 35
            Height = 218
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object BtnRemove: TSpeedButton
              Left = 4
              Top = 136
              Width = 30
              Height = 41
              Hint = 'Remove os Itens'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
                608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
                66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
                66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
                660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
                6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnRemoveClick
            end
            object BtnAdiciona: TSpeedButton
              Left = 4
              Top = 48
              Width = 30
              Height = 41
              Hint = 'Adiciona os Itens'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888777778888888888F777778FF888888776666677
                88888887788888778F88887666666666088888788888F88878F887E6666F6666
                608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
                66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
                66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
                660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
                6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
                8888888778FFFF77888888888000008888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnAdicionaClick
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 715
            Height = 218
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel7'
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 104
              Width = 715
              Height = 7
              Cursor = crVSplit
              Align = alTop
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 715
              Height = 104
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 0
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 26
                Height = 104
                Align = alLeft
                BevelInner = bvLowered
                Caption = 'Panel5'
                Color = clGray
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                TabOrder = 0
                object fcLabel2: TfcLabel
                  Left = 2
                  Top = 2
                  Width = 22
                  Height = 100
                  Align = alClient
                  Caption = 'Itens Pendentes'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Rotation = 90
                  TextOptions.VAlignment = vaTop
                end
              end
              object grdItem: TwwDBGrid
                Left = 26
                Top = 0
                Width = 689
                Height = 104
                Selected.Strings = (
                  'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'
                  'CODARTIGO'#9'14'#9'Código'
                  'CODMEDIDA'#9'4'#9'Unid.'
                  'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'
                  'DESCRICAO'#9'60'#9'Descrição'
                  'DATAENTREGA'#9'10'#9'Necessidade')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = dsItem
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
                ParentCtl3D = False
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 111
              Width = 715
              Height = 107
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 1
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 26
                Height = 107
                Align = alLeft
                BevelInner = bvLowered
                Caption = 'Panel2'
                Color = clGray
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                TabOrder = 0
                object fcLabel1: TfcLabel
                  Left = 2
                  Top = 2
                  Width = 22
                  Height = 103
                  Align = alClient
                  Caption = 'Itens Atribuidos'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Rotation = 90
                  TextOptions.VAlignment = vaTop
                end
              end
              object GrdItemAtrib: TwwDBGrid
                Left = 26
                Top = 0
                Width = 689
                Height = 107
                Selected.Strings = (
                  'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'#9'F'
                  'CODARTIGO'#9'14'#9'Código'#9'F'
                  'CODMEDIDA'#9'4'#9'Unid.'#9'F'
                  'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'#9'F'
                  'DESCRICAO'#9'60'#9'Descrição'#9'F'
                  'DATAENTREGA'#9'10'#9'Necessidade'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = dsItemAtrib
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
                ParentCtl3D = False
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                IndicatorColor = icBlack
              end
            end
          end
        end
        object plnSel: TPanel
          Left = 0
          Top = 0
          Width = 750
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 69
            Height = 13
            Caption = 'Nº da S.C.I.'
          end
          object Label3: TLabel
            Left = 8
            Top = 48
            Width = 34
            Height = 13
            Caption = 'Artigo'
          end
          object Label2: TLabel
            Left = 168
            Top = 8
            Width = 107
            Height = 13
            Caption = 'Grupo de Produtos'
          end
          object Label4: TLabel
            Left = 384
            Top = 48
            Width = 74
            Height = 13
            Caption = 'Necessidade'
          end
          object Bevel6: TBevel
            Left = 638
            Top = 3
            Width = 110
            Height = 87
            Shape = bsLeftLine
          end
          object BtnSelecinar: TSpeedButton
            Left = 646
            Top = 5
            Width = 98
            Height = 41
            Caption = '&Selecionar'
            Flat = True
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
            Margin = 7
            NumGlyphs = 2
            OnClick = BtnSelecinarClick
          end
          object BtnLimpar: TSpeedButton
            Left = 646
            Top = 47
            Width = 98
            Height = 41
            Caption = '&Limpar'
            Flat = True
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
            Margin = 7
            OnClick = BtnLimparClick
          end
          object dblcSCI: TCMDBLookupCombo
            Left = 8
            Top = 24
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NUMSOLCOMPRA'#9'10'#9'Nº da SCI')
            LookupTable = qrySCICombo
            LookupField = 'NUMSOLCOMPRA'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcArt: TwwDBLookupCombo
            Left = 8
            Top = 64
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'
              'CODARTIGO'#9'14'#9'Código')
            LookupTable = qryArtigo
            LookupField = 'CODARTIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcGrupo: TCMDBLookupCombo
            Left = 168
            Top = 24
            Width = 345
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCGRUPOPROD'#9'30'#9'Descrição')
            LookupTable = qryGrupo
            LookupField = 'CODGRUPOPROD'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edDataNec: TCMDateTimePicker
            Left = 384
            Top = 64
            Width = 129
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
          object RgEmpresa: TRadioGroup
            Left = 520
            Top = 6
            Width = 113
            Height = 80
            Caption = ' Pela Empresa '
            ItemIndex = 0
            Items.Strings = (
              'Login'
              'Todas')
            TabOrder = 4
          end
        end
      end
      object tabAtribForn: TTabSheet
        Caption = 'Atribuição de Fornecedor'
        object plnAtrbForne: TPanel
          Left = 0
          Top = 0
          Width = 750
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnTodas: TSpeedButton
            Left = 0
            Top = 0
            Width = 137
            Height = 32
            Hint = 'Marca todas as autorizações'
            AllowAllUp = True
            Caption = 'Marcar todas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnTodasClick
          end
          object btnInverter: TSpeedButton
            Left = 137
            Top = 0
            Width = 137
            Height = 32
            Hint = 'Desmarca todas as autorizações'
            AllowAllUp = True
            Caption = 'Inverter seleção'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnInverterClick
          end
          object BtnAddForne: TSpeedButton
            Left = 274
            Top = 0
            Width = 137
            Height = 32
            Caption = 'Novo Fornecedor'
            Flat = True
            Glyph.Data = {
              36010000424D3601000000000000760000002800000011000000100000000100
              040000000000C000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880008888880
              008880000000800800888800800880000000000800000000800080000000000F
              00666000F007000000000E000E6E6040004F0000000006E6E6E6E04444470000
              00000E6E6E6E6044444C0000000006E6E6E6E00000C0800000000E6E6E6E60FF
              FF088000000006E6E6E6E0F8FB88800000000E6E6E6E600B0B8B8000000006E6
              E6E6E088BBB8800000000E6E6E6E60BBBBBBB0000000000000000088BBB88000
              000088888888888B8B8B800000008888888888888B8880000000}
            OnClick = BtnAddForneClick
          end
          object BtnCopiaSel: TSpeedButton
            Left = 411
            Top = 0
            Width = 137
            Height = 32
            Caption = 'Copia Seleção'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777777777FFFFFFFFF7777770000000007777777888888888F777777877777
              77077777778F7777778F7777778FFFFFF7077777778F7777778F7777778FCCCC
              F70777FFFF8F7777778F7000008FFFFFF7077888888F7777778F7877778FCCCC
              F70778F7778F7777778F78FFFF8FFFFFF70778F7778F7777FF8F78FCCC8FCCF0
              000778F7778F7778888778FFFF8FFFF7F87778F7778F7778F87778FCCC8FFFF7
              877778F7778FFFF8877778FFFF888888777778F777888888777778FCCCCF7077
              777778F7777778F7777778FFFFFF7077777778F7777778F7777778FFFFFF7077
              777778FFFFFFF8F7777778888888887777777888888888777777}
            NumGlyphs = 2
            OnClick = BtnCopiaSelClick
          end
        end
        object TreeCot: TfcTreeView
          Left = 0
          Top = 33
          Width = 750
          Height = 287
          Align = alClient
          Images = ImageList1
          Indent = 19
          Items.StreamVersion = 1
          Items.Data = {00000000}
          TabOrder = 1
          OnToggleCheckbox = TreeCotToggleCheckbox
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 768
    object Label5: TLabel [0]
      Left = 520
      Top = 16
      Width = 96
      Height = 16
      Caption = 'Processo Nº :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edProc: TDBEdit
      Left = 616
      Top = 16
      Width = 145
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'CODPROCESSO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 598
      DockPos = 598
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 427
      DockPos = 427
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 3
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      CODPROCESSO,'
      '      STATUS,'
      '      IDCOMPRADOR'
      'FROM'
      '      PROCESSO'
      'WHERE'
      '      (CODPROCESSO = :pCODPROCESSO)'
      '')
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = '"CM.PROCESSO".CODPROCESSO'
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = '"CM.PROCESSO".STATUS'
      Size = 1
    end
    object qryIDCOMPRADOR: TFloatField
      FieldName = 'IDCOMPRADOR'
      Origin = '"CM.PROCESSO".IDCOMPRADOR'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSO'
      'set'
      '  CODPROCESSO = :CODPROCESSO,'
      '  STATUS = :STATUS,'
      '  IDCOMPRADOR = :IDCOMPRADOR'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    InsertSQL.Strings = (
      'insert into PROCESSO'
      '  (CODPROCESSO, STATUS, IDCOMPRADOR)'
      'values'
      '  (:CODPROCESSO, :STATUS, :IDCOMPRADOR)')
    DeleteSQL.Strings = (
      'delete from PROCESSO'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    Left = 203
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROCESSO.CODPROCESSO'
      'PROCXART.CODARTIGO'
      
        'SUBSTR(DECODE(PROCXART.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI' +
        '.DESCPRODVARI),1,60)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Codigo do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSO'
      'PROCXART'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'PROCESSO.CODPROCESSO'
      'PROCESSO.STATUS')
    Filtro.Strings = (
      'PROCESSO.STATUS <> '#39'F'#39
      'PROCXART.CODPROCESSO = PROCESSO.CODPROCESSO '
      'SUBSTR(PROCXART.CODARTIGO,1,6) =  PRODUTO.CODPRODUTO'
      'PROCXART.IDPRODVARI = PRODVARI.IDPRODVARI(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '14'
      '60')
    Left = 461
    Top = 6
  end
  inherited ds: TwwDataSource
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 390
    Top = 10
  end
  object qryItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IT.NUMSOLCOMPRA,'
      '      IT.CODARTIGO,'
      '      IT.CODMEDIDA,'
      '      IT.QTDEPEDIDA,'
      
        '      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVAR' +
        'I),1,60) AS DESCRICAO,'
      '      IT.IDITEMSOLI,'
      '      SC.DATAENTREGA,'
      '      IT.CODPROCESSO,'
      '      P.CODMEDCUSTO,'
      '      IT.IDPROCXART,'
      '      IT.IDPRODVARI      '
      'FROM'
      '      SOLICOMP SC,'
      '      ITEMSOLI IT,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (IT.CODPROCESSO IS NULL)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (IT.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (IT.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DESCRICAO, SC.DATAENTREGA'
      ' ')
    UpdateObject = updItem
    ValidateWithMask = True
    Left = 25
    Top = 338
    object qryItemNUMSOLCOMPRA: TFloatField
      DisplayLabel = 'Nº da S.C.I.'
      DisplayWidth = 10
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryItemCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryItemCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryItemQTDEPEDIDA: TFloatField
      DisplayLabel = 'Qtde. Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,####0.0000'
    end
    object qryItemDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemDATAENTREGA: TDateTimeField
      DisplayLabel = 'Necessidade'
      DisplayWidth = 10
      FieldName = 'DATAENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryItemIDITEMSOLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMSOLI'
      Visible = False
    end
    object qryItemCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryItemCODMEDCUSTO: TStringField
      DisplayWidth = 4
      FieldName = 'CODMEDCUSTO'
      Visible = False
      Size = 4
    end
    object qryItemIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryItemIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Visible = False
    end
  end
  object qrySCICombo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SC.NUMSOLCOMPRA'
      'FROM'
      '      SOLICOMP SC,'
      '      ITEMSOLI IT'
      'WHERE'
      '      (IT.CODPROCESSO IS NULL )'
      '  AND (IT.IDCOMPRADOR = :pIDCOMPRADOR)    '
      '  AND (SC.NUMSOLCOMPRA = IT.NUMSOLCOMPRA)'
      'GROUP BY SC.NUMSOLCOMPRA'
      'ORDER BY SC.NUMSOLCOMPRA')
    ValidateWithMask = True
    Left = 17
    Top = 397
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end>
    object FloatField4: TFloatField
      DisplayLabel = 'Nº da SCI'
      DisplayWidth = 10
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SOLICOMP.NUMSOLCOMPRA'
    end
  end
  object dsItem: TwwDataSource
    DataSet = qryItem
    Left = 64
    Top = 339
  end
  object qryArtigo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       A.CODARTIGO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO) AS ' +
        'DESCRICAO'
      'FROM   '
      '       ARTIGO A,'
      '       PRODUTO P'
      'Where  '
      '       ( A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 78
    Top = 393
  end
  object updItem: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  SALDOACOMPRAR = :SALDOACOMPRAR,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  SOLICIACEITA = :SOLICIACEITA,'
      '  IDCOMPRADOR = :IDCOMPRADOR,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  OBSITEMSOLIC = :OBSITEMSOLIC,'
      '  IDPRODVARI = :IDPRODVARI,'
      '  IDCONTRATOPROD = :IDCONTRATOPROD,'
      '  IDITEMSOLI = :IDITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      '  (NUMSOLCOMPRA, CODARTIGO, CODMEDIDA, QTDEPEDIDA, '
      'SALDOACOMPRAR, QTDEPENDENTE, '
      '   SOLICIACEITA, IDCOMPRADOR, CODPROCESSO, TRGDTINCLUSAO, '
      'TRGUSERINCLUSAO, '
      '   OBSITEMSOLIC, IDPRODVARI, IDCONTRATOPROD, IDITEMSOLI)'
      'values'
      '  (:NUMSOLCOMPRA, :CODARTIGO, :CODMEDIDA, :QTDEPEDIDA, '
      ':SALDOACOMPRAR, '
      '   :QTDEPENDENTE, :SOLICIACEITA, :IDCOMPRADOR, :CODPROCESSO, '
      ':TRGDTINCLUSAO, '
      
        '   :TRGUSERINCLUSAO, :OBSITEMSOLIC, :IDPRODVARI, :IDCONTRATOPROD' +
        ', '
      ':IDITEMSOLI)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 103
    Top = 340
  end
  object qryGrupo: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOPROD,'
      '      DESCGRUPOPROD'
      'FROM'
      '     GRUPPROD'
      'WHERE'
      '     (STATUSGRUPO = '#39'A'#39')'
      'ORDER BY CODGRUPOPROD')
    ValidateWithMask = True
    Left = 137
    Top = 391
    object qryGrupoDESCGRUPOPROD: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCGRUPOPROD'
      Origin = 'GRUPPROD.DESCGRUPOPROD'
      Size = 30
    end
    object qryGrupoCODGRUPOPROD: TStringField
      DisplayWidth = 10
      FieldName = 'CODGRUPOPROD'
      Origin = 'GRUPPROD.CODGRUPOPROD'
      Visible = False
      Size = 10
    end
  end
  object qryItemAtrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IT.NUMSOLCOMPRA,'
      '      IT.CODARTIGO,'
      '      IT.CODMEDIDA,'
      '      IT.QTDEPEDIDA,'
      
        '      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVAR' +
        'I),1,60) AS DESCRICAO,'
      '      IT.IDITEMSOLI,'
      '      SC.DATAENTREGA,'
      '      IT.CODPROCESSO,'
      '      P.CODMEDCUSTO,'
      '      IT.IDPROCXART,'
      '      IT.IDPRODVARI'
      'FROM'
      '      SOLICOMP SC,'
      '      ITEMSOLI IT,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (IT.CODPROCESSO = :CODPROCESSO)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (IT.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (IT.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DESCRICAO, SC.DATAENTREGA'
      ' ')
    UpdateObject = updItemAtrib
    ValidateWithMask = True
    Left = 153
    Top = 338
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryItemAtribNUMSOLCOMPRA: TFloatField
      DisplayLabel = 'Nº da S.C.I.'
      DisplayWidth = 10
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryItemAtribCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryItemAtribCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryItemAtribQTDEPEDIDA: TFloatField
      DisplayLabel = 'Qtde. Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,####0.0000'
    end
    object qryItemAtribDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemAtribDATAENTREGA: TDateTimeField
      DisplayLabel = 'Necessidade'
      DisplayWidth = 10
      FieldName = 'DATAENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryItemAtribIDITEMSOLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMSOLI'
      Visible = False
    end
    object qryItemAtribCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryItemAtribCODMEDCUSTO: TStringField
      DisplayWidth = 4
      FieldName = 'CODMEDCUSTO'
      Visible = False
      Size = 4
    end
    object qryItemAtribIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryItemAtribIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Visible = False
    end
  end
  object dsItemAtrib: TwwDataSource
    DataSet = qryItemAtrib
    Left = 280
    Top = 339
  end
  object updItemAtrib: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  CODPROCESSO = :CODPROCESSO,'
      '  IDPROCXART = :IDPROCXART'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      '  (CODPROCESSO, IDPROCXART)'
      'values'
      '  (:CODPROCESSO, :IDPROCXART)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 217
    Top = 340
  end
  object qryProcxArt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PXA.IDPROCXART,'
      '      PXA.CODPROCESSO,'
      '      PXA.CODARTIGO,'
      '      PXA.QTDEPEDIDA,'
      '      PXA.CODMEDIDA,'
      '      PXA.JUSTIFICATIVA,'
      '      PXA.DATANECESSIDADE,'
      '      PXA.STATUS,'
      
        '      DECODE(PXA.IDPRODVARI,NULL,0,PXA.IDPRODVARI) AS IDPRODVARI' +
        ','
      
        '      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO'
      'FROM'
      '      PROCXART PXA,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (PXA.CODPROCESSO = :CODPROCESSO)'
      '  AND (PXA.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI)'
      ' ')
    UpdateObject = updProcxArt
    ValidateWithMask = True
    Left = 293
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryProcxArtDATANECESSIDADE: TDateTimeField
      DisplayLabel = 'Data de Necessidade'
      DisplayWidth = 10
      FieldName = 'DATANECESSIDADE'
      Visible = False
    end
    object qryProcxArtCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryProcxArtDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryProcxArtSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object qryProcxArtQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quatidatde'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
    end
    object qryProcxArtCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryProcxArtIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryProcxArtCODPROCESSO: TFloatField
      DisplayLabel = 'Processo'
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryProcxArtJUSTIFICATIVA: TStringField
      DisplayWidth = 200
      FieldName = 'JUSTIFICATIVA'
      Visible = False
      Size = 200
    end
    object qryProcxArtIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Visible = False
    end
  end
  object updProcxArt: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCXART'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  CODARTIGO = :CODARTIGO,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  JUSTIFICATIVA = :JUSTIFICATIVA,'
      '  DATANECESSIDADE = :DATANECESSIDADE,'
      '  STATUS = :STATUS,'
      '  IDPRODVARI = :IDPRODVARI'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    InsertSQL.Strings = (
      'insert into PROCXART'
      '  (IDPROCXART, CODPROCESSO, CODARTIGO, QTDEPEDIDA, CODMEDIDA, '
      'JUSTIFICATIVA, '
      '   DATANECESSIDADE, STATUS, IDPRODVARI)'
      'values'
      
        '  (:IDPROCXART, :CODPROCESSO, :CODARTIGO, :QTDEPEDIDA, :CODMEDID' +
        'A, '
      ':JUSTIFICATIVA, '
      '   :DATANECESSIDADE, :STATUS, :IDPRODVARI)')
    DeleteSQL.Strings = (
      'delete from PROCXART'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    Left = 293
    Top = 192
  end
  object qryArtxForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       AXF.IDFORCLI,'
      '       AXF.CODARTIGO,'
      '       P.RAZAOSOCIAL'
      'FROM'
      '       PESSOA P,'
      '       ARTXFORN AXF'
      'WHERE'
      '       (AXF.CODARTIGO = :pCODARTIGO)'
      '   AND (AXF.IDFORCLI = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 393
    Top = 340
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qryArtxFornIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'ARTXFORN.IDFORCLI'
    end
    object qryArtxFornCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ARTXFORN.CODARTIGO'
      Size = 14
    end
    object qryArtxFornRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object ImageList1: TImageList
    Left = 705
    Top = 324
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      000000000000FFFF000084840000FFFF00008484000000000000840000000000
      0000000000000000000084000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000FFFF00008484
      0000FFFF000084840000FFFF000084840000FFFF000000000000840000008400
      00008400000084000000840000008484840000000000000000000000000000FF
      FF00C6C6C60000FFFF0000848400C6C6C60000FFFF00C6C6C60000FFFF008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000084840000FFFF
      000084840000FFFF000084840000FFFF00008484000000000000840000008400
      0000840000008400000084000000FF000000000000000000000000000000C6C6
      C60000FFFF00C6C6C6000084840000FFFF00C6C6C60000FFFF00C6C6C6008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000FFFF00008484
      0000FFFF000084840000FFFF000084840000FFFF000000000000000000000000
      00000000000000000000FF0000000000000000000000000000000000000000FF
      FF00C6C6C60000FFFF0000848400C6C6C60000FFFF00C6C6C60000FFFF008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000084840000FFFF
      000084840000FFFF000084840000FFFF00008484000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000FFFF00C6C6C6000084840000FFFF00C6C6C60000FFFF00C6C6C6008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000FFFF00008484
      0000FFFF000084840000FFFF000084840000FFFF00000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000084840000FFFF
      000084840000FFFF000084840000FFFF00008484000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF000084840000FFFF00008484000084840000FFFF000084840000FFFF000084
      8400848484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000FFFF00008484
      0000FFFF000084840000FFFF000084840000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000FFFF000084840000FFFF00008484000084840000FFFF000084840000FF
      FF00008484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000084840000FFFF
      000084840000FFFF000084840000FFFF00008484000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C7E3FFFF0000000083C1FFFF00000000
      0000FFFF000000001008800F0000000000018007000000000000A00300000000
      0000A001000000000000A00100000000003DA00100000000002BBDE100000000
      0007800100000000003FC00100000000003FE00100000000003FFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qryTree: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     PXA.CODARTIGO,'
      
        '     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO,'
      '     P.RAZAOSOCIAL,'
      '     ('#39'S'#39') AS STATUS'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '    PRODUTO PR,'
      '    ARTIGO A,'
      '    PRODVARI PV'
      'WHERE'
      '    (1 = 2)'
      ' ')
    UpdateObject = updTree
    ValidateWithMask = True
    Left = 585
    Top = 308
    object qryTreeIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryTreeIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryTreeCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
    end
    object qryTreeCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryTreeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTreeRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryTreeSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object updTree: TUpdateSQL
    Left = 585
    Top = 294
  end
  object qryForneCot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      
        '     C.IDFORCLI, '#39'                                              ' +
        '              '#39' AS RAZAOSOCIAL'
      'FROM'
      '    COTACOES C '
      'WHERE'
      '      (1 = 2)')
    UpdateObject = updForneCot
    ValidateWithMask = True
    Left = 593
    Top = 204
    object qryForneCotRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryForneCotIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
  end
  object updForneCot: TUpdateSQL
    Left = 593
    Top = 190
  end
  object dsTree: TwwDataSource
    DataSet = qryTree
    Left = 585
    Top = 280
  end
  object qryCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UN.IDFORCLI,'
      '     UN.IDPROCXART,'
      '     UN.CODPROCESSO,'
      '     UN.CODARTIGO,'
      '     UN.DESCRICAO,      '
      '     UN.RAZAOSOCIAL,'
      '     UN.STATUS'
      'FROM'
      '('
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     PXA.CODARTIGO,'
      
        '     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO,'
      '     P.RAZAOSOCIAL,'
      '     ('#39'S'#39') AS STATUS'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '    PRODUTO PR,'
      '    ARTIGO A,'
      '    PRODVARI PV'
      'WHERE'
      '      (C.CODPROCESSO = :CODPROCESSO)'
      '  AND (C.IDPROCXART = PXA.IDPROCXART)'
      '  AND (C.CODPROCESSO = PXA.CODPROCESSO)'
      '  AND (C.IDFORCLI = P.IDPESSOA)'
      '  AND (PXA.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = PR.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      'GROUP BY C.IDFORCLI,'
      '         C.IDPROCXART,'
      '         C.CODPROCESSO,'
      '         PXA.CODARTIGO,'
      
        '         DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI)' +
        ','
      '         P.RAZAOSOCIAL'
      'UNION'
      'SELECT'
      '     AXF.IDFORCLI,'
      '     PXA.IDPROCXART,'
      '     PXA.CODPROCESSO,'
      '     PXA.CODARTIGO,'
      
        '     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO,'
      '     P.RAZAOSOCIAL,'
      '     ('#39'N'#39') AS STATUS'
      'FROM'
      '    PESSOA P,'
      '    ARTXFORN AXF,'
      '    PROCXART PXA,'
      '    PRODUTO PR,'
      '    ARTIGO A,'
      '    PRODVARI PV'
      'WHERE'
      '      (PXA.CODPROCESSO = :CODPROCESSO)'
      
        '  AND ((TO_CHAR(AXF.IDFORCLI) || TO_CHAR(PXA.IDPROCXART)) NOT IN' +
        ' (SELECT (TO_CHAR(IDFORCLI) || TO_CHAR(IDPROCXART)) FROM COTACOE' +
        'S  WHERE (CODPROCESSO = :CODPROCESSO)  GROUP BY IDFORCLI,IDPROCX' +
        'ART ) )'
      '  AND (PXA.CODARTIGO   = AXF.CODARTIGO)'
      '  AND (PXA.CODARTIGO   = A.CODARTIGO)'
      '  AND (A.CODPRODUTO    = PR.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI  = PV.IDPRODVARI(+))'
      '  AND (AXF.IDFORCLI    = P.IDPESSOA)'
      ') UN'
      ' ')
    UpdateObject = updCotacao
    ValidateWithMask = True
    Left = 513
    Top = 196
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
    end
    object qryCotacaoCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryCotacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryCotacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object updCotacao: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  STATUS = :STATUS'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      '  (IDPROCXART, IDFORCLI, CODPROCESSO, STATUS)'
      'values'
      '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :STATUS)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 513
    Top = 182
  end
  object dsForneCot: TwwDataSource
    DataSet = qryForneCot
    Left = 593
    Top = 176
  end
  object dsProcxArt: TwwDataSource
    DataSet = qryProcxArt
    Left = 294
    Top = 178
  end
  object qryItemNovoForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PXA.IDPROCXART,'
      '      PXA.CODPROCESSO,'
      '      PXA.CODARTIGO,'
      '      PXA.QTDEPEDIDA,'
      '      PXA.CODMEDIDA,'
      '      PXA.JUSTIFICATIVA,'
      '      PXA.DATANECESSIDADE,'
      '      '#39'S'#39' AS ATRIBUIDO,'
      '      PXA.IDPRODVARI,'
      
        '      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO'
      'FROM'
      '      PROCXART PXA,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (1 = 2)'
      ' ')
    UpdateObject = updItemNovoForn
    ControlType.Strings = (
      'ATRIBUIDO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 213
    Top = 198
    object qryItemNovoFornATRIBUIDO: TStringField
      DisplayLabel = 'Adicionar'
      DisplayWidth = 1
      FieldName = 'ATRIBUIDO'
      OnChange = qryItemNovoFornATRIBUIDOChange
      Size = 1
    end
    object qryItemNovoFornCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryItemNovoFornDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemNovoFornQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#.###0,000'
    end
    object qryItemNovoFornCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryItemNovoFornIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryItemNovoFornCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryItemNovoFornJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Visible = False
      Size = 200
    end
    object qryItemNovoFornDATANECESSIDADE: TDateTimeField
      FieldName = 'DATANECESSIDADE'
      Visible = False
    end
    object qryItemNovoFornIDPRODVARI: TFloatField
      FieldName = 'IDPRODVARI'
      Visible = False
    end
  end
  object updItemNovoForn: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCXART'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  CODARTIGO = :CODARTIGO,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  JUSTIFICATIVA = :JUSTIFICATIVA,'
      '  DATANECESSIDADE = :DATANECESSIDADE,'
      '  STATUS = :STATUS'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    InsertSQL.Strings = (
      'insert into PROCXART'
      '  (IDPROCXART, CODPROCESSO, CODARTIGO, QTDEPEDIDA, CODMEDIDA, '
      'JUSTIFICATIVA, '
      '   DATANECESSIDADE, STATUS)'
      'values'
      
        '  (:IDPROCXART, :CODPROCESSO, :CODARTIGO, :QTDEPEDIDA, :CODMEDID' +
        'A, '
      ':JUSTIFICATIVA, '
      '   :DATANECESSIDADE, :STATUS)')
    DeleteSQL.Strings = (
      'delete from PROCXART'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    Left = 213
    Top = 184
  end
  object dsItemNovoForn: TwwDataSource
    DataSet = qryItemNovoForn
    Left = 214
    Top = 170
  end
  object qryRestricao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 481
    Top = 329
  end
  object qryAtuCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROCXART,'
      '   IDFORCLI,'
      '   CODPROCESSO,'
      '   PROPOSTA,'
      '   QTDEFORNECIDA,'
      '   CODMEDIDA,'
      '   STATUS'
      'FROM'
      '    COTACOES'
      'WHERE'
      '   (CODPROCESSO = :CODPROCESSO)'
      '')
    UpdateObject = updAtuCotacao
    ValidateWithMask = True
    Left = 425
    Top = 196
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryAtuCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
    end
    object qryAtuCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
    end
    object qryAtuCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
    end
    object qryAtuCotacaoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryAtuCotacaoQTDEFORNECIDA: TFloatField
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
    end
    object qryAtuCotacaoCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'COTACOES.CODMEDIDA'
      Size = 4
    end
    object qryAtuCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'COTACOES.STATUS'
      Size = 1
    end
  end
  object updAtuCotacao: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  QTDEFORNECIDA = :QTDEFORNECIDA,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  STATUS = :STATUS'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      
        '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, QTDEFORNECIDA, C' +
        'ODMEDIDA, '
      '   STATUS)'
      'values'
      
        '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :QTDEFORNECI' +
        'DA, :CODMEDIDA, '
      '   :STATUS)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 425
    Top = 182
  end
  object updAtuArtxForn: TUpdateSQL
    ModifySQL.Strings = (
      'update ARTXFORN'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  CODARTIGO = :CODARTIGO'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODARTIGO = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into ARTXFORN'
      '  (IDFORCLI, CODARTIGO)'
      'values'
      '  (:IDFORCLI, :CODARTIGO)')
    DeleteSQL.Strings = (
      'delete from ARTXFORN'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODARTIGO = :OLD_CODARTIGO')
    Left = 337
    Top = 275
  end
  object qryAtuArtxForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDFORCLI,'
      '    CODARTIGO'
      'FROM'
      '    ARTXFORN '
      'WHERE'
      '    (1 = 2)')
    UpdateObject = updAtuArtxForn
    ValidateWithMask = True
    Left = 337
    Top = 260
    object qryAtuArtxFornIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'ARTXFORN.IDFORCLI'
    end
    object qryAtuArtxFornCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ARTXFORN.CODARTIGO'
      Size = 14
    end
  end
  object qryVerifArtxForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       AXF.IDFORCLI,'
      '       AXF.CODARTIGO'
      'FROM'
      '       ARTXFORN AXF'
      'WHERE'
      '       (AXF.CODARTIGO = :pCODARTIGO)'
      '   AND (AXF.IDFORCLI  = :pIDFORCLI)'
      '')
    ValidateWithMask = True
    Left = 433
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end>
    object qryVerifArtxFornIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'ARTXFORN.IDFORCLI'
    end
    object qryVerifArtxFornCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ARTXFORN.CODARTIGO'
      Size = 14
    end
  end
  object qryPrazoEnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDPROCXART,'
      '    IDFORCLI,'
      '    CODPROCESSO,'
      '    PROPOSTA,'
      ' IDPRAZOENT'
      'FROM'
      '    PRAZOENTREGA'
      'WHERE'
      '   (CODPROCESSO = :CODPROCESSO)'
      ''
      '')
    UpdateObject = updPrazoEnt
    ValidateWithMask = True
    Left = 121
    Top = 196
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryPrazoEntIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOENTREGA.IDPROCXART'
    end
    object qryPrazoEntIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOENTREGA.IDFORCLI'
    end
    object qryPrazoEntCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOENTREGA.CODPROCESSO'
    end
    object qryPrazoEntPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOENTREGA.PROPOSTA'
    end
    object qryPrazoEntIDPRAZOENT: TFloatField
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
    end
  end
  object updPrazoEnt: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOENTREGA'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  IDPRAZOENT = :IDPRAZOENT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOENT = :OLD_IDPRAZOENT')
    InsertSQL.Strings = (
      'insert into PRAZOENTREGA'
      '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, IDPRAZOENT)'
      'values'
      '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :IDPRAZOENT)')
    DeleteSQL.Strings = (
      'delete from PRAZOENTREGA'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOENT = :OLD_IDPRAZOENT')
    Left = 121
    Top = 182
  end
  object updPrazoPgto: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOPGTO'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  IDPRAZOPGTO = :IDPRAZOPGTO'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOPGTO = :OLD_IDPRAZOPGTO')
    InsertSQL.Strings = (
      'insert into PRAZOPGTO'
      '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, IDPRAZOPGTO)'
      'values'
      
        '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :IDPRAZOPGTO' +
        ')')
    DeleteSQL.Strings = (
      'delete from PRAZOPGTO'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOPGTO = :OLD_IDPRAZOPGTO')
    Left = 49
    Top = 203
  end
  object qryPrazoPgto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDPROCXART,'
      '    IDFORCLI,'
      '    CODPROCESSO,'
      '    PROPOSTA,'
      '    IDPRAZOPGTO'
      'FROM'
      '    PRAZOPGTO'
      'WHERE'
      '   (CODPROCESSO = :CODPROCESSO)'
      '')
    UpdateObject = updPrazoPgto
    ValidateWithMask = True
    Left = 49
    Top = 188
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryPrazoPgtoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
    end
    object qryPrazoPgtoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
    end
    object qryPrazoPgtoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
    end
    object qryPrazoPgtoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
    end
    object qryPrazoPgtoIDPRAZOPGTO: TFloatField
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
    end
  end
  object qryAgregItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDPROCXART,'
      '    IDFORCLI,'
      '    CODPROCESSO,'
      '    PROPOSTA,'
      '    CODTIPOCUSTAGREG'
      'FROM'
      '    VALORAGREGCOT'
      'WHERE'
      '   (CODPROCESSO = :CODPROCESSO)'
      '')
    UpdateObject = updAgregItem
    ValidateWithMask = True
    Left = 201
    Top = 260
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryAgregItemIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'VALORAGREGCOT.IDPROCXART'
    end
    object qryAgregItemIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VALORAGREGCOT.IDFORCLI'
    end
    object qryAgregItemCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'VALORAGREGCOT.CODPROCESSO'
    end
    object qryAgregItemPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'VALORAGREGCOT.PROPOSTA'
    end
    object qryAgregItemCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'VALORAGREGCOT.CODTIPOCUSTAGREG'
    end
  end
  object updAgregItem: TUpdateSQL
    ModifySQL.Strings = (
      'update VALORAGREGCOT'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    InsertSQL.Strings = (
      'insert into VALORAGREGCOT'
      
        '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, CODTIPOCUSTAGREG' +
        ')'
      'values'
      '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, '
      ':CODTIPOCUSTAGREG)')
    DeleteSQL.Strings = (
      'delete from VALORAGREGCOT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    Left = 201
    Top = 246
  end
end
