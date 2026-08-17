inherited frmMTMovBensPendentes: TfrmMTMovBensPendentes
  Left = 35
  Top = 85
  Caption = 'Entradas Pendentes do Almoxarifado'
  ClientHeight = 397
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 358
    object pnlSelNota: TPanel
      Left = 5
      Top = 5
      Width = 713
      Height = 122
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 194
        Height = 13
        Caption = 'Documentos com Bens Pendentes'
      end
      object dbgNotas: TwwDBGrid
        Left = 8
        Top = 24
        Width = 699
        Height = 74
        Selected.Strings = (
          'IDNOTA'#9'12'#9'Documento Nº'
          'NOME'#9'56'#9'Fornecedor'
          'DTANOTA'#9'10'#9'Data'
          'SOMANOTA'#9'16'#9'Valor Nota')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsNotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object bbtnProcessaNotas: TBitBtn
        Left = 547
        Top = 97
        Width = 164
        Height = 25
        Caption = 'Processa &Documento'
        ModalResult = 8
        TabOrder = 1
        OnClick = bbtnProcessaNotasClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
    object pnlSelBem: TPanel
      Left = 5
      Top = 127
      Width = 713
      Height = 226
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 189
        Height = 13
        Caption = 'Bens do Documento Selecionado'
      end
      object bbtnProcessaBem: TBitBtn
        Left = 582
        Top = 200
        Width = 130
        Height = 25
        Caption = 'Processa &Bem'
        TabOrder = 0
        OnClick = bbtnProcessaBemClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888FFFFFFFFFFFF888000000000000008877777777777777880BBBBBBBBBBB
          B08878888888888887F80BBBBBBBBBBBB0887F8FFFFFFFFFF7F80BCCCCCCCCCC
          B0887F7777777777F7880BBBBBBB000000087F8FFFF8777777780BCCCC40FFFF
          FFF87F777777FFF888880BBBB2040000FFF87F8FF877777788880BCCCB0240F0
          FFF87877787877F7F88880BBB00F2400FFF887FFF77F8777F8888800080FF240
          FFF88877787F8877F88888888800FF240FF888888877F8877F88888888880FF2
          40F8888888887F8877F88888888880FF24488888888887FFF778888888888800
          0248888888888877787888888888888888288888888888888878}
        NumGlyphs = 2
      end
      object dbgBensPend: TwwDBGrid
        Left = 8
        Top = 24
        Width = 699
        Height = 177
        Hint = 'Duplo click desfaz a seleção'
        ControlType.Strings = (
          'ALTERADO;CheckBox;1;0')
        Selected.Strings = (
          'PLACA'#9'16'#9'Nº Tombamento'#9#9
          'DESBEM'#9'61'#9'Descrição'#9#9
          'VALORG'#9'14'#9'Valor Aquisição'#9#9
          'ALTERADO'#9'3'#9'Ok'#9#9)
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = dbgBensPendDblClick
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 501
      DockPos = 501
      inherited sep1: TToolbarSep97
        Left = 187
      end
      inherited sep3: TToolbarSep97
        Left = 92
      end
      inherited bbtnSair: TBitBtn
        Width = 92
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 95
        Width = 92
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 310
      DockPos = 310
      inherited ToolbarSep971: TToolbarSep97
        Left = 92
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 92
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 95
        Width = 92
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 578
    Top = 447
  end
  object dsNotas: TwwDataSource
    AutoEdit = False
    DataSet = cdsNotas
    Left = 648
    Top = 56
  end
  object cdsNotas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 648
    Top = 40
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 264
    Top = 239
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 240
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 309
    Top = 240
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 344
    Top = 240
  end
  object cdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 240
  end
  object dsRateio: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateio
    Left = 464
    Top = 240
  end
  object cdsPlaca: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 632
    Top = 164
  end
  object cdsGrupoTaxaDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 633
    Top = 150
  end
end
