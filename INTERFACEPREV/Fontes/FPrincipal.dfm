inherited frmPrincipal: TfrmPrincipal
  Left = 478
  Top = 230
  Caption = 'Interface com Instituições Previdenciárias'
  ClientHeight = 398
  ClientWidth = 653
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 653
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 199
    Top = 34
  end
  object bbtnGeraArqSERPROS: TBitBtn [2]
    Left = 295
    Top = 290
    Width = 247
    Height = 43
    Caption = '&Geração de Arquivos SERPROS'
    TabOrder = 2
    Visible = False
    OnClick = bbtnGeraArqSERPROSClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 378
    Width = 653
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
        Text = '13/07/2009 10:26'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Left = 300
    Top = 140
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object mnuUtilVerificaMenu: TMenuItem
          Caption = 'Verificação de Menu'
          Visible = False
          OnClick = mnuUtilVerificaMenuClick
        end
      end
    end
    object InterfacecomPatrocinadora1: TMenuItem [1]
      Caption = '&Patrocinadora'
      object LayOutPatrocinadora1: TMenuItem
        Caption = '&Cadastro de Lay-Out '
        object mnuPatroLayOutEnvio: TMenuItem
          Caption = '&Lay-Out de Envio '
          OnClick = mnuPatroLayOutEnvioClick
        end
        object mnuPatroLayOutRecebimento: TMenuItem
          Caption = '&Lay-Out de Recebimento'
          OnClick = mnuPatroLayOutRecebimentoClick
        end
      end
      object mnuPatroSeparaArquivo: TMenuItem
        Caption = 'Separação de Arquivos'
        Visible = False
        OnClick = mnuPatroSeparaArquivoClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuPatroEnvio: TMenuItem
        Caption = '&Envio para Patrocinadora'
        OnClick = mnuPatroEnvioClick
      end
      object RecebimentodaPatrocinadora1: TMenuItem
        Caption = '&Recebimento da Patrocinadora'
        object mnuPatroRecebFinanc: TMenuItem
          Caption = '&Rubricas Financeiras'
          OnClick = mnuPatroRecebFinancClick
        end
        object mnuPatroRecebDadosCad: TMenuItem
          Caption = '&Dados Cadastrais'
          OnClick = mnuPatroRecebDadosCadClick
        end
        object verificacaodoarquivo: TMenuItem
          Caption = 'Consultas de Verificação do Arquivo Financeiro'
          OnClick = verificacaodoarquivoClick
        end
      end
    end
    object SPC1: TMenuItem [2]
      Caption = '&SPC'
      object mnuSPCGerarArquivo: TMenuItem
        Caption = '&Gerar Arquivo para SPC'
        OnClick = mnuSPCGerarArquivoClick
      end
    end
    inherited mnuConsulta: TMenuItem [4]
      object N3: TMenuItem [1]
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Registrodeoperaes1: TMenuItem
        Caption = 'Re&gistro de operações'
        OnClick = Registrodeoperaes1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Cobranas2: TMenuItem
        Caption = 'C&obranças\Pagamentos'
        OnClick = Cobranas2Click
      end
      object ControledeInterface1: TMenuItem
        Caption = 'Controle de &Interface'
        OnClick = ControledeInterface1Click
      end
      object HistoricodeSalriosParticipao1: TMenuItem
        Caption = 'Histórico de Salários Participação'
        OnClick = HistoricodeSalriosParticipao1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object VisualizadordeArquivosTexto1: TMenuItem
        Caption = '&Visualizador de Arquivos Texto'
        OnClick = VisualizadordeArquivosTexto1Click
      end
    end
    inherited mnuCadastro: TMenuItem [5]
      object mnuCadRubricas: TMenuItem
        Caption = 'Rubricas da Patrocinadora'
        OnClick = mnuCadRubricasClick
      end
      object AssociaodeRubricaporEmpresa1: TMenuItem
        Caption = 'Associação de Rubrica por Empresa'
        OnClick = AssociaodeRubricaporEmpresa1Click
      end
      object Rubricasquecompoemossalriosporplano1: TMenuItem
        Caption = 'Rubricas que Compõem os Salários por Plano'
        OnClick = Rubricasquecompoemossalriosporplano1Click
      end
      object mnuCadParamEnvioContrib: TMenuItem
        Caption = 'Parâmetros de Envio por Contribuição'
        OnClick = mnuCadParamEnvioContribClick
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        ShortCut = 112
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    Top = 336
  end
end
