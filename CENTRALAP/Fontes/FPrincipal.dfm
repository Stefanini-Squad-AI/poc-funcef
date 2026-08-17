inherited frmPrincipal: TfrmPrincipal
  Left = 33
  Top = 43
  HelpContext = 230001
  Caption = 'Central de Atendimento ao Público '
  ClientHeight = 453
  ClientWidth = 863
  Position = poScreenCenter
  Visible = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 863
    inherited fcLabel2: TfcLabel
      Left = 643
      Top = 1
      OnClick = fcLabel2Click
    end
    inherited ImlCaixa_Padrao: TImage
      Left = 430
    end
    inherited tb97Atalho: TToolbar97
      inherited sepCM2: TToolbarSep97
        Left = 170
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 178
      end
      object BtnAtende: TToolbarButton97
        Left = 200
        Top = 0
        Width = 23
        Height = 22
        Hint = '&Atendimento'
        DisplayMode = dmGlyphOnly
        Caption = '&Atender'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888888888888888888800008870
          00000000000888880000880B8B8B8B8B8B30888800008808B8B8B8B8B8330888
          0000880B8B8B8B8B8B3330880000880FFFFFFFFFFF33308800008808B8B0B0B0
          B8B33088000088808B8B0B0B8B8330880000870008B0B0B0B8B8000700008033
          308B8B8B8B803330111180FB30B0000008033330000080BF308033330B03BF30
          8888880BF3008BFB300BFB08000088800FBFBFBFBFBF70880000888880000000
          0000888800008888888888888888888800008888888888888888888800008888
          88888888888888880000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Atendimento1Click
      end
      object ToolbarSep971: TToolbarSep97
        Left = 140
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 216
    Top = 80
    ClientAreaHeight = 139
    ClientAreaWidth = 419
    inherited pnlTextoFluxOper: TPanel
      Width = 419
      Height = 108
      inherited Bevel1: TBevel
        Width = 419
      end
      inherited Panel1: TPanel
        Width = 419
        Height = 80
        inherited DBMemo1: TDBMemo
          Width = 413
          Height = 74
        end
      end
      inherited pnldbEditFluxo: TPanel
        Width = 419
      end
    end
    inherited Panel2: TPanel
      Width = 419
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 433
    Width = 863
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
        Text = '25/05/2012 08:56'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 169
  end
  inherited mnu: TMainMenu
    Left = 171
    Top = 152
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    object MnuOperacoes: TMenuItem [1]
      Caption = '&Operações'
      HelpContext = 190001
      object Atendimento1: TMenuItem
        Caption = 'A&tendimento'
        HelpContext = 190002
        OnClick = Atendimento1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object MnuOperacoesRubs: TMenuItem
        Caption = 'R.U.B.S.'
        HelpContext = 190003
        object Manuteno1: TMenuItem
          Caption = '&Manutenção'
          HelpContext = 190004
          OnClick = Manuteno1Click
        end
        object CartadeAviso1: TMenuItem
          Caption = '&Carta\Aviso'
          HelpContext = 190005
          object Configurao1: TMenuItem
            Caption = '&Configuração'
            HelpContext = 190006
            OnClick = Configurao1Click
          end
          object Emisso2: TMenuItem
            Tag = 1
            Caption = '&Emissão'
            HelpContext = 190007
            OnClick = Configurao1Click
          end
        end
        object Recadastramento1: TMenuItem
          Caption = 'Recadastramento'
          HelpContext = 190008
          OnClick = Recadastramento1Click
        end
        object ConfiguraodoModelodeRUBS1: TMenuItem
          Caption = 'Configuração do Modelo de RUBS'
          HelpContext = 190041
          OnClick = ConfiguraodoModelodeRUBS1Click
        end
      end
      object Firio1: TMenuItem
        Caption = 'Protocolo'
        HelpContext = 190009
        OnClick = Firio1Click
      end
      object RecebimentoDocs1: TMenuItem
        Caption = 'Receb. Documentos'
        HelpContext = 190010
        OnClick = RecebimentoDocs1Click
      end
    end
    object TotalPrev1: TMenuItem [3]
      Caption = '&Total Prev'
      Visible = False
      object Previdencirio1: TMenuItem
        Caption = '&Previdenciário'
        object Inscrio3: TMenuItem
          Caption = '&Inscrição'
        end
        object EstimativadeBenefcios1: TMenuItem
          Caption = '&Simulação de Benefícios'
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object ConsultadeContribuiesdoParticipante1: TMenuItem
          Caption = 'C&onsulta de Contribuições do Participante'
        end
        object ConsultadeBenefciosdoParticipante1: TMenuItem
          Caption = 'Co&nsulta de Benefícios do Participante'
        end
        object ConsultadeHistricodeMovimentaodeReservas1: TMenuItem
          Caption = 'Consul&ta de Histórico de Movimentação de Reservas'
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object ExtratodeReservas1: TMenuItem
          Caption = '&Extrato de Reservas'
        end
      end
      object Assistencial1: TMenuItem
        Caption = 'A&ssistencial'
        object Inscrio2: TMenuItem
          Caption = '&Inscrição '
        end
        object EstimativadeContribuies1: TMenuItem
          Caption = '&Estimativa de Contribuições'
        end
        object BeneficirioseContribuies1: TMenuItem
          Caption = '&Beneficiários e Contribuições'
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object ContribuiesdoParticipante1: TMenuItem
          Caption = 'Consulta de C&ontribuições do Participante'
        end
        object ConsultadeEventos1: TMenuItem
          Caption = 'Co&nsulta de Eventos '
        end
        object EstatsticadeMassa2: TMenuItem
          Caption = 'E&statística de Massa'
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object RelatriodePartcicpantesAssistenciais1: TMenuItem
          Caption = '&Relatório de Participantes Assistenciais'
        end
      end
      object FolhadePagamento1: TMenuItem
        Caption = '&Benefícios'
        object ConsultadeBenefcios1: TMenuItem
          Caption = '&Consulta de Benefícios'
        end
        object ConsultaderubricassalariaisdeAssistidos1: TMenuItem
          Caption = 'C&onsulta de Rubricas Salariais de Assistidos'
        end
        object Coonsultaderubricassalariais1: TMenuItem
          Caption = 'C&onsulta de Rubricas Salariais de Participantes'
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object ContraCheque1: TMenuItem
          Caption = '&Emissão de Contra-Cheque'
        end
      end
      object Emprstimo1: TMenuItem
        Caption = '&Empréstimo'
        object Inscrio1: TMenuItem
          Caption = '&Inscrição'
        end
        object Contrato1: TMenuItem
          Caption = '&Contrato'
        end
        object SimulaodeParcelas1: TMenuItem
          Caption = '&Simulação de Parcelas'
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object EstatsticadeMassa1: TMenuItem
          Caption = '&Estatística de Massa'
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object RelatriodeParticipantesemDbito1: TMenuItem
          Caption = '&Relatório de Participantes em Débito'
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 190011
      OnClick = mnuCadastroClick
      object FormadeAtendimento1: TMenuItem
        Caption = '&Forma de  Atendimento'
        HelpContext = 190012
        OnClick = FormadeAtendimento1Click
      end
      object CPUdeAtendimento1: TMenuItem
        Caption = '&CPU de Atendimento'
        HelpContext = 190042
        OnClick = CPUdeAtendimento1Click
      end
      object LocaisdeAtendimento1: TMenuItem
        Caption = '&Locais de Atendimento'
        HelpContext = 190013
        OnClick = LocaisdeAtendimento1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object MnuGrupoAssunto: TMenuItem
        Caption = 'Grupo de Assuntos'
        HelpContext = 190014
        OnClick = MnuGrupoAssuntoClick
      end
      object RespostasPadro1: TMenuItem
        Caption = '&Respostas Padrão'
        HelpContext = 190015
        OnClick = RespostasPadro1Click
      end
      object MnuSep2: TMenuItem
        Caption = '-'
      end
      object f1: TMenuItem
        Caption = '&Protocolo'
        HelpContext = 190016
        object Assunto2: TMenuItem
          Caption = '&Grupo'
          HelpContext = 190017
          OnClick = Assunto2Click
        end
        object ComplementodoAssunto1: TMenuItem
          Caption = '&Complemento do Grupo'
          Visible = False
          OnClick = ComplementodoAssunto1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnuRubs: TMenuItem
        Caption = 'R.U.B.S.'
        HelpContext = 190018
        object FormatodeDocumentosdaRUB1: TMenuItem
          Caption = 'Cadastro de &Arquivos'
          HelpContext = 190019
          OnClick = FormatodeDocumentosdaRUB1Click
        end
        object Ca1: TMenuItem
          Caption = 'Cadastro de &Serviços'
          HelpContext = 190020
          OnClick = Ca1Click
        end
        object CadastrodeDocumentos1: TMenuItem
          Caption = 'Cadastro de &Documentos'
          HelpContext = 190021
          OnClick = CadastrodeDocumentos1Click
        end
        object TMenuItem
          Caption = '-'
          Hint = 'MnuSep'
        end
        object TiposdeRecebimentos1: TMenuItem
          Caption = 'Tipos de &Recebimentos'
          HelpContext = 190022
          OnClick = TiposdeRecebimentos1Click
        end
        object SituaodoBeneficionaRUB1: TMenuItem
          Caption = '&Situação do Beneficio'
          HelpContext = 190023
          OnClick = SituaodoBeneficionaRUB1Click
        end
        object DescriodoBenefcio1: TMenuItem
          Caption = 'Descrição do Benefício'
          HelpContext = 190024
          OnClick = DescriodoBenefcio1Click
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object BenefcioXSituao1: TMenuItem
          Caption = 'Situação X Benefício'
          HelpContext = 190025
          OnClick = BenefcioXSituao1Click
        end
        object DocumentosporBenefcios1: TMenuItem
          Caption = 'D&ocumentos X Benefício'
          HelpContext = 190026
          OnClick = DocumentosporBenefcios1Click
        end
        object TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1: TMenuItem
          Caption = '&Termos X Benefício'
          HelpContext = 190027
          OnClick = TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click
        end
        object TemoXDocumento1: TMenuItem
          Caption = '&Termo X Documentos'
          Enabled = False
          HelpContext = 190028
        end
        object N15: TMenuItem
          Caption = '-'
        end
        object ParmetrosdeEmisso1: TMenuItem
          Caption = 'Parâmetros de Emissão'
          HelpContext = 190029
          OnClick = ParmetrosdeEmisso1Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Assunto1: TMenuItem
        Caption = '&Assunto'
        HelpContext = 190030
        OnClick = Assunto1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        OnClick = nil
        object EstatsticadeAtendimentos1: TMenuItem
          Caption = 'E&statística de Atendimentos'
          HelpContext = 190032
          OnClick = EstatsticadeAtendimentos1Click
        end
      end
      inherited MnuConsPart_Padrao: TMenuItem [3]
        Caption = '&Consulta Geral de Pessoa'
        Visible = True
      end
      inherited Mnu_UsoPessoal_Padrao: TMenuItem [4]
      end
      object Etiquetas1: TMenuItem [5]
        Caption = '&Etiquetas'
        HelpContext = 190034
        object Configura1: TMenuItem
          Caption = 'Configura'
          HelpContext = 190035
          OnClick = Configura1Click
        end
        object Imprime1: TMenuItem
          Caption = 'Imprime'
          HelpContext = 190036
          OnClick = Imprime1Click
        end
      end
      inherited Mnu_separa1_Padrao: TMenuItem [6]
      end
      object ExtratodeMovimentodeReserva: TMenuItem [7]
        Caption = 'E&xtrato de Movimentação de Reserva'
        OnClick = ExtratodeMovimentodeReservaClick
      end
      object SegundaViadeContraCheque1: TMenuItem [8]
        Caption = 'Segunda Via de Contra-Cheque'
        HelpContext = 190033
        OnClick = SegundaViadeContraCheque1Click
      end
      object InformedeRendimentosPF1: TMenuItem [9]
        Caption = '&Informe de Rendimentos PF'
        HelpContext = 190037
        OnClick = InformedeRendimentosPF1Click
      end
      object Atendimentos1: TMenuItem [10]
        Caption = '&Atendimentos'
        HelpContext = 190038
        OnClick = Atendimentos1Click
      end
      object MnuConsRubs: TMenuItem [11]
        Caption = 'R.U.B.S'
        HelpContext = 190039
        OnClick = MnuConsRubsClick
      end
      object Firio2: TMenuItem [12]
        Caption = 'Protocolo'
        HelpContext = 190040
        OnClick = Firio2Click
      end
      object mnExtratoIndividual: TMenuItem
        Caption = 'Extrato Individual'
        OnClick = mnExtratoIndividualClick
      end
    end
    object AutoAtendimento1: TMenuItem [7]
      Caption = 'Auto-A&tendimento'
      HelpContext = 190043
      object Alteraodesenhas1: TMenuItem
        Caption = 'Alteração de &Senhas'
        HelpContext = 4650013
        OnClick = Alteraodesenhas1Click
      end
      object ExportaodeSenhas1: TMenuItem
        Caption = 'E&xportação de Senhas'
        HelpContext = 4650014
        OnClick = ExportaodeSenhas1Click
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 22
  end
  inherited AppPadrao: TCMApplicationEvents
    OnIdle = AppPadraoIdle
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    Left = 248
    Top = 272
  end
  inherited CorreioCM: TCorreioCM
    Left = 114
    Top = 301
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 328
    Top = 264
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDTITULAR  = ELEGPATRO.IDPESSOA '
      'ELEGPATRO.IDPESSJUR          =  PJ.IDPESSOA(+)'
      'PARTPREVPLAN.IDPESSOA(+)     = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR (+)   = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV     = PLANPREV.IDPLANOPREV(+) '
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'VWPARTICIPDEPEN.IDTITULAR  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18'
      '10'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 525
    Top = 258
  end
  object qryParamCentralAp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     FLGMUDALOCALATEND,'
      '     FLGCONFIRMADATA'
      'FROM PARAMCENTRALAP'
      '')
    ValidateWithMask = True
    Left = 448
    Top = 280
    object qryParamCentralApFLGMUDALOCALATEND: TFloatField
      FieldName = 'FLGMUDALOCALATEND'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGMUDALOCALATEND'
    end
    object qryParamCentralApFLGCONFIRMADATA: TFloatField
      FieldName = 'FLGCONFIRMADATA'
    end
  end
  object ActionList1: TActionList
    Left = 664
    Top = 65
  end
end
