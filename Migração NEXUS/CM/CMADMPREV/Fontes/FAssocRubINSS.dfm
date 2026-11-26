inherited FrmAssocRubINSS: TFrmAssocRubINSS
  Left = 323
  Top = 112
  HelpContext = 160088
  BorderStyle = bsSingle
  Caption = 'Associação de Rubricas do INSS.'
  ClientHeight = 422
  ClientWidth = 1222
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1222
    Height = 383
    object sbtnAssocia: TSpeedButton
      Left = 725
      Top = 77
      Width = 27
      Height = 26
      Hint = 'Associar rubrica selecionada'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaClick
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 725
      Top = 106
      Width = 27
      Height = 26
      Hint = 'Associar todas as rubricas'
      Caption = '<<'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 725
      Top = 136
      Width = 27
      Height = 26
      Hint = 'Desativar rubrica selecionada'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 725
      Top = 165
      Width = 27
      Height = 26
      Hint = 'Desativar todas as rubricas'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object dbgrdRubAssoc: TwwDBGrid
      Left = 3
      Top = 39
      Width = 718
      Height = 322
      Selected.Strings = (
        'IDRUBRICA'#9'10'#9'Rubrica Interna'
        'RUBRICAINSS'#9'10'#9'Rubrica Desenbolso'
        'DESCDESEMB'#9'40'#9'Descrição Desenbolso'
        'DESCRICAO'#9'60'#9'Descrição'#9'F'
        'CODPROVDESC'#9'15'#9'Rubrica Funcef'
        'FLGRUBCENTRAL'#9'10'#9'Centraliza'
        'FLGCONSTAEXTRATO'#9'10'#9'Consta Extrato')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsyRubAssoc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = pmCentraliza
      ReadOnly = True
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
    object Panel10: TPanel
      Left = 3
      Top = 8
      Width = 718
      Height = 24
      Caption = 'Rubricas Associadas'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object BitBtn1: TBitBtn
        Left = 689
        Top = 2
        Width = 26
        Height = 23
        Hint = 'Procurar participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
    object Panel1: TPanel
      Left = 755
      Top = 8
      Width = 463
      Height = 24
      Caption = 'Rubricas Não Associadas'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object bbtnProcurar: TBitBtn
        Left = 434
        Top = 2
        Width = 26
        Height = 23
        Hint = 'Procurar participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
    object dbgrdRubNaoAssoc: TwwDBGrid
      Left = 756
      Top = 31
      Width = 463
      Height = 322
      Selected.Strings = (
        'CODPROVDESC'#9'15'#9'Rubrica FUNCEF'#9'F'
        'IDPROVENTO'#9'10'#9'Cód. Interno'#9'F'
        'DESCRPROVDESC'#9'40'#9'Descrição'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsRubNaoAssoc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
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
      IndicatorColor = icBlack
    end
    object pnlInforma: TPanel
      Left = 140
      Top = 139
      Width = 413
      Height = 166
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object bbtnConfirmar: TBitBtn
        Left = 160
        Top = 128
        Width = 80
        Height = 25
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 240
        Top = 128
        Width = 80
        Height = 25
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object gboxTexto: TGroupBox
        Left = 2
        Top = 2
        Width = 409
        Height = 124
        Align = alTop
        Caption = ' Associação '
        TabOrder = 2
        object Label2: TLabel
          Left = 16
          Top = 26
          Width = 162
          Height = 13
          Caption = 'Rubrica Reembolso do INSS'
        end
        object Label23: TLabel
          Left = 16
          Top = 66
          Width = 168
          Height = 13
          Caption = 'Rubrica Desembolso do INSS'
        end
        object Label1: TLabel
          Left = 216
          Top = 82
          Width = 143
          Height = 13
          Caption = 'Tipo de Rubrica do INSS'
        end
        object edtRubINSS: TEdit
          Left = 16
          Top = 40
          Width = 153
          Height = 21
          TabOrder = 0
        end
        object cboxRubCentral: TCheckBox
          Left = 216
          Top = 36
          Width = 152
          Height = 17
          Caption = 'Rubrica Central'
          TabOrder = 1
        end
        object chkConstaExtrato: TCheckBox
          Left = 216
          Top = 12
          Width = 152
          Height = 17
          Caption = 'Consta Extrato'
          TabOrder = 2
        end
        object chkRateioPlano: TCheckBox
          Left = 216
          Top = 60
          Width = 152
          Height = 17
          Caption = 'Rateio por Plano'
          TabOrder = 3
        end
        object cbdRubDesembINSS: TwwDBLookupCombo
          Left = 16
          Top = 82
          Width = 153
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryRubDesembINSS
          LookupField = 'CODPROVDESC'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object cbdTipoRubricaINSS: TwwDBLookupCombo
          Left = 216
          Top = 98
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryTipoRubricaINSS
          LookupField = 'DESCRICAOTIPORUBRICAXINSS'
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 1222
    inherited tb97Fundo: TToolbar97
      Left = 744
      DockPos = 744
      inherited sep1: TToolbarSep97
        Left = 239
      end
      inherited bbtnSair: TBitBtn
        Left = 80
        Width = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 160
        Width = 79
      end
      object bbtnConfirmaComit: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = 'Ok'
        TabOrder = 2
        OnClick = bbtnConfirmaComitClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 418
    Top = 72
  end
  object dsyRubAssoc: TwwDataSource
    DataSet = qryRubAssoc
    Left = 56
    Top = 136
  end
  object dsRubNaoAssoc: TwwDataSource
    DataSet = qryRubNaoAssoc
    Left = 604
    Top = 114
  end
  object qryRubAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       R.IDRUBRICA,'
      '       R.RUBRICAINSS,'
      '       PD.DESCRICAO,'
      '       PD.IDPROVENTO,'
      '       NVL(R.FLGCONSTAEXTRATO,0) FLGCONSTAEXTRATO, '
      '       NVL(R.FLGRUBCENTRAL,0) FLGRUBCENTRAL,'
      '       NVL(R.FLGRATEIOPLANO,0) FLGRATEIOPLANO,'
      '       T.DESCRICAOTIPORUBRICAXINSS,                       '
      '       R.RUBRICAINSSDESEMB,'
      '       PRODESEMB.Descrprovdesc as DESCDESEMB,'
      '       pro.DESCRPROVDESC,'
      '       PD.CODPROVDESC,'
      '       R.FLGTIPORUBRICAXINSS    '
      
        '  FROM RUBRICAXINSS R, PROVDESC PD, CM.PROVDESC PRO, PROVDESC PR' +
        'ODESEMB, TIPORUBRICAXINSS T'
      ' WHERE R.IDRUBRICA = PD.IDPROVENTO'
      '   AND TRIM(R.RUBRICAINSS) = TRIM(PRO.CODPROVDESC)'
      
        '   AND TRIM(R.RUBRICAINSSDESEMB) = TRIM(PRODESEMB.CODPROVDESC (+' +
        '))'
      '   AND (R.FLGTIPORUBRICAXINSS = T.FLGTIPORUBRICAXINSS (+))'
      'ORDER BY PD.CODPROVDESC   ')
    ControlType.Strings = (
      'FLGRUBCENTRAL;CheckBox;1;0'
      'FLGCONSTAEXTRATO;CheckBox;1;0'
      'FLGRATEIOPLANO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 56
    Top = 83
  end
  object qryRubNaoAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, CODPROVDESC, DESCRICAO, DESCRPROVDESC'
      'FROM PROVDESC'
      'WHERE FLGTPRUBRICA LIKE '#39'%B%'#39
      ' AND CODFONTEPAGADORA =  2'
      '  AND IDPROVENTO NOT IN (SELECT IDRUBRICA FROM RUBRICAXINSS)'
      'ORDER BY CODPROVDESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 513
    Top = 93
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    ValidateWithMask = True
    Left = 309
    Top = 90
  end
  object MSRubNaoAssoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC'
      'PROVDESC.IDPROVENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Cód. Fundação'
      'Descrição'
      'Cód. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Filtro.Strings = (
      'FLGTPRUBRICA LIKE '#39'%B%'#39
      'IDPROVENTO NOT IN (SELECT IDRUBRICA FROM RUBRICAXINSS)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 688
    Top = 40
  end
  object MSRubAssoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.CODPROVDESC'
      'RUBRICAXINSS.RUBRICAINSS'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Cód Fundação'
      'Cód. INSS'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXINSS')
    CamposChave.Strings = (
      'PROVDESC.CODPROVDESC')
    Filtro.Strings = (
      'PROVDESC.IDPROVENTO=RUBRICAXINSS.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 336
    Top = 40
  end
  object pmCentraliza: TPopupMenu
    Left = 240
    Top = 72
    object Centralizadora1: TMenuItem
      Caption = 'Alterar'
      OnClick = Centralizadora1Click
    end
    object AssociaNovaRubricadoINSS1: TMenuItem
      Caption = 'Associa Nova Rubrica do INSS'
      OnClick = AssociaNovaRubricadoINSS1Click
    end
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 184
    Top = 73
  end
  object qryRubDesembINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select codprovdesc from provdesc '
      'where codfontepagadora = 2'
      ' and codprovdesc <> '#39#39#39#39
      'order by codprovdesc')
    ValidateWithMask = True
    Left = 579
    Top = 276
  end
  object qryTipoRubricaINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CM.TIPORUBRICAXINSS')
    ValidateWithMask = True
    Left = 529
    Top = 181
  end
end
