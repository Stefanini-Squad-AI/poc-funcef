inherited frmAssocContribEventoF: TfrmAssocContribEventoF
  Left = 150
  Top = 75
  HelpContext = 160112
  Caption = 'Associação de Contribuições a Cobrar na Ocorrência de Eventos'
  ClientHeight = 436
  ClientWidth = 732
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 179
    Width = 732
    Height = 218
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 216
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbPlanoNao: TLabel
        Left = 379
        Top = 6
        Width = 262
        Height = 46
        AutoSize = False
        Caption = 'Contribuições não Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object sbtnAssocia: TSpeedButton
        Left = 349
        Top = 72
        Width = 25
        Height = 26
        Hint = 'Associar contribuição selecionada'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 349
        Top = 102
        Width = 25
        Height = 26
        Hint = 'Associar todas as contribuições'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 349
        Top = 132
        Width = 25
        Height = 26
        Hint = 'Desativar Contribuição selecionada'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 349
        Top = 162
        Width = 25
        Height = 25
        Hint = 'Desativar todas as contribuições'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object lblPlanPatro: TLabel
        Left = 6
        Top = 6
        Width = 283
        Height = 52
        AutoSize = False
        Caption = 'Contribuições Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object dblkplistContribNaoAssoc: TDBLookupListBox
        Left = 379
        Top = 60
        Width = 334
        Height = 134
        KeyField = 'IDCONTRIBUICAO'
        ListField = 'NOME'
        ListSource = dsContPrev
        TabOrder = 0
        OnDragDrop = dblkplistContribNaoAssocDragDrop
        OnDragOver = dblkplistContribNaoAssocDragOver
        OnMouseDown = dblkplistContribNaoAssocMouseDown
      end
      object dbgrdContribAssoc: TwwDBGrid
        Left = 6
        Top = 60
        Width = 337
        Height = 136
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'No')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        DataSource = dsContPrevEvento
        Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        PopupMenu = pmenu
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDragDrop = dbgrdContribAssocDragDrop
        OnDragOver = dbgrdContribAssocDragOver
        OnMouseDown = dbgrdContribAssocMouseDown
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 450
      DockPos = 450
      inherited sep1: TToolbarSep97
        Left = 77
      end
      inherited bbtnSair: TBitBtn
        Width = 77
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 79
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 732
    Height = 179
    Align = alTop
    TabOrder = 0
    object lbPatro: TLabel
      Left = 6
      Top = 3
      Width = 202
      Height = 23
      Caption = 'Planos Previdenciários'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 314
      Top = 3
      Width = 168
      Height = 23
      Caption = 'Eventos Geradores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object dbgrdPlanos: TDBGrid
      Left = 9
      Top = 33
      Width = 280
      Height = 136
      DataSource = dsPlanPrev
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Fantasia'
          Visible = True
        end>
    end
    object dbgrdEventos: TDBGrid
      Left = 313
      Top = 33
      Width = 280
      Height = 136
      DataSource = dsEventoGerador
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Fantasia'
          Visible = True
        end>
    end
  end
  object dsPlanPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryPlanPrev
    Left = 49
    Top = 119
  end
  object dsContPrevEvento: TwwDataSource
    DataSet = qryContPrevEvento
    Left = 56
    Top = 331
  end
  object qryContPrevEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CE.IDPLANOPREV, CE.IDEVENTOGERADOR, CE.IDCONTRIBUICAO, '
      '               CE.IDREGRAVALIDAASS,  C.NOME  '
      'FROM     CONTPREVEVENTO CE, CONTRIBUICAO C  '
      'WHERE  CE.IDCONTRIBUICAO  = C.IDCONTRIBUICAO AND '
      '                CE.IDPLANOPREV            =:pIdPlanoPrev AND '
      '                CE.IDEVENTOGERADOR =:pIdEventoGerador '
      'ORDER BY C.NOME ')
    ValidateWithMask = True
    Left = 154
    Top = 332
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdEventoGerador'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPrev: TwwQuery
    AfterScroll = qryPlanPrevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME '
      'FROM PLANPREV '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 119
    Top = 120
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 29
    Top = 390
  end
  object qryContPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CP.IDPLANOPREV, CP.IDCONTRIBUICAO, C.NOME'
      'FROM    CONTPREV CP, CONTRIBUICAO C'
      'WHERE   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND     CP.IDPLANOPREV =:pIdPlanoPrev'
      'AND     NOT EXISTS( SELECT CE.IDCONTRIBUICAO'
      '                    FROM   CONTPREVEVENTO CE'
      '                    WHERE  CE.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      '                    AND    CE.IDPLANOPREV = CP.IDPLANOPREV'
      
        '                    AND    CE.IDEVENTOGERADOR =:pIdEventoGerador' +
        ')'
      'ORDER BY C.NOME'
      '')
    ValidateWithMask = True
    Left = 450
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdEventoGerador'
        ParamType = ptUnknown
      end>
  end
  object dsEventoGerador: TwwDataSource
    AutoEdit = False
    DataSet = qryEventoGerador
    Left = 363
    Top = 121
  end
  object qryEventoGerador: TwwQuery
    AfterScroll = qryEventoGeradorAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR,  NOME, FLGINTERNO  FROM  EVENTOGERADOR'
      'WHERE IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 459
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsContPrev: TwwDataSource
    DataSet = qryContPrev
    Left = 381
    Top = 331
  end
  object pmenu: TPopupMenu
    Left = 90
    Top = 390
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
  end
end
