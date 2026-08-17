inherited frmAssocRubricaIndivEvento: TfrmAssocRubricaIndivEvento
  Left = 229
  Top = 80
  HelpContext = 160113
  Caption = 
    'Associação de Rubricas Individuais Associadas na Ocorrência de E' +
    'ventos'
  ClientHeight = 445
  ClientWidth = 732
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 179
    Width = 732
    Height = 227
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 225
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbtnAssocia: TSpeedButton
        Left = 349
        Top = 72
        Width = 25
        Height = 26
        Hint = 'Associar contribuição selecionada'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 349
        Top = 102
        Width = 25
        Height = 26
        Hint = 'Associar todas as contribuições'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 349
        Top = 132
        Width = 25
        Height = 26
        Hint = 'Desativar Contribuição selecionada'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 349
        Top = 162
        Width = 25
        Height = 25
        Hint = 'Desativar todas as contribuições'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object Label10: TLabel
        Left = 383
        Top = 1
        Width = 247
        Height = 47
        AutoSize = False
        Caption = 'Rubricas  não Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object lblPlanPatro: TLabel
        Left = 8
        Top = 2
        Width = 283
        Height = 43
        AutoSize = False
        Caption = 'Rubricas por Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object btnProcProv: TBitBtn
        Left = 634
        Top = 1
        Width = 83
        Height = 30
        Hint = 'Procurar Rubrica'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnProcProvClick
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
      object dbgrdPlanPatro: TwwDBGrid
        Left = 6
        Top = 32
        Width = 331
        Height = 181
        Hint = 'Clique no botão da direita para Alterar Código'
        Selected.Strings = (
          'CODPROVDESC'#9'10'#9'Código'
          'NOME'#9'70'#9'Rubrica'
          'REGRAASS'#9'60'#9'Regra de associação'
          'REGRACALCULO'#9'60'#9'Regra de cálculo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        DataSource = dsRubricaIndivEvento
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        PopupMenu = pmenu
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDragDrop = dbgrdPlanPatroDragDrop
        OnDragOver = dbgrdPlanPatroDragOver
        OnMouseDown = dbgrdPlanPatroMouseDown
        IndicatorColor = icBlack
      end
      object btnProcRXP: TBitBtn
        Left = 255
        Top = 1
        Width = 83
        Height = 30
        Hint = 'Procurar Rubrica'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProcRXPClick
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
      object dbgProvDesc: TwwDBGrid
        Left = 384
        Top = 32
        Width = 333
        Height = 181
        Selected.Strings = (
          'CODPROVDESC'#9'10'#9'Código'#9'F'
          'NOME'#9'130'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsProv
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDragDrop = dbgProvDescDragDrop
        OnDragOver = dbgProvDescDragOver
        OnMouseDown = dbgProvDescMouseDown
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 618
      inherited sep1: TToolbarSep97
        Left = 77
      end
      inherited bbtnSair: TBitBtn
        Width = 77
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 79
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 732
    Height = 179
    Align = alTop
    TabOrder = 0
    object lbPatro: TLabel
      Left = 6
      Top = 3
      Width = 202
      Height = 23
      Caption = 'Planos Previdenciários'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 314
      Top = 3
      Width = 168
      Height = 23
      Caption = 'Eventos Geradores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object dbgrdPlanos: TDBGrid
      Left = 9
      Top = 33
      Width = 280
      Height = 136
      DataSource = dsPlanPrev
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Fantasia'
          Visible = True
        end>
    end
    object dbgrdEventos: TDBGrid
      Left = 313
      Top = 33
      Width = 408
      Height = 136
      DataSource = dsEventoGerador
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Fantasia'
          Visible = True
        end>
    end
  end
  object dsPlanPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryPlanPrev
    Left = 49
    Top = 119
  end
  object dsRubricaIndivEvento: TwwDataSource
    AutoEdit = False
    DataSet = qryRubricaIndivEvento
    Left = 80
    Top = 307
  end
  object qryRubricaIndivEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RB.IDPLANOPREV, RB.IDEVENTOGERADOR, RB.IDREGRACALCULO,'
      
        '       RB.IDREGRAVALIDAASS,  P.DESCRICAO NOME, RB.IDRUBRICA, P.C' +
        'ODPROVDESC'
      '       ,R1.NOMEREGRA REGRAASS, R2.NOMEREGRA REGRACALCULO'
      'FROM   RUBRICAINDIVEVENTO RB,  PROVDESC P, REGRA R1, REGRA R2'
      'WHERE'
      'RB.IDPLANOPREV = :IDPLANOPREV AND'
      'IDEVENTOGERADOR = :IDEVENTOGERADOR AND'
      'P.IDPROVENTO = RB.IDRUBRICA  AND'
      'RB.IDREGRAVALIDAASS = R1.IDREGRA(+)  AND'
      'RB.IDREGRACALCULO = R2.IDREGRA(+)'
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 154
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPrev: TwwQuery
    AfterScroll = qryPlanPrevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME  FROM PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO P'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA )'
      
        'ORDER BY NOME                                                   ' +
        '          ')
    ValidateWithMask = True
    Left = 119
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 29
    Top = 390
  end
  object dsEventoGerador: TwwDataSource
    AutoEdit = False
    DataSet = qryEventoGerador
    Left = 363
    Top = 121
  end
  object qryEventoGerador: TwwQuery
    AfterScroll = qryEventoGeradorAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR,  NOME, FLGINTERNO  FROM  EVENTOGERADOR'
      'WHERE IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 459
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object pmenu: TPopupMenu
    Left = 90
    Top = 390
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
  end
  object MontaSqlRXP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RB.IDRUBRICA'
      'PP.DESCRICAO'
      'PP.CODPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador no Sistema'
      'Descrição Rubrica'
      'Código na folha')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICAINDIVEVENTO RB'
      'PROVDESC PP')
    CamposChave.Strings = (
      'RB.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '80'
      '5')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 241
    Top = 238
  end
  object MontaSqlProv: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.IDPROVENTO'
      'PP.DESCRICAO'
      'PP.CODPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador no Sistema'
      'Descrição Rubrica'
      'Código na folha')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC PP')
    CamposChave.Strings = (
      'PP.IDPROVENTO')
    Filtro.Strings = (
      
        'NOT EXISTS(SELECT RB.IDRUBRICA  FROM   RUBRICAINDIVEVENTO RB  WH' +
        'ERE  RB.IDPLANOPREV   = 7  RB.IDEVENTOGERADOR = 27 ) ')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '80'
      '5')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 656
    Top = 238
  end
  object qryProv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  P.IDPROVENTO IDRUBRICA, P.FLGDESCONTO,'
      '  P.DESCRICAO NOME, P.FLGTPRUBRICA, '
      '  P.FLGINTERNO, P.CODPROVDESC '
      'FROM PROVDESC P'
      'WHERE '
      'NOT EXISTS(SELECT RB.IDRUBRICA'
      '               FROM   RUBRICAINDIVEVENTO RB'
      '               WHERE  RB.IDPLANOPREV =  :IDPLANOPREV  AND'
      '                      RB.IDEVENTOGERADOR = :IDEVENTOGERADOR  AND'
      '        RB.IDRUBRICA = P.IDPROVENTO)'
      'ORDER BY P.DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 608
    Top = 334
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object dsProv: TwwDataSource
    DataSet = qryProv
    Left = 549
    Top = 334
  end
end
