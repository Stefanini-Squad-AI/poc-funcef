inherited frmAditamentosNaoAprovados: TfrmAditamentosNaoAprovados
  Left = 192
  Top = 164
  Caption = 'Aditamentos com Processos RAD não aprovados'
  ClientHeight = 393
  ClientWidth = 574
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 354
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 564
      Height = 344
      Selected.Strings = (
        'IDCONTRATO'#9'5'#9'Contrato'
        'NOMECONTRATO'#9'43'#9'Nome'
        'DATAASSADITAMENTO'#9'10'#9'Data Aditamento'
        'NUMRAD'#9'10'#9'Processo RAD'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsAditamento
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
  inherited Dock971: TDock97
    Top = 354
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 402
      DockPos = 402
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 205
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
        Width = 125
        Caption = '&Restaurar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 75
    Top = 387
  end
  object cdsAditamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 96
  end
  object dsAditamento: TDataSource
    DataSet = cdsAditamento
    Left = 368
    Top = 40
  end
end
