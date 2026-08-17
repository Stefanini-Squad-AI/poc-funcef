inherited FrmCadGrupoRubrica: TFrmCadGrupoRubrica
  Left = 60
  Top = 85
  HelpContext = 180025
  Caption = 'Grupo de Rubricas'
  ClientHeight = 443
  ClientWidth = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 679
    Height = 357
    object Bevel2: TBevel
      Left = 4
      Top = 215
      Width = 671
      Height = 2
    end
    object pnl: TPanel
      Left = 5
      Top = 5
      Width = 669
      Height = 204
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object LblIdGrupoRubrica: TLabel
        Left = 8
        Top = 10
        Width = 51
        Height = 16
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDescricao: TLabel
        Left = 90
        Top = 10
        Width = 76
        Height = 16
        Caption = 'Descrição '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblRubricaxGrupo: TLabel
        Left = 8
        Top = 71
        Width = 243
        Height = 16
        Caption = 'Rubricas Associadas a Este Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 2
        Top = 60
        Width = 665
        Height = 2
      end
      object dbedtIdGrupoRubrica: TDBEdit
        Left = 8
        Top = 27
        Width = 73
        Height = 21
        Color = clSilver
        DataField = 'IDGRUPORUBRICA'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescricaoDoGrupo: TDBEdit
        Left = 90
        Top = 27
        Width = 217
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbgRubricaxGrupo: TwwDBGrid
        Left = 2
        Top = 91
        Width = 665
        Height = 111
        Selected.Strings = (
          'CODIGO'#9'5'#9'Código'
          'DESCRICAO'#9'41'#9'Descrição'
          'NOMEINFORME'#9'41'#9'Informe de Rendimento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = dsRubricaxGrupo
        ReadOnly = True
        TabOrder = 2
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
    object grbInfRendimento: TGroupBox
      Left = 5
      Top = 221
      Width = 669
      Height = 44
      Caption = 
        'Alteração da Linha do Informe de Rendimento Para Este Grupo de R' +
        'ubrica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object dblkInfRendimento: TwwDBLookupCombo
        Left = 8
        Top = 14
        Width = 481
        Height = 24
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'30'#9'Informe de Rendimento'#9'F')
        LookupTable = qryInfRendimento
        LookupField = 'IDINFORME'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object btnExecOp: TBitBtn
        Left = 502
        Top = 13
        Width = 164
        Height = 25
        Caption = 'Executar Operação'
        TabOrder = 1
        OnClick = btnExecOpClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 679
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 679
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDGRUPORUBRICA, IDFUNDACAO, DESCRICAO'
      'FROM GRUPORUBRICA'
      'WHERE LTRIM(RTRIM(IDGRUPORUBRICA)) = :IDGRUPORUBRICA'
      ' '
      ' ')
    Left = 274
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'IDGRUPORUBRICA'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryIDGRUPORUBRICA: TStringField
      FieldName = 'IDGRUPORUBRICA'
      Origin = 'BASEDADOS.GRUPORUBRICA.IDGRUPORUBRICA'
      FixedChar = True
      Size = 2
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.GRUPORUBRICA.DESCRICAO'
      Size = 30
    end
    object qryIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 40
    Top = 397
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPORUBRICA'
      'set'
      '  IDGRUPORUBRICA = :IDGRUPORUBRICA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDFUNDACAO = :IDFUNDACAO'
      'where'
      '  IDGRUPORUBRICA = :OLD_IDGRUPORUBRICA')
    InsertSQL.Strings = (
      'insert into GRUPORUBRICA'
      '  (IDGRUPORUBRICA, DESCRICAO, IDFUNDACAO)'
      'values'
      '  (:IDGRUPORUBRICA, :DESCRICAO, :IDFUNDACAO)')
    DeleteSQL.Strings = (
      'delete from GRUPORUBRICA'
      'where'
      '  IDGRUPORUBRICA = :OLD_IDGRUPORUBRICA')
    Left = 355
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPORUBRICA.IDGRUPORUBRICA'
      'GRUPORUBRICA.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPORUBRICA')
    CamposChave.Strings = (
      'GRUPORUBRICA.IDGRUPORUBRICA'
      'GRUPORUBRICA.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '2'
      '30')
    Left = 467
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 315
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 81
    Top = 397
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 402
    Top = 6
  end
  object qryRubricaxGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, P.IDPROVENTO, P.CODPROVDES' +
        'C) AS CODIGO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, P.DESCRICAO, P.DESCRPROVDE' +
        'SC) AS DESCRICAO,'
      '       I.IDINFORME, I.NOMEINFORME'
      'FROM PARAMAPREV PRM, PROVDESC P, GRUPORUBRICA G, INFORME I'
      'WHERE LTRIM(RTRIM(G.IDGRUPORUBRICA)) = :IDGRUPORUBRICA'
      'AND G.IDGRUPORUBRICA = P.IDGRUPORUBRICA'
      'AND P.IDINFORME = I.IDINFORME(+)'
      'AND P.IDFUNDACAO = G.IDFUNDACAO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 85
    Top = 188
    ParamData = <
      item
        DataType = ftString
        Name = 'IDGRUPORUBRICA'
        ParamType = ptInput
      end>
  end
  object dsRubricaxGrupo: TwwDataSource
    DataSet = qryRubricaxGrupo
    Left = 189
    Top = 188
  end
  object qryInfRendimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDINFORME,'
      '  NOMEINFORME'
      ''
      'FROM'
      '  INFORME'
      ''
      'ORDER BY'
      '  NOMEINFORME')
    ValidateWithMask = True
    Left = 416
    Top = 279
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM PROVDESC'
      '    ')
    ValidateWithMask = True
    Left = 417
    Top = 212
    object qryAuxIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
    end
    object qryAuxIDINFORME: TFloatField
      FieldName = 'IDINFORME'
      Origin = 'BASEDADOS.PROVDESC.IDINFORME'
    end
  end
end
