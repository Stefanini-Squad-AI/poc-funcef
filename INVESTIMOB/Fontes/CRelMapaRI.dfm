inherited cfgRelMapaRI: TcfgRelMapaRI
  Left = 125
  Top = 112
  Caption = 'Mapa de Rentabilidade por Imóvel'
  ClientHeight = 394
  ClientWidth = 546
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 312
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Imóvel Mestre'
    end
    object Label6: TLabel
      Left = 16
      Top = 130
      Width = 109
      Height = 13
      Caption = 'Índice de Correção'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 212
      Width = 513
      Height = 2
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 16
      Top = 252
      Width = 513
      Height = 2
      Shape = bsTopLine
    end
    object grpAtuarial: TGroupBox
      Left = 16
      Top = 56
      Width = 241
      Height = 65
      Caption = ' Índice Atuarial Projetado '
      TabOrder = 2
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
      Top = 56
      Width = 265
      Height = 65
      Caption = ' Competência '
      TabOrder = 3
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
    object chkImprimeSoComValor: TCheckBox
      Left = 24
      Top = 226
      Width = 497
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuam receitas ou despesas'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnClick = chkVlrCorrigidoClick
    end
    object rdgAtuarial: TRadioGroup
      Left = 264
      Top = 128
      Width = 265
      Height = 73
      Caption = ' Mínimo Atuarial baseado no: '
      ItemIndex = 0
      Items.Strings = (
        'Custo Contábil'
        'Valor Corrigido')
      TabOrder = 6
    end
    object DBcboIndiceCorrecao: TwwDBLookupCombo
      Left = 16
      Top = 144
      Width = 129
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOESIGLA'#9'6'#9'Moeda')
      LookupTable = qryIndice
      LookupField = 'MOECODIGO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object chkVlrCorrigido: TCheckBox
      Left = 24
      Top = 178
      Width = 225
      Height = 17
      Caption = 'NÃO corrigir o Valor de Aquisição'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
      OnClick = chkVlrCorrigidoClick
    end
    object chkLinhas: TCheckBox
      Left = 24
      Top = 264
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 8
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 284
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 282
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
      TabOrder = 10
    end
    object edtImovelMestre: TEdit
      Left = 16
      Top = 24
      Width = 465
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscaImovelMestre: TBitBtn
      Left = 480
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca um Imóvel Mestre'
      TabOrder = 11
      OnClick = btnBuscaImovelMestreClick
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
    object btnLimpaImovelMestre: TBitBtn
      Left = 504
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Imóvel Mestre'
      TabOrder = 1
      OnClick = btnLimpaImovelMestreClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 312
    Width = 546
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
    Top = 361
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 374
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
    Left = 96
    Top = 141
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
