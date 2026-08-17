inherited frmPrincipal: TfrmPrincipal
  Left = 118
  Top = 109
  Caption = 'RAD+ - Registro de Alçadas e Decisões'
  ClientHeight = 344
  ClientWidth = 674
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 674
    Height = 29
    inherited fcLabel2: TfcLabel
      Left = 608
      Color = clBlue
      Font.Color = clGray
    end
    inherited tb97Atalho: TToolbar97
      inherited sbtnHelp: TToolbarButton97
        Left = 47
        Width = 25
        Height = 23
      end
      inherited sbtnSair: TToolbarButton97
        Width = 25
        Height = 23
      end
      inherited sbtnFluxOper: TToolbarButton97
        Left = 102
        Width = 25
        Height = 23
      end
      inherited ToolBarsep973: TToolbarSep97
        Left = 72
      end
      inherited sbtnMudaEmpresa: TToolbarButton97
        Left = 127
        Width = 25
        Height = 23
      end
      inherited sbtnListaMensagens: TToolbarButton97
        Left = 152
        Width = 25
        Height = 23
      end
      inherited sepCM2: TToolbarSep97
        Left = 202
        Blank = False
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 177
        Width = 25
        Height = 23
      end
      inherited btnExecEtapa: TToolbarButton97
        Left = 80
      end
      inherited SbtLogin_Padrao: TToolbarButton97
        Left = 25
      end
      object ToolbarButton971: TToolbarButton97
        Left = 210
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Gerar Processo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888F88888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
          08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
          F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
          FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
          78888787F7878FF77888888B8888777888888887888877788888888888888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 2
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 100
    Top = 34
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 324
    Width = 674
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
        Text = '29/03/2007 14:37'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
    end
    object Processo1: TMenuItem [1]
      Caption = '&Processo'
      object ProcessosPendentes1: TMenuItem
        Caption = '&Processos Pendentes'
        OnClick = ProcessosPendentes1Click
      end
    end
    inherited mnuCadastro: TMenuItem
      object GrupodeResponsabilidade1: TMenuItem
        Caption = '&Grupo Aprovador'
        OnClick = GrupodeResponsabilidade1Click
      end
      object GrupodeAutorizao1: TMenuItem
        Caption = 'Grupo de &Autorização'
        OnClick = GrupodeAutorizao1Click
      end
      object GrupodeProcesso1: TMenuItem
        Caption = 'Grupo de &Processo'
        OnClick = GrupodeProcesso1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Referncias1: TMenuItem
        Caption = '&Referências'
        Visible = False
        OnClick = Referncias1Click
      end
      object Andamentos1: TMenuItem
        Caption = 'A&ndamentos'
        OnClick = Andamentos1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object TipodeProcesso1: TMenuItem
        Caption = '&Tipo de Processo'
        OnClick = TipodeProcesso1Click
      end
      object TipodeEtapa1: TMenuItem
        Caption = 'Tipo de &Etapa'
        OnClick = TipodeEtapa1Click
      end
      object FluxodeProcessos1: TMenuItem
        Caption = 'Fluxo de Processos'
        OnClick = FluxodeProcessos1Click
      end
      object EtapaxProe1: TMenuItem
        Caption = 'Etapa x &Grupo de Autorização'
        OnClick = EtapaxProe1Click
      end
      object TipoProcessoTipoEtapaxObjetosRAD1: TMenuItem
        Caption = 'Tipo Processo/Tipo Etapa x Objetos RAD'
        OnClick = TipoProcessoTipoEtapaxObjetosRAD1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object N5: TMenuItem
        Caption = '-'
      end
      object ConsultaProcessos1: TMenuItem
        Caption = '&Consulta Processos'
        OnClick = ConsultaProcessos1Click
      end
      object GernciamentodeExecuodeEtapa1: TMenuItem
        Caption = 'G&erenciamento de Execução de Etapa'
        OnClick = GernciamentodeExecuodeEtapa1Click
      end
      object GernciamentodeProcesso1: TMenuItem
        Caption = 'Gerenciamento de &Processos'
        OnClick = GernciamentodeProcesso1Click
      end
      object ProcessosPendentesxUsurio1: TMenuItem
        Caption = 'Processos Pendentes x &Usuário'
        OnClick = ProcessosPendentesxUsurio1Click
      end
    end
    inherited mnuJanela: TMenuItem
      object TMenuItem
        Caption = '-'
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
end
