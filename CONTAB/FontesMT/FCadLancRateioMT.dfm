inherited frmCadLancRateioMT: TfrmCadLancRateioMT
  Left = 20
  Top = 131
  Caption = 'Lançamento de Planilha de Rateio'
  ClientHeight = 406
  ClientWidth = 779
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 779
    Height = 367
    object Label5: TLabel
      Left = 23
      Top = 10
      Width = 28
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 135
      Top = 10
      Width = 105
      Height = 13
      Caption = 'Planilha de Rateio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 559
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Número Documento'
    end
    object Label19: TLabel
      Left = 384
      Top = 325
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 544
      Top = 325
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 24
      Top = 325
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object mskUnidNegoc: TMaskEdit
      Left = 32
      Top = 339
      Width = 17
      Height = 21
      Color = clAqua
      TabOrder = 12
      Visible = False
    end
    object dteData: TCMDateTimePicker
      Left = 24
      Top = 23
      Width = 97
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
    object dblkRateio: TwwDBLookupCombo
      Left = 136
      Top = 23
      Width = 233
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PANDESCRICAO'#9'20'#9'PANDESCRICAO')
      DataField = 'PANCODIGO'
      LookupTable = cdsPlanilhaRateio
      LookupField = 'PANCODIGO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object Panel1: TPanel
      Left = 24
      Top = 54
      Width = 370
      Height = 266
      TabOrder = 2
      object lblCCustoRat: TLabel
        Left = 218
        Top = 10
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
        Enabled = False
      end
      object lblSubContaRat: TLabel
        Left = 217
        Top = 51
        Width = 60
        Height = 13
        Caption = 'Sub-Conta'
        Enabled = False
      end
      object Label2: TLabel
        Left = 33
        Top = 124
        Width = 51
        Height = 13
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mskSubContaRat: TMaskEdit
        Left = 218
        Top = 66
        Width = 116
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
        OnExit = mskSubContaRatExit
      end
      object dblkCCustoRat: TwwDBLookupCombo
        Left = 218
        Top = 24
        Width = 145
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        LookupTable = CdsCentroCustoRat
        LookupField = 'CODCENTROCUSTO'
        Style = csDropDownList
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnSubContaRat: TBitBtn
        Left = 336
        Top = 65
        Width = 25
        Height = 21
        Enabled = False
        TabOrder = 2
        OnClick = btnSubContaRatClick
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
      object edtSubContaRat: TEdit
        Left = 31
        Top = 95
        Width = 327
        Height = 21
        TabStop = False
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object Panel2: TPanel
        Left = 1
        Top = -159
        Width = 25
        Height = 121
        BevelOuter = bvNone
        Caption = 'Panel10'
        Color = clGray
        TabOrder = 4
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 21
        Height = 274
        BevelOuter = bvNone
        Color = clGray
        TabOrder = 5
        object fcLabel4: TfcLabel
          Left = -1
          Top = 88
          Width = 23
          Height = 162
          AutoSize = False
          Caption = 'Conta a ser Rateada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Rotation = 90
          TextOptions.VAlignment = vaTop
        end
      end
      object dblkHistoricoRat: TwwDBLookupCombo
        Left = 32
        Top = 138
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HITCODHIST'#9'4'#9'Código'
          'HITDESCR1'#9'40'#9'Histórico')
        LookupTable = CdsHistoPadraoRat
        LookupField = 'HITCODHIST'
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblkHistoricoRatExit
      end
      object Memo2: TMemo
        Left = 32
        Top = 167
        Width = 328
        Height = 93
        Enabled = False
        TabOrder = 7
      end
      object cmpContaRat: TCMProcuraMaskContabil
        Left = 29
        Top = 9
        Width = 185
        Height = 79
        Caption = 'Conta Contábil'
        TabOrder = 8
        OnExit = cmpContaRatExit
        MostraMensagens = True
        MostraDescricao = True
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scAmbas
      end
      object mskHistRat1: TMaskEdit
        Left = 40
        Top = 175
        Width = 281
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 9
      end
      object mskHistRat2: TMaskEdit
        Left = 40
        Top = 191
        Width = 281
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 10
      end
      object mskHistRat3: TMaskEdit
        Left = 40
        Top = 207
        Width = 281
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 11
      end
      object mskHistRat4: TMaskEdit
        Left = 40
        Top = 223
        Width = 281
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 12
      end
      object mskHistRat5: TMaskEdit
        Left = 40
        Top = 239
        Width = 281
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 13
      end
    end
    object pnlDados: TPanel
      Left = 398
      Top = 54
      Width = 370
      Height = 266
      TabOrder = 3
      object lblCCustoPar: TLabel
        Left = 218
        Top = 9
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
        Enabled = False
      end
      object lblSubContaPar: TLabel
        Left = 218
        Top = 52
        Width = 60
        Height = 13
        Caption = 'Sub-Conta'
        Enabled = False
      end
      object Label10: TLabel
        Left = 40
        Top = 204
        Width = 100
        Height = 13
        Caption = 'Atividade/Projeto'
      end
      object Label6: TLabel
        Left = 32
        Top = 125
        Width = 51
        Height = 13
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 32
        Top = 167
        Width = 327
        Height = 93
        Enabled = False
        TabOrder = 7
      end
      object dblkCCustoPar: TwwDBLookupCombo
        Left = 218
        Top = 24
        Width = 145
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        LookupTable = CdsCentroCustoPar
        LookupField = 'CODCENTROCUSTO'
        Style = csDropDownList
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnSubContaPar: TBitBtn
        Left = 336
        Top = 66
        Width = 25
        Height = 21
        Enabled = False
        TabOrder = 2
        OnClick = btnSubContaParClick
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
      object edtSubContaPar: TEdit
        Left = 31
        Top = 96
        Width = 328
        Height = 21
        TabStop = False
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object mskSubContaPar: TMaskEdit
        Left = 218
        Top = 66
        Width = 116
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
        OnExit = mskSubContaParExit
      end
      object Panel10: TPanel
        Left = 1
        Top = -159
        Width = 25
        Height = 121
        BevelOuter = bvNone
        Caption = 'Panel10'
        Color = clGray
        TabOrder = 4
      end
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 21
        Height = 272
        BevelOuter = bvNone
        Color = clGray
        TabOrder = 5
        object fcLabel3: TfcLabel
          Left = -1
          Top = 129
          Width = 23
          Height = 121
          AutoSize = False
          Caption = 'Contra-Partida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Rotation = 90
          TextOptions.VAlignment = vaTop
        end
      end
      object dblkHistoricoPar: TwwDBLookupCombo
        Left = 32
        Top = 139
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HITCODHIST'#9'4'#9'Código'
          'HITDESCR1'#9'40'#9'Histórico')
        LookupTable = CdsHistoPadraoPar
        LookupField = 'HITCODHIST'
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblkHistoricoParExit
      end
      object mskHistPar1: TMaskEdit
        Left = 38
        Top = 178
        Width = 283
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 8
      end
      object mskHistPar2: TMaskEdit
        Left = 38
        Top = 194
        Width = 283
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 9
      end
      object mskHistPar3: TMaskEdit
        Left = 38
        Top = 210
        Width = 283
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 10
      end
      object mskHistPar4: TMaskEdit
        Left = 38
        Top = 226
        Width = 283
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 11
      end
      object mskHistPar5: TMaskEdit
        Left = 38
        Top = 242
        Width = 283
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 12
      end
      object cmpContaPar: TCMProcuraMaskContabil
        Left = 29
        Top = 9
        Width = 185
        Height = 79
        Caption = 'Conta Contábil'
        TabOrder = 13
        OnExit = cmpContaParExit
        MostraMensagens = True
        MostraDescricao = True
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scAmbas
      end
    end
    object rdgRateioDebCre: TRadioGroup
      Left = 384
      Top = 7
      Width = 161
      Height = 37
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Débito'
        'Crédito')
      TabOrder = 4
    end
    object edtNumDoc: TEdit
      Left = 560
      Top = 23
      Width = 169
      Height = 21
      MaxLength = 15
      TabOrder = 5
    end
    object redValor: TRealEdit
      Left = 384
      Top = 339
      Width = 145
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 6
      WordWrap = False
      IntDigits = 18
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dblkTipoOper: TwwDBLookupCombo
      Left = 544
      Top = 339
      Width = 222
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
      LookupTable = CdsTipoOper
      LookupField = 'TIPCODIGO'
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object edtAtivProj: TEdit
      Left = 112
      Top = 339
      Width = 257
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 8
    end
    object btnAtivProj: TBitBtn
      Left = 80
      Top = 339
      Width = 25
      Height = 21
      TabOrder = 9
      OnClick = btnAtivProjClick
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
    object mskAtivProj: TMaskEdit
      Left = 24
      Top = 339
      Width = 57
      Height = 21
      TabOrder = 10
      OnExit = mskAtivProjExit
    end
    object pnlPlanoPatroC: TPanel
      Left = 15
      Top = 368
      Width = 754
      Height = 28
      BevelOuter = bvNone
      TabOrder = 11
      object lblPlanoPrevC: TLabel
        Left = 11
        Top = 11
        Width = 37
        Height = 13
        Caption = 'Plano:'
      end
      object lblPatroC: TLabel
        Left = 374
        Top = 11
        Width = 84
        Height = 13
        Caption = 'Patrocinadora:'
      end
      object dblcPlanoPrevC: TwwDBLookupCombo
        Left = 56
        Top = 3
        Width = 299
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPLANOPREV'
        LookupTable = CdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPatroC: TwwDBLookupCombo
        Left = 462
        Top = 3
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPATRO'
        LookupTable = CdsPatro
        LookupField = 'IDPESSOA'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 779
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 411
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 288
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 232
  end
  object CdsHistoPadraoPar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 349
    Top = 288
  end
  object CdsHistoPadraoRat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 288
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Sub-Conta')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 680
    Top = 176
  end
  object CdsCentroCustoPar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 533
    Top = 232
  end
  object CdsCentroCustoRat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 232
  end
  object cdsPlanilhaRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 232
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNECODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 176
    Top = 176
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 450
    Top = 232
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 69
    Top = 287
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 74
    Top = 231
  end
end
