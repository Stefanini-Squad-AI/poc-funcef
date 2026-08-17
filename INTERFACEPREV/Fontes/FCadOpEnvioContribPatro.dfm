inherited frmCadOpEnvioContribPatro: TfrmCadOpEnvioContribPatro
  Left = 404
  Top = 186
  HelpContext = 320026
  Caption = 'Opção de Envio por Contribuição'
  ClientHeight = 387
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 536
    Height = 348
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 534
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 12
        Width = 84
        Height = 13
        Caption = 'Patrocinadora '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbpatro: TwwDBLookupCombo
        Left = 9
        Top = 26
        Width = 384
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qrypatro
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnClick = cmbpatroClick
        OnCloseUp = cmbpatroCloseUp
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 72
      Width = 534
      Height = 275
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 534
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'Contribuições'
        Color = clAppWorkSpace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 29
        Width = 534
        Height = 246
        Selected.Strings = (
          'Contrib'#9'45'#9'Contribuição'
          'FLGTPVLR'#9'15'#9'Opção')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = dsGridContrib
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnExit = wwDBGrid1Exit
        IndicatorColor = icBlack
      end
      object cmbFlgTpVlr: TwwDBComboBox
        Left = 56
        Top = 8
        Width = 121
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGTPVLR'
        DataSource = dsGridContrib
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Não Envia'#9'N'
          'Envia Valor'#9'V'
          'Envia Base'#9'B')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 536
    inherited tb97Fundo: TToolbar97
      Left = 364
      DockPos = 546
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 195
      DockPos = 377
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        ModalResult = 0
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        ModalResult = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
    Top = 3
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  object dsGridContrib: TwwDataSource
    DataSet = qryGridContrib
    Left = 65
    Top = 252
  end
  object qryGridContrib: TwwQuery
    BeforePost = qryGridContribBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CONTPLANPATRO WHERE'
      'IDPESSJUR = :IDPESSOA')
    ControlType.Strings = (
      'FLGTPVLR;CustomEdit;cmbFlgTpVlr')
    LookupFields.Strings = (
      'Contrib;BaseDados;CONTRIBUICAO;NOME;;IDCONTRIBUICAO;Y')
    LookupLinks.Strings = (
      'IDCONTRIBUICAO;IDCONTRIBUICAO')
    ValidateWithMask = True
    Left = 66
    Top = 213
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGridContribContrib: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 45
      FieldKind = fkCalculated
      FieldName = 'Contrib'
      Size = 60
      Calculated = True
    end
    object qryGridContribFLGTPVLR: TStringField
      DisplayLabel = 'Opção'
      DisplayWidth = 15
      FieldName = 'FLGTPVLR'
      Origin = 'BASEDADOS.CONTPLANPATRO.FLGTPVLR'
      FixedChar = True
      Size = 1
    end
    object qryGridContribIDCONTRIBUICAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRIBUICAO'
      Origin = 'BASEDADOS.CONTPLANPATRO.IDCONTRIBUICAO'
      Visible = False
    end
  end
  object qrypatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA , P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qrypatro
    Enabled = False
    Left = 301
    Top = 36
  end
end
