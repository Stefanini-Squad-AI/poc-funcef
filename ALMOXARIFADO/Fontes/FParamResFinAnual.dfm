inherited FrmParamResFinAnual: TFrmParamResFinAnual
  Left = 250
  Top = 144
  Caption = 'Custo por Centro de Custo Anual'
  ClientHeight = 258
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 219
    object Label3: TLabel
      Left = 24
      Top = 62
      Width = 186
      Height = 13
      Caption = 'Centro de Custo (caso desejado)'
    end
    object Label1: TLabel
      Left = 25
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Ano'
    end
    object Label2: TLabel
      Left = 192
      Top = 16
      Width = 111
      Height = 13
      Caption = 'Verificar Até a data'
    end
    object Label5: TLabel
      Left = 24
      Top = 105
      Width = 201
      Height = 13
      Caption = 'Grupo de Produtos (caso desejado)'
    end
    object dblcCCust: TwwDBLookupCombo
      Left = 24
      Top = 77
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTROCUSTO'#9'10'#9'Código')
      LookupTable = qryCCust
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object SpAno: TSpinEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 22
      MaxLength = 4
      MaxValue = 3000
      MinValue = 1996
      TabOrder = 1
      Value = 1996
      OnChange = SpAnoChange
    end
    object edDataLimite: TCMDateTimePicker
      Left = 192
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
      ShowButton = True
      TabOrder = 2
    end
    object dblcGrpProd: TwwDBLookupCombo
      Left = 24
      Top = 121
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Nome'
        'CODGRUPOPROD'#9'10'#9'Código')
      LookupTable = qryGrpProd
      LookupField = 'CODGRUPOPROD'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object RgOrdem: TRadioGroup
      Left = 24
      Top = 152
      Width = 289
      Height = 46
      Caption = ' Ordem '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código')
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 219
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryCCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODCENTROCUSTO,'
      '           Nome '
      'From '
      '        CentCust'
      'where '
      '            (IDEMPRESA = :pIDEMP)'
      '   AND (STATUSGRUPOCDC = '#39'A'#39')'
      'order by 2')
    ValidateWithMask = True
    Left = 267
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDEMP'
        ParamType = ptUnknown
      end>
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCGRUPOPROD, CODGRUPOPROD'
      'FROM GRUPPROD'
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 217
    Top = 216
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '     DECODE(M.CODCENTROCUSTO,NULL,'#39'99999999999'#39',M.CODCENTROCUSTO' +
        ') AS CODCENTROCUSTO,'
      
        '     DECODE(C.NOME,NULL,'#39'CENTRO DE CUSTO NÃO CADASTRADO'#39',C.NOME)' +
        ' AS NOME,'
      '     G.CODGRUPOPROD,'
      '     G.DESCGRUPOPROD,'
      '     TO_CHAR(M.DATAMOV,'#39'MM'#39') AS MES,'
      '     M.CODARTIGO,'
      
        '             (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODC' +
        'OR)  AS DESCRICAO,'
      '     M.DATAMOV, '
      '     round(M.VALORMOV, 2) as VALORMOV,'
      '     M.QTDEMOV,'
      '     P.CODMEDCUSTO'
      'FROM'
      '    MOVIMENT M, '
      '    ARTIGO A,'
      '    PRODUTO P,'
      '    CENTCUST C, '
      '    ALMOX A,'
      '    ALMOX T,'
      '    GRUPPROD G'
      '  '
      'WHERE'
      '      (M.CODTIPOMOV <> '#39'A'#39')'
      '  AND (M.CODTIPOMOV <> '#39'K'#39')'
      '  AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)   '
      '  AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+)) '
      
        '  AND ((M.CODALMOXTRANSF IS NULL) OR ((M.CODALMOXTRANSF IS NOT N' +
        'ULL) AND (A.CODCUSTEIO <> T.CODCUSTEIO)) )'
      '  AND (TO_CHAR(M.DATAMOV,'#39'YYYY'#39') = '#39'1999'#39')'
      '  AND (M.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (P.CODGRUPOPROD = G.CODGRUPOPROD)'
      '  AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO(+))'
      '  AND (M.IDEMPRESA = C.IDEMPRESA(+))'
      'ORDER BY'
      
        '     DECODE(M.CODCENTROCUSTO,NULL,'#39'99999999999'#39',M.CODCENTROCUSTO' +
        '),'
      '     G.CODGRUPOPROD,'
      '     M.CODARTIGO,'
      '     M.DATAMOV,'
      '     TO_CHAR(M.DATAMOV,'#39'MM'#39')')
    ValidateWithMask = True
    Left = 144
    Top = 216
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 11
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Size = 10
    end
    object qryDESCGRUPOPROD: TStringField
      FieldName = 'DESCGRUPOPROD'
      Size = 30
    end
    object qryMES: TStringField
      FieldName = 'MES'
      Size = 2
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryVALORMOV: TFloatField
      FieldName = 'VALORMOV'
    end
    object qryQTDEMOV: TFloatField
      FieldName = 'QTDEMOV'
    end
    object qryCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Size = 4
    end
  end
end
