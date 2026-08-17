inherited frmSuspendeBeneficio: TfrmSuspendeBeneficio
  Left = 38
  Top = 85
  HelpContext = 160105
  Caption = 'Suspensão de Benefícios'
  ClientHeight = 451
  ClientWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 161
    Width = 754
    Height = 251
    object DBgrdBeneficio: TwwDBGrid
      Left = 1
      Top = 34
      Width = 752
      Height = 216
      Selected.Strings = (
        'MATRICULA'#9'8'#9'Matricula'
        'NOME'#9'35'#9'Nome'
        'BENEFICIO'#9'29'#9'Benefício'
        'DATALIMITERECAD'#9'11'#9'Data Limite')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = DBgrdBeneficioDblClick
      IndicatorColor = icBlack
      object DBgrdBeneficioIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 13
        Height = 25
        AllowAllUp = True
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 752
      Height = 33
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Benefícios Pendentes de Recadastramento até '
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 754
    inherited tb97Fundo: TToolbar97
      Left = 400
      DockPos = 400
      inherited sep1: TToolbarSep97
        Left = 161
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 244
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 163
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
      end
      object btnSuspende: TBitBtn
        Left = 0
        Top = 0
        Width = 161
        Height = 33
        Caption = 'Sus&pende Benefícios'
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F88888888887F88791919191919088878888888888878F791919191919
          19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
          19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
          190878F8888888888878879191919191908887F88888888887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 754
    Height = 161
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Filtros'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 24
      Width = 265
      Height = 49
      Caption = ' Tipo de Benefício '
      TabOrder = 0
      object dblkBeneficio: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Descrição do Benefício'#9'F')
        LookupTable = qryBenef
        LookupField = 'IDBENEFICIO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 283
      Top = 24
      Width = 145
      Height = 49
      Caption = ' Nº de Inscrição '
      TabOrder = 1
      object edtNrInscricao: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 437
      Top = 24
      Width = 145
      Height = 49
      Caption = ' Matrícula '
      TabOrder = 2
      object edtMatricula: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 80
      Width = 569
      Height = 49
      Caption = ' Nome (Participante ou Beneficiário) '
      TabOrder = 4
      object EdtNome: TEdit
        Left = 168
        Top = 16
        Width = 393
        Height = 21
        TabOrder = 0
      end
      object cbOpcao: TComboBox
        Left = 8
        Top = 16
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Começa com'
          'Termina com'
          'Igual a'
          'Possui o texto')
      end
    end
    object bbtnProcurar: TBitBtn
      Left = 604
      Top = 82
      Width = 133
      Height = 47
      Hint = 'Procurar participante'
      Caption = '&Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object GroupBox5: TGroupBox
      Left = 592
      Top = 24
      Width = 145
      Height = 49
      Caption = ' Data Limite '
      TabOrder = 3
      object dbDataLimite: TwwDBDateTimePicker
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
    Top = 683
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(ELEGPATRO PKELEGPATR) */'
      #9'BF.IDPLANOPREV,'
      '        BF.IDPESSJUR,'
      '        BF.IDTITULAR,'
      '        BF.IDBENEFICIO,'
      #9'BF.NUMEROPROCESSO ,'
      '        BF.IDPESSOA,'
      '        BF.SEQPROPOSTA,'
      '        BF.VALORATUAL,'
      '        BF.VALORTOTAL,'
      '        BF.VALORCOTAS,'
      '        BF.DATAINICIO,'
      '        BF.DATAFINAL,'
      '        BF.DATAFINALPREVISTA,'
      '        BF.FLGDATAPREVISTA,'
      '        BF.IDSITBENEFICIO,'
      '        BF.ULTMESPREPARO,'
      #9'E.MATRICULA,'
      '        P.NOME,'
      '        B.NOME AS BENEFICIO,'
      '        BF.DATALIMITERECAD'
      
        'FROM BENEFICIO B, BENEFBFCIARIO BF, ELEGPATRO E, PESSOA P, PARTP' +
        'REVPLAN PP'
      'WHERE     (BF.IDBENEFICIO = B.IDBENEFICIO) AND'
      
        '          (E.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFU' +
        'NDACAO = :IDFUNDACAO) ) AND '
      '      '#9' (BF.IDSITBENEFICIO = 1) AND'
      '          (BF.FLGSTATUS = '#39'P'#39') AND'
      '          (BF.DATALIMITERECAD <= :DATAATUAL) AND'
      '          (BF.IDPESSJUR = E.IDPESSJUR) AND'
      '          (BF.IDTITULAR = E.IDPESSOA) AND'
      '          (BF.IDPESSOA = P.IDPESSOA) AND'
      '          (E.IDPESSOA = PP.IDPESSOA) AND'
      '          (E.IDPESSJUR = PP.IDPESSJUR) AND'
      '          (PP.FLGDESATIVADO = 0)'
      'ORDER BY'
      '   P.NOME, BENEFICIO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 192
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAATUAL'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 224
    Top = 224
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  FLGDATAPREVISTA = :FLGDATAPREVISTA,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (DATAFINALPREVISTA, FLGDATAPREVISTA, IDSITBENEFICIO)'
      'values'
      '  (:DATAFINALPREVISTA, :FLGDATAPREVISTA, :IDSITBENEFICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 160
    Top = 224
  end
  object qryAtualiza: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   BENEFBFCIARIO'
      'SET'
      '   IDSITBENEFICIO = 2,'
      '   DATAFINALPREVISTA = :DATARETENCAO,'
      '   FLGDATAPREVISTA = 1'
      'WHERE'
      '   ('
      '   ( FLGSTATUS = '#39'P'#39' ) AND'
      '   ( DATALIMITERECAD <=:DATAATUAL ) AND'
      '   ( IDSITBENEFICIO = 1 ) AND'
      '   ( IDPLANOPREV = :IDPLANOPREV) AND'
      '   ( IDPESSJUR = :IDPESSJUR) AND'
      '   ( IDTITULAR = :IDTITULAR) AND'
      '   ( IDBENEFICIO = :IDBENEFICIO) AND'
      '   ( NUMEROPROCESSO = :NUMEROPROCESSO) AND'
      '   ( IDPESSOA = :IDPESSOA) AND'
      '   ( SEQPROPOSTA = :SEQPROPOSTA)'
      '   )'
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 144
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATARETENCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayWidth = 45
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 29
      FieldName = 'BENEFICIO'
      Origin = 'BENEFICIO.NOME'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Limite'
      DisplayWidth = 11
      FieldName = 'DATALIMITERECAD'
      Origin = 'BENEFBFCIARIO.DATALIMITERECAD'
    end
    object StringField3: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Visible = False
      Calculated = True
    end
    object FloatField1: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BENEFBFCIARIO.IDTITULAR'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDBENEFICIO'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BENEFBFCIARIO.NUMEROPROCESSO'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BENEFBFCIARIO.IDPESSOA'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BENEFBFCIARIO.SEQPROPOSTA'
      Visible = False
    end
    object StringField4: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BENEFBFCIARIO.NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'NUMCARTARECAD'
      Origin = 'BENEFBFCIARIO.NUMCARTARECAD'
      Visible = False
      Size = 4
    end
    object DateTimeField2: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Emissão'
      DisplayWidth = 11
      FieldName = 'DATAEMISSAORECAD'
      Origin = 'BENEFBFCIARIO.DATAEMISSAORECAD'
      Visible = False
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATARECEBRECAD'
      Origin = 'BENEFBFCIARIO.DATARECEBRECAD'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BENEFBFCIARIO.FLGSTATUS'
      Visible = False
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'BANCOINSS'
      Origin = 'BENEFBFCIARIO.BANCOINSS'
      Visible = False
      Size = 3
    end
    object FloatField8: TFloatField
      FieldName = 'MESRECIBOINSS'
      Origin = 'BENEFBFCIARIO.MESRECIBOINSS'
      Visible = False
      DisplayFormat = '00'
      MaxValue = 12
      MinValue = 1
    end
    object FloatField9: TFloatField
      FieldName = 'ANORECIBOINSS'
      Origin = 'BENEFBFCIARIO.ANORECIBOINSS'
      Visible = False
      DisplayFormat = '0000'
      MaxValue = 9999
      MinValue = 1
    end
    object StringField8: TStringField
      FieldName = 'CPF'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Visible = False
      Size = 18
    end
    object FloatField10: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDSITBENEFICIO'
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusBenef'
      Calculated = True
    end
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBENEFICIO, NOME'
      'FROM BENEFICIO'
      'WHERE IDBENEFICIO IN (SELECT  BP.IDBENEFICIO'
      
        '                          FROM    BENEFPLANPREV BP, PLANPREVPATR' +
        'O PLP, PATRO P'
      '                          WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                          AND     PLP.IDPESSJUR = P.IDPESSOA'
      
        '                          AND     BP.IDPLANOPREV = PLP.IDPLANOPR' +
        'EV'
      '                          )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 224
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
    Left = 561
    Top = 212
  end
end
