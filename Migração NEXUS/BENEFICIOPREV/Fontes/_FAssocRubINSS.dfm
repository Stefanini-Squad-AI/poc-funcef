inherited FrmAssocRubINSS: TFrmAssocRubINSS
  Left = 126
  Top = 258
  HelpContext = 160088
  BorderStyle = bsSingle
  Caption = 'Associação de Rubricas do INSS'
  ClientHeight = 348
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 309
    object sbtnAssocia: TSpeedButton
      Left = 368
      Top = 93
      Width = 27
      Height = 26
      Hint = 'Associar rubrica selecionada'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaClick
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 368
      Top = 122
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
      Left = 368
      Top = 152
      Width = 27
      Height = 26
      Hint = 'Desativar rubrica selecionada'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 368
      Top = 181
      Width = 27
      Height = 26
      Hint = 'Desativar todas as rubricas'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object dbgrdRubAssoc: TwwDBGrid
      Left = 9
      Top = 31
      Width = 352
      Height = 266
      Selected.Strings = (
        'FLGRUBCENTRAL'#9'10'#9'Centraliza'
        'CODPROVDESC'#9'15'#9'Cód. Fundação'
        'RUBRICAINSS'#9'10'#9'Cód. INSS'
        'DESCRPROVDESC'#9'40'#9'Descrição'
        'IDRUBRICA'#9'10'#9'Cód. Interno')
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
      Left = 8
      Top = 8
      Width = 353
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
        Left = 327
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
      Left = 400
      Top = 8
      Width = 353
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
        Left = 327
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
      Left = 401
      Top = 31
      Width = 352
      Height = 266
      Selected.Strings = (
        'CODPROVDESC'#9'15'#9'Cód Fundação'
        'DESCRPROVDESC'#9'40'#9'Descrição'
        'IDPROVENTO'#9'10'#9'Cód. Fundação')
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
      Left = 212
      Top = 171
      Width = 337
      Height = 131
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object bbtnConfirmar: TBitBtn
        Left = 160
        Top = 96
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
        Top = 96
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
        Width = 333
        Height = 87
        Align = alTop
        Caption = ' Associação '
        TabOrder = 2
        object Label2: TLabel
          Left = 16
          Top = 26
          Width = 96
          Height = 13
          Caption = 'Rubrica do INSS'
        end
        object edtRubINSS: TEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object cboxRubCentral: TCheckBox
          Left = 168
          Top = 36
          Width = 152
          Height = 17
          Caption = 'Rubrica Centralizadora'
          TabOrder = 1
          Visible = False
        end
        object chkConstaExtrato: TCheckBox
          Left = 168
          Top = 12
          Width = 152
          Height = 17
          Caption = 'Consta no Extrato'
          TabOrder = 2
          Visible = False
        end
        object chkRateioPlano: TCheckBox
          Left = 168
          Top = 60
          Width = 152
          Height = 17
          Caption = 'Rateio por Plano'
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 595
      DockPos = 595
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 994
    Top = 16
  end
  object dsyRubAssoc: TwwDataSource
    DataSet = qryRubAssoc
    Left = 96
    Top = 168
  end
  object dsRubNaoAssoc: TwwDataSource
    DataSet = qryRubNaoAssoc
    Left = 676
    Top = 194
  end
  object qryRubAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      R.IDRUBRICA,'
      '      R.RUBRICAINSS,'
      #9'   PD.DESCRPROVDESC,'
      '      PD.CODPROVDESC,'
      #9'   NVL(R.FLGRUBCENTRAL,0) FLGRUBCENTRAL'
      'FROM   RUBRICAXINSS R, PROVDESC PD'
      'WHERE  R.IDRUBRICA = PD.IDPROVENTO'
      'ORDER BY PD.CODPROVDESC'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGRUBCENTRAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 96
    Top = 123
  end
  object qryRubNaoAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, CODPROVDESC, DESCRICAO, DESCRPROVDESC'
      'FROM PROVDESC'
      'WHERE FLGTPRUBRICA LIKE '#39'%B%'#39
      '  AND IDPROVENTO NOT IN (SELECT IDRUBRICA FROM RUBRICAXINSS)'
      'ORDER BY CODPROVDESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 673
    Top = 149
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    ValidateWithMask = True
    Left = 309
    Top = 98
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
    Left = 288
    Top = 40
  end
  object pmCentraliza: TPopupMenu
    Left = 240
    Top = 112
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
end
