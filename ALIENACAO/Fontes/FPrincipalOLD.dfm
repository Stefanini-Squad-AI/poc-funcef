inherited frmPrincipal: TfrmPrincipal
  Left = 89
  Top = 172
  Caption = 'Alienação'
  ClientHeight = 425
  ClientWidth = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 672
    object Toolbar971: TToolbar97
      Left = 208
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 208
      ShowCaption = False
      TabOrder = 1
      object btnContratos: TToolbarButton97
        Left = 22
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Cadastro de Contratos'
        DisplayMode = dmGlyphOnly
        Caption = '&Contratos'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888887788
          888888888800B0888888888800FBF08888888800BFB4BF08888800FBF44BFB08
          88887FBF4FBFBFB088887BFBFBF44BF0888887BFB44FBFBF088887FB7BFB44FB
          0888887FBF44BFBFB088887BF4FBF44BFB088887BFB44FBFBFB08887FB4BFBFB
          F77888887FBFBFB77888888887FBF77888888888887778888888}
        HelpContext = 1350024
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = miCadPropostaClick
      end
      object btnImovel: TToolbarButton97
        Left = 0
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Cadastro de Imóveis'
        DisplayMode = dmGlyphOnly
        Caption = '&Contratos'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666660000006
          66666666087777800666666607888878806666660E6E6E7E6066666606E6E676
          E06666660E6E6E7E6066666606E6E676E06666660E6E6E7E6066666606E6E676
          E066666608770777806666660788888800666666608778888066666666088888
          0666666666600000666666666666606666666666666660666666}
        HelpContext = 640068
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = miImovelClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    ClientAreaHeight = 111
    ClientAreaWidth = 408
    inherited pnlTextoFluxOper: TPanel
      Width = 408
      Height = 80
      inherited Bevel1: TBevel
        Width = 408
      end
      inherited Panel1: TPanel
        Width = 408
        Height = 52
        inherited DBMemo1: TDBMemo
          Width = 402
          Height = 46
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
    Top = 405
    Width = 672
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
        Text = '01/06/2009 16:45'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Left = 138
    Top = 229
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N9: TMenuItem
          Caption = '-'
        end
        object miExecImportaBaixa: TMenuItem
          Caption = 'Importação de Baixas de Parcelas'
          HelpContext = 1350041
          OnClick = miExecImportaBaixaClick
        end
        object miExecAssociaDoc: TMenuItem
          Caption = 'Associação de Documentos do Adminimob'
          HelpContext = 1350040
          OnClick = miExecAssociaDocClick
        end
      end
    end
    object miLancamentos: TMenuItem [1]
      Caption = '&Lançamentos'
      HelpContext = 1350001
      object miGeraContrato: TMenuItem
        Caption = 'Geração do &Contrato de Venda'
        HelpContext = 1350002
        OnClick = miGeraContratoClick
      end
      object miExecDesfazContrato: TMenuItem
        Caption = 'Desfaz a Geração do Contrato'
        HelpContext = 1350003
        OnClick = miExecDesfazContratoClick
      end
      object miExecEncerraContrato: TMenuItem
        Caption = 'Encerramento Contratual'
        HelpContext = 135004
        OnClick = miExecEncerraContratoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miExecParcelas: TMenuItem
        Caption = 'Geração de &Parcelas'
        HelpContext = 1350005
        OnClick = miExecParcelasClick
      end
      object miCadAmortizacao: TMenuItem
        Caption = '&Amortização do Saldo Devedor'
        HelpContext = 1350006
        OnClick = miCadAmortizacaoClick
      end
      object miCadBaixaManual: TMenuItem
        Caption = '&Baixa Manual de Parcelas'
        HelpContext = 1350007
        OnClick = miCadBaixaManualClick
      end
      object miResiduo: TMenuItem
        Caption = 'Cobrança / Abono de Resíduo'
        HelpContext = 1350035
        OnClick = miResiduoClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miExecIntegra: TMenuItem
        Caption = '&Integração das Parcelas'
        HelpContext = 1350008
        OnClick = miExecIntegraClick
      end
      object miExecEstorno: TMenuItem
        Caption = '&Estorno de Parcelas Integradas'
        HelpContext = 1350009
        OnClick = miExecEstornoClick
      end
      object miExecConcilia: TMenuItem
        Caption = 'C&onciliação das Parcelas'
        HelpContext = 1350010
        OnClick = miExecConciliaClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExecRepactuacao: TMenuItem
        Caption = '&Repactuação Contratual'
        HelpContext = 1350011
        OnClick = miExecRepactuacaoClick
      end
      object miExecDesfazRepactuacao: TMenuItem
        Caption = 'Desfaz Repactuação Contratual'
        HelpContext = 1350012
        OnClick = miExecDesfazRepactuacaoClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miExecAntecipa: TMenuItem
        Caption = 'Antecipação de Parcelas'
        HelpContext = 1350013
        OnClick = miExecAntecipaClick
      end
      object miExecDesfazAntecipa: TMenuItem
        Caption = 'Desfaz Antecipação de Parcelas'
        HelpContext = 1350014
        OnClick = miExecDesfazAntecipaClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miExecRecalculo: TMenuItem
        Caption = '&Recálculo de Parcelas em Aberto'
        HelpContext = 1350015
        OnClick = miExecRecalculoClick
      end
      object miExecAlterador: TMenuItem
        Caption = 'Acréscimos e Descontos'
        HelpContext = 1350016
        OnClick = miExecAlteradorClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuCartaReajuste: TMenuItem
        Caption = 'Carta de Rea&juste'
        HelpContext = 1350037
        object mnuDesenhoCartaReajuste: TMenuItem
          Caption = '&Desenho'
          HelpContext = 1350039
          OnClick = mnuDesenhoCartaReajusteClick
        end
        object mnuEmissaoCartaReajuste: TMenuItem
          Caption = '&Emissão'
          HelpContext = 1350038
          OnClick = mnuEmissaoCartaReajusteClick
        end
      end
    end
    object mmDiario: TMenuItem [2]
      Caption = 'Previsões Diárias'
      HelpContext = 1350017
      Visible = False
      object miCalculaPrevisao: TMenuItem
        Caption = 'Calcula Previsão'
        HelpContext = 1350018
        OnClick = miCalculaPrevisaoClick
      end
      object miEditaPrevisao: TMenuItem
        Caption = 'Edita Previsão'
        HelpContext = 1350019
        OnClick = miEditaPrevisaoClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object miAjustaPrevisao: TMenuItem
        Caption = 'Ajusta Previsão'
        HelpContext = 1350020
        OnClick = miAjustaPrevisaoClick
      end
      object miEncerraMes: TMenuItem
        Caption = 'Encerramento do Mês'
        HelpContext = 1350021
        OnClick = miEncerraMesClick
      end
      object miDesfazEncerra: TMenuItem
        Caption = 'Desfaz Encerramento'
        HelpContext = 1350022
        OnClick = miDesfazEncerraClick
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 1350023
      object miCadProposta: TMenuItem
        Caption = '&Propostas e Contratos de Alienação'
        HelpContext = 1350024
        OnClick = miCadPropostaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object miCadComprador: TMenuItem
        Caption = '&Compradores'
        HelpContext = 640036
        OnClick = miCadCompradorClick
      end
      object miResponsavel: TMenuItem
        Caption = '&Responsáveis'
        HelpContext = 640039
        OnClick = miResponsavelClick
      end
      object mniFiadores: TMenuItem
        Caption = 'Fiadores'
        HelpContext = 640037
        OnClick = mniFiadoresClick
      end
      object miImovel: TMenuItem
        Caption = '&Imoveis'
        HelpContext = 640068
        OnClick = miImovelClick
      end
      object miCadMsgBoleto: TMenuItem
        Caption = '&Mensagens para Boleto'
        HelpContext = 640013
        OnClick = miCadMsgBoletoClick
      end
      object miRecDes: TMenuItem
        Caption = 'Tipos de Movimentação'
        HelpContext = 1350027
        object miCadTipoCustoRec: TMenuItem
          Caption = 'Cadastro de Tipos de Movimentação'
          HelpContext = 640059
          OnClick = miCadTipoCustoRecClick
        end
        object miCadParamReceita: TMenuItem
          Caption = 'Parâmetros para Integração Contábil / Financeira'
          HelpContext = 640063
          OnClick = miCadParamReceitaClick
        end
        object miExecCadParamOperacao: TMenuItem
          Caption = 'Parâmetros para Integração de Operações Contábeis'
          HelpContext = 640097
          OnClick = miExecCadParamOperacaoClick
        end
      end
      object miTipoImovel: TMenuItem
        Caption = 'Tipos de Imóvel'
        HelpContext = 640045
        OnClick = miTipoImovelClick
      end
      object miAlteradorxImovel: TMenuItem
        Caption = 'Alteradores por Tipo de Imóvel'
        HelpContext = 640041
        OnClick = miAlteradorxImovelClick
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 142
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miAnalProp: TMenuItem
        Caption = '&Análise de Proposta'
        HelpContext = 1350032
        OnClick = miAnalPropClick
      end
      object miConsultaParc: TMenuItem
        Caption = 'Contratos e Parcelas'
        HelpContext = 1350042
        OnClick = miConsultaParcClick
      end
      object miConIndices: TMenuItem
        Caption = '&Indices e Moedas'
        HelpContext = 640083
        Visible = False
      end
      object miPlanoContas: TMenuItem
        Caption = 'Plano de Contas'
        HelpContext = 640082
        OnClick = miPlanoContasClick
      end
    end
    inherited mnuRAD: TMenuItem
      HelpContext = 143
      inherited mnuRADExecutar: TMenuItem
        HelpContext = 145
      end
      inherited mnuGerarProcesso_Padrao: TMenuItem
        HelpContext = 146
      end
      inherited mnuRADConsultar: TMenuItem
        HelpContext = 144
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        HelpContext = 230041
      end
    end
  end
  inherited ImlPadrao: TImageList
    Top = 136
  end
  inherited AclPadrao: TActionList
    Top = 240
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Top = 184
  end
  inherited ResourceManager: TCMResourceManager
    Left = 88
    Top = 272
  end
  inherited CMNetUsers: TCMNetUsers
    Left = 88
    Top = 328
  end
end
