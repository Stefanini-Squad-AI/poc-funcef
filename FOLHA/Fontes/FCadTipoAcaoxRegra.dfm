inherited FrmCadTipoAcaoxRegra: TFrmCadTipoAcaoxRegra
  Left = 121
  Top = 159
  HelpContext = 180029
  Caption = 'Associação de Tipo de Ação Judicial por Regra'
  ClientHeight = 303
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 549
    Height = 217
    inherited pnlControles: TPanel
      Width = 539
      Height = 91
      object lblTipoAcao: TLabel
        Left = 5
        Top = 16
        Width = 153
        Height = 16
        Caption = 'Tipo de Ação Judicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblRegra: TLabel
        Left = 5
        Top = 44
        Width = 52
        Height = 16
        Caption = 'Regras'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbTipoAcao: TComboBox
        Left = 170
        Top = 14
        Width = 226
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbTipoAcaoChange
        Items.Strings = (
          'Correção de Tabela de IRRF'
          'Bitributação'
          'Compensação de IRRF')
      end
      object dblkRegra: TwwDBLookupCombo
        Left = 170
        Top = 42
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra'#9'F')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 96
      Width = 539
      Height = 116
      Selected.Strings = (
        'NOMEREGRA'#9'40'#9'Regra'#9'F'
        'DESCACAO'#9'30'#9'Tipo da Ação Judicial'#9'F')
      Align = alBottom
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
    end
  end
  inherited Dock972: TDock97
    Width = 549
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 549
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  R.NOMEREGRA,'
      '  T.IDREGRA,'
      '  T.TIPOACAO,'
      
        '  DECODE(T.TIPOACAO, 0, '#39'Correção de Tabela de IRRF'#39', 1, '#39'Bi-Tri' +
        'butação'#39', 2, '#39'Compensação de IRRF'#39') AS DESCACAO'
      ''
      'FROM'
      '  TIPOACAOXREGRA T,'
      '  REGRA R'
      ''
      'WHERE'
      '  R.IDREGRA  = T.IDREGRA  AND'
      '  T.TIPOACAO = :PTPACAO'
      ''
      ''
      ' '
      ' ')
    Left = 274
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PTPACAO'
        ParamType = ptUnknown
      end>
    object qryNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 40
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryDESCACAO: TStringField
      DisplayLabel = 'Tipo da Ação Judicial'
      DisplayWidth = 30
      FieldName = 'DESCACAO'
      Size = 19
    end
    object qryIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Visible = False
    end
    object qryTIPOACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOACAO'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 48
    Top = 262
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOACAOXREGRA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  TIPOACAO = :TIPOACAO'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  TIPOACAO = :OLD_TIPOACAO')
    InsertSQL.Strings = (
      'insert into CM.TIPOACAOXREGRA'
      '  (IDREGRA, TIPOACAO)'
      'values'
      '  (:IDREGRA, :TIPOACAO)')
    DeleteSQL.Strings = (
      'delete from TIPOACAOXREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  TIPOACAO = :OLD_TIPOACAO')
    Left = 355
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 437
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 315
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 89
    Top = 262
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 396
    Top = 6
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDREGRA,'
      '  NOMEREGRA'
      ''
      'FROM'
      '  REGRA'
      ''
      'ORDER BY'
      '  UPPER(NOMEREGRA)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 469
    Top = 90
  end
end
