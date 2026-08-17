inherited frmCadTipoOperacao: TfrmCadTipoOperacao
  Left = 134
  Top = 65
  Caption = 'Tipos de Receitas / Operações'
  ClientHeight = 403
  ClientWidth = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 477
    Height = 335
    inherited dbGrd: TwwDBGrid [0]
      Width = 473
      Height = 331
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'37'#9'Receita ou Operação'
        'TIPO'#9'8'#9'Tipo'
        'DESCRICAO'#9'35'#9'Tipo de Documento')
    end
    inherited pnlControles: TPanel [1]
      Width = 473
      Height = 331
      object Label1: TLabel
        Left = 48
        Top = 26
        Width = 169
        Height = 13
        Caption = 'Tipo de Receita ou Operação'
      end
      object Label2: TLabel
        Left = 48
        Top = 138
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object Label3: TLabel
        Left = 432
        Top = 162
        Width = 210
        Height = 13
        Caption = 'Receita para Despesa Reembolsável'
        Visible = False
      end
      object DBrdgCustoRec: TDBRadioGroup
        Left = 48
        Top = 77
        Width = 377
        Height = 41
        Columns = 2
        DataField = 'RECCUSTO'
        DataSource = ds
        Items.Strings = (
          'Receita'
          'Operação')
        TabOrder = 0
        TabStop = True
        Values.Strings = (
          'R'
          'O')
        OnClick = DBrdgCustoRecChange
      end
      object DBedtDescricao: TDBEdit2
        Left = 48
        Top = 40
        Width = 377
        Height = 21
        DataField = 'DESCCUSTORECIMO'
        DataSource = ds
        TabOrder = 1
      end
      object DBcboTipoDoc: TwwDBLookupCombo
        Left = 48
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
      object DBCboReceitaReembolso: TwwDBLookupCombo
        Left = 432
        Top = 176
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'No')
        DataField = 'IDRECEITAREEMB'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookTipoRecDes
        LookupField = 'IDTIPOCUSTORECIMO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 3
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 432
        Top = 80
        Width = 377
        Height = 65
        Columns = 2
        DataField = 'RECCUSTO'
        DataSource = ds
        Items.Strings = (
          'Despesa'
          'Dedução (diminui Despesa)'
          'Receita'
          'Desconto (diminui Receita)')
        TabOrder = 4
        TabStop = True
        Values.Strings = (
          'C'
          'U'
          'R'
          'D')
        Visible = False
        OnChange = DBrdgCustoRecChange
        OnClick = DBrdgCustoRecChange
        OnExit = DBrdgCustoRecChange
      end
      object GroupBox1: TGroupBox
        Left = 432
        Top = 208
        Width = 377
        Height = 41
        Enabled = False
        TabOrder = 5
        Visible = False
        object DBchkObrigaOrc: TDBCheckBox
          Left = 8
          Top = -16
          Width = 209
          Height = 17
          Caption = 'Obriga Rubrica Orçamentária'
          DataField = 'FLGOBRIGAORC'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object panCAF: TPanel
        Left = 40
        Top = 184
        Width = 393
        Height = 137
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object Label13: TLabel
          Left = 11
          Top = 57
          Width = 59
          Height = 13
          AutoSize = False
          Caption = 'ATENÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 67
          Top = 57
          Width = 305
          Height = 13
          AutoSize = False
          Caption = ':  TODOS os tipos de Receita ou Operação aqui'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 67
          Top = 73
          Width = 305
          Height = 13
          AutoSize = False
          Caption = '   cadastrados afetam o Custo Contábil e/ou são'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 67
          Top = 89
          Width = 305
          Height = 13
          AutoSize = False
          Caption = '   contabilizados pelo Sistema de Ativo Fixo se a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 67
          Top = 105
          Width = 305
          Height = 13
          AutoSize = False
          Caption = '   opção de integração com esse Sistema estiver'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 67
          Top = 121
          Width = 305
          Height = 13
          AutoSize = False
          Caption = '   selecionada.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 10
          Width = 178
          Height = 13
          Caption = 'Despesa para Acrescimo Valor:'
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 8
          Top = 24
          Width = 377
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESTIPODESPESA'#9'50'#9'Despesa'#9'F')
          DataField = 'IDTIPODESPESA'
          DataSource = ds
          LookupTable = qryLookTipoDespesaAV
          LookupField = 'IDTIPODESPESA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 477
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 477
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
      '   T.IDTIPODESPESA'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T, TIPODOCRECPAG D'
      ''
      'WHERE'
      '   ( T.IDMODULO =:PIDMODULO )'
      '   AND ( T.CODTIPDOC =  D.CODTIPDOC(+) )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      '')
    Left = 152
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita ou Operação'
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
    object qryIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Visible = False
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
      '  IDTIPODESPESA = :IDTIPODESPESA'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    InsertSQL.Strings = (
      'insert into TIPOCUSTORECIMOV'
      
        '  (IDTIPOCUSTORECIMO, DESCCUSTORECIMO, RECCUSTO, CODTIPDOC, FLGO' +
        'BRIGAORC, '
      '   IDRECEITAREEMB, IDMODULO, IDTIPODESPESA)'
      'values'
      
        '  (:IDTIPOCUSTORECIMO, :DESCCUSTORECIMO, :RECCUSTO, :CODTIPDOC, ' +
        ':FLGOBRIGAORC, '
      '   :IDRECEITAREEMB, :IDMODULO, :IDTIPODESPESA)')
    DeleteSQL.Strings = (
      'delete from TIPOCUSTORECIMOV'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    Left = 120
    Top = 40
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
    OnDataChange = dsDataChange
    Left = 184
    Top = 40
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
  object qryLookTipoDespesaAV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPODESPESA, DESTIPODESPESA'
      'FROM TIPODESPESAAV'
      'ORDER BY DESTIPODESPESA')
    ValidateWithMask = True
    Left = 258
    Top = 229
    object qryLookTipoDespesaAVDESTIPODESPESA: TStringField
      DisplayLabel = 'Despesa'
      DisplayWidth = 50
      FieldName = 'DESTIPODESPESA'
      Origin = 'BASEDADOS.TIPODESPESAAV.DESTIPODESPESA'
      FixedChar = True
      Size = 50
    end
    object qryLookTipoDespesaAVIDTIPODESPESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPESA'
      Origin = 'BASEDADOS.TIPODESPESAAV.IDTIPODESPESA'
      Visible = False
    end
  end
end
