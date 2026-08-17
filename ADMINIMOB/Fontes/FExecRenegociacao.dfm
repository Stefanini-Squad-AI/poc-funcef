inherited frmExecRenegociacao: TfrmExecRenegociacao
  Left = 75
  Top = 71
  Caption = 'Renegociação Contratual'
  ClientHeight = 424
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 391
    object Label5: TLabel
      Left = 16
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Contrato'
    end
    object Label26: TLabel
      Left = 400
      Top = 58
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label27: TLabel
      Left = 208
      Top = 58
      Width = 134
      Height = 13
      Caption = 'Novo Valor do Contrato'
    end
    object Label1: TLabel
      Left = 16
      Top = 98
      Width = 39
      Height = 13
      Caption = 'Motivo'
    end
    object Label2: TLabel
      Left = 16
      Top = 226
      Width = 241
      Height = 13
      Caption = 'Reajustes e/ou Renegociações Anteriores'
    end
    object Label3: TLabel
      Left = 16
      Top = 58
      Width = 148
      Height = 13
      Caption = 'Valor Anterior do Contrato'
    end
    object dbgrdContratos: TwwDBGrid2
      Left = 16
      Top = 240
      Width = 529
      Height = 129
      Selected.Strings = (
        'EVIDATA'#9'10'#9'Data'#9'No'
        'TipoReajuste'#9'15'#9'Tipo Reajuste'#9'Yes'
        'EVIVLRANTERIOR'#9'15'#9'Valor Anterior'#9'No'
        'EVIVLRAJUSTADO'#9'15'#9'Valor Atual'#9'No')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsReajustes
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdContratosCalcCellColors
      IndicatorColor = icBlack
    end
    object edtMotivo: TEdit
      Left = 16
      Top = 112
      Width = 529
      Height = 21
      MaxLength = 40
      TabOrder = 1
    end
    object edtNovoValor: TRealEdit
      Left = 208
      Top = 72
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object DBedtMoeda: TDBEdit2
      Left = 400
      Top = 72
      Width = 145
      Height = 21
      DataField = 'MOESIGLA'
      DataSource = dsContrato
      ReadOnly = True
      TabOrder = 3
    end
    object DBedtNomeContrato: TDBEdit2
      Left = 16
      Top = 24
      Width = 505
      Height = 21
      DataField = 'CONNOME'
      DataSource = dsContrato
      ReadOnly = True
      TabOrder = 4
    end
    object grpReajuste: TGroupBox
      Left = 16
      Top = 144
      Width = 529
      Height = 61
      Caption = ' Reajuste '
      TabOrder = 5
      TabStop = True
      object Label14: TLabel
        Left = 296
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Índice'
      end
      object Label15: TLabel
        Left = 416
        Top = 16
        Width = 78
        Height = 13
        Caption = 'Periodicidade'
      end
      object Label34: TLabel
        Left = 470
        Top = 34
        Width = 37
        Height = 13
        Caption = 'Meses'
      end
      object Label11: TLabel
        Left = 160
        Top = 16
        Width = 94
        Height = 13
        Caption = 'Data do Próximo'
      end
      object Label50: TLabel
        Left = 16
        Top = 16
        Width = 102
        Height = 13
        Caption = 'Aplicar a partir de'
      end
      object DBedtProxReajuste: TCMDateTimePicker
        Left = 160
        Top = 30
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'CONPROXREAJUSTE'
        DataSource = dsContrato
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
      object DBcboIndiceReajuste: TwwDBLookupCombo
        Left = 296
        Top = 30
        Width = 97
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda')
        DataField = 'CONINDICEREAJUSTE'
        DataSource = dsContrato
        LookupField = 'MOECODIGO'
        Style = csDropDownList
        DropDownCount = 4
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBspnPeriodicidadeReajuste: TwwDBSpinEdit
        Left = 416
        Top = 30
        Width = 49
        Height = 21
        Increment = 1
        DataField = 'CONPERREAJUSTE'
        DataSource = dsContrato
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object DBedtUltReajuste: TCMDateTimePicker
        Left = 16
        Top = 30
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'CONDATAREAJUSTE'
        DataSource = dsContrato
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
    end
    object edtValorAnterior: TRealEdit
      Left = 16
      Top = 72
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object btnBuscaContrato: TBitBtn
      Left = 520
      Top = 24
      Width = 23
      Height = 21
      Hint = 'Busca um Contrato'
      TabOrder = 7
      OnClick = btnBuscaContratoClick
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
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 198
      DockPos = 198
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 164
        Visible = False
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 168
        Top = 0
        Blank = True
        SizeHorz = 1
        SizeVert = 1
      end
      object ToolbarSep976: TToolbarSep97 [4]
        Left = 169
        Top = 0
        Blank = True
        SizeHorz = 1
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65496
    Top = 65496
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsReajustes: TwwDataSource
    DataSet = qryReajustes
    Left = 320
    Top = 280
  end
  object qryReajustes: TwwQuery
    OnCalcFields = qryReajustesCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   EVIDATA, FLGTIPOEVENTO,'
      '   EVIVLRANTERIOR, EVIVLRAJUSTADO, '
      '   EVIDESCRICAO, EVIDATAPROX'
      'FROM'
      '   EVENTOIMOVEL'
      'WHERE'
      '   ( IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      '   AND ( FLGTIPOEVENTO IN ('#39'RE'#39','#39'RJ'#39') )'
      'ORDER BY'
      '   EVIDATA'
      ''
      '')
    PictureMasks.Strings = (
      'EVIVLRANTERIOR'#9'#,##0.00'#9'T'#9'T'
      'EVIVLRAJUSTADO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 320
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryReajustesEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'EVIDATA'
      Origin = 'EVENTOIMOVEL.EVIDATA'
    end
    object qryReajustesTipoReajuste: TStringField
      DisplayLabel = 'Tipo Reajuste'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'TipoReajuste'
      Size = 15
      Calculated = True
    end
    object qryReajustesEVIVLRANTERIOR: TFloatField
      DisplayLabel = 'Valor Anterior'
      DisplayWidth = 15
      FieldName = 'EVIVLRANTERIOR'
      DisplayFormat = '#,##0.00'
    end
    object qryReajustesEVIVLRAJUSTADO: TFloatField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 15
      FieldName = 'EVIVLRAJUSTADO'
      Origin = 'EVENTOIMOVEL.EVIVLRAJUSTADO'
      DisplayFormat = '#,##0.00'
    end
    object qryReajustesFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Origin = 'EVENTOIMOVEL.FLGTIPOEVENTO'
      Visible = False
      Size = 2
    end
    object qryReajustesEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      Origin = 'EVENTOIMOVEL.EVIDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryReajustesEVIDATAPROX: TDateTimeField
      FieldName = 'EVIDATAPROX'
      Origin = 'EVENTOIMOVEL.EVIDATAPROX'
      Visible = False
    end
  end
  object dsContrato: TwwDataSource
    DataSet = dtmImobiliario.qryContratosReajuste
    Left = 480
    Top = 255
  end
end
