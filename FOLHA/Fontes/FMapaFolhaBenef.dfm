inherited frmMapaFolhaBenef: TfrmMapaFolhaBenef
  Left = 383
  Top = 165
  Caption = 'Mapa da Folha de Beneficio'
  ClientHeight = 367
  ClientWidth = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 659
    Height = 328
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 657
      Height = 179
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 88
        Width = 63
        Height = 13
        Caption = 'Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnVerificar: TBitBtn
        Left = 434
        Top = 32
        Width = 103
        Height = 33
        Caption = '&Verificar'
        TabOrder = 1
        OnClick = bbtnVerificarClick
        Kind = bkOK
        Spacing = 2
      end
      object grpPrevia: TGroupBox
        Left = 7
        Top = 8
        Width = 413
        Height = 70
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 7
          Top = 13
          Width = 51
          Height = 13
          Caption = 'Mês e Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 214
          Top = 6
          Width = 6
          Height = 62
          Shape = bsLeftLine
        end
        object Label17: TLabel
          Left = 232
          Top = 13
          Width = 77
          Height = 13
          Caption = 'Nº Folha Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cmbMes: TComboBox
          Left = 8
          Top = 31
          Width = 118
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = cmbMesChange
          OnExit = spedAnoExit
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object spedAno: TSpinEdit
          Left = 130
          Top = 32
          Width = 62
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 1999
          OnChange = cmbMesChange
          OnExit = spedAnoExit
        end
        object dblkpcmb: TwwDBLookupCombo
          Left = 235
          Top = 33
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          LookupTable = qryFolhaEfet
          LookupField = 'IDHSTFOLHABENEF'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblkpcmbClick
          OnClick = dblkpcmbClick
        end
      end
      object memResult: TMemo
        Left = 10
        Top = 106
        Width = 413
        Height = 69
        Lines.Strings = (
          '')
        TabOrder = 2
      end
    end
    object dbgrdConsultaRubricas: TwwDBGrid
      Left = 1
      Top = 180
      Width = 657
      Height = 147
      Selected.Strings = (
        'IDHSTFOLHABENEF'#9'10'#9'Folha '
        'IDRUBRICA'#9'8'#9'Id Rubrica'
        'CODPROVDESC'#9'12'#9'Cod Prov Desc'
        'DESCRICAO'#9'56'#9'Descricao')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsVerHistRubSal
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 328
    Width = 659
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    object bbtnProcessa: TBitBtn
      Left = 72
      Top = 2
      Width = 117
      Height = 33
      Caption = '&Processar'
      Enabled = False
      TabOrder = 2
      OnClick = bbtnProcessaClick
      Kind = bkOK
      Spacing = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 63
    Top = 95
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryFolhaEfet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDHSTFOLHABENEF , h.* from HSTFOLHABENEF h'
      'WHERE h.mesreferencia = :pMESREFERENCIA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 352
    Top = 29
    ParamData = <
      item
        DataType = ftString
        Name = 'pMESREFERENCIA'
        ParamType = ptUnknown
      end>
    object qryFolhaEfetIDHSTFOLHABENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HSTFOLHABENEF.IDHSTFOLHABENEF'
    end
  end
  object qryVerHistRubSal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      
        'SELECT DISTINCT H.IDHSTFOLHABENEF, H.IDRUBRICA, PR.CODPROVDESC, ' +
        'PR.DESCRICAO'
      '  FROM HISTRUBSAL H,'
      '       PROVDESC PR,'
      '       RUBRICAXPLANO RX       '
      ' WHERE H.MESCOBRANCA = :pMESCOBRANCA '
      '   AND H.IDHSTFOLHABENEF = :pIDHSTFOLHABENEF'
      '   AND PR.IDPROVENTO = H.IDRUBRICA'
      '   AND H.IDMODULO = 18'
      '   AND PR.IDCOLUNAMAPA IS NULL'
      '   AND PR.FLGDESCONTO <> 2'
      '   ')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 147
    Top = 179
    ParamData = <
      item
        DataType = ftString
        Name = 'pMESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
    object qryVerHistRubSalIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Folha '
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qryVerHistRubSalIDRUBRICA: TFloatField
      DisplayLabel = 'Id Rubrica'
      DisplayWidth = 8
      FieldName = 'IDRUBRICA'
    end
    object qryVerHistRubSalCODPROVDESC: TStringField
      DisplayLabel = 'Cod Prov Desc'
      DisplayWidth = 12
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryVerHistRubSalDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 56
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object dsVerHistRubSal: TwwDataSource
    DataSet = qryVerHistRubSal
    Left = 145
    Top = 129
  end
end
