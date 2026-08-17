inherited FrmEventoTransfPlano: TFrmEventoTransfPlano
  Left = 433
  Top = 147
  Caption = 'Transferência de Planos'
  ClientHeight = 505
  ClientWidth = 696
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 696
    Height = 466
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    object Splitter1: TSplitter
      Left = 1
      Top = 259
      Width = 694
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 694
      Height = 258
      Align = alTop
      TabOrder = 0
      object pgctrop: TPageControl
        Left = 1
        Top = 1
        Width = 692
        Height = 256
        ActivePage = tblote
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = pgctropChange
        object tbindividual: TTabSheet
          Caption = 'Individual'
          object GroupBox3: TGroupBox
            Left = 0
            Top = 34
            Width = 684
            Height = 194
            Align = alClient
            TabOrder = 0
            object lblCampoBusca: TLabel
              Left = 9
              Top = 14
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object lblnome: TLabel
              Left = 9
              Top = 36
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object lblPlanoOrigem: TLabel
              Left = 9
              Top = 58
              Width = 191
              Height = 13
              Caption = 'Patrocinadora/Plano de Origem : '
            end
            object lblInscricaoData: TLabel
              Left = 9
              Top = 80
              Width = 90
              Height = 13
              Caption = 'Inscrito deste : '
            end
            object lblSitPart: TLabel
              Left = 9
              Top = 102
              Width = 137
              Height = 13
              Caption = 'Situação na Fundação :'
            end
            object lblBeneficio: TLabel
              Left = 9
              Top = 124
              Width = 137
              Height = 13
              Caption = 'Recebendo Benefício : '
            end
            object lblFalecido: TLabel
              Left = 9
              Top = 146
              Width = 61
              Height = 13
              Caption = 'Falecido : '
            end
            object lblDataTransacao: TLabel
              Left = 9
              Top = 168
              Width = 118
              Height = 13
              Caption = 'Data da Transação :'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Panel2: TPanel
              Left = 576
              Top = 15
              Width = 106
              Height = 177
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object ConsPart1: TConsPart
                Left = 4
                Top = 58
                Width = 91
                Height = 37
                Caption = '&Consulta'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Glyph.Data = {
                  76020000424D7602000000000000760000002800000020000000200000000100
                  0400000000000002000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333300333333
                  3333333333333333333333330033333333333333333333333333333303333330
                  3333333333333333333333330333333033333333333333333333333330333300
                  0333333333333333333333333033330003333333333333333333333330033003
                  3333333333333333333333333003300333333333333333333333333333030033
                  3333333333333333333333333303003333333333333333333333333333000333
                  3333333333333333333333333300033333333333333333330033333333000333
                  3333333333333330003333333300033333333337000733000333333303300003
                  333333000000000333333333033000033333307888EE70333333333330300333
                  33337088888EE073333333333030033333330888888888033333333333000333
                  33330888888888033333333333000333333308E8888888033333333333300333
                  333308EEE888880333333333333003333333307EEE8870333333333333330033
                  3333330088800333333333333333003333333337000733333333333333330033
                  3333333333333333333333333333003333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentFont = False
              end
              object bbtnProcurar: TBitBtn
                Left = 4
                Top = 16
                Width = 91
                Height = 37
                Hint = 'Procurar participante'
                Caption = '&Procurar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = bbtnProcurarClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                  FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                  0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                  870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                  FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                  0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                  DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              end
              object bbtnOpcoes: TBitBtn
                Left = 4
                Top = 100
                Width = 91
                Height = 37
                Hint = 'Verificar Regra de Concessão do Benefício'
                Cancel = True
                Caption = '&Opções'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = bbtnOpcoesClick
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000011000000110000000100
                  040000000000CC00000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                  F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                  0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                  00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                  DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                  0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                  DDDDD0000000}
              end
              object memReserva: TMemo
                Left = 66
                Top = 156
                Width = 53
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Lines.Strings = (
                  'memRese'
                  'rva')
                ParentFont = False
                TabOrder = 2
                Visible = False
              end
            end
          end
          object rdgrpOpPart: TRadioGroup
            Left = 0
            Top = 0
            Width = 684
            Height = 34
            Align = alTop
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              'Titular'
              'Beneficiário')
            ParentFont = False
            TabOrder = 1
          end
        end
        object tblote: TTabSheet
          Caption = 'Em Lote'
          ImageIndex = 1
          OnShow = tbloteShow
          object Label1: TLabel
            Left = 6
            Top = 12
            Width = 223
            Height = 13
            Caption = 'Arquivo texto de seleção de matrículas'
          end
          object btnbuscaarq: TSpeedButton
            Left = 336
            Top = 30
            Width = 23
            Height = 21
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = btnbuscaarqClick
          end
          object Label2: TLabel
            Left = 350
            Top = 55
            Width = 94
            Height = 13
            Caption = 'Plano de Origem'
          end
          object Label19: TLabel
            Left = 6
            Top = 55
            Width = 139
            Height = 13
            Caption = 'Patrocinadora de origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edarqmat: TEdit
            Left = 6
            Top = 28
            Width = 325
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object memdesc: TMemo
            Left = 6
            Top = 100
            Width = 669
            Height = 123
            Alignment = taCenter
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
          end
          object dblkPlanoOrigem: TwwDBLookupCombo
            Left = 350
            Top = 71
            Width = 327
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPLANO'#9'50'#9'NOMEPLANO')
            LookupTable = qryPlanOrigem
            LookupField = 'IDPLANOPREV'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = dblkPlanoOrigemCloseUp
            OnEnter = dblkPlanoOrigemEnter
          end
          object dblkPatroDestino: TwwDBLookupCombo
            Left = 6
            Top = 71
            Width = 327
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome da Patrocinadora'#9'F')
            LookupTable = qryPatro
            LookupField = 'IDPESSOA'
            ParentFont = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dblkPatroDestinoCloseUp
            OnEnter = dblkPatroDestinoEnter
          end
        end
      end
    end
    object TPanel
      Left = 1
      Top = 262
      Width = 694
      Height = 203
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label11: TLabel
        Left = 17
        Top = 97
        Width = 120
        Height = 13
        AutoSize = False
        Caption = 'Informações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object pnlInformacao: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 203
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label10: TLabel
          Left = 11
          Top = 154
          Width = 90
          Height = 13
          Caption = 'Data do Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPatroDest: TLabel
          Left = 292
          Top = 11
          Width = 80
          Height = 13
          Caption = 'Plano Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 292
          Top = 56
          Width = 152
          Height = 13
          Caption = 'Situação no Plano Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 11
          Top = 56
          Width = 182
          Height = 13
          Caption = 'Nova Situação no Plano Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 11
          Top = 11
          Width = 76
          Height = 13
          Caption = 'Plano Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 11
          Top = 104
          Width = 253
          Height = 13
          Caption = 'Nova Situação do Participante na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object chkManterValores: TCheckBox
          Left = 292
          Top = 123
          Width = 299
          Height = 17
          Hint = 
            'Clique aqui se NÃO desejar migrar o titular para o plano de dest' +
            'ino'
          Caption = 'Manter valores dos benefícios de suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Visible = False
        end
        object cbchkCommit: TCheckBox
          Left = 292
          Top = 161
          Width = 299
          Height = 17
          Hint = 
            'Clique aqui se NÃO desejar migrar o titular para o plano de dest' +
            'ino'
          Caption = 'Efetivar migração apenas após demonstrativo'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 8
        end
        object chkSoBeneficiario: TCheckBox
          Left = 292
          Top = 104
          Width = 299
          Height = 17
          Hint = 
            'Clique aqui se NÃO desejar migrar o titular para o plano de dest' +
            'ino'
          Caption = 'Migrar Apenas o Beneficiário Selecionado'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 5
          Visible = False
        end
        object dtEvento: TCMDateTimePicker
          Left = 11
          Top = 167
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
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 4
        end
        object edPlano: TEdit
          Left = 11
          Top = 25
          Width = 264
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object cmbsitdest: TwwDBLookupCombo
          Left = 292
          Top = 69
          Width = 264
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Situação no Plano Destino')
          LookupTable = qrysitplanoprev
          LookupField = 'IDSITPLANOPREV'
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnEnter = cmbsitdestEnter
        end
        object cmbsitorig: TwwDBLookupCombo
          Left = 11
          Top = 69
          Width = 264
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Nova Situação no Plano Origem')
          LookupTable = qrysitplanoprevorigem
          LookupField = 'IDSITPLANOPREV'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnEnter = cmbsitorigEnter
        end
        object dblkpNovoPlano: TwwDBLookupCombo
          Left = 292
          Top = 25
          Width = 264
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPLANO'#9'50'#9'NOMEPLANO'#9'F')
          LookupTable = qryPatroPlano
          LookupField = 'NOMEPLANO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpNovoPlanoCloseUp
          OnEnter = dblkpNovoPlanoEnter
        end
        object btnbeneficios: TBitBtn
          Left = 572
          Top = 42
          Width = 115
          Height = 33
          Caption = 'Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnbeneficiosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
            8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
            0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
            0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
            05555555575FF777755555555500055555555555557775555555}
          NumGlyphs = 2
        end
        object btnDemons: TBitBtn
          Left = 572
          Top = 77
          Width = 115
          Height = 33
          Caption = 'Demonstrativos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = btnDemonsClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
            000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
            FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
            FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
            0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
            05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
            55557F7777777555555500000005555555557777777555555555}
          NumGlyphs = 2
        end
        object pgbar: TProgressBar
          Left = 1
          Top = 191
          Width = 692
          Height = 11
          Align = alBottom
          Min = 0
          Max = 100
          TabOrder = 12
          Visible = False
        end
        object bbtnContribuicoes: TBitBtn
          Left = 572
          Top = 7
          Width = 115
          Height = 33
          Caption = 'Contribuições'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          Visible = False
          OnClick = bbtnContribuicoesClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
            8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
            0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
            0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
            05555555575FF777755555555500055555555555557775555555}
          NumGlyphs = 2
        end
        object chkManterInss: TCheckBox
          Left = 292
          Top = 142
          Width = 299
          Height = 17
          Hint = 
            'Clique aqui se NÃO desejar migrar o titular para o plano de dest' +
            'ino'
          Caption = 'Manter valores do benefício do INSS'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 7
          Visible = False
        end
        object cmbSitPartDest: TwwDBLookupCombo
          Left = 11
          Top = 117
          Width = 264
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Nova Situação do Participante na Fundação'#9'F')
          LookupTable = qrySitPartDestino
          LookupField = 'IDSITPART'
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnEnter = cmbSitPartDestEnter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 466
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 524
      DockPos = 699
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 251
      DockPos = 424
      inherited ToolbarSep971: TToolbarSep97
        Left = 91
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 185
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 91
        Caption = '&Transferir'
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 188
        Enabled = False
        ModalResult = 0
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
          77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
          07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
      end
      object btnEfetivar: TBitBtn
        Left = 94
        Top = 0
        Width = 91
        Height = 33
        Caption = '&Efetivar'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = btnEfetivarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
          77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
          07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
      end
    end
    object btnDesfazer: TBitBtn
      Left = 9
      Top = 2
      Width = 91
      Height = 33
      Caption = '&Desfazer'
      Default = True
      Enabled = False
      TabOrder = 2
      OnClick = btnDesfazerClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  object tbdockDemons: TToolWindow97 [2]
    Left = -441
    Top = 481
    ActivateParent = False
    Caption = 'Demonstrativos'
    ClientAreaHeight = 435
    ClientAreaWidth = 660
    DockableTo = []
    DockPos = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MinClientHeight = 25
    ParentFont = False
    Resizable = False
    TabOrder = 2
    Visible = False
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 660
      Height = 435
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTextoFluxOper'
      TabOrder = 0
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 660
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object Panel6: TPanel
        Left = 0
        Top = 4
        Width = 660
        Height = 431
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel7: TPanel
          Left = 2
          Top = 388
          Width = 656
          Height = 41
          Align = alBottom
          TabOrder = 0
          object BitBtn2: TBitBtn
            Left = 536
            Top = 6
            Width = 80
            Height = 28
            Cancel = True
            Caption = '&Sair'
            TabOrder = 0
            OnClick = BitBtn2Click
            Glyph.Data = {
              F6010000424DF601000000000000760000002800000030000000100000000100
              0400000000008001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
              8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
              FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
              8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
              6087777770F8F0E6608777777066666668777777007770E660877777007770E6
              608777777066666668777777007770E660877777007770E66087777770666666
              68777788060770E760877788060770E76087777770666666687770000E6070E0
              608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
              608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
              687770000E6070E6608770000E6070E6608777777066666668777777060770E6
              60877777060770E66087777770666666687777770077770E608777770077770E
              60877777706666666877777770777770E087777770777770E087777770666666
              687777777000000000777777700000000077777770EEEEEEE877}
            NumGlyphs = 3
            Spacing = 2
          end
          object bbtnSalvar: TBitBtn
            Left = 367
            Top = 6
            Width = 80
            Height = 28
            Hint = 'Salvar a Consulta como arquivo'
            Caption = '&Salvar'
            Default = True
            ModalResult = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
              00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
              00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
              00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
              0003737FFFFFFFFF7F7330099999999900333777777777777733}
            NumGlyphs = 2
            Spacing = 2
          end
          object bbtnImprimir: TBitBtn
            Left = 452
            Top = 6
            Width = 80
            Height = 28
            Hint = 'Imprimir a Consulta'
            Caption = '&Imprimir'
            Default = True
            ModalResult = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = bbtnImprimirClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
              8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
              8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
              8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
            Spacing = 2
          end
        end
        object pgMem: TPageControl
          Left = 2
          Top = 2
          Width = 656
          Height = 386
          ActivePage = tbErros
          Align = alClient
          TabOrder = 1
          object tbErros: TTabSheet
            Caption = 'Erros'
            object memErros: TRichEdit
              Left = 0
              Top = 0
              Width = 648
              Height = 358
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object tbMem: TTabSheet
            Caption = 'Demonstrativo de cálculo'
            ImageIndex = 1
            object memResult: TRichEdit
              Left = 0
              Top = 0
              Width = 648
              Height = 358
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
          end
        end
      end
    end
  end
  object tb97Param: TToolWindow97 [3]
    Left = 26
    Top = 44
    ActivateParent = False
    Caption = 'Benefícios'
    ClientAreaHeight = 435
    ClientAreaWidth = 668
    DockableTo = []
    DockPos = 0
    MinClientHeight = 25
    Resizable = False
    TabOrder = 3
    Visible = False
    object pnlTextoFluxOper: TPanel
      Left = 0
      Top = 0
      Width = 668
      Height = 435
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTextoFluxOper'
      TabOrder = 0
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 668
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object pnlparam: TPanel
        Left = 0
        Top = 4
        Width = 668
        Height = 431
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel3: TPanel
          Left = 2
          Top = 388
          Width = 664
          Height = 41
          Align = alBottom
          TabOrder = 2
          object BitBtn1: TBitBtn
            Left = 518
            Top = 7
            Width = 80
            Height = 28
            Cancel = True
            Caption = '&Sair'
            TabOrder = 0
            OnClick = BitBtn1Click
            Glyph.Data = {
              F6010000424DF601000000000000760000002800000030000000100000000100
              0400000000008001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
              8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
              FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
              8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
              6087777770F8F0E6608777777066666668777777007770E660877777007770E6
              608777777066666668777777007770E660877777007770E66087777770666666
              68777788060770E760877788060770E76087777770666666687770000E6070E0
              608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
              608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
              687770000E6070E6608770000E6070E6608777777066666668777777060770E6
              60877777060770E66087777770666666687777770077770E608777770077770E
              60877777706666666877777770777770E087777770777770E087777770666666
              687777777000000000777777700000000077777770EEEEEEE877}
            NumGlyphs = 3
            Spacing = 2
          end
        end
        object grpbxvlraceite: TGroupBox
          Left = 2
          Top = 337
          Width = 664
          Height = 50
          Align = alTop
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 8
            Top = 8
            Width = 272
            Height = 13
            Caption = 'Indique o Lote para Pagamento dos Benefícios '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 351
            Top = 9
            Width = 203
            Height = 13
            Caption = 'Nova DIP (benefícios já existentes)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkpcmbLote: TwwDBLookupCombo
            Left = 8
            Top = 27
            Width = 137
            Height = 19
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'IDLOTE'#9'10'#9'Código'#9'F'
              'MESREFERENCIA'#9'7'#9'Mês'#9'F'
              'DESCRICAO'#9'50'#9'Descrição do Lote'#9'F')
            LookupTable = qryLote
            LookupField = 'IDLOTE'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = dblkpcmbLoteCloseUp
            OnEnter = dblkpcmbLoteEnter
          end
          object dtNovaDib: TCMDateTimePicker
            Left = 351
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
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 2
          Width = 664
          Height = 97
          Cursor = crNo
          Align = alTop
          Caption = 'Benefícios não associados para nova concessão '
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object lstbenefnconcedidos: TDBLookupListBox
            Left = 2
            Top = 15
            Width = 660
            Height = 69
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'IDBENEFICIO'
            ListField = 'NOME'
            ListSource = dsbenefnaoconcedidos
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 2
          Top = 138
          Width = 664
          Height = 199
          Cursor = crNo
          Align = alTop
          Caption = 'Benefícios para concessão '
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          object pnlopcoesbenef: TPanel
            Left = 2
            Top = 128
            Width = 660
            Height = 69
            Align = alBottom
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 0
            object lblvalorbase1: TLabel
              Left = 147
              Top = 11
              Width = 64
              Height = 13
              Caption = 'Valorbase1'
            end
            object lblvalorbase2: TLabel
              Left = 147
              Top = 31
              Width = 64
              Height = 13
              Caption = 'Valorbase2'
            end
            object lblvalorbase3: TLabel
              Left = 147
              Top = 51
              Width = 64
              Height = 13
              Caption = 'Valorbase3'
            end
            object Label24: TLabel
              Left = 359
              Top = 5
              Width = 111
              Height = 13
              Caption = 'Regra de correção '
            end
            object Bevel4: TBevel
              Left = 344
              Top = 4
              Width = 4
              Height = 62
            end
            object rdedvalorbase1: TDBRealEdit
              Left = 224
              Top = 5
              Width = 86
              Height = 19
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 0
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORBASE1'
              DataSource = dsbeneficios
            end
            object rdedvalorbase2: TDBRealEdit
              Left = 224
              Top = 25
              Width = 86
              Height = 19
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 1
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORBASE2'
              DataSource = dsbeneficios
            end
            object rdedvalorbase3: TDBRealEdit
              Left = 224
              Top = 45
              Width = 86
              Height = 19
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 2
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORBASE3'
              DataSource = dsbeneficios
            end
            object edOpcao1: TcmMaskEditDlg
              Left = 12
              Top = 5
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnChange = edOpcao1Change
              OnBtnClick = edOpcao1BtnClick
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao2: TcmMaskEditDlg
              Left = 12
              Top = 25
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnChange = edOpcao2Change
              OnBtnClick = edOpcao2BtnClick
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao3: TcmMaskEditDlg
              Left = 12
              Top = 45
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnChange = edOpcao3Change
              OnBtnClick = edOpcao3BtnClick
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object dblkpcmbRegraParcela: TwwDBLookupCombo
              Left = 359
              Top = 19
              Width = 291
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F'
                'IDREGRA'#9'10'#9'Código'#9'F')
              LookupTable = qryRegraParcela
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object wwDBGrid1: TwwDBGrid
            Left = 2
            Top = 15
            Width = 660
            Height = 93
            Selected.Strings = (
              'NOMEANT'#9'49'#9'Benefício origem'#9'F'
              'SETA'#9'3'#9'  '#9'F'
              'NOME'#9'46'#9'Benefício destino'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsbeneficios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel8: TPanel
            Left = 2
            Top = 108
            Width = 660
            Height = 20
            Align = alBottom
            BevelOuter = bvLowered
            Caption = 
              'Os valores de opções digitados servirão para sobreescrever os va' +
              'lores anteriores de todas os pessoas transferidas'
            TabOrder = 2
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 99
          Width = 664
          Height = 39
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object btnRetirar: TSpeedButton
            Left = 347
            Top = 10
            Width = 76
            Height = 28
            Caption = 'Retirar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777777777700077770000077770007777066607777000777706660777
              7000777706660777700070000666000070007706666666077000777066666077
              7000777706660777700077777060777770007777770777777000777777777777
              7000}
            ParentFont = False
            OnClick = btnRetirarClick
          end
          object SpeedButton2: TSpeedButton
            Left = 215
            Top = 10
            Width = 76
            Height = 28
            Caption = 'Incluir'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777777777700077777707777770007777706077777000777706660777
              7000777066666077700077066666660770007000066600007000777706660777
              7000777706660777700077770666077770007777000007777000777777777777
              7000}
            ParentFont = False
            OnClick = SpeedButton2Click
          end
        end
      end
    end
  end
  object tb97Contrib: TToolWindow97 [4]
    Left = -387
    Top = 437
    ActivateParent = False
    Caption = 'Contribuições'
    ClientAreaHeight = 270
    ClientAreaWidth = 679
    DockableTo = []
    DockPos = 0
    MinClientHeight = 25
    Resizable = False
    TabOrder = 4
    Visible = False
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 679
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTextoFluxOper'
      TabOrder = 0
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 679
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object Panel10: TPanel
        Left = 0
        Top = 4
        Width = 679
        Height = 266
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel11: TPanel
          Left = 2
          Top = 223
          Width = 675
          Height = 41
          Align = alBottom
          TabOrder = 0
          object bbtnSairContrib: TBitBtn
            Left = 518
            Top = 7
            Width = 80
            Height = 28
            Cancel = True
            Caption = '&Sair'
            TabOrder = 0
            OnClick = bbtnSairContribClick
            Glyph.Data = {
              F6010000424DF601000000000000760000002800000030000000100000000100
              0400000000008001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
              8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
              FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
              8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
              6087777770F8F0E6608777777066666668777777007770E660877777007770E6
              608777777066666668777777007770E660877777007770E66087777770666666
              68777788060770E760877788060770E76087777770666666687770000E6070E0
              608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
              608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
              687770000E6070E6608770000E6070E6608777777066666668777777060770E6
              60877777060770E66087777770666666687777770077770E608777770077770E
              60877777706666666877777770777770E087777770777770E087777770666666
              687777777000000000777777700000000077777770EEEEEEE877}
            NumGlyphs = 3
            Spacing = 2
          end
        end
        object GroupBox6: TGroupBox
          Left = 2
          Top = 2
          Width = 675
          Height = 199
          Cursor = crNo
          Align = alTop
          Caption = ' Contribuições a serem associadas ...'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object Panel12: TPanel
            Left = 2
            Top = 128
            Width = 671
            Height = 69
            Align = alBottom
            Alignment = taRightJustify
            BevelOuter = bvLowered
            TabOrder = 0
            object dbedNomeOpcao1Contrib: TDBText
              Left = 141
              Top = 7
              Width = 376
              Height = 17
              DataField = 'NOMEVALORBASE1'
              DataSource = dsContribuicoes
            end
            object dbedNomeOpcao2Contrib: TDBText
              Left = 141
              Top = 27
              Width = 376
              Height = 17
              DataField = 'NOMEVALORBASE2'
              DataSource = dsContribuicoes
            end
            object dbedNomeOpcao3Contrib: TDBText
              Left = 141
              Top = 47
              Width = 376
              Height = 17
              DataField = 'NOMEVALORBASE3'
              DataSource = dsContribuicoes
            end
            object edOpcao1Contrib: TcmMaskEditDlg
              Left = 12
              Top = 5
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao2Contrib: TcmMaskEditDlg
              Left = 12
              Top = 25
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edOpcao3Contrib: TcmMaskEditDlg
              Left = 12
              Top = 45
              Width = 126
              Height = 21
              Hint = 'Clique no botão à direita para calcular o valor do benefício'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              BtnGlyph.Data = {
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
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
          end
          object dbgrdContribAssoc: TwwDBGrid
            Left = 2
            Top = 15
            Width = 671
            Height = 93
            Selected.Strings = (
              'IDCONTRIBUICAO'#9'10'#9'Cód.'
              'NOME'#9'60'#9'Contribuição'
              'VALORBASE1'#9'10'#9'Opção 1'
              'VALORBASE2'#9'10'#9'Opção 2'
              'VALORBASE3'#9'10'#9'Opção 3')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContribuicoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel13: TPanel
            Left = 2
            Top = 108
            Width = 671
            Height = 20
            Align = alBottom
            BevelOuter = bvLowered
            Caption = 
              'Os valores de opções digitados servirão para sobreescrever os va' +
              'lores anteriores de todas os pessoas transferidas'
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 116
    Top = 324
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITPLANOPREV'
      'SITPART'
      'SITFUNC')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'SITPLANOPREV.IDSITPLANOPREV'
      'SITPLANOPREV.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITFUNC.DESCRICAO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO'
      'PARTPREVPLAN.SALPARTICIPACAO'
      'PARTPREVPLAN.SALMANTIDO'
      'PARTPREVPLAN.IDSITPART'
      'ELEGPATRO.IDSITFUNC'
      'PARTPREVPLAN.FLGDESATIVADO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA      = PARTPREVPLAN.IDPESSOA'
      'PATRO.IDPESSOA       = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSJUR  = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSOA   = PARTPREVPLAN.IDPESSOA'
      'PLANPREV.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV'
      'SITPLANOPREV.IDSITPLANOPREV = PARTPREVPLAN.IDSITPLANOPREV'
      'SITPART.IDSITPART    = PARTPREVPLAN.IDSITPART'
      'SITFUNC.IDSITFUNC    = ELEGPATRO.IDSITFUNC')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
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
    Left = 249
    Top = 67
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 80
    Top = 348
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 153
    Top = 292
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 669
    Top = 320
  end
  object regracalc: TRegra
    QueryIn = qryAux
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 234
    Top = 388
  end
  object qrydet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.NUMEROPROCESSO,    BF.IDPESSJUR,       BF.IDPLANOPREV,' +
        ' BF.IDPLANOORIGEM,'
      '       BF.IDTITULAR,         BF.IDBENEFREFEREN,'
      '       BF.IDPESSOA,          BF.SEQPROPOSTA,     BF.IDBENEFICIO,'
      
        '       BF.CODPORTFORMA,      BF.IDSITBENEFICIO,  BF.IDDEPENDENCI' +
        'A,'
      
        '       BF.IDTPPAGTOBENEFIC,  BF.VALORATUAL,      BF.DATAREQUERIM' +
        'ENTO,'
      '       BF.DATAINICIO,        BF.DATAFINAL,'
      
        '       BF.FLGFORMAPAGTO,     BF.VALORCALCULADO,  BF.DATAULTREAJU' +
        'STE,'
      
        '       BF.VLRCALCINSS,       BF.VLRINFINSS,      BF.DATAINICIOIN' +
        'SS,'
      '       BF.NUMPROCINSS,       BF.DATAINICIOFUND,  BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,        BF.DATACONCESSAO,   BF.FLGPROVISORI' +
        'O,'
      
        '       BF.PERCPROVISORIO,    BF.PRAZOPROVISORIO, BF.ULTMESREAJUS' +
        'TE,'
      
        '       BF.ULTVALORATUALREAJ, BF.IDAGENCIARESGATE,B.NUMORDEMEVENT' +
        'O,'
      '       BF.DIBBENEFANT,       BF.VALORBENEFANT,'
      
        '       BF.VALORBINSSANT1,    BF.VALORBINSSANT2, BF.VALORBINSSANT' +
        '3,'
      
        '       BF.FLGBENEFMIN,       BF.VALORSRB,       NVL(BF.VALORNADI' +
        'B,0) VALORNADIB,'
      
        '       BF.CODPORTFORMA,   BF.FLGDATAPREVISTA,   B.NOME, S.DESCRI' +
        'CAO,'
      '       B.FLGRESGATE,         BF.VALORBASE1,   BF.VALORBASE2,'
      '       BF.VALORBASE3,     P.NOME DEPEN, BTIT.IDRESPONSAVEL,'
      
        '       BF.FLGTIPOINSS  , B.FLGPECULIO, BPL.IDREGRACALCULO, BPL.I' +
        'DREGRAPAGAMENTO,'
      
        '       BF.IDPLANOPREV , BF.FLGPOSSUIACOMPINSS, BF.DATAFINALPREVI' +
        'STA, BTIT.PERCENTUAL,'
      
        '       BPL.IDREGRAPRIMPAGTO, BPL.IDREGRAULTPAGTO, BPL.FLGCALCTOD' +
        'OMES,'
      '       BPL.FLGREFERENCIA'
      
        'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL, SITBENE' +
        'FICIO S,'
      '       BENEFPLANOPART BPART, BFCIARIOTITPLAN BTIT, PESSOA P'
      'WHERE  BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    BF.IDTITULAR = :IDTITULAR'
      'AND    BF.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    P.IDPESSOA = BF.IDPESSOA'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.FLGREFERENCIA = 0'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BTIT.IDTITULAR'
      'AND    BF.IDPESSJUR      = BTIT.IDPESSJUR'
      'AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV'
      'AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM'
      'AND    BF.IDPESSOA       = BTIT.IDPESSOA'
      'AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO'
      'AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA'
      'ORDER BY B.NUMORDEMEVENTO '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 190
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qrymov: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 109
    Top = 302
  end
  object qrysitplanoprev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO , IDSITPLANOPREV'
      'FROM SITPLANOPREV'
      'WHERE FLGINTERNO <> '#39'TR'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 614
    Top = 417
  end
  object qrysitplanoprevorigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      ''
      'FROM SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE '
      'SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 597
    Top = 380
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryPatroPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV, P.NOME AS NOMEPATRO,'
      
        '       PL.NOME AS NOMEPLANO, PL.FLGAUTONUMINSC, PL.NUMINSCINICIA' +
        'L,'
      '       PL.IDREGRATRANSFPLA , PL.IDREGRATRANSFPLA'
      'FROM   PESSOA P, PLANPREVPATRO PLP,  PLANPREV PL'
      'WHERE  PLP.IDPESSJUR = P.IDPESSOA'
      'AND    PLP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    PLP.IDPESSJUR = :IDPESSJUR'
      'ORDER BY  P.NOME, PL.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 91
    Top = 422
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 664
    Top = 391
  end
  object qryParticipanteOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MAX(CPP.ULTMESPREPARO) AS ULTMESPREPARO, PP.IDPESSJUR, PP' +
        '.IDPLANOPREV,'
      
        '       PP.IDPESSOA, PP.SEQPROPOSTA, PP.INSCRICAODATA, PP.DTINICI' +
        'OINSC,'
      
        '       DECODE(SP.FLGINTERNO,'#39'AT'#39',PP.SALPARTICIPACAO, PP.SALMANTI' +
        'DO) AS SALARIO,'
      '       PFN.INSCRICAODATA AS INSCRICAODATAFUND '
      
        'FROM   PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, SITPART SP, PESSOA' +
        'XFUND PFN'
      'WHERE  CPP.IDPESSJUR = :IDPESSJUR'
      'AND    CPP.IDPLANOPREV = :IDPLANOPREV'
      'AND    CPP.IDPESSOA    = :IDPESSOA'
      'AND    CPP.SEQPROPOSTA   = :SEQPROPOSTA'
      'AND    CPP.IDPESSJUR = PP.IDPESSJUR'
      'AND    CPP.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    CPP.IDPESSOA    = PP.IDPESSOA'
      'AND    CPP.SEQPROPOSTA = PP.SEQPROPOSTA'
      'AND    PP.IDSITPART    = SP.IDSITPART'
      'AND    PP.IDPESSOA     = PFN.IDPESSOA'
      'AND    PFN.IDFUNDACAO  = :IDFUNDACAO'
      
        'AND    CPP.IDCONTRIBUICAO NOT IN (SELECT PD.IDCONTRIBUICAO FROM ' +
        'PARAMDOTACAO PD'
      
        '                                  WHERE PD.IDPLANOPREV = :IDPLAN' +
        'OPREV'
      
        '                                  AND   PD.IDPESSJUR   = :IDPESS' +
        'JUR)'
      
        'GROUP BY PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOS' +
        'TA,'
      
        '         PP.INSCRICAODATA, PP.DTINICIOINSC, SP.FLGINTERNO, PP.SA' +
        'LPARTICIPACAO,'
      '         PP.SALMANTIDO, PFN.INSCRICAODATA'
      '')
    ValidateWithMask = True
    Left = 44
    Top = 387
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE, N' +
        'VL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC'
      'FROM   CTRLINTERFACE C'
      'WHERE  C.FLGPREPARADO = 1'
      'AND    C.TIPO = '#39'B'#39
      'AND    C.FLGCONCESSAO =1'
      'AND    C.FLGIDATMP = 0'
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO'
      ''
      '')
    ValidateWithMask = True
    Left = 170
    Top = 379
  end
  object qryDadosNoPlanoOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PP.IDPESSJUR, PP.IDPLANOPREV, BF.IDPESSOA, BF.IDTITULAR,      ' +
        ' PP.SEQPROPOSTA,'
      
        '  DP.MATRICULA, SPART.FLGINTERNO SITUACAO, P.NOME NOMEPARTICIP, ' +
        'PF.SEXO, PF.ESTCIVIL,'
      
        '  PF.DATANASC,EL.DATAADMISSAO, PP.INSCRICAODATA , PP.INSCRICAONU' +
        'MERO,'
      '  EL.SALTOTAL, PP.SALPARTICIPACAO, 0 AS VALORESPERADO,'
      '  EL.TEMPOSERVCALC, SP.DESCRICAO, B.NOME NOMEBENEFICIO,'
      '  BF.VALORSRB,'
      
        '  TO_CHAR(BF.DATAINICIOFUND,'#39'DD/MM/YYYY'#39') AS DATAINICIOFUND, BF.' +
        'VALORATUAL, BF.VLRINFINSS,'
      
        '  BF.IDBENEFICIO, PF.DATAMORTE, EL.DATADEMISSAO,  SPART.IDSITPAR' +
        'T,'
      '  PATRO.NOME NOMEPATRO, PL.NOME NOMEPLANO,  BTP.IDNUCLEOFAMILIAR'
      'FROM'
      
        '  PESSOA P,      PESSOAFISICA PF,  ELEGPATRO EL, PARTPREVPLAN PP' +
        ','
      
        '  DEPENTIT DP,   BENEFBFCIARIO BF, BENEFICIO B,  SITPLANOPREV SP' +
        ','
      
        '  SITPART SPART, PESSOA PATRO,     PLANPREV PL,  BFCIARIOTITPLAN' +
        ' BTP'
      'WHERE'
      '      BF.IDPESSJUR     = :IDPESSJUR'
      'AND   BF.IDPLANOPREV   = :IDPLANOPREV'
      'AND   BF.IDTITULAR     = :IDTITULAR'
      'AND   BF.IDPESSOA      = :IDPESSOA'
      'AND   BF.SEQPROPOSTA   = :SEQPROPOSTA'
      
        'AND   ( (:ENCERRADOS = 0 AND BF.IDSITBENEFICIO IN (1,2) ) OR (:E' +
        'NCERRADOS = 1 AND BF.IDSITBENEFICIO IN (3)) )'
      'AND   PP.IDPESSJUR      = BF.IDPESSJUR'
      'AND   PP.IDPESSOA       = BF.IDTITULAR'
      'AND   PP.IDPLANOPREV    = BF.IDPLANOORIGEM'
      'AND   EL.IDPESSJUR      = PP.IDPESSJUR'
      'AND   EL.IDPESSOA       = PP.IDPESSOA'
      'AND   PF.IDPESSOA       = BF.IDPESSOA'
      'AND   P.IDPESSOA        = BF.IDPESSOA'
      'AND   PATRO.IDPESSOA    = BF.IDPESSJUR'
      'AND   PL.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND   SP.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      'AND   BF.IDTITULAR      = DP.IDTITULAR'
      'AND   BF.IDPESSOA       = DP.IDPESSOA'
      'AND   BF.IDBENEFICIO    = B.IDBENEFICIO'
      'AND   SPART.IDSITPART   = PP.IDSITPART'
      ''
      'AND   BF.IDPESSJUR      = BTP.IDPESSJUR'
      'AND   BF.IDTITULAR      = BTP.IDTITULAR'
      'AND   BF.IDPLANOORIGEM  = BTP.IDPLANOORIGEM'
      'AND   BF.IDPLANOPREV    = BTP.IDPLANOPREV'
      'AND   BF.IDPESSOA       = BTP.IDPESSOA'
      'AND   BF.IDBENEFICIO    = BTP.IDBENEFICIO'
      'AND   BF.SEQPROPOSTA    = BTP.SEQPROPOSTA'
      ''
      'UNION'
      ''
      'SELECT'
      
        '  PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.IDPESSOA IDTITUL' +
        'AR, PP.SEQPROPOSTA,'
      
        '  EL.MATRICULA, SP.FLGINTERNO SITUACAO, P.NOME NOMEPARTICIP, PF.' +
        'SEXO, PF.ESTCIVIL,'
      
        '  PF.DATANASC,  EL.DATAADMISSAO,    PP.INSCRICAODATA, PP.INSCRIC' +
        'AONUMERO,'
      '  EL.SALTOTAL,  PP.SALPARTICIPACAO, 0 AS VALORESPERADO,'
      '  EL.TEMPOSERVCALC, SP.DESCRICAO, '#39' '#39' NOMEBENEFICIO, 0 VALORSRB,'
      '  '#39'          '#39' DATAINICIOFUND, 0 VALORATUAL, 0 VLRINFINSS,'
      '  0 IDBENEFICIO, PF.DATAMORTE, EL.DATADEMISSAO, SP.IDSITPART,'
      
        '  PATRO.NOME NOMEPATRO, PL.NOME NOMEPLANO,  0 AS IDNUCLEOFAMILIA' +
        'R'
      'FROM'
      '  PESSOA P,   PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP,'
      '  SITPART SP, PESSOA PATRO,    PLANPREV PL'
      'WHERE'
      '      PP.IDPESSJUR     = :IDPESSJUR'
      'AND   PP.IDPLANOPREV   = :IDPLANOPREV'
      'AND   PP.IDPESSOA      = :IDPESSOA'
      'AND   PP.SEQPROPOSTA   = :SEQPROPOSTA'
      'AND   EL.IDPESSJUR     = PP.IDPESSJUR'
      'AND   EL.IDPESSOA      = PP.IDPESSOA'
      'AND   PATRO.IDPESSOA =   PP.IDPESSJUR'
      'AND   PL.IDPLANOPREV =   PP.IDPLANOPREV'
      'AND   PF.IDPESSOA      = PP.IDPESSOA'
      'AND   P.IDPESSOA       = PP.IDPESSOA'
      'AND   SP.IDSITPART     = PP.IDSITPART'
      'ORDER BY'
      '  IDBENEFICIO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 427
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ENCERRADOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENCERRADOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante Titular'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOAFISICA'
      'DEPENTIT'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'BENEFBFCIARIO'
      'PESSOA PATRO'
      'PLANPREV'
      'SITPLANOPREV'
      'SITPART'
      'SITFUNC')
    CamposChave.Strings = (
      'DEPENTIT.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'SITPLANOPREV.IDSITPLANOPREV'
      'SITPLANOPREV.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITFUNC.DESCRICAO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      #39'AS'#39' AS FLGINTERNO'
      'PARTPREVPLAN.SALPARTICIPACAO'
      'PARTPREVPLAN.SALMANTIDO'
      'PARTPREVPLAN.IDSITPART'
      'ELEGPATRO.IDSITFUNC'
      'PARTPREVPLAN.FLGDESATIVADO'
      'ELEGPATRO.IDPESSOA')
    Filtro.Strings = (
      ' BENEFBFCIARIO.IDPESSOA = PESSOA.IDPESSOA  '
      ' BENEFBFCIARIO.IDPESSOA <> BENEFBFCIARIO.IDTITULAR  '
      ' PESSOAFISICA.IDPESSOA = BENEFBFCIARIO.IDTITULAR  '
      ' TRUNC(NVL(PESSOAFISICA.DATAMORTE,SYSDATE)) < TRUNC(SYSDATE) '
      ' PARTPREVPLAN.IDPESSJUR = BENEFBFCIARIO.IDPESSJUR  '
      ' PARTPREVPLAN.IDPESSOA = BENEFBFCIARIO.IDTITULAR  '
      ' ELEGPATRO.IDPESSJUR  = PARTPREVPLAN.IDPESSJUR  '
      ' ELEGPATRO.IDPESSOA   = PARTPREVPLAN.IDPESSOA  '
      ' DEPENTIT.IDPESSOA = BENEFBFCIARIO.IDPESSOA  '
      ' DEPENTIT.IDTITULAR = BENEFBFCIARIO.IDTITULAR  '
      ' PATRO.IDPESSOA       = PARTPREVPLAN.IDPESSJUR  '
      ' PLANPREV.IDPLANOPREV = BENEFBFCIARIO.IDPLANOPREV '
      ' SITPLANOPREV.IDSITPLANOPREV = PARTPREVPLAN.IDSITPLANOPREV  '
      ' SITPART.IDSITPART    = PARTPREVPLAN.IDSITPART  '
      ' SITFUNC.IDSITFUNC    = ELEGPATRO.IDSITFUNC ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 365
    Top = 126
  end
  object qrybeneficios: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPLANOPREV,  IDBENEFICIO,'
      
        #39'PERChshshshshshshshshshshshshshshshshshsh'#39' AS NOMEVALORBASE1, 1' +
        '000000.0000000 VALORBASE1,'
      
        #39'PERChshshshshshshshshshshshshshshshshshsh'#39' AS NOMEVALORBASE2, 1' +
        '000000.0000000 VALORBASE2,'
      
        #39'PERChshshshshshshshshshshshshshshshshshsh'#39' AS NOMEVALORBASE3, 1' +
        '000000.0000000 VALORBASE3,'
      #39'DESTINOhshshshshshshshshshshshshshshshshs'#39' AS NOME,'
      #39'ORIGEMhshshshshshshshshshshshshshshshshsh'#39' AS NOMEANT,'
      '66 IDBENEFORIGEM, 99 IDTPPAGTOBENEFIC,'
      #39' > '#39' SETA, 99 IDEVENTOGERADOR,'
      '0 AS IDREGRACALCOP1,0 AS IDREGRACALCOP2,0 AS IDREGRACALCOP3,'
      
        '0 IDRGCALCBENEFICIO, '#39'Beneficiário'#39' DESTINOPAG, 0 IDPLANPREVCONT' +
        'AB,'
      'TO_DATE('#39'00/00/0000'#39', '#39'DD/MM/YYYY'#39') AS DATAINICIOANT,'
      '0 AS FLGREFERENCIA , 0 AS IDREGRAFIM'
      'FROM BENEFPLANPREV'
      'WHERE'
      '  IDPLANOPREV = 999 AND IDBENEFICIO = 999'
      ''
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 90
    Top = 56
    object qrybeneficiosNOMEANT: TStringField
      DisplayLabel = 'Benefício origem'
      DisplayWidth = 49
      FieldName = 'NOMEANT'
      FixedChar = True
      Size = 60
    end
    object qrybeneficiosSETA: TStringField
      DisplayLabel = '  '
      DisplayWidth = 3
      FieldName = 'SETA'
      FixedChar = True
      Size = 3
    end
    object qrybeneficiosNOME: TStringField
      DisplayLabel = 'Benefício destino'
      DisplayWidth = 46
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qrybeneficiosIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qrybeneficiosIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qrybeneficiosVALORBASE1: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object qrybeneficiosVALORBASE2: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
      Visible = False
    end
    object qrybeneficiosVALORBASE3: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
      Visible = False
    end
    object qrybeneficiosIDBENEFORIGEM: TFloatField
      FieldName = 'IDBENEFORIGEM'
      Visible = False
    end
    object qrybeneficiosIDTPPAGTOBENEFIC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object qrybeneficiosNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Visible = False
      FixedChar = True
      Size = 41
    end
    object qrybeneficiosNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Visible = False
      FixedChar = True
      Size = 41
    end
    object qrybeneficiosNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Visible = False
      FixedChar = True
      Size = 41
    end
    object qrybeneficiosIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
      Visible = False
    end
    object qrybeneficiosIDREGRACALCOP1: TFloatField
      FieldName = 'IDREGRACALCOP1'
      Visible = False
    end
    object qrybeneficiosIDREGRACALCOP2: TFloatField
      FieldName = 'IDREGRACALCOP2'
      Visible = False
    end
    object qrybeneficiosIDREGRACALCOP3: TFloatField
      FieldName = 'IDREGRACALCOP3'
      Visible = False
    end
    object qrybeneficiosIDRGCALCBENEFICIO: TFloatField
      FieldName = 'IDRGCALCBENEFICIO'
      Visible = False
    end
    object qrybeneficiosDESTINOPAG: TStringField
      FieldName = 'DESTINOPAG'
      Visible = False
      FixedChar = True
      Size = 12
    end
    object qrybeneficiosIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
    object qrybeneficiosDATAINICIOANT: TDateTimeField
      FieldName = 'DATAINICIOANT'
      Visible = False
    end
    object qrybeneficiosFLGREFERENCIA: TFloatField
      FieldName = 'FLGREFERENCIA'
      Visible = False
    end
    object qrybeneficiosIDREGRAFIM: TFloatField
      FieldName = 'IDREGRAFIM'
      Visible = False
    end
  end
  object dsbeneficios: TwwDataSource
    DataSet = CdsBeneficiosParaConcessao
    Left = 122
    Top = 55
  end
  object qrybenefnaoconcedidos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BF.IDPLANOPREV,    B.IDBENEFICIO ,    BF.FLGREFERENCIA,'
      '  BF.NOMEVALORBASE1, BF.NOMEVALORBASE2, BF.NOMEVALORBASE3,'
      '  B.NOME ,           B.IDTPPAGTOBENEFIC,'
      '  BF.FLGREFERENCIA'
      'FROM'
      '  BENEFICIO B , BENEFPLANPREV BF'
      'WHERE'
      '  B.IDBENEFICIO = BF.IDBENEFICIO AND'
      '  BF.IDPLANOPREV = 66'
      'ORDER BY'
      '  B.NOME            '
      ' ')
    ValidateWithMask = True
    Left = 548
    Top = 177
  end
  object dsbenefnaoconcedidos: TwwDataSource
    AutoEdit = False
    DataSet = qrybenefnaoconcedidos
    Left = 508
    Top = 153
  end
  object updbeneficios: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFPLANPREV'
      'set'
      'IDPLANOPREV = :IDPLANOPREV,'
      'IDBENEFICIO = :IDBENEFICIO, '
      'NOMEVALORBASE1 = :NOMEVALORBASE1,  '
      'VALORBASE1 = :VALORBASE1,'
      'NOMEVALORBASE2 = :NOMEVALORBASE2,  '
      'VALORBASE2 = :VALORBASE2,'
      'NOMEVALORBASE3 = :NOMEVALORBASE3,  '
      'VALORBASE3 =:VALORBASE3,'
      'NOME =:NOME,'
      'NOMEANT = :NOMEANT,'
      'IDBENEFORIGEM = :IDBENEFORIGEM,'
      'IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      'IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      'IDREGRACALCOP1 = :IDREGRACALCOP1 , '
      'IDREGRACALCOP2 = :IDREGRACALCOP2 , '
      'IDREGRACALCOP3 = :IDREGRACALCOP3 ,'
      'IDPLANPREVCONTAB = :IDPLANPREVCONTAB'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV  and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFPLANPREV'
      '  ( IDPLANOPREV, IDBENEFICIO, '
      'NOMEVALORBASE1,  VALORBASE1,'
      'NOMEVALORBASE2,  VALORBASE2,'
      'NOMEVALORBASE3,  VALORBASE3,'
      'NOME, NOMEANT, IDBENEFORIGEM, IDTPPAGTOBENEFIC, IDEVENTOGERADOR,'
      
        'IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3, IDRGCALCBENEFICI' +
        'O, IDPLANPREVCONTAB)'
      'values'
      '  ( :IDPLANOPREV, :IDBENEFICIO, '
      ' :NOMEVALORBASE1,  :VALORBASE1,'
      ' :NOMEVALORBASE2,  :VALORBASE2,'
      ' :NOMEVALORBASE3,  :VALORBASE3,'
      
        ' :NOME, :NOMEANT, :IDBENEFORIGEM, :IDTPPAGTOBENEFIC, :IDEVENTOGE' +
        'RADOR,'
      
        ' :IDREGRACALCOP1, :IDREGRACALCOP2, :IDREGRACALCOP3, :IDRGCALCBEN' +
        'EFICIO, '
      ':IDPLANPREVCONTAB)')
    DeleteSQL.Strings = (
      'delete BENEPLANPREV'
      'WHERE  IDPLANOPREV = :OLD_IDPLANOPREV   AND'
      'IDBENEFICIO = :OLD_IDBENEFICIO    ')
    Left = 252
    Top = 358
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 217
    Top = 250
  end
  object qryPlanOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dspatro
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV,  PL.NOME AS NOMEPLANO,'
      '               PL.FLGAUTONUMINSC, PL.NUMINSCINICIAL'
      'FROM   PLANPREV PL, PLANPREVPATRO PT'
      'WHERE PT.IDPLANOPREV = PL.IDPLANOPREV AND'
      'PT.IDPESSJUR = :IDPESSOA'
      'ORDER BY  PL.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 324
    Top = 241
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA,    PESSOA.NOME,'
      '       PATRO.FLGANO13'
      'FROM PESSOA,PATRO'
      'WHERE PESSOA.IDPESSOA=PATRO.IDPESSOA'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 291
    Top = 262
  end
  object dspatro: TDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 258
    Top = 254
  end
  object qryMovReservaTemp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVRESERVATMP, IDREGRACALCABATE, IDPLANOPREV,'
      '       IDTIPORESERVA,   IDPESSJUR,        NUMEROPROCESSO,'
      '       IDTITULAR,       IDPESSOA,         IDBENEFICIO,'
      '       SEQPROPOSTA,     VLRABATIDO,       DATAMOV,'
      '       IDHISTRESERVA,   VLRORIGINAL '
      'FROM   MOVRESERVATEMP'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    IDTITULAR      = :IDTITULAR'
      'AND    IDPESSJUR      = :IDPESSJUR'
      'AND    IDPLANOPREV    = :IDPLANOPREV'
      'AND    SEQPROPOSTA    = :SEQPROPOSTA'
      'ORDER BY IDBENEFICIO')
    UpdateObject = updMovReservaTemp
    ValidateWithMask = True
    Left = 138
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updMovReservaTemp: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVRESERVATEMP'
      'set'
      '  IDMOVRESERVATMP = :IDMOVRESERVATMP,'
      '  IDREGRACALCABATE = :IDREGRACALCABATE,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  VLRABATIDO = :VLRABATIDO,'
      '  DATAMOV = :DATAMOV,'
      '  IDHISTRESERVA = :IDHISTRESERVA,'
      '  VLRORIGINAL = :VLRORIGINAL'
      'where'
      '  IDMOVRESERVATMP = :OLD_IDMOVRESERVATMP')
    InsertSQL.Strings = (
      'insert into MOVRESERVATEMP'
      
        '  (IDMOVRESERVATMP, IDREGRACALCABATE, IDPLANOPREV, IDTIPORESERVA' +
        ', IDPESSJUR, '
      
        '   NUMEROPROCESSO, IDTITULAR, IDPESSOA, IDBENEFICIO, SEQPROPOSTA' +
        ', VLRABATIDO, '
      '   DATAMOV, IDHISTRESERVA, VLRORIGINAL)'
      'values'
      
        '  (:IDMOVRESERVATMP, :IDREGRACALCABATE, :IDPLANOPREV, :IDTIPORES' +
        'ERVA, :IDPESSJUR, '
      
        '   :NUMEROPROCESSO, :IDTITULAR, :IDPESSOA, :IDBENEFICIO, :SEQPRO' +
        'POSTA, '
      '   :VLRABATIDO, :DATAMOV, :IDHISTRESERVA, :VLRORIGINAL)')
    DeleteSQL.Strings = (
      'delete from MOVRESERVATEMP'
      'where'
      '  IDMOVRESERVATMP = :OLD_IDMOVRESERVATMP')
    Left = 136
    Top = 207
  end
  object SaveDialog1: TSaveDialog
    Left = 537
    Top = 65531
  end
  object printdlg: TPrintDialog
    Left = 99
    Top = 270
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BA' +
        'NCO.NOME AS BANCO,'
      
        '       AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTAC' +
        'ONJUNTA'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND'
      '       CB.FLGCONTAPREF = 1')
    ValidateWithMask = True
    Left = 296
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTotalRecebedor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME, 0 AS TOTAL'
      'FROM   PESSOA'
      'WHERE IDPESSOA = :IDPESSOA')
    UpdateObject = updTotalRecebedor
    ValidateWithMask = True
    Left = 183
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updTotalRecebedor: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 188
    Top = 161
  end
  object updReservaPart: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVAPART'
      'set'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  VALORRESERVA = :VALORRESERVA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPARTICIPANTE = :IDPESSOA'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into RESERVAPART'
      
        '  (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, VALORRESERVA' +
        ', '
      'SEQPROPOSTA, '
      '   IDPARTICIPANTE)'
      'values'
      '  (:IDTIPORESERVA, :IDPLANOPREV, :IDPESSJUR, :IDPESSOA, '
      ':VALORRESERVA, '
      '   :SEQPROPOSTA, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from RESERVAPART'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 408
    Top = 192
  end
  object qryReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, ' +
        '       RP.IDPESSOA,'
      
        '       RP.DATAREFERENCIASA,     RP.VALORRESERVA,  RP.PERCENTUALS' +
        'AQUE,  RP.SEQPROPOSTA,'
      
        '       PF.DATANASC,             EL.DATAADMISSAO,  R.NOME,       ' +
        '       R.CODHIERARQUIA,'
      '       R.INDICEREAJUSTE,        R.FLGDESCIRRF,       M.MOESIGLA,'
      '       R.FLGCONTROLE,'
      '       RP.IDPARTICIPANTE'
      
        'FROM   RESERVAPART RP, RESERVAXPLANO R, MOEDA M, PESSOAFISICA PF' +
        ', ELEGPATRO EL'
      'WHERE  RP.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.IDPLANOPREV       = :IDPLANOPREV AND'
      '       RP.IDPESSOA          = :IDTITULAR AND'
      '       PF.IDPESSOA          = :IDTITULAR AND'
      '       EL.IDPESSOA          = :IDTITULAR AND'
      '       EL.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.SEQPROPOSTA       = :SEQPROPOSTA AND'
      '       RP.FLGATIVO          = 1 AND'
      '       RP.IDTIPORESERVA     = R.IDTIPORESERVA AND'
      '       RP.IDPLANOPREV       = R.IDPLANOPREV AND'
      '       R.ANALITICOSINTETI   = '#39'A'#39' AND'
      '       /*R.FLGTIPORESERVA     = 0   AND */'
      '       R.INDICEREAJUSTE     = M.MOECODIGO(+)'
      'ORDER BY R.FLGCONTROLE , R.CODHIERARQUIA')
    UpdateObject = updReservaPart
    ValidateWithMask = True
    Left = 408
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsContribuicoes: TwwDataSource
    AutoEdit = False
    DataSet = qryContribuicoes
    Left = 173
    Top = 249
  end
  object qryContribuicoes: TwwQuery
    CachedUpdates = True
    BeforeScroll = qryContribuicoesBeforeScroll
    AfterScroll = qryContribuicoesAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPE.IDCONTRIBUICAO, CPE.IDREGRAVALIDAASS,'
      '       CP.NUMOPCOES,'
      '       NVL(CP.NOMEVALORBASE1,'#39'Opção 1'#39') AS NOMEVALORBASE1,'
      '       NVL(CP.NOMEVALORBASE2,'#39'Opção 2'#39') AS NOMEVALORBASE2,'
      '       NVL(CP.NOMEVALORBASE3,'#39'Opção 3'#39') AS NOMEVALORBASE3,'
      '       CP.IDREGRACALCULO,'
      '       0 AS VALORBASE1,'
      '       0 AS VALORBASE2,'
      '       0 AS VALORBASE3,'
      '       C.NOME'
      'FROM   CONTPREV CP, CONTPREVEVENTO CPE, CONTRIBUICAO C'
      'WHERE  CPE.IDPLANOPREV     = :IDPLANOPREV'
      'AND    CPE.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO    = CP.IDCONTRIBUICAO'
      'ORDER BY C.NOME'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updContribuicoes
    ValidateWithMask = True
    Left = 286
    Top = 165
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object updContribuicoes: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTPREV'
      'set'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and')
    InsertSQL.Strings = (
      'insert into CONTPREV'
      '  (IDRUBRICA)'
      'values'
      '  (:IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from CONTPREV'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and')
    Left = 262
    Top = 167
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 352
  end
  object qryRegraParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM   REGRA'
      'ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 577
    Top = 8
  end
  object qrySitPartDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 437
    Top = 72
  end
  object PrvBeneficiosParaConcessao: TDataSetProvider
    DataSet = qrybeneficios
    Constraints = True
    Left = 24
    Top = 56
  end
  object CdsBeneficiosParaConcessao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMEANT'
    Params = <>
    ProviderName = 'PrvBeneficiosParaConcessao'
    AfterScroll = CdsBeneficiosParaConcessaoAfterScroll
    Left = 56
    Top = 56
  end
end
