inherited FrmParamRubricaMT: TFrmParamRubricaMT
  Left = 375
  Top = 334
  HelpContext = 180061
  Caption = 'Cadastro de Rubricas De \ Para'
  ClientHeight = 405
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 319
    object plCadastro: TPanel
      Left = 4
      Top = 4
      Width = 760
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 6
        Top = 94
        Width = 746
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Regra '
        TabOrder = 3
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 5
          Top = 15
          Width = 733
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
          DataField = 'IDREGRA'
          DataSource = ds
          LookupTable = cdsRegra
          LookupField = 'IDREGRA'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 4
        Width = 746
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' De '
        TabOrder = 0
        object cmbCMPosBenef: TwwDBLookupCombo
          Left = 4
          Top = 16
          Width = 735
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'#9'F'
            'CODIGOEXT'#9'15'#9'Código Externo'#9'F'
            'CODIGOINT'#9'15'#9'Código Interno'#9'F')
          DataField = 'IDRUBRICADE'
          DataSource = ds
          LookupTable = cdsDe
          LookupField = 'CODIGOINT'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = cmbCMPosBenefChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 49
        Width = 746
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Para '
        TabOrder = 1
        object cmbCMNegContrib: TwwDBLookupCombo
          Left = 5
          Top = 15
          Width = 733
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'#9'F'
            'CODIGOEXT'#9'15'#9'Código Externo'#9'F'
            'CODIGOINT'#9'15'#9'Código Interno'#9'F')
          DataField = 'IDRUBRICAPARA'
          DataSource = ds
          LookupTable = cdsPara
          LookupField = 'CODIGOINT'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object dbgrdConsulta: TDBGrid
        Left = 5
        Top = 5
        Width = 748
        Height = 299
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsConsulta
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'DE'
            Title.Caption = 'De'
            Width = 363
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARA'
            Title.Caption = 'Para'
            Width = 363
            Visible = True
          end>
      end
    end
  end
  inherited Dock972: TDock97
    Width = 767
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 366
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 240
    Top = 169
    TargetsData = (
      1
      1
      (
        'TwwDBRichEditMSWord'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 135
  end
  inherited ImlPadrao: TImageList
    Left = 240
    Top = 135
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 312
    Top = 135
  end
  inherited Cds: TCMClientDataSet
    Left = 276
    Top = 169
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PARAMRUBRICA.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PARAMRUBRICA')
    CamposChave.Strings = (
      'PARAMRUBRICA.IDAGRUPAMENTO'
      'PARAMRUBRICA.IDPARAMRUBRICA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    OperComparador.Strings = (
      '0')
    Left = 312
    Top = 169
  end
  object cdsConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 201
  end
  object cdsDe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 201
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA FROM REGRA')
    Left = 457
    Top = 176
  end
  object dsConsulta: TwwDataSource
    AutoEdit = False
    DataSet = cdsConsulta
    Left = 311
    Top = 232
  end
  object cdsPara: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
    Top = 201
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 233
  end
end
