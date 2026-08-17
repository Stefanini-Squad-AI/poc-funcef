inherited frmParamRelatEnvDocContab: TfrmParamRelatEnvDocContab
  Left = 500
  Top = 119
  Caption = 
    'Parâmetros do Relatório de Envio de Documentos para Contabilidad' +
    'e'
  ClientHeight = 562
  ClientWidth = 667
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 667
    Height = 523
    object Panel1: TPanel
      Left = 1
      Top = 486
      Width = 665
      Height = 36
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      object SbAdTodos: TSpeedButton
        Left = 192
        Top = 6
        Width = 135
        Height = 25
        Caption = 'Marca &Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E668866666
          608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
          66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
          66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
          660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SbAdTodosClick
      end
      object SbAdInverte: TSpeedButton
        Left = 337
        Top = 6
        Width = 135
        Height = 25
        Caption = '&Inverter Seleção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SbAdInverteClick
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 665
      Height = 232
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object pnlPageControl: TPanel
        Left = 2
        Top = 2
        Width = 661
        Height = 79
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 0
        object pagFiltro: TPageControl
          Left = 5
          Top = 5
          Width = 651
          Height = 69
          ActivePage = tabEnviados
          Align = alClient
          MultiLine = True
          Style = tsButtons
          TabOrder = 0
          OnChange = pagFiltroChange
          object tabNaoEnviados: TTabSheet
            Caption = 'Não Enviados'
            ImageIndex = 1
            OnShow = tabNaoEnviadosShow
          end
          object tabEnviados: TTabSheet
            Caption = 'Enviados'
            OnShow = tabEnviadosShow
            object lbltsEnvIdEnvio: TLabel
              Left = 4
              Top = 12
              Width = 94
              Height = 21
              AutoSize = False
              Caption = 'Código do Envio'
              Layout = tlCenter
            end
            object edtIdEnvio: TEdit
              Left = 102
              Top = 12
              Width = 112
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnEnter = FocoEntrada
            end
            object btPesqIdEnvio: TButton
              Left = 213
              Top = 11
              Width = 23
              Height = 22
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = btPesqIdEnvioClick
            end
          end
        end
      end
      object btDesfazerEnvio: TButton
        Left = 531
        Top = 39
        Width = 118
        Height = 33
        Caption = 'Desfazer Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btDesfazerEnvioClick
      end
      object btFazerEnvio: TButton
        Left = 531
        Top = 39
        Width = 118
        Height = 33
        Caption = 'Fazer Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btFazerEnvioClick
      end
      object GrBxFiltroDatas: TGroupBox
        Left = 16
        Top = 80
        Width = 361
        Height = 97
        Caption = ' Datas '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblAte: TLabel
          Left = 200
          Top = 56
          Width = 26
          Height = 21
          AutoSize = False
          Caption = 'até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object lblDe: TLabel
          Left = 200
          Top = 24
          Width = 25
          Height = 21
          AutoSize = False
          Caption = 'de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DlIni: TCMDateTimePicker
          Left = 224
          Top = 24
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 3
        end
        object DlFim: TCMDateTimePicker
          Left = 224
          Top = 56
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 4
        end
        object rdbDtLancto: TRadioButton
          Left = 16
          Top = 20
          Width = 129
          Height = 19
          Caption = 'Data do Lançamento'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rdbDtLanctoClick
        end
        object rdbDtdisponib: TRadioButton
          Left = 16
          Top = 39
          Width = 137
          Height = 17
          Caption = 'Data da Disponibilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rdbDtLanctoClick
        end
        object rdbDtEnvioContab: TRadioButton
          Left = 16
          Top = 74
          Width = 169
          Height = 17
          Caption = 'Data de Envio p/ Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rdbDtLanctoClick
        end
        object rdbDtBaixaDocumento: TRadioButton
          Left = 16
          Top = 56
          Width = 97
          Height = 17
          Caption = 'Data de Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = rdbDtLanctoClick
        end
      end
      object btPesquisa: TButton
        Left = 403
        Top = 39
        Width = 118
        Height = 33
        Caption = 'Pesquisar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btPesquisaClick
      end
      object grbxModulos: TGroupBox
        Left = 16
        Top = 184
        Width = 361
        Height = 41
        Caption = ' Módulos '
        TabOrder = 4
        object cbContasPagar: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Contas a Pagar'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
        object cbContasReceber: TCheckBox
          Left = 112
          Top = 16
          Width = 113
          Height = 17
          Caption = 'Contas a Receber'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
        end
        object cbCFinan: TCheckBox
          Left = 232
          Top = 16
          Width = 121
          Height = 17
          Caption = 'Controle Financeiro'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
      end
      object GroupBox1: TGroupBox
        Left = 384
        Top = 80
        Width = 273
        Height = 145
        Caption = ' Documentos '
        TabOrder = 5
        object lblNroDocumento: TLabel
          Left = 10
          Top = 16
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'Documento:'
          Layout = tlCenter
        end
        object lblApAr: TLabel
          Left = 10
          Top = 40
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'Número AP/AR:'
          Layout = tlCenter
        end
        object lblVlrDoc: TLabel
          Left = 10
          Top = 88
          Width = 113
          Height = 21
          AutoSize = False
          Caption = 'Valor Documento:'
          Layout = tlCenter
        end
        object lblNroLote: TLabel
          Left = 10
          Top = 64
          Width = 97
          Height = 21
          AutoSize = False
          Caption = 'Número do Lote:'
          Layout = tlCenter
        end
        object lblPlanilhaContab: TLabel
          Left = 10
          Top = 112
          Width = 105
          Height = 21
          AutoSize = False
          Caption = 'Planilha Contábil:'
          Layout = tlCenter
        end
        object ednVlrDoc: TRealEdit
          Left = 114
          Top = 88
          Width = 153
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          OnEnter = FocoEntrada
          OnKeyDown = ednVlrDocKeyDown
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object edtNroDoc: TEdit
          Left = 114
          Top = 16
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = FocoEntrada
        end
        object edtNroApAr: TEdit
          Left = 114
          Top = 40
          Width = 153
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnEnter = FocoEntrada
        end
        object edtPlanilhaContab: TEdit
          Left = 114
          Top = 112
          Width = 153
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnEnter = FocoEntrada
        end
        object edtNroLote: TEdit
          Left = 114
          Top = 64
          Width = 153
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnEnter = FocoEntrada
        end
        object btnBuscaDoc: TBitBtn
          Left = 218
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Busca um Documento'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnBuscaDocClick
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
          NumGlyphs = 2
        end
        object btnLimpaDoc: TBitBtn
          Left = 242
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Documento'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnLimpaDocClick
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
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 233
      Width = 665
      Height = 253
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Bevel1: TBevel
        Left = 1
        Top = 121
        Width = 663
        Height = 8
        Align = alTop
        Shape = bsSpacer
      end
      object dbgrdLote: TwwDBGrid
        Left = 1
        Top = 1
        Width = 663
        Height = 120
        ControlType.Strings = (
          'SELECIONADO;CheckBox;1;0')
        PictureMasks.Strings = (
          'VALORLANCFINAN'#9'#.###.##'#9'T'#9'T')
        Selected.Strings = (
          'HISTORICO'#9'43'#9'Histórico'#9'F'
          'ENTRADASAIDA'#9'3'#9'Tipo'#9'F'
          'DATALANCFINAN'#9'12'#9'Lançamento'#9'F'
          'DATADISPFINANC'#9'14'#9'Disponibilidade'#9'F'
          'NUMCHQBORDERO'#9'10'#9'Cheque'#9'F'
          'VALORLANCFINAN'#9'17'#9'Valor'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alTop
        DataSource = dsLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        IndicatorColor = icBlack
      end
      object dbgrdDocumento: TwwDBGrid
        Left = 1
        Top = 129
        Width = 663
        Height = 123
        ControlType.Strings = (
          'SELECIONADO;CheckBox;1;0')
        PictureMasks.Strings = (
          'VALORDOCUMENTO'#9'#.###.##'#9'T'#9'F')
        Selected.Strings = (
          'SELECIONADO'#9'14'#9'SELECIONADO'#9'F'
          'STATUS'#9'15'#9'STATUS'#9'F'
          'NODOCUMENTO'#9'16'#9'NODOCUMENTO'#9'F'
          'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F'
          'VLRLIQUIDO'#9'12'#9'VLRLIQUIDO'#9'F'
          'PLNPLANIL'#9'10'#9'PLNPLANIL'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsDocumentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 523
    Width = 667
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Default = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 8
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'DataIni'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'DataFim'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Favorecido'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'NumAP'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'VlrLiquido'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'IdEnvio'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Encaminhado'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Não Encaminhado'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'DataEnvio'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'TipoData'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Código do Lancamento'
        Controle = tcMemo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CODLANCFINANC'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'AqruivoMovimento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ArquivoMovimento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'ArquivoDocumento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ArquivoDocumento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 328
    Top = 8
  end
  object cdsLotes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftFloat
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'VALORDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'PLANILHA'
        DataType = ftFloat
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'ENTRADASAIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATADISPFINANC'
        DataType = ftDateTime
      end
      item
        Name = 'IDENVIODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'PLNCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEMODULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PORTADORCONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspLotes'
    StoreDefs = True
    AfterOpen = cdsLotesAfterOpen
    AfterScroll = cdsLotesAfterScroll
    Left = 112
    Top = 288
    object cdsLotesSELECIONADO: TFloatField
      FieldName = 'SELECIONADO'
      OnChange = cdsLotesSELECIONADOChange
    end
    object cdsLotesSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 15
    end
    object cdsLotesHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ReadOnly = True
      Size = 60
    end
    object cdsLotesVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsLotesNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object cdsLotesDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
      ReadOnly = True
    end
    object cdsLotesENTRADASAIDA: TStringField
      FieldName = 'ENTRADASAIDA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsLotesDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
      ReadOnly = True
    end
    object cdsLotesIDENVIODOCUMENTO: TFloatField
      FieldName = 'IDENVIODOCUMENTO'
      ReadOnly = True
    end
    object cdsLotesCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
      ReadOnly = True
    end
    object cdsLotesNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      ReadOnly = True
      Size = 50
    end
    object cdsLotesPORTADORCONTA: TStringField
      FieldName = 'PORTADORCONTA'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
  end
  object sqlLotes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  0 as selecionado,'
      
        '  DECODE(MOV.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Encaminh' +
        'ado'#39') AS STATUS,'
      '  0 AS DOCUMENTO,'
      '  0 AS VALORDOCUMENTO,'
      '  0 AS PLANILHA,'
      '  MOV.HISTORICO,'
      '  MOV.VALORLANCFINAN,'
      '  MOV.NUMCHQBORDERO,'
      '  MOV.DATALANCFINAN,'
      '  MOV.ENTRADASAIDA,'
      '  MOV.DATADISPFINANC,'
      '  MOV.IDENVIODOCUMENTO,'
      '  MOV.CODLANCFINANC,'
      '  0 as PLNCODIGO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39'  AS NOMEM' +
        'ODULO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39'  AS PORTA' +
        'DORCONTA'
      'FROM'
      '  MOVIMFINANC MOV'
      'WHERE'
      '  ( MOV.IDPESSOA = 1 )'
      ' AND MOV.DATALANCFINAN >= TO_DATE('#39'13/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MOV.DATALANCFINAN <= TO_DATE('#39'15/03/2008'#39','#39'DD/MM/YYYY'#39') '
      ' and 1 = 2'
      ' ')
    ClientDataSet = cdsLotes
    Left = 208
    Top = 296
  end
  object dsLotes: TDataSource
    DataSet = cdsLotes
    Left = 32
    Top = 288
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Inscrição'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 528
    Top = 288
  end
  object qryDocumentos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 as selecionado'
      
        '      ,DECODE(DOC.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Enc' +
        'aminhado'#39') AS STATUS'
      
        '      ,SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0)) VLR' +
        'BRUTO'
      
        '      ,SUM(DECODE(LDC.NUMLOTEMANUAL,NULL,0, LDC.VALOR))VLRLIQUID' +
        'O'
      '      , REC.NUMLOTE'
      '      ,'#39'Manual'#39' tipo'
      '      ,PLN.PLNPLANIL'
      '      ,MVC.CODLANCFINANC'
      '      ,DOC.CODDOCUMENTO'
      '      ,DOC.IDPESSOA'
      '      ,DOC.IDFORCLI'
      '      ,DOC.NODOCUMENTO'
      '      ,LDC.NUMLANCTO'
      '      ,DOC.NUMAPGR'
      '      ,PES.NOME'
      '      ,PES.RAZAOSOCIAL'
      
        'FROM MOVIMFINANC MVC, DOCUMENTO DOC, LANCTODOCUM LDC, RECBTOPAGT' +
        'O REC, PESSOA PES, PLANILHA PLN'
      'WHERE MVC.IDPESSOA = 1'
      '  AND MVC.CODLANCFINANC = REC.CODLANCFINANC'
      '  AND LDC.CODDOCUMENTO  = REC.CODDOCUMENTO'
      '  AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO'
      '  AND DOC.IDFORCLI      = PES.IDPESSOA'
      '  AND LDC.PLNCODIGO     = PLN.PLNCODIGO'
      
        '  AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (DOC.OPERACAO = LDC.' +
        'OPERACAO))'
      '  AND MVC.CODLANCFINANC IN (133100)'
      
        'GROUP BY DECODE(DOC.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'E' +
        'ncaminhado'#39')'
      '        ,REC.NUMLOTE'
      '        ,MVC.CODLANCFINANC'
      '        ,PLN.PLNPLANIL'
      '        ,DOC.CODDOCUMENTO'
      '        ,DOC.IDPESSOA'
      '        ,DOC.IDFORCLI'
      '        ,DOC.NODOCUMENTO'
      '        ,LDC.NUMLANCTO'
      '        ,DOC.NUMAPGR'
      '        ,PES.NOME'
      '        ,PES.RAZAOSOCIAL'
      '')
    ValidateWithMask = True
    Left = 288
    Top = 424
  end
  object dspDocumentos: TDataSetProvider
    DataSet = qryDocumentos
    Constraints = True
    Left = 368
    Top = 424
  end
  object MontaSelect2: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TRUNC(ENVIODOCUMENTO.TRGDTINCLUSAO)'
      'TO_CHAR(ENVIODOCUMENTO.TRGDTINCLUSAO,'#39'HH24:MI'#39')'
      'PESSOA.NOME'
      'ENVIODOCUMENTO.IDENVIODOCUMENTO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Data do Envio'
      'Hora do Envio'
      'Usuario de Envio'
      'Código do Envio')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ENVIODOCUMENTO'
      'PESSOA')
    CamposChave.Strings = (
      'ENVIODOCUMENTO.IDENVIODOCUMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ENVIODOCUMENTO.IDUSUARIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '10'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 448
    Top = 288
  end
  object sqlDocumentos: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 as selecionado'
      
        '      ,DECODE(DOC.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Enc' +
        'aminhado'#39') AS STATUS'
      
        '      ,SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0)) VLR' +
        'BRUTO'
      
        '      ,SUM(DECODE(LDC.NUMLOTEMANUAL,NULL,0, LDC.VALOR))VLRLIQUID' +
        'O'
      '      ,REC.NUMLOTE'
      '      ,'#39'Manual'#39' tipo'
      '      ,PLN.PLNPLANIL'
      '      ,MVC.CODLANCFINANC'
      '      ,DOC.CODDOCUMENTO'
      '      ,DOC.IDPESSOA'
      '      ,DOC.IDFORCLI'
      '      ,DOC.NODOCUMENTO'
      '      ,LDC.NUMLANCTO'
      '      ,DOC.NUMAPGR'
      '      ,PES.NOME'
      '      ,PES.RAZAOSOCIAL'
      
        'FROM MOVIMFINANC MVC, DOCUMENTO DOC, LANCTODOCUM LDC, RECBTOPAGT' +
        'O REC, PESSOA PES, PLANILHA PLN'
      'WHERE MVC.IDPESSOA = 1'
      '  AND MVC.CODLANCFINANC = REC.CODLANCFINANC'
      '  AND LDC.CODDOCUMENTO  = REC.CODDOCUMENTO'
      '  AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO'
      '  AND DOC.IDFORCLI      = PES.IDPESSOA'
      '  AND LDC.PLNCODIGO     = PLN.PLNCODIGO'
      
        '  AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (DOC.OPERACAO = LDC.' +
        'OPERACAO))'
      '  AND MVC.CODLANCFINANC IN (133100)'
      
        'GROUP BY DECODE(DOC.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'E' +
        'ncaminhado'#39')'
      '        ,REC.NUMLOTE'
      '        ,MVC.CODLANCFINANC'
      '        ,PLN.PLNPLANIL'
      '        ,DOC.CODDOCUMENTO'
      '        ,DOC.IDPESSOA'
      '        ,DOC.IDFORCLI'
      '        ,DOC.NODOCUMENTO'
      '        ,LDC.NUMLANCTO'
      '        ,DOC.NUMAPGR'
      '        ,PES.NOME'
      '        ,PES.RAZAOSOCIAL'
      ''
      ' ')
    ClientDataSet = cdsDocumentos
    Left = 208
    Top = 424
  end
  object cdsDocumentos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftFloat
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VLRBRUTO'
        DataType = ftFloat
      end
      item
        Name = 'VLRLIQUIDO'
        DataType = ftFloat
      end
      item
        Name = 'NUMLOTE'
        DataType = ftFloat
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PLNPLANIL'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDFORCLI'
        DataType = ftFloat
      end
      item
        Name = 'NODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'NUMLANCTO'
        DataType = ftFloat
      end
      item
        Name = 'NUMAPGR'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspDocumentos'
    StoreDefs = True
    Left = 120
    Top = 424
    object cdsDocumentosVLRBRUTO: TFloatField
      FieldName = 'VLRBRUTO'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsDocumentosVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsDocumentosNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      ReadOnly = True
    end
    object cdsDocumentosTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object cdsDocumentosCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
      ReadOnly = True
    end
    object cdsDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      ReadOnly = True
    end
    object cdsDocumentosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      ReadOnly = True
    end
    object cdsDocumentosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      ReadOnly = True
    end
    object cdsDocumentosNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      ReadOnly = True
    end
    object cdsDocumentosNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
      ReadOnly = True
    end
    object cdsDocumentosNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 60
    end
    object cdsDocumentosRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      ReadOnly = True
      Size = 60
    end
    object cdsDocumentosSELECIONADO: TFloatField
      FieldName = 'SELECIONADO'
      OnChange = cdsDocumentosSELECIONADOChange
    end
    object cdsDocumentosSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 15
    end
    object cdsDocumentosPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      ReadOnly = True
    end
    object cdsDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      ReadOnly = True
    end
  end
  object dsDocumentos: TDataSource
    DataSet = cdsDocumentos
    Left = 40
    Top = 424
  end
  object dspLotes: TDataSetProvider
    DataSet = qryLotes
    Constraints = True
    Left = 368
    Top = 288
  end
  object qryLotes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 as selecionado,'
      
        '  DECODE(MOV.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Encaminh' +
        'ado'#39') AS STATUS,'
      '  0 AS DOCUMENTO,'
      '  0 AS VALORDOCUMENTO,'
      '  0 AS PLANILHA,'
      '  MOV.HISTORICO,'
      '  MOV.VALORLANCFINAN,'
      '  MOV.NUMCHQBORDERO,'
      '  MOV.DATALANCFINAN,'
      '  MOV.ENTRADASAIDA,'
      '  MOV.DATADISPFINANC,'
      '  MOV.IDENVIODOCUMENTO,'
      '  MOV.CODLANCFINANC,'
      '  0 AS PLNCODIGO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39' AS NOMEMO' +
        'DULO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39' AS PORTAD' +
        'ORCONTA'
      'FROM'
      '  MOVIMFINANC MOV'
      'WHERE'
      '  ( MOV.IDPESSOA = 1 )'
      ' AND MOV.DATALANCFINAN >= TO_DATE('#39'13/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MOV.DATALANCFINAN <= TO_DATE('#39'15/03/2008'#39','#39'DD/MM/YYYY'#39') '
      ' and 1 = 2'
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 288
  end
  object MsDocumentos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOC.NODOCUMENTO'
      'DOC.COMPLDOCUMENTO'
      'ROUND(LDC.VALOR, 2)'
      'PES.NOME'
      'DOC.NUMAPGR'
      'LDC.DATALANCTO'
      'DOC.DATAEMISSAO'
      'PLN.PLNPLANIL'
      'DOC.NUMFATURA')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C'
      'N'
      'D'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Nº Documento'
      'Compl.'
      'Valor'
      'Favorecido'
      'Nº AP'
      'Data Lancto.'
      'Data Emissão'
      'Planilha Contabil'
      'Nº Fatura')
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
      'PESSOA      PES'
      'DOCUMENTO   DOC'
      'LANCTODOCUM LDC'
      'PLANILHA PLN')
    CamposChave.Strings = (
      'DOC.CODDOCUMENTO'
      'DOC.NODOCUMENTO'
      'DOC.COMPLDOCUMENTO'
      'ROUND(LDC.VALOR, 2)'
      'PES.NOME'
      'DOC.NUMAPGR'
      'LDC.DATALANCTO'
      'DOC.DATAEMISSAO'
      'PLN.PLNCODIGO'
      'DOC.NUMFATURA'
      'PLN.PLNPLANIL')
    Filtro.Strings = (
      'DOC.IDFORCLI      = PES.IDPESSOA'
      'DOC.CODDOCUMENTO  = LDC.CODDOCUMENTO'
      'DOC.OPERACAO      = LDC.OPERACAO'
      'PLN.PLNCODIGO     = LDC.PLNCODIGO'
      'DOC.IDFORCLI      = PES.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '#,#0.00'
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      '')
    Larguras.Strings = (
      '12'
      '3'
      '10'
      '25'
      '6'
      '12'
      '12'
      '10'
      '10')
    OperComparador.Strings = (
      '0'
      '1'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 608
    Top = 288
  end
end
