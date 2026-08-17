inherited FrmFiltraTabela: TFrmFiltraTabela
  Left = 84
  Top = 83
  Caption = 'Filtrar Tabela '
  ClientHeight = 456
  ClientWidth = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 651
    Height = 417
    object Paginas: TPageControl
      Left = 5
      Top = 5
      Width = 641
      Height = 407
      ActivePage = Pg1
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object Pg1: TTabSheet
        Caption = 'Filtrar Tabelas'
        object Label1: TLabel
          Left = 2
          Top = 6
          Width = 206
          Height = 16
          Caption = 'Indique a Tabela ser Filtrada '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 2
          Top = 52
          Width = 138
          Height = 16
          Caption = 'Campos da Tabela '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 313
          Top = 184
          Width = 76
          Height = 16
          Caption = 'Resultado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnExistentes: TSpeedButton
          Left = 96
          Top = 349
          Width = 118
          Height = 29
          Hint = 'Busca Filtros criados pelo usuário'
          Caption = 'Filtros Criados'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333999933
            3333333333333333333333333300003333333333330F803333333333330F8033
            33333333330F803333333333308F87033333333308F88870333333308F888887
            03333308F88888887033308F8888888887033000000000000003333333333333
            3333339999999999993333333333333333333399999999999933}
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = BtnExistentesClick
        end
        object LstResult: TListBox
          Left = 311
          Top = 200
          Width = 321
          Height = 137
          Hint = 'Click para Selecionar'
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = LstResultClick
        end
        object GroupBox1: TGroupBox
          Left = 311
          Top = 0
          Width = 321
          Height = 185
          Caption = ' Dados do Filtro '
          TabOrder = 3
          object BtnExcluir: TSpeedButton
            Left = 288
            Top = 99
            Width = 25
            Height = 25
            Hint = 'Exclui Seleção'
            Enabled = False
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333333333333300333333333333
              330033333333333333003300000000003300330FFFFFFFF03300330000000000
              3300333333333333330033333333333333003333333333333300333333333333
              33003333333333333300}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnExcluirClick
          end
          object BtnIncluir: TSpeedButton
            Left = 256
            Top = 99
            Width = 25
            Height = 25
            Hint = 'Adiciona sem operador'
            Enabled = False
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333300033333300333330F03333
              3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
              3300333330F033333300333330F0333333003333300033333300333333333333
              33003333333333333300}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnIncluirClick
          end
          object LblTexto: TLabel
            Left = 8
            Top = 84
            Width = 29
            Height = 13
            Caption = 'Filtro'
          end
          object LblSinal: TLabel
            Left = 280
            Top = 72
            Width = 29
            Height = 13
            Caption = 'Sinal'
            Visible = False
          end
          object BtInsOrdem: TSpeedButton
            Left = 256
            Top = 155
            Width = 25
            Height = 25
            Hint = 'Adiciona sem operador'
            Enabled = False
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333300033333300333330F03333
              3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
              3300333330F033333300333330F0333333003333300033333300333333333333
              33003333333333333300}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtInsOrdemClick
          end
          object BtExcOrdem: TSpeedButton
            Left = 288
            Top = 155
            Width = 25
            Height = 25
            Hint = 'Exclui Seleção'
            Enabled = False
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333333333333300333333333333
              330033333333333333003300000000003300330FFFFFFFF03300330000000000
              3300333333333333330033333333333333003333333333333300333333333333
              33003333333333333300}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnExcluirClick
          end
          object RgMF: TRadioGroup
            Left = 72
            Top = 8
            Width = 151
            Height = 33
            Caption = 'RgMF'
            Columns = 2
            Items.Strings = (
              'Fem.'
              'Masc.')
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Visible = False
          end
          object EData: TCMDateTimePicker
            Left = 224
            Top = 35
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
            TabOrder = 5
            Visible = False
          end
          object EConteudo: TEdit
            Left = 8
            Top = 99
            Width = 233
            Height = 21
            MaxLength = 40
            TabOrder = 4
            Text = 'ECONTEUDO'
            Visible = False
            OnKeyPress = EConteudoKeyPress
          end
          object RgEstCiv: TRadioGroup
            Left = 160
            Top = -5
            Width = 233
            Height = 42
            Caption = 'RgEstCiv'
            Columns = 2
            Items.Strings = (
              'Solteiro'
              'Casado'
              'Divorciado'
              'Viúvo')
            TabOrder = 3
            Visible = False
          end
          object RgFiltros: TRadioGroup
            Left = 8
            Top = 13
            Width = 241
            Height = 36
            Columns = 6
            Items.Strings = (
              '= '
              '<> '
              '< '
              '> '
              '<= '
              '>= ')
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnClick = RgFiltrosClick
          end
          object RgVF: TRadioGroup
            Left = 240
            Top = 10
            Width = 184
            Height = 33
            Caption = 'RgVF'
            Columns = 2
            Items.Strings = (
              'Verdadeiro'
              'Falso')
            TabOrder = 1
            Visible = False
          end
          object GrupoOperadores: TGroupBox
            Left = 8
            Top = 48
            Width = 241
            Height = 33
            Caption = 'Operadores'
            TabOrder = 6
            object op1: TCheckBox
              Left = 8
              Top = 12
              Width = 33
              Height = 17
              Caption = '('
              TabOrder = 0
              OnClick = op1Click
            end
            object op2: TCheckBox
              Left = 48
              Top = 12
              Width = 33
              Height = 17
              Caption = ')'
              TabOrder = 1
              OnClick = op2Click
            end
            object op3: TCheckBox
              Left = 88
              Top = 12
              Width = 33
              Height = 17
              Caption = 'E'
              TabOrder = 2
              OnClick = op3Click
            end
            object op4: TCheckBox
              Left = 128
              Top = 12
              Width = 41
              Height = 17
              Caption = 'OU'
              TabOrder = 3
              OnClick = op4Click
            end
            object OpColoca: TButton
              Left = 176
              Top = 10
              Width = 25
              Height = 20
              Hint = 'Coloca Operador selecionado'
              Caption = '+'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = OpColocaClick
            end
            object OpTira: TButton
              Left = 208
              Top = 10
              Width = 25
              Height = 20
              Hint = 'Tira operador selecionado'
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = OpTiraClick
            end
          end
          object RgOrdem: TRadioGroup
            Left = 8
            Top = 128
            Width = 241
            Height = 29
            Columns = 4
            Items.Strings = (
              'Ordem'
              'Data'
              'Asc'
              'Desc')
            TabOrder = 7
            OnClick = RgOrdemClick
          end
          object EOrdem: TEdit
            Left = 8
            Top = 160
            Width = 241
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            Visible = False
          end
        end
        object LkcTabelas: TwwDBLookupCombo
          Left = -1
          Top = 23
          Width = 309
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAOFILTRO'#9'50'#9'Descrição'
            'IDTABELA'#9'10'#9'Código Tabela'
            'IDFILTRO'#9'10'#9'Código Filtro')
          LookupTable = QrySelecionaTabela
          LookupField = 'IDTABELA'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTabelasChange
        end
        object LstCampos: TListBox
          Left = -1
          Top = 69
          Width = 309
          Height = 244
          Hint = 'Click para Selecionar Campo'
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = LstCamposClick
        end
        object LstSql: TListBox
          Left = 311
          Top = 336
          Width = 321
          Height = 41
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
        object LstCamposBd: TListBox
          Left = -1
          Top = 272
          Width = 309
          Height = 37
          ItemHeight = 13
          TabOrder = 6
          Visible = False
        end
        object BtnFiltrar: TBitBtn
          Left = 9
          Top = 349
          Width = 88
          Height = 29
          Hint = 'Executa o filtro criado'
          Caption = 'Filtrar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = BtnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
        end
        object LstIdCamposBd: TListBox
          Left = -1
          Top = 232
          Width = 309
          Height = 37
          ItemHeight = 13
          TabOrder = 7
          Visible = False
        end
        object BitBtn1: TBitBtn
          Left = 8
          Top = 320
          Width = 89
          Height = 29
          Hint = 'Cria relatórios a partir de filtros existentes'
          Caption = 'Relatórios'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = BitBtn1Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
            00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
            00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
            F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
            F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
            F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
            FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
            0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
            0033333337FFFFFF773333333000000003333333377777777333}
          NumGlyphs = 2
        end
        object listaselecionados: TListBox
          Left = 8
          Top = 144
          Width = 289
          Height = 121
          ItemHeight = 13
          TabOrder = 9
          Visible = False
          OnClick = listaselecionadosClick
        end
        object btnselecao: TBitBtn
          Left = 97
          Top = 320
          Width = 117
          Height = 28
          Hint = 'Filtros de tabelas de descrição'
          Caption = 'Filtros Seletivos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Visible = False
          OnClick = btnselecaoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
            33333333330F803333333333330F803333333333330F803333333333308F8703
            3333333308F88870333333308F88888703333308F88888887033308F88888888
            870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
            FF03333337FFFFFF77333333337FFF7733333333333777333333}
        end
        object Listatipos: TListBox
          Left = 4
          Top = 136
          Width = 294
          Height = 145
          ItemHeight = 13
          TabOrder = 11
          Visible = False
          OnClick = ListatiposClick
        end
        object ListaCodSelecionados: TListBox
          Left = 232
          Top = 336
          Width = 121
          Height = 33
          ItemHeight = 13
          TabOrder = 12
          Visible = False
        end
        object LstRelacao: TListBox
          Left = 504
          Top = 208
          Width = 105
          Height = 41
          ItemHeight = 13
          TabOrder = 13
          Visible = False
        end
      end
      object Pg2: TTabSheet
        Caption = 'Resultado do Filtro'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 633
          Height = 379
          Align = alClient
          DataSource = DsSQL
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 469
      DockPos = 469
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 301
      DockPos = 301
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 169
    Top = 239
    Width = 329
    Height = 57
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object Label7: TLabel
      Left = 20
      Top = 8
      Width = 165
      Height = 13
      Caption = 'Aguarde, Processando ........'
    end
    object PrgBar1: TProgressBar
      Left = 15
      Top = 24
      Width = 295
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 203
    Top = 307
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsSelecionaTabela: TwwDataSource
    Left = 206
    Top = 151
  end
  object QrySelecionaTabela: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDTABELA,IDFILTRO,DESCRICAOFILTRO,MONTASQL FROM'
      'CM.TABFILTROSQL'
      'ORDER BY IDTABELA,IDFILTRO'
      '')
    ValidateWithMask = True
    Left = 46
    Top = 151
    object QrySelecionaTabelaDESCRICAOFILTRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAOFILTRO'
      Origin = 'TABFILTROSQL.DESCRICAOFILTRO'
      Size = 60
    end
    object QrySelecionaTabelaIDTABELA: TFloatField
      DisplayLabel = 'Código Tabela'
      DisplayWidth = 10
      FieldName = 'IDTABELA'
      Origin = 'TABFILTROSQL.IDTABELA'
    end
    object QrySelecionaTabelaIDFILTRO: TFloatField
      DisplayLabel = 'Código Filtro'
      DisplayWidth = 10
      FieldName = 'IDFILTRO'
      Origin = 'TABFILTROSQL.IDFILTRO'
    end
    object QrySelecionaTabelaMONTASQL: TMemoField
      DisplayWidth = 10
      FieldName = 'MONTASQL'
      Origin = 'TABFILTROSQL.MONTASQL'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object DsMostraCampos: TwwDataSource
    DataSet = QryMostraCampos
    Left = 45
    Top = 101
  end
  object QryMostraCampos: TwwQuery
    DatabaseName = 'basedados'
    DataSource = DsSelecionaTabela
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 141
    Top = 101
    object QryMostraCamposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TBCAMPOPART.DESCRICAO'
      Size = 60
    end
    object QryMostraCamposIDCAMPO: TStringField
      FieldName = 'IDCAMPO'
      Origin = 'TBCAMPOPART.IDCAMPO'
      Size = 12
    end
    object QryMostraCamposTIPO: TFloatField
      FieldName = 'TIPO'
      Origin = 'TBCAMPOPART.TIPO'
    end
    object QryMostraCamposRELACAO: TStringField
      FieldName = 'RELACAO'
      Origin = 'TBCAMPOPART.RELACAO'
      Size = 6
    end
    object QryMostraCamposIDTABELA: TFloatField
      FieldName = 'IDTABELA'
      Origin = 'TBCAMPOPART.IDTABELA'
    end
  end
  object DsSQL: TwwDataSource
    DataSet = QrySQL
    Left = 563
    Top = 320
  end
  object QrySQL: TwwQuery
    DatabaseName = 'basedados'
    FilterOptions = [foCaseInsensitive]
    ValidateWithMask = True
    Left = 609
    Top = 320
  end
  object DsBuscaCampo: TwwDataSource
    DataSet = QryBuscaCampo
    Left = 350
    Top = 320
  end
  object QryBuscaCampo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DESCRICAO,IDCAMPO,TIPO,RELACAO'
      'FROM CM.TBCAMPOPART'
      'WHERE IDTABELA = :IDTABELA AND'
      '              IDCAMPO  = :IDCAMPO')
    ValidateWithMask = True
    Left = 444
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCAMPO'
        ParamType = ptUnknown
      end>
    object QryBuscaCampoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TBCAMPOPART.DESCRICAO'
      Size = 60
    end
    object QryBuscaCampoIDCAMPO: TStringField
      FieldName = 'IDCAMPO'
      Origin = 'TBCAMPOPART.IDCAMPO'
      Size = 12
    end
    object QryBuscaCampoTIPO: TFloatField
      FieldName = 'TIPO'
      Origin = 'TBCAMPOPART.TIPO'
    end
    object QryBuscaCampoRELACAO: TStringField
      FieldName = 'RELACAO'
      Origin = 'TBCAMPOPART.RELACAO'
      Size = 6
    end
  end
  object QryFiltros: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CM.FILTROSATUARIAIS')
    ValidateWithMask = True
    Left = 120
    Top = 301
  end
  object SelDlg1: TcmSelectDlg
    SearchControls = False
    Caption = 'Filtros Criados'
    DataSet = QryExistentes
    FieldNames.Strings = (
      'LINHA'
      'IDFILTRO')
    DisplayLabels.Strings = (
      'Descrição do Filtro '
      'Código')
    AlwaysShow = False
    HelpContext = 0
    Left = 284
    Top = 107
  end
  object QryExistentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 217
    Top = 107
  end
  object wwDataSource1: TwwDataSource
    DataSet = QryExistentes
    Left = 271
    Top = 171
  end
  object DsAux: TwwDataSource
    DataSet = QryAux
    Left = 25
    Top = 308
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 73
    Top = 300
  end
  object tabfiltro: TTable
    DatabaseName = 'basedados'
    TableName = 'CM.TABFILTROSQL'
    Left = 41
    Top = 197
  end
  object QryTabFiltro: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT * FROM TBVALPART WHERE IDTABELA = :PARAMS0')
    ValidateWithMask = True
    Left = 89
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PARAMS0'
        ParamType = ptUnknown
      end>
  end
end
