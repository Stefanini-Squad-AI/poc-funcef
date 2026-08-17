inherited frmCadSuspConcPlaPrev: TfrmCadSuspConcPlaPrev
  Left = 230
  Top = 176
  Caption = 'Suspensão de Concessões por Plano Previdenciário'
  ClientHeight = 375
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 289
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 641
      Height = 289
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Histórico de Suspenção'
        object Label1: TLabel
          Left = 432
          Top = 24
          Width = 144
          Height = 13
          Caption = 'Exceção - Plano Contábil'
        end
        object wwDBGrid2: TwwDBGrid
          Left = 0
          Top = 0
          Width = 377
          Height = 257
          Selected.Strings = (
            'NOME'#9'26'#9'Plano Previdenciário'#9'F'
            'DTINICIO'#9'10'#9'Data Início'#9'F'
            'DTFIM'#9'10'#9'Data Fim'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnCellChanged = wwDBGrid2CellChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsHistSusp
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object lstPlaContabilMostra: TCheckListBox
          Left = 392
          Top = 40
          Width = 225
          Height = 177
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Histórico de Alteração'
        ImageIndex = 1
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 633
          Height = 261
          Selected.Strings = (
            'DESCOPERACAO'#9'62'#9'Descrição da Alteração'#9'F'
            'NOME'#9'18'#9'Usuário'#9'F'
            'DATAALT'#9'10'#9'Data da Alteração'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistAlt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 641
      Height = 289
      TabOrder = 1
      object Label2: TLabel
        Left = 12
        Top = 92
        Width = 69
        Height = 13
        Caption = 'Data Início:'
      end
      object Label3: TLabel
        Left = 212
        Top = 92
        Width = 63
        Height = 13
        Caption = 'Data Final:'
      end
      object Label4: TLabel
        Left = 12
        Top = 20
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label5: TLabel
        Left = 12
        Top = 132
        Width = 54
        Height = 13
        Caption = 'Exceção:'
      end
      object edtDataInicio: TwwDBDateTimePicker
        Left = 86
        Top = 88
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTINICIO'
        DataSource = dsHistSusp
        Date = 40909
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object edtDataFim: TwwDBDateTimePicker
        Left = 278
        Top = 88
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTFIM'
        DataSource = dsHistSusp
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dblkpcmbBenef: TwwDBLookupCombo
        Left = 14
        Top = 41
        Width = 507
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = qryLookPlanPrev
        LookupField = 'IDPLANOPREV'
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SearchDelay = 1
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblkpcmbBenefChange
        OnNotInList = dblkpcmbBenefNotInList
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 152
        Width = 225
        Height = 129
        Caption = 'Plano Contábil'
        TabOrder = 3
        object lstPlaContabil: TCheckListBox
          Left = 8
          Top = 16
          Width = 209
          Height = 105
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
      end
      object dbckbPeriodoIndeterminado: TDBCheckBox
        Left = 400
        Top = 90
        Width = 153
        Height = 17
        Caption = 'Período Indeterminado'
        DataField = 'FLGPRAZOINDETERMINADO'
        DataSource = dsHistSusp
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 640
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 640
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 280
    Top = 65534
  end
  inherited ds: TwwDataSource
    Left = 411
    Top = 65534
  end
  inherited upd: TUpdateSQL
    Left = 443
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Left = 573
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 524
    Top = 65534
  end
  inherited qry: TwwQuery
    Left = 378
    Top = 65534
  end
  object qryHistAlt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LTP.DESCOPERACAO,'
      '  PES.NOME,'
      '  TO_CHAR(LTP.DATA, '#39'DD/MM/YYYY'#39') AS DATA,'
      '  LTP.DATA AS DATAALT'
      ' FROM LOGTOTALPREV LTP'
      'INNER JOIN PESSOA PES ON'
      '  PES.IDPESSOA = LTP.IDUSUARIO'
      'WHERE'
      '  IDPESQUISA1 = :IDPLANOPREVCONTABIL'
      '  AND IDPESQUISA2 = :IDSUSPXPLANOPREVEMPTMO'
      'ORDER BY DATAALT DESC')
    ValidateWithMask = True
    Left = 520
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREVCONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSUSPXPLANOPREVEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object dsHistAlt: TwwDataSource
    DataSet = qryHistAlt
    Left = 576
    Top = 288
  end
  object qryExcPlanContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select idplanoprev, idplanoprevprev, nome from planprevcontabil'
      'Where '
      'flgexclusivocontab = '#39'N'#39' '
      'and ativo = '#39'S'#39)
    ValidateWithMask = True
    Left = 480
    Top = 144
  end
  object dsExcPlanContabil: TwwDataSource
    DataSet = qryExcPlanContabil
    Left = 480
    Top = 192
  end
  object dsLookPlanPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryLookPlanPrev
    Left = 366
    Top = 201
  end
  object qryLookPlanPrev: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from planprev')
    ControlType.Strings = (
      'IDBENEFICIO;ImageIndex;Original Size')
    ValidateWithMask = True
    Left = 366
    Top = 248
  end
  object qryItens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 SELECAO,'
      '       '#39'                    '#39' MESREF,'
      '       '#39'                    '#39' MESCOBR,'
      '       '#39'                    '#39' ITEM,'
      '       '#39'                    '#39' MOVIMENTACAO,'
      '       0 VALOR,'
      '       '#39'                    '#39' OPERACAO,'
      '       '#39'                    '#39' FORMAAJUSTADA,'
      '       0 CONTRATO,'
      '       '#39'                    '#39' MATRICULA,'
      '       '#39'                    '#39' SITUACAO,'
      '       '#39'                    '#39' FORMAATUAL,'
      '       0 HMEVLRPREVISTO,'
      '       '#39'                    '#39' HMERECPAG,'
      '       0 ID,'
      '       0 TIPOCONTRATO'
      ' FROM DUAL')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 576
    Top = 192
  end
  object qryHistSusp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      '  SXPPE.IDSUSPXPLANOPREVEMPTMO, '
      '  SXPPE.IDPLANOPREV,  '
      '  SXPPE.IDPLANOPREVCONTABIL,  '
      '  SXPPE.DTINICIO, '
      '  SXPPE.DTFIM, '
      '  SXPPE.FLGPRAZOINDETERMINADO, '
      '  SXPPE.TRGDTINCLUSAO,'
      '  SXPPE.TRGUSERINCLUSAO,'
      '  PP.Nome  '
      'From SUSPXPLANOPREVEMPTMO SXPPE INNER JOIN PLANPREV PP'
      'On SXPPE.IDPLANOPREV = PP.IDPLANOPREV'
      'ORDER BY PP.Nome ,SXPPE.DTINICIO')
    UpdateObject = updHistSusp
    ValidateWithMask = True
    Left = 410
    Top = 46
    object qryHistSuspIDSUSPXPLANOPREVEMPTMO: TFloatField
      FieldName = 'IDSUSPXPLANOPREVEMPTMO'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".IDSUSPXPLANOPREVEMPTMO'
    end
    object qryHistSuspIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".IDPLANOPREV'
    end
    object qryHistSuspIDPLANOPREVCONTABIL: TMemoField
      FieldName = 'IDPLANOPREVCONTABIL'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".IDPLANOPREVCONTABIL'
      BlobType = ftMemo
      Size = 300
    end
    object qryHistSuspDTINICIO: TDateTimeField
      FieldName = 'DTINICIO'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".DTINICIO'
    end
    object qryHistSuspDTFIM: TDateTimeField
      FieldName = 'DTFIM'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".DTFIM'
    end
    object qryHistSuspFLGPRAZOINDETERMINADO: TFloatField
      FieldName = 'FLGPRAZOINDETERMINADO'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".FLGPRAZOINDETERMINADO'
    end
    object qryHistSuspTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".TRGDTINCLUSAO'
    end
    object qryHistSuspTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS."CM.SUSPXPLANOPREVEMPTMO".TRGUSERINCLUSAO'
      Size = 30
    end
    object qryHistSuspNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.PLANPREV".NOME'
      Size = 50
    end
  end
  object dsHistSusp: TwwDataSource
    DataSet = qryHistSusp
    Left = 459
    Top = 54
  end
  object updHistSusp: TUpdateSQL
    ModifySQL.Strings = (
      'update SUSPXPLANOPREVEMPTMO'
      'set'
      '  DTINICIO = :DTINICIO,'
      '  DTFIM = :DTFIM,'
      '  FLGPRAZOINDETERMINADO = :FLGPRAZOINDETERMINADO,'
      '  IDPLANOPREVCONTABIL = :IDPLANOPREVCONTABIL'
      'where'
      '  IDSUSPXPLANOPREVEMPTMO = :OLD_IDSUSPXPLANOPREVEMPTMO')
    InsertSQL.Strings = (
      'insert into SUSPXPLANOPREVEMPTMO'
      '  (IDSUSPXPLANOPREVEMPTMO, IDPLANOPREV, IDPLANOPREVCONTABIL, '
      'DTINICIO, DTFIM, FLGPRAZOINDETERMINADO)'
      'values'
      '  (SEQSUSPXPLANOPREVEMPTMO.nextval, :IDPLANOPREV, '
      ':IDPLANOPREVCONTABIL, :DTINICIO, :DTFIM, '
      ':FLGPRAZOINDETERMINADO)')
    DeleteSQL.Strings = (
      'delete from SUSPXPLANOPREVEMPTMO'
      'where'
      '  IDSUSPXPLANOPREVEMPTMO = :OLD_IDSUSPXPLANOPREVEMPTMO')
    Left = 507
    Top = 46
  end
end
