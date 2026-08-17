inherited frmPrincipal: TfrmPrincipal
  Left = 133
  Top = 129
  Caption = 'Sistema de Controle de Qualidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 120
    Top = 32
  end
  inherited stbarStatusBar: TfcStatusBar
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psDateTime
        Tag = 0
        Text = '17/07/2001 18:22'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 211
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object RestrioesdosFornecedores1: TMenuItem
        Caption = '&Restriçoes dos Fornecedores'
        OnClick = RestrioesdosFornecedores1Click
      end
      object TipodeAvaliao1: TMenuItem
        Caption = '&Tipo de Avaliação'
        OnClick = TipodeAvaliao1Click
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 355
    Top = 211
  end
end
