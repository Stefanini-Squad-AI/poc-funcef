inherited frmCadTipoRecDesInvestImob: TfrmCadTipoRecDesInvestImob
  Left = 138
  Top = 205
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
    end
    inherited pnlControles: TPanel [1]
      Width = 609
      Height = 258
      object Label1: TLabel
        Left = 112
        Top = 10
        Width = 163
        Height = 13
        Caption = 'Tipo de Receita ou Despesa'
      end
      object Label2: TLabel
        Left = 112
        Top = 122
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object Label3: TLabel
        Left = 536
        Top = 82
        Width = 210
        Height = 13
        Caption = 'Receita para Despesa Reembolsável'
        Visible = False
      end
      object Label13: TLabel
        Left = 120
        Top = 172
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
        Left = 184
        Top = 172
        Width = 305
        Height = 13
        AutoSize = False
        Caption = ':  TODOS os tipos de Receita ou Despesas aqui'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 184
        Top = 188
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
        Left = 184
        Top = 204
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
        Left = 184
        Top = 220
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
        Left = 184
        Top = 236
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
      object DBrdgCustoRec: TDBRadioGroup
        Left = 112
        Top = 61
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
      end
      object DBedtDescricao: TDBEdit2
        Left = 112
        Top = 24
        Width = 377
        Height = 21
        DataField = 'DESCCUSTORECIMO'
        DataSource = ds
        TabOrder = 1
      end
      object DBcboTipoDoc: TwwDBLookupCombo
        Left = 112
        Top = 136
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODTIPDOC'
        DataSource = ds
        LookupField = 'CODTIPDOC'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object DBchkObrigaOrc: TDBCheckBox
        Left = 536
        Top = 136
        Width = 209
        Height = 17
        Caption = 'Obriga Rubrica Orçamentária'
        DataField = 'FLGOBRIGAORC'
        DataSource = ds
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
      object DBCboReceitaReembolso: TwwDBLookupCombo
        Left = 536
        Top = 96
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
        TabOrder = 4
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
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
      Left = 441
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 257
    end
  end
  inherited qry: TwwQuery
    Left = 552
    Top = 0
  end
  inherited upd: TUpdateSQL
    Left = 520
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 928
    Top = 8
  end
  inherited ds: TwwDataSource
    Left = 584
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 937
    Top = 110
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 932
    Top = 54
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
    Top = 16
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
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCUSTORECIMO, DESCCUSTORECIMO'
      'FROM'
      '  TIPOCUSTORECIMOV'
      'WHERE'
      '  ( LOWER(DESCCUSTORECIMO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 456
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
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
end
