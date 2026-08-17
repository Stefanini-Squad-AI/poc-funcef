inherited FRMPARAMRELATREGRA5: TFRMPARAMRELATREGRA5
  Left = 203
  Top = 309
  Caption = 'Relação de Regras Parametrizadas'
  ClientHeight = 188
  ClientWidth = 395
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 149
    object rgrpOrdem: TRadioGroup
      Left = 27
      Top = 21
      Width = 346
      Height = 105
      ItemIndex = 0
      Items.Strings = (
        'Ordenar pelo Número da Regra'
        'Ordenar pelo Nome da Regra')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 149
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 225
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 238
  end
end
