inherited frmAdvogXProcJur: TfrmAdvogXProcJur
  Left = 55
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Transferência de Processos Entre Escritórios/Advogados Contratad' +
    'os'
  ClientHeight = 343
  ClientWidth = 685
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 685
    Height = 304
    BorderWidth = 2
    object Label1: TLabel
      Left = 13
      Top = 17
      Width = 167
      Height = 13
      Caption = 'Nosso Escritório/Advogado 1'
    end
    object Label2: TLabel
      Left = 364
      Top = 17
      Width = 167
      Height = 13
      Caption = 'Nosso Escritório/Advogado 2'
    end
    object sbtnAdicionarTudo: TSpeedButton
      Left = 325
      Top = 139
      Width = 34
      Height = 30
      Hint = 'Tranferir Todos de 1 para 2'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
        66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
        66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
        660878F877887788887887E6F666F666608887F87888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAdicionarTudoClick
    end
    object sbtnAdicionar: TSpeedButton
      Left = 325
      Top = 96
      Width = 34
      Height = 30
      Hint = 'Tranferir de 1 para 2'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
        66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
        66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
        660878F888778888887887E666F66666608887F88878888887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAdicionarClick
    end
    object sbtnRemover: TSpeedButton
      Left = 325
      Top = 181
      Width = 34
      Height = 30
      Hint = 'Tranferir de 2 para 1'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
        66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
        66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
        660878F888877F88887887E66666F666608887F88888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnRemoverClick
    end
    object sbtnRemoverTudo: TSpeedButton
      Left = 325
      Top = 223
      Width = 34
      Height = 30
      Hint = 'Tranferir Todos de 2 para 1'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
        66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
        66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
        660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnRemoverTudoClick
    end
    object sbtnProcurarAdvogado1: TToolbarButton97
      Left = 260
      Top = 7
      Width = 60
      Height = 45
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Flat = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      ImageIndex = 3
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = sbtnProcurarAdvogado1Click
    end
    object sbtnProcurarAdvogado2: TToolbarButton97
      Left = 612
      Top = 10
      Width = 60
      Height = 42
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Flat = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      ImageIndex = 3
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = sbtnProcurarAdvogado2Click
    end
    object grdAdv1: TwwDBGrid
      Left = 12
      Top = 83
      Width = 308
      Height = 210
      Selected.Strings = (
        'PROCJCJNUM'#9'8'#9'Processo'
        'NOME'#9'30'#9'Contra-Parte'
        'DATANOTIF'#9'10'#9'Data Notif.'
        'DATAJUIZO'#9'10'#9'Data Ajuiz.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProcAdvog1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnDblClick = sbtnAdicionarClick
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 12
      Top = 56
      Width = 308
      Height = 28
      BevelInner = bvLowered
      Caption = 'Processos do Advogado 1'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 364
      Top = 56
      Width = 308
      Height = 28
      BevelInner = bvLowered
      Caption = 'Processos do Advogado 2'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object grdAdv2: TwwDBGrid
      Left = 364
      Top = 83
      Width = 308
      Height = 210
      Selected.Strings = (
        'PROCJCJNUM'#9'8'#9'Processo'
        'NOME'#9'30'#9'Contra-Pate'
        'DATANOTIF'#9'10'#9'Data Notif.'
        'DATAJUIZO'#9'10'#9'Data Ajuiz.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProcAdv2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnDblClick = sbtnRemoverClick
      IndicatorColor = icBlack
    end
    object EdAdv1: TEdit
      Left = 12
      Top = 31
      Width = 243
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdAdv2: TEdit
      Left = 364
      Top = 31
      Width = 243
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object cbxSelUFCidade: TCheckBox
      Left = 47
      Top = 0
      Width = 145
      Height = 17
      Caption = 'Seleciona UF/Cidade'
      TabOrder = 6
      OnClick = cbxSelUFCidadeClick
    end
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 685
    inherited tb97Fundo: TToolbar97
      Left = 517
      DockPos = 606
    end
  end
  object townUFCidade: TToolWindow97 [2]
    Left = 60
    Top = 20
    Caption = 'Seleção de UF(s) / Cidade(s)'
    CloseButton = False
    ClientAreaHeight = 277
    ClientAreaWidth = 550
    Resizable = False
    TabOrder = 2
    Visible = False
    object bbtnFecharMB: TBitBtn
      Left = 224
      Top = 239
      Width = 99
      Height = 32
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnFecharMBClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object rgUF: TRadioGroup
      Left = 38
      Top = 11
      Width = 220
      Height = 32
      Caption = 'UF Onde Corre o Processo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas '
        'Seleciona')
      TabOrder = 1
      OnClick = rgUFClick
    end
    object gbxUF: TGroupBox
      Left = 38
      Top = 45
      Width = 220
      Height = 180
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Visible = False
      object dblcUF: TwwDBLookupCombo
        Left = 9
        Top = 15
        Width = 200
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEESTADO'#9'30'#9'Nome UF'#9'F'
          'CODESTADO'#9'3'#9'Sigla UF'#9'F')
        LookupTable = CdsUF
        LookupField = 'NOMEESTADO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        MaxLength = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblcUFCloseUp
      end
      object lstUF: TListBox
        Left = 9
        Top = 39
        Width = 200
        Height = 134
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstUFKeyDown
      end
      object lstCodUF: TListBox
        Left = 9
        Top = 143
        Width = 40
        Height = 30
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object lstSiglaUF: TListBox
        Left = 67
        Top = 143
        Width = 40
        Height = 30
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
    object rgCidade: TRadioGroup
      Left = 292
      Top = 10
      Width = 220
      Height = 32
      Caption = 'Cidade Onde Corre o Processo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas '
        'Seleciona')
      TabOrder = 3
      OnClick = rgUFClick
    end
    object gbxCidade: TGroupBox
      Left = 292
      Top = 44
      Width = 220
      Height = 180
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      Visible = False
      object dblcCidade: TwwDBLookupCombo
        Left = 9
        Top = 30
        Width = 200
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome da Cidade'#9'F'
          'CODESTADO'#9'3'#9'UF'#9'F')
        LookupTable = CdsCidade
        LookupField = 'NOME'
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblcUFCloseUp
      end
      object lstCidade: TListBox
        Left = 9
        Top = 54
        Width = 200
        Height = 121
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstUFKeyDown
      end
      object lstCodCidade: TListBox
        Left = 9
        Top = 145
        Width = 40
        Height = 30
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object cbxCidadeNegativa: TCheckBox
        Left = 9
        Top = 8
        Width = 200
        Height = 17
        Caption = 'Seleção Negativa (Não Corre)'
        TabOrder = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 297
  end
  object dsProcAdvog1: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcAdv1
    Left = 269
    Top = 85
  end
  object dsProcAdv2: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcAdv2
    Left = 626
    Top = 85
  end
  object CdsProcAdv1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubricaIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubricaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 200
    Top = 85
  end
  object CdsProcAdv2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubricaIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubricaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 563
    Top = 85
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Advogado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'ADVOGADO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    Tabelas.Strings = (
      'PESSOA'
      'ADVOGADO')
    CamposChave.Strings = (
      'ADVOGADO.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ADVOGADO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 132
    Top = 85
  end
  object MontaSelect2: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Advogado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'ADVOGADO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    Tabelas.Strings = (
      'PESSOA'
      'ADVOGADO')
    CamposChave.Strings = (
      'ADVOGADO.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ADVOGADO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 495
    Top = 85
  end
  object CdsUF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 142
    Top = 261
  end
  object CdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 260
  end
end
