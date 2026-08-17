inherited frmPrincipal: TfrmPrincipal
  Left = 103
  Top = 88
  Caption = 'Administração Assistencial'
  ClientHeight = 367
  ClientWidth = 689
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 689
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
    inherited ImlCaixa_Padrao: TImage
      Left = 435
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 215
    Top = 145
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 347
    Width = 689
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
        Width = '300'
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
        Width = '120'
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
  inherited ivTradutor: TIvExtendedTranslator
    Top = 47
  end
  inherited mnu: TMainMenu
    Left = 32
    Top = 194
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N12: TMenuItem
          Caption = '-'
        end
        object ModificaArquivoRemessa1: TMenuItem
          Caption = 'Modifica Arquivo Remessa'
          OnClick = ModificaArquivoRemessa1Click
        end
        object mnuMigracaodePlano: TMenuItem
          Caption = 'Migração de Plano'
          OnClick = mnuMigracaodePlanoClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object Produto1: TMenuItem
        Caption = '&Produto'
        OnClick = Produto1Click
      end
      object Plano1: TMenuItem
        Caption = 'P&lano'
        OnClick = Plano1Click
      end
      object mnuCadContribuicoes: TMenuItem
        Caption = '&Contribuições'
        OnClick = mnuCadContribuicoesClick
      end
      object AlteradoresXContribuicao1: TMenuItem
        Caption = '&Alteradores por Contribuição'
        OnClick = AlteradoresXContribuicao1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuConsGeralPartAss: TMenuItem
        Caption = '&Consulta Geral de Participantes Assistenciais'
        Hint = 
          'Abre uma tela de consulta com todas as informações do participan' +
          'te assistencial'
        OnClick = mnuConsGeralPartAssClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ParticipanteAssistencial1: TMenuItem
        Caption = 'Pa&rticipantes'
        object mnuIncluirPartAss: TMenuItem
          Caption = '&Incluir/Alterar Participante'
          OnClick = mnuIncluirPartAssClick
        end
        object mnuCancelarPatAss: TMenuItem
          Caption = '&Cancelar Participante'
          OnClick = mnuCancelarPatAssClick
        end
      end
      object mnuBeneficiarios: TMenuItem
        Caption = '&Dependentes'
        OnClick = mnuBeneficiariosClick
      end
      object GrupoFamiliar1: TMenuItem
        Caption = '&Grupo Familiar'
        OnClick = GrupoFamiliar1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuSinistros: TMenuItem
        Caption = 'Controle de Sinistros'
        OnClick = mnuSinistrosClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Capitais1: TMenuItem
        Caption = 'Ca&pitais'
        OnClick = Capitais1Click
      end
      object mnuCadAssocPlanoCapitais: TMenuItem
        Caption = '&Associação do Plano com Tabela de Capitais'
        OnClick = mnuCadAssocPlanoCapitaisClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuIntegracao: TMenuItem
        Caption = '&Integração'
        object IntegraoFinanceiraContbil1: TMenuItem
          Caption = '&Financeira / Contábil'
          OnClick = IntegraoFinanceiraContbil1Click
        end
        object AssistencialPrevidencirio1: TMenuItem
          Caption = '&Previdenciário'
          OnClick = AssistencialPrevidencirio1Click
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object RubricasporPatrocinadora1: TMenuItem
          Caption = '&Rubricas'
          OnClick = RubricasporPatrocinadora1Click
        end
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Auxiliares1: TMenuItem
        Caption = 'A&uxiliares'
        object SitPartPlan1: TMenuItem
          Caption = '&Situação do Participante no Plano'
          OnClick = SitPartPlan1Click
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object GerarDatas1: TMenuItem
          Caption = '&Gerar Datas'
          OnClick = GerarDatas1Click
        end
        object CalendContribPag1: TMenuItem
          Caption = '&Calendário Contribuição / Pagamento'
          OnClick = CalendContribPag1Click
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Importao1: TMenuItem
        Caption = '&Exportação/Importação'
        object Layout1: TMenuItem
          Caption = '&Lay-Out'
          object TiposdeLayout1: TMenuItem
            Caption = '&Tipos de Lay-Out'
            OnClick = TiposdeLayout1Click
          end
          object CamposdeLayout1: TMenuItem
            Caption = '&Campos de Lay-Out'
            OnClick = CamposdeLayout1Click
          end
          object AssociarLayout2: TMenuItem
            Caption = '&Associar Lay-Out'
            OnClick = AssociarLayout2Click
          end
        end
        object ExportaoemArquivo1: TMenuItem
          Caption = '&Exportar Informações para Arquivo'
          OnClick = ExportaoemArquivo1Click
        end
        object ImportaodeDados2: TMenuItem
          Caption = '&Importar Informações de Arquivo'
          OnClick = ImportaodeDados2Click
        end
      end
    end
    object mnuContrib: TMenuItem [3]
      Caption = 'Con&tribuições'
      object mnupreparo_old: TMenuItem
        Caption = '&Preparo'
        Visible = False
        object Automtico1: TMenuItem
          Caption = '&Normal'
          OnClick = Automtico1Click
        end
        object Manual1: TMenuItem
          Caption = '&Manual'
          OnClick = Manual1Click
        end
        object Alicardiferenca: TMenuItem
          Caption = '&Aplicar Diferença'
          OnClick = AlicardiferencaClick
        end
      end
      object mnuPreparo: TMenuItem
        Caption = 'Preparo de Contribuição'
        OnClick = mnuPreparoClick
      end
      object mnuEnvio: TMenuItem
        Caption = 'Envio de Contribuição'
        OnClick = mnuEnvioClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuDesfazerEnvio: TMenuItem
        Caption = 'Desfazer Envio'
        OnClick = mnuDesfazerEnvioClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuRecebimento: TMenuItem
        Caption = 'Recebimento de Contribuição'
        OnClick = mnuRecebimentoClick
      end
      object Cobranca2: TMenuItem
        Caption = '&Cobrança'
        Visible = False
        object Envio1: TMenuItem
          Caption = '&Envio'
          OnClick = Envio1Click
        end
        object Recebimento1: TMenuItem
          Caption = '&Recebimento'
          OnClick = Recebimento1Click
        end
        object DesfazerEnvios1: TMenuItem
          Caption = '&Desfazer Preparo/Envio'
          OnClick = DesfazerEnvios1Click
        end
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object Divergncias1: TMenuItem
        Caption = '&Divergências'
        object TratamentodeDivergncias1: TMenuItem
          Caption = '&Tratamento de Divergências'
          OnClick = TratamentodeDivergncias1Click
        end
      end
      object MnuRepasse: TMenuItem
        Caption = '&Repasse'
        OnClick = MnuRepasseClick
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Mnu_separa1_Padrao: TMenuItem
        Visible = True
      end
      object mnuConsControleCobranca: TMenuItem [4]
        Caption = '&Controle de Cobrança'
        OnClick = mnuConsControleCobrancaClick
      end
      object mnuConsHistoricoCobranca: TMenuItem [5]
        Caption = '&Histórico de Cobranças'
        OnClick = mnuConsHistoricoCobrancaClick
      end
      object mnuConsEstimativa: TMenuItem [6]
        Caption = '&Estimativa'
        OnClick = mnuConsEstimativaClick
      end
      object N11: TMenuItem [7]
        Caption = '-'
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = '&Consulta Geral de Pessoa'
        Visible = True
      end
      inherited Mnu_UsoPessoal_Padrao: TMenuItem
        Visible = True
      end
      object CriticadeCarga: TMenuItem
        Caption = 'Critica de Carga'
        Visible = False
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 35
    Top = 101
  end
  inherited ImlPadrao: TImageList
    Left = 35
    Top = 244
  end
  inherited AclPadrao: TActionList
    Left = 35
    Top = 292
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    Left = 35
    Top = 148
  end
  inherited Skt: TSocketConnection
    Top = 47
  end
  inherited Dcom: TDCOMConnection
    Top = 100
  end
  inherited Web: TWebConnection
    Top = 148
  end
  inherited CorreioCM: TCorreioCM
    Left = 88
    Top = 196
  end
  inherited ResourceManager: TCMResourceManager
    Left = 88
    Top = 244
  end
  inherited CMNetUsers: TCMNetUsers
    Left = 88
    Top = 292
  end
end
