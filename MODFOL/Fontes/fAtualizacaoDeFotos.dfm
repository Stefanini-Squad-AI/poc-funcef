inherited frmAtualizacaoDeFotos: TfrmAtualizacaoDeFotos
  Left = 272
  Top = 220
  Caption = 'Atualização de Fotos'
  ClientHeight = 246
  ClientWidth = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 555
    Height = 207
    object LblArquivos: TLabel
      Left = 155
      Top = 9
      Width = 78
      Height = 13
      Caption = 'Qtd.Arquivos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdeArquivos: TLabel
      Left = 239
      Top = 9
      Width = 29
      Height = 13
      Caption = '.......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblidFuncionario: TLabel
      Left = 303
      Top = 183
      Width = 106
      Height = 13
      Caption = 'ID do Funcionário:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblQtdfunciorios: TLabel
      Left = 419
      Top = 183
      Width = 29
      Height = 13
      Caption = '.......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgDoc: TImage
      Left = 304
      Top = 24
      Width = 241
      Height = 153
    end
    object DrbDrive: TDriveComboBox
      Left = 5
      Top = 8
      Width = 147
      Height = 19
      DirList = DlbPastas
      TabOrder = 0
      OnChange = DrbDriveChange
    end
    object DlbPastas: TDirectoryListBox
      Left = 5
      Top = 26
      Width = 145
      Height = 151
      FileList = FlbArquivos
      ItemHeight = 16
      TabOrder = 1
      OnChange = DlbPastasChange
    end
    object FlbArquivos: TFileListBox
      Left = 318
      Top = 40
      Width = 107
      Height = 113
      ItemHeight = 13
      Mask = '*.jpg;*.bmp'
      MultiSelect = True
      TabOrder = 2
      Visible = False
    end
    object grdFiles: TwwDBGrid
      Left = 150
      Top = 26
      Width = 150
      Height = 151
      Selected.Strings = (
        'Arquivo'#9'18'#9'Arquivo'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      DataSource = dsFiles
      KeyOptions = []
      Options = [dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = grdFilesCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 207
    Width = 555
    BackgroundOnToolbars = False
    inherited tb97Fundo: TToolbar97
      Left = 358
      ActivateParent = False
      DockPos = 358
      inherited sep1: TToolbarSep97
        Left = 87
      end
      inherited bbtnSair: TBitBtn
        Width = 87
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 89
      end
    end
    object bbtnExecutar: TBitBtn
      Left = 257
      Top = 2
      Width = 94
      Height = 33
      Caption = '  &OK'
      Default = True
      TabOrder = 1
      OnClick = bbtnExecutarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 23
    Top = 191
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object QryPessoa: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select f.matricula, p.idpessoa, p.idimagem'
      '  from funcionario f, pessoa p'
      ' where f.idpessoa = p.idpessoa'
      '   and f.matricula = :matricula')
    Left = 200
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'matricula'
        ParamType = ptInput
      end>
  end
  object qryImagens: TQuery
    DatabaseName = 'BaseDados'
    Left = 240
    Top = 72
  end
  object cdsFiles: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Arquivo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Erro'
        DataType = ftBoolean
      end
      item
        Name = 'Local'
        DataType = ftString
        Size = 254
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsFilesAfterScroll
    Left = 336
    Top = 16
    Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D0007417271
      7569766F0100490000000100055749445448020002003200044572726F020003
      0000000000054C6F63616C020049000000010005574944544802000200FE0000
      00}
    object cdsFilesArquivo: TStringField
      DisplayWidth = 18
      FieldName = 'Arquivo'
      Size = 50
    end
    object cdsFilesErro: TBooleanField
      FieldName = 'Erro'
      Visible = False
    end
    object cdsFilesLocal: TStringField
      FieldName = 'Local'
      Visible = False
      Size = 254
    end
  end
  object dsFiles: TDataSource
    DataSet = cdsFiles
    Left = 368
    Top = 16
  end
end
