inherited frmCadTipoFundoInvest: TfrmCadTipoFundoInvest
  Left = 339
  Top = 200
  HelpContext = 790049
  Caption = 'Tipos de Fundo de Investimento'
  ClientHeight = 315
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 229
    inherited Bevel2: TBevel
      Width = 499
    end
    object Label1: TLabel [1]
      Left = 22
      Top = 107
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object Label2: TLabel [2]
      Left = 22
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label45: TLabel [3]
      Left = 341
      Top = 107
      Width = 113
      Height = 13
      Caption = 'Último Fechamento '
    end
    object Label3: TLabel [4]
      Left = 22
      Top = 153
      Width = 131
      Height = 13
      Caption = 'Segmentação Mercado'
    end
    inherited pnlTitulo: TPanel
      Width = 499
      TabOrder = 3
      inherited lbNomItem: TfcLabel
        Width = 326
        Caption = 'Tipos de Fundo de Investimento'
      end
    end
    object dbeDescricao: TwwDBEdit
      Left = 22
      Top = 72
      Width = 441
      Height = 21
      DataField = 'DESCTIPOFUNDOINV'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblTipoInvest: TwwDBLookupCombo
      Left = 22
      Top = 122
      Width = 299
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'40'#9'Descrição')
      DataField = 'IDTIPOINVEST'
      DataSource = ds
      LookupTable = qryTipoInvestimento
      LookupField = 'IDTIPOINVEST'
      Options = [loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbdDtaFechFdo: TCMDateTimePicker
      Left = 341
      Top = 122
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAULTFECH'
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
      TabOrder = 2
    end
    object dblSegmentacaoMercado: TwwDBLookupCombo
      Left = 23
      Top = 168
      Width = 295
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCSEGMENTACAO'#9'40'#9'Descrição'#9'F')
      DataField = 'IDSEGMENTACAO'
      DataSource = ds
      LookupTable = qrySegmentacao
      LookupField = 'IDSEGMENTACAO'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 501
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 329
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 177
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 352
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOFUNDOINVEST'
      'set'
      '  IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  DESCTIPOFUNDOINV = :DESCTIPOFUNDOINV,'
      '  DATAULTFECH = :DATAULTFECH,'
      '  IDSEGMENTACAO =:IDSEGMENTACAO'
      'where'
      '  IDTIPOFUNDOINVEST = :OLD_IDTIPOFUNDOINVEST'
      ' ')
    InsertSQL.Strings = (
      'insert into TIPOFUNDOINVEST'
      
        '  (IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H, IDSEGMENTACAO)'
      'values'
      
        '  (:IDTIPOFUNDOINVEST, :IDTIPOINVEST, :DESCTIPOFUNDOINV, :DATAUL' +
        'TFECH, :IDSEGMENTACAO)')
    DeleteSQL.Strings = (
      'delete from TIPOFUNDOINVEST'
      'where'
      '  IDTIPOFUNDOINVEST = :OLD_IDTIPOFUNDOINVEST')
    Left = 306
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOFUNDOINVEST.DATAULTFECH')
    TipodeDado.Strings = (
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Fundo Investimento'
      'Tipo de Investimento'
      'Data Último Fechamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOFUNDOINVEST'
      'TIPOINVEST')
    CamposChave.Strings = (
      'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST')
    Filtro.Strings = (
      'TIPOFUNDOINVEST.IDTIPOINVEST = TIPOINVEST.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '35'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 389
    Top = 54
  end
  inherited ImlPadrao: TImageList
    Left = 377
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 396
    Top = 6
  end
  inherited qry: TwwQuery
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  IDTIPOFUNDOINVEST,'
      '  IDTIPOINVEST,'
      '  DESCTIPOFUNDOINV,'
      '  DATAULTFECH,'
      ' IDSEGMENTACAO'
      'FROM'
      '  TIPOFUNDOINVEST'
      'WHERE IDTIPOFUNDOINVEST = :P_IDTIPOFUNDOINVEST'
      'ORDER BY'
      '  DESCTIPOFUNDOINV')
    UpdateObject = nil
    Left = 250
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object qryIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object qryDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo Investimento'
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
    end
    object qryIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDSEGMENTACAO'
    end
  end
  object qryTipoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOINVEST,'
      '  DESCTIPOINVEST'
      'FROM'
      '  TIPOINVEST'
      'WHERE'
      '    (IDTIPOINVEST IN (5,6,7,9,10))'
      'AND ((:IDTIPOINVEST IS NULL) OR (IDTIPOINVEST <= :IDTIPOINVEST))'
      'ORDER BY DESCTIPOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 275
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qryTipoInvestimentoDESCTIPOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
  end
  object qrySegmentacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  SM.IDSEGMENTACAO, '
      '  SM.DESCSEGMENTACAO '
      'FROM '
      '  SEGMENTACAOMERCADO SM'
      'WHERE IDGRUPO = 3'
      ' ')
    ValidateWithMask = True
    Left = 290
    Top = 222
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 390
    Top = 215
  end
end
