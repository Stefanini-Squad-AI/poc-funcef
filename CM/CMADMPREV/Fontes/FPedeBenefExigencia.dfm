inherited frmPedeBenefExigencia: TfrmPedeBenefExigencia
  Left = 361
  Top = 212
  BorderIcons = []
  Caption = 'Concessão de Benefício'
  ClientHeight = 184
  ClientWidth = 329
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 329
    Height = 145
    object rgrpModoConcessao: TRadioGroup
      Left = 12
      Top = 6
      Width = 304
      Height = 130
      ItemIndex = 0
      Items.Strings = (
        'Conceder benefício em modo normal'
        'Conceder benefício em exigência'
        'Manter benefício pendente de concessão'
        'Não conceder benefício')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 145
    Width = 329
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
end
ionContribuicao
