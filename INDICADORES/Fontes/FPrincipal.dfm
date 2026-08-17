inherited frmPrincipal: TfrmPrincipal
  Left = 203
  Top = 147
  Caption = 'Indicadores de Shoppings, Hotéis e Parques'
  ClientHeight = 422
  ClientWidth = 735
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 735
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 402
    Width = 735
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
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    object Movimento1: TMenuItem [2]
      Caption = 'Movimento'
      HelpContext = 4390001
      object miApuracao: TMenuItem
        Caption = 'Apuração de Indicadores'
        HelpContext = 4390002
        OnClick = miApuracaoClick
      end
      object ImportaodeIndicadores1: TMenuItem
        Caption = 'Importação de Indicadores'
        object miExecImportPlanilha: TMenuItem
          Caption = 'Planilha Eletrônica'
          HelpContext = 4390028
          OnClick = miExecImportPlanilhaClick
        end
        object miExecImportacao: TMenuItem
          Caption = 'Texto'
          HelpContext = 4390003
          OnClick = miExecImportacaoClick
        end
      end
      object miCalcIndicadores: TMenuItem
        Caption = 'Apuração de Indicadores Calculados'
        HelpContext = 4390004
        OnClick = miCalcIndicadoresClick
      end
      object miExecExcluiApuracao: TMenuItem
        Caption = 'Exclusão em Lote'
        HelpContext = 4390005
        OnClick = miExecExcluiApuracaoClick
      end
      object miSeparador: TMenuItem
        Caption = '-'
      end
      object miExecConcilia: TMenuItem
        Caption = 'Conciliação de Indicadores'
        HelpContext = 4390006
        OnClick = miExecConciliaClick
      end
      object miExecCheckList: TMenuItem
        Caption = 'Checagem das Apurações'
        HelpContext = 439007
        OnClick = miExecCheckListClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miExecEncerraContrato: TMenuItem
        Caption = 'Encerramento de Contrato'
        HelpContext = 4390008
        OnClick = miExecEncerraContratoClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuCorrecaoLancImovel: TMenuItem
        Caption = 'Correção dos Lançamentos de Imóveis'
        OnClick = mnuCorrecaoLancImovelClick
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 4390009
      object miCadLojas: TMenuItem
        Caption = 'Lojas'
        HelpContext = 4390010
        OnClick = miCadLojasClick
      end
      object miCadAtividade: TMenuItem
        Caption = 'Atividades e Segmentos'
        HelpContext = 640042
        OnClick = miCadAtividadeClick
      end
      object miCadMarca: TMenuItem
        Caption = 'Marcas e Franquias'
        HelpContext = 4390023
        OnClick = miCadMarcaClick
      end
      object miContratos: TMenuItem
        Caption = 'Contratos'
        HelpContext = 4390011
        object miCadContratoLoja: TMenuItem
          Caption = 'Contratos de Lojas'
          HelpContext = 4390012
          OnClick = miCadContratoLojaClick
        end
        object miCadContratoHotel: TMenuItem
          Caption = 'Contratos de Hotéis'
          HelpContext = 4390013
          OnClick = miCadContratoHotelClick
        end
        object miCadContratoNegocio: TMenuItem
          Caption = 'Contratos de Negócios Terceirizados'
          HelpContext = 4390029
          OnClick = miCadContratoNegocioClick
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object miCadEventoContratoLoja: TMenuItem
          Caption = 'Eventos'
          HelpContext = 4390015
          OnClick = miCadEventoContratoLojaClick
        end
        object miCadSitContImob: TMenuItem
          Caption = 'Situação Contratual'
          HelpContext = 4390016
          OnClick = miCadSitContImobClick
        end
      end
      object DadosComplementares1: TMenuItem
        Caption = 'Dados Complementares'
        object miCadComplemento: TMenuItem
          Caption = 'Tipos de Dados Complementares'
          HelpContext = 4390033
          OnClick = miCadComplementoClick
        end
        object miCadComplementoXTipoImovel: TMenuItem
          Caption = 'Tipos de Dados Complementares por Tipo de Imóvel'
          HelpContext = 4390034
          OnClick = miCadComplementoXTipoImovelClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miCadIndicadores: TMenuItem
        Caption = 'Indicadores'
        HelpContext = 4390017
        OnClick = miCadIndicadoresClick
      end
      object miSinonimos: TMenuItem
        Caption = 'Sinonimos para Importação'
        HelpContext = 4390030
        OnClick = miSinonimosClick
      end
      object miCadGrpApuracao: TMenuItem
        Caption = 'Grupo de Apuração'
        HelpContext = 4390021
        OnClick = miCadGrpApuracaoClick
      end
      object Relatrios2: TMenuItem
        Caption = 'Relatórios'
        HelpContext = 4390018
        object miTipoRelat: TMenuItem
          Caption = 'Grupo'
          HelpContext = 4390019
          OnClick = miTipoRelatClick
        end
        object miSubTipoRelat: TMenuItem
          Caption = 'Configuração de Relatórios'
          HelpContext = 4390020
          OnClick = miSubTipoRelatClick
        end
      end
      object miLayOutImportacao: TMenuItem
        Caption = 'Layout de Importação por Planilha'
        HelpContext = 4390031
        OnClick = miLayOutImportacaoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Eventos1: TMenuItem
        Caption = 'Eventos de Marketing'
        HelpContext = 4390024
        object miCadEventosMarketing: TMenuItem
          Caption = 'Cadastro de Eventos'
          HelpContext = 4390025
          OnClick = miCadEventosMarketingClick
        end
        object miHistEventosMarketing: TMenuItem
          Caption = 'Histórico de Eventos'
          HelpContext = 4390026
          OnClick = miHistEventosMarketingClick
        end
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        HelpContext = 14
      end
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 80
      end
    end
    inherited mnuRAD: TMenuItem
      inherited mnuRADExecutar: TMenuItem
        HelpContext = 16
      end
      inherited mnuGerarProcesso_Padrao: TMenuItem
        HelpContext = 61
      end
      inherited mnuRADConsultar: TMenuItem
        HelpContext = 15
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        HelpContext = 230041
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{7A1853F5-BF3D-11D6-9B0E-000021FF7E20}'
    ServerName = 'CMImobiliarioSvr50.coImobiliario'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{7A1853F5-BF3D-11D6-9B0E-000021FF7E20}'
    ServerName = 'CMImobiliarioSvr50.coImobiliario'
  end
end
