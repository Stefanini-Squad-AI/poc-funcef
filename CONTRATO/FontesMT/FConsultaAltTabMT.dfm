inherited frmConsultaAltTabMT: TfrmConsultaAltTabMT
  Left = 193
  Top = 114
  Caption = 
    'Consulta às Alterações das Tabelas do Sistema de Contratos e Pro' +
    'jetos'
  ClientHeight = 387
  ClientWidth = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 568
    Height = 348
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 566
      Height = 44
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object dblcContrato: TwwDBLookupCombo
        Left = 69
        Top = 12
        Width = 476
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'20'#9'Contrato'#9'F')
        LookupTable = cdsContratos
        LookupField = 'IDCONTRATO'
        DropDownWidth = 700
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcContratoChange
      end
    end
    object dbgContaDe: TwwDBGrid
      Left = 1
      Top = 45
      Width = 566
      Height = 302
      ControlType.Strings = (
        'STATUSCONCILIA;CheckBox;J;I')
      Selected.Strings = (
        'ARQUIVO'#9'22'#9'Tabela'#9'F'
        'OPERACAO'#9'8'#9'Operação'#9'F'
        'NOMECAMPO'#9'22'#9'Campo'#9'F'
        'VALORATUAL'#9'17'#9'Valor Atual'#9'F'
        'VALORANTERIOR'#9'17'#9'Valor Anterior'#9'F'
        'USUARIO'#9'25'#9'Usuário'#9'F'
        'DATAHORA'#9'18'#9'Data'#9'F'
        'CHAVEPRIMARIA'#9'120'#9'Chave Primária'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 1
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
  inherited Dock971: TDock97
    Top = 348
    Width = 568
    inherited tb97Fundo: TToolbar97
      Left = 400
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 339
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 452
    Top = 159
  end
  object ds: TDataSource
    DataSet = cds
    Left = 488
    Top = 160
  end
  object sp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   LOGTABELAS'
      'WHERE'
      '   (1=2)'
      '/*+OPTIMIZER_MODE RULE*/ '
      ' '
      ' '
      ' ')
    ClientDataSet = cds
    Left = 528
    Top = 160
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 444
    Top = 7
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM CONTRATOCONTR ')
    ClientDataSet = cdsContratos
    Left = 80
    Top = 336
  end
end
