inherited frmTipoBenefConcede: TfrmTipoBenefConcede
  Left = 237
  Top = 215
  Caption = 'Tipo de Benefício a Conceder'
  ClientHeight = 156
  ClientWidth = 459
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 117
    object rgrpTipo: TRadioGroup
      Left = 12
      Top = 9
      Width = 436
      Height = 97
      ItemIndex = 0
      Items.Strings = (
        'Conceder Benefícios para o Participante (Titular)'
        'Conceder Benefícios para Beneficiários Diretos do Participante'
        'Concessão de Benefícios para Herdeiros')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 117
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 208
      DockPos = 208
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 39
      DockPos = 39
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65533
    Top = 133
  end
end
