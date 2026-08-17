inherited frmPrincipal: TfrmPrincipal
  Left = 578
  Top = 126
  HelpContext = 150003
  Caption = 'Sistema de Empréstimo'
  ClientHeight = 540
  ClientWidth = 786
  Visible = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage [0]
    Left = 0
    Top = 28
    Width = 8
    Height = 8
    Transparent = True
  end
  inherited Dock97Top: TDock97
    Width = 786
    inherited fcLabel2: TfcLabel
      Left = 627
      Top = 1
    end
    inherited ImlCaixa_Padrao: TImage
      Left = 435
    end
    inherited tb97Atalho: TToolbar97
      object btnCancelaResgate: TToolbarButton97
        Left = 329
        Top = 0
        Width = 113
        Height = 22
        Caption = 'Cancela Resgate'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnCancelaResgateClick
      end
      object btnResgate: TToolbarButton97
        Left = 216
        Top = 0
        Width = 113
        Height = 22
        Caption = 'Resgate Reserva'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnResgateClick
      end
      object ToolbarSep971: TToolbarSep97
        Left = 192
        Top = 0
        Blank = True
        SizeHorz = 24
      end
      object ToolbarSep972: TToolbarSep97
        Left = 555
        Top = 0
        Blank = True
        SizeHorz = 24
        Visible = False
      end
      object btnREFER: TToolbarButton97
        Left = 579
        Top = 0
        Width = 137
        Height = 22
        Caption = 'Concessão REFER'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnREFERClick
      end
      object btnQuitaMorte: TToolbarButton97
        Left = 442
        Top = 0
        Width = 113
        Height = 22
        Caption = 'Quitação Morte'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Opaque = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnQuitaMorteClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 247
    Top = 158
    inherited pnlTextoFluxOper: TPanel
      inherited pnldbEditFluxo: TPanel
        inherited wwDBEdit1: TwwDBEdit
          Top = 10
        end
      end
    end
    inherited Panel2: TPanel
      inherited tb97btnCancelar: TToolbarButton97
        Left = 322
      end
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 520
    Width = 786
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
        Text = '17/01/2025 11:41'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 9
  end
  inherited mnu: TMainMenu
    Left = 256
    Top = 40
    inherited mnuSistema: TMenuItem
      Caption = 'Sistema'
      inherited mnuConfiguracao: TMenuItem
        Caption = 'Configuração'
        inherited nmuConfigParametros: TMenuItem
          Caption = 'Parâmetros do Sistema'
          OnClick = nmuConfigParametrosClick
        end
        inherited BarradeAtalhos1: TMenuItem
          Caption = 'Barra de Atalhos'
        end
        inherited mnuConfigBarradeStatus: TMenuItem
          Caption = 'Barra de Status'
        end
      end
      inherited mnuUtilitario: TMenuItem
        Caption = 'Utilitários'
        object N16: TMenuItem
          Caption = '-'
        end
        object mnuUtilVerificaMenu: TMenuItem
          Caption = 'Verificação de Menus vs. SAD'
          HelpContext = 150102
          OnClick = mnuUtilVerificaMenuClick
        end
        object mnuUtilAcertaSequence: TMenuItem
          Caption = 'Acerto de Sequence'
          Visible = False
          OnClick = mnuUtilAcertaSequenceClick
        end
        object N40: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuExecAcertaSituacao: TMenuItem
          Caption = 'Acerto de Situação Contratual'
          Enabled = False
          Visible = False
          OnClick = mnuExecAcertaSituacaoClick
        end
        object N42: TMenuItem
          Caption = '-'
          Enabled = False
          Visible = False
        end
        object mnuExecArqSuspensao: TMenuItem
          Caption = 'Importação de Arquivo de Suspensões'
          OnClick = mnuExecArqSuspensaoClick
        end
        object N45: TMenuItem
          Caption = '-'
        end
        object mnuExecArquivoCritica: TMenuItem
          Caption = 'Importação de Arquivo de Crítica'
          OnClick = mnuExecArquivoCriticaClick
        end
        object N22: TMenuItem
          Caption = '-'
        end
        object mnuExecLerSIAFI: TMenuItem
          Caption = 'Importar Arquivo SIAFI'
          OnClick = mnuExecLerSIAFIClick
        end
        object mnuExecGravarSIAFI: TMenuItem
          Caption = 'Gravar Arquivo SIAFI'
          OnClick = mnuExecGravarSIAFIClick
        end
        object N27: TMenuItem
          Caption = '-'
        end
        object mnuExecGeraArquivoMargem13: TMenuItem
          Caption = 'Geração de Arquivo de Margens de 13º'
          OnClick = mnuExecGeraArquivoMargem13Click
        end
        object N43: TMenuItem
          Caption = '-'
        end
        object mnuExecLancParcAtu: TMenuItem
          Caption = 'Lançamento de Prestações Atualizadas'
          HelpContext = 150103
          OnClick = mnuExecLancParcAtuClick
        end
        object N35: TMenuItem
          Caption = '-'
        end
        object mnuExecCalculaValorMaximo: TMenuItem
          Caption = 'Calcula e Envia Rubrica Informativa de Valor Máximo Permitido'
          HelpContext = 150104
          OnClick = mnuExecCalculaValorMaximoClick
        end
        object mnuExecCalculaValorDevido: TMenuItem
          Caption = 
            'Calcula e Envia Rubrica Informativa de Valor Devido de Empréstim' +
            'o'
          HelpContext = 150105
          OnClick = mnuExecCalculaValorDevidoClick
        end
        object mnuManutenodoArquivoContratoad: TMenuItem
          Caption = 'Manutenção do Arquivo Contratoad'
          OnClick = mnuManutenodoArquivoContratoadClick
        end
        object mnuImportacaoIrFinancHabitacional: TMenuItem
          Caption = 'Importação - IR -  Financiamento Habitacional '
          OnClick = mnuImportacaoIrFinancHabitacionalClick
        end
        object mnuAlteraoEmLotedaDatadeVencimento: TMenuItem
          Caption = 'Alteração Em Lote da Data de Vencimento'
          OnClick = mnuAlteraoEmLotedaDatadeVencimentoClick
        end
        object mnuImportaodoArquivoeGeraodoRelatrioSICOV: TMenuItem
          Caption = 'Importação do Arquivo e Geração do Relatório-SICOV'
          OnClick = mnuImportaodoArquivoeGeraodoRelatrioSICOVClick
        end
        object N58: TMenuItem
          Caption = '-'
        end
        object mmuImportaodoInformedeIR1: TMenuItem
          Caption = 'Importação do Informe de IR'
          OnClick = mmuImportaodoInformedeIR1Click
        end
      end
      inherited mnuIdiomas: TMenuItem
        Caption = 'Idiomas'
      end
      inherited Grupos1: TMenuItem
        Caption = 'Grupos'
      end
      inherited Alterarsenha1: TMenuItem
        Caption = 'Alterar senha'
      end
      inherited mnuFluxOper: TMenuItem
        Caption = 'Fluxo de Operação'
        inherited Montar1: TMenuItem
          Caption = 'Montar'
        end
      end
    end
    object mnuCicloNormal: TMenuItem [1]
      Caption = 'Ciclo Normal'
      HelpContext = 150001
      object mnuExecInscricao: TMenuItem
        Bitmap.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777770000000777777700B077777700000007777700FBF077777700000007770
          0BFB4BF0777770000000700FBF44BFB077777000000078FBF4FBFBFB07777000
          000078BFBFBF44BF077770000000778BFB44FBFBF07770000000778FB8BFB44F
          B077700000007778FBF44BFBFB07700000007778BF4FBF44BFB0700000007777
          8BFB44FBFBFB0000000077778FB0BFBFBF8870000000777778FBFBFB88777000
          00007777778FBF88777770000000777777788877777770000000}
        Caption = 'Inscrição / Concessão / Renovação'
        HelpContext = 150002
        OnClick = mnuExecInscricaoClick
      end
      object mnuCancInscricao: TMenuItem
        Caption = 'Cancelamento de Inscrições'
        HelpContext = 150003
        OnClick = mnuCancInscricaoClick
      end
      object mnuCancConcessao: TMenuItem
        Caption = 'Cancelamento de Concessão'
        HelpContext = 150004
        OnClick = mnuCancConcessaoClick
      end
      object N46: TMenuItem
        Caption = '-'
      end
      object mnuExecLiberaConcessao: TMenuItem
        Caption = 'Liberação de Concessão'
        HelpContext = 150005
        OnClick = mnuExecLiberaConcessaoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuExecConcessaoAuto: TMenuItem
        Caption = 'Concessão Automática'
        Visible = False
      end
      object N15: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuExecCalcDia: TMenuItem
        Caption = 'Atualização Diária de Saldo Devedor'
        HelpContext = 150120
        OnClick = mnuExecCalcDiaClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuExecGeraParcela: TMenuItem
        Caption = 'Geração Mensal de Parcelas'
        HelpContext = 150007
        OnClick = mnuExecGeraParcelaClick
      end
      object mnuCancGeraParcela: TMenuItem
        Caption = 'Desfazer Geração de Parcelas'
        HelpContext = 150008
        OnClick = mnuCancGeraParcelaClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuExecEnvio: TMenuItem
        Caption = 'Envio'
        HelpContext = 150009
        OnClick = mnuExecEnvioClick
      end
      object mnuCancEnvio: TMenuItem
        Caption = 'Desfazer Envio'
        HelpContext = 150010
        OnClick = mnuCancEnvioClick
      end
      object mnuAjusteFormaEnvio: TMenuItem
        Caption = 'Ajuste na Forma de Envio'
        OnClick = mnuAjusteFormaEnvioClick
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object mnuExecEnvioLoteConcessao: TMenuItem
        Caption = 'Envio de Concessões em Lote'
        HelpContext = 150011
        OnClick = mnuExecEnvioLoteConcessaoClick
      end
      object mnuCancEnvioLoteConcessao: TMenuItem
        Caption = 'Desfazer Envio de Concessão por Lote'
        HelpContext = 150012
        OnClick = mnuCancEnvioLoteConcessaoClick
      end
      object mnuExecGeraArquivoBanco: TMenuItem
        Caption = 'Geração de Arquivo para Banco'
        HelpContext = 150013
        Visible = False
        OnClick = mnuExecGeraArquivoBancoClick
      end
      object mnuRemessaEletronica: TMenuItem
        Caption = 'Remessa Eletrônica'
        OnClick = mnuRemessaEletronicaClick
      end
      object mnuExecEstornoIndividual: TMenuItem
        Caption = 'Estorno Individual de Concessão'
        HelpContext = 150014
        OnClick = mnuExecEstornoIndividualClick
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object mnuExecDevolucaoLote: TMenuItem
        Caption = 'Envio de Devoluções em Lote - Financeiro'
        HelpContext = 150015
        OnClick = mnuExecDevolucaoLoteClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuExecRecebimento: TMenuItem
        Caption = 'Recebimento Automático'
        HelpContext = 150016
        OnClick = mnuExecRecebimentoClick
      end
      object mnuCancRecebimento: TMenuItem
        Caption = 'Desfazer Recebimento'
        HelpContext = 150017
        OnClick = mnuCancRecebimentoClick
      end
      object N20: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object mnuConsRecebePatro: TMenuItem
        Caption = 'Recebimentos da(s) Patrocinadoras(s)'
        Enabled = False
        HelpContext = 150012
        Visible = False
        OnClick = mnuConsRecebePatroClick
      end
      object mnuExecFechaPatro: TMenuItem
        Caption = 'Fechamento por Patrocinadora'
        Enabled = False
        Visible = False
      end
      object mnuProvisoparaPerdas: TMenuItem
        Caption = 'Provisão para Perdas'
        OnClick = mnuProvisoparaPerdasClick
      end
      object mnuFinanciamentoHabitacional: TMenuItem
        Caption = 'Consulta Quitação Financiamento Habitacional'
        OnClick = mnuFinanciamentoHabitacionalClick
      end
    end
    object mnuTransacao: TMenuItem [2]
      Caption = 'Transações'
      HelpContext = 150015
      object mnuExecQuita: TMenuItem
        Caption = 'Quitação Antecipada / por Falecimento'
        HelpContext = 150020
        OnClick = mnuExecQuitaClick
      end
      object mnuQuitaoemLote: TMenuItem
        Caption = 'Quitação em Lote'
        OnClick = mnuQuitaoemLoteClick
      end
      object mnuCancQuita: TMenuItem
        Caption = 'Cancelamento de Quitação'
        HelpContext = 150021
        OnClick = mnuCancQuitaClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuExecAmortiza: TMenuItem
        Caption = 'Amortização / Refinanciamento'
        HelpContext = 150022
        OnClick = mnuExecAmortizaClick
      end
      object mnuCancAmortiza: TMenuItem
        Caption = 'Cancelamento de Amortização'
        HelpContext = 150023
        OnClick = mnuCancAmortizaClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnuExecAlteraConcessao: TMenuItem
        Caption = 'Alteração de Valor de Concessão'
        HelpContext = 150024
        OnClick = mnuExecAlteraConcessaoClick
      end
      object mnuCancAlteraConcessao: TMenuItem
        Caption = 'Cancelamento de Alteração de Concessão'
        HelpContext = 150106
        OnClick = mnuCancAlteraConcessaoClick
      end
      object N56: TMenuItem
        Caption = '-'
      end
      object mnuPagamentoEmprestimoResgate: TMenuItem
        Caption = 'Pagamento de Empréstimo com Resgate'
        OnClick = mnuPagamentoEmprestimoResgateClick
      end
      object mnuRecebimentoEmprestimoResgate: TMenuItem
        Caption = 'Recebimento de Empréstimo com Resgate'
        OnClick = mnuRecebimentoEmprestimoResgateClick
      end
    end
    object mnuTratamento: TMenuItem [3]
      Caption = 'Tratamentos'
      HelpContext = 150021
      object mnuExecTrataParcAtraso: TMenuItem
        Caption = 'Tratamento de Parcelas em Atraso'
        OnClick = mnuExecTrataParcAtrasoClick
      end
      object N54: TMenuItem
        Caption = '-'
      end
      object mnuExecTrataParcela: TMenuItem
        Caption = 'Tratamento Individual de Parcelas'
        HelpContext = 150026
        OnClick = mnuExecTrataParcelaClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuExecTrataDivergencia: TMenuItem
        Caption = 'Tratamento de Divergências'
        HelpContext = 150027
        OnClick = mnuExecTrataDivergenciaClick
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object mnuExecTrataItemNaoRecebido: TMenuItem
        Caption = 'Tratamento de Itens Não Recebidos'
        HelpContext = 150028
        OnClick = mnuExecTrataItemNaoRecebidoClick
      end
      object mnuExecTrataInesperado: TMenuItem
        Caption = 'Tratamento de Valores Não Programados'
        HelpContext = 150029
        OnClick = mnuExecTrataInesperadoClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object mnuExecEntradaManual: TMenuItem
        Caption = 'Entrada Manual de Cobranças e Devoluções'
        HelpContext = 150030
        OnClick = mnuExecEntradaManualClick
      end
      object N31: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object mnuExecLancaAlteradorEP: TMenuItem
        Caption = 'Ajuste de Valores a Receber - Financeiro'
        Enabled = False
        Visible = False
        OnClick = mnuExecLancaAlteradorEPClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuExecAlteraContrato: TMenuItem
        Caption = 'Alterações Contratuais'
        HelpContext = 150032
        OnClick = mnuExecAlteraContratoClick
      end
      object mnuCadMensagemContrato: TMenuItem
        Caption = 'Mensagem Informativa para Contrato'
        OnClick = mnuCadMensagemContratoClick
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object mnuAssinaturaContrato: TMenuItem
        Caption = 'Assinatura de Contrato Padrão'
        HelpContext = 150033
        OnClick = mnuAssinaturaContratoClick
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object mnuSuspensaoConcessao: TMenuItem
        Caption = 'Bloqueio de Concessão'
        HelpContext = 150034
        OnClick = mnuSuspensaoConcessaoClick
      end
      object N47: TMenuItem
        Caption = '-'
      end
      object mnuHistoricoSuspensao: TMenuItem
        Caption = 'Lançamento e Histórico de Suspensão por Contrato'
        HelpContext = 150035
        OnClick = mnuHistoricoSuspensaoClick
      end
      object mnuLiberaSuspensao: TMenuItem
        Caption = 'Liberação de Suspensão'
        HelpContext = 150036
        OnClick = mnuLiberaSuspensaoClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuValorMaximodePrestaoporParticipante: TMenuItem
        Caption = 'Valor Máximo de Prestação por Participante'
        OnClick = mnuValorMaximodePrestaoporParticipanteClick
      end
      object Seguro1: TMenuItem
        Caption = 'Seguro'
        HelpContext = 150037
        object mnuExecCalculaSeg: TMenuItem
          Caption = 'Cálculo de Seguro Complementar'
          HelpContext = 150038
          OnClick = mnuExecCalculaSegClick
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object mnuCalculoRepasseSeguro: TMenuItem
          Caption = 'Cálculo de Repasse de Seguro (Quitação por Falecimento)'
          HelpContext = 150039
          OnClick = mnuCalculoRepasseSeguroClick
        end
        object mnuLancaDepositoSeguro: TMenuItem
          Caption = 
            'Controle de Depósito de Repasse de Seguro (Quitação por Falecime' +
            'nto)'
          HelpContext = 150040
          OnClick = mnuLancaDepositoSeguroClick
        end
        object N51: TMenuItem
          Caption = '-'
        end
        object mnuExecEnvioSeguro: TMenuItem
          Caption = 
            'Envio de Repasse de Seguro (Concessão / Refinanciamento / Quitaç' +
            'ão Antecipada)'
          HelpContext = 150107
          OnClick = mnuExecEnvioSeguroClick
        end
        object mnuCancEnvioSeguro: TMenuItem
          Caption = 'Desfazer Envio de Repasse de Seguro'
          HelpContext = 150108
          OnClick = mnuCancEnvioSeguroClick
        end
      end
      object mnuHistoricoEventoCobranca: TMenuItem
        Caption = 'Lançamento e Histórico de Eventos de Cobrança'
        OnClick = mnuHistoricoEventoCobrancaClick
      end
      object N55: TMenuItem
        Caption = '-'
      end
      object mnuTratamentodeExcessodeDbito: TMenuItem
        Caption = 'Tratamento de Excesso de Débito'
        OnClick = mnuTratamentodeExcessodeDbitoClick
      end
      object N57: TMenuItem
        Caption = '-'
      end
      object mnuProcessaEventosCobranca: TMenuItem
        Caption = 'Processar Eventos de Cobrança'
        OnClick = mnuProcessaEventosCobrancaClick
      end
      object mnuAdicionarInforEventosCobranca: TMenuItem
        Caption = 'Adicionar Informações aos Eventos de Cobrança'
        OnClick = mnuAdicionarInforEventosCobrancaClick
      end
      object mnuRestrCob: TMenuItem
        Caption = 'Restrição de Cobranças'
        OnClick = mnuRestrCobClick
      end
      object mnuTransferePerfil: TMenuItem
        Caption = 'Transferência de Perfil de Investimentos'
        OnClick = mnuTransferePerfilClick
      end
    end
    object mnuContabilizacao: TMenuItem [4]
      Caption = 'Contabilização'
      HelpContext = 150041
      object mnuExecContabilizaLoteConcessao: TMenuItem
        Caption = 'Contabilização de Concessões por Lote'
        HelpContext = 150042
        OnClick = mnuExecContabilizaLoteConcessaoClick
      end
      object mnuCancContabilizaLoteConcessao: TMenuItem
        Caption = 'Desfazer Contabilização de Concessões por Lote'
        HelpContext = 150043
        OnClick = mnuCancContabilizaLoteConcessaoClick
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaLotePrestacao: TMenuItem
        Caption = 'Contabilização de Prestações por Lote'
        HelpContext = 150044
        OnClick = mnuExecContabilizaLotePrestacaoClick
      end
      object mnuCancContabilizaLotePrestacao: TMenuItem
        Caption = 'Desfazer Contabilização de Prestações por Lote'
        HelpContext = 150045
        OnClick = mnuCancContabilizaLotePrestacaoClick
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaLoteAmortizacao: TMenuItem
        Caption = 'Contabilização de Amortizações por Lote'
        HelpContext = 150046
        OnClick = mnuExecContabilizaLoteAmortizacaoClick
      end
      object mnuCancContabilizaLoteAmortizacao: TMenuItem
        Caption = 'Desfazer Contabilização de Amortizações por Lote'
        HelpContext = 150047
        OnClick = mnuCancContabilizaLoteAmortizacaoClick
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaLoteQuitacao: TMenuItem
        Caption = 'Contabilização de Quitações por Lote'
        HelpContext = 150048
        OnClick = mnuExecContabilizaLoteQuitacaoClick
      end
      object mnuCancContabilizaLoteQuitacao: TMenuItem
        Caption = 'Desfazer Contabilização de Quitações por Lote'
        HelpContext = 150049
        OnClick = mnuCancContabilizaLoteQuitacaoClick
      end
      object N33: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaLoteEncargos: TMenuItem
        Caption = 'Contabilização de Encargos por Lote'
        HelpContext = 150050
        OnClick = mnuExecContabilizaLoteEncargosClick
      end
      object mnuCancContabilizaLoteEncargos: TMenuItem
        Caption = 'Desfazer Contabilização de Encargos por Lote'
        HelpContext = 150051
        OnClick = mnuCancContabilizaLoteEncargosClick
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaLoteAtuDia: TMenuItem
        Caption = 'Contabilização da Atualização Diária por Lote'
        HelpContext = 150052
        OnClick = mnuExecContabilizaLoteAtuDiaClick
      end
      object mnuCancContabilizaLoteAtuDia: TMenuItem
        Caption = 'Desfazer Contabilização da Atualização Diária por Lote'
        HelpContext = 150053
        OnClick = mnuCancContabilizaLoteAtuDiaClick
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object mnuExecContabilizaAjusteDia: TMenuItem
        Caption = 'Contabilização de Ajustes por Lote'
        HelpContext = 150054
        OnClick = mnuExecContabilizaAjusteDiaClick
      end
      object mnuCancContabilizaAjusteDia: TMenuItem
        Caption = 'Desfazer Contabilização de Ajustes por Lote'
        HelpContext = 150055
        OnClick = mnuCancContabilizaAjusteDiaClick
      end
    end
    inherited Edit1: TMenuItem
      Caption = 'Editar'
    end
    inherited mnuCadastro: TMenuItem
      Caption = 'Cadastros'
      HelpContext = 150032
      object mnuCadAvalista: TMenuItem
        Caption = 'Avalistas'
        HelpContext = 150057
        OnClick = mnuCadAvalistaClick
      end
      object mnuCadSeguradora: TMenuItem
        Caption = 'Seguradoras'
        HelpContext = 150058
        OnClick = mnuCadSeguradoraClick
      end
      object mnuCadBenefSeguro: TMenuItem
        Caption = 'Beneficiários de Seguro'
        Enabled = False
        HelpContext = 150034
        Visible = False
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuCadTipoEmptmo: TMenuItem
        Caption = 'Tipos de Empréstimo'
        HelpContext = 150059
        OnClick = mnuCadTipoEmptmoClick
      end
      object mnuCadTipoContrato: TMenuItem
        Caption = 'Tipos de Contrato de Empréstimo'
        HelpContext = 150060
        OnClick = mnuCadTipoContratoClick
      end
      object mnuCadTipoContrXQuit: TMenuItem
        Caption = 'Tipos de Contrato Quitáveis por Tipo de Contrato'
        HelpContext = 150061
        OnClick = mnuCadTipoContrXQuitClick
      end
      object mnuContratoPadrao: TMenuItem
        Caption = 'Contrato Padrão'
        HelpContext = 150062
        OnClick = mnuContratoPadraoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCadItemEmptmo: TMenuItem
        Caption = 'Itens de Empréstimo'
        HelpContext = 150063
        OnClick = mnuCadItemEmptmoClick
      end
      object mnuCadItemXTipoContrato: TMenuItem
        Caption = 'Itens por Tipo de Contrato'
        HelpContext = 150064
        OnClick = mnuCadItemXTipoContratoClick
      end
      object mnuItemXProcesso: TMenuItem
        Caption = 'Itens por Processo'
        HelpContext = 150109
        OnClick = mnuItemXProcessoClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuCadDataPatro: TMenuItem
        Caption = 'Datas por Patrocinadora'
        HelpContext = 150065
        OnClick = mnuCadDataPatroClick
      end
      object mnuCadMotivo: TMenuItem
        Caption = 'Motivos       '
        Enabled = False
        Visible = False
      end
      object N34: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object mnuCadVerba: TMenuItem
        Caption = 'Verbas'
        Enabled = False
        HelpContext = 150040
        Visible = False
        OnClick = mnuCadVerbaClick
      end
      object mnuVerbasPlano: TMenuItem
        Caption = 'Verbas por Planos'
        Enabled = False
        HelpContext = 150062
        Visible = False
        object mnuExecCadUnidCentr: TMenuItem
          Caption = 'Unidades Centralizadoras'
          HelpContext = 150063
          OnClick = mnuExecCadUnidCentrClick
        end
        object mnuExecTipoContrXPlano: TMenuItem
          Caption = 'Tipos de Contrato por Plano'
          HelpContext = 150064
          OnClick = mnuExecTipoContrXPlanoClick
        end
        object mnuExecCadVerbaPlano: TMenuItem
          Caption = 'Dotação de Verbas por Plano'
          HelpContext = 150065
          OnClick = mnuExecCadVerbaPlanoClick
        end
        object mnuExecCadUnidPlano: TMenuItem
          Caption = 'Distribuição de Verbas por Unidades Centralizadoras'
          HelpContext = 150066
          OnClick = mnuExecCadUnidPlanoClick
        end
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object mnuCadTipoSuspensao: TMenuItem
        Caption = 'Tipos de Suspensão'
        HelpContext = 150073
        OnClick = mnuCadTipoSuspensaoClick
      end
      object mnuTipoSuspXTipoContr: TMenuItem
        Caption = 'Tipos de Suspensão X Tipo de Contrato'
        HelpContext = 150074
        OnClick = mnuTipoSuspXTipoContrClick
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object mnuCadParam: TMenuItem
        Caption = 'Parâmetros para Integração'
        HelpContext = 150076
        object mnuCadParamIntegra: TMenuItem
          Caption = 'Itens'
          HelpContext = 150075
          OnClick = mnuCadParamIntegraClick
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object mnuCadBancoXPortadorForma: TMenuItem
          Caption = 'Banco X Contas de Caixa X Forma de Pagamento'
          HelpContext = 150077
          OnClick = mnuCadBancoXPortadorFormaClick
        end
        object mnuCadPlanPrevXContabil: TMenuItem
          Caption = 'Plano Previdenciário X Entidade Contábil'
          HelpContext = 150078
          OnClick = mnuCadPlanPrevXContabilClick
        end
        object mnuCadRecebPatro: TMenuItem
          Caption = 'Recebimento da(s) Patrocinadora(s)'
          Enabled = False
          HelpContext = 150047
          Visible = False
          OnClick = mnuCadRecebPatroClick
        end
        object N52: TMenuItem
          Caption = '-'
        end
        object mnuPortFormaxEmptmo: TMenuItem
          Caption = 'Banco x Conta-Caixa x Forma Recebimento de Empréstimos'
          HelpContext = 150130
          OnClick = mnuPortFormaxEmptmoClick
        end
      end
      object mnuEventosCobrancas: TMenuItem
        Caption = 'Eventos de Cobrança'
        OnClick = mnuEventosCobrancasClick
      end
      object mnuBloqConcPlanPrev: TMenuItem
        Caption = 'Suspensão de Concessões por Plano Previdenciário'
        OnClick = mnuBloqConcPlanPrevClick
      end
      object mnuMotivodeBloqueiodeConcesso: TMenuItem
        Caption = 'Motivo de Bloqueio de Concessão'
        OnClick = mnuMotivodeBloqueiodeConcessoClick
      end
    end
    inherited mnuConsulta: TMenuItem
      Caption = 'Consultas'
      inherited Relatorios1: TMenuItem
        Caption = 'Relatórios'
      end
      inherited Grficos2: TMenuItem
        Caption = 'Gráficos'
        HelpContext = 150110
      end
      inherited MnuConsultasGerais_Padrao: TMenuItem
        Caption = 'Gerais'
      end
      object N48: TMenuItem [3]
        Caption = '-'
      end
      object mnuRelEspeciais: TMenuItem [4]
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
          777777777788FF087777777788FFFFF077777778FFFF88F077777778FF00F0FF
          0777777700FFF0FF07777700FFFFFF0FF077778FFFFFCF0FFF07778FFCCCFFF0
          FFF07778FFFFFCF0F8877778FFCCCFFF077777778FFFFFCFF07777778FFCCCFF
          FF07777778FFFFFF88777777778FFF8877777777777888777777}
        Caption = 'Relatórios Especiais'
        HelpContext = 150111
        object mnuArquivoTexto: TMenuItem
          Caption = 'Arquivos de Texto'
          Visible = False
          object mnuExecArquivoInadimplente: TMenuItem
            Caption = 'Arquivo de Inadimplentes'
            Enabled = False
            OnClick = mnuExecArquivoInadimplenteClick
          end
          object mnuExecArquivoSeguradora: TMenuItem
            Caption = 'Arquivo para Seguradora'
            Enabled = False
          end
        end
        object N49: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuCartaCobranca: TMenuItem
          Caption = 'Cartas de Cobrança'
          HelpContext = 150072
          object mnuCadCartaCobranca: TMenuItem
            Caption = 'Configuração'
            HelpContext = 150080
            OnClick = mnuCadCartaCobrancaClick
          end
          object mnuRelCartaCobranca: TMenuItem
            Caption = 'Emissão'
            HelpContext = 150081
            OnClick = mnuRelCartaCobrancaClick
          end
        end
        object sepRelEspFUNCEF: TMenuItem
          Caption = '-'
        end
        object ValorAtualizadoporContrato1: TMenuItem
          Caption = 'Valor Atualizado por Contrato'
          HelpContext = 150114
        end
        object N50: TMenuItem
          Caption = '-'
        end
        object mnuRelProvPerdaFUNCEFAnal: TMenuItem
          Caption = 'Provisão para Perdas (analítico)'
          HelpContext = 150112
          OnClick = mnuRelProvPerdaFUNCEFAnalClick
        end
        object mnuRelProvPerdaFUNCEFSint: TMenuItem
          Caption = 'Provisão para Perdas (sintético)'
          HelpContext = 150113
          OnClick = mnuRelProvPerdaFUNCEFSintClick
        end
        object sepRelEspOutros: TMenuItem
          Caption = '-'
        end
        object mnuRelProvPerdaOutrosAnal: TMenuItem
          Caption = 'Provisão para Perdas (analítico)'
          OnClick = mnuRelProvPerdaOutrosAnalClick
        end
        object mnuRelProvPerdaOutrosSint: TMenuItem
          Caption = 'Provisão para Perdas (sintético)'
          OnClick = mnuRelProvPerdaOutrosSintClick
        end
        object N53: TMenuItem
          Caption = '-'
        end
        object mnuMapaMovimentao: TMenuItem
          Caption = 'Mapa de Movimentação'
          OnClick = mnuMapaMovimentaoClick
        end
        object mnuRelEvolucaoContrato: TMenuItem
          Caption = 'Evolução de Contrato'
          OnClick = mnuRelEvolucaoContratoClick
        end
        object mnuRelEmprestimosQuitados: TMenuItem
          Caption = 'Análise de Prestação Após Quitação'
          OnClick = mnuRelEmprestimosQuitadosClick
        end
        object mnuSaldoResidual: TMenuItem
          Caption = 'Saldo Residual'
          OnClick = mnuSaldoResidualClick
        end
        object mnuRelatrioInadimplencia: TMenuItem
          Caption = 'Relatório de Inadimplência'
          OnClick = mnuRelatrioInadimplenciaClick
        end
      end
      inherited Mnu_separa1_Padrao: TMenuItem
        Visible = True
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = 'Consulta Geral de Pessoa'
        Visible = True
      end
      inherited Mnu_UsoPessoal_Padrao: TMenuItem
        Caption = 'Uso Pessoal'
        Visible = True
      end
      inherited MnuLogdeOperaes_Padrao: TMenuItem
        HelpContext = 150131
      end
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 150132
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuConsContratoParcela: TMenuItem
        Bitmap.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777770000000777777700B077777700000007777700FBF077777700000007770
          0BFB4BF0777770000000700FBF44BFB077777000000078FBF4FBFBFB07777000
          000078BFBFBF44BF077770000000778BFB44FBFBF07770000000778FB8BFB44F
          B077700000007778FBF44BFBFB07700000007778BF4FBF44BFB0700000007777
          8BFB44FBFBFB0000000077778FB0BFBFBF8870000000777778FBFBFB88777000
          00007777778FBF88777770000000777777788877777770000000}
        Caption = 'Contratos e Parcelas'
        HelpContext = 150082
        OnClick = mnuConsContratoParcelaClick
      end
      object mnuConsTMPDESC: TMenuItem
        Caption = 'Valores a Receber - Folha(s)'
        HelpContext = 150083
        OnClick = mnuConsTMPDESCClick
      end
      object N25: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuConsLogTotalPrev: TMenuItem
        Caption = 'Log de Eventos de Empréstimo'
        Visible = False
        OnClick = mnuConsLogTotalPrevClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mnuConsPlanoConta: TMenuItem
        Caption = 'Plano de Contas'
        HelpContext = 150084
        OnClick = mnuConsPlanoContaClick
      end
      object N24: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuConferencia: TMenuItem
        Caption = 'Conferências (analíticas)'
        Enabled = False
        Visible = False
        object mnuConfCarteiraSaldo: TMenuItem
          Caption = 'Resumo da Carteira - visão Saldo'
          Enabled = False
          Visible = False
        end
        object mnuConfCarteiraCaixa: TMenuItem
          Caption = 'Resumo da Carteira - visão Caixa'
          Enabled = False
          Visible = False
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object mnuConfEnvio: TMenuItem
          Caption = 'Itens Enviados'
          Enabled = False
          Visible = False
        end
      end
    end
    inherited mnuRAD: TMenuItem
      Caption = 'RAD'
      inherited mnuRadPendente: TMenuItem
        Caption = 'Processos Pendentes'
      end
      inherited mnuGerarProcesso_Padrao: TMenuItem
        Caption = 'Gerar Processo'
      end
      inherited mnuRADConsultar: TMenuItem
        Caption = 'Consultar Processo'
      end
      inherited mnuAtuObjetos: TMenuItem
        Caption = 'Atualização de objetos'
      end
    end
    inherited mnuJanela: TMenuItem
      Caption = 'Janela'
      inherited mnuLLV_Padrao: TMenuItem
        Caption = 'Lado a Lado Vertical'
      end
    end
    inherited mnuAjuda: TMenuItem
      Caption = 'Ajuda'
      inherited mnuAjudaIndice: TMenuItem
        HelpContext = 230041
      end
      inherited mnuAjudaSobre: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 992
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 992
    Top = 104
  end
  inherited AclPadrao: TActionList
    Left = 192
    Top = 40
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    Left = 464
    Top = 72
  end
  inherited Skt: TSocketConnection
    Left = 136
  end
  inherited Dcom: TDCOMConnection
    Left = 136
  end
  inherited Web: TWebConnection
    Left = 192
    Top = 88
  end
  inherited CorreioCM: TCorreioCM
    Left = 992
    Top = 152
  end
  inherited ResourceManager: TCMResourceManager
    Left = 160
    Top = 144
  end
  object EMPConcedidos: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 240
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29634
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Empréstimos Concedidos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 72231
        mmTop = 8467
        mmWidth = 52388
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'FCRT - Fundação dos Empregados da CRT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 47625
        mmTop = 1588
        mmWidth = 101336
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 29104
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 24871
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Matrícula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 15346
        mmTop = 24871
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 30163
        mmTop = 25135
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Solicitado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 25665
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 22754
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 22490
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quitação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 136261
        mmTop = 25400
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 24342
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'I.O.F.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 24606
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 187325
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 182827
        mmTop = 24606
        mmWidth = 9790
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15610
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29633
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SOL'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 1588
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DEB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 138642
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'IOF'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CRE'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATACREDITO'
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 183886
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ADM'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 88636
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QQM'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 2381
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object EMPRenovados: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 192
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Empréstimos Renovados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 73290
        mmTop = 8731
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'LblEmpresa1'
        Caption = 'Fundação CRT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81492
        mmTop = 1588
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 23283
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Matrícula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 15610
        mmTop = 23283
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 23283
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Solicitado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 23283
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 19844
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 19844
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label102'
        Caption = 'Quitação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 137584
        mmTop = 23283
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 23283
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 19844
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'I.O.F.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 23283
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label14'
        Caption = 'Adm'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 163248
        mmTop = 1058
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Tx.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 132557
        mmTop = 3440
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'QQM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 133879
        mmTop = 6879
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 186267
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 23283
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QQM'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 2117
        mmWidth = 11377
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CONTACORRENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 6879
        mmWidth = 25665
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'MATRICULA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15610
        mmTop = 794
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'IDCONTRATOEMPTMO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 794
        mmWidth = 81756
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'SOL'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 118004
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'DEB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134673
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'IOF'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151342
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CRE'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText101'
        DataField = 'DATACREDITO'
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CON.IDCONTRATOEMPTMO,'
      '  CON.FLGSITUACAO'
      'FROM'
      '   CONTRATOEMPTMO  CON'
      'WHERE'
      '       CON.FLGSITUACAO <> '#39'C'#39
      
        '   AND (:PIDCONTRATOEMPTMO IS NULL OR IDCONTRATOEMPTMO =:PIDCONT' +
        'RATOEMPTMO)')
    ValidateWithMask = True
    Left = 48
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDCONTRATOEMPTMO'
    end
    object qryContratosFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdateSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.FLGSITUACAO =:PFLGSITUACAO'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
