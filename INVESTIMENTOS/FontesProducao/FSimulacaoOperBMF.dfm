inherited FrmSimulacaoOperBMF: TFrmSimulacaoOperBMF
  Left = 349
  Top = 171
  HelpContext = 790266
  BorderIcons = [biSystemMenu]
  Caption = 'Simulação'
  ClientHeight = 410
  ClientWidth = 388
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 388
    Height = 371
    inherited bvlSepTit: TBevel
      Width = 386
    end
    object lblDataRef: TLabel [1]
      Left = 18
      Top = 58
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object lblCarteiraInvest: TLabel [2]
      Left = 18
      Top = 101
      Width = 45
      Height = 13
      Caption = 'Carteira'
    end
    object lblBeta: TLabel [3]
      Left = 18
      Top = 141
      Width = 27
      Height = 13
      Caption = 'Beta'
    end
    object lblContrato: TLabel [4]
      Left = 18
      Top = 181
      Width = 49
      Height = 13
      Caption = 'Contrato'
    end
    inherited pnlTitulo: TPanel
      Width = 386
      inherited lbNomDescricao: TfcLabel
        Width = 252
        Caption = 'Simulação de Operações'
      end
    end
    object dtDataRef: TCMDateTimePicker
      Left = 18
      Top = 74
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
      OnExit = dtDataRefExit
    end
    object dblkCarteira: TwwDBLookupCombo
      Left = 18
      Top = 116
      Width = 359
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CARTEIRA'#9'60'#9'Carteira'#9'F')
      LookupTable = qryCarteira
      LookupField = 'IDCARTEIRA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkCarteiraExit
    end
    object dblkParamExcel: TwwDBLookupCombo
      Left = 18
      Top = 156
      Width = 359
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPARAM'#9'30'#9'Beta'#9'F')
      LookupTable = qryParamExcel
      LookupField = 'IDPARAMIMPEXCEL'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkParamExcelExit
    end
    object dblkContrato: TwwDBLookupCombo
      Left = 18
      Top = 196
      Width = 359
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOCTINVEST'#9'60'#9'Contrato'#9'F')
      LookupTable = qryContrato
      LookupField = 'IDTIPOCONTRINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkContratoExit
    end
    object Panel1: TPanel
      Left = 1
      Top = 227
      Width = 386
      Height = 143
      Align = alBottom
      TabOrder = 5
      object lblPeso: TLabel
        Left = 16
        Top = 12
        Width = 29
        Height = 13
        Caption = 'Peso'
      end
      object lblVlrPeso: TLabel
        Left = 80
        Top = 11
        Width = 37
        Height = 16
        Caption = 'Peso'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblBetaCarteira: TLabel
        Left = 16
        Top = 43
        Width = 27
        Height = 13
        Caption = 'Beta'
      end
      object lblCarteira: TLabel
        Left = 16
        Top = 75
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblVlrCarteira: TLabel
        Left = 80
        Top = 74
        Width = 56
        Height = 16
        Caption = 'Carteira'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblVlrBetaCarteira: TLabel
        Left = 80
        Top = 42
        Width = 33
        Height = 16
        Caption = 'Beta'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblPuAjuste: TLabel
        Left = 218
        Top = 12
        Width = 75
        Height = 13
        Caption = 'PU de Ajuste'
      end
      object lblPercentual: TLabel
        Left = 218
        Top = 54
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object lblNrContratos: TLabel
        Left = 218
        Top = 94
        Width = 120
        Height = 13
        Caption = 'Número de Contratos'
      end
      object redtPuAjuste: TRealEdit
        Left = 218
        Top = 28
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        OnExit = redtPuAjusteExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redtPercentual: TRealEdit
        Left = 218
        Top = 68
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        OnExit = redtPercentualExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redtNrContratos: TRealEdit
        Left = 218
        Top = 108
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        OnExit = redtNrContratosExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 388
    inherited tb97Fundo: TToolbar97
      Left = 216
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 47
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.DESCCARTINVEST AS CARTEIRA,'
      
        '       (CI.IDCARTEIRAINVEST || CG.IDCARTEIRAGERENC) AS IDCARTEIR' +
        'A,'
      '       CI.IDCARTEIRAINVEST,'
      '       CG.IDCARTEIRAGERENC'
      'FROM CARTEIRAINVEST CI, CARTEIRAGERENC CG'
      'WHERE'
      '      (CI.IDTIPOINVEST = 2) AND'
      '      (CI.IDCARTEIRAINVEST = CG.IDCARTEIRAGERENC(+)) AND'
      '      (CI.IDCARTEIRAINVEST <> CG.IDCARTEIRAGERENC(+)) AND'
      '      CG.IDCARTEIRAGERENC IS NULL'
      'UNION'
      'SELECT CG.DESCCARTGERENC AS CARTEIRA,'
      
        '       (CI.IDCARTEIRAINVEST || CG.IDCARTEIRAGERENC) AS IDCARTEIR' +
        'A,'
      '       CI.IDCARTEIRAINVEST,'
      '       CG.IDCARTEIRAGERENC'
      'FROM CARTEIRAINVEST CI, CARTEIRAGERENC CG'
      'WHERE (CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      ''
      'ORDER BY CARTEIRA'
      ''
      ''
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 334
    Top = 68
    object qryCarteiraCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraIDCARTEIRA: TStringField
      DisplayWidth = 80
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 80
    end
  end
  object qryHistBeta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VLRBETA,VLRCARTEIRA'
      'FROM '
      '   HISTBETACARTEIRA'
      'WHERE'
      '   (IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      '   (DATAHISTBETA = TO_DATE(:DATAHISTBETA,'#39'DD/MM/YYYY'#39')) AND'
      '   (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      
        '   (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCARTEIRAGERENC = :ID' +
        'CARTEIRAGERENC )) OR (:IDCARTEIRAGERENC  IS NULL)) AND'
      '   (IDPARAMIMPEXCEL = :IDPARAMIMPEXCEL)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 262
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTBETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPARAMIMPEXCEL'
        ParamType = ptUnknown
      end>
    object qryHistBetaVLRBETA: TFloatField
      FieldName = 'VLRBETA'
    end
    object qryHistBetaVLRCARTEIRA: TFloatField
      FieldName = 'VLRCARTEIRA'
    end
  end
  object qryParamExcel: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPARAMIMPEXCEL,NOMEPARAM'
      'FROM'
      '   PARAMIMPORTEXCEL'
      'WHERE'
      '   FLGTPCOTACAO='#39'B'#39' ')
    ValidateWithMask = True
    Left = 190
    Top = 68
    object qryParamExcelNOMEPARAM: TStringField
      DisplayLabel = 'Beta'
      DisplayWidth = 30
      FieldName = 'NOMEPARAM'
      Origin = 'BASEDADOS.PARAMIMPORTEXCEL.NOMEPARAM'
      Size = 30
    end
    object qryParamExcelIDPARAMIMPEXCEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARAMIMPEXCEL'
      Origin = 'BASEDADOS.PARAMIMPORTEXCEL.IDPARAMIMPEXCEL'
      Visible = False
    end
  end
  object qryContrato: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TI.DESCTIPOCTINVEST,X.PESOCONTRATO,TI.IDTIPOCONTRINVEST'
      'FROM'
      '   TIPOCONTRINVEST TI,'
      '   (SELECT'
      '       IDTIPOCONTRINVEST,PESOCONTRATO'
      '    FROM'
      '       PARAMCONTRATOBMF PA,'
      '       (SELECT'
      '           MAX(PA1.DATAVIGENCIA)'
      '        FROM'
      '           PARAMCONTRATOBMF PA1'
      '        WHERE'
      '           DATAVIGENCIA <= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      '    ) X'
      'WHERE'
      '   TI.IDTIPOCONTRINVEST = X.IDTIPOCONTRINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 222
    Top = 188
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object qryContratoDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Size = 60
    end
    object qryContratoPESOCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'PESOCONTRATO'
      Visible = False
    end
    object qryContratoIDTIPOCONTRINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTRINVEST'
      Visible = False
    end
  end
end
