inherited frmCadObraLancReceita: TfrmCadObraLancReceita
  Left = 231
  Top = 91
  HelpContext = 540066
  Caption = 'Lançamentos de Receitas em Obras'
  ClientHeight = 448
  ClientWidth = 713
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 713
    Height = 415
    inherited pgc: TPageControl [0]
      Top = 82
      Width = 713
      Height = 333
      inherited tbs: TTabSheet
        inherited pnlGrd: TPanel [0]
          Top = 31
          Width = 705
          Height = 292
          inherited DBgrd: TwwDBGrid
            Left = 0
            Top = 0
            Width = 705
            Height = 292
            Selected.Strings = (
              'DATALANCAMENTO'#9'10'#9'Data'
              'NUMNOTA'#9'10'#9'Documento'
              'NOME'#9'39'#9'Fornecedor'
              'CLASSE'#9'7'#9'Classe'
              'VALOFI'#9'14'#9'Valor'
              'DESC_GRUPO'#9'60'#9'Grupo')
            Align = alClient
            OnDblClick = nil
          end
        end
        inherited pnlControles: TPanel
          Width = 705
          Height = 292
          Align = alClient
          object pagControle: TPageControl
            Left = 0
            Top = 0
            Width = 705
            Height = 292
            ActivePage = tsLanca
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object tsLanca: TTabSheet
              Caption = 'Lançamento'
              object Label6: TLabel
                Left = 568
                Top = -1
                Width = 83
                Height = 13
                Caption = 'Nº Documento'
              end
              object Label22: TLabel
                Left = 10
                Top = 38
                Width = 92
                Height = 13
                Caption = 'Tipo de Receita'
              end
              object Label4: TLabel
                Left = 288
                Top = 38
                Width = 83
                Height = 13
                Caption = 'Etapa da Obra'
              end
              object Label8: TLabel
                Left = 10
                Top = 170
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object Label26: TLabel
                Left = 10
                Top = 208
                Width = 111
                Height = 13
                Caption = 'Forma de Cobrança'
              end
              object Label14: TLabel
                Left = 352
                Top = 170
                Width = 79
                Height = 13
                Caption = 'Observações '
              end
              object Label7: TLabel
                Left = 10
                Top = 130
                Width = 85
                Height = 13
                Caption = 'Grupo Contábil'
              end
              inline molCliente1: TmolCliente
                Left = 2
                Top = -2
                Width = 559
                Height = 39
                inherited btnBuscaCli: TBitBtn
                  Left = 488
                end
                inherited btnLimpaCli: TBitBtn
                  Left = 512
                end
                inherited edtNomeFantasia: TEdit
                  Width = 225
                end
                inherited edtRazaoSocial: TEdit
                  Left = 232
                  Width = 257
                end
              end
              object edtNumDocumento: TEdit
                Left = 568
                Top = 15
                Width = 109
                Height = 21
                TabStop = False
                TabOrder = 1
              end
              object DBcboTipoRecDes: TwwDBLookupCombo
                Left = 10
                Top = 52
                Width = 263
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
                LookupTable = dtmLookImobiliario.qryLookTipoRecDes
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object cmbObraEtapa: TwwDBLookupCombo
                Left = 288
                Top = 52
                Width = 249
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCOBRATIPOETAPA'#9'50'#9'Etapa da Obra'#9'F')
                LookupTable = qryObraEtapa
                LookupField = 'IDOBRATIPOETAPA'
                DropDownWidth = 249
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object GroupBox2: TGroupBox
                Left = 10
                Top = 73
                Width = 669
                Height = 53
                TabOrder = 4
                object Label5: TLabel
                  Left = 384
                  Top = 10
                  Width = 101
                  Height = 13
                  Caption = 'Data Lançamento'
                end
                object Label9: TLabel
                  Left = 232
                  Top = 10
                  Width = 98
                  Height = 13
                  Caption = 'Data Vencimento'
                end
                object Label15: TLabel
                  Left = 16
                  Top = 10
                  Width = 135
                  Height = 13
                  Caption = 'Competência (mês/ano)'
                end
                object Label12: TLabel
                  Left = 544
                  Top = 10
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object edtDataVenc: TCMDateTimePicker
                  Left = 232
                  Top = 25
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
                  Left = 144
                  Top = 25
                  Width = 65
                  Height = 21
                  Increment = 1
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
                object edtVlrTotal: TRealEdit
                  Left = 544
                  Top = 25
                  Width = 113
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
                object cboMes: TComboBox
                  Left = 16
                  Top = 25
                  Width = 121
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
                object edtDataLanc: TCMDateTimePicker
                  Left = 384
                  Top = 25
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
                  TabOrder = 3
                end
              end
              object DBcboCentroCusto: TwwDBLookupCombo
                Left = 10
                Top = 184
                Width = 321
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
                UseTFields = False
                AllowClearKey = False
              end
              object DBcboPortadorForma: TwwDBLookupCombo
                Left = 10
                Top = 222
                Width = 321
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
                LookupTable = dtmLookImobiliario.qryLookPortadorForma
                LookupField = 'CODPORTFORMA'
                Style = csDropDownList
                DropDownWidth = 113
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                OnChange = DBcboPortadorFormaChange
                OnCloseUp = DBcboPortadorFormaCloseUp
              end
              object chkBoleto: TCheckBox
                Left = 10
                Top = 245
                Width = 201
                Height = 17
                Caption = 'Gerar boleto de cobrança'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
              end
              object memObs: TMemo
                Left = 352
                Top = 184
                Width = 325
                Height = 61
                MaxLength = 1000
                TabOrder = 10
              end
              object dbCboGrupoContabil: TwwDBLookupCombo
                Left = 10
                Top = 145
                Width = 321
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Grupo'#9'F'
                  'CLASSE'#9'15'#9'Classe'#9'F')
                LookupTable = qryGrupoContabil
                LookupField = 'IDGRUPO'
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              inline molSubConta1: TmolSubConta
                Left = 345
                Top = 129
                Width = 341
                TabOrder = 6
                inherited edtSubConta: TEdit
                  Width = 276
                end
                inherited btnBuscaSubConta: TBitBtn
                  Left = 283
                end
                inherited btnLimpaSubConta: TBitBtn
                  Left = 307
                  Width = 25
                end
              end
            end
            object tsBoleto: TTabSheet
              Caption = 'Boleto'
              ImageIndex = 1
              object GroupBox1: TGroupBox
                Left = 22
                Top = 6
                Width = 643
                Height = 227
                Caption = ' Mensagem do Boleto '
                TabOrder = 0
                object Label10: TLabel
                  Left = 21
                  Top = 29
                  Width = 47
                  Height = 13
                  Caption = 'Linha 1:'
                end
                object Label3: TLabel
                  Left = 21
                  Top = 50
                  Width = 47
                  Height = 13
                  Caption = 'Linha 2:'
                end
                object Label13: TLabel
                  Left = 21
                  Top = 71
                  Width = 47
                  Height = 13
                  Caption = 'Linha 3:'
                end
                object Label16: TLabel
                  Left = 21
                  Top = 92
                  Width = 47
                  Height = 13
                  Caption = 'Linha 4:'
                end
                object Label17: TLabel
                  Left = 21
                  Top = 113
                  Width = 47
                  Height = 13
                  Caption = 'Linha 5:'
                end
                object Label18: TLabel
                  Left = 21
                  Top = 134
                  Width = 47
                  Height = 13
                  Caption = 'Linha 6:'
                end
                object Label19: TLabel
                  Left = 21
                  Top = 155
                  Width = 47
                  Height = 13
                  Caption = 'Linha 7:'
                end
                object Label20: TLabel
                  Left = 21
                  Top = 176
                  Width = 47
                  Height = 13
                  Caption = 'Linha 8:'
                end
                object Label21: TLabel
                  Left = 21
                  Top = 197
                  Width = 47
                  Height = 13
                  Caption = 'Linha 9:'
                end
                object edtLinha1: TEdit
                  Left = 77
                  Top = 25
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 0
                end
                object edtLinha2: TEdit
                  Left = 77
                  Top = 46
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 1
                end
                object edtLinha3: TEdit
                  Left = 77
                  Top = 67
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 2
                end
                object edtLinha4: TEdit
                  Left = 77
                  Top = 88
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 3
                end
                object edtLinha5: TEdit
                  Left = 77
                  Top = 109
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 4
                end
                object edtLinha6: TEdit
                  Left = 77
                  Top = 130
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 5
                end
                object edtLinha7: TEdit
                  Left = 77
                  Top = 151
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 6
                end
                object edtLinha8: TEdit
                  Left = 77
                  Top = 172
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 7
                end
                object edtLinha9: TEdit
                  Left = 77
                  Top = 193
                  Width = 449
                  Height = 21
                  MaxLength = 69
                  TabOrder = 8
                end
                object btnLimpaMsg: TfcShapeBtn
                  Left = 549
                  Top = 186
                  Width = 81
                  Height = 25
                  Caption = 'Limpar'
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
                    88888888888FF8888888888888008888888888888F77F8888888888800F08888
                    8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
                    88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
                    888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
                    0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
                    03088878F88878F878788887F8888090B03088878F888787878788887888880B
                    0B038888788888787878888888888880B0B38888888888878788888888888888
                    0BBB88888888888878F888888888888880BB8888888888888788}
                  NumGlyphs = 2
                  Options = [boFocusable, boFocusRect]
                  Offsets.GlyphY = 1
                  Offsets.TextDownX = 2
                  Offsets.TextDownY = 2
                  ParentClipping = True
                  ParentFont = False
                  RoundRectBias = 25
                  ShadeStyle = fbsHighlight
                  Spacing = 8
                  TabOrder = 9
                  TabStop = True
                  TextOptions.Alignment = taCenter
                  TextOptions.ExtrudeEffects.Depth = 4
                  TextOptions.ExtrudeEffects.Orientation = fcTopRight
                  TextOptions.VAlignment = vaVCenter
                  OnClick = btnLimpaMsgClick
                end
              end
            end
          end
        end
        inherited Dock973: TDock97 [2]
          Width = 705
          object lblEncerrado: TfcLabel [0]
            Left = 462
            Top = 5
            Width = 207
            Height = 20
            Caption = 'Encerrada em 99/99/9999'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
            Transparent = True
          end
          inherited tb97BotoesDetalhe: TToolbar97
            inherited sbtnAlterar: TSpeedButton
              Visible = False
            end
          end
        end
      end
    end
    inherited Panel1: TPanel [1]
      Width = 713
      Height = 82
      object Label1: TLabel
        Left = 552
        Top = 1
        Width = 83
        Height = 13
        Caption = 'Data de Início'
      end
      object Label2: TLabel
        Left = 15
        Top = 38
        Width = 107
        Height = 13
        Caption = 'Descrição da Obra'
      end
      inline molImovelObra1: TmolImovelObra
        Left = 6
        Top = 2
        Width = 515
        Height = 35
        inherited Label5: TLabel
          Top = -1
        end
        inherited edtImovel: TEdit
          Top = 13
          Width = 441
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 448
          Top = 13
          OnClick = molImovelObra1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 472
          Top = 13
          OnClick = molImovelObra1btnLimpaImovelClick
        end
      end
      object DtaInicioObra: TCMDateTimePicker
        Left = 552
        Top = 15
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTAINICIOOBRA'
        DataSource = dsObra
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
        ReadOnly = True
        ShowButton = False
        TabOrder = 1
      end
      object dbmemObra: TDBMemo
        Left = 16
        Top = 52
        Width = 657
        Height = 30
        DataField = 'DESCCAFOBRA'
        DataSource = dsObra
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 713
    inherited tb97Fundo: TToolbar97
      Left = 495
      DockPos = 495
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 318
      DockPos = 318
    end
  end
  inherited ds: TwwDataSource
    Left = 600
    Top = 26
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 544
    Top = 72
  end
  inherited upd: TUpdateSQL
    Left = 600
    Top = 40
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT LO.IDCAFOBRA,'
      '       LO.DTALANCAMENTO,'
      '       LI.DATALANCAMENTO,'
      '       LO.DTANOTA,'
      '       LO.NUMNOTA,'
      '       ABS(LO.VALOFI) AS VALOFI,'
      '       LO.IDLANCIMOVEL,'
      '       LO.IDOBRALANC,'
      '       LO.FLGDESMEMBOBRA,'
      
        '       DECODE(LO.DESCLANCOBRA, NULL, P.NOME, LO.DESCLANCOBRA) AS' +
        ' NOME,'
      '       G.CLASSE,'
      '       G.NOME AS DESC_GRUPO,'
      '       LI.IDDOCUMENTO,'
      '       LI.CODDOCUMENTO,'
      '       LI.PLNCODIGO,'
      '       LI.FLGINTEGRADO'
      ''
      'FROM   CAFOBRALANC LO,'
      '       LANCAMENTOSIMOVEL LI,'
      '       PESSOA P,'
      '       GRUPO G'
      ''
      'WHERE  (LO.IDPESSOA = :PIDPESSOA)'
      '  AND  ((:PIDCAFOBRA IS NULL) OR (LO.IDCAFOBRA = :PIDCAFOBRA))'
      '  AND  (LO.IDLANCIMOVEL = LI.IDLANCIMOVEL(+))'
      '  AND  (LI.IDFORCLI = P.IDPESSOA(+))'
      '  AND  (LO.IDGRUPO = G.IDGRUPO(+))'
      
        '  AND  ( (LI.RECPAG = '#39'R'#39') OR (LI.IDLANCIMOVEL IS NULL AND LO.VA' +
        'LOFI < 0) )'
      ''
      'ORDER BY DTALANCAMENTO, NOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 600
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end>
    object qryDATALANCAMENTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCAMENTO'
    end
    object qryNUMNOTA: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'NUMNOTA'
      Size = 13
    end
    object qryNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 39
      FieldName = 'NOME'
      Size = 60
    end
    object qryCLASSE: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 7
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryVALOFI: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALOFI'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDESC_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 60
      FieldName = 'DESC_GRUPO'
      Size = 60
    end
    object qryDTALANCAMENTO: TDateTimeField
      DisplayLabel = 'Data Lancto ~Contabil'
      DisplayWidth = 11
      FieldName = 'DTALANCAMENTO'
      Visible = False
    end
    object qryIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryFLGINTEGRADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGINTEGRADO'
      Visible = False
    end
    object qryDTANOTA: TDateTimeField
      DisplayLabel = 'Data NF'
      DisplayWidth = 12
      FieldName = 'DTANOTA'
      Visible = False
    end
    object qryIDLANCIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCIMOVEL'
      Visible = False
    end
    object qryIDOBRALANC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBRALANC'
      Visible = False
    end
    object qryIDCAFOBRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAFOBRA'
      Visible = False
    end
    object qryFLGDESMEMBOBRA: TFloatField
      FieldName = 'FLGDESMEMBOBRA'
      Visible = False
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object qryObraEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOBRATIPOETAPA,'
      '              DESCOBRATIPOETAPA'
      'FROM CAFOBRATIPOETAPA'
      ''
      'ORDER BY DESCOBRATIPOETAPA')
    ValidateWithMask = True
    Left = 512
    Top = 21
    object qryObraEtapaDESCOBRATIPOETAPA: TStringField
      DisplayLabel = 'Etapa da Obra'
      DisplayWidth = 50
      FieldName = 'DESCOBRATIPOETAPA'
      Origin = 'BASEDADOS.CAFOBRATIPOETAPA.DESCOBRATIPOETAPA'
      Size = 50
    end
    object qryObraEtapaIDOBRATIPOETAPA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBRATIPOETAPA'
      Origin = 'BASEDADOS.CAFOBRATIPOETAPA.IDOBRATIPOETAPA'
      Visible = False
    end
  end
  object qryObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.DESCCAFOBRA, O.DTAINICIOOBRA, O.IDTIPOCUSTORECIMO,'
      '       O.DTAENCERRAOBRA, O.UNIDNEGOC, O.CODSUBCONTA, O.IDGRUPO,'
      '       S.NOMESUBCONTA, I.CODTIPIMOVEL'
      'FROM   CAFOBRA O, SUBCONTA S, IMOVEL I'
      'WHERE  (O.IDIMOVEL = I.IDIMOVEL)'
      '  AND  (O.CODSUBCONTA = S.CODSUBCONTA(+))'
      '  AND  (O.IDPESSOA  = :PIDPESSOA)'
      '  AND  (O.IDCAFOBRA = :PIDCAFOBRA)'
      '')
    ValidateWithMask = True
    Left = 453
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end>
    object qryObraDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DESCCAFOBRA'
      Size = 250
    end
    object qryObraDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAINICIOOBRA'
    end
    object qryObraIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.CAFOBRA.IDTIPOCUSTORECIMO'
    end
    object qryObraDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAENCERRAOBRA'
    end
    object qryObraUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.CAFOBRA.UNIDNEGOC'
    end
    object qryObraCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CAFOBRA.CODSUBCONTA'
    end
    object qryObraIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.CAFOBRA.IDGRUPO'
    end
    object qryObraNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
    object qryObraCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
  end
  object dsObra: TwwDataSource
    DataSet = qryObra
    Left = 454
    Top = 65
  end
  object qryGrupoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO'
      '  FROM GRUPO G, TIPOIMOVEL T'
      ' WHERE T.CODTIPIMOVEL = :CODTIPIMOVEL'
      '   AND ( G.IDGRUPO = T.IDGRUPOTERRENO    OR'
      '         G.IDGRUPO = T.IDGRUPOEDIFICACAO OR'
      '         G.IDGRUPO = T.IDGRUPOINST       OR'
      '         G.IDGRUPO = T.IDGRUPOELET       OR'
      '         G.IDGRUPO = T.IDGRUPOAR         OR'
      '         G.IDGRUPO = T.IDGRUPOVEICULO    OR'
      '         G.IDGRUPO = T.IDGRUPOUTILITARIO OR'
      '         G.IDGRUPO = T.IDGRUPOMAQUINA    OR'
      '         G.IDGRUPO = T.IDGRUPOMOVEL )'
      ''
      ' '
      '')
    ValidateWithMask = True
    Left = 176
    Top = 269
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryGrupoContabilNOME: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.GRUPO.NOME'
      Size = 60
    end
    object qryGrupoContabilCLASSE: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 15
      FieldName = 'CLASSE'
      Origin = 'BASEDADOS.GRUPO.CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGrupoContabilIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPO.IDGRUPO'
      Visible = False
    end
  end
end
