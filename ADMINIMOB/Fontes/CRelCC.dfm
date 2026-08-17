inherited cfgRelCC: TcfgRelCC
  Left = 152
  Top = 81
  Caption = 'Conta Corrente'
  ClientHeight = 461
  ClientWidth = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 545
    Height = 428
    object Label7: TLabel
      Left = 324
      Top = 359
      Width = 205
      Height = 31
      AutoSize = False
      Caption = 'Agrupar lançamentos de um mesmo documento (quando possível)'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 16
      Top = 50
      Width = 163
      Height = 13
      Caption = 'Tipo de Receita ou Despesa'
    end
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 151
      Height = 13
      Caption = 'Administradora (do Imóvel)'
    end
    object Label1: TLabel
      Left = 320
      Top = 50
      Width = 153
      Height = 13
      Caption = 'Tipo de Imóvel (Segmento)'
    end
    object chkEmAberto: TCheckBox
      Left = 24
      Top = 332
      Width = 265
      Height = 17
      Caption = 'Apresentar apenas lançamentos em aberto'
      TabOrder = 9
    end
    object grpDatas: TGroupBox
      Left = 16
      Top = 88
      Width = 257
      Height = 57
      Caption = ' Período de Datas '
      TabOrder = 4
      object Label5: TLabel
        Left = 124
        Top = 28
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object edtDataIni: TCMDateTimePicker
        Left = 16
        Top = 24
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
      object edtDataFim: TCMDateTimePicker
        Left = 144
        Top = 24
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
        TabOrder = 1
      end
    end
    object grpCompetencia: TGroupBox
      Left = 288
      Top = 88
      Width = 241
      Height = 57
      Caption = ' Mês de Competência '
      TabOrder = 5
      object DBspnAnoCompetencia: TwwDBSpinEdit
        Left = 160
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMesCompetencia: TComboBox
        Left = 16
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
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
    object rdgLancamentos: TRadioGroup
      Left = 16
      Top = 204
      Width = 249
      Height = 65
      Caption = ' Apresentar: '
      ItemIndex = 0
      Items.Strings = (
        'TODOS os Lançamentos'
        'Lançamentos a Pagar'
        'Lançamentos a Receber')
      TabOrder = 6
    end
    object rdgValores: TRadioGroup
      Left = 280
      Top = 204
      Width = 249
      Height = 65
      Caption = ' Apresentar: '
      ItemIndex = 0
      Items.Strings = (
        'TODOS os valores'
        'Apenas os valores previstos'
        'Apenas os valores efetivos')
      TabOrder = 7
    end
    object rdgOrdenacao: TRadioGroup
      Left = 16
      Top = 272
      Width = 513
      Height = 53
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nome do Imóvel, Competência, Data'
        'Nome do Imóvel, Data, Competência'
        'Competência, Data, Nome do Imóvel'
        'Data, Competência, Nome do Imóvel')
      TabOrder = 8
    end
    object chkLinhas: TCheckBox
      Left = 304
      Top = 332
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 10
    end
    object chkAgrupar: TCheckBox
      Left = 304
      Top = 364
      Width = 13
      Height = 17
      Caption = 'chkAgrupar'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object DBcboTipoRecDes: TwwDBLookupCombo
      Left = 16
      Top = 64
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
      LookupTable = dtmLookImobiliario.qryLookTipoRecDes
      LookupField = 'IDTIPOCUSTORECIMO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 396
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 394
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 13
    end
    object edtAdminImovel: TEdit
      Left = 16
      Top = 24
      Width = 465
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscaAdminImovel: TBitBtn
      Left = 480
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca uma Administradora'
      TabOrder = 1
      OnClick = btnBuscaAdminImovelClick
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
    object btnLimpaAdminImovel: TBitBtn
      Left = 504
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Administradora'
      TabOrder = 2
      OnClick = btnLimpaAdminImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object rdgTipoData: TRadioGroup
      Left = 16
      Top = 168
      Width = 513
      Height = 33
      Caption = ' Tipo de Datas '
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        'de Baixa'
        'de Inclusão'
        'de Lançamento'
        'de Vencimento')
      TabOrder = 14
      TabStop = True
    end
    object chkCompetencia: TCheckBox
      Left = 304
      Top = 148
      Width = 225
      Height = 17
      Caption = 'NÃO levar em conta a competência'
      TabOrder = 15
    end
    object DBcboTipoImovel: TwwDBLookupCombo
      Left = 320
      Top = 64
      Width = 209
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL')
      LookupTable = dtmLookImobiliario.qryLookTipoImovel
      LookupField = 'CODTIPIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 16
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 545
    inherited tb97Fundo: TToolbar97
      Left = 373
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
