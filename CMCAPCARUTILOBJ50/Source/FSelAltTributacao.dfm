inherited frmSelAltTributacao: TfrmSelAltTributacao
  Left = 642
  Top = 317
  BorderIcons = []
  BorderStyle = bsNone
  Caption = ''
  ClientHeight = 188
  ClientWidth = 479
  FormStyle = fsNormal
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 479
    Height = 149
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 477
      Height = 56
      Align = alTop
      TabOrder = 0
      object lblText1: TLabel
        Left = 10
        Top = 8
        Width = 136
        Height = 13
        Caption = 'ATENÇÃO! A tributação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblText2: TLabel
        Left = 151
        Top = 8
        Width = 317
        Height = 13
        Caption = '<Nome do Tributo> possui mais de um tipo de alterador.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblText3: TLabel
        Left = 10
        Top = 32
        Width = 340
        Height = 13
        Caption = 'Por gentileza, selecione um dos alteradores listados abaixo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 57
      Width = 477
      Height = 91
      Align = alClient
      TabOrder = 1
      object grdAlteradores: TwwDBGrid
        Left = 1
        Top = 1
        Width = 475
        Height = 89
        ControlType.Strings = (
          'SEL;CheckBox;S;N')
        Selected.Strings = (
          'SEL'#9'2'#9' '#9'F'
          'DESCRICAO'#9'35'#9'Tipo de Alterador'#9'F'
          'ALIQUOTA'#9'14'#9'Alíquota de retenção'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAlteradores
        TabOrder = 0
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
    end
  end
  inherited Dock971: TDock97
    Top = 149
    Width = 479
    inherited tb97Fundo: TToolbar97
      Left = 307
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 138
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 83
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object dsAlteradores: TwwDataSource
    DataSet = cdsAlteradores
    Left = 233
    Top = 81
  end
  object cdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 289
    Top = 65
  end
end
