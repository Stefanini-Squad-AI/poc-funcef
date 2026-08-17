inherited frmRateiosMT: TfrmRateiosMT
  Left = 365
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Rateio Diferenciado'
  ClientHeight = 430
  ClientWidth = 520
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 391
    object dbgRateioDiferenciado: TwwDBGrid
      Left = 5
      Top = 193
      Width = 510
      Height = 193
      Selected.Strings = (
        'CODCENTROCUSTO'#9'15'#9'Centro de Custo'#9'F'
        'NOME'#9'37'#9'Descrição'#9'F'
        'PERCRATEIOCONTR'#9'14'#9'Rateio'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsRateioCCDif
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = dbgRateioDiferenciadoCalcCellColors
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 510
      Height = 188
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 32
        Top = 12
        Width = 29
        Height = 13
        Caption = 'Item:'
      end
      object Label2: TLabel
        Left = 19
        Top = 44
        Width = 42
        Height = 13
        Caption = 'Objeto:'
      end
      object rgpTipoRateio: TRadioGroup
        Left = 16
        Top = 72
        Width = 121
        Height = 105
        Caption = 'Tipo de Rateio'
        ItemIndex = 0
        Items.Strings = (
          'Percentual'
          'Quantitativo')
        TabOrder = 0
        OnClick = rgpTipoRateioClick
      end
      object edItem: TEdit
        Left = 72
        Top = 8
        Width = 425
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object edObjeto: TEdit
        Left = 72
        Top = 40
        Width = 425
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 144
        Top = 72
        Width = 353
        Height = 49
        Caption = 'Total'
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 23
          Width = 32
          Height = 13
          Caption = 'Qtde:'
        end
        object Label4: TLabel
          Left = 160
          Top = 23
          Width = 34
          Height = 13
          Caption = 'Valor:'
        end
        object edQtdeTotal: TEdit
          Left = 48
          Top = 19
          Width = 89
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object edValorTotal: TEdit
          Left = 200
          Top = 19
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 144
        Top = 128
        Width = 353
        Height = 49
        Caption = 'Ainda não Rateado'
        TabOrder = 4
        object Label5: TLabel
          Left = 8
          Top = 23
          Width = 32
          Height = 13
          Caption = 'Qtde:'
        end
        object Label6: TLabel
          Left = 160
          Top = 23
          Width = 35
          Height = 13
          Caption = 'Perc.:'
        end
        object edQtdeNaoRateada: TEdit
          Left = 48
          Top = 19
          Width = 89
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object edPercNaoRateado: TEdit
          Left = 200
          Top = 19
          Width = 137
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 1
          Text = '0,00'
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 520
    inherited tb97Fundo: TToolbar97
      Left = 350
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 20
  end
  object dsRateioCCDif: TDataSource
    DataSet = cdsRateioDif
    Left = 109
    Top = 256
  end
  object cdsRateioDif: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 256
  end
end
