inherited FrmGeraEstatisticas: TFrmGeraEstatisticas
  Left = 369
  Top = 77
  Caption = 'Geração do Arquivo de Estatísticas'
  ClientHeight = 408
  ClientWidth = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 369
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 418
      Height = 343
      ActivePage = SPC
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object SPC: TTabSheet
        Caption = 'SPC'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 410
          Height = 315
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Gb: TGroupBox
            Left = 17
            Top = 9
            Width = 344
            Height = 128
            Caption = ' Dados do Processo '
            TabOrder = 1
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
            object mebMes: TComboBox
              Left = 12
              Top = 34
              Width = 154
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'mebMes'
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
              Top = 60
              Width = 265
              Height = 17
              Caption = 'Não utilizar tabela de Eventos'
              TabOrder = 2
            end
          end
          object bbtnProcessarCalculo: TBitBtn
            Left = 88
            Top = 89
            Width = 161
            Height = 31
            Caption = 'Iniciar Processo'
            Default = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnProcessarCalculoClick
            Glyph.Data = {
              06010000424D060100000000000076000000280000000B000000120000000100
              0400000000009000000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
              000033833333333F00003088333333380000300883333337000030A088333338
              000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
              000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
              000030AA0333333800003070333333380000300333333338000030333333333F
              00003333333333300000}
          end
          object grpbLocalArquivo: TGroupBox
            Left = 17
            Top = 139
            Width = 345
            Height = 153
            Caption = ' Local de Gravação do Arquivo '
            TabOrder = 2
            object dirlbArquivos: TDirectoryListBox
              Left = 2
              Top = 15
              Width = 341
              Height = 106
              Align = alTop
              ItemHeight = 16
              TabOrder = 0
            end
            object drvcmbArquivos: TDriveComboBox
              Left = 7
              Top = 126
              Width = 331
              Height = 19
              DirList = dirlbArquivos
              TabOrder = 1
            end
          end
        end
      end
      object Resultado: TTabSheet
        Caption = 'Resultado'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 378
          Height = 297
          Align = alClient
          DataSource = DsArquivo
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
      end
    end
    object ProgressBar1: TProgressBar
      Left = 5
      Top = 348
      Width = 418
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 369
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 95
      DockPos = 95
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 31
    Top = 323
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 394
    Top = 131
  end
  object qryGeraEstat: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 260
    Top = 442
  end
  object updPatroSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTPATROSPC'
      'set'
      '  TOTFUNC = :TOTFUNC,'
      '  CODFUNDSPC = :CODFUNDSPC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES')
    InsertSQL.Strings = (
      'insert into ESTPATROSPC'
      '  (IDPESSJUR, ANOMES, TOTFUNC, CODFUNDSPC)'
      'values'
      '  (:IDPESSJUR, :ANOMES, :TOTFUNC, :CODFUNDSPC)')
    DeleteSQL.Strings = (
      'delete from ESTPATROSPC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES')
    Left = 427
    Top = 43
  end
  object updPlanoSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTPLANOSPC'
      'set'
      '  TOTATIVONOVO = :TOTATIVONOVO,'
      '  TOTATIVOCANC = :TOTATIVOCANC,'
      '  TOTMANTIDONOVO = :TOTMANTIDONOVO,'
      '  TOTMANTIDOCANC = :TOTMANTIDOCANC,'
      '  TOTMANTPARCNOVO = :TOTMANTPARCNOVO,'
      '  TOTMANTPARCCANC = :TOTMANTPARCCANC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into ESTPLANOSPC'
      
        '  (IDPESSJUR, ANOMES, IDPLANOPREV, TOTATIVONOVO, TOTATIVOCANC, T' +
        'OTMANTIDONOVO, '
      '   TOTMANTIDOCANC, TOTMANTPARCNOVO, TOTMANTPARCCANC)'
      'values'
      
        '  (:IDPESSJUR, :ANOMES, :IDPLANOPREV, :TOTATIVONOVO, :TOTATIVOCA' +
        'NC, :TOTMANTIDONOVO, '
      '   :TOTMANTIDOCANC, :TOTMANTPARCNOVO, :TOTMANTPARCCANC)')
    DeleteSQL.Strings = (
      'delete from ESTPLANOSPC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 427
    Top = 24
  end
  object updBenefSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTBENEFSPC'
      'set'
      '  CODARVORE = :CODARVORE,'
      '  CODBENEFSPC = :CODBENEFSPC,'
      '  TOTBENEFCONC = :TOTBENEFCONC,'
      '  TOTBENEFENC = :TOTBENEFENC,'
      '  TOTBENEFANT = :TOTBENEFANT'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into ESTBENEFSPC'
      
        '  (IDPESSJUR, ANOMES, IDPLANOPREV, IDBENEFICIO, CODARVORE, CODBE' +
        'NEFSPC, '
      '   TOTBENEFCONC, TOTBENEFENC, TOTBENEFANT)'
      'values'
      
        '  (:IDPESSJUR, :ANOMES, :IDPLANOPREV, :IDBENEFICIO, :CODARVORE, ' +
        ':CODBENEFSPC, '
      '   :TOTBENEFCONC, :TOTBENEFENC, :TOTBENEFANT)')
    DeleteSQL.Strings = (
      'delete from ESTBENEFSPC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  ANOMES = :OLD_ANOMES and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 427
    Top = 81
  end
  object qryPatroSpc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDPESSJUR, ANOMES, TOTFUNC, CODFUNDSPC'
      ''
      'FROM ESTPATROSPC')
    UpdateObject = updPatroSpc
    ValidateWithMask = True
    Left = 397
    Top = 52
  end
  object qryPlanoSpc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDPESSJUR, ANOMES, IDPLANOPREV,'
      '              TOTATIVONOVO, TOTATIVOCANC,'
      '              TOTMANTIDONOVO, TOTMANTIDOCANC,'
      '              TOTMANTPARCNOVO, TOTMANTPARCCANC'
      ''
      'FROM ESTPLANOSPC')
    UpdateObject = updPlanoSpc
    ValidateWithMask = True
    Left = 397
    Top = 24
  end
  object qryBenefSpc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDPESSJUR, ANOMES, IDPLANOPREV, IDBENEFICIO,'
      '               CODARVORE, CODBENEFSPC,'
      '               TOTBENEFCONC, TOTBENEFENC, TOTBENEFANT'
      ''
      'FROM ESTBENEFSPC')
    UpdateObject = updBenefSpc
    ValidateWithMask = True
    Left = 397
    Top = 81
  end
  object qryApagaEstat: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 292
    Top = 442
  end
  object qryGeraBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      QRY.CODBENEFSPC,'
      '      QRY.NOME,'
      '      QRY.CODFUNDSPC,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0)  ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, C' +
        'ODFUNDSPC'
      '      FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '      WHERE  (BF.IDPESSJUR     = PT.IDPESSOA)'
      '      AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      
        '      AND   (B.TIPOBENEFICIO IN (0,1,2,3,7,8,9,10,11,12,13,14,15' +
        ',16,99))'
      
        '      AND   (((BF.DATACONCESSAO >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '      AND   (BF.DATACONCESSAO   <  To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      
        '      OR    ((BF.DATAFINAL      >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '      AND   (BF.DATAFINAL       <  To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      '       FROM BENEFBFCIARIO BF, BENEFICIO B'
      '       WHERE (BF.IDSITBENEFICIO = 1)'
      
        '       AND   (B.TIPOBENEFICIO IN (0,1,2,3,7,8,9,10,11,12,13,14,1' +
        '5,16,99))'
      '       AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '       AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '       AND (BF.IDBENEFICIO = B.IDBENEFICIO)'
      '       GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '************/'
      
        '       (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCE' +
        'LADO'
      '        FROM BENEFBFCIARIO BF, BENEFICIO B'
      '        WHERE (BF.IDSITBENEFICIO = 1)'
      
        '        AND   (B.TIPOBENEFICIO IN (0,1,2,3,7,8,9,10,11,12,13,14,' +
        '15,16,99))'
      '        AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '        AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '        AND (BF.IDBENEFICIO = B.IDBENEFICIO)'
      '        GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '***********/'
      
        '       (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTER' +
        'IOR'
      '        FROM BENEFBFCIARIO BF, BENEFICIO B'
      '        WHERE (BF.IDSITBENEFICIO = 1)'
      
        '        AND (B.TIPOBENEFICIO IN (0,1,2,3,7,8,9,10,11,12,13,14,15' +
        ',16,99))'
      '        AND   (BF.DATACONCESSAO<To_Date(:DataIni,'#39'DD/MM/YYYY'#39' ))'
      '        AND   (BF.IDBENEFICIO = B.IDBENEFICIO)'
      '        GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '***********/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      '')
    ValidateWithMask = True
    Left = 325
    Top = 442
    ParamData = <
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end>
  end
  object qrySitBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,10200,10201) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 4)'
      
        '       AND   (((BF.DATACONCESSAO >= To_Date(:DataIni,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND   (BF.DATACONCESSAO   <  To_Date(:DataFim,'#39'DD/MM/YYYY' +
        #39')))'
      
        '       OR    ((BF.DATAFINAL      >= To_Date(:DataIni,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND   (BF.DATAFINAL       <  To_Date(:DataFim,'#39'DD/MM/YYYY' +
        #39'))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY3.CODBENEFSPC(+))'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,10200,10202) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 4)'
      
        '       AND   (((BF.DATACONCESSAO   >= To_Date(:DataIni,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND   (BF.DATACONCESSAO <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      '       OR    ((BF.DATAFINAL   >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      
        '       AND   (BF.DATAFINAL     <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 4)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY3.CODBENEFSPC(+))'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,20100,20101) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 5)'
      
        '       AND   (((BF.DATACONCESSAO >= To_Date(:DataIni,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND   (BF.DATACONCESSAO   <   To_Date(:DataFim,'#39'DD/MM/YYY' +
        'Y'#39')))'
      
        '       OR    ((BF.DATAFINAL      >= To_Date(:DataIni,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND   (BF.DATAFINAL       <   To_Date(:DataFim,'#39'DD/MM/YYY' +
        'Y'#39'))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY3.CODBENEFSPC(+))'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,20100,20102) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 5)'
      
        '       AND   (((BF.DATACONCESSAO   >= To_Date(:DataIni,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND   (BF.DATACONCESSAO <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      '       OR    ((BF.DATAFINAL   >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      
        '       AND   (BF.DATAFINAL     <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY3.CODBENEFSPC(+))'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,20100,20104) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 5)'
      
        '       AND   (((BF.DATACONCESSAO   >= To_Date(:DataIni,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND   (BF.DATACONCESSAO <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      '       OR    ((BF.DATAFINAL   >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      
        '       AND   (BF.DATAFINAL     <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 5)'
      '      AND   (SP.FLGINTERNO = '#39'AS'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,30000,30100) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 6)'
      
        '       AND   (((BF.DATACONCESSAO   >= To_Date(:DataIni,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND   (BF.DATACONCESSAO <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      '       OR    ((BF.DATAFINAL   >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      
        '       AND   (BF.DATAFINAL     <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO IN ('#39'AT'#39','#39'MP'#39'))'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'UNION'
      'SELECT'
      '      QRY.CODFUNDSPC,'
      '      DECODE(QRY.CODBENEFSPC,30000,30200) AS CODBENEFSPC,'
      '      QRY.NOME,'
      '      NVL(QRY1.CONCEDIDO,0) CONCEDIDO,'
      '      NVL(QRY2.CANCELADO,0) CANCELADO,'
      '      NVL(QRY3.ANTERIOR,0) ANTERIOR'
      'FROM'
      
        '      (SELECT DISTINCT B.TIPOBENEFICIO, B.CODBENEFSPC, B.NOME, F' +
        'U.CODFUNDSPC'
      '       FROM BENEFICIO B, BENEFBFCIARIO BF, FUNDACAO FU, PATRO PT'
      '       WHERE (BF.IDPESSJUR     = PT.IDPESSOA)'
      '       AND   (PT.IDFUNDACAO     = FU.IDPESSOA)'
      '       AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '       AND   (B.TIPOBENEFICIO = 6)'
      
        '       AND   (((BF.DATACONCESSAO   >= To_Date(:DataIni,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND   (BF.DATACONCESSAO <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        ')))'
      '       OR    ((BF.DATAFINAL   >= To_Date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      
        '       AND   (BF.DATAFINAL     <   To_Date(:DataFim,'#39'DD/MM/YYYY'#39 +
        '))))) QRY,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CONCED' +
        'IDO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATACONCESSAO>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATACONCESSAO<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY1,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS CANCEL' +
        'ADO'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      '      AND   (BF.DATAFINAL>=To_date(:DataIni,'#39'DD/MM/YYYY'#39'))'
      '      AND   (BF.DATAFINAL<To_Date(:DataFim,'#39'DD/MM/YYYY'#39' ))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY2,'
      
        '/***************************************************************' +
        '*************/'
      
        '      (SELECT B.TIPOBENEFICIO, B.CODBENEFSPC, COUNT(*) AS ANTERI' +
        'OR'
      
        '      FROM  SITPART  SP, EVENTOSPREV EV, PROCESSOBENEF P , BENEF' +
        'ICIO B, BENEFBFCIARIO BF'
      '      WHERE (B.TIPOBENEFICIO = 6)'
      '      AND   (SP.FLGINTERNO = '#39'MA'#39')'
      '      AND   (B.IDBENEFICIO = BF.IDBENEFICIO)'
      '      AND   (BF.SEQPROPOSTA      = 1)'
      '      AND   (BF.NUMEROPROCESSO   = P.NUMEROPROCESSO)'
      '      AND   (P.IDEVENTOGERADOR   = EV.IDEVENTOGERADOR)'
      '      AND   (BF.IDPESSJUR        = EV.IDPESSJUR)'
      '      AND   (BF.IDPLANOPREV      = EV.IDPLANOPREV)'
      '      AND   (BF.IDTITULAR        = EV.IDPESSOA)'
      '      AND   (BF.SEQPROPOSTA      = EV.SEQPROPOSTA)'
      '      AND   (EV.IDSITPARTATUAL   = SP.IDSITPART)'
      
        '      AND   (BF.DATACONCESSAO    < To_date(:DataIni,'#39'DD/MM/YYYY'#39 +
        '))'
      '      GROUP BY B.TIPOBENEFICIO, B.CODBENEFSPC) QRY3'
      
        '/***************************************************************' +
        '*************/'
      'WHERE (QRY.TIPOBENEFICIO =  QRY1.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY1.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY2.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY2.CODBENEFSPC(+))'
      'AND   (QRY.TIPOBENEFICIO =  QRY3.TIPOBENEFICIO(+))'
      'AND   (QRY.CODBENEFSPC   =  QRY3.CODBENEFSPC(+))'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 234
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataIni'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaDados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO,'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      ''
      #9'NVL(SUM(ANT.BENEFANTERIORES),0) AS BENEFANTERIORES,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS BENEFCANCELADOS,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS BENEFCONCEDIDOS,'
      ''
      '        SUM(NVL(ANT.BENEFANTERIORES,0)-'
      '            NVL(CAN.BENEFCANCELADOS,0)+'
      '            NVL(CON.BENEFCONCEDIDOS,0)) AS BENEFATUAIS'
      ''
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP,'
      ''
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '     (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT' +
        ' IDTITULAR) AS BENEFANTERIORES'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) AND'
      '            (DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '     (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINC' +
        'T IDTITULAR)  AS BENEFCANCELADOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCEASSAO ENTRE PARAMETROS DE I' +
        'NICIO E FIM */'
      
        '     (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINC' +
        'T IDTITULAR)  AS BENEFCONCEDIDOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
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
      ''
      
        'GROUP BY BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO, BNF.CO' +
        'DBENEFSPC'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 44
    Top = 527
    ParamData = <
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
      end>
  end
  object QryArquivo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'             '#39' AS CODFUND,'
      '       '#39'             '#39' AS CODIGO,'
      
        '       '#39'                                                        ' +
        ' '#39' AS DESCRICAO,'
      '       0   AS ANTERIOR,'
      '       0   AS CONCEDIDO,'
      '       0   AS CANCELADO,'
      '       0   AS ATUAL'
      'FROM DUAL'
      'ORDER BY CODIGO')
    UpdateObject = UpdArquivo
    ValidateWithMask = True
    Left = 133
    Top = 321
  end
  object UpdArquivo: TUpdateSQL
    Left = 101
    Top = 321
  end
  object DsArquivo: TwwDataSource
    DataSet = QryArquivo
    Left = 61
    Top = 270
  end
  object QryPensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO,'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      ''
      '        NVL(SUM(ANT.BENEFANTERIORES),0) AS BENEFANTERIORES,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS BENEFCANCELADOS,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS BENEFCONCEDIDOS,'
      ''
      '        SUM(NVL(ANT.BENEFANTERIORES,0)-'
      '            NVL(CAN.BENEFCANCELADOS,0)+'
      '            NVL(CON.BENEFCONCEDIDOS,0)) AS BENEFATUAIS'
      ''
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP,'
      ''
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '  (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT ID' +
        'TITULAR) AS BENEFANTERIORES'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                TRIM(B.CODBENEFSPC) = :CODBENEFS' +
        'PC       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      '            WHERE'
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCANCELADOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '        '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                RTRIM(B.CODBENEFSPC) = :CODBENEF' +
        'SPC       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCONCEDIDOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                RTRIM(B.CODBENEFSPC) = :CODBENEF' +
        'SPC       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)    AND'
      '    (RTRIM(BNF.CODBENEFSPC) = :CODBENEFSPC) AND'
      '    (BPP.IDBENEFICIO = BNF.IDBENEFICIO)     AND'
      '    (BPP.IDBENEFICIO = ANT.IDBENEFICIO(+))  AND'
      '    (BPP.IDPLANOPREV = ANT.IDPLANOPREV(+))  AND'
      '    (BPP.IDPESSJUR   = ANT.IDPESSJUR(+))    AND'
      '    (BPP.IDBENEFICIO = CAN.IDBENEFICIO(+))  AND'
      '    (BPP.IDPLANOPREV = CAN.IDPLANOPREV(+))  AND'
      '    (BPP.IDPESSJUR   = CAN.IDPESSJUR(+))    AND'
      '    (BPP.IDBENEFICIO = CON.IDBENEFICIO(+))  AND'
      '    (BPP.IDPLANOPREV = CON.IDPLANOPREV(+))  AND'
      '    (BPP.IDPESSJUR   = CON.IDPESSJUR(+))'
      ''
      'GROUP BY'
      
        '  BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO, BNF.CODBENEFS' +
        'PC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 59
    Top = 425
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO'
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
        Name = 'FLGINTERNO'
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
        Name = 'FLGINTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaInvalidez: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO,'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      ''
      '        NVL(SUM(ANT.BENEFANTERIORES),0) AS BENEFANTERIORES,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS BENEFCANCELADOS,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS BENEFCONCEDIDOS,'
      ''
      '        SUM(NVL(ANT.BENEFANTERIORES,0)-'
      '            NVL(CAN.BENEFCANCELADOS,0)+'
      '            NVL(CON.BENEFCONCEDIDOS,0)) AS BENEFATUAIS'
      ''
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP,'
      ''
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '  (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT ID' +
        'TITULAR) AS BENEFANTERIORES'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = '#39'10102'#39'     ' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      '            WHERE'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      ''
      
        '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO, IDBENEFICIO) AN' +
        'T,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCANCELADOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '        '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = '#39'10102'#39'     ' +
        '  AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      #9#9'  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCONCEDIDOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = '#39'10102'#39'     ' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      #9#9'  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      '    (RTRIM(BNF.CODBENEFSPC) = '#39'10102'#39')     AND'
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
      ''
      
        'GROUP BY BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO, BNF.CO' +
        'DBENEFSPC'
      ' ')
    ValidateWithMask = True
    Left = 93
    Top = 425
    ParamData = <
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
      end>
  end
  object QryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      '        NVL(SUM(ANT.BENEFANTERIORES),0) AS ANTERIOR,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS CANCELADO,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS CONCEDIDO,'
      
        '        SUM(NVL(ANT.BENEFANTERIORES,0)-NVL(CAN.BENEFCANCELADOS,0' +
        ')+NVL(CON.BENEFCONCEDIDOS,0)) AS ATUAL'
      ''
      'FROM CM.BENEFICIO BNF,'
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '  (SELECT IDBENEFICIO, COUNT(DISTINCT IDTITULAR) AS BENEFANTERIO' +
        'RES'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      '            WHERE'
      
        '                  (SP.FLGINTERNO = '#39'MA'#39' OR SP.FLGINTERNO = '#39'MP'#39')' +
        ' AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      ''
      '   GROUP BY IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '  (SELECT  IDBENEFICIO, COUNT(DISTINCT IDTITULAR)  AS BENEFCANCE' +
        'LADOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '        '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      
        '                  (SP.FLGINTERNO = '#39'MA'#39' OR SP.FLGINTERNO = '#39'MP'#39')' +
        ' AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '  (SELECT  IDBENEFICIO, COUNT(DISTINCT IDTITULAR)  AS BENEFCONCE' +
        'DIDOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      
        '                  (SP.FLGINTERNO = '#39'MA'#39' OR SP.FLGINTERNO = '#39'MP'#39')' +
        ' AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      '    (BNF.CODBENEFSPC = :CODBENEFSPC)       AND'
      '    (BNF.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      ''
      'GROUP BY BNF.CODBENEFSPC')
    ValidateWithMask = True
    Left = 172
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
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
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end>
  end
  object QryReservaAuto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      '        NVL(SUM(ANT.BENEFANTERIORES),0) AS ANTERIOR,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS CANCELADO,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS CONCEDIDO,'
      
        '        SUM(NVL(ANT.BENEFANTERIORES,0)-NVL(CAN.BENEFCANCELADOS,0' +
        ')+NVL(CON.BENEFCONCEDIDOS,0)) AS ATUAL'
      ''
      'FROM CM.BENEFICIO BNF,'
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '  (SELECT IDBENEFICIO, COUNT(DISTINCT IDTITULAR) AS BENEFANTERIO' +
        'RES'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      '            WHERE'
      
        '                  (SP.FLGINTERNO <> '#39'MA'#39' AND SP.FLGINTERNO <> '#39'M' +
        'P'#39') AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      ''
      '   GROUP BY IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '  (SELECT  IDBENEFICIO, COUNT(DISTINCT IDTITULAR)  AS BENEFCANCE' +
        'LADOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '        '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      
        '                  (SP.FLGINTERNO <> '#39'MA'#39' AND SP.FLGINTERNO <> '#39'M' +
        'P'#39') AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '  (SELECT  IDBENEFICIO, COUNT(DISTINCT IDTITULAR)  AS BENEFCONCE' +
        'DIDOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC     = :CODBENEFSPC' +
        '       AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      
        '                  (SP.FLGINTERNO <> '#39'MA'#39' AND SP.FLGINTERNO <> '#39'M' +
        'P'#39') AND'
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      '    (BNF.CODBENEFSPC = :CODBENEFSPC)       AND'
      '    (BNF.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      ''
      'GROUP BY BNF.CODBENEFSPC')
    ValidateWithMask = True
    Left = 203
    Top = 321
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
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
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODBENEFSPC'
        ParamType = ptUnknown
      end>
  end
  object QryPopulacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.POPANTERIOR,0)  AS POPANTERIOR,'
      '       NVL(CAN.POPCANCELADO,0) AS POPCANCELADO,'
      '       NVL(CON.POPCONCEDIDO,0) AS POPCONCEDIDO,'
      '       (NVL(ANT.POPANTERIOR,0)-'
      '       NVL(CAN.POPCANCELADO,0)+'
      '       NVL(CON.POPCONCEDIDO,0)) AS POPATUAL'
      ''
      'FROM DUAL,'
      ''
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPANTERIO' +
        'R'
      ''
      '/* POPULACAO ANTERIOR */'
      ' FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCANCELA' +
        'DO'
      ''
      ' FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO  = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTER' +
        'NO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCONCEDI' +
        'DO'
      ''
      ' FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTERN' +
        'O2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 313
    Top = 369
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
        ParamType = ptUnknown
      end>
  end
  object QryProcAposen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO,'
      '        BNF.CODBENEFSPC AS CODIGOSPC,'
      ''
      '        NVL(SUM(ANT.BENEFANTERIORES),0) AS ANTERIOR,'
      '        NVL(SUM(CAN.BENEFCANCELADOS),0) AS CANCELADO,'
      '        NVL(SUM(CON.BENEFCONCEDIDOS),0) AS CONCEDIDO,'
      ''
      '        SUM(NVL(ANT.BENEFANTERIORES,0)-'
      '            NVL(CAN.BENEFCANCELADOS,0)+'
      '            NVL(CON.BENEFCONCEDIDOS,0)) AS ATUAL'
      ''
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP,'
      ''
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '  (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT ID' +
        'TITULAR) AS BENEFANTERIORES'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE DATAINICIO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC IN ('#39'10101'#39', '#39'1010' +
        '2'#39', '#39'10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        '                                BB.IDSITBENEFICIO = :IDSITBENEFI' +
        'CIO    AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      '            WHERE'
      '                  SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCANCELADOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '        '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC IN ('#39'10101'#39', '#39'1010' +
        '2'#39', '#39'10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        #9#9#9#9'                         BB.IDSITBENEFICIO = :IDSITBENEFICIO' +
        '    AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      '                  SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CAN,'
      ''
      
        '/* BENEFICIOS CONCEDIDOS = DATA CONCESSAO ENTRE PARAMETROS DE IN' +
        'ICIO E FIM */'
      
        '  (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT I' +
        'DTITULAR)  AS BENEFCONCEDIDOS'
      '   FROM CM.BENEFBFCIARIO'
      '   WHERE'
      '         DATACONCESSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '         DATACONCESSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       '#9'IDTITULAR IN'
      '           (SELECT EFINAL.IDPESSOA'
      '            FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '                 (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEV' +
        'ENTOSPREV'
      '                  FROM EVENTOSPREV E1'
      '                  WHERE'
      '                       DATAEVENTO <'
      '                         (SELECT MAX(DATAEVENTO)'
      
        '                          FROM BENEFBFCIARIO BB, BENEFICIO B, BE' +
        'NEFPLANPREV BP, EVENTOSPREV EP'
      '                          WHERE'
      
        '                                B.CODBENEFSPC IN ('#39'10101'#39', '#39'1010' +
        '2'#39', '#39'10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        '                                BB.IDSITBENEFICIO = :IDSITBENEFI' +
        'CIO    AND'
      
        '                                B.IDBENEFICIO     = BP.IDBENEFIC' +
        'IO     AND'
      
        '                                BP.IDPLANOPREV    = BB.IDPLANOPR' +
        'EV     AND'
      
        '                                BP.IDBENEFICIO    = BB.IDBENEFIC' +
        'IO     AND'
      
        '                                BB.IDTITULAR      = EP.IDPESSOA ' +
        '       AND'
      
        '                                B.IDEVENTOGERADOR = EP.IDEVENTOG' +
        'ERADOR AND'
      '                                EP.IDPESSOA       = E1.IDPESSOA)'
      '                  GROUP BY E1.IDPESSOA) EOK'
      ''
      '            WHERE'
      '                  SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '                  EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      
        '    (BNF.CODBENEFSPC IN ('#39'10101'#39', '#39'10102'#39', '#39'10103'#39', '#39'10104'#39', '#39'10' +
        '105'#39', '#39'10106'#39'))  AND'
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
      ''
      
        'GROUP BY BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO, BNF.CO' +
        'DBENEFSPC'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 198
    Top = 357
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDSITBENEFICIO'
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
        Name = 'IDSITBENEFICIO'
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
        Name = 'IDSITBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object QryDepAtivos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.DEPANTERIOR,0)  AS DEPANTERIOR,'
      '       NVL(CAN.DEPCANCELADO,0) AS DEPCANCELADO,'
      '       NVL(CON.DEPCONCEDIDO,0) AS DEPCONCEDIDO,'
      
        '       (NVL(ANT.DEPANTERIOR,0)-NVL(CAN.DEPCANCELADO,0)+NVL(CON.D' +
        'EPCONCEDIDO,0)) AS DEPATUAL'
      ''
      'FROM DUAL,'
      '/* DEPENDENTES ANTERIORES */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPANTE' +
        'RIOR'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '         (SELECT EP.IDPESSOA'
      '          FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '             (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '              FROM CM.EVENTOSPREV'
      '              WHERE'
      '                   DATAEVENTO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '              GROUP BY IDPESSOA) MAXEVENTO'
      '          WHERE'
      '             EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '             EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '             EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '             SP.FLGINTERNO    = '#39'AT'#39') AND'
      '       D.IDTITULAR <> D.IDPESSOA  AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV) ANT,'
      ''
      '/* DEPENDENTES CANCELADOS */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPCANC' +
        'ELADO'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '         (SELECT EP.IDPESSOA'
      '          FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '             (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '              FROM CM.EVENTOSPREV'
      '              WHERE'
      
        '                   DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                   DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '              GROUP BY IDPESSOA) MAXEVENTO'
      '          WHERE'
      '             EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '             EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '             EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '             SP.FLGINTERNO    = '#39'AT'#39') AND'
      '       D.IDTITULAR <> D.IDPESSOA AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV) CAN,'
      ''
      '/* DEPENDENTES CONCEDIDOS */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPCONC' +
        'EDIDO'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '         (SELECT EP.IDPESSOA'
      '          FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '             (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '              FROM CM.EVENTOSPREV'
      '              WHERE'
      
        '                   DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                   DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '              GROUP BY IDPESSOA) MAXEVENTO'
      '          WHERE'
      '             EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '             EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '             EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '             SP.FLGINTERNO    = '#39'AT'#39') AND'
      '       D.IDTITULAR <> D.IDPESSOA AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 134
    Top = 357
    ParamData = <
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
      end>
  end
  object QryDepAposentados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       NVL(ANT.DEPANTERIOR,0)  AS DEPANTERIOR,'
      '       NVL(CAN.DEPCANCELADO,0) AS DEPCANCELADO,'
      '       NVL(CON.DEPCONCEDIDO,0) AS DEPCONCEDIDO,'
      '       (NVL(ANT.DEPANTERIOR,0)-'
      '       NVL(CAN.DEPCANCELADO,0)+'
      '       NVL(CON.DEPCONCEDIDO,0)) AS DEPATUAL'
      ''
      'FROM DUAL,'
      '/* DEPENDENTES ANTERIORES  */'
      '(SELECT COUNT(IDPESSOA) AS DEPANTERIOR'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '      (SELECT EFINAL.IDPESSOA'
      '       FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '            (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENTOS' +
        'PREV'
      '             FROM EVENTOSPREV E1'
      '             WHERE'
      '                  DATAEVENTO <'
      '                    (SELECT MAX(DATAEVENTO)'
      
        '                     FROM BENEFBFCIARIO BB, BENEFICIO B, BENEFPL' +
        'ANPREV BP, EVENTOSPREV EP'
      '                     WHERE'
      
        '                           B.CODBENEFSPC IN ('#39'10101'#39', '#39'10102'#39', '#39 +
        '10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        '                           BB.IDSITBENEFICIO = 4                ' +
        '  AND'
      
        '                           EP.DATAEVENTO < TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                           BP.IDPLANOPREV    = BB.IDPLANOPREV   ' +
        '  AND'
      
        '                           BP.IDBENEFICIO    = BB.IDBENEFICIO   ' +
        '  AND'
      
        '                           BB.IDTITULAR      = EP.IDPESSOA      ' +
        '  AND'
      
        '                           B.IDEVENTOGERADOR = EP.IDEVENTOGERADO' +
        'R AND'
      '                           EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '             GROUP BY E1.IDPESSOA) EOK'
      '        WHERE'
      '             SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '             EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '             EFINAL.IDSITPARTNOVO = SP.IDSITPART)) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      '(SELECT COUNT(IDPESSOA) AS DEPCANCELADO'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '       (SELECT EFINAL.IDPESSOA'
      '        FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '             (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENTO' +
        'SPREV'
      '              FROM EVENTOSPREV E1'
      '              WHERE'
      '                   DATAEVENTO <'
      '                     (SELECT MAX(DATAEVENTO)'
      
        '                      FROM BENEFBFCIARIO BB, BENEFICIO B, BENEFP' +
        'LANPREV BP, EVENTOSPREV EP'
      '                      WHERE'
      
        '                            B.CODBENEFSPC IN ('#39'10101'#39', '#39'10102'#39', ' +
        #39'10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        '                            BB.IDSITBENEFICIO = 4               ' +
        '   AND'
      
        '                            EP.DATAEVENTO >= TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39') AND'
      
        '                            EP.DATAEVENTO <= TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39') AND                               B.IDBENEFICIO     ' +
        '= BP.IDBENEFICIO     AND'
      
        '                            BP.IDPLANOPREV    = BB.IDPLANOPREV  ' +
        '   AND'
      
        '                            BP.IDBENEFICIO    = BB.IDBENEFICIO  ' +
        '   AND'
      
        '                            BB.IDTITULAR      = EP.IDPESSOA     ' +
        '   AND'
      
        '                            B.IDEVENTOGERADOR = EP.IDEVENTOGERAD' +
        'OR AND'
      '                            EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '              GROUP BY E1.IDPESSOA) EOK'
      '         WHERE'
      '              SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '              EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART)) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      '(SELECT COUNT(IDPESSOA) AS DEPCONCEDIDO'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '       (SELECT EFINAL.IDPESSOA'
      '        FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '             (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENTO' +
        'SPREV'
      '              FROM EVENTOSPREV E1'
      '              WHERE'
      '                   DATAEVENTO <'
      '                     (SELECT MAX(DATAEVENTO)'
      
        '                      FROM BENEFBFCIARIO BB, BENEFICIO B, BENEFP' +
        'LANPREV BP, EVENTOSPREV EP'
      '                      WHERE'
      
        '                            B.CODBENEFSPC IN ('#39'10101'#39', '#39'10102'#39', ' +
        #39'10103'#39', '#39'10104'#39', '#39'10105'#39', '#39'10106'#39')  AND'
      
        '                            BB.IDSITBENEFICIO = 4               ' +
        '   AND'
      
        '                            EP.DATAEVENTO >= TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39') AND'
      
        '                            EP.DATAEVENTO <= TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39') AND                               B.IDBENEFICIO     ' +
        '= BP.IDBENEFICIO     AND'
      
        '                            BP.IDPLANOPREV    = BB.IDPLANOPREV  ' +
        '   AND'
      
        '                            BP.IDBENEFICIO    = BB.IDBENEFICIO  ' +
        '   AND'
      
        '                            BB.IDTITULAR      = EP.IDPESSOA     ' +
        '   AND'
      
        '                            B.IDEVENTOGERADOR = EP.IDEVENTOGERAD' +
        'OR AND'
      '                            EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '              GROUP BY E1.IDPESSOA) EOK'
      '         WHERE'
      '              SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '              EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART)) CON'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 102
    Top = 357
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
  object QryDepPensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.DEPANTERIOR,0)  AS BENEFANTERIORES,'
      '       NVL(CAN.DEPCANCELADO,0) AS BENEFCANCELADOS,'
      '       NVL(CON.DEPCONCEDIDO,0) AS BENEFCONCEDIDOS,'
      ''
      '      (NVL(ANT.DEPANTERIOR,0)-'
      '       NVL(CAN.DEPCANCELADO,0)+'
      '       NVL(CON.DEPCONCEDIDO,0)) AS BENEFATUAIS'
      ''
      'FROM DUAL,'
      '/* DEPENDENTES ANTERIORES  */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPANTE' +
        'RIOR'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '        (SELECT EFINAL.IDPESSOA'
      '         FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '              (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENT' +
        'OSPREV'
      '               FROM EVENTOSPREV E1'
      '               WHERE'
      '                    DATAEVENTO <'
      '                      (SELECT MAX(DATAEVENTO)'
      
        '                       FROM BENEFBFCIARIO BB, BENEFICIO B, BENEF' +
        'PLANPREV BP, EVENTOSPREV EP'
      '                       WHERE'
      
        '                              B.CODBENEFSPC IN ('#39'10201'#39', '#39'10202'#39 +
        ')  AND'
      
        '                             BB.IDSITBENEFICIO = 1              ' +
        '    AND'
      
        '                             EP.DATAEVENTO < TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39') AND'
      
        '                             BP.IDPLANOPREV    = BB.IDPLANOPREV ' +
        '    AND'
      
        '                             BP.IDBENEFICIO    = BB.IDBENEFICIO ' +
        '    AND'
      
        '                             BB.IDTITULAR      = EP.IDPESSOA    ' +
        '    AND'
      
        '                             B.IDEVENTOGERADOR = EP.IDEVENTOGERA' +
        'DOR AND'
      '                             EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '               GROUP BY E1.IDPESSOA) EOK'
      '         WHERE'
      '              SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '              EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART)     AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV) ANT,'
      ''
      '/* DEPENDENTES  CANCELADA */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPCANC' +
        'ELADO'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '       (SELECT EFINAL.IDPESSOA'
      '        FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '             (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENTO' +
        'SPREV'
      '              FROM EVENTOSPREV E1'
      '              WHERE'
      '                   DATAEVENTO <'
      '                     (SELECT MAX(DATAEVENTO)'
      
        '                      FROM BENEFBFCIARIO BB, BENEFICIO B, BENEFP' +
        'LANPREV BP, EVENTOSPREV EP'
      '                      WHERE'
      
        '                            B.CODBENEFSPC IN ('#39'10201'#39', '#39'10202'#39') ' +
        ' AND'
      
        '                            BB.IDSITBENEFICIO = 1               ' +
        '   AND'
      
        '                            EP.DATAEVENTO >= TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39') AND'
      
        '                            EP.DATAEVENTO <= TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39') AND                               B.IDBENEFICIO     ' +
        '= BP.IDBENEFICIO     AND'
      
        '                            BP.IDPLANOPREV    = BB.IDPLANOPREV  ' +
        '   AND'
      
        '                            BP.IDBENEFICIO    = BB.IDBENEFICIO  ' +
        '   AND'
      
        '                            BB.IDTITULAR      = EP.IDPESSOA     ' +
        '   AND'
      
        '                            B.IDEVENTOGERADOR = EP.IDEVENTOGERAD' +
        'OR AND'
      '                            EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '              GROUP BY E1.IDPESSOA) EOK'
      '         WHERE'
      '              SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '              EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART) AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV ) CAN,'
      ''
      '/* DEPENDENTES  CONCEDIDA */'
      
        '(SELECT P.IDPESSJUR, P.IDPLANOPREV, COUNT(D.IDPESSOA) AS DEPCONC' +
        'EDIDO'
      ' FROM DEPENTIT D, PARTPREVPLAN P'
      ' WHERE D.IDTITULAR IN'
      '       (SELECT EFINAL.IDPESSOA'
      '        FROM EVENTOSPREV EFINAL, SITPART SP,'
      
        '             (SELECT E1.IDPESSOA, MAX(E1.IDEVENTOSPREV) IDEVENTO' +
        'SPREV'
      '              FROM EVENTOSPREV E1'
      '              WHERE'
      '                   DATAEVENTO <'
      '                     (SELECT MAX(DATAEVENTO)'
      
        '                      FROM BENEFBFCIARIO BB, BENEFICIO B, BENEFP' +
        'LANPREV BP, EVENTOSPREV EP'
      '                      WHERE'
      
        '                            B.CODBENEFSPC IN ('#39'10201'#39', '#39'10202'#39') ' +
        ' AND'
      
        '                            BB.IDSITBENEFICIO = 1               ' +
        '   AND'
      
        '                            EP.DATAEVENTO >= TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39') AND'
      
        '                            EP.DATAEVENTO <= TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39') AND                               B.IDBENEFICIO     ' +
        '= BP.IDBENEFICIO     AND'
      
        '                            BP.IDPLANOPREV    = BB.IDPLANOPREV  ' +
        '   AND'
      
        '                            BP.IDBENEFICIO    = BB.IDBENEFICIO  ' +
        '   AND'
      
        '                            BB.IDTITULAR      = EP.IDPESSOA     ' +
        '   AND'
      
        '                            B.IDEVENTOGERADOR = EP.IDEVENTOGERAD' +
        'OR AND'
      '                            EP.IDPESSOA       = E1.IDPESSOA)'
      ''
      '              GROUP BY E1.IDPESSOA) EOK'
      '         WHERE'
      '              SP.FLGINTERNO = '#39'AT'#39'                     AND'
      '              EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART) AND'
      '       D.IDTITULAR = P.IDPESSOA(+)'
      ' GROUP BY P.IDPESSJUR, P.IDPLANOPREV ) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      '')
    ValidateWithMask = True
    Left = 70
    Top = 357
    ParamData = <
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
      end>
  end
  object DsBenefSpc: TDataSource
    DataSet = qryBenefSpc
    Left = 457
    Top = 81
  end
  object QryMostraResult: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT CODBENEFSPC, SUM(TOTBENEFCONC) AS CONCEDIDOS,'
      '                    SUM(TOTBENEFENC)  AS CANCELADOS,'
      '                    SUM(TOTBENEFANT)  AS ANTERIORES'
      'FROM ESTBENEFSPC'
      'GROUP BY CODBENEFSPC'
      'ORDER BY CODBENEFSPC')
    ValidateWithMask = True
    Left = 130
    Top = 387
  end
  object DsMostraResult: TDataSource
    DataSet = QryMostraResult
    Left = 163
    Top = 387
  end
  object qryAtivosSemEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.POPANTERIOR,0)  AS POPANTERIOR,'
      '       NVL(CAN.POPCANCELADO,0) AS POPCANCELADO,'
      '       NVL(CON.POPCONCEDIDO,0) AS POPCONCEDIDO,'
      '       (NVL(ANT.POPANTERIOR,0)-'
      '       NVL(CAN.POPCANCELADO,0)+'
      '       NVL(CON.POPCONCEDIDO,0)) AS POPATUAL'
      ''
      'FROM DUAL,'
      ''
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPANTERIO' +
        'R'
      '/* POPULACAO ANTERIOR */'
      ' FROM CM.PARTPREVPLAN EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(INSCRICAODATA) DATAEVENTO'
      '      FROM  CM.PARTPREVPLAN'
      '      WHERE INSCRICAODATA < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.INSCRICAODATA = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPART     = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCANCELA' +
        'DO'
      ''
      ' FROM CM.PARTPREVPLAN EP,'
      '     (SELECT IDPESSOA, MAX(DATACANCELAMENTO) DATAEVENTO'
      '      FROM CM.PARTPREVPLAN'
      
        '      WHERE DATACANCELAMENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      '            DATACANCELAMENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA          = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATACANCELAMENTO  = MAXEVENTO.DATAEVENTO'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCONCEDI' +
        'DO'
      ''
      ' FROM CM.PARTPREVPLAN EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(INSCRICAODATA) DATAEVENTO'
      '      FROM CM.PARTPREVPLAN'
      '      WHERE'
      '           INSCRICAODATA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           INSCRICAODATA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.INSCRICAODATA = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPART     = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 364
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
        ParamType = ptUnknown
      end>
  end
  object qryMantidosSemEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ANT.IDPLANOPREV, ANT.IDPESSJUR,'
      '       NVL(ANT.POPANTERIOR,0)  AS POPANTERIOR,'
      '       NVL(CAN.POPCANCELADO,0) AS POPCANCELADO,'
      '       NVL(CON.POPCONCEDIDO,0) AS POPCONCEDIDO,'
      '       (NVL(ANT.POPANTERIOR,0)-'
      '       NVL(CAN.POPCANCELADO,0)+'
      '       NVL(CON.POPCONCEDIDO,0)) AS POPATUAL'
      ''
      'FROM DUAL,'
      ''
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPANTERIO' +
        'R'
      '/* POPULACAO ANTERIOR */'
      ' FROM CM.PARTPREVPLAN EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(INSCRICAODATA) DATAEVENTO'
      '      FROM  CM.PARTPREVPLAN'
      '      WHERE INSCRICAODATA < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.INSCRICAODATA = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPART     = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCANCELA' +
        'DO'
      ''
      ' FROM CM.PARTPREVPLAN EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATACANCELAMENTO) DATAEVENTO'
      '      FROM CM.PARTPREVPLAN'
      
        '      WHERE DATACANCELAMENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      '            DATACANCELAMENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA          = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATACANCELAMENTO  = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPART         = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO  = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTER' +
        'NO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      
        '(SELECT IDPLANOPREV, IDPESSJUR, COUNT(EP.IDPESSOA) AS POPCONCEDI' +
        'DO'
      ''
      ' FROM CM.PARTPREVPLAN EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(INSCRICAODATA) DATAEVENTO'
      '      FROM CM.PARTPREVPLAN'
      '      WHERE'
      '           INSCRICAODATA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           INSCRICAODATA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      ' WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.INSCRICAODATA = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPART     = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)'
      ' GROUP BY IDPLANOPREV, IDPESSJUR) CON'
      ''
      'WHERE'
      '    (ANT.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (ANT.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (ANT.IDPESSJUR   = CON.IDPESSJUR(+))'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 367
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO2'
        ParamType = ptUnknown
      end>
  end
end
