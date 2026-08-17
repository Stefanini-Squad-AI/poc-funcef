inherited frmPrincipal: TfrmPrincipal
  Left = 104
  Top = 142
  Caption = 'RH - Módulo Básico'
  ClientHeight = 338
  ClientWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 580
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 143
    Top = 100
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 318
    Width = 580
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
        Text = '07/01/2005 14:02'
        TextOptions.Alignment = taLeftJustify
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
  object VeSalario: TPanel [4]
    Left = 471
    Top = 42
    Width = 94
    Height = 22
    Caption = 'VeSalario'
    TabOrder = 4
    Visible = False
  end
  inherited mnu: TMainMenu
    Left = 234
    Top = 45
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object mnuEstabelecimentosporUsuario: TMenuItem [1]
          Caption = '&Estabelecimentos por Usuário'
          HelpContext = 690001
          OnClick = mnuEstabelecimentosporUsuarioClick
        end
        object mnuCentrosdeCustoporUsuario: TMenuItem [2]
          Caption = '&Centros de Custo por Usuário'
          HelpContext = 690002
          OnClick = mnuCentrosdeCustoporUsuarioClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N7: TMenuItem
          Caption = '-'
        end
        object mnuQueries: TMenuItem
          Caption = '&Queries Diversas'
          HelpContext = 690003
          OnClick = mnuQueriesClick
        end
        object mnuImportacaodeDados: TMenuItem
          Caption = '&Importação Direta de Dados'
          HelpContext = 690004
          OnClick = mnuImportacaodeDadosClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 690005
      object mnuPessoal1: TMenuItem
        Caption = '&Pessoal'
        HelpContext = 690006
        OnClick = mnuPessoal1Click
      end
      object mnuCadHstAltCad: TMenuItem
        Caption = 'Histórico de &Alterações Cadastrais'
        HelpContext = 690007
        OnClick = mnuCadHstAltCadClick
      end
      object mnuSituacaoFuncional1: TMenuItem
        Caption = 'Situação &Funcional'
        HelpContext = 690008
        OnClick = mnuSituacaoFuncional1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuCargos1: TMenuItem
        Caption = '&Cargos'
        HelpContext = 690009
        OnClick = mnuCargos1Click
      end
      object mnuProfissoes1: TMenuItem
        Caption = 'Pro&fissões'
        HelpContext = 690010
        OnClick = mnuProfissoes1Click
      end
      object mnuGrausdeInstrucao1: TMenuItem
        Caption = '&Graus de Instrução'
        HelpContext = 690011
        OnClick = mnuGrausdeInstrucao1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuEstabelecimentos: TMenuItem
        Caption = '&Estabelecimentos'
        HelpContext = 690012
        OnClick = mnuEstabelecimentosClick
      end
      object mnuSindicatos1: TMenuItem
        Caption = '&Sindicatos'
        HelpContext = 690013
        OnClick = mnuSindicatos1Click
      end
      object mnuSegmentos: TMenuItem
        Caption = 'Segmentos (&Ramos de Atividade)'
        HelpContext = 690014
        OnClick = mnuSegmentosClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuMotivos1: TMenuItem
        Caption = '&Motivos e Ações'
        HelpContext = 690015
        OnClick = mnuMotivos1Click
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 690016
      object mnuCartasComunicados1: TMenuItem
        Caption = '&Cartas ou Comunicados'
        HelpContext = 690017
        OnClick = mnuCartasComunicados1Click
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuBrowsedoCadastro1: TMenuItem
        Caption = '&Browse do Cadastro de Pessoas'
        HelpContext = 690018
        OnClick = mnuBrowsedoCadastro1Click
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 690019
      object mnuEstatisticasdoQuadro: TMenuItem
        Caption = '&Estatísticas do Quadro de Pessoal'
        HelpContext = 690020
        OnClick = mnuEstatisticasdoQuadroClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 126
    Top = 49
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
  inherited CorreioCM: TCorreioCM
    Left = 178
    Top = 45
  end
end
