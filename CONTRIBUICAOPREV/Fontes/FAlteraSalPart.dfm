inherited FrmAlteraSalPart: TFrmAlteraSalPart
  Left = 318
  Top = 159
  Caption = 'Alterar Salário de Manutenção e Participação'
  ClientHeight = 403
  ClientWidth = 825
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 825
    Height = 364
    object lbl1: TLabel
      Left = 16
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object btnModelo: TSpeedButton
      Left = 599
      Top = 48
      Width = 73
      Height = 22
      Caption = 'Modelo'
      OnClick = btnModeloClick
    end
    object edtArquivo: TEdit
      Left = 122
      Top = 78
      Width = 526
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnAbreArquivo: TBitBtn
      Left = 656
      Top = 76
      Width = 24
      Height = 22
      Hint = 'Seleciona o arquivo para gravação do log de exceções.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAbreArquivoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000008888888888888888880000008888888888888888880000008800
        00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
        000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
        8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
        BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
        0000880000088888888888000000888888888888888888000000888888888888
        888888000000888888888888888888000000}
    end
    object btnLimpaArquivo: TBitBtn
      Left = 689
      Top = 76
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object mmoArquivo: TMemo
      Left = 31
      Top = 111
      Width = 682
      Height = 234
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object chkSalMant: TCheckBox
      Left = 168
      Top = 32
      Width = 169
      Height = 17
      Caption = 'Salário de Manutenção'
      TabOrder = 4
    end
    object chkSalPart: TCheckBox
      Left = 344
      Top = 32
      Width = 169
      Height = 17
      Caption = 'Salário de Participação'
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 825
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Atualizar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0))
  end
  object wqryqry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 360
    Top = 147
  end
  object ds: TwwDataSource
    DataSet = wqryqry
    Left = 392
    Top = 147
  end
  object wqryUpdate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 360
    Top = 179
  end
  object wqryDel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 360
    Top = 211
  end
  object OpenDialog: TOpenDialog
    Left = 408
    Top = 216
  end
end
