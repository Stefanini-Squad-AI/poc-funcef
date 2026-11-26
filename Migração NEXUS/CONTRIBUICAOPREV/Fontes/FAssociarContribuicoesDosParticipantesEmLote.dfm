inherited FrmAssociarContribuicoesDosParticipantesEmLote: TFrmAssociarContribuicoesDosParticipantesEmLote
  Left = 583
  Top = 336
  Caption = 'Associar Contribuições dos Participantes em Lote'
  ClientHeight = 360
  ClientWidth = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 716
    Height = 321
    object btnModelo: TSpeedButton
      Left = 568
      Top = 24
      Width = 73
      Height = 22
      Caption = 'Modelo'
    end
    object lbl1: TLabel
      Left = 24
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object rgRgTipoOperacao: TRadioGroup
      Left = 185
      Top = 8
      Width = 310
      Height = 49
      Caption = 'Tipo de Operação'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Atualização'
        'Exclusão')
      TabOrder = 0
    end
    object edtArquivo: TEdit
      Left = 128
      Top = 78
      Width = 526
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object btnAbreArquivo: TBitBtn
      Left = 657
      Top = 76
      Width = 24
      Height = 22
      Hint = 'Seleciona o arquivo para gravação do log de exceções.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      Left = 681
      Top = 76
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
      Left = 24
      Top = 112
      Width = 681
      Height = 204
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 714
      Height = 319
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 5
      object lbl2: TLabel
        Left = 16
        Top = 64
        Width = 98
        Height = 13
        Caption = 'Nome do Arquivo'
      end
      object btn1: TSpeedButton
        Left = 568
        Top = 22
        Width = 73
        Height = 25
        Caption = 'Modelo'
        OnClick = btn1Click
      end
      object btn4: TSpeedButton
        Left = 646
        Top = 22
        Width = 27
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
        OnClick = btn4Click
      end
      object edt1: TEdit
        Left = 120
        Top = 62
        Width = 526
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btn2: TBitBtn
        Left = 649
        Top = 60
        Width = 24
        Height = 22
        Hint = 'Seleciona o arquivo para gravação do log de exceções.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btn2Click
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
      object btn3: TBitBtn
        Left = 673
        Top = 60
        Width = 23
        Height = 22
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn3Click
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
      object mmoArquivo1: TMemo
        Left = 16
        Top = 96
        Width = 681
        Height = 204
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
      object rgRgTipoOperacao1: TRadioGroup
        Left = 202
        Top = 8
        Width = 310
        Height = 49
        Caption = 'Tipo de Operação'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Atualização'
          'Inclusão')
        TabOrder = 4
        OnClick = rgRgTipoOperacao1Click
      end
    end
  end
  inherited Dock971: TDock97
    Top = 321
    Width = 716
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
  object ds: TwwDataSource
    Left = 432
    Top = 91
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
    Left = 328
    Top = 115
  end
  object wqryDel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 155
  end
  object OpenDialog: TOpenDialog
    Filter = 'Excel (xls, xlsx)|*.xls; *.xlsx|All (*.*)|*.*'
    Left = 448
    Top = 160
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 91
  end
end
