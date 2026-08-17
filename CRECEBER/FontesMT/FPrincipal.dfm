inherited FrmPrincipal: TFrmPrincipal
  Left = 197
  Top = 145
  Caption = 'Contas a Receber'
  ClientHeight = 404
  ClientWidth = 765
  ParentFont = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 765
    inherited fcLabel2: TfcLabel
      Top = 1
    end
    inherited ImlCaixa_Padrao: TImage
      Left = 451
      Top = 105
    end
    inherited tb97Atalho: TToolbar97
      inherited sbtnHelp: TToolbarButton97
        Left = 52
      end
      inherited ToolBarsep973: TToolbarSep97
        Left = 118
      end
      inherited sbtnMudaEmpresa: TToolbarButton97
        Left = 126
      end
      inherited sbtnListaMensagens: TToolbarButton97
        Left = 156
      end
      inherited sepCM2: TToolbarSep97
        Left = 200
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 178
      end
      object ToolbarSep971: TToolbarSep97
        Left = 44
        Top = 0
        Blank = True
        SizeHorz = 8
      end
      object sBtnLancDoc: TToolbarButton97
        Left = 208
        Top = 0
        Width = 22
        Height = 22
        Action = mnudocregistra
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000024000000100000000100
          0400000000004001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8118888888888888888778F800008888888888888191888888888888FFF7F78F
          0000888888888111119918888888888777778878000088888888819999999188
          88888887F8888887000080000000019999999188FFFFFFF7FFFFF88700008777
          7777711111991887777777777777F878000087888888888881918887FF888888
          8887F78800008738883338883118888778F88FFF88777F88000087B383000383
          87088887F78F7778F7887F88000087FF30FFB03887088887F87788877F887F88
          000087B80FBFFF0387088887F878888878F87F8800008780BFFFBFF037088887
          F7888888878F7F880000870FFFBFFFBF030888877888888888787F88000087FF
          BFFFBFFFB0088887FFFFFFFFFFF77F8800008777777777777708888777777777
          7777788800008888888888888888888888888888888888880000}
        Images = ImlPadrao
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object ToolbarSep972: TToolbarSep97
        Left = 148
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 188
    Top = 227
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 384
    Width = 765
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
        Text = '02/03/2017 11:45'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 208
    Top = 152
  end
  inherited mnu: TMainMenu
    Left = 152
    Top = 232
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object MnuHistoricosContabeis: TMenuItem [1]
          Caption = '&Históricos Contábeis'
          HelpContext = 40001
          OnClick = MnuHistoricosContabeisClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object AlteraOperaodeParcelaEngloba1: TMenuItem
          Caption = '&Altera Operação de Parcela\Engloba '
          HelpContext = 40002
          OnClick = AlteraOperaodeParcelaEngloba1Click
        end
        object AlteraDadosBancrios1: TMenuItem
          Caption = 'Altera Dados Bancários'
          HelpContext = 40003
          OnClick = AlteraDadosBancrios1Click
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object TransfernciadeClassificao1: TMenuItem
          Caption = '&Transferência de Classificação'
          HelpContext = 40004
          OnClick = TransfernciadeClassificao1Click
        end
        object N18: TMenuItem
          Caption = '-'
        end
        object ImportaodeLanamentos1: TMenuItem
          Caption = '&Importação de Lançamentos'
          HelpContext = 40008
          object Padro1: TMenuItem
            Caption = 'Padrão'
            HelpContext = 40005
            OnClick = Padro1Click
          end
        end
        object mnuExportaLancMT: TMenuItem
          Caption = 'E&xportação de Lançamentos'
          OnClick = mnuExportaLancMTClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object AjustarSaldoatravsdeLanamentos1: TMenuItem
          Caption = 'Ajustar Saldo Através de Lançamentos'
          HelpContext = 40007
          OnClick = AjustarSaldoatravsdeLanamentos1Click
        end
      end
      inherited mnuFluxOper: TMenuItem
        Caption = 'Fluxo de O&peração'
      end
    end
    object mnuLancamento: TMenuItem [1]
      Caption = '&Lançamento'
      HelpContext = 40017
      object Documentos1: TMenuItem
        Caption = '&Documentos'
        HelpContext = 40008
        object mnudocregistraB: TMenuItem
          Action = mnudocregistra
        end
        object parcelasdoc: TMenuItem
          Caption = 'Agrupa/&Parcela'
          HelpContext = 40010
          OnClick = parcelasdocClick
        end
        object mnu1Alteradores1: TMenuItem
          Caption = '&Alteradores'
          HelpContext = 40011
          OnClick = mnu1Alteradores1Click
        end
        object mnuEventos: TMenuItem
          Caption = 'Eventos'
          OnClick = mnuEventosClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object JurosAtuarial1: TMenuItem
          Caption = 'Taxas Para Correção'
          HelpContext = 40012
          OnClick = JurosAtuarial1Click
        end
      end
      object Previses1: TMenuItem
        Caption = 'Contratos \ &Previsões'
        HelpContext = 40013
        object mnuprevregistra: TMenuItem
          Caption = '&Registra'
          HelpContext = 40014
          OnClick = mnuprevregistraClick
        end
        object parcelasprev: TMenuItem
          Caption = 'Agrupa/&Parcela'
          HelpContext = 40015
          OnClick = parcelasprevClick
        end
      end
      object Adiantamentos1: TMenuItem
        Caption = '&Adiantamentos'
        HelpContext = 40016
        OnClick = Adiantamentos1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object AlteraVencimento1: TMenuItem
        Caption = 'Alteração de Data Programada'
        HelpContext = 40017
        OnClick = AlteraVencimento1Click
      end
    end
    object Cobranca: TMenuItem [2]
      Caption = 'Cobra&nça'
      HelpContext = 40032
      object RegularizaAdiantamentos1: TMenuItem
        Caption = '&Adiantamentos'
        HelpContext = 40018
        object Regulariza1: TMenuItem
          Caption = '&Regulariza'
          HelpContext = 40019
          OnClick = Regulariza1Click
        end
        object EstornaExclui1: TMenuItem
          Caption = '&Estorna\Exclui'
          HelpContext = 40020
          OnClick = EstornaExclui1Click
        end
      end
      object Lotedocumento: TMenuItem
        Caption = '&Documentos x Cobrança'
        HelpContext = 40021
        OnClick = LotedocumentoClick
      end
      object Emissodecheque1: TMenuItem
        Caption = 'Cobrança &Bancária'
        HelpContext = 40022
        object MensagensParaRemessaEletrnica1: TMenuItem
          Caption = '&Mensagens X Documentos'
          HelpContext = 40023
          OnClick = MensagensParaRemessaEletrnica1Click
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object MnuEmissao: TMenuItem
          Caption = '&Emissão'
          HelpContext = 40024
          object Emisso1: TMenuItem
            Caption = 'Boletos Pré Impressos e Arquivos IntBanco'
            HelpContext = 40025
            OnClick = Emisso1Click
          end
          object MnuFichaComp: TMenuItem
            Caption = '&Ficha de Compensação'
            HelpContext = 40026
            object MnuConfigFichaComp: TMenuItem
              Caption = '&Configuração'
              HelpContext = 40027
              OnClick = MnuConfigFichaCompClick
            end
            object MnuImpFichaComp: TMenuItem
              Caption = '&Impressão'
              HelpContext = 40028
              OnClick = MnuImpFichaCompClick
            end
          end
          object MnuSepara: TMenuItem
            Caption = '-'
          end
          object GeraRemessaParaAlterao1: TMenuItem
            Caption = 'Gera Remessa Para Alteração'
            HelpContext = 40029
            OnClick = GeraRemessaParaAlterao1Click
          end
        end
        object LiberaReimpressodoBloqueto1: TMenuItem
          Caption = '&Libera Reimpressão de Bloqueto'
          HelpContext = 40030
          OnClick = LiberaReimpressodoBloqueto1Click
        end
        object mnuRemessaEletronica: TMenuItem
          Caption = 'Remessa Eletrônica - SIACC'
          OnClick = mnuRemessaEletronicaClick
        end
        object N23: TMenuItem
          Caption = '-'
        end
        object AgruparBloquetos1: TMenuItem
          Caption = '&Agrupar Bloquetos por Cliente'
          HelpContext = 40031
          OnClick = AgruparBloquetos1Click
        end
        object mnuRegistrodeCarteira: TMenuItem
          Caption = 'Registro de Carteira - Boletos'
          OnClick = mnuRegistrodeCarteiraClick
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object EmissodeEtiquetas1: TMenuItem
        Caption = '&Etiquetas'
        HelpContext = 40032
        OnClick = EmissodeEtiquetas1Click
      end
      object CartasdeCobrana1: TMenuItem
        Caption = '&Cartas de Cobrança'
        HelpContext = 40033
        object Escreve1: TMenuItem
          Caption = '&Configura'
          HelpContext = 40034
          OnClick = Escreve1Click
        end
        object Imprime1: TMenuItem
          Caption = '&Imprime'
          HelpContext = 40035
          OnClick = Imprime1Click
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Pagamento1: TMenuItem
        Caption = '&Recebimento'
        HelpContext = 40036
        object Automatico1: TMenuItem
          Caption = '&Automático (Retorno)'
          HelpContext = 40037
          OnClick = Automatico1Click
        end
        object AutomticoRetornoemGrandeVolume1: TMenuItem
          Caption = 'Automático (Retorno em Grande &Volume)'
          OnClick = AutomticoRetornoemGrandeVolume1Click
        end
        object Manua1: TMenuItem
          Caption = '&Manual'
          HelpContext = 40038
          OnClick = Manua1Click
        end
        object RecebimentosXPagamentos1: TMenuItem
          Caption = 'Recebimentos X Pagamentos'
          HelpContext = 40039
          OnClick = RecebimentosXPagamentos1Click
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object ExcluiRecebimentos1: TMenuItem
          Caption = 'Estorna \ Exclui'
          HelpContext = 40040
          object Lote1: TMenuItem
            Caption = '&Lote'
            HelpContext = 40041
            OnClick = Lote1Click
          end
          object Documento1: TMenuItem
            Caption = '&Documento'
            HelpContext = 40042
            OnClick = Documento1Click
          end
        end
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object TiposdeFatura1: TMenuItem
        Caption = '&Fatura e Nota de Crédito'
        HelpContext = 40058
        Visible = False
        object Configura3: TMenuItem
          Caption = '&Configura'
          OnClick = Configura3Click
        end
        object Imprime4: TMenuItem
          Caption = '&Imprime'
          OnClick = Imprime4Click
        end
      end
      object EmissodeRecibo1: TMenuItem
        Caption = 'Emissão de Recibo'
        HelpContext = 40043
        object Configura4: TMenuItem
          Caption = '&Configura'
          HelpContext = 40044
          OnClick = Configura4Click
        end
        object Imprime5: TMenuItem
          Caption = '&Imprime'
          HelpContext = 40045
          OnClick = Imprime5Click
        end
      end
      object CertificadodeReteno1: TMenuItem
        Caption = 'Certificado de Retenção'
        HelpContext = 40062
        Visible = False
        object Configura2: TMenuItem
          Caption = '&Configura'
          OnClick = Configura2Click
        end
        object Imprime3: TMenuItem
          Caption = '&Imprime'
          OnClick = Imprime3Click
        end
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object CorreoAutomticadeDocumentos1: TMenuItem
        Caption = '&Correção Automática de Documentos'
        HelpContext = 40046
        OnClick = CorreoAutomticadeDocumentos1Click
      end
      object msgBoletos: TMenuItem
        Caption = '&Mensagens Para Boletos'
        OnClick = msgBoletosClick
      end
      object mmuCadastroMEmail: TMenuItem
        Caption = 'Cadastro de Modelo de E-mail'
        OnClick = mmuCadastroMEmailClick
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 40064
      object Bancos1: TMenuItem
        Caption = '&Bancos'
        HelpContext = 230056
        OnClick = Bancos1Click
      end
      object Agncias1: TMenuItem
        Caption = 'A&gências'
        HelpContext = 230057
        OnClick = Agncias1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object ContasBancri1: TMenuItem
        Caption = 'C&ontas Bancárias / Caixas'
        HelpContext = 40047
        OnClick = ContasBancri1Click
      end
      object FormasdePagamento1: TMenuItem
        Caption = '&Tipo de Cobrança'
        HelpContext = 40048
        OnClick = FormasdePagamento1Click
      end
      object mnuConveniosBancarios: TMenuItem
        Caption = 'Con&vênios Bancários'
        HelpContext = 40049
        OnClick = mnuConveniosBancariosClick
      end
      object ContasCaixasxFormasdepaga1: TMenuItem
        Caption = '&Contas/Caixas x Tipo de Cobrança'
        HelpContext = 40050
        OnClick = ContasCaixasxFormasdepaga1Click
      end
      object CdigosBancriosparaCobrana1: TMenuItem
        Caption = 'Códigos &Bancários para Cobrança'
        HelpContext = 40051
        OnClick = CdigosBancriosparaCobrana1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object TiposDesembolso1_: TMenuItem
        Caption = 'Tipos de &Recebimento'
        HelpContext = 40052
        object TiposDesembolso1: TMenuItem
          Caption = 'Tipos de Recebimento'
          OnClick = TiposDesembolso1Click
        end
        object FormasDeRecebientoXCentrodeCustoXContaContbil1: TMenuItem
          Caption = 'Parametrização Contábil Predominante'
          OnClick = FormasDeRecebientoXCentrodeCustoXContaContbil1Click
        end
        object TiposdeDesembolsoXImpostosAgregados1: TMenuItem
          Caption = 'Impostos Agregados'
          OnClick = TiposdeDesembolsoXImpostosAgregados1Click
        end
      end
      object Tiposdealteradores1_: TMenuItem
        Caption = 'Tipos de &Alteradores'
        HelpContext = 40053
        object Tiposdealteradores1: TMenuItem
          Caption = 'Tipos de Alteradores'
          OnClick = Tiposdealteradores1Click
        end
        object MnuAlteradorXRelacionamentos: TMenuItem
          Caption = 'Parametrização Contábil Predominante'
          OnClick = MnuAlteradorXRelacionamentosClick
        end
      end
      object TiposdeDocumentos1: TMenuItem
        Caption = 'Tipos de Doc&umentos'
        HelpContext = 40054
        OnClick = TiposdeDocumentos1Click
      end
      object UsurioxTipodeDocumento1: TMenuItem
        Caption = 'Usuário x Tipo de Documento'
        HelpContext = 40055
        OnClick = UsurioxTipodeDocumento1Click
      end
      object MnuTipoDocumentoxAlteradorxModulo: TMenuItem
        Caption = 'Tipo de Documento x Alterador x Módulo'
        HelpContext = 40056
        OnClick = MnuTipoDocumentoxAlteradorxModuloClick
      end
      object mnuTipoEvento: TMenuItem
        Caption = 'Tipo de Evento'
        OnClick = mnuTipoEventoClick
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object ClassificaoFiscal1: TMenuItem
        Caption = '&Classificação Fiscal'
        HelpContext = 40074
        Visible = False
        OnClick = ClassificaoFiscal1Click
      end
      object CadastrodeImpostosAgregados1: TMenuItem
        Caption = 'Cadastro de &Impostos Agregados'
        HelpContext = 40057
        OnClick = CadastrodeImpostosAgregados1Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object ClassificaoFiscalXImpostosAgregados1: TMenuItem
        Caption = 'Classificação &Fiscal X Impostos Agregados'
        Enabled = False
        HelpContext = 40076
        Visible = False
        OnClick = ClassificaoFiscalXImpostosAgregados1Click
      end
      object TiposdeDesembolsoXImpostosAgregados1_: TMenuItem
        Caption = 'Tipos de Re&cebimento X Impostos Agregados'
        Enabled = False
        HelpContext = 40058
        Visible = False
      end
      object FormasDeRecebientoXCentrodeCustoXContaContbil1_: TMenuItem
        Caption = 'Tipos de Recebimento X Centro de Custo X Conta Contábil'
        Enabled = False
        HelpContext = 40059
        Visible = False
      end
      object MnuAlteradorXRelacionamentos_: TMenuItem
        Caption = 'Alterador X Centro de Custo X Conta Contábil X Programa'
        Enabled = False
        HelpContext = 40060
        Visible = False
      end
      object N9: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        object Tiposlientes1: TMenuItem
          Caption = 'Tipos de Clientes'
          OnClick = Tiposlientes1Click
        end
        object TiposdeClientesxTiposdeRecebimento1: TMenuItem
          Caption = 'Tipos de Clientes x Tipos de Recebimento'
          OnClick = TiposdeClientesxTiposdeRecebimento1Click
        end
        object Clientes1: TMenuItem
          Caption = 'Dados Principais'
          OnClick = Clientes1Click
        end
      end
      object Tiposlientes1_b: TMenuItem
        Caption = 'Tipos de C&lientes'
        Enabled = False
        HelpContext = 40061
        Visible = False
      end
      object TiposdeClientesxTiposdeRecebimento1_b: TMenuItem
        Caption = 'Ti&pos de Clientes x Tipos de Recebimento'
        Enabled = False
        HelpContext = 40062
        Visible = False
      end
      object Clientes1_b: TMenuItem
        Caption = 'Cl&ientes'
        Enabled = False
        HelpContext = 230055
        Visible = False
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Configurao1: TMenuItem
        Caption = 'Configuração de &Modelo de Bloquete'
        HelpContext = 40063
        OnClick = Configurao1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object Etiquetas1: TMenuItem
        Caption = '&Etiquetas'
        HelpContext = 40064
        object Configura1: TMenuItem
          Caption = '&Configura'
          HelpContext = 40065
          OnClick = Configura1Click
        end
        object Imprime2: TMenuItem
          Caption = '&Imprime'
          HelpContext = 40066
          OnClick = Imprime2Click
        end
      end
      object Saldo1: TMenuItem
        Caption = '&Saldo'
        HelpContext = 40086
        Visible = False
      end
      object Movimento1: TMenuItem
        Caption = '&Movimento'
        Enabled = False
        HelpContext = 40087
        Visible = False
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object Documentos3: TMenuItem
        Caption = '&Documentos'
        HelpContext = 40067
        OnClick = Documentos3Click
      end
      object Documentos2: TMenuItem
        Caption = '&Clientes'
        HelpContext = 40068
        OnClick = Documentos2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuLotesdeRecebimento: TMenuItem
        Caption = '&Lotes de Recebimento'
        HelpContext = 40069
        OnClick = mnuLotesdeRecebimentoClick
      end
    end
    object mnuRelatorio: TMenuItem
      Caption = 'Relatórios'
      Visible = False
      object Cadastros1: TMenuItem
        Caption = '&Cadastros'
        object Bancos2: TMenuItem
          Caption = '&Bancos'
        end
        object Portadores2: TMenuItem
          Caption = '&C&ontas/Caixas'
        end
        object FormasdeRecebimento2: TMenuItem
          Caption = '&Tipo de Cobrança'
        end
        object PortadorxFormadeRecebimento1: TMenuItem
          Caption = 'Co&ntas/Caixas x Tipo de Cobrança'
        end
        object TipodeDesembolso2: TMenuItem
          Caption = 'Tipo de &Recebimento'
        end
        object TipodeAlteradores1: TMenuItem
          Caption = 'Tipo de &Alteradores'
        end
        object TipodeDocumentos1: TMenuItem
          Caption = 'Tipo de &Documentos'
        end
        object N3: TMenuItem
          Caption = '-'
        end
        object Fornecedores1: TMenuItem
          Caption = 'C&lientes'
        end
      end
      object Portadores1: TMenuItem
        Caption = '&Operacionais'
        object DocumentoporDataPrograma1: TMenuItem
          Caption = 'Documento por &Data Programada'
        end
        object ContaCorrentedosFornecedores1: TMenuItem
          Caption = '&Conta Corrente dos Clientes'
        end
        object PosioporFornecedor1: TMenuItem
          Caption = 'Posição por C&liente'
        end
        object EntradadeDocumentos1: TMenuItem
          Caption = '&Entrada de Documentos'
        end
        object PagamentodeDocumentos1: TMenuItem
          Caption = '&Recebimento de Documentos'
        end
        object AlteradoresLanados1: TMenuItem
          Caption = '&Alteradores Lançados'
        end
        object Pagamento2: TMenuItem
          Caption = 'Rece&bimento'
        end
      end
      object FormasdeRecebimento1: TMenuItem
        Caption = '&Gerenciais'
        object Posioportipodedesembolso1: TMenuItem
          Caption = '&Posição por tipo de Recebimento'
          object SaldoaPagar1: TMenuItem
            Caption = '&Saldo a Receber'
          end
          object PagamentosEfetuados1: TMenuItem
            Caption = '&Recebimentos Efetivos'
          end
        end
        object OradoxRealizado1: TMenuItem
          Caption = '&Orçado x  Realizado'
        end
        object MaioresFornecedores1: TMenuItem
          Caption = '&Maiores Clientes'
        end
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 144
    Top = 40
  end
  inherited ImlPadrao: TImageList
    Bitmap = {
      494C01011D002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF00FFFF
      FF0084848400FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF0000840000008400000084000000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00C6C6
      C60000FFFF00008400000084000000840000008400000084000000FFFF00C6C6
      C60084848400C6C6C60000FFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000840000008400000084000000FFFF0000840000008400000084000000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF0000FFFF000084000000FFFF00FFFFFF008484840000840000008400000084
      000084848400FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00008400000084
      00000084000000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60084848400C6C6C60000FFFF000084
      0000008400000084000000FFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF000084000000840000FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF00FFFF
      FF0084848400FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900292929004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000039393900FFFFFF00FFFF
      FF00FFFFFF00CECECE00FFFFFF00FFFFFF00F7F7F700E7E7E700F7F7F700FFFF
      FF00FFFFFF003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000031313100DEDEDE00DEDE
      DE00DEDEDE00B5B5B500D6D6D600CECECE00A5A5A500A5ADAD00CECECE00DEDE
      DE00DEDEDE003131310000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000039393900F7F7F700F7F7
      F700F7F7F700C6C6C600F7F7F700EFEFEF007B8C8C005A737300ADB5B500EFEF
      EF00F7F7F7003131310000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000031313100DEDEDE00DEDE
      DE00DEDEDE00B5B5B500D6D6D600DEDEDE00A5B5B5006BA5A5005A8C8C009494
      9400DEDEDE003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000000000000292929006B6B6B006B6B
      6B006B6B6B00636363006B6B6B008C8C8C00D6D6D600A5A5A5007BBDBD004A7B
      7B00A5A5A5001818180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200737300005A5A00006363
      00006B6B00005A5A00006B6B0000525208006B6B5A009C9C9C007B7B7B007BCE
      CE004A4A4A003131310039393900000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200BDBD000052520000ADAD
      00004A4A00007B7B000084840000393908008C8C8400DEDEDE00F7F7F7009494
      94007BD6D600425A5A000000000031313100000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF00000000000000
      0000FF00000000000000FF000000FF0000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200ADAD0000292900004A4A
      000052520000313100005A5A00003939080063635A009C9C9C00A5A5A500ADAD
      AD005252520073EFEF00424A4A00212121000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000FF00000000000000FF000000FF0000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200BDBD00006B6B0000A5A5
      00006363000084840000848400004A4A08008C8C8400DEDEDE00F7F7F700FFFF
      FF00FFFFFF00313131006BADAD0021212100000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF0084848400FF00
      0000FF000000FF000000FF000000FF0000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200B5B50000313100007373
      00004A4A00004A4A000063630000393908007B7B7300C6C6C600D6D6D600DEDE
      DE00DEDEDE0031313100636363005A5A5A000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000005A5A5200BDBD0000525200008C8C
      00005A5A00006B6B00007B7B00004242080084847B00D6D6D600EFEFEF00F7F7
      F700F7F7F700313131000000000000000000000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF0084848400FF00
      0000FF000000FF00000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000005A5A5200B5B50000737300008C8C
      0000737300007B7B0000848400005252080052524A00636363005A5A5A005A5A
      5A005A5A5A004A4A4A0000000000000000000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000FF0000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000005A5A5200ADAD000084847B00DEDE
      D600DEDED600DEDED600B5B5A5003131100063635A0000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5200B5B50000525200005252
      00005252000052520000525200004A4A08006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031311800292900002929
      0000292900002929000029290000313121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000FFFF00008484
      8400848484000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFF000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000000000008484
      8400848484000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000840000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00008400000084000000840000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000084000000
      8400000084000000FF0000008400000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000084848400008484000000
      0000000000000000000000848400008484000084840000000000000000000000
      0000008484008484840000000000000000008484840084848400848484008484
      8400848484008484840000008400000084000000840000008400000084000000
      8400000084000000FF0000008400000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000000000008484840000FFFF000084
      8400000000000084840000000000000000000000000000848400000000000084
      8400000000008484840000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000084848400FFFFFF00FFFF
      FF000084840000000000FFFFFF00FFFFFF0000FFFF0000000000008484000000
      0000000000008484840000000000000000008484840000848400000000000000
      0000000000000084840000848400008484000000000000000000000000000084
      8400000084000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000FFFF008484840000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      840000000000848484000000000000FFFF008484840000FFFF00008484000000
      0000008484000000000000000000000000000084840000000000008484000000
      0000848484000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000084848400FFFFFF000000
      000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      00000084840084848400000000000000000084848400FFFFFF00FFFFFF000084
      840000000000FFFFFF00FFFFFF0000FFFF000000000000848400000000000000
      0000848484000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF008400000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00000000000084840000000000000000008484840000FFFF00000000000000
      0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000008484000000
      0000848484000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000084848400FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF0000000000000000000000000084848400000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00000000000084
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000008484840000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF00000000000000000084848400FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C600000000000000000000FFFF000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000084840000848400008484000000000000FFFF0000FFFF000084
      84000084840000848400000000000000000000000000000000000084840000FF
      FF00000000000084840000000000008484000084840000000000000000000000
      0000008484000084840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000FFFF0000FFFF000084
      84000084840000848400000000000000000000000000000000000084840000FF
      FF0000000000008484000084840000848400FFFFFF000000000000FFFF000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00848484000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      84000084840000848400000000000000000084848400000000000000000000FF
      FF0000FFFF00000000000084840000848400C6C6C60000848400000000000084
      8400FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000000000000000000000000000848400008484000000
      000000848400FFFFFF00FFFFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000FF
      FF00008484000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000848400008484000084
      8400FFFFFF0000FFFF000000000000000000000000000000000000000000C6C6
      C60000FFFF000000000000848400008484000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000FF000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      84000000000000848400000000000000000000848400FFFFFF0000848400FFFF
      FF0000FFFF008484840084848400FFFFFF008484840084848400000000000084
      8400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF000000FF000000000000FF000000FF000000FF000000000000FF000000FF00
      0000FF000000848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000000084840000848400008484000084
      8400FFFFFF008484840084848400FFFFFF00C6C6C60084848400000000008484
      840000FFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000FF000000FF000000FF000000FF000000FF000000000000FF00
      0000000000000000000000000000000000000000000000000000848484008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000000000000000000000084
      8400FFFFFF00FFFFFF0084848400FFFFFF00848484008484840000000000FFFF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000000000000000000000848400FFFF
      FF0000FFFF0000FFFF0084848400FFFFFF00C6C6C60084848400000000000084
      8400FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000084
      8400008484008484840084848400C6C6C6008484840084848400000000008484
      8400008484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF00000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      84000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF00008484
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF00008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840084008400840084008400
      84008400840084008400FF00FF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840084008400000000000000
      0000840084008400840084008400000000000000000000000000424200004242
      0000424200004242000042420000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484008484
      8400000000008484000000000000000000000000000000000000FFFF00000000
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840000000000FF00FF008400
      8400000000008400840084008400000000000000000042420000008400000084
      000000840000008400000084000042420000FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFF000084840000000000000000000000000000FFFF00000000
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008400840000000000FF00FF008400
      8400000000008400840000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FF000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF008400
      8400000000000000000000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF0084848400848484000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000042420000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084840000848400008484
      000000000000FFFF000084840000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0084008400840084008400
      8400840084008400840000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0084008400840084008400
      8400840084008400840000000000000000000000000000840000008400000084
      0000008400000084000000840000424200008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400840084008400
      8400840084000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000422163004221630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000FFFF000000000000FFFF000000000000FFFF
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF000000848400FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004221630042216300FFC6C6004263630042216300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      00000000000000848400FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004221
      630042216300FFC6C600FFC6C600846384008421630042636300422163000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000084
      84000084840000848400FFFF000084008400FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FFFF00000000000000000000000000004221630042216300FFC6
      C600FFC6C6008484840084216300842163008421630042636300426363004221
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFF00000084
      840000848400008484000084840084008400FF00FF00FF00FF00000000000000
      0000FFFF00000000000000000000000000004221630000002100FFC6C6008484
      8400842163008421630084216300842163008421630084216300426363004263
      6300422163000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF000084840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000C6C6C6000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00000084
      840000848400008484000000000000FFFF000000000000000000000000000000
      0000848484000000000000000000000000004221630000002100846384008421
      63008421630042FFFF0084216300842163008421630084216300842163004263
      6300426363004221630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000000848400848484000000000000FFFF000000000000000000000000000000
      0000848484000000000000000000000000004221630084216300842163008421
      6300842163008421630084848400842163008421630084216300842163008421
      63004263630042636300422163000000000000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000084840000FFFF000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000C6C6C6000000
      00000000000000000000000000000000000000000000FFFF0000000000000084
      8400FFFF00000000000000FFFF00000000008484840000000000000000008484
      840084848400848484000000000000000000FF63840084218400842163008421
      6300842163008421630042C6C60042FFFF008421630084216300842163008421
      630084216300426363004263630042216300000000000084840000FFFF000084
      840000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C6000000000000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000FFFF00000084
      84008484840000FFFF0000FFFF00000000000000000000000000000000000000
      00008484840084848400000000000000000000000000FF638400842184008421
      630084216300842163008421630042C6C60042FFFF0000FFFF0000FFFF008463
      630084216300842163004263630084A5A5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FF000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      00008484840000FFFF0000FFFF00000000000000000000000000C6C6C6000000
      0000848484008484840084848400000000000000000000000000FF6384008421
      84008421630084216300842163008421630084216300842163008421630000FF
      FF0084636300842163008421630084A5A5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      84008421840084216300842163008463840084216300842163008421630000FF
      FF00842163008421630084216300842184000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000084848400000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000FF63840084218400842163008463840042C6C60000FFFF0000FFFF008421
      6300842163008421630084218400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63840084218400842163008421630084216300842163008421
      6300842184000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF638400842184008421630084216300842184000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF6384008421840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      FFFF000000000000FFFF000000000000FFFFFFFF8003FFFF800380038003F00F
      800380038003F00F800380038003F00F800380038003FFF3800380038003FFF9
      800380030001801C800380030002801480038003000080148003800300008000
      80038003000080018003800300038003800380030003801780038003007F8017
      FFFFFFFF007FFFFFFFFFFFFF80FFFFFFFFFFFFFFFFFFFC00FFFFF9FF000CFC00
      FFFFF9FF0008FC00FFFFF3C70001FC00FFFF73C70063E000FFF727FF00C3E000
      C1F707C701EBE000C3FB00C7016BE007C7FB01E300238007CBFB03F100678007
      DCF70638000F8007FF0F0E38000F801FFFFF1E38000F801FFFFF3F01005F801F
      FFFF7F83003F801FFFFFFFFF007FFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
      FE00F6CFEFFD8000FE00F6B7C7FF0000FE00F6B7C3FB00008000F8B7E3F70000
      8000FE8FF1E700018000FE3FF8CF00038000FF7FFC1F00038001FE3FFE3F0003
      8003FEBFFC1F00038007FC9FF8CF0FC3807FFDDFE1E7000380FFFDDFC3F38007
      81FFFDDFC7FDF87FFFFFFFFFFFFFFFFFFEFFFFF7FFFFFFFFBC3DFFF30001FFFF
      8001FC010005FE008001FC000005FE00BFF900000005FE009C71000100058000
      80297FF300058000801938E30005800000081053000580008001003300058001
      8001201300058003800140030003800780010003FF07807FCC330003FF8F80FF
      BEFD0003FF8F81FFFEFFFFFFFFDFFFFFFFFFFFFF800FFFFFFFFFF83F8007FE3F
      83E090108003C22383E0E00F8001C00183E0C0078001C0018360800380010000
      EE3B800380010000EC1B8003DFE10000E0038003C0010000FC1F8003C0710000
      FE3FC007C089C001FF7FE00FF713C001FC1FB018FA23E003FC1FF83FFC43FC1F
      FC1FFFFFFE8FFE3FFC1FFFFFFE3FFFFFEA8FFFFFFFFFFF1FD505BFCFFF9FFC0F
      AA829FCFFE1FF00F01008F03F81FE00FF8018601E00FE007F3818400E00FF007
      F3818C00C007C003C1919C008007C0018081BE010003C0000001FF030001E001
      0081FF870000E0078181FF030001F003F181FE010007F001F5C1FE01801FF803
      FDE1FF03C1FFFC0FFC03FF87FFFFFE3FFFFFFFFFE007E1FFFE7FFFFFE007C0FF
      F83FFFFFE08F807FE01FFFFFF03F8001800FFFC3F91F00230007FF81F04F0047
      0003EB00F18F008300018002E04F000100000002E1A780E180000000E00F80C0
      C000FF81E19FC0F1E000FFC3E05FE081F001FFFFE0BFF0E1F807FFFFE01FF801
      FC1FFFFFF03FFC03FE7FFFFFFFFFFE1F00000000000000000000000000000000
      000000000000}
  end
  inherited AclPadrao: TActionList
    Top = 288
    object mnudocregistra: TAction
      Caption = 'Registra'
      Hint = 'Lançamento de Documentos'
      ImageIndex = 27
      OnExecute = mnudocregistraExecute
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 246
    Top = 152
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}'
    ServerName = 'CMCapCarSvr50.DmCapCarSrv50'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{BE0D13C9-4142-4C83-908B-B2A8E09B33B9}'
    ServerName = 'CMCapCarSvr50.DmCapCarSrv50'
  end
  inherited CorreioCM: TCorreioCM
    Left = 16
    Top = 96
  end
  object dbVH: TCMDatabase
    DatabaseName = 'BaseVh'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=CMFRONT'
      'USER NAME=CMF'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=TRUE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=MARCAO')
    SessionName = 'Default'
    Left = 16
    Top = 40
  end
end
