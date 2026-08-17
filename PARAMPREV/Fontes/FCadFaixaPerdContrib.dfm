inherited FrmCadFaixaPerdContrib: TFrmCadFaixaPerdContrib
  Left = 410
  Top = 54
  Caption = 'Faixas de Provisão para Perdas de Contribuição'
  ClientHeight = 567
  ClientWidth = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 716
    Height = 481
    object tbcVigencia: TTabControlDetalhe
      Left = 8
      Top = 11
      Width = 273
      Height = 81
      TabOrder = 0
      Tabs.Strings = (
        'Vigência')
      TabIndex = 0
      object Label9: TLabel
        Left = 12
        Top = 32
        Width = 105
        Height = 13
        Caption = 'Início da Vigência'
      end
      object Label10: TLabel
        Left = 140
        Top = 32
        Width = 91
        Height = 13
        Caption = 'Fim da Vigência'
      end
      object edtDateDTInicioVigencia: TCMDateTimePicker
        Left = 12
        Top = 48
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'INICIOVIGENCIA'
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
      object edtDateDTFimVigencia: TCMDateTimePicker
        Left = 140
        Top = 48
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'FIMVIGENCIA'
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
        TabOrder = 1
      end
    end
    object tbcFaixaCalcPerc: TTabControlDetalhe
      Left = 294
      Top = 8
      Width = 307
      Height = 83
      TabOrder = 1
      Tabs.Strings = (
        'Faixas para Cálculo e Percentual')
      TabIndex = 0
      object Label1: TLabel
        Left = 121
        Top = 32
        Width = 62
        Height = 13
        Caption = 'Faixa Final'
      end
      object Label2: TLabel
        Left = 16
        Top = 32
        Width = 69
        Height = 13
        Caption = 'Faixa Inicial'
      end
      object Label3: TLabel
        Left = 215
        Top = 32
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dbedtFaixaInicial: TDBEdit
        Left = 17
        Top = 48
        Width = 81
        Height = 21
        DataField = 'FAIXAINICIAL'
        DataSource = ds
        TabOrder = 0
      end
      object dbedtFaixaFinal: TDBEdit
        Left = 114
        Top = 48
        Width = 81
        Height = 21
        DataField = 'FAIXAFINAL'
        DataSource = ds
        TabOrder = 1
      end
      object dbedtPercentual: TDBEdit
        Left = 208
        Top = 48
        Width = 81
        Height = 21
        DataField = 'PERCENTUAL'
        DataSource = ds
        TabOrder = 2
      end
    end
    object grdPlanDisponivel: TwwDBGrid
      Left = 8
      Top = 111
      Width = 297
      Height = 159
      Selected.Strings = (
        'NOME'#9'50'#9'Planos Disponíveis')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsPlanDisponivel
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object grdPlanAssociado: TwwDBGrid
      Left = 368
      Top = 111
      Width = 297
      Height = 159
      Selected.Strings = (
        'NOME'#9'50'#9'Planos Associados'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsPlanAssociado
      TabOrder = 6
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object bntRemovePlano: TButton
      Left = 315
      Top = 130
      Width = 41
      Height = 25
      Caption = '<'
      TabOrder = 3
      OnClick = bntRemovePlanoClick
    end
    object bntRemoveTodosPlano: TButton
      Left = 315
      Top = 162
      Width = 41
      Height = 25
      Caption = '<<'
      TabOrder = 4
      OnClick = bntRemoveTodosPlanoClick
    end
    object bntAddPlan: TButton
      Left = 315
      Top = 194
      Width = 41
      Height = 25
      Caption = '>'
      TabOrder = 5
      OnClick = bntAddPlanClick
    end
    object grdContribDisponivel: TwwDBGrid
      Left = 8
      Top = 293
      Width = 297
      Height = 159
      Selected.Strings = (
        'NOME'#9'50'#9'Contribuições Disponíveis'#9'T')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsContribDisponivel
      TabOrder = 7
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object bntRemoveContrib: TButton
      Left = 315
      Top = 310
      Width = 41
      Height = 25
      Caption = '<'
      TabOrder = 8
      OnClick = bntRemoveContribClick
    end
    object bntRemoveTodosContrib: TButton
      Left = 315
      Top = 342
      Width = 41
      Height = 25
      Caption = '<<'
      TabOrder = 9
      OnClick = bntRemoveTodosContribClick
    end
    object bntAddContrib: TButton
      Left = 315
      Top = 374
      Width = 41
      Height = 25
      Caption = '>'
      TabOrder = 10
      OnClick = bntAddContribClick
    end
    object grdContribAssociado: TwwDBGrid
      Left = 368
      Top = 293
      Width = 297
      Height = 159
      Selected.Strings = (
        'NOME'#9'50'#9'Contribuições Associadas'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsContribAssociado
      TabOrder = 11
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object bntAddTodosPlan: TButton
      Left = 315
      Top = 226
      Width = 41
      Height = 25
      Caption = '>>'
      TabOrder = 12
      OnClick = bntAddTodosPlanClick
    end
    object bntAddTodosContrib: TButton
      Left = 315
      Top = 403
      Width = 41
      Height = 25
      Caption = '>>'
      TabOrder = 13
      OnClick = bntAddTodosContribClick
    end
  end
  inherited Dock972: TDock97
    Width = 716
  end
  inherited Dock971: TDock97
    Top = 528
    Width = 716
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE FAIXASPROVISAOPERDACONTRIB'
      'SET INICIOVIGENCIA = :INICIOVIGENCIA,               '
      '    FIMVIGENCIA = :FIMVIGENCIA,                  '
      '    FAIXAINICIAL = :FAIXAINICIAL,                 '
      '    FAIXAFINAL = :FAIXAFINAL,                   '
      '    PERCENTUAL = :PERCENTUAL,                   '
      '    IDPLANOPREV = :IDPLANOPREV,                  '
      '    IDCONTRIBUICAO = :IDCONTRIBUICAO'
      
        'WHERE IDFAIXASPROVISAOPERDACONTRIB = :IDFAIXASPROVISAOPERDACONTR' +
        'IB')
    InsertSQL.Strings = (
      'INSERT INTO FAIXASPROVISAOPERDACONTRIB'
      '(IDFAIXASPROVISAOPERDACONTRIB, '
      'INICIOVIGENCIA,               '
      'FIMVIGENCIA,                  '
      'FAIXAINICIAL,                 '
      'FAIXAFINAL,                   '
      'PERCENTUAL,                   '
      'IDPLANOPREV,                  '
      'IDCONTRIBUICAO)'
      'VALUES'
      '(SEQIDFAIXAPROVPERDCONTRIB.NEXTVAL,'
      ':INICIOVIGENCIA,'
      ':FIMVIGENCIA,'
      ':FAIXAINICIAL,'
      ':FAIXAFINAL,'
      ':PERCENTUAL,'
      ':IDPLANOPREV,'
      ':IDCONTRIBUICAO)')
    DeleteSQL.Strings = (
      'DELETE FROM FAIXASPROVISAOPERDACONTRIB'
      
        ' WHERE IDFAIXASPROVISAOPERDACONTRIB = :OLD_IDFAIXASPROVISAOPERDA' +
        'CONTRIB')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione'
    Colunas.Strings = (
      'FAIXASPROVISAOPERDACONTRIB.INICIOVIGENCIA'
      'FAIXASPROVISAOPERDACONTRIB.FIMVIGENCIA'
      'FAIXASPROVISAOPERDACONTRIB.FAIXAINICIAL'
      'FAIXASPROVISAOPERDACONTRIB.FAIXAFINAL'
      'FAIXASPROVISAOPERDACONTRIB.PERCENTUAL')
    TipodeDado.Strings = (
      'D'
      'D'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Inicío da Vigência'
      'Fim da Vigência'
      'Faixa Inicial'
      'Faixa Final'
      'Percentual')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FAIXASPROVISAOPERDACONTRIB')
    CamposChave.Strings = (
      'FAIXASPROVISAOPERDACONTRIB.INICIOVIGENCIA'
      'FAIXASPROVISAOPERDACONTRIB.FIMVIGENCIA'
      'FAIXASPROVISAOPERDACONTRIB.FAIXAINICIAL'
      'FAIXASPROVISAOPERDACONTRIB.FAIXAFINAL'
      'FAIXASPROVISAOPERDACONTRIB.PERCENTUAL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '18'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    AfterConfirma = CmeCadastroAfterConfirma
  end
  inherited qry: TwwQuery
    AfterCancel = qryAfterCancel
    SQL.Strings = (
      'SELECT * FROM FAIXASPROVISAOPERDACONTRIB'
      ' WHERE '
      
        '               ((:INICIOVIGENCIA IS NULL AND INICIOVIGENCIA IS N' +
        'ULL) OR INICIOVIGENCIA = :INICIOVIGENCIA)'
      
        #9#9'   AND ((:FIMVIGENCIA IS NULL AND FIMVIGENCIA IS NULL) OR FIMV' +
        'IGENCIA = :FIMVIGENCIA)'
      
        #9#9'   AND ((:FAIXAINICIAL IS NULL AND FAIXAINICIAL IS NULL) OR FA' +
        'IXAINICIAL = :FAIXAINICIAL)'
      
        #9#9'   AND ((:FAIXAFINAL IS NULL AND FAIXAFINAL IS NULL) OR FAIXAF' +
        'INAL = :FAIXAFINAL)'
      
        #9#9'   AND ((:PERCENTUAL IS NULL AND PERCENTUAL IS NULL) OR PERCEN' +
        'TUAL = :PERCENTUAL)')
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end>
    object qryIDFAIXASPROVISAOPERDACONTRIB: TFloatField
      FieldName = 'IDFAIXASPROVISAOPERDACONTRIB'
      Origin = 
        'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.IDFAIXASPROVISAOPERDACONTRI' +
        'B'
    end
    object qryINICIOVIGENCIA: TDateTimeField
      FieldName = 'INICIOVIGENCIA'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.INICIOVIGENCIA'
    end
    object qryFIMVIGENCIA: TDateTimeField
      FieldName = 'FIMVIGENCIA'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.FIMVIGENCIA'
    end
    object qryFAIXAINICIAL: TFloatField
      FieldName = 'FAIXAINICIAL'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.FAIXAINICIAL'
    end
    object qryFAIXAFINAL: TFloatField
      FieldName = 'FAIXAFINAL'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.FAIXAFINAL'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.PERCENTUAL'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.IDPLANOPREV'
    end
    object qryIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.IDCONTRIBUICAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.TRGDTINCLUSAO'
    end
    object qryTRGUSERALTERACAO: TStringField
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.TRGUSERALTERACAO'
      Size = 30
    end
    object qryTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.FAIXASPROVISAOPERDACONTRIB.TRGDTALTERACAO'
    end
  end
  object qryPlanDisponivel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDPLANOPREVPREV, NOME'
      '  FROM PLANPREVCONTABIL'
      ' WHERE ATIVO = '#39'S'#39
      '   AND IDPLANOPREVPREV IS NOT NULL')
    UpdateObject = updPlanDisponivel
    ValidateWithMask = True
    Left = 256
    Top = 270
  end
  object dsPlanDisponivel: TwwDataSource
    DataSet = qryPlanDisponivel
    Left = 256
    Top = 230
  end
  object dsPlanAssociado: TwwDataSource
    DataSet = qryPlanAssociado
    Left = 624
    Top = 231
  end
  object qryPlanAssociado: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPlanDisponivelAfterScroll
    AfterPost = qryPlanDisponivelAfterScroll
    AfterDelete = qryPlanDisponivelAfterScroll
    AfterScroll = qryPlanDisponivelAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPLANOPREV, P.IDPLANOPREVPREV, P.NOME'
      '  FROM FAIXASPROVISAOPERDACONTRIB F'
      '  INNER JOIN PLANPREVCONTABIL P'
      '  ON F.IDPLANOPREV = P.IDPLANOPREV'
      ' WHERE'
      
        '               ((:INICIOVIGENCIA IS NULL AND INICIOVIGENCIA IS N' +
        'ULL) OR INICIOVIGENCIA = :INICIOVIGENCIA)'
      
        #9#9'   AND ((:FIMVIGENCIA IS NULL AND FIMVIGENCIA IS NULL) OR FIMV' +
        'IGENCIA = :FIMVIGENCIA)'
      
        #9#9'   AND ((:FAIXAINICIAL IS NULL AND FAIXAINICIAL IS NULL) OR FA' +
        'IXAINICIAL = :FAIXAINICIAL)'
      
        #9#9'   AND ((:FAIXAFINAL IS NULL AND FAIXAFINAL IS NULL) OR FAIXAF' +
        'INAL = :FAIXAFINAL)'
      
        #9#9'   AND ((:PERCENTUAL IS NULL AND PERCENTUAL IS NULL) OR PERCEN' +
        'TUAL = :PERCENTUAL)'
      'ORDER BY P.NOME')
    UpdateObject = updPlanAssociado
    ValidateWithMask = True
    Left = 624
    Top = 271
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end>
  end
  object dsContribDisponivel: TwwDataSource
    DataSet = qryContribDisponivel
    Left = 264
    Top = 415
  end
  object qryContribDisponivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      'FROM CONTRIBUICAO C'
      'INNER JOIN CONTPREV CP'
      'ON C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'WHERE CP.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 264
    Top = 455
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsContribAssociado: TwwDataSource
    DataSet = qryContribAssociado
    Left = 632
    Top = 423
  end
  object qryContribAssociado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      '  FROM FAIXASPROVISAOPERDACONTRIB F'
      '  INNER JOIN CONTRIBUICAO C'
      '  ON F.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      ' WHERE '
      
        '               ((:INICIOVIGENCIA IS NULL AND INICIOVIGENCIA IS N' +
        'ULL) OR INICIOVIGENCIA = :INICIOVIGENCIA)'
      
        #9#9'   AND ((:FIMVIGENCIA IS NULL AND FIMVIGENCIA IS NULL) OR FIMV' +
        'IGENCIA = :FIMVIGENCIA)'
      
        #9#9'   AND ((:FAIXAINICIAL IS NULL AND FAIXAINICIAL IS NULL) OR FA' +
        'IXAINICIAL = :FAIXAINICIAL)'
      
        #9#9'   AND ((:FAIXAFINAL IS NULL AND FAIXAFINAL IS NULL) OR FAIXAF' +
        'INAL = :FAIXAFINAL)'
      
        #9#9'   AND ((:PERCENTUAL IS NULL AND PERCENTUAL IS NULL) OR PERCEN' +
        'TUAL = :PERCENTUAL)'
      'ORDER BY C.NOME')
    UpdateObject = updContribAssociado
    ValidateWithMask = True
    Left = 632
    Top = 463
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'INICIOVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FIMVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FAIXAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end>
  end
  object updPlanAssociado: TUpdateSQL
    Left = 619
    Top = 198
  end
  object updContribAssociado: TUpdateSQL
    Left = 627
    Top = 382
  end
  object updPlanDisponivel: TUpdateSQL
    Left = 251
    Top = 182
  end
end
