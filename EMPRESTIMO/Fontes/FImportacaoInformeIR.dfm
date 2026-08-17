inherited FrmImportacaoInformeIR: TFrmImportacaoInformeIR
  Left = 744
  Top = 416
  Caption = 'Importação do Informe de IR '
  ClientHeight = 340
  ClientWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 713
    Height = 301
    object Label2: TLabel
      Left = 29
      Top = 42
      Width = 85
      Height = 13
      Caption = 'Nº do Contrato'
    end
    object Label1: TLabel
      Left = 91
      Top = 19
      Width = 23
      Height = 13
      Caption = 'Ano'
    end
    object btnLimpaArquivo: TBitBtn
      Left = 673
      Top = 38
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnLimpaArquivoClick
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
    object memArquivo: TMemo
      Left = 16
      Top = 64
      Width = 681
      Height = 217
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object EdtNum: TSpinEdit
      Left = 120
      Top = 16
      Width = 65
      Height = 22
      MaxValue = 2050
      MinValue = 2000
      TabOrder = 2
      Value = 2019
    end
    object EdtContrato: TEdit
      Left = 120
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
      OnExit = EdtContratoExit
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 713
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = btnLimpaArquivoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 27
    TargetsData = (
      1
      5
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 91
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 432
    Top = 91
  end
  object qryDel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 155
  end
  object qryInsert: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 123
  end
end
