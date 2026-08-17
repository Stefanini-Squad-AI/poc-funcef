inherited frmExportaDicDados: TfrmExportaDicDados
  HelpContext = 450007
  Caption = 'frmExportaDicDados'
  ClientHeight = 137
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 98
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 143
      Height = 88
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object rgOpcao: TRadioGroup
        Left = 5
        Top = 6
        Width = 133
        Height = 76
        Caption = 'Opção de Operação'
        ItemIndex = 0
        Items.Strings = (
          '&Exportar'
          '&Importar')
        TabOrder = 0
      end
    end
    object re: TRichEdit
      Left = 148
      Top = 5
      Width = 375
      Height = 88
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 98
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 107
  end
  object QryCmpBd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOB' +
        'ANCO,'
      '      CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO'
      'FROM'
      '    CMPBD')
    ValidateWithMask = True
    Left = 352
    Top = 88
  end
  object bmCmpBd: TBatchMove
    Destination = TbCmpBd
    Mode = batCopy
    Source = QryCmpBd
    Left = 352
    Top = 136
  end
  object TbCmpBd: TwwTable
    DatabaseName = 'c:\temp'
    TableName = 'CMPBD'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 352
    Top = 184
  end
  object QryCmpBdGrp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOARQUIVO, IDCAMPO'
      'FROM'
      '    CMPBDGRP')
    ValidateWithMask = True
    Left = 408
    Top = 88
  end
  object bmCMPBDGRP: TBatchMove
    Destination = TbCmpBdGrp
    Mode = batCopy
    Source = QryCmpBdGrp
    Left = 408
    Top = 136
  end
  object TbCmpBdGrp: TwwTable
    DatabaseName = 'c:\temp'
    TableName = 'CMPBDGRP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 408
    Top = 184
  end
  object QryGrpArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS'
      'FROM'
      '    GRPARQUIVO')
    ValidateWithMask = True
    Left = 456
    Top = 88
  end
  object bmGrpArquivo: TBatchMove
    Destination = TbGrpArquivo
    Mode = batCopy
    Source = QryGrpArquivo
    Left = 456
    Top = 136
  end
  object TbGrpArquivo: TwwTable
    DatabaseName = 'c:\temp'
    TableName = 'GRPARQUIVO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 456
    Top = 184
  end
  object ZipMaster1: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = [ExtrOverWrite]
    SFXOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 144
    Top = 80
  end
  object sd: TSaveDialog
    DefaultExt = '*.edd'
    Filter = 'Arquivo de Exp. Dicionário de Dados|*.edd'
    InitialDir = 'c:\'
    Title = 'Gravação da Exportação de Dicionário de Dados'
    Left = 240
    Top = 40
  end
  object od: TOpenDialog
    DefaultExt = '*.edd'
    Filter = 'Arquivo de Exp. de Dicionário de Dados|*.edd'
    Title = 'Arquivo e Exp. Dicionário de Dados'
    Left = 304
    Top = 40
  end
  object QryAux: TwwQuery
    ValidateWithMask = True
    Left = 176
    Top = 24
  end
end
