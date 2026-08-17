inherited FrmMTCadPremiGestEst: TFrmMTCadPremiGestEst
  Left = 200
  Top = 112
  HelpContext = 50052
  Caption = 'Cadastro de Premissas de Gestão de Estoque'
  ClientHeight = 376
  ClientWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 463
    Height = 290
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label4: TLabel
      Left = 24
      Top = 176
      Width = 156
      Height = 13
      Caption = 'Intervalo de Ressuprimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 128
      Width = 182
      Height = 13
      Caption = 'Tempo de Ressuprimento Médio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 224
      Width = 116
      Height = 13
      Caption = 'Ponto de Reposição'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 280
      Top = 176
      Width = 112
      Height = 13
      Caption = 'Quantidade Máxima'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 280
      Top = 128
      Width = 111
      Height = 13
      Caption = 'Quantidade Mínima'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 280
      Top = 224
      Width = 90
      Height = 13
      Caption = 'Consumo Médio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 152
      Top = 152
      Width = 26
      Height = 13
      Caption = 'Dias'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 152
      Top = 200
      Width = 26
      Height = 13
      Caption = 'Dias'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 408
      Top = 248
      Width = 26
      Height = 13
      Caption = 'Dias'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label13: TLabel
      Left = 152
      Top = 248
      Width = 32
      Height = 13
      Caption = 'Qtde.'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 408
      Top = 152
      Width = 32
      Height = 13
      Caption = 'Qtde.'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 408
      Top = 200
      Width = 32
      Height = 13
      Caption = 'Qtde.'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 24
      Top = 120
      Width = 417
      Height = 17
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 136
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object edAlmox: TEdit
      Left = 24
      Top = 32
      Width = 417
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edTmpRessupMed: TDBRealEdit
      Left = 24
      Top = 144
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      MaxLength = 3
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'TEMRESUSADO'
      DataSource = ds
    end
    object edQtdeMin: TDBRealEdit
      Left = 280
      Top = 144
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'ESTMINUSADO'
      DataSource = ds
    end
    object edPontoRepos: TDBRealEdit
      Left = 24
      Top = 240
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'PTORESUSADO'
      DataSource = ds
    end
    object edConsMed: TDBRealEdit
      Left = 280
      Top = 240
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'CONMEDUSADO'
      DataSource = ds
    end
    object edQtdeMax: TDBRealEdit
      Left = 280
      Top = 192
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'ESTMAXIMO'
      DataSource = ds
    end
    object edIntervalRessup: TDBRealEdit
      Left = 24
      Top = 192
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERIODOCOMPRA'
      DataSource = ds
    end
    object edCodArtigo: TEdit
      Left = 24
      Top = 80
      Width = 97
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object edDescArtigo: TEdit
      Left = 136
      Top = 80
      Width = 305
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
  end
  inherited Dock972: TDock97
    Width = 463
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Images = nil
        NumGlyphs = 3
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 463
    inherited tb97Fundo: TToolbar97
      Left = 293
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50052
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 126
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 714
    Top = 65535
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 752
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 336
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SALDO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'GRUPPROD.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Artigo'
      'Descrição do Artigo'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SALDO'
      'PRODUTO'
      'GRUPPROD')
    CamposChave.Strings = (
      'SALDO.CODARTIGO'
      'PRODUTO.DESCPROD')
    Filtro.Strings = (
      'SUBSTR(SALDO.CODARTIGO,1,6) = PRODUTO.CODPRODUTO'
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '10'
      '30')
    Left = 416
    Top = 7
  end
end
