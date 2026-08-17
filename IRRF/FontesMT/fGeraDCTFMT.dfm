inherited frmGeraDCTF: TfrmGeraDCTF
  Left = 294
  Top = 158
  HelpContext = 240016
  Caption = 'Gerar DCTF'
  ClientHeight = 616
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  object gbxAnoMesRef: TLabel [0]
    Left = 12
    Top = 13
    Width = 87
    Height = 13
    Caption = 'Ano Calendário'
  end
  inherited pnlFundo: TPanel
    Width = 622
    Height = 577
    object Panel1: TPanel
      Left = 5
      Top = 14
      Width = 232
      Height = 54
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 132
        Top = 11
        Width = 87
        Height = 13
        Caption = 'Ano Calendário'
      end
      object Label2: TLabel
        Left = 7
        Top = 11
        Width = 28
        Height = 13
        Caption = 'Mês '
      end
      object spnAnoCalendario: TSpinEdit
        Left = 132
        Top = 25
        Width = 91
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 2006
        TabOrder = 0
        Value = 2006
        OnChange = spnAnoCalendarioChange
      end
      object cbMes: TComboBox
        Left = 7
        Top = 25
        Width = 119
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbMesChange
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
    end
    object grpSituacaoEspecial: TGroupBox
      Left = 242
      Top = 8
      Width = 375
      Height = 61
      Caption = '     Situação Especial '
      TabOrder = 1
      object lbDtEvento: TLabel
        Left = 10
        Top = 18
        Width = 90
        Height = 13
        Caption = 'Data do Evento'
        Enabled = False
      end
      object lblEvento: TLabel
        Left = 139
        Top = 18
        Width = 41
        Height = 13
        Caption = 'Evento'
        Enabled = False
      end
      object ckbSituacao: TCheckBox
        Left = 10
        Top = -2
        Width = 17
        Height = 19
        Enabled = False
        TabOrder = 0
        OnClick = ckbSituacaoClick
      end
      object dtEvento: TCMDateTimePicker
        Left = 10
        Top = 32
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
        UnboundDataType = wwDTEdtDate
      end
      object cbEvento: TComboBox
        Left = 139
        Top = 32
        Width = 228
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Normal'
          'Extinção'
          'Fusão'
          'Incorporação / incorporada'
          'Incorporação / incorporadora'
          'Cisão Total'
          'Cisão Parcial')
      end
    end
    object grpRetificadora: TGroupBox
      Left = 292
      Top = 71
      Width = 325
      Height = 65
      Caption = '     Declaração retificadora '
      TabOrder = 3
      object lbRetificadora: TLabel
        Left = 8
        Top = 18
        Width = 280
        Height = 13
        Caption = 'Nº do recibo de entrega da DCTF a ser retificada'
        Enabled = False
      end
      object cbkRetificada: TCheckBox
        Left = 11
        Top = -2
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = cbkRetificadaClick
      end
      object mkRecRetificada: TMaskEdit
        Left = 7
        Top = 37
        Width = 123
        Height = 21
        Enabled = False
        EditMask = '99.99.99.99.99-99;0;_'
        MaxLength = 17
        TabOrder = 1
      end
    end
    object Presponsavel: TCMProcuraSubTipo
      Left = 5
      Top = 428
      Width = 612
      Height = 89
      Caption = 'Pessoa Responsável pelo Preenchimento'
      TabOrder = 6
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stCliente
      FiltraSubTipo = False
      object Label8: TLabel
        Left = 11
        Top = 44
        Width = 81
        Height = 13
        Caption = 'CRC Contador'
      end
      object Label3: TLabel
        Left = 258
        Top = 44
        Width = 90
        Height = 13
        Caption = 'UF do Contador'
      end
      object edCRCContador: TEdit
        Left = 9
        Top = 58
        Width = 240
        Height = 21
        MaxLength = 15
        TabOrder = 1
      end
      object dblkEstados: TDBLookupComboBox
        Left = 258
        Top = 58
        Width = 55
        Height = 21
        KeyField = 'CodEstado'
        ListField = 'CodEstado'
        ListSource = dsEstados
        TabOrder = 2
      end
    end
    object PRepresentante: TCMProcuraSubTipo
      Left = 5
      Top = 378
      Width = 612
      Height = 49
      Caption = 'Representante'
      TabOrder = 5
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stCliente
      FiltraSubTipo = False
    end
    object Panel2: TPanel
      Left = 5
      Top = 140
      Width = 611
      Height = 237
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object rgQualJuridica: TLabel
        Left = 158
        Top = 44
        Width = 141
        Height = 13
        Caption = 'Quallificação P. Jurídica'
      end
      object rgFormaLucro: TLabel
        Left = 6
        Top = 45
        Width = 137
        Height = 13
        Caption = 'Forma de Trib. do Lucro'
      end
      object Label9: TLabel
        Left = 6
        Top = 83
        Width = 102
        Height = 13
        Caption = 'Natureza Jurídica'
      end
      object lbEsteveInativa: TLabel
        Left = 25
        Top = 25
        Width = 68
        Height = 13
        Caption = 'desta DCTF'
        Enabled = False
      end
      object lbComIncorporacao: TLabel
        Left = 22
        Top = 193
        Width = 252
        Height = 13
        Caption = ' Lei nº 10.931/2004) com débitos a declarar'
      end
      object cbLucro: TComboBox
        Left = 6
        Top = 59
        Width = 139
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        MaxLength = 4
        TabOrder = 0
        OnChange = cbLucroChange
        Items.Strings = (
          'Real/Trimestral'
          'Real/Estimativa'
          'Presumido'
          'Arbitrado'
          'Imune do IRPJ'
          'Isenta do IRPJ')
      end
      object cbQualificacao: TComboBox
        Left = 158
        Top = 59
        Width = 443
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        MaxLength = 4
        TabOrder = 1
        Items.Strings = (
          'Financeira / Seguradora'
          
            'Sociedade Seguradora, de Capitalização ou Entidade Aberta de Pre' +
            'vidência'
          'Corretora Autônoma de Seguro'
          'Cooperativa de Crédito'
          
            'Entidade fechada de previdência complementar ou entidade aberta ' +
            'de previdência complementar'
          'Sociedade Cooperativa'
          'Outra Qualificação')
      end
      object mkNatureza: TMaskEdit
        Left = 6
        Top = 98
        Width = 51
        Height = 21
        EditMask = '999-9;0;_'
        MaxLength = 5
        TabOrder = 2
      end
      object cbkEsteveInativa: TCheckBox
        Left = 6
        Top = 8
        Width = 587
        Height = 19
        Caption = 
          'PJ esteve inativa desde o início do ano-calendário/ data da sua ' +
          'constituição até o mês anterior ao '
        Enabled = False
        TabOrder = 3
      end
      object cbkLevantouBalanco: TCheckBox
        Left = 6
        Top = 129
        Width = 331
        Height = 17
        Caption = 'PJ levantou balanço/balancete de suspensão no mês'
        Enabled = False
        TabOrder = 4
      end
      object cbkComDebitoSCP: TCheckBox
        Left = 6
        Top = 153
        Width = 273
        Height = 17
        Caption = 'PJ com débitos de SCP a serem declarados'
        TabOrder = 5
      end
      object cbkComIncorporacao: TCheckBox
        Left = 6
        Top = 176
        Width = 595
        Height = 17
        Caption = 
          'PJ com incorporação submetida ao Regime Especial Tributário do P' +
          'atrimônio de Afetação (art. 1º da'
        TabOrder = 6
      end
      object cbkObrigadaApresentacao: TCheckBox
        Left = 6
        Top = 213
        Width = 429
        Height = 17
        Caption = 
          'PJ esteve obrigada '#39'a apresentação da DCTF semestral no ano ante' +
          'rior'
        Enabled = False
        TabOrder = 7
      end
      object ckbBalancoReducao: TCheckBox
        Left = 160
        Top = 88
        Width = 153
        Height = 17
        Caption = 'Balanço de Redução'
        TabOrder = 8
      end
    end
    object grpBoxImport: TGroupBox
      Left = 6
      Top = 520
      Width = 609
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Nome do Arquivo a Importar '
      TabOrder = 7
      object edtImport: TEdit
        Left = 7
        Top = 21
        Width = 559
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object btbtnSeleciona: TBitBtn
        Left = 571
        Top = 20
        Width = 30
        Height = 22
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnClick = btbtnSelecionaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
      end
    end
    object rgPeriodoBase: TGroupBox
      Left = 5
      Top = 71
      Width = 279
      Height = 65
      Caption = 'Período Base'
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 21
        Width = 84
        Height = 13
        Caption = 'Período Inicial'
      end
      object Label7: TLabel
        Left = 151
        Top = 21
        Width = 77
        Height = 13
        Caption = 'Período Final'
      end
      object dtInicio: TCMDateTimePicker
        Left = 8
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
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
      end
      object dtFim: TCMDateTimePicker
        Left = 151
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
        ReadOnly = True
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
      end
    end
  end
  inherited Dock971: TDock97
    Top = 577
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 338
      inherited sep1: TToolbarSep97
        Left = 197
      end
      inherited bbtnSair: TBitBtn
        Left = 116
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 199
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 116
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 2
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 219
    Top = 583
  end
  object svDPrev: TSaveDialog
    Filter = 'Arquivo texto (*.DEC)|*.DEC'
    InitialDir = 'c:\'
    Left = 175
    Top = 583
  end
  object cdsUF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 583
  end
  object dsEstados: TDataSource
    AutoEdit = False
    DataSet = cdsUF
    Left = 128
    Top = 583
  end
end
