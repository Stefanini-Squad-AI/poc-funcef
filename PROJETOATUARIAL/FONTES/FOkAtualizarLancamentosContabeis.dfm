inherited frmOkAtualizarLancamentosContabeis: TfrmOkAtualizarLancamentosContabeis
  Left = 372
  Top = 357
  HelpContext = 40337
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Atualizar Lançamentos Contábeis'
  ClientHeight = 297
  ClientWidth = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 487
    Height = 258
    object Label2: TLabel
      Left = 30
      Top = 27
      Width = 63
      Height = 13
      Caption = 'Referência'
    end
    object Label3: TLabel
      Left = 30
      Top = 79
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label1: TLabel
      Left = 30
      Top = 129
      Width = 144
      Height = 13
      Caption = 'Centro de Custo (Crédito)'
    end
    object Label4: TLabel
      Left = 30
      Top = 177
      Width = 141
      Height = 13
      Caption = 'Centro de Custo (Débito)'
    end
    object DtTmPckrReferencia: TDateTimePicker
      Left = 30
      Top = 42
      Width = 113
      Height = 21
      CalAlignment = dtaLeft
      Date = 38447
      Time = 38447
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = DtTmPckrReferenciaChange
    end
    object ChckBxEstorno: TCheckBox
      Left = 30
      Top = 228
      Width = 154
      Height = 17
      Caption = 'Estornar Lançamentos'
      TabOrder = 1
    end
    object ChckBxSimulado: TCheckBox
      Left = 217
      Top = 41
      Width = 67
      Height = 17
      Caption = 'Simular'
      TabOrder = 2
    end
    object DBLkpCmbBxUnidadeNegocio: TwwDBLookupCombo
      Left = 30
      Top = 96
      Width = 429
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'UNECODIGO'#9'10'#9'CÓDIGO'#9'F'
        'NOME'#9'25'#9'NOME'#9'F')
      LookupTable = QryUnidadeNegocio
      LookupField = 'UNIDNEGOC'
      Options = [loColLines, loRowLines]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBLkpCmbBxCentroCustoC: TwwDBLookupCombo
      Left = 30
      Top = 143
      Width = 429
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODEXTERNO'#9'10'#9'CÓDIGO'#9'F'
        'NOME'#9'30'#9'NOME'#9'F')
      LookupTable = QryCentroCustoC
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines, loRowLines]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBLkpCmbBxCentroCustoD: TwwDBLookupCombo
      Left = 30
      Top = 191
      Width = 429
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODEXTERNO'#9'10'#9'CÓDIGO'#9'F'
        'NOME'#9'30'#9'NOME'#9'F')
      LookupTable = QryCentroCustoD
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines, loRowLines]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 487
    inherited tb97Fundo: TToolbar97
      Left = 315
      DockPos = 456
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 146
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
    object Toolbar971: TToolbar97
      Left = 47
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 84
      TabOrder = 2
      object ToolbarSep972: TToolbarSep97
        Left = 92
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object BtBtnDesfazer: TBitBtn
        Left = 0
        Top = 0
        Width = 92
        Height = 33
        Caption = '&Desfazer'
        Default = True
        TabOrder = 0
        OnClick = BtBtnDesfazerClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C0000
          1F7C1F7C1F7C000000000000000000000000007C007C007C007C007C007C007C
          00001F7C1F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
          007C00001F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
          007C007C00000000FF7F00000000FF7F0000007C007C007C007C007C007C007C
          007C00001F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
          00001F7C1F7C0000FF7F00000000FF7FFF7FFF7FFF7FFF7F0000007C007C0000
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000007C00001F7C
          1F7C1F7C1F7C0000FF7F00000000FF7F0000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F0000FF7FFF7F00001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C0000FF7F0000F75EFF7F0000FF7F00001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F000000001F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C0000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 295
    Top = 34
  end
  object QryIntegracaoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.CD_CONTA_CONTABIL,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.IR_TIPO_CONTA,'
      '       FI_CONTA_INTEGRACAO_CONTABIL.DS_HISTORICO_PADRAO,'
      '       FI_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC,'
      '       FI_INTEGRACAO_CONTABIL.CD_PLANO,'
      '       FI_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL,'
      '       FI_INTEGRACAO_CONTABIL.DT_REFERENCIA,'
      '       FI_INTEGRACAO_CONTABIL.VL_VARIAVEL'
      'FROM FI_CONTA_INTEGRACAO_CONTABIL,'
      '     FI_INTEGRACAO_CONTABIL'
      
        'WHERE FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_PATROC = FI_INTEGRA' +
        'CAO_CONTABIL.CD_PESSOA_PATROC'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PESSOA_ENTID = FI_INTEGRAC' +
        'AO_CONTABIL.CD_PESSOA_ENTID'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_PLANO = FI_INTEGRACAO_CONT' +
        'ABIL.CD_PLANO'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.CD_GRUPO_CONTABIL = FI_INTEGR' +
        'ACAO_CONTABIL.CD_GRUPO_CONTABIL'
      
        '  AND FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL = FI_INTEGRACAO_C' +
        'ONTABIL.NO_VARIAVEL'
      '  AND FI_INTEGRACAO_CONTABIL.DT_REFERENCIA = :DT_REFERENCIA'
      'ORDER BY FI_CONTA_INTEGRACAO_CONTABIL.NO_VARIAVEL,'
      '         FI_CONTA_INTEGRACAO_CONTABIL.IR_TIPO_CONTA'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 323
    Top = 34
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_REFERENCIA'
        ParamType = ptInput
      end>
  end
  object QrySaldoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '--CONSULTA SALDO CONTABIL - ANTIGA'
      '--SELECT C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA,'
      '--       ROUND(SUM(NVL(S.PLSDEBITOCORRENTE, 0)), 2) AS DEBITO,'
      '--       ROUND(SUM(NVL(S.PLSCREDITOCOR, 0)), 2) AS CREDITO,'
      
        '--       ROUND(SUM(NVL(PLSDEBITOCORRENTE, 0) - NVL(S.PLSCREDITOC' +
        'OR, 0)), 2) AS SALDO'
      '--FROM PLANOCONTA C, PLANOSALDO S'
      '--WHERE (S.PEREXERCICIO = @ANO'
      '--  AND ((S.PERNUMERO  <= @MES ) OR (S.PERNUMERO IS NULL))'
      '--  AND (S.IDPESSOA     = @CD_PESSOA_ENTID))'
      '--  AND (S.PLACONTA     = @CD_CONTA_CONTABIL) -- conta contábil'
      '--  AND (S.PLANO        = @CD_PLANO_CONTA)    -- plano de contas'
      '--  AND (S.PLACONTA     = C.PLACONTA)'
      '--  AND (S.PLANO        = C.PLANO)'
      '--GROUP BY C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA'
      '--RCM'
      ''
      'SELECT PLANO.PLACONTA,'
      '       PLANO.IDPLANOPREV,'
      '       PLANO.IDPATRO,'
      '       SUM(SALDOINI.SALDO) AS SALDOINI,'
      '       SUM(SALDO.SALDO) AS SALDO,'
      
        '       SUM(NVL(SALDOINI.SALDO,0) + NVL(SALDO.SALDO,0)) AS SALDOA' +
        'TU'
      'FROM'
      '-- INÍCIO ESTA SUBQUERY PEGA O SALDO ANTERIOR'
      
        '( SELECT PLACONTA, IDPLANOPREV, IDPATRO, SUM(PLSDEBITOCORRENTE-P' +
        'LSCREDITOCOR) AS SALDO'
      '  FROM PLANOSALDO'
      '  WHERE PLANO = :CD_PLANO_CONTA'
      '    AND PLACONTA = :CD_CONTA_CONTABIL'
      '    AND PEREXERCICIO = :ANO'
      '    AND PERNUMERO IS NULL'
      '  GROUP BY PLACONTA, IDPLANOPREV, IDPATRO'
      ') SALDOINI,'
      '-- FIM ESTA SUBQUERY PEGA O SALDO ANTERIOR'
      '-- ESTA SUBQUERY PEGA O SALDO ATÉ A DATA'
      
        '( SELECT L.PLACONTA, L.IDPLANOPREV, L.IDPATRO, SUM(DECODE(L.LACD' +
        'EBCRE,'#39'D'#39', L.LACVALOR, L.LACVALOR*(-1))) AS SALDO'
      '  FROM PLANILHA P, LANCAMENTO L'
      '  WHERE P.PLNCODIGO = L.PLNCODIGO'
      '    AND P.PLNEFETIVADO = '#39'S'#39
      '    AND P.PEREXERCICIO = :ANO'
      '    AND P.PLNDATDIA <= :DT_SALDO'
      '    AND L.PLANO = :CD_PLANO_CONTA'
      '    AND L.PLACONTA = :CD_CONTA_CONTABIL'
      '  GROUP BY L.PLACONTA, L.IDPLANOPREV, L.IDPATRO'
      ') SALDO,'
      '-- FIM ESTA SUBQUERY PEGA O SALDO ATÉ A DATA'
      
        '-- ESTA SUBQUERY MONTA UM CONJUNTO COM TODOS OS PLANOS X PATRO X' +
        ' CC'
      '( SELECT P.PLACONTA, PP.IDPLANOPREV, PP.IDPATRO'
      '  FROM PLANOCONTA P, PLANPREVCONTABPATRO PP'
      '  WHERE P.PLANO = :CD_PLANO_CONTA'
      '    AND P.PLACONTA = :CD_CONTA_CONTABIL'
      ' ) PLANO'
      
        '-- FIM ESTA SUBQUERY MONTA UM CONJUNTO COM TODOS OS PLANOS X PAT' +
        'RO X CC'
      'WHERE PLANO.PLACONTA = SALDO.PLACONTA(+)'
      '  AND PLANO.IDPLANOPREV = SALDO.IDPLANOPREV(+)'
      '  AND PLANO.IDPATRO = SALDO.IDPATRO(+)'
      '  AND PLANO.PLACONTA = SALDOINI.PLACONTA(+)'
      '  AND PLANO.IDPLANOPREV = SALDOINI.IDPLANOPREV(+)'
      '  AND PLANO.IDPATRO = SALDOINI.IDPATRO(+)'
      'GROUP BY PLANO.PLACONTA, PLANO.IDPLANOPREV, PLANO.IDPATRO'
      ' ')
    ValidateWithMask = True
    Left = 351
    Top = 34
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PLANO_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CONTA_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PLANO_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CONTA_CONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PLANO_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CONTA_CONTABIL'
        ParamType = ptInput
      end>
  end
  object QryInsLog: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_CONTABILIZACAO_LOG'
      '(DT_EFETIVACAO, IR_CONTABILIZADO, DT_REFERENCIA)'
      'VALUES'
      '(:DT_EFETIVACAO, :IR_CONTABILIZADO, :DT_REFERENCIA) ')
    ValidateWithMask = True
    Left = 295
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_EFETIVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_CONTABILIZADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_REFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object QryInsOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_CONTABILIZACAO_MOVIMENTO'
      '(DT_EFETIVACAO, CD_PLANO, CD_GRUPO_CONTABIL, NO_VARIAVEL,'
      
        ' CD_CONTA_CREDITO, CD_CONTA_DEBITO, VL_CALCULADO, VL_SALDO_CONTA' +
        ','
      ' VL_DIFERENCA, DS_MENSAGEM)'
      'VALUES'
      '(:DT_EFETIVACAO, :CD_PLANO, :CD_GRUPO_CONTABIL, :NO_VARIAVEL,'
      
        ' :CD_CONTA_CREDITO, :CD_CONTA_DEBITO, :VL_CALCULADO, :VL_SALDO_C' +
        'ONTA,'
      ' :VL_DIFERENCA, :DS_MENSAGEM)')
    ValidateWithMask = True
    Left = 323
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_EFETIVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NO_VARIAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_DEBITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_CALCULADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_SALDO_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DIFERENCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_MENSAGEM'
        ParamType = ptUnknown
      end>
  end
  object QryHistContabilizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IR_CONTABILIZADO'
      'FROM FI_CONTABILIZACAO_LOG'
      'WHERE DT_REFERENCIA = :DT_REFERENCIA'
      'ORDER BY DT_EFETIVACAO DESC')
    ValidateWithMask = True
    Left = 351
    Top = 62
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_REFERENCIA'
        ParamType = ptInput
      end>
  end
  object QryUnidadeNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNECODIGO, NOME, UNETIPO, UNIDNEGOC'
      'FROM UNIDNEGOCIO'
      'WHERE UNETIPO <> '#39'S'#39
      'ORDER BY UNECODIGO ')
    ValidateWithMask = True
    Left = 379
    Top = 34
    object QryUnidadeNegocioUNECODIGO: TStringField
      DisplayLabel = 'CÓDIGO'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object QryUnidadeNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
    object QryUnidadeNegocioUNETIPO: TStringField
      FieldName = 'UNETIPO'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNETIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryUnidadeNegocioUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object QryCentroCustoC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODEXTERNO, NOME, CODCENTROCUSTO, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE IDPLANCENTCUST = :IDPLANCENTCUST'
      '  AND ATIVO = '#39'S'#39
      '  AND STATUSGRUPOCDC <> '#39'S'#39
      'ORDER BY CODEXTERNO')
    ValidateWithMask = True
    Left = 379
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end>
    object QryCentroCustoCCODEXTERNO: TStringField
      DisplayLabel = 'CÓDIGO'
      DisplayWidth = 10
      FieldName = 'CODEXTERNO'
      Origin = 'BASEDADOS.CENTCUST.CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object QryCentroCustoCNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object QryCentroCustoCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryCentroCustoCSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'BASEDADOS.CENTCUST.STATUSGRUPOCDC'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryCentroCustoD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODEXTERNO, NOME, CODCENTROCUSTO, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE IDPLANCENTCUST = :IDPLANCENTCUST'
      '  AND ATIVO = '#39'S'#39
      '  AND STATUSGRUPOCDC <> '#39'S'#39
      'ORDER BY CODEXTERNO')
    ValidateWithMask = True
    Left = 407
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end>
    object QryCentroCustoDCODEXTERNO: TStringField
      DisplayLabel = 'CÓDIGO'
      DisplayWidth = 10
      FieldName = 'CODEXTERNO'
      Origin = 'BASEDADOS.CENTCUST.CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object QryCentroCustoDNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object QryCentroCustoDCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryCentroCustoDSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'BASEDADOS.CENTCUST.STATUSGRUPOCDC'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
