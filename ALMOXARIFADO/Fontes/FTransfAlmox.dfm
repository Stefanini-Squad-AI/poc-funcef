inherited FrmTransfAlmox: TFrmTransfAlmox
  Left = 60
  Top = 108
  Caption = 'Cadastro de Transferência entre Almoxarifados'
  ClientHeight = 412
  ClientWidth = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 651
    Height = 326
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object plnTransf: TPanel
      Left = 5
      Top = 60
      Width = 641
      Height = 261
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnAdiciona: TSpeedButton
        Left = 300
        Top = 106
        Width = 39
        Height = 34
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btnAdicionaClick
      end
      object BtnRemove: TSpeedButton
        Left = 300
        Top = 157
        Width = 39
        Height = 34
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = BtnRemoveClick
      end
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 637
        Height = 34
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Seleção de Almoxarifados para Transferência'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object grdTranf: TwwDBGrid
        Left = 350
        Top = 44
        Width = 279
        Height = 206
        Selected.Strings = (
          'DESCALMOX'#9'40'#9'Utilizar para Transferir')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds
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
        OnDblClick = grdTranfDblClick
        IndicatorColor = icBlack
      end
      object GrdTodos: TwwDBGrid
        Left = 10
        Top = 44
        Width = 279
        Height = 206
        Selected.Strings = (
          'DESCALMOX'#9'40'#9'Almoxarifados Existentes')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsAlmox
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnDblClick = GrdTodosDblClick
        IndicatorColor = icBlack
      end
    end
    object dblcAlmox: TCMDBLookupCombo
      Left = 15
      Top = 27
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCALMOX'#9'40'#9'Descrição'
        'CODALMOXARIFADO'#9'10'#9'Código')
      LookupTable = qryCombo
      LookupField = 'CODALMOXARIFADO'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 651
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Transferir'
        Glyph.Data = {
          76030000424D7603000000000000360000002800000011000000100000000100
          1800000000004003000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0C0C0000000000000
          000000C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0C0C0C0
          C000C0C0C0C0C0C0C0C0C00000000000FF0000FF0000FFC0C0C0C0C0C0C0C0C0
          00000000FFFF00FFFF00FFFF008080000000C0C0C000C0C0C0C0C0C0C0C0C000
          00FF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00FFFF
          008080000000C0C0C000C0C0C0C0C0C0C0C0C00000FF000000C0C0C0C0C0C0C0
          C0C0C0C0C0000000008080008080008080008080008080000000C0C0C000C0C0
          C00000000000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0000000FFFFFFFF
          FFFFFFFFFFFFFFFF000000000000C0C0C000C0C0C0C0C0C00000000000FF0000
          FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFFFFFFFFFFFFFF00
          0000C0C0C000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000000000000000000000000000C0C0C000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0000000000000000000000000
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
          C000C0C0C0C0C0C000000000FFFF00FFFF00FFFF000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0FF0000FF0000000000C0C0C0C0C0C000C0C0C0C0C0C000000000
          FFFF00FFFF00FFFF008080000000C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000
          FF0000000000C0C0C000C0C0C0C0C0C000000000FFFF00FFFF00FFFF00808000
          0000C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000C0C0C0C0C0C0C0C0C000C0C0
          C0000000008080008080008080008080000000000000C0C0C0C0C0C0C0C0C0C0
          C0C0000000FF0000C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0000000FFFFFFFFFF
          FFFFFFFF008080000000C0C0C0C0C0C0FF0000FF0000FF0000000000C0C0C0C0
          C0C0C0C0C000C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0
          C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C000}
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
    Top = 373
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 481
      DockPos = 561
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 314
      DockPos = 345
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      T.CODALMOXARIFADO, '
      '      T.CODALMOXPERMITE,'
      '      A.DESCALMOX'
      'FROM'
      '     TRANSFALMOX T,'
      '     ALMOX A'
      'WHERE'
      '          (T.CODALMOXARIFADO = :pCODALMOX)'
      '  AND(T.CODALMOXPERMITE = A.CODALMOXARIFADO)'
      ''
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
    object qryDESCALMOX: TStringField
      DisplayLabel = 'Utilizar para Transferir'
      DisplayWidth = 40
      FieldName = 'DESCALMOX'
      Origin = 'ALMOX.DESCALMOX'
      Size = 40
    end
    object qryCODALMOXPERMITE: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALMOXPERMITE'
      Origin = 'TRANSFALMOX.CODALMOXPERMITE'
      Visible = False
    end
    object qryCODALMOXARIFADO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALMOXARIFADO'
      Origin = 'TRANSFALMOX.CODALMOXARIFADO'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 635
    Top = 65523
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TRANSFALMOX'
      'set'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  CODALMOXPERMITE = :CODALMOXPERMITE'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  CODALMOXPERMITE = :OLD_CODALMOXPERMITE')
    InsertSQL.Strings = (
      'insert into TRANSFALMOX'
      '  (CODALMOXARIFADO, CODALMOXPERMITE)'
      'values'
      '  (:CODALMOXARIFADO, :CODALMOXPERMITE)')
    DeleteSQL.Strings = (
      'delete from TRANSFALMOX'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  CODALMOXPERMITE = :OLD_CODALMOXPERMITE')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ALMOX.DESCALMOX')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'ALMOX')
    CamposChave.Strings = (
      'ALMOX.CODALMOXARIFADO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryAlmox: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          CODALMOXARIFADO,'
      '          DESCALMOX'
      'FROM'
      '          ALMOX'
      'WHERE'
      '          ( IDPESSOA =  :pIDPESS)'
      
        ' AND ( CODALMOXARIFADO NOT  IN (  SELECT CODALMOXPERMITE FROM TR' +
        'ANSFALMOX  '
      
        '                                                                ' +
        '  WHERE  CODALMOXARIFADO = :pCODALMOX1 ) )'
      ' AND (CODALMOXARIFADO <> :pCODALMOX2 )'
      ' '
      'ORDER BY   DESCALMOX')
    UpdateObject = updAlmox
    ValidateWithMask = True
    Left = 528
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX2'
        ParamType = ptUnknown
      end>
  end
  object dsAlmox: TwwDataSource
    DataSet = qryAlmox
    Left = 573
    Top = 10
  end
  object updAlmox: TUpdateSQL
    ModifySQL.Strings = (
      'update ALMOX'
      'set'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  DESCALMOX = :DESCALMOX'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    InsertSQL.Strings = (
      'insert into ALMOX'
      '  (CODALMOXARIFADO, DESCALMOX)'
      'values'
      '  (:CODALMOXARIFADO, :DESCALMOX)')
    DeleteSQL.Strings = (
      'delete from ALMOX'
      'where'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    Left = 471
    Top = 8
  end
  object qryCombo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          CODALMOXARIFADO,'
      '          DESCALMOX'
      'FROM'
      '          ALMOX'
      'WHERE'
      '         ( IDPESSOA = :pIDPESS)'
      'ORDER BY   DESCALMOX'
      ''
      '')
    ValidateWithMask = True
    Left = 450
    Top = 59
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryComboDESCALMOX: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCALMOX'
      Size = 40
    end
    object qryComboCODALMOXARIFADO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODALMOXARIFADO'
    end
  end
end
