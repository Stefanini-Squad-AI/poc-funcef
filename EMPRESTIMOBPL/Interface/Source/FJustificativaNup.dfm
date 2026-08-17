inherited frmJustificativa: TfrmJustificativa
  Left = 511
  Top = 286
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Justificativa'
  ClientHeight = 136
  ClientWidth = 533
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 533
    Height = 97
  end
  inherited Dock971: TDock97
    Top = 97
    Width = 533
    inherited tb97Fundo: TToolbar97
      Left = 361
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object mmoJustificativa: TMemo [2]
    Left = 0
    Top = 0
    Width = 533
    Height = 97
    Align = alClient
    Lines.Strings = (
      'mmoJustificativa')
    MaxLength = 200
    TabOrder = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
