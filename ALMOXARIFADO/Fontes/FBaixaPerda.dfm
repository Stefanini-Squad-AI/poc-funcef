inherited FrmBaixaPerda: TFrmBaixaPerda
  Left = 108
  Top = 137
  Caption = 'Baixa por Perda'
  ClientHeight = 327
  ClientWidth = 533
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 248
    Top = 22
    Width = 73
    Height = 13
    Caption = 'Almoxarifado'
  end
  inherited pnlFundo: TPanel
    Width = 533
    Height = 288
    object Label1: TLabel
      Left = 15
      Top = 64
      Width = 81
      Height = 13
      Caption = 'Tipo de Perda'
    end
    object lbALmox: TLabel
      Left = 16
      Top = 19
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label13: TLabel
      Left = 418
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label14: TLabel
      Left = 280
      Top = 64
      Width = 104
      Height = 13
      Caption = 'Nº  da Requisição'
    end
    object Label3: TLabel
      Left = 16
      Top = 112
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object pnlDet: TPanel
      Left = 15
      Top = 159
      Width = 501
      Height = 109
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = cl3DLight
      TabOrder = 4
      object Label4: TLabel
        Left = 18
        Top = 9
        Width = 25
        Height = 13
        Caption = 'Item'
      end
      object Label6: TLabel
        Left = 114
        Top = 9
        Width = 104
        Height = 13
        Caption = 'Descrição do Item'
      end
      object Label7: TLabel
        Left = 392
        Top = 9
        Width = 28
        Height = 13
        Caption = 'Qtde'
      end
      object Label8: TLabel
        Left = 323
        Top = 9
        Width = 19
        Height = 13
        Caption = 'UN'
      end
      object Label9: TLabel
        Left = 189
        Top = 57
        Width = 19
        Height = 13
        Caption = 'UN'
      end
      object Label10: TLabel
        Left = 18
        Top = 58
        Width = 103
        Height = 13
        Caption = 'Saldo em Estoque'
      end
      object Label11: TLabel
        Left = 323
        Top = 57
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object edQtde: TRealEdit
        Left = 390
        Top = 24
        Width = 94
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        OnExit = edQtdeExit
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
      end
      object dblcUN: TwwDBLookupCombo
        Left = 323
        Top = 24
        Width = 57
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODMEDIDA'#9'4'#9'Código'
          'DESCMEDIDA'#9'25'#9'Descrição')
        LookupTable = qryUnidMed
        LookupField = 'CODMEDIDA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbUN: TDBEdit
        Left = 189
        Top = 72
        Width = 49
        Height = 21
        Color = clSilver
        DataField = 'CODMEDCUSTO'
        DataSource = dsArtigo
        ReadOnly = True
        TabOrder = 4
      end
      object dblcDesc: TwwDBLookupCombo
        Left = 114
        Top = 24
        Width = 199
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'
          'CODARTIGO'#9'14'#9'Código')
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcDescCloseUp
      end
      object dblcItem: TwwDBLookupCombo
        Left = 18
        Top = 24
        Width = 91
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODARTIGO'#9'14'#9'Código'
          'DESCRICAO'#9'50'#9'Descrição')
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcItemCloseUp
      end
      object edValb: TRealEdit
        Left = 323
        Top = 71
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 14286847
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
      end
      object dbSaldo: TDBRealEdit
        Left = 18
        Top = 72
        Width = 151
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOQTDE'
        DataSource = dsSaldo
      end
    end
    object dblcPerda: TCMDBLookupCombo
      Left = 15
      Top = 79
      Width = 247
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOPERDA'#9'20'#9'Descrição')
      LookupTable = qryPerda
      LookupField = 'IDTIPOPERDA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edAlmox: TEdit
      Left = 16
      Top = 34
      Width = 498
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = 'edalmox'
    end
    object edData: TCMDateTimePicker
      Left = 418
      Top = 79
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
      TabOrder = 2
    end
    object edNumReq: TRealEdit
      Left = 280
      Top = 79
      Width = 118
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object dblcAtiv: TwwDBLookupCombo
      Left = 16
      Top = 128
      Width = 382
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'
        'UNIDNEGOC'#9'10'#9'Código')
      LookupTable = qryUnidNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 533
    inherited tb97Fundo: TToolbar97
      Left = 277
      DockPos = 277
      inherited sep1: TToolbarSep97
        Left = 160
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 162
      end
      object BtnBaixa: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Baixa'
        TabOrder = 2
        OnClick = BtnBaixaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 780
    Top = 18
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR) AS ' +
        'DESCRICAO'
      'FROM'
      '        ARTIGO A,'
      '       PRODUTO P'
      'WHERE'
      '        (A.CODPRODUTO = P.CODPRODUTO)'
      '    AND (A.FLGATIVO = '#39'S'#39')'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 238
  end
  object qryPerda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            DESCTIPOPERDA,'
      '    IDTIPOPERDA'
      'FROM'
      '    TIPOPERDA'
      'ORDER BY DESCTIPOPERDA ')
    ValidateWithMask = True
    Left = 87
    Top = 238
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '         U.CodMedida, '
      '         U.DescMedida '
      'From'
      '         UnMedida U,'
      '         Conver   C '
      'Where  '
      '         (RTRIM(C.CodProduto) =  :pCodProd)'
      '  and (U.CodMedida  = C.CodMedida)'
      'Order By CodMedida ')
    ValidateWithMask = True
    Left = 132
    Top = 238
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  object qrySaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '           SALDOQTDE'
      'FROM'
      '          SALDO'
      'WHERE'
      '            ( CODARTIGO = :pCODART) '
      '   AND ( CODALMOXARIFADO = :pCODALMOX)'
      '   AND (IDPESSOA = :pIDPESS)')
    ValidateWithMask = True
    Left = 180
    Top = 238
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object dsArtigo: TwwDataSource
    DataSet = qryArtigo
    Left = 6
    Top = 237
  end
  object dsSaldo: TwwDataSource
    DataSet = qrySaldo
    Left = 219
    Top = 237
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 258
    Top = 238
  end
  object qryCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            CUSTOMEDIO'
      'FROM '
      '           CUSTOMED'
      'WHERE'
      '         ( RTRIM(CODARTIGO) = RTRIM(:pCODART))'
      '  And (CODCUSTEIO = :pCODCUST) ')
    ValidateWithMask = True
    Left = 261
    Top = 237
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUST'
        ParamType = ptUnknown
      end>
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 414
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
