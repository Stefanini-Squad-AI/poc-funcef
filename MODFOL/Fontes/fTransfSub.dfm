inherited frmTransfSub: TfrmTransfSub
  Left = 308
  Top = 143
  Caption = 'Transferência de Subordinação'
  ClientHeight = 445
  ClientWidth = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 642
    Height = 406
    object Label1: TLabel
      Left = 32
      Top = 27
      Width = 83
      Height = 13
      Caption = 'Subordinado a'
    end
    object Label2: TLabel
      Left = 32
      Top = 363
      Width = 148
      Height = 13
      Caption = 'Transferir Subordinação a'
    end
    object btBuscGrupo: TSpeedButton
      Left = 595
      Top = 358
      Width = 41
      Height = 23
      Hint = 'Procurar por um grupo de contas orçamentárias'
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
      NumGlyphs = 2
      OnClick = btBuscGrupoClick
    end
    object SpeedButton1: TSpeedButton
      Left = 554
      Top = 21
      Width = 81
      Height = 24
      Hint = 'Procurar por um grupo de contas orçamentárias'
      Caption = '&Procurar'
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
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object edtSubordinado: TEdit
      Left = 120
      Top = 24
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object plnTransf: TPanel
      Left = 1
      Top = 64
      Width = 845
      Height = 261
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object btnAdiciona: TSpeedButton
        Left = 300
        Top = 98
        Width = 39
        Height = 34
        Hint = 'Adiciona'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = btnAdicionaClick
      end
      object BtnRemove: TSpeedButton
        Left = 300
        Top = 141
        Width = 39
        Height = 34
        Hint = 'Remove'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = BtnRemoveClick
      end
      object BtnAdicionaTudo: TSpeedButton
        Left = 300
        Top = 56
        Width = 39
        Height = 34
        Hint = 'Adiciona Todos'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = BtnAdicionaTudoClick
      end
      object btnRemoveTudo: TSpeedButton
        Left = 300
        Top = 184
        Width = 39
        Height = 34
        Hint = 'Remove Todos'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = btnRemoveTudoClick
      end
      object Panel1: TPanel
        Left = 10
        Top = 17
        Width = 284
        Height = 28
        BevelOuter = bvNone
        Caption = 'Empregados Subordinados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 343
        Top = 18
        Width = 284
        Height = 27
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Empregados a Transferir'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object DBGridCSub: TwwDBGrid
        Left = 11
        Top = 45
        Width = 284
        Height = 205
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dsSubordinados
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnDblClick = DBGridCSubDblClick
        IndicatorColor = icBlack
      end
      object DBGridSel: TwwDBGrid
        Left = 344
        Top = 45
        Width = 284
        Height = 205
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akTop, akRight, akBottom]
        DataSource = dsTransferir
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnDblClick = DBGridSelDblClick
        IndicatorColor = icBlack
      end
    end
    object edtTransferencia: TEdit
      Left = 184
      Top = 360
      Width = 411
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 642
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object CmeCadastro: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    OnInsert = CmeCadastroInsert
    OnEdit = CmeCadastroEdit
    OnConfirma = CmeCadastroConfirma
    OpenDsAutomatico = False
    Left = 440
    Top = 215
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'F.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'FUNCIONARIO F')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Filtro.Strings = (
      'P.TIPO = '#39'F'#39
      'P.IDPESSOA = F.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '13')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 489
    Top = 121
  end
  object CdsTransferir: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 264
  end
  object dsSubordinados: TwwDataSource
    DataSet = CdsSubordinados
    Left = 216
    Top = 248
  end
  object dsTransferir: TwwDataSource
    DataSet = CdsTransferir
    Left = 448
    Top = 271
  end
  object CdsSubordinados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 116
    Top = 247
  end
  object MSBuscaSub: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'F.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'FUNCIONARIO F'
      'PESSOAFISICA PF')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Filtro.Strings = (
      
        'F.IDPESSOA  IN (SELECT DISTINCT FUN.IDCHEFE FROM FUNCIONARIO FUN' +
        ', SITFUNC STF WHERE FUN.IDCHEFE IS NOT NULL AND FUN.IDSITFUNC  =' +
        ' STF.IDSITFUNC AND STF.TIPOSIT   IN ('#39'A'#39', '#39'F'#39'))'
      'F.IDPESSOA   = P.IDPESSOA'
      'F.IDPESSOA   = PF.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '13')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 561
    Top = 129
  end
  object MSSub: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'F.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'FUNCIONARIO F')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Filtro.Strings = (
      'P.TIPO = '#39'F'#39
      'P.IDPESSOA = F.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '13')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 569
    Top = 393
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 320
    Top = 336
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 284
    Top = 335
  end
end
