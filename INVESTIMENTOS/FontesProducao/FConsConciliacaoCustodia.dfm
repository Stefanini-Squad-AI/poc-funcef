inherited frmConsConciliacaoCustodia: TfrmConsConciliacaoCustodia
  Left = 218
  Top = 175
  HelpContext = 790561
  Caption = 'Visualização'
  ClientHeight = 407
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 368
    inherited bvlSepTit: TBevel
      Width = 708
    end
    inherited pnlTitulo: TPanel
      Width = 708
      TabOrder = 2
      inherited lbNomDescricao: TfcLabel
        Width = 244
        Caption = 'Conciliação de Custódia'
      end
    end
    object dbgRendaVariavel: TwwDBGrid
      Left = 1
      Top = 142
      Width = 708
      Height = 225
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'#9'F'
        'DESCCARTINVEST'#9'33'#9'Carteira de Investimento'
        'DESCINVESTIMENTO'#9'24'#9'Investimento'
        'CARTINVSLDQTD'#9'16'#9'Saldo Atual'
        'CUSTODIASLDQTD'#9'16'#9'Saldo de Custódia'
        'DIFERENCA'#9'14'#9'Divergência')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clInfoBk
      DataSource = DtmRelatorio.DsConciliacaoCustodiaFechto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = dbgRendaVariavelCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgRendaVariavelTopRowChanged
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 708
      Height = 97
      Align = alTop
      TabOrder = 0
      object lblDataRef: TLabel
        Left = 17
        Top = 6
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object lblCarteira: TLabel
        Left = 16
        Top = 47
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 201
        Top = 6
        Width = 69
        Height = 13
        Caption = 'Plano/Patro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 336
        Top = 46
        Width = 68
        Height = 13
        Caption = 'Custodiante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dDataRef: TCMDateTimePicker
        Left = 17
        Top = 20
        Width = 113
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
      object dblCarteira: TwwDBLookupCombo
        Left = 16
        Top = 61
        Width = 280
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblPlano: TwwDBLookupCombo
        Left = 201
        Top = 20
        Width = 416
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'113'#9'Plano/Patro'#9'F')
        LookupTable = QryPlano
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblCustodiante: TwwDBLookupCombo
        Left = 336
        Top = 60
        Width = 280
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'60'#9'SGLCUSTODIANTE'#9'F')
        LookupTable = QryCustodiante
        LookupField = 'IDCUSTODIANTE'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 710
    inherited tb97Fundo: TToolbar97
      Left = 443
      DockPos = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 84
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 3
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 87
      end
      object btnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 65531
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST,DESCCARTINVEST,DATAULTFECH, FLGCARTTERC'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   (IDTIPOINVEST = 2) AND'
      
        '   (((:FLGCARTTERC IS NOT NULL) AND (FLGCARTTERC = :FLGCARTTERC)' +
        ') OR (:FLGCARTTERC IS NULL))'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 236
    Top = 78
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end>
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraFLGCARTTERC: TStringField
      FieldName = 'FLGCARTTERC'
      Origin = 'CARTEIRAINVEST.FLGCARTTERC'
      FixedChar = True
      Size = 1
    end
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME || '#39' - '#39' || PE.NOME) AS PL' +
        'ANPRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      'AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 588
    Top = 38
    object QryPlanoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patro'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryPlanoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object QryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIANTE, SGLCUSTODIANTE'
      'FROM CUSTODIANTE  '
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 588
    Top = 86
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayWidth = 60
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
end
