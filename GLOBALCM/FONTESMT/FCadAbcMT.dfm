inherited frmCadABC: TfrmCadABC
  Left = 274
  Top = 266
  HelpContext = 20015
  Caption = 'Cadastro de Atividades / Projetos'
  ClientHeight = 345
  ClientWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 313
    Width = 328
    Height = 259
    object lblFormaRecPag: TLabel
      Left = 20
      Top = 60
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label1: TLabel
      Left = 20
      Top = 116
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object Label3: TLabel
      Left = 20
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label4: TLabel
      Left = 187
      Top = 10
      Width = 84
      Height = 13
      Caption = 'Código Interno'
    end
    object edAtividade: TDBEdit
      Left = 20
      Top = 73
      Width = 289
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object dblkUsuario: TwwDBLookupCombo
      Left = 20
      Top = 130
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEUSUARIO'#9'20'#9'Responsável')
      DataField = 'IDUSUARIO'
      DataSource = ds
      LookupTable = CdsUsuario
      LookupField = 'IDUSUARIO'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object pnAnaSint: TPanel
      Left = 19
      Top = 188
      Width = 290
      Height = 52
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 4
      object sbtnAnalitico: TSpeedButton
        Left = 9
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
          0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
          0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
          5555557FFFFF7755555555500000005555555577777775555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbtnAnaliticoClick
      end
      object sbtnSintetico: TSpeedButton
        Left = 150
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbtnSinteticoClick
      end
    end
    object dbedCodigo: TwwDBEdit
      Left = 20
      Top = 24
      Width = 102
      Height = 21
      DataField = 'UNECODIGO'
      DataSource = ds
      MaxLength = 8
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedAtivProj: TwwDBEdit
      Left = 187
      Top = 24
      Width = 121
      Height = 21
      DataField = 'UNIDNEGOC'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbckAtivo: TDBCheckBox
      Left = 20
      Top = 160
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 641
  end
  inherited Dock971: TDock97
    Top = 306
    Width = 641
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object pnlTree: TPanel [3]
    Left = 0
    Top = 47
    Width = 313
    Height = 259
    Align = alLeft
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 303
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel2'
      Color = clGray
      TabOrder = 0
      object Label2: TLabel
        Left = 49
        Top = 4
        Width = 209
        Height = 22
        Caption = 'Atividade / Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object treeAtividade: TCMTreeViewMT
      Left = 5
      Top = 39
      Width = 303
      Height = 215
      PodeNavegar = True
      DataSource = ds
      CampoChave = 'UNECODIGO'
      CampoDescricao = 'NOME'
      CampoTipo = 'UNETIPO'
      OnChange = treeAtividadeChange
      Align = alClient
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 98
    Top = 107
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 250
    Top = 243
  end
  inherited ImlPadrao: TImageList
    Left = 112
    Top = 219
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 272
    Top = 143
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 276
    Top = 91
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    Left = 268
    Top = 187
  end
  object CdsUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 163
  end
  object CdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 251
  end
  object CdsProcura: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAfterScroll
    Left = 40
    Top = 155
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAfterScroll
    Left = 40
    Top = 211
  end
  object CdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 99
  end
end
