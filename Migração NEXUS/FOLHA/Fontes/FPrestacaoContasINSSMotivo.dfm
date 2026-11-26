inherited frmPrestacaoContasINSSMotivo: TfrmPrestacaoContasINSSMotivo
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Prestação de Contas do INSS - Motivo da Retificação'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object pnTop: TPanel
      Left = 1
      Top = 1
      Width = 526
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 6
        Width = 47
        Height = 13
        Caption = 'Motivo :'
      end
    end
    object memoMotivo: TMemo
      Left = 1
      Top = 29
      Width = 526
      Height = 204
      Align = alClient
      TabOrder = 1
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
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
