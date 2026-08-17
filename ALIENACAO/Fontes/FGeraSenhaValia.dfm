inherited frmGeraSenhaValia: TfrmGeraSenhaValia
  Caption = 'Gera Senha para Arquivo INI da Valia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 141
      Height = 13
      Caption = 'Arquivo de Configuração'
    end
    object SpeedButton1: TSpeedButton
      Left = 224
      Top = 48
      Width = 23
      Height = 22
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000008888888888888888880000008888888888888888880000008800
        00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
        000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
        8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
        BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
        0000880000088888888888000000888888888888888888000000888888888888
        888888000000888888888888888888000000}
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 24
      Top = 88
      Width = 85
      Height = 13
      Caption = 'Senha Anterior'
    end
    object Label3: TLabel
      Left = 24
      Top = 128
      Width = 69
      Height = 13
      Caption = 'Nova senha'
    end
    object edtArquivo: TEdit
      Left = 24
      Top = 48
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtSenhaAnt: TEdit
      Left = 24
      Top = 104
      Width = 193
      Height = 21
      TabOrder = 1
    end
    object edtNovaSenha: TEdit
      Left = 24
      Top = 144
      Width = 193
      Height = 21
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 251
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = 'Arquivos de configuração|*.ini'
    Left = 272
    Top = 40
  end
end
