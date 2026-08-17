inherited frmCadNatContaContabil: TfrmCadNatContaContabil
  Left = 375
  Top = 213
  Width = 374
  Height = 149
  ActiveControl = rgNatureza
  Caption = 'Natureza da Conta'
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 72
    object rgNatureza: TRadioGroup
      Left = 11
      Top = 7
      Width = 337
      Height = 54
      Caption = ' Selecione uma Natureza para a Conta '
      Columns = 2
      Items.Strings = (
        'Credora'
        'Devedora')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 72
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 186
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 17
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
end
