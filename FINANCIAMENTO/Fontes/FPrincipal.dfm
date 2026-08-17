inherited frmPrincipal: TfrmPrincipal
  Left = 132
  Top = 158
  Caption = 'Financiamento'
  ClientHeight = 301
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 510
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 281
    Width = 510
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
        Text = '20/03/2001 20:01'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    inherited mnuCadastro: TMenuItem
      object Proposta1: TMenuItem
        Caption = '&Proposta'
        OnClick = Proposta1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object GeraodeContratodeVenda1: TMenuItem
        Caption = '&Geração de Contrato de Venda'
        OnClick = GeraodeContratodeVenda1Click
      end
      object GeraodasParcelasdoContratodeVenda1: TMenuItem
        Caption = 'G&eração das Parcelas do Contrato de Venda'
        OnClick = GeraodasParcelasdoContratodeVenda1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object N3: TMenuItem
        Caption = '-'
      end
      object AnlisedeProposta1: TMenuItem
        Caption = '&Análise de Proposta'
        OnClick = AnlisedeProposta1Click
      end
    end
  end
end
