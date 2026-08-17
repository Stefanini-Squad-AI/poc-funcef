inherited frmConsultSldContab: TfrmConsultSldContab
  Left = 12
  Top = 119
  Caption = 'Consulta ao Saldo Contábil de Bens'
  ClientHeight = 425
  ClientWidth = 766
  KeyPreview = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 386
    object pnlDados: TPanel
      Left = 5
      Top = 5
      Width = 756
      Height = 140
      Align = alTop
      TabOrder = 0
      object Label17: TLabel
        Left = 168
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label24: TLabel
        Left = 8
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label18: TLabel
        Left = 400
        Top = 48
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object Label19: TLabel
        Left = 640
        Top = 8
        Width = 105
        Height = 13
        Caption = 'Data de Aquisição'
      end
      object Label26: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 13
        Caption = 'Placa de Tombamento'
      end
      object Label1: TLabel
        Left = 8
        Top = 88
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label2: TLabel
        Left = 400
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 168
        Top = 24
        Width = 465
        Height = 21
        DataField = 'DESBEM'
        DataSource = dsBem
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 640
        Top = 24
        Width = 107
        Height = 21
        DataField = 'DTAINCLUSAO'
        DataSource = dsBem
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit4: TwwDBEdit
        Left = 8
        Top = 64
        Width = 385
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsBem
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit5: TwwDBEdit
        Left = 400
        Top = 64
        Width = 348
        Height = 21
        DataField = 'DESCGRUPO'
        DataSource = dsBem
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object ePlaca: TEdit
        Left = 8
        Top = 24
        Width = 129
        Height = 21
        TabOrder = 4
        OnEnter = ePlacaEnter
        OnExit = ePlacaExit
      end
      object spdPesquisa: TBitBtn
        Left = 136
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 5
        OnClick = spdPesquisaClick
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
      object wwDBEdit3: TwwDBEdit
        Left = 8
        Top = 104
        Width = 385
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsBem
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit20: TwwDBEdit
        Left = 400
        Top = 104
        Width = 353
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = dsBem
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlExecuta: TPanel
      Left = 5
      Top = 145
      Width = 156
      Height = 236
      Align = alClient
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 16
        Top = 24
        Width = 126
        Height = 16
        Caption = 'Movimentação em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.ExtrudeEffects.FarColor = clBlue
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object eDataMov: TCMDateTimePicker
        Left = 16
        Top = 48
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
        OnExit = eDataMovExit
      end
      object bitbExecuta: TBitBtn
        Left = 28
        Top = 136
        Width = 97
        Height = 33
        Caption = 'Processa'
        TabOrder = 1
        OnClick = bitbExecutaClick
        Kind = bkRetry
      end
    end
    object pnlValores: TPanel
      Left = 161
      Top = 145
      Width = 600
      Height = 236
      Align = alRight
      TabOrder = 2
      object fcLabel2: TfcLabel
        Left = 238
        Top = 8
        Width = 47
        Height = 20
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel3: TfcLabel
        Left = 344
        Top = 8
        Width = 98
        Height = 20
        Caption = 'Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel4: TfcLabel
        Left = 504
        Top = 8
        Width = 40
        Height = 20
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel5: TfcLabel
        Left = 15
        Top = 40
        Width = 69
        Height = 16
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel6: TfcLabel
        Left = 15
        Top = 64
        Width = 147
        Height = 16
        Caption = 'Parcela Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel7: TfcLabel
        Left = 15
        Top = 88
        Width = 63
        Height = 16
        Caption = 'C.M. Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel8: TfcLabel
        Left = 15
        Top = 112
        Width = 111
        Height = 16
        Caption = 'C.M. Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel9: TfcLabel
        Left = 15
        Top = 136
        Width = 144
        Height = 16
        Caption = 'Depreciação no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel10: TfcLabel
        Left = 15
        Top = 160
        Width = 171
        Height = 16
        Caption = 'Depreciação Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel11: TfcLabel
        Left = 15
        Top = 184
        Width = 170
        Height = 16
        Caption = 'C.M. Deprec. Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel12: TfcLabel
        Left = 15
        Top = 208
        Width = 100
        Height = 16
        Caption = 'Custo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object wwDBEdit6: TwwDBEdit
        Left = 200
        Top = 40
        Width = 121
        Height = 21
        DataField = 'VALORG0'
        DataSource = dsBemImovel
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit7: TwwDBEdit
        Left = 200
        Top = 64
        Width = 121
        Height = 21
        DataField = 'VALREAVACUM0'
        DataSource = dsBemImovel
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit8: TwwDBEdit
        Left = 200
        Top = 88
        Width = 121
        Height = 21
        DataField = 'CMBEMATU0'
        DataSource = dsBemImovel
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit9: TwwDBEdit
        Left = 200
        Top = 112
        Width = 121
        Height = 21
        DataField = 'CMBEMACUM0'
        DataSource = dsBemImovel
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit10: TwwDBEdit
        Left = 200
        Top = 136
        Width = 121
        Height = 21
        DataField = 'DEPLANCATU0'
        DataSource = dsBemImovel
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit11: TwwDBEdit
        Left = 200
        Top = 160
        Width = 121
        Height = 21
        DataField = 'DEPLANCACUM0'
        DataSource = dsBemImovel
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit12: TwwDBEdit
        Left = 200
        Top = 184
        Width = 121
        Height = 21
        DataField = 'CMDEPLANCACUM0'
        DataSource = dsBemImovel
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit13: TwwDBEdit
        Left = 336
        Top = 40
        Width = 121
        Height = 21
        DataSource = dsBemImovel
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit14: TwwDBEdit
        Left = 336
        Top = 64
        Width = 121
        Height = 21
        DataField = 'VALULTREAVACUM1'
        DataSource = dsBemImovel
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit15: TwwDBEdit
        Left = 336
        Top = 88
        Width = 121
        Height = 21
        DataField = 'VALULTCMREAVATU'
        DataSource = dsBemImovel
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit16: TwwDBEdit
        Left = 336
        Top = 112
        Width = 121
        Height = 21
        DataField = 'VALULTCMREAVACUM1'
        DataSource = dsBemImovel
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit17: TwwDBEdit
        Left = 336
        Top = 136
        Width = 121
        Height = 21
        DataField = 'VALULTDEPREAVATU'
        DataSource = dsBemImovel
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit18: TwwDBEdit
        Left = 336
        Top = 160
        Width = 121
        Height = 21
        DataField = 'VALULTDEPREAVACUM1'
        DataSource = dsBemImovel
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit19: TwwDBEdit
        Left = 336
        Top = 184
        Width = 121
        Height = 21
        DataField = 'VALULTCMDEPREAVACUM1'
        DataSource = dsBemImovel
        TabOrder = 13
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit27: TwwDBEdit
        Left = 200
        Top = 208
        Width = 121
        Height = 21
        DataField = 'VALCTB0'
        DataSource = dsBemImovel
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit28: TwwDBEdit
        Left = 336
        Top = 208
        Width = 121
        Height = 21
        DataField = 'VALCTB1'
        DataSource = dsBemImovel
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object eSoma1: TRealEdit
        Left = 472
        Top = 40
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 16
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma2: TRealEdit
        Left = 472
        Top = 64
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 17
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma4: TRealEdit
        Left = 472
        Top = 112
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 18
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma3: TRealEdit
        Left = 472
        Top = 88
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 19
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma5: TRealEdit
        Left = 472
        Top = 136
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 20
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma6: TRealEdit
        Left = 472
        Top = 160
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 21
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma7: TRealEdit
        Left = 472
        Top = 184
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 22
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object eSoma8: TRealEdit
        Left = 472
        Top = 208
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 23
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 766
    inherited tb97Fundo: TToolbar97
      Left = 596
      DockPos = 605
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 429
      DockPos = 438
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 368
    Top = 512
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDPESSOA,B.IDBEM,B.DESBEM, B.DTAINCLUSAO, B.PLACA, B.DA' +
        'TAINICIODEP,'
      '       G.NOME AS DESCGRUPO, C.DESCCONJUNTO, SC.NOMESUBCONTA,'
      '       L.NOME AS DESCLOCALIZACAO, P.NOME AS NOMERESPONSAVEL'
      
        'FROM BEM B, GRUPO G, CONJUNTO C, SUBCONTA SC, LOCALIZACAO L, PES' +
        'SOA P'
      'WHERE (B.IDPESSOA      = :PIDPESSOA)'
      '  AND (B.IDBEM         = :PIDBEM)'
      '  AND (B.IDGRUPO       = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO    = C.IDCONJUNTO)'
      '  AND (B.CODSUBCONTA   = SC.CODSUBCONTA(+))'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL = P.IDPESSOA(+)) ')
    ValidateWithMask = True
    Left = 176
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
    object qryBemDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qryBemNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
  end
  object dsBem: TwwDataSource
    DataSet = qryBem
    Left = 216
    Top = 136
  end
  object qryBemImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP,'
      
        '       SB.VALORG                                            AS V' +
        'ALORG0,'
      
        '       SB.REAVVALORG                                        AS V' +
        'ALREAVACUM0,'
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))         AS C' +
        'MBEMATU0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM)                            AS C' +
        'MBEMACUM0,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0))       AS D' +
        'EPLANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC)                        AS D' +
        'EPLANCACUM0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP)                            AS C' +
        'MDEPLANCACUM0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      
        '        SB.REAVDEPLANC - SB.REAVCMDEP)                      AS V' +
        'ALCTB0,'
      ''
      
        '       SB.ULTREAVVALORG                                     AS V' +
        'ALULTREAVACUM1,'
      
        '       NVL(ATU.VALCMULTREAV,0)                              AS V' +
        'ALULTCMREAVATU,'
      
        '       SB.ULTREAVCMBEM                                      AS V' +
        'ALULTCMREAVACUM1,'
      
        '       NVL(ATU.VALDEPULTREAV,0)                             AS V' +
        'ALULTDEPREAVATU,'
      
        '       SB.ULTREAVDEPLANC                                    AS V' +
        'ALULTDEPREAVACUM1,'
      
        '       SB.ULTREAVCMDEP                                      AS V' +
        'ALULTCMDEPREAVACUM1,'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB1,'
      ''
      
        '       (SB.REAVVALORG + SB.ULTREAVVALORG)                   AS S' +
        'UMPARCREAV,'
      '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) +'
      
        '        NVL(ATU.VALCMULTREAV,0))                            AS S' +
        'UMCMBEMATU,'
      '       (SB.CMBEM + SB.REAVCMBEM +'
      
        '        SB.ULTREAVCMBEM)                                    AS S' +
        'UMCMBEMACUM,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                           AS S' +
        'UMDEPATU,'
      '       (SB.DEPLANC + SB.REAVDEPLANC +'
      
        '        SB.ULTREAVDEPLANC)                                  AS S' +
        'UMDEPACUM,'
      '       (SB.CMDEP + SB.REAVCMDEP +'
      
        '        SB.ULTREAVCMDEP)                                    AS S' +
        'UMCMDEPACUM,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS S' +
        'UMVALCTB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.IDBEM = :PIDBEM)'
      '        AND (SCB.IDPESSOA = :PIDPESSOA)'
      '        AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.IDBEM = :PIDBEM)'
      '               AND (HM.IDPESSOA = :PIDPESSOA)'
      '               AND (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 232
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryBemImovelIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemImovelTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemImovelDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemImovelVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALREAVACUM0: TFloatField
      FieldName = 'VALREAVACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMBEMATU0: TFloatField
      FieldName = 'CMBEMATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMBEMACUM0: TFloatField
      FieldName = 'CMBEMACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDEPLANCATU0: TFloatField
      FieldName = 'DEPLANCATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDEPLANCACUM0: TFloatField
      FieldName = 'DEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMDEPLANCACUM0: TFloatField
      FieldName = 'CMDEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTREAVACUM1: TFloatField
      FieldName = 'VALULTREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMREAVATU: TFloatField
      FieldName = 'VALULTCMREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMREAVACUM1: TFloatField
      FieldName = 'VALULTCMREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTDEPREAVATU: TFloatField
      FieldName = 'VALULTDEPREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTDEPREAVACUM1: TFloatField
      FieldName = 'VALULTDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMDEPREAVACUM1: TFloatField
      FieldName = 'VALULTCMDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALCTB1: TFloatField
      FieldName = 'VALCTB1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMPARCREAV: TFloatField
      FieldName = 'SUMPARCREAV'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMBEMATU: TFloatField
      FieldName = 'SUMCMBEMATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMBEMACUM: TFloatField
      FieldName = 'SUMCMBEMACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMDEPATU: TFloatField
      FieldName = 'SUMDEPATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMDEPACUM: TFloatField
      FieldName = 'SUMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMDEPACUM: TFloatField
      FieldName = 'SUMCMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemImovelIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemImovelIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryBemImovelDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemImovelDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
  object dsBemImovel: TwwDataSource
    DataSet = qryBemImovel
    Left = 104
    Top = 232
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,PLACA '
      'FROM BEM '
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 264
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryPlacaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryPlacaPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.BAIXATOTAL'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Bens Baixados (S/N)'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação')
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)')
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
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '1'
      '20'
      '60'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 64
    Top = 320
  end
  object qryBemOriginal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(B XPKBEM) */'
      ''
      '       B.IDBEM, B.TAXADEP,B.DATAULTDEP,'
      ''
      '       ((BEMACUM.VALBEMACUM + ACRESACUM.VALACRESACUM) -'
      
        '        (BXBEMACUM.BXVALBEMACUM + BXACRESACUM.BXVALACRESACUM)) A' +
        'S VALORG0,'
      ''
      
        '       (REAVACUM.VALREAVACUM - BXREAVACUM.BXVALREAVACUM) AS VALR' +
        'EAVACUM0,'
      ''
      '       (CMBEMATU.VALCMBEMATU + CMREAVATU.VALCMREAVATU +'
      '        CMACRESATU.VALCMACRESATU) AS CMBEMATU0,'
      ''
      '       (CMBEMACUM.VALCMBEMACUM  + CMREAVACUM.VALCMREAVACUM +'
      
        '        CMACRESACUM.VALCMACRESACUM - BXCMBEMACUM.BXVALCMBEMACUM ' +
        '-'
      
        '        BXCMREAVACUM.BXVALCMREAVACUM - BXCMACRESACUM.BXVALCMACRE' +
        'SACUM) AS CMBEMACUM0,'
      ''
      '       (DEPBEMATU.VALDEPBEMATU + DEPREAVATU.VALDEPREAVATU +'
      '        DEPACRESATU.VALDEPACRESATU) AS DEPLANCATU0,'
      ''
      '       (DEPBEMACUM.VALDEPBEMACUM + DEPREAVACUM.VALDEPREAVACUM +'
      
        '        DEPACRESACUM.VALDEPACRESACUM - BXDEPBEMACUM.BXVALDEPBEMA' +
        'CUM -'
      
        '        BXDEPREAVACUM.BXVALDEPREAVACUM - BXDEPACRESACUM.BXVALDEP' +
        'ACRESACUM) AS DEPLANCACUM0,'
      ''
      
        '       (CMDEPBEMACUM.VALCMDEPBEMACUM + CMDEPREAVACUM.VALCMDEPREA' +
        'VACUM +'
      
        '        CMDEPACRESACUM.VALCMDEPACRESACUM - BXCMDEPBEMACUM.BXVALC' +
        'MDEPBEMACUM -'
      
        '        BXCMDEPREAVACUM.BXVALCMDEPREAVACUM - BXCMDEPACRESACUM.BX' +
        'VALCMDEPACRESACUM) AS CMDEPLANCACUM0,'
      '       (('
      
        '       (BEMACUM.VALBEMACUM + REAVACUM.VALREAVACUM + ACRESACUM.VA' +
        'LACRESACUM +'
      
        '        CMBEMACUM.VALCMBEMACUM + CMREAVACUM.VALCMREAVACUM +CMACR' +
        'ESACUM.VALCMACRESACUM) -'
      ''
      
        '       (DEPBEMACUM.VALDEPBEMACUM + DEPREAVACUM.VALDEPREAVACUM + ' +
        'DEPACRESACUM.VALDEPACRESACUM +'
      
        '        CMDEPBEMACUM.VALCMDEPBEMACUM + CMDEPREAVACUM.VALCMDEPREA' +
        'VACUM + CMDEPACRESACUM.VALCMDEPACRESACUM )'
      '       ) -'
      '       ('
      '       (BXBEMACUM.BXVALBEMACUM + BXREAVACUM.BXVALREAVACUM +'
      
        '        BXACRESACUM.BXVALACRESACUM + BXCMBEMACUM.BXVALCMBEMACUM ' +
        '+'
      
        '        BXCMREAVACUM.BXVALCMREAVACUM + BXCMACRESACUM.BXVALCMACRE' +
        'SACUM ) -'
      ''
      
        '       (BXDEPBEMACUM.BXVALDEPBEMACUM + BXDEPREAVACUM.BXVALDEPREA' +
        'VACUM +'
      
        '        BXDEPACRESACUM.BXVALDEPACRESACUM + BXCMDEPBEMACUM.BXVALC' +
        'MDEPBEMACUM +'
      
        '        BXCMDEPREAVACUM.BXVALCMDEPREAVACUM + BXCMDEPACRESACUM.BX' +
        'VALCMDEPACRESACUM )'
      '       )) AS VALCTB0,'
      ''
      
        '       (ULTREAVACUM.VALULTREAVACUM - BXULTREAVACUM.BXVALULTREAVA' +
        'CUM) AS VALULTREAVACUM1,'
      '       ULTCMREAVATU.VALULTCMREAVATU,'
      
        '       (ULTCMREAVACUM.VALULTCMREAVACUM - BXULTCMREAVACUM.BXVALUL' +
        'TCMREAVACUM) AS VALULTCMREAVACUM1,'
      '       ULTDEPREAVATU.VALULTDEPREAVATU,'
      
        '       (ULTDEPREAVACUM.VALULTDEPREAVACUM - BXULTDEPREAVACUM.BXVA' +
        'LULTDEPREAVACUM) AS VALULTDEPREAVACUM1,'
      
        '       (ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM - BXULTCMDEPREAVACU' +
        'M.BXVALULTCMDEPREAVACUM) AS VALULTCMDEPREAVACUM1,'
      ''
      '       (('
      
        '       (ULTREAVACUM.VALULTREAVACUM + ULTCMREAVACUM.VALULTCMREAVA' +
        'CUM) -'
      
        '       (ULTDEPREAVACUM.VALULTDEPREAVACUM + ULTCMDEPREAVACUM.VALU' +
        'LTCMDEPREAVACUM)'
      '       ) -'
      '       ('
      
        '       (BXULTREAVACUM.BXVALULTREAVACUM + BXULTCMREAVACUM.BXVALUL' +
        'TCMREAVACUM) -'
      
        '       (BXULTDEPREAVACUM.BXVALULTDEPREAVACUM + BXULTCMDEPREAVACU' +
        'M.BXVALULTCMDEPREAVACUM)'
      '       )) AS VALCTB1,'
      ''
      '       (REAVACUM.VALREAVACUM + ULTREAVACUM.VALULTREAVACUM -'
      
        '        BXREAVACUM.BXVALREAVACUM - BXULTREAVACUM.BXVALULTREAVACU' +
        'M) AS SUMPARCREAV,'
      ''
      
        '       (CMBEMATU.VALCMBEMATU + CMREAVATU.VALCMREAVATU + CMACRESA' +
        'TU.VALCMACRESATU +'
      '        ULTCMREAVATU.VALULTCMREAVATU) AS SUMCMBEMATU,'
      ''
      
        '       (CMBEMACUM.VALCMBEMACUM + CMREAVACUM.VALCMREAVACUM + CMAC' +
        'RESACUM.VALCMACRESACUM +'
      
        '        ULTCMREAVACUM.VALULTCMREAVACUM - BXCMBEMACUM.BXVALCMBEMA' +
        'CUM - BXCMREAVACUM.BXVALCMREAVACUM -'
      
        '        BXCMACRESACUM.BXVALCMACRESACUM - BXULTCMREAVACUM.BXVALUL' +
        'TCMREAVACUM) AS SUMCMBEMACUM,'
      ''
      '       (DEPBEMATU.VALDEPBEMATU + DEPREAVATU.VALDEPREAVATU +'
      
        '        DEPACRESATU.VALDEPACRESATU + ULTDEPREAVATU.VALULTDEPREAV' +
        'ATU) AS SUMDEPATU,'
      ''
      
        '       (DEPBEMACUM.VALDEPBEMACUM + DEPREAVACUM.VALDEPREAVACUM + ' +
        'DEPACRESACUM.VALDEPACRESACUM +'
      
        '        ULTDEPREAVACUM.VALULTDEPREAVACUM - BXDEPBEMACUM.BXVALDEP' +
        'BEMACUM -'
      
        '        BXDEPREAVACUM.BXVALDEPREAVACUM - BXDEPACRESACUM.BXVALDEP' +
        'ACRESACUM -'
      '        BXULTDEPREAVACUM.BXVALULTDEPREAVACUM) AS SUMDEPACUM,'
      ''
      
        '       (CMDEPBEMACUM.VALCMDEPBEMACUM + CMDEPREAVACUM.VALCMDEPREA' +
        'VACUM +'
      
        '        CMDEPACRESACUM.VALCMDEPACRESACUM + ULTCMDEPREAVACUM.VALU' +
        'LTCMDEPREAVACUM -'
      
        '        BXCMDEPBEMACUM.BXVALCMDEPBEMACUM - BXCMDEPREAVACUM.BXVAL' +
        'CMDEPREAVACUM -'
      
        '        BXCMDEPACRESACUM.BXVALCMDEPACRESACUM - BXULTCMDEPREAVACU' +
        'M.BXVALULTCMDEPREAVACUM)'
      '        AS SUMCMDEPACUM,'
      ''
      '       ((('
      
        '       (BEMACUM.VALBEMACUM + REAVACUM.VALREAVACUM + ACRESACUM.VA' +
        'LACRESACUM +'
      
        '        CMBEMACUM.VALCMBEMACUM + CMREAVACUM.VALCMREAVACUM + CMAC' +
        'RESACUM.VALCMACRESACUM ) -'
      ''
      '       (DEPBEMACUM.VALDEPBEMACUM + DEPREAVACUM.VALDEPREAVACUM +'
      
        '        DEPACRESACUM.VALDEPACRESACUM + CMDEPBEMACUM.VALCMDEPBEMA' +
        'CUM +'
      
        '        CMDEPREAVACUM.VALCMDEPREAVACUM + CMDEPACRESACUM.VALCMDEP' +
        'ACRESACUM)'
      '       ) -'
      '       ('
      
        '       (BXBEMACUM.BXVALBEMACUM + BXREAVACUM.BXVALREAVACUM + BXAC' +
        'RESACUM.BXVALACRESACUM +'
      
        '        BXCMBEMACUM.BXVALCMBEMACUM + BXCMREAVACUM.BXVALCMREAVACU' +
        'M + BXCMACRESACUM.BXVALCMACRESACUM ) -'
      ''
      
        '       (BXDEPBEMACUM.BXVALDEPBEMACUM + BXDEPREAVACUM.BXVALDEPREA' +
        'VACUM +'
      
        '        BXDEPACRESACUM.BXVALDEPACRESACUM + BXCMDEPBEMACUM.BXVALC' +
        'MDEPBEMACUM +'
      
        '        BXCMDEPREAVACUM.BXVALCMDEPREAVACUM + BXCMDEPACRESACUM.BX' +
        'VALCMDEPACRESACUM)'
      '       )) +'
      '       (('
      
        '       (ULTREAVACUM.VALULTREAVACUM + ULTCMREAVACUM.VALULTCMREAVA' +
        'CUM) -'
      
        '       (ULTDEPREAVACUM.VALULTDEPREAVACUM + ULTCMDEPREAVACUM.VALU' +
        'LTCMDEPREAVACUM)'
      '       ) -'
      '       ('
      
        '       (BXULTREAVACUM.BXVALULTREAVACUM + BXULTCMREAVACUM.BXVALUL' +
        'TCMREAVACUM) -'
      
        '       (BXULTDEPREAVACUM.BXVALULTDEPREAVACUM + BXULTCMDEPREAVACU' +
        'M.BXVALULTCMDEPREAVACUM)'
      '       ))) AS SUMVALCTB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM BEM B, CONJUNTO C, GRUPO G,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))) REAVACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) ACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)) CMBEMATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (R.IDREAVALIACAO = HM.IDREAVALACRESC(+))) CMREAVATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)) CMACRESATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) CMBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC  = R.IDREAVALIACAO(+))) CMREAVACUM' +
        ','
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) CMACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (14,43,17,21))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)) DEPBEMATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,47,33,19))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) DEPREAVATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (35,36,51))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)) DEPACRESATU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) DEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) DEPREAVACUM' +
        ','
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) DEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) CMDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) CMDEPREAVAC' +
        'UM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) CMDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))) ULTREAVAC' +
        'UM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTCMREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) ULTCMREAVAT' +
        'U,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) ULTCMREAVAC' +
        'UM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTDEPREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) ULTDEPREAVA' +
        'TU,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) ULTDEPREAVA' +
        'CUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS VALULTCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) ULTCMDEPREA' +
        'VACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXREAVACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXCMBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXCMREAVACU' +
        'M,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXCMACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXDEPREAVAC' +
        'UM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXCMDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXCMDEPREAV' +
        'ACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)) BXCMDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALULTREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXULTREAVAC' +
        'UM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALULTCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXULTCMREAV' +
        'ACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALULTDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXULTDEPREA' +
        'VACUM,'
      ''
      '   (SELECT NVL(SUM(HM.VALOFI),0) AS BXVALULTCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      
        '      AND  (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))) BXULTCMDEPR' +
        'EAVACUM'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      
        '  AND((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NULL' +
        '))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDBEM'
    end
    object FloatField2: TFloatField
      DisplayWidth = 15
      FieldName = 'TAXADEP'
      Precision = 2
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object FloatField3: TFloatField
      DisplayWidth = 15
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField4: TFloatField
      DisplayWidth = 15
      FieldName = 'VALREAVACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField5: TFloatField
      DisplayWidth = 15
      FieldName = 'CMBEMATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField6: TFloatField
      DisplayWidth = 15
      FieldName = 'CMBEMACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField7: TFloatField
      DisplayWidth = 15
      FieldName = 'DEPLANCATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField8: TFloatField
      DisplayWidth = 15
      FieldName = 'DEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField9: TFloatField
      DisplayWidth = 15
      FieldName = 'CMDEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField10: TFloatField
      DisplayWidth = 15
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField11: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField12: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTCMREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField13: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTCMREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField14: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTDEPREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField15: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField16: TFloatField
      DisplayWidth = 15
      FieldName = 'VALULTCMDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField17: TFloatField
      DisplayWidth = 15
      FieldName = 'VALCTB1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField18: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMPARCREAV'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField19: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMCMBEMATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField20: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMCMBEMACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField21: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMDEPATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField22: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField23: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMCMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField24: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object StringField1: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object FloatField25: TFloatField
      FieldName = 'IDGRUPO'
    end
    object FloatField26: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object StringField2: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
end
