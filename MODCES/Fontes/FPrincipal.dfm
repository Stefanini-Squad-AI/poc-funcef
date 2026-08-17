inherited frmPrincipal: TfrmPrincipal
  Left = 140
  Top = 146
  Caption = 'Módulo de Cargos e Salários'
  ClientHeight = 325
  ClientWidth = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 547
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 305
    Width = 547
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
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
        Name = 'PnlUsuario_Padrao'
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
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '18/05/2004 09:53'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object UsuarioRH: TPanel [3]
    Left = 375
    Top = 42
    Width = 94
    Height = 22
    Caption = 'UsuarioRH'
    TabOrder = 3
    Visible = False
  end
  inherited mnu: TMainMenu
    Left = 26
    Top = 237
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 740001
      object mnuCadCargos: TMenuItem
        Caption = '&Cargos'
        HelpContext = 740002
        OnClick = mnuCadCargosClick
      end
      object mnuCadGruposFuncionais: TMenuItem
        Caption = '&Grupos Funcionais'
        HelpContext = 740003
        OnClick = mnuCadGruposFuncionaisClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCadFatoresdeAvaliacao: TMenuItem
        Caption = '&Fatores de Avaliação'
        HelpContext = 740004
        OnClick = mnuCadFatoresdeAvaliacaoClick
      end
      object mnuCadPesos: TMenuItem
        Caption = '&Pesos Grupos x Fatores'
        HelpContext = 740005
        OnClick = mnuCadPesosClick
      end
      object mnuCadGrausdosCargos: TMenuItem
        Caption = 'Gra&us dos Cargos'
        HelpContext = 740006
        OnClick = mnuCadGrausdosCargosClick
      end
      object mnuCadClassesSalariais: TMenuItem
        Caption = 'C&lasses Salariais'
        HelpContext = 740007
        OnClick = mnuCadClassesSalariaisClick
      end
      object mnuCadFaixasSalariais: TMenuItem
        Caption = '&Faixas Salariais'
        HelpContext = 740008
        OnClick = mnuCadFaixasSalariaisClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuCadTabelaHay: TMenuItem
        Caption = 'Tabela Hay'
        OnClick = mnuCadTabelaHayClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuCadEmpresasEntidades: TMenuItem
        Caption = '&Empresas / Entidades'
        HelpContext = 740009
        OnClick = mnuCadEmpresasEntidadesClick
      end
      object mnuCadPesquisasSalariais: TMenuItem
        Caption = 'Pes&quisas Salariais'
        HelpContext = 740010
        OnClick = mnuCadPesquisasSalariaisClick
      end
      object mnuCadFatoresdeAjuste: TMenuItem
        Caption = 'Fatores de &Ajuste'
        HelpContext = 740011
        OnClick = mnuCadFatoresdeAjusteClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Sindicatos1: TMenuItem
        Caption = '&Sindicatos'
        HelpContext = 740012
        OnClick = Sindicatos1Click
      end
      object EncargosSociais1: TMenuItem
        Caption = 'E&ncargos Sociais'
        HelpContext = 740013
        OnClick = EncargosSociais1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuCadOrcamQuantPessoal: TMenuItem
        Caption = 'Orçamento da Quantidade de Pessoal (Manpower)'
        OnClick = mnuCadOrcamQuantPessoalClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 740014
      object mnuRegistrodeAlteracaoFuncional: TMenuItem
        Caption = '&Registro de Alteração Funcional'
        HelpContext = 740015
        OnClick = mnuRegistrodeAlteracaoFuncionalClick
      end
      object mnuSolicitdeAlteracaoFuncional: TMenuItem
        Caption = 'Solicitação de Alteração &Funcional'
        HelpContext = 740016
        OnClick = mnuSolicitdeAlteracaoFuncionalClick
      end
      object mnuAnalisedasSolicitacoesdeAlteracao: TMenuItem
        Caption = '&Análise das Solicitações de Alteração'
        HelpContext = 740017
        OnClick = mnuAnalisedasSolicitacoesdeAlteracaoClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuSimulacaodeAumentos: TMenuItem
        Caption = '&Simulação/Implementação de Aumentos'
        HelpContext = 740018
        OnClick = mnuSimulacaodeAumentosClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuCorrecaodeFaixasSalariais: TMenuItem
        Caption = '&Correção Coletiva de Faixas Salariais'
        HelpContext = 740019
        OnClick = mnuCorrecaodeFaixasSalariaisClick
      end
      object mnuDadosPesquisaSalarial: TMenuItem
        Caption = '&Dados para Pesquisa Salarial'
        HelpContext = 740020
        object mnuFrequenciaseTendenciasGeral: TMenuItem
          Caption = '&Frequências e Tendências (Geral)'
          HelpContext = 740021
          OnClick = mnuFrequenciaseTendenciasGeralClick
        end
        object mnuTendenciasApenasdoMercado: TMenuItem
          Caption = '&Tendências (Apenas do Mercado)'
          HelpContext = 740022
          OnClick = mnuTendenciasApenasdoMercadoClick
        end
      end
      object EliminaodePesquisaSalarial1: TMenuItem
        Caption = '&Eliminação de Pesquisa Salarial'
        HelpContext = 740023
        OnClick = EliminaodePesquisaSalarial1Click
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object mnuHistoricodaEvolucaoFuncional: TMenuItem
        Caption = '&Histórico da Evolução Funcional'
        HelpContext = 740024
        OnClick = mnuHistoricodaEvolucaoFuncionalClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuDistrPontosCargos: TMenuItem
        Caption = '&Distribuição da Pontuação dos Cargos'
        HelpContext = 740025
        OnClick = mnuDistrPontosCargosClick
      end
      object mnuPontuacaoPorFaixa: TMenuItem
        Caption = 'Distribuição de Cargos por &Faixa Salarial'
        HelpContext = 740026
        OnClick = mnuPontuacaoPorFaixaClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuOrcamentodoCustodePessoal: TMenuItem
        Caption = '&Orçamento do Custo de Pessoal'
        HelpContext = 740027
        OnClick = mnuOrcamentodoCustodePessoalClick
      end
      object mnuConsOrcamQuantPessoal: TMenuItem
        Caption = 'Orçamento da Quantidade de Pessoal'
        OnClick = mnuConsOrcamQuantPessoalClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuTabulacaoPontualdePesquisa: TMenuItem
        Caption = '&Tabulação Pontual de Pesquisa'
        HelpContext = 740028
        OnClick = mnuTabulacaoPontualdePesquisaClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 740029
      object mnuAnaliseMultiDim: TMenuItem
        Caption = '&Análise Multidimensional de Eventos'
        HelpContext = 740030
        OnClick = mnuAnaliseMultiDimClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 22
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 136
  end
  inherited AclPadrao: TActionList
    Left = 24
    Top = 184
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 240
  end
end
