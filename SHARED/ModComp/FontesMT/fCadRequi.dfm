inherited frmCadRequi: TfrmCadRequi
  Left = 296
  Top = 82
  HelpContext = 730010
  Caption = 'Requisições de Pessoal'
  ClientHeight = 507
  ClientWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 421
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 755
      Height = 118
      object Label1: TLabel
        Left = 9
        Top = 3
        Width = 44
        Height = 13
        Caption = 'Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 117
        Top = 3
        Width = 95
        Height = 13
        Caption = 'Data Requisição'
      end
      object Label3: TLabel
        Left = 115
        Top = 45
        Width = 103
        Height = 13
        Caption = 'Data de Admissão'
      end
      object imgAber: TImage
        Left = 245
        Top = 100
        Width = 15
        Height = 20
        Picture.Data = {
          07544269746D617076010000424D760100000000000076000000280000002000
          0000100000000100040000000000000100000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000007F7F
          7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00555555555555555555555555555555555555555555555555555555555555
          5555555555555555555555555555555555555555555555555555555FFFFFFFFF
          F55555000000000055555577777777775F55500B8B8B8B8B05555775F5555555
          75F550F0B8B8B8B8B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFF
          FF7F50FBF0000000000557F557777777777550BFBFBFBFB0555557F555555557
          F55550FBFBFBFBF0555557F555555FF7555550BFBFBF00055555575F55557775
          5555550BFBF0555555555575FFF7555555555570000755555555555777755555
          5555555555555555555555555555555555555555555555555555555555555555
          5555}
        Transparent = True
        Visible = False
      end
      object imgEncer: TImage
        Left = 345
        Top = 100
        Width = 15
        Height = 20
        Picture.Data = {
          07544269746D617076010000424D760100000000000076000000280000002000
          0000100000000100040000000000000100000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000007F7F
          7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555FFFFFFFFFF555550000000000555555777777777
          7F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0555557F55555555
          7F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0555557F55555555
          7F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF
          7555550000000000555555777777777755555550FBFB0555555555575FFF7555
          5555555700007555555555557777555555555555555555555555555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          5555}
        Transparent = True
        Visible = False
      end
      object imgCancel: TImage
        Left = 431
        Top = 99
        Width = 20
        Height = 20
        Picture.Data = {
          07544269746D617066010000424D660100000000000076000000280000001400
          0000140000000100040000000000F00000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888880000888888888888888888980000889888888888
          8888898800008899887777777777988800008899900000000009988800008889
          90BFFFBFFF9988880000888899FCCCCCCF97888800008888999FBFFFB9978888
          000088888999CCC9990788880000888880999FB99F0788880000888880FC9999
          CF0788880000888880FF9999BF0788880000888880FC99990007888800008888
          80B99F099F0788880000888880999F099998888800008888999FBF0F08998888
          0000889999000000888998880000889998888888888889880000888888888888
          888888980000888888888888888888880000}
        Transparent = True
        Visible = False
      end
      object Label6: TLabel
        Left = 485
        Top = 3
        Width = 131
        Height = 13
        Caption = 'Motivo da Substituição'
      end
      object Label14: TLabel
        Left = 9
        Top = 45
        Width = 88
        Height = 13
        Caption = 'Salário a Pagar'
        FocusControl = dbedNumero
      end
      object Label19: TLabel
        Left = 486
        Top = 38
        Width = 119
        Height = 13
        Caption = 'Motivo da Ampliação'
      end
      object dbedNumero: TDBEdit
        Left = 9
        Top = 17
        Width = 100
        Height = 21
        Color = clGray
        DataField = 'NUMREQ'
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
      object dbedData: TCMDateTimePicker
        Left = 117
        Top = 17
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAREQ'
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
      object dbedDataPlan: TCMDateTimePicker
        Left = 117
        Top = 59
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPLAN'
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
        TabOrder = 9
      end
      object dbrgTipo: TDBRadioGroup
        Left = 224
        Top = 1
        Width = 108
        Height = 62
        Caption = 'Tipo'
        DataField = 'TIPOREQ'
        DataSource = ds
        Items.Strings = (
          'Ampliação'
          'Substituição')
        TabOrder = 3
        Values.Strings = (
          '1'
          '2')
        OnChange = dbrgTipoChange
      end
      object dbrgTipAmpl: TDBRadioGroup
        Left = 339
        Top = 1
        Width = 134
        Height = 62
        Caption = 'Ampliação Prevista'
        DataField = 'TIPOAMPL'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 4
        Values.Strings = (
          '1'
          '2')
      end
      object dbrgSituacao: TDBRadioGroup
        Left = 224
        Top = 62
        Width = 249
        Height = 37
        Caption = 'Situação'
        Columns = 3
        DataField = 'SITUACAO'
        DataSource = ds
        Items.Strings = (
          'Aberta'
          'Encerrada'
          'Cancelada')
        TabOrder = 6
        Values.Strings = (
          'A'
          'E'
          'C')
        OnChange = dbrgSituacaoChange
      end
      object dblcMotivo: TwwDBLookupCombo
        Left = 484
        Top = 16
        Width = 258
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        DataField = 'IDMOTIVO'
        DataSource = ds
        LookupTable = CdsMotivo
        LookupField = 'IDMOTIVO'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dbedSalario: TDBRealEdit
        Left = 8
        Top = 59
        Width = 100
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
        DataField = 'SALARIO'
        DataSource = ds
      end
      object dbedDataAdmissao: TCMDateTimePicker
        Left = 116
        Top = 59
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAADMISSAO'
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
        TabOrder = 7
      end
      object dbmMotAmpli: TDBMemo
        Left = 484
        Top = 52
        Width = 257
        Height = 41
        DataField = 'MOTIVOAMPLIACAO'
        DataSource = ds
        MaxLength = 500
        ScrollBars = ssVertical
        TabOrder = 8
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 120
      Width = 755
      Height = 299
      Tabs.Strings = (
        'Dados Gerais'
        'Observações Pessoais'
        'Observações Profissionais'
        'Candidatos'
        'Gestores')
      detdbGrids.Strings = (
        ''
        ''
        ''
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 657
        Height = 240
        ActivePage = tbsDadosGerais
        object tbsDadosGerais: TTabSheet [0]
          Caption = 'Dados Gerais'
          ImageIndex = 1
          object Label10: TLabel
            Left = 3
            Top = 39
            Width = 134
            Height = 13
            Caption = 'Cargo a ser Preenchido'
          end
          object Label12: TLabel
            Left = 241
            Top = 3
            Width = 103
            Height = 13
            Caption = 'Grau de Instrução'
          end
          object Label13: TLabel
            Left = 2
            Top = 79
            Width = 94
            Height = 13
            Caption = 'Estabelecimento'
          end
          object Label16: TLabel
            Left = 1
            Top = 115
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label21: TLabel
            Left = 242
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Curso(s)'
          end
          object Label22: TLabel
            Left = 241
            Top = 97
            Width = 114
            Height = 13
            Caption = 'Horário de Trabalho'
          end
          object Label23: TLabel
            Left = 1
            Top = 174
            Width = 218
            Height = 13
            Caption = 'Tempo de experiência na área/função'
          end
          object Label24: TLabel
            Left = 3
            Top = 1
            Width = 101
            Height = 13
            Caption = 'Número de Vagas'
          end
          object dblckCargo: TwwDBLookupCombo
            Left = 3
            Top = 53
            Width = 225
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'TITULO')
            DataField = 'IDCARGO'
            DataSource = ds
            LookupTable = CdsCargo
            LookupField = 'IDCARGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dbrgSexo: TDBRadioGroup
            Left = 493
            Top = 2
            Width = 97
            Height = 67
            Caption = 'Sexo'
            DataField = 'SEXO'
            DataSource = ds
            Items.Strings = (
              'Masculino'
              'Feminino'
              'Qualquer')
            TabOrder = 1
            Values.Strings = (
              'M'
              'F'
              'I')
          end
          object dblckGrauInstr: TwwDBLookupCombo
            Left = 241
            Top = 17
            Width = 225
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            DataField = 'IDGRINSTR'
            DataSource = ds
            LookupTable = CdsGrauInstr
            LookupField = 'IDGRINSTR'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dbrgTipContra: TDBRadioGroup
            Left = 492
            Top = 70
            Width = 173
            Height = 65
            Caption = 'Tipo de Contrato'
            DataField = 'TIPOCONTRATO'
            DataSource = ds
            Items.Strings = (
              'Efetivo'
              'Temporário'
              'Estagiário')
            TabOrder = 3
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object dblckEstab: TwwDBLookupCombo
            Left = 2
            Top = 93
            Width = 226
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDESTAB'
            DataSource = ds
            LookupTable = CdsEstab
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object CMProcuraSubst: TCMProcuraSubTipo
            Left = 239
            Top = 134
            Width = 487
            Height = 47
            Caption = 'Substituído'
            TabOrder = 5
            CampoEdit = ceNome
            MostraMensagens = False
            DataSource = ds
            DataField = 'IDSUBSTITUIDO'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Pessoa não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            SubTipo = stFuncionario
            FiltraSubTipo = True
          end
          object edCodCCusto: TEdit
            Left = 2
            Top = 129
            Width = 86
            Height = 21
            TabStop = False
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnChange = edCodCCustoChange
          end
          object dblckLotacao: TwwDBLookupCombo
            Left = 2
            Top = 151
            Width = 225
            Height = 21
            AutoSize = False
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome'
              'CODCENTROCUSTO'#9'10'#9'Código')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsLotacao
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            Style = csDropDownList
            DropDownWidth = 400
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnChange = dblckLotacaoChange
          end
          object CMProcuraNovo: TCMProcuraSubTipo
            Left = 239
            Top = 187
            Width = 487
            Height = 47
            Caption = 'Novo Ocupante'
            TabOrder = 8
            OnExit = CMProcuraNovoExit
            CampoEdit = ceNome
            MostraMensagens = False
            DataSource = ds
            DataField = 'IDNOVOOCUP'
            Mensagens.EmBranco = 'Novo Ocupante não pode estar em branco'
            Mensagens.NaoExiste = 'Novo Ocupante não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            SubTipo = stFuncionario
            FiltraSubTipo = True
          end
          object dbmCursos: TDBMemo
            Left = 241
            Top = 55
            Width = 224
            Height = 38
            DataField = 'CURSO'
            DataSource = ds
            MaxLength = 500
            ScrollBars = ssVertical
            TabOrder = 9
          end
          object dblckHoraTrab: TwwDBLookupCombo
            Left = 240
            Top = 110
            Width = 225
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEHORARIO'#9'30'#9'NOMEHORARIO')
            DataField = 'IDHORARIO'
            DataSource = ds
            LookupTable = CdsHrTrab
            LookupField = 'IDHORARIO'
            Style = csDropDownList
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dbrgFormaSelecao: TDBRadioGroup
            Left = 597
            Top = 2
            Width = 124
            Height = 67
            Caption = 'Forma de Seleção'
            DataField = 'FORMASELECAO'
            DataSource = ds
            Items.Strings = (
              'PSI'
              'PSE'
              'Indicação')
            TabOrder = 11
            Values.Strings = (
              '1'
              '2'
              '3'
              '')
          end
          object dbeVagas: TDBEdit
            Left = 3
            Top = 16
            Width = 121
            Height = 21
            DataField = 'NUMVAGAS'
            DataSource = ds
            MaxLength = 5
            TabOrder = 12
            OnKeyPress = dbeVagasKeyPress
          end
          object dbcbTempoExp: TwwDBComboBox
            Left = 4
            Top = 191
            Width = 223
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'TEMPOEXP'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Sem Experiência'#9'1'
              '06 Meses'#9'2'
              '01 Ano'#9'3'
              '02 a 05 Anos'#9'4'
              'Acima de 05 Anos'#9'5')
            Sorted = False
            TabOrder = 13
            UnboundDataType = wwDefault
          end
        end
        object tbsObserv: TTabSheet [1]
          Caption = 'Observações Pessoais'
          ImageIndex = 2
          object Label9: TLabel
            Left = 34
            Top = 2
            Width = 141
            Height = 13
            Caption = 'Características Pessoais'
            FocusControl = dbmObser
          end
          object Label4: TLabel
            Left = 390
            Top = 2
            Width = 162
            Height = 13
            Caption = 'Formação e Especializações'
            FocusControl = dbmObser
          end
          object Label5: TLabel
            Left = 32
            Top = 112
            Width = 38
            Height = 13
            Caption = 'Outros'
            FocusControl = dbmObser
          end
          object Label20: TLabel
            Left = 33
            Top = 90
            Width = 170
            Height = 13
            Caption = 'Selecionar de 03 a 07 caracteriticas'
            FocusControl = dbmObser
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -3
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dbmObser: TDBMemo
            Left = 30
            Top = 129
            Width = 300
            Height = 76
            DataField = 'OBSERV'
            DataSource = ds
            MaxLength = 1000
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbmObser4: TDBMemo
            Left = 390
            Top = 15
            Width = 300
            Height = 190
            DataField = 'OBSERV4'
            DataSource = ds
            MaxLength = 500
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object ClbCaracPessoais: TCheckListBox
            Left = 32
            Top = 17
            Width = 297
            Height = 73
            ItemHeight = 13
            TabOrder = 2
          end
        end
        object tbsObserv2: TTabSheet [2]
          Caption = 'Observações Profissionais'
          ImageIndex = 4
          object Label17: TLabel
            Left = 5
            Top = 3
            Width = 160
            Height = 13
            Caption = 'Conhecimentos Necessários'
          end
          object Label18: TLabel
            Left = 246
            Top = 3
            Width = 153
            Height = 13
            Caption = 'Conhecimentos Desejáveis'
          end
          object Label15: TLabel
            Left = 490
            Top = 3
            Width = 119
            Height = 13
            Caption = 'Principais Atividades'
            FocusControl = dbmObserv5
          end
          object dbmObserv2: TwwDBEdit
            Left = 4
            Top = 18
            Width = 230
            Height = 175
            AutoSize = False
            DataField = 'OBSERV2'
            DataSource = ds
            MaxLength = 500
            ShowVertScrollBar = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = True
            WordWrap = True
          end
          object dbmObserv3: TDBMemo
            Left = 248
            Top = 17
            Width = 233
            Height = 175
            DataField = 'OBSERV3'
            DataSource = ds
            MaxLength = 500
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbmObserv5: TDBMemo
            Left = 489
            Top = 17
            Width = 230
            Height = 175
            DataField = 'OBSERV5'
            DataSource = ds
            MaxLength = 500
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Candidatos'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 649
            Height = 212
            ControlType.Strings = (
              'FLGAPROVADO;CheckBox;1;0')
            Selected.Strings = (
              'FLGAPROVADO'#9'10'#9'Aprovado?'
              'NOME'#9'60'#9'Nome'
              'TITULO'#9'40'#9'Cargo a que se Candidata'
              'TIPOCAND'#9'7'#9'Categoria')
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 649
            Height = 212
            object Bevel1: TBevel
              Left = 29
              Top = 4
              Width = 476
              Height = 149
              Shape = bsFrame
              Style = bsRaised
            end
            object sbtnProcCand: TToolbarButton97
              Left = 35
              Top = 106
              Width = 128
              Height = 41
              AllowAllUp = True
              GroupIndex = 1
              Caption = '&Procurar Candidato'
              Flat = False
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
              Spacing = 0
              OnClick = sbtnProcCandClick
            end
            object sbtnProcFunc: TToolbarButton97
              Left = 371
              Top = 106
              Width = 128
              Height = 41
              AllowAllUp = True
              GroupIndex = 1
              Caption = '&Procurar Empregado'
              Flat = False
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
              Spacing = 0
              OnClick = sbtnProcFuncClick
            end
            object fcLabel1: TfcLabel
              Left = 35
              Top = 8
              Width = 464
              Height = 19
              Caption = 'Associação de um Candidato ou um Empregado a esta Requisição'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Shadow.Enabled = True
              TextOptions.Shadow.XOffset = 1
              TextOptions.Shadow.YOffset = 1
              TextOptions.VAlignment = vaTop
            end
            object dbedNomeCand: TwwDBEdit
              Left = 35
              Top = 32
              Width = 464
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'NOME'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedCargoCand: TwwDBEdit
              Left = 35
              Top = 66
              Width = 464
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'TITULO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbrgAprovado: TDBRadioGroup
              Left = 516
              Top = 25
              Width = 120
              Height = 62
              Caption = 'Aprovado?'
              DataField = 'FLGAPROVADO'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
            end
          end
        end
        object tbshGestores: TTabSheet
          Caption = 'Gestores'
          ImageIndex = 3
          object Label7: TLabel
            Left = 182
            Top = 9
            Width = 223
            Height = 13
            Caption = 'Analista RH Responsável pela Seleção'
          end
          object Label8: TLabel
            Left = 182
            Top = 50
            Width = 113
            Height = 13
            Caption = 'Supervisor Imediato'
            FocusControl = edSupervisor
          end
          object Label11: TLabel
            Left = 182
            Top = 91
            Width = 92
            Height = 13
            Caption = 'Outros Gestores'
          end
          object dblcAnalista: TwwDBLookupCombo
            Left = 182
            Top = 23
            Width = 421
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            DataField = 'IDANALISTA'
            DataSource = ds
            LookupTable = CdsAnalista
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object edSupervisor: TDBEdit
            Left = 182
            Top = 64
            Width = 421
            Height = 21
            TabStop = False
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edGestores: TwwDBEdit
            Left = 183
            Top = 106
            Width = 421
            Height = 65
            TabStop = False
            AutoSize = False
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ShowVertScrollBar = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = True
            WordWrap = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 747
      end
      inherited Dock974: TDock97
        Left = 661
        Height = 240
      end
    end
  end
  inherited Dock972: TDock97
    Width = 759
    inherited Toolbar971: TToolbar97
      object sbtnCand: TToolbarButton97
        Left = 240
        Top = 0
        Width = 80
        Height = 41
        Hint = 'Chamar o Cadastro do Candidato Apontado'
        AllowAllUp = True
        DropdownCombo = True
        Caption = 'Candidato'
        Glyph.Data = {
          CC010000424DCC01000000000000000000002800000016000000180000000100
          0400020000005601000000000000000000000000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00168800001688
          0000000A88800080000004880004484004880000048804440688000418100488
          0000048804440688041804880000048804440688041804880000048804440280
          048804180004108800000488044402800488000807081088000004880444000E
          80888744471088000000000488180444000E8088174447108800000000048887
          0444000E71787CCCC00088000000000488470444000E78880CC4C08188000000
          0004884804440004748806C4000408880000000488470444000E8488C4CCC408
          880000000016884448844488C4C0CC0888000000001688444FF44488C408CC78
          88000000001288444FF44488CCFC0C0004880000001288444FF44788CCFC0C00
          048800000E880201068800000488000480080488000687110700048800000488
          0004011006880004010804880000048804000688000400080488000004880004
          87780688027706880000168800000001}
        Layout = blGlyphTop
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnCandClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 468
    Width = 759
    inherited tb97Fundo: TToolbar97
      Left = 587
      DockPos = 597
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 418
      DockPos = 428
    end
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      object sbtnImprimirReq: TSpeedButton
        Left = 0
        Top = 0
        Width = 163
        Height = 33
        Caption = '  &Imprimir Requisição'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = sbtnImprimirReqClick
      end
      object sbtnCopiarReq: TSpeedButton
        Left = 163
        Top = 0
        Width = 163
        Height = 33
        Caption = '  &Copiar Requisição'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = sbtnCopiarReqClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 646
    Top = 15
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    OnStateChange = dsStateChange
    Left = 350
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 430
    Top = 73
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 706
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    BeforePost = CdsBeforePost
    Left = 322
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Requisição'
    Colunas.Strings = (
      'R.NUMREQ'
      'R.DATAREQ'
      'R.DATAPLAN'
      'C.TITULO'
      'F1.MATRICULA'
      'P1.NOME'
      'F2.MATRICULA'
      'P2.NOME'
      'ESTAB.NOME'
      'CC.CODCENTROCUSTO'
      'CC.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Num.Requisição'
      'Data Requisição'
      'Data Desejada'
      'Cargo'
      'Matr.Substituído'
      'Nome Substituído'
      'Matr.Ocupante'
      'Nome Ocupante'
      'Estabelecimento'
      'Cod.Centro Custo'
      'Nome Centro Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'REQUIPES R'
      'CARGO    C'
      'FUNCIONARIO F1'
      'PESSOA   P1'
      'FUNCIONARIO F2'
      'PESSOA   P2'
      'PESSOA   ESTAB'
      'CENTCUST CC')
    CamposChave.Strings = (
      'R.NUMREQ')
    Filtro.Strings = (
      'R.IDCARGO = C.IDCARGO(+)'
      'R.IDSUBSTITUIDO = F1.IDPESSOA(+)'
      'R.IDSUBSTITUIDO = P1.IDPESSOA(+)'
      '(R.IDSUBSTITUIDO IS NULL OR P1.IDPESSOA = F1.IDPESSOA)'
      'R.IDNOVOOCUP = F2.IDPESSOA(+)'
      'R.IDNOVOOCUP = P2.IDPESSOA(+)'
      '(R.IDNOVOOCUP IS NULL OR P2.IDPESSOA = F2.IDPESSOA)'
      'R.IDESTAB = ESTAB.IDPESSOA(+)'
      'R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      'R.IDEMPRESA = CC.IDEMPRESA(+)')
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
      ''
      '')
    Larguras.Strings = (
      '10'
      '12'
      '12'
      '30'
      '10'
      '40'
      '10'
      '40'
      '40'
      '10'
      '40')
    UsaDistinct = True
    Left = 477
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 634
    Top = 65
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 417
    Top = 1
  end
  object MontaSelectCand: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Candidato'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'CARGO.TITULO'
      'CANDIDAT.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'CPF'
      'Nome da Pessoa'
      'Cargo'
      'Num. Registro')
    Tabelas.Strings = (
      'PESSOA'
      'CANDIDAT'
      'CARGO')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA'
      'PESSOA.NOME'
      'CARGO.TITULO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA   = CANDIDAT.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '22'
      '60'
      '40'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 582
    Top = 65535
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME'
      'CARGO.TITULO')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 518
    Top = 65529
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 307
    Top = 164
  end
  object CdsLotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 371
    Top = 166
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 275
    Top = 160
  end
  object CdsGrauInstr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 411
    Top = 162
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 383
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 339
    Top = 162
  end
  object CdsAnalista: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 211
    Top = 162
  end
  object sqlAnalista: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSOA, P.NOME'
      
        'FROM   PESSOA P, USUARIOSISTEMA U, FUNCIONARIO FU, AUTORIZA A, O' +
        'PERFUNC O, FUNCAO F'
      'WHERE'
      '   (F.IDMODULO    = 73) AND'
      '   (A.IDOPERFUNC  = O.IDOPERFUNC) AND'
      '   (O.IDFUNCAO    = F.IDFUNCAO)  AND'
      '   (F.NOMEFUNCAO  LIKE '#39'Usu%rio RH'#39') AND'
      '   (A.IDESPACESSO = U.IDESPACESSO) AND'
      '   (U.IDUSUARIO   = P.IDPESSOA) AND'
      '   (U.IDUSUARIO   = FU.IDPESSOA)'
      'ORDER BY UPPER(P.NOME)')
    ClientDataSet = CdsAnalista
    Left = 641
    Top = 177
  end
  object sqlSupervisor: TCMSqlParams
    ClientDataSet = CdsSupervisor
    Left = 713
    Top = 177
  end
  object CdsSupervisor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 243
    Top = 162
  end
  object sqlGestores: TCMSqlParams
    ClientDataSet = CdsGestores
    Left = 580
    Top = 177
  end
  object CdsGestores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 174
    Top = 162
  end
  object CdsCarac: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 143
    Top = 161
  end
  object CdsHrTrab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 161
  end
end
