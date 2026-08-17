inherited frmOkCalculoTabuaServico: TfrmOkCalculoTabuaServico
  Left = 313
  Top = 183
  Caption = 'Cálculo da Tábua de Serviço'
  ClientHeight = 377
  ClientWidth = 397
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 397
    Height = 338
    object Label3: TLabel
      Left = 46
      Top = 10
      Width = 149
      Height = 13
      Caption = 'Tipo de Tábua de Serviço'
    end
    object Label1: TLabel
      Left = 46
      Top = 103
      Width = 124
      Height = 13
      Caption = 'Rotina Cálculo Tábua'
    end
    object Label2: TLabel
      Left = 46
      Top = 148
      Width = 107
      Height = 13
      Caption = 'Tábua Mortalidade'
    end
    object Label4: TLabel
      Left = 46
      Top = 193
      Width = 92
      Height = 13
      Caption = 'Tábua Invalidez'
    end
    object Label5: TLabel
      Left = 46
      Top = 238
      Width = 140
      Height = 13
      Caption = 'Tábua Entrada Invalidez'
    end
    object Label6: TLabel
      Left = 46
      Top = 283
      Width = 134
      Height = 13
      Caption = 'Tabela de Rotatividade'
    end
    object Label7: TLabel
      Left = 46
      Top = 55
      Width = 52
      Height = 13
      Caption = 'Decrição'
    end
    object CMDBLkpCmbTabuaServico: TCMDBLookupCombo
      Left = 46
      Top = 25
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_TABUA_SERVICO'#9'30'#9'Tipo de Tábua de Serviço'#9'F')
      LookupTable = ClntDtStTabuaServico
      LookupField = 'DS_TIPO_TABUA_SERVICO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CMDBLkpCmbRotinaCalculoTabua: TCMDBLookupCombo
      Left = 46
      Top = 118
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRUPO_FORMULA'#9'30'#9'Grupo Fórmula'#9'F')
      LookupTable = qryLkpRotinaCalculoTabua
      LookupField = 'CD_GRUPO_FORMULA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CMDBLkpCmbTabuaMortalidade: TCMDBLookupCombo
      Left = 46
      Top = 163
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TABUA'#9'50'#9'Tábua de Mortalidade'#9'F')
      LookupTable = qryLkpTabuaMortalidade
      LookupField = 'CD_TABUA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CMDBLkpCmbTabuaInvalidez: TCMDBLookupCombo
      Left = 46
      Top = 208
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TABUA'#9'50'#9'Tábua de Invalidez'#9'F')
      LookupTable = qryLkpTabuaInvalidez
      LookupField = 'CD_TABUA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CMDBLkpCmbTabuaEntradaInvalidez: TCMDBLookupCombo
      Left = 46
      Top = 253
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TABUA'#9'50'#9'Tábua de Entrada em Invalidez'#9'F')
      LookupTable = qryLkpTabuaEntradaInvalidez
      LookupField = 'CD_TABUA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CMDBLkpCmbTabuaRotatividade: TCMDBLookupCombo
      Left = 46
      Top = 298
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TABUA'#9'50'#9'Tábua de Rotatividade'#9'F')
      LookupTable = qryLkpTabelaRotatividade
      LookupField = 'CD_TABUA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdtDescricao: TEdit
      Left = 46
      Top = 70
      Width = 320
      Height = 21
      Hint = 'Juros utilizados para cálculo da tabela de comutação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
    object pbrTabServico2: TProgressBar
      Left = 1
      Top = 331
      Width = 395
      Height = 6
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 7
    end
    object pbrTabServico1: TProgressBar
      Left = 1
      Top = 325
      Width = 395
      Height = 6
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 397
    inherited tb97Fundo: TToolbar97
      Left = 225
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 56
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 993
    Top = 652
  end
  object ClntDtStTabuaServico: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IR_TIPO_TABUA_SERVICO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_TIPO_TABUA_SERVICO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 236
    Top = 13
    object ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO: TStringField
      DisplayLabel = 'Tipo de Tábua de Serviço'
      DisplayWidth = 30
      FieldName = 'DS_TIPO_TABUA_SERVICO'
      Size = 30
    end
    object ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO: TStringField
      FieldName = 'IR_TIPO_TABUA_SERVICO'
      Visible = False
      Size = 1
    end
  end
  object qryLkpRotinaCalculoTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_FORMULA'
      'ORDER BY DS_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 264
    Top = 13
    object qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.CD_GRUPO_FORMULA'
    end
    object qryLkpRotinaCalculoTabuaDS_GRUPO_FORMULA: TStringField
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object qryLkpRotinaCalculoTabuaIR_GRUPO_CALCULO: TStringField
      FieldName = 'IR_GRUPO_CALCULO'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.IR_GRUPO_CALCULO'
      FixedChar = True
      Size = 1
    end
    object qryLkpRotinaCalculoTabuaDS_OBSERV_FORMULA: TMemoField
      FieldName = 'DS_OBSERV_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_OBSERV_FORMULA'
      BlobType = ftMemo
      Size = 1400
    end
  end
  object qryLkpTabuaMortalidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CD_TABUA, A.DS_TABUA, B.IR_DOMINIO_SISTEMA'
      'FROM FI_TABUA A, FI_TIPO_TABUA B'
      'WHERE A.CD_TIPO_TABUA = B.CD_TIPO_TABUA'
      '  AND B.IR_DOMINIO_SISTEMA = '#39'MRT'#39
      'ORDER BY A.DS_TABUA'
      '')
    ValidateWithMask = True
    Left = 292
    Top = 13
    object qryLkpTabuaMortalidadeDS_TABUA: TStringField
      DisplayLabel = 'Tábua de Mortalidade'
      DisplayWidth = 50
      FieldName = 'DS_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.DS_TABUA'
      FixedChar = True
      Size = 50
    end
    object qryLkpTabuaMortalidadeCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.CD_TABUA'
      Visible = False
    end
    object qryLkpTabuaMortalidadeIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'BASEDADOS.FI_TIPO_TABUA.IR_DOMINIO_SISTEMA'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qryLkpTabuaInvalidez: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CD_TABUA, A.DS_TABUA, B.IR_DOMINIO_SISTEMA'
      'FROM FI_TABUA A, FI_TIPO_TABUA B'
      'WHERE A.CD_TIPO_TABUA = B.CD_TIPO_TABUA'
      '  AND B.IR_DOMINIO_SISTEMA = '#39'INV'#39
      'ORDER BY A.DS_TABUA')
    ValidateWithMask = True
    Left = 320
    Top = 13
    object qryLkpTabuaInvalidezDS_TABUA: TStringField
      DisplayLabel = 'Tábua de Invalidez'
      DisplayWidth = 50
      FieldName = 'DS_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.DS_TABUA'
      FixedChar = True
      Size = 50
    end
    object qryLkpTabuaInvalidezCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.CD_TABUA'
      Visible = False
    end
    object qryLkpTabuaInvalidezIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'BASEDADOS.FI_TIPO_TABUA.IR_DOMINIO_SISTEMA'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qryLkpTabuaEntradaInvalidez: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CD_TABUA, A.DS_TABUA, B.IR_DOMINIO_SISTEMA'
      'FROM FI_TABUA A, FI_TIPO_TABUA B'
      'WHERE A.CD_TIPO_TABUA = B.CD_TIPO_TABUA'
      '  AND B.IR_DOMINIO_SISTEMA = '#39'EIN'#39
      'ORDER BY A.DS_TABUA')
    ValidateWithMask = True
    Left = 236
    Top = 41
    object qryLkpTabuaEntradaInvalidezDS_TABUA: TStringField
      DisplayLabel = 'Tábua de Entrada em Invalidez'
      DisplayWidth = 50
      FieldName = 'DS_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.DS_TABUA'
      FixedChar = True
      Size = 50
    end
    object qryLkpTabuaEntradaInvalidezCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.CD_TABUA'
      Visible = False
    end
    object qryLkpTabuaEntradaInvalidezIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'BASEDADOS.FI_TIPO_TABUA.IR_DOMINIO_SISTEMA'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qryLkpTabelaRotatividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CD_TABUA, A.DS_TABUA, B.IR_DOMINIO_SISTEMA'
      'FROM FI_TABUA A, FI_TIPO_TABUA B'
      'WHERE A.CD_TIPO_TABUA = B.CD_TIPO_TABUA'
      '  AND B.IR_DOMINIO_SISTEMA = '#39'ROT'#39
      'ORDER BY A.DS_TABUA')
    ValidateWithMask = True
    Left = 264
    Top = 41
    object qryLkpTabelaRotatividadeDS_TABUA: TStringField
      DisplayLabel = 'Tábua de Rotatividade'
      DisplayWidth = 50
      FieldName = 'DS_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.DS_TABUA'
      FixedChar = True
      Size = 50
    end
    object qryLkpTabelaRotatividadeCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'BASEDADOS.FI_TABUA.CD_TABUA'
      Visible = False
    end
    object qryLkpTabelaRotatividadeIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'BASEDADOS.FI_TIPO_TABUA.IR_DOMINIO_SISTEMA'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object QryVariaveisRotina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT FI_VARIAVEL.NO_VARIAVEL,'
      '       FI_VARIAVEL.VL_DEFAULT'
      'FROM FI_SEQUENCIA_FORMULA, FI_VARIAVEL_FORMULA, FI_VARIAVEL'
      
        'WHERE FI_SEQUENCIA_FORMULA.CD_FORMULA = FI_VARIAVEL_FORMULA.CD_F' +
        'ORMULA'
      '  AND FI_VARIAVEL_FORMULA.NO_VARIAVEL = FI_VARIAVEL.NO_VARIAVEL'
      '  AND FI_VARIAVEL.IR_TABUA = '#39'N'#39
      '  AND FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 264
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end>
    object QryVariaveisRotinaNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_VARIAVEL.NO_VARIAVEL'
      FixedChar = True
    end
    object QryVariaveisRotinaVL_DEFAULT: TFloatField
      FieldName = 'VL_DEFAULT'
      Origin = 'BASEDADOS.FI_VARIAVEL.VL_DEFAULT'
    end
  end
  object QryInsOcorTabuaComutacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_OCOR_TABUA_COMUTACAO'
      
        '(SQ_VERSAO_COMUTACAO, NO_VARIAVEL, NR_IDADE, VL_FATOR_COMUTACAO,' +
        ' NR_IDADE_PENSAO)'
      'VALUES'
      
        '(:SQ_VERSAO_COMUTACAO, :NO_VARIAVEL, :NR_IDADE, :VL_FATOR_COMUTA' +
        'CAO, :NR_IDADE_PENSAO)')
    ValidateWithMask = True
    Left = 292
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SQ_VERSAO_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_VARIAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_IDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_FATOR_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_IDADE_PENSAO'
        ParamType = ptInput
      end>
  end
  object QryInsTabuaComutacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TABUA_COMUTACAO'
      
        '(SQ_VERSAO_COMUTACAO, CD_TABUA_ROTATIV, CD_TABUA_ENTRADA_INVALID' +
        ', CD_TABUA_INVALID,'
      
        ' CD_TABUA_MORTAL, IR_VERSAO_COMUTACAO, DS_VERSAO_COMUTACAO, DT_G' +
        'ERACAO, CD_GRUPO_FORMULA)'
      'VALUES'
      
        '(:SQ_VERSAO_COMUTACAO, :CD_TABUA_ROTATIV, :CD_TABUA_ENTRADA_INVA' +
        'LID, :CD_TABUA_INVALID,'
      
        ' :CD_TABUA_MORTAL, :IR_VERSAO_COMUTACAO, :DS_VERSAO_COMUTACAO, :' +
        'DT_GERACAO, :CD_GRUPO_FORMULA)')
    ValidateWithMask = True
    Left = 264
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SQ_VERSAO_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TABUA_ROTATIV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TABUA_ENTRADA_INVALID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TABUA_INVALID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TABUA_MORTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_VERSAO_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_VERSAO_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end>
  end
  object QryMaxVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(SQ_VERSAO_COMUTACAO) AS MAX_COD'
      'FROM FI_TABUA_COMUTACAO'
      '')
    ValidateWithMask = True
    Left = 236
    Top = 112
    object QryMaxVersaoMAX_COD: TFloatField
      FieldName = 'MAX_COD'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
    end
  end
  object QryRegraAjusteVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO,'
      '       FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA,'
      '       FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA,'
      '       FI_REGRA_AJUSTE_COMUTACAO.NR_ORDEM_FORMULA,'
      '       FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA_AJUSTE,'
      '       FI_REGRA_AJUSTE_COMUTACAO.IR_CONDICAO_AJUSTE,'
      '       FI_REGRA_AJUSTE_COMUTACAO.NR_IDADE,'
      '       FI_FORMULA.NO_VARIAVEL_INICIAL,'
      '       FI_FORMULA.NO_VARIAVEL_INICIAL2,'
      '       FI_FORMULA.NO_VARIAVEL_FINAL,'
      '       FI_FORMULA.NO_VARIAVEL_RESULT,'
      '       FI_FORMULA.DS_FORMULA'
      'FROM FI_REGRA_AJUSTE_COMUTACAO, FI_FORMULA'
      
        'WHERE FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA_AJUSTE = FI_FORMULA.C' +
        'D_FORMULA'
      
        '  AND FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO = :SQ_VERSAO' +
        '_COMUTACAO'
      
        '  AND FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA = :CD_GRUPO_FOR' +
        'MULA'
      '  AND FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA = :CD_FORMULA'
      '  AND FI_REGRA_AJUSTE_COMUTACAO.NR_IDADE ='
      '        (SELECT MAX(REGRA.NR_IDADE)'
      '         FROM FI_REGRA_AJUSTE_COMUTACAO REGRA'
      
        '         WHERE REGRA.SQ_VERSAO_COMUTACAO = FI_REGRA_AJUSTE_COMUT' +
        'ACAO.SQ_VERSAO_COMUTACAO'
      
        '           AND REGRA.CD_GRUPO_FORMULA = FI_REGRA_AJUSTE_COMUTACA' +
        'O.CD_GRUPO_FORMULA'
      
        '           AND REGRA.CD_FORMULA = FI_REGRA_AJUSTE_COMUTACAO.CD_F' +
        'ORMULA'
      '           AND REGRA.NR_IDADE <= :NR_IDADE)'
      ' ')
    ValidateWithMask = True
    Left = 236
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SQ_VERSAO_COMUTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_FORMULA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_IDADE'
        ParamType = ptUnknown
      end>
    object QryRegraAjusteVersaoSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO'
    end
    object QryRegraAjusteVersaoCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA'
    end
    object QryRegraAjusteVersaoCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA'
    end
    object QryRegraAjusteVersaoNR_ORDEM_FORMULA: TFloatField
      FieldName = 'NR_ORDEM_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.NR_ORDEM_FORMULA'
    end
    object QryRegraAjusteVersaoCD_FORMULA_AJUSTE: TFloatField
      FieldName = 'CD_FORMULA_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA_AJUSTE'
    end
    object QryRegraAjusteVersaoIR_CONDICAO_AJUSTE: TStringField
      FieldName = 'IR_CONDICAO_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.IR_CONDICAO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object QryRegraAjusteVersaoNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      FixedChar = True
    end
    object QryRegraAjusteVersaoNO_VARIAVEL_INICIAL2: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL2'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL2'
      FixedChar = True
    end
    object QryRegraAjusteVersaoNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      FixedChar = True
    end
    object QryRegraAjusteVersaoNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object QryRegraAjusteVersaoDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object QryRegraAjusteVersaoNR_IDADE: TFloatField
      FieldName = 'NR_IDADE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.NR_IDADE'
    end
  end
  object QryDelOcorTabuaComutacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_OCOR_TABUA_COMUTACAO'
      'WHERE SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO ')
    ValidateWithMask = True
    Left = 320
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SQ_VERSAO_COMUTACAO'
        ParamType = ptInput
      end>
  end
end
