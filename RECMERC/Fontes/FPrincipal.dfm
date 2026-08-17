inherited frmprincipal: Tfrmprincipal
  Left = 0
  Top = 29
  Caption = 'Sistema de Recebimento de Mercadoria'
  ClientHeight = 475
  ClientWidth = 779
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 779
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Top = 76
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 455
    Width = 779
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
        Width = '400'
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
        Style = psHint
        Tag = 0
        Text = '11/04/2001 22:50'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Left = 395
    Top = 32
    inherited mnuSistema: TMenuItem
      object MudarCentrodeCustoAlmoxarifado: TMenuItem [2]
        Caption = 'Mudar Centro de Custo / &Almoxarifado'
        OnClick = MudarCentrodeCustoAlmoxarifadoClick
      end
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      object N18: TMenuItem [10]
        Caption = '-'
      end
      object UsuriosporCentrodeCusto: TMenuItem [11]
        Caption = 'Usuários por &Centro de Custo'
        OnClick = UsuriosporCentrodeCustoClick
      end
      object UsurioporAlmoxarifado: TMenuItem [12]
        Caption = 'Usuários por &Almoxarifado'
        OnClick = UsurioporAlmoxarifadoClick
      end
      object UsuriosporGrupodeProduto: TMenuItem [13]
        Caption = 'Usuários por &Grupo de Produto'
        OnClick = UsuriosporGrupodeProdutoClick
      end
    end
    object Movimentacao1: TMenuItem [1]
      Caption = '&Movimentação'
      object RecebimentodeMercadoria: TMenuItem
        Caption = '&Recebimento de Mercadoria'
        object ComOC: TMenuItem
          Caption = '&Com O.C.'
          OnClick = ComOCClick
        end
        object SemOC: TMenuItem
          Caption = '&Sem O.C.'
          OnClick = SemOCClick
        end
      end
      object DevoluodeMercadoria: TMenuItem
        Caption = '&Devolução de Mercadoria'
        OnClick = DevoluodeMercadoriaClick
      end
    end
    inherited mnuCadastro: TMenuItem
      object Produto: TMenuItem
        Caption = '&Produto'
        HelpContext = 1050
        object GrupodeProduto: TMenuItem
          Caption = '&Grupo de Produto'
          HelpContext = 1050
          OnClick = GrupodeProdutoClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object Insumos: TMenuItem
          Caption = 'In&sumos'
          OnClick = InsumosClick
        end
        object Outros: TMenuItem
          Caption = '&Outros'
          OnClick = OutrosClick
        end
        object ItensdeVenda: TMenuItem
          Caption = 'Itens de &Venda'
          OnClick = ItensdeVendaClick
        end
        object ItensdePDV: TMenuItem
          Caption = 'Itens de &PDV'
          OnClick = ItensdePDVClick
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object UnidadedeMedida: TMenuItem
          Caption = '&Unidade de Medida'
          HelpContext = 1050
          OnClick = UnidadedeMedidaClick
        end
        object Tamanho: TMenuItem
          Caption = '&Tamanho'
          HelpContext = 1050
          OnClick = TamanhoClick
        end
        object Cor: TMenuItem
          Caption = '&Cor'
          HelpContext = 1050
          OnClick = CorClick
        end
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object UnidadedeCusteio: TMenuItem
        Caption = 'U&nidade de Custeio'
        HelpContext = 1051
        OnClick = UnidadedeCusteioClick
      end
      object Almoxarifado: TMenuItem
        Caption = '&Almoxarifado'
        HelpContext = 1051
        OnClick = AlmoxarifadoClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Impostos: TMenuItem
        Caption = '&Custos Agregados'
        OnClick = ImpostosClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object Fornecedor: TMenuItem
        Caption = '&Fornecedor'
        OnClick = FornecedorClick
      end
      object RamodeFornecedor: TMenuItem
        Caption = '&Ramo de Fornecedor'
        OnClick = RamodeFornecedorClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ConfiguraodeModelosdeHistrico1: TMenuItem
        Caption = 'Configuração de Modelos de Histórico'
        OnClick = ConfiguraodeModelosdeHistrico1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object ConsultadeRecebimentodeMercadoria1: TMenuItem
        Caption = 'Consulta de Recebimento de Mercadoria'
        OnClick = ConsultadeRecebimentodeMercadoria1Click
      end
    end
  end
end
