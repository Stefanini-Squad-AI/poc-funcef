inherited frmParamAutoriza: TfrmParamAutoriza
  Left = 196
  Top = 168
  Caption = 'Autorizações'
  ClientHeight = 256
  ClientWidth = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 217
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object cboTabela: TwwDBLookupCombo
      Left = 3
      Top = 24
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TABLE_NAME'#9'30'#9'Nome da Tabela'#9'F')
      DataField = 'NOMETABELA'
      LookupField = 'TABLE_NAME'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBGridBackAutoriza: TwwDBGrid
      Left = 1
      Top = 72
      Width = 430
      Height = 144
      Selected.Strings = (
        'IDBACKCTRL'#9'6'#9'Seq.'
        'TRGDTINCLUSAO'#9'18'#9'Data/Hora')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsBack
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 217
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 260
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 283
    Top = 27
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object sqlBack: TCMSqlParams
    SQL.Strings = (
      'select D1.IDBACKCTRL, D1.TRGDTINCLUSAO, '
      ' ('
      '  SELECT U.NOMEUSUARIO'
      '  FROM BACKCTRL D, USUARIOSISTEMA U'
      '  WHERE D.IDBACKCTRL = D1.IDBACKCTRL'
      '  AND TRIM(SUBSTR(D.TRGUSERINCLUSAO, 3, 30)) = U.IDUSUARIO'
      ' ) Usuario'
      ' from BACKCTRL D1'
      'ORDER BY D1.IDBACKCTRL DESC'
      ' ')
    ClientDataSet = cmcdsBack
    Left = 280
    Top = 136
  end
  object cmcdsBack: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 281
    Top = 81
    Data = {
      C60000009619E0BD0100000018000000030002000000030000009C000A494442
      41434B4354524C08000400000000000D5452474454494E434C5553414F080008
      0000000000075553554152494F01004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200140002000D44454641
      554C545F4F5244455202008200010000000180044C4349440400010009080000
      00000000000000405B4000901D8B00C8CC4202434D0000000000000080594000
      3472E0F8C7CC4202434D}
  end
  object dsBack: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsBack
    Left = 336
    Top = 136
  end
end
