inherited frmCadBaixaContraAlteradorMT: TfrmCadBaixaContraAlteradorMT
  Left = 477
  Top = 131
  HelpContext = 640045
  Caption = 'Baixa Contra Alterador'
  ClientHeight = 361
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 275
    inherited dbGrd: TwwDBGrid [0]
      Width = 515
      Height = 273
      Selected.Strings = (
        'CODTIPIMOVEL'#9'14'#9'Tipo de Imóvel'
        'VACRESDECRE'#9'10'#9'Tipo de Alterador'
        'DESCRICAO'#9'40'#9'Nome do Alterador')
    end
    inherited pnlControles: TPanel [1]
      Width = 515
      Height = 273
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Tipo Imóvel'
      end
      object Label2: TLabel
        Left = 16
        Top = 91
        Width = 52
        Height = 13
        Caption = 'Alterador'
      end
      object DBLkTipoImovel: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 300
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODTIPIMOVEL'#9'10'#9'Código'#9'F'
          'DESCTIPOIMOVEL'#9'25'#9'Tipo Imóvel'#9'F')
        DataField = 'CODTIPIMOVEL'
        DataSource = ds
        LookupTable = CdsTipoImovel
        LookupField = 'CODTIPIMOVEL'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbRadioAcre_DescChange
      end
      object DBcboAlterador: TwwDBLookupCombo
        Left = 16
        Top = 107
        Width = 300
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupTable = CdsAlterador
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dbRadioAcre_Desc: TDBRadioGroup
        Left = 16
        Top = 48
        Width = 300
        Height = 36
        Columns = 2
        DataField = 'ACRESDECRES'
        DataSource = ds
        Items.Strings = (
          'Acréscimo'
          'Desconto')
        TabOrder = 1
        Values.Strings = (
          'A'
          'D')
        OnChange = dbRadioAcre_DescChange
      end
    end
  end
  inherited Dock972: TDock97
    Width = 517
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 322
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 345
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    BeforeScroll = CdsBeforeScroll
    object CdsCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo de Imóvel'
      DisplayWidth = 14
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsIDBAIXACONTRA: TFloatField
      FieldName = 'IDBAIXACONTRA'
      Visible = False
    end
    object CdsACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object CdsIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object CdsVACRESDECRE: TStringField
      FieldName = 'VACRESDECRE'
      Size = 15
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM BAIXACONTRAALTERADOR')
    ClientDataSet = Cds
    Left = 445
    Top = 13
  end
  object CdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 136
    Top = 55
    object CdsTipoImovelCODTIPIMOVEL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsTipoImovelDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 25
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object CdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 125
    Top = 132
    object CdsAlteradorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
  end
  object dsAlterador: TwwDataSource
    DataSet = CdsAlterador
    Left = 192
    Top = 135
  end
  object cdsVerificaBaixaContraAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 117
    Top = 220
    object cdsVerificaBaixaContraAltIDBAIXACONTRA: TFloatField
      FieldName = 'IDBAIXACONTRA'
    end
    object cdsVerificaBaixaContraAltACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object cdsVerificaBaixaContraAltCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsVerificaBaixaContraAltCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object cdsVerificaBaixaContraAltIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
  end
end
