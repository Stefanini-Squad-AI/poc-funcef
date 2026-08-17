inherited frmExecDesfazAntecipa: TfrmExecDesfazAntecipa
  Left = 158
  Top = 118
  HelpContext = 1350014
  Caption = 'Desfaz Antecipação de Parcelas'
  ClientHeight = 353
  ClientWidth = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 533
    Height = 314
    object gbContrato: TGroupBox
      Left = 17
      Top = 9
      Width = 496
      Height = 152
      Caption = 'Contrato'
      TabOrder = 0
      object Label3: TLabel
        Left = 14
        Top = 57
        Width = 61
        Height = 13
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 102
        Width = 139
        Height = 13
        Caption = 'Condição de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtComprador: TEdit
        Left = 14
        Top = 73
        Width = 419
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 1
      end
      object dblcbCondPag: TCMDBLookupCombo
        Left = 14
        Top = 118
        Width = 419
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DSCCOND'#9'10'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
        LookupTable = qryCondPag
        LookupField = 'IDCONDPAGIMOVEL'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcbCondPagCloseUp
      end
      inline molProposta1: TmolProposta
        Left = 7
        Top = 14
        Width = 482
        inherited Label1: TLabel
          Width = 44
          Caption = 'Número'
        end
        inherited Label2: TLabel
          Width = 58
          Caption = 'Descrição'
        end
        inherited edtNomProp: TEdit
          Width = 313
        end
        inherited btnBuscaProp: TBitBtn
          Left = 426
          OnClick = molProposta1btnBuscaPropClick
        end
        inherited btnLimpaProp: TBitBtn
          Left = 450
          OnClick = molProposta1btnLimpaPropClick
        end
      end
    end
    object Panel5: TPanel
      Left = 17
      Top = 168
      Width = 496
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Parcelas Antecipadas e não Integradas'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBgrdBemOriginal: TwwDBGrid
      Left = 17
      Top = 195
      Width = 496
      Height = 92
      Selected.Strings = (
        'CHKANTECIPA'#9'4'#9#9'F'
        'NUMPARCELA'#9'7'#9'Parcela'#9'T'
        'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'T'
        'DESCPARCELA'#9'34'#9'Descrição'#9'F'
        'VLRPRESTACAO'#9'15'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsParc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBgrdBemOriginalCalcCellColors
      OnDblClick = DBgrdBemOriginalDblClick
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdBemOriginalTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 533
    inherited tb97Fundo: TToolbar97
      Left = 361
      DockPos = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      inherited ToolbarSep971: TToolbarSep97
        Left = 185
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 24
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 24
        Width = 161
        Caption = '&Desfazer Antecipação'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 315
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMP' +
        'ARCELAS,'#39'999'#39')),'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMPA' +
        'RCELAS,'#39'999'#39')) )  AS DSCCOND'
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN('#39'P'#39','#39'R'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      'ORDER BY DSCCOND')
    ValidateWithMask = True
    Left = 362
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
    end
    object qryCondPagDSCCOND: TStringField
      FieldName = 'DSCCOND'
      Size = 34
    end
  end
  object qryParc: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (0) CHKANTECIPA,'
      '     IDCONDPAGIMOVEL,   IDPARCFINANCIMOV,'
      '     NUMPARCELA,        DATAVENCIMENTO,'
      '     FLGTIPOLANC,       FLGLANCINTEGRA,'
      '     DATALANCINTEGRA,   CODDOCUMENTO,'
      '     PLNCODIGO,'
      
        '     DECODE(FLGTIPOLANC,9,VLRAMORTIZACAO,VLRPRESTACAO)  AS VLRPR' +
        'ESTACAO,'
      '     '#39'                              '#39' AS DESCPARCELA'
      ''
      'FROM'
      '     PARCFINANCIMOV'
      'WHERE'
      '       (FLGTIPOLANC = 9)'
      
        '   AND ((:pIDCONDPAGIMOVEL IS NULL) OR (IDCONDPAGIMOVEL  = :pIDC' +
        'ONDPAGIMOVEL))'
      ''
      'ORDER BY NUMPARCELA'
      '')
    UpdateObject = UpdParc
    ControlType.Strings = (
      'CHKANTECIPA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 448
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryParcCHKANTECIPA: TFloatField
      FieldName = 'CHKANTECIPA'
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcNUMPARCELA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'NUMPARCELA'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcDESCPARCELA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCPARCELA'
      FixedChar = True
      Size = 30
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcDATALANCINTEGRA: TDateTimeField
      FieldName = 'DATALANCINTEGRA'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 448
    Top = 216
  end
  object UpdParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  VLRJUROS = :VLRJUROS,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  FLGTIPOLANC = :FLGTIPOLANC'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      '')
    Left = 448
    Top = 233
  end
end
