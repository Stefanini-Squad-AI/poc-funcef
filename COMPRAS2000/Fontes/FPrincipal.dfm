inherited frmPrincipal: TfrmPrincipal
  Left = 71
  Top = 102
  Caption = 'Compras'
  ClientHeight = 534
  ClientWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 800
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 303
    Top = 52
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 514
    Width = 800
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
        Style = psDateTime
        Tag = 0
        Text = '06/01/2010 10:48'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object Button1: TButton [3]
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  inherited mnu: TMainMenu
    Top = 184
    inherited mnuSistema: TMenuItem
      HelpContext = 50011
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      object N3: TMenuItem [10]
        Caption = '-'
      end
      object UsuriosporAlmoxarifado1: TMenuItem [11]
        Caption = 'Usuários por &Almoxarifado'
        HelpContext = 1130002
        OnClick = UsuriosporAlmoxarifado1Click
      end
      object UsuriosporGrupodeProduto1: TMenuItem [12]
        Caption = 'Usuários por &Grupo de Produto'
        HelpContext = 50012
        OnClick = UsuriosporGrupodeProduto1Click
      end
    end
    object Compras1: TMenuItem [1]
      Caption = 'Co&mpras'
      HelpContext = 1130004
      object SolicitaodeCompra1: TMenuItem
        Caption = '&Solicitação de Compra'
        HelpContext = 1130005
        object Avulsa1: TMenuItem
          Caption = '&Avulsa'
          HelpContext = 50016
          OnClick = Avulsa1Click
        end
        object PrPronta1: TMenuItem
          Caption = '&Pré-Pronta'
          HelpContext = 50017
          OnClick = PrPronta1Click
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object ExclusodeItensPendetesdaSCI1: TMenuItem
          Caption = '&Exclusão de Itens Pendentes da SCI'
          HelpContext = 50018
          OnClick = ExclusodeItensPendetesdaSCI1Click
        end
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object AtribuirComprador1: TMenuItem
        Caption = '&Atribuir Comprador'
        HelpContext = 1130009
        OnClick = AtribuirComprador1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object ProcessodeCompras1: TMenuItem
        Caption = '&Processo de Compras'
        HelpContext = 1130010
        OnClick = ProcessodeCompras1Click
      end
      object Cotao1: TMenuItem
        Caption = '&Cotação'
        HelpContext = 1130011
        OnClick = Cotao1Click
      end
      object SumriodeCotao1: TMenuItem
        Caption = 'Su&mário de Cotação'
        HelpContext = 1130012
        OnClick = SumriodeCotao1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object OCsemCotao1: TMenuItem
        Caption = '&O.C. sem Cotação'
        HelpContext = 1130013
        OnClick = OCsemCotao1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object CancelamentodeOC1: TMenuItem
        Caption = 'Ca&ncelamento de O.C.'
        HelpContext = 1130014
        OnClick = CancelamentodeOC1Click
      end
    end
    object CaixaPequeno1: TMenuItem [2]
      Caption = 'Cai&xa Pequeno'
      HelpContext = 1130015
      object Cadastro1: TMenuItem
        Caption = 'Ca&dastro'
        HelpContext = 1130016
        OnClick = Cadastro1Click
      end
      object UsuriosporCaixasPequenos1: TMenuItem
        Caption = '&Usuários por Caixas Pequenos'
        HelpContext = 1130017
        OnClick = UsuriosporCaixasPequenos1Click
      end
      object Lanamentos1: TMenuItem
        Caption = '&Lançamentos'
        HelpContext = 1130018
        OnClick = Lanamentos1Click
      end
      object ConsultaLanamentos1: TMenuItem
        Caption = '&Consulta Lançamentos'
        HelpContext = 1130019
        OnClick = ConsultaLanamentos1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object EfetivaodeLanamento1: TMenuItem
        Caption = '&Efetivação de Lançamento'
        HelpContext = 1130020
        OnClick = EfetivaodeLanamento1Click
      end
      object ExcluiEfetivaodeLanamento1: TMenuItem
        Caption = 'E&xclusão de Efetivação de Lançamento'
        OnClick = ExcluiEfetivaodeLanamento1Click
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 1130021
      object Produto1: TMenuItem
        Caption = '&Produto'
        HelpContext = 50042
        object GrupodeProduto1: TMenuItem
          Caption = '&Grupo de Produto'
          HelpContext = 50043
          OnClick = GrupodeProduto1Click
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object ArtigosxFornecedores1: TMenuItem
          Caption = '&Artigos x Fornecedores'
          HelpContext = 1130024
          OnClick = ArtigosxFornecedores1Click
        end
        object Insumos1: TMenuItem
          Caption = 'In&sumos'
          HelpContext = 50044
          OnClick = Insumos1Click
        end
        object Outros1: TMenuItem
          Caption = '&Outros'
          HelpContext = 50045
          OnClick = Outros1Click
        end
        object ItensdeVenda1: TMenuItem
          Caption = 'Itens de &Venda'
          HelpContext = 50046
          OnClick = ItensdeVenda1Click
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object UnidadedeMedida1: TMenuItem
          Caption = '&Unidade de Medida'
          HelpContext = 50048
          OnClick = UnidadedeMedida1Click
        end
        object Tamanho1: TMenuItem
          Caption = '&Tamanho'
          HelpContext = 50049
          OnClick = Tamanho1Click
        end
        object Cor1: TMenuItem
          Caption = '&Cor'
          HelpContext = 50050
          OnClick = Cor1Click
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object Contrato1: TMenuItem
          Caption = 'Co&ntrato'
          HelpContext = 50053
          OnClick = Contrato1Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object UnidadedeCusteio1: TMenuItem
        Caption = '&Unidades de Custeio'
        HelpContext = 50054
        OnClick = UnidadedeCusteio1Click
      end
      object Almoxarifado1: TMenuItem
        Caption = '&Almoxarifados'
        HelpContext = 50055
        OnClick = Almoxarifado1Click
      end
      object Compradores1: TMenuItem
        Caption = '&Compradores'
        HelpContext = 1130034
        OnClick = Compradores1Click
      end
      object Imposto1: TMenuItem
        Caption = '&Impostos'
        HelpContext = 50059
        OnClick = Imposto1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Fornecedor1: TMenuItem
        Caption = '&Fornecedores'
        HelpContext = 230054
        OnClick = Fornecedor1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object SolicitaesPrPronta1: TMenuItem
        Caption = 'Solicitações Pré-Pronta'
        HelpContext = 50063
        OnClick = SolicitaesPrPronta1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object N15: TMenuItem
        Caption = '-'
      end
      object ConsultaOC1: TMenuItem
        Tag = 5
        Caption = 'Consulta O.C.'
        HelpContext = 1130038
        OnClick = ConsultaOC1Click
      end
      object ConsultaSumriodaCotao1: TMenuItem
        Tag = 5
        Caption = 'Consulta Sumário de Cotação'
        HelpContext = 1130039
        OnClick = ConsultaSumriodaCotao1Click
      end
      object VisualizaltimasCompras1: TMenuItem
        Caption = '&Visualiza Últimas Compras'
        HelpContext = 1130040
        OnClick = VisualizaltimasCompras1Click
      end
      object AcompanhamentodeSolicitaodeCompra1: TMenuItem
        Tag = 5
        Caption = 'Acompan&hamento de Solicitação de Compra'
        OnClick = AcompanhamentodeSolicitaodeCompra1Click
      end
      object ConsultadeRecebimentodeMercadoria1: TMenuItem
        Caption = 'Consulta de Recebimento de Mercadoria'
        OnClick = ConsultadeRecebimentodeMercadoria1Click
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    Left = 328
    Top = 232
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{B7E030EA-0133-4011-96BB-AB10B7C2E4EE}'
    ServerName = 'CMAlmoxComprasSrvr50.DtmAlmoxComprasSrvr50'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{B7E030EA-0133-4011-96BB-AB10B7C2E4EE}'
    ServerName = 'CMAlmoxComprasSrvr50.DtmAlmoxComprasSrvr50'
  end
  inherited Web: TWebConnection
    ServerGUID = '{B7E030EA-0133-4011-96BB-AB10B7C2E4EE}'
    ServerName = 'CMAlmoxComprasSrvr50.DtmAlmoxComprasSrvr50'
  end
  inherited CMNetUsers: TCMNetUsers
    Left = 128
  end
end
