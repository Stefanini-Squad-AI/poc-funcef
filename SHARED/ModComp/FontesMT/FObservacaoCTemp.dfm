inherited frmObservacaoCTemp: TfrmObservacaoCTemp
  BorderStyle = bsSingle
  Caption = 'Observação'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object mmoObs: TMemo
      Left = 1
      Top = 1
      Width = 526
      Height = 232
      Align = alClient
      Lines.Strings = (
        'mmoObs')
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
end
