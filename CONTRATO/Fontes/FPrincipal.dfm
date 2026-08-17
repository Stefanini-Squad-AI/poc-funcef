inherited frmPrincipal: TfrmPrincipal
  Left = 227
  Top = 203
  Caption = 'Contratos e Projetos'
  ClientHeight = 367
  ClientWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 676
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 23
    Top = 84
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 347
    Width = 676
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
        Text = '29/05/2024 10:21'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 33
  end
  inherited mnu: TMainMenu
    Left = 394
    Top = 36
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object mnuParamAditamento: TMenuItem [1]
          Caption = 'Parâmetros de Aditamento'
          HelpContext = 120013
          OnClick = mnuParamAditamentoClick
        end
      end
    end
    object Operao1: TMenuItem [2]
      Caption = '&Operação'
      HelpContext = 120001
      object mnuMedicao1: TMenuItem
        Caption = '&Medição'
        HelpContext = 120002
        OnClick = mnuMedicao1Click
      end
      object mnuAltDtVencAP1: TMenuItem
        Caption = 'Alteração de Data Venc. AP'
        OnClick = mnuAltDtVencAP1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuGeracaoContrato1: TMenuItem
        Caption = '&Geração Contrato'
        HelpContext = 120003
        OnClick = mnuGeracaoContrato1Click
      end
      object mnuExcluiParcela: TMenuItem
        Caption = 'Exclusão/Estorno de Parcelas sem Medição'
        HelpContext = 120027
        OnClick = mnuExcluiParcelaClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object miReajustes: TMenuItem
        Caption = 'Reajustes Contratuais'
        HelpContext = 120019
        OnClick = miReajustesClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object NotaFiscal1: TMenuItem
        Caption = '&Nota Fiscal'
        HelpContext = 120030
        object mnuModeloNF: TMenuItem
          Caption = '&Modelo'
          HelpContext = 120031
          OnClick = mnuModeloNFClick
        end
        object mnuImpressaoNF: TMenuItem
          Caption = '&Impressão'
          HelpContext = 120032
          OnClick = mnuImpressaoNFClick
        end
        object CancelamentodeEmisso1: TMenuItem
          Caption = '&Cancelamento de Emissão'
          HelpContext = 120033
          OnClick = CancelamentodeEmisso1Click
        end
      end
      object mnuOperacaoOrcamentaria: TMenuItem
        Caption = 'Apuração Orçamentária'
        HelpContext = 120028
        OnClick = mnuOperacaoOrcamentariaClick
      end
      object LancamentoOramento: TMenuItem
        Caption = 'Lançamento Orçamentário'
        HelpContext = 120029
        OnClick = LancamentoOramentoClick
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 120004
      object mnuObjetoContratual1: TMenuItem
        Caption = 'Serviço/Produto'
        HelpContext = 120005
        OnClick = mnuObjetoContratual1Click
      end
      object mnuItemContratual1: TMenuItem
        Caption = 'Item Contratual'
        HelpContext = 120006
        OnClick = mnuItemContratual1Click
      end
      object mnuObjetoxItem1: TMenuItem
        Caption = 'Serviço/Produto x Item'
        HelpContext = 120007
        OnClick = mnuObjetoxItem1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuCadastrodeAlcadas: TMenuItem
        Caption = 'Alçadas'
        OnClick = mnuCadastrodeAlcadasClick
      end
      object mnuCadastrodeContratos1: TMenuItem
        Caption = 'Contratos'
        HelpContext = 120008
        OnClick = mnuCadastrodeContratos1Click
      end
      object mnuObjetoxItemContratual1: TMenuItem
        Caption = 'Serviço/Produto x Item Contratual'
        HelpContext = 120009
        OnClick = mnuObjetoxItemContratual1Click
      end
      object mnuAltAditamento: TMenuItem
        Caption = 'Alteração/Exclusão do Aditamento'
        OnClick = mnuAltAditamentoClick
      end
      object mnuAlteracaoEncerramento: TMenuItem
        Caption = 'Alteração de Encerramento'
        OnClick = mnuAlteracaoEncerramentoClick
      end
      object mnuImagensdoContrato1: TMenuItem
        Caption = 'Imagens/Anexos do Contrato'
        HelpContext = 120010
        OnClick = mnuImagensdoContrato1Click
      end
      object mnuUsurioxContratos1: TMenuItem
        Caption = 'Usuário x Contratos'
        HelpContext = 120011
        OnClick = mnuUsurioxContratos1Click
      end
      object mnuContratoXUsurios1: TMenuItem
        Caption = 'Contrato X Usuários'
        OnClick = mnuContratoXUsurios1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuResponsvel1: TMenuItem
        Caption = 'Responsável'
        HelpContext = 120012
        OnClick = mnuResponsvel1Click
      end
      object mnuProjetos1: TMenuItem
        Caption = 'Projetos'
        HelpContext = 120013
        Visible = False
      end
      object mnuCliente1: TMenuItem
        Caption = 'Cliente '
        HelpContext = 120014
        OnClick = mnuCliente1Click
      end
      object mnuFornecedor1: TMenuItem
        Caption = 'Fornecedor'
        HelpContext = 120015
        OnClick = mnuFornecedor1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCorrecoes: TMenuItem
        Caption = 'Reajustes Contratuais / Procedimentos de Cálculo'
        HelpContext = 120023
        OnClick = mnuCorrecoesClick
      end
      object mnuReferencias: TMenuItem
        Caption = 'Referências Contratuais'
        HelpContext = 120024
        object mnuQualificacao: TMenuItem
          Caption = 'Qualificação'
          HelpContext = 120025
          OnClick = mnuQualificacaoClick
        end
        object mnuValores: TMenuItem
          Caption = 'Valores'
          HelpContext = 120026
          OnClick = mnuValoresClick
        end
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        Enabled = False
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = 'Geral de Pessoa'
        Enabled = False
      end
      inherited mnuVariacaoIndices: TMenuItem
        HelpContext = 80
      end
      object mnuVencimentosContratos: TMenuItem
        Caption = 'Vencimentos Contratos'
        HelpContext = 120017
        OnClick = mnuVencimentosContratosClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuConsultaContratos: TMenuItem
        Caption = 'Contrato'
        HelpContext = 120016
        Visible = False
        OnClick = mnuConsultaContratosClick
      end
      object mnuContratoOriginal1: TMenuItem
        Caption = 'Contratos '
        HelpContext = 120018
        OnClick = mnuContratoOriginal1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
    inherited mnuAjuda: TMenuItem
      inherited mnuAjudaIndice: TMenuItem
        HelpContext = 230041
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 334
    Top = 33
  end
  inherited ImlPadrao: TImageList
    Left = 448
    Top = 32
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 456
    Top = 200
  end
  inherited Skt: TSocketConnection
    Top = 32
  end
  inherited Dcom: TDCOMConnection
    Left = 152
    Top = 32
  end
  inherited Web: TWebConnection
    Left = 208
    Top = 32
  end
  inherited CorreioCM: TCorreioCM
    Left = 270
    Top = 32
  end
  inherited ResourceManager: TCMResourceManager
    Left = 104
    Top = 200
  end
  object qryIntegraContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  P.MASCARA, C.PLANO, C.PACESTORNA '
      'FROM '
      '  PLANO P, PARAMCONTAB C '
      'WHERE '
      '  ( C.IDPESSOA =:EMPRESAPROP ) '
      '  AND'
      '  ( P.PLANO=C.PLANO )')
    ValidateWithMask = True
    Left = 504
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryIntegraContabMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
    object qryIntegraContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PARAMCONTAB.PLANO'
    end
    object qryIntegraContabPACESTORNA: TStringField
      FieldName = 'PACESTORNA'
      Origin = 'PARAMCONTAB.PACESTORNA'
      Size = 1
    end
  end
  object spAux: TCMSqlParams
    SQL.Strings = (
      'select'
      '   0 AS IDCONTRATO,'
      '   '#39' '#39' AS NOMECONTRATO,'
      '   TO_DATE('#39'01/01/2002'#39', '#39'dd/mm/yyyy'#39') AS DATAPROXCORR'
      'from DUAL where (1=2)'
      ' ')
    Left = 504
    Top = 200
  end
end
