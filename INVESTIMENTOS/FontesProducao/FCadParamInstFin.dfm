inherited frmCadParamInstFin: TfrmCadParamInstFin
  Left = 450
  Top = 286
  Caption = 'Tipo de Indicador de Instituição Financeira'
  ClientHeight = 233
  ClientWidth = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 431
    Height = 147
    object GroupBox1: TGroupBox
      Left = 20
      Top = 13
      Width = 389
      Height = 119
      Caption = ' Tipo de Indicador '
      TabOrder = 0
      object LbLDescParamEmissor: TLabel
        Left = 12
        Top = 13
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object LblIdRegra: TLabel
        Left = 12
        Top = 56
        Width = 35
        Height = 13
        Caption = 'Regra'
      end
      object wwDBEDescricao: TwwDBEdit
        Left = 12
        Top = 27
        Width = 366
        Height = 21
        DataField = 'DESCPARAMINSTFIN'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBLookupcbRegra: TwwDBLookupCombo
        Left = 12
        Top = 72
        Width = 366
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'40'#9'Regras')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = QryRegras
        LookupField = 'IDREGRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 431
  end
  inherited Dock971: TDock97
    Top = 194
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 253
      DockPos = 253
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 84
      DockPos = 84
    end
  end
  inherited ds: TwwDataSource
    Left = 301
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update paramInstFin'
      'set'
      '  IDPARAMINSTFIN = :IDPARAMINSTFIN,'
      '  DESCPARAMINSTFIN = :DESCPARAMINSTFIN,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDPARAMINSTFIN = :OLD_IDPARAMINSTFIN')
    InsertSQL.Strings = (
      'insert into paramInstFin'
      '  (IDPARAMINSTFIN, DESCPARAMINSTFIN, IDREGRA)'
      'values'
      '  (:IDPARAMINSTFIN, :DESCPARAMINSTFIN, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from paramInstFin'
      'where'
      '  IDPARAMINSTFIN = :OLD_IDPARAMINSTFIN')
    Left = 237
    Top = 3
  end
  object QryRegras: TwwQuery [6]
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select        R.idregra,'
      '                 R.nomeregra '
      ''
      'from          regra R'
      ''
      'order by   R.nomeregra')
    ValidateWithMask = True
    Left = 36
    Top = 135
    object QryRegrasNOMEREGRA: TStringField
      DisplayLabel = 'Regras'
      DisplayWidth = 40
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
    object QryRegrasIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DescParamInstFin')
    TipodeDado.Strings = (
      'c')
    Descricao.Strings = (
      'Descrição do Indicador')
    Tabelas.Strings = (
      'ParamInstFin')
    CamposChave.Strings = (
      'IdParamInstFin')
    Left = 332
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select *  from paramInstFin'
      '')
    Left = 269
    Top = 3
    object qryIDPARAMINSTFIN: TFloatField
      FieldName = 'IDPARAMINSTFIN'
      Origin = 'PARAMINSTFIN.IDPARAMINSTFIN'
    end
    object qryDESCPARAMINSTFIN: TStringField
      FieldName = 'DESCPARAMINSTFIN'
      Origin = 'PARAMINSTFIN.DESCPARAMINSTFIN'
      Size = 60
    end
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'PARAMINSTFIN.IDREGRA'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 364
    Top = 3
  end
end
