inherited frmPrincipal: TfrmPrincipal
  Left = 315
  Top = 150
  Caption = 'Controle do Ativo Fixo'
  ClientHeight = 404
  ClientWidth = 733
  PixelsPerInch = 96
  TextHeight = 13
  object lblAutorizaTemp: TLabel [0]
    Left = 1
    Top = 31
    Width = 10
    Height = 10
    AutoSize = False
    OnClick = lblAutorizaTempClick
  end
  inherited Dock97Top: TDock97
    Width = 733
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 175
    Top = 142
    ClientAreaHeight = 149
    ClientAreaWidth = 408
    inherited pnlTextoFluxOper: TPanel
      Width = 408
      Height = 118
      inherited Bevel1: TBevel
        Width = 408
      end
      inherited Panel1: TPanel
        Width = 408
        Height = 90
        inherited DBMemo1: TDBMemo
          Width = 402
          Height = 84
        end
      end
      inherited pnldbEditFluxo: TPanel
        Width = 408
      end
    end
    inherited Panel2: TPanel
      Width = 408
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 384
    Width = 733
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
        Text = 'Usuário'
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
        Name = 'Panel2'
        Style = psDate
        Tag = 0
        Text = '06/03/2017'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '30'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 522
    Top = 143
    TargetsData = (
      1
      1
      (
        '*'
        'Filter'
        0))
  end
  inherited mnu: TMainMenu
    Left = 112
    Top = 64
    inherited mnuSistema: TMenuItem
      GroupIndex = 3
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object mnuCadCafMoedas: TMenuItem [1]
          Caption = '&Moedas usadas no Sistema'
          OnClick = mnuCadCafMoedasClick
        end
        object mnuCadCAFPaises: TMenuItem [2]
          Caption = '&Países usados no Sistema'
          OnClick = mnuCadCAFPaisesClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N15: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuReconstruirSaldo: TMenuItem
          Caption = '&Reconstruir Saldo Contábil'
          OnClick = mnuReconstruirSaldoClick
        end
        object mnuCorrecaoGrupoBem: TMenuItem
          Caption = 'Correção de Grupo Contábil'
          OnClick = mnuCorrecaoGrupoBemClick
        end
        object mnuListaTransfIlegal: TMenuItem
          Caption = 'Lista Bens/Grupos Inconsistentes'
          Visible = False
          OnClick = mnuListaTransfIlegalClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object mnuExportacao: TMenuItem
          Caption = '&Exportação de Dados'
          object mnuUtilExpPlacas: TMenuItem
            Caption = '&Placas de Patrimonio'
            OnClick = mnuUtilExpPlacasClick
          end
          object mnuExpContab: TMenuItem
            Caption = '&Dados Contábeis'
            OnClick = mnuExpContabClick
          end
          object mnuExpCadBensSRF: TMenuItem
            Caption = 'Cadastro de Bens - SRF - Resolução IN 86'
            OnClick = mnuExpCadBensSRFClick
          end
          object mnuExpDadosparaReavaliacao: TMenuItem
            Caption = 'Dados para Reavaliação'
            OnClick = mnuExpDadosparaReavaliacaoClick
          end
          object mnuUtilExpSISPROxOFA: TMenuItem
            Caption = 'Interface - SISPRO x OFA'
            OnClick = mnuUtilExpSISPROxOFAClick
          end
        end
        object mnuImplantacao: TMenuItem
          Caption = 'Im&plantação do Sistema'
          Visible = False
          object mnuUtilAjustaLancImplantacao: TMenuItem
            Caption = 'Lançamentos de Ajuste'
            OnClick = mnuUtilAjustaLancImplantacaoClick
          end
          object mnuUtilReconDeprecBem: TMenuItem
            Caption = 'Reconstruir Fechamentos por Bem '
            OnClick = mnuUtilReconDeprecBemClick
          end
        end
      end
    end
    inherited Edit1: TMenuItem
      GroupIndex = 3
    end
    inherited mnuCadastro: TMenuItem
      GroupIndex = 3
      object Situacoes11: TMenuItem
        Caption = '&Situações Físicas'
        OnClick = Situacoes11Click
      end
      object Tiposdeareas1: TMenuItem
        Caption = 'Tipos de Áre&as'
        OnClick = Tiposdeareas1Click
      end
      object TipodeDespesaparaAcrescimodeValor1: TMenuItem
        Caption = 
          'Tipos Específicos de Movimentações para Acréscimos/&Decréscimos ' +
          'de Valor'
        OnClick = TipodeDespesaparaAcrescimodeValor1Click
      end
      object MotivosdeBaixadeBens1: TMenuItem
        Caption = '&Motivos para Bai&xa de Bens'
        OnClick = MotivosdeBaixadeBens1Click
      end
      object mnuCadTipoSaidaTemp: TMenuItem
        Caption = '&Motivos para Saída Temporária'
        OnClick = mnuCadTipoSaidaTempClick
      end
      object mnuEtapasdeObras: TMenuItem
        Caption = '&Etapas de Obras'
        OnClick = mnuEtapasdeObrasClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Responsaveis1: TMenuItem
        Caption = '&Responsáveis'
        OnClick = Responsaveis1Click
      end
      object Terceiros1: TMenuItem
        Caption = '&Terceiros'
        OnClick = Terceiro1Click
      end
      object DestinatriosdeBensAlienados1: TMenuItem
        Caption = '&Destinatários de Bens Alienados'
        OnClick = DestinatriosdeBensAlienados1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object LocalizaesdosBens1: TMenuItem
        Caption = 'L&ocalizações'
        Hint = 'Setores, Departamentos ...'
        OnClick = Localizacoes1Click
      end
      object GruposdeBens1: TMenuItem
        Caption = '&Grupos Contábeis'
        Hint = 'Grupos Contábeis dos Bens'
        OnClick = GruposdeBens1Click
      end
      object ClassesdeBens1: TMenuItem
        Caption = '&Classes de Bens'
        Hint = 'Classificação Física dos Bens'
        OnClick = ClassesdeBens1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ContasMovimentoporGrupos1: TMenuItem
        Caption = '&Parametrização Contábil'
        OnClick = ContasMovimentoporGrupos1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ConjuntosdeBens1: TMenuItem
        Caption = '&Conjuntos de Bens'
        OnClick = ConjuntosdeBens1Click
      end
      object mnuCadBens: TMenuItem
        Caption = '&Bens'
        OnClick = mnuCadBensClick
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object TaxadeDeprecicao: TMenuItem
        Caption = 'Taxa de Depreciação / Vida Útil'
        Hint = 'Taxa de Depreciação '
        OnClick = TaxadeDeprecicaoClick
      end
    end
    object mnuInventario: TMenuItem [3]
      Caption = '&Inventário'
      GroupIndex = 3
      object mnuInvGeracao: TMenuItem
        Caption = '&Geração'
        OnClick = mnuInvGeracaoClick
      end
      object mnuInvCadastramento: TMenuItem
        Caption = '&Registra Resultado'
        OnClick = mnuInvCadastramentoClick
      end
      object mnuInvProcessamento: TMenuItem
        Caption = '&Processamento'
        OnClick = mnuInvProcessamentoClick
      end
    end
    object Bens1: TMenuItem [4]
      Caption = '&Movimentações'
      GroupIndex = 3
      object mnuBensPendentesAlmox: TMenuItem
        Caption = '&Entrada de Bens Pendentes'
        OnClick = mnuBensPendentesAlmoxClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuSelTransf: TMenuItem
        Caption = 'Se&leção para Transferência'
        OnClick = mnuSelTransfClick
      end
      object mnuTransfBens: TMenuItem
        Caption = '&Transferência de Bens'
        OnClick = mnuTransfBensClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mnuSelBaixa1: TMenuItem
        Caption = '&Seleção para Baixa'
        OnClick = mnuSelBaixa1Click
      end
      object mnuMovBaixa: TMenuItem
        Caption = '&Baixa de Bens'
        OnClick = mnuMovBaixaClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnuSaidaTemporaria: TMenuItem
        Caption = 'Saída Tem&porária'
        object mnuMovSaidaTemp: TMenuItem
          Caption = '&Cadastro de Termos'
          OnClick = mnuMovSaidaTempClick
        end
        object mnuMovExecSaidaTemp: TMenuItem
          Caption = '&Executa Termo'
          OnClick = mnuMovExecSaidaTempClick
        end
        object mnuMovRetSaidaTemp: TMenuItem
          Caption = '&Retorno dos Bens'
          OnClick = mnuMovRetSaidaTempClick
        end
      end
      object mnuTrocadePlaca1: TMenuItem
        Caption = 'Troca da &Placa de Tombamento'
        OnClick = mnuTrocadePlaca1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object SeleoparaReavaliao1: TMenuItem
        Caption = 'Seleção para Reavaliação'
        OnClick = SeleoparaReavaliao1Click
      end
      object mnuMovReavaliacao: TMenuItem
        Caption = '&Reavaliação Patrimonial'
        OnClick = mnuMovReavaliacaoClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object mnuMovControleTotal: TMenuItem
        Caption = '&Controle Total'
        OnClick = mnuMovControleTotalClick
      end
      object mnuMovAcrescimo: TMenuItem
        Caption = '&Acréscimo/Decréscimo de valor'
        OnClick = mnuMovAcrescimoClick
      end
      object mnuCargaAcreDecre: TMenuItem
        Caption = 'Carga Acréscimo/Decréscimo de Valor'
        OnClick = mnuCargaAcreDecreClick
      end
      object mnuMovDesmembramento: TMenuItem
        Caption = 'Desmem&bramento'
        OnClick = mnuMovDesmembramentoClick
      end
      object mnuMovRemembramento: TMenuItem
        Caption = 'Re&membramento'
        OnClick = mnuMovRemembramentoClick
      end
      object mnuBemCotacao: TMenuItem
        Caption = '&Valor de Mercado'
        OnClick = mnuBemCotacaoClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object OutrasMovimentaes1: TMenuItem
        Caption = 'Estornar &Movimentações'
        OnClick = OutrasMovimentaes1Click
      end
    end
    object mnuObras: TMenuItem [5]
      Caption = '&Obras'
      GroupIndex = 3
      object mnuCadObra: TMenuItem
        Caption = '&Cadastramento de Obra'
        OnClick = mnuCadObraClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuLancamentosObra: TMenuItem
        Caption = '&Lançamentos em Obra'
        OnClick = mnuLancamentosObraClick
      end
      object mnuObraLancAltera: TMenuItem
        Caption = '&Alterar Lançamentos'
        OnClick = mnuObraLancAlteraClick
      end
      object mnuEstornaLancamentos: TMenuItem
        Caption = '&Estorna Lançamentos'
        OnClick = mnuEstornaLancamentosClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuDesmembramentoObra: TMenuItem
        Caption = '&Desmembramento de Obra'
        OnClick = mnuDesmembramentoObraClick
      end
      object EstornarDesmembramento1: TMenuItem
        Caption = 'Estorna Desmembramento'
        OnClick = EstornarDesmembramento1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuEncerramentoObra: TMenuItem
        Caption = 'Encerramento &Total'
        OnClick = mnuEncerramentoObraClick
      end
    end
    object mnuFechamento1: TMenuItem [6]
      Caption = '&Fechamento'
      GroupIndex = 3
      object Depreciao1: TMenuItem
        Caption = '&Executar'
        OnClick = Depreciacao1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Depreciao2: TMenuItem
        Caption = 'Esto&rnar'
        OnClick = Depreciacao2Click
      end
    end
    inherited mnuConsulta: TMenuItem
      GroupIndex = 3
      object mnuConsultBens1: TMenuItem [0]
        Caption = 'Cadastro de &Bens'
        OnClick = mnuConsultBens1Click
      end
      object mnuConsSldCtb: TMenuItem [1]
        Caption = '&Saldo Contábil por Bem'
        OnClick = mnuConsSldCtbClick
      end
      object Movimentacoes1: TMenuItem [2]
        Caption = '&Histórico das Movimentações'
        OnClick = Movimentacoes1Click
      end
      object N17: TMenuItem [3]
        Caption = '-'
      end
      object mnuSaldoContabilporGrupo1: TMenuItem [4]
        Caption = 'Saldo Contábil por &Grupo'
        OnClick = mnuSaldoContabilporGrupo1Click
      end
      object mnuConsParamContab: TMenuItem [5]
        Caption = '&Parametrização Contábil'
        OnClick = mnuConsParamContabClick
      end
      object N20: TMenuItem [6]
        Caption = '-'
      end
      object mnuConsLevInvent: TMenuItem [7]
        Caption = '&Levantamento de Inventário'
        OnClick = mnuConsLevInventClick
      end
      object N19: TMenuItem [8]
        Caption = '-'
      end
      object mnuConsultCafObras: TMenuItem [9]
        Caption = '&Obras'
        OnClick = mnuConsultCafObrasClick
      end
      object N5: TMenuItem [10]
        Caption = '-'
      end
      object N6: TMenuItem [12]
        Caption = '-'
        Visible = False
      end
    end
    inherited mnuRAD: TMenuItem
      GroupIndex = 3
    end
    inherited mnuJanela: TMenuItem
      GroupIndex = 3
    end
    inherited mnuAjuda: TMenuItem
      GroupIndex = 3
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 552
    Top = 312
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 312
  end
  inherited AclPadrao: TActionList
    Left = 496
    Top = 312
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 440
    Top = 312
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{01B261A7-5FF1-4E13-9C80-2C701B3048B4}'
    ServerName = 'CMCAFSrvr70.coCMCAFSrvr70'
    Left = 736
    Top = 144
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{01B261A7-5FF1-4E13-9C80-2C701B3048B4}'
    ServerName = 'CMCAFSrvr70.coCMCAFSrvr70'
    Left = 696
    Top = 144
  end
  inherited Web: TWebConnection
    ServerGUID = '{01B261A7-5FF1-4E13-9C80-2C701B3048B4}'
    ServerName = 'CMCAFSrvr70.coCMCAFSrvr70'
    Left = 656
    Top = 144
  end
  inherited CorreioCM: TCorreioCM
    Left = 616
    Top = 312
  end
  inherited ResourceManager: TCMResourceManager
    ProjectName = 'Controle do Ativo Fixo'
    ExeName = 'CAF.exe'
    Versao = '3.09.00 Beta'
    Left = 480
    Top = 40
  end
  object timBensPendentes: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = timBensPendentesTimer
    Left = 40
    Top = 285
  end
  object scrTriggerCAFMT: TCMSQLScript
    Script.Strings = (
      'DROP TRIGGER TRGINSHISTMOVIMBEM;'
      ''
      'CREATE TRIGGER TRGINSHISTMOVIMBEM'
      'BEFORE INSERT ON HISTORICOMOVIMENTACAO'
      'FOR EACH ROW'
      'DECLARE'
      '   dDTANCAF DATE;'
      'BEGIN'
      '   SELECT DTANCAF INTO dDTANCAF'
      '   FROM PARAMETROSCAFMANUT'
      '   WHERE IDPESSOA = :NEW.IDPESSOA;'
      ''
      '   IF (dDTANCAF IS NOT NULL) AND (:NEW.FLGNCAF IS NULL) THEN'
      
        '      RAISE_APPLICATION_ERROR(-20000,'#39'NÃO É MAIS POSSÍVEL EXECUT' +
        'AR MOVIMENTAÇÕES COM O CAF 3.00.xx OU INFERIOR'#39');'
      '   END IF;'
      'END;'
      ''
      ' '
      ' ')
    Commit = ctNone
    DataBaseName = 'Basedados'
    Left = 168
    Top = 232
  end
  object sqlVerBensPend: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(IDBENSPENDENTES) AS QTDBENSPEND'
      'FROM BENSPENDENTES'
      'WHERE (IDPESSOA = :IDPESSOA)'
      '')
    ClientDataSet = cdsVerBensPend
    Left = 38
    Top = 271
  end
  object cdsVerBensPend: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 257
  end
  object sqlVerificaBEM: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(IDBEM) AS QTDBEM'
      'FROM BEM'
      'WHERE (IDPESSOA = :IDPESSOA)')
    ClientDataSet = cdsVerificaBEM
    Left = 38
    Top = 175
  end
  object cdsVerificaBEM: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 161
  end
  object sqlMoedaOficial: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMDECIMAIS, DECODE(FLGARREDONDA,'#39'N'#39',0,1) AS FLGARREDONDA'
      'FROM MOEDA'
      'WHERE MOECODIGO = :MOECODIGO')
    ClientDataSet = cdsMoedaOficial
    Left = 150
    Top = 175
  end
  object cdsMoedaOficial: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 150
    Top = 161
  end
  object sqlCAFMoedas: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(MOECODIGO) AS QTD'
      'FROM CAFMOEDAS'
      'WHERE IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsCAFMoedas
    Left = 278
    Top = 175
  end
  object cdsCAFMoedas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 278
    Top = 161
  end
  object cdsPlanPrevContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 278
    Top = 233
  end
end
