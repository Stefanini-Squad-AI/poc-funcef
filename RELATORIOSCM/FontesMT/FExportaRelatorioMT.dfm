inherited FrmExportaRelatorioMT: TFrmExportaRelatorioMT
  Left = 425
  Top = 214
  Caption = 'Exportar Relatório'
  ClientHeight = 380
  ClientWidth = 631
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 631
    Height = 294
    object Panel1: TPanel
      Left = 16
      Top = 4
      Width = 59
      Height = 25
      TabOrder = 0
      object sbtnInserirRel: TToolbarButton97
        Left = 3
        Top = 1
        Width = 25
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        ImageIndex = 0
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnInserirRelClick
      end
      object sbtnExcluirRel: TToolbarButton97
        Left = 31
        Top = 2
        Width = 25
        Height = 21
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        ImageIndex = 2
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnExcluirRelClick
      end
    end
    object gridListExpor: TStringGrid
      Left = 5
      Top = 35
      Width = 620
      Height = 252
      ColCount = 3
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
      TabOrder = 1
      ColWidths = (
        81
        242
        290)
    end
  end
  inherited Dock972: TDock97
    Width = 631
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 631
    inherited tb97Fundo: TToolbar97
      Left = 459
      DockPos = 464
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Confirmar'
        ModalResult = 0
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 165
        TabOrder = 2
      end
      object btnExportar: TBitBtn
        Left = 81
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Exportar'
        Default = True
        Enabled = False
        TabOrder = 1
        OnClick = bbtnConfirmarClick
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
    Top = 7
    TargetsData = (
      1
      4
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'Cells'
        0))
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Operacao = opVazio
    OnFind = CmeCadastroFind
    Left = 408
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 524
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REPORTS.NAME'
      'DATAVIEW.NAME'
      'GRUPORELATORIO.DESCRICAO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Relatório'
      'Nome da Consulta'
      'Grupo do Relatório'
      'Módulo Relacionado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MODULO'
      'GRUPORELATORIO'
      'REPORTS'
      'DATAVIEW')
    CamposChave.Strings = (
      'REPORTS.IDREPORTS'
      'REPORTS.NAME'
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.NAME'
      'DATAVIEW.ORIGEMCMDV')
    Filtro.Strings = (
      'REPORTS.IDMODULO = MODULO.IDMODULO'
      'REPORTS.IDDATAVIEW = DATAVIEW.IDDATAVIEW'
      'REPORTS.ORIGEMCMDV = DATAVIEW.ORIGEMCMDV'
      'REPORTS.IDGRUPORELATORIO = GRUPORELATORIO.IDGRUPORELATORIO'
      'REPORTS.ORIGEMCMGR = GRUPORELATORIO.ORIGEMCMGR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '40'
      '40'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 472
    Top = 8
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
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
    Left = 48
    Top = 151
  end
  object Dlg: TSaveDialog
    Filter = 'Arquivo ZIP|*.zip'
    Left = 248
    Top = 15
  end
end
