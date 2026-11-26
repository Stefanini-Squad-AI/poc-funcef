inherited frmCadReajINSS: TfrmCadReajINSS
  Left = 74
  Top = 70
  HelpContext = 160163
  Caption = 'Cadastro de Regras de Reajuste dos Benefícios do INSS'
  ClientHeight = 413
  ClientWidth = 598
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 327
    object dbgrdReajINSS: TwwDBGrid
      Left = 1
      Top = 85
      Width = 596
      Height = 241
      Selected.Strings = (
        'MESREAJ'#9'20'#9'Mês do ~Reajuste'
        'IDRGREAJ'#9'10'#9'Código'
        'NOMEREGRA'#9'60'#9'Regra de Reajuste')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsGrid
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 596
      Height = 84
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object grpAnoMes: TGroupBox
        Left = 8
        Top = 8
        Width = 225
        Height = 65
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 95
          Height = 13
          Caption = 'Ano do Reajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 121
          Top = 16
          Width = 96
          Height = 13
          Caption = 'Mês do Reajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 104
          Top = 32
          Width = 5
          Height = 13
          Caption = '/'
        end
        object edAno: TEdit
          Left = 8
          Top = 32
          Width = 89
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
          Text = 'edAno'
        end
        object edMes: TEdit
          Left = 121
          Top = 32
          Width = 40
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          Text = 'edMes'
        end
      end
      object grpRegra: TGroupBox
        Left = 240
        Top = 8
        Width = 345
        Height = 65
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 224
          Height = 13
          Caption = 'Regra de Reajuste utilizada no período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkpcmbRegra: TwwDBLookupCombo
          Left = 8
          Top = 32
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra de Reajuste'
            'IDREGRA'#9'10'#9'Código')
          DataField = 'IDRGREAJ'
          DataSource = ds
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 598
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 598
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 341
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update REAJINSS'
      'set'
      '  MESREAJ = :MESREAJ,'
      '  IDRGREAJ = :IDRGREAJ'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDRGREAJ = :OLD_IDRGREAJ')
    InsertSQL.Strings = (
      'insert into REAJINSS'
      '  (MESREAJ, IDRGREAJ)'
      'values'
      '  (:MESREAJ, :IDRGREAJ)')
    DeleteSQL.Strings = (
      'delete from REAJINSS'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDRGREAJ = :OLD_IDRGREAJ')
    Left = 257
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MESREAJ'
      'IDRGREAJ')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Ano e Mês de Reajuste'
      'Código da Regra de Reajuste')
    Tabelas.Strings = (
      'REAJINSS')
    CamposChave.Strings = (
      'MESREAJ')
    Larguras.Strings = (
      '20'
      '15')
    Left = 389
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT MESREAJ, IDRGREAJ'
      'FROM     REAJINSS '
      'WHERE  MESREAJ = :MESREAJ'
      'ORDER  BY MESREAJ DESC')
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREAJ'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 440
    Top = 7
  end
  object qryGrid: TwwQuery
    AfterScroll = qryGridAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.MESREAJ, R.IDRGREAJ, RG.NOMEREGRA'
      'FROM   REAJINSS R, REGRA RG'
      'WHERE  R.IDRGREAJ = RG.IDREGRA'
      'ORDER  BY R.MESREAJ DESC')
    ValidateWithMask = True
    Left = 559
    Top = 27
  end
  object dsGrid: TwwDataSource
    DataSet = qryGrid
    Left = 517
    Top = 20
  end
end
