inherited frmCadTipoCustoRec: TfrmCadTipoCustoRec
  Left = 208
  Top = 281
  Caption = 'Tipos de Receitas e Despesas de Imóveis'
  ClientHeight = 330
  ClientWidth = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 613
    Height = 262
    inherited dbGrd: TwwDBGrid [0]
      Width = 609
      Height = 258
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'37'#9'Receita ou Despesa'
        'TIPO'#9'8'#9'Tipo'
        'DESCRICAO'#9'35'#9'Tipo de Documento'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Width = 609
      Height = 258
      object Label1: TLabel
        Left = 112
        Top = 26
        Width = 163
        Height = 13
        Caption = 'Tipo de Receita ou Despesa'
      end
      object Label2: TLabel
        Left = 112
        Top = 138
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object DBrdgCustoRec: TDBRadioGroup
        Left = 112
        Top = 77
        Width = 377
        Height = 41
        Columns = 2
        DataField = 'RECCUSTO'
        DataSource = ds
        Items.Strings = (
          'Despesa'
          'Receita')
        TabOrder = 0
        TabStop = True
        Values.Strings = (
          'C'
          'R')
        OnChange = DBrdgCustoRecChange
        OnClick = DBrdgCustoRecChange
        OnExit = DBrdgCustoRecChange
      end
      object DBedtDescricao: TDBEdit2
        Left = 112
        Top = 40
        Width = 377
        Height = 21
        DataField = 'DESCCUSTORECIMO'
        DataSource = ds
        TabOrder = 1
      end
      object DBcboTipoDoc: TwwDBLookupCombo
        Left = 112
        Top = 152
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODTIPDOC'
        DataSource = ds
        LookupTable = qryLookTipoDoc
        LookupField = 'CODTIPDOC'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object GroupBox1: TGroupBox
        Left = 112
        Top = 192
        Width = 377
        Height = 41
        TabOrder = 3
        object DBcheckCAF: TDBCheckBox
          Left = 16
          Top = 16
          Width = 353
          Height = 17
          Caption = 'Gera movimentação do Ativo Fixo'
          DataField = 'FLGCAF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 613
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 613
    inherited tb97Fundo: TToolbar97
      Left = 244
      DockPos = 244
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    Tag = 0
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC,'
      '   D.DESCRICAO, T.FLGOBRIGAORC, IDRECEITAREEMB,'
      '   T.IDMODULO,'
      ''
      '   FLGCAF,'
      '   FLGCAPCAR,'
      '   FLGCONTAB'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T, TIPODOCRECPAG D'
      ''
      'WHERE'
      '   ( T.IDMODULO =:PIDMODULO )'
      '   AND ( T.CODTIPDOC =  D.CODTIPDOC(+) )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO')
    Left = 552
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita ou Despesa'
      DisplayWidth = 37
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'TIPO'
      Size = 9
      Calculated = True
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Documento'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Origin = 'TIPOCUSTORECIMOV.RECCUSTO'
      Visible = False
      Size = 1
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOCUSTORECIMOV.CODTIPDOC'
      Visible = False
    end
    object qryFLGOBRIGAORC: TFloatField
      FieldName = 'FLGOBRIGAORC'
      Visible = False
    end
    object qryIDRECEITAREEMB: TFloatField
      FieldName = 'IDRECEITAREEMB'
      Visible = False
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryFLGCAF: TFloatField
      FieldName = 'FLGCAF'
    end
    object qryFLGCAPCAR: TFloatField
      FieldName = 'FLGCAPCAR'
    end
    object qryFLGCONTAB: TFloatField
      FieldName = 'FLGCONTAB'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65507
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCUSTORECIMOV'
      'set'
      '  DESCCUSTORECIMO = :DESCCUSTORECIMO,'
      '  RECCUSTO = :RECCUSTO,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  FLGOBRIGAORC = :FLGOBRIGAORC,'
      '  IDRECEITAREEMB = :IDRECEITAREEMB,'
      '  IDMODULO = :IDMODULO,'
      '  FLGCAF = :FLGCAF,'
      '  FLGCAPCAR = :FLGCAPCAR,'
      '  FLGCONTAB = :FLGCONTAB'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    InsertSQL.Strings = (
      'insert into TIPOCUSTORECIMOV'
      
        '  (IDTIPOCUSTORECIMO, DESCCUSTORECIMO, RECCUSTO, CODTIPDOC, FLGO' +
        'BRIGAORC, '
      '   IDRECEITAREEMB, IDMODULO, FLGCAF, FLGCAPCAR, FLGCONTAB)'
      'values'
      
        '  (:IDTIPOCUSTORECIMO, :DESCCUSTORECIMO, :RECCUSTO, :CODTIPDOC, ' +
        ':FLGOBRIGAORC, '
      '   :IDRECEITAREEMB, :IDMODULO, :FLGCAF, :FLGCAPCAR, :FLGCONTAB)')
    DeleteSQL.Strings = (
      'delete from TIPOCUSTORECIMOV'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    Left = 520
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCUSTORECIMOV.DESCCUSTORECIMO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Custo ou Receita')
    Tabelas.Strings = (
      'TIPOCUSTORECIMOV')
    CamposChave.Strings = (
      'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 960
    Top = 56
  end
  inherited ds: TwwDataSource
    AutoEdit = True
    OnDataChange = dsDataChange
    Left = 584
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 960
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 958
    Top = 106
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCUSTORECIMO, DESCCUSTORECIMO'
      ''
      'FROM'
      '  TIPOCUSTORECIMOV'
      ''
      'WHERE'
      '  ( LOWER(DESCCUSTORECIMO) =:DESCRICAO )'
      '  AND ( IDMODULO =:PIDMODULO )')
    ValidateWithMask = True
    Left = 456
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryVerificaOcorrenciaIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
    end
    object qryVerificaOcorrenciaDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
  end
  object qryLookTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      'FROM'
      '   TIPODOCRECPAG'
      'WHERE'
      '   ( RECPAG =:RECPAG ) '
      '   AND ( DEBCRE =:DEBCRE )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
    object qryLookTipoDocCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
    end
    object qryLookTipoDocRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPODOCRECPAG.RECPAG'
      Size = 1
    end
    object qryLookTipoDocDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDocDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Size = 1
    end
  end
end
