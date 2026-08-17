inherited frmResetSenha: TfrmResetSenha
  Left = 382
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resetar Senha'
  ClientHeight = 153
  ClientWidth = 257
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 257
    Height = 114
    object rgrpSenha: TRadioGroup
      Left = 16
      Top = 16
      Width = 225
      Height = 81
      Caption = 'Indique a nova senha'
      ItemIndex = 0
      Items.Strings = (
        'Expressão "MUDESUASENHA".'
        'Senha aleatória.')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 114
    Width = 257
    inherited tb97Fundo: TToolbar97
      Left = 167
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 203
    Top = 59
  end
end
