inherited FrmTrdxCCxConta: TFrmTrdxCCxConta
  Left = 398
  Top = 144
  Caption = 'Tipo de Desembolso X Centro de Custo X Conta Contábil'
  ClientHeight = 376
  ClientWidth = 406
  OnActivate = FormActivate
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
      LookupQuery = QryTipoDesemb
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
      Caption = ' Centro de Custo '
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
      Top = 157
      Width = 377
      Height = 44
      Caption = ' Programa '
      TabOrder = 3
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
    Left = 0
    Top = 47
    Width = 406
    Height = 290
    Align = alClient
    TabOrder = 3
    Visible = False
    object PnlTitTipoAgreAssoc: TPanel
      Left = 1
      Top = 1
      Width = 404
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
      Width = 404
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
      Width = 404
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
      Width = 404
      Height = 116
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
      Width = 404
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
      '  IDTIPORDXCCXCONTA,'
      '  CODTIPRECDES,'
      '  RECPAG,'
      '  IDPESSOA,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODCENTROCUSTO,'
      '  IDEMPRESA,'
      '  IDPROGRAMA'
      'FROM'
      '  TIPORDXCCXCONTA'
      'WHERE'
      '  IDTIPORDXCCXCONTA = :IDTIPORDXCCXCONTA')
    Left = 242
    Top = 3
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPORDXCCXCONTA'
        ParamType = ptUnknown
      end>
    object qryIDTIPORDXCCXCONTA: TFloatField
      FieldName = 'IDTIPORDXCCXCONTA'
      Origin = 'TIPORDXCCXCONTA.IDTIPORDXCCXCONTA'
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORDXCCXCONTA.CODTIPRECDES'
      Size = 15
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORDXCCXCONTA.RECPAG'
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORDXCCXCONTA.IDPESSOA'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORDXCCXCONTA.PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPORDXCCXCONTA.PLACONTA'
      Size = 18
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'TIPORDXCCXCONTA.CODCENTROCUSTO'
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'TIPORDXCCXCONTA.IDEMPRESA'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'TIPORDXCCXCONTA.IDPROGRAMA'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORDXCCXCONTA'
      'set'
      '  IDTIPORDXCCXCONTA = :IDTIPORDXCCXCONTA,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    InsertSQL.Strings = (
      'insert into TIPORDXCCXCONTA'
      
        '  (IDTIPORDXCCXCONTA, CODTIPRECDES, RECPAG, IDPESSOA, PLANO, PLA' +
        'CONTA, '
      '   CODCENTROCUSTO, IDEMPRESA, IDPROGRAMA)'
      'values'
      
        '  (:IDTIPORDXCCXCONTA, :CODTIPRECDES, :RECPAG, :IDPESSOA, :PLANO' +
        ', :PLACONTA, '
      '   :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from TIPORDXCCXCONTA'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    Left = 208
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PROGRAMA.DESCPROGRAMA'
      'PROGRAMA.CODPROGRAMA')
    TipodeDado.Strings = (
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
      'Nome da Conta'
      'Programa'
      'Código do Programa')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORDXCCXCONTA'
      'CENTCUST'
      'PLANOCONTA'
      'TIPORECEBDESEMB'
      'PROGRAMA')
    CamposChave.Strings = (
      'TIPORDXCCXCONTA.IDTIPORDXCCXCONTA')
    Filtro.Strings = (
      'TIPORDXCCXCONTA.PLANO = PLANOCONTA.PLANO'
      'TIPORDXCCXCONTA.PLACONTA = PLANOCONTA.PLACONTA'
      'TIPORDXCCXCONTA.IDEMPRESA = CENTCUST.IDEMPRESA'
      'TIPORDXCCXCONTA.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO'
      'TIPORDXCCXCONTA.IDPESSOA = TIPORECEBDESEMB.IDPESSOA'
      'TIPORDXCCXCONTA.RECPAG = TIPORECEBDESEMB.RECPAG'
      'TIPORDXCCXCONTA.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORDXCCXCONTA.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+)')
    Mascaras.Strings = (
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
      '2')
    Left = 310
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 276
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 58
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
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 37
    Top = 3
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
    Left = 105
    Top = 3
  end
  object QryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM '
      '  TIPORECEBDESEMB'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 71
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
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
    object QryTipoDesembCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object QryTipoDesembDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object QryTipoDesembANASINT: TStringField
      FieldName = 'ANASINT'
      Size = 1
    end
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
    Left = 139
    Top = 3
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
      '  IDTIPORDXCCXCONTA, PLACONTA'
      'FROM'
      '  TIPORDXCCXCONTA'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND'
      '  IDEMPRESA = :IDEMPRESA'
      '')
    ValidateWithMask = True
    Left = 182
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object QryValidaIDTIPORDXCCXCONTA: TFloatField
      FieldName = 'IDTIPORDXCCXCONTA'
      Origin = 'TIPORDXCCXCONTA.IDTIPORDXCCXCONTA'
    end
    object QryValidaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
  end
  object QrySel: TwwQuery
    CachedUpdates = True
    BeforePost = QrySelBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.IDTIPORDXCCXCONTA,'
      '  T.CODCENTROCUSTO,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.IDPESSOA,'
      '  T.PLANO,'
      '  T.PLACONTA,'
      '  T.IDEMPRESA,'
      '  T.IDPROGRAMA,'
      '  C.NOME,'
      '  C.STATUSGRUPOCDC'
      'FROM'
      '  TIPORDXCCXCONTA T, CENTCUST C'
      'WHERE'
      '  T.RECPAG = :RECPAG AND'
      '  T.IDPESSOA = :IDPESSOA AND'
      '  RTRIM(T.CODTIPRECDES) = :CODTIPRECDES AND'
      '  RTRIM(T.PLANO) = :PLANO AND'
      '  RTRIM(T.PLACONTA) = :PLACONTA AND'
      '  T.IDPESSOA = C.IDEMPRESA AND'
      '  T.CODCENTROCUSTO = C.CODCENTROCUSTO'
      'ORDER BY'
      '  T.CODCENTROCUSTO,'
      '  C.NOME')
    UpdateObject = UpdSel
    ValidateWithMask = True
    Left = 150
    Top = 341
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
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
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
    UpdateObject = UpdAll
    ValidateWithMask = True
    Left = 221
    Top = 340
  end
  object DsSel: TwwDataSource
    AutoEdit = False
    DataSet = QrySel
    Left = 171
    Top = 341
  end
  object UpdSel: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORDXCCXCONTA'
      'set'
      '  IDTIPORDXCCXCONTA = :IDTIPORDXCCXCONTA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    InsertSQL.Strings = (
      'insert into TIPORDXCCXCONTA'
      
        '  (IDTIPORDXCCXCONTA, CODCENTROCUSTO, CODTIPRECDES, RECPAG, IDPE' +
        'SSOA, PLANO, '
      '   PLACONTA, IDEMPRESA, IDPROGRAMA)'
      'values'
      
        '  (:IDTIPORDXCCXCONTA, :CODCENTROCUSTO, :CODTIPRECDES, :RECPAG, ' +
        ':IDPESSOA, '
      '   :PLANO, :PLACONTA, :IDEMPRESA, :IDPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from TIPORDXCCXCONTA'
      'where'
      '  IDTIPORDXCCXCONTA = :OLD_IDTIPORDXCCXCONTA')
    Left = 201
    Top = 341
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
    Left = 288
    Top = 340
  end
  object DsAll: TwwDataSource
    AutoEdit = False
    DataSet = QryAll
    Left = 259
    Top = 340
  end
  object QryPrograma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER' +
        ' BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 286
    Top = 158
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
end
