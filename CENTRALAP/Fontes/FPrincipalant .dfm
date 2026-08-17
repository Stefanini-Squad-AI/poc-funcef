inherited frmPrincipal: TfrmPrincipal
  Left = 42
  Top = 108
  Caption = 'Central de Atendimento ao Público '
  ClientHeight = 339
  ClientWidth = 617
  Visible = False
  WindowState = wsMinimized
  PixelsPerInch = 96
  TextHeight = 13
  object ConsPart1: TConsPart [0]
    Left = 543
    Top = 68
    Width = 25
    Height = 25
    Glyph.Data = {
      96010000424D9601000000000000760000002800000018000000180000000100
      0400000000002001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00188888880FFF
      F0FFF0FF073888888880FFFFFF0FFFF073808888880FFFFFFFF0FF07380F8888
      80FFFF000000807380FF88880FF00000000007380FFF8880FF00000000000380
      FF0F880FF00077FFF8877030FFF080FFF00E8FF888888700FFFF0FFF00EEF888
      87477870F0FF80FF0EFF8888887477870F0F880F0EF88888888747870FF08880
      0EF88888888748870FFF88880E888F8888787F870FFF88880E888FF8888F8F87
      0FFF88880E788EFEFFF8F870FFFF888887E788FFEF8F87E0FFF08888807E7888
      FF887E0FFF0888888807E777777EE0FFF0888888888007E7E7E00FFF08888888
      88888000000FFFF088888888888888880FFFFF08888888888888888880FFF088
      8888888888888888880F08888888888888888888888088888888}
    Visible = False
  end
  inherited Dock97Top: TDock97
    Width = 617
    object ToolbarButton971: TToolbarButton97 [2]
      Left = 280
      Top = 16
      Width = 23
      Height = 22
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
    Left = 120
    Top = 32
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 319
    Width = 617
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
        Width = '200'
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
        Style = psDateTime
        Tag = 0
        Text = '20/11/2001 09:46'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 169
  end
  inherited mnu: TMainMenu
    Left = 395
    Top = 227
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    object MnuOperacoes: TMenuItem [1]
      Caption = 'Operações'
      OnClick = MnuOperacoesClick
      object Atendimento1: TMenuItem
        Caption = 'A&tendimento'
        OnClick = Atendimento1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object MnuOperacoesRubs: TMenuItem
        Caption = 'R.U.B.S.'
        object Manuteno1: TMenuItem
          Caption = '&Manutenção'
          OnClick = Manuteno1Click
        end
        object CartadeAviso1: TMenuItem
          Caption = '&Carta\Aviso'
          object Configurao1: TMenuItem
            Caption = '&Configuração'
            OnClick = Configurao1Click
          end
          object Emisso2: TMenuItem
            Tag = 1
            Caption = '&Emissão'
            OnClick = Configurao1Click
          end
        end
      end
      object Firio1: TMenuItem
        Caption = 'Protocolo'
        OnClick = Firio1Click
      end
    end
    object TotalPrev1: TMenuItem [3]
      Caption = '&Total Prev'
      Visible = False
      object Previdencirio1: TMenuItem
        Caption = '&Previdenciário'
        object Inscrio3: TMenuItem
          Caption = '&Inscrição'
          OnClick = Inscrio3Click
        end
        object EstimativadeBenefcios1: TMenuItem
          Caption = '&Simulação de Benefícios'
          OnClick = EstimativadeBenefcios1Click
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object ConsultadeContribuiesdoParticipante1: TMenuItem
          Caption = 'C&onsulta de Contribuições do Participante'
          OnClick = ConsultadeContribuiesdoParticipante1Click
        end
        object ConsultadeBenefciosdoParticipante1: TMenuItem
          Caption = 'Co&nsulta de Benefícios do Participante'
          OnClick = ConsultadeBenefciosdoParticipante1Click
        end
        object ConsultadeHistricodeMovimentaodeReservas1: TMenuItem
          Caption = 'Consul&ta de Histórico de Movimentação de Reservas'
          OnClick = ConsultadeHistricodeMovimentaodeReservas1Click
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object ExtratodeReservas1: TMenuItem
          Caption = '&Extrato de Reservas'
          OnClick = ExtratodeReservas1Click
        end
      end
      object Assistencial1: TMenuItem
        Caption = 'A&ssistencial'
        object Inscrio2: TMenuItem
          Caption = '&Inscrição '
          OnClick = Inscrio2Click
        end
        object EstimativadeContribuies1: TMenuItem
          Caption = '&Estimativa de Contribuições'
          OnClick = EstimativadeContribuies1Click
        end
        object BeneficirioseContribuies1: TMenuItem
          Caption = '&Beneficiários e Contribuições'
          OnClick = BeneficirioseContribuies1Click
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object ContribuiesdoParticipante1: TMenuItem
          Caption = 'Consulta de C&ontribuições do Participante'
          OnClick = ContribuiesdoParticipante1Click
        end
        object ConsultadeEventos1: TMenuItem
          Caption = 'Co&nsulta de Eventos '
          OnClick = ConsultadeEventos1Click
        end
        object EstatsticadeMassa2: TMenuItem
          Caption = 'E&statística de Massa'
          OnClick = EstatsticadeMassa2Click
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object RelatriodePartcicpantesAssistenciais1: TMenuItem
          Caption = '&Relatório de Participantes Assistenciais'
          OnClick = RelatriodePartcicpantesAssistenciais1Click
        end
      end
      object FolhadePagamento1: TMenuItem
        Caption = '&Benefícios'
        object ConsultadeBenefcios1: TMenuItem
          Caption = '&Consulta de Benefícios'
          OnClick = ConsultadeBenefcios1Click
        end
        object ConsultaderubricassalariaisdeAssistidos1: TMenuItem
          Caption = 'C&onsulta de Rubricas Salariais de Assistidos'
          OnClick = ConsultaderubricassalariaisdeAssistidos1Click
        end
        object Coonsultaderubricassalariais1: TMenuItem
          Caption = 'C&onsulta de Rubricas Salariais de Participantes'
          OnClick = Coonsultaderubricassalariais1Click
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object ContraCheque1: TMenuItem
          Caption = '&Emissão de Contra-Cheque'
          OnClick = ContraCheque1Click
        end
      end
      object Emprstimo1: TMenuItem
        Caption = '&Empréstimo'
        object Inscrio1: TMenuItem
          Caption = '&Inscrição'
          OnClick = Inscrio1Click
        end
        object Contrato1: TMenuItem
          Caption = '&Contrato'
          OnClick = Contrato1Click
        end
        object SimulaodeParcelas1: TMenuItem
          Caption = '&Simulação de Parcelas'
          OnClick = SimulaodeParcelas1Click
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object EstatsticadeMassa1: TMenuItem
          Caption = '&Estatística de Massa'
          OnClick = EstatsticadeMassa1Click
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object RelatriodeParticipantesemDbito1: TMenuItem
          Caption = '&Relatório de Participantes em Débito'
          OnClick = RelatriodeParticipantesemDbito1Click
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      OnClick = mnuCadastroClick
      object FormadeAtendimento1: TMenuItem
        Caption = '&Forma de  Atendimento'
        OnClick = FormadeAtendimento1Click
      end
      object LocaisdeAtendimento1: TMenuItem
        Caption = '&Locais de Atendimento'
        OnClick = LocaisdeAtendimento1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object MnuGrupoAssunto: TMenuItem
        Caption = 'Grupo de Assuntos'
        OnClick = MnuGrupoAssuntoClick
      end
      object RespostasPadro1: TMenuItem
        Caption = '&Respostas Padrão'
        OnClick = RespostasPadro1Click
      end
      object MnuSep2: TMenuItem
        Caption = '-'
      end
      object f1: TMenuItem
        Caption = '&Protocolo'
        object Assunto2: TMenuItem
          Caption = '&Grupo'
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
        object FormatodeDocumentosdaRUB1: TMenuItem
          Caption = 'Cadastro de &Arquivos'
          OnClick = FormatodeDocumentosdaRUB1Click
        end
        object Ca1: TMenuItem
          Caption = 'Cadastro de &Serviços'
          OnClick = Ca1Click
        end
        object CadastrodeDocumentos1: TMenuItem
          Caption = 'Cadastro de &Documentos'
          OnClick = CadastrodeDocumentos1Click
        end
        object TMenuItem
          Caption = '-'
          Hint = 'MnuSep'
        end
        object TiposdeRecebimentos1: TMenuItem
          Caption = 'Tipos de &Recebimentos'
          OnClick = TiposdeRecebimentos1Click
        end
        object SituaodoBeneficionaRUB1: TMenuItem
          Caption = '&Situação do Beneficio'
          OnClick = SituaodoBeneficionaRUB1Click
        end
        object DescriodoBenefcio1: TMenuItem
          Caption = 'Descrição do Benefício'
          OnClick = DescriodoBenefcio1Click
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object BenefcioXSituao1: TMenuItem
          Caption = 'Situação X Benefício'
          OnClick = BenefcioXSituao1Click
        end
        object DocumentosporBenefcios1: TMenuItem
          Caption = 'D&ocumentos X Benefício'
          OnClick = DocumentosporBenefcios1Click
        end
        object TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1: TMenuItem
          Caption = '&Termos X Benefício'
          OnClick = TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click
        end
        object TemoXDocumento1: TMenuItem
          Caption = '&Termo X Documentos'
          OnClick = TemoXDocumento1Click
        end
        object N15: TMenuItem
          Caption = '-'
        end
        object ParmetrosdeEmisso1: TMenuItem
          Caption = 'Parâmetros de Emissão'
          OnClick = ParmetrosdeEmisso1Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Assunto1: TMenuItem
        Caption = '&Assunto'
        OnClick = Assunto1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      OnClick = mnuConsultaClick
      inherited Grficos2: TMenuItem
        object EstatsticadeAtendimentos1: TMenuItem
          Caption = 'E&statística de Atendimentos'
          OnClick = EstatsticadeAtendimentos1Click
        end
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = '&Elegível/Participante'
        Visible = True
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Atendimentos1: TMenuItem
        Caption = '&Atendimentos'
        OnClick = Atendimentos1Click
      end
      object MnuConsRubs: TMenuItem
        Caption = 'R.U.B.S'
        OnClick = MnuConsRubsClick
      end
      object Firio2: TMenuItem
        Caption = 'Protocolo'
        OnClick = Firio2Click
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Top = 105
  end
  inherited CorreioCM: TCorreioCM
    Left = 114
    Top = 301
  end
  inherited AppPadrao: TCMApplicationEvents
    Left = 248
    Top = 256
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 320
    Top = 248
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREV.TPPLANOPREV = '#39'F'#39' '
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 545
    Top = 224
  end
end
