inherited frmVersaoBase: TfrmVersaoBase
  Left = 283
  Top = 180
  HelpContext = 40153
  ActiveControl = LkcTbVersao
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Versão da Base de Trabalho'
  ClientHeight = 422
  ClientWidth = 544
  DefaultMonitor = dmMainForm
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    Height = 383
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 542
      Height = 381
      ActivePage = TbShVersao
      Align = alClient
      HotTrack = True
      TabOrder = 0
      OnChange = PageControlChange
      object TbShVersao: TTabSheet
        Caption = 'Versão'
        object Label2: TLabel
          Left = 38
          Top = 15
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object Label4: TLabel
          Left = 262
          Top = 76
          Width = 162
          Height = 13
          Caption = 'Data de Referência da Base'
        end
        object Label13: TLabel
          Left = 38
          Top = 76
          Width = 148
          Height = 13
          Caption = 'Data de Geração da Base'
        end
        object Label14: TLabel
          Left = 38
          Top = 124
          Width = 32
          Height = 13
          Caption = 'Login'
        end
        object DBEdit4: TDBEdit
          Left = 263
          Top = 91
          Width = 118
          Height = 21
          DataField = 'DT_REFER_BASE'
          DataSource = ds
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 38
          Top = 91
          Width = 162
          Height = 21
          Color = clSilver
          DataField = 'DT_GERACAO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit10: TDBEdit
          Left = 38
          Top = 139
          Width = 202
          Height = 21
          Color = clSilver
          DataField = 'LOGIN'
          DataSource = ds
          ReadOnly = True
          TabOrder = 2
        end
        object LkcTbVersao: TwwDBLookupCombo
          Left = 38
          Top = 30
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DS_VERSAO'#9'50'#9'Versão')
          LookupTable = QryLkpVersao
          LookupField = 'CD_VERSAO'
          Options = [loColLines, loRowLines]
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object PgCtrlDetalhe: TPageControl
          Left = 0
          Top = 183
          Width = 534
          Height = 170
          ActivePage = tbshDetalhe
          Align = alBottom
          HotTrack = True
          TabOrder = 4
          object tbshDetalhe: TTabSheet
            Caption = 'Agrupamento'
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 526
              Height = 142
              Selected.Strings = (
                'ds_entidade'#9'17'#9'Entidade'
                'ds_patrocinadora'#9'21'#9'Patrocinadora'
                'ds_plano'#9'20'#9'Plano')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsBasePlano
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
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
          end
        end
      end
      object TbShEntid: TTabSheet
        Caption = 'Entidade/Patrocinadora/Plano'
        object Label7: TLabel
          Left = 67
          Top = 13
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label8: TLabel
          Left = 67
          Top = 52
          Width = 140
          Height = 13
          Caption = 'Entidade de Previdência'
        end
        object Label3: TLabel
          Left = 67
          Top = 92
          Width = 110
          Height = 13
          Caption = 'Plano de Benefício'
        end
        object Label1: TLabel
          Left = 67
          Top = 132
          Width = 46
          Height = 13
          Caption = 'Versões'
        end
        object Label11: TLabel
          Left = 67
          Top = 285
          Width = 32
          Height = 13
          Caption = 'Login'
        end
        object Label9: TLabel
          Left = 293
          Top = 286
          Width = 148
          Height = 13
          Caption = 'Data de Geração da Base'
        end
        object LkcTbPatroc: TwwDBLookupCombo
          Left = 67
          Top = 28
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PESSOA'#9'60'#9'Patrocinadora')
          LookupTable = QryLkpPatrocinadora
          LookupField = 'CD_PESSOA'
          Options = [loColLines, loRowLines]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbPatrocChange
        end
        object LkcTbEntid: TwwDBLookupCombo
          Left = 67
          Top = 67
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PESSOA'#9'60'#9'Entidade de Previdência')
          LookupTable = QryLkpEntidade
          LookupField = 'CD_PESSOA'
          Options = [loColLines, loRowLines]
          Enabled = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbEntidChange
        end
        object LkcTbPlano: TwwDBLookupCombo
          Left = 67
          Top = 107
          Width = 391
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NO_PLANO'#9'60'#9'Plano de Benefício'#9'F')
          LookupTable = QryLkpPlano
          LookupField = 'CD_PLANO'
          Options = [loColLines, loRowLines]
          Enabled = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = LkcTbPlanoChange
        end
        object DbGrdDet: TwwDBGrid
          Left = 67
          Top = 145
          Width = 391
          Height = 126
          Selected.Strings = (
            'DS_VERSAO'#9'31'#9'Versão'
            'DT_REFER_BASE'#9'10'#9'Referência')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsVersoes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          Left = 67
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
          Left = 293
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
    Top = 383
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 283
      DockPos = 283
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
      DataSource = dsLkpVersao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 463
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
    DataSource = dsLkpVersao
    SQL.Strings = (
      'Select a.*, b.*'
      'from FI_VERSAO_BASE a, FI_BASE_PLANO_PATRONAL b'
      'where a.CD_VERSAO = b.CD_VERSAO'
      '  and IR_BASE_HISTORICA = '#39'N'#39
      '  and a.CD_VERSAO = :CD_VERSAO'
      'order by DS_VERSAO')
    ValidateWithMask = True
    Left = 158
    Top = 115
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryPrincipalDS_VERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 50
      FieldName = 'DS_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".DS_VERSAO'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".CD_VERSAO'
      Visible = False
    end
    object qryPrincipalDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_VERSAO_BASE".DT_GERACAO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object qryPrincipalLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = '"CM.FI_VERSAO_BASE".LOGIN'
      Visible = False
    end
    object qryPrincipalDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = '"CM.FI_VERSAO_BASE".DT_REFER_BASE'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPrincipalIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = '"CM.FI_VERSAO_BASE".CD_PLANO'
      Visible = False
      Size = 1
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_VERSAO'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_PATROC'
      Visible = False
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_ENTID'
      Visible = False
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryPrincipal
    Left = 186
    Top = 115
  end
  object qryEntidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_PESSOA, NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_ENTIDADE_PREVIDENCIA b'
      'where a.CD_PESSOA = b.CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 273
    Top = 187
    object qryEntidadeNO_PESSOA: TStringField
      DisplayLabel = 'Entidade de Previdência'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
    object qryEntidadeCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
      Visible = False
    end
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_PESSOA, NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_PATROCINADORA b'
      'where a.CD_PESSOA = b.CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 301
    Top = 187
    object qryPatrocinadoraNO_PESSOA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
    object qryPatrocinadoraCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PLANO, NO_PLANO'
      'from FI_PLANO_PATRONAL')
    ValidateWithMask = True
    Left = 329
    Top = 187
    object qryPlanoNO_PLANO: TStringField
      DisplayLabel = 'Plano de Benefício'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
    object qryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object dsBasePlano: TwwDataSource
    AutoEdit = False
    DataSet = qryBasePlano
    Left = 301
    Top = 215
  end
  object qryBasePlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select a.* '
      'from FI_BASE_PLANO_PATRONAL a, FI_VERSAO_BASE b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '    and a.CD_VERSAO = b.CD_VERSAO')
    ValidateWithMask = True
    Left = 273
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryBasePlanods_entidade: TStringField
      DisplayLabel = 'Entidade'
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'ds_entidade'
      LookupDataSet = qryEntidade
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NO_PESSOA'
      KeyFields = 'CD_PESSOA_ENTID'
      Size = 60
      Lookup = True
    end
    object qryBasePlanods_patrocinadora: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 21
      FieldKind = fkLookup
      FieldName = 'ds_patrocinadora'
      LookupDataSet = qryPatrocinadora
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NO_PESSOA'
      KeyFields = 'CD_PESSOA_PATROC'
      Size = 60
      Lookup = True
    end
    object qryBasePlanods_plano: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ds_plano'
      LookupDataSet = qryPlano
      LookupKeyFields = 'CD_PLANO'
      LookupResultField = 'NO_PLANO'
      KeyFields = 'CD_PLANO'
      Size = 60
      Lookup = True
    end
    object qryBasePlanoCD_VERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_VERSAO'
      Visible = False
    end
    object qryBasePlanoCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryBasePlanoCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryBasePlanoCD_PLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryVersoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select b.* '
      'from FI_BASE_PLANO_PATRONAL a, FI_VERSAO_BASE b'
      'where a.CD_VERSAO = b.CD_VERSAO '
      '  and CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 153
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptInput
      end>
    object QryVersoesDS_VERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 31
      FieldName = 'DS_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DS_VERSAO'
      FixedChar = True
      Size = 60
    end
    object QryVersoesDT_REFER_BASE: TDateTimeField
      DisplayLabel = 'Referência'
      DisplayWidth = 10
      FieldName = 'DT_REFER_BASE'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DT_REFER_BASE'
    end
    object QryVersoesIR_BASE_HISTORICA: TStringField
      DisplayWidth = 1
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.IR_BASE_HISTORICA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryVersoesCD_VERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.CD_VERSAO'
      Visible = False
    end
    object QryVersoesDT_GERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DT_GERACAO'
      Visible = False
    end
    object QryVersoesLOGIN: TStringField
      DisplayWidth = 20
      FieldName = 'LOGIN'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.LOGIN'
      Visible = False
      FixedChar = True
    end
  end
  object dsVersoes: TwwDataSource
    AutoEdit = False
    DataSet = QryVersoes
    Left = 181
    Top = 215
  end
  object QryLkpEntidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_PESSOA, NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_ENTIDADE_PREVIDENCIA b'
      'where a.CD_PESSOA = b.CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 283
    Top = 54
    object StringField1: TStringField
      DisplayLabel = 'Entidade de Previdência'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
      Visible = False
    end
  end
  object QryLkpPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_PESSOA, NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_PATROCINADORA b'
      'where a.CD_PESSOA = b.CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 283
    Top = 94
    object StringField2: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
      Visible = False
    end
  end
  object QryLkpPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PLANO, NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PESSOA_PATROC = :CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 283
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptInput
      end>
    object StringField3: TStringField
      DisplayLabel = 'Plano de Benefício'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
    object FloatField3: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryLkpVersao: TwwQuery
    AfterScroll = QryLkpVersaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_VERSAO, DS_VERSAO'
      'from FI_VERSAO_BASE'
      'order by DS_VERSAO')
    ValidateWithMask = True
    Left = 158
    Top = 56
    object QryLkpVersaoDS_VERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 50
      FieldName = 'DS_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DS_VERSAO'
      FixedChar = True
      Size = 60
    end
    object QryLkpVersaoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.CD_VERSAO'
      Visible = False
    end
  end
  object dsLkpVersao: TwwDataSource
    AutoEdit = False
    DataSet = QryLkpVersao
    Left = 186
    Top = 56
  end
end
