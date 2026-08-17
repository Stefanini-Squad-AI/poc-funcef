inherited frmCadRecDesXAgreg: TfrmCadRecDesXAgreg
  Left = 259
  Top = 259
  Caption = 'Tipo de Recebimento x Impostos Agregados'
  ClientHeight = 414
  ClientWidth = 672
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 328
    object PnlCadastro: TPanel
      Left = 5
      Top = 5
      Width = 297
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 0
      object GrdTipoDesembAssoc: TwwDBGrid
        Left = 0
        Top = 150
        Width = 297
        Height = 168
        Selected.Strings = (
          'DESCCUSTAGREG'#9'32'#9'Descrição'#9'No')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 124
        Width = 297
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Impostos/Agregados Associados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PblRamoForn: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 124
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 6
          Top = 2
          Width = 122
          Height = 13
          Caption = 'Tipos de Desembolso'
        end
        object Label2: TLabel
          Left = 6
          Top = 42
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Label3: TLabel
          Left = 6
          Top = 82
          Width = 54
          Height = 13
          Caption = 'Programa'
        end
        object CmbTipoDesemb: TCMDBLookupCombo
          Left = 6
          Top = 18
          Width = 289
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'CODTIPRECDES'#9'15'#9'Código'
            'ANASINT'#9'1'#9'A/S')
          LookupTable = qryTipoRD
          LookupField = 'CODTIPRECDES'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmbTipoDesembCloseUp
          OnExit = CmbTipoDesembExit
        end
        object CmbCentCusto: TCMDBLookupCombo
          Left = 6
          Top = 58
          Width = 289
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Código'
            'STATUSGRUPOCDC'#9'1'#9'S')
          LookupTable = QryCentCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          DropDownWidth = 400
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmbTipoDesembCloseUp
          OnExit = CmbCentCustoExit
        end
        object CmbPrograma: TCMDBLookupCombo
          Left = 6
          Top = 98
          Width = 289
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPROGRAMA'#9'40'#9'Descrição'
            'CODPROGRAMA'#9'2'#9'Cód')
          LookupTable = QryPrograma
          LookupField = 'IDPROGRAMA'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          DropDownWidth = 400
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmbTipoDesembCloseUp
          OnExit = CmbProgramaExit
        end
      end
    end
    object PnlCtrls: TPanel
      Left = 302
      Top = 5
      Width = 32
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object BtnIncluiDesemb: TSpeedButton
        Left = 4
        Top = 124
        Width = 25
        Height = 25
        Hint = 'Selciona'
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
        OnClick = BtnIncluiDesembClick
      end
      object BtnIncluiTodosDesemb: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
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
        OnClick = BtnIncluiTodosDesembClick
      end
      object BtnExcluiDesembAssoc: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
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
        OnClick = BtnExcluiDesembAssocClick
      end
      object BtnExcluiAllDesembAssoc: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Exclui'
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
        OnClick = BtnExcluiAllDesembAssocClick
      end
    end
    object PnlDesemb: TPanel
      Left = 334
      Top = 5
      Width = 333
      Height = 318
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 2
      object PnlTitDesemb: TPanel
        Left = 1
        Top = 1
        Width = 331
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Impostos/Agregados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdTipDesemb: TwwDBGrid
        Left = 1
        Top = 27
        Width = 331
        Height = 290
        Selected.Strings = (
          'DESCCUSTAGREG'#9'36'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsImpAgreg
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock972: TDock97
    Width = 672
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Width = 84
        Caption = '&Relacionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 204
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 144
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 672
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        ModalResult = 5
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  T.IDTIPRECDESXAGRE,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.IDPESSOA,'
      '  T.CODTIPOCUSTAGREG,'
      '  T.CODCENTROCUSTO,'
      '  T.IDEMPRESA,'
      '  T.IDPROGRAMA,'
      '  C.DESCCUSTAGREG'
      'FROM'
      '  TIPRECDESXTIPAGRE T,'
      '  TIPOAGRE C'
      'WHERE'
      ' (RTRIM(T.CODTIPRECDES) = :CODTIPRECDES) AND'
      ' (T.RECPAG = :RECPAG) AND'
      ' (T.IDPESSOA  = :IDPESSOA) AND'
      ' (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      'ORDER BY'
      '  C.DESCCUSTAGREG'
      ''
      '')
    Left = 155
    Top = 249
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
    object qryDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 32
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryIDTIPRECDESXAGRE: TFloatField
      FieldName = 'IDTIPRECDESXAGRE'
      Visible = False
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 475
    Top = 11
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPRECDESXTIPAGRE'
      'set'
      '  IDTIPRECDESXAGRE = :IDTIPRECDESXAGRE,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDTIPRECDESXAGRE = :OLD_IDTIPRECDESXAGRE')
    InsertSQL.Strings = (
      'insert into TIPRECDESXTIPAGRE'
      
        '  (IDTIPRECDESXAGRE, CODTIPRECDES, RECPAG, IDPESSOA, CODTIPOCUST' +
        'AGREG, '
      '   CODCENTROCUSTO, IDEMPRESA, IDPROGRAMA)'
      'values'
      
        '  (:IDTIPRECDESXAGRE, :CODTIPRECDES, :RECPAG, :IDPESSOA, :CODTIP' +
        'OCUSTAGREG, '
      '   :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from TIPRECDESXTIPAGRE'
      'where'
      '  IDTIPRECDESXAGRE = :OLD_IDTIPRECDESXAGRE')
    Left = 85
    Top = 249
  end
  inherited MontaSelect: TMontaSelect
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
      'S'
      'N'
      'S')
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
  end
  inherited ds: TwwDataSource
    Left = 121
    Top = 249
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 58
  end
  object UpdImpAgreg: TUpdateSQL
    Left = 401
    Top = 150
  end
  object QryImpAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '   TIPOAGRE.DESCCUSTAGREG,'
      '   TIPOAGRE.CODTIPOCUSTAGREG'
      'FROM'
      '   TIPOAGRE,'
      '   TIPOALTERADOR'
      'WHERE'
      '   ( :CODTIPRECDES <> '#39'0'#39' ) AND'
      '   ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND'
      '   ( TIPOAGRE.CODTRATFISCD IN ('#39'8'#39','#39'9'#39','#39'A'#39','#39'B'#39') ) AND'
      '   ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN'
      '     ( SELECT'
      '          CODTIPOCUSTAGREG'
      '       FROM'
      '          TIPRECDESXTIPAGRE'
      '       WHERE'
      '          (RECPAG = :RECPAG) AND'
      '          (RTRIM(CODTIPRECDES) = :CODTIPRECDES) AND'
      '          (IDPESSOA = :IDPESSOA)))'
      '')
    UpdateObject = UpdImpAgreg
    ValidateWithMask = True
    Left = 479
    Top = 206
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
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryImpAgregDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 36
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object QryImpAgregCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
  end
  object DsImpAgreg: TwwDataSource
    AutoEdit = False
    DataSet = QryImpAgreg
    Left = 525
    Top = 158
  end
  object qryTipoRD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND'
      '  (RECPAG = :RECPAG)  AND'
      '  (ANASINT = '#39'A'#39') AND'
      '  (FLGCALCULAIMPOSTO = '#39'S'#39')'
      'ORDER BY'
      '   CODTIPRECDES, DESCRICAO')
    ValidateWithMask = True
    Left = 225
    Top = 251
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryTipoRDDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryTipoRDCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryTipoRDANASINT: TStringField
      DisplayLabel = 'A/S'
      DisplayWidth = 1
      FieldName = 'ANASINT'
      Size = 1
    end
  end
  object QryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODCENTROCUSTO, STATUSGRUPOCDC, NOME'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  IDEMPRESA = :IDEMPRESA'
      'ORDER BY'
      '  CODCENTROCUSTO')
    ValidateWithMask = True
    Left = 189
    Top = 250
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object QryCentCustNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object QryCentCustCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object QryCentCustSTATUSGRUPOCDC: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'CENTCUST.STATUSGRUPOCDC'
      Size = 1
    end
  end
  object QryPrograma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER' +
        ' BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 261
    Top = 252
    object QryProgramaDESCPROGRAMA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object QryProgramaCODPROGRAMA: TStringField
      DisplayLabel = 'Cód'
      DisplayWidth = 2
      FieldName = 'CODPROGRAMA'
      Size = 2
    end
    object QryProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
  end
end
