inherited frmPrincipal: TfrmPrincipal
  Left = 210
  Top = 220
  HelpContext = 230040
  Caption = 'Controle de Cotas'
  ClientHeight = 558
  ClientWidth = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 804
  end
  inherited tb97FluxOper: TToolWindow97
    inherited Panel2: TPanel
      inherited wwDBEdit3: TwwDBEdit
        Height = 17
      end
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 538
    Width = 804
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
        Text = '18/03/2008 15:10'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Top = 184
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object mnuExportaDAIEA: TMenuItem
          Caption = 'Exporta DAIEA'
          Enabled = False
          Visible = False
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object ImportaLanamentos1: TMenuItem
          Caption = 'Importar Lançamentos'
          OnClick = ImportaLanamentos1Click
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object ExcluirCotas1: TMenuItem
          Caption = 'Excluir Cotas'
          object mnuUtilExcluiTodasCotas: TMenuItem
            Caption = 'Exclui TODAS as cotas calculadas'
            HelpContext = 545004
            OnClick = mnuUtilExcluiTodasCotasClick
          end
          object N7: TMenuItem
            Caption = '-'
          end
          object PrimeirasCotas1: TMenuItem
            Caption = 'Primeiras Cotas'
            object mnuUtilExcluiPrimCotaEP: TMenuItem
              Caption = 'Empréstimo'
              HelpContext = 545005
              OnClick = mnuUtilExcluiPrimCotaEPClick
            end
            object mnuUtilExcluiPrimCotaImob: TMenuItem
              Caption = 'Imobiliário'
              HelpContext = 545006
              OnClick = mnuUtilExcluiPrimCotaImobClick
            end
            object mnuUtilExcluiPrimCotaRF: TMenuItem
              Caption = 'Renda Fixa'
              OnClick = mnuUtilExcluiPrimCotaRFClick
            end
            object mnuUtilExcluiPrimCotaRV: TMenuItem
              Caption = 'Renda Variável'
              HelpContext = 545007
              OnClick = mnuUtilExcluiPrimCotaRVClick
            end
            object mnuUtilExcluiPrimCotaBMF: TMenuItem
              Caption = 'BM && F'
              HelpContext = 545009
              OnClick = mnuUtilExcluiPrimCotaBMFClick
            end
            object mnuUtilExcluiPrimCotaFundoRF: TMenuItem
              Caption = 'Fundos de Renda Fixa'
              HelpContext = 545010
              OnClick = mnuUtilExcluiPrimCotaFundoRFClick
            end
            object mnuUtilExcluiPrimCotaFundoRV: TMenuItem
              Caption = 'Fundos de Renda Variável'
              HelpContext = 545011
              OnClick = mnuUtilExcluiPrimCotaFundoRVClick
            end
            object mnuUtilExcluiPrimCotaFundoImob: TMenuItem
              Caption = 'Fundos Imobiliários'
              HelpContext = 545012
              OnClick = mnuUtilExcluiPrimCotaFundoImobClick
            end
            object mnuUtilExcluiPrimCotaFundoDIC: TMenuItem
              Caption = 'Fundos de Direito Creditório'
              HelpContext = 545013
              OnClick = mnuUtilExcluiPrimCotaFundoDICClick
            end
          end
          object PrimeirasCotas2: TMenuItem
            Caption = 'Cotas'
            object mnuUtilExcluiCotaEP: TMenuItem
              Caption = 'Empréstimo'
              OnClick = mnuUtilExcluiCotaEPClick
            end
            object mnuUtilExcluiCotaImob: TMenuItem
              Caption = 'Imobiliário'
              OnClick = mnuUtilExcluiCotaImobClick
            end
            object mnuUtilExcluiCotaRF: TMenuItem
              Caption = 'Renda Fixa'
              OnClick = mnuUtilExcluiCotaRFClick
            end
            object mnuUtilExcluiCotaRV: TMenuItem
              Caption = 'Renda Variável'
              OnClick = mnuUtilExcluiCotaRVClick
            end
            object mnuUtilExcluiCotaBMF: TMenuItem
              Caption = 'BM && F'
              OnClick = mnuUtilExcluiCotaBMFClick
            end
            object mnuUtilExcluiCotaFundoRF: TMenuItem
              Caption = 'Fundos de Renda Fixa'
              OnClick = mnuUtilExcluiCotaFundoRFClick
            end
            object mnuUtilExcluiCotaFundoRV: TMenuItem
              Caption = 'Fundos de Renda Variável'
              OnClick = mnuUtilExcluiCotaFundoRVClick
            end
            object mnuUtilExcluiCotaFundoImob: TMenuItem
              Caption = 'Fundos Imobiliários'
              OnClick = mnuUtilExcluiCotaFundoImobClick
            end
            object mnuUtilExcluiCotaFundoDIC: TMenuItem
              Caption = 'Fundos de Direito Creditório'
              OnClick = mnuUtilExcluiCotaFundoDICClick
            end
          end
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object mnuCarteiraSPC: TMenuItem
        Caption = 'Carteira SPC'
        OnClick = mnuCarteiraSPCClick
      end
      object Ativos1: TMenuItem
        Caption = 'Ativos'
        OnClick = Ativos1Click
      end
      object CadastraPerfil1: TMenuItem
        Caption = 'Perfil'
        OnClick = CadastraPerfil1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Parmetros1: TMenuItem
        Caption = 'Parâmetros para Movimentação'
        object Emprstimo1: TMenuItem
          Caption = 'Empréstimo'
          OnClick = Emprstimo1Click
        end
        object Imobilirio1: TMenuItem
          Caption = 'Imobiliário'
          OnClick = Imobilirio1Click
        end
        object Investimento1: TMenuItem
          Caption = 'Investimento'
          OnClick = Investimento1Click
        end
      end
    end
    object Movimentao1: TMenuItem [3]
      Caption = '&Movimentações Manuais'
      object Receitased1: TMenuItem
        Caption = 'Receitas e Despesas Para Lançamento Manual'
        OnClick = Receitased1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PrimeiraCota1: TMenuItem
        Caption = 'Primeira Cota'
        OnClick = PrimeiraCota1Click
      end
      object ReceitaseDespesasCotasManuais1: TMenuItem
        Caption = 'Lançamento de Movimentações'
        OnClick = ReceitaseDespesasCotasManuais1Click
      end
    end
    object ClculodeCotas2: TMenuItem [4]
      Caption = 'Cálculo de Cotas'
      object Clculoda1Cota1: TMenuItem
        Caption = 'Cálculo da Primeira Cota'
        OnClick = Clculoda1Cota1Click
      end
      object ClculodeCotas1: TMenuItem
        Caption = 'Cálculo de Cotas'
        OnClick = ClculodeCotas1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object FechamentodePerodo1: TMenuItem
        Caption = 'Fechamento de Período'
        OnClick = FechamentodePerodo1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PerfilCadastrado1: TMenuItem
        Caption = 'Perfil Consolidado'
        OnClick = PerfilCadastrado1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object mnuEvolucaoCota: TMenuItem
        Caption = 'Evolução de Cotas'
        Enabled = False
        Visible = False
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        HelpContext = 230041
      end
    end
  end
end
