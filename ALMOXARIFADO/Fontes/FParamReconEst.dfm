inherited FrmParamReconEst: TFrmParamReconEst
  Left = 173
  Top = 126
  Caption = 'Reconciliação de Estoque (Novo)'
  ClientHeight = 360
  ClientWidth = 372
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 372
    Height = 321
    object Label5: TLabel
      Left = 24
      Top = 64
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label1: TLabel
      Left = 24
      Top = 112
      Width = 111
      Height = 13
      Caption = 'Grupo de Produtos '
    end
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 112
      Height = 13
      Caption = 'Unidade de Custeio'
    end
    object dblcAlmox: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCALMOX'#9'40'#9'Descrição')
      LookupTable = qryAlmox
      LookupField = 'CODALMOXARIFADO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblcGrpProd: TwwDBLookupCombo
      Left = 24
      Top = 128
      Width = 322
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição'
        'CODGRUPOPROD'#9'10'#9'Código')
      LookupTable = qryGrpProd
      LookupField = 'CODGRUPOPROD'
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object grpPeriodo: TGroupBox
      Left = 24
      Top = 158
      Width = 322
      Height = 85
      Caption = ' Período '
      TabOrder = 2
      object Label2: TLabel
        Left = 15
        Top = 27
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label3: TLabel
        Left = 189
        Top = 27
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object edDataI: TCMDateTimePicker
        Left = 15
        Top = 42
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
      object EdDataF: TCMDateTimePicker
        Left = 189
        Top = 42
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
    object chkimp: TCheckBox
      Left = 24
      Top = 256
      Width = 191
      Height = 18
      Caption = 'Imprimir itens com saldo zero'
      TabOrder = 3
    end
    object dblcUnCusteio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTEIO'#9'30'#9'Descrição'
        'CODCUSTEIO'#9'10'#9'Código')
      LookupTable = qryUnCusteio
      LookupField = 'CODCUSTEIO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcUnCusteioCloseUp
    end
    object chkEstoque: TCheckBox
      Left = 24
      Top = 280
      Width = 210
      Height = 18
      Caption = 'Só imprirmir itens estocáveis'
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 321
    Width = 372
    inherited tb97Fundo: TToolbar97
      Left = 202
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 35
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO,DESCALMOX'
      'FROM ALMOX'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCALMOX ')
    ValidateWithMask = True
    Left = 226
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '        CodGrupoProd,'
      '        DescGrupoProd '
      'From GrupProd '
      'where'
      '      (idpessoa = :pIDPESS)'
      'Order By DescGrupoProd')
    ValidateWithMask = True
    Left = 294
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      '     G.CODGRUPOPROD,'
      '     G.DESCGRUPOPROD,'
      '     G.STATUSGRUPO,'
      '     P.DESCPROD,'
      '     M.CODARTIGO,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'A'#39',M.VALORMOV,0 )) AS RECFORN,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'K'#39',M.VALORMOV,0 )) AS DEVFORN,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'F'#39',M.VALORMOV,'
      '                             '#39'T'#39',M.VALORMOV,'
      '                             '#39'G'#39',M.VALORMOV,'
      '                             '#39'U'#39',M.VALORMOV,'
      '                             '#39'R'#39',M.VALORMOV,0 )) AS BAITRANS,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'S'#39',M.VALORMOV,'
      '                             '#39'B'#39',M.VALORMOV,0 )) AS ENTTRANS,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'H'#39',M.VALORMOV,'
      '                             '#39'D'#39',M.VALORMOV,0 )) AS BAIACERTO,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'I'#39',M.VALORMOV,0 )) AS BAIESTRAGO,'
      '     SUM(DECODE(M.CODTIPOMOV,'#39'M'#39',M.VALORMOV,'
      '                             '#39'N'#39',M.VALORMOV,'
      '                             '#39'L'#39',M.VALORMOV,'
      '                             '#39'Q'#39',M.VALORMOV,'
      '                             '#39'J'#39',M.VALORMOV,'
      '                             '#39'A'#39',M.VALORMOV,'
      '                             '#39'C'#39',M.VALORMOV,'
      '                             '#39'V'#39',M.VALORMOV,'
      '                             '#39'X'#39',M.VALORMOV,'
      '                             '#39'W'#39',M.VALORMOV,'
      '                             '#39'B'#39',M.VALORMOV,'
      '                             '#39'O'#39',M.VALORMOV,'
      '                             '#39'E'#39',M.VALORMOV,'
      '                             '#39'P'#39',M.VALORMOV,'
      '                             '#39'Y'#39',M.VALORMOV,0 )) AS BAIXACC,'
      '    SUM(M.VALORMOV) AS TOTAL'
      'FROM'
      '    MOVIMENT M,'
      '    GRUPPROD G,'
      '    PRODUTO P,'
      '    ARTIGO A'
      'WHERE'
      '     (M.DATAMOV  >= :DATAINI)'
      ' AND (M.DATAMOV  <= :DATAFIM)'
      ' AND (M.CODALMOXARIFADO = :CODALMOXARIFADO)'
      ' AND (M.IDPESSOA = :IDPESSOA )'
      ' AND (M.CODARTIGO  = A.CODARTIGO)'
      ' AND (A.CODPRODUTO = P.CODPRODUTO)'
      ' AND (P.CODGRUPOPROD = G.CODGRUPOPROD)'
      'GROUP BY'
      '       G.CODGRUPOPROD,'
      '       G.DESCGRUPOPROD,'
      '       G.STATUSGRUPO,'
      '       P.DESCPROD,'
      '       M.CODARTIGO'
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      FixedChar = True
      Size = 10
    end
    object qryMovDESCGRUPOPROD: TStringField
      FieldName = 'DESCGRUPOPROD'
      Size = 30
    end
    object qryMovSTATUSGRUPO: TStringField
      FieldName = 'STATUSGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryMovDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Size = 40
    end
    object qryMovCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      FixedChar = True
      Size = 14
    end
    object qryMovRECFORN: TFloatField
      FieldName = 'RECFORN'
    end
    object qryMovDEVFORN: TFloatField
      FieldName = 'DEVFORN'
    end
    object qryMovBAITRANS: TFloatField
      FieldName = 'BAITRANS'
    end
    object qryMovENTTRANS: TFloatField
      FieldName = 'ENTTRANS'
    end
    object qryMovBAIACERTO: TFloatField
      FieldName = 'BAIACERTO'
    end
    object qryMovBAIESTRAGO: TFloatField
      FieldName = 'BAIESTRAGO'
    end
    object qryMovBAIXACC: TFloatField
      FieldName = 'BAIXACC'
    end
    object qryMovTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryUnCusteio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '          CODCUSTEIO,'
      '    DESCCUSTEIO                    '
      'FROM '
      '          UNCUSTEI'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 256
    Top = 13
  end
end
