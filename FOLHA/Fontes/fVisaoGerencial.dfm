inherited frmVisaoGerencial: TfrmVisaoGerencial
  Left = 3
  Top = 105
  HelpContext = 180059
  BorderStyle = bsNone
  Caption = 'Visão Gerencial da Folha de Benefícios'
  ClientHeight = 454
  ClientWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox8: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 780
    Height = 61
    Align = alTop
    Caption = 'Histórico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object dblkFolha: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 715
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'HISTORICO'#9'50'#9'Histórico'#9'F')
      LookupTable = qryHist
      LookupField = 'IDHSTFOLHABENEF'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblkfolhaChange
      OnExit = dblkfolhaExit
    end
  end
  inherited pnlFundo: TPanel
    Top = 61
    Width = 780
    Height = 354
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 778
      Height = 352
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel7'
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 5
        Top = 5
        Width = 768
        Height = 342
        ActivePage = TabSheet1
        Align = alClient
        HotTrack = True
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Consulta'
          object GroupBox3: TGroupBox
            Left = 9
            Top = 10
            Width = 716
            Height = 61
            Caption = 'Histórico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 16
              Top = 24
              Width = 673
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HISTORICO'#9'50'#9'HISTORICO')
              LookupTable = qryHist
              LookupField = 'IDHSTFOLHABENEF'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkfolhaChange
              OnExit = dblkfolhaExit
            end
          end
          object GroupBox4: TGroupBox
            Left = 9
            Top = 222
            Width = 717
            Height = 61
            Caption = 'Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 16
              Top = 24
              Width = 673
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome')
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              Style = csDropDownList
              Enabled = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object RadioGroup1: TRadioGroup
            Left = 8
            Top = 80
            Width = 717
            Height = 129
            Caption = 'Opções de estorno'
            Enabled = False
            Items.Strings = (
              'Estorna toda a folha'
              
                'Estorna um participante da folha - todo o processo, desde os his' +
                'tóricos até o Contas a Pagar / Contabilização'
              
                'Estorna um participante da folha - do TXT, gerando outro Contas ' +
                'a Pagar individual, criando alterador para o original')
            TabOrder = 1
          end
          object GroupBox5: TGroupBox
            Left = 9
            Top = 294
            Width = 717
            Height = 61
            Caption = 'Motivo do estorno'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object Edit2: TEdit
              Left = 16
              Top = 24
              Width = 685
              Height = 21
              TabOrder = 0
              Text = 'Edit2'
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Contas a Pagar'
          object Label4: TLabel
            Left = 12
            Top = 12
            Width = 145
            Height = 13
            Caption = 'Contas a Pagar da Folha:'
          end
          object Label5: TLabel
            Left = 12
            Top = 204
            Width = 182
            Height = 13
            Caption = 'Contas a Pagar do Participante:'
            Enabled = False
          end
          object DBText2: TDBText
            Left = 160
            Top = 12
            Width = 557
            Height = 13
            Color = clActiveBorder
            DataField = 'HISTORICO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 196
            Top = 204
            Width = 509
            Height = 13
            Color = clActiveBorder
            DataField = 'NOME'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 588
            Top = 340
            Width = 121
            Height = 13
            Alignment = taRightJustify
            Color = clActiveBorder
            DataField = 'VTOTAL'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label6: TLabel
            Left = 500
            Top = 340
            Width = 81
            Height = 13
            Caption = 'Total Líquido:'
            Enabled = False
          end
          object wwDBGrid3: TwwDBGrid
            Left = 12
            Top = 28
            Width = 713
            Height = 153
            Selected.Strings = (
              'NODOCUMENTO'#9'10'#9'Número do Documento'
              'DATAPROGRAMADA'#9'10'#9'Vencto'
              'VALORLANC'#9'10'#9'Valor Líquido'
              'SALDO'#9'10'#9'Saldo a Pagar'
              'NOME'#9'25'#9'Favorecido'
              'NOMETXT'#9'20'#9'Arquivo TXT')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsCAP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindow
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object wwDBGrid4: TwwDBGrid
            Left = 16
            Top = 220
            Width = 713
            Height = 117
            Selected.Strings = (
              'DESCRICAO'#9'69'#9'Provento / Desconto'
              'DECODE(P.FLGDESCONTO,0,HS.VALOR'#9'15'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindow
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Contabilização'
          object Label7: TLabel
            Left = 8
            Top = 12
            Width = 52
            Height = 13
            Caption = 'Planilhas'
          end
          object Label8: TLabel
            Left = 8
            Top = 136
            Width = 76
            Height = 13
            Caption = 'Lançamentos'
          end
          object wwDBGrid5: TwwDBGrid
            Left = 8
            Top = 152
            Width = 717
            Height = 189
            Selected.Strings = (
              'LACDEBCRE'#9'3'#9'D/C'
              'LACVALOR'#9'10'#9'Valor'
              'PLACONTA'#9'16'#9'Conta'
              'PLANOME'#9'29'#9'Descrição'
              'LACHIST1'#9'40'#9'Histórico 1'
              'LACHIST2'#9'40'#9'Histórico 2'
              'LACHIST3'#9'40'#9'Histórico 3'
              'LACHIST4'#9'40'#9'Histórico 4')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsContab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object wwDBGrid6: TwwDBGrid
            Left = 8
            Top = 28
            Width = 373
            Height = 93
            Selected.Strings = (
              'PEREXERCICIO'#9'10'#9'Exercício'
              'PERNUMERO'#9'10'#9'Mês'
              'PLNPLANIL'#9'10'#9'Planilha'
              'PLNTOTDEB'#9'10'#9'Total')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsPlanil
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Dados para estorno'
          object GroupBox6: TGroupBox
            Left = 0
            Top = 4
            Width = 737
            Height = 233
            Caption = 'Estorno com geração de novo Contas a Pagar'
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Panel8: TPanel
              Left = 6
              Top = 162
              Width = 413
              Height = 66
              Caption = 'Panel3'
              TabOrder = 0
              object Label9: TLabel
                Left = 16
                Top = 8
                Width = 203
                Height = 13
                Caption = 'Alterador para o documento original'
              end
              object wwDBLookupCombo3: TwwDBLookupCombo
                Left = 16
                Top = 24
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object Panel9: TPanel
              Left = 424
              Top = 17
              Width = 308
              Height = 212
              Caption = 'Panel4'
              TabOrder = 1
              object Memo3: TMemo
                Left = 4
                Top = 8
                Width = 301
                Height = 195
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Para esta situação (estorno de um participante '
                  'de um arquivo texto), será criado um novo '
                  'Contas a Pagar individual para este '
                  'participante e lançado um alterador, de igual '
                  'valor, para o documento original - criado pela '
                  'Efetivação da Folha de Benefícios.'
                  'O novo documento ficará em aberto no Contas '
                  'a Pagar até que seja efetivado o seu '
                  'pagamento.'
                  'Este documento gerado, passa a ser parte '
                  'integrante do histórico da Folha de Benefícios '
                  'em questão.')
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel10: TPanel
              Left = 6
              Top = 87
              Width = 413
              Height = 71
              Caption = 'Panel2'
              TabOrder = 2
              object Label10: TLabel
                Left = 16
                Top = 12
                Width = 119
                Height = 13
                Caption = 'Data de Lançamento'
              end
              object Label11: TLabel
                Left = 184
                Top = 12
                Width = 116
                Height = 13
                Caption = 'Data de Vencimento'
              end
              object DateEdit1: TCMDateTimePicker
                Left = 15
                Top = 28
                Width = 122
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
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
              object DateEdit2: TCMDateTimePicker
                Left = 183
                Top = 28
                Width = 122
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
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
              end
            end
            object Panel11: TPanel
              Left = 6
              Top = 18
              Width = 413
              Height = 65
              Caption = 'Panel11'
              TabOrder = 3
              object Label12: TLabel
                Left = 12
                Top = 16
                Width = 224
                Height = 13
                Caption = 'Contas / Caixas x Forma de Pagamento'
              end
              object wwDBLookupCombo4: TwwDBLookupCombo
                Left = 12
                Top = 32
                Width = 373
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Descrição')
                LookupField = 'CODPORTFORMA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object GroupBox7: TGroupBox
            Left = 0
            Top = 240
            Width = 737
            Height = 121
            Caption = 'Estorno do participante - todo o processo'
            Enabled = False
            TabOrder = 1
            object Panel12: TPanel
              Left = 6
              Top = 15
              Width = 413
              Height = 65
              Caption = 'Panel3'
              TabOrder = 0
              object Label13: TLabel
                Left = 16
                Top = 8
                Width = 203
                Height = 13
                Caption = 'Alterador para o documento original'
              end
              object wwDBLookupCombo5: TwwDBLookupCombo
                Left = 16
                Top = 24
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object Panel13: TPanel
              Left = 424
              Top = 14
              Width = 308
              Height = 100
              Caption = 'Panel4'
              TabOrder = 1
              object Memo4: TMemo
                Left = 4
                Top = 4
                Width = 300
                Height = 91
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Para esta situação (estorno de todo o processo de '
                  'um participante), será lançado um alterador, de '
                  'igual valor, para o documento original - criado pela '
                  'Efetivação da Folha de Benefícios.')
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  object Panel14: TPanel [2]
    Left = 0
    Top = 61
    Width = 780
    Height = 354
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'Panel14'
    TabOrder = 2
    object pnlProgbar: TPanel
      Left = 5
      Top = 386
      Width = 769
      Height = 22
      Caption = 'pnlProgbar'
      TabOrder = 1
      object prgBar: TProgressBar
        Left = 1
        Top = 1
        Width = 767
        Height = 20
        Align = alClient
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object pgCtrlEstorno: TPageControl
      Left = 5
      Top = 5
      Width = 770
      Height = 344
      ActivePage = TabSheet7
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object TabSheet6: TTabSheet
        Caption = 'Contas a &Pagar'
        object dbgrCAP: TwwDBGrid
          Left = 0
          Top = 32
          Width = 762
          Height = 284
          Selected.Strings = (
            'NODOCUMENTO'#9'10'#9'Número do Documento'#9'No'
            'DATAPROGRAMADA'#9'10'#9'Vencto'#9'No'
            'VALORLANC'#9'10'#9'Valor Líquido'#9'No'
            'SALDO'#9'10'#9'Saldo a Pagar'#9'No'
            'NOME'#9'25'#9'Favorecido'#9'No'
            'NOMETXT'#9'20'#9'Arquivo TXT'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCAP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MultiSelectOptions = [msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindow
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgrCAPCalcCellColors
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 32
          Align = alTop
          TabOrder = 1
          object Label14: TLabel
            Left = 12
            Top = 10
            Width = 145
            Height = 13
            Caption = 'Contas a Pagar da Folha:'
          end
          object DBText5: TDBText
            Left = 160
            Top = 10
            Width = 557
            Height = 13
            Color = clActiveBorder
            DataField = 'HISTORICO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Contabili&zação'
        object Label18: TLabel
          Left = 8
          Top = 136
          Width = 76
          Height = 13
          Caption = 'Lançamentos'
        end
        object wwDBGrid9: TwwDBGrid
          Left = 0
          Top = 100
          Width = 762
          Height = 216
          Selected.Strings = (
            'LACDEBCRE'#9'3'#9'D/C'#9'F'
            'LACVALOR'#9'10'#9'Valor'#9'F'
            'PLACONTA'#9'16'#9'Conta'#9'F'
            'PLANOME'#9'29'#9'Descrição'#9'F'
            'LACHIST1'#9'40'#9'Histórico 1'#9'F'
            'LACHIST2'#9'40'#9'Histórico 2'#9'F'
            'LACHIST3'#9'40'#9'Histórico 3'#9'F'
            'LACHIST4'#9'40'#9'Histórico 4'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 100
          Align = alTop
          TabOrder = 1
          object Label17: TLabel
            Left = 5
            Top = 3
            Width = 52
            Height = 13
            Caption = 'Planilhas'
          end
          object wwDBGrid10: TwwDBGrid
            Left = 5
            Top = 19
            Width = 368
            Height = 76
            Selected.Strings = (
              'PEREXERCICIO'#9'10'#9'Exercício'
              'PERNUMERO'#9'10'#9'Mês'
              'PLNPLANIL'#9'10'#9'Planilha'
              'PLNTOTDEB'#9'10'#9'Total')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsPlanil
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 780
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 584
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 65527
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  MESREFERENCIA'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 492
    Top = 13
    object qryHistHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
    object qryHistMESREFERENCIA: TStringField
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTFOLHABENEF.MESREFERENCIA'
      Visible = False
      Size = 7
    end
  end
  object dsCAP: TwwDataSource
    DataSet = qryCAP
    Left = 689
    Top = 133
  end
  object qryCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.NODOCUMENTO, D.DATAPROGRAMADA,LANC.VALORLANC,'
      
        '                        D.IDFORCLI, PFAV.NOME, H.NOMETXT, SALD.S' +
        'ALDO'
      
        '                        FROM HSTFOLHABENEFCAP H,DOCUMENTO D, PES' +
        'SOA PFAV,'
      
        '                        (SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBC' +
        'RE,'#39'C'#39',VALOR,VALOR*-1)) VALORLANC'
      '                            FROM LANCTODOCUM L, DOCUMENTO D1'
      
        '                            WHERE D1.CODDOCUMENTO = L.CODDOCUMEN' +
        'TO(+)'
      '                             AND   L.OPERACAO <> '#39'5'#39
      '                            GROUP BY L.CODDOCUMENTO) LANC ,'
      
        '                        (SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBC' +
        'RE,'#39'C'#39',VALOR,VALOR*-1)) SALDO'
      '                            FROM LANCTODOCUM L, DOCUMENTO D1'
      
        '                            WHERE D1.CODDOCUMENTO = L.CODDOCUMEN' +
        'TO(+)'
      '                            GROUP BY L.CODDOCUMENTO) SALD'
      
        '                        WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABEN' +
        'EF AND'
      
        '                              H.CODDOCUMENTO = D.CODDOCUMENTO (+' +
        ')  AND'
      
        '                              D.IDFORCLI = PFAV.IDPESSOA(+)     ' +
        '   AND'
      
        '                              D.CODDOCUMENTO = LANC.CODDOCUMENTO' +
        '   AND'
      '                              D.CODDOCUMENTO = SALD.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 650
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 8
      end>
  end
  object dsContab: TwwDataSource
    DataSet = qryContab
    Left = 569
    Top = 325
  end
  object qryContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PL.PERNUMERO,PL.PEREXERCICIO,PL.PLNPLANIL,PL.PLNTOTDEB, L' +
        'C.LACDEBCRE,LC.LACVALOR,'
      
        '       LC.PLACONTA,PC.PLANOME,LC.LACHIST1,LC.LACHIST2,LC.LACHIST' +
        '3,LC.LACHIST4,LC.LACNUMLAN'
      'FROM PLANILHA PL, LANCAMENTO LC, PLANOCONTA PC'
      'WHERE PL.PLNCODIGO = :PLNCODIGO   AND'
      '      PL.PLNCODIGO = LC.PLNCODIGO AND'
      '      LC.PLACONTA  = PC.PLACONTA AND'
      '      LC.PLANO = PC.PLANO'
      'ORDER BY LACNUMLAN DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 516
    Top = 325
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
        Value = 3535
      end>
  end
  object dsPlanil: TwwDataSource
    DataSet = qryPlanilha
    Left = 333
    Top = 117
  end
  object qryPlanilha: TwwQuery
    AfterScroll = qryPlanilhaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLNCODIGO, PERNUMERO, PEREXERCICIO, PLNPLANIL, PLNTOTDEB'
      'FROM ('
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM HSTFOLHABENEFCAP HS, LANCTODOCUM LC, PLANILHA PL'
      'WHERE HS.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND HS.CODDOCUMENTO = LC.CODDOCUMENTO (+)'
      'AND LC.PLNCODIGO = PL.PLNCODIGO'
      'UNION'
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM MOTIVOESTORNOFB M, PLANILHA PL'
      'WHERE M.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND M.PLNCODIGO = PL.PLNCODIGO'
      'UNION'
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM HSTFOLHABENEF H, PLANILHA PL'
      'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND H.PLNPROVISABONO = PL.PLNCODIGO'
      ') G'
      'ORDER BY PLNCODIGO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 284
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 8
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
  end
end
