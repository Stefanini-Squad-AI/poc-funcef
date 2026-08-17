inherited FrmMTAlteraCustoMed: TFrmMTAlteraCustoMed
  Left = 115
  Top = 123
  HelpContext = 50032
  Caption = 'Alteração de Custo Médio'
  ClientHeight = 312
  ClientWidth = 489
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 489
    Height = 273
    object Label1: TLabel
      Left = 16
      Top = 136
      Width = 112
      Height = 13
      Caption = 'Unidade de Custeio'
    end
    object lbALmox: TLabel
      Left = 16
      Top = 176
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label8: TLabel
      Left = 352
      Top = 136
      Width = 100
      Height = 13
      Caption = 'Nº da Requisição'
    end
    object Label9: TLabel
      Left = 352
      Top = 176
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label10: TLabel
      Left = 16
      Top = 216
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object edUnCusteio: TEdit
      Left = 16
      Top = 152
      Width = 321
      Height = 21
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'edUnCusteio'
    end
    object edAlmox: TEdit
      Left = 16
      Top = 192
      Width = 321
      Height = 21
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'edAlmox'
    end
    object edNumReq: TRealEdit
      Left = 352
      Top = 152
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object dblcAtiv: TwwDBLookupCombo
      Left = 16
      Top = 232
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'
        'UNIDNEGOC'#9'10'#9'Código')
      LookupTable = cdsUnidNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object GrpArt: TGroupBox
      Left = 16
      Top = 8
      Width = 459
      Height = 120
      Caption = ' Artigo '
      TabOrder = 4
      TabStop = True
      object Label2: TLabel
        Left = 12
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 117
        Top = 20
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 12
        Top = 69
        Width = 31
        Height = 13
        Caption = 'Unid.'
      end
      object Label5: TLabel
        Left = 67
        Top = 69
        Width = 71
        Height = 13
        Caption = 'Custo Médio'
      end
      object Label6: TLabel
        Left = 197
        Top = 69
        Width = 103
        Height = 13
        Caption = 'Saldo Un. Custeio'
      end
      object Label7: TLabel
        Left = 325
        Top = 69
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object EdArtigo: TDBEdit
        Left = 12
        Top = 35
        Width = 100
        Height = 21
        Color = clGray
        DataField = 'CODARTIGO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edDesc: TDBEdit
        Left = 117
        Top = 35
        Width = 304
        Height = 21
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edUnid: TDBEdit
        Left = 12
        Top = 84
        Width = 46
        Height = 21
        Color = clGray
        DataField = 'CODMEDCUSTO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edCustoMed: TDBRealEdit
        Left = 67
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clWhite
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        OnExit = edCustoMedExit
        IntDigits = 10
        DecDigits = 7
        NumberFormat = fNumber
        Signal = False
        DataField = 'CUSTOMEDIO'
      end
      object edSaldoUC: TDBRealEdit
        Left = 197
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOQTDEUC'
        DataSource = ds
      end
      object edValor: TDBRealEdit
        Left = 325
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 14286847
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOR'
        DataSource = ds
      end
      object btnProcurar: TBitBtn
        Left = 421
        Top = 34
        Width = 26
        Height = 22
        Hint = 'Procurar Produto'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
          333337333333373F333307F8F8F8F70333337F333333337F333307F8F8F8F703
          33337F333333337F333307F8F8F8F703333373F3333333733333778F8F8F8773
          333337F3333337F333333078F8F870333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
      end
    end
    object edData: TEdit
      Left = 352
      Top = 192
      Width = 121
      Height = 21
      TabStop = False
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 273
    Width = 489
    inherited tb97Fundo: TToolbar97
      Left = 241
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        HelpContext = 50032
      end
      object BtnAltCM: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Alterar'
        TabOrder = 2
        OnClick = BtnAltCMClick
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
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Artigo'
      'Descrição do Artigo'
      'Grupo de Produtos')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ARTIGO'
      'PRODUTO'
      'GRUPPROD'
      'CUSTOMED')
    CamposChave.Strings = (
      'ARTIGO.CODARTIGO')
    Filtro.Strings = (
      'ARTIGO.FLGATIVO = '#39'S'#39
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'ARTIGO.CODARTIGO = CUSTOMED.CODARTIGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 379
    Top = 14
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 264
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 264
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 51
    Top = 267
  end
end
