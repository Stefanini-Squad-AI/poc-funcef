inherited frmParamRelBoletas: TfrmParamRelBoletas
  Left = 252
  Top = 239
  Caption = 'Consulta à Cobranças via Banco'
  ClientHeight = 473
  ClientWidth = 517
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 434
    object pnlOutrasCondicoes: TPanel
      Left = 16
      Top = 51
      Width = 481
      Height = 275
      TabOrder = 2
      object GroupBox2: TGroupBox
        Left = 7
        Top = 229
        Width = 465
        Height = 39
        TabOrder = 6
        object Label2: TLabel
          Left = 8
          Top = 12
          Width = 83
          Height = 13
          Caption = 'Nosso Número'
        end
        object edNossoNumero: TEdit
          Left = 184
          Top = 12
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 7
        Top = 191
        Width = 465
        Height = 39
        TabOrder = 5
        object Label8: TLabel
          Left = 8
          Top = 12
          Width = 100
          Height = 13
          Caption = 'Valor Pago entre '
        end
        object Label9: TLabel
          Left = 316
          Top = 12
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object edValorPagoMin: TEditNum
          Left = 184
          Top = 12
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          IntDigits = 10
          Signal = False
          DecDigits = 2
          Numeric = True
        end
        object edValorPagoMax: TEditNum
          Left = 336
          Top = 12
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          IntDigits = 10
          Signal = False
          DecDigits = 2
          Numeric = True
        end
      end
      object GroupBox4: TGroupBox
        Left = 7
        Top = 154
        Width = 465
        Height = 39
        TabOrder = 4
        object Label10: TLabel
          Left = 8
          Top = 12
          Width = 124
          Height = 13
          Caption = 'Valor Esperado entre '
        end
        object Label11: TLabel
          Left = 316
          Top = 12
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object edValorEspMin: TEditNum
          Left = 184
          Top = 12
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          IntDigits = 10
          Signal = False
          DecDigits = 2
          Numeric = True
        end
        object edValorEspMax: TEditNum
          Left = 336
          Top = 12
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          IntDigits = 10
          Signal = False
          DecDigits = 2
          Numeric = True
        end
      end
      object GroupBox5: TGroupBox
        Left = 7
        Top = 116
        Width = 465
        Height = 39
        TabOrder = 3
        object Label12: TLabel
          Left = 8
          Top = 12
          Width = 129
          Height = 13
          Caption = 'Data de Emissão entre'
        end
        object Label13: TLabel
          Left = 316
          Top = 12
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object dtEmissaoIni: TCMDateTimePicker
          Left = 184
          Top = 12
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
          TabOrder = 0
        end
        object dtEmissaoFim: TCMDateTimePicker
          Left = 336
          Top = 12
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
          TabOrder = 1
        end
      end
      object GrBxMesCob: TGroupBox
        Left = 7
        Top = 78
        Width = 465
        Height = 39
        TabOrder = 2
        object Label17: TLabel
          Left = 8
          Top = 12
          Width = 133
          Height = 13
          Caption = 'Mês de Cobrança entre'
        end
        object Label18: TLabel
          Left = 316
          Top = 12
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object MEdMesCobIni: TMaskEdit
          Left = 183
          Top = 12
          Width = 121
          Height = 21
          EditMask = '!9999/99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          Text = '    /  '
        end
        object MEdMesCobFim: TMaskEdit
          Left = 336
          Top = 12
          Width = 121
          Height = 21
          EditMask = '!9999/99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 1
          Text = '    /  '
        end
      end
      object GroupBox7: TGroupBox
        Left = 7
        Top = 41
        Width = 465
        Height = 39
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 12
          Width = 141
          Height = 13
          Caption = 'Mês de Referência entre'
        end
        object Label16: TLabel
          Left = 316
          Top = 12
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object edMesCobIni: TMaskEdit
          Left = 183
          Top = 12
          Width = 121
          Height = 21
          EditMask = '!9999/99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          Text = '    /  '
        end
        object edMesCobFim: TMaskEdit
          Left = 336
          Top = 12
          Width = 121
          Height = 21
          EditMask = '!9999/99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 1
          Text = '    /  '
        end
      end
      object GroupBox6: TGroupBox
        Left = 7
        Top = 3
        Width = 465
        Height = 39
        TabOrder = 0
        object Label14: TLabel
          Left = 8
          Top = 16
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object dblkpcmbPatro: TwwDBLookupCombo
          Left = 184
          Top = 12
          Width = 273
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Patrocinadora')
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
    object pnlParticipante: TPanel
      Left = 16
      Top = 51
      Width = 481
      Height = 275
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label4: TLabel
        Left = 8
        Top = 105
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label5: TLabel
        Left = 8
        Top = 150
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label6: TLabel
        Left = 149
        Top = 105
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label7: TLabel
        Left = 149
        Top = 150
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object edParticipante: TEdit
        Left = 8
        Top = 81
        Width = 464
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edMatricula: TEdit
        Left = 8
        Top = 123
        Width = 121
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edNumInsc: TEdit
        Left = 8
        Top = 166
        Width = 121
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPatrocinadora: TEdit
        Left = 149
        Top = 123
        Width = 323
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edPlano: TEdit
        Left = 149
        Top = 166
        Width = 323
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 3
        Width = 465
        Height = 58
        TabOrder = 5
        object Label1: TLabel
          Left = 12
          Top = 24
          Width = 145
          Height = 13
          Caption = 'Escolha o Participante ...'
        end
        object bbtnProcurar: TBitBtn
          Left = 312
          Top = 16
          Width = 88
          Height = 33
          Hint = 'Procurar Processo de Benefício'
          Caption = '&Procurar'
          Default = True
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
      end
      object ckbPlano: TCheckBox
        Left = 150
        Top = 197
        Width = 163
        Height = 17
        Hint = 
          'Clique nesta opção caso deseje ver todos os planos do participan' +
          'tes.'
        Caption = 'Não filtrar por plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
    end
    object rgrpPagamento: TRadioGroup
      Left = 24
      Top = 330
      Width = 253
      Height = 97
      Caption = ' Filtrar Tipo ...'
      ItemIndex = 1
      Items.Strings = (
        'Pendente Enviado'
        'Pendente Não Enviado'
        'Totalmente Efetuado'
        'Parcialmente Efetuado'
        'Cancelado'
        'Todos')
      TabOrder = 3
      TabStop = True
    end
    object rgrpTipoConsulta: TRadioGroup
      Left = 24
      Top = 8
      Width = 465
      Height = 40
      Caption = ' Consultar por '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Participante Específico'
        'Outras Condições')
      TabOrder = 0
      OnClick = rgrpTipoConsultaClick
    end
    object rgrpOrdem: TRadioGroup
      Left = 285
      Top = 330
      Width = 208
      Height = 97
      Caption = ' Ordenar Por ...'
      ItemIndex = 0
      Items.Strings = (
        'Matrícula'
        'Inscrição No.'
        'Nome do Contribuinte')
      TabOrder = 4
      TabStop = True
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 261
      DockPos = 261
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
      DockPos = 92
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1032
    Top = 65495
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
      'N'
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
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
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
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 371
    Top = 267
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 455
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
