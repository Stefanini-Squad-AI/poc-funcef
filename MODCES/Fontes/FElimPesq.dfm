inherited frmElimPesq: TfrmElimPesq
  Left = 185
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Eliminação de Pesquisa Salarial'
  ClientHeight = 148
  ClientWidth = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 109
    BorderWidth = 2
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 388
      DockPos = 388
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 220
      DockPos = 220
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  object gbxPesq: TGroupBox [2]
    Left = 24
    Top = 15
    Width = 513
    Height = 75
    Caption = 'Pesquisa a Ser Eliminada'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object dblcPesq: TwwDBLookupCombo
      Left = 14
      Top = 30
      Width = 486
      Height = 21
      Hint = 'Informe Pesquisa Desejada'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPESQSALAR'#9'40'#9'Nome da Pesquisa'
        'IDPESQSALAR'#9'10'#9'Número'
        'DATAREFPESQ'#9'12'#9'Data Referência')
      LookupTable = tblPesqui
      LookupField = 'IDPESQSALAR'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = False
      OnChange = dblcPesqChange
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = tblPesqui
    Left = 433
    Top = 69
  end
  object tblTendencia: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESQSALAR'
    MasterFields = 'IDPESQSALAR'
    MasterSource = ds
    TableName = 'CM.TENDPESQSAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 310
    Top = 73
    object tblTendenciaIDPESQSALAR: TFloatField
      FieldName = 'IDPESQSALAR'
      Required = True
    end
    object tblTendenciaIDCARGO: TFloatField
      FieldName = 'IDCARGO'
      Required = True
    end
    object tblTendenciaIDEMPRESAPARTIC: TFloatField
      FieldName = 'IDEMPRESAPARTIC'
      Required = True
    end
    object tblTendenciaFREQ: TFloatField
      FieldName = 'FREQ'
    end
    object tblTendenciaMENOR: TFloatField
      FieldName = 'MENOR'
      DisplayFormat = '0.00'
    end
    object tblTendenciaPRIMQUA: TFloatField
      FieldName = 'PRIMQUA'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMEDIA: TFloatField
      FieldName = 'MEDIA'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMODA: TFloatField
      FieldName = 'MODA'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMEDIANA: TFloatField
      FieldName = 'MEDIANA'
      DisplayFormat = '0.00'
    end
    object tblTendenciaTERCQUA: TFloatField
      FieldName = 'TERCQUA'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMAIOR: TFloatField
      FieldName = 'MAIOR'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMENOR_R: TFloatField
      FieldName = 'MENOR_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaPRIMQUA_R: TFloatField
      FieldName = 'PRIMQUA_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMEDIA_R: TFloatField
      FieldName = 'MEDIA_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMODA_R: TFloatField
      FieldName = 'MODA_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMEDIANA_R: TFloatField
      FieldName = 'MEDIANA_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaTERCQUA_R: TFloatField
      FieldName = 'TERCQUA_R'
      DisplayFormat = '0.00'
    end
    object tblTendenciaMAIOR_R: TFloatField
      FieldName = 'MAIOR_R'
      DisplayFormat = '0.00'
    end
  end
  object tblPesqui: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESQSALAR'
    TableName = 'CM.PESQISAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 484
    Top = 73
  end
  object tblDadoPesq: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESQSALAR'
    MasterFields = 'IDPESQSALAR'
    MasterSource = ds
    TableName = 'CM.DADOPESQSAL'
    wwFilter.Strings = (
      'COD_GRUPO = '#39'A'#39)
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 374
    Top = 70
    object tblDadoPesqFREQ: TFloatField
      DisplayLabel = 'Frequência'
      DisplayWidth = 10
      FieldName = 'FREQ'
    end
    object tblDadoPesqNOMINAL: TFloatField
      DisplayLabel = 'Salário Nominal'
      DisplayWidth = 15
      FieldName = 'NOMINAL'
    end
    object tblDadoPesqREAL: TFloatField
      DisplayLabel = 'Salário Real'
      DisplayWidth = 14
      FieldName = 'REAL'
    end
    object tblDadoPesqIDPESQSALAR: TFloatField
      FieldName = 'IDPESQSALAR'
      Required = True
      Visible = False
    end
    object tblDadoPesqIDCARGO: TFloatField
      FieldName = 'IDCARGO'
      Required = True
      Visible = False
    end
    object tblDadoPesqIDEMPRPART: TFloatField
      FieldName = 'IDEMPRPART'
      Required = True
      Visible = False
    end
    object tblDadoPesqNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
end
