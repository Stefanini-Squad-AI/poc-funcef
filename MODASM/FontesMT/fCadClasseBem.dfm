inherited frmCadClasseBem: TfrmCadClasseBem
  Left = 145
  Top = 180
  HelpContext = 750103
  Caption = 'Cadastro das Classes de Bens Patrimoniais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 15
      Top = 63
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object spbtnExcuiEP: TSpeedButton
      Left = 360
      Top = 168
      Width = 33
      Height = 25
      Hint = 'Tira esta classe da categoria EP'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spbtnExcuiEPClick
    end
    object dbedCodigo: TDBEdit
      Left = 15
      Top = 25
      Width = 114
      Height = 21
      DataField = 'CODHIERARQ'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 15
      Top = 77
      Width = 473
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgAnaSint: TDBRadioGroup
      Left = 15
      Top = 119
      Width = 220
      Height = 45
      Caption = 'Tipo'
      Columns = 2
      DataField = 'ANASINT'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Analítico'
        'Sintético')
      ParentFont = False
      TabOrder = 2
      Values.Strings = (
        'A'
        'S')
    end
    object dbrgEP: TDBRadioGroup
      Left = 268
      Top = 119
      Width = 220
      Height = 45
      Caption = 'Equipamento de Proteção'
      Columns = 2
      DataField = 'INDEQUIPROT'
      DataSource = dsDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Individual'
        'Coletivo')
      ParentFont = False
      TabOrder = 3
      Values.Strings = (
        'I'
        'C')
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 750103
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 538
    Top = 119
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 536
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 376
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Classe de Bens'
    Colunas.Strings = (
      'C.CODHIERARQ'
      'C.DESCRICAO'
      'C.ANASINT'
      
        'DECODE(P.INDEQUIPROT,'#39'C'#39', '#39'Coletivo'#39', '#39'I'#39', '#39'Individual'#39', '#39#39') AS ' +
        'EP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Anal/Sint'
      'Equip. Proteção')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM C'
      'PPRACLASSEBEM P')
    CamposChave.Strings = (
      'C.IDCLASSEBEM')
    Filtro.Strings = (
      'C.IDCLASSEBEM = P.IDCLASSEBEM(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '8'
      '12')
    Left = 448
    Top = 7
  end
  object dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 270
    Top = 63
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 340
    Top = 63
  end
end
