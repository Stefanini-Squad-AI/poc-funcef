inherited frmAssocContribReserva: TfrmAssocContribReserva
  Left = 8
  Top = 50
  HelpContext = 160122
  Caption = 'Associação de Contribuições por Reserva'
  ClientHeight = 395
  ClientWidth = 763
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 356
    object sbtnAssocia: TSpeedButton
      Left = 366
      Top = 138
      Width = 25
      Height = 25
      Hint = 'Associar Reserva Selecionada'
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777700777770007777770607777000770000066077
        7000770666666607700077066666666070007706666666077000770000066077
        7000777777060777700077777700777770007777770777777000777777777777
        7000}
      OnClick = sbtnAssociaClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 366
      Top = 182
      Width = 25
      Height = 25
      Hint = 'Desativar Reserva Selecionada'
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777007777770007777060777777000777066000007
        7000770666666607700070666666660770007706666666077000777066000007
        7000777706077777700077777007777770007777770777777000777777777777
        7000}
      OnClick = sbtnDesassociaClick
    end
    object dbgReservaXContrib: TwwDBGrid
      Left = 398
      Top = 70
      Width = 357
      Height = 275
      Selected.Strings = (
        'NOME'#9'28'#9'Reserva'
        'PERCENTUAL'#9'10'#9'Percentual'
        'NOMEREGRA'#9'30'#9'Regra de Cálculo'
        'NOMEREGRARATEIO'#9'30'#9'Regra do Valor Máximo para Rateio '#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsReservaXContrib
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      PopupMenu = pmenu
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
    object panel2: TPanel
      Left = 398
      Top = 7
      Width = 357
      Height = 63
      TabOrder = 0
      object label1: TLabel
        Left = 11
        Top = 7
        Width = 124
        Height = 23
        AutoSize = False
        Caption = 'Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dblkpcmbContrib: TwwDBLookupCombo
        Left = 11
        Top = 32
        Width = 268
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Contribuição')
        LookupTable = qryContrib
        LookupField = 'IDCONTRIBUICAO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbContribCloseUp
        OnEnter = dblkpcmbContribEnter
      end
    end
    object cmtvTipoReserva: TCMTreeView
      Left = 7
      Top = 72
      Width = 350
      Height = 273
      PodeNavegar = True
      DataSource = dsArvore
      CampoChave = qryArvoreCODHIERARQUIA
      CampoDescricao = qryArvoreNOME
      CampoTipo = qryArvoreANALITICOSINTETI
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 349
      Height = 63
      TabOrder = 3
      object lblTitulo: TLabel
        Left = 4
        Top = 4
        Width = 341
        Height = 51
        Alignment = taCenter
        AutoSize = False
        Caption = 'Reservas do Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 422
      DockPos = 425
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 594
      DockPos = 597
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  object seldlgProcura: TcmSelectDlg
    SearchControls = False
    Caption = 'Selecione a Contribuição'
    DataSet = Owner
    FieldNames.Strings = (
      'CONTRIBUICAO'
      'NOMEREGRA')
    DisplayLabels.Strings = (
      'Contribuição'
      'Regra de Cálculo')
    AlwaysShow = False
    HelpContext = 0
    Left = 127
    Top = 349
  end
  object dsArvore: TwwDataSource
    AutoEdit = False
    DataSet = qryArvore
    Left = 54
    Top = 7
  end
  object qryArvore: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDTIPORESERVA, INDICEREAJUSTE,   '
      '       IDREGRAPAGTORESE, NOME, ANALITICOSINTETI,    '
      '       CODHIERARQUIA, FLGCOLETIVA,                         '
      '       FLGCONTROLE,FLGDESCIRRF, FLGTITULARCOLET            '
      'FROM  RESERVAXPLANO'
      'WHERE IDPLANOPREV = 1'
      'ORDER BY CODHIERARQUIA ')
    ValidateWithMask = True
    Left = 102
    Top = 8
    object qryArvoreIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Origin = 'RESERVAXPLANO.IDTIPORESERVA'
    end
    object qryArvoreIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'RESERVAXPLANO.IDPLANOPREV'
    end
    object qryArvoreNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RESERVAXPLANO.NOME'
      Size = 50
    end
    object qryArvoreANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Origin = 'RESERVAXPLANO.ANALITICOSINTETI'
      Size = 1
    end
    object qryArvoreCODHIERARQUIA: TStringField
      FieldName = 'CODHIERARQUIA'
      Origin = 'RESERVAXPLANO.CODHIERARQUIA'
      Size = 8
    end
    object qryArvoreFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Origin = 'RESERVAXPLANO.CODHIERARQUIA'
    end
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.NOME, C.IDCONTRIBUICAO'
      'FROM  CONTRIBUICAO C, CONTPREV CP'
      'WHERE  CP.IDPLANOPREV =:pIdPlanoPrev AND'
      '                CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 708
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryReservaXContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RC.IDPLANOPREV ,'
      '   RC.IDTIPORESERVA,'
      '   RC.IDCONTRIBUICAO,'
      '   RC.IDREGRACALCULORE,'
      '   RC.PERCENTUAL,'
      '   RC.ANOMESREFRATEIO,'
      '   RC.VALORMAXIMORATEIO,'
      '   RC.IDRGVLRMAXRATEIO,'
      '   R.NOMEREGRA, RP.NOME, RGRATEIO.NOMEREGRA NOMEREGRARATEIO'
      
        'FROM RESERVAXCONTRIB RC, REGRA R, RESERVAXPLANO RP, REGRA RGRATE' +
        'IO'
      'WHERE RC.IDPLANOPREV =:pIdPlanoPrev  AND'
      '               RC.IDCONTRIBUICAO =:pIdContribuicao  AND'
      '               RC.IDREGRACALCULORE = R.IDREGRA(+)  AND'
      '               RC.IDRGVLRMAXRATEIO = RGRATEIO.IDREGRA(+)  AND'
      '               RC.IDTIPORESERVA = RP.IDTIPORESERVA AND'
      '               RC.IDPLANOPREV = RP.IDPLANOPREV'
      'ORDER BY RP.NOME'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 586
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdContribuicao'
        ParamType = ptUnknown
      end>
    object qryReservaXContribNOME: TStringField
      DisplayLabel = 'Reserva'
      DisplayWidth = 28
      FieldName = 'NOME'
      Size = 50
    end
    object qryReservaXContribPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = '0.00'
    end
    object qryReservaXContribNOMEREGRA: TStringField
      DisplayLabel = 'Regra de Cálculo'
      DisplayWidth = 30
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryReservaXContribNOMEREGRARATEIO: TStringField
      DisplayLabel = 'Regra do Valor Máximo para Rateio '
      DisplayWidth = 30
      FieldName = 'NOMEREGRARATEIO'
      Size = 60
    end
    object qryReservaXContribIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Visible = False
    end
    object qryReservaXContribIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryReservaXContribIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryReservaXContribIDREGRACALCULORE: TFloatField
      FieldName = 'IDREGRACALCULORE'
      Visible = False
    end
    object qryReservaXContribANOMESREFRATEIO: TStringField
      FieldName = 'ANOMESREFRATEIO'
      Visible = False
      Size = 7
    end
    object qryReservaXContribVALORMAXIMORATEIO: TFloatField
      FieldName = 'VALORMAXIMORATEIO'
      Visible = False
    end
    object qryReservaXContribIDRGVLRMAXRATEIO: TFloatField
      FieldName = 'IDRGVLRMAXRATEIO'
      Visible = False
    end
  end
  object dsReservaXContrib: TwwDataSource
    AutoEdit = False
    DataSet = qryReservaXContrib
    Left = 485
    Top = 299
  end
  object pmenu: TPopupMenu
    Left = 20
    Top = 350
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 68
    Top = 348
  end
end
