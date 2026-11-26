inherited frmParamRelCadastrais: TfrmParamRelCadastrais
  Left = 127
  Top = 155
  Caption = 'Relatórios Cadastrais'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object rgrTabelas: TRadioGroup
      Left = 19
      Top = 13
      Width = 490
      Height = 200
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Items.Strings = (
        'Contribuições'
        'Benefícios'
        'Reservas'
        'Rubricas'
        'Planos Previdenciários'
        'Patrocinadoras'
        'Motivos'
        'Periodicidades'
        'Eventos Geradores'
        'Tipos de Pagamento de Benefício')
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 235
  end
end
