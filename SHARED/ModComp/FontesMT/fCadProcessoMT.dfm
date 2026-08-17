inherited frmCadProcessoMT: TfrmCadProcessoMT
  Left = 24
  Top = 76
  HelpContext = 760019
  Caption = 'Processo Trabalhista (Teste)'
  ClientHeight = 467
  ClientWidth = 749
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 749
    Height = 381
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 741
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 118
        Height = 13
        Caption = 'Data do Ajuizamento'
      end
      object dbedNumero: TDBEdit
        Left = 8
        Top = 19
        Width = 120
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NUMPROCTRAB'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDataAju: TCMDateTimePicker
        Left = 8
        Top = 67
        Width = 120
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAJUIZO'
        DataSource = ds
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
        TabOrder = 1
      end
      object ntbkTipoModulo: TNotebook
        Left = 134
        Top = 0
        Width = 603
        Height = 97
        PageIndex = 1
        TabOrder = 2
        object TPage
          Left = 0
          Top = 0
          Caption = 'ModCon'
          object Label30: TLabel
            Left = 6
            Top = 4
            Width = 92
            Height = 13
            Caption = 'Número na Vara'
            FocusControl = dbedNumJCJ_ModCon
          end
          object Label19: TLabel
            Left = 6
            Top = 46
            Width = 115
            Height = 13
            Caption = 'Data da Notificação'
          end
          object Label13: TLabel
            Left = 133
            Top = 4
            Width = 77
            Height = 13
            Caption = 'Vara Nº (JCJ)'
            FocusControl = dbedJCJ
          end
          object dbedNumJCJ_ModCon: TDBEdit
            Left = 6
            Top = 19
            Width = 120
            Height = 21
            DataField = 'PROCJCJNUM'
            DataSource = ds
            TabOrder = 0
            OnExit = dbedNumJCJExit
          end
          object dbedDataNot_ModCon: TCMDateTimePicker
            Left = 6
            Top = 61
            Width = 120
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATANOTIF'
            DataSource = ds
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
            TabOrder = 1
          end
          object dbedJCJ: TDBEdit
            Left = 133
            Top = 19
            Width = 120
            Height = 21
            DataField = 'JCJ'
            DataSource = ds
            TabOrder = 2
          end
          object rgSituacao_ModCon: TDBRadioGroup
            Left = 133
            Top = 44
            Width = 120
            Height = 49
            Caption = 'Situação'
            DataField = 'FLGSITPROC'
            DataSource = ds
            Items.Strings = (
              'Aberto'
              'Encerrado')
            TabOrder = 3
            Values.Strings = (
              '0'
              '1')
            OnChange = rgSituacao_ModConChange
          end
          object CMProcuraReclamante: TCMProcuraSubTipo
            Left = 258
            Top = 1
            Width = 345
            Height = 47
            Caption = 'Reclamante'
            TabOrder = 4
            OnExit = CMProcuraReclamanteExit
            CampoEdit = ceNome
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDRECLAMANTE'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            SubTipo = stFuncionario
            FiltraSubTipo = True
          end
          object gbxSitReq_ModCon: TGroupBox
            Left = 258
            Top = 48
            Width = 345
            Height = 45
            Caption = 'Situação do Reclamante'
            TabOrder = 5
            object lblSitReq_ModCon: TLabel
              Left = 10
              Top = 19
              Width = 40
              Height = 13
              Caption = 'Normal'
            end
            object dblckMotivoReq_ModCon: TwwDBLookupCombo
              Left = 72
              Top = 15
              Width = 265
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = ds
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckMotivoReq_ModConChange
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ProcJud'
          object Label4: TLabel
            Left = 1
            Top = 52
            Width = 97
            Height = 13
            Caption = 'Data Notificação'
          end
          object Label16: TLabel
            Left = 104
            Top = 4
            Width = 118
            Height = 13
            Caption = 'Número do Processo'
            FocusControl = dbedNumJCJ
          end
          object rgSituacao_ProcJud: TDBRadioGroup
            Left = 1
            Top = 1
            Width = 100
            Height = 49
            Caption = 'Situação'
            DataField = 'FLGSITPROC'
            DataSource = ds
            Items.Strings = (
              'Aberto'
              'Encerrado')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object dbedDataNot_ProcJud: TCMDateTimePicker
            Left = 1
            Top = 67
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATANOTIF'
            DataSource = ds
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
            TabOrder = 1
          end
          object dbedNumJCJ: TDBEdit
            Left = 104
            Top = 19
            Width = 194
            Height = 21
            DataField = 'PROCJCJNUM'
            DataSource = ds
            TabOrder = 2
            OnExit = dbedNumJCJExit
          end
          object dbrgMateria_ProcJud: TDBRadioGroup
            Left = 193
            Top = 44
            Width = 105
            Height = 46
            Hint = 'Civil, Comercial, Tributária ou Penal'
            Caption = 'Matéria'
            Columns = 2
            DataField = 'INDMATERIA'
            DataSource = ds
            Items.Strings = (
              'Civil'
              'Coml'
              'Trib'
              'Penl')
            TabOrder = 3
            Values.Strings = (
              '4'
              '5'
              '6'
              '7')
          end
          object rgAtivo_ProcJud: TDBRadioGroup
            Left = 104
            Top = 44
            Width = 86
            Height = 46
            Caption = 'Somos Parte'
            DataField = 'FLGPARTEATIVA'
            DataSource = ds
            Items.Strings = (
              'Passiva'
              'Ativa')
            TabOrder = 4
            Values.Strings = (
              '0'
              '1')
          end
          object gbxSitReq_ProcJud: TGroupBox
            Left = 301
            Top = 44
            Width = 301
            Height = 46
            Caption = 'Situação da Contra-Parte'
            TabOrder = 5
            object lblSitReq_ProcJud: TLabel
              Left = 7
              Top = 19
              Width = 52
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Normal'
            end
            object dblckMotivoReq_ProcJud: TwwDBLookupCombo
              Left = 63
              Top = 16
              Width = 232
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = ds
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object gbxRequerente_ProcJud: TGroupBox
            Left = 301
            Top = 2
            Width = 301
            Height = 41
            Caption = 'Contra-Parte'
            TabOrder = 6
            object edNomeRequerente_ProcJud: TEdit
              Left = 6
              Top = 13
              Width = 261
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
            object bbtnProcRequerente_ProcJud: TBitBtn
              Left = 270
              Top = 11
              Width = 25
              Height = 24
              Hint = 'Procura Contra-Parte por qualquer Tipo de Documento'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bbtnProcRequerente_ProcJudClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ProcPrev'
          object Label48: TLabel
            Left = 1
            Top = 55
            Width = 93
            Height = 13
            Caption = 'Data da Citação'
          end
          object Label50: TLabel
            Left = 104
            Top = 4
            Width = 118
            Height = 13
            Caption = 'Número do Processo'
            FocusControl = dbedNumJCJ_ProcPrev
          end
          object dbedDataNot_ProcPrev: TCMDateTimePicker
            Left = 1
            Top = 69
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATANOTIF'
            DataSource = ds
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
          object dbrgMateria_ProcPrev: TDBRadioGroup
            Left = 197
            Top = 44
            Width = 101
            Height = 46
            Caption = 'Matéria'
            DataField = 'INDMATERIA'
            DataSource = ds
            Items.Strings = (
              'Previdenc.'
              'Previd/Trab')
            TabOrder = 1
            Values.Strings = (
              '2'
              '3')
          end
          object rgSituacao_ProcPrev: TDBRadioGroup
            Left = 1
            Top = 4
            Width = 100
            Height = 49
            Caption = 'Situação'
            DataField = 'FLGSITPROC'
            DataSource = ds
            Items.Strings = (
              'Aberto'
              'Encerrado')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
            OnChange = rgSituacao_ModConChange
          end
          object dbedNumJCJ_ProcPrev: TDBEdit
            Left = 104
            Top = 19
            Width = 194
            Height = 21
            DataField = 'PROCJCJNUM'
            DataSource = ds
            TabOrder = 3
            OnExit = dbedNumJCJExit
          end
          object rgAtivo_ProcPrev: TDBRadioGroup
            Left = 104
            Top = 44
            Width = 90
            Height = 46
            Caption = 'Somos Parte'
            DataField = 'FLGPARTEATIVA'
            DataSource = ds
            Items.Strings = (
              'Passiva'
              'Ativa')
            TabOrder = 4
            Values.Strings = (
              '0'
              '1')
          end
          object gbxRequerente_ProcPrev: TGroupBox
            Left = 301
            Top = 2
            Width = 301
            Height = 41
            Caption = 'Contra-Parte'
            TabOrder = 5
            object edNomeRequerente_ProcPrev: TEdit
              Left = 6
              Top = 13
              Width = 261
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
            object bbtnProcRequerente_ProcPrev: TBitBtn
              Left = 270
              Top = 11
              Width = 25
              Height = 24
              Hint = 'Procura Contra-Parte por qualquer Tipo de Documento'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bbtnProcRequerente_ProcJudClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
          end
          object gbxSitReq_ProcPrev: TGroupBox
            Left = 301
            Top = 44
            Width = 301
            Height = 46
            Caption = 'Situação da Contra-Parte'
            TabOrder = 6
            object lblSitReq_ProcPrev: TLabel
              Left = 7
              Top = 19
              Width = 52
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Normal'
            end
            object dblckMotivoReq_ProcPrev: TwwDBLookupCombo
              Left = 63
              Top = 16
              Width = 232
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = ds
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckMotivoReq_ModConChange
            end
          end
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 102
      Width = 741
      Height = 275
      Tabs.Strings = (
        'Contra-Parte'
        'Litisconsortes'
        'Outros Dados'
        'Objetos do Processo'
        'Etapas'
        'Vinculações'
        'Encerramento')
      detdbGrids.Strings = (
        ''
        'dbgrDet2'
        ''
        'dbgrdDet'
        'dbGrdEtapa'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 643
        Height = 216
        object tbshReclamante: TTabSheet [0]
          Caption = 'tbshReclamante'
          object ntbkDadosRequerente: TNotebook
            Left = 3
            Top = 0
            Width = 629
            Height = 213
            PageIndex = 2
            TabOrder = 0
            object TPage
              Left = 0
              Top = 0
              Caption = 'ModCon'
              object Label9: TLabel
                Left = 171
                Top = 22
                Width = 73
                Height = 13
                Caption = 'Último Cargo'
              end
              object Label10: TLabel
                Left = 171
                Top = 63
                Width = 79
                Height = 13
                Caption = 'Último Salário'
              end
              object Label11: TLabel
                Left = 171
                Top = 101
                Width = 54
                Height = 13
                Caption = 'Admissão'
              end
              object Label12: TLabel
                Left = 396
                Top = 104
                Width = 55
                Height = 13
                Caption = 'Demissão'
              end
              object Label23: TLabel
                Left = 171
                Top = 136
                Width = 119
                Height = 13
                Caption = 'Motivo Desligamento'
              end
              object Label32: TLabel
                Left = 171
                Top = 177
                Width = 48
                Height = 13
                Caption = 'Unidade'
              end
              object dbedCargo: TDBEdit
                Left = 292
                Top = 19
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedSalAtual_ModCon: TDBEdit
                Left = 292
                Top = 61
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'SALARIOATUAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbrgTipoSalar: TDBRadioGroup
                Left = 390
                Top = 47
                Width = 161
                Height = 41
                Columns = 3
                DataField = 'TIPOPAGAMENTO'
                Items.Strings = (
                  'Hora'
                  'Dia'
                  'Mês')
                ReadOnly = True
                TabOrder = 2
                Values.Strings = (
                  'H'
                  'D'
                  'M')
              end
              object dbedAdm_ModCon: TDBEdit
                Left = 292
                Top = 99
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATAADMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedDem_ModCon: TDBEdit
                Left = 460
                Top = 99
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATADESLIGAMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedMotivo: TDBEdit
                Left = 292
                Top = 133
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedEstab: TDBEdit
                Left = 292
                Top = 173
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'ESTAB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'ProcJud'
              object Label60: TLabel
                Left = 75
                Top = 21
                Width = 76
                Height = 13
                Caption = 'Razão Social'
              end
              object Label61: TLabel
                Left = 75
                Top = 54
                Width = 77
                Height = 13
                Caption = 'CPF ou CNPJ'
              end
              object Label62: TLabel
                Left = 75
                Top = 87
                Width = 31
                Height = 13
                Caption = 'Email'
              end
              object Label63: TLabel
                Left = 75
                Top = 129
                Width = 55
                Height = 13
                Caption = 'Endereço'
              end
              object dbedRazao: TDBEdit
                Left = 176
                Top = 18
                Width = 447
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'RAZAOSOCIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedNumDoc: TDBEdit
                Left = 176
                Top = 52
                Width = 185
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'NUMDOCUMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbrgTipoPessoa: TDBRadioGroup
                Left = 438
                Top = 44
                Width = 185
                Height = 36
                Columns = 2
                DataField = 'TIPO'
                Items.Strings = (
                  'Física'
                  'Juridica')
                TabOrder = 2
                Values.Strings = (
                  'F'
                  'J')
              end
              object dbedEmail: TDBEdit
                Left = 176
                Top = 82
                Width = 185
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'EMAIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedLogra: TDBEdit
                Left = 176
                Top = 125
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'LOGRADOURO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedNumLogra: TDBEdit
                Left = 439
                Top = 125
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'NUMERO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedComplem: TDBEdit
                Left = 533
                Top = 125
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'COMPLEMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object dbedBairro: TDBEdit
                Left = 176
                Top = 159
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'BAIRRO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'ProcPrev'
              object Label51: TLabel
                Left = 174
                Top = 10
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object Label53: TLabel
                Left = 174
                Top = 43
                Width = 53
                Height = 13
                Caption = 'Inscrição'
              end
              object Label54: TLabel
                Left = 174
                Top = 76
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object Label55: TLabel
                Left = 174
                Top = 110
                Width = 73
                Height = 13
                Caption = 'Último Cargo'
              end
              object Label56: TLabel
                Left = 174
                Top = 141
                Width = 79
                Height = 13
                Caption = 'Último Salário'
              end
              object Label57: TLabel
                Left = 174
                Top = 176
                Width = 54
                Height = 13
                Caption = 'Admissão'
              end
              object Label58: TLabel
                Left = 399
                Top = 175
                Width = 55
                Height = 13
                Caption = 'Demissão'
              end
              object Label59: TLabel
                Left = 430
                Top = 43
                Width = 28
                Height = 13
                Caption = 'Data'
              end
              object dbedPlano: TDBEdit
                Left = 295
                Top = 7
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'PLANO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedInscNum: TDBEdit
                Left = 295
                Top = 40
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'INSCRICAONUMERO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbedInscData: TDBEdit
                Left = 463
                Top = 40
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'INSCRICAODATA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object dbedPatro: TDBEdit
                Left = 295
                Top = 73
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'PATROC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedCargoI: TDBEdit
                Left = 295
                Top = 107
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedSalAtual_ProcPrev: TDBEdit
                Left = 295
                Top = 139
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'SALPARTICIPACAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedAdm_ProcPrev: TDBEdit
                Left = 295
                Top = 171
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATAADMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object dbedDem_ProcPrev: TDBEdit
                Left = 463
                Top = 171
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATADEMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
            end
          end
        end
        object tbsLitisconsortes: TTabSheet [1]
          Caption = 'tbsLitisconsortes'
          object dbgrDet2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 635
            Height = 188
            Selected.Strings = (
              'NOME'#9'50'#9'Nome'#9'F'
              'SITUACAO'#9'36'#9'Situação'
              'CATEGORIA'#9'22'#9'Categoria'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLitis
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
            ParentFont = False
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
          object pnlDet2: TPanel
            Left = 0
            Top = 0
            Width = 635
            Height = 188
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object ntbkDadosLitisconsorte: TNotebook
              Left = 3
              Top = 2
              Width = 629
              Height = 183
              TabOrder = 0
              object TPage
                Left = 0
                Top = 0
                Caption = 'ModCon'
                object CMProcuraLitisEmpregado: TCMProcuraSubTipo
                  Left = 216
                  Top = 9
                  Width = 400
                  Height = 50
                  Caption = 'Litisconsorte ou Testemunha Empregado'
                  TabOrder = 0
                  CampoEdit = ceNome
                  MostraMensagens = True
                  DataField = 'IDPESSOA'
                  Mensagens.EmBranco = 'Chave não pode estar em branco'
                  Mensagens.NaoExiste = 'Chave não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = False
                  SubTipo = stFuncionario
                  FiltraSubTipo = True
                end
                object gbxSitLitis: TGroupBox
                  Left = 216
                  Top = 124
                  Width = 400
                  Height = 45
                  Caption = 'Situação do Litisconsorte ou Testemunha'
                  TabOrder = 1
                  object lblSitLit_ModCon: TLabel
                    Left = 8
                    Top = 20
                    Width = 58
                    Height = 13
                    Alignment = taCenter
                    AutoSize = False
                    Caption = 'Normal'
                  end
                  object dblckMotivoLit_ModCon: TwwDBLookupCombo
                    Left = 72
                    Top = 16
                    Width = 320
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
                    DataField = 'IDMOTIVO'
                    DataSource = dsLitis
                    LookupTable = CdsMotivo
                    LookupField = 'IDMOTIVO'
                    Style = csDropDownList
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    UseTFields = False
                    AllowClearKey = True
                    OnChange = dblckMotivoLit_ModConChange
                  end
                end
                object CMProcuraLitisEmpresa: TCMProcuraSubTipo
                  Left = 216
                  Top = 67
                  Width = 400
                  Height = 50
                  Caption = 'Litisconsorte ou Testemunha Empresa'
                  TabOrder = 2
                  CampoEdit = ceNome
                  MostraMensagens = True
                  DataField = 'IDPESSOA'
                  Mensagens.EmBranco = 'Chave não pode estar em branco'
                  Mensagens.NaoExiste = 'Chave não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = False
                  SubTipo = stFornecedor
                  FiltraSubTipo = True
                end
                object dbrgCategoria: TDBRadioGroup
                  Left = 16
                  Top = 11
                  Width = 185
                  Height = 160
                  Caption = 'Categoria'
                  DataField = 'INDTESTEMUNHA'
                  DataSource = dsLitis
                  Items.Strings = (
                    'Litisconsorte Contra-Parte'
                    'Nossa Litisconsorte'
                    'Testemunha Contra-Parte'
                    'Nossa Testemunha')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '3'
                    '1'
                    '2')
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'Outros'
                object gbxLitisconsorte: TGroupBox
                  Left = 215
                  Top = 43
                  Width = 400
                  Height = 44
                  Caption = 'Litisconsorte'
                  TabOrder = 0
                  object spbtnProcLitisconsorte: TSpeedButton
                    Left = 367
                    Top = 13
                    Width = 25
                    Height = 24
                    Hint = 'Procura Litisconsorte por qualquer Tipo de Documento'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = bbtnProcRequerente_ProcJudClick
                  end
                  object edLitisconsorte: TEdit
                    Left = 9
                    Top = 15
                    Width = 352
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
                object GroupBox1: TGroupBox
                  Left = 215
                  Top = 109
                  Width = 400
                  Height = 45
                  Caption = 'Situação do Litisconsorte'
                  TabOrder = 1
                  object lblSitLit_ProcPrev: TLabel
                    Left = 8
                    Top = 20
                    Width = 58
                    Height = 13
                    Alignment = taCenter
                    AutoSize = False
                    Caption = 'Normal'
                  end
                  object dblckMotivoLit_Outros: TwwDBLookupCombo
                    Left = 72
                    Top = 16
                    Width = 320
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
                    DataField = 'IDMOTIVO'
                    DataSource = dsLitis
                    LookupTable = CdsMotivo
                    LookupField = 'IDMOTIVO'
                    Style = csDropDownList
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    UseTFields = False
                    AllowClearKey = True
                    OnChange = dblckMotivoLit_ModConChange
                  end
                end
                object dbrgCategoriaOutros: TDBRadioGroup
                  Left = 16
                  Top = 11
                  Width = 185
                  Height = 160
                  Caption = 'Categoria'
                  DataField = 'INDTESTEMUNHA'
                  DataSource = dsLitis
                  Items.Strings = (
                    'Litisconsorte Contra-Parte'
                    'Nossa Litisconsorte'
                    'Testemunha Contra-Parte'
                    'Nossa Testemunha')
                  TabOrder = 2
                  Values.Strings = (
                    '0'
                    '3'
                    '1'
                    '2')
                end
              end
            end
          end
        end
        object tbshOutrosDados: TTabSheet [2]
          Caption = 'tbshOutrosDados'
          object pgCtrlOutrosDados: TPageControl
            Left = 0
            Top = 0
            Width = 635
            Height = 188
            ActivePage = tbsInstancias
            Align = alClient
            TabOrder = 0
            object tbsInstancias: TTabSheet
              Caption = 'Instâncias'
              ImageIndex = 4
              object lblTRT: TLabel
                Left = 287
                Top = 31
                Width = 231
                Height = 13
                Caption = 'Órgão Jurisdicional (Vara, Tribunal, etc.)'
              end
              object Label15: TLabel
                Left = 163
                Top = 30
                Width = 118
                Height = 13
                Caption = 'Número do Processo'
                FocusControl = dbedNumTST
              end
              object Label17: TLabel
                Left = 88
                Top = 49
                Width = 69
                Height = 13
                Caption = '1ª Instância'
                FocusControl = dbedNumTST
              end
              object Label26: TLabel
                Left = 88
                Top = 88
                Width = 69
                Height = 13
                Caption = '2ª Instância'
                FocusControl = dbedNumTST
              end
              object Label27: TLabel
                Left = 74
                Top = 124
                Width = 83
                Height = 13
                Caption = 'Instância Sup.'
                FocusControl = dbedNumTST
              end
              object Label29: TLabel
                Left = 100
                Top = 159
                Width = 57
                Height = 13
                Caption = 'Execução'
                FocusControl = dbedNumExec
              end
              object dbedNumTRT: TDBEdit
                Left = 161
                Top = 84
                Width = 120
                Height = 21
                DataField = 'PROCTRTNUM'
                DataSource = ds
                TabOrder = 0
              end
              object dbedNumTST: TDBEdit
                Left = 161
                Top = 120
                Width = 120
                Height = 21
                DataField = 'PROCTSTNUM'
                DataSource = ds
                TabOrder = 1
              end
              object dblckVara: TwwDBLookupCombo
                Left = 287
                Top = 47
                Width = 350
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDVARAJUSTICA'
                DataSource = ds
                LookupTable = CdsVara
                LookupField = 'IDVARAJUSTICA'
                Style = csDropDownList
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dblckVara3: TwwDBLookupCombo
                Left = 288
                Top = 120
                Width = 350
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDVARAJUSTICA3'
                DataSource = ds
                LookupTable = CdsVara
                LookupField = 'IDVARAJUSTICA'
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dbedNumJCJ2: TDBEdit
                Left = 161
                Top = 46
                Width = 120
                Height = 21
                DataField = 'PROCJCJNUM'
                DataSource = ds
                TabOrder = 4
                OnExit = dbedNumJCJExit
              end
              object dblckVara2: TwwDBLookupCombo
                Left = 289
                Top = 84
                Width = 350
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDVARAJUSTICA2'
                DataSource = ds
                LookupTable = CdsVara
                LookupField = 'IDVARAJUSTICA'
                Style = csDropDownList
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dbedNumExec: TDBEdit
                Left = 161
                Top = 155
                Width = 120
                Height = 21
                DataField = 'NUMPROCEXEC'
                DataSource = ds
                TabOrder = 6
              end
            end
            object tbshTipos: TTabSheet
              Caption = 'Tipo e Localização'
              object Label21: TLabel
                Left = 657
                Top = 134
                Width = 17
                Height = 13
                Caption = 'UF'
              end
              object Label3: TLabel
                Left = 50
                Top = 10
                Width = 105
                Height = 13
                Caption = 'Data da Postagem'
              end
              object Label18: TLabel
                Left = 226
                Top = 10
                Width = 116
                Height = 13
                Caption = 'Quant. Reclamantes'
                FocusControl = dbedQtde
              end
              object Label31: TLabel
                Left = 50
                Top = 56
                Width = 100
                Height = 13
                Caption = 'Tipo de Processo'
              end
              object Label33: TLabel
                Left = 50
                Top = 95
                Width = 77
                Height = 13
                Caption = 'Tipo de Açao'
              end
              object Label35: TLabel
                Left = 50
                Top = 134
                Width = 267
                Height = 13
                Caption = 'Pasta do Processo (Identificação/Localização)'
                FocusControl = dbedPasta
              end
              object Label36: TLabel
                Left = 376
                Top = 134
                Width = 175
                Height = 13
                Caption = 'Cidade Onde Corre o Processo'
              end
              object dbedUF: TwwDBEdit
                Left = 657
                Top = 149
                Width = 27
                Height = 21
                Color = clGray
                DataField = 'CODESTADO'
                DataSource = dsUF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedPost: TCMDateTimePicker
                Left = 50
                Top = 25
                Width = 120
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAPOST'
                DataSource = ds
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
                TabOrder = 1
              end
              object dbedQtde: TDBEdit
                Left = 226
                Top = 25
                Width = 120
                Height = 21
                DataField = 'QTDERECTES'
                DataSource = ds
                TabOrder = 2
              end
              object dblckTipProc: TwwDBLookupCombo
                Left = 50
                Top = 70
                Width = 300
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
                DataField = 'IDTIPOPROC'
                DataSource = ds
                LookupTable = CdsTipoProc
                LookupField = 'IDTIPOPROC'
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dblckTipAcao: TwwDBLookupCombo
                Left = 50
                Top = 109
                Width = 300
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDTIPOACAO'
                DataSource = ds
                LookupTable = CdsTipAcao
                LookupField = 'IDTIPOACAO'
                Style = csDropDownList
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dbedPasta: TDBEdit
                Left = 50
                Top = 148
                Width = 300
                Height = 21
                DataField = 'IDENTPASTA'
                DataSource = ds
                TabOrder = 5
              end
              object ProcuraCidade: TCMProcura
                Left = 376
                Top = 148
                Width = 273
                Height = 27
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MostraMensagens = True
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                OnValidaDados = ProcuraCidadeValidaDados
                DataSource = ds
                DataField = 'IDCIDADES'
                LookupChave = 'IDCIDADES'
                LookupDescricao = 'NOME'
                MontaSelect = MontaSelectCidade
                LookupTabela = 'CM.CIDADES'
                DataBaseName = 'BaseDados'
                ReadOnly = False
              end
            end
            object tbshAdvogados: TTabSheet
              Caption = 'Advogados e Assistente'
              object Label34: TLabel
                Left = 367
                Top = 125
                Width = 102
                Height = 13
                Caption = 'Advogado Interno'
              end
              object CMProcuraAdv1: TCMProcuraSubTipo
                Left = 26
                Top = 27
                Width = 300
                Height = 50
                Caption = 'Escritório/Advogado do Reclamante'
                TabOrder = 0
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDADVOGRECTE'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object CMProcuraAdv2: TCMProcuraSubTipo
                Left = 367
                Top = 27
                Width = 300
                Height = 50
                Caption = 'Nosso Escritório/Advogado'
                TabOrder = 1
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDADVOGRECDA'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object CMProcuraAssist: TCMProcuraSubTipo
                Left = 26
                Top = 120
                Width = 300
                Height = 50
                Caption = 'Assistente Técnico'
                TabOrder = 2
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDASSISTTECN'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object dblckAdvCasa: TwwDBLookupCombo
                Left = 367
                Top = 141
                Width = 300
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDADVOGCASA'
                DataSource = ds
                LookupTable = CdsAdvCasa
                LookupField = 'IDUSUARIO'
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
            end
            object tbshValores: TTabSheet
              Caption = 'Valores e Sua Atualização'
              object Label28: TLabel
                Left = 19
                Top = 3
                Width = 117
                Height = 13
                Caption = 'Custo Real Histórico'
              end
              object Label14: TLabel
                Left = 241
                Top = 3
                Width = 126
                Height = 13
                Caption = 'Custo Real Atualizado'
              end
              object Label8: TLabel
                Left = 489
                Top = 3
                Width = 56
                Height = 13
                Caption = 'Despesas'
              end
              object dbrgIndTaxaConv: TDBRadioGroup
                Left = 164
                Top = 50
                Width = 300
                Height = 33
                Caption = 'Forma de Atualização Monetária'
                Columns = 3
                DataField = 'INDTAXACONV'
                DataSource = ds
                Items.Strings = (
                  'Indice'
                  'Regra'
                  'Nenhuma')
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1'
                  '2')
                OnChange = dbrgIndTaxaConvChange
              end
              object gbxIndice: TGroupBox
                Left = 11
                Top = 103
                Width = 300
                Height = 50
                Caption = 'Indice de Atualização Monetária'
                TabOrder = 1
                object dblckMoeda: TwwDBLookupCombo
                  Left = 15
                  Top = 18
                  Width = 270
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOEDESC'#9'20'#9'Descrição'
                    'MOESIGLA'#9'10'#9'Sigla')
                  DataField = 'MOEDAPROCTRAB'
                  DataSource = ds
                  LookupTable = CdsMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnCloseUp = dblckMoedaCloseUp
                end
              end
              object gbxRegra: TGroupBox
                Left = 370
                Top = 103
                Width = 300
                Height = 50
                Caption = 'Regra de Cálculo'
                TabOrder = 2
                object dblckRegraNormal: TwwDBLookupCombo
                  Left = 15
                  Top = 18
                  Width = 270
                  Height = 21
                  DropDownAlignment = taRightJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRA'
                  DataSource = ds
                  LookupTable = CdsRegra
                  LookupField = 'IDREGRA'
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnCloseUp = dblckRegraNormalCloseUp
                end
              end
              object dbreCusto: TDBRealEdit
                Left = 19
                Top = 16
                Width = 121
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 3
                WordWrap = False
                OnChange = dbreCustoChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'CUSTOPROC'
                DataSource = ds
              end
              object redValorAtual: TRealEdit
                Left = 241
                Top = 16
                Width = 126
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 4
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object dbreDespesa: TDBRealEdit
                Left = 489
                Top = 16
                Width = 121
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
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
                DataField = 'DESPESAPROC'
                DataSource = ds
              end
            end
            object tbshIntegracao: TTabSheet
              Caption = 'Contabilização e Contas a Pagar'
              object gbkTipoDesemb: TGroupBox
                Left = 9
                Top = 3
                Width = 593
                Height = 45
                Caption = 'Tipo de Desembolso'
                TabOrder = 0
                object dblckTipoDesemb: TwwDBLookupCombo
                  Left = 94
                  Top = 15
                  Width = 426
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'DESCRICAO')
                  LookupTable = CdsTipoDesemb
                  LookupField = 'CODTIPRECDES'
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
              end
              object gbxContabilizacao: TGroupBox
                Left = 9
                Top = 54
                Width = 306
                Height = 100
                Caption = 'Contabilização'
                TabOrder = 1
                object Label44: TLabel
                  Left = 10
                  Top = 16
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object Label45: TLabel
                  Left = 10
                  Top = 56
                  Width = 81
                  Height = 13
                  Caption = 'Taxa de Juros'
                end
                object dblckTipOper: TwwDBLookupCombo
                  Left = 10
                  Top = 31
                  Width = 286
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
                  LookupTable = CdsTipoOper
                  LookupField = 'TIPCODIGO'
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
                object redJuros: TRealEdit
                  Left = 10
                  Top = 70
                  Width = 80
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object rgJuros: TRadioGroup
                  Left = 101
                  Top = 55
                  Width = 195
                  Height = 37
                  Caption = 'Juros'
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    'Simples'
                    'Compostos')
                  TabOrder = 2
                end
              end
              object gbxCAP: TGroupBox
                Left = 322
                Top = 54
                Width = 279
                Height = 100
                Caption = 'Contas a Pagar'
                TabOrder = 2
                object Label46: TLabel
                  Left = 10
                  Top = 16
                  Width = 95
                  Height = 13
                  Caption = 'Data Pagamento'
                end
                object Label47: TLabel
                  Left = 10
                  Top = 56
                  Width = 112
                  Height = 13
                  Caption = 'Tipo de Documento'
                end
                object dtPagamento: TCMDateTimePicker
                  Left = 10
                  Top = 31
                  Width = 100
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
                object dblckTipoDoc: TwwDBLookupCombo
                  Left = 10
                  Top = 70
                  Width = 260
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'DESCRICAO')
                  LookupTable = CdsTipoDoc
                  LookupField = 'CODTIPDOC'
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 635
            Height = 188
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'Descrição do Objeto Reclamado'#9'F'
              'VALORRECL'#9'16'#9'Valor Reclamado'#9'F'
              'PERCORIG'#9'10'#9'Probab. Original (%)'#9'F'
              'PERCPROB'#9'17'#9'Probab. Contra-Parte (%)'#9'F'
              'VALORESPERADO'#9'12'#9'Valor Estimado'#9'F'
              'VALORSENTENCA'#9'10'#9'Valor Real'#9'F'
              'OBSERVACAO'#9'240'#9'Observação'#9'F')
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 635
            Height = 188
            object Label5: TLabel
              Left = 3
              Top = 5
              Width = 85
              Height = 13
              Caption = 'Tipo de Objeto'
            end
            object lblValorReclamado: TLabel
              Left = 3
              Top = 45
              Width = 97
              Height = 13
              Caption = 'Valor Reclamado'
            end
            object Label40: TLabel
              Left = 120
              Top = 45
              Width = 113
              Height = 13
              Caption = 'Probab. Original (%)'
            end
            object Label7: TLabel
              Left = 250
              Top = 45
              Width = 141
              Height = 13
              Caption = 'Probab. Contra-Parte (%)'
            end
            object Label24: TLabel
              Left = 404
              Top = 45
              Width = 87
              Height = 13
              Caption = 'Valor Esperado'
            end
            object lblValReal: TLabel
              Left = 522
              Top = 45
              Width = 60
              Height = 13
              Caption = 'Valor Real'
            end
            object Label39: TLabel
              Left = 3
              Top = 85
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dblckTipObj: TwwDBLookupCombo
              Left = 3
              Top = 20
              Width = 629
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOOBJETO'
              DataSource = dsDet
              LookupTable = CdsTipoObj
              LookupField = 'CODTIPOOBJETO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              UseTFields = False
              AllowClearKey = True
            end
            object dbedValRecl: TDBRealEdit
              Left = 3
              Top = 60
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORRECL'
              DataSource = dsDet
            end
            object dbedValProbOrig: TDBRealEdit
              Left = 120
              Top = 60
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCORIG'
              DataSource = dsDet
            end
            object dbedPerc: TDBRealEdit
              Left = 250
              Top = 60
              Width = 141
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCPROB'
              DataSource = dsDet
            end
            object dbmemObserv: TDBMemo
              Left = 3
              Top = 100
              Width = 629
              Height = 89
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 4
            end
            object dbedValReal: TDBRealEdit
              Left = 522
              Top = 60
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORSENTENCA'
              DataSource = dsDet
            end
            object edValor: TDBRealEdit
              Left = 404
              Top = 60
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORPROVAVEL'
              DataSource = dsDet
            end
          end
        end
        object tbsEtapas: TTabSheet
          Caption = 'tbshEtapas'
          object dbGrdEtapa: TwwDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 114
            Selected.Strings = (
              'NUMSEQ'#9'10'#9'Num. Seq.'#9'F'
              'ETAPA'#9'36'#9'Tipo de Etapa'#9'F'
              'DATAREALOCOR'#9'17'#9'Data e Hora'
              'ASSUNTO'#9'40'#9'Assunto Resumido')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsEtapa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
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
          object pnlEtapas: TPanel
            Left = 0
            Top = 0
            Width = 635
            Height = 188
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label20: TLabel
              Left = 65
              Top = 2
              Width = 156
              Height = 13
              Caption = 'Tipo de Etapa (Andamento)'
            end
            object Label22: TLabel
              Left = 401
              Top = 2
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label41: TLabel
              Left = 65
              Top = 41
              Width = 113
              Height = 13
              Caption = 'Assunto (Resumido)'
            end
            object Label42: TLabel
              Left = 443
              Top = 41
              Width = 122
              Height = 13
              Hint = 'Valor do Depósito do Recurso ou Despesa Processual'
              Caption = 'Depósito ou Despesa'
              ParentShowHint = False
              ShowHint = True
            end
            object lblHonor: TLabel
              Left = 443
              Top = 79
              Width = 83
              Height = 13
              Caption = 'Honorário Fixo'
              ParentShowHint = False
              ShowHint = False
              Visible = False
            end
            object Label43: TLabel
              Left = 65
              Top = 113
              Width = 146
              Height = 13
              Caption = 'Descrição / Observações'
            end
            object Label25: TLabel
              Left = 517
              Top = 2
              Width = 28
              Height = 13
              Caption = 'Hora'
            end
            object dblckTipoEtp: TwwDBLookupCombo
              Left = 65
              Top = 16
              Width = 320
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPORECURSO'
              DataSource = dsEtapa
              LookupTable = CdsTipoEtapa
              LookupField = 'CODTIPORECURSO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              OnCloseUp = dblckTipoEtpCloseUp
            end
            object dtedDataReal: TCMDateTimePicker
              Left = 401
              Top = 16
              Width = 100
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
              TabOrder = 1
            end
            object mskedHora: TMaskEdit
              Left = 517
              Top = 16
              Width = 50
              Height = 21
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
            end
            object dbedAssunto: TDBEdit
              Left = 65
              Top = 55
              Width = 320
              Height = 21
              DataField = 'ASSUNTO'
              DataSource = dsEtapa
              TabOrder = 3
            end
            object redHonor: TRealEdit
              Left = 443
              Top = 93
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 4
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbmObserv: TDBMemo
              Left = 65
              Top = 126
              Width = 503
              Height = 75
              DataField = 'OBSERVETAPA'
              DataSource = dsEtapa
              ScrollBars = ssVertical
              TabOrder = 5
            end
            object dbedValRec: TDBRealEdit
              Left = 443
              Top = 55
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORREC'
              DataSource = dsEtapa
            end
            object dbrgAbate: TDBRadioGroup
              Left = 67
              Top = 79
              Width = 320
              Height = 33
              Caption = 'Depósito ou Despesa Abate do Valor da Causa ?'
              Columns = 2
              DataField = 'FLGVALORABATE'
              DataSource = dsEtapa
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 7
              Values.Strings = (
                '1'
                '0')
            end
          end
        end
        object tbshVinculos: TTabSheet
          Caption = 'tbshVinculos'
          object pnlLigado: TPanel
            Left = 5
            Top = 2
            Width = 715
            Height = 48
            BevelInner = bvLowered
            TabOrder = 0
            object Label37: TLabel
              Left = 172
              Top = 18
              Width = 245
              Height = 13
              Caption = 'Este Processo Está Vinculado ao Processo'
            end
            object spbProcVinc: TSpeedButton
              Left = 640
              Top = 13
              Width = 24
              Height = 24
              Hint = 'Escolhe o processo a que este está ligado'
              Enabled = False
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
                FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
                333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
                00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
                FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
                0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
                000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
                33333333000007FFF093333333333333000030FF093333333333333300003300
                33333333333333330000}
              ParentShowHint = False
              ShowHint = True
              OnClick = spbProcVincClick
            end
            object spbApagaVinc: TSpeedButton
              Left = 673
              Top = 13
              Width = 24
              Height = 24
              Hint = 'Excluir a Vinculação'
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              ParentShowHint = False
              ShowHint = True
              OnClick = spbApagaVincClick
            end
            object dbedNumVinc: TDBEdit
              Left = 423
              Top = 15
              Width = 120
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'IDPROCVINCULADO'
              DataSource = ds
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
          object gbxVinculados: TGroupBox
            Left = 5
            Top = 54
            Width = 715
            Height = 178
            Caption = 'Processos Ligados a Este'
            TabOrder = 1
            object dbgdProcessosVinc: TwwDBGrid
              Left = 7
              Top = 15
              Width = 699
              Height = 154
              Selected.Strings = (
                'NOME'#9'40'#9'Contra-Parte'
                'DATAJUIZO'#9'10'#9'Data Ajuiz.'
                'DATANOTIF'#9'10'#9'Data Notif.'
                'JCJ'#9'10'#9'Órgão Jur.'
                'PROCJCJNUM'#9'15'#9'Número na 1.a Inst.'
                'PROCTRTNUM'#9'15'#9'Número na 2.a Inst.'
                'PROCTSTNUM'#9'15'#9'Número na Inst. Sup.'
                'FLGSITPROC'#9'10'#9'Encerrado?'
                'DATAEFETENC'#9'10'#9'Data Encerr.'
                'FLGVINCULADO'#9'10'#9'Vinculado?'
                'NUMPROCTRAB'#9'10'#9'Número Interno')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsProcVinc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
              ParentFont = False
              TabOrder = 0
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
        object tbshEncer: TTabSheet
          Caption = 'tbshEncer'
          object rgTipEncer: TDBRadioGroup
            Left = 127
            Top = 52
            Width = 121
            Height = 120
            Caption = 'Tipo'
            DataField = 'TIPOENCER'
            DataSource = ds
            Items.Strings = (
              'Arquivamento'
              'Acordo'
              'Desistência'
              'Sentença')
            TabOrder = 0
            Values.Strings = (
              'A'
              'C'
              'D'
              'S')
            OnChange = rgTipEncerChange
          end
          object gbxAcordo: TGroupBox
            Left = 295
            Top = 70
            Width = 162
            Height = 48
            Caption = 'Número de Parcelas'
            TabOrder = 1
            Visible = False
            object sbspeParc: TwwDBSpinEdit
              Left = 42
              Top = 17
              Width = 55
              Height = 21
              Increment = 1
              MaxValue = 100
              MinValue = 1
              Value = 1
              DataField = 'QTDEPARCACOR'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object bbtnParcelamento: TBitBtn
              Left = 125
              Top = 12
              Width = 30
              Height = 30
              Hint = 'Parcelamento do Acordo'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bbtnParcelamentoClick
              Glyph.Data = {
                06020000424D0602000000000000760000002800000028000000140000000100
                0400000000009001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008B8888888BCB
                8888888B8888888888788888888888BBB8888BCB8888BBB88888888888788888
                888888BBB8888BCB8888BBB88888888888788888888888BBBBB88CCC88BBBBB8
                888888888777888888888888B8CCCCCCCCC8B888888888777777777888888888
                BCC888C888CCB8888888877888788877888888888CC888C888CC888888888778
                88788877888888888CC888C888CC8888888887788878887788888888888888C8
                88CC8888888888888878887788888888B8888CCCCCC8B8888888888887777778
                88888BBBB8CCCCCC8888BBBB888888777777888888888888BCC888C88888B888
                888887788878888888888888BCC888C88888B888888887788878888888888888
                8CC888C888CC8888888887788878887788888888BCC888C888CCB88888888778
                8878887788888888B8CCCCCCCCC8B8888888887777777778888888BBBBB88CCC
                88BBBBB88888888887778888888888BBBBB88CCC88BBBBB88888888887778888
                888888BBB8888BCB8888BBB8888888888878888888888B8888888BCB8888888B
                88888888887888888888}
              NumGlyphs = 2
            end
          end
          object gbxDataEncer: TGroupBox
            Left = 476
            Top = 70
            Width = 125
            Height = 48
            Caption = 'Data Encerramento'
            TabOrder = 2
            object dbedEncerr: TCMDateTimePicker
              Left = 11
              Top = 17
              Width = 103
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEFETENC'
              DataSource = ds
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
          object gbxSent: TGroupBox
            Left = 295
            Top = 130
            Width = 306
            Height = 44
            Caption = 'Tipo de Sentença'
            TabOrder = 3
            Visible = False
            object dblckTipSent: TwwDBLookupCombo
              Left = 10
              Top = 15
              Width = 285
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOSENT'
              DataSource = ds
              LookupTable = CdsTipSent
              LookupField = 'CODTIPOSENT'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
          end
          object GroupBox2: TGroupBox
            Left = 316
            Top = 14
            Width = 125
            Height = 48
            Caption = 'Prev.Encerramento'
            TabOrder = 4
            object dbedPrevEnc: TCMDateTimePicker
              Left = 11
              Top = 17
              Width = 103
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPREVENCER'
              DataSource = ds
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
        end
      end
      inherited Dock973: TDock97
        Width = 733
      end
      inherited Dock974: TDock97
        Left = 647
        Height = 216
      end
    end
  end
  inherited Dock972: TDock97
    Width = 749
    object sbtnFicha: TToolbarButton97 [0]
      Left = 468
      Top = 0
      Width = 60
      Height = 41
      Hint = 'Imprimir a Ficha do Processo'
      Caption = '&Ficha'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnFichaClick
    end
    inherited Toolbar971: TToolbar97
      object sbtnProcurarLitis: TToolbarButton97
        Left = 240
        Top = 0
        Width = 202
        Height = 41
        Hint = 
          'Busca Reclamantes, Litisconsortes ou Testemunhas (esta opção é b' +
          'em mais demorada)'
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar Incluindo &Litisconsortes'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcurarLitisClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 579
      DockPos = 590
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 412
      DockPos = 423
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    OnStateChange = dsStateChange
    Left = 472
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 706
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 648
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 444
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.JCJ'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.CODIGOTRT'
      'TRT.DESCRICAO'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Reclamante'
      'Data de Notificação'
      'Número da Vara (JCJ)'
      'Número Proc. na Vara'
      'Código do TRT'
      'Nome do TRT'
      'Número Proc. no TRT'
      'Número Proc. no TST'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'TRT')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.CODIGOTRT        = TRT.CODIGOTRT(+)'
      'PROCESSOTRAB.INDMATERIA       = 1')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '15'
      '15'
      '40'
      '15'
      '15'
      '15')
    Left = 698
    Top = 315
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 648
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 547
    Top = 14
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEtapa
    OnStateChange = dsEtapaStateChange
    Left = 591
    Top = 15
  end
  object dsPartic: TwwDataSource
    DataSet = CdsPartic
    Left = 487
    Top = 423
  end
  object dsProcVinc: TwwDataSource
    DataSet = CdsProcVinc
    Left = 592
    Top = 423
  end
  object dsLitis: TwwDataSource
    AutoEdit = False
    DataSet = CdsLitis
    OnStateChange = dsLitisStateChange
    Left = 507
    Top = 14
  end
  object MontaSelectCidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Cidade'
      'Sigla UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 698
    Top = 301
  end
  object dsUF: TwwDataSource
    AutoEdit = False
    DataSet = CdsUF
    Left = 542
    Top = 423
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P1.NOME'
      'F.MATRICULA'
      'P2.NOME'
      'F.DATAADMISSAO'
      'F.DATADESLIGAMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nome Reclamante'
      'Matrícula'
      'Unidade'
      'Admissão'
      'Demissão')
    Tabelas.Strings = (
      'PESSOA P1'
      'PESSOA P2'
      'FUNCIONARIO F')
    CamposChave.Strings = (
      'F.IDPESSOA')
    Filtro.Strings = (
      'F.IDPESSOA = P1.IDPESSOA'
      'F.IDESTAB    = P2.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '15'
      '40'
      '15'
      '15'
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 698
    Top = 288
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = CdsDetBeforeEdit
    Left = 547
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = CdsEtapaBeforeEdit
    AfterScroll = CdsEtapaAfterScroll
    Left = 591
    Top = 1
  end
  object CdsHonorarios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 423
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 410
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 423
  end
  object CdsVara: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 409
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 396
  end
  object CdsTipoEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 19
    Top = 424
  end
  object CdsProcVinc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 409
  end
  object CdsUF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 542
    Top = 410
  end
  object CdsPartic: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 487
    Top = 409
  end
  object CdsTipoObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 19
    Top = 411
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 19
    Top = 397
  end
  object CdsLitis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 507
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 397
  end
  object CdsTipoProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 424
  end
  object CdsTRT: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 411
  end
  object CdsTipAcao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 397
  end
  object CdsAdvCasa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 423
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 410
  end
  object CdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 397
  end
  object CdsTipSent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 375
    Top = 424
  end
  object MontaSelectProcVinc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Processo a Vincular'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.JCJ'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.CODIGOTRT'
      'TRT.DESCRICAO'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Reclamante'
      'Data de Notificação'
      'Número da Vara (JCJ)'
      'Número Proc. na Vara'
      'Código do TRT'
      'Nome do TRT'
      'Número Proc. no TRT'
      'Número Proc. no TST'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'TRT')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.CODIGOTRT        = TRT.CODIGOTRT(+)'
      'PROCESSOTRAB.INDMATERIA       = 1')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '15'
      '15'
      '40'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 698
    Top = 275
  end
  object MontaSelectPROCPREV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Contra-Parte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA (+)'
      'PROCESSOTRAB.INDMATERIA       > 1'
      'PROCESSOTRAB.INDMATERIA       < 4')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 725
    Top = 387
  end
  object MontaSelectPROCJUD: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Contra-Parte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA(+)'
      'PROCESSOTRAB.INDMATERIA       > 3')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 725
    Top = 373
  end
  object MontaSelectMODCON: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.JCJ'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.CODIGOTRT'
      'TRT.DESCRICAO'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Reclamante'
      'Data de Notificação'
      'Número da Vara (JCJ)'
      'Número Proc. na Vara'
      'Código do TRT'
      'Nome do TRT'
      'Número Proc. no TRT'
      'Número Proc. no TST'
      'Número Proc. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'TRT')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.CODIGOTRT        = TRT.CODIGOTRT(+)'
      'PROCESSOTRAB.INDMATERIA       = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '15'
      '15'
      '40'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 725
    Top = 359
  end
end
