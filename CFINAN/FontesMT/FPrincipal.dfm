inherited frmPrincipal: TfrmPrincipal
  Left = 164
  Top = 119
  Caption = 'Controle Financeiro'
  ClientHeight = 399
  ClientWidth = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 675
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 255
    Top = 36
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 379
    Width = 675
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
        Text = '01/10/2002 09:18'
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
        object N9: TMenuItem
          Caption = '-'
        end
        object AcertaImposto1: TMenuItem
          Caption = 'Acerta Imposto'
          HelpContext = 90001
          OnClick = AcertaImposto1Click
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object ExportaArquivoparaJurere1: TMenuItem
          Caption = 'Exporta Arquivo para Jurere'
          HelpContext = 90002
          OnClick = ExportaArquivoparaJurere1Click
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
      object TransfernciaBancria1: TMenuItem
        Caption = '&Transferência entre Contas'
        HelpContext = 90006
        OnClick = TransfernciaBancria1Click
      end
      object ConciliaoBancria1: TMenuItem
        Caption = '&Conciliação Bancária'
        HelpContext = 90007
        OnClick = ConciliaoBancria1Click
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
      object mnuDispFinan: TMenuItem
        Caption = '&Disponibilidade Financeira'
        HelpContext = 90013
        object mnuMontagem: TMenuItem
          Caption = '&Montagem'
          HelpContext = 90014
          OnClick = mnuMontagemClick
        end
        object mnuConsultaDisp: TMenuItem
          Caption = '&Consulta'
          HelpContext = 90015
          OnClick = mnuConsultaDispClick
        end
      end
    end
    object Fluxo2: TMenuItem [3]
      Caption = '&Fluxo'
      HelpContext = 90016
      object Previsto1: TMenuItem
        Caption = '&Previsto'
        HelpContext = 90017
        object AtualizaFluxo1: TMenuItem
          Caption = '&Geração'
          HelpContext = 90018
          OnClick = AtualizaFluxo1Click
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
      object Orado1: TMenuItem
        Caption = '&Orçado'
        HelpContext = 90021
        object CurtoPrazo1: TMenuItem
          Caption = '&Curto Prazo'
          HelpContext = 90022
          object GeraoapartirdoPrevisto1: TMenuItem
            Caption = '&Geração a partir do Previsto'
            HelpContext = 90023
            OnClick = GeraoapartirdoPrevisto1Click
          end
          object GeracaoPartirMedioPrazo: TMenuItem
            Caption = 'Geração a partir do &Orçado de Médio Prazo'
            HelpContext = 90024
            OnClick = GeracaoPartirMedioPrazoClick
          end
          object Movimentao4: TMenuItem
            Caption = '&Movimentação'
            HelpContext = 90025
            OnClick = Movimentao4Click
          end
        end
        object MdioPrazo1: TMenuItem
          Caption = '&Médio Prazo'
          HelpContext = 90026
          object GeracaoPartirLongoPrazo: TMenuItem
            Caption = 'Geração a partir do &Orçado de Longo Prazo'
            HelpContext = 90027
            OnClick = GeracaoPartirLongoPrazoClick
          end
          object mnuMovFluxoMedioPrazo: TMenuItem
            Caption = '&Movimentação'
            HelpContext = 90028
            OnClick = mnuMovFluxoMedioPrazoClick
          end
        end
        object LongoPrazo1: TMenuItem
          Caption = '&Longo Prazo'
          HelpContext = 90029
          object GeraoaPartirdoOramento1: TMenuItem
            Caption = '&Geração a Partir do Orçamento'
            HelpContext = 90030
            OnClick = GeraoaPartirdoOramento1Click
          end
          object Movimentao2: TMenuItem
            Caption = '&Movimentação'
            HelpContext = 90032
            OnClick = Movimentao2Click
          end
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
        OnClick = TipodeAplicao1Click
      end
      object N3: TMenuItem
        Caption = '-'
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
      object N12: TMenuItem
        Caption = '-'
      end
      object CadCRxTRecDesemb: TMenuItem
        Caption = 'Centro de Responsabilidade x &Tipo de Recebimento/Desembolso'
        HelpContext = 90043
        OnClick = CadCRxTRecDesembClick
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        Caption = 'Grá&ficos'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N01FluxoPrevisto1: TMenuItem
        Caption = 'Fluxo Pre&visto'
        HelpContext = 90044
        OnClick = N01FluxoPrevisto1Click
      end
      object FluxoRealizado1: TMenuItem
        Caption = 'Fluxo Reali&zado'
        HelpContext = 90045
        OnClick = FluxoRealizado1Click
      end
      object FluxoOrado2: TMenuItem
        Caption = 'Fluxo &Orçado'
        HelpContext = 90046
        OnClick = FluxoOrado2Click
      end
      object mnuFluxoOrcadoXRealizado: TMenuItem
        Caption = 'Fluxo Orçado &x Realizado'
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
  object spAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 232
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
