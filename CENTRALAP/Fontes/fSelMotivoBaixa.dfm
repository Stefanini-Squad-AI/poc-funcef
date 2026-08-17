inherited frmSelMotivoBaixa: TfrmSelMotivoBaixa
  Left = 366
  Top = 153
  Caption = 'Motivo de Baixa da RUBS'
  ClientHeight = 114
  ClientWidth = 452
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 75
    object Label1: TLabel
      Left = 24
      Top = 15
      Width = 148
      Height = 13
      Caption = 'Motivo de Baixa da RUBS'
    end
    object CmbMotivoBaixa: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 401
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição')
      LookupTable = qry
      LookupField = 'IDCANCELAMENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 75
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 273
      DockPos = 273
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 105
      DockPos = 105
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 99
  end
  object qry: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDCANCELAMENTO, DESCRICAO'
      'FROM '
      '   TPCANCELAMENTO'
      'WHERE'
      '    TIPOOPERACAO = :TIPOOPERACAO'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 303
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = '"CM.TPCANCELAMENTO".DESCRICAO'
      Size = 40
    end
    object qryIDCANCELAMENTO: TFloatField
      FieldName = 'IDCANCELAMENTO'
      Origin = '"CM.TPCANCELAMENTO".IDCANCELAMENTO'
      Visible = False
    end
  end
end
