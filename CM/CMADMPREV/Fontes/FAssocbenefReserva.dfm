inherited frmAssocBenefReserva: TfrmAssocBenefReserva
  Left = 253
  Top = 317
  HelpContext = 160123
  Caption = 'Associação de Benefícios por Reserva'
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
      Top = 178
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
    object dbgBenefReserva: TwwDBGrid
      Left = 398
      Top = 70
      Width = 357
      Height = 275
      Selected.Strings = (
        'NOME'#9'27'#9'Reserva'
        'NUMORDEM'#9'9'#9'N° Ordem'
        'NOMEREGRA'#9'38'#9'Regra de Abatimento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsBenefReserva
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
      object lblValores: TLabel
        Left = 11
        Top = 7
        Width = 90
        Height = 23
        AutoSize = False
        Caption = 'Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dblkpcmbBenef: TwwDBLookupCombo
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
          'NOME'#9'60'#9'Benefício')
        LookupTable = qryBenef
        LookupField = 'IDBENEFICIO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkpcmbBenefCloseUp
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
      Left = 591
      DockPos = 749
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 422
      DockPos = 580
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
    Left = 133
    Top = 347
  end
  object dsArvore: TwwDataSource
    AutoEdit = False
    DataSet = qryArvore
    Left = 30
    Top = 33
  end
  object qryArvore: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RESERVAXPLANO')
    ValidateWithMask = True
    Left = 94
    Top = 34
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
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT BENEFICIO.NOME, BENEFICIO.IDBENEFICIO'
      'FROM  BENEFICIO, BENEFPLANPREV'
      'WHERE  BENEFPLANPREV.IDPLANOPREV =:pIdPlanoPrev AND'
      
        '                BENEFPLANPREV.IDBENEFICIO = BENEFICIO.IDBENEFICI' +
        'O'
      'ORDER BY BENEFICIO.NOME'
      ''
      ''
      '')
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
  object qryBenefReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BENEFRESERVA.* , REGRA.NOMEREGRA, RESERVAXPLANO.NOME'
      'FROM BENEFRESERVA, REGRA, RESERVAXPLANO'
      'WHERE BENEFRESERVA.IDPLANOPREV =:pIdPlanoPrev AND'
      '      BENEFRESERVA.IDBENEFICIO =:pIdBeneficio AND'
      '      BENEFRESERVA.IDREGRAABATERESE = REGRA.IDREGRA(+)  AND'
      '      BENEFRESERVA.IDPLANOPREV   = RESERVAXPLANO.IDPLANOPREV AND'
      '      BENEFRESERVA.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA'
      'ORDER BY NUMORDEM'
      ''
      ' ')
    ValidateWithMask = True
    Left = 540
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end>
  end
  object dsBenefReserva: TwwDataSource
    AutoEdit = False
    DataSet = qryBenefReserva
    Left = 439
    Top = 293
  end
  object pmenu: TPopupMenu
    Left = 26
    Top = 348
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 72
    Top = 348
  end
end
