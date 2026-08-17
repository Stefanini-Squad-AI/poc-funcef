inherited FrmUsuxCCusto: TFrmUsuxCCusto
  Left = 100
  Top = 39
  HelpContext = 1130001
  Caption = 'Usuários X Centro de Custo'
  ClientHeight = 410
  ClientWidth = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 324
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object plnTransf: TPanel
      Left = 5
      Top = 66
      Width = 588
      Height = 253
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnAdiciona: TSpeedButton
        Left = 275
        Top = 97
        Width = 39
        Height = 34
        Hint = 'Adiciona'
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
        Left = 275
        Top = 140
        Width = 39
        Height = 34
        Hint = 'Remove'
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
      object btnAdicionaTudo: TSpeedButton
        Left = 275
        Top = 54
        Width = 39
        Height = 34
        Hint = 'Adiciona Todas'
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
        OnClick = btnAdicionaTudoClick
      end
      object btnRemoveTudo: TSpeedButton
        Left = 275
        Top = 182
        Width = 39
        Height = 34
        Hint = 'Remove Todos'
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
      object grdTranf: TwwDBGrid
        Left = 318
        Top = 39
        Width = 261
        Height = 205
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnDblClick = grdTranfDblClick
        IndicatorColor = icBlack
      end
      object grgCCusto: TwwDBGrid
        Left = 8
        Top = 39
        Width = 262
        Height = 206
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsCCusto
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnDblClick = grgCCustoDblClick
        IndicatorColor = icBlack
      end
      object Panel1: TPanel
        Left = 8
        Top = 9
        Width = 263
        Height = 28
        BevelInner = bvLowered
        Caption = 'Centros de Custo não Habilitados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 317
        Top = 10
        Width = 262
        Height = 27
        BevelInner = bvLowered
        Caption = 'Centros de Custo Habilitados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object EdUsu: TEdit
      Left = 16
      Top = 32
      Width = 273
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 598
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atribuir'
        Glyph.Data = {
          16080000424D160800000000000036000000280000001F000000150000000100
          180000000000E007000000000000000000000000000000000000BCBCBCBDBEBE
          BCBEBE1F1F1FDEDE5D89891F000000000000000000E9E93EE9E93E0000000000
          003EE9E9891F89101084000000BEBEBEBEBEBE000000891F89891F89C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBCBEBE
          1F1F1FF4F41F7F7F00000000FFFF00FFFF00000000FFFF00000000FFFF000000
          00000000007F7F00FFFF000000000000891F89891F89000000000000C0C0C0C0
          C0C0808000808000C0C0C0C0C0C0808000808000C0C0C0000000BDBDBD3C3C3C
          98984BFFFF00000000FFFF00FFFF00FFFF00000000000000000000FFFF000000
          0000000000FFFF007F7F007F7FBFBFBF000000891F89000000BEBEBEC0C0C080
          8000C0C0C0C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          1414140000007F7F00FFFF00FFFF000000007F7F7FBFBFBF7F7F7F000000007F
          7F00FFFF00FFFF007F7FFFFFFFBFBFBF000000000000BEBEBEBEBEBEC0C0C080
          8000C0C0C0C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          1414140000007F7F00FFFF000000007F7F7FBFBFBF7F7F7FBFBFBF00000000FF
          FF00FFFF007F7FFFFFFFBFBFBFBFBFBF000000BEBEBEBEBEBEBEBEBEC0C0C080
          8000C0C0C0C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C0000000BDBDBDBCBCBC
          E8E8E80000000000000000007F7F7FBFBFBF7F7F7FBFBFBF00000000000000FF
          FF007F7FFFFFFF7F7F7F7F7F7F000000000000000000BEBEBEBEBEBEC0C0C0C0
          C0C0808000808000C0C0C0C0C0C0808000808000C0C0C0000000BDBDBDBDBDBD
          BDBDBDFFFFFF0000007F7F7FBFBFBF7F7F7F0000000000000000000000000000
          00007F7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BCBCBCBDBDBD
          4B4B4B0000000000000000007F7F7FBFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F
          7F000000BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          2F2F2F000000000000000000BFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F7F0000
          00000000BFBFBFFFFFFFFFFFFFFFFFFF7F7F7F000000000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C0000000BDBDBD2F2F2F
          2F2F2F0000000000000000007F7F7FBFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F
          7F000000BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0FF0000FF0000FF0000C0C0C0C0C0C0000000BDBDBD2F2F2F
          000000000000000000000000BFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F7FBFBF
          BF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE000000C0C0C0C0
          C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000C0C0C0000000BDBDBD2F2F2F
          000000000000000000BFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F
          7FBFBFBF000000FFFFFFFFFFFF7F0000FFFFFFFFFFFF000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C00000002F2F2F2F2F2F
          000000000000000000000000BFBFBF7F7F7FBFBFBF7F7F7F000000BFBFBFBFBF
          BF000000BFBFBFFFFFFFFFFFFF7F7F7F7F00007F7F7F000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C00000002F2F2F000000
          000000000000000000000000000000BFBFBF7F7F7FBFBFBF0000000000000000
          00BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C00000002F2F2F000000
          000000000000000000000000000000000000BFBFBF7F7F7FBFBFBF7F7F7F0000
          00007F7F007F7F000000FFFFFF000000FFFFFFFFFFFF000000000000C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C00000002F2F2F2F2F2F
          0000000000000000000000000000000000007F7F7FBFBFBF7F7F7FBFBFBF0000
          00007F7F007F7F00FFFF007F7F00FFFF007F7F007F7F00FFFF000000C0C0C0C0
          C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBD2F2F2F
          2F2F2F000000000000000000000000000000007F7F7F7F7FBFBFBF7F7F7F0000
          00007F7F00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF3EE9E9000000C0C0C0C0
          C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          2F2F2F0000000000000000000000000000000000000000000000000000000000
          00007F7F00FFFF00FFFF00FFFF00FFFF00FFFF3EE9E9000000BEBEBEC0C0C0FF
          0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          2F2F2F2F2F2F0000000000000000000000000000000000000000000000000000
          0000000000FFFF00FFFF00FFFF00FFFF3EE9E9000000BEBEBEBEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          BDBDBD2F2F2F2F2F2F2F2F2F0000000000000000000000000000000000000000
          00000000000000000000000000000000000000BEBEBEBEBEBEBEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000BDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBD2F2F2F000000000000000000000000000000BEBEBEBEBE
          BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000}
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 598
    inherited tb97Fundo: TToolbar97
      Left = 426
      DockPos = 426
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 258
      DockPos = 258
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '        UC.CODCENTROCUSTO,'
      '        CC.NOME,'
      '        UC.IDPESSOA,'
      '        UC.IDUSUARIO,'
      '        UC.IDEMPRESA'
      'FROM'
      '        USCCUSTO UC,'
      '        CENTCUST CC'
      'WHERE'
      '              (UC.IDUSUARIO =  :pIDUSU)'
      '     AND (UC.IDPESSOA  =  :pIDPESS)'
      '     AND (UC.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '     AND (UC.IDEMPRESA = CC.IDEMPRESA)'
      'ORDER BY CC.NOME')
    Left = 295
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'USCCUSTO.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'USCCUSTO.IDPESSOA'
      Visible = False
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'USCCUSTO.IDUSUARIO'
      Visible = False
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'USCCUSTO.IDEMPRESA'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update USCCUSTO'
      'set'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  RTRIM(CODCENTROCUSTO) = :OLD_CODCENTROCUSTO and'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into USCCUSTO'
      '  (IDEMPRESA, CODCENTROCUSTO, IDUSUARIO, IDPESSOA)'
      'values'
      '  (:IDEMPRESA, :CODCENTROCUSTO, :IDUSUARIO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from USCCUSTO'
      'where'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  RTRIM(CODCENTROCUSTO) = :OLD_CODCENTROCUSTO and'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 265
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'USUARIOSISTEMA.IDUSUARIO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 373
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 325
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object updCCusto: TUpdateSQL
    ModifySQL.Strings = (
      'update CENTCUST'
      'set'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  NOME = :NOME'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  IDEMPRESA = :OLD_IDEMPRESA')
    InsertSQL.Strings = (
      'insert into CENTCUST'
      '  (CODCENTROCUSTO, IDEMPRESA, NOME)'
      'values'
      '  (:CODCENTROCUSTO, :IDEMPRESA, :NOME)')
    DeleteSQL.Strings = (
      'delete from CENTCUST'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  IDEMPRESA = :OLD_IDEMPRESA')
    Left = 450
    Top = 3
  end
  object qryCCusto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODCENTROCUSTO,'
      '    IDEMPRESA,'
      '    NOME'
      'FROM'
      '    CENTCUST'
      'WHERE'
      '      (STATUSGRUPOCDC = '#39'A'#39')'
      '  AND (ATIVO ='#39'S'#39')'
      '  AND (IDEMPRESA = :pIDEMP)'
      '  AND (CODCENTROCUSTO NOT IN ( SELECT CODCENTROCUSTO'
      '                               FROM USCCUSTO'
      '                               WHERE  (IDUSUARIO = :pIDUSU)'
      
        '                                  AND (IDEMPRESA = :pIDEMP2 ) ) ' +
        ')'
      'ORDER BY NOME')
    UpdateObject = updCCusto
    ValidateWithMask = True
    Left = 504
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDEMP2'
        ParamType = ptUnknown
      end>
    object qryCCustoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCCustoCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryCCustoIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'CENTCUST.IDEMPRESA'
      Visible = False
    end
  end
  object dsCCusto: TwwDataSource
    AutoEdit = False
    DataSet = qryCCusto
    Left = 558
    Top = 3
  end
end
