inherited frmAssocProvPatro: TfrmAssocProvPatro
  Left = -4
  Top = 62
  ActiveControl = pnlFundo
  Anchors = []
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Associação de Rubricas por Patrocinadora / Fundação'
  ClientHeight = 481
  ClientWidth = 786
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 442
    Width = 786
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 599
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 786
    Height = 442
    TabOrder = 1
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 786
    Height = 442
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 7
      Top = 6
      Width = 773
      Height = 179
      Caption = 'Patrocinadoras / Fundações'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dbgrdPatro: TwwDBGrid2
        Left = 8
        Top = 15
        Width = 760
        Height = 154
        Selected.Strings = (
          'NOME'#9'21'#9'NOME'
          'RAZAOSOCIAL'#9'52'#9'RAZAOSOCIAL'
          'FLGPATROCINADORA'#9'16'#9'PATROCINADORA'
          'FLGFUNDACAO'#9'10'#9'FUNDAÇÃO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsPatro
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 184
      Width = 771
      Height = 257
      TabOrder = 1
      object sbtnAssocia: TSpeedButton
        Left = 371
        Top = 31
        Width = 38
        Height = 27
        Hint = 'Associar rubrica selecionada'
        Caption = '<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 368
        Top = 144
        Width = 38
        Height = 25
        Hint = 'Desativar rubrica selecionada'
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 12
        Width = 350
        Height = 203
        Caption = 'Rubricas Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object wwDBGrid1: TwwDBGrid
          Left = 6
          Top = 17
          Width = 339
          Height = 179
          Selected.Strings = (
            'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'
            'CODPROVDESC'#9'15'#9'CODPROVDESC'
            'IDRUBRICA'#9'10'#9'IDRUBRICA'
            'IDPESSOA'#9'10'#9'IDPESSOA'
            'DESCRICAO'#9'130'#9'DESCRICAO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsProvPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgIndicator, dgColLines]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = pmenu
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDragDrop = wwDBGrid1DragDrop
          OnDragOver = wwDBGrid1DragOver
          OnMouseDown = wwDBGrid1MouseDown
          IndicatorColor = icBlack
        end
      end
      object GroupBox4: TGroupBox
        Left = 415
        Top = 12
        Width = 350
        Height = 203
        Caption = 'Rubricas Disponíveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object wwDBGrid2: TwwDBGrid
          Left = 7
          Top = 16
          Width = 338
          Height = 180
          Selected.Strings = (
            'DESCRICAO'#9'130'#9'DESCRICAO'
            'FLGTPRUBRICA'#9'15'#9'FLGTPRUBRICA'
            'FLGINTERNO'#9'10'#9'FLGINTERNO'
            'IDPROVENTO'#9'10'#9'IDPROVENTO'
            'FLGDESCONTO'#9'10'#9'FLGDESCONTO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsProv
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColLines]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDragDrop = wwDBGrid2DragDrop
          OnDragOver = wwDBGrid2DragOver
          OnMouseDown = wwDBGrid2MouseDown
          IndicatorColor = icBlack
        end
      end
      object btnProcRXP: TBitBtn
        Left = 17
        Top = 221
        Width = 85
        Height = 29
        Hint = 'Procurar rubricas associadas'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        Left = 427
        Top = 220
        Width = 85
        Height = 29
        Hint = 'Procurar rubricas disponíveis'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 219
    Top = 67
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 431
    Top = 63
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  DISTINCT  P.IDPESSOA , P.NOME, RAZAOSOCIAL, FLGPATROCINADORA, ' +
        'FLGFUNDACAO'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'ORDER BY NOME'
      ''
      '/*'
      'SELECT IDPESSOA,NOME,RAZAOSOCIAL, FLGPATROCINADORA, FLGFUNDACAO'
      'FROM PESSOA '
      'WHERE (FLGPATROCINADORA = 1)'
      '          or (FLGFUNDACAO = 1)'
      '*/')
    ControlType.Strings = (
      'FLGPATROCINADORA;CheckBox;1;0'
      'FLGFUNDACAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 388
    Top = 62
    object qryPatroNOME: TStringField
      DisplayWidth = 21
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPatroRAZAOSOCIAL: TStringField
      DisplayWidth = 52
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryPatroFLGPATROCINADORA: TFloatField
      DisplayLabel = 'PATROCINADORA'
      DisplayWidth = 16
      FieldName = 'FLGPATROCINADORA'
      Origin = 'PESSOA.FLGPATROCINADORA'
    end
    object qryPatroFLGFUNDACAO: TFloatField
      DisplayLabel = 'FUNDAÇÃO'
      DisplayWidth = 10
      FieldName = 'FLGFUNDACAO'
      Origin = 'PESSOA.FLGFUNDACAO'
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object dsProvPatro: TwwDataSource
    DataSet = qryProvPatro
    Left = 574
    Top = 63
  end
  object pmenu: TPopupMenu
    Left = 293
    Top = 64
    object AlterarCodigo: TMenuItem
      Caption = 'Alterar Código'
    end
  end
  object qryProvPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PP.DESCRPROVDESC, PP.CODPROVDESC, PP.IDRUBRICA,'
      '  PP.IDPESSOA, P.DESCRICAO'
      'FROM'
      '  RUBRICAXPESS   PP, PROVDESC P'
      'WHERE'
      '  (PP.IDPESSOA = :IDPESSOA) AND'
      '  (SUBSTR(P.FLGTPRUBRICA,1,1) = '#39'A'#39') AND'
      '  (PP.IDRUBRICA = P.IDPROVENTO)'
      'ORDER BY PP.DESCRPROVDESC'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 511
    Top = 63
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 506
    Top = 125
  end
  object dsProv: TwwDataSource
    DataSet = qryProv
    Left = 428
    Top = 124
  end
  object qryProv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO, P.FLGDESCONTO, '
      '  P.DESCRICAO, P.FLGTPRUBRICA,  P.FLGINTERNO'
      'FROM'
      '  PROVDESC P'
      'WHERE'
      '  (SUBSTR(P.FLGTPRUBRICA,1,1) = '#39'A'#39') AND'
      '  NOT EXISTS(SELECT PP.IDRUBRICA, PP.IDPESSOA'
      '                           FROM RUBRICAXPESS PP'
      '                        WHERE (PP.IDPESSOA = :IDPESSOA) AND'
      
        '                                       (PP.IDRUBRICA = P.IDPROVE' +
        'NTO))'
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 389
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object MontaSqlProv: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição Rubrica')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'DESCRICAO')
    Filtro.Strings = (
      'SUBSTR(FLGTPRUBRICA,1,1)  = '#39'A'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 280
    Top = 124
  end
  object MontaSqlRXP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.DESCRPROVDESC'
      'PP.IDRUBRICA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição da Rubrica'
      'Código da Rubrica')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICAXPESS PP'
      'PROVDESC P')
    CamposChave.Strings = (
      'PP.DESCRPROVDESC '
      'PP.CODPROVDESC'
      'PP.IDRUBRICA'
      'PP.IDPESSOA')
    Filtro.Strings = (
      'PP.IDPESSOA = '#39'3'#39
      'PP.IDRUBRICA = P.IDPROVENTO'
      'SUBSTR(P.FLGTPRUBRICA,1,1) = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '80'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 192
    Top = 124
  end
end
