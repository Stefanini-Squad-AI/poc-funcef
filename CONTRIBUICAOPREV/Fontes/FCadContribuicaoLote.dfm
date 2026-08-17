inherited FrmCadContribuicaoLote: TFrmCadContribuicaoLote
  Left = 387
  Top = 161
  Caption = 'Cadastro de Contribuições em Lote'
  ClientHeight = 431
  ClientWidth = 709
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 709
    Height = 392
    object gBarradeProgresso: TGauge
      Left = 16
      Top = 360
      Width = 681
      Height = 20
      Progress = 0
      Visible = False
    end
    object memArquivo: TMemo
      Left = 1
      Top = 39
      Width = 707
      Height = 352
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 707
      Height = 38
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 13
        Width = 98
        Height = 13
        Caption = 'Nome do Arquivo'
      end
      object edtArquivo: TEdit
        Left = 120
        Top = 11
        Width = 526
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnAbreArquivo: TBitBtn
        Left = 649
        Top = 9
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
        Left = 673
        Top = 9
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
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 709
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
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
  object QryConsulta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 187
  end
  object OpenDialog: TOpenDialog
    Left = 400
    Top = 152
  end
  object qryInclui: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 187
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 476
    Top = 187
  end
end
