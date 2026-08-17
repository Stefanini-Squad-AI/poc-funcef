inherited frmCadRegrasTabuaServico: TfrmCadRegrasTabuaServico
  Caption = 'frmCadRegrasTabuaServico'
  ClientHeight = 358
  ClientWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 272
    object Label3: TLabel
      Left = 19
      Top = 19
      Width = 163
      Height = 13
      Caption = 'Versão da Tábua de Serviço'
    end
    object CMDBLookupCombo1: TCMDBLookupCombo
      Left = 19
      Top = 34
      Width = 320
      Height = 21
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRUPO_FORMULA'#9'30'#9'Grupo Fórmula'#9'F')
      DataSource = ds
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 64
      Width = 494
      Height = 207
      Align = alBottom
      TabOrder = 1
      object DbGrdDet: TwwDBGrid
        Left = 2
        Top = 15
        Width = 490
        Height = 190
        Selected.Strings = (
          'lkpRotinaCalculo'#9'29'#9'Rotina de Cálculo'#9'F'
          'lkpAjusteCalculo'#9'35'#9'Ajuste de Cálculo'#9'F'
          'lkpCondicaoAjuste'#9'18'#9'Condição de Ajuste'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock972: TDock97
    Width = 496
  end
  inherited Dock971: TDock97
    Top = 319
    Width = 496
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 135
      DockPos = 135
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 993
    Top = 652
  end
  inherited ds: TwwDataSource
    Left = 264
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_REGRA_AJUSTE_COMUTACAO'
      'set'
      '  SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO,'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA,'
      '  CD_FORMULA = :CD_FORMULA,'
      '  NR_ORDEM_FORMULA = :NR_ORDEM_FORMULA,'
      '  CD_FORMULA_AJUSTE = :CD_FORMULA_AJUSTE,'
      '  IR_CONDICAO_AJUSTE = :IR_CONDICAO_AJUSTE,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  SQ_VERSAO_COMUTACAO = :OLD_SQ_VERSAO_COMUTACAO and'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    InsertSQL.Strings = (
      'insert into FI_REGRA_AJUSTE_COMUTACAO'
      
        '  (SQ_VERSAO_COMUTACAO, CD_GRUPO_FORMULA, CD_FORMULA, NR_ORDEM_F' +
        'ORMULA, '
      
        '   CD_FORMULA_AJUSTE, IR_CONDICAO_AJUSTE, TRGDTINCLUSAO, TRGUSER' +
        'INCLUSAO)'
      'values'
      
        '  (:SQ_VERSAO_COMUTACAO, :CD_GRUPO_FORMULA, :CD_FORMULA, :NR_ORD' +
        'EM_FORMULA, '
      
        '   :CD_FORMULA_AJUSTE, :IR_CONDICAO_AJUSTE, :TRGDTINCLUSAO, :TRG' +
        'USERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from FI_REGRA_AJUSTE_COMUTACAO'
      'where'
      '  SQ_VERSAO_COMUTACAO = :OLD_SQ_VERSAO_COMUTACAO and'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    Left = 292
  end
  inherited MontaSelect: TMontaSelect
    Left = 292
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 236
    Top = 18
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 264
    Top = 18
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM FI_REGRA_AJUSTE_COMUTACAO')
    Left = 236
    object qrySQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO'
    end
    object qryCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_GRUPO_FORMULA'
    end
    object qryCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA'
    end
    object qryNR_ORDEM_FORMULA: TFloatField
      FieldName = 'NR_ORDEM_FORMULA'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.NR_ORDEM_FORMULA'
    end
    object qryCD_FORMULA_AJUSTE: TFloatField
      FieldName = 'CD_FORMULA_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.CD_FORMULA_AJUSTE'
    end
    object qryIR_CONDICAO_AJUSTE: TStringField
      FieldName = 'IR_CONDICAO_AJUSTE'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.IR_CONDICAO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_REGRA_AJUSTE_COMUTACAO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qrylkpCondicaoAjuste: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpCondicaoAjuste'
      LookupDataSet = ClntDtStCondicaoAjuste
      LookupKeyFields = 'IR_CONDICAO_AJUSTE'
      LookupResultField = 'DS_CONDICAO_AJUSTE'
      KeyFields = 'IR_CONDICAO_AJUSTE'
      Size = 15
      Lookup = True
    end
    object qrylkpRotinaCalculo2: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpRotinaCalculo'
      LookupDataSet = qryLkpRotinaCalculo
      LookupKeyFields = 'CD_FORMULA'
      LookupResultField = 'NO_FORMULA'
      KeyFields = 'CD_FORMULA'
      Size = 50
      Lookup = True
    end
    object qrylkpAjusteCalculo2: TStringField
      FieldKind = fkLookup
      FieldName = 'lkpAjusteCalculo'
      LookupDataSet = qryLkpAjusteCalculo
      LookupKeyFields = 'CD_FORMULA'
      LookupResultField = 'NO_FORMULA'
      KeyFields = 'CD_FORMULA_AJUSTE'
      Size = 50
      Lookup = True
    end
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
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 236
    Top = 74
  end
  object qryLkpRotinaCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_FORMULA'
      'WHERE IR_GRUPO_FORMULA = '#39'T'#39)
    ValidateWithMask = True
    Left = 264
    Top = 74
    object qryLkpRotinaCalculoCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.CD_FORMULA'
    end
    object qryLkpRotinaCalculoNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object qryLkpRotinaCalculoDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object qryLkpRotinaCalculoNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object qryLkpRotinaCalculoNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      FixedChar = True
    end
    object qryLkpRotinaCalculoNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      FixedChar = True
    end
    object qryLkpRotinaCalculoIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      FixedChar = True
      Size = 1
    end
  end
  object qryLkpAjusteCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_FORMULA'
      'WHERE IR_GRUPO_FORMULA = '#39'A'#39)
    ValidateWithMask = True
    Left = 292
    Top = 74
    object FloatField1: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.CD_FORMULA'
    end
    object StringField1: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object MemoField1: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object StringField2: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object StringField3: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      FixedChar = True
    end
    object StringField4: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      FixedChar = True
    end
    object StringField5: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      FixedChar = True
      Size = 1
    end
  end
end
