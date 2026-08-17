inherited frmCadIndicadorMT: TfrmCadIndicadorMT
  Left = 199
  Top = 289
  HelpContext = 640053
  Caption = 'Cadastro de Tipos de Indicador'
  ClientHeight = 340
  ClientWidth = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 254
    inherited dbGrd: TwwDBGrid [0]
      Width = 393
      Height = 252
    end
    inherited pnlControles: TPanel [1]
      Width = 393
      Height = 252
      object Label1: TLabel
        Left = 16
        Top = 14
        Width = 101
        Height = 13
        Caption = 'Tipo do Indicador'
      end
      object Label2: TLabel
        Left = 16
        Top = 168
        Width = 128
        Height = 13
        Caption = 'Informação registrada:'
      end
      object DBrdgTipo: TDBRadioGroup
        Left = 16
        Top = 64
        Width = 170
        Height = 89
        DataField = 'FLGTIPOVALOR'
        DataSource = ds
        Items.Strings = (
          'Monetário'
          'Percentual'
          'Quantitativo')
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          'M'
          'P'
          'Q')
      end
      object DBRdgRECPAG: TDBRadioGroup
        Left = 199
        Top = 64
        Width = 170
        Height = 89
        DataField = 'RECPAG'
        DataSource = ds
        Items.Strings = (
          'Receita'
          'Despesa'
          'Desempenho')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'R'
          'D'
          'E')
      end
      object DBCheckBox1: TDBCheckBox
        Left = 18
        Top = 218
        Width = 205
        Height = 17
        Caption = 'Utilizar em Unidades Autônomas.'
        DataField = 'FLGUNIDAUT'
        DataSource = ds
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbedDescricao: TwwDBEdit
        Left = 16
        Top = 28
        Width = 353
        Height = 21
        DataField = 'INMDESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 16
        Top = 182
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCODINTERNO'#9'50'#9'Descrição'#9'F')
        DataField = 'CODINTERNO'
        DataSource = ds
        LookupTable = cdsInfo
        LookupField = 'CODINTERNO'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 395
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 223
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 54
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 50
    Top = 65511
  end
  inherited ImlPadrao: TImageList
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 312
  end
  inherited Cds: TCMClientDataSet
    object CdsINMDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object CdsIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
    object CdsFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      Size = 1
    end
    object CdsRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsFLGUNIDAUT: TFloatField
      FieldName = 'FLGUNIDAUT'
      Visible = False
    end
    object CdsCODINTERNO: TFloatField
      FieldName = 'CODINTERNO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 368
  end
  object cdsInfo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODINTERNO'
        DataType = ftInteger
      end
      item
        Name = 'DESCCODINTERNO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 169
    Top = 200
    object cdsInfoDESCCODINTERNO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCODINTERNO'
      Size = 50
    end
    object cdsInfoCODINTERNO: TIntegerField
      DisplayLabel = 'Código'
      DisplayWidth = 5
      FieldName = 'CODINTERNO'
      Visible = False
    end
  end
end
