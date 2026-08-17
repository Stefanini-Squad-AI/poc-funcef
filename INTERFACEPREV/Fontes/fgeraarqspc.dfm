inherited FrmGeraArqSPC: TFrmGeraArqSPC
  Left = 88
  Top = 89
  Caption = 'Geração do Arquivo de Estatísticas'
  ClientHeight = 407
  ClientWidth = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 584
    Height = 368
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 574
      Height = 342
      ActivePage = SPC
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object SPC: TTabSheet
        Caption = 'SPC'
        object grpbLocalArquivo: TGroupBox
          Left = 0
          Top = 145
          Width = 566
          Height = 169
          Align = alBottom
          Caption = ' Local de Gravação do Arquivo '
          TabOrder = 0
          object dirlbArquivos: TDirectoryListBox
            Left = 6
            Top = 16
            Width = 256
            Height = 121
            ItemHeight = 16
            TabOrder = 0
          end
          object drvcmbArquivos: TDriveComboBox
            Left = 6
            Top = 142
            Width = 256
            Height = 19
            DirList = dirlbArquivos
            TabOrder = 1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 566
          Height = 145
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Label1: TLabel
            Left = 7
            Top = 9
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object Label2: TLabel
            Left = 111
            Top = 9
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object bbtnProcessarCalculo: TBitBtn
            Left = 188
            Top = 12
            Width = 85
            Height = 38
            Caption = 'Processar'
            Default = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
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
          object mebAno: TSpinEdit
            Left = 110
            Top = 23
            Width = 67
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object mebMes: TComboBox
            Left = 6
            Top = 24
            Width = 99
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
        end
      end
      object Resultado: TTabSheet
        Caption = 'Resultado'
        object memresult: TRichEdit
          Left = 0
          Top = 0
          Width = 566
          Height = 314
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object ProgressBar1: TProgressBar
      Left = 5
      Top = 347
      Width = 574
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 584
    inherited tb97Fundo: TToolbar97
      Left = 95
      DockPos = 95
    end
  end
  object DBGrid1: TDBGrid [2]
    Left = 287
    Top = 18
    Width = 490
    Height = 418
    DataSource = DsBenefSpc
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
  end
  object chkEventos: TCheckBox [3]
    Left = 12
    Top = 68
    Width = 265
    Height = 17
    Caption = 'Não utilizar tabela de Eventos'
    TabOrder = 3
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 243
    Top = 51
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
    Left = 446
    Top = 154
  end
  object qryGeraEstat: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 414
    Top = 154
  end
  object updPatroSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTPATROSPC'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  ANOMES = :ANOMES,'
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
    Left = 382
    Top = 154
  end
  object updPlanoSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTPLANOSPC'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  ANOMES = :ANOMES,'
      '  IDPLANOPREV = :IDPLANOPREV,'
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
    Left = 350
    Top = 154
  end
  object updBenefSpc: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTBENEFSPC'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  ANOMES = :ANOMES,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
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
    Left = 17
    Top = 132
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
    Left = 382
    Top = 122
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
    Left = 350
    Top = 122
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
    Left = 56
    Top = 138
  end
  object qryApagaEstat: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 414
    Top = 122
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
    Left = 447
    Top = 90
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
    Left = 350
    Top = 90
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
      'FROM CM.BENEFICIO BNF, BENEFPLANPATRO BPP, '
      ''
      
        '/* BENEFICIOS ANTERIORES = DATA DE INICIO MENOR QUE PARAMETRO DE' +
        ' INICIO */'
      
        '     (SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINCT' +
        ' IDTITULAR) AS BENEFANTERIORES'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE (IDSITBENEFICIO = 1 OR IDSITBENEFICIO = 2) OR'
      '            (DATAFINAL >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '             DATAFINAL <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '      GROUP BY IDPESSJUR, IDPLANOPREV, IDBENEFICIO) ANT,'
      ''
      
        '/* BENEFICIOS CANCELADOS = DATA DE FIM ENTRE PARAMETROS DE INICI' +
        'O E FIM */'
      
        '     (SELECT  IDPESSJUR, IDPLANOPREV, IDBENEFICIO, COUNT(DISTINC' +
        'T IDTITULAR)  AS BENEFCANCELADOS'
      '      FROM CM.BENEFBFCIARIO'
      '      WHERE  DATAFINAL >=  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
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
      '    (BPP.IDBENEFICIO = BNF.IDBENEFICIO)    AND '
      '    (BPP.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = ANT.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = ANT.IDPESSJUR(+))   AND'
      '    (BPP.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = CAN.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = CAN.IDPESSJUR(+))   AND'
      '    (BPP.IDBENEFICIO = CON.IDBENEFICIO(+)) AND'
      '    (BPP.IDPLANOPREV = CON.IDPLANOPREV(+)) AND'
      '    (BPP.IDPESSJUR   = CON.IDPESSJUR(+))   '
      ''
      
        'GROUP BY BPP.IDPESSJUR, BPP.IDPLANOPREV, BNF.IDBENEFICIO, BNF.CO' +
        'DBENEFSPC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 113
    Top = 97
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
    Left = 145
    Top = 129
  end
  object UpdArquivo: TUpdateSQL
    Left = 113
    Top = 129
  end
  object DsArquivo: TwwDataSource
    DataSet = QryArquivo
    Left = 79
    Top = 129
  end
  object QryPensao: TwwQuery
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
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
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
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
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
      '                  SP.FLGINTERNO = :FLGINTERNO              AND'
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
    Left = 143
    Top = 97
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
      #9#9'               EFINAL.IDEVENTOSPREV = EOK.IDEVENTOSPREV AND'
      '                  EFINAL.IDSITPARTNOVO = SP.IDSITPART)'
      ''
      '   GROUP BY IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      '    (BNF.CODBENEFSPC = '#39'10102'#39')            AND'
      '    (BNF.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      ''
      'GROUP BY BNF.CODBENEFSPC')
    ValidateWithMask = True
    Left = 177
    Top = 97
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
    Left = 184
    Top = 129
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
    Left = 215
    Top = 129
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
      'SELECT'
      '       NVL(ANT.POPANTERIOR,0)  AS POPANTERIOR,'
      '       NVL(CAN.POPCANCELADO,0) AS POPCANCELADO,'
      '       NVL(CON.POPCONCEDIDO,0) AS POPCONCEDIDO,'
      
        '       (NVL(ANT.POPANTERIOR,0)-NVL(CAN.POPCANCELADO,0)+NVL(CON.P' +
        'OPCONCEDIDO,0)) AS POPATUAL'
      ''
      'FROM DUAL,'
      '(SELECT COUNT(EP.IDPESSOA) AS POPANTERIOR'
      '/* POPULACAO ANTERIOR */'
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO   = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTE' +
        'RNO2)) ANT,'
      ''
      '/* POPULACAO CANCELADA */'
      '(SELECT COUNT(EP.IDPESSOA) AS POPCANCELADO'
      ''
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO  = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTER' +
        'NO2) ) CAN,'
      ''
      '/* POPULACAO CONCEDIDA */'
      '(SELECT COUNT(EP.IDPESSOA) AS POPCONCEDIDO'
      ''
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      ''
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      
        '     (SP.FLGINTERNO = :FLGINTERNO1 OR SP.FLGINTERNO = :FLGINTERN' +
        'O2) ) CON'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 194
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGINTERNO2'
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
        Name = 'FLGINTERNO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGINTERNO2'
        ParamType = ptUnknown
      end>
  end
  object QryProcAposen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
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
      '   GROUP BY IDBENEFICIO) CON'
      ''
      '/* JOINS DE INTEGRIDADE RELACIONAL */'
      ''
      'WHERE'
      '    (RTRIM(BNF.CODBENEFSPC) IS NOT NULL)   AND'
      
        '    (BNF.CODBENEFSPC IN ('#39'10101'#39', '#39'10102'#39', '#39'10103'#39', '#39'10104'#39', '#39'10' +
        '105'#39', '#39'10106'#39'))  AND'
      '    (BNF.IDBENEFICIO = ANT.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CAN.IDBENEFICIO(+)) AND'
      '    (BNF.IDBENEFICIO = CON.IDBENEFICIO(+))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 242
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSITBENEFICIO'
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
        Name = 'IDSITBENEFICIO'
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
        Name = 'IDSITBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object QryDepAtivos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       NVL(ANT.DEPANTERIOR,0)  AS DEPANTERIOR,'
      '       NVL(CAN.DEPCANCELADO,0) AS DEPCANCELADO,'
      '       NVL(CON.DEPCONCEDIDO,0) AS DEPCONCEDIDO,'
      
        '       (NVL(ANT.DEPANTERIOR,0)-NVL(CAN.DEPCANCELADO,0)+NVL(CON.D' +
        'EPCONCEDIDO,0)) AS DEPATUAL'
      ''
      'FROM DUAL,'
      '/* DEPENDENTES ANTERIORES */'
      '(SELECT COUNT(IDPESSOA) AS DEPANTERIOR'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '(SELECT EP.IDPESSOA'
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '     SP.FLGINTERNO    = '#39'AT'#39') AND'
      '     D.IDTITULAR <> D.IDPESSOA) ANT,'
      ''
      '/* DEPENDENTES CANCELADOS */'
      '(SELECT COUNT(IDPESSOA) AS DEPCANCELADO'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '(SELECT EP.IDPESSOA'
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '     SP.FLGINTERNO    = '#39'AT'#39') AND'
      'D.IDTITULAR <> D.IDPESSOA) CAN,'
      ''
      '/* DEPENDENTES CONCEDIDOS */'
      '(SELECT COUNT(IDPESSOA) AS DEPCONCEDIDO'
      'FROM DEPENTIT D'
      'WHERE D.IDTITULAR IN'
      '(SELECT EP.IDPESSOA'
      'FROM CM.EVENTOSPREV EP, CM.SITPART SP,'
      '     (SELECT IDPESSOA, MAX(DATAEVENTO) DATAEVENTO'
      '      FROM CM.EVENTOSPREV'
      '      WHERE'
      '           DATAEVENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '           DATAEVENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDPESSOA) MAXEVENTO'
      'WHERE'
      '     EP.IDPESSOA      = MAXEVENTO.IDPESSOA   AND'
      '     EP.DATAEVENTO    = MAXEVENTO.DATAEVENTO AND'
      '     EP.IDSITPARTNOVO = SP.IDSITPART         AND'
      '     SP.FLGINTERNO    = '#39'AT'#39') AND'
      'D.IDTITULAR <> D.IDPESSOA) CON')
    ValidateWithMask = True
    Left = 154
    Top = 165
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
      
        '       (NVL(ANT.DEPANTERIOR,0)-NVL(CAN.DEPCANCELADO,0)+NVL(CON.D' +
        'EPCONCEDIDO,0)) AS DEPATUAL'
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
    Left = 114
    Top = 165
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
      'SELECT'
      '       NVL(ANT.DEPANTERIOR,0)  AS DEPANTERIOR,'
      '       NVL(CAN.DEPCANCELADO,0) AS DEPCANCELADO,'
      '       NVL(CON.DEPCONCEDIDO,0) AS DEPCONCEDIDO,'
      
        '       (NVL(ANT.DEPANTERIOR,0)-NVL(CAN.DEPCANCELADO,0)+NVL(CON.D' +
        'EPCONCEDIDO,0)) AS DEPATUAL'
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
      
        '                            B.CODBENEFSPC IN ('#39'10201'#39', '#39'10202'#39') ' +
        ' AND'
      
        '                           BB.IDSITBENEFICIO = 1                ' +
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
      '/* DEPENDENTES  CANCELADA */'
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
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART)) CAN,'
      ''
      '/* DEPENDENTES  CONCEDIDA */'
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
      '              EFINAL.IDSITPARTNOVO = SP.IDSITPART)) CON'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 82
    Top = 165
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
  object DsBenefSpc: TDataSource
    DataSet = qryBenefSpc
    Left = 55
    Top = 97
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
    Left = 492
    Top = 283
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
    Left = 495
    Top = 325
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
