inherited FrmConciliaCPMFMT: TFrmConciliaCPMFMT
  Left = 185
  Top = 163
  Caption = 'Conciliação de CPMF - v03.00.01'
  ClientHeight = 454
  ClientWidth = 735
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 735
    Height = 415
    object PagCpmf: TPageControl
      Left = 5
      Top = 5
      Width = 725
      Height = 405
      ActivePage = TbsConcilia
      Align = alClient
      TabOrder = 0
      OnChange = PagCpmfChange
      object TbsConcilia: TTabSheet
        Caption = 'Conciliação'
        object PnlFiltro: TPanel
          Left = 0
          Top = 0
          Width = 717
          Height = 103
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel1: TBevel
            Left = 560
            Top = 5
            Width = 151
            Height = 42
            Shape = bsFrame
          end
          object Lblval: TLabel
            Left = 595
            Top = 12
            Width = 100
            Height = 26
            Cursor = crHandPoint
            Caption = 'Somente Valores Inconsistentes'
            WordWrap = True
            OnClick = LblvalClick
          end
          object CkbInconsistentes: TCheckBox
            Left = 569
            Top = 17
            Width = 16
            Height = 17
            TabOrder = 6
          end
          object ProcForn: TCMProcuraForCli
            Left = 2
            Top = 0
            Width = 283
            Height = 48
            Caption = '  Favorecido '
            TabOrder = 0
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Favorecido não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            ForCli = fcFornecedor
            MostraEndereco = False
            StatusForCli = fcAll
            MostraStatusCredito = False
          end
          object GroupBox1: TGroupBox
            Left = 287
            Top = 1
            Width = 131
            Height = 48
            Caption = ' Data Programada '
            TabOrder = 1
            object DtProg: TCMDateTimePicker
              Left = 12
              Top = 17
              Width = 109
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
            end
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 49
            Width = 113
            Height = 48
            Caption = ' Nº do Lote '
            TabOrder = 2
            object ReNumLote: TRealEdit
              Left = 12
              Top = 17
              Width = 93
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
          object BtnSeleciona: TBitBtn
            Left = 561
            Top = 56
            Width = 150
            Height = 36
            Caption = 'Seleciona'
            TabOrder = 3
            OnClick = BtnSelecionaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
              000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
              BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
              BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
              BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
              BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
              F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
              F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
              7055557FFFFFF777F7F555000000000000555577777777777755}
            NumGlyphs = 2
          end
          object RgTipoSel: TRadioGroup
            Left = 422
            Top = 0
            Width = 133
            Height = 95
            Caption = ' Status do Lote '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Conciliados'
              'Não Conciliados')
            TabOrder = 4
          end
          object GroupBox3: TGroupBox
            Left = 118
            Top = 50
            Width = 96
            Height = 46
            Caption = ' % CPMF '
            TabOrder = 5
            object EdtCpmf: TRealEdit
              Left = 9
              Top = 17
              Width = 78
              Height = 21
              Alignment = taRightJustify
              Color = clWhite
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
          object GroupBox4: TGroupBox
            Left = 217
            Top = 49
            Width = 202
            Height = 46
            Caption = ' Conta Bancária '
            TabOrder = 7
            object CmbContaBancaria: TCMDBLookupCombo
              Left = 13
              Top = 16
              Width = 176
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              LookupTable = CdsPortConta
              LookupField = 'CODPORTADOR'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object PnlTotaVenc: TPanel
          Left = 0
          Top = 343
          Width = 717
          Height = 34
          Align = alBottom
          BevelInner = bvLowered
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
          object SbAdTodos: TBitBtn
            Left = 81
            Top = 5
            Width = 137
            Height = 25
            Caption = 'Ok &Todos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = SbAdTodosClick
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
            NumGlyphs = 2
          end
          object SbAdInverte: TBitBtn
            Left = 228
            Top = 5
            Width = 137
            Height = 25
            Caption = '&Inverter Ok'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = SbAdInverteClick
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
            NumGlyphs = 2
          end
          object BitBtn1: TBitBtn
            Tag = 1
            Left = 523
            Top = 5
            Width = 137
            Height = 25
            Caption = '&Inverter Recalcula'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = SbAdInverteClick
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
            NumGlyphs = 2
          end
          object BitBtn2: TBitBtn
            Tag = 1
            Left = 376
            Top = 5
            Width = 137
            Height = 25
            Caption = 'Recalcula &Todos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = SbAdTodosClick
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
            NumGlyphs = 2
          end
        end
        object GrdLotes: TwwDBGrid
          Left = 0
          Top = 103
          Width = 717
          Height = 216
          ControlType.Strings = (
            'FLGCONFIRMARECPAG;CheckBox;S;N'
            'RECALCULA;CheckBox;1;0')
          Selected.Strings = (
            'FLGCONFIRMARECPAG'#9'2'#9'Ok'#9'F'
            'RECALCULA'#9'4'#9'Rec'#9'F'
            'NUMLOTE'#9'7'#9'Nº Lote'#9'T'
            'FAVORECIDO'#9'26'#9'Favorecido'#9'T'
            'DATAEMISSAO'#9'10'#9'Data Ger.'#9'T'
            'DATARETENCAO'#9'10'#9'Data Progr.'#9'T'
            'VALORLOTE'#9'15'#9'Valor Lote'#9'T'
            'VALPREVISTO'#9'16'#9'Valor Previsto'#9'F'
            'VALCALCULADO'#9'15'#9'Valor Calculado'#9'F'
            'VALORAUDITORIA'#9'14'#9'Valor Auditoria'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 3
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alClient
          DataSource = DsLotes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          ParentFont = False
          PopupMenu = ppmDataRetencao
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = GrdLotesCalcCellColors
          IndicatorColor = icBlack
        end
        object PnlSum: TPanel
          Left = 0
          Top = 319
          Width = 717
          Height = 24
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Valor previsto da CPMF'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      object TbsAuditoria: TTabSheet
        Caption = 'Auditoria'
        object Bevel3: TBevel
          Left = 13
          Top = 228
          Width = 692
          Height = 52
          Shape = bsFrame
        end
        object Bevel2: TBevel
          Left = 13
          Top = 10
          Width = 692
          Height = 99
          Shape = bsFrame
        end
        object LblProgressInfo: TLabel
          Left = 23
          Top = 236
          Width = 137
          Height = 13
          Caption = 'Aguardando Comando...'
        end
        object Bevel4: TBevel
          Left = 486
          Top = 171
          Width = 219
          Height = 51
          Shape = bsFrame
        end
        object Memo1: TMemo
          Left = 21
          Top = 25
          Width = 681
          Height = 70
          BorderStyle = bsNone
          Color = clMenu
          Lines.Strings = (
            
              'Esse procedimento gera uma listagem com todos os relacionamentos' +
              ' possíveis e não cadastrados entre Tipo de '
            'Desembolso, Centro de Custo, Programa e Impostos do Tipo CPMF.'
            
              'Tal processamento pode ser demorado, logo só execute se o relató' +
              'rio de conciliação não atender a sua auditoria.'
            
              'Você pode visualizar a listagem em tela ou gerar direto para arq' +
              'uivo no formato Texto ou Excel, tendo ainda a '
            
              'possibilidade de enviar o resultado da auditoria por e-mail para' +
              ' o responsável pela parametrização dos '
            'relacionamentos.')
          TabOrder = 0
        end
        object RgDeviceOut: TRadioGroup
          Left = 13
          Top = 114
          Width = 692
          Height = 50
          Caption = ' Dispositivo de Saída da Auditoria '
          Columns = 4
          ItemIndex = 0
          Items.Strings = (
            'Visualização em tela'
            'Arquivo formato texto'
            'Arquivo formato excel'
            'Direto para impressora')
          TabOrder = 1
          OnClick = RgDeviceOutClick
        end
        object Pb: TProgressBar
          Left = 23
          Top = 253
          Width = 673
          Height = 16
          Min = 0
          Max = 100
          TabOrder = 2
        end
        object PnlFileName: TPanel
          Left = 14
          Top = 171
          Width = 467
          Height = 51
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 3
          object Label2: TLabel
            Left = 12
            Top = 6
            Width = 194
            Height = 13
            Caption = 'Arquivo para geração da auditoria'
          end
          object SpeedButton1: TSpeedButton
            Left = 432
            Top = 19
            Width = 26
            Height = 25
            Hint = 'Selecionar arquivo de saída da auditoria'
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000016000000160000000100
              04000000000008010000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888008888888888888888888888008888888888888888888888008888
              888000000000000088008888888877777777777088008888888F888888888870
              88008888888F88888888887088008888888F89988888887088008888888FFFFF
              FFFFFF8088008888888888888888888888008888888888888888888888008888
              88888888888888888800888000000088888880088800888FFFFFFF8888888008
              8800888F44444F88808880088800888FFFFFFF88008870088800888F44444F80
              000000788800888FFFFFFF88008888888800888F444F7788808888888800888F
              FFFF788888888888880088888888888888888888880088888888888888888888
              8800}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object EdtNomeArquivo: TEdit
            Left = 12
            Top = 22
            Width = 418
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object BtnProcessa: TBitBtn
          Left = 500
          Top = 179
          Width = 94
          Height = 34
          Caption = 'Gerar'
          TabOrder = 4
          OnClick = BtnProcessaClick
          Glyph.Data = {
            96010000424D9601000000000000760000002800000018000000180000000100
            0400000000002001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777770777777777777777777777770077777777777
            777777777770B077777777777777777777770B077777777777777777700000B0
            7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
            7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
            F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
            077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
            887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
            FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
            7777777777888777777777777777777777777777777777777777}
        end
        object BtnCancelaProc: TBitBtn
          Left = 600
          Top = 179
          Width = 94
          Height = 34
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 5
          OnClick = BtnCancelaProcClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF000000C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FF
            FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            000080000080000080000080000080FF0000FF0000FFFFFFFFFFFFFFFFFF0000
            00C0C0C0C0C0C0C0C0C0C0C0C00000800000FF0000FF0000FF0000FF0000FF00
            0080FFFFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C00000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF000080FF0000FFFFFFFFFFFFFFFF
            FF000000C0C0C0C0C0C00000FF0000FFC0C0C0FFFFFF0000FFFFFFFFFFFFFF00
            00FF000080FFFFFFFFFFFFFF0000FFFFFFFFFFFF000000C0C0C00000FF0000FF
            0000FFC0C0C0FFFFFFFFFFFF0000FF0000FF000080FF0000FF0000FFFFFFFFFF
            FFFFFFFFFFFFFF0000000000FF0000FF0000FFFFFFFFFFFFFFC0C0C00000FF00
            00FF000080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C00000FF0000FF
            C0C0C0FFFFFF0000FFFFFFFFFFFFFF0000FF000080FFFFFFFFFFFF8080808080
            80C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
            0080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        end
      end
      object TbsManutCpmf: TTabSheet
        Caption = 'Alteração de Alíquota'
        ImageIndex = 3
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 151
          Height = 353
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel5: TBevel
            Left = 6
            Top = 11
            Width = 136
            Height = 213
            Shape = bsFrame
          end
          object Label1: TLabel
            Left = 14
            Top = 87
            Width = 49
            Height = 13
            Caption = 'Alíquota'
          end
          object Label3: TLabel
            Left = 14
            Top = 131
            Width = 87
            Height = 13
            Caption = 'Início Vigência'
            Enabled = False
          end
          object Label4: TLabel
            Left = 14
            Top = 175
            Width = 73
            Height = 13
            Caption = 'Fim Vigência'
            Enabled = False
          end
          object Bevel6: TBevel
            Left = 6
            Top = 232
            Width = 138
            Height = 42
            Shape = bsFrame
          end
          object CMDateTimePicker1: TCMDateTimePicker
            Left = 14
            Top = 147
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
            Enabled = False
            ShowButton = True
            TabOrder = 0
          end
          object CMDateTimePicker2: TCMDateTimePicker
            Left = 14
            Top = 191
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
            Enabled = False
            ShowButton = True
            TabOrder = 1
          end
          object ReAliquota: TDBRealEdit
            Left = 14
            Top = 103
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object BtnManutAll: TBitBtn
            Left = 14
            Top = 21
            Width = 120
            Height = 25
            Caption = 'Marcar Todos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = BtnManutAllClick
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
            NumGlyphs = 2
          end
          object BtnManutInverte: TBitBtn
            Left = 14
            Top = 53
            Width = 120
            Height = 25
            Caption = '&Inverter Seleção'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = BtnManutInverteClick
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
            NumGlyphs = 2
          end
          object BitBtn5: TBitBtn
            Left = 15
            Top = 240
            Width = 120
            Height = 25
            Caption = 'Alterar'
            TabOrder = 5
            OnClick = BitBtn5Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008000
              0000000000000000800080800080800080800080800080800080800080800080
              C0C0C0000000000000C0C0C080008000000000FFFF000000800080C0C0C00000
              0000000080008080008080008080008000808000FFFF00000000808000000000
              8080008080000000000000000000008080008080000000800080800080800080
              00808000FFFF000000008080008080008080FFFFFF00000000FFFF0080800080
              8000808000000080008080808000000000000000FFFF00FFFF00000000808000
              8080C0C0C0008080000000008080FFFFFFC0C0C0000000000000000000008080
              008080000000008080FFFFFFFFFFFF00FFFF00FFFFFFFFFF00FFFF00FFFF0080
              80000000008080008080000000008080008080008080FFFFFF00FFFF00000000
              0000000000000000000000C0C0C000FFFF000000008080008080008080FFFFFF
              008080FFFFFF00FFFF808080808080FFFFFF808080808080000000008080FFFF
              FF00FFFFFFFFFF00FFFF008080008080008080008080FFFFFF808080808080FF
              FFFFC0C0C080808000000080808000FFFFC0C0C0000000000000800080800080
              000000008080FFFFFFFFFFFF808080FFFFFF808080808080000000FFFFFF00FF
              FF008080000000800080800080800080008080FFFFFF00FFFF00FFFF808080FF
              FFFFC0C0C0808080000000008080FFFFFF00FFFF000000800080800080800080
              800080008080008080808080808080C0C0C08080808080800000008080800080
              80808080800080800080800080800080800080800080800080800080808080FF
              FFFFFFFFFFC0C0C0000000800080800080800080800080800080800080800080
              8000808000808000808000808000808080808080808080808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080}
          end
        end
        object GrdManut: TwwDBGrid
          Left = 151
          Top = 24
          Width = 566
          Height = 353
          Selected.Strings = (
            'ALTERA'#9'4'#9'Altera'#9'F'
            'DESCCUSTAGREG'#9'54'#9'Descrição'#9'F'
            'PERCCUSTAGREG'#9'7'#9'Percentual'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsManutCpmf
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 717
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Alteração de Alíquota e Vigência de CPMF'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object TbsBaixas: TTabSheet
        Caption = 'Baixa de CPMF'
        ImageIndex = 3
        object FormaPag: TLabel
          Left = 2
          Top = 53
          Width = 198
          Height = 13
          Caption = 'Contas/Caixas x Forma Pagamento'
        end
        object Label5: TLabel
          Left = 453
          Top = 9
          Width = 99
          Height = 13
          Caption = 'Data Programada'
        end
        object Label6: TLabel
          Left = 456
          Top = 53
          Width = 62
          Height = 13
          Caption = 'Nº do Lote'
        end
        object Label7: TLabel
          Left = 237
          Top = 53
          Width = 92
          Height = 13
          Caption = 'Conta Bancária '
        end
        object CmpBaixas: TCMProcuraForCli
          Left = 2
          Top = 1
          Width = 439
          Height = 50
          Caption = '  Favorecido '
          TabOrder = 0
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = 'É Obrigatório a Indicação do Favorecido'
          Mensagens.NaoExiste = 'Favorecido não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object dblkFormaPag: TwwDBLookupCombo
          Left = 2
          Top = 68
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          LookupTable = CdsContasCaixas
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DtProgBaixa: TCMDateTimePicker
          Left = 453
          Top = 26
          Width = 109
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
        object ReNumLoteBaixa: TRealEdit
          Left = 456
          Top = 68
          Width = 105
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object BtnSelBaixa: TBitBtn
          Left = 568
          Top = 24
          Width = 145
          Height = 49
          Caption = 'Seleciona Documentos'
          TabOrder = 4
          OnClick = BtnSelBaixaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
            8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
            0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
            07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
          Layout = blGlyphTop
        end
        object Panel2: TPanel
          Left = 0
          Top = 95
          Width = 717
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvLowered
          Caption = 'CPMF'#39's Selecionadas Para Baixa'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 135
          Width = 717
          Height = 208
          ControlType.Strings = (
            'FLGCONFIRMARECPAG;CheckBox;S;N')
          Selected.Strings = (
            'FLGCONFIRMARECPAG'#9'2'#9'Ok'#9'F'
            'NUMLOTE'#9'7'#9'Nº Lote'#9'T'
            'FAVORECIDO'#9'40'#9'Favorecido'#9'T'
            'DATARETENCAO'#9'16'#9'Data Programada'#9'T'
            'VALCALCULADO'#9'12'#9'Valor Efetivo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alBottom
          DataSource = DsLotesBaixas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          ParentFont = False
          TabOrder = 6
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 0
          Top = 343
          Width = 717
          Height = 34
          Align = alBottom
          BevelInner = bvLowered
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 7
          object BitBtn4: TBitBtn
            Left = 226
            Top = 5
            Width = 137
            Height = 25
            Caption = 'Marcar &Todos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
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
            NumGlyphs = 2
          end
          object BitBtn6: TBitBtn
            Left = 380
            Top = 5
            Width = 137
            Height = 25
            Caption = '&Inverter Seleção'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
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
            NumGlyphs = 2
          end
        end
        object CmbContaBancaria2: TCMDBLookupCombo
          Left = 237
          Top = 68
          Width = 204
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          LookupTable = CdsPortConta
          LookupField = 'CODPORTADOR'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 735
    inherited tb97Fundo: TToolbar97
      Left = 551
      DockPos = 625
      inherited sep1: TToolbarSep97
        Left = 177
      end
      inherited sep3: TToolbarSep97
        Left = 87
      end
      inherited bbtnSair: TBitBtn
        Width = 87
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 90
        Width = 87
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
      DockPos = 80
      inherited ToolbarSep971: TToolbarSep97
        Left = 364
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 367
        Width = 87
        TabOrder = 4
        OnClick = bbtnConfirmarClick
      end
      object BtnImprime: TBitBtn [2]
        Left = 188
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Relatórios'
        Default = True
        TabOrder = 0
        OnClick = BtnImprimeClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          22222200000000000222208888888880802200000000000008020888888BBB88
          0002088888877788080200000000000008800888888888808080200000000008
          0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
          022222220FFFFFFFF02222222000000000222222222222222222}
      end
      object BtnEmail: TBitBtn [3]
        Left = 0
        Top = 0
        Width = 94
        Height = 33
        Caption = '&Mensagem'
        Default = True
        TabOrder = 2
        Visible = False
        OnClick = BtnEmailClick
        Glyph.Data = {
          C2040000424DC204000000000000420000002800000024000000100000000100
          1000030000008004000000000000000000000000000000000000007C0000E003
          00001F0000001863186318631863186318631863186318631863186318631863
          0040004018631863186318631863186318631863186318631863186318631863
          18631863104210421863FF7F1863186318631863186318631863186318631863
          18631863186318630040007C0040186318631863186318631863186318631863
          186318631863FF7FFF7FFF7F1042FF7F10421863FF7F18631863186318631863
          186318631863186300400040004000400040007C007C00401863186318631863
          1863186318631863186318631042104210421042104218631863104218631863
          186318631863186318631863186318630040007C007C007C007C007C007C007C
          00401863186318631863186318631863186318631042FF7F1863186318631863
          1863186310421863000000000000000000000000000000000040007C007C007C
          007C007C007C007C004018631863FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042FF7F
          FF7FFF7FFF7FFF7F186318631042186310421042104210421042104210421042
          00400040004000400040007C007C004018631863104210421042104210421042
          1042104210421042104210421042FF7F18631042186318631042186318631863
          186318631863186318631863186318630040007C00401863186318631042FF7F
          FF7F1863186318631863186318631863186318631042FF7F1042186318631863
          1042004218631863186300420042004218631863186300420040004018631863
          18631863104210421863FF7F18631863FF7FFF7FFF7F18631863104210421042
          FF7F1863186318631042E07F0042186300420000000000000042186300421863
          1042000018631863186318631042FF7F10421863FF7F1042104210421863FF7F
          1042186318631042FF7F1863186318631042FF7FFF7F00420000FF7FFF7FE07F
          00000042186318631042000018631863186318631042FF7F1863104210421863
          1863186310421042FF7F186318631042FF7F1863186318631042E07F18630000
          FF7FE07FFF7FFF7FFF7F0000004218631042000018631863186318631042FF7F
          186310421863186318631863186310421863FF7F18631042FF7F186318631863
          104218630000E07FFF7FFF7FFF7FE07FFF7FFF7F000000421042000018631863
          186318631042FF7F1042186318631863186318631863186310421863FF7F1042
          FF7F18631863186310420000FF7FFF7FFF7FE07FFF7FFF7FFF7FE07FFF7F0000
          0042000018631863186318631042104218631863186318631863186318631863
          1863104218631042FF7F1863186318631042FF7FFF7FE07FFF7FFF7FFF7FE07F
          FF7FFF7FFF7FE07F0000000018631863186318631042FF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7F10421042FF7F1863186318631042104210421042
          1042104210421042104210421042104210420000186318631863186310421042
          1042104210421042104210421042104210421042104210421863186318631863
          1863186318631863186318631863186318631863186318631863186318631863
          1863186318631863186318631863186318631863186318631863186318631863
          186318631863}
        NumGlyphs = 2
      end
      object BtnRecalcula: TBitBtn [4]
        Left = 277
        Top = 0
        Width = 87
        Height = 33
        Caption = 'R&ecalcular'
        Default = True
        TabOrder = 3
        OnClick = BtnRecalculaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        Spacing = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 454
        Width = 87
        OnClick = bbtnCancelarClick
      end
      object BtnBaixa: TBitBtn
        Left = 94
        Top = 0
        Width = 94
        Height = 33
        Caption = '&Baixa'
        Default = True
        TabOrder = 5
        Visible = False
        OnClick = BtnBaixaClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777770777777777777777777777770077777777777
          777777777770B077777777777777777777770B077777777777777777700000B0
          7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
          7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
          F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
          077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
          887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
          FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
          7777777777888777777777777777777777777777777777777777}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 47
    Top = 317
    TargetsData = (
      1
      5
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'EditorCaption'
        0)
      (
        ''
        'Title'
        0))
  end
  object DsLotes: TwwDataSource
    DataSet = CdsLotes
    Left = 265
    Top = 264
  end
  object ImlDocs: TImageList
    Left = 47
    Top = 109
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007B7B7B000000FF007B7B7B00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF000000FF000000FF000000FF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000007B7B7B007B7B7B0000FFFF0000FFFF0000FFFF007B7B7B007B7B
      7B000000000000FFFF0000FFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF0084848400848484000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000FF000000FF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001FF1FFFFF00000000FC0FF83F0000
      0000F00FE00F00000000E00FC00700000000E007800300000000F00780030000
      0000C003000100000000C001000100000000C000000100000000E00100010000
      8001E00700010000C003F00380030000C003F00180030000C003F803C0070000
      C003FC0FE00F0000C003FE3FF83F000000000000000000000000000000000000
      000000000000}
  end
  object DsManutCpmf: TwwDataSource
    DataSet = CdsManutCpmf
    Left = 353
    Top = 165
  end
  object DsLotesBaixas: TwwDataSource
    DataSet = CdsLotesBaixas
    Left = 353
    Top = 260
  end
  object ppmDataRetencao: TPopupMenu
    Left = 47
    Top = 173
    object MnuAltDataRetencao: TMenuItem
      Caption = '&Alterar Data de Retenção'
      OnClick = MnuAltDataRetencaoClick
    end
  end
  object DlgFile: TOpenDialog
    Title = 'Selecionar arquivo para gravação da auditoria'
    Left = 47
    Top = 221
  end
  object ZipFile: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 47
    Top = 269
  end
  object SQLContasCaixas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO, CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA,'
      '  PLACONTACONTABCHQ, PLANOCONTABCHQ, FLGCONTABEMISCHQ'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  1=2')
    ClientDataSet = CdsContasCaixas
    Left = 145
    Top = 77
  end
  object CdsContasCaixas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 117
  end
  object SQLPortConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODPORTADOR, DESCRICAO'
      'FROM'
      '  PORTADORCONTA'
      'WHERE'
      '  FLGSTATUS = '#39'A'#39' AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  DESCRICAO')
    ClientDataSet = CdsPortConta
    Left = 265
    Top = 77
  end
  object CdsPortConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 117
  end
  object CdsManutCpmf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 353
    Top = 117
  end
  object SQLManutCpmf: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  (0) AS ALTERA, TA.DESCCUSTAGREG, F.PERCCUSTAGREG, NUMFAIXA'
      'FROM'
      '  TIPOAGRE TA, FAIXATIPOAGREG F'
      'WHERE'
      '  TA.CODTRATFISCE = '#39'B'#39' AND'
      '  TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG'
      'ORDER BY'
      '  TA.DESCCUSTAGREG')
    ClientDataSet = CdsManutCpmf
    Left = 353
    Top = 77
  end
  object CdsLotes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLotesAfterOpen
    BeforePost = CdsLotesBeforePost
    Left = 265
    Top = 213
  end
  object CdsLotesBaixas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLotesBaixasAfterOpen
    Left = 353
    Top = 213
  end
end
