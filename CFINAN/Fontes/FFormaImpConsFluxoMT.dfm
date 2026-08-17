inherited frmFormaImpConsFluxoMT: TfrmFormaImpConsFluxoMT
  Left = 382
  Top = 432
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Impressão de Fluxo de Caixa'
  ClientHeight = 143
  ClientWidth = 342
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    Height = 104
    object rgOrientacao: TRadioGroup
      Left = 16
      Top = 14
      Width = 313
      Height = 78
      Caption = 'Orientação do Papel'
      ItemIndex = 0
      Items.Strings = (
        'Retrato'
        'Paisagem')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 104
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 172
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 5
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    Top = 27
  end
end
