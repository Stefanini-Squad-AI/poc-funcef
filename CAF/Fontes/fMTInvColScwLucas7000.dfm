inherited frmMTInvColScwLucas7000: TfrmMTInvColScwLucas7000
  Left = 142
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coletor de Dados SCW Lucas 7000'
  ClientHeight = 170
  ClientWidth = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 131
    object btnSelMov: TSpeedButton
      Left = 308
      Top = 96
      Width = 22
      Height = 21
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnSelMovClick
    end
    object Label1: TLabel
      Left = 9
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object pnlOperacao: TPanel
      Left = 5
      Top = 5
      Width = 329
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object rdgpOper: TRadioGroup
        Left = 0
        Top = -1
        Width = 329
        Height = 70
        Caption = 'Operação'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Transmissão'
          'Recepção')
        TabOrder = 0
      end
    end
    object edNomeArq: TEdit
      Left = 8
      Top = 96
      Width = 300
      Height = 21
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 131
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
      inherited sep1: TToolbarSep97
        Left = 80
      end
      inherited sep3: TToolbarSep97
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 86
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 160
      Top = 40
      Width = 185
      Height = 105
      Caption = 'GroupBox1'
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 682
    Top = 487
  end
  object opDlgTxt: TOpenDialog
    Title = 'Seleção do Arquivo de Importação'
    Left = 240
    Top = 80
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 16
  end
  object cdsBuscaLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 152
  end
  object sqlBuscaLocal: TCMSqlParams
    SQL.Strings = (
      'SELECT IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'WHERE (LTRIM(RTRIM(CODCENTROCUSTO)) = :CODCENTROCUSTO'
      'AND (IDEMPRESA = :IDEMPRESA)')
    ClientDataSet = cdsBuscaLocal
    Left = 384
    Top = 138
  end
  object cdsBuscaConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 88
  end
  object sqlBuscaConjunto: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCONJUNTO'
      'FROM CONJUNTO'
      'WHERE (IDLOCALIZACAO = :IDLOCALIZACAO)'
      '  AND (IDPESSOA      = :IDPESSOA)')
    ClientDataSet = cdsBuscaConjunto
    Left = 384
    Top = 74
  end
  object cdsBuscaBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 383
    Top = 24
  end
  object sqlBuscaBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDINVENTARIOBENS, IDEMPRESA, IIBPLACA, IIBLOCALATUAL, IIB' +
        'CONJUNTOATUAL,'
      
        '       IIBFLGPLACA, IIBLOCALNOVO, IIBCONJUNTONOVO, IIBFLGSITFISI' +
        'CA'
      'FROM ITENSINVBENS'
      'WHERE (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '  AND (IIBPLACA = :IIBPLACA)')
    ClientDataSet = cdsBuscaBem
    Left = 383
    Top = 10
  end
end
