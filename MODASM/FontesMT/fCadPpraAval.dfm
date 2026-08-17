inherited frmCadPpraAval: TfrmCadPpraAval
  Left = 51
  Top = 100
  Caption = 'Avaliação PPRA'
  ClientHeight = 453
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 367
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 684
      Height = 45
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label10: TLabel
        Left = 107
        Top = 3
        Width = 106
        Height = 13
        Caption = 'Data da Avaliação'
      end
      object dbedCodigo: TDBEdit
        Left = 8
        Top = 17
        Width = 80
        Height = 21
        Color = clGray
        DataField = 'IDAVAL'
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
      object CMDateTimePicker1: TCMDateTimePicker
        Left = 106
        Top = 17
        Width = 106
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAAVAL'
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
      object gbxResponsavel: TGroupBox
        Left = 229
        Top = 2
        Width = 440
        Height = 41
        Caption = 'Empresa ou Pessoa Responsável pela Avaliação'
        TabOrder = 2
        object edNomeResponsavel: TEdit
          Left = 6
          Top = 13
          Width = 395
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
        object bbtnProcResponsavel: TBitBtn
          Left = 408
          Top = 11
          Width = 25
          Height = 24
          Hint = 'Procura Empresa ou Pessoa Responsável pela Avaliação'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnProcResponsavelClick
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
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 49
      Width = 684
      Height = 314
      Tabs.Strings = (
        'Dados Básicos'
        'Descrição e CIPA'
        'Laudo e População'
        'Agentes de Risco'
        'Medidas Preventivas e Corretivas')
      detdbGrids.Strings = (
        ''
        ''
        ''
        'dbgrdDet'
        'dbgrdDet2')
      inherited pgctrlDetalhe: TPageControl
        Width = 586
        Height = 255
        ActivePage = tbsDadosBasicos
        object tbsDadosBasicos: TTabSheet [0]
          Caption = 'tbsDadosBasicos'
          ImageIndex = 1
          object dbrgTipo: TDBRadioGroup
            Left = 15
            Top = 8
            Width = 135
            Height = 102
            Caption = 'Tipo de Avaliação'
            DataField = 'INDTIPOAVAL'
            DataSource = ds
            Items.Strings = (
              'Antecipação'
              'Reconhecimento'
              'Reavaliação')
            TabOrder = 0
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object gbxEstab: TGroupBox
            Left = 174
            Top = 62
            Width = 441
            Height = 49
            Caption = 'Estabelecimento a que se Refere (em branco se for geral)'
            TabOrder = 1
            object dblcEstab: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 415
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDESTAB'
              DataSource = ds
              LookupTable = CdsPessoaFilialPessoa
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
          object gbxLocal: TGroupBox
            Left = 174
            Top = 117
            Width = 441
            Height = 49
            Caption = 'Local de Trabalho a que se Refere (em branco se for geral)'
            TabOrder = 2
            object dblcLocal: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 415
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDLOCALIZACAO'
              DataSource = ds
              LookupTable = CdsLocal
              LookupField = 'IDLOCALIZACAO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
          object gbxFuncao: TGroupBox
            Left = 174
            Top = 173
            Width = 441
            Height = 49
            Caption = 'Cargo ou Função a que se Refere (em branco se for geral)'
            TabOrder = 3
            object dblcCargo: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 415
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'40'#9'TITULO'#9'F')
              DataField = 'IDCARGO'
              DataSource = ds
              LookupTable = CdsCargo
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
          object gbxHorario: TGroupBox
            Left = 174
            Top = 228
            Width = 441
            Height = 49
            Caption = 'Horário de Trabalho a que se Refere (em branco se for geral)'
            TabOrder = 4
            object dblcHorario: TwwDBLookupCombo
              Left = 6
              Top = 17
              Width = 415
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOMEHORARIO'#9'40'#9'NOMEHORARIO'#9'F')
              DataField = 'IDHORARIO'
              DataSource = ds
              LookupTable = CdsHorario
              LookupField = 'IDHORARIO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
          object gbxEmpresa: TGroupBox
            Left = 174
            Top = 8
            Width = 441
            Height = 49
            Caption = 'Empresa a que se Refere (em branco se for geral)'
            TabOrder = 5
            object dblcEmpresa: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 415
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDEMPRESA'
              DataSource = ds
              LookupTable = CdsEmpresa
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
        end
        object tbsDescricao: TTabSheet [1]
          Caption = 'tbsDescricao'
          ImageIndex = 2
          object Label3: TLabel
            Left = 9
            Top = 1
            Width = 146
            Height = 13
            Caption = 'Descrição / Observações'
          end
          object dbmemOBS: TDBMemo
            Left = 9
            Top = 15
            Width = 648
            Height = 114
            DataField = 'DESCRICAO'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
            WantTabs = True
          end
          object gbxCIPA: TGroupBox
            Left = 9
            Top = 141
            Width = 648
            Height = 88
            Caption = 'Informações sobre CIPA'
            TabOrder = 1
            object Label2: TLabel
              Left = 12
              Top = 23
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Qtde. Membros'
              FocusControl = dbedCodigo
            end
            object Label11: TLabel
              Left = 12
              Top = 58
              Width = 158
              Height = 13
              Caption = 'Pessoa de Contato na CIPA'
              FocusControl = dbedCodigo
            end
            object dbedNumPess: TDBRealEdit
              Left = 102
              Top = 21
              Width = 86
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
              DataField = 'NUMPESSCIPA'
              DataSource = dsCipa
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 200
              Top = 9
              Width = 384
              Height = 41
              Caption = 'Tipo / Composição'
              Columns = 3
              DataField = 'INDCIPA'
              DataSource = dsCipa
              Items.Strings = (
                'Interna'
                'Externa'
                'Mista')
              TabOrder = 1
              Values.Strings = (
                'I'
                'E'
                'M')
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 200
              Top = 56
              Width = 384
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDCONTATO'
              DataSource = ds
              LookupTable = CdsCipaMembro
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
            end
          end
        end
        object tbsTextos: TTabSheet [2]
          Caption = 'tbsTextos'
          ImageIndex = 3
          object Label9: TLabel
            Left = 10
            Top = 3
            Width = 132
            Height = 13
            Caption = 'Laudo Técnico Pericial'
          end
          object dbmemTextos: TDBMemo
            Left = 10
            Top = 18
            Width = 648
            Height = 119
            DataField = 'TEXTOCOMPL'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
            WantTabs = True
          end
          object gbxConta: TGroupBox
            Left = 10
            Top = 154
            Width = 648
            Height = 75
            Caption = 'Contagem de Empregados no Contexto desta Avaliação'
            TabOrder = 1
            object Label12: TLabel
              Left = 27
              Top = 25
              Width = 58
              Height = 13
              Caption = 'Masc. Maior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 27
              Top = 49
              Width = 62
              Height = 13
              Caption = 'Masc. Menor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 163
              Top = 25
              Width = 52
              Height = 13
              Caption = 'Fem. Maior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 163
              Top = 49
              Width = 56
              Height = 13
              Caption = 'Fem. Menor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 307
              Top = 25
              Width = 89
              Height = 13
              Caption = 'Defic. Masc. Maior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 308
              Top = 49
              Width = 93
              Height = 13
              Caption = 'Defic. Masc. Menor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 484
              Top = 49
              Width = 87
              Height = 13
              Caption = 'Defic. Fem. Menor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 483
              Top = 25
              Width = 83
              Height = 13
              Caption = 'Defic. Fem. Maior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object red5: TRealEdit
              Left = 92
              Top = 48
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red1: TRealEdit
              Left = 92
              Top = 21
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red2: TRealEdit
              Left = 226
              Top = 21
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red6: TRealEdit
              Left = 226
              Top = 46
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red3: TRealEdit
              Left = 409
              Top = 21
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red7: TRealEdit
              Left = 409
              Top = 46
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red4: TRealEdit
              Left = 576
              Top = 21
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object red8: TRealEdit
              Left = 576
              Top = 46
              Width = 45
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
          object bbtnConta: TBitBtn
            Left = 323
            Top = 233
            Width = 35
            Height = 27
            Hint = 'Faz a Contagem nas Condições Atuais'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = bbtnContaClick
            Glyph.Data = {
              EE050000424DEE05000000000000360400002800000011000000160000000100
              080000000000B801000000000000000000000001000000000000000000000000
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
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFC000000FCFC00000000000000000000000000FCFC00
              0000FC000606060606060606060606060600FC000000FC00FE00000600000600
              000600000600FC000000FC00FEFE0006FE0006FE0006FE000600FC000000FC00
              FE06060606060606060606060600FC000000FC00FE0000060000060000060000
              0600FC000000FC00FEFE0006FE0006FE0006FE000600FC000000FC00FE060606
              06060606060606060600FC000000FC00FE00000600000600000600000600FC00
              0000FC00FEFE0006FE0006FE0006FE000600FC000000FC00FE06060606060606
              060606060600FC000000FC00FE00000600000600000600000600FC000000FC00
              FEFE0006FE0006FE0006FE000600FC000000FC00FE0606060606060606060606
              0600FC000000FC00FE06060606060606060606060600FC000000FC00FE0007FF
              FFFFFFFFFFFFFF000600FC000000FC00FE00070707070707070707000600FC00
              0000FC00FE00000000000000000000000600FC000000FC00FEFEFEFEFEFEFEFE
              FEFEFEFE0600FC000000FCFC00000000000000000000000000FCFC000000FCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 578
            Height = 227
            Selected.Strings = (
              'DESCRICAO'#9'79'#9'Descrição do Agente'#9'F'
              'GRADUACAO'#9'10'#9'Graduação')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 578
            Height = 227
            object Label8: TLabel
              Left = 6
              Top = 11
              Width = 120
              Height = 13
              Caption = 'Descrição do Agente'
              FocusControl = dbedCodigo
            end
            object Label4: TLabel
              Left = 6
              Top = 43
              Width = 118
              Height = 13
              Caption = 'Meio de Propagação'
              FocusControl = dbedCodigo
            end
            object Label5: TLabel
              Left = 6
              Top = 77
              Width = 130
              Height = 13
              Caption = 'Meio de Contaminação'
              FocusControl = dbedCodigo
            end
            object Label7: TLabel
              Left = 6
              Top = 144
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object dblcAgente: TwwDBLookupCombo
              Left = 147
              Top = 7
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO'#9'F')
              DataField = 'IDAGENTERISCO'
              DataSource = dsDet
              LookupTable = CdsAgenteRisco
              LookupField = 'IDAGENTERISCO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcAgenteCloseUp
            end
            object dblcMeioProp: TwwDBLookupCombo
              Left = 147
              Top = 39
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO'#9'F')
              DataField = 'IDPPRAMEIOPROP'
              DataSource = dsDet
              LookupTable = CdsMeio
              LookupField = 'IDPPRAMEIO'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcAgenteCloseUp
            end
            object dblcMeioCont: TwwDBLookupCombo
              Left = 147
              Top = 73
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO'#9'F')
              DataField = 'IDPPRAMEIOCONT'
              DataSource = dsDet
              LookupTable = CdsMeio
              LookupField = 'IDPPRAMEIO'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcAgenteCloseUp
            end
            object dbrgPeriodo: TDBRadioGroup
              Left = 6
              Top = 99
              Width = 261
              Height = 41
              Caption = 'Periodicidade de Ocorrência'
              Columns = 3
              DataField = 'INDPERIODO'
              DataSource = dsDet
              Items.Strings = (
                'Habitual'
                'Ocasional')
              TabOrder = 3
              Values.Strings = (
                '1'
                '2')
            end
            object dbmemObserv: TDBMemo
              Left = 6
              Top = 158
              Width = 560
              Height = 65
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 5
              WantTabs = True
            end
            object gbxGraduacao: TGroupBox
              Left = 305
              Top = 99
              Width = 261
              Height = 41
              Caption = 'Graduação do Impacto Ambiental (1 a 4)'
              TabOrder = 4
              object wwDBSpinEdit1: TwwDBSpinEdit
                Left = 106
                Top = 15
                Width = 49
                Height = 21
                Increment = 1
                MaxValue = 4
                MinValue = 1
                Value = 1
                DataField = 'GRADUACAO'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tbsDet2: TTabSheet
          Caption = 'tbsDet2'
          ImageIndex = 4
          object dbgrdDet2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 227
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Ação Proposta'
              'DATAPLAN'#9'14'#9'Data Planejada'
              'DATAREAL'#9'13'#9'Data Efetiva'
              'CLASSEBEM'#9'60'#9'Equipamento de Proteção')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet2
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
          object pnlControlesDet2: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 227
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label6: TLabel
              Left = 80
              Top = 19
              Width = 109
              Height = 13
              Caption = 'Descrição da Ação'
              FocusControl = dbedCodigo
            end
            object Label20: TLabel
              Left = 236
              Top = 69
              Width = 88
              Height = 13
              Caption = 'Data Planejada'
            end
            object Label21: TLabel
              Left = 236
              Top = 125
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object Label22: TLabel
              Left = 82
              Top = 169
              Width = 279
              Height = 13
              Caption = 'Tipo de Equipamento de Proteção a ser Utilizado'
              FocusControl = dbedCodigo
            end
            object dblcAcoes: TwwDBLookupCombo
              Left = 80
              Top = 33
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO'#9'F')
              DataField = 'IDACOES'
              DataSource = dsDet2
              LookupTable = CdsAcoes
              LookupField = 'IDACOES'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcAcoesCloseUp
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 235
              Top = 83
              Width = 106
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPLAN'
              DataSource = dsDet2
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
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 235
              Top = 139
              Width = 106
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREAL'
              DataSource = dsDet2
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
            object dblcEP: TwwDBLookupCombo
              Left = 82
              Top = 183
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Grupo de EPs'#9'F'
                'EQUIPROT'#9'10'#9'Tipo'#9'F')
              DataField = 'IDCLASSEBEM'
              DataSource = dsDet2
              LookupTable = CdsClasseBem
              LookupField = 'IDCLASSEBEM'
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcEPCloseUp
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 676
      end
      inherited Dock974: TDock97
        Left = 590
        Height = 255
      end
    end
  end
  inherited Dock972: TDock97
    Width = 692
    object sbtnFicha: TToolbarButton97 [0]
      Left = 300
      Top = 0
      Width = 60
      Height = 41
      Hint = 'Imprimir a Ficha da Avaliação'
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
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 692
    inherited tb97Fundo: TToolbar97
      Left = 436
      DockPos = 436
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 269
      DockPos = 269
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 381
    Top = 15
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 382
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Avaliação PPRA'
    Colunas.Strings = (
      'DATAAVAL'
      'SUBSTR(DESCRICAO, 1, 100)  AS DESCRICAOPARCIAL'
      'DESCRICAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Data'
      'Descrição Abreviada'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PPRAAVAL')
    CamposChave.Strings = (
      'IDAVAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '100'
      '20')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
  end
  object CdsPessoaFilialPessoa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsPessoaFilialPessoaNOME'
        Fields = 'NOME'
      end>
    IndexName = 'CdsPessoaFilialPessoaNOME'
    Params = <>
    StoreDefs = True
    Left = 482
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 370
    Top = 113
  end
  object CdsCipa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 234
    Top = 233
  end
  object CdsCipaMembro: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 338
    Top = 241
  end
  object dsCipa: TwwDataSource
    DataSet = CdsCipa
    Left = 231
    Top = 284
  end
  object dsCipaMembro: TwwDataSource
    DataSet = CdsCipaMembro
    Left = 367
    Top = 292
  end
  object CdsAgenteRisco: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 418
    Top = 241
  end
  object dsAgenteRisco: TwwDataSource
    DataSet = CdsAgenteRisco
    Left = 423
    Top = 292
  end
  object CdsMeio: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 146
    Top = 233
  end
  object dsMeio: TwwDataSource
    DataSet = CdsMeio
    Left = 151
    Top = 284
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEHORARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 490
    Top = 241
  end
  object CdsHorario: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEHORARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 498
    Top = 297
  end
  object CdsLocal: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 498
    Top = 353
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = CdsDet2
    Left = 486
    Top = 111
  end
  object CdsDet2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 546
    Top = 113
  end
  object CdsAcoes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDACOES'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 50
    Top = 241
  end
  object dsAcoes: TwwDataSource
    DataSet = CdsAcoes
    Left = 47
    Top = 308
  end
  object CdsContagem: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 618
    Top = 281
  end
  object CdsEmpresa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsPessoaFilialPessoaNOME'
        Fields = 'NOME'
      end>
    IndexName = 'CdsPessoaFilialPessoaNOME'
    Params = <>
    StoreDefs = True
    Left = 594
    Top = 1
  end
  object CdsClasseBem: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCLASSEBEM'
        DataType = ftFloat
      end
      item
        Name = 'INDEQUIPROT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPROT'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 114
    Top = 353
  end
end
