inherited FrmObservacao: TFrmObservacao
  Left = 360
  Top = 276
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ''
  ClientHeight = 220
  ClientWidth = 474
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 474
    Height = 32
    Align = alTop
    object lblCaption: TLabel
      Left = 10
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
  end
  inherited Dock971: TDock97
    Top = 181
    Width = 474
    inherited tb97Fundo: TToolbar97
      Left = 302
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 133
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object pnlObs: TPanel [2]
    Left = 0
    Top = 32
    Width = 474
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object mmoObs: TMemo
      Left = 0
      Top = 0
      Width = 474
      Height = 149
      Align = alClient
      TabOrder = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 11
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
