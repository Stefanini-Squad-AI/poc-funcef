inherited frmEstatisticaSPCNOVO: TfrmEstatisticaSPCNOVO
  Left = 517
  Top = 123
  HelpContext = 320014
  Caption = 'Relatório mensal para o SPC'
  ClientHeight = 455
  ClientWidth = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 458
    Height = 416
    object memResult: TMemo
      Left = 5
      Top = 1
      Width = 448
      Height = 409
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Gb: TGroupBox
      Left = 1
      Top = 1
      Width = 456
      Height = 265
      Align = alClient
      Caption = ' Dados do Processo '
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 17
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 171
        Top = 17
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object lblArqSaida: TLabel
        Left = 12
        Top = 60
        Width = 100
        Height = 13
        Caption = 'Arquivo de Saída'
      end
      object sbtArqSaida: TSpeedButton
        Left = 303
        Top = 75
        Width = 23
        Height = 22
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
        OnClick = sbtArqSaidaClick
      end
      object mebMes: TComboBox
        Left = 12
        Top = 34
        Width = 154
        Height = 21
        ItemHeight = 13
        TabOrder = 0
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
          'Dezembro')
      end
      object mebAno: TSpinEdit
        Left = 171
        Top = 34
        Width = 98
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object chkEventos: TCheckBox
        Left = 12
        Top = 109
        Width = 265
        Height = 17
        Caption = 'Não utilizar tabela de Eventos'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkEventosClick
      end
      object edArqSaida: TEdit
        Left = 12
        Top = 75
        Width = 289
        Height = 21
        TabOrder = 3
      end
      object memEventos: TMemo
        Left = 12
        Top = 130
        Width = 418
        Height = 47
        Color = clSilver
        Lines.Strings = (
          'Algumas informações podem não ser precisas devido a falta da '
          'informação dos eventos, principalmente quando se referirem'
          'a meses anteriores a posição atual do banco de dados.')
        ReadOnly = True
        TabOrder = 4
      end
      object chkListaExcel: TCheckBox
        Left = 12
        Top = 215
        Width = 265
        Height = 17
        Caption = 'APENAS gerar lista analítica em planilha'
        Color = clSilver
        ParentColor = False
        TabOrder = 5
        OnClick = chkEventosClick
      end
    end
    object memObs: TMemo
      Left = 1
      Top = 266
      Width = 456
      Height = 149
      Align = alBottom
      Color = clSilver
      Lines.Strings = (
        
          'Os benefícios de Pensão, Pecúlio e Resgate de Reserva devem ter ' +
          'seus'
        'códigos cadastrados conforme a seguir :'
        ''
        '. Pensão : 21000'
        '. Pecúlio : 41000'
        '. Resgate de Reserva : 61000'
        ' ')
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 458
    inherited tb97Fundo: TToolbar97
      Left = 244
      DockPos = 401
      inherited sep1: TToolbarSep97
        Left = 207
      end
      inherited sep3: TToolbarSep97
        Left = 102
      end
      inherited bbtnSair: TBitBtn
        Width = 102
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 105
        Width = 102
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 33
      inherited ToolbarSep971: TToolbarSep97
        Left = 102
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 102
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 105
        Width = 102
        Hint = 'Consultar Estatística já existente'
        Caption = 'Consultar'
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnCancelarClick
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
        NumGlyphs = 1
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 985
    Top = 10
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object OpenDlg: TOpenDialog
    DefaultExt = 'txt'
    Title = 'Indique o caminho e o nome para o Arquivo de Saída'
    Left = 437
    Top = 65524
  end
  object qryPatroPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.CODFUNDSPC, PLP.IDPESSJUR, PLP.IDPLANOPREV'
      'FROM   FUNDACAO F, PATRO PT, PLANPREVPATRO PLP'
      'WHERE  F.IDPESSOA    = :IDFUNDACAO'
      'AND    PT.IDFUNDACAO = F.IDPESSOA'
      'AND    PLP.IDPESSJUR = PT.IDPESSOA'
      'ORDER BY PLP.IDPESSJUR, PLP.IDPLANOPREV')
    ValidateWithMask = True
    Left = 421
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstatisticas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EST.ANOMES, EST.CODARVORE,'
      #9'    EST.CODBENEFSPC, EST.TOTANTERIOR, EST.TOTCONCEDIDO,'
      #9'    EST.TOTCANCELADO, EST.IDFUNDACAO'
      'FROM   ESTBENEFSPC EST'
      'WHERE  EST.ANOMES = :ANOMES'
      'AND    EST.CODARVORE   = :CODARVORE'
      ' '
      ' '
      ' ')
    UpdateObject = updEstatisticas
    ValidateWithMask = True
    Left = 385
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODARVORE'
        ParamType = ptUnknown
      end>
  end
  object updEstatisticas: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTBENEFSPC'
      'set'
      '  CODBENEFSPC = :CODBENEFSPC,'
      '  TOTANTERIOR = :TOTANTERIOR,'
      '  TOTCONCEDIDO = :TOTCONCEDIDO,'
      '  TOTCANCELADO = :TOTCANCELADO,'
      '  IDFUNDACAO = :IDFUNDACAO'
      'where'
      '  ANOMES = :OLD_ANOMES and'
      '  CODARVORE = :OLD_CODARVORE')
    InsertSQL.Strings = (
      'insert into ESTBENEFSPC'
      
        '  (ANOMES, CODARVORE, CODBENEFSPC, TOTANTERIOR, TOTCONCEDIDO, TO' +
        'TCANCELADO, IDFUNDACAO)'
      'values'
      
        '  (:ANOMES, :CODARVORE, :CODBENEFSPC, :TOTANTERIOR, :TOTCONCEDID' +
        'O, :TOTCANCELADO, :IDFUNDACAO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from ESTBENEFSPC'
      'where'
      '  ANOMES = :OLD_ANOMES and'
      '  CODARVORE = :OLD_CODARVORE')
    Left = 396
    Top = 214
  end
  object qryAposentadoriasOLD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BPP.IDPESSJUR, BPP.IDPLANOPREV,'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      #9'NVL(SUM(ANT.BENEFANTERIORES),0) AS TOTANTERIOR,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS TOTCANCELADO,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO,'
      ''
      '        SUM(NVL(ANT.BENEFANTERIORES,0)-'
      '            NVL(CAN.BENEFCANCELADOS,0)+'
      '            NVL(CON.BENEFCONCEDIDOS,0)) AS TOTATUAL'
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP,'
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '     (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT' +
        ' IDTITULAR) AS BENEFANTERIORES'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE (IDPESSJUR = :IDPESSJUR) AND'
      '            (IDPLANOPREV = :IDPLANOPREV) AND'
      '            (IDTITULAR = IDPESSOA) AND'
      '            (DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      
        '            ((DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) OR (D' +
        'ATAFINAL IS NULL))'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) ANT,'
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '     (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINC' +
        'T IDTITULAR)  AS BENEFCANCELADOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  IDPESSJUR = :IDPESSJUR AND'
      '             IDPLANOPREV = :IDPLANOPREV AND'
      '             IDTITULAR = IDPESSOA AND'
      '             DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCEASSAO ENTRE PARAMETROS DE I' +
        'NICIO E FIM */'
      
        '     (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINC' +
        'T IDTITULAR)  AS BENEFCONCEDIDOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  IDPESSJUR = :IDPESSJUR AND'
      '             IDPLANOPREV = :IDPLANOPREV AND'
      '             IDTITULAR = IDPESSOA AND'
      '             DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      ''
      ''
      ''
      ''
      'WHERE (BPP.IDPESSJUR = :IDPESSJUR) AND'
      '      (BPP.IDPLANOPREV = :IDPLANOPREV) AND'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      
        '    (RTRIM(BNF.CODBENEFSPC) NOT IN ('#39'61000'#39','#39'61100'#39','#39'61200'#39') ) A' +
        'ND '
      '    (BPP.IDBENEFICIO = BNF.IDBENEFICIO)    AND'
      '    (BPP.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = ANT.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = ANT.IDPESSJUR(+))   AND'
      '    (BPP.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (BPP.IDBENEFICIO = CON.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = CON.IDPESSJUR(+))'
      'GROUP BY BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.CODBENEFSPC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 242
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
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
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
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
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
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 392
    Top = 65527
  end
  object qryPensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(SUM(DECODE(CONC.ERAAPOSENTADO,1,CONC.BENEFCONCEDIDOS,' +
        '0)),0) AS TOTCONCEDIDOAPOSENTADO,'
      
        '       NVL(SUM(DECODE(CONC.ERAAPOSENTADO,0,0,CONC.BENEFCONCEDIDO' +
        'S)),0) AS TOTCONCEDIDOATIVO,'
      
        '       NVL(SUM(DECODE(CANC.ERAAPOSENTADO,1,CANC.BENEFCANCELADOS,' +
        '0)),0) AS TOTCANCELADOAPOSENTADO,'
      
        '       NVL(SUM(DECODE(CANC.ERAAPOSENTADO,0,0,CANC.BENEFCANCELADO' +
        'S)),0) AS TOTCANCELADOATIVO'
      'FROM CM.BENEFICIO BNF,'
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '(SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL, 0, ' +
        '1) AS ERAAPOSENTADO,'
      '        COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCONCEDIDOS'
      
        'FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTA' +
        'NT, BENEFICIO BANT'
      
        'WHERE   PENSAO.DATACONCESSAO    >= TO_DATE('#39'01/12/2002'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      
        'AND     PENSAO.DATACONCESSAO    <= TO_DATE('#39'31/12/2002'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      'AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO'
      'AND     B.CODBENEFSPC           = '#39'41000'#39
      'AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR'
      'AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV'
      'AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR'
      'AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR'
      'AND     HSTANT.MES(+)           = '#39'2002/11'#39
      'AND     HSTANT.MESREFERENCIA(+) = '#39'2002/11'#39
      'AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO'
      'AND     BANT.FLGBENEFTEMP(+)    = 0'
      'GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP ) CONC,'
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '     (SELECT  PENSAO.IDBENEFICIO, DECODE(BANT.FLGBENEFTEMP, NULL' +
        ', 0, 1) AS ERAAPOSENTADO,'
      '        COUNT(DISTINCT PENSAO.IDTITULAR)  AS BENEFCANCELADOS'
      
        'FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTA' +
        'NT, BENEFICIO BANT'
      
        'WHERE   PENSAO.DATACONCESSAO    >= TO_DATE('#39'01/12/2002'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      
        'AND     PENSAO.DATACONCESSAO    <= TO_DATE('#39'31/12/2002'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      'AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO'
      'AND     B.CODBENEFSPC           = '#39'41000'#39
      'AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR'
      'AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV'
      'AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR'
      'AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR'
      'AND     HSTANT.MES(+)           = '#39'2002/11'#39
      'AND     HSTANT.MESREFERENCIA(+) = '#39'2002/11'#39
      'AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO'
      'AND     BANT.FLGBENEFTEMP(+)    = 0'
      'AND     (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                     WHERE  H.MES            = '#39'2002/11'#39
      
        '                     AND    H.IDPLANOPREV    = PENSAO.IDPLANOPRE' +
        'V'
      
        '                     AND    H.IDBENEFICIO    = PENSAO.IDBENEFICI' +
        'O'
      
        '                     AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROC' +
        'ESSO'
      '                     AND    H.IDPESSJUR      = PENSAO.IDPESSJUR'
      '                     AND    H.IDTITULAR      = PENSAO.IDTITULAR'
      
        '                     AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORI' +
        'GEM'
      '                     AND    H.IDPESSOA       = PENSAO.IDPESSOA'
      
        '                     AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOST' +
        'A ) ) AND'
      '                NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                     WHERE  H.MES            = '#39'2002/12'#39
      
        '                     AND    H.IDPLANOPREV    = PENSAO.IDPLANOPRE' +
        'V'
      
        '                     AND    H.IDBENEFICIO    = PENSAO.IDBENEFICI' +
        'O'
      
        '                     AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROC' +
        'ESSO'
      '                     AND    H.IDPESSJUR      = PENSAO.IDPESSJUR'
      '                     AND    H.IDTITULAR      = PENSAO.IDTITULAR'
      
        '                     AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORI' +
        'GEM'
      '                     AND    H.IDPESSOA       = PENSAO.IDPESSOA'
      
        '                     AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOST' +
        'A ) )'
      '            )'
      'GROUP BY PENSAO.IDBENEFICIO, BANT.FLGBENEFTEMP) CANC'
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      'WHERE  (RTRIM(BNF.CODBENEFSPC)   = '#39'41000'#39')        AND'
      '       (BNF.IDBENEFICIO   = CONC.IDBENEFICIO(+))  AND'
      '       (BNF.IDBENEFICIO   = CANC.IDBENEFICIO(+))'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 68
    Top = 248
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      'SELECT'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      '        NVL(SUM(CON.BENEFMANTIDOS),0) AS TOTMANTIDOS,'
      '        NVL(SUM(CON.BENEFATIVOS),0)   AS TOTATIVOS'
      'FROM CM.BENEFICIO BNF,'
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      '  (SELECT  BF.IDBENEFICIO, '
      
        '           SUM(DECODE(SITUACAO.FLGSITFUNDACAO, '#39'MA'#39', 1, 0))  AS ' +
        'BENEFMANTIDOS,'
      
        '           SUM(DECODE(SITUACAO.FLGSITFUNDACAO, '#39'MA'#39', 0, 1))  AS ' +
        'BENEFATIVOS'
      '   FROM    BENEFBFCIARIO BF,'
      '           ( SELECT H.IDPESSOA, H.FLGSITFUNDACAO'
      '             FROM   HSTCONTRIBPREV H,'
      
        '                    ( SELECT H.IDPESSOA, MAX(H.MESREFERENCIA) MA' +
        'IORMES'
      
        '                      FROM   HSTCONTRIBPREV H, BENEFBFCIARIO BF,' +
        ' BENEFICIO B'
      '                      WHERE  B.CODBENEFSPC    = :CODBENEFSPC'
      '                      AND    BF.IDBENEFICIO   = B.IDBENEFICIO'
      
        '                      AND    BF.DATACONCESSAO >= TO_DATE(:DATAIN' +
        'I,'#39'DD/MM/YYYY'#39')'
      
        '                      AND    BF.DATACONCESSAO <= TO_DATE(:DATAFI' +
        'M,'#39'DD/MM/YYYY'#39')'
      '                      AND    H.IDPESSJUR      = BF.IDPESSJUR'
      '                      AND    H.IDPLANOPREV    = BF.IDPLANOPREV'
      '                      AND    H.IDPESSOA       = BF.IDPESSOA'
      '                      AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA'
      '                      GROUP BY H.IDPESSOA ) MAXMES'
      '             WHERE H.MESREFERENCIA = MAXMES.MAIORMES'
      '             AND   H.IDPESSOA      = MAXMES.IDPESSOA'
      '             ) SITUACAO'
      '   WHERE'
      '         BF.DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         BF.DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '         SITUACAO.IDPESSOA(+) = BF.IDPESSOA'
      '   GROUP BY BF.IDBENEFICIO ) CON'
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      '    (BNF.CODBENEFSPC = :CODBENEFSPC)       AND'
      '    (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      'GROUP BY BNF.CODBENEFSPC'
      ' ')
    ValidateWithMask = True
    Left = 100
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end>
  end
  object qryMantidosSemEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(CAN.TOTAL,0) AS TOTCANCELADO,'
      '       NVL(CON.TOTAL,0) AS TOTCONCEDIDO'
      'FROM /* POPULACAO CANCELADA */'
      '     ( SELECT 0 AS TOTAL FROM DUAL ) CAN,'
      '     /* POPULACAO CONCEDIDA */'
      '     (SELECT COUNT(PP.IDPESSOA) AS TOTAL'
      '      FROM   PARTPREVPLAN PP'
      
        '      WHERE  TO_CHAR(PP.INSCRICAODATA, '#39'YYYY/MM'#39') <= :ANOMESATUA' +
        'L'
      
        '      AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATAC' +
        'ANCELAMENTO, '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      '      AND    (PP.DATAINICIOMANUT  IS NOT NULL)'
      
        '      AND    TO_CHAR(PP.DATAINICIOMANUT , '#39'YYYY/MM'#39') < :ANOMESAT' +
        'UAL'
      '      AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST'
      
        '                          WHERE  HST.MES           = :ANOMESATUA' +
        'L'
      
        '                          AND    HST.MESREFERENCIA = :ANOMESATUA' +
        'L'
      
        '                          AND    HST.IDPESSJUR     = PP.IDPESSJU' +
        'R'
      
        '                          AND    HST.IDPLANOPREV   = PP.IDPLANOP' +
        'REV'
      '                          AND    HST.IDTITULAR     = PP.IDPESSOA'
      
        '                          AND    HST.SEQPROPOSTA   = PP.SEQPROPO' +
        'STA )'
      
        '      AND    EXISTS (SELECT 1 FROM EVENTOSPREV EV, EVENTOGERADOR' +
        ' EG'
      '                     WHERE  EG.FLGINTERNO = '#39'DM'#39
      
        '                     AND    EV.IDEVENTOGERADOR = EG.IDEVENTOGERA' +
        'DOR'
      '                     AND    EV.IDPESSJUR = PP.IDPESSJUR'
      '                     AND    EV.IDPESSOA  = PP.IDPESSOA'
      
        '                     AND    TO_CHAR(EV.DATAREGISTRO, '#39'YYYY/MM'#39') ' +
        '= :ANOMESATUAL)) con')
    ValidateWithMask = True
    Left = 36
    Top = 166
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end>
  end
  object qryAtivosSemEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(CAN.TOTAL,0) AS TOTCANCELADO,'
      '       NVL(CON.TOTAL,0) AS TOTCONCEDIDO'
      'FROM DUAL,'
      '     /* POPULACAO CANCELADA */'
      '     (SELECT COUNT(DISTINCT PP.IDPESSOA) AS TOTAL'
      '      FROM   PARTPREVPLAN PP'
      
        '      WHERE  TO_CHAR(PP.INSCRICAODATA, '#39'YYYY/MM'#39') <= :ANOMESATUA' +
        'L'
      '      AND    PP.DATACANCELAMENTO IS NOT NULL'
      
        '      AND    TO_CHAR(PP.DATACANCELAMENTO, '#39'YYYY/MM'#39') = :ANOMESAT' +
        'UAL'
      
        '      AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAI' +
        'NICIOMANUT , '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      ''
      '      AND    NOT EXISTS (SELECT 1'
      '                      FROM PARTPREVPLAN'
      '                      WHERE IDPESSJUR = PP.IDPESSJUR'
      '                      AND IDPESSOA = PP.IDPESSOA'
      '                      AND IDPLANOPREV <> PP.IDPLANOPREV'
      '                      AND DATACANCELAMENTO IS NULL)'
      ''
      '      AND    NOT EXISTS ( SELECT 1'
      '                          FROM   PARTPREVPLAN ATOUTROPLANO'
      
        '                          WHERE  TO_CHAR(ATOUTROPLANO.INSCRICAOD' +
        'ATA, '#39'YYYY/MM'#39') = :ANOMESATUAL'
      
        '                          AND    ((ATOUTROPLANO.DATACANCELAMENTO' +
        ' IS NULL) OR (TO_CHAR(ATOUTROPLANO.DATACANCELAMENTO, '#39'YYYY/MM'#39') ' +
        '> :ANOMESATUAL))'
      
        '                          AND    ((ATOUTROPLANO.DATAINICIOMANUT ' +
        ' IS NULL) OR (TO_CHAR(ATOUTROPLANO.DATAINICIOMANUT , '#39'YYYY/MM'#39') ' +
        '> :ANOMESATUAL))'
      
        '                          AND    NOT EXISTS ( SELECT 1 FROM HSTB' +
        'ENEFBFCIARIO HST'
      
        '                                              WHERE  HST.MES    ' +
        '       = :ANOMESATUAL'
      
        '                                              AND    HST.MESREFE' +
        'RENCIA = :ANOMESATUAL'
      
        '                                              AND    HST.IDPESSJ' +
        'UR     = ATOUTROPLANO.IDPESSJUR'
      
        '                                              AND    HST.IDPLANO' +
        'PREV   = ATOUTROPLANO.IDPLANOPREV'
      
        '                                              AND    HST.IDTITUL' +
        'AR     = ATOUTROPLANO.IDPESSOA'
      
        '                                              AND    HST.SEQPROP' +
        'OSTA   = ATOUTROPLANO.SEQPROPOSTA )'
      
        '                          AND    ATOUTROPLANO.IDPESSJUR   = PP.I' +
        'DPESSJUR'
      
        '                          AND    ATOUTROPLANO.IDPLANOPREV <> PP.' +
        'IDPLANOPREV'
      
        '                          AND    ATOUTROPLANO.IDPESSOA    = PP.I' +
        'DPESSOA'
      
        '                          AND    ATOUTROPLANO.SEQPROPOSTA = PP.S' +
        'EQPROPOSTA ) ) CAN,'
      '     /* POPULACAO CONCEDIDA */'
      '     (SELECT COUNT(DISTINCT PP.IDPESSOA) AS TOTAL'
      '      FROM   PARTPREVPLAN PP'
      '      WHERE  TO_CHAR(PP.INSCRICAODATA, '#39'YYYY/MM'#39') = :ANOMESATUAL'
      
        '      AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATAC' +
        'ANCELAMENTO, '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      
        '      AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP.DATAI' +
        'NICIOMANUT , '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      '      AND    NOT EXISTS (SELECT 1'
      '                      FROM PARTPREVPLAN'
      '                      WHERE IDPESSJUR = PP.IDPESSJUR'
      '                      AND IDPESSOA = PP.IDPESSOA'
      '                      AND IDPLANOPREV <> PP.IDPLANOPREV'
      '                      AND DATACANCELAMENTO IS NULL)'
      '      AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST'
      
        '                          WHERE  HST.MES           = :ANOMESATUA' +
        'L'
      
        '                          AND    HST.MESREFERENCIA = :ANOMESATUA' +
        'L'
      
        '                          AND    HST.IDPESSJUR     = PP.IDPESSJU' +
        'R'
      
        '                          AND    HST.IDPLANOPREV   = PP.IDPLANOP' +
        'REV'
      '                          AND    HST.IDTITULAR     = PP.IDPESSOA'
      
        '                          AND    HST.SEQPROPOSTA   = PP.SEQPROPO' +
        'STA ) ) CON'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 36
    Top = 299
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end>
  end
  object qryAssistidosSemEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.POPANTERIOR,0)  AS TOTANTERIOR,'
      '       NVL(CAN.POPCANCELADO,0) AS TOTCANCELADO,'
      '       NVL(CON.POPCONCEDIDO,0) AS TOTCONCEDIDO,'
      '       (NVL(ANT.POPANTERIOR,0)-'
      '       NVL(CAN.POPCANCELADO,0)+'
      '       NVL(CON.POPCONCEDIDO,0)) AS TOTATUAL'
      ''
      'FROM DUAL,'
      ''
      
        '(SELECT EP.IDPLANOPREV, EP.IDPESSJUR, COUNT(EP.IDPESSOA) AS POPA' +
        'NTERIOR'
      '/* POPULACAO ANTERIOR */'
      ' FROM CM.BENEFBFCIARIO EP,'
      '     (SELECT IDPESSOA, MAX(DATAINICIOFUND) DATAEVENTO'
      '      FROM  CM.BENEFBFCIARIO'
      '      WHERE DATAINICIOFUND < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      AND   IDTITULAR = IDPESSOA'
      '      AND   IDPESSJUR = :IDPESSJUR'
      '      AND   IDPLANOPREV = :IDPLANOPREV'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA       = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAINICIOFUND = MAXEVENTO.DATAEVENTO'
      ' GROUP BY EP.IDPLANOPREV, EP.IDPESSJUR) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCANCELA' +
        'DO'
      ''
      ' FROM CM.BENEFBFCIARIO EP,'
      '     (SELECT IDPESSOA, MAX(DATAFINAL) DATAEVENTO'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '            DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '            IDTITULAR = IDPESSOA'
      '      AND   IDPESSJUR = :IDPESSJUR'
      '      AND   IDPLANOPREV = :IDPLANOPREV'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ' WHERE'
      '     EP.IDPESSOA          = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAFINAL         = MAXEVENTO.DATAEVENTO'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      
        '(SELECT EP.IDPLANOPREV, EP.IDPESSJUR, COUNT(EP.IDPESSOA) AS POPC' +
        'ONCEDIDO'
      ''
      ' FROM CM.BENEFBFCIARIO EP,'
      '     (SELECT IDPESSOA, MAX(DATACONCESSAO) DATAEVENTO'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE'
      '           DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '           IDTITULAR = IDPESSOA'
      '      AND   IDPESSJUR = :IDPESSJUR'
      '      AND   IDPLANOPREV = :IDPLANOPREV'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATACONCESSAO = MAXEVENTO.DATAEVENTO'
      ' GROUP BY EP.IDPLANOPREV, EP.IDPESSJUR) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      ''
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
    ValidateWithMask = True
    Left = 28
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
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
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
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
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoInicial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RTRIM(CODARVORE) AS CODARVORE,'
      
        '       NVL(TOTANTERIOR,0) + NVL(TOTCONCEDIDO,0) - NVL(TOTCANCELA' +
        'DO,0) AS SALDOMESANTERIOR'
      'FROM   ESTBENEFSPC'
      'WHERE  ANOMES = :ANOMESANTERIOR'
      'ORDER BY CODARVORE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 389
    Top = 132
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESANTERIOR'
        ParamType = ptUnknown
      end>
  end
  object qryAposentadorias: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS TOTCANCELADO,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO'
      'FROM    BENEFICIO BNF,'
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '     (SELECT  BF.IDBENEFICIO, COUNT(DISTINCT BF.IDTITULAR)  AS B' +
        'ENEFCANCELADOS'
      '      FROM    BENEFBFCIARIO BF'
      
        '      WHERE   BF.DATAFINAL     >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ' AND'
      
        '              BF.DATAFINAL     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ' AND'
      '      (        (EXISTS (SELECT 1 FROM MOVBENEF M'
      '                       WHERE  M.TIPOMOV        = 4'
      
        '                       AND    M.DATAMOV        >= TO_DATE(:DATAI' +
        'NI,'#39'DD/MM/YYYY'#39')'
      
        '                       AND    M.DATAMOV        <= TO_DATE(:DATAF' +
        'IM,'#39'DD/MM/YYYY'#39')'
      '                       AND    M.IDPLANOPREV    = BF.IDPLANOPREV'
      '                       AND    M.IDBENEFICIO    = BF.IDBENEFICIO'
      
        '                       AND    M.NUMEROPROCESSO = BF.NUMEROPROCES' +
        'SO'
      '                       AND    M.IDPESSJUR      = BF.IDPESSJUR'
      '                       AND    M.IDTITULAR      = BF.IDTITULAR'
      
        '                       AND    M.IDPLANOORIGEM  = BF.IDPLANOORIGE' +
        'M'
      '                       AND    M.IDPESSOA       = BF.IDPESSOA'
      
        '                       AND    M.SEQPROPOSTA    = BF.SEQPROPOSTA ' +
        ')'
      '             )'
      '      OR'
      '             (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                       WHERE  H.MES            = :ANOMESANT'
      '                       AND    H.IDPLANOPREV    = BF.IDPLANOPREV'
      '                       AND    H.IDBENEFICIO    = BF.IDBENEFICIO'
      
        '                       AND    H.NUMEROPROCESSO = BF.NUMEROPROCES' +
        'SO'
      '                       AND    H.IDPESSJUR      = BF.IDPESSJUR'
      '                       AND    H.IDTITULAR      = BF.IDTITULAR'
      
        '                       AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGE' +
        'M'
      '                       AND    H.IDPESSOA       = BF.IDPESSOA'
      
        '                       AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ' +
        ') ) AND'
      '                NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                       WHERE  H.MES            = :ANOMESATUAL'
      '                       AND    H.IDPLANOPREV    = BF.IDPLANOPREV'
      '                       AND    H.IDBENEFICIO    = BF.IDBENEFICIO'
      
        '                       AND    H.NUMEROPROCESSO = BF.NUMEROPROCES' +
        'SO'
      '                       AND    H.IDPESSJUR      = BF.IDPESSJUR'
      '                       AND    H.IDTITULAR      = BF.IDTITULAR'
      
        '                       AND    H.IDPLANOORIGEM  = BF.IDPLANOORIGE' +
        'M'
      '                       AND    H.IDPESSOA       = BF.IDPESSOA'
      
        '                       AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA ' +
        ') )'
      '             )'
      '      )'
      '      GROUP BY BF.IDBENEFICIO ) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCEASSAO ENTRE PARAMETROS DE I' +
        'NICIO E FIM */'
      
        '     (SELECT  IDBENEFICIO, COUNT(DISTINCT IDTITULAR)  AS BENEFCO' +
        'NCEDIDOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDBENEFICIO) CON'
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      'WHERE (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      
        '      (NOT (RTRIM(BNF.CODBENEFSPC) IN ('#39'41000'#39','#39'41100'#39','#39'41200'#39','#39 +
        '61000'#39','#39'61100'#39','#39'61200'#39')) ) AND'
      '      (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '      (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      'GROUP BY BNF.CODBENEFSPC'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 413
    Top = 284
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
  object qryPensaoPorBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(SUM(CONC.BENEFCONCEDIDOS),0) AS TOTCONCEDIDO,'
      '       NVL(SUM(CANC.BENEFCANCELADOS),0) AS TOTCANCELADO'
      'FROM CM.BENEFICIO BNF,'
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      '(SELECT  PENSAO.IDBENEFICIO,'
      '        COUNT(DISTINCT PENSAO.IDPESSOA)  AS BENEFCONCEDIDOS'
      
        'FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTA' +
        'NT, BENEFICIO BANT'
      
        'WHERE   PENSAO.DATACONCESSAO    >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39 +
        ')'
      
        'AND     PENSAO.DATACONCESSAO    <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        ')'
      'AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO'
      'AND     B.CODBENEFSPC           = :CODBENEFSPC'
      'AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR'
      'AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV'
      'AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR'
      'AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR'
      'AND     HSTANT.MES(+)           = :ANOMESANT'
      'AND     HSTANT.MESREFERENCIA(+) = :ANOMESANT'
      'AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO'
      'AND     BANT.FLGBENEFTEMP(+)    = 0'
      'GROUP BY PENSAO.IDBENEFICIO) CONC,'
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      '     (SELECT  PENSAO.IDBENEFICIO,'
      '        COUNT(DISTINCT PENSAO.IDPESSOA)  AS BENEFCANCELADOS'
      
        'FROM    BENEFBFCIARIO PENSAO, BENEFICIO B, HSTBENEFBFCIARIO HSTA' +
        'NT, BENEFICIO BANT'
      
        'WHERE   PENSAO.DATACONCESSAO    >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39 +
        ')'
      
        'AND     PENSAO.DATACONCESSAO    <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        ')'
      'AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO'
      'AND     B.CODBENEFSPC           = :CODBENEFSPC'
      'AND     HSTANT.IDPESSJUR(+)     = PENSAO.IDPESSJUR'
      'AND     HSTANT.IDPLANOPREV(+)   = PENSAO.IDPLANOPREV'
      'AND     HSTANT.IDTITULAR(+)     = PENSAO.IDTITULAR'
      'AND     HSTANT.IDPESSOA(+)      = PENSAO.IDTITULAR'
      'AND     HSTANT.MES(+)           = :ANOMESANT'
      'AND     HSTANT.MESREFERENCIA(+) = :ANOMESANT'
      'AND     BANT.IDBENEFICIO(+)     = HSTANT.IDBENEFICIO'
      'AND     BANT.FLGBENEFTEMP(+)    = 0'
      'AND     (  (EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                     WHERE  H.MES            = :ANOMESANT'
      
        '                     AND    H.IDPLANOPREV    = PENSAO.IDPLANOPRE' +
        'V'
      
        '                     AND    H.IDBENEFICIO    = PENSAO.IDBENEFICI' +
        'O'
      
        '                     AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROC' +
        'ESSO'
      '                     AND    H.IDPESSJUR      = PENSAO.IDPESSJUR'
      '                     AND    H.IDTITULAR      = PENSAO.IDTITULAR'
      
        '                     AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORI' +
        'GEM'
      '                     AND    H.IDPESSOA       = PENSAO.IDPESSOA'
      
        '                     AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOST' +
        'A ) ) AND'
      '                NOT ( EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H'
      '                     WHERE  H.MES            = :ANOMESATUAL'
      
        '                     AND    H.IDPLANOPREV    = PENSAO.IDPLANOPRE' +
        'V'
      
        '                     AND    H.IDBENEFICIO    = PENSAO.IDBENEFICI' +
        'O'
      
        '                     AND    H.NUMEROPROCESSO = PENSAO.NUMEROPROC' +
        'ESSO'
      '                     AND    H.IDPESSJUR      = PENSAO.IDPESSJUR'
      '                     AND    H.IDTITULAR      = PENSAO.IDTITULAR'
      
        '                     AND    H.IDPLANOORIGEM  = PENSAO.IDPLANOORI' +
        'GEM'
      '                     AND    H.IDPESSOA       = PENSAO.IDPESSOA'
      
        '                     AND    H.SEQPROPOSTA    = PENSAO.SEQPROPOST' +
        'A ) )'
      '            )'
      'GROUP BY PENSAO.IDBENEFICIO) CANC'
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      'WHERE  (RTRIM(BNF.CODBENEFSPC)   = :CODBENEFSPC)        AND'
      '       (BNF.IDBENEFICIO   = CONC.IDBENEFICIO(+))  AND'
      '       (BNF.IDBENEFICIO   = CANC.IDBENEFICIO(+))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end>
  end
  object qryDesignados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(CANC.TOTAL,0) AS TOTCANCELADO,'
      '       NVL(CON.TOTAL,0) AS TOTCONCEDIDO'
      'FROM DUAL,'
      '    (SELECT (TOTANTERIOR+TOTCONCEDIDO-TOTCANCELADO) AS TOTAL'
      '     FROM   ESTBENEFSPC'
      '     WHERE  ANOMES = :ANOMESANT'
      '     AND    CODBENEFSPC = '#39'84100'#39' ) TOTALANTES,'
      '    (SELECT COUNT(DISTINCT DP.IDPESSOA) AS TOTAL'
      '     FROM   DEPENTIT DP,'
      '           (SELECT PP.IDPESSOA'
      '            FROM   PARTPREVPLAN PP'
      
        '            WHERE  TO_CHAR(PP.INSCRICAODATA, '#39'YYYY/MM'#39') <= :ANOM' +
        'ESATUAL'
      
        '            AND    (TO_CHAR(PP.DATACANCELAMENTO, '#39'YYYY/MM'#39') = :A' +
        'NOMESATUAL)'
      
        '            AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP' +
        '.DATAINICIOMANUT , '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      '            AND    NOT EXISTS (SELECT 1'
      '                            FROM PARTPREVPLAN'
      '                            WHERE IDPESSJUR = PP.IDPESSJUR'
      '                            AND IDPESSOA = PP.IDPESSOA'
      '                            AND IDPLANOPREV <> PP.IDPLANOPREV'
      '                            AND DATACANCELAMENTO IS NULL)'
      
        '            AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO H' +
        'ST'
      
        '                                WHERE  HST.MES           = :ANOM' +
        'ESATUAL'
      
        '                                AND    HST.MESREFERENCIA = :ANOM' +
        'ESATUAL'
      
        '                                AND    HST.IDPESSJUR     = PP.ID' +
        'PESSJUR'
      
        '                                AND    HST.IDPLANOPREV   = PP.ID' +
        'PLANOPREV'
      
        '                                AND    HST.IDTITULAR     = PP.ID' +
        'PESSOA'
      
        '                                AND    HST.SEQPROPOSTA   = PP.SE' +
        'QPROPOSTA ) ) ATIVOS'
      '     WHERE DP.IDTITULAR = ATIVOS.IDPESSOA'
      '     AND   ((DP.FLGDESIGNADO = 1) OR (DP.FLGDEPLEGAL = 1))'
      '     AND   DP.FLGCONTAIMPOSTOR = 1 '
      
        '     AND   TO_CHAR(DP.DATACADASTRO,'#39'YYYY/MM'#39') <= :ANOMESATUAL   ' +
        ' )  CANC,  '
      ''
      '    (SELECT COUNT(DISTINCT DP.IDPESSOA) AS TOTAL'
      '     FROM   DEPENTIT DP,'
      '           (SELECT PP.IDPESSOA'
      '            FROM   PARTPREVPLAN PP'
      
        '            WHERE  TO_CHAR(PP.INSCRICAODATA, '#39'YYYY/MM'#39') = :ANOME' +
        'SATUAL'
      
        '            AND    ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP' +
        '.DATACANCELAMENTO, '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      
        '            AND    ((PP.DATAINICIOMANUT  IS NULL) OR (TO_CHAR(PP' +
        '.DATAINICIOMANUT , '#39'YYYY/MM'#39') > :ANOMESATUAL))'
      '            AND    NOT EXISTS (SELECT 1'
      '                            FROM PARTPREVPLAN'
      '                            WHERE IDPESSJUR = PP.IDPESSJUR'
      '                            AND IDPESSOA = PP.IDPESSOA'
      '                            AND IDPLANOPREV <> PP.IDPLANOPREV'
      '                            AND DATACANCELAMENTO IS NULL)'
      
        '            AND    NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO H' +
        'ST'
      
        '                                WHERE  HST.MES           = :ANOM' +
        'ESATUAL'
      
        '                                AND    HST.MESREFERENCIA = :ANOM' +
        'ESATUAL'
      
        '                                AND    HST.IDPESSJUR     = PP.ID' +
        'PESSJUR'
      
        '                                AND    HST.IDPLANOPREV   = PP.ID' +
        'PLANOPREV'
      
        '                                AND    HST.IDTITULAR     = PP.ID' +
        'PESSOA'
      
        '                                AND    HST.SEQPROPOSTA   = PP.SE' +
        'QPROPOSTA ) ) ATIVOS'
      '     WHERE DP.IDTITULAR = ATIVOS.IDPESSOA  ) CON'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 291
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end>
  end
  object qryDesignadosAS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   NVL(CANC.TOTAL,0) AS TOTCANCELADO,      NVL(CON.TOTAL,0' +
        ') AS TOTCONCEDIDO'
      'FROM'
      '(SELECT COUNT(1) TOTAL'
      'FROM DEPENTIT DP, PESSOA P'
      'WHERE DP.IDPESSOA = P.IDPESSOA'
      'AND EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO'
      '            WHERE IDTITULAR = DP.IDTITULAR AND'
      '            IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICIO'
      '                            WHERE ((CODBENEFSPC <= '#39'11800'#39') OR'
      
        '                            (IDREGRALINHASPC IS NOT NULL)) AND F' +
        'LGRESGATE = 0)'
      '                       AND MESREFERENCIA = :ANOMESATUAL )'
      'AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO'
      '                WHERE IDTITULAR = DP.IDTITULAR AND'
      
        '                IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICI' +
        'O'
      
        '                                WHERE ((CODBENEFSPC <= '#39'11800'#39') ' +
        'OR'
      
        '                               (IDREGRALINHASPC IS NOT NULL)) AN' +
        'D FLGRESGATE = 0)'
      '                AND MESREFERENCIA < :ANOMESATUAL)'
      'AND NOT EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO'
      '                WHERE IDTITULAR = DP.IDTITULAR AND'
      '                IDPESSOA = DP.IDPESSOA AND'
      
        '                IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICI' +
        'O'
      
        '                                WHERE ((CODBENEFSPC <= '#39'11800'#39') ' +
        'OR'
      
        '                               (IDREGRALINHASPC IS NOT NULL)) AN' +
        'D FLGRESGATE = 0 ) )) CON,'
      '(SELECT COUNT(DISTINCT PENSAO.IDPESSOA)  AS TOTAL'
      'FROM    BENEFBFCIARIO PENSAO, BENEFICIO B , MOVBENEF M ,'
      'DEPENTIT DP'
      'WHERE'
      'DP.IDPESSOA = PENSAO.IDPESSOA AND'
      'DP.IDTITULAR = PENSAO.IDTITULAR AND'
      'M.IDLOTEMOV IN (SELECT IDLOTE FROM  CTRLINTERFACE'
      #9'WHERE FLGCONCESSAO = 1 AND'
      #9'MESREFERENCIA = :ANOMESATUAL )'
      'AND     M.TIPOMOV IN (0,1,7)'
      'AND     M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF)'
      '        FROM MOVBENEF WHERE IDPESSJUR = M.IDPESSJUR'
      '        AND IDPESSOA = M.IDPESSOA AND IDTITULAR = M.IDTITULAR'
      '        AND IDBENEFICIO = M.IDBENEFICIO'
      '        AND TIPOMOV  <> 13)'
      'AND     PENSAO.IDBENEFICIO = M.IDBENEFICIO'
      'AND     PENSAO.IDTITULAR = M.IDTITULAR'
      'AND     PENSAO.IDPESSOA = M.IDPESSOA'
      'AND     PENSAO.NUMEROPROCESSO = M.NUMEROPROCESSO'
      'AND     PENSAO.SEQPROPOSTA = M.SEQPROPOSTA'
      'AND     NVL(PENSAO.VALORATUAL,0) > 0'
      'AND     B.IDBENEFICIO           = PENSAO.IDBENEFICIO'
      'AND     B.CODBENEFSPC     IN ('#39'21000'#39','#39'21100'#39','#39'21200'#39') ) CANC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESATUAL'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = qryEstatisticas
    Left = 265
    Top = 135
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Excel|*.xls'
    InitialDir = 'c:\'
    Title = 'Find Excel File'
    Left = 344
    Top = 96
  end
  object qryBenefRef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1234567890123'#39' CODBENEFSPC,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' NOME,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' BENEFICIO,'
      '  '#39'1234567890123'#39' MATRICULA,'
      ''
      ''
      '  '#39'CONC'#39'        TIPO,'
      ''
      '  9999999       NUMEROPROCESSO,'
      '  9999999       IDPLANOPREV,'
      '  9999999       IDTITULAR,'
      '  9999999       IDPESSJUR,'
      '  9999999       IDBENEFICIO,'
      '  9999999       IDPESSOA,'
      '  1             SEQPROPOSTA,'
      '  3             IDSITBENEFICIO,'
      ''
      '  to_date('#39'06/09/2006'#39', '#39'DD/MM/YYYY'#39') AS DATAFINAL,'
      '  to_date('#39'06/09/2006'#39', '#39'DD/MM/YYYY'#39') AS DATAINICIO,'
      '  to_date('#39'06/09/2006'#39', '#39'DD/MM/YYYY'#39') AS DATAINICIOFUND,'
      '  to_date('#39'06/09/2006'#39', '#39'DD/MM/YYYY'#39') AS INSCRICAODATA,'
      ''
      '  '#39'0'#39'   VALORBASE1,'
      '  '#39'0'#39'   VALORBASE2,'
      '  '#39'0'#39'   VALORBASE3,'
      '  '#39'AT'#39'  FLGINTERNO,'
      '  '#39' '#39'   IDBENEFINSS,'
      '  '#39'1'#39'   IDSITPART'
      'FROM'
      '  DUAL'
      'WHERE'
      '  1 = 2')
    UpdateObject = updBenefRef
    ValidateWithMask = True
    Left = 320
    Top = 208
  end
  object updBenefRef: TUpdateSQL
    Left = 320
    Top = 192
  end
end
