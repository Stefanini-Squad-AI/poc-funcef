inherited frmIntEntNotaCont: TfrmIntEntNotaCont
  Left = 147
  Top = 142
  Caption = 'Integra Entrada de Nota na Contabilidade'
  ClientHeight = 191
  ClientWidth = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 433
    Height = 152
    object prgBarIntegracao: TProgressBar
      Left = 5
      Top = 125
      Width = 423
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 0
      Visible = False
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 423
      Height = 120
      Align = alClient
      BevelInner = bvLowered
      BevelWidth = 2
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Memo1: TMemo
        Left = 4
        Top = 4
        Width = 415
        Height = 112
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsItalic]
        Lines.Strings = (
          'Este procedimento lançará na '
          'contabilidade todas as notas fiscais que '
          'não foram integradas.')
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 152
    Width = 433
    inherited tb97Fundo: TToolbar97
      Left = 113
      DockPos = 113
      inherited sep1: TToolbarSep97
        Left = 234
      end
      inherited bbtnSair: TBitBtn
        Left = 154
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 236
      end
      object bbtnIntegra: TBitBtn
        Left = 0
        Top = 0
        Width = 154
        Height = 33
        Cancel = True
        Caption = '&Integra'
        TabOrder = 2
        OnClick = bbtnIntegraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333333FFFFF3333333333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC377777737F777777F008888070888
          8003773FFF7773FFF77F0F0770F7F0770F037F777737F777737F70FFFFF7FFFF
          F07373F3FFF7F3FFF37F70F000F7F000F07337F77737F777373330FFFFF7FFFF
          F03337FF3FF7F3FF37F3370F00F7F00F0733373F7737F77337F3370FFFF7FFFF
          0733337F33373F337333330FFF030FFF03333373FF7373FF7333333000333000
          3333333777333777333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  object dsContab: TwwDataSource
    DataSet = qryContab
    Left = 88
    Top = 13
  end
  object qryContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM LANCAMENTO '
      'WHERE (1=2)')
    UpdateObject = updContab
    ValidateWithMask = True
    Left = 145
    Top = 15
    object qryContabLACNUMLAN: TFloatField
      DisplayLabel = 'Lanç.'
      DisplayWidth = 6
      FieldName = 'LACNUMLAN'
      Origin = 'LANCAMENTO.LACNUMLAN'
    end
    object qryContabLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Origin = 'LANCAMENTO.LACDEBCRE'
      Size = 1
    end
    object qryContabPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'LANCAMENTO.PLACONTA'
      Size = 18
    end
    object qryContabCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCAMENTO.CODSUBCONTA'
    end
    object qryContabLACVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      Origin = 'LANCAMENTO.LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabLACNUMDOC: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'LACNUMDOC'
      Origin = 'LANCAMENTO.LACNUMDOC'
      Size = 15
    end
    object qryContabLACHIST1: TStringField
      DisplayLabel = 'Histórico 1'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Origin = 'LANCAMENTO.LACHIST1'
      Size = 40
    end
    object qryContabLACHIST2: TStringField
      DisplayLabel = 'Histórico 2'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Origin = 'LANCAMENTO.LACHIST2'
      Size = 40
    end
    object qryContabUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCAMENTO.UNIDNEGOC'
    end
    object qryContabCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCAMENTO.CODCENTROCUSTO'
      Size = 10
    end
    object qryContabPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCAMENTO.PLNCODIGO'
      Visible = False
    end
    object qryContabIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'LANCAMENTO.IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Origin = 'LANCAMENTO.HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LANCAMENTO.IDPESSOA'
      Visible = False
    end
    object qryContabIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'LANCAMENTO.IDEMPRESA'
      Visible = False
    end
    object qryContabIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'LANCAMENTO.IDMODULO'
      Visible = False
    end
    object qryContabIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LANCAMENTO.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
      Visible = False
    end
    object qryContabLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Origin = 'LANCAMENTO.LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabLACHIST3: TStringField
      FieldName = 'LACHIST3'
      Origin = 'LANCAMENTO.LACHIST3'
      Visible = False
      Size = 40
    end
    object qryContabLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Origin = 'LANCAMENTO.LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Origin = 'LANCAMENTO.LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Origin = 'LANCAMENTO.LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Origin = 'LANCAMENTO.LACVALOFICIAL'
      Visible = False
    end
    object qryContabLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Origin = 'LANCAMENTO.LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Origin = 'LANCAMENTO.LACVALGERENCIAL'
      Visible = False
    end
    object qryContabLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Origin = 'LANCAMENTO.LACVALGEREN1'
      Visible = False
    end
    object qryContabLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Origin = 'LANCAMENTO.LACVALGEREN2'
      Visible = False
    end
    object qryContabLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Origin = 'LANCAMENTO.LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Origin = 'LANCAMENTO.LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'LANCAMENTO.TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabLACVALHIST: TFloatField
      FieldName = 'LACVALHIST'
      Origin = 'LANCAMENTO.LACVALHIST'
      Visible = False
    end
    object qryContabLOTETRANSMISSAO: TFloatField
      FieldName = 'LOTETRANSMISSAO'
      Origin = 'LANCAMENTO.LOTETRANSMISSAO'
      Visible = False
    end
    object qryContabTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'LANCAMENTO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryContabTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'LANCAMENTO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object updContab: TUpdateSQL
    Left = 20
    Top = 10
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT N.IDNFRECEBDEVOL,N.IDFORCLI,N.CODDOCUMENTO,'
      'N.NUMNF,N.COMPLNF,N.DATAENTDEVOL,N.VLRNOTAFISCAL,'
      'L.VALOR ,L.NUMLANCTO '
      'FROM NFRECEBDEVOL N, DOCUMENTO D,LANCTODOCUM L  '
      'WHERE (N.IDPESSOA = :IDPESSOA) AND '
      '(N.PLNCODIGO IS NULL) AND '
      '(N.FLGTIPONOTA = '#39'R'#39') AND '
      '(D.CODDOCUMENTO = N.CODDOCUMENTO) AND '
      '(D.CODDOCUMENTO = L.CODDOCUMENTO) AND '
      '(D.OPERACAO = L.OPERACAO)')
    ValidateWithMask = True
    Left = 221
    Top = 14
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,    '#9
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      P.DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      A.CODCOR,'
      '      A.CODTAMANHO'
      'FROM '
      '      ITENSRECEBDEVOL I, '
      '      PRODUTO P, '
      '      ARTIGO A'
      'WHERE '
      '    ( I.IDNFRECEBDEVOL = :pNUMIDNF)'
      '    AND (I.CODARTIGO = A.CODARTIGO) '
      '    AND (P.CODPRODUTO = A.CODPRODUTO)')
    ValidateWithMask = True
    Left = 264
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object qryAgregItemDef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         A.CODTIPOCUSTAGREG,'
      '        T.CODTRATFISCE,'
      '         A.IDAGRITENSRECDEV,'
      '         A.IDITENSRECDEV,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO,'
      '         A.VLRRECUPERADO '
      'FROM'
      '         AGRITENSRECDEV A,'
      '         TIPOAGRE T,'
      '         ITENSRECEBDEVOL I'
      'WHERE'
      '          (I.IDNFRECEBDEVOL = :iAgregItem)'
      '          AND (A.IDITENSRECDEV = I.IDITENSRECDEV)'
      '          AND (A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)')
    ValidateWithMask = True
    Left = 333
    Top = 14
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregItem'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object qryAgregNota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRNFRECDEV,'
      '         A.IDNFRECEBDEVOL,'
      '         A.IDNFCOMPLEMENTAR,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO,'
      '         A.VLRRECUPERADO  '
      'FROM'
      '         TIPOAGRE T,'
      '         AGRNFRECDEV A'
      'WHERE'
      '           ( A.IDNFRECEBDEVOL = :iAgregNota)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)')
    ValidateWithMask = True
    Left = 18
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
        Value = Null
      end>
    object qryAgregNotaALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaBASECALCULO: TFloatField
      DisplayLabel = 'Base de Cálculo'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaVLRAGREGADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGADO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryAgregNotaCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Visible = False
      Size = 1
    end
    object qryAgregNotaPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Visible = False
      Size = 1
    end
    object qryAgregNotaIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryAgregNotaIDNFCOMPLEMENTAR: TFloatField
      FieldName = 'IDNFCOMPLEMENTAR'
      Visible = False
    end
    object qryAgregNotaIDAGRNFRECDEV: TFloatField
      FieldName = 'IDAGRNFRECDEV'
      Visible = False
    end
    object qryAgregNotaVLRRECUPERADO: TFloatField
      FieldName = 'VLRRECUPERADO'
      Visible = False
    end
    object qryAgregNotaDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
  end
  object qryAgregNFCompl: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRNFRECDEV,'
      '         A.IDNFRECEBDEVOL,'
      '         A.IDNFCOMPLEMENTAR,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO, '
      '         A.VLRRECUPERADO '
      'FROM'
      '         TIPOAGRE T,'
      '         AGRNFRECDEV A'
      'WHERE'
      '           ( A.IDNFRECEBDEVOL = :iAgregNF)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)')
    ValidateWithMask = True
    Left = 105
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregNF'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryAgregNFComplALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNFComplBASECALCULO: TFloatField
      DisplayLabel = 'Base de Cálculo'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNFComplVLRAGREGADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGADO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNFComplCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryAgregNFComplCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Visible = False
      Size = 1
    end
    object qryAgregNFComplPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Visible = False
      Size = 1
    end
    object qryAgregNFComplIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryAgregNFComplIDNFCOMPLEMENTAR: TFloatField
      FieldName = 'IDNFCOMPLEMENTAR'
      Visible = False
    end
    object qryAgregNFComplIDAGRNFRECDEV: TFloatField
      FieldName = 'IDAGRNFRECDEV'
      Visible = False
    end
    object qryAgregNFComplVLRRECUPERADO: TFloatField
      FieldName = 'VLRRECUPERADO'
    end
    object qryAgregNFComplDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
  end
  object qryNFAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT  N.IDNFRECEBDEVOL,N.NUMNF,   N.COMPLNF,  '
      '                 N.DATAEMISNF,  D.DATAVENCTO, N.CODFISCAL,'
      '                 N.IDFORCLI,  N.DATAENTDEVOL, N.IDPESSOA,'
      '                 N.CODDOCUMENTO,L.VALOR,'
      '                N.FLGTIPONOTA,N.IDNFREFERENCIA, '
      '                 N.VLRNOTAFISCAL,  N.PLNCODIGO  '
      ' FROM     NFRECEBDEVOL N,'
      '                 DOCUMENTO D,'
      '                 LANCTODOCUM L '
      '  WHERE  (N.IDNFRECEBDEVOL = :pIDNFCompl)'
      '                 AND (D.CODDOCUMENTO = N.CODDOCUMENTO) '
      '                 AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '
      '                 AND (D.OPERACAO = L.OPERACAO)'
      '')
    ValidateWithMask = True
    Left = 186
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDNFCompl'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryNFAgregIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Origin = 'NFRECEBDEVOL.IDNFRECEBDEVOL'
    end
    object qryNFAgregNUMNF: TFloatField
      FieldName = 'NUMNF'
      Origin = 'NFRECEBDEVOL.NUMNF'
    end
    object qryNFAgregCOMPLNF: TStringField
      FieldName = 'COMPLNF'
      Origin = 'NFRECEBDEVOL.COMPLNF'
      Size = 5
    end
    object qryNFAgregDATAEMISNF: TDateTimeField
      FieldName = 'DATAEMISNF'
      Origin = 'NFRECEBDEVOL.DATAEMISNF'
    end
    object qryNFAgregDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object qryNFAgregCODFISCAL: TStringField
      FieldName = 'CODFISCAL'
      Origin = 'NFRECEBDEVOL.CODFISCAL'
      Size = 4
    end
    object qryNFAgregIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'NFRECEBDEVOL.IDFORCLI'
    end
    object qryNFAgregDATAENTDEVOL: TDateTimeField
      FieldName = 'DATAENTDEVOL'
      Origin = 'NFRECEBDEVOL.DATAENTDEVOL'
    end
    object qryNFAgregVLRNOTAFISCAL: TFloatField
      FieldName = 'VLRNOTAFISCAL'
      Origin = 'NFRECEBDEVOL.VLRNOTAFISCAL'
      DisplayFormat = '#,##0.00'
    end
    object qryNFAgregPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'NFRECEBDEVOL.PLNCODIGO'
    end
    object qryNFAgregIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'NFRECEBDEVOL.IDPESSOA'
    end
    object qryNFAgregCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'NFRECEBDEVOL.CODDOCUMENTO'
    end
    object qryNFAgregFLGTIPONOTA: TStringField
      FieldName = 'FLGTIPONOTA'
      Origin = 'NFRECEBDEVOL.FLGTIPONOTA'
      Size = 1
    end
    object qryNFAgregIDNFREFERENCIA: TFloatField
      FieldName = 'IDNFREFERENCIA'
      Origin = 'NFRECEBDEVOL.IDNFREFERENCIA'
    end
    object qryNFAgregVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'LANCTODOCUM.VALOR'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 277
    Top = 77
  end
  object qryFornecedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '          EF.IDFORCLI,'
      '          P.NOME,'
      '          P.RAZAOSOCIAL,'
      '          EF.IDFORCLI,'
      '          EF.CONTACFORN,'
      '          EF.CODCENTROCUSTO,'
      '          EF.CODSUBCONTA '
      'FROM '
      '          PESSOA P,'
      '          EMPRESAFORN EF '
      'WHERE'
      '          (EF.IDFORCLI = :iForCli) AND '
      '          (EF.IDPESSOA = :iEmpresa) AND '
      '          (P.IDPESSOA = EF.IDFORCLI)')
    ValidateWithMask = True
    Left = 361
    Top = 69
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iForCli'
        ParamType = ptUnknown
        Value = 100
      end
      item
        DataType = ftFloat
        Name = 'iEmpresa'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryAuxFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 357
    Top = 117
  end
end
