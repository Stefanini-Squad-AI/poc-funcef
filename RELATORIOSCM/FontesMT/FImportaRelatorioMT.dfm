inherited frmImportarRelatorioMT: TfrmImportarRelatorioMT
  Left = 433
  Top = 259
  Caption = 'frmImportarRelatorioMT'
  ClientHeight = 372
  ClientWidth = 611
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 611
    Height = 286
    object gridList: TStringGrid
      Left = 8
      Top = 31
      Width = 593
      Height = 252
      ColCount = 2
      Ctl3D = True
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        504
        64)
    end
    object edtArq: TEdit
      Left = 10
      Top = 8
      Width = 383
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object btnImport: TBitBtn
      Left = 404
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 2
      OnClick = btnImportClick
    end
  end
  inherited Dock972: TDock97
    Width = 611
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = 'Inserir'
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = 'Alterar'
      end
      inherited sbtnProcurar: TToolbarButton97
        Caption = 'Procurar'
      end
      inherited sbtnApagar: TToolbarButton97
        Caption = 'Excluir'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 333
    Width = 611
    inherited tb97Fundo: TToolbar97
      Left = 419
      DockPos = 419
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 249
      DockPos = 249
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Confirmar'
      end
      inherited bbtnCancelar: TBitBtn
        Caption = 'Cancelar'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
    TargetsData = (
      1
      2
      (
        ''
        'Cells'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 371
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 460
    Top = 6
  end
  inherited Cds: TCMClientDataSet
    Left = 412
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 517
    Top = 6
  end
  object dlgArq: TOpenDialog
    DefaultExt = '.zip'
    Filter = 'Arquivos ZIP|*.zip'
    Title = 'Selecione Arquivo para Importação'
    Left = 576
    Top = 7
  end
  object ZipMaster1: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 336
    Top = 15
  end
  object qryDataView: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT NAME, IDDATAVIEW , TEMPLATE, TRGDTINCLUSAO'
      'FROM DATAVIEW'
      'WHERE NAME = :pNome'
      'ORDER BY TRGDTINCLUSAO DESC')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 477
    Top = 246
    ParamData = <
      item
        DataType = ftString
        Name = 'pNome'
        ParamType = ptUnknown
      end>
  end
  object cdsDataView: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDataView'
    Left = 477
    Top = 139
  end
  object dspDataView: TDataSetProvider
    DataSet = qryDataView
    Constraints = True
    Left = 476
    Top = 190
  end
  object qryReports: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT NAME, TEMPLATE'
      'FROM REPORTS'
      'WHERE NAME = :pNome'
      'ORDER BY TRGDTINCLUSAO DESC')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 301
    Top = 254
    ParamData = <
      item
        DataType = ftString
        Name = 'pNome'
        ParamType = ptUnknown
      end>
  end
  object cdsReports: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReports'
    Left = 301
    Top = 147
  end
  object dspReports: TDataSetProvider
    DataSet = qryReports
    Constraints = True
    Left = 300
    Top = 198
  end
end
