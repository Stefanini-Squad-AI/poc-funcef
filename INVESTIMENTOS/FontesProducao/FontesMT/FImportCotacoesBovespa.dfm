inherited FrmImportCotacoesBovespa: TFrmImportCotacoesBovespa
  Left = 417
  Top = 204
  HelpContext = 790271
  Caption = 'FrmImportCotacoesBovespa'
  ClientHeight = 281
  ClientWidth = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 195
    object lblCaminhoArquivo: TLabel [0]
      Left = 16
      Top = 65
      Width = 197
      Height = 13
      Caption = 'Indique o Caminho para o Arquivo '
    end
    object lblDtaSaldo: TLabel [1]
      Left = 16
      Top = 125
      Width = 36
      Height = 13
      Caption = 'Data :'
    end
    object lblTabela: TLabel [2]
      Left = 16
      Top = 157
      Width = 104
      Height = 13
      Caption = 'Bolsa de Valores :'
    end
    object lblBolsaValores: TLabel [3]
      Left = 128
      Top = 151
      Width = 52
      Height = 24
      Caption = 'Bolsa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblDataPregao: TLabel [4]
      Left = 128
      Top = 117
      Width = 127
      Height = 24
      Caption = 'DD/MM/YYYY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object SB1: TSpeedButton [5]
      Left = 403
      Top = 79
      Width = 22
      Height = 23
      Hint = 'Buscar Arquivo '
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SB1Click
    end
    inherited pnlTitulo: TPanel
      Width = 440
      inherited lbNomItem: TfcLabel
        Width = 344
        Caption = 'Importaç?o de Cotaç?es Bovespa'
      end
    end
    object dbeCaminhoArquivo: TwwDBEdit
      Left = 16
      Top = 80
      Width = 377
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 442
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 242
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 270
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 194
    Top = 63
    TargetsData = (
      1
      2
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 168
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 384
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 268
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 320
    Top = 7
  end
  inherited CdsAux: TCMClientDataSet
    Left = 388
    Top = 55
  end
  object OpenDialog1: TOpenDialog
    FileName = 'BDIN.TXT'
    Filter = 'Arquivos de Texto|*.TXT'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 326
    Top = 79
  end
  object CdsAcoesXBolsa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 135
  end
  object CdsCotacaoAcao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 236
    Top = 191
  end
  object CdsParaminvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 183
  end
end
