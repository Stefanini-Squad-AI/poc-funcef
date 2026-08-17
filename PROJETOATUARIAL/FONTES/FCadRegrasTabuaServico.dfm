inherited frmCadRegrasTabuaServico: TfrmCadRegrasTabuaServico
  Left = 375
  Top = 262
  Width = 731
  Height = 533
  HelpContext = 40380
  Caption = 'Regras da Tábua de Serviço'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 420
    inherited dbGrd: TwwDBGrid [0]
      Width = 821
      Height = 278
      Align = alNone
    end
    inherited pnlControles: TPanel [1]
      Width = 721
      Height = 280
      object Label3: TLabel
        Left = 36
        Top = 31
        Width = 163
        Height = 13
        Caption = 'Versão da Tábua de Serviço'
      end
      object Label6: TLabel
        Left = 36
        Top = 73
        Width = 102
        Height = 13
        Caption = 'Rotina de Cálculo'
      end
      object Label5: TLabel
        Left = 36
        Top = 198
        Width = 111
        Height = 13
        Caption = 'Condição de Ajuste'
      end
      object Label2: TLabel
        Left = 36
        Top = 156
        Width = 100
        Height = 13
        Caption = 'Ajuste de Cálculo'
      end
      object Label1: TLabel
        Left = 36
        Top = 114
        Width = 45
        Height = 13
        Caption = 'Fórmula'
      end
      object Label9: TLabel
        Left = 36
        Top = 240
        Width = 33
        Height = 13
        Caption = 'Idade'
      end
      object CMDBLookupCombo1: TCMDBLookupCombo
        Left = 36
        Top = 46
        Width = 345
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_VERSAO_COMUTACAO'#9'30'#9'Versão da Tábua de Serviço'#9'F')
        DataField = 'SQ_VERSAO_COMUTACAO'
        DataSource = ds
        LookupTable = QryLkpVersaoTabuaServico
        LookupField = 'SQ_VERSAO_COMUTACAO'
        Options = [loColLines, loRowLines]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CMDBLookupCombo2: TCMDBLookupCombo
        Left = 36
        Top = 88
        Width = 345
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_GRUPO_FORMULA'#9'30'#9'Grupo Fórmula'#9'F')
        DataField = 'CD_GRUPO_FORMULA'
        DataSource = ds
        LookupTable = qryLkpRotinaCalculo
        LookupField = 'CD_GRUPO_FORMULA'
        Options = [loColLines, loRowLines]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo3: TwwDBLookupCombo
        Left = 36
        Top = 212
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_CONDICAO_AJUSTE'#9'25'#9'Condição de Ajuste'#9'F')
        DataField = 'IR_CONDICAO_AJUSTE'
        DataSource = ds
        LookupTable = ClntDtStCondicaoAjuste
        LookupField = 'IR_CONDICAO_AJUSTE'
        Options = [loColLines, loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object wwDBLookupCombo2: TwwDBLookupCombo
        Left = 36
        Top = 170
        Width = 571
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NO_VARIAVEL_RESULT'#9'20'#9'Resultado'#9'F'
          'NO_FORMULA'#9'25'#9'Ajuste de Cálculo'#9'F')
        DataField = 'CD_FORMULA_AJUSTE'
        DataSource = ds
        LookupTable = qryLkpAjusteCalculo
        LookupField = 'CD_FORMULA'
        Options = [loColLines, loRowLines]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 36
        Top = 128
        Width = 571
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NO_VARIAVEL_RESULT'#9'20'#9'Resultado'#9'F'
          'NO_FORMULA'#9'25'#9'Fórmula'#9'F')
        DataField = 'CD_FORMULA'
        DataSource = ds
        LookupTable = QryLkpFormula
        LookupField = 'CD_FORMULA'
        Options = [loColLines, loRowLines]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object wwDBEdit1: TwwDBEdit
        Left = 36
        Top = 255
        Width = 121
        Height = 21
        DataField = 'NR_IDADE'
        DataSource = ds
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object PnlLookup: TPanel
      Left = 1
      Top = 281
      Width = 721
      Height = 138
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label4: TLabel
        Left = 36
        Top = 93
        Width = 111
        Height = 13
        Caption = 'Condição de Ajuste'
      end
      object Label7: TLabel
        Left = 36
        Top = 51
        Width = 100
        Height = 13
        Caption = 'Ajuste de Cálculo'
      end
      object Label8: TLabel
        Left = 36
        Top = 9
        Width = 45
        Height = 13
        Caption = 'Fórmula'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 36
        Top = 23
        Width = 571
        Height = 21
        DataField = 'CD_FORMULA'
        DataSource = ds
        KeyField = 'CD_FORMULA'
        ListField = 'calcDS_FORMULA'
        ListSource = dsLkpFormula
        TabOrder = 0
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 36
        Top = 65
        Width = 571
        Height = 21
        DataField = 'CD_FORMULA_AJUSTE'
        DataSource = ds
        KeyField = 'CD_FORMULA'
        ListField = 'calcDS_FORMULA'
        ListSource = dsLkpAjusteCalculo
        TabOrder = 1
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 36
        Top = 107
        Width = 250
        Height = 21
        DataField = 'IR_CONDICAO_AJUSTE'
        DataSource = ds
        KeyField = 'IR_CONDICAO_AJUSTE'
        ListField = 'DS_CONDICAO_AJUSTE'
        ListSource = dsCondicaoAjuste
        TabOrder = 2
      end
    end
    object trvRegras: TTreeView
      Left = 1
      Top = 0
      Width = 723
      Height = 282
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = ImageList1
      Indent = 19
      TabOrder = 3
      ToolTips = False
      OnChange = trvRegrasChange
      OnClick = trvRegrasClick
    end
  end
  inherited Dock972: TDock97
    Width = 723
    inherited Toolbar971: TToolbar97
      object sbtnDuplicar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 102
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Duplica Regra'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnDuplicarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Left = 7
      Top = 6
      Height = 26
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 485
    Top = 97
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    OnStateChange = dsStateChange
    Left = 560
    Top = 158
  end
  inherited ImlPadrao: TImageList
    Left = 457
    Top = 97
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 477
    Top = 125
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 512
    Top = 125
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 457
    Top = 125
  end
  object ClntDtStCondicaoAjuste: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IR_CONDICAO_AJUSTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_CONDICAO_AJUSTE'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 532
    Top = 186
    object ClntDtStCondicaoAjusteIR_CONDICAO_AJUSTE: TStringField
      FieldName = 'IR_CONDICAO_AJUSTE'
      Size = 1
    end
    object ClntDtStCondicaoAjusteDS_CONDICAO_AJUSTE: TStringField
      FieldName = 'DS_CONDICAO_AJUSTE'
      Size = 30
    end
  end
  object qryLkpRotinaCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_FORMULA'
      'ORDER BY DS_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 588
    Top = 186
    object qryLkpRotinaCalculoDS_GRUPO_FORMULA: TStringField
      DisplayLabel = 'Grupo Fórmula'
      DisplayWidth = 30
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object qryLkpRotinaCalculoCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.CD_GRUPO_FORMULA'
      Visible = False
    end
    object qryLkpRotinaCalculoIR_GRUPO_CALCULO: TStringField
      FieldName = 'IR_GRUPO_CALCULO'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.IR_GRUPO_CALCULO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLkpRotinaCalculoDS_OBSERV_FORMULA: TMemoField
      FieldName = 'DS_OBSERV_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_OBSERV_FORMULA'
      BlobType = ftMemo
      Size = 1400
    end
  end
  object qryLkpAjusteCalculo: TwwQuery
    OnCalcFields = qryLkpAjusteCalculoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_FORMULA'
      'WHERE IR_GRUPO_FORMULA = '#39'A'#39
      'ORDER BY NO_FORMULA')
    ValidateWithMask = True
    Left = 672
    Top = 186
    object qryLkpAjusteCalculoNO_VARIAVEL_RESULT: TStringField
      DisplayLabel = 'Resultado'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object qryLkpAjusteCalculoNO_FORMULA: TStringField
      DisplayLabel = 'Ajuste de Cálculo'
      DisplayWidth = 25
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object qryLkpAjusteCalculoDS_FORMULA: TMemoField
      DisplayLabel = 'Ajuste de Cálculo'
      DisplayWidth = 10
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryLkpAjusteCalculoCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.CD_FORMULA'
      Visible = False
    end
    object qryLkpAjusteCalculoNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      Visible = False
      FixedChar = True
    end
    object qryLkpAjusteCalculoNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      Visible = False
      FixedChar = True
    end
    object qryLkpAjusteCalculoIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLkpAjusteCalculocalcDS_FORMULA: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDS_FORMULA'
      Visible = False
      Size = 300
      Calculated = True
    end
  end
  object QryLkpVersaoTabuaServico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_TABUA_COMUTACAO'
      'ORDER BY DS_VERSAO_COMUTACAO')
    ValidateWithMask = True
    Left = 560
    Top = 186
    object QryLkpVersaoTabuaServicoDS_VERSAO_COMUTACAO: TStringField
      DisplayLabel = 'Versão da Tábua de Serviço'
      DisplayWidth = 30
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object QryLkpVersaoTabuaServicoSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoCD_TABUA_ROTATIV: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoCD_TABUA_ENTRADA_INVALID: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoCD_TABUA_INVALID: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoCD_TABUA_MORTAL: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoIR_VERSAO_COMUTACAO: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLkpVersaoTabuaServicoDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object QryLkpVersaoTabuaServicoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object QryLkpFormula: TwwQuery
    OnCalcFields = qryLkpAjusteCalculoCalcFields
    DatabaseName = 'BaseDados'
    DataSource = dsLkpRotinaCalculo
    SQL.Strings = (
      'SELECT FI_FORMULA.*, FI_SEQUENCIA_FORMULA.NR_ORDEM_FORMULA'
      'FROM FI_FORMULA, FI_SEQUENCIA_FORMULA'
      'WHERE FI_FORMULA.CD_FORMULA = FI_SEQUENCIA_FORMULA.CD_FORMULA'
      '  AND FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      '  AND FI_FORMULA.IR_GRUPO_FORMULA = '#39'C'#39
      'ORDER BY FI_FORMULA.NO_FORMULA'
      '')
    ValidateWithMask = True
    Left = 644
    Top = 186
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptUnknown
      end>
    object QryLkpFormulaNO_VARIAVEL_RESULT: TStringField
      DisplayLabel = 'Resultado'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object QryLkpFormulaNO_FORMULA: TStringField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 25
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object QryLkpFormulaDS_FORMULA: TMemoField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 10
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object QryLkpFormulaCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.CD_FORMULA'
      Visible = False
    end
    object QryLkpFormulaNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      Visible = False
      FixedChar = True
    end
    object QryLkpFormulaNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      Visible = False
      FixedChar = True
    end
    object QryLkpFormulaIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLkpFormulaNR_ORDEM_FORMULA: TFloatField
      FieldName = 'NR_ORDEM_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_FORMULA'
      Visible = False
    end
    object QryLkpFormulacalcDS_FORMULA: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDS_FORMULA'
      Visible = False
      Size = 300
      Calculated = True
    end
  end
  object dsLkpRotinaCalculo: TwwDataSource
    DataSet = qryLkpRotinaCalculo
    Left = 616
    Top = 186
  end
  object QryPrincipal: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FI_REGRA_AJUSTE_COMUTACAO'
      'ORDER BY SQ_VERSAO_COMUTACAO'
      ''
      ' ')
    UpdateObject = upSQL
    ValidateWithMask = True
    Left = 532
    Top = 158
    object QryPrincipallkpROTINA_CALCULO: TStringField
      DisplayLabel = 'Rotina de Cálculo'
      DisplayWidth = 51
      FieldKind = fkLookup
      FieldName = 'lkpROTINA_CALCULO'
      LookupDataSet = qryLkpRotinaCalculo
      LookupKeyFields = 'CD_GRUPO_FORMULA'
      LookupResultField = 'DS_GRUPO_FORMULA'
      KeyFields = 'CD_GRUPO_FORMULA'
      Size = 60
      Lookup = True
    end
    object QryPrincipallkpVERSAO: TStringField
      DisplayLabel = 'Versão da Tábua de Serviço'
      DisplayWidth = 49
      FieldKind = fkLookup
      FieldName = 'lkpVERSAO'
      LookupDataSet = QryLkpVersaoTabuaServico
      LookupKeyFields = 'SQ_VERSAO_COMUTACAO'
      LookupResultField = 'DS_VERSAO_COMUTACAO'
      KeyFields = 'SQ_VERSAO_COMUTACAO'
      Size = 50
      Lookup = True
    end
    object QryPrincipalNR_IDADE: TFloatField
      DisplayLabel = 'Idade'
      DisplayWidth = 10
      FieldName = 'NR_IDADE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.NR_IDADE'
    end
    object QryPrincipallkpFORMULA: TStringField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'lkpFORMULA'
      LookupDataSet = QryLkpFormula
      LookupKeyFields = 'CD_FORMULA'
      LookupResultField = 'NO_FORMULA'
      KeyFields = 'CD_FORMULA'
      Visible = False
      Size = 50
      Lookup = True
    end
    object QryPrincipallkpFORMULA_AJUSTE: TStringField
      DisplayLabel = 'Ajuste de Cálculo'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'lkpFORMULA_AJUSTE'
      LookupDataSet = qryLkpAjusteCalculo
      LookupKeyFields = 'CD_FORMULA'
      LookupResultField = 'NO_FORMULA'
      KeyFields = 'CD_FORMULA_AJUSTE'
      Visible = False
      Size = 50
      Lookup = True
    end
    object QryPrincipalIR_CONDICAO_AJUSTE: TStringField
      DisplayWidth = 1
      FieldName = 'IR_CONDICAO_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.IR_CONDICAO_AJUSTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPrincipallkpCONDICAO_AJUSTE: TStringField
      DisplayLabel = 'Condição de Ajuste'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'lkpCONDICAO_AJUSTE'
      LookupDataSet = ClntDtStCondicaoAjuste
      LookupKeyFields = 'IR_CONDICAO_AJUSTE'
      LookupResultField = 'DS_CONDICAO_AJUSTE'
      KeyFields = 'IR_CONDICAO_AJUSTE'
      Visible = False
      Size = 30
      Lookup = True
    end
    object QryPrincipalSQ_VERSAO_COMUTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object QryPrincipalCD_GRUPO_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA'
      Visible = False
    end
    object QryPrincipalCD_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA'
      Visible = False
    end
    object QryPrincipalNR_ORDEM_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_ORDEM_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.NR_ORDEM_FORMULA'
      Visible = False
    end
    object QryPrincipalCD_FORMULA_AJUSTE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_FORMULA_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA_AJUSTE'
      Visible = False
    end
    object QryPrincipalTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object QryPrincipalTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object upSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_REGRA_AJUSTE_COMUTACAO'
      'set'
      '  SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO,'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA,'
      '  CD_FORMULA = :CD_FORMULA,'
      '  NR_ORDEM_FORMULA = :NR_ORDEM_FORMULA,'
      '  CD_FORMULA_AJUSTE = :CD_FORMULA_AJUSTE,'
      '  IR_CONDICAO_AJUSTE = :IR_CONDICAO_AJUSTE,'
      '  NR_IDADE = :NR_IDADE'
      'where'
      '  SQ_VERSAO_COMUTACAO = :OLD_SQ_VERSAO_COMUTACAO and'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA and'
      '  NR_IDADE = :OLD_NR_IDADE')
    InsertSQL.Strings = (
      'insert into FI_REGRA_AJUSTE_COMUTACAO'
      
        '  (SQ_VERSAO_COMUTACAO, CD_GRUPO_FORMULA, CD_FORMULA, NR_ORDEM_F' +
        'ORMULA, '
      '   CD_FORMULA_AJUSTE, IR_CONDICAO_AJUSTE, NR_IDADE)'
      'values'
      
        '  (:SQ_VERSAO_COMUTACAO, :CD_GRUPO_FORMULA, :CD_FORMULA, :NR_ORD' +
        'EM_FORMULA, '
      '   :CD_FORMULA_AJUSTE, :IR_CONDICAO_AJUSTE, :NR_IDADE)')
    DeleteSQL.Strings = (
      'delete from FI_REGRA_AJUSTE_COMUTACAO'
      'where'
      '  SQ_VERSAO_COMUTACAO = :OLD_SQ_VERSAO_COMUTACAO and'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA and'
      '  NR_IDADE = :OLD_NR_IDADE')
    Left = 588
    Top = 158
  end
  object dsLkpFormula: TDataSource
    DataSet = QryLkpFormula
    Left = 532
    Top = 214
  end
  object dsLkpAjusteCalculo: TDataSource
    DataSet = qryLkpAjusteCalculo
    Left = 560
    Top = 214
  end
  object dsCondicaoAjuste: TDataSource
    DataSet = ClntDtStCondicaoAjuste
    Left = 588
    Top = 214
  end
  object ImageList1: TImageList
    Left = 504
    Top = 184
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000F6F6F600C8C8C8008383
      83006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600C8C8C8008383
      83006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D008383830000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600C8C8C8008383
      83006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D008383830000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDFDF001D82B5001B81
      B300187EB000167CAE001379AB001076A8000D73A5000B71A300086EA000066C
      9E00046A9C0002689A00016799004C4C4C0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002287BA0067CCFF002085
      B80099FFFF006FD4FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4FF006FD4
      FF006FD4FF003BA0D30099FFFF000167990000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000258ABD0067CCFF00278C
      BF0099FFFF007BE0FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0FF007BE0
      FF007BE0FF0044A9DC0099FFFF0002689A0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000288DC00067CCFF002D92
      C50099FFFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EB
      FF0085EBFF004EB3E60099FFFF00046A9C0000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002A8FC20067CCFF003398
      CB0099FFFF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7
      FF0091F7FF0057BCEF0099FFFF00066C9E0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D92C5006FD4FF003499
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0060C5F80099FFFF00086EA00000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002F94C7007BE0FF002D92
      C500000000000000000000000000000000000000000000000000000000000000
      00000000000081E6FF00000000000B71A30000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003196C90085EBFF0081E6
      FF002D92C5002D92C5002D92C5002D92C5002D92C5002D92C500288DC0002489
      BC002085B8001C81B4001B81B3001B81B30000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003398CB0091F7FF008EF4
      FF008EF4FF008EF4FF008EF4FF008EF4FF000000000000000000000000000000
      000000000000167CAE008C8C8C00DEDEDE0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003499CC000000000099FF
      FF0099FFFF0099FFFF0099FFFF0000000000258ABD002287BA001F84B7001D82
      B5001B81B300187EB000DFDFDF00F7F7F7000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003499CC000000
      00000000000000000000000000002A8FC200C8C8C800F6F6F600000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003499
      CC003398CB003196C9002F94C700DFDFDF00F6F6F60000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008000803F000000008000001F00000000
      8000000400000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008FFA000000000000
      800000070000000080F8001F00000000A100000F00000000DE3F800700000000
      E07F802300000000FFFF55770000000000000000000000000000000000000000
      000000000000}
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Ajuste'
    Colunas.Strings = (
      'FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      'FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      'FI_FORMULA.NO_FORMULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Grupo de Fórmulas'
      'Descrição da versão da tábua'
      'Fórmula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FI_REGRA_AJUSTE_COMUTACAO'
      'FI_TABUA_COMUTACAO'
      'FI_GRUPO_FORMULA'
      'FI_FORMULA'
      'FI_SEQUENCIA_FORMULA')
    CamposChave.Strings = (
      'FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO'
      'FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA'
      'FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA')
    Filtro.Strings = (
      
        'FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO = FI_TABUA_COMUTAC' +
        'AO.SQ_VERSAO_COMUTACAO'
      
        'FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA = FI_GRUPO_FORMULA.CD' +
        '_GRUPO_FORMULA'
      'FI_FORMULA.CD_FORMULA = FI_SEQUENCIA_FORMULA.CD_FORMULA'
      
        'FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA = FI_REGRA_AJUSTE_COMUTACA' +
        'O.CD_GRUPO_FORMULA'
      'FI_FORMULA.IR_GRUPO_FORMULA = '#39'C'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '80'
      '100'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 416
    Top = 127
  end
end
