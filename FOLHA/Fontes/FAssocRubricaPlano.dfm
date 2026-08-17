inherited frmAssocRubricaPlano: TfrmAssocRubricaPlano
  Left = 29
  Top = 77
  HelpContext = 180027
  Caption = 'Associação de Rubricas por Plano'
  ClientHeight = 449
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 410
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 481
      DockPos = 481
    end
  end
  inherited pnlFundo: TPanel [1]
    Top = 408
    Width = 760
    Height = 2
    TabOrder = 2
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 760
    Height = 172
    Align = alTop
    TabOrder = 1
    object lblNome: TLabel
      Left = 1
      Top = 1
      Width = 190
      Height = 23
      Caption = 'Plano Previdenciário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 24
      Width = 753
      Height = 145
      Caption = 'Panel2'
      TabOrder = 0
      object dbgrdPlano: TDBGrid
        Left = 1
        Top = 1
        Width = 472
        Height = 143
        Align = alLeft
        DataSource = dsPlano
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'PLANO'
            Title.Caption = 'Plano'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PATROCINADORA'
            Title.Caption = 'Patrocinadora'
            Width = 259
            Visible = True
          end>
      end
      object gbxOpcoes: TGroupBox
        Left = 473
        Top = 1
        Width = 277
        Height = 143
        Align = alLeft
        TabOrder = 1
        OnClick = gbxOpcoesClick
        object rbGeral: TRadioButton
          Left = 37
          Top = 11
          Width = 113
          Height = 17
          Caption = 'Geral'
          TabOrder = 0
          OnClick = rbGeralClick
        end
        object rbAssistencial: TRadioButton
          Left = 37
          Top = 33
          Width = 113
          Height = 17
          Caption = 'Assistencial'
          TabOrder = 1
          OnClick = rbAssistencialClick
        end
        object rbEmprestimo: TRadioButton
          Left = 37
          Top = 56
          Width = 113
          Height = 17
          Caption = 'Empréstimo'
          TabOrder = 2
          OnClick = rbEmprestimoClick
        end
        object rbpatrocinadora: TRadioButton
          Left = 37
          Top = 78
          Width = 113
          Height = 17
          Caption = 'Patrocinadora'
          TabOrder = 3
          OnClick = rbpatrocinadoraClick
        end
        object rbFolhaBenef: TRadioButton
          Left = 37
          Top = 101
          Width = 145
          Height = 17
          Caption = 'Folha de Benefício'
          TabOrder = 4
          OnClick = rbFolhaBenefClick
        end
        object rbFolhafunda: TRadioButton
          Left = 37
          Top = 123
          Width = 202
          Height = 17
          Caption = 'Folha de Pagamento Fundação'
          TabOrder = 5
          OnClick = rbFolhafundaClick
        end
      end
    end
  end
  object Panel5: TPanel [3]
    Left = 0
    Top = 172
    Width = 760
    Height = 236
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label10: TLabel
      Left = 399
      Top = 13
      Width = 258
      Height = 24
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
      Left = 366
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
      Left = 366
      Top = 122
      Width = 27
      Height = 26
      Hint = 'Associar todas as rubricas'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 366
      Top = 150
      Width = 27
      Height = 26
      Hint = 'Desativar rubrica selecionada'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 366
      Top = 179
      Width = 27
      Height = 26
      Hint = 'Desativar todas as rubricas'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object lblPlanPatro: TLabel
      Left = 9
      Top = 15
      Width = 192
      Height = 20
      AutoSize = False
      Caption = 'Rubricas do Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object dblkplistPlano: TDBLookupListBox
      Left = 400
      Top = 66
      Width = 301
      Height = 160
      KeyField = 'IDPROVENTO'
      ListField = 'DESCRICAO'
      ListSource = dsProv
      TabOrder = 0
      Visible = False
      OnDragDrop = dblkplistPlanoDragDrop
      OnDragOver = dblkplistPlanoDragOver
      OnMouseDown = dblkplistPlanoMouseDown
    end
    object dbgrdPlanPatro: TwwDBGrid
      Left = 6
      Top = 66
      Width = 301
      Height = 160
      Hint = 
        'Clique no botão da direita para Alterar Informações de Integraçã' +
        'o'
      Selected.Strings = (
        'IDRUBRICA'#9'10'#9'Código Interno'
        'CODPROVDESC'#9'10'#9'Código Externo'
        'DESCRICAO'#9'40'#9'Descrição Interna'
        'DESCRPROVDESC'#9'130'#9'Descrição Externa')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      DataSource = dsRubricaPlano
      Options = [dgEditing, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      Visible = False
      OnDblClick = AlterarInfoIntegraClick
      OnDragDrop = dbgrdPlanPatroDragDrop
      OnDragOver = dbgrdPlanPatroDragOver
      OnMouseDown = dbgrdPlanPatroMouseDown
      IndicatorColor = icBlack
    end
    object btnProcRXP: TBitBtn
      Left = 272
      Top = 10
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
    object btnProcProv: TBitBtn
      Left = 668
      Top = 10
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
    object wwDBGrid1: TwwDBGrid
      Left = 400
      Top = 47
      Width = 353
      Height = 183
      Selected.Strings = (
        'IDPROVENTO'#9'10'#9'Código Interno'
        'CODPROVDESC'#9'10'#9'Código Externo'
        'DESCRICAO'#9'100'#9'Descrição Interna'
        'DESCRPROVDESC'#9'100'#9'Descrição Externa')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProv
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = wwDBGrid1TitleButtonClick
      IndicatorColor = icBlack
    end
    object wwDBGrid2: TwwDBGrid
      Left = 5
      Top = 47
      Width = 353
      Height = 183
      Hint = 
        'Clique na Rubrica com o botão direito do mouse para parametrizá-' +
        'la.'
      Selected.Strings = (
        'IDRUBRICA'#9'10'#9'Código Interno'#9'F'
        'CODPROVDESC'#9'10'#9'Código Externo'#9'F'
        'DESCRICAO'#9'40'#9'Descrição Interna'#9'F'
        'DESCRPROVDESC'#9'130'#9'Descrição Externa'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsRubricaPlano
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      PopupMenu = pmenu
      ShowHint = True
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = wwDBGrid2TitleButtonClick
      IndicatorColor = icBlack
    end
  end
  object dsPlano: TwwDataSource
    AutoEdit = False
    DataSet = qryPlano
    Left = 31
    Top = 63
  end
  object qryPlano: TwwQuery
    AfterScroll = qryPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.NOME AS PLANO, PP.IDPLANOPREV, PA.IDFUNDACAO,'
      '       P.NOME AS PATROCINADORA, PPP.IDPESSJUR'
      'FROM   PLANPREVPATRO PPP, PESSOA P, PLANPREV PP, PATRO PA'
      'WHERE  P.IDPESSOA = PPP.IDPESSJUR'
      'AND    PP.IDPLANOPREV = PPP.IDPLANOPREV'
      'AND    PA.IDPESSOA = PPP.IDPESSJUR'
      ' ')
    ValidateWithMask = True
    Left = 76
    Top = 62
  end
  object dsRubricaPlano: TwwDataSource
    DataSet = qryRubricaPlano
    Left = 305
    Top = 314
  end
  object pmenu: TPopupMenu
    Left = 338
    Top = 128
    object AlterarInfoIntegra: TMenuItem
      Caption = 'Alterar Informações de Integração'
      OnClick = AlterarInfoIntegraClick
    end
  end
  object qryRubricaPlano: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  RPL.IDPESSJUR,'
      '  RPL.IDRUBRICA,'
      '  RPL.IDPLANOPREV,'
      '  RPL.CODCENTROCUSTOD,'
      '  RPL.UNIDNEGOC,'
      '  RPL.IDEMPRESAPROP,'
      '  RPL.IDEMPRESA,'
      '  RPL.CODTIPRECDES,'
      '  RPL.IDPESSOA,'
      '  RPL.CODCENTROCUSTOC,'
      '  RPL.RECPAG,'
      '  RPL.PLACONTAD,'
      '  RPL.PLANO,'
      '  RPL.PLACONTAC,'
      '  RPL.CODPORTFORMA,'
      '  RPL.CODCENTRORESPON,'
      '  P.DESCRICAO,'
      '  P.FLGDESCONTO,'
      '  RPL.CODTIPRECDESFAV,'
      '  RPL.CODTIPRECDESCAR,'
      '  RPL.CODTIPRECDESFAVCAR,'
      '  P.FLGOBRIGAFAVOREC,'
      '  RPL.CODSUBCONTA,'
      '  P.CODPROVDESC,'
      '  P.DESCRPROVDESC'
      ''
      'FROM'
      '  RUBRICAXPLANO RPL,'
      '  PROVDESC P'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 310
    Top = 258
  end
  object dsProv: TwwDataSource
    DataSet = qryProv
    Left = 408
    Top = 316
  end
  object qryProv: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO,'
      '  P.DESCRICAO,'
      '  P.CODPROVDESC,'
      '  P.DESCRPROVDESC,'
      '  P.FLGTPRUBRICA,'
      '  FLGDESCONTO,'
      '  FLGOBRIGAFAVOREC'
      ''
      'FROM'
      '  PROVDESC P'
      ''
      'WHERE'
      '  IDPROVENTO NOT IN'
      '  (SELECT DISTINCT'
      '     IDRUBRICA'
      ''
      '   FROM'
      '     RUBRICAXPLANO RP'
      ''
      '   WHERE'
      '     RP.IDPESSJUR = :IDPESSJUR     AND'
      '     RP.IDPLANOPREV = :IDPLANOPREV AND'
      '     RP.IDRUBRICA = P.IDPROVENTO)  AND'
      ''
      '   FLGTPRUBRICA like :FLGTPRUBRICA'
      ''
      'ORDER BY'
      '  P.IDPROVENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTPRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryTemporaria: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RPL.IDPESSJUR,'
      '  RPL.IDRUBRICA,'
      '  RPL.IDPLANOPREV,'
      '  RPL.CODCENTROCUSTOD,'
      '  RPL.UNIDNEGOC,'
      '  RPL.IDEMPRESAPROP,'
      '  RPL.IDEMPRESA,'
      '  RPL.CODTIPRECDES,'
      '  RPL.IDPESSOA,'
      '  RPL.CODCENTROCUSTOC,'
      '  RPL.RECPAG,'
      '  RPL.PLACONTAD,'
      '  RPL.PLANO,'
      '  RPL.PLACONTAC,'
      '  RPL.CODPORTFORMA,'
      '  RPL.CODCENTRORESPON,'
      '  P.DESCRICAO,'
      '  P.FLGDESCONTO,'
      '  RPL.CODTIPRECDESFAV,'
      '  RPL.CODTIPRECDESCAR,'
      '  RPL.CODTIPRECDESFAVCAR'
      ''
      'FROM'
      '  RUBRICAXPLANO RPL,'
      '  PROVDESC P'
      ''
      'WHERE'
      '  RPL.IDPESSJUR   = :IDPESSJUR   AND'
      '  RPL.IDPLANOPREV = :IDPLANOPREV AND'
      '  RPL.IDRUBRICA   = :IDRUBRICA   AND'
      '  P.IDPROVENTO    = RPL.IDRUBRICA'
      ''
      'ORDER BY'
      '  P.DESCRICAO'
      ' '
      ' ')
    UpdateObject = updTemporaria
    ValidateWithMask = True
    Left = 670
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object updTemporaria: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXPLANO'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC,'
      '  RECPAG = :RECPAG,'
      '  PLACONTAD = :PLACONTAD,'
      '  PLANO = :PLANO,'
      '  PLACONTAC = :PLACONTAC,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDESFAV = :CODTIPRECDESFAV,'
      '  CODTIPRECDESCAR = :CODTIPRECDESCAR,'
      '  CODTIPRECDESFAVCAR = :CODTIPRECDESFAVCAR'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into RUBRICAXPLANO'
      
        '  (IDPESSJUR, IDRUBRICA, IDPLANOPREV, CODCENTROCUSTOD, UNIDNEGOC' +
        ', '
      'IDEMPRESAPROP, '
      '   IDEMPRESA, CODTIPRECDES, IDPESSOA, CODCENTROCUSTOC, RECPAG, '
      'PLACONTAD, '
      '   PLANO, PLACONTAC, CODPORTFORMA, CODCENTRORESPON, '
      'CODTIPRECDESFAV, CODTIPRECDESCAR, CODTIPRECDESFAVCAR)'
      'values'
      '  (:IDPESSJUR, :IDRUBRICA, :IDPLANOPREV, :CODCENTROCUSTOD, '
      ':UNIDNEGOC, '
      '   :IDEMPRESAPROP, :IDEMPRESA, :CODTIPRECDES, :IDPESSOA, '
      ':CODCENTROCUSTOC, '
      '   :RECPAG, :PLACONTAD, :PLANO, :PLACONTAC, :CODPORTFORMA, '
      ':CODCENTRORESPON,   :CODTIPRECDESFAV,'
      '   :CODTIPRECDESCAR, :CODTIPRECDESFAVCAR)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXPLANO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 674
    Top = 279
  end
  object dsTemporaria: TwwDataSource
    DataSet = qryTemporaria
    Left = 677
    Top = 334
  end
  object qryUAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 593
    Top = 234
  end
  object MontaSqlRXP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.DESCRICAO'
      'P.DESCRPROVDESC'
      'P.CODPROVDESC'
      'RPL.IDRUBRICA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição Interna'
      'Descrição Externa'
      'Código Externo'
      'Identificador no Sistema')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P'
      'RUBRICAXPLANO RPL')
    CamposChave.Strings = (
      'RPL.IDPESSJUR'
      'RPL.IDRUBRICA'
      'RPL.IDPLANOPREV'
      'RPL.CODCENTROCUSTOD'
      'RPL.UNIDNEGOC'
      'RPL.IDEMPRESAPROP'
      'RPL.IDEMPRESA'
      'RPL.CODTIPRECDES'
      'RPL.IDPESSOA'
      'RPL.CODCENTROCUSTOC'
      'RPL.RECPAG'
      'RPL.PLACONTAD'
      'RPL.PLANO'
      'RPL.PLACONTAC'
      'RPL.CODPORTFORMA'
      'RPL.CODCENTRORESPON'
      'RPL.CODTIPRECDESFAV'
      'RPL.CODSUBCONTA'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC'
      'P.FLGDESCONTO'
      'P.FLGOBRIGAFAVOREC')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '7'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 145
    Top = 278
  end
  object MontaSqlProv: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.DESCRICAO'
      'P.DESCRPROVDESC'
      'P.CODPROVDESC'
      'P.IDPROVENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição Interna'
      'Descrição Externa'
      'Código Externo'
      'Identificador no Sistema')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.CODPROVDESC'
      'P.DESCRICAO'
      'P.DESCRPROVDESC'
      'P.FLGTPRUBRICA'
      'P.FLGDESCONTO'
      'P.FLGOBRIGAFAVOREC')
    Filtro.Strings = (
      'P.IDPROVENTO NOT IN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '7'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 516
    Top = 270
  end
end
