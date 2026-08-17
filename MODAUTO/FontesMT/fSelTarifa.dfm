inherited frmSelTarifa: TfrmSelTarifa
  Left = 229
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Seleção da Tarifa a Aplicar, Se Mais de Uma Foi Encontrada'
  ClientHeight = 218
  ClientWidth = 670
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 179
    BorderWidth = 2
    object Label40: TLabel
      Left = 60
      Top = 164
      Width = 56
      Height = 13
      Caption = 'Atenção: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 116
      Top = 164
      Width = 436
      Height = 13
      Caption = 
        'Caso Queira Mudar a Tarifa a Ser Selecionada, Posicione a Seta N' +
        'ela Antes de Clicar "Sair"'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbgrdValores: TwwDBGrid
      Left = 2
      Top = 2
      Width = 666
      Height = 156
      TabStop = False
      Selected.Strings = (
        'DATAREF'#9'10'#9'Data'
        'DESCRICAO'#9'40'#9'Tarifa'
        'nm_tipo_tarifa'#9'20'#9'Tipo de Tarifa'
        'vl_valor'#9'17'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = clBtnFace
      DataSource = dsTarifa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 179
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        ModalResult = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 9
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object CdsTarifa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 370
    Top = 17
  end
  object dsTarifa: TwwDataSource
    DataSet = CdsTarifa
    Left = 321
    Top = 17
  end
end
