inherited frmPrincipal: TfrmPrincipal
  Left = 467
  Top = 143
  Caption = 'Módulo de Treinamento'
  ClientHeight = 376
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 752
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 356
    Width = 752
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
        Text = '02/12/2013 15:43'
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
          OnClick = nmuConfigParametrosClick
        end
        inherited MnuSep2_padrao: TMenuItem
          Visible = False
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 720001
      object mnuCursos1: TMenuItem
        Caption = '&Cursos'
        HelpContext = 720002
        OnClick = mnuCursos1Click
      end
      object mnuInstrutoresInternos: TMenuItem
        Caption = '&Instrutores Internos'
        Visible = False
        OnClick = mnuInstrutoresInternosClick
      end
      object mnuOrcamento: TMenuItem
        Caption = '&Orçamento'
        HelpContext = 720003
        OnClick = mnuOrcamentoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuCadCertificado: TMenuItem
        Caption = 'Certificado'
        OnClick = mnuCadCertificadoClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuPacotesdeCursos: TMenuItem
        Caption = '&Pacotes de Cursos'
        HelpContext = 720004
        Visible = False
        OnClick = mnuPacotesdeCursosClick
      end
      object mnuGruposdeTreinamento1: TMenuItem
        Caption = '&Grupos de Treinamento'
        HelpContext = 720005
        Visible = False
        OnClick = mnuGruposdeTreinamento1Click
      end
      object mnuCursosRequeridos: TMenuItem
        Caption = 'Cursos &Requeridos por Cargo'
        HelpContext = 720006
        Visible = False
        OnClick = mnuCursosRequeridosClick
      end
      object mnuTiposdeCursos: TMenuItem
        Caption = '&Tipos de Cursos'
        HelpContext = 720007
        Visible = False
        OnClick = mnuTiposdeCursosClick
      end
      object MnuSiglas: TMenuItem
        Caption = '&Siglas'
        OnClick = MnuSiglasClick
      end
      object mnuFatoresdeAvaliacaodosCursos: TMenuItem
        Caption = '&Fatores de Avaliação de Treinamento'
        HelpContext = 720008
        OnClick = mnuFatoresdeAvaliacaodosCursosClick
      end
      object mnuCadEscalasdeConceitos: TMenuItem
        Caption = '&Escalas de Conceitos'
        OnClick = mnuCadEscalasdeConceitosClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuCargos1: TMenuItem
        Caption = 'C&argos'
        HelpContext = 720009
        Visible = False
        OnClick = mnuCargos1Click
      end
      object mnuAssinatura: TMenuItem
        Caption = 'Assinaturas'
        OnClick = mnuAssinaturaClick
      end
      object mnuEmpresasEntidades: TMenuItem
        Caption = '&Empresas/Entidades'
        HelpContext = 720010
        OnClick = mnuEmpresasEntidadesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCadLocalizacoes: TMenuItem
        Caption = '&Localizações'
        Visible = False
        OnClick = mnuCadLocalizacoesClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 720011
      object mnuRegistrodeTreinamento: TMenuItem
        Caption = '&Registro de Incentivos'
        HelpContext = 720012
        OnClick = mnuRegistrodeTreinamentoClick
      end
      object mnuRegistroColetivodeTreinamento: TMenuItem
        Caption = 'Registro de &Treinamento'
        HelpContext = 720013
        OnClick = mnuRegistroColetivodeTreinamentoClick
      end
      object mnuListadePresenca: TMenuItem
        Caption = '&Lista de Presença'
        OnClick = mnuListadePresencaClick
      end
      object mnuRegAvalParticipantes: TMenuItem
        Caption = 'Registro das &Avaliações dos Participantes'
        OnClick = mnuRegAvalParticipantesClick
      end
      object mnuRegCertificado: TMenuItem
        Caption = 'Registro de Certificado'
        OnClick = mnuRegCertificadoClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuHistTreinamento: TMenuItem
        Caption = '&Histórico de Treinamento'
        HelpContext = 720014
        OnClick = mnuHistTreinamentoClick
      end
      object mnuConsultaFatoresAvalDesemp: TMenuItem
        Caption = '&Fatores de Avaliação de Desempenho'
        OnClick = mnuConsultaFatoresAvalDesempClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 720015
      object mnuEstatisticaTrein: TMenuItem
        Caption = '&Estatística de Treinamento'
        HelpContext = 720019
        OnClick = mnuEstatisticaTreinClick
      end
      object mnuGraficoAvaliacoesdosCursos: TMenuItem
        Caption = '&Avaliações dos Cursos'
        OnClick = mnuGraficoAvaliacoesdosCursosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AclPadrao: TActionList
    Top = 136
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 256
    Top = 184
  end
end
