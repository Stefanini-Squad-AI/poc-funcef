inherited frmInsereRubricasINSSFolha: TfrmInsereRubricasINSSFolha
  Left = 143
  Top = 225
  Caption = 'Inserção das Rubricas INSS na  Folha'
  ClientHeight = 389
  ClientWidth = 981
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 981
    Height = 350
    object pnOpcoesPesquisa: TPanel
      Left = 1
      Top = 1
      Width = 979
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 3
        Top = 2
        Width = 242
        Height = 44
        Caption = 'Ano e Mês de Competência do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cmb_mesCompretencia: TComboBox
          Left = 10
          Top = 17
          Width = 105
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = cmb_mesCobrancaChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro'
            'Abono Anual')
        end
        object spn_anoCompetencia: TSpinEdit
          Left = 124
          Top = 17
          Width = 63
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
          OnChange = cmb_mesCobrancaChange
        end
      end
      object GroupBox1: TGroupBox
        Left = 247
        Top = 2
        Width = 722
        Height = 44
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object dblcRubrica: TwwDBLookupCombo
          Left = 9
          Top = 16
          Width = 536
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'150'#9'Descrição'#9'F')
          LookupTable = qryRubricas
          LookupField = 'DESCRICAO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          DropDownWidth = 320
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object btnProcurar: TBitBtn
        Left = 819
        Top = 48
        Width = 152
        Height = 28
        Hint = 'Procurar participante'
        Caption = '&Carregar Informações'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = btnProcurarClick
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
    object dbgrdLista: TwwDBGrid
      Left = 1
      Top = 84
      Width = 979
      Height = 265
      Selected.Strings = (
        'PROCESSAR'#9'13'#9'Selecionar~Todos'
        'MATRICULA'#9'13'#9'Matrícula'
        'NOME'#9'55'#9'Nome'
        'RUBRICA'#9'55'#9'Rubrica'
        'VALORINSSFORMAT'#9'15'#9'Valor'#9'F')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clBtnFace
      DataSource = dsLista
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgTrailingEllipsis, dgShowCellHint]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbgrdListaTitleButtonClick
      IndicatorColor = icBlack
      OnFieldChanged = dbgrdListaFieldChanged
    end
  end
  inherited Dock971: TDock97
    Top = 350
    Width = 981
    inherited tb97Fundo: TToolbar97
      Left = 809
      DockableTo = [dpRight]
      DockPos = 814
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 523
      DockPos = 528
      inherited ToolbarSep971: TToolbarSep97
        Left = 198
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 117
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 201
        Enabled = False
        OnClick = bbtnCancelarClick
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnProcessarClick
        Kind = bkOK
        Spacing = 2
      end
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 0
      TabOrder = 2
      object bbtnDesfazer: TBitBtn
        Left = 0
        Top = 0
        Width = 169
        Height = 33
        Caption = '&Desfazer'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnDesfazerClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 275
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryLista: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 1 as PROCESSAR,'
      '       D.MATRICULA,               '
      '       P.NOME,                    '
      '       PD.DESCRICAO AS RUBRICA,   '
      '       D.VALORINSS,'
      '       TO_CHAR(D.VALORINSS,'#39'9G999G999D00'#39') AS VALORINSSFORMAT,'
      '       D.IDPESSOA,'
      '       D.IDBENEFICIO,'
      '       /*64063*/'
      '       DECODE(D.IDPLANOPREV, 97, 66,'
      '                            107, 74,'
      '                            D.IDPLANOPREV) AS IDPLANOPREV,'
      '       /*64063*/'
      '       D.NUMPROCINSS'
      'FROM DETCONCINSS D                '
      '    ,PROVDESC PD                  '
      '    ,PESSOA P                     '
      'WHERE D.IDRUBRICA  = PD.IDPROVENTO'
      'AND D.IDPESSOA = P.IDPESSOA       '
      'AND PD.CODFONTEPAGADORA = 2       '
      'AND D.MESREFERENCIA = '#39'0'#39
      'AND D.MESCOBRANCA = '#39'0'#39
      'ORDER BY MATRICULA,               '
      '         NOME,                    '
      '         DESCRICAO  '
      ' ')
    UpdateObject = updLista
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 65
    Top = 166
  end
  object dsLista: TwwDataSource
    DataSet = qryLista
    Left = 36
    Top = 166
  end
  object dsRubricas: TwwDataSource
    DataSet = qryRubricas
    Left = 536
    Top = 48
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE CODFONTEPAGADORA=2'
      'AND EXISTS'
      '('
      'SELECT 1'
      'FROM RUBRICAXINSS RI'
      'WHERE RI.IDRUBRICA = P.IDPROVENTO'
      ')'
      'AND EXISTS'
      '('
      '  SELECT 1'
      '  FROM DETCONCINSS D'
      '  WHERE D.IDRUBRICA = P.IDPROVENTO'
      '    AND D.MESCOBRANCA = :MESCOBRANCA'
      ')'
      'ORDER BY 2'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object updLista: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 102
    Top = 166
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 0 as PROCESSAR'
      '     , D.MATRICULA                                       '
      '     , BBF.DATAINICIO DIB                                '
      '     , BBF.VALORATUAL                                    '
      '     , BBF.IDSITBENEFICIO                                '
      '     , SB.DESCRICAO as SITBENEFICIO                      '
      '     , ( SELECT MAX(HBF.DATAPAGAMENTO)                   '
      '        FROM HSTBENEFBFCIARIO HBF                        '
      '        WHERE HBF.IDBENEFICIO = BBF.IDBENEFICIO          '
      '        AND HBF.IDTITULAR = BBF.IDTITULAR                '
      '        AND HBF.IDPLANOPREV = BBF.IDPLANOPREV            '
      '        AND HBF.FLGDEVOLUCAO = 0                         '
      '       ) AS ULTIMO_PAGAMENTO                             '
      '     , BBF.NUMEROPROCESSO                                '
      '     , BBF.NUMPROCINSS                                   '
      '     , PF.DATAMORTE                                      '
      'FROM BENEFBFCIARIO BBF                                   '
      '   , BENEFICIO B                                         '
      '   , SITBENEF SB                                         '
      '   , DEPENTIT D                                          '
      '   , PESSOAFISICA PF                                     '
      'WHERE BBF.IDPESSOA    = D.IDPESSOA                       '
      ' AND BBF.IDPESSOA    = PF.IDPESSOA                       '
      ' AND BBF.IDBENEFICIO = B.IDBENEFICIO                     '
      ' AND BBF.IDSITBENEFICIO = SB.IDSITBENEF(+)               '
      ' AND PF.DATAMORTE >= TO_DATE('#39'29/09/2010'#39','#39'DD/MM/YYYY'#39')')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 65
    Top = 206
  end
end
