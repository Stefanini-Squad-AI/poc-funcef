inherited frmListaVariaveis: TfrmListaVariaveis
  Left = 358
  Top = 244
  Caption = 'Lista Variáveis'
  ClientHeight = 451
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 621
    Height = 365
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 1
      Width = 619
      Height = 363
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Variáveis'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 611
          Height = 335
          Selected.Strings = (
            'NO_VARIAVEL'#9'15'#9'Variável'
            'DS_VARIAVEL'#9'66'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = wwDBGrid1DblClick
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 621
    object Label1: TLabel [0]
      Left = 106
      Top = 5
      Width = 48
      Height = 13
      Caption = 'Buscar: '
      Transparent = True
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 11
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 11
        Width = 10
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 36
        Width = 59
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 21
        Width = 15
        Visible = False
      end
    end
    object edtVar: TEdit
      Left = 106
      Top = 20
      Width = 182
      Height = 21
      TabOrder = 1
      Visible = False
      OnChange = edtVarChange
      OnKeyDown = edtVarKeyDown
    end
    object BtnBusca: TButton
      Left = 295
      Top = 18
      Width = 25
      Height = 25
      Caption = '>'
      TabOrder = 2
      Visible = False
      OnClick = BtnBuscaClick
    end
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 621
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qryVariaveis
    Left = 371
    Top = 88
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 393
    Top = 17
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 443
    Top = 18
  end
  object qryVariaveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_VARIAVEL, DS_VARIAVEL'
      'from FI_VARIAVEL'
      'order by NO_VARIAVEL')
    ValidateWithMask = True
    Left = 338
    Top = 89
    object qryVariaveisNO_VARIAVEL: TStringField
      DisplayLabel = 'Variável'
      DisplayWidth = 15
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_VARIAVEL.NO_VARIAVEL'
    end
    object qryVariaveisDS_VARIAVEL: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 66
      FieldName = 'DS_VARIAVEL'
      Origin = 'FI_VARIAVEL.DS_VARIAVEL'
      Size = 80
    end
  end
end
