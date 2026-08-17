inherited frmOkCalculoTabuaServicoPensao: TfrmOkCalculoTabuaServicoPensao
  Left = 259
  Top = 232
  Caption = 'Cálculo da Tábua de Serviço'
  ClientHeight = 315
  ClientWidth = 410
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 410
    Height = 276
    OnMouseMove = Cursor_Mouse
    object Label3: TLabel
      Left = 30
      Top = 13
      Width = 149
      Height = 13
      Caption = 'Tipo de Tábua de Serviço'
      OnMouseMove = Cursor_Mouse
    end
    object Label1: TLabel
      Left = 30
      Top = 151
      Width = 150
      Height = 13
      Caption = 'Tábua de Serviço (eixo jx)'
      OnMouseMove = Cursor_Mouse
    end
    object Label7: TLabel
      Left = 30
      Top = 58
      Width = 52
      Height = 13
      Caption = 'Decrição'
      OnMouseMove = Cursor_Mouse
    end
    object Label2: TLabel
      Left = 30
      Top = 199
      Width = 147
      Height = 13
      Caption = 'Tábua de Serviço (eixo x)'
      OnMouseMove = Cursor_Mouse
    end
    object Label4: TLabel
      Left = 30
      Top = 103
      Width = 124
      Height = 13
      Caption = 'Rotina Cálculo Tábua'
      OnMouseMove = Cursor_Mouse
    end
    object CMDBLkpCmbTabuaServico: TCMDBLookupCombo
      Left = 30
      Top = 28
      Width = 348
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
      OnMouseMove = Cursor_Mouse
    end
    object CMDBLkpCmbTabuaMasculina: TCMDBLookupCombo
      Left = 30
      Top = 166
      Width = 348
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_VERSAO_COMUTACAO'#9'100'#9'Tábua Masculina'#9'F')
      LookupTable = QryLkpTabuaMasculina
      LookupField = 'SQ_VERSAO_COMUTACAO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnMouseMove = Cursor_Mouse
    end
    object EdtDescricao: TEdit
      Left = 30
      Top = 73
      Width = 348
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
      OnMouseMove = Cursor_Mouse
    end
    object CMDBLkpCmbTabuaFeminina: TCMDBLookupCombo
      Left = 30
      Top = 214
      Width = 348
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_VERSAO_COMUTACAO'#9'100'#9'Tàbua Feminina'#9'F')
      LookupTable = QryLkpTabuaFeminina
      LookupField = 'SQ_VERSAO_COMUTACAO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnMouseMove = Cursor_Mouse
    end
    object CMDBLkpCmbRotinaCalculoTabua: TCMDBLookupCombo
      Left = 30
      Top = 118
      Width = 348
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
      OnMouseMove = Cursor_Mouse
    end
    object pbrTabServico2: TProgressBar
      Left = 1
      Top = 262
      Width = 408
      Height = 13
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 5
      OnMouseMove = Cursor_Mouse
    end
    object plPassos: TPanel
      Left = 1
      Top = 245
      Width = 408
      Height = 17
      Align = alBottom
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 410
    OnMouseMove = Cursor_Mouse
    inherited tb97Fundo: TToolbar97
      Left = 238
      inherited bbtnSair: TBitBtn
        OnMouseMove = Cursor_Mouse
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        OnMouseMove = Cursor_Mouse
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 69
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        OnMouseMove = Cursor_Mouse
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        OnClick = bbtnCancelarClick
        OnMouseMove = Cursor_Mouse
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
  object QryLkpTabuaMasculina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_TABUA_COMUTACAO'
      'WHERE IR_VERSAO_COMUTACAO <> '#39'P'#39
      'ORDER BY DS_VERSAO_COMUTACAO')
    ValidateWithMask = True
    Left = 292
    Top = 13
    object QryLkpTabuaMasculinaDS_VERSAO_COMUTACAO: TStringField
      DisplayLabel = 'Tábua Masculina'
      DisplayWidth = 100
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object QryLkpTabuaMasculinaSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object QryLkpTabuaMasculinaCD_TABUA_ROTATIV: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
      Visible = False
    end
    object QryLkpTabuaMasculinaCD_TABUA_ENTRADA_INVALID: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
      Visible = False
    end
    object QryLkpTabuaMasculinaCD_TABUA_INVALID: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
      Visible = False
    end
    object QryLkpTabuaMasculinaCD_TABUA_MORTAL: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
      Visible = False
    end
    object QryLkpTabuaMasculinaIR_VERSAO_COMUTACAO: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLkpTabuaMasculinaDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
      Visible = False
    end
    object QryLkpTabuaMasculinaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object QryLkpTabuaMasculinaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryLkpTabuaMasculinaCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_GRUPO_FORMULA'
      Visible = False
    end
  end
  object QryLkpTabuaFeminina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_TABUA_COMUTACAO'
      'WHERE IR_VERSAO_COMUTACAO <> '#39'P'#39
      'ORDER BY DS_VERSAO_COMUTACAO')
    ValidateWithMask = True
    Left = 320
    Top = 13
    object QryLkpTabuaFemininaDS_VERSAO_COMUTACAO: TStringField
      DisplayLabel = 'Tàbua Feminina'
      DisplayWidth = 100
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object QryLkpTabuaFemininaSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object QryLkpTabuaFemininaCD_TABUA_ROTATIV: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
      Visible = False
    end
    object QryLkpTabuaFemininaCD_TABUA_ENTRADA_INVALID: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
      Visible = False
    end
    object QryLkpTabuaFemininaCD_TABUA_INVALID: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
      Visible = False
    end
    object QryLkpTabuaFemininaCD_TABUA_MORTAL: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
      Visible = False
    end
    object QryLkpTabuaFemininaIR_VERSAO_COMUTACAO: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLkpTabuaFemininaDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
      Visible = False
    end
    object QryLkpTabuaFemininaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object QryLkpTabuaFemininaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryLkpTabuaFemininaCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_GRUPO_FORMULA'
      Visible = False
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
  object QryInsTabuaComutacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TABUA_COMUTACAO'
      
        '(SQ_VERSAO_COMUTACAO, CD_TABUA_ROTATIV, CD_TABUA_ENTRADA_INVALID' +
        ', CD_TABUA_INVALID,'
      
        ' CD_TABUA_MORTAL, IR_VERSAO_COMUTACAO, DS_VERSAO_COMUTACAO, DT_G' +
        'ERACAO, CD_GRUPO_FORMULA,'
      ' SQ_VERSAO_COMUTACAO_MASC, SQ_VERSAO_COMUTACAO_FEM)'
      'VALUES'
      
        '(:SQ_VERSAO_COMUTACAO, :CD_TABUA_ROTATIV, :CD_TABUA_ENTRADA_INVA' +
        'LID, :CD_TABUA_INVALID,'
      
        ' :CD_TABUA_MORTAL, :IR_VERSAO_COMUTACAO, :DS_VERSAO_COMUTACAO, :' +
        'DT_GERACAO, :CD_GRUPO_FORMULA,'
      ' :SQ_VERSAO_COMUTACAO_MASC, :SQ_VERSAO_COMUTACAO_FEM)')
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
      end
      item
        DataType = ftUnknown
        Name = 'SQ_VERSAO_COMUTACAO_MASC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQ_VERSAO_COMUTACAO_FEM'
        ParamType = ptUnknown
      end>
  end
  object QryInsOcorTabuaComutacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_OCOR_TABUA_COMUTACAO'
      
        '(SQ_VERSAO_COMUTACAO, NO_VARIAVEL, NR_IDADE, VL_FATOR_COMUTACAO,' +
        ' NR_IDADE_PENSAO, VL_FATOR_PENSAO)'
      'VALUES'
      
        '(:SQ_VERSAO_COMUTACAO, :NO_VARIAVEL, :NR_IDADE, :VL_FATOR_COMUTA' +
        'CAO, :NR_IDADE_PENSAO, :VL_FATOR_PENSAO)')
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
      end
      item
        DataType = ftUnknown
        Name = 'VL_FATOR_PENSAO'
        ParamType = ptUnknown
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
end
