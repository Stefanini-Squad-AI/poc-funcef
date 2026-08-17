inherited frmPrincipal: TfrmPrincipal
  Left = 132
  Top = 85
  Caption = 'Investimentos Imobiliários'
  ClientHeight = 500
  ClientWidth = 884
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 884
    BackgroundOnToolbars = False
    inherited fcLabel2: TfcLabel
      Top = 1
      OnDblClick = fcLabel2DblClick
    end
    inherited ImlCaixa_Padrao: TImage
      Left = 379
    end
    inherited tb97Atalho: TToolbar97
      Left = 0
      DockPos = 0
      inherited ToolBarsep973: TToolbarSep97
        Blank = False
      end
      inherited sepCM2: TToolbarSep97
        Blank = False
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 272
    Top = 40
    ClientAreaHeight = 67
    ClientAreaWidth = 411
    inherited pnlTextoFluxOper: TPanel
      Width = 411
      Height = 36
      inherited Bevel1: TBevel
        Top = 13
        Width = 411
      end
      inherited Panel1: TPanel
        Top = 17
        Width = 411
        Height = 19
        inherited DBMemo1: TDBMemo
          Width = 405
          Height = 13
        end
      end
      inherited pnldbEditFluxo: TPanel
        Width = 411
        Height = 13
        inherited wwDBEdit1: TwwDBEdit
          Height = 7
        end
      end
    end
    inherited Panel2: TPanel
      Width = 411
      object Button1: TButton
        Left = 176
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 2
      end
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 480
    Width = 884
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
        Text = '12/03/2008 12:46'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 136
    Top = 88
  end
  inherited mnu: TMainMenu
    Left = 32
    Top = 88
    inherited mnuSistema: TMenuItem
      Caption = 'Sistema'
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object mnuParamCAF: TMenuItem [1]
          Caption = 'Parâmetros do Patrimônio'
          OnClick = mnuParamCAFClick
        end
      end
      object Ferramentas1: TMenuItem [4]
        Caption = 'Ferramentas'
        object mnuBemXimovel: TMenuItem
          Caption = 'Ajuste: Cadastro de Bens por Imóvel'
          HelpContext = 540086
          OnClick = mnuBemXimovelClick
        end
        object miAjuste: TMenuItem
          Caption = 'Ajuste: Saldo Contábil de Imóvel Baixado'
          OnClick = miAjusteClick
        end
        object miAjusteImplanta: TMenuItem
          Caption = 'Ajuste: Saldo de Implantação'
          OnClick = miAjusteImplantaClick
        end
        object N47: TMenuItem
          Caption = '-'
        end
        object mnuCriaGrupoRateio: TMenuItem
          Caption = 'Criar / Atualizar Grupos de Imóveis'
          OnClick = mnuCriaGrupoRateioClick
        end
        object mnuUtilVerificaMenu: TMenuItem
          Caption = 'Verifica erros Menu SAD'
          Enabled = False
          Visible = False
          OnClick = mnuUtilVerificaMenuClick
        end
        object N23: TMenuItem
          Caption = '-'
          Enabled = False
          Visible = False
        end
        object mnuRecalculoCAF: TMenuItem
          Caption = 'Reconstrução de Saldos'
          HelpContext = 540087
          OnClick = mnuRecalculoCAFClick
        end
        object mnuRecomposicao: TMenuItem
          Caption = 'Recomposição / Recálculo'
          Enabled = False
          Visible = False
          object mnuRecomposicaoCarteiraRecDes: TMenuItem
            Caption = 
              'Recomposição dos Movimentos das Carteiras de Investimento - Rece' +
              'itas e Despesas'
            Enabled = False
            Visible = False
          end
          object mnuRecomposicaoCarteiraCAF: TMenuItem
            Caption = 
              'Recomposição dos Movimentos das Carteiras de Investimento - Movi' +
              'mentações do Ativo Fixo'
            Enabled = False
            Visible = False
          end
          object N38: TMenuItem
            Caption = '-'
            Enabled = False
            Visible = False
          end
          object N22: TMenuItem
            Caption = '-'
            Enabled = False
            Visible = False
          end
          object mnuRecalculoCarteira: TMenuItem
            Caption = 'Recálculo dos Saldos das Carteiras de Investimento'
            Enabled = False
            Visible = False
          end
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N10: TMenuItem
          Caption = '-'
        end
      end
    end
    object Movimentacoes: TMenuItem [1]
      Caption = 'Movimentações'
      HelpContext = 540002
      object Imoveis1: TMenuItem
        Caption = 'Imóveis'
        HelpContext = 540003
        object mnuAquisicaoVista: TMenuItem
          Caption = 'Aquisição à Vista'
          HelpContext = 540004
          OnClick = mnuAquisicaoVistaClick
        end
        object mnuAlienacaoVista: TMenuItem
          Caption = 'Alienação à Vista'
          HelpContext = 540005
          OnClick = mnuAlienacaoVistaClick
        end
        object mnuAcrescimoValor: TMenuItem
          Caption = 'Acréscimo de Valor'
          HelpContext = 540006
          OnClick = mnuAcrescimoValorClick
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object mnuDepreciacao: TMenuItem
          Caption = 'Depreciação'
          HelpContext = 540007
          OnClick = mnuDepreciacaoClick
        end
        object mnuDesfazDepreciacao: TMenuItem
          Caption = 'Desfazer Depreciação'
          HelpContext = 540008
          OnClick = mnuDesfazDepreciacaoClick
        end
        object mnuInicioDepreciacao: TMenuItem
          Caption = 'Define Início de Depreciação'
          HelpContext = 540070
          OnClick = mnuInicioDepreciacaoClick
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object mnuDesmembramento: TMenuItem
          Caption = 'Desmembramento'
          HelpContext = 540009
          OnClick = mnuDesmembramentoClick
        end
        object mnuDesfazDesmembramento: TMenuItem
          Caption = 'Desfazer Desmembramento'
          HelpContext = 540010
          OnClick = mnuDesfazDesmembramentoClick
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object mnuRemembramento: TMenuItem
          Caption = 'Remembramento'
          HelpContext = 540074
          OnClick = mnuRemembramentoClick
        end
        object mnuDesfazRemembramento: TMenuItem
          Caption = 'Desfazer Remembramento'
          HelpContext = 540092
          OnClick = mnuDesfazRemembramentoClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object mnuReavaliacao: TMenuItem
          Caption = 'Reavaliação'
          HelpContext = 540011
          OnClick = mnuReavaliacaoClick
        end
        object mnuDesfazReavaliacao: TMenuItem
          Caption = 'Desfazer Reavaliação'
          HelpContext = 540012
          OnClick = mnuDesfazReavaliacaoClick
        end
        object mnuRetificacaodeReavaliaocao: TMenuItem
          Caption = 'Retificação de Reavaliação'
          HelpContext = 540075
          OnClick = mnuRetificacaodeReavaliaocaoClick
        end
        object mnuDesfazerRetificacao: TMenuItem
          Caption = 'Desfazer Retificação'
          HelpContext = 540072
          OnClick = mnuDesfazerRetificacaoClick
        end
        object N21: TMenuItem
          Caption = '-'
        end
        object mnuTransferenciaGrupo: TMenuItem
          Caption = 'Transferência'
          HelpContext = 640032
          OnClick = mnuTransferenciaGrupoClick
        end
        object mnuDesfazTransferencia: TMenuItem
          Caption = 'Desfazer Transferência'
          HelpContext = 540073
          OnClick = mnuDesfazTransferenciaClick
        end
        object N15: TMenuItem
          Caption = '-'
        end
        object BaixaIndividualdeBem1: TMenuItem
          Caption = 'Baixa Individual de Bem'
          HelpContext = 540069
          OnClick = BaixaIndividualdeBem1Click
        end
      end
      object Obras2: TMenuItem
        Caption = 'Obras'
        HelpContext = 540014
        object mnuLancaObras: TMenuItem
          Caption = 'Lançamentos de Despesas'
          HelpContext = 540015
          OnClick = mnuLancaObrasClick
        end
        object mnuLancObraReceita: TMenuItem
          Caption = 'Lançamento de Ressarcimentos'
          HelpContext = 540066
          OnClick = mnuLancObraReceitaClick
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object mnuEncerraObra: TMenuItem
          Caption = 'Encerramento'
          HelpContext = 540016
          OnClick = mnuEncerraObraClick
        end
        object mnuDesfazEncerraObra: TMenuItem
          Caption = 'Desfazer Encerramento'
          HelpContext = 540017
          OnClick = mnuDesfazEncerraObraClick
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object mnuDesmembraObra: TMenuItem
          Caption = 'Desmembramento'
          HelpContext = 540067
          OnClick = mnuDesmembraObraClick
        end
        object mnuDesfazDesmembraObra: TMenuItem
          Caption = 'Desfazer Desmembramento'
          HelpContext = 540068
          OnClick = mnuDesfazDesmembraObraClick
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuIntegra: TMenuItem
        Caption = 'Integração Financeira'
        HelpContext = 640027
        OnClick = mnuIntegraClick
      end
      object mnuAcrescimoDesconto: TMenuItem
        Caption = 'Acréscimo e Desconto'
        HelpContext = 640021
        OnClick = mnuAcrescimoDescontoClick
      end
      object mnuAlteraAP: TMenuItem
        Caption = 'Alteração de AP'
        HelpContext = 540076
        OnClick = mnuAlteraAPClick
      end
      object mnuDesfazOperacoes: TMenuItem
        Caption = 'Consultar / Excluir Movimentações'
        HelpContext = 540019
        OnClick = mnuDesfazOperacoesClick
      end
    end
    inherited mnuCadastro: TMenuItem
      object mnuAdministradora: TMenuItem
        Caption = 'Administradoras'
        HelpContext = 640034
        OnClick = mnuAdministradoraClick
      end
      object mnuCartorio: TMenuItem
        Caption = 'Cartórios'
        HelpContext = 640035
        OnClick = mnuCartorioClick
      end
      object mnuCompradorLocatario: TMenuItem
        Caption = 'Compradores / Locatários'
        HelpContext = 640036
        OnClick = mnuCompradorLocatarioClick
      end
      object mnuFiador: TMenuItem
        Caption = 'Fiadores'
        HelpContext = 640037
        OnClick = mnuFiadorClick
      end
      object mnuProponenteProprietario: TMenuItem
        Caption = 'Proponentes / Proprietários'
        HelpContext = 640038
        OnClick = mnuProponenteProprietarioClick
      end
      object mnuResponsavel: TMenuItem
        Caption = 'Responsáveis'
        HelpContext = 640039
        OnClick = mnuResponsavelClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuTipoImovel: TMenuItem
        Caption = 'Tipos de Imóvel'
        HelpContext = 640045
        OnClick = mnuTipoImovelClick
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object TiposdeDadosComplementares1: TMenuItem
        Caption = 'Dados Complementares'
        HelpContext = 640046
        object mnuTipoDado: TMenuItem
          Caption = 'Tipos de Dados Complementares'
          HelpContext = 640047
          OnClick = mnuTipoDadoClick
        end
        object mnuTipoDadoXTipoImovel: TMenuItem
          Caption = 'Tipos de Dados Complementares por Tipo de Imóvel'
          HelpContext = 640047
          OnClick = mnuTipoDadoXTipoImovelClick
        end
        object N40: TMenuItem
          Caption = '-'
          Enabled = False
          Visible = False
        end
        object mnuDadoXImovel: TMenuItem
          Caption = 'Dados Complementares de Imóveis'
          Enabled = False
          HelpContext = 640049
          Visible = False
          OnClick = mnuDadoXImovelClick
        end
        object mnuDadoXProposta: TMenuItem
          Caption = 'Dados Complementares de Propostas'
          Enabled = False
          HelpContext = 640050
          Visible = False
          OnClick = mnuDadoXPropostaClick
        end
        object mnuDadoXUnidAut: TMenuItem
          Caption = 'Dados Complementares de Unidades Autônomas'
          Enabled = False
          HelpContext = 640051
          Visible = False
          OnClick = mnuDadoXUnidAutClick
        end
      end
      object Indicadores: TMenuItem
        Caption = 'Indicadores'
        HelpContext = 640052
        object mnuTipoIndicador: TMenuItem
          Caption = 'Tipos de Indicador'
          HelpContext = 640053
          OnClick = mnuTipoIndicadorClick
        end
        object mnuTipoIndicadorXTipoImovel: TMenuItem
          Caption = 'Tipos de Indicador por Tipo de Imóvel'
          HelpContext = 640054
          OnClick = mnuTipoIndicadorXTipoImovelClick
        end
        object IndicadoresporImvel1: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuIndicadorXImovel: TMenuItem
          Caption = 'Indicadores Apurados por Imóvel'
          Enabled = False
          HelpContext = 640056
          Visible = False
        end
        object mnuIndicadorXUnidAut: TMenuItem
          Caption = 'Indicadores Apurados por Unidade Autônoma'
          Enabled = False
          HelpContext = 640057
          Visible = False
        end
      end
      object ReceitaseDespesas1: TMenuItem
        Caption = 'Receitas e Despesas'
        HelpContext = 640058
        object mnuTiposRecDesp: TMenuItem
          Caption = 'Tipos de Receita e Despesa'
          HelpContext = 640058
          OnClick = mnuTiposRecDespClick
        end
        object mnuParametrosIntegracao: TMenuItem
          Caption = 'Parâmetros para Integração Financeira'
          HelpContext = 540041
          OnClick = mnuParametrosIntegracaoClick
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object CadastroImovel: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666660000006
          66666666087777800666666607888878806666660E6E6E7E6066666606E6E676
          E06666660E6E6E7E6066666606E6E676E06666660E6E6E7E6066666606E6E676
          E066666608770777806666660788888800666666608778888066666666088888
          0666666666600000666666666666606666666666666660666666}
        Caption = 'Imóveis'
        HelpContext = 640067
        object mnuImovel: TMenuItem
          Caption = 'Dados Principais'
          HelpContext = 640068
          OnClick = mnuImovelClick
        end
        object mnuImovelXEvento: TMenuItem
          Caption = 'Eventos'
          HelpContext = 640070
          OnClick = mnuImovelXEventoClick
        end
        object mnuTipoEventoImovel: TMenuItem
          Caption = 'Tipos de Evento'
          HelpContext = 640101
          OnClick = mnuTipoEventoImovelClick
        end
        object N28: TMenuItem
          Caption = '-'
        end
        object mnuGrupoImovel: TMenuItem
          Caption = 'Grupos de Imóveis'
          HelpContext = 640072
          OnClick = mnuGrupoImovelClick
        end
        object N45: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuSeguroImovel: TMenuItem
          Caption = 'Seguros'
          Enabled = False
          Visible = False
        end
      end
      object Obras1: TMenuItem
        Caption = 'Obras'
        HelpContext = 540048
        object mnuDadosObra: TMenuItem
          Caption = 'Dados da Obra'
          HelpContext = 540049
          OnClick = mnuDadosObraClick
        end
        object mnuEtapaObra: TMenuItem
          Caption = 'Etapas Obras'
          HelpContext = 540050
          OnClick = mnuEtapaObraClick
        end
      end
      object N30: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object Ofertas: TMenuItem
        Caption = 'Propostas de Novos Negócios'
        Enabled = False
        HelpContext = 640078
        Visible = False
        object mnuProposta: TMenuItem
          Caption = 'Dados Principais'
          HelpContext = 640079
        end
        object N31: TMenuItem
          Caption = '-'
        end
        object mnuHistProp: TMenuItem
          Caption = 'Histórico'
          HelpContext = 640081
          OnClick = mnuHistPropClick
        end
      end
      object N8: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object Investimentos1: TMenuItem
        Caption = 'Investimentos'
        Enabled = False
        Visible = False
        object mnuCarteiraInvest: TMenuItem
          Caption = 'Carteiras de Investimento'
        end
        object mnuGestorCarteira: TMenuItem
          Caption = 'Gestores de Carteiras'
        end
        object N25: TMenuItem
          Caption = '-'
        end
        object mnuTipoOperInvest: TMenuItem
          Caption = 'Tipos de Operação'
        end
        object mnuTipoRubricaInvest: TMenuItem
          Caption = 'Tipos de Rubrica'
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object mnuTipoRubricaXTipoOper: TMenuItem
          Caption = 'Rubricas por Tipo de Operação'
        end
        object mnuPadrLancInvest: TMenuItem
          Caption = 'Padrões de Lançamento'
        end
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuBens: TMenuItem
        Caption = 'Bens'
        HelpContext = 70021
        OnClick = mnuBensClick
      end
      object mnuConjuntoBens: TMenuItem
        Caption = 'Conjunto de Bens'
        HelpContext = 70020
        OnClick = mnuConjuntoBensClick
      end
      object mnuClasseBens: TMenuItem
        Caption = 'Classe de Bens'
        HelpContext = 70017
        OnClick = mnuClasseBensClick
      end
      object mnuGruposContabeis: TMenuItem
        Caption = 'Grupos Contábeis'
        HelpContext = 70016
        OnClick = mnuGruposContabeisClick
      end
      object mnuLocalizacoes: TMenuItem
        Caption = 'Localizações'
        HelpContext = 70015
        OnClick = mnuLocalizacoesClick
      end
      object mnuParamContabil: TMenuItem
        Caption = 'Parametrização Contábil'
        HelpContext = 70018
        OnClick = mnuParamContabilClick
      end
    end
    inherited mnuConsulta: TMenuItem
      object N27: TMenuItem [3]
        Caption = '-'
      end
      inherited MnuConsPart_Padrao: TMenuItem [4]
        Caption = 'Consulta Geral de &Pessoas'
        Enabled = False
      end
      inherited Mnu_UsoPessoal_Padrao: TMenuItem [5]
        Visible = True
      end
      inherited Mnu_separa1_Padrao: TMenuItem [6]
      end
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 80
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Contbeis1: TMenuItem
        Caption = 'Contábeis'
        HelpContext = 540054
        object mnuConsultaCCImovel: TMenuItem
          Caption = 'Custo Contábil por Imóvel'
          HelpContext = 540055
          OnClick = mnuConsultaCCImovelClick
        end
        object mnuConsultaHistMovCAF: TMenuItem
          Caption = 'Histórico das Movimentações'
          HelpContext = 540056
          OnClick = mnuConsultaHistMovCAFClick
        end
        object mnuConsultaCCBem: TMenuItem
          Caption = 'Saldo Contábil por Bem'
          HelpContext = 540057
          OnClick = mnuConsultaCCBemClick
        end
      end
      object mnuConsultaPlanoConta: TMenuItem
        Caption = 'Plano de Contas'
        HelpContext = 640082
        OnClick = mnuConsultaPlanoContaClick
      end
      object N2: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object mnuAnaliseIndice: TMenuItem
        Caption = 'Variação de Índices'
        HelpContext = 640083
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Rentabilidade1: TMenuItem
        Caption = 'Rentabilidade'
        HelpContext = 540060
        object mnuAnaliseMapaRI: TMenuItem
          Caption = 'por Imóvel'
          Enabled = False
          Visible = False
          OnClick = mnuAnaliseMapaRIClick
        end
        object P1: TMenuItem
          Caption = 'Por Valor Investido'
          object mnuMapaSeg: TMenuItem
            Caption = 'por Segmento'
            HelpContext = 540082
            OnClick = mnuMapaSegClick
          end
          object mnuMapaRM: TMenuItem
            Caption = 'por Imóvel Mestre'
            HelpContext = 540081
            OnClick = mnuMapaRMClick
          end
          object mnuMapaRC: TMenuItem
            Caption = 'por Contrato'
            HelpContext = 540080
            OnClick = mnuMapaRCClick
          end
        end
        object d1: TMenuItem
          Caption = 'TIR'
          object mnuPorProjeto: TMenuItem
            Caption = 'por Projeto'
            HelpContext = 540085
            OnClick = mnuPorProjetoClick
          end
          object mnuTIR: TMenuItem
            Caption = 'Mapa Gerencial'
            HelpContext = 540084
            OnClick = mnuTIRClick
          end
        end
        object c1: TMenuItem
          Caption = 'Cotas'
          object mnuMapaCota: TMenuItem
            Caption = 'Mapa Gerencial'
            HelpContext = 540078
            OnClick = mnuMapaCotaClick
          end
        end
      end
      object mnuMapaTaxa: TMenuItem
        Caption = 'Taxa de Retorno'
        HelpContext = 540091
        OnClick = mnuMapaTaxaClick
      end
      object mnuCustoFinanceiro: TMenuItem
        Caption = 'Custo Financeiro'
        HelpContext = 540065
        OnClick = mnuCustoFinanceiroClick
      end
    end
    inherited mnuRAD: TMenuItem
      HelpContext = 143
      inherited mnuRADExecutar: TMenuItem
        HelpContext = 142
      end
      inherited mnuGerarProcesso_Padrao: TMenuItem
        HelpContext = 144
      end
      inherited mnuRADConsultar: TMenuItem
        HelpContext = 98
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 136
    Top = 136
  end
  inherited ImlPadrao: TImageList
    Top = 184
  end
  inherited AclPadrao: TActionList
    Top = 240
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
  inherited CorreioCM: TCorreioCM
    Left = 136
    Top = 40
  end
  object qryIntegraContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  P.MASCARA, C.PLANO, C.PACESTORNA '
      'FROM '
      '  PLANO P, PARAMCONTAB C '
      'WHERE '
      '  ( C.IDPESSOA =:EMPRESAPROP ) AND'
      '  ( P.PLANO=C.PLANO )')
    ValidateWithMask = True
    Left = 120
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryIntegraContabMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
    object qryIntegraContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PARAMCONTAB.PLANO'
    end
    object qryIntegraContabPACESTORNA: TStringField
      FieldName = 'PACESTORNA'
      Origin = 'PARAMCONTAB.PACESTORNA'
      Size = 1
    end
  end
  object qryTipoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, DESCTIPOINVEST'
      'FROM'
      '   TIPOINVEST')
    UpdateObject = updTipoInvest
    ValidateWithMask = True
    Left = 120
    Top = 256
    object qryTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOINVEST.IDTIPOINVEST'
    end
    object qryTipoInvestDESCTIPOINVEST: TStringField
      FieldName = 'DESCTIPOINVEST'
      Origin = 'TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
  end
  object updTipoInvest: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOINVEST'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  DESCTIPOINVEST = :DESCTIPOINVEST'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST')
    InsertSQL.Strings = (
      'insert into TIPOINVEST'
      '  (IDTIPOINVEST, DESCTIPOINVEST)'
      'values'
      '  (:IDTIPOINVEST, :DESCTIPOINVEST)')
    DeleteSQL.Strings = (
      'delete from TIPOINVEST'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST')
    Left = 120
    Top = 240
  end
  object qryContaInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(IDTIPOINVEST)'
      'FROM'
      '   TIPOINVEST')
    ValidateWithMask = True
    Left = 192
    Top = 40
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PG.USACRESPON, PG.USAABC, PG.CODCENTRORESPON,'
      '   PG.UNIDNEGOC, PG.MOEDACORRENTE,'
      '   PG.IDPATRO, PG.IDPLANOPREV                             '
      ''
      'FROM'
      '   PARAMGLOBAL PG'
      ''
      'WHERE'
      '   ( PG.IDPESSOA =:PIDPESSOA )')
    ValidateWithMask = True
    Left = 120
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUSACRESPON: TStringField
      FieldName = 'USACRESPON'
      Origin = 'PARAMGLOBAL.USACRESPON'
      Size = 1
    end
    object qryParamGlobalUSAABC: TStringField
      FieldName = 'USAABC'
      Origin = 'PARAMGLOBAL.USAABC'
      Size = 1
    end
    object qryParamGlobalCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMGLOBAL.CODCENTRORESPON'
      Size = 10
    end
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
    object qryParamGlobalMOEDACORRENTE: TFloatField
      FieldName = 'MOEDACORRENTE'
      Origin = 'PARAMGLOBAL.MOEDACORRENTE'
    end
    object qryParamGlobalIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'PARAMGLOBAL.IDPATRO'
    end
    object qryParamGlobalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PARAMGLOBAL.IDPLANOPREV'
    end
  end
  object qryParamCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MASCARADESEMB'
      'FROM'
      '   PARAMCAP'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( RECPAG =:RECPAG )')
    ValidateWithMask = True
    Left = 120
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryParamCAPMASCARADESEMB: TStringField
      FieldName = 'MASCARADESEMB'
      Origin = 'PARAMCAP.MASCARADESEMB'
      Size = 15
    end
  end
  object sqlVerificaBEM: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(IDBEM) AS QTDBEM'
      'FROM BEM'
      'WHERE (IDPESSOA = :IDPESSOA)')
    ClientDataSet = cdsVerificaBEM
    Left = 310
    Top = 199
  end
  object cdsVerificaBEM: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 310
    Top = 185
  end
  object cdsCAFMoedas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 374
    Top = 161
  end
  object sqlCAFMoedas: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(MOECODIGO) AS QTD'
      'FROM CAFMOEDAS'
      'WHERE IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsCAFMoedas
    Left = 374
    Top = 175
  end
end
