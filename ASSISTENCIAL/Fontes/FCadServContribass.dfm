inherited frmCadSevContribass: TfrmCadSevContribass
  Left = 89
  Top = 166
  Caption = 'Relacionamento de serviços a Cobrança da Contribuição'
  ClientHeight = 271
  ClientWidth = 572
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 572
    Height = 232
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 193
      Height = 13
      Caption = 'Contribuição / Plano Assistencial '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 38
      Width = 163
      Height = 16
      Caption = 'Serviços Relacionados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 328
      Top = 38
      Width = 132
      Height = 16
      Caption = 'Serviços do Plano '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbtnAssocia: TSpeedButton
      Left = 274
      Top = 76
      Width = 25
      Height = 25
      Hint = 'Associar plano selecionado'
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaClick
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 274
      Top = 106
      Width = 25
      Height = 25
      Hint = 'Associar todos os planos'
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 274
      Top = 136
      Width = 25
      Height = 25
      Hint = 'Desassociar plano selecionado'
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 273
      Top = 166
      Width = 26
      Height = 25
      Hint = 'Desassociar todos os planos'
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object DBLkpLstservRel: TDBLookupListBox
      Left = 17
      Top = 55
      Width = 225
      Height = 160
      KeyField = 'IDSERVASS'
      ListField = 'NOME'
      ListSource = dsservrel
      TabOrder = 0
      OnDragDrop = DBLkpLstservRelDragDrop
      OnDragOver = DBLkpLstservRelDragOver
      OnMouseDown = DBLkpLstservRelMouseDown
    end
    object DBLkpLstserv: TDBLookupListBox
      Left = 329
      Top = 55
      Width = 225
      Height = 160
      KeyField = 'IDSERVASS'
      ListField = 'NOME'
      ListSource = dsserv
      TabOrder = 1
      OnDragDrop = DBLkpLstservDragDrop
      OnDragOver = DBLkpLstservDragOver
      OnMouseDown = DBLkpLstservMouseDown
    end
    object Edit1: TEdit
      Left = 216
      Top = 13
      Width = 337
      Height = 21
      Cursor = crNo
      Color = clMenu
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 572
    inherited tb97Fundo: TToolbar97
      Left = 405
      DockPos = 405
    end
  end
  object qryservrel: TwwQuery
    BeforeOpen = qryservrelBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDSERVASS'
      'FROM   TPSERVASS'
      'WHERE  (IDSERVASS IN (SELECT IDSERVASS'
      '                      FROM   SERVCONTRIBASS'
      '                      WHERE  (IDPLANASS = :IDPLANASS)'
      '                      AND    (IDCONTASS = :IDCONTASS)))')
    Params.Data = {
      01000200094944504C414E415353000608000000000000000000000009494443
      4F4E544153530006080000000000000000000000}
    ValidateWithMask = True
    Left = 176
    Top = 128
  end
  object qryserv: TwwQuery
    BeforeOpen = qryservBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TPSERVASS.NOME, SERVPLANASS.IDSERVASS'
      'FROM   TPSERVASS , SERVPLANASS'
      'WHERE  (SERVPLANASS.IDSERVASS = TPSERVASS.IDSERVASS)'
      'AND    (SERVPLANASS.IDPLANASS = :IDPLANASS)'
      'AND    (SERVPLANASS.IDSERVASS NOT IN (SELECT IDSERVASS'
      '                                      FROM   SERVCONTRIBASS'
      
        '                                      WHERE  (IDPLANASS = :IDPLA' +
        'NASS)'
      
        '                                      AND    (IDCONTASS = :IDCON' +
        'TASS)))')
    Params.Data = {
      01000300094944504C414E415353000608000000000000000000000009494450
      4C414E4153530006080000000000000000000000094944434F4E544153530006
      080000000000000000000000}
    ValidateWithMask = True
    Left = 392
    Top = 96
  end
  object dsservrel: TwwDataSource
    DataSet = qryservrel
    Left = 128
    Top = 144
  end
  object dsserv: TwwDataSource
    DataSet = qryserv
    Left = 376
    Top = 160
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 48
  end
end
