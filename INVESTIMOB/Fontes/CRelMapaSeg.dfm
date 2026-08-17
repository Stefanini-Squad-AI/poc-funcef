inherited cfgRelMapaSeg: TcfgRelMapaSeg
  Left = 125
  Top = 94
  HelpContext = 540082
  Caption = 'Mapa de Rentabilidade por Segmento'
  ClientHeight = 369
  ClientWidth = 544
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    Height = 287
    object Bevel2: TBevel
      Left = 16
      Top = 227
      Width = 513
      Height = 2
      Shape = bsTopLine
    end
    object grpAtuarial: TGroupBox
      Left = 16
      Top = 16
      Width = 241
      Height = 65
      Caption = ' Índice Atuarial Projetado '
      TabOrder = 0
      object Label2: TLabel
        Left = 84
        Top = 32
        Width = 16
        Height = 20
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 212
        Top = 32
        Width = 16
        Height = 20
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image2: TImage
        Left = 112
        Top = 33
        Width = 18
        Height = 18
        AutoSize = True
        Picture.Data = {
          07544269746D61704E010000424D4E0100000000000076000000280000001200
          0000120000000100040000000000D80000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888000000888888877777888888000000888888000007
          8888880000008888880FFF078888880000008888880FFF078888880000008888
          880FFF078888880000008877770FFF077777780000008000000FFF0000007800
          000080FFFFFFFFFFFFF07800000080FFFFFFFFFFFFF07800000080FFFFFFFFFF
          FFF0780000008000000FFF000000880000008888880FFF078888880000008888
          880FFF078888880000008888880FFF078888880000008888880FFF0788888800
          0000888888000008888888000000888888888888888888000000}
      end
      object edtAtuarialPrevisto: TRealEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edtAtuarialSoma: TRealEdit
        Left = 144
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object grpReferencia: TGroupBox
      Left = 264
      Top = 16
      Width = 265
      Height = 65
      Caption = ' Competência de Recebimento'
      TabOrder = 1
      object Label4: TLabel
        Left = 16
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label3: TLabel
        Left = 176
        Top = 18
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object cboMes: TComboBox
        Left = 16
        Top = 32
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 176
        Top = 32
        Width = 73
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object rdgAtuarial: TRadioGroup
      Left = 264
      Top = 176
      Width = 265
      Height = 41
      Caption = ' Mínimo Atuarial baseado no: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Custo Contábil'
        'Valor Corrigido')
      TabOrder = 5
    end
    object chkLinhas: TCheckBox
      Left = 24
      Top = 239
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 6
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 259
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 257
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 8
    end
    object rgTipoSegmento: TRadioGroup
      Left = 16
      Top = 176
      Width = 241
      Height = 41
      Caption = 'Tipo de Segmento '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Gerencial'
        'Carteira da SPC')
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 264
      Top = 88
      Width = 265
      Height = 81
      Caption = 'Referência para Custo Contábil'
      TabOrder = 3
      object edtVlrContabil: TCMDateTimePicker
        Left = 19
        Top = 32
        Width = 161
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
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 88
      Width = 241
      Height = 81
      Caption = 'Correção da Reavaliação'
      TabOrder = 2
      object Label6: TLabel
        Left = 16
        Top = 17
        Width = 109
        Height = 13
        Caption = 'Índice de Correção'
      end
      object DBcboIndiceCorrecao: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 193
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda')
        LookupTable = qryIndice
        LookupField = 'MOECODIGO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object chkVlrCorrigido: TCheckBox
        Left = 17
        Top = 57
        Width = 145
        Height = 17
        Caption = 'NÃO corrigir o valor'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        OnClick = chkVlrCorrigidoClick
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 287
    Width = 544
    Height = 49
    Align = alBottom
    TabOrder = 1
    object lblProgress: TLabel
      Left = 16
      Top = 8
      Width = 141
      Height = 13
      Caption = 'Processando Relatório...'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 513
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 372
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, M.MOEDESC, M.MOESIGLA,'
      '   M.MOEPERIODICIDADE, M.MOEINATIVO,'
      '   M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM'
      'FROM'
      '   MOEDA M'
      'ORDER BY'
      '   M.MOESIGLA')
    ValidateWithMask = True
    Left = 208
    Top = 112
    object qryIndiceMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
    object qryIndiceMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
    object qryIndiceMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Visible = False
      Size = 1
    end
    object qryIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object qryIndiceDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
      Visible = False
    end
    object qryIndiceDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
      Visible = False
    end
  end
end
