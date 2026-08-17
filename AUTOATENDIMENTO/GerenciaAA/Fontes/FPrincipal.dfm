inherited frmPrincipal: TfrmPrincipal
  Left = 101
  Top = 54
  Caption = 'Gerência do Auto-Atendimento'
  ClientHeight = 562
  ClientWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 800
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
    inherited tb97Atalho: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 383
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 542
    Width = 800
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'pnlEmpresa'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '400'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'pnlUsuario'
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
        Name = 'pnlDataHora'
        Style = psHint
        Tag = 0
        Text = '11/04/2001 22:50'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuUtilitario: TMenuItem
        inherited mnuMensagensPreDef: TMenuItem
          Visible = True
        end
        inherited mnuConexoesEmail: TMenuItem
          Visible = True
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object mnuCadInterface: TMenuItem
        Caption = '&Interface'
        OnClick = mnuCadInterfaceClick
      end
      object mnuPaginasCampos: TMenuItem
        Caption = 'Páginas e Campos'
        OnClick = mnuPaginasCamposClick
      end
      object mnuWebTpReports: TMenuItem
        Caption = 'Relatórios'
        OnClick = mnuWebTpReportsClick
      end
    end
    object mnuConfiguracoes: TMenuItem [3]
      Caption = 'C&onfigurações'
      object mnuConexao: TMenuItem
        Caption = 'Conexão'
        OnClick = mnuConexaoClick
      end
      object mnuParametros: TMenuItem
        Caption = 'Parâmetros do Auto-Atendimento'
        OnClick = mnuParametrosClick
      end
      object mnuDadosExibidos: TMenuItem
        Caption = 'Dados Exibidos'
        OnClick = mnuDadosExibidosClick
      end
      object mnuRelatorios: TMenuItem
        Caption = 'Relatórios'
        OnClick = mnuRelatoriosClick
      end
    end
    object mnuConfigModulos: TMenuItem [4]
      Caption = 'Módulos'
      object mnuSimulaBenef: TMenuItem
        Caption = 'Simulação de Benefícios'
        object mnuCadSimulaBenef: TMenuItem
          Caption = 'Cadastro de Simulação de Benefícios'
          OnClick = mnuCadSimulaBenefClick
        end
        object mnuCadInputSimulaBenef: TMenuItem
          Caption = 'Cadastro de Campo para Simulação de Benefícios'
          OnClick = mnuCadInputSimulaBenefClick
        end
        object mnuCadResultSimulaBenef: TMenuItem
          Caption = 'Cadastro de Resultado para Simulação de Benefícios'
          OnClick = mnuCadResultSimulaBenefClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuSimulacaoBeneficios: TMenuItem
          Caption = 'Simulação de Benefícios'
          OnClick = mnuSimulacaoBeneficiosClick
        end
      end
      object mnuInformeDeRendimentos: TMenuItem
        Caption = 'Configurações do Informe de Rendimentos'
        OnClick = mnuInformeDeRendimentosClick
      end
    end
    object mnuSenhas: TMenuItem [5]
      Caption = 'Senhas'
      object mnuGeracaoAutomaticaSenha: TMenuItem
        Caption = 'Geração de Senha'
        OnClick = mnuGeracaoAutomaticaSenhaClick
      end
      object mnuAlteracaoSenha: TMenuItem
        Caption = 'Alteração de Senha'
        OnClick = mnuAlteracaoSenhaClick
      end
      object mnuExportacaoSenhas: TMenuItem
        Caption = 'Exportação de Senhas'
        OnClick = mnuExportacaoSenhasClick
      end
    end
    object mnuTransferencia: TMenuItem [6]
      Caption = 'Transferência'
      object mnuExportacao: TMenuItem
        Caption = 'Exportação de Dados'
        object mnuGerarExportacao: TMenuItem
          Caption = 'Gerar Exportação de Dados'
          OnClick = mnuGerarExportacaoClick
        end
        object mnuConsultarExportacao: TMenuItem
          Caption = 'Consultar Exportação de Dados'
          OnClick = mnuConsultarExportacaoClick
        end
      end
      object mnuImportacao: TMenuItem
        Caption = 'Importação de Dados'
        object mnuImportacaoDados: TMenuItem
          Caption = 'Importação de Dados em Arquivos'
          OnClick = mnuImportacaoDadosClick
        end
        object mnuConsultarImportacao: TMenuItem
          Caption = 'Consultar Importação de Dados'
          OnClick = mnuConsultarImportacaoClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuSincronizacao: TMenuItem
        Caption = 'Sincronização'
        OnClick = mnuSincronizacaoClick
      end
    end
    object Ferramentas1: TMenuItem [7]
      Caption = '&Ferramentas'
      object mnuStatus: TMenuItem
        Caption = 'Status do Sistema'
        OnClick = mnuStatusClick
      end
      object MnuLimpezadeSistema: TMenuItem
        Caption = '&Limpeza de Sistema'
        OnClick = MnuLimpezadeSistemaClick
      end
    end
  end
end
