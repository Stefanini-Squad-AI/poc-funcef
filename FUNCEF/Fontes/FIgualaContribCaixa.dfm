inherited frmIgualaContribCaixa: TfrmIgualaContribCaixa
  Left = 237
  Top = 207
  HelpContext = 3360030
  Caption = 'Iguala valores Patronais de contribuições CAIXA'
  ClientHeight = 122
  ClientWidth = 347
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 347
    Height = 83
    object Label1: TLabel
      Left = 22
      Top = 37
      Width = 100
      Height = 13
      Caption = 'Mês de Cobrança'
    end
    object Label2: TLabel
      Left = 222
      Top = 37
      Width = 67
      Height = 13
      Caption = '(AAAA/MM)'
    end
    object edmescob: TEdit
      Left = 133
      Top = 34
      Width = 82
      Height = 21
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 83
    Width = 347
    inherited tb97Fundo: TToolbar97
      Left = 175
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 264
  end
end
