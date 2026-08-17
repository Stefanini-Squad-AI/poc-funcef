inherited frmMapaPrevic: TfrmMapaPrevic
  Left = 398
  Top = 188
  AutoSize = True
  Caption = 'Mapa PREVIC'
  ClientHeight = 377
  ClientWidth = 591
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 591
    Height = 338
    object grp_demoEs: TGroupBox
      Left = 13
      Top = 13
      Width = 292
      Height = 267
      Caption = 'Demonstrativo Estatístico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cb_ana: TCheckBox
        Left = 20
        Top = 20
        Width = 149
        Height = 13
        Caption = 'Analítico (Mês a Mês)'
        TabOrder = 0
      end
      object cb_con1: TCheckBox
        Left = 20
        Top = 46
        Width = 195
        Height = 13
        Caption = 'Consolidado (Ano / Semestre)'
        TabOrder = 1
      end
      object grp_ano1: TGroupBox
        Left = 7
        Top = 78
        Width = 122
        Height = 59
        Caption = 'Ano de Referência'
        TabOrder = 2
        object ed_ano1: TEdit
          Left = 13
          Top = 26
          Width = 59
          Height = 21
          BiDiMode = bdLeftToRight
          MaxLength = 4
          ParentBiDiMode = False
          TabOrder = 0
          OnKeyPress = ed_ano1KeyPress
        end
      end
      object grp1: TGroupBox
        Left = 133
        Top = 78
        Width = 154
        Height = 59
        Caption = 'Semestre de  Referência'
        TabOrder = 3
        object cb_semestre: TComboBox
          Left = 13
          Top = 26
          Width = 118
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnClick = cb_semestreClick
          Items.Strings = (
            '1º Semestre'
            '2º Semestre')
        end
      end
      object grp_plano: TGroupBox
        Left = 7
        Top = 143
        Width = 280
        Height = 111
        Caption = 'Plano Previdenciário'
        TabOrder = 4
        object cb_reg: TCheckBox
          Left = 26
          Top = 33
          Width = 98
          Height = 13
          Caption = 'REG/REPLAN'
          TabOrder = 0
        end
        object cb_reb: TCheckBox
          Left = 26
          Top = 59
          Width = 79
          Height = 13
          Caption = 'REB'
          TabOrder = 1
        end
        object cb_novo: TCheckBox
          Left = 26
          Top = 85
          Width = 111
          Height = 13
          Caption = 'NOVO PLANO'
          TabOrder = 2
        end
      end
    end
    object grp_demoSex: TGroupBox
      Left = 310
      Top = 13
      Width = 275
      Height = 117
      Caption = 'Demonstrativo de Sexo e Idade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cb_con2: TCheckBox
        Left = 20
        Top = 26
        Width = 173
        Height = 14
        Caption = 'Consolidado (Mês / Ano)'
        TabOrder = 0
      end
      object grp_ano2: TGroupBox
        Left = 147
        Top = 52
        Width = 121
        Height = 53
        Caption = 'Ano de Referência'
        TabOrder = 2
        object ed_ano2: TEdit
          Left = 26
          Top = 20
          Width = 59
          Height = 21
          MaxLength = 4
          TabOrder = 0
          OnKeyPress = ed_ano2KeyPress
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 52
        Width = 137
        Height = 53
        Caption = 'Mês de Referência'
        TabOrder = 1
        object ed_mes2: TEdit
          Left = 26
          Top = 20
          Width = 59
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnChange = ed_mes2Change
          OnKeyPress = ed_mes2KeyPress
        end
      end
    end
    object grp2: TGroupBox
      Left = 310
      Top = 143
      Width = 190
      Height = 40
      Caption = 'Visualizar Demonstrativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object btn1: TSpeedButton
        Left = 59
        Top = 15
        Width = 18
        Height = 18
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
        OnClick = btn1Click
      end
    end
    object grp3: TGroupBox
      Left = 310
      Top = 192
      Width = 189
      Height = 39
      Caption = 'Cadastrar Número de Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object btn2: TSpeedButton
        Left = 86
        Top = 15
        Width = 19
        Height = 18
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
        OnClick = btn2Click
      end
    end
    object grp_codigo: TGroupBox
      Left = 13
      Top = 286
      Width = 150
      Height = 46
      Caption = 'Código da Entidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object ed_codigo: TEdit
        Left = 20
        Top = 20
        Width = 98
        Height = 21
        TabOrder = 0
      end
    end
    object grp_email: TGroupBox
      Left = 169
      Top = 287
      Width = 416
      Height = 46
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object ed_email: TEdit
        Left = 13
        Top = 20
        Width = 384
        Height = 21
        TabOrder = 0
      end
    end
    object cbDemoSexoIdade: TCheckBox
      Left = 310
      Top = 257
      Width = 209
      Height = 17
      Caption = 'Demonstrativo de Sexo e Idade'
      TabOrder = 5
      OnClick = cbDemoSexoIdadeClick
    end
    object cbDemoEstatistico: TCheckBox
      Left = 310
      Top = 233
      Width = 201
      Height = 17
      Caption = 'Demonstrativo Estatístico'
      TabOrder = 4
      OnClick = cbDemoEstatisticoClick
    end
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 591
    inherited tb97Fundo: TToolbar97
      Left = 421
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 150
      Top = 1
      Width = 92
      Height = 34
      Caption = '&Gerar PDF'
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
    end
    object bbtnConfirmar: TBitBtn
      Left = 244
      Top = 1
      Width = 90
      Height = 34
      Caption = '&Gerar XML'
      ModalResult = 1
      TabOrder = 1
      OnClick = bbtnConfirmarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
    end
    object bbtnCancelar: TBitBtn
      Left = 337
      Top = 1
      Width = 82
      Height = 34
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
      OnClick = bbtnCancelarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
        88888887788888778F88887991919191088888788888888878F8879919191919
        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
        190878F877787778887887917F919F71908887F88788878887F8879919191919
        1088878F88888888878888799191919108888878FF88888F7888888779999977
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Title'
        0))
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select  NOME,CNPB from planprev where idplanoprev = :idplanoprev')
    ValidateWithMask = True
    Left = 232
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 24
    Top = 408
  end
  object qryEntidade: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      ''
      
        'SELECT PE.NOME,FU.CODFUNDSPC,PE.EMAIL,PE.NUMDOCUMENTO CNPJ FROM ' +
        'PESSOA PE,FUNDACAO FU WHERE FU.CODFUNDSPC = :ENTIDADE'
      'AND PE.IDPESSOA = FU.IDPESSOA')
    ValidateWithMask = True
    Left = 144
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ENTIDADE'
        ParamType = ptUnknown
      end>
  end
  object qryIdadeSexo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from '
      '(SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Participante'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'A'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('#9#9#9'   '
      '           (SELECT PA.IDPESSOA'
      
        #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV,SITPART SI' +
        ' '
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (PLANOCONTAB)'
      #9#9#9#9'AND SI.IDSITPART = PA.IDSITPART '
      #9#9#9#9'AND SI.FLGINTERNO IN ('#39'AT'#39', '#39'MA'#39', '#39'MS'#39', '#39'MP'#39') '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),NVEZES)'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9
      #9#9#9#9'AND PA.DATACANCELAMENTO IS NULL)'#9#9#9#9
      
        #9#9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*' +
        '/ '
      #9#9'UNION'
      #9'/* FIM CONTAS 31200 PESQUISA'
      #9'---- INICIO CONTAS 31300 PESQUISA*/'
      #9#9' (SELECT DISTINCT EV.IDPESSOA'
      '        FROM EVENTOSPREV EV,'
      '             PARTPREVPLAN PT,'
      '             SITPART ST'
      '        WHERE EV.IDPESSOA = PT.IDPESSOA'
      '        AND   EV.IDPESSJUR = PT.IDPESSJUR'
      '        AND   ST.FLGINTERNO IN ('#39'AT'#39', '#39'MA'#39', '#39'MS'#39', '#39'MP'#39')'
      '        AND   PT.IDSITPART = ST.IDSITPART'
      '        AND   PT.IDPESSOA = EV.IDPESSOA '
      '        AND   PT.FLGDESATIVADO = 0'
      '        AND   EV.IDPLANOPREV IN (PLANOCONTAB)  '
      '        AND   PT.DATACANCELAMENTO IS NULL      '
      
        '        AND EV.DATAREGISTRO < Add_months(TO_DATE(DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),NVEZES))'
      ''
      '           ) EV'
      '         WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9'  AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      'UNION'
      'SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Assistidos Aposentados'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'B'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('
      '           '#9'   SELECT BF.IDPESSOA /*DISTINCT BF.IDPLANOPREV,*/'
      #9#9#9#9#9'   /*COUNT (BF.IDPLANOPREV) E11100*/'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV '
      #9#9#9#9'AND   PPP.DATACANCELAMENTO IS NULL'#9
      #9#9#9#9'AND   BF.IDPLANOPREV IN (PLANOCONTAB)              '
      #9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9'AND  BF.DATAINICIO < Add_months(TO_DATE(DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),NVEZES)'
      '        /* FIM CONTAS 11100 PESQUISA          '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      #9#9'(SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND PPP.DATACANCELAMENTO IS NULL'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9#9'   AND BF.IDPLANOPREV in (PLANOCONTAB)'
      
        '                           AND BF.DATAINICIO < Add_months(TO_DAT' +
        'E(DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),NVEZES))'
      '        /* FIM CONTAS 11200 PESQUISA*/  '
      '                 ) EV '
      '        WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9'AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      'UNION'
      'SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Beneficiários de Pensão'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'C'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('
      #9#9#9'   '
      #9#9#9#9'SELECT  BF.IDPESSOA'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDPLANOPREV IN (PLANOCONTAB)'
      
        #9#9#9#9'AND  BF.DATAINICIO < Add_months(TO_DATE(DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),NVEZES)'
      #9#9#9'   '
      #9#9#9'   '
      #9#9#9#9
      #9#9#9#9')  EV'
      '         WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9' AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      ')'
      ''
      'ORDER BY ORDEM,CODIGO')
    ValidateWithMask = True
    Left = 240
    Top = 408
  end
  object dsDemontrativoIdadeSexo: TwwDataSource
    DataSet = cdsIdadeSexo
    Left = 512
    Top = 400
  end
  object cdsDemostrativo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 648
    Top = 352
    object cdsDemostrativoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
    end
    object cdsDemostrativoMES: TStringField
      FieldName = 'MES'
      FixedChar = True
      Size = 2
    end
    object cdsDemostrativoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 66
    end
    object cdsDemostrativoORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object cdsDemostrativoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 66
    end
    object cdsDemostrativoANTERIOR: TFloatField
      FieldName = 'ANTERIOR'
    end
    object cdsDemostrativoENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object cdsDemostrativoSAIDA: TFloatField
      FieldName = 'SAIDA'
    end
    object cdsDemostrativoATUAL: TFloatField
      FieldName = 'ATUAL'
    end
    object cdsDemostrativoCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
      Size = 28
    end
    object cdsDemostrativoDAT: TStringField
      FieldName = 'DAT'
      FixedChar = True
      Size = 59
    end
  end
  object SDXML: TSaveDialog
    DefaultExt = 'xml'#13#10
    InitialDir = 'C:\Planus\Temp'
    Left = 648
    Top = 304
  end
  object pbdeDemostrativo: TppBDEPipeline
    DataSource = dtDemostrativo
    UserName = 'pbdeDemostrativo'
    Left = 656
    Top = 248
    object pbdeDemostrativoppField1: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField2: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField4: TppField
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField6: TppField
      FieldAlias = 'ANTERIOR'
      FieldName = 'ANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField7: TppField
      FieldAlias = 'ENTRADA'
      FieldName = 'ENTRADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField8: TppField
      FieldAlias = 'SAIDA'
      FieldName = 'SAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField9: TppField
      FieldAlias = 'ATUAL'
      FieldName = 'ATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField10: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pbdeDemostrativoppField11: TppField
      FieldAlias = 'DAT'
      FieldName = 'DAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object pDemonstrativoEstatistico: TppReport
    AutoStop = False
    DataPipeline = pbdeDemostrativo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 648
    Top = 192
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pbdeDemostrativo'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Demonstrativo Estatístico '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 2117
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 7938
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 13229
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 18521
        mmWidth = 13229
        BandType = 0
      end
      object pedtPeriodo: TppLabel
        UserName = 'pedtPeriodo'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 18256
        mmWidth = 63500
        BandType = 0
      end
      object pedtCNPJ: TppLabel
        UserName = 'pedtPeriodo1'
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 13494
        mmWidth = 89429
        BandType = 0
      end
      object pedtEntidade: TppLabel
        UserName = 'pedtEntidade'
        Caption = 'Entidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 7938
        mmWidth = 85461
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object pedtDescricao: TppDBText
        UserName = 'pedtDescricao'
        DataField = 'DESCRICAO'
        DataPipeline = pbdeDemostrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        DataPipelineName = 'pbdeDemostrativo'
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 0
        mmWidth = 97896
        BandType = 4
      end
      object pedtAnterior: TppDBText
        UserName = 'pedtAnterior'
        DataField = 'Anterior'
        DataPipeline = pbdeDemostrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pbdeDemostrativo'
        mmHeight = 4233
        mmLeft = 111919
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object pedtEntrada: TppDBText
        UserName = 'pedtEntrada'
        DataField = 'Entrada'
        DataPipeline = pbdeDemostrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pbdeDemostrativo'
        mmHeight = 4233
        mmLeft = 134144
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object pedtSaida: TppDBText
        UserName = 'pedtSaida'
        DataField = 'Saida'
        DataPipeline = pbdeDemostrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pbdeDemostrativo'
        mmHeight = 4233
        mmLeft = 155840
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object pedtAtual: TppDBText
        UserName = 'pedtAtual'
        DataField = 'Atual'
        DataPipeline = pbdeDemostrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pbdeDemostrativo'
        mmHeight = 4233
        mmLeft = 175948
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'Cadastro Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 86784
        mmTop = 2117
        mmWidth = 16669
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 2117
        mmWidth = 25135
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'REFERENCIA'
      DataPipeline = pbdeDemostrativo
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pbdeDemostrativo'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = clScrollBar
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 0
          mmWidth = 186532
          BandType = 3
          GroupNo = 0
        end
        object ppdbReferencia: TppDBText
          UserName = 'pedtDadosGrupo1'
          DataField = 'REFERENCIA'
          DataPipeline = pbdeDemostrativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pbdeDemostrativo'
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 0
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'TIPO'
      DataPipeline = pbdeDemostrativo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pbdeDemostrativo'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clScrollBar
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 0
          mmWidth = 186532
          BandType = 3
          GroupNo = 1
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 3969
          mmWidth = 186532
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 111125
          mmTop = 3969
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 133615
          mmTop = 3969
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 155575
          mmTop = 3969
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 175419
          mmTop = 3969
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'pedtDescricao1'
          DataField = 'TIPO'
          DataPipeline = pbdeDemostrativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pbdeDemostrativo'
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 0
          mmWidth = 97896
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 3969
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pDemostrativoSexoIdade: TppReport
    AutoStop = False
    DataPipeline = ppbdeDemoSexoIdade
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 648
    Top = 136
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppbdeDemoSexoIdade'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clScrollBar
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 26723
        mmWidth = 186267
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo Estatístico Sexo/Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        mmHeight = 4233
        mmLeft = 66146
        mmTop = 2117
        mmWidth = 62177
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 7938
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 13229
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 18521
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Ano:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 26723
        mmWidth = 9260
        BandType = 0
      end
      object pedtEntidadeIdadeSexo: TppLabel
        UserName = 'pedtEntidadeIdadeSexo'
        Caption = 'entidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 7938
        mmWidth = 12965
        BandType = 0
      end
      object pedtCNPJIdadeSexo: TppLabel
        UserName = 'pedtCNPJIdadeSexo'
        Caption = 'cnpj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 13494
        mmWidth = 79375
        BandType = 0
      end
      object pedtPeriodoIdadeSexc: TppLabel
        UserName = 'pedtPeriodoIdadeSexc'
        Caption = 'periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
      end
      object pedtAnoReferenciaIdadeSexo: TppLabel
        UserName = 'pedtPeriodoIdadeSexc1'
        Caption = 'lblFem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 26723
        mmWidth = 69321
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object pedtDescricaoIdadeSexo: TppDBText
        UserName = 'pedtDescricaoIdadeSexo'
        DataField = 'DESCRICAO'
        DataPipeline = ppbdeDemoSexoIdade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppbdeDemoSexoIdade'
        mmHeight = 4233
        mmLeft = 12171
        mmTop = 265
        mmWidth = 114565
        BandType = 4
      end
      object pedtVlrFeminino: TppDBText
        UserName = 'pedtVlrFeminino'
        DataField = 'FEM'
        DataPipeline = ppbdeDemoSexoIdade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppbdeDemoSexoIdade'
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object pedtVlrMasculino: TppDBText
        UserName = 'pedtVlrMasculino'
        DataField = 'MASC'
        DataPipeline = ppbdeDemoSexoIdade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppbdeDemoSexoIdade'
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Cadastro Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 86784
        mmTop = 2381
        mmWidth = 16669
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 2381
        mmWidth = 25135
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPO'
      DataPipeline = ppbdeDemoSexoIdade
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppbdeDemoSexoIdade'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clScrollBar
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 0
          mmWidth = 186267
          BandType = 3
          GroupNo = 0
        end
        object pedtGrupoIdadeSexo: TppDBText
          UserName = 'pedtGrupoIdadeSexo'
          DataField = 'TIPO'
          DataPipeline = ppbdeDemoSexoIdade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbdeDemoSexoIdade'
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 0
          mmWidth = 115094
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Feminino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 129382
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Masculino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 154782
          mmTop = 0
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object pplblFem: TppLabel
          UserName = 'lblFem'
          Caption = 'lblFem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 130704
          mmTop = 1058
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object pplblMasc: TppLabel
          UserName = 'lblMasc'
          Caption = 'lblMasc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 529
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'lblFem1'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 1323
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object dtDemostrativo: TwwDataSource
    DataSet = cdsDemostrativo
    Left = 664
    Top = 80
  end
  object qryAnterior: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT TIPODEMONSTRATIVO,  '
      '       TIPOGRUPO, '
      '       DESCRICAOCONTA, '
      '       VALORANTERIORCONTA, '
      '       CPAG, '
      '       CONTA'
      '  FROM MPREVICDEMONEST'
      ' WHERE TIPODEMONSTRATIVO = :TIPO'
      '   AND ANOREFERENCIA = :ANO'
      'order by CPAG')
    ValidateWithMask = True
    Left = 576
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end>
  end
  object qryEntrada: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '/*FALTA A CONTA 11200*/'
      
        'SELECT  0 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11000 Aposentadoria' +
        ' '#39' ||'#39'-'#39'|| '#39' Prestação Continuada (totalizador)'#39'Descricao, SUM(E' +
        ') E, '#39'11000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM (       '
      '        /* INICIO CONTAS 11100 PESQUISA -- RN008        */'
      '        SELECT 1 ORDEM,'
      '                ---- CONTA 11100 E'
      '                ('
      #9#9#9#9'   select TS.IDPLANO E11100'
      #9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9'(SELECT /*DISTINCT bf.idplanoprev,*/'
      #9#9#9#9#9#9#9'   count (bf.idplanoprev) idplano'
      #9#9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                    ' +
        '       '
      #9#9#9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9#9#9'AND   BF.IDPLANPREVCONTAB in (:PLANOCONTAB)              '
      #9#9#9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'#9#9#9#9#9#9
      
        #9#9#9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM' +
        '/YYYY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9'/*group by bf.idplanoprev*/) TS'#9#9#9#9' '
      #9#9#9'  )  E,            '
      '       '
      '      '#39'11100'#39' CONTA'
      '        '
      '          FROM DUAL'
      '       /* FIM CONTAS 11100 PESQUISA  '
      '        '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      '        SELECT 2 ORDEM,'
      '               /*CONTA 11200 E*/ /*FALTA*/'
      '               (SELECT /*+RULE*/ COUNT(1) E11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      
        '                           AND BF.IDBENEFICIO IN (:CONTA11200ENT' +
        ')'
      
        '                           /*(159, 504, 521, 160, 161, 328, 329,' +
        ' 481) --REG/REPLAN-REB/NOVOPLANO*/'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      '               '
      
        '               AND BF.DATACONCESSAO IS NOT NULL                 ' +
        '          '
      
        '                           AND BF.IDPLANPREVCONTAB in (:PLANOCON' +
        'TAB)'
      '               '
      
        '                           AND BF.DATACONCESSAO >= TO_DATE(:Data' +
        'InicioPeriodo, '#39'DD/MM/YYYY'#39')'
      
        '               AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataIn' +
        'icioPeriodo, '#39'DD/MM/YYYY'#39'),:NVEZES)))  E,    '
      '               '#39'11200'#39' CONTA'
      '        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11200 PESQUISA  */'
      '        '
      '        )'
      'union'
      '/*INICIO CONTAS 11100 PESQUISA*/'
      ''
      
        'SELECT 1 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11100 Aposentadoria ' +
        'Programada'#39'Descricao,'
      '      /* CONTA 11100 E*/'
      '       ('
      #9#9#9#9' select TS.IDPLANO E11100'
      #9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9'(SELECT /*DISTINCT bf.idplanoprev,*/'
      #9#9#9#9#9#9#9'   count (bf.idplanoprev) idplano'
      #9#9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                    ' +
        '       '
      #9#9#9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9#9#9'AND   BF.IDPLANPREVCONTAB in (:PLANOCONTAB)              '
      #9#9#9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM' +
        '/YYYY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9#9#9#9#9#9#9'/*group by bf.idplanoprev*/) TS'#9#9'  '
      #9#9#9'  )  E,    '
      '       '#39'11100'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 11100 PESQUISA  '
      '---- INICIO CONTAS 11200 PESQUISA*/'
      'UNION'
      
        'SELECT 2 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'11200 Aposentadoria p' +
        'or Invalidez'#39'Descricao,'
      '       /* CONTA 11200 E*/'
      '       (SELECT /*+RULE*/ COUNT(1) E11200'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF, PARTPREVPLAN PPP'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.IDBENEFICIO IN (:CONTA11200ENT)'
      
        '                   /*(159, 504, 521, 160, 161, 328, 329, 481) --' +
        'REG/REPLAN-REB/NOVOPLANO*/'
      
        '                   AND BF.DATACONCESSAO IS NOT NULL             ' +
        '              '
      '                   AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      #9#9#9#9'   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                   AND PPP.IDPESSOA = BF.IDPESSOA'
      
        '           AND BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39')'
      
        '           AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicio' +
        'Periodo, '#39'DD/MM/YYYY'#39'),:NVEZES)))  E,    '
      
        '                   /*AND PPP.INSCRICAODATA >= TO_DATE('#39'01/07/201' +
        '1'#39', '#39'DD/MM/YYYY'#39')'
      
        '                   --AND PPP.INSCRICAODATA <= TO_DATE('#39'31/12/201' +
        '3'#39', '#39'DD/MM/YYYY'#39')) ) E,*/'
      '  '#39'11200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 11200 PESQUISA*/'
      'UNION'
      
        'SELECT 3 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'12000 Auxílios '#39'||'#39'-' +
        #39'||'#39' Prestações Continuada'#39' Descricao, 0 E, '#39'12000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION'
      
        'SELECT 4 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'13000 Auxílios '#39' ||'#39'-' +
        #39'|| '#39' Prestação Única'#39'Descricao,'
      '       /* CONTA 13000 E*/--FALTA'
      '       (SELECT /*+RULE*/ COUNT(1) E13000'
      '          FROM ('
      #9#9'  SELECT DISTINCT BF.IDPESSOA'
      #9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9' PARTPREVPLAN PPP,'
      #9#9#9#9' PESSOAFISICA PF'
      #9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9'AND BF.FONTEPAGADORA = 1'
      #9#9#9'AND BF.IDSITBENEFICIO = 3'
      #9#9#9'AND BF.IDTPPAGTOBENEFIC = 2'
      #9#9#9'AND BF.IDBENEFICIO IN (:CONTA13000ENT)'
      
        #9#9#9#9#9'   /*(256,298,525,506,507,508,509,515,251,252,277,319,323,3' +
        '27,517,526,483,484,518,520,528) --REG/REPLAN-REB/NOVOPLANO*/'
      #9#9#9'AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9'AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9#9'AND PPP.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND PPP.IDPESSOA = PF.IDPESSOA'
      #9#9#9'/*AND PF.DATAMORTE IS  NULL */'
      
        #9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'#9#9#9
      #9#9#9
      #9' ))  E,    '
      '       '#39'13000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 13000 PESQUISA*/'
      ''
      'UNION'
      ''
      '/* INICIO CONTAS 14000 PESQUISA*/'
      ''
      
        'SELECT 5 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'14000 Pensões'#39'Descri' +
        'cao,'
      '       /* CONTA 14000 E*/'
      '       ('
      #9#9'  SELECT  count (BF.IDPESSOA) E14000'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9
      #9#9#9#9
      #9#9')  E,    '
      '        '#39'14000'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/*FIM CONTAS 14000 PESQUISA  */'
      'UNION'
      
        'SELECT 6 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'15000 Pecúlio'#39'Descri' +
        'cao,'
      '      /* CONTA 15000 E*/'
      '       (SELECT /*+RULE*/ COUNT(1) E15000'
      '          FROM ('
      
        #9#9'  SELECT B.IDPESSOA, B.IDPLANPREVCONTAB, BB.NOME, B.DATACONCES' +
        'SAO, b.valoratual'
      #9#9#9#9'FROM BENEFBFCIARIO B,'
      #9#9#9#9#9' BENEFICIO BB'
      #9#9#9#9'WHERE B.IDBENEFICIO = BB.IDBENEFICIO'
      #9#9#9#9'AND   B.IDBENEFICIO IN (:CONTA1500ENT)'
      #9#9#9#9'AND   B.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9#9'AND   B.IDSITBENEFICIO = 3'
      #9#9#9#9'AND   B.FONTEPAGADORA = 1'
      #9#9#9#9'AND   B.IDTPPAGTOBENEFIC = 2'
      
        #9#9#9#9'AND b.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND b.dataconcessao < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'))  E,     '
      '       '#39'15000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT  7 ORDEM, '#39'Dados de Benefícios'#39' Tipo,'#39'16000 Outros Benefí' +
        'cios de Prestação Única'#39' Descricao, 0 E, '#39'16000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION '
      
        'SELECT  8 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'17000 Outros Benefí' +
        'cios de Prestação Continuada'#39' Descricao, 0 E, '#39'17000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      ''
      'UNION'
      '/* FIM CONTAS 21000 PESQUISA*/'
      
        'SELECT 9 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'21000 Beneficio Propo' +
        'rcional'#39'Descricao,'
      '       ('
      #9'   SELECT /*+RULE*/ COUNT(1) E21000'
      '          FROM ('
      #9#9'  '
      #9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9' PARTPREVPLAN PT   '
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND   PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND   PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND   EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND   PT.IDSITPART IN (58, 63)      '
      #9#9#9'AND   PT.FLGDESATIVADO = 0              '
      
        #9#9#9'AND   EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9'AND   EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,             '
      '   '#39'21000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 21000 PESQUISA  */'
      ''
      'UNION'
      '/* FIM CONTAS 22000 PESQUISA*/'
      
        'SELECT 10 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'22000 Autopatrocínio' +
        #39'Descricao,'
      '       (SELECT /*+RULE*/COUNT(1) E22000'
      '          FROM ('
      #9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT'
      #9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9'AND PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9'AND PT.FLGDESATIVADO = 0 '
      
        #9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'))  E,    '
      '    '#39'22000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 22000 PESQUISA     */    '
      ''
      'UNION'
      '/* FIM CONTAS 23000 PESQUISA*/'
      
        'SELECT 11 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'23000 Resgates'#39'Descr' +
        'icao,'
      '       ( SELECT /*+RULE*/ COUNT(1) E23000'
      '          FROM ('
      #9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9'FROM EVENTOSPREV EV,'
      #9#9'PARTPREVPLAN PA'
      #9#9'WHERE EV.IDPESSOA = PA.IDPESSOA'
      #9#9'AND EV.IDPESSJUR = PA.IDPESSJUR'
      #9#9'AND EV. IDEVENTOGERADOR IN (15, 336,345) '
      #9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY' +
        #39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,    '
      '       '
      '       /* CONTA 23000 S */     '
      '       '#39'23000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 23000 PESQUISA    */'
      ''
      'UNION'
      '/* FIM CONTAS 24100 PESQUISA*/'
      
        'SELECT 12 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24100 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Originário'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E24100'
      '          FROM ('
      #9#9'  SELECT DISTINCT EV.IDPESSOA, EV.IDPLANOPREV'
      #9#9#9#9'FROM EVENTOSPREV EV'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (334) '
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,    '
      '      '#39'24100'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 24100 PESQUISA */ '
      ''
      'UNION'
      '/* FIM CONTAS 24200 PESQUISA*/'
      
        'SELECT 13 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24200 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Receptor'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E24200'
      '          FROM ('
      #9#9#9'SELECT DISTINCT HS.IDPESSOA'
      #9#9#9'FROM HSTCONTRIBPREV HS'
      #9#9#9'WHERE HS.IDCONTRIBUICAO IN (629,630)'
      #9#9#9#9'AND HS.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND HS.MESCOBRANCA >=  to_char(TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),'#39'YYYY/MM'#39')'
      
        #9#9#9#9'AND HS.MESCOBRANCA <  to_char(Add_months(TO_DATE(:DataInicio' +
        'Periodo, '#39'DD/MM/YYYY'#39'),:NVEZES),'#39'YYYY/MM'#39')'
      #9#9#9'))  E,  '
      '     '#39'24200'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL /*+ RULE*/'
      '/*FIM CONTAS 24200 PESQUISA    */'
      'UNION'
      
        'SELECT 14 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participantes ' +
        'Ativos (totalizador)'#39' Descricao, SUM(E) E, '#39'31000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM '
      '('
      ''
      
        'SELECT 1 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      #9#9'  FROM (SELECT PA.IDPESSOA'
      #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV'
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9#9#9#9'   '
      
        #9#9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*' +
        '/) ) E,'
      '       '#39'31200'#39' CONTA'
      '  FROM DUAL'
      '  '
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA'
      '---- INICIO CONTAS 31300 PESQUISA*/'
      
        'SELECT 2 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participante '#39' ' +
        '||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descricao,'
      '        (SELECT /*+RULE*/ COUNT(1) E31300'
      '           FROM ('
      #9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9#9'AND PT.IDPESSOA = EV.IDPESSOA '
      #9#9#9#9'AND PT.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'#9#9#9#9
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9
      #9#9'  )) E,'
      '      '#39'31000'#39' CONTA'
      '  FROM DUAL /*+ RULE*/'
      ')  '
      ''
      'UNION'
      
        'SELECT  15 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31100 Participante' +
        ' '#39'||'#39'-'#39'||'#39' com custeio exclusivamente patronal'#39' Descricao, 0 E, ' +
        #39'31100'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      ''
      ''
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA*/'
      
        'SELECT 16 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM ('
      #9#9'  SELECT PA.IDPESSOA'
      #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV'
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9#9#9#9#9'  '
      #9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*/'
      #9#9' )) E,'
      '  '#39'31200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA'
      '---- INICIO CONTAS 31300 PESQUISA*/'
      
        'SELECT 17 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31300 Participante ' +
        #39' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descrica' +
        'o,'
      '        (SELECT /*+RULE*/ COUNT(1) E31300'
      '           FROM ('#9#9'   '
      #9#9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9#9' PARTPREVPLAN PT'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9#9'AND PT.IDPESSOA = EV.IDPESSOA '
      #9#9#9#9'AND PT.FLGDESATIVADO = 0 '
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9')) E,     '
      '  '#39'31300'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL  '
      'UNION --FALTA'
      
        'SELECT  18 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'32000 Assistidos A' +
        'posentados'#39'Descricao, SUM(E) E, '#39'32000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM (        '
      '        /* INICIO CONTAS 11100 PESQUISA -- RN008    */    '
      '        SELECT 1 ORDEM,'
      '                /* CONTA 11100 E*/'
      '                ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT /*DISTINCT BF.IDPLANOPREV,*/'
      #9#9#9#9#9'   COUNT (BF.IDPLANOPREV) E11100'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                      ' +
        '     '
      #9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)              '
      #9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9'AND  BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9#9'AND  BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'/*GROUP BY BF.IDPLANOPREV*/) E,               '
      
        '                            /*AND PPP.INSCRICAODATA >= TO_DATE('#39 +
        '01/07/2011'#39', '#39'DD/MM/YYYY'#39')'
      
        '                            --AND PPP.INSCRICAODATA <= TO_DATE('#39 +
        '31/12/2013'#39', '#39'DD/MM/YYYY'#39'))) E,*/'
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11100 PESQUISA          '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      '        SELECT 2 ORDEM,'
      '               /*CONTA 11200 E*/'
      '               (SELECT /*+RULE*/ COUNT(1) E11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      
        '                           AND BF.IDBENEFICIO IN (:CONTA11200ENT' +
        ') /*REG/REPLAN-REB/NOVOPLANO*/'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9#9#9#9'AND BF.DATACONCESSAO IS NOT NULL                         ' +
        '  '
      
        '                           AND BF.IDPLANPREVCONTAB in (:PLANOCON' +
        'TAB)'
      
        '               AND BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39')'
      
        '               AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataIn' +
        'icioPeriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) E,   '
      '              '#39'11200'#39' CONTA        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11200 PESQUISA*/         '
      '        )'
      'UNION'
      
        '(SELECT 19 ORDEM, '#39'Dados de Populações'#39' Tipo,'#39'33000 Assistidos B' +
        'eneficiários de Pensão'#39'Descricao,'
      '       /*CONTA 33000 E*/'
      '     ('
      #9#9'  SELECT  count (BF.IDPESSOA) E14000'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND  BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9#9'AND  BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9') E,             '
      '      '#39'33000'#39' CONTA'
      
        #9'  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39')' +
        ',DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL ) '
      '/* FIM CONTAS 31300 PESQUISA  */'
      'UNION'
      '/* INICIO CONTAS 34000 PESQUISA   */'
      
        '  SELECT 20 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'34000 Designados'#39 +
        ' Descricao,'
      '         /* CONTA 34000 E*/'
      '         (SELECT /*+RULE*/ COUNT(1) E34000'
      '            FROM ('
      #9#9#9'SELECT DP.IDPESSOA, PPP.IDPLANOPREV'
      #9#9#9#9'FROM PARTPREVPLAN PPP,'
      #9#9#9#9'DEPENTIT DP'
      #9#9#9#9'WHERE PPP.IDPESSOA = DP.IDTITULAR'
      #9#9#9#9'AND DP.IDTITULAR <> DP.IDPESSOA'
      #9#9#9#9'AND DP.DATACANCELA IS NULL'
      #9#9#9#9'AND PPP.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9#9'AND (DP.FLGDEPLEGAL = 1 OR DP.FLGDESIGNADO = 1)'
      #9#9#9#9'AND PPP.FLGDESATIVADO = 0'
      
        #9#9#9#9'AND  DP.DATACADASTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'AND  DP.DATACADASTRO < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'  )) E,'
      '        '#39'34000'#39' CONTA  '
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '    FROM DUAL'
      '       /*FIM CONTAS 34000 PESQUISA  */')
    ValidateWithMask = True
    Left = 608
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA13000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA14000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA1500ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA14000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end>
  end
  object MontaSelectEstatistico: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'MPREVICDEMONEST.ANOREFERENCIA'
      'MPREVICDEMONEST.SEMESTREREFERENCIA'
      'MPREVICDEMONEST.NUMPROTOCOLO')
    TipodeDado.Strings = (
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Ano'
      'Semestre'
      'Número do Protocolo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MPREVICDEMONEST')
    CamposChave.Strings = (
      'MPREVICDEMONEST.CNPJ'
      'MPREVICDEMONEST.CODIGOENTIDADE'
      'MPREVICDEMONEST.ANOREFERENCIA'
      'MPREVICDEMONEST.SEMESTREREFERENCIA'
      'MPREVICDEMONEST.NUMPROTOCOLO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '4'
      '4'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 523
    Top = 28
  end
  object MontaSelectSexoIdade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona '
    Colunas.Strings = (
      'MPREVICDEMONESTIDSEX.ANOREFERENCIA'
      'MPREVICDEMONESTIDSEX.NUMPROTOCOLO'
      'MPREVICDEMONESTIDSEX.MESREFERENCIA')
    TipodeDado.Strings = (
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Ano'
      'Número do Protocolo'
      'Mês Referencia')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MPREVICDEMONESTIDSEX')
    CamposChave.Strings = (
      'MPREVICDEMONESTIDSEX.CNPJ'
      'MPREVICDEMONESTIDSEX.CODIGOENTIDADE'
      'MPREVICDEMONESTIDSEX.ANOREFERENCIA'
      'MPREVICDEMONESTIDSEX.MESREFERENCIA'
      'MPREVICDEMONESTIDSEX.NUMPROTOCOLO'
      'MPREVICDEMONESTIDSEX.CODIGOENTIDADE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '4'
      '10'
      '2')
    OperComparador.Strings = (
      '0'
      '-1'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 267
    Top = 36
  end
  object qryVisualizarDemo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT  0 ORDEM,'#39'B'#39' Tipo, '#39'Aposentadoria '#39' ||'#39'-'#39'|| '#39' Prestação C' +
        'ontinuada (totalizador)'#39'Descricao, SUM(S) S, '#39'11000'#39' CONTA'
      '  FROM ('
      '        SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                           FROM BENEFBFCIARIO BF, PARTPREVPLAN P' +
        'PP'
      '                          WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                            AND BF.FONTEPAGADORA = 1'
      '                            AND BF.IDSITBENEFICIO = 3'
      
        '                            AND BF.IDBENEFICIO IN (:CONTA11100EN' +
        'T) '
      #9#9#9#9#9#9#9'AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                            AND PPP.IDPESSOA = BF.IDPESSOA'
      
        '                            AND BF.IDPLANPREVCONTAB in (:PLANOCO' +
        'NTAB)'
      
        #9#9#9#9#9#9'AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9#9#9#9'AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES))) S,'#9
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        UNION'
      '           SELECT 2 ORDEM,    '
      #9#9#9'   '
      '               (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 3'
      
        '                           AND BF.IDBENEFICIO IN (:CONTA11200ENT' +
        ') '
      #9#9#9#9#9#9'   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      
        '                           AND BF.DATACONCESSAO IS NOT NULL     ' +
        '                      '
      
        '                           AND BF.IDPLANPREVCONTAB in (:PLANOCON' +
        'TAB)'#9#9#9#9#9#9'   '
      
        #9#9#9#9#9#9'AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9#9#9#9'AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES))) S,'#9'   '
      #9#9#39'11200'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        )'
      'union'
      'SELECT 1 ORDEM,'#39'B'#39' Tipo, '#39'Aposentadoria Programada'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) S11100'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF, PARTPREVPLAN PPP'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 3'
      '                   AND BF.IDBENEFICIO IN (:CONTA11100ENT) '
      #9#9#9#9'   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                   AND BF.IDPLANPREVCONTAB in (:PLANOCONTAB)'
      '                   AND PPP.IDPESSOA = BF.IDPESSOA'#9#9#9#9#9'  '
      
        #9#9#9#9'   AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'   AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'#9#9#9#9#9#9#9#9#9#9'  '
      '       '#39'11100'#39' CONTA'
      '  FROM DUAL'
      ''
      'UNION'
      'SELECT 2 ORDEM,'#39'B'#39' Tipo,'#39'Aposentadoria por Invalidez'#39'Descricao,'
      '       '
      '       (SELECT /*+RULE*/ COUNT(1) S11200'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF, PARTPREVPLAN PPP'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 3'
      '                   AND BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9'   AND BF.DATACONCESSAO IS NOT NULL                         ' +
        '  '
      '                   AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      '                   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                   AND PPP.IDPESSOA = BF.IDPESSOA'#9#9#9#9'   '
      
        #9#9#9#9'   AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'   AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'#9#9#9#9#9'  '
      '  '#39'11200'#39' CONTA'
      '  FROM DUAL'
      ''
      'UNION'
      
        'SELECT 3 ORDEM,'#39'B'#39' Tipo, '#39'Auxílios '#39'||'#39'-'#39'||'#39' Prestações Continua' +
        'da'#39' Descricao, 0 S,'#39'12000'#39' CONTA FROM DUAL'
      'UNION'
      
        'SELECT 4 ORDEM,'#39'B'#39' Tipo,'#39'Auxílios '#39' ||'#39'-'#39'|| '#39' Prestação Única'#39'De' +
        'scricao,'
      '       0      S,'
      #9'   '#39'13000'#39' CONTA'
      '  FROM DUAL'
      ''
      ''
      'UNION'
      ''
      ''
      ''
      'SELECT 5 ORDEM,'#39'B'#39' Tipo, '#39'Pensões'#39'Descricao,'
      '      '
      '       (SELECT /*+RULE*/ COUNT(1) S14000'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF, PARTPREVPLAN PPP'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 3'
      '                   AND BF.IDBENEFICIO IN (:CONTA14000ENT) '
      
        ' '#9'               AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)      ' +
        '            '
      '                   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                   AND PPP.IDPESSOA = BF.IDPESSOA'#9#9#9#9'   '
      
        #9#9#9#9'   AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'   AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'
      #9'    '#39'14000'#39' CONTA'
      ''
      '  FROM DUAL'
      ''
      ''
      'UNION'
      'SELECT 6 ORDEM,'#39'B'#39' Tipo,'#39'Pecúliar'#39' Descricao,'
      '     '
      '       0 S,'
      '       '#39'15000'#39' CONTA'
      '  FROM DUAL'
      'UNION'
      
        'SELECT  7 ORDEM,'#39'B'#39' Tipo, '#39'Outros Benefícios de Prestação Única'#39 +
        ' Descricao, 0 S, '#39'16000'#39' CONTA FROM DUAL'
      'UNION '
      
        'SELECT  8 ORDEM,'#39'B'#39' Tipo, '#39'Outros Benefícios de Prestação Contin' +
        'uada'#39' Descricao, 0 S, '#39'17000'#39' CONTA FROM DUAL'
      'UNION'
      'SELECT 9 ORDEM,'#39'I'#39' Tipo,'#39'Beneficio Proporcional'#39'Descricao,'
      '  '
      '       (SELECT /*+RULE*/ COUNT(1) S21000'
      '          FROM (SELECT DISTINCT IDPESSOA'
      '                  from EVENTOSPREV '
      '                 WHERE IDEVENTOSPREV >'
      '                       (SELECT MAX(EV.IDEVENTOSPREV)'
      
        '                          from EVENTOSPREV EV,PARTPREVPLAN PT   ' +
        '   '
      '                         WHERE IDEVENTOGERADOR IN (17, 341)'
      '                           AND IDSITPARTATUAL IN (58, 63)'
      #9#9#9#9#9#9'   AND PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9#9#9'   AND PT.FLGDESATIVADO = 0)  '#9#9#9#9#9#9'   '
      
        #9#9#9#9'   AND DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY' +
        #39')'
      
        #9#9#9#9'   AND DATAEVENTO < Add_months(TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),:NVEZES)'
      #9'               AND IDSITPARTATUAL IN (58, 63)) ) S,'
      '       '#39'21000'#39' CONTA'
      '  FROM DUAL'
      'UNION'
      'SELECT 10 ORDEM,'#39'I'#39' Tipo,'#39'Autopatrocínio'#39'Descricao,'
      '        (SELECT /*+RULE*/ COUNT(1) E22000'
      '          FROM (SELECT DISTINCT IDPESSOA'
      '                  FROM EVENTOSPREV '
      '                 WHERE IDEVENTOGERADOR IN (14, 13, 4)'
      '                   AND EXISTS'
      '                 (SELECT 1'
      '                          FROM EVENTOSPREV'
      '                         WHERE IDEVENTOGERADOR IN (9, 3))'
      '                   AND IDSITPARTATUAL IN (7, 10, 8)'#9#9#9#9'   '
      
        #9#9#9#9'   AND DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY' +
        #39')'
      
        #9#9#9#9'   AND DATAEVENTO < Add_months(TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),:NVEZES))) S,                   '
      '       '#39'22000'#39' CONTA'
      ''
      '  FROM DUAL'
      ''
      ''
      'UNION'
      ''
      'SELECT 11 ORDEM,'#39'I'#39' Tipo,'#39'Resgates'#39'Descricao,'
      '    '
      '       0 S,'
      '      '#39'23000'#39' CONTA'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 12 ORDEM,'#39'I'#39' Tipo,'#39'Portabilidade '#39' ||'#39'-'#39'|| '#39' Plano de Ben' +
        'efícios Originário'#39'Descricao,'
      '        0 S,'
      '       '#39'24100'#39' CONTA'
      ''
      '  FROM DUAL'
      'UNION'
      
        'SELECT 13 ORDEM,'#39'I'#39' Tipo,'#39'Portabilidade '#39' ||'#39'-'#39'|| '#39' Plano de Ben' +
        'efícios Receptor'#39'Descricao,'
      '        0 S,'
      '       '#39'24200'#39' CONTA'
      ''
      '  FROM DUAL /*+ RULE*/'
      'UNION'
      
        'SELECT 14 ORDEM,'#39'P'#39' Tipo,'#39'Participantes Ativos (totalizador)'#39' De' +
        'scricao, SUM(S) S, '#39'31000'#39' CONTA'
      '  FROM '
      '('
      
        'SELECT 1 ORDEM,'#39'P'#39' Tipo, '#39'Participante '#39' ||'#39'-'#39'|| '#39' com custeio p' +
        'atronal e do participante'#39' Descricao,'
      '        (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM (SELECT IDPESSOA'
      '                  FROM PARTPREVPLAN'
      '                 WHERE IDPESSOA IN'
      '                 (SELECT DISTINCT EV.IDPESSOA'
      
        '                          FROM EVENTOSPREV EV,PARTPREVPLAN PT,BE' +
        'NEFBFCIARIO BF'
      
        '                         WHERE EV.IDEVENTOGERADOR IN (2, 3, 4, 7' +
        ', 8, 9,11,13,14,15,334,336,337,345,358)'#9#9#9#9#9' '
      #9#9#9#9#9#9' AND PT.FLGDESATIVADO = 1'
      
        #9#9#9#9#9#9' AND EV.DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'         AND EV.DATAEVENTO < Add_months(TO_DATE(:DataInicioP' +
        'eriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))'
      '                   AND IDPESSOA IN'
      '                       (SELECT DISTINCT IDPESSOA'
      '                          FROM HSTCONTRIBPREV'
      '                         WHERE IDCONTRIBUICAO IN (1, 21)'
      
        #9#9#9#9#9#9' '#9'AND DATARECEBIMENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39')'
      
        #9#9#9#9#9#9#9'AND DATARECEBIMENTO < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES))'#9#9#9#9#9' '
      #9#9#9#9#9#9' '
      
        '                   '#9'AND INSCRICAODATA >= TO_DATE(:DataInicioPeri' +
        'odo, '#39'DD/MM/YYYY'#39')'
      
        #9#9#9#9#9'AND INSCRICAODATA < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      ''
      '                   AND FLGDESATIVADO = 1'
      
        #9#9#9#9'   AND DATACANCELAMENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39')'
      
        #9#9#9#9'   AND DATACANCELAMENTO < Add_months(TO_DATE(:DataInicioPeri' +
        'odo, '#39'DD/MM/YYYY'#39'),:NVEZES)))      S,'
      #9#39'31200'#39' CONTA'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 2 ORDEM,'#39'P'#39' Tipo,'#39'Participante '#39' ||'#39'-'#39'|| '#39' com custeio ex' +
        'clusivamente do participante'#39' Descricao,'
      ' (SELECT /*+RULE*/ COUNT(1) S31300'
      '           FROM (SELECT DISTINCT EV.IDPESSOA'
      
        '                   FROM EVENTOSPREV EV,PARTPREVPLAN PT,BENEFBFCI' +
        'ARIO BF'
      '                  WHERE EV.IDEVENTOGERADOR IN (9, 3,14,13)'
      '                    AND EV.IDSITPARTATUAL IN (7,8)'
      #9#9#9#9#9'AND PT.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND PT.FLGDESATIVADO = 0 '
      
        #9#9#9#9#9'AND EV.DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9#9'    AND EV.DATAEVENTO < Add_months(TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'
      '       '#39'31000'#39' CONTA'
      '  FROM DUAL '
      ''
      ')  '
      ''
      ''
      'UNION'
      
        'SELECT  15 ORDEM,'#39'P'#39' Tipo, '#39'Participante '#39'||'#39'-'#39'||'#39' com custeio e' +
        'xclusivamente patronal'#39' Descricao, 0 S, '#39'31100'#39' CONTA FROM DUAL'
      'UNION'
      
        'SELECT 16 ORDEM,'#39'P'#39' Tipo,'#39'Participante '#39' ||'#39'-'#39'|| '#39' com custeio p' +
        'atronal e do participante'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM (SELECT IDPESSOA'
      '                  FROM PARTPREVPLAN'
      '                 WHERE IDPESSOA IN'
      '                 (SELECT DISTINCT IDPESSOA'
      '                          FROM EVENTOSPREV'
      
        '                         WHERE IDEVENTOGERADOR IN (2, 3, 4, 7, 8' +
        ', 9,11,13,14,15,16,129,334,336,337,345,358)'
      #9#9#9#9#9#9' '
      
        #9#9#9#9#9#9'    AND DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9#9#9#9'AND DATAEVENTO < Add_months(TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),:NVEZES))'
      ''
      '                   AND IDPESSOA IN'
      '                       (SELECT DISTINCT IDPESSOA'
      '                          FROM HSTCONTRIBPREV'
      '                         WHERE IDCONTRIBUICAO IN (1, 21)'
      
        #9#9#9#9#9#9' '#9'AND DATARECEBIMENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39')'
      
        #9#9#9#9#9#9#9'AND DATARECEBIMENTO < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES))'
      
        #9#9#9#9'   AND INSCRICAODATA >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'   AND INSCRICAODATA < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'#9'   '
      #9#9#9#9'   AND FLGDESATIVADO = 1'
      
        #9#9#9#9'   AND DATACANCELAMENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39')'
      
        #9#9#9#9'   AND DATACANCELAMENTO < Add_months(TO_DATE(:DataInicioPeri' +
        'odo, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'
      '                        '
      '    '#39'31200'#39' CONTA'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 17 ORDEM,'#39'P'#39' Tipo,'#39'Participante '#39' ||'#39'-'#39'|| '#39' com custeio e' +
        'xclusivamente do participante'#39' Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) S31300'
      '           FROM (SELECT DISTINCT IDPESSOA'
      '                   FROM EVENTOSPREV'
      '                  WHERE IDEVENTOGERADOR IN (9, 3,14,13)'
      '                    AND IDSITPARTATUAL IN (7,8)'
      #9#9#9#9#9'AND DATAEVENTO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39')'
      
        #9#9#9#9#9'AND DATAEVENTO < Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD' +
        '/MM/YYYY'#39'),:NVEZES))) S,'
      '        '#39'31300'#39' CONTA'
      '  FROM DUAL'
      '  '
      'UNION'
      ''
      
        'SELECT  18 ORDEM,'#39'P'#39' Tipo, '#39'Assistidos Aposentados'#39'Descricao, SU' +
        'M(S) S, '#39'32000'#39' CONTA'
      '  FROM ('
      '         SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM (SELECT DISTINCT BF.IDPESSOA'
      '                           FROM BENEFBFCIARIO BF'
      '                          WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                            AND BF.FONTEPAGADORA = 1'
      '                            AND BF.IDSITBENEFICIO = 1'
      
        '                            AND BF.IDBENEFICIO IN (:CONTA11100EN' +
        'T) '
      
        #9#9#9#9#9#9#9'AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        '              AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioP' +
        'eriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,    '
      '      '#39'11100'#39' CONTA '
      '        '
      '          FROM DUAL'
      '        UNION'
      '        SELECT 2 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      '                          FROM BENEFBFCIARIO BF'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      '                           AND BF.IDBENEFICIO IN'
      '                               (:CONTA11200ENT) '
      
        '              and BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'D' +
        'D/MM/YYYY'#39')'
      
        '              AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioP' +
        'eriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,                      '
      '      '#39'11200'#39' CONTA'
      '        '
      '          FROM DUAL'
      ')'
      'UNION'
      ''
      ''
      
        '(SELECT 19 ORDEM,'#39'P'#39' Tipo, '#39'Assistidos Beneficiários de Pensão'#39'D' +
        'escricao,'
      '        (SELECT /*+RULE*/ COUNT(1) S33000'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND BF.IDBENEFICIO IN (:CONTRATO33000ENT) '
      
        '              AND BF.DATAFINAL >= TO_DATE(:DataInicioPeriodo, '#39'D' +
        'D/MM/YYYY'#39')'
      
        '             AND BF.DATAFINAL < Add_months(TO_DATE(:DataInicioPe' +
        'riodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,                      '
      '       '#39'33000'#39' CONTA'
      ''
      '  FROM DUAL ) '
      'UNION'
      '    SELECT 20 ORDEM,'#39'P'#39' Tipo,'#39'Designados'#39' Descricao,'
      '    '
      '         (SELECT /*+RULE*/ COUNT(1) S34000'
      '            FROM (SELECT DISTINCT PPP.IDPESSOA'
      '                    FROM PARTPREVPLAN PPP'
      
        '       WHERE PPP.DATACANCELAMENTO >= TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39')'
      
        '       AND   PPP.DATACANCELAMENTO < Add_months(TO_DATE(:DataInic' +
        'ioPeriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) S,'
      '  '#39'34000'#39' CONTA'
      '  '
      '    FROM DUAL /*+ RULE*/'
      '     '
      ' '
      '')
    ValidateWithMask = True
    Left = 64
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA14000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTRATO33000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end>
  end
  object cdsIdadeSexo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    Top = 168
  end
  object CMSqlParamsSexoIdade: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 CODIGO,  0  MASC,0  FEM,'
      
        '0 planoprevidenciario,'#39'                                         ' +
        '     '#39' TIPO, '#39'                                                  ' +
        '                            '#39' DESCRICAO, '#39'   '#39' MES              ' +
        '                                              '
      'FROM DUAL '
      'WHERE 1 = 2'
      '')
    ClientDataSet = cdsIdadeSexo
    Left = 192
    Top = 224
  end
  object ppbdeDemoSexoIdade: TppBDEPipeline
    DataSource = dsDemontrativoIdadeSexo
    UserName = 'pbdeDemostrativo1'
    Left = 520
    Top = 144
  end
  object CMSqlParamsDemons: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        #39#9'                                                              ' +
        '   '#39' Referencia,'
      
        #39#9'                                                              ' +
        '   '#39' MES,'
      
        #39#9'                                                              ' +
        '   '#39' Tipo,'
      '0 ORDEM,'
      
        #39#9'                                                              ' +
        '   '#39' Descricao,'
      #39'                            '#39' Conta,'
      
        #39'                                                           '#39' Da' +
        't,'
      '0  Anterior,'
      '0  Entrada,'
      '0 SAIDA,'
      '0  ATUAL'
      'FROM DUAL'
      'WHERE 1=2       '
      'ORDER BY Referencia'
      ''
      ''
      '       ')
    ClientDataSet = cdsDemostrativo
    Left = 636
    Top = 395
  end
  object qrySaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  0 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11000 Aposentadoria' +
        ' '#39' ||'#39'-'#39'|| '#39' Prestação Continuada (totalizador)'#39'Descricao, SUM(S' +
        ') S, '#39'11000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM ('
      '        SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        UNION'
      '           SELECT 2 ORDEM,    '
      #9#9#9'   '
      '               (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9'   '
      #9#9#39'11200'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        )'
      'union'
      
        'SELECT 1 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11100 Aposentadoria ' +
        'Programada'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9#9#9#9#9#9#9#9#9#9'  '
      '       '#39'11100'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      
        'SELECT 2 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'11200 Aposentadoria p' +
        'or Invalidez'#39'Descricao,'
      '       (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9'))S,'#9'   '
      #9#9#9#9#9'  '
      '  '#39'11200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      
        'SELECT 3 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'12000 Auxílios '#39'||'#39'-' +
        #39'||'#39' Prestações Continuada'#39' Descricao, 0 S,'#39'12000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT '
      'FROM DUAL'
      'UNION'
      
        'SELECT 4 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'13000 Auxílios '#39' ||'#39'-' +
        #39'|| '#39' Prestação Única'#39'Descricao,'
      '       0      S,'
      #9'   '#39'13000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      ''
      ''
      ''
      
        'SELECT 5 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'14000 Pensões'#39'Descri' +
        'cao,'
      ' (SELECT /*+RULE*/ COUNT(1) S14000'
      '          FROM     '
      #9' (SELECT DISTINCT BF.IDPESSOA'
      #9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9' MOVBENEF MOV,'
      #9#9#9' PESSOAFISICA PF'
      
        #9#9'WHERE BF.IDTITULAR <> BF.IDPESSOA /* para a consulta 11100 e 1' +
        '1200 irá utilizar idtitular = idpessoa*/'
      #9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      #9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*/'
      #9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39') '
      
        #9#9'AND  Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:NVE' +
        'ZES)'
      #9'  )) S,'
      #9'    '#39'14000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      ''
      'UNION'
      
        'SELECT 6 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'15000 Pecúlio'#39' Descri' +
        'cao,'
      '     '
      '       0 S,'
      '       '#39'15000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT  7 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'16000 Outros Benefí' +
        'cios de Prestação Única'#39' Descricao, 0 S, '#39'16000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION '
      
        'SELECT  8 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'17000 Outros Benefí' +
        'cios de Prestação Continuada'#39' Descricao, 0 S, '#39'17000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION'
      
        'SELECT 9 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'21000 Beneficio Propo' +
        'rcional'#39'Descricao,'
      '  '
      '       (   SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT'
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9'AND EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND PT.IDSITPART NOT IN (58, 63)'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'MINUS'
      #9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT '
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9'AND PT.IDSITPART NOT IN (58, 63) '
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9'   '#9') S,'
      '       '#39'21000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 10 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'22000 Autopatrocínio' +
        #39'Descricao,'
      '        ('#9#9
      #9#9#9'SELECT /*+RULE*/ COUNT(1) E22000'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9')'
      ''
      #9#9') S,                   '
      '       '#39'22000'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      ''
      'UNION'
      ''
      
        'SELECT 11 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'23000 Resgates'#39'Descr' +
        'icao,'
      '    '
      '       0 S,'
      '      '#39'23000'#39' CONTA'
      
        #9'  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39')' +
        ',DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 12 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24100 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Originário'#39'Descricao,'
      '        0 S,'
      '       '#39'24100'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 13 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24200 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Receptor'#39'Descricao,'
      '        0 S,'
      '       '#39'24200'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '  FROM DUAL /*+ RULE*/'
      'UNION'
      
        'SELECT 14 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participantes ' +
        'Ativos (totalizador)'#39' Descricao, SUM(S) S, '#39'31000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM '
      '('
      
        #9#9'SELECT 1 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31200 Participante' +
        ' '#39' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      
        #9#9#9#9'(SELECT /*+RULE*/ COUNT(1) S31200 /* FALTA ESSA SAIDA É IGUA' +
        'L A CONTA 22000*/'
      #9#9#9#9'   FROM ('
      #9#9#9#9#9#9'   SELECT PA.IDPESSOA'
      #9#9#9#9#9#9'FROM PARTPREVPLAN PA, EVENTOSPREV EV'
      #9#9#9#9#9#9'WHERE PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9#9#9'AND PA.FLGDESATIVADO = 1'
      #9#9#9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)  '
      
        #9#9#9#9#9#9'AND EV.DATAREGISTRO BETWEEN TO_DATE(:DataInicioPeriodo, '#39'D' +
        'D/MM/YYYY'#39')'
      
        #9#9#9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:' +
        'NVEZES)'
      #9#9#9#9#9#9'AND EV.IDEVENTOGERADOR IN (14, 13, 4, 358)'
      #9#9#9#9')) S,'
      #9#9#9#39'31200'#39' CONTA'
      #9#9#9
      #9#9'  FROM DUAL'
      #9#9'UNION'
      
        #9#9'SELECT 2 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participante ' +
        #39' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descrica' +
        'o,'
      #9#9' ('
      #9#9' '
      #9#9#9'SELECT /*+RULE*/ COUNT(1) E31300'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9')'
      #9#9#9
      #9#9#9
      #9#9#9
      #9#9#9') S,'
      #9#9#9'   '#39'31000'#39' CONTA'
      #9#9#9'  '
      #9#9'  FROM DUAL '
      ')  '
      ''
      'UNION'
      
        'SELECT  15 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31100 Participante' +
        ' '#39'||'#39'-'#39'||'#39' com custeio exclusivamente patronal'#39' Descricao, 0 S, ' +
        #39'31100'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT '
      'FROM DUAL'
      'UNION'
      
        'SELECT 16 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM ('
      #9#9#9#9'  SELECT PA.IDPESSOA'
      #9#9#9#9#9'FROM PARTPREVPLAN PA, EVENTOSPREV EV'
      #9#9#9#9#9'WHERE PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9#9'AND PA.FLGDESATIVADO = 1'
      #9#9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)  '
      
        #9#9#9#9#9'AND EV.DATAREGISTRO BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD' +
        '/MM/YYYY'#39')'
      
        #9#9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:N' +
        'VEZES)'
      #9#9#9#9#9'AND EV.IDEVENTOGERADOR IN (14, 13, 4, 358)'
      #9#9'  )) S,'
      '                        '
      '    '#39'31200'#39' CONTA'
      
        #9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),D' +
        'ATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 17 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31300 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descricao' +
        ','
      '      ('
      '       SELECT /*+RULE*/ COUNT(1) E31300'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO <  Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'))S,'
      '        '#39'31300'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '  '
      'UNION'
      ''
      
        'SELECT  18 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'32000 Assistidos A' +
        'posentados'#39'Descricao, SUM(S) S, '#39'32000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM ('
      '         SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        UNION'
      '           SELECT 2 ORDEM,    '
      #9#9#9'   '
      '               (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9'   '
      #9#9#39'11200'#39' CONTA        '
      '          FROM DUAL'
      ')'
      'UNION'
      ''
      ''
      
        '(SELECT 19 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'33000 Assistidos B' +
        'eneficiários de Pensão'#39'Descricao,'
      '        ('
      #9#9'SELECT /*+RULE*/ COUNT(1) S14000'
      '          FROM ('
      #9#9'  SELECT DISTINCT BF.IDPESSOA'
      #9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9'WHERE BF.IDTITULAR <> BF.IDPESSOA /* para a consulta 11100 e ' +
        '11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      #9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*/'
      #9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:N' +
        'VEZES)'
      #9#9'     )'
      #9#9#9' ) S,                      '
      '       '#39'33000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '  FROM DUAL ) '
      'UNION'
      
        ' SELECT 20 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'34000 Designados'#39' D' +
        'escricao,'
      '    '
      '         (SELECT /*+RULE*/ COUNT(1) S34000'
      '            FROM ('
      #9#9#9#9'SELECT DP.IDPESSOA, PPP.IDPLANOPREV'
      #9#9#9#9'FROM PARTPREVPLAN PPP,'
      #9#9#9#9'DEPENTIT DP'
      #9#9#9#9'WHERE PPP.IDPESSOA = DP.IDTITULAR'
      #9#9#9#9'AND DP.IDTITULAR <> DP.IDPESSOA'
      #9#9#9#9'/*AND DP.DATACANCELA IS NOT NULL*/'
      #9#9#9#9'AND PPP.IDPLANOPREV IN (:PLANOCONTAB)  '
      #9#9#9#9'AND (DP.FLGDEPLEGAL = 1 OR DP.FLGDESIGNADO = 1)'
      #9#9#9#9'AND PPP.FLGDESATIVADO = 0'
      
        #9#9#9#9'AND DP.DATACANCELA BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:NV' +
        'EZES)'
      #9#9#9')) S,'
      '  '#39'34000'#39' CONTA '
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '    FROM DUAL /*+ RULE*/'
      '     '
      '     '
      ' ')
    ValidateWithMask = True
    Left = 720
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA14000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA14000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end>
  end
  object qryAuxEntrada: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '/*FALTA A CONTA 11200*/'
      
        'SELECT  0 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11000 Aposentadoria' +
        ' '#39' ||'#39'-'#39'|| '#39' Prestação Continuada (totalizador)'#39'Descricao, SUM(E' +
        ') E, '#39'11000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM (       '
      '        /* INICIO CONTAS 11100 PESQUISA -- RN008        */'
      '        SELECT 1 ORDEM,'
      '                ---- CONTA 11100 E'
      '                ('
      #9#9#9#9'   select TS.IDPLANO E11100'
      #9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9'(SELECT /*DISTINCT bf.idplanoprev,*/'
      #9#9#9#9#9#9#9'   count (bf.idplanoprev) idplano'
      #9#9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                    ' +
        '       '
      #9#9#9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9#9#9'AND   BF.IDPLANPREVCONTAB in (:PLANOCONTAB)              '
      #9#9#9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'#9#9#9#9#9#9
      
        #9#9#9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM' +
        '/YYYY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9'/*group by bf.idplanoprev*/) TS'#9#9#9#9' '
      #9#9#9'  )  E,            '
      '       '
      '      '#39'11100'#39' CONTA'
      '        '
      '          FROM DUAL'
      '       /* FIM CONTAS 11100 PESQUISA  '
      '        '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      '        SELECT 2 ORDEM,'
      '               /*CONTA 11200 E*/ /*FALTA*/'
      '               (SELECT /*+RULE*/ COUNT(1) E11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      
        '                           AND BF.IDBENEFICIO IN (:CONTA11200ENT' +
        ')'
      
        '                           /*(159, 504, 521, 160, 161, 328, 329,' +
        ' 481) --REG/REPLAN-REB/NOVOPLANO*/'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      '               '
      
        '               AND BF.DATACONCESSAO IS NOT NULL                 ' +
        '          '
      
        '                           AND BF.IDPLANPREVCONTAB in (:PLANOCON' +
        'TAB)'
      '               '
      
        '                           AND BF.DATACONCESSAO >= TO_DATE(:Data' +
        'InicioPeriodo, '#39'DD/MM/YYYY'#39')'
      
        '               AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataIn' +
        'icioPeriodo, '#39'DD/MM/YYYY'#39'),:NVEZES)))  E,    '
      '               '#39'11200'#39' CONTA'
      '        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11200 PESQUISA  */'
      '        '
      '        )'
      'union'
      '/*INICIO CONTAS 11100 PESQUISA*/'
      ''
      
        'SELECT 1 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11100 Aposentadoria ' +
        'Programada'#39'Descricao,'
      '      /* CONTA 11100 E*/'
      '       ('
      #9#9#9#9' select TS.IDPLANO E11100'
      #9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9'(SELECT /*DISTINCT bf.idplanoprev,*/'
      #9#9#9#9#9#9#9'   count (bf.idplanoprev) idplano'
      #9#9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                    ' +
        '       '
      #9#9#9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9#9#9'AND   BF.IDPLANPREVCONTAB in (:PLANOCONTAB)              '
      #9#9#9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM' +
        '/YYYY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9#9#9#9#9#9#9'/*group by bf.idplanoprev*/) TS'#9#9'  '
      #9#9#9'  )  E,    '
      '       '#39'11100'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 11100 PESQUISA  '
      '---- INICIO CONTAS 11200 PESQUISA*/'
      'UNION'
      
        'SELECT 2 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'11200 Aposentadoria p' +
        'or Invalidez'#39'Descricao,'
      '       /* CONTA 11200 E*/'
      '       (SELECT /*+RULE*/ COUNT(1) E11200'
      '          FROM (SELECT DISTINCT BF.IDPESSOA'
      '                  FROM BENEFBFCIARIO BF, PARTPREVPLAN PPP'
      '                 WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.IDBENEFICIO IN (:CONTA11200ENT)'
      
        '                   /*(159, 504, 521, 160, 161, 328, 329, 481) --' +
        'REG/REPLAN-REB/NOVOPLANO*/'
      
        '                   AND BF.DATACONCESSAO IS NOT NULL             ' +
        '              '
      '                   AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      #9#9#9#9'   AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                   AND PPP.IDPESSOA = BF.IDPESSOA'
      
        '           AND BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39')'
      
        '           AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicio' +
        'Periodo, '#39'DD/MM/YYYY'#39'),:NVEZES)))  E,    '
      
        '                   /*AND PPP.INSCRICAODATA >= TO_DATE('#39'01/07/201' +
        '1'#39', '#39'DD/MM/YYYY'#39')'
      
        '                   --AND PPP.INSCRICAODATA <= TO_DATE('#39'31/12/201' +
        '3'#39', '#39'DD/MM/YYYY'#39')) ) E,*/'
      '  '#39'11200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 11200 PESQUISA*/'
      'UNION'
      
        'SELECT 3 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'12000 Auxílios '#39'||'#39'-' +
        #39'||'#39' Prestações Continuada'#39' Descricao, 0 E, '#39'12000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION'
      
        'SELECT 4 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'13000 Auxílios '#39' ||'#39'-' +
        #39'|| '#39' Prestação Única'#39'Descricao,'
      '       /* CONTA 13000 E*/--FALTA'
      '       (SELECT /*+RULE*/ COUNT(1) E13000'
      '          FROM ('
      #9#9'  SELECT DISTINCT BF.IDPESSOA'
      #9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9' PARTPREVPLAN PPP,'
      #9#9#9#9' PESSOAFISICA PF'
      #9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9'AND BF.FONTEPAGADORA = 1'
      #9#9#9'AND BF.IDSITBENEFICIO = 3'
      #9#9#9'AND BF.IDTPPAGTOBENEFIC = 2'
      #9#9#9'AND BF.IDBENEFICIO IN (:CONTA13000ENT)'
      
        #9#9#9#9#9'   /*(256,298,525,506,507,508,509,515,251,252,277,319,323,3' +
        '27,517,526,483,484,518,520,528) --REG/REPLAN-REB/NOVOPLANO*/'
      #9#9#9'AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9'AND BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9#9'AND PPP.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND PPP.IDPESSOA = PF.IDPESSOA'
      #9#9#9'/*AND PF.DATAMORTE IS  NULL */'
      
        #9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),:NVEZES)'#9#9#9
      #9#9#9
      #9' ))  E,    '
      '       '#39'13000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 13000 PESQUISA*/'
      ''
      'UNION'
      ''
      '/* INICIO CONTAS 14000 PESQUISA*/'
      ''
      
        'SELECT 5 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'14000 Pensões'#39'Descri' +
        'cao,'
      '       /* CONTA 14000 E*/'
      '       ('
      #9#9'  SELECT  count (BF.IDPESSOA) E14000'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND bf.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'AND bf.dataconcessao < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9#9#9
      #9#9#9#9
      #9#9')  E,    '
      '        '#39'14000'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/*FIM CONTAS 14000 PESQUISA  */'
      'UNION'
      
        'SELECT 6 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'15000 Pecúlio'#39'Descri' +
        'cao,'
      '      /* CONTA 15000 E*/'
      '       (SELECT /*+RULE*/ COUNT(1) E15000'
      '          FROM ('
      
        #9#9'  SELECT B.IDPESSOA, B.IDPLANPREVCONTAB, BB.NOME, B.DATACONCES' +
        'SAO, b.valoratual'
      #9#9#9#9'FROM BENEFBFCIARIO B,'
      #9#9#9#9#9' BENEFICIO BB'
      #9#9#9#9'WHERE B.IDBENEFICIO = BB.IDBENEFICIO'
      #9#9#9#9'AND   B.IDBENEFICIO IN (:CONTA1500ENT)'
      #9#9#9#9'AND   B.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9#9'AND   B.IDSITBENEFICIO = 3'
      #9#9#9#9'AND   B.FONTEPAGADORA = 1'
      #9#9#9#9'AND   B.IDTPPAGTOBENEFIC = 2'
      
        #9#9#9#9'AND b.dataconcessao >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND b.dataconcessao < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'))  E,     '
      '       '#39'15000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT  7 ORDEM, '#39'Dados de Benefícios'#39' Tipo,'#39'16000 Outros Benefí' +
        'cios de Prestação Única'#39' Descricao, 0 E, '#39'16000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION '
      
        'SELECT  8 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'17000 Outros Benefí' +
        'cios de Prestação Continuada'#39' Descricao, 0 E, '#39'17000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      ''
      'UNION'
      '/* FIM CONTAS 21000 PESQUISA*/'
      
        'SELECT 9 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'21000 Beneficio Propo' +
        'rcional'#39'Descricao,'
      '       ('
      #9'   SELECT /*+RULE*/ COUNT(1) E21000'
      '          FROM ('
      #9#9'  '
      #9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9' PARTPREVPLAN PT   '
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND   PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND   PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND   EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND   PT.IDSITPART IN (58, 63)      '
      #9#9#9'AND   PT.FLGDESATIVADO = 0              '
      
        #9#9#9'AND   EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9'AND   EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,             '
      '   '#39'21000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 21000 PESQUISA  */'
      ''
      'UNION'
      '/* FIM CONTAS 22000 PESQUISA*/'
      
        'SELECT 10 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'22000 Autopatrocínio' +
        #39'Descricao,'
      '       (SELECT /*+RULE*/COUNT(1) E22000'
      '          FROM ('
      #9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT'
      #9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9'AND PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9'AND PT.FLGDESATIVADO = 0 '
      
        #9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'))  E,    '
      '    '#39'22000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 22000 PESQUISA     */    '
      ''
      'UNION'
      '/* FIM CONTAS 23000 PESQUISA*/'
      
        'SELECT 11 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'23000 Resgates'#39'Descr' +
        'icao,'
      '       ( SELECT /*+RULE*/ COUNT(1) E23000'
      '          FROM ('
      #9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9'FROM EVENTOSPREV EV,'
      #9#9'PARTPREVPLAN PA'
      #9#9'WHERE EV.IDPESSOA = PA.IDPESSOA'
      #9#9'AND EV.IDPESSJUR = PA.IDPESSJUR'
      #9#9'AND EV. IDEVENTOGERADOR IN (15, 336,345) '
      #9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY' +
        #39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,    '
      '       '
      '       /* CONTA 23000 S */     '
      '       '#39'23000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 23000 PESQUISA    */'
      ''
      'UNION'
      '/* FIM CONTAS 24100 PESQUISA*/'
      
        'SELECT 12 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24100 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Originário'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E24100'
      '          FROM ('
      #9#9'  SELECT DISTINCT EV.IDPESSOA, EV.IDPLANOPREV'
      #9#9#9#9'FROM EVENTOSPREV EV'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (334) '
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9'))  E,    '
      '      '#39'24100'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '/* FIM CONTAS 24100 PESQUISA */ '
      ''
      'UNION'
      '/* FIM CONTAS 24200 PESQUISA*/'
      
        'SELECT 13 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24200 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Receptor'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E24200'
      '          FROM ('
      #9#9#9'SELECT DISTINCT HS.IDPESSOA'
      #9#9#9'FROM HSTCONTRIBPREV HS'
      #9#9#9'WHERE HS.IDCONTRIBUICAO IN (629,630)'
      #9#9#9#9'AND HS.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND HS.MESCOBRANCA >=  to_char(TO_DATE(:DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),'#39'YYYY/MM'#39')'
      
        #9#9#9#9'AND HS.MESCOBRANCA <  to_char(Add_months(TO_DATE(:DataInicio' +
        'Periodo, '#39'DD/MM/YYYY'#39'),:NVEZES),'#39'YYYY/MM'#39')'
      #9#9#9'))  E,  '
      '     '#39'24200'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL /*+ RULE*/'
      '/*FIM CONTAS 24200 PESQUISA    */'
      'UNION'
      
        'SELECT 14 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participantes ' +
        'Ativos (totalizador)'#39' Descricao, SUM(E) E, '#39'31000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM '
      '('
      ''
      
        'SELECT 1 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      #9#9'  FROM (SELECT PA.IDPESSOA'
      #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV'
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9#9#9#9'   '
      
        #9#9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*' +
        '/) ) E,'
      '       '#39'31200'#39' CONTA'
      '  FROM DUAL'
      '  '
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA'
      '---- INICIO CONTAS 31300 PESQUISA*/'
      
        'SELECT 2 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participante '#39' ' +
        '||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descricao,'
      '        (SELECT /*+RULE*/ COUNT(1) E31300'
      '           FROM ('
      #9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9#9'AND PT.IDPESSOA = EV.IDPESSOA '
      #9#9#9#9'AND PT.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'#9#9#9#9
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9
      #9#9'  )) E,'
      '      '#39'31000'#39' CONTA'
      '  FROM DUAL /*+ RULE*/'
      ')  '
      ''
      'UNION'
      
        'SELECT  15 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31100 Participante' +
        ' '#39'||'#39'-'#39'||'#39' com custeio exclusivamente patronal'#39' Descricao, 0 E, ' +
        #39'31100'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      ''
      ''
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA*/'
      
        'SELECT 16 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM ('
      #9#9'  SELECT PA.IDPESSOA'
      #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV'
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYY' +
        'Y'#39')'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9#9#9#9#9'  '
      #9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*/'
      #9#9' )) E,'
      '  '#39'31200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      '/* FIM CONTAS 31200 PESQUISA'
      '---- INICIO CONTAS 31300 PESQUISA*/'
      
        'SELECT 17 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31300 Participante ' +
        #39' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descrica' +
        'o,'
      '        (SELECT /*+RULE*/ COUNT(1) E31300'
      '           FROM ('#9#9'   '
      #9#9#9'  SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9#9' PARTPREVPLAN PT'
      #9#9#9#9'WHERE EV.IDEVENTOGERADOR IN (9, 3)'
      #9#9#9#9'AND PT.IDSITPART IN (2, 41, 77)'
      #9#9#9#9'AND PT.IDPESSOA = EV.IDPESSOA '
      #9#9#9#9'AND PT.FLGDESATIVADO = 0 '
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND EV.DATAREGISTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YY' +
        'YY'#39')'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9')) E,     '
      '  '#39'31300'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL  '
      'UNION --FALTA'
      
        'SELECT  18 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'32000 Assistidos A' +
        'posentados'#39'Descricao, SUM(E) E, '#39'32000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM (        '
      '        /* INICIO CONTAS 11100 PESQUISA -- RN008    */    '
      '        SELECT 1 ORDEM,'
      '                /* CONTA 11100 E*/'
      '                ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT /*DISTINCT BF.IDPLANOPREV,*/'
      #9#9#9#9#9'   COUNT (BF.IDPLANOPREV) E11100'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT)'
      
        #9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV                      ' +
        '     '
      #9#9#9#9'AND   BF.DATACONCESSAO IS NOT NULL'
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)              '
      #9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9'AND  BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9#9'AND  BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'/*GROUP BY BF.IDPLANOPREV*/) E,               '
      
        '                            /*AND PPP.INSCRICAODATA >= TO_DATE('#39 +
        '01/07/2011'#39', '#39'DD/MM/YYYY'#39')'
      
        '                            --AND PPP.INSCRICAODATA <= TO_DATE('#39 +
        '31/12/2013'#39', '#39'DD/MM/YYYY'#39'))) E,*/'
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11100 PESQUISA          '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      '        SELECT 2 ORDEM,'
      '               /*CONTA 11200 E*/'
      '               (SELECT /*+RULE*/ COUNT(1) E11200'
      '                  FROM (SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      
        '                           AND BF.IDBENEFICIO IN (:CONTA11200ENT' +
        ') /*REG/REPLAN-REB/NOVOPLANO*/'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9#9#9#9'AND BF.DATACONCESSAO IS NOT NULL                         ' +
        '  '
      
        '                           AND BF.IDPLANPREVCONTAB in (:PLANOCON' +
        'TAB)'
      
        '               AND BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39')'
      
        '               AND BF.DATACONCESSAO < Add_months(TO_DATE(:DataIn' +
        'icioPeriodo, '#39'DD/MM/YYYY'#39'),:NVEZES))) E,   '
      '              '#39'11200'#39' CONTA        '
      '          FROM DUAL'
      '        /* FIM CONTAS 11200 PESQUISA*/         '
      '        )'
      'UNION'
      
        '(SELECT 19 ORDEM, '#39'Dados de Populações'#39' Tipo,'#39'33000 Assistidos B' +
        'eneficiários de Pensão'#39'Descricao,'
      '       /*CONTA 33000 E*/'
      '     ('
      #9#9'  SELECT  count (BF.IDPESSOA) E14000'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)'
      
        #9#9#9#9'AND  BF.DATACONCESSAO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9#9'AND  BF.DATACONCESSAO < Add_months(TO_DATE(:DataInicioPeriod' +
        'o, '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9') E,             '
      '      '#39'33000'#39' CONTA'
      
        #9'  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39')' +
        ',DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL ) '
      '/* FIM CONTAS 31300 PESQUISA  */'
      'UNION'
      '/* INICIO CONTAS 34000 PESQUISA   */'
      
        '  SELECT 20 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'34000 Designados'#39 +
        ' Descricao,'
      '         /* CONTA 34000 E*/'
      '         (SELECT /*+RULE*/ COUNT(1) E34000'
      '            FROM ('
      #9#9#9'SELECT DP.IDPESSOA, PPP.IDPLANOPREV'
      #9#9#9#9'FROM PARTPREVPLAN PPP,'
      #9#9#9#9'DEPENTIT DP'
      #9#9#9#9'WHERE PPP.IDPESSOA = DP.IDTITULAR'
      #9#9#9#9'AND DP.IDTITULAR <> DP.IDPESSOA'
      #9#9#9#9'AND DP.DATACANCELA IS NULL'
      #9#9#9#9'AND PPP.IDPLANOPREV IN (:PLANOCONTAB)'
      #9#9#9#9'AND (DP.FLGDEPLEGAL = 1 OR DP.FLGDESIGNADO = 1)'
      #9#9#9#9'AND PPP.FLGDESATIVADO = 0'
      
        #9#9#9#9'AND  DP.DATACADASTRO >= TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39')'
      
        #9#9#9#9'AND  DP.DATACADASTRO < Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'  )) E,'
      '        '#39'34000'#39' CONTA  '
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '    FROM DUAL'
      '       /*FIM CONTAS 34000 PESQUISA  */')
    ValidateWithMask = True
    Left = 608
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA13000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA14000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA1500ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11100ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA11200ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA14000ENT'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NVEZES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataInicioPeriodo'
        ParamType = ptInput
      end>
  end
  object qryAuxSaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  0 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11000 Aposentadoria' +
        ' '#39' ||'#39'-'#39'|| '#39' Prestação Continuada (totalizador)'#39'Descricao, SUM(S' +
        ') S, '#39'11000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM ('
      '        SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        UNION'
      '           SELECT 2 ORDEM,    '
      #9#9#9'   '
      '               (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9'   '
      #9#9#39'11200'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        )'
      'union'
      
        'SELECT 1 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'11100 Aposentadoria ' +
        'Programada'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9#9#9#9#9#9#9#9#9#9'  '
      '       '#39'11100'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      
        'SELECT 2 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'11200 Aposentadoria p' +
        'or Invalidez'#39'Descricao,'
      '       (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9'))S,'#9'   '
      #9#9#9#9#9'  '
      '  '#39'11200'#39' CONTA'
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      
        'SELECT 3 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'12000 Auxílios '#39'||'#39'-' +
        #39'||'#39' Prestações Continuada'#39' Descricao, 0 S,'#39'12000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT '
      'FROM DUAL'
      'UNION'
      
        'SELECT 4 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'13000 Auxílios '#39' ||'#39'-' +
        #39'|| '#39' Prestação Única'#39'Descricao,'
      '       0      S,'
      #9'   '#39'13000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      'UNION'
      ''
      ''
      ''
      
        'SELECT 5 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'14000 Pensões'#39'Descri' +
        'cao,'
      ' (SELECT /*+RULE*/ COUNT(1) S14000'
      '          FROM     '
      #9' (SELECT DISTINCT BF.IDPESSOA'
      #9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9' MOVBENEF MOV,'
      #9#9#9' PESSOAFISICA PF'
      
        #9#9'WHERE BF.IDTITULAR <> BF.IDPESSOA /* para a consulta 11100 e 1' +
        '1200 irá utilizar idtitular = idpessoa*/'
      #9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      #9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*/'
      #9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/MM/Y' +
        'YYY'#39') '
      
        #9#9'AND  Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:NVE' +
        'ZES)'
      #9'  )) S,'
      #9'    '#39'14000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      ''
      'UNION'
      
        'SELECT 6 ORDEM,'#39'Dados de Benefícios'#39' Tipo,'#39'15000 Pecúlio'#39' Descri' +
        'cao,'
      '     '
      '       0 S,'
      '       '#39'15000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT  7 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'16000 Outros Benefí' +
        'cios de Prestação Única'#39' Descricao, 0 S, '#39'16000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION '
      
        'SELECT  8 ORDEM,'#39'Dados de Benefícios'#39' Tipo, '#39'17000 Outros Benefí' +
        'cios de Prestação Continuada'#39' Descricao, 0 S, '#39'17000'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      'FROM DUAL'
      'UNION'
      
        'SELECT 9 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'21000 Beneficio Propo' +
        'rcional'#39'Descricao,'
      '  '
      '       (   SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT'
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9'AND EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND PT.IDSITPART NOT IN (58, 63)'
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'MINUS'
      #9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9'PARTPREVPLAN PT '
      #9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9'AND EV.IDEVENTOGERADOR IN (17, 341)'
      #9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9'AND PT.IDSITPART NOT IN (58, 63) '
      
        #9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),:NVEZES)'
      #9'   '#9') S,'
      '       '#39'21000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 10 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'22000 Autopatrocínio' +
        #39'Descricao,'
      '        ('#9#9
      #9#9#9'SELECT /*+RULE*/ COUNT(1) E22000'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9')'
      ''
      #9#9') S,                   '
      '       '#39'22000'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      ''
      ''
      'UNION'
      ''
      
        'SELECT 11 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'23000 Resgates'#39'Descr' +
        'icao,'
      '    '
      '       0 S,'
      '      '#39'23000'#39' CONTA'
      
        #9'  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39')' +
        ',DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 12 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24100 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Originário'#39'Descricao,'
      '        0 S,'
      '       '#39'24100'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 13 ORDEM,'#39'Dados de Institutos'#39' Tipo,'#39'24200 Portabilidade ' +
        #39' ||'#39'-'#39'|| '#39' Plano de Benefícios Receptor'#39'Descricao,'
      '        0 S,'
      '       '#39'24200'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '  FROM DUAL /*+ RULE*/'
      'UNION'
      
        'SELECT 14 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participantes ' +
        'Ativos (totalizador)'#39' Descricao, SUM(S) S, '#39'31000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM '
      '('
      
        #9#9'SELECT 1 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31200 Participante' +
        ' '#39' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39' Descricao,'
      
        #9#9#9#9'(SELECT /*+RULE*/ COUNT(1) S31200 /* FALTA ESSA SAIDA É IGUA' +
        'L A CONTA 22000*/'
      #9#9#9#9'   FROM ('
      #9#9#9#9#9#9'   SELECT PA.IDPESSOA'
      #9#9#9#9#9#9'FROM PARTPREVPLAN PA, EVENTOSPREV EV'
      #9#9#9#9#9#9'WHERE PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9#9#9'AND PA.FLGDESATIVADO = 1'
      #9#9#9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)  '
      
        #9#9#9#9#9#9'AND EV.DATAREGISTRO BETWEEN TO_DATE(:DataInicioPeriodo, '#39'D' +
        'D/MM/YYYY'#39')'
      
        #9#9#9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:' +
        'NVEZES)'
      #9#9#9#9#9#9'AND EV.IDEVENTOGERADOR IN (14, 13, 4, 358)'
      #9#9#9#9')) S,'
      #9#9#9#39'31200'#39' CONTA'
      #9#9#9
      #9#9'  FROM DUAL'
      #9#9'UNION'
      
        #9#9'SELECT 2 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31000 Participante ' +
        #39' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descrica' +
        'o,'
      #9#9' ('
      #9#9' '
      #9#9#9'SELECT /*+RULE*/ COUNT(1) E31300'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9')'
      #9#9#9
      #9#9#9
      #9#9#9
      #9#9#9') S,'
      #9#9#9'   '#39'31000'#39' CONTA'
      #9#9#9'  '
      #9#9'  FROM DUAL '
      ')  '
      ''
      'UNION'
      
        'SELECT  15 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'31100 Participante' +
        ' '#39'||'#39'-'#39'||'#39' com custeio exclusivamente patronal'#39' Descricao, 0 S, ' +
        #39'31100'#39' CONTA '
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT '
      'FROM DUAL'
      'UNION'
      
        'SELECT 16 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31200 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio patronal e do participante'#39'Descricao,'
      '       (SELECT /*+RULE*/ COUNT(1) E31200'
      '          FROM ('
      #9#9#9#9'  SELECT PA.IDPESSOA'
      #9#9#9#9#9'FROM PARTPREVPLAN PA, EVENTOSPREV EV'
      #9#9#9#9#9'WHERE PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9#9'AND PA.FLGDESATIVADO = 1'
      #9#9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB)  '
      
        #9#9#9#9#9'AND EV.DATAREGISTRO BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD' +
        '/MM/YYYY'#39')'
      
        #9#9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:N' +
        'VEZES)'
      #9#9#9#9#9'AND EV.IDEVENTOGERADOR IN (14, 13, 4, 358)'
      #9#9'  )) S,'
      '                        '
      '    '#39'31200'#39' CONTA'
      
        #9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),D' +
        'ATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      'UNION'
      
        'SELECT 17 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'31300 Participante '#39 +
        ' ||'#39'-'#39'|| '#39' com custeio exclusivamente do participante'#39' Descricao' +
        ','
      '      ('
      '       SELECT /*+RULE*/ COUNT(1) E31300'
      '          FROM ('
      #9'   '#9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT'
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77)'
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(:DataInicioPeriodo,' +
        ' '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9#9'MINUS'
      #9#9#9#9'SELECT DISTINCT EV.IDPESSOA'
      #9#9#9#9'FROM EVENTOSPREV EV,'
      #9#9#9#9'PARTPREVPLAN PT '
      #9#9#9#9'WHERE PT.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PT.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PT.IDPLANOPREV = EV.IDPLANOPREV'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (3,9)'
      #9#9#9#9'AND EV.IDPLANOPREV IN (:PLANOCONTAB) '
      #9#9#9#9'AND PT.IDSITPART NOT IN (2, 77) '
      
        #9#9#9#9'AND EV.DATAREGISTRO <  Add_months(TO_DATE(:DataInicioPeriodo' +
        ', '#39'DD/MM/YYYY'#39'),:NVEZES)'
      #9#9#9'))S,'
      '        '#39'31300'#39' CONTA'
      
        #9#9',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM DUAL'
      '  '
      'UNION'
      ''
      
        'SELECT  18 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'32000 Assistidos A' +
        'posentados'#39'Descricao, SUM(S) S, '#39'32000'#39' CONTA'
      
        ',TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),DA' +
        'TAMES)-1,'#39'mm/yyyy'#39') DAT'
      '  FROM ('
      '         SELECT 1 ORDEM,'
      '                (SELECT /*+RULE*/ COUNT(1) S11100'
      '                   FROM ('
      #9#9#9#9'   '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11100ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9
      '                '#39'11100'#39' CONTA        '
      '          FROM DUAL'
      '        '
      '        UNION'
      '           SELECT 2 ORDEM,    '
      #9#9#9'   '
      '               (SELECT /*+RULE*/COUNT(1) S11200'
      '                  FROM ('
      #9#9#9#9'  '
      #9#9#9#9'   SELECT DISTINCT BF.IDPESSOA'
      #9#9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA /* para a consulta 11100 e' +
        ' 11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9#9'AND   BF.IDBENEFICIO IN (:CONTA11200ENT) '
      
        #9#9#9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                ' +
        '  '
      #9#9#9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      
        #9#9#9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*' +
        '/'
      #9#9#9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),' +
        ':NVEZES)'
      #9#9#9#9#9#9')) S,'#9'   '
      #9#9#39'11200'#39' CONTA        '
      '          FROM DUAL'
      ')'
      'UNION'
      ''
      ''
      
        '(SELECT 19 ORDEM,'#39'Dados de Populações'#39' Tipo, '#39'33000 Assistidos B' +
        'eneficiários de Pensão'#39'Descricao,'
      '        ('
      #9#9'SELECT /*+RULE*/ COUNT(1) S14000'
      '          FROM ('
      #9#9'  SELECT DISTINCT BF.IDPESSOA'
      #9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9' MOVBENEF MOV,'
      #9#9#9#9' PESSOAFISICA PF'
      
        #9#9#9'WHERE BF.IDTITULAR <> BF.IDPESSOA /* para a consulta 11100 e ' +
        '11200 irá utilizar idtitular = idpessoa*/'
      #9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9'AND   BF.IDSITBENEFICIO = 3'
      #9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9'AND   BF.IDBENEFICIO IN (:CONTA14000ENT) '
      #9#9#9'AND   BF.IDPLANPREVCONTAB IN (:PLANOCONTAB)                  '
      #9#9#9'AND   MOV.IDPLANOPREV = BF.IDPLANOPREV'
      #9#9#9'AND   MOV.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND   MOV.IDTITULAR = BF.IDTITULAR'
      #9#9#9'AND   MOV.TIPOMOV IN (4,9) /*(4 ENCERRAMENTO,9FALECIMENTO)*/'
      #9#9#9'AND   MOV.MOTRETENC IS NOT NULL'
      #9#9#9'AND   PF.IDPESSOA = BF.IDPESSOA'
      #9#9#9'AND   PF.DATAMORTE IS NOT NULL'
      
        #9#9#9'AND   MOV.DATAMOV BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/MM/' +
        'YYYY'#39')'
      
        #9#9#9'AND   Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:N' +
        'VEZES)'
      #9#9'     )'
      #9#9#9' ) S,                      '
      '       '#39'33000'#39' CONTA'
      
        #9'   ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39 +
        '),DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '  FROM DUAL ) '
      'UNION'
      
        ' SELECT 20 ORDEM,'#39'Dados de Populações'#39' Tipo,'#39'34000 Designados'#39' D' +
        'escricao,'
      '    '
      '         (SELECT /*+RULE*/ COUNT(1) S34000'
      '            FROM ('
      #9#9#9#9'SELECT DP.IDPESSOA, PPP.IDPLANOPREV'
      #9#9#9#9'FROM PARTPREVPLAN PPP,'
      #9#9#9#9'DEPENTIT DP'
      #9#9#9#9'WHERE PPP.IDPESSOA = DP.IDTITULAR'
      #9#9#9#9'AND DP.IDTITULAR <> DP.IDPESSOA'
      #9#9#9#9'/*AND DP.DATACANCELA IS NOT NULL*/'
      #9#9#9#9'AND PPP.IDPLANOPREV IN (:PLANOCONTAB)  '
      #9#9#9#9'AND (DP.FLGDEPLEGAL = 1 OR DP.FLGDESIGNADO = 1)'
      #9#9#9#9'AND PPP.FLGDESATIVADO = 0'
      
        #9#9#9#9'AND DP.DATACANCELA BETWEEN TO_DATE(:DataInicioPeriodo, '#39'DD/M' +
        'M/YYYY'#39') '
      
        #9#9#9#9'AND Add_months(TO_DATE(:DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),:NV' +
        'EZES)'
      #9#9#9')) S,'
      '  '#39'34000'#39' CONTA '
      
        '  ,TO_char(Add_months(TO_DATE(:DataInicioPeriodo, '#39'dd/MM/YYYY'#39'),' +
        'DATAMES)-1,'#39'mm/yyyy'#39') DAT'
      ''
      '    FROM DUAL /*+ RULE*/'
      '     '
      '     '
      ' ')
    ValidateWithMask = True
    Left = 728
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA14000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11100ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA11200ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTA14000ENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NVEZES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicioPeriodo'
        ParamType = ptUnknown
      end>
  end
  object qryAuxAnterior: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT MAX(SEMESTREREFERENCIA) SEMESTRE ,MAX(ANOREFERENCIA) ANO'
      '  FROM MPREVICDEMONEST'
      ' WHERE ANOREFERENCIA = (SELECT MAX(MP.ANOREFERENCIA)'
      '                          FROM MPREVICDEMONEST MP'
      
        '                         WHERE MP.TIPODEMONSTRATIVO = :TIPO AND ' +
        'MP.ANOREFERENCIA <= :ANO)'
      '                         '
      '                         '
      '                         '
      '                      ')
    ValidateWithMask = True
    Left = 536
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end>
  end
  object qryAuxIdadeSexo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from '
      '(SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Participante'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'A'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('#9#9#9'   '
      '           (SELECT PA.IDPESSOA'
      
        #9#9#9'FROM PARTPREVPLAN PA, ELEGPATRO EL, EVENTOSPREV EV,SITPART SI' +
        ' '
      #9#9#9'WHERE PA.IDPESSOA = EL.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EL.IDPESSJUR'
      #9#9#9#9'AND PA.IDPESSOA = EV.IDPESSOA'
      #9#9#9#9'AND PA.IDPESSJUR = EV.IDPESSJUR'
      #9#9#9#9'AND PA.FLGDESATIVADO = 0'
      #9#9#9#9'AND EV.IDPLANOPREV IN (PLANOCONTAB)'
      #9#9#9#9'AND SI.IDSITPART = PA.IDSITPART '
      #9#9#9#9'AND SI.FLGINTERNO IN ('#39'AT'#39', '#39'MA'#39', '#39'MS'#39', '#39'MP'#39') '
      
        #9#9#9#9'AND EV.DATAREGISTRO < Add_months(TO_DATE(DataInicioPeriodo, ' +
        #39'DD/MM/YYYY'#39'),NVEZES)'
      #9#9#9#9'AND EV.IDEVENTOGERADOR IN (1, 23, 349, 350, 352, 354)'#9
      #9#9#9#9'AND PA.DATACANCELAMENTO IS NULL)'#9#9#9#9
      
        #9#9#9#9'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*' +
        '/ '
      #9#9'UNION'
      #9'/* FIM CONTAS 31200 PESQUISA'
      #9'---- INICIO CONTAS 31300 PESQUISA*/'
      #9#9' (SELECT DISTINCT EV.IDPESSOA'
      '        FROM EVENTOSPREV EV,'
      '             PARTPREVPLAN PT,'
      '             SITPART ST'
      '        WHERE EV.IDPESSOA = PT.IDPESSOA'
      '        AND   EV.IDPESSJUR = PT.IDPESSJUR'
      '        AND   ST.FLGINTERNO IN ('#39'AT'#39', '#39'MA'#39', '#39'MS'#39', '#39'MP'#39')'
      '        AND   PT.IDSITPART = ST.IDSITPART'
      '        AND   PT.IDPESSOA = EV.IDPESSOA '
      '        AND   PT.FLGDESATIVADO = 0'
      '        AND   EV.IDPLANOPREV IN (PLANOCONTAB)  '
      '        AND   PT.DATACANCELAMENTO IS NULL      '
      
        '        AND EV.DATAREGISTRO < Add_months(TO_DATE(DataInicioPerio' +
        'do, '#39'DD/MM/YYYY'#39'),NVEZES))'
      ''
      '           ) EV'
      '         WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9'  AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      'UNION'
      'SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Assistidos Aposentados'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'B'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('
      '           '#9'   SELECT BF.IDPESSOA /*DISTINCT BF.IDPLANOPREV,*/'
      #9#9#9#9#9'   /*COUNT (BF.IDPLANOPREV) E11100*/'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' PARTPREVPLAN PPP'
      #9#9#9#9'WHERE BF.IDTITULAR = BF.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   PPP.IDPLANOPREV = BF.IDPLANOPREV '
      #9#9#9#9'AND   PPP.DATACANCELAMENTO IS NULL'#9
      #9#9#9#9'AND   BF.IDPLANOPREV IN (PLANOCONTAB)              '
      #9#9#9#9'AND   PPP.IDPESSOA = BF.IDPESSOA'
      
        #9#9#9#9'AND  BF.DATAINICIO < Add_months(TO_DATE(DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),NVEZES)'
      '        /* FIM CONTAS 11100 PESQUISA          '
      '        ---- INICIO CONTAS 11200 PESQUISA*/'
      '        UNION'
      #9#9'(SELECT DISTINCT BF.IDPESSOA'
      
        '                          FROM BENEFBFCIARIO BF, PARTPREVPLAN PP' +
        'P'
      '                         WHERE BF.IDTITULAR = BF.IDPESSOA'
      '                           AND BF.FONTEPAGADORA = 1'
      '                           AND BF.IDSITBENEFICIO = 1'
      #9#9#9#9#9#9'   AND PPP.DATACANCELAMENTO IS NULL'
      #9#9#9#9#9#9'   AND BF.IDTPPAGTOBENEFIC = 1'
      '                           AND PPP.IDPLANOPREV = BF.IDPLANOPREV'
      '                           AND PPP.IDPESSOA = BF.IDPESSOA'
      #9#9#9#9#9#9'   AND BF.IDPLANOPREV in (PLANOCONTAB)'
      
        '                           AND BF.DATAINICIO < Add_months(TO_DAT' +
        'E(DataInicioPeriodo, '#39'DD/MM/YYYY'#39'),NVEZES))'
      '        /* FIM CONTAS 11200 PESQUISA*/  '
      '                 ) EV '
      '        WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9'AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      'UNION'
      'SELECT GR.CODIGO,'
      '       NVL(SUM(TS.MASC), 0) MASC,'
      '       NVL(SUM(TS.FEM), 0) FEM,'
      '       '#39'Beneficiários de Pensão'#39' TIPO,'
      '       GR.DESCRICAO,'
      '       '#39' '#39' MES,'
      #9'   '#39'C'#39' ORDEM'
      '  FROM (select PF.DATANASC,'
      '               PF.SEXO,'
      '               PF.IDPESSOA,'
      '               DECODE(PF.SEXO, '#39'M'#39', 1, 0) MASC,'
      '               DECODE(PF.SEXO, '#39'M'#39', 0, 1) FEM,'
      
        '               TRUNC((TO_DATE(DataInicioPeriodo) - PF.DATANASC) ' +
        '/ 365.25) AS IDADE,'
      '               CASE'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) <= 24 THEN'
      '                  1'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 25 and 34 THEN'
      '                  2'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 35 and 54 THEN'
      '                  3'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 55 and 64 THEN'
      '                  4'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 65 and 74 THEN'
      '                  5'
      
        '                 WHEN TRUNC((TO_DATE(DataInicioPeriodo) - PF.DAT' +
        'ANASC) / 365.25) between 75 and 84 THEN'
      '                  6'
      '                 else'
      '                  7'
      '               end GRUPO'
      '          from PESSOAFISICA PF,'
      '               ('
      #9#9#9'   '
      #9#9#9#9'SELECT  BF.IDPESSOA'
      #9#9#9#9'FROM BENEFBFCIARIO BF,'
      #9#9#9#9#9' DEPENTIT DE'
      #9#9#9#9'WHERE BF.IDPESSOA = DE.IDPESSOA'
      #9#9#9#9'AND   BF.IDTITULAR = DE.IDTITULAR'
      #9#9#9#9'AND   BF.IDTITULAR <> DE.IDPESSOA'
      #9#9#9#9'AND   BF.FONTEPAGADORA = 1'
      #9#9#9#9'AND   BF.IDSITBENEFICIO = 1'
      #9#9#9#9'AND   BF.IDTPPAGTOBENEFIC = 1'
      #9#9#9#9'AND   BF.IDPLANOPREV IN (PLANOCONTAB)'
      
        #9#9#9#9'AND  BF.DATAINICIO < Add_months(TO_DATE(DataInicioPeriodo, '#39 +
        'DD/MM/YYYY'#39'),NVEZES)'
      #9#9#9'   '
      #9#9#9'   '
      #9#9#9#9
      #9#9#9#9')  EV'
      '         WHERE PF.IDPESSOA = EV.IDPESSOA'
      #9#9' AND  PF.DATAMORTE IS NULL) TS,'
      '       (SELECT NID AS CODIGO,'
      '               CASE'
      '                 WHEN NID = 1 THEN'
      '                  '#39'Até 24 anos'#39
      '                 WHEN NID = 2 THEN'
      '                  '#39'De 25 a 34 anos'#39
      '                 WHEN NID = 3 THEN'
      '                  '#39'De 35 a 54 anos'#39
      '                 WHEN NID = 4 THEN'
      '                  '#39'De 55 a 64 anos'#39
      '                 WHEN NID = 5 THEN'
      '                  '#39'De 65 a 74 anos'#39
      '                 WHEN NID = 6 THEN'
      '                  '#39'De 75 a 84 anos'#39
      '                 else'
      '                  '#39'Acima de 85 anos'#39
      '               end DESCRICAO'
      
        '          FROM (SELECT ROWNUM NID FROM USUARIOSISTEMA WHERE ROWN' +
        'UM < 8)) GR'
      ' WHERE GR.CODIGO = TS.GRUPO(+)'
      ' GROUP BY GR.CODIGO, '#39'Participante'#39', GR.DESCRICAO'
      ')'
      ''
      'ORDER BY ORDEM,CODIGO')
    ValidateWithMask = True
    Left = 344
    Top = 416
  end
  object qryDelete: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE cm.MPREVICDEMONEST'
      ' WHERE ANOREFERENCIA = :ANOREFERENCIA'
      '   AND SEMESTREREFERENCIA = :SEMESTREREFERENCIA'
      '    AND TIPODEMONSTRATIVO = :TIPODEMONSTRATIVO ')
    ValidateWithMask = True
    Left = 920
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'semestrereferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPODEMONSTRATIVO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSexo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE cm.MPREVICDEMONESTIDSEX'
      ' WHERE ANOREFERENCIA = :ANOREFERENCIA'
      '   AND MESREFERENCIA = :MESREFERENCIA'
      '   AND PLANOPREVIDENCIARIO :PLANOPREVIDENCIARIO'
      '')
    ValidateWithMask = True
    Left = 752
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOPREVIDENCIARIO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSexoAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE cm.MPREVICDEMONESTIDSEX'
      ' WHERE ANOREFERENCIA = :ANOREFERENCIA'
      '   AND MESREFERENCIA = :MESREFERENCIA'
      '   AND PLANOPREVIDENCIARIO :PLANOPREVIDENCIARIO')
    ValidateWithMask = True
    Left = 752
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOPREVIDENCIARIO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE cm.MPREVICDEMONEST'
      ' WHERE ANOREFERENCIA = :ANOREFERENCIA'
      '   AND SEMESTREREFERENCIA = :SEMESTREREFERENCIA'
      '    AND TIPODEMONSTRATIVO = :TIPODEMONSTRATIVO ')
    ValidateWithMask = True
    Left = 864
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'semestrereferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPODEMONSTRATIVO'
        ParamType = ptUnknown
      end>
  end
end
