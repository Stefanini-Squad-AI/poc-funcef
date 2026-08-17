inherited frmVersaoBaseHist: TfrmVersaoBaseHist
  Left = 261
  Top = 107
  HelpContext = 40333
  ActiveControl = LkcTbVersao
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Versão da Base de Histórico'
  ClientHeight = 411
  ClientWidth = 456
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 456
    Height = 372
    object PageControl: TPageControl
      Left = 5
      Top = 5
      Width = 446
      Height = 362
      ActivePage = TbShVersao
      Align = alClient
      HotTrack = True
      TabOrder = 0
      OnChange = PageControlChange
      object TbShVersao: TTabSheet
        Caption = 'Versão'
        object Label2: TLabel
          Left = 24
          Top = 15
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object Label4: TLabel
          Left = 248
          Top = 76
          Width = 162
          Height = 13
          Caption = 'Data de Referência da Base'
        end
        object Label5: TLabel
          Left = 24
          Top = 179
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label6: TLabel
          Left = 24
          Top = 225
          Width = 140
          Height = 13
          Caption = 'Entidade de Previdência'
        end
        object Label10: TLabel
          Left = 24
          Top = 273
          Width = 110
          Height = 13
          Caption = 'Plano de Benefício'
        end
        object Label13: TLabel
          Left = 24
          Top = 76
          Width = 148
          Height = 13
          Caption = 'Data de Geração da Base'
        end
        object Label14: TLabel
          Left = 24
          Top = 124
          Width = 32
          Height = 13
          Caption = 'Login'
        end
        object DBEdit4: TDBEdit
          Left = 249
          Top = 91
          Width = 118
          Height = 21
          Color = clSilver
          DataField = 'DT_REFER_BASE'
          DataSource = ds
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 24
          Top = 193
          Width = 391
          Height = 21
          AutoSelect = False
          Color = clSilver
          DataField = 'NO_PESSOA'
          DataSource = dsPat
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 24
          Top = 240
          Width = 391
          Height = 21
          AutoSelect = False
          Color = clSilver
          DataField = 'NO_PESSOA'
          DataSource = dsEnt
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 24
          Top = 287
          Width = 391
          Height = 21
          AutoSelect = False
          Color = clSilver
          DataField = 'NO_PLANO'
          DataSource = dsPlan
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 24
          Top = 91
          Width = 162
          Height = 21
          Color = clSilver
          DataField = 'DT_GERACAO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit10: TDBEdit
          Left = 24
          Top = 139
          Width = 202
          Height = 21
          Color = clSilver
          DataField = 'LOGIN'
          DataSource = ds
          ReadOnly = True
          TabOrder = 5
        end
        object LkcTbVersao: TwwDBLookupCombo
          Left = 24
          Top = 30
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DS_VERSAO'#9'50'#9'Versão')
          LookupTable = qryVersao
          LookupField = 'CD_VERSAO'
          Options = [loColLines, loRowLines]
          Color = clSilver
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbVersaoChange
        end
      end
      object TbShEntid: TTabSheet
        Caption = 'Entidade/Patrocinadora/Plano'
        object Label7: TLabel
          Left = 24
          Top = 13
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label8: TLabel
          Left = 24
          Top = 52
          Width = 140
          Height = 13
          Caption = 'Entidade de Previdência'
        end
        object Label3: TLabel
          Left = 24
          Top = 92
          Width = 110
          Height = 13
          Caption = 'Plano de Benefício'
        end
        object Label1: TLabel
          Left = 24
          Top = 132
          Width = 46
          Height = 13
          Caption = 'Versões'
        end
        object Label11: TLabel
          Left = 24
          Top = 285
          Width = 32
          Height = 13
          Caption = 'Login'
        end
        object Label9: TLabel
          Left = 250
          Top = 286
          Width = 148
          Height = 13
          Caption = 'Data de Geração da Base'
        end
        object LkcTbPatroc: TwwDBLookupCombo
          Left = 24
          Top = 28
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PESSOA'#9'60'#9'Patrocinadora')
          LookupTable = qryPatroc
          LookupField = 'CD_PESSOA'
          Options = [loColLines, loRowLines]
          Color = clSilver
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbPatrocChange
        end
        object LkcTbEntid: TwwDBLookupCombo
          Left = 24
          Top = 67
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PESSOA'#9'60'#9'Entidade de Previdência')
          LookupTable = qryEntid
          LookupField = 'CD_PESSOA'
          Options = [loColLines, loRowLines]
          Color = clSilver
          Enabled = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbEntidChange
        end
        object LkcTbPlano: TwwDBLookupCombo
          Left = 24
          Top = 107
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PLANO'#9'60'#9'Plano Patronal')
          LookupTable = qryPlano
          LookupField = 'CD_PLANO'
          Options = [loColLines, loRowLines]
          Color = clSilver
          Enabled = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbPlanoChange
        end
        object DbGrdDet: TwwDBGrid
          Left = 24
          Top = 145
          Width = 391
          Height = 126
          Selected.Strings = (
            'DS_VERSAO'#9'29'#9'Versão'#9'No'
            'DT_REFER_BASE'#9'10'#9'Data de Referência'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clSilver
          DataSource = dsVersoes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 3
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
        object DBEdit7: TDBEdit
          Left = 24
          Top = 300
          Width = 202
          Height = 21
          Color = clSilver
          DataField = 'LOGIN'
          DataSource = dsVersoes
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit2: TDBEdit
          Left = 250
          Top = 301
          Width = 139
          Height = 21
          Color = clSilver
          DataField = 'DT_GERACAO'
          DataSource = dsVersoes
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 456
    inherited tb97Fundo: TToolbar97
      Left = 282
      DockPos = 282
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 114
      DockPos = 114
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object dbnav: TDBNavigator
      Left = 39
      Top = 3
      Width = 112
      Height = 31
      DataSource = dsVersao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
      OnClick = dbnavClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 463
  end
  object qryPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select pj.CD_PESSOA, pj.NO_PESSOA'
      'from FI_PESSOA_JURIDICA pj, FI_PATROCINADORA p'
      'where p.CD_PESSOA_PATROC = pj.CD_PESSOA'
      'order by NO_PESSOA')
    ValidateWithMask = True
    Left = 353
    Top = 59
    object qryPatrocNO_PESSOA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryPatrocCD_PESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
      Visible = False
    end
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select pj.CD_PESSOA, pj.NO_PESSOA'
      'from FI_PESSOA_JURIDICA pj, FI_ENTIDADE_PREVIDENCIA e'
      'where e.CD_PESSOA_ENTID = pj.CD_PESSOA'
      'order by NO_PESSOA')
    ValidateWithMask = True
    Left = 353
    Top = 99
    object qryEntidNO_PESSOA: TStringField
      DisplayLabel = 'Entidade de Previdência'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryEntidCD_PESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
      Visible = False
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PLANO, NO_PLANO '
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      'order by NO_PLANO')
    ValidateWithMask = True
    Left = 354
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryPlanoNO_PLANO: TStringField
      DisplayLabel = 'Plano Patronal'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
    object qryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object qryVersoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.* '
      'from FI_VERSAO_BASE a, FI_BASE_PLANO_PATRONAL b'
      'where b.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and b.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and b.CD_PLANO = :CD_PLANO'
      '   and a.CD_VERSAO = b.CD_VERSAO'
      '   and a.IR_BASE_HISTORICA = '#39'S'#39
      'order by a.DS_VERSAO')
    ValidateWithMask = True
    Left = 74
    Top = 199
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryVersoesDS_VERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 29
      FieldName = 'DS_VERSAO'
      Origin = 'FI_VERSAO_BASE.DS_VERSAO'
      Size = 60
    end
    object qryVersoesDT_REFER_BASE: TDateTimeField
      DisplayLabel = 'Data de Referência'
      DisplayWidth = 10
      FieldName = 'DT_REFER_BASE'
      Origin = 'FI_VERSAO_BASE.DT_REFER_BASE'
    end
    object qryVersoesCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_VERSAO_BASE.CD_VERSAO'
      Visible = False
    end
    object qryVersoesDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'FI_VERSAO_BASE.DT_GERACAO'
      Visible = False
    end
    object qryVersoesLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'FI_VERSAO_BASE.LOGIN'
      Visible = False
    end
    object qryVersoesIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'FI_VERSAO_BASE.IR_BASE_HISTORICA'
      Visible = False
      Size = 1
    end
    object qryVersoesCD_VERSAO_1: TFloatField
      FieldName = 'CD_VERSAO_1'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_VERSAO'
      Visible = False
    end
    object qryVersoesCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryVersoesCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryVersoesCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object dsVersoes: TwwDataSource
    AutoEdit = False
    DataSet = qryVersoes
    Left = 106
    Top = 200
  end
  object srchdlgProcura: TwwSearchDialog
    GridTitleAlignment = taLeftJustify
    GridColor = clWindow
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    Caption = 'Procura'
    MaxWidth = 500
    MaxHeight = 150
    CharCase = ecNormal
    Left = 263
    Top = 17
  end
  object seldlgProcuraQry: TcmSelectDlg
    SearchControls = False
    AlwaysShow = False
    HelpContext = 0
    Left = 343
    Top = 13
  end
  object qryPrincipal: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsVersao
    SQL.Strings = (
      'Select a.*, b.*'
      'from FI_VERSAO_BASE a, FI_BASE_PLANO_PATRONAL b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_VERSAO = b.CD_VERSAO'
      'order by DS_VERSAO'
      '')
    ValidateWithMask = True
    Left = 154
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".CD_VERSAO'
    end
    object qryPrincipalDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".DS_VERSAO'
      Size = 60
    end
    object qryPrincipalDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_VERSAO_BASE".DT_GERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mi:ss'
    end
    object qryPrincipalLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = '"CM.FI_VERSAO_BASE".LOGIN'
    end
    object qryPrincipalDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = '"CM.FI_VERSAO_BASE".DT_REFER_BASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPrincipalIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = '"CM.FI_VERSAO_BASE".CD_PLANO'
      Size = 1
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_VERSAO'
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_PATROC'
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_ENTID'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryPrincipal
    Left = 186
    Top = 115
  end
  object qryPlan: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PLANO = :CD_PLANO'
      '   and CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 199
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryPlanNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".NO_PLANO'
      Size = 60
    end
  end
  object qryEnt: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select NO_PESSOA '
      'from FI_PESSOA_JURIDICA'
      'where CD_PESSOA = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 199
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryEntNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryPat: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select NO_PESSOA'
      'from FI_PESSOA_JURIDICA'
      'where CD_PESSOA = :CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 199
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end>
    object qryPatNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object dsPat: TwwDataSource
    AutoEdit = False
    DataSet = qryPat
    Left = 236
    Top = 218
  end
  object dsEnt: TwwDataSource
    AutoEdit = False
    DataSet = qryEnt
    Left = 236
    Top = 263
  end
  object dsPlan: TwwDataSource
    AutoEdit = False
    DataSet = qryPlan
    Left = 231
    Top = 313
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_VERSAO, DS_VERSAO'
      'from FI_VERSAO_BASE'
      'where IR_BASE_HISTORICA = '#39'S'#39
      'order by DS_VERSAO')
    ValidateWithMask = True
    Left = 93
    Top = 54
    object qryVersaoDS_VERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 50
      FieldName = 'DS_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".DS_VERSAO'
      Size = 60
    end
    object qryVersaoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".CD_VERSAO'
      Visible = False
    end
  end
  object dsVersao: TwwDataSource
    AutoEdit = False
    DataSet = qryVersao
    Left = 126
    Top = 55
  end
  object qryE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_ENTIDADE_PREVIDENCIA b'
      'where a.CD_PESSOA = b.CD_PESSOA_ENTID'
      '   and a.CD_PESSOA = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 1
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryENO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_PATROCINADORA b'
      'where a.CD_PESSOA = b.CD_PESSOA_PATROC'
      '   and a.CD_PESSOA = :CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 36
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end>
    object qryPNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryPl: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 71
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
  end
end
