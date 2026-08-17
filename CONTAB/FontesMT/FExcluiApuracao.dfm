inherited FrmExcluiApuracao: TFrmExcluiApuracao
  Left = 277
  Top = 161
  HelpContext = 10139
  Caption = 'Exclusão de Apuração de Resultados'
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 438
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 436
      Height = 232
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 434
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 1
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 12
          Width = 55
          Height = 13
          Caption = 'Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 136
          Top = 12
          Width = 46
          Height = 13
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkExerc: TwwDBLookupCombo
          Left = 16
          Top = 28
          Width = 97
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          DataField = 'PEREXERCI'
          LookupTable = cdsExercicio
          LookupField = 'PEREXERCICIO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object dblkPeriodo: TwwDBLookupCombo
          Left = 136
          Top = 28
          Width = 169
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PERNOME'#9'25'#9'PERNOME')
          DataField = 'PERNUMERO'
          LookupTable = cdsPeriodo
          LookupField = 'PERNUMERO'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object btSeleciona: TBitBtn
          Left = 320
          Top = 24
          Width = 97
          Height = 25
          Caption = 'Selecionar'
          TabOrder = 2
          OnClick = btSelecionaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
        object Grid: TwwDBGrid
          Left = 16
          Top = 72
          Width = 401
          Height = 139
          ControlType.Strings = (
            'SELECIONA;CheckBox;S;N')
          Selected.Strings = (
            'SELECIONA'#9'3'#9'Sel'
            'PLANO'#9'26'#9'Plano'
            'PATRO'#9'27'#9'Patro'
            'PLNPLANIL'#9'10'#9'Planilha'
            'PLNDATDIA'#9'18'#9'Data')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = ds
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = GridCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = GridTopRowChanged
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 438
    inherited tb97Fundo: TToolbar97
      Left = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 65515
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAfterOpen
    Left = 50
    Top = 226
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 10
    Top = 218
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 15
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 8
  end
end
