inherited FrmCadastroGridMT: TFrmCadastroGridMT
  Caption = 'Cadastro Grid Multi Tier'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object pnlControles: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 199
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      TabStop = True
    end
    object dbGrd: TwwDBGrid
      Left = 1
      Top = 1
      Width = 505
      Height = 199
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbGrdCalcCellColors
      OnDblClick = dbGrdDblClick
      IndicatorColor = icBlack
      OnTopRowChanged = dbGrdTopRowChanged
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyInsert = CmeCadastroApplyInsert
  end
end
