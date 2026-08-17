inherited frmCadRecDesXAgregMT: TfrmCadRecDesXAgregMT
  Left = 89
  Top = 85
  Caption = 'Tipo de Recebimento x Impostos Agregados'
  ClientHeight = 459
  ClientWidth = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 373
    inherited dbGrd: TwwDBGrid [0]
      Top = 133
      Width = 633
      Height = 239
      Selected.Strings = (
        'DESCCUSTAGREG'#9'28'#9'Imposto Associado'
        'NOME'#9'27'#9'Centro de Custos'
        'DESCPROGRAMA'#9'27'#9'Programa')
    end
    inherited pnlControles: TPanel [1]
      Top = 133
      Width = 633
      Height = 239
      BevelWidth = 30
      object PnlCtrls: TPanel
        Left = 297
        Top = 0
        Width = 32
        Height = 239
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object BtnIncluiDesemb: TSpeedButton
          Left = 4
          Top = 28
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
          Top = 60
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
        object BtnExcluiAllDesembAssoc: TSpeedButton
          Left = 4
          Top = 92
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
        object BtnExcluiDesembAssoc: TSpeedButton
          Left = 4
          Top = 124
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
      end
      object PnlDesemb: TPanel
        Left = 329
        Top = 0
        Width = 295
        Height = 239
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 1
        object PnlTitDesemb: TPanel
          Left = 1
          Top = 1
          Width = 293
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
          Width = 293
          Height = 211
          Selected.Strings = (
            'DESCCUSTAGREG'#9'36'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsCdsImpAgreg
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 239
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 2
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 295
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
          TabOrder = 0
        end
        object wwDBGrid1: TwwDBGrid
          Left = 1
          Top = 27
          Width = 295
          Height = 211
          Selected.Strings = (
            'DESCCUSTAGREG'#9'28'#9'Imposto Associado'
            'NOME'#9'27'#9'Centro de Custos'
            'DESCPROGRAMA'#9'27'#9'Programa')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
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
    object panFiltro: TPanel
      Left = 1
      Top = 1
      Width = 633
      Height = 132
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
        LookupTable = CdsTipoRD
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
      end
      object CmbCentCusto: TCMDBLookupCombo
        Left = 6
        Top = 58
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'
          'CODEXTERNO'#9'10'#9'Código'#9'F'
          'STATUSGRUPOCDC'#9'1'#9'Status'#9'F')
        LookupTable = CdsCentCust
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
        OnCloseUp = CmbCentCustoCloseUp
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
        LookupTable = CdsPrograma
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
        OnCloseUp = CmbProgramaCloseUp
      end
    end
  end
  inherited Dock972: TDock97
    Width = 635
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 81
        Caption = '&Relacionar'
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 81
        Width = 72
        Caption = '&Relacionar'
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 213
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 153
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ds: TwwDataSource
    Left = 206
    Top = 255
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
  end
  inherited Cds: TCMClientDataSet
    Left = 236
    Top = 255
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RD.DESCRICAO'
      'CC.NOME'
      'P.DESCPROGRAMA'
      'C.DESCCUSTAGREG')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Recebimento / Desembolso'
      'Centro Custo'
      'Programa'
      'Imposto')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPRECDESXTIPAGRE T'
      'TIPOAGRE C'
      'PROGRAMA P'
      'CENTCUST CC'
      'TIPORECEBDESEMB RD')
    CamposChave.Strings = (
      'T.CODTIPRECDES'
      'T.CODCENTROCUSTO'
      'T.IDPROGRAMA')
    Filtro.Strings = (
      'C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG'
      'T.CODTIPRECDES = RD.CODTIPRECDES'
      'T.IDPROGRAMA = P.IDPROGRAMA(+)'
      'T.CODCENTROCUSTO = CC.CODCENTROCUSTO (+)'
      'RD.ATIVO = '#39'S'#39
      'RD.ANASINT = '#39'A'#39
      'RD.FLGCALCULAIMPOSTO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '30'
      '60'
      '60')
    Left = 368
    Top = 0
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 48
  end
  object CdsCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 96
  end
  object CdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 128
  end
  object DsCdsImpAgreg: TwwDataSource
    AutoEdit = False
    DataSet = CdsImpAgreg
    Left = 560
    Top = 248
  end
  object CdsImpAgreg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 248
  end
  object CMSqlParams1: TCMSqlParams
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
      '  C.DESCCUSTAGREG,'
      '  P.DESCPROGRAMA,'
      '  CC.NOME'
      'FROM'
      '  TIPRECDESXTIPAGRE T,'
      '  TIPOAGRE C,'
      '  PROGRAMA P,'
      '  CENTCUST CC'
      'WHERE'
      ' (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      ' AND (T.IDPROGRAMA = P.IDPROGRAMA(+))'
      ' AND (T.CODCENTROCUSTO = CC.CODCENTROCUSTO (+))'
      ''
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 109
    Top = 280
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT                               '
      '   C.IDEMPRESA,                      '
      '   C.IDPLANCENTCUST,                 '
      '   C.CODCENTROCUSTO,                 '
      '   C.CODEXTERNO,                     '
      '   C.NOME,                           '
      '   C.RESPONSAVEL,                    '
      '   C.IDUSUARIOINCLUSAO,              '
      '   C.IDUSUARIO,                      '
      '   C.CODREDUZIDO,                    '
      '   C.CODCORRESP,                     '
      '   C.STATUSGRUPOCDC,                 '
      '   C.ATIVO,                          '
      '   C.IDPROGRAMA'
      'FROM CENTCUST C  WHERE 1 = 2')
    ClientDataSet = CdsCentCust
    Left = 405
    Top = 92
  end
end
