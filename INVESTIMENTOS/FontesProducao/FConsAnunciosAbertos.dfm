inherited frmConsAnunciosAbertos: TfrmConsAnunciosAbertos
  Left = 117
  Top = 181
  Caption = 'Consulta'
  ClientHeight = 392
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 353
    inherited bvlSepTit: TBevel
      Width = 735
    end
    inherited pnlTitulo: TPanel
      Width = 735
      inherited lbNomDescricao: TfcLabel
        Width = 349
        Caption = 'Anúncios de Proventos em Aberto'
      end
    end
    object dbgAnuncRel: TwwDBGrid
      Left = 1
      Top = 96
      Width = 735
      Height = 256
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'
        'DESCCARTINVEST'#9'60'#9'Carteira de Investimento'
        'BOLETA'#9'30'#9'Boleta'
        'DATAEX'#9'18'#9'Data EX'
        'DATAPREVISTA'#9'18'#9'Data Prevista'
        'DATABASE'#9'18'#9'Data Base'
        'DESCINVESTIMENTO'#9'60'#9'Investimento'
        'QTDPREVISTA'#9'10'#9'Qtd Prevista'
        'QTDRECEBIDA'#9'10'#9'Qtd Recebida'
        'QTDRESTANTE'#9'10'#9'Qtd Restante'
        'PRECOUNITOPERACAO'#9'10'#9'Preço Unitário'
        'VLROPERACAO'#9'10'#9'Valor a Receber'#9'F'
        'IDGRUPO'#9'108'#9'IDGRUPO')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DmRelAnuncAbt.dsAnunciosAbt
      TabOrder = 1
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
    object pnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 735
      Height = 51
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 134
        Top = 4
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 386
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label2: TLabel
        Left = 15
        Top = 5
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object dblkInvest: TwwDBLookupCombo
        Left = 386
        Top = 19
        Width = 327
        Height = 21
        Hint = 'Investimento'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkInvestCloseUp
        OnExit = dblkInvestExit
      end
      object dblkTpOper: TwwDBLookupCombo
        Left = 134
        Top = 19
        Width = 245
        Height = 21
        Hint = 'Tipo de Operação'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryTpOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkTpOperCloseUp
        OnExit = dblkTpOperExit
      end
      object dtRef: TCMDateTimePicker
        Left = 15
        Top = 19
        Width = 106
        Height = 21
        Hint = 'Data EX'
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
        OnExit = dtRefExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 355
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 669
    Top = 56
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryTpOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO'
      
        'WHERE IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRJUR FROM PARAMINVES' +
        'T)'
      
        '   OR IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRDIV FROM PARAMINVES' +
        'T)'
      
        '   OR IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRMUL FROM PARAMINVES' +
        'T)'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 335
    Top = 56
    object qryTpOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTpOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
  end
end
