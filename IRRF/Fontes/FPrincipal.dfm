inherited frmPrincipal: TfrmPrincipal
  Left = 431
  Top = 164
  HelpContext = 240048
  Caption = 'IRRF'
  ClientHeight = 493
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 752
    object SpeedButton1: TSpeedButton [2]
      Left = 306
      Top = 2
      Width = 27
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000000000
        00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C3C6C0
        C0C0000000C6C3C6000000C6C3C6000000C6C3C6000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000C6C3C6000000C6C3C6000000C6C3C6000000C6C3
        C6C6C3C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF000000000000C0C0C0000000000000
        0000000000000000008080808000000000000000000000000000000000000000
        00848284000000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFF80000000
        FFFF00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000C6C3C6
        000000000000FFFFFFFFFFFF80000000FFFFFF0000FF0000FF000000FFFF0000
        00FFFFFF000000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFF80000000
        FFFFFF0000FF0000FF000000FFFF000000FFFFFFFFFFFFFFFFFF000000C6C3C6
        000000000000000000FFFFFF80000000FFFFFF0000FF0000FF000000FFFF0000
        00FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFF80000000
        FFFF00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000C6C3C6
        000000FFFFFFFFFFFFFFFFFF8000008000008000008000008000008000008000
        00FFFFFF000000000000000000FFFFFF000000000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000C6C3C6
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = mnuNovaBUSCAClick
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 273
    Top = 144
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 473
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
        Text = '07/11/2022 09:59'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Left = 226
    Top = 88
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N1: TMenuItem
          Caption = '-'
        end
        object LancamentoEspecialDeducao: TMenuItem
          Caption = 'Lançamento de dedução de R$ 100,00'
          Enabled = False
          Visible = False
        end
      end
    end
    object Lanamentos1: TMenuItem [1]
      Caption = '&Lançamentos'
      HelpContext = 240000
      object LancamentonoIRRF1: TMenuItem
        Caption = 'Lançamentos Manual de Impostos'
        HelpContext = 240001
        OnClick = LancamentonoIRRF1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object LancamentosnoDarf1: TMenuItem
        Caption = 'Lançamentos no DARF'
        HelpContext = 240002
        OnClick = LancamentosnoDarf1Click
      end
      object mnuCadGPSMT: TMenuItem
        Caption = 'Alteração / Exclusão de GPS'
        HelpContext = 240004
        OnClick = mnuCadGPSMTClick
      end
      object mnuCadDARMMT: TMenuItem
        Caption = 'Alteração / Exclusão de DARM'
        HelpContext = 240003
        OnClick = mnuCadDARMMTClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuExclusaoDARFDeposito: TMenuItem
        Caption = 'Exclusão de DARF'#39's de Depósito Judicial'
        HelpContext = 240005
        OnClick = mnuExclusaoDARFDepositoClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuManutDocumentos: TMenuItem
        Caption = 'Manutenção de Documentos (AP)'
        OnClick = mnuManutDocumentosClick
      end
    end
    object Geraes1: TMenuItem [2]
      Caption = '&Gerações'
      HelpContext = 240006
      object IRRFdoCARCAP1: TMenuItem
        Caption = 'Lançamentos de Outros Sistemas'
        HelpContext = 240007
        object FazerBusca1: TMenuItem
          Caption = 'Fazer Busca'
          object FolhadePagamentoBenefcio1: TMenuItem
            Caption = 'Folhas de Pagamento'
            HelpContext = 240008
            OnClick = FolhadePagamentoBenefcio1Click
          end
          object BuscaIOFEmprstimo1: TMenuItem
            Caption = 'Empréstimos - IOF'
            HelpContext = 240009
            OnClick = BuscaIOFEmprstimo1Click
          end
          object N13: TMenuItem
            Caption = '-'
          end
          object mnuNovaBUSCA: TMenuItem
            Caption = 'Folha de Benefícios'
            OnClick = mnuNovaBUSCAClick
          end
        end
        object DesfazerBuscadoIRRFdeOutrosSistemas1: TMenuItem
          Caption = 'Desfazer Busca'
          object mnuFolhasdePagamentosBenefcios1: TMenuItem
            Caption = 'Folhas de Pagamentos'
            HelpContext = 240010
            OnClick = mnuFolhasdePagamentosBenefcios1Click
          end
          object mnuEmprstimosIOF1: TMenuItem
            Caption = 'Empréstimos - IOF'
            HelpContext = 240011
            OnClick = mnuEmprstimosIOF1Click
          end
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object mnuExecBuscaCap: TMenuItem
          Caption = 'Busca / Desfazer Busca do Contas a Pagar'
          HelpContext = 240012
          OnClick = mnuExecBuscaCapClick
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuPrepararDARFFolhadeBeneficios: TMenuItem
        Caption = 'Preparar DARF - Folha de Benefícios'
        OnClick = mnuPrepararDARFFolhadeBeneficiosClick
      end
      object mnuGerarDARFFolBenef: TMenuItem
        Caption = '&Gerar DARF - Folha de Benefícios'
        OnClick = mnuGerarDARFFolBenefClick
      end
      object Darf1: TMenuItem
        Caption = '&DARF'
        HelpContext = 240013
        OnClick = Darf1Click
      end
      object mnuDARM: TMenuItem
        Caption = 'DAR&M'
        HelpContext = 240014
        OnClick = mnuDARMClick
      end
      object mnuGPS: TMenuItem
        Caption = 'G&PS'
        HelpContext = 240015
        OnClick = mnuGPSClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuGerenciadorDCTF: TMenuItem
        Caption = 'Gerenciador da DCTF'
        OnClick = mnuGerenciadorDCTFClick
      end
      object DCTF1: TMenuItem
        Caption = 'DC&TF'
        HelpContext = 240016
        OnClick = DCTF1Click
      end
      object mnuGerenciadorDIRF: TMenuItem
        Caption = 'Gerenciador da DIRF'
        OnClick = mnuGerenciadorDIRFClick
      end
      object Dirf1: TMenuItem
        Caption = 'D&IRF'
        HelpContext = 240017
        OnClick = Dirf1Click
      end
      object GFIP1: TMenuItem
        Caption = '&GFIP'
        HelpContext = 240016
        OnClick = GFIP1Click
      end
      object mnuDPrev: TMenuItem
        Caption = 'DPrev'
        HelpContext = 240018
        OnClick = mnuDPrevClick
      end
      object mnuDacon: TMenuItem
        Caption = 'DACON'
        HelpContext = 240018
        OnClick = mnuDaconClick
      end
      object mnuDIPJ: TMenuItem
        Caption = 'DIPJ'
        HelpContext = 240018
        OnClick = mnuDIPJClick
      end
      object mnuSPED: TMenuItem
        Caption = 'EFD - Contribuições'
        OnClick = mnuSPEDClick
      end
      object ArquivoDigital: TMenuItem
        Caption = 'Arquivo Digital - Resgate e Contribuições'
        OnClick = ArquivoDigitalClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuIsencaoRetroativa: TMenuItem
        Caption = 'Isenção Retroativa'
        OnClick = mnuIsencaoRetroativaClick
      end
      object mnuCompVlrNegativo: TMenuItem
        Caption = '&Compensa Valor Negativo da Busca'
        HelpContext = 240019
        OnClick = mnuCompVlrNegativoClick
      end
      object mnuDesfazerCompensaValorNegativodaBusca: TMenuItem
        Caption = 'Desfazer Compensa Valor &Negativo da Busca'
        Hint = 
          'Desfazer a compensação de valores negativos gerados a partir da ' +
          'busca de folha de benefícios'
        OnClick = mnuDesfazerCompensaValorNegativodaBuscaClick
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 240020
      object NaturezadoRendimento1: TMenuItem
        Caption = '&Natureza do Rendimento'
        HelpContext = 240021
        OnClick = NaturezadoRendimento1Click
      end
      object mnuNatuRendimentoREINF: TMenuItem
        Caption = 'Natureza do Rendimento - REINF'
        OnClick = mnuNatuRendimentoREINFClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ImpostodeRendaPessoaFsica1: TMenuItem
        Caption = '&Imposto de Renda Pessoa Física'
        HelpContext = 240022
        OnClick = ImpostodeRendaPessoaFsica1Click
      end
      object mnuCadTabelaRegressiva: TMenuItem
        Caption = 'Tabela Regressiva de IRRF'
        HelpContext = 240023
        OnClick = mnuCadTabelaRegressivaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object LinhasparaoInformedeRendimento1: TMenuItem
        Caption = '&Linhas para o Informe de Rendimento'
        HelpContext = 240024
        OnClick = LinhasparaoInformedeRendimento1Click
      end
      object mnuAssocLinhaOrigemxDestino: TMenuItem
        Caption = 'Associação de Linha de Informe de Origem por Destino'
        HelpContext = 240025
        OnClick = mnuAssocLinhaOrigemxDestinoClick
      end
      object ImpostosxAlteradores1: TMenuItem
        Caption = 'Associação de Impostos por Alteradores'
        HelpContext = 240026
        OnClick = ImpostosxAlteradores1Click
      end
      object LayOutdoInformeparaPF1: TMenuItem
        Caption = 'Lay-Out do Informe para P.F.'
        HelpContext = 240027
        OnClick = LayOutdoInformeparaPF1Click
      end
      object ExceesparaoInforme1: TMenuItem
        Caption = '&Exceções para o Informe'
        HelpContext = 240028
        OnClick = ExceesparaoInforme1Click
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
        HelpContext = 230054
        OnClick = Fornecedores1Click
      end
      object HistoricoParamsIR: TMenuItem
        Caption = 'Histórico de Parâmetros do Imposto de Renda'
        HelpContext = 240029
        OnClick = HistoricoParamsIRClick
      end
      object mnuAssociaodeContribuioporAno: TMenuItem
        Caption = 'Associação de Contribuição por Ano'
        OnClick = mnuAssociaodeContribuioporAnoClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuDaconDIPJ: TMenuItem
        Caption = 'Linhas para &DACON/DIPJ/SPED'
        OnClick = mnuDaconDIPJClick
      end
      object mnuDCTFRubricasdeDebitodasFolhas: TMenuItem
        Caption = 'DCTF - Lançamento de Rubricas de Débito das Folhas'
        OnClick = mnuDCTFRubricasdeDebitodasFolhasClick
      end
    end
    inherited mnuConsulta: TMenuItem
      object InformedeRendimentoPF1: TMenuItem [1]
        Caption = 'Impressão do Informe de Rendimento P.F.'
        HelpContext = 240031
        OnClick = InformedeRendimentoPF1Click
      end
      inherited MnuLogdeOperaes_Padrao: TMenuItem
        HelpContext = 230071
      end
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 230070
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object ConsultaBuscaDirf1: TMenuItem
        Caption = '&Consulta Busca Dirf'
        OnClick = ConsultaBuscaDirf1Click
      end
      object mnuRelatorioDIRF: TMenuItem
        Caption = 'Relatório Individual para a DIRF'
        OnClick = mnuRelatorioDIRFClick
      end
      object mnuRelDivergeFolhaxComprov: TMenuItem
        Caption = 'Relatório de Divergências - Folha x Comprovante Rendimento'
        OnClick = mnuRelDivergeFolhaxComprovClick
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        ShortCut = 112
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{39B3FAE7-53C8-48FE-929B-2A21415A1BB5}'
    ServerName = 'CMIRRFSvr50.IRRF'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{39B3FAE7-53C8-48FE-929B-2A21415A1BB5}'
    ServerName = 'CMIRRFSvr50.IRRF'
  end
  inherited Web: TWebConnection
    ServerGUID = '{39B3FAE7-53C8-48FE-929B-2A21415A1BB5}'
    ServerName = 'CMIRRFSvr50.IRRF'
  end
end
