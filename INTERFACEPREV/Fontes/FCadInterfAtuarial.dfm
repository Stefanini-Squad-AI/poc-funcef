inherited frmCadInterfAtuarial: TfrmCadInterfAtuarial
  Left = 108
  Top = 179
  Caption = 'Cadastro de Interface do Atuarial'
  ClientHeight = 193
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 154
    object lblSalMedioContrib: TLabel
      Left = 15
      Top = 51
      Width = 291
      Height = 13
      Caption = 'Regra de Cálculo do Salário Médio de Contribuição'
    end
    object lblReservaControle: TLabel
      Left = 15
      Top = 99
      Width = 208
      Height = 13
      Caption = 'Reserva a Considerar como Controle'
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 491
      Height = 41
      Align = alTop
      TabOrder = 2
      object stPlano: TStaticText
        Left = 8
        Top = 8
        Width = 59
        Height = 22
        Caption = 'Plano: '
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object stNomePlano: TStaticText
        Left = 63
        Top = 8
        Width = 105
        Height = 22
        Caption = 'stNomePlano'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object dblkpcmbResControle: TCMDBLookupCombo
      Left = 15
      Top = 115
      Width = 470
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome')
      DataField = 'IDRESCONTROLEATU'
      DataSource = dsPlano
      LookupTable = qryResControle
      LookupField = 'IDTIPORESERVA'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object lkpcmbSalMedioContrib: TCMDBLookupCombo
      Left = 15
      Top = 67
      Width = 470
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Nome da Regra')
      DataField = 'IDRGSALMEDIOATU'
      DataSource = dsPlano
      LookupTable = qryRgSalMediaAtu
      LookupField = 'IDREGRA'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 215
  end
  object qryRgSalMediaAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, '
      '               NOMEREGRA'
      'FROM   REGRA'
      'ORDER BY NOMEREGRA '
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 429
    Top = 9
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV,'
      '  IDPLANOATU,'
      '  IDRESCONTROLEATU,'
      '  IDRGSALMEDIOATU'
      'FROM'
      '  PLANPREV'
      'WHERE'
      '  IDPLANOPREV = :IDPLANOPREV')
    UpdateObject = updPlano
    ValidateWithMask = True
    Left = 345
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryResControle: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RXP.NOME, RXP.IDTIPORESERVA, RXP.IDPLANOPREV'
      'FROM RESERVAXPLANO RXP'
      'WHERE RXP.IDPLANOPREV = :IDPLANOPREV'
      'AND       RXP.ANALITICOSINTETI = '#39'A'#39
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 401
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TDataSource
    DataSet = qryPlano
    Left = 317
    Top = 9
  end
  object updPlano: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANOATU = :IDPLANOATU,'
      '  IDRESCONTROLEATU = :IDRESCONTROLEATU,'
      '  IDRGSALMEDIOATU = :IDRGSALMEDIOATU'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (IDPLANOPREV, IDPLANOATU, IDRESCONTROLEATU, IDRGSALMEDIOATU)'
      'values'
      
        '  (:IDPLANOPREV, :IDPLANOATU, :IDRESCONTROLEATU, :IDRGSALMEDIOAT' +
        'U)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 373
    Top = 9
  end
end
