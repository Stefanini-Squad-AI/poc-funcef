inherited frmPrincipal: TfrmPrincipal
  Left = 130
  Top = 137
  Caption = 'Módulo de Medicina do Trabalho'
  ClientHeight = 342
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 549
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 322
    Width = 549
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
        Text = '16/12/2014 12:06'
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
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          Visible = False
        end
        inherited MnuSep2_padrao: TMenuItem
          Visible = False
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 750001
      object mnuOcorrenciaseExames: TMenuItem
        Caption = '&Ocorrências e Exames Médicos'
        HelpContext = 750002
        OnClick = mnuOcorrenciaseExamesClick
      end
      object mnuCIDCodInternacionaldeDoencas: TMenuItem
        Caption = '&CID (Cod. Internacional de Doenças)'
        HelpContext = 750003
        OnClick = mnuCIDCodInternacionaldeDoencasClick
      end
      object mnuPeriodicidadedosExames: TMenuItem
        Caption = '&Periodicidade dos Exames'
        HelpContext = 750004
        OnClick = mnuPeriodicidadedosExamesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCadPPRAAcoesRecomendadas: TMenuItem
        Caption = 'PPRA - Ações Recomendadas'
        HelpContext = 750100
        OnClick = mnuCadPPRAAcoesRecomendadasClick
      end
      object mnuCadPPRAAgentesdeRisco: TMenuItem
        Caption = 'PPRA - Agentes de Risco'
        HelpContext = 750101
        OnClick = mnuCadPPRAAgentesdeRiscoClick
      end
      object mnuCadPPRAMeiosPropagContam: TMenuItem
        Caption = 'PPRA - Meios de Propagação/Contaminação'
        HelpContext = 750102
        OnClick = mnuCadPPRAMeiosPropagContamClick
      end
      object mnuCadPPRAClassesdeBens: TMenuItem
        Caption = 'PPRA - Classes de Bens Patrimoniais'
        HelpContext = 750103
        OnClick = mnuCadPPRAClassesdeBensClick
      end
      object mnuCadPPRABensEP: TMenuItem
        Caption = 'PPRA - Bens Patrimoniais (Equip. Proteção)'
        HelpContext = 750104
        OnClick = mnuCadPPRABensEPClick
      end
      object mnuCadPPRALocalizacoes: TMenuItem
        Caption = 'PPRA - Localizações de Trabalho'
        HelpContext = 750105
        OnClick = mnuCadPPRALocalizacoesClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuCadFuncoesCIPA: TMenuItem
        Caption = 'Funções Exercidas pelos Membros da CIPA'
        HelpContext = 750106
        OnClick = mnuCadFuncoesCIPAClick
      end
      object mnuCadCIPA: TMenuItem
        Caption = 'CIPA - Comissão Interna de Prevenção de Acidentes'
        HelpContext = 750107
        OnClick = mnuCadCIPAClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 750005
      object mnuRegistrodeOcorrencia: TMenuItem
        Caption = '&Registro de Ocorrência Médica'
        HelpContext = 750006
        OnClick = mnuRegistrodeOcorrenciaClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuCondicaoDifTrab: TMenuItem
        Caption = 'Condição Diferenciada de Trabalho'
        OnClick = mnuCondicaoDifTrabClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuPPRAAvaliacoes: TMenuItem
        Caption = 'PPRA - Avaliações'
        OnClick = mnuPPRAAvaliacoesClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuHistoricodeOcorrencias: TMenuItem
        Caption = '&Histórico de Ocorrências'
        HelpContext = 750007
        OnClick = mnuHistoricodeOcorrenciasClick
      end
    end
    object mnuRelatoriosFixos: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 750008
      object mnuAnaliseMultiDim: TMenuItem
        Caption = '&Análise Multidimensional'
        HelpContext = 750009
        OnClick = mnuAnaliseMultiDimClick
      end
      object mnuEstatisticadeOcorrencias: TMenuItem
        Caption = '&Estatística de Ocorrências'
        HelpContext = 750010
        OnClick = mnuEstatisticadeOcorrenciasClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 256
  end
end
