inherited FrmTrdxCCxContaMT: TFrmTrdxCCxContaMT
  Left = 39
  Top = 162
  Caption = 'Parametrização Contábil Predominante'
  ClientHeight = 409
  ClientWidth = 785
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCCusto: TPanel [0]
    Left = 0
    Top = 47
    Width = 785
    Height = 323
    Align = alClient
    TabOrder = 3
    Visible = False
    object PnlTitTipoAgreAssoc: TPanel
      Left = 1
      Top = 1
      Width = 783
      Height = 26
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Centros de Custo Relacionados'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object GrdAll: TwwDBGrid
      Left = 1
      Top = 173
      Width = 783
      Height = 149
      Selected.Strings = (
        'CODEXTERNO'#9'10'#9'Código'#9'F'
        'STATUSGRUPOCDC'#9'1'#9'A/S'
        'NOME'#9'30'#9'Nome')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsAll
      KeyOptions = [dgAllowDelete]
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
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
      OnCalcCellColors = GrdAllCalcCellColors
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 1
      Top = 118
      Width = 783
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object BtnSel: TSpeedButton
        Tag = 1
        Left = 135
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Adiciona'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888877777888888888887777788888888877EEEEE77
          8888888778FFFF778888887EE66666EE78888878FF88888F788887E666666666
          6088878F88888888878887E666666666608887F88888888887F88E6666666666
          660878F88888888888788E66FFFFFFF666087F8877777778887F8E666FFFFF66
          66087F888777778F887F8E6666FFF66666087F88887778F8887F8E66666F6666
          66087F8888878F88887F876666666666608887888888F888878F876666666666
          608887F88888888887F8880666666666088888788888888878F8888006666600
          88888887788888778F8888888000008888888888F777778FF888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSelClick
      end
      object BtnSelAll: TSpeedButton
        Left = 167
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Adiciona Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888006666600
          888888F877888887788888066666666608888F87888888888788806666666666
          67888F78FFFFFFF88F788066FFFFFFF66788F87887777777887806666FFFFF66
          6E78F7888877777888F7066666FFF6666E78F7888887778888F70666666F6666
          6E78F788FFFF7FF888F70666FFFFFFF66E78F7888777777788F706666FFFFF66
          6E788788887777788F87806666FFF666E7888F78888777888F788066666F6666
          E788887888887888F878887EE66666EE78888887F88888FF878888877EEEEE77
          8888888877FFFF87788888888777778888888888887777788888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSelAllClick
      end
      object BtnDel: TSpeedButton
        Left = 199
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Exlui'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888000008888888888877777888888888006666600
          88888887788888778F88880666666666088888788888888878F8876666666666
          608887F88888888887F8876666666666608887888888F888878F8E66666F6666
          66087F8888878F88887F8E6666FFF66666087F88887778F8887F8E666FFFFF66
          66087F888777778F887F8E66FFFFFFF666087F8877777778887F8E6666666666
          660878F888888888887887E666666666608887F88888888887F887E666666666
          6088878F888888888788887EE66666EE78888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDelClick
      end
      object BtnDelAll: TSpeedButton
        Left = 231
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888877777888888888888777778888888877EEEEE77
          8888888877FFFF877888887EE66666EE78888887F88888FF87888066666F6666
          E788887888887888F878806666FFF666E7888F78888777888F7806666FFFFF66
          6E788788887777788F870666FFFFFFF66E78F7888777777788F70666666F6666
          6E78F788FFFF7FF888F7066666FFF6666E78F7888887778888F706666FFFFF66
          6E78F7888877777888F78066FFFFFFF66788F878877777778878806666666666
          67888F78FFFFFFF88F7888066666666608888F87888888888788888006666600
          888888F87788888778888888800000888888888FF877777F8888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDelAllClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 147
      Width = 783
      Height = 26
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Centros de Custo'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object GrdSel: TwwDBGrid
      Left = 1
      Top = 27
      Width = 783
      Height = 91
      Selected.Strings = (
        'CODEXTERNO'#9'10'#9'Código'#9'F'
        'STATUSGRUPOCDC'#9'1'#9'A/S'
        'NOME'#9'30'#9'Nome')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = DsSel
      KeyOptions = [dgAllowDelete]
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
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
      OnCalcCellColors = GrdSelCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited pnlFundo: TPanel
    Width = 785
    Height = 323
    object bvPrograma: TBevel
      Left = 0
      Top = 160
      Width = 782
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel1: TBevel
      Left = 0
      Top = 220
      Width = 782
      Height = 5
      Shape = bsBottomLine
    end
    object CmpTrd: TCMProcuraMask
      Left = 14
      Top = 8
      Width = 377
      Height = 74
      Caption = ' Tipo de Desembolso '
      TabOrder = 0
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'CODTIPRECDES'
      Mensagens.EmBranco = 'Tipo de Desembolso não pode estar em branco'
      Mensagens.NaoExiste = 'Tipo de Desembolso não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintético'
      Mensagens.Analitica = 'Tipo de Desembolso não pode ser analítico'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      MontaSelect = MsTipoDesemb
      LookupQuery = CdsTipoDesemb
      LookupSQLParams = SqlTipoDesemb
      LookupParam = 'CODTIPRECDES'
      LookupChave = 'CODTIPRECDES'
      LookupTipo = 'ANASINT'
      LookupDescricao = 'DESCRICAO'
    end
    object CmpCentCusto: TCMProcuraMask
      Left = 14
      Top = 82
      Width = 377
      Height = 74
      Caption = 'Centro de Custo '
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'CODCENTROCUSTO'
      Mensagens.EmBranco = 'Centro de Custo não pode estar em branco'
      Mensagens.NaoExiste = 'Centro de Custo não existe'
      Mensagens.Sintetica = 'Centro de Custo não pode ser sintético'
      Mensagens.Analitica = 'Centro de Custo não pode ser analítico'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = True
      DadoExibido = 'CODEXTERNO'
      LookupSql.Strings = (
        'SELECT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, CODEXTERNO '
        'FROM CENTCUST '
        'WHERE IDEMPRESA = 2'
        
          'AND IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL WHE' +
          'RE IDPESSOA = 2)')
      AceitaTipoConta = SoAnalitica
      MontaSelect = MsCentCusto
      LookupQuery = CdsCentCusto
      LookupSQLParams = SqlCentCusto
      LookupParam = 'CODCENTROCUSTO'
      LookupChave = 'CODCENTROCUSTO'
      LookupTipo = 'STATUSGRUPOCDC'
      LookupDescricao = 'NOME'
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 173
      Width = 377
      Height = 44
      Caption = 'Programa '
      TabOrder = 4
      object CmbPrgAssistencial: TCMDBLookupCombo
        Left = 9
        Top = 16
        Width = 358
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPROGRAMA'#9'60'#9'Programa'
          'CODPROGRAMA'#9'2'#9'Código')
        DataField = 'IDPROGRAMA'
        DataSource = ds
        LookupTable = CdsPrograma
        LookupField = 'IDPROGRAMA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object CmpCContabil: TCMProcuraMaskContabil
      Left = 398
      Top = 8
      Width = 377
      Height = 74
      Caption = 'Conta Contábil '
      TabOrder = 2
      OnExit = CmpCContabilExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta Contábil Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Conta Contábil Chave não existe'
      Mensagens.Sintetica = 'Conta Contábil Chave não pode ser sintética'
      Mensagens.Analitica = 'Conta Contábil Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scSoAtiva
      OnApertouBotao = CmpCContabilApertouBotao
    end
    object CmpCContabilPass: TCMProcuraMaskContabil
      Left = 400
      Top = 82
      Width = 377
      Height = 74
      Caption = 'Conta Contábil de Passagem '
      TabOrder = 3
      OnExit = CmpCContabilPassExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTAPASS'
      Mensagens.EmBranco = 'Conta Contábil de Passagem Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Conta Contábil de Passagem Chave não existe'
      Mensagens.Sintetica = 'Conta Contábil de Passagem Chave não pode ser sintética'
      Mensagens.Analitica = 'Conta Contábil de Passagem Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scSoAtiva
      OnApertouBotao = CmpCContabilPassApertouBotao
    end
    object GroupBox2: TGroupBox
      Left = 398
      Top = 171
      Width = 377
      Height = 44
      Caption = 'Plano Previdenciário'
      TabOrder = 5
      object cmbPlano: TCMDBLookupCombo
        Left = 13
        Top = 16
        Width = 354
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = CdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object gbGrupoConta: TGroupBox
      Left = 16
      Top = 235
      Width = 377
      Height = 77
      Caption = 'Grupo da Conta Orçamentária'
      TabOrder = 6
      object DBT: TDBText
        Left = 9
        Top = 46
        Width = 357
        Height = 26
        DataField = 'DESCGRUPOCONTA'
        DataSource = ds
        WordWrap = True
      end
      object cmpGrupoConta: TCMProcura
        Left = 9
        Top = 16
        Width = 357
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        OnValidaDados = cmpGrupoContaValidaDados
        DataSource = ds
        DataField = 'IDGRUPOORCAMEN'
        LookupChave = 'IDGRUPOORCAMEN'
        LookupDescricao = 'CODGRUPOORC'
        MontaSelect = MsGrupo
        LookupTabela = 'CM.GRUPOORCAMEN'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 785
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 785
    inherited tb97Fundo: TToolbar97
      Left = 203
      DockPos = 203
      inherited bbtnSair: TBitBtn
        ModalResult = 5
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 34
      DockPos = 34
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 914
    Top = 7
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 968
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 336
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 248
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME'
      'PL.PLACONTA'
      'PL.PLANOME'
      'PLP.PLACONTA'
      'PLP.PLANOME'
      'PROGRAMA.DESCPROGRAMA'
      'PPV.NOME'
      'G.CODGRUPOORC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo Desembolso'
      'Descrição'
      'Cód. Centro Custo'
      'Nome Centro Custo'
      'Conta Contábil'
      'Nome Conta Contábil'
      'Conta Contábil Passagem'
      'Nome Cta Contab Pass..'
      'Programa'
      'Plano Previdenciário'
      'Grupo da Conta')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORDXCCXCONTA'
      'CENTCUST'
      'PLANOCONTA PL'
      'PLANOCONTA PLP'
      'TIPORECEBDESEMB'
      'PROGRAMA'
      'PLANPREVCONTABIL PPV'
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'TIPORDXCCXCONTA.IDTIPORDXCCXCONTA'
      'TIPORDXCCXCONTA.IDprograma'
      'TIPORDXCCXCONTA.IDGRUPOORCAMEN')
    Filtro.Strings = (
      'TIPORDXCCXCONTA.PLANO = PL.PLANO(+)'
      'TIPORDXCCXCONTA.PLACONTA = PL.PLACONTA(+)'
      'TIPORDXCCXCONTA.PLANO = PLP.PLANO(+)'
      'TIPORDXCCXCONTA.PLACONTAPASS = PLP.PLACONTA(+)'
      'TIPORDXCCXCONTA.IDEMPRESA = CENTCUST.IDEMPRESA(+)'
      'TIPORDXCCXCONTA.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)'
      'TIPORDXCCXCONTA.IDPESSOA = TIPORECEBDESEMB.IDPESSOA'
      'TIPORDXCCXCONTA.RECPAG = TIPORECEBDESEMB.RECPAG'
      'TIPORDXCCXCONTA.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORDXCCXCONTA.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+)'
      'TIPORDXCCXCONTA.IDPLANOPREV = PPV.IDPLANOPREV(+)'
      'TIPORDXCCXCONTA.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '10'
      '30'
      '18'
      '40'
      '60'
      '30'
      '18'
      '40'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0'
      '0'
      '0'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 70
    Top = 99
  end
  object MsTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Tipo de Desembolso'
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'A/S')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES')
    Filtro.Strings = (
      'TIPORECEBDESEMB.ATIVO <> '#39'N'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    OperComparador.Strings = (
      '-1'
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
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 189
    Top = 75
  end
  object MsCentCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.NOME'
      'CENTCUST.STATUSGRUPOCDC'
      'CENTCUST.CODEXTERNO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'A/S'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO')
    Filtro.Strings = (
      'CENTCUST.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '1'
      '10')
    OperComparador.Strings = (
      '-1'
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
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 113
    Top = 75
  end
  object DsSel: TwwDataSource
    AutoEdit = False
    DataSet = CdsSel
    Left = 520
    Top = 8
  end
  object DsAll: TwwDataSource
    AutoEdit = False
    DataSet = CdsAll
    Left = 600
    Top = 8
  end
  object CdsCentCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 316
    Top = 151
    object CdsCentCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsCentCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsCentCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      FixedChar = True
      Size = 1
    end
    object CdsCentCustoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
  end
  object CdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 308
    Top = 215
  end
  object CdsAll: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 560
    Top = 8
  end
  object CdsValida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 8
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 316
    Top = 71
  end
  object CdsSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforePost = CdsSelBeforePost
    Left = 480
    Top = 8
  end
  object SqlTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES, DESCRICAO, ANASINT, FLGOBRIGARESERVA'
      'FROM '
      '  TIPORECEBDESEMB'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  ATIVO = '#39'S'#39
      ''
      ' ')
    ClientDataSet = CdsTipoDesemb
    Left = 256
    Top = 88
  end
  object SqlCentCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.CODCENTROCUSTO,'
      '  C.NOME,'
      '  C.STATUSGRUPOCDC,'
      '  C.CODEXTERNO'
      'FROM'
      ' CENTCUST C, (SELECT IDPESSOA,IDPLANCENTCUST FROM PARAMGLOBAL) P'
      'WHERE'
      ' (C.IDEMPRESA = :IDEMPRESA)  AND'
      ' (RTRIM(C.CODCENTROCUSTO) = :CODCENTROCUSTO) AND'
      ' (C.ATIVO = '#39'S'#39') AND'
      ' (C.IDPLANCENTCUST = P.IDPLANCENTCUST) AND'
      ' (C.IDEMPRESA = P.IDPESSOA)'
      ' ')
    ClientDataSet = CdsCentCusto
    Left = 262
    Top = 137
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 211
  end
  object sqlParamCap: TCMSqlParams
    SQL.Strings = (
      
        'SELECT FLGPCPCCUSTO, FLGPCPPRG, FLGPCPPATRO, FLGPCPCONTA, FLGPCP' +
        'CONTAPASS'
      'FROM PARAMCAP'
      'WHERE RECPAG = :RECPAG'
      ' ')
    ClientDataSet = cdsparamcap
    Left = 584
    Top = 223
  end
  object cdsparamcap: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 223
  end
  object MsGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'PLANOORCAMENTARIO.NOMEPLANOORC'
      'PLANOORCAMENTARIO.ANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Codigo Grupo'
      'Nome'
      'Plano Orçamentário'
      'Exercício')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'GRUPOORCAMEN.IDGRUPOORCAMEN'
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'PLANOORCAMENTARIO.NOMEPLANOORC')
    Filtro.Strings = (
      'GRUPOORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
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
    Left = 272
    Top = 287
  end
end
