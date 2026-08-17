inherited FrmTipoAlteradorxCCxConta: TFrmTipoAlteradorxCCxConta
  Left = 543
  Top = 183
  Caption = 'Alterador X Centro de Custo X Conta Contábil X Programa'
  ClientHeight = 376
  ClientWidth = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 406
    Height = 290
    object CmpCContabil: TCMProcuraMaskContabil
      Left = 14
      Top = 204
      Width = 377
      Height = 74
      Caption = ' Conta Contábil '
      TabOrder = 1
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
    object CmpCentCusto: TCMProcuraMask
      Left = 14
      Top = 67
      Width = 377
      Height = 74
      Caption = ' Centro de Custo '
      TabOrder = 0
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'CODCENTROCUSTO'
      Mensagens.EmBranco = 'Centro de Custo não pode estar em branco'
      Mensagens.NaoExiste = 'Centro de Custo não existe'
      Mensagens.Sintetica = 'Centro de Custo não pode ser sintético'
      Mensagens.Analitica = 'Centro de Custo não pode ser analítico'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      MontaSelect = MsCentCusto
      LookupQuery = QryCentCusto
      LookupParam = 'CODCENTROCUSTO'
      LookupChave = 'CODCENTROCUSTO'
      LookupTipo = 'STATUSGRUPOCDC'
      LookupDescricao = 'NOME'
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 151
      Width = 377
      Height = 49
      Caption = ' Programa '
      TabOrder = 2
      object CmbPrgAssistencial: TCMDBLookupCombo
        Left = 13
        Top = 16
        Width = 354
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPROGRAMA'#9'60'#9'Programa'
          'CODPROGRAMA'#9'2'#9'Código')
        DataField = 'IDPROGRAMA'
        DataSource = ds
        LookupTable = QryPrograma
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
    object GpbAlterador: TGroupBox
      Left = 14
      Top = 13
      Width = 377
      Height = 49
      Caption = ' Alterador Selecionado '
      TabOrder = 3
      object dblkAlterador: TwwDBLookupCombo
        Left = 12
        Top = 18
        Width = 349
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO'
          'ACRESDECRES'#9'1'#9'ACRESDECRES')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupTable = qryAlt
        LookupField = 'CODALTERADOR'
        DropDownWidth = 400
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 406
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 406
    inherited tb97Fundo: TToolbar97
      Left = 202
      DockPos = 202
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
  object PnlCCusto: TPanel [3]
    Left = 483
    Top = 89
    Width = 1024
    Height = 663
    TabOrder = 3
    Visible = False
    object PnlTitTipoAgreAssoc: TPanel
      Left = 1
      Top = 1
      Width = 1022
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
    object GrdSel: TwwDBGrid
      Left = 1
      Top = 27
      Width = 1022
      Height = 91
      Selected.Strings = (
        'CODCENTROCUSTO'#9'10'#9'Código'
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
    object Panel2: TPanel
      Left = 1
      Top = 118
      Width = 1022
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
    object GrdAll: TwwDBGrid
      Left = 1
      Top = 173
      Width = 1022
      Height = 489
      Selected.Strings = (
        'CODCENTROCUSTO'#9'10'#9'Código'
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
    object Panel3: TPanel
      Left = 1
      Top = 147
      Width = 1022
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
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  IDALTXCCXPRGXCONTA,'
      '  CODCENTROCUSTO,'
      '  IDEMPRESA,'
      '  IDPROGRAMA,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODALTERADOR'
      'FROM'
      '  ALTXCCXPRGXCONTA'
      'WHERE'
      '  IDALTXCCXPRGXCONTA = :IDALTXCCXPRGXCONTA'
      ' ')
    Left = 244
    Top = 11
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDALTXCCXPRGXCONTA'
        ParamType = ptUnknown
      end>
    object qryIDALTXCCXPRGXCONTA: TFloatField
      FieldName = 'IDALTXCCXPRGXCONTA'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.IDALTXCCXPRGXCONTA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.IDEMPRESA'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.IDPROGRAMA'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTXCCXPRGXCONTA.CODALTERADOR'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 288
    Top = 278
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTXCCXPRGXCONTA'
      'set'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  CODALTERADOR = :CODALTERADOR'
      'where'
      '  IDALTXCCXPRGXCONTA = :OLD_IDALTXCCXPRGXCONTA')
    InsertSQL.Strings = (
      'insert into ALTXCCXPRGXCONTA'
      
        '  (IDALTXCCXPRGXCONTA, CODCENTROCUSTO, IDEMPRESA, IDPROGRAMA, PL' +
        'ANO, PLACONTA, '
      '   CODALTERADOR)'
      'values'
      
        '  (:IDALTXCCXPRGXCONTA, :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA' +
        ', :PLANO, '
      '   :PLACONTA, :CODALTERADOR)')
    DeleteSQL.Strings = (
      'delete from ALTXCCXPRGXCONTA'
      'where'
      '  IDALTXCCXPRGXCONTA = :OLD_IDALTXCCXPRGXCONTA')
    Left = 209
    Top = 11
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOALTERADOR.DESCRICAO'
      'TIPOALTERADOR.ACRESDECRES'
      'PROGRAMA.DESCPROGRAMA'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Alterador'
      'A/D'
      'Programa'
      'Cod Centro Custo'
      'Nome Centro Custo'
      'Conta Contábil'
      'Nome C. Contabil')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ALTXCCXPRGXCONTA'
      'PROGRAMA'
      'CENTCUST'
      'PLANOCONTA'
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'ALTXCCXPRGXCONTA.IDALTXCCXPRGXCONTA')
    Filtro.Strings = (
      'ALTXCCXPRGXCONTA.CODALTERADOR=TIPOALTERADOR.CODALTERADOR'
      'ALTXCCXPRGXCONTA.CODCENTROCUSTO=CENTCUST.CODCENTROCUSTO'
      'ALTXCCXPRGXCONTA.IDEMPRESA=CENTCUST.IDEMPRESA'
      'ALTXCCXPRGXCONTA.PLANO=PLANOCONTA.PLANO'
      'ALTXCCXPRGXCONTA.PLACONTA=PLANOCONTA.PLACONTA'
      'ALTXCCXPRGXCONTA.IDPROGRAMA(+)=PROGRAMA.IDPROGRAMA'
      ' ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '1'
      '60'
      '10'
      '30'
      '18'
      '40')
    Left = 313
    Top = 11
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 11
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 278
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 11
  end
  object MsCentCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.STATUSGRUPOCDC')
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
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 153
    Top = 147
  end
  object QryCentCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO,'
      '  NOME,'
      '  STATUSGRUPOCDC'
      'FROM'
      ' CENTCUST'
      'WHERE'
      ' (IDEMPRESA = :IDEMPRESA) AND'
      ' (RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 75
    Top = 131
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end>
    object QryCentCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object QryCentCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object QryCentCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Size = 1
    end
  end
  object QryValida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDALTXCCXPRGXCONTA'
      'FROM'
      '  ALTXCCXPRGXCONTA'
      'WHERE'
      '  RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND'
      '  IDEMPRESA = :IDEMPRESA AND'
      '  PLANO = :PLANO AND'
      '  RTRIM(PLACONTA) = :PLACONTA AND'
      '  CODALTERADOR = :CODALTERADOR'
      '')
    ValidateWithMask = True
    Left = 174
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end>
    object QryValidaIDALTXCCXPRGXCONTA: TFloatField
      FieldName = 'IDALTXCCXPRGXCONTA'
    end
  end
  object QrySel: TwwQuery
    CachedUpdates = True
    BeforePost = QrySelBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.IDALTXCCXPRGXCONTA,'
      '  A.CODALTERADOR,'
      '  A.CODCENTROCUSTO,'
      '  A.PLANO,'
      '  A.PLACONTA,'
      '  A.IDEMPRESA,'
      '  A.IDPROGRAMA,'
      '  C.NOME,'
      '  C.STATUSGRUPOCDC'
      'FROM'
      '  ALTXCCXPRGXCONTA A, CENTCUST C'
      'WHERE'
      '  A.CODALTERADOR = :CODALTERADOR AND'
      '  RTRIM(A.PLANO) = :PLANO AND'
      '  RTRIM(A.PLACONTA) = :PLACONTA AND'
      '  A.IDEMPRESA = C.IDEMPRESA AND'
      '  A.CODCENTROCUSTO = C.CODCENTROCUSTO'
      'ORDER BY'
      '  A.CODCENTROCUSTO,'
      '  C.NOME')
    UpdateObject = UpdSel
    ValidateWithMask = True
    Left = 270
    Top = 213
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
  end
  object QryAll: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  (0) AS IDTIPORDXCCXCONTA,'
      '  C.CODCENTROCUSTO,'
      '  (0) AS CODALTERADOR,'
      '  (1) AS PLANO,'
      '  ('#39'                  '#39') AS PLACONTA,'
      '  (1) AS IDEMPRESA,'
      '  (1) AS IDPROGRAMA,'
      '  C.NOME, '
      '  C.STATUSGRUPOCDC'
      'FROM '
      '  CENTCUST C'
      'WHERE '
      '  C.IDEMPRESA =  1 AND'
      '  NOT EXISTS'
      '      (SELECT'
      '        A.IDALTXCCXPRGXCONTA'
      '       FROM'
      '        ALTXCCXPRGXCONTA A'
      '       WHERE'
      '        A.CODALTERADOR =   1 AND'
      '        RTRIM(A.PLANO) =  1 AND'
      '        RTRIM(A.PLACONTA) = '#39'                  '#39' AND'
      '        A.IDPROGRAMA =  1 AND'
      '        A.IDEMPRESA = C.IDEMPRESA AND'
      '        A.CODCENTROCUSTO = C.CODCENTROCUSTO ) '
      'ORDER BY'
      '  C.CODCENTROCUSTO,'
      '  C.NOME'
      ''
      ' ')
    UpdateObject = UpdAll
    ValidateWithMask = True
    Left = 269
    Top = 156
  end
  object DsSel: TwwDataSource
    AutoEdit = False
    DataSet = QrySel
    Left = 307
    Top = 213
  end
  object UpdSel: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTXCCXPRGXCONTA'
      'set'
      '  IDALTXCCXPRGXCONTA = :IDALTXCCXPRGXCONTA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  CODALTERADOR = :CODALTERADOR'
      'where'
      '  IDALTXCCXPRGXCONTA = :OLD_IDALTXCCXPRGXCONTA')
    InsertSQL.Strings = (
      'insert into ALTXCCXPRGXCONTA'
      
        '  (IDALTXCCXPRGXCONTA, CODCENTROCUSTO, IDEMPRESA, IDPROGRAMA, PL' +
        'ANO, PLACONTA, '
      '   CODALTERADOR)'
      'values'
      
        '  (:IDALTXCCXPRGXCONTA, :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA' +
        ', :PLANO, '
      '   :PLACONTA, :CODALTERADOR)')
    DeleteSQL.Strings = (
      'delete from ALTXCCXPRGXCONTA'
      'where'
      '  IDALTXCCXPRGXCONTA = :OLD_IDALTXCCXPRGXCONTA')
    Left = 345
    Top = 213
  end
  object UpdAll: TUpdateSQL
    ModifySQL.Strings = (
      'update CENTCUST'
      'set'
      '  IDTIPORDXCCXCONTA = :IDTIPORDXCCXCONTA'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    InsertSQL.Strings = (
      'insert into CENTCUST'
      '  (IDTIPORDXCCXCONTA)'
      'values'
      '  (:IDTIPORDXCCXCONTA)')
    DeleteSQL.Strings = (
      'delete from CENTCUST'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    Left = 344
    Top = 156
  end
  object DsAll: TwwDataSource
    AutoEdit = False
    DataSet = QryAll
    Left = 307
    Top = 156
  end
  object QryPrograma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER' +
        ' BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 78
    Top = 214
    object QryProgramaDESCPROGRAMA: TStringField
      DisplayLabel = 'Programa'
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object QryProgramaCODPROGRAMA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 2
      FieldName = 'CODPROGRAMA'
      Origin = 'PROGRAMA.CODPROGRAMA'
      Size = 2
    end
    object QryProgramaIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
  end
  object qryAlt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODALTERADOR,DESCRICAO,ACRESDECRES,PLACONTA,CODCENTROCUSTO,'
      '  CONVERTE, FLGCALCULAIMPOSTO'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '   (RECPAG = :RECPAG)     AND'
      '   (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '    DESCRICAO')
    ValidateWithMask = True
    Left = 76
    Top = 75
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAltDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAltACRESDECRES: TStringField
      DisplayWidth = 1
      FieldName = 'ACRESDECRES'
      Origin = 'TIPOALTERADOR.ACRESDECRES'
      Size = 1
    end
    object qryAltCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
      Visible = False
    end
    object qryAltPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'TIPOALTERADOR.PLACONTA'
      Visible = False
      Size = 18
    end
    object qryAltCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'TIPOALTERADOR.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryAltCONVERTE: TStringField
      DisplayWidth = 1
      FieldName = 'CONVERTE'
      Origin = 'TIPOALTERADOR.CONVERTE'
      Visible = False
      Size = 1
    end
    object qryAltFLGCALCULAIMPOSTO: TStringField
      FieldName = 'FLGCALCULAIMPOSTO'
      Origin = 'TIPOALTERADOR.FLGCALCULAIMPOSTO'
      Size = 1
    end
  end
end
