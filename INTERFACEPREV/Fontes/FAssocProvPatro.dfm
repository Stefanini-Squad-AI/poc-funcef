inherited frmAssocProvPatro: TfrmAssocProvPatro
  Left = 417
  Top = 199
  HelpContext = 320024
  Caption = 'Associação de Rubricas por Patrocinadora'
  ClientHeight = 474
  ClientWidth = 784
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 435
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 599
    end
  end
  inherited pnlFundo: TPanel [1]
    Top = 172
    Width = 784
    Height = 263
    TabOrder = 2
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 784
    Height = 172
    Align = alTop
    Caption = 'Panel4'
    TabOrder = 1
    object lblNome: TLabel
      Left = 6
      Top = 1
      Width = 132
      Height = 23
      Caption = 'Patrocinadoras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 543
      Top = 1
      Width = 112
      Height = 23
      Caption = 'Tipo Rubrica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object dbgrdPatro: TDBGrid
      Left = 6
      Top = 30
      Width = 529
      Height = 136
      DataSource = dsPatro
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          Title.Caption = 'Nome'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAOSOCIAL'
          Title.Caption = 'Razão Social'
          Width = 271
          Visible = True
        end>
    end
    object rgTpRubrica: TRadioGroup
      Left = 543
      Top = 25
      Width = 236
      Height = 140
      Items.Strings = (
        'Geral'
        'Assistencial'
        'Empréstimo'
        'Patrocinadora'
        'Folha de Benefício'
        'Folha de Pagamento Fundação')
      TabOrder = 1
      OnClick = rgTpRubricaClick
    end
  end
  object Panel5: TPanel [3]
    Left = 0
    Top = 172
    Width = 784
    Height = 263
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label10: TLabel
      Left = 418
      Top = 2
      Width = 223
      Height = 45
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
    object sbtnAssocia: TSpeedButton
      Left = 389
      Top = 79
      Width = 25
      Height = 27
      Hint = 'Associar rubrica selecionada'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaClick
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 389
      Top = 113
      Width = 25
      Height = 26
      Hint = 'Associar todas as rubricas'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 389
      Top = 144
      Width = 25
      Height = 25
      Hint = 'Desativar rubrica selecionada'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 389
      Top = 174
      Width = 25
      Height = 25
      Hint = 'Desativar todas as rubricas'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object lblPlanPatro: TLabel
      Left = 8
      Top = 2
      Width = 283
      Height = 41
      AutoSize = False
      Caption = 'Rubricas da Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object dbgProvDesc: TwwDBGrid
      Left = 420
      Top = 48
      Width = 361
      Height = 211
      Selected.Strings = (
        'DESCRICAO'#9'65'#9'Descrição da Rubrica')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProv
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object dbgrdPlanPatro: TwwDBGrid
      Left = 6
      Top = 45
      Width = 380
      Height = 211
      Hint = 'Clique no botão da direita para Alterar Código'
      Selected.Strings = (
        'DESCRPROVDESC'#9'52'#9'DESCRPROVDESC'
        'CODPROVDESC'#9'7'#9'CODPROVDESC')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      DataSource = dsProvPatro
      Options = [dgEditing, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      PopupMenu = pmenu
      ShowHint = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = AlterarCodigoClick
      OnDragDrop = dbgrdPlanPatroDragDrop
      OnDragOver = dbgrdPlanPatroDragOver
      OnMouseDown = dbgrdPlanPatroMouseDown
      IndicatorColor = icBlack
    end
    object btnProcProv: TBitBtn
      Left = 696
      Top = 17
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
      TabOrder = 1
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
    object btnProcRXP: TBitBtn
      Left = 303
      Top = 17
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
      TabOrder = 3
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
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 87
    Top = 63
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, P.RAZAOSOCIAL'
      'FROM PESSOA P, PATRO PT WHERE PT.IDPESSOA = P.IDPESSOA'
      'AND PT.IDFUNDACAO = :IDFUNDACAO'
      'UNION'
      'SELECT P.IDPESSOA,P.NOME,P.RAZAOSOCIAL'
      'FROM PESSOA P, FUNDACAO F WHERE P.IDPESSOA = F.IDPESSOA'
      'AND F.IDPESSOA = :IDFUNDACAO'
      ' ')
    ValidateWithMask = True
    Left = 132
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsProvPatro: TwwDataSource
    DataSet = qryProvPatro
    Left = 19
    Top = 366
  end
  object pmenu: TPopupMenu
    Left = 78
    Top = 366
    object AlterarCodigo: TMenuItem
      Caption = 'Alterar Código'
      OnClick = AlterarCodigoClick
    end
  end
  object qryProvPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.DESCRPROVDESC,  PP.CODPROVDESC, PP.IDRUBRICA,'
      '       PP.IDPESSOA,  P.DESCRICAO,  P.FLGTPRUBRICA'
      'FROM   RUBRICAXPESS   PP, PROVDESC P'
      'WHERE  PP.IDPESSOA = :IDPESSOA'
      'AND    (P.FLGTPRUBRICA = :FLGTPRUBRICA)'
      'AND    (PP.IDRUBRICA = P.IDPROVENTO)'
      'ORDER BY PP.DESCRPROVDESC'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 136
    Top = 366
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGTPRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 195
    Top = 366
  end
  object dsProv: TwwDataSource
    DataSet = qryProv
    Left = 549
    Top = 334
  end
  object qryProv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  P.IDPROVENTO, P.FLGDESCONTO,'
      '  P.DESCRICAO, P.FLGTPRUBRICA, P.FLGINTERNO'
      'FROM PROVDESC P'
      'WHERE  (P.FLGTPRUBRICA  LIKE '#39'%'#39'||:FLGTPRUBRICA||'#39'%'#39')'
      'AND NOT EXISTS(SELECT PP.IDRUBRICA,PP.IDPESSOA'
      '               FROM   RUBRICAXPESS PP'
      '               WHERE  PP.IDPESSOA = :IDPESSOA  AND'
      '                      PP.IDRUBRICA = P.IDPROVENTO)'
      'ORDER BY P.DESCRICAO'
      ''
      '')
    ValidateWithMask = True
    Left = 608
    Top = 334
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FLGTPRUBRICA||'#39'%'#39
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object MontaSqlProv: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IDPROVENTO'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Identificador no Sistema'
      'Descrição Rubrica')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'DESCRICAO')
    Filtro.Strings = (
      'FLGTPRUBRICA  = '#39'P'#39
      
        'NOT EXISTS(SELECT PP.IDRUBRICA FROM RUBRICAXPESS PP WHERE  PP.ID' +
        'PESSOA = 50028  AND PP.IDRUBRICA = IDPROVENTO)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '80'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 732
    Top = 230
  end
  object MontaSqlRXP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.DESCRPROVDESC'
      'PP.CODPROVDESC'
      'PP.IDRUBRICA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição Rubrica'
      'Código Externo'
      'Identificador no Sistema')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICAXPESS PP'
      'PROVDESC P')
    CamposChave.Strings = (
      'PP.DESCRPROVDESC '
      'PP.CODPROVDESC'
      'PP.IDRUBRICA')
    Filtro.Strings = (
      'PP.IDPESSOA = :IDPESSOA'
      'P.FLGTPRUBRICA = :FLGTPRUBRICA'
      'PP.IDRUBRICA = P.IDPROVENTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '80'
      '7'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 321
    Top = 230
  end
end
