inherited frmCadFeriadoInvest: TfrmCadFeriadoInvest
  Left = 213
  Top = 137
  HelpContext = 790013
  Caption = 'Feriado Investimento'
  ClientHeight = 286
  ClientWidth = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 200
    object Label1: TLabel
      Left = 17
      Top = 54
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object Label2: TLabel
      Left = 17
      Top = 105
      Width = 96
      Height = 13
      Caption = 'Bolsa de Valores'
    end
    object Label4: TLabel
      Left = 17
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Data Feriado'
    end
    object DbLkcBolsa: TwwDBLookupCombo
      Left = 17
      Top = 125
      Width = 227
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
      DataField = 'IDBOLSAVALORES'
      DataSource = ds
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DblkcTipoInvest: TwwDBLookupCombo
      Left = 17
      Top = 74
      Width = 227
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento')
      DataField = 'IDTIPOINVEST'
      DataSource = ds
      LookupTable = QryTipoInvest
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DbDateFeriado: TCMDateTimePicker
      Left = 17
      Top = 28
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAFERIADO'
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
      TabOrder = 0
    end
    object DBChbFlagFeriado: TDBCheckBox
      Left = 17
      Top = 159
      Width = 175
      Height = 17
      Caption = 'Considera como feriado'
      DataField = 'FLGFERIADO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 336
  end
  inherited Dock971: TDock97
    Top = 247
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ds: TwwDataSource
    Left = 261
    Top = 64
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FERIADOINVEST'
      'set'
      '  IDFERIADOINVEST = :IDFERIADOINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  FLGFERIADO = :FLGFERIADO,'
      '  DATAFERIADO = :DATAFERIADO'
      'where'
      '  IDFERIADOINVEST = :OLD_IDFERIADOINVEST')
    InsertSQL.Strings = (
      'insert into FERIADOINVEST'
      '  (IDFERIADOINVEST, IDTIPOINVEST, IDBOLSAVALORES, FLGFERIADO, '
      'DATAFERIADO)'
      'values'
      
        '  (:IDFERIADOINVEST, :IDTIPOINVEST, :IDBOLSAVALORES, :FLGFERIADO' +
        ', '
      ':DATAFERIADO)')
    DeleteSQL.Strings = (
      'delete from FERIADOINVEST'
      'where'
      '  IDFERIADOINVEST = :OLD_IDFERIADOINVEST')
    Left = 201
    Top = 64
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FERIADOINVEST.IDTIPOINVEST'
      'FERIADOINVEST.DATAFERIADO'
      'FERIADOINVEST.IDBOLSAVALORES')
    TipodeDado.Strings = (
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Data Feriado'
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FERIADOINVEST')
    CamposChave.Strings = (
      'FERIADOINVEST.IDFERIADOINVEST')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10')
    Left = 277
    Top = 104
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '       IDFERIADOINVEST,'
      '       IDTIPOINVEST,'
      '       IDBOLSAVALORES,'
      '       FLGFERIADO,'
      '       DATAFERIADO'
      'FROM '
      '      FERIADOINVEST'
      'WHERE'
      ' (IDFERIADOINVEST=:IDFERIADOINVEST)'
      ' ')
    Left = 231
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFERIADOINVEST'
        ParamType = ptUnknown
      end>
    object qryIDFERIADOINVEST: TFloatField
      FieldName = 'IDFERIADOINVEST'
      Origin = 'FERIADOINVEST.IDFERIADOINVEST'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'FERIADOINVEST.IDTIPOINVEST'
    end
    object qryFLGFERIADO: TStringField
      FieldName = 'FLGFERIADO'
      Origin = 'FERIADOINVEST.FLGFERIADO'
      Size = 1
    end
    object qryDATAFERIADO: TDateTimeField
      FieldName = 'DATAFERIADO'
      Origin = 'FERIADOINVEST.DATAFERIADO'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'FERIADOINVEST.IDBOLSAVALORES'
    end
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES '
      ''
      'FROM CM.BOLSAVALORES '
      ''
      'ORDER BY SGLBOLSAVALORES ')
    ValidateWithMask = True
    Left = 229
    Top = 201
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object DsBolsaValores: TwwDataSource
    DataSet = QryBolsaValores
    Left = 258
    Top = 201
  end
  object QryTipoInvest: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select       TI.IdTipoInvest,'
      '                TI.DescTipoInvest'
      ''
      'From        CM.TipoInvest TI'
      '')
    ValidateWithMask = True
    Left = 265
    Top = 168
  end
  object DsAux: TwwDataSource
    Left = 295
    Top = 168
  end
end
