inherited frmPrincipal: TfrmPrincipal
  Left = 237
  Top = 50
  Caption = 'Controle Financeiro'
  ClientHeight = 450
  ClientWidth = 678
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 678
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 175
    Top = 84
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 430
    Width = 678
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
        Width = '310'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        Text = 'Usuario'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '140'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '64'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Style = psCapsLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psNumLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
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
        Text = '22/01/2019 11:57'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 32
  end
  inherited mnu: TMainMenu
    Left = 24
    Top = 128
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        OnClick = mnuUtilitarioClick
        inherited mnuMensagensPreDef: TMenuItem
          Visible = True
        end
        inherited mnuConexoesEmail: TMenuItem
          Visible = True
        end
        inherited mnuConfigContexto: TMenuItem
          Visible = True
        end
        inherited N100: TMenuItem
          Visible = True
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object AcertaImposto1: TMenuItem
          Caption = 'Acerta Imposto'
          HelpContext = 90001
          Visible = False
          OnClick = AcertaImposto1Click
        end
      end
    end
    object Movimentao1: TMenuItem [2]
      Caption = '&Movimentação'
      HelpContext = 90004
      object ContaCorrente1: TMenuItem
        Caption = 'Movimento &Financeiro'
        HelpContext = 90005
        OnClick = ContaCorrente1Click
      end
      object Transferencias: TMenuItem
        Caption = '&Transferência entre Contas'
        object TransfernciaBancria1: TMenuItem
          Caption = '&Incluir'
          HelpContext = 90006
          OnClick = TransfernciaBancria1Click
        end
        object MnuExcluirTransf: TMenuItem
          Caption = '&Excluir'
          OnClick = MnuExcluirTransfClick
        end
      end
      object ConciliaoBancria1: TMenuItem
        Caption = '&Conciliação Bancária'
        HelpContext = 90007
        OnClick = ConciliaoBancria1Click
      end
      object mnuBloqueiosJudiciais: TMenuItem
        Caption = 'Bloqueios Judiciais'
        OnClick = mnuBloqueiosJudiciaisClick
      end
      object mnuConcTarifBanc: TMenuItem
        Caption = 'C&onciliação de Tarifas Bancárias'
        OnClick = mnuConcTarifBancClick
      end
      object mnuExclusaoDrive: TMenuItem
        Caption = 'Exclusão Drive'
        OnClick = mnuExclusaoDriveClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object RegularizaodeLanamentosNoIdentificados1: TMenuItem
        Caption = '&Regularização de Lançamentos Não Identificados'
        HelpContext = 90008
        object NoLanados1: TMenuItem
          Caption = 'exclusivo do &Financeiro'
          HelpContext = 90009
          OnClick = NoLanados1Click
        end
        object JLanados1: TMenuItem
          Caption = 'do &CAR ou CAP (duplicado)'
          HelpContext = 90010
          OnClick = JLanados1Click
        end
        object mnuDesfazRegularizacao: TMenuItem
          Caption = 'Desfazer Regularização do CAR ou CAP'
          OnClick = mnuDesfazRegularizacaoClick
        end
      end
      object mnuConferDocRegular: TMenuItem
        Caption = 'Conferência Documentos Re&gularizados'
        HelpContext = 90048
        OnClick = mnuConferDocRegularClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object EmprstimoBancrio1: TMenuItem
        Caption = '&Empréstimo Bancário'
        Enabled = False
        HelpContext = 90012
        Visible = False
      end
      object mnuAcertaMovimentacoes: TMenuItem
        Caption = 'Acerta Movimentações Financeiras/Contabeis'
        OnClick = mnuAcertaMovimentacoesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuDisponibilidade: TMenuItem
        Caption = 'D&isponibilidade Financeira'
        object mnuBloqDisponibilidade: TMenuItem
          Caption = '&Bloqueio de Usuários'
          OnClick = mnuBloqDisponibilidadeClick
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object mnuConsDisponibilidade: TMenuItem
          Caption = '&Consulta'
          OnClick = mnuConsDisponibilidadeClick
        end
        object mnuConsDisponibilidade1: TMenuItem
          Caption = '&Consulta - Nova'
          Visible = False
          OnClick = mnuConsDisponibilidade1Click
        end
        object mnuConsDisponibilidade2: TMenuItem
          Caption = 'Co&nsulta - Operacional'
          OnClick = mnuConsDisponibilidade2Click
        end
        object mnuConsDisponibilidadeSpc: TMenuItem
          Caption = 'C&onsulta em Stored'
          Visible = False
          OnClick = mnuConsDisponibilidadeSpcClick
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object mnuConsultaContingencia: TMenuItem
          Caption = 'Consulta - Nova'
          OnClick = mnuConsultaContingenciaClick
        end
        object mnuConsultaOperacionalContingencia: TMenuItem
          Caption = 'Consulta Operacional - Nova'
          OnClick = mnuConsultaOperacionalContingenciaClick
        end
        object mnuConsDisponibilidadeCC: TMenuItem
          Caption = 'Consulta - Conta Corrente'
          OnClick = mnuConsDisponibilidadeCCClick
        end
      end
    end
    object Fluxo2: TMenuItem [3]
      Caption = '&Fluxo'
      HelpContext = 90016
      object Orado1: TMenuItem
        Caption = '&Previsto'
        HelpContext = 90021
        object GeraoaPartirdoOramento1: TMenuItem
          Caption = '&Geração a Partir do Orçamento'
          HelpContext = 90030
          OnClick = GeraoaPartirdoOramento1Click
        end
        object mnuMovFluxoMedioPrazo: TMenuItem
          Caption = '&Movimentação'
          HelpContext = 90028
          OnClick = mnuMovFluxoMedioPrazoClick
        end
      end
      object Real1: TMenuItem
        Caption = '&Real'
        HelpContext = 90019
        object Gerao1: TMenuItem
          Caption = '&Geração'
          HelpContext = 90020
          OnClick = Gerao1Click
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 90033
      object HistricoPadro1: TMenuItem
        Caption = '&Histórico Padrão'
        HelpContext = 90034
        OnClick = HistricoPadro1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object TipodeAplicao1: TMenuItem
        Caption = '&Tipo de Aplicação'
        HelpContext = 90036
        Visible = False
      end
      object N3: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Banco1: TMenuItem
        Caption = '&Banco'
        HelpContext = 90037
        OnClick = Banco1Click
      end
      object Agncia1: TMenuItem
        Caption = '&Agência'
        HelpContext = 90038
        OnClick = Agncia1Click
      end
      object ContasBancriasCaixas1: TMenuItem
        Caption = '&Contas Bancárias/Caixas'
        HelpContext = 90039
        OnClick = ContasBancriasCaixas1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MontagemdoFluxo1: TMenuItem
        Caption = '&Montagem do Fluxo'
        HelpContext = 90040
        OnClick = MontagemdoFluxo1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object TipodeRecebimento1: TMenuItem
        Caption = 'Tipo de &Recebimento'
        HelpContext = 90041
        OnClick = TipodeRecebimento1Click
      end
      object TipodeDesembolso1: TMenuItem
        Caption = 'Tipo de &Desembolso'
        HelpContext = 90042
        OnClick = TipodeDesembolso1Click
      end
      object mnuTarifaBancaria: TMenuItem
        Caption = 'Tari&fa Bancária'
        OnClick = mnuTarifaBancariaClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object CadCRxTRecDesemb: TMenuItem
        Caption = 'Centro de Responsabilidade x &Tipo de Recebimento/Desembolso'
        HelpContext = 90043
        OnClick = CadCRxTRecDesembClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object mnuCadGrupoRateioFluxo: TMenuItem
        Caption = 'Padrões Rateio Movimentações Fluxo Orçado'
        OnClick = mnuCadGrupoRateioFluxoClick
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        Caption = 'Grá&ficos'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuFluxos: TMenuItem
        Caption = 'Fluxos'
        OnClick = mnuFluxosClick
      end
      object N01FluxoPrevisto1: TMenuItem
        Caption = 'Fluxo Pre&visto'
        HelpContext = 90044
        Visible = False
        OnClick = N01FluxoPrevisto1Click
      end
      object FluxoRealizado1: TMenuItem
        Caption = 'Fluxo Reali&zado'
        HelpContext = 90045
        Visible = False
        OnClick = FluxoRealizado1Click
      end
      object FluxoOrado2: TMenuItem
        Caption = 'Fluxo &Orçado'
        HelpContext = 90046
        Visible = False
        OnClick = FluxoOrado2Click
      end
      object mnuFluxoOrcadoXRealizado: TMenuItem
        Caption = 'Fluxo Orçado &x Realizado'
        Visible = False
        OnClick = mnuFluxoOrcadoXRealizadoClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object SaldoFinanceiro: TMenuItem
        Caption = '&Saldo Financeiro'
        HelpContext = 90047
        OnClick = SaldoFinanceiroClick
      end
      object mnuConsBloqueiosDesbloqueiosJudiciais: TMenuItem
        Caption = 'Consulta Bloqueios/Desbloqueios Judiciais'
        OnClick = mnuConsBloqueiosDesbloqueiosJudiciaisClick
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 24
    Top = 176
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 224
  end
  inherited AclPadrao: TActionList
    Left = 24
    Top = 272
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 480
    Top = 320
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}'
    ServerName = 'AppServerCFinan.DmCFinanSrv50'
    Left = 352
    Top = 320
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}'
    ServerName = 'AppServerCFinan.DmCFinanSrv50'
    Left = 392
    Top = 320
  end
  inherited Web: TWebConnection
    ServerGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}'
    ServerName = 'AppServerCFinan.DmCFinanSrv50'
    Left = 432
    Top = 320
  end
  inherited CorreioCM: TCorreioCM
    Left = 24
    Top = 80
  end
  inherited ResourceManager: TCMResourceManager
    Left = 96
    Top = 184
  end
  object spAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 224
    Top = 320
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 272
    Top = 320
  end
end
