inherited dtmRelatorios2: TdtmRelatorios2
  Left = 137
  Top = 219
  Width = 515
  Height = 199
  Caption = 'dtmRelatorios2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 354
    Top = 124
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 354
    Top = 110
  end
  inherited qryExemplo: TwwQuery
    Left = 354
    Top = 97
  end
  inherited rpExemplo: TppReport
    Left = 354
    Top = 85
  end
  object ppGerencial2: TppBDEPipeline
    DataSource = dsGerencial2
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial2'
    Left = 159
    Top = 24
    object ppGerencial2ppField1: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGerencial2ppField2: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGerencial2ppField3: TppField
      FieldAlias = 'REMUNERACAO'
      FieldName = 'REMUNERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsGerencial2: TwwDataSource
    DataSet = qryGerencial2
    Left = 159
    Top = 12
  end
  object qryGerencial2: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE (CC.NOME,'#39#39','#39#39',CC.NOME) || DECODE(CC.CODREDUZIDO,'#39#39','#39#39',' +
        #39' ('#39'||'
      '    CC.CODREDUZIDO||'#39')'#39') AS C_CUSTO,'
      '  C.TITULO AS CARGO,'
      
        '  SUM((NVL(RUBRICA1.VALORPROVENTO,0) + NVL(RUBRICA2.VALORPROVENT' +
        'O,0) + NVL(RUBRICA3.VALORPROVENTO,0) + NVL(RUBRICA4.VALORPROVENT' +
        'O,0) + NVL(RUBRICA5.VALORPROVENTO,0) + NVL(RUBRICA6.VALORPROVENT' +
        'O,0))) AS REMUNERACAO'
      'FROM'
      
        '  FUNCIONARIO F, CENTCUST CC, CARGO C, PESSOA PJ, EMPRESAPROP EP' +
        ', SITFUNC ST,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'40001'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA1,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'40571'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA2,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'50004'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA3,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'43660'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA4,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'43650'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA5,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'50002'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA6'
      'WHERE'
      '  (PJ.IDPESSOA    = 21615) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'02/1999'#39','#39'MM/YYYY'#39')) AND'
      '  (EP.IDPESSOA      = PJ.IDGRUPO)  AND'
      '  (F.IDESTAB        = PJ.IDPESSOA) AND'
      '  (ST.TIPOSIT       <> '#39'D'#39') AND'
      '  (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (F.IDCARGO        = C.IDCARGO) AND'
      '  ((RUBRICA1.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA2.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA3.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA4.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA5.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA6.VALORPROVENTO IS NOT NULL)'
      '  ) AND'
      '  (F.IDPESSOA = RUBRICA1.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA2.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA3.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA4.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA5.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA6.IDPESSOA(+))'
      'GROUP BY'
      '  CC.NOME, CC.CODREDUZIDO, C.TITULO'
      'ORDER BY'
      '  C_CUSTO')
    ValidateWithMask = True
    Left = 159
  end
  object ppGerencial3: TppBDEPipeline
    DataSource = dsGerencial3
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial3'
    Left = 230
    Top = 23
  end
  object dsGerencial3: TwwDataSource
    DataSet = qryGerencial3
    Left = 230
    Top = 11
  end
  object qryGerencial3: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE (CC.NOME,'#39#39','#39#39',CC.NOME) || DECODE(CC.CODREDUZIDO,'#39#39','#39#39',' +
        #39' ('#39'||'
      '    CC.CODREDUZIDO||'#39')'#39') AS C_CUSTO,'
      '  C.TITULO AS CARGO,'
      '  ATIVO.QUANTIDADE AS ATIVOS,'
      '  NVL(EM_LICENCA.QUANTIDADE,0) AS LICENCA'
      'FROM'
      '  FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,'
      '  (SELECT'
      
        '     CC.CODCENTROCUSTO, F.IDCARGO, COUNT(F.IDPESSOA) AS QUANTIDA' +
        'DE'
      '   FROM FUNCIONARIO F, CENTCUST CC, SITFUNC ST'
      '   WHERE'
      '     (F.IDESTAB      = 535) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '        TO_DATE('#39'03/2000'#39','#39'MM/YYYY'#39')) AND'
      '    (ST.IDSITFUNC NOT IN (4,5,6,8,9)) AND'
      '     (ST.TIPOSIT      <> '#39'D'#39')       AND'
      '     (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '     (CC.IDEMPRESA     = F.IDEMPRESA)'
      '   GROUP BY'
      '     CC.CODCENTROCUSTO, F.IDCARGO) ATIVO,'
      '  (SELECT'
      '     CC.CODCENTROCUSTO, COUNT(F.IDPESSOA) AS QUANTIDADE'
      '   FROM FUNCIONARIO F, CENTCUST CC, SITFUNC ST'
      '   WHERE'
      '     (F.IDESTAB      = 535) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '        TO_DATE('#39'03/2000'#39','#39'MM/YYYY'#39')) AND'
      '    (ST.IDSITFUNC IN (4,5,6,8,9)) AND'
      '     (ST.TIPOSIT      <> '#39'D'#39')       AND'
      '     (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '     (CC.IDEMPRESA     = F.IDEMPRESA)'
      '   GROUP BY'
      '     CC.CODCENTROCUSTO) EM_LICENCA'
      'WHERE'
      '  (F.IDESTAB      = 535) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'03/2000'#39','#39'MM/YYYY'#39')) AND'
      '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (CC.IDEMPRESA     = F.IDEMPRESA) AND'
      '  (F.IDCARGO        = C.IDCARGO)   AND'
      '  (F.CODCENTROCUSTO = ATIVO.CODCENTROCUSTO) AND'
      '  (F.IDCARGO        = ATIVO.IDCARGO) AND'
      '  (F.CODCENTROCUSTO = EM_LICENCA.CODCENTROCUSTO(+))'
      'ORDER BY'
      '  C_CUSTO')
    ValidateWithMask = True
    Left = 230
    Top = 65535
  end
  object ppGerencial4: TppBDEPipeline
    DataSource = dsGerencial4
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial4'
    Left = 302
    Top = 24
  end
  object dsGerencial4: TwwDataSource
    DataSet = qryGerencial4
    Left = 302
    Top = 12
  end
  object qryGerencial4: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  COUNT(F.IDPESSOA) AS NUM_FUNC, F.SALARIOATUAL'
      'FROM'
      
        '  FUNCIONARIO F, PESSOAFISICA PF, PESSOA PJ, FILIALPESSOA FP, EM' +
        'PRESAPROP EP, SITFUNC ST'
      'WHERE'
      '  (PJ.IDPESSOA    = 21615) AND'
      '  (EP.IDPESSOA       = PJ.IDGRUPO)  AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND'
      '  (F.SALARIOATUAL    > 0)           AND'
      '  (F.IDESTAB         = PJ.IDPESSOA) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'02/1999'#39','#39'MM/YYYY'#39')) AND'
      '  (ST.TIPOSIT       <> '#39'D'#39')       AND'
      '  (ST.IDSITFUNC      = F.IDSITFUNC) AND'
      '  (F.IDPESSOA        = PF.IDPESSOA)'
      'GROUP BY'
      '  F.SALARIOATUAL, PJ.NOME'
      'ORDER BY'
      '  NUM_FUNC')
    ValidateWithMask = True
    Left = 302
  end
  object ppGerencial5: TppBDEPipeline
    DataSource = dsGerencial5
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial5'
    Left = 21
    Top = 122
  end
  object dsGerencial5: TwwDataSource
    DataSet = qryGerencial5
    Left = 21
    Top = 110
  end
  object qryGerencial5: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE (CC.NOME,'#39#39','#39#39',CC.NOME) || DECODE(CC.CODREDUZIDO,'#39#39','#39#39',' +
        #39' ('#39'||'
      '    CC.CODREDUZIDO||'#39')'#39') AS C_CUSTO,'
      '  C.TITULO AS CARGO,'
      
        '  COUNT((NVL(RUBRICA1.VALORPROVENTO,0) + NVL(RUBRICA2.VALORPROVE' +
        'NTO,0) + NVL(RUBRICA3.VALORPROVENTO,0) + NVL(RUBRICA4.VALORPROVE' +
        'NTO,0) + NVL(RUBRICA5.VALORPROVENTO,0) + NVL(RUBRICA6.VALORPROVE' +
        'NTO,0))) AS NUM_GRATIF,'
      
        '  SUM((NVL(RUBRICA1.VALORPROVENTO,0) + NVL(RUBRICA2.VALORPROVENT' +
        'O,0) + NVL(RUBRICA3.VALORPROVENTO,0) + NVL(RUBRICA4.VALORPROVENT' +
        'O,0) + NVL(RUBRICA5.VALORPROVENTO,0) + NVL(RUBRICA6.VALORPROVENT' +
        'O,0))) AS VAL_GRATIF'
      'FROM'
      
        '  FUNCIONARIO F, CENTCUST CC, CARGO C, PESSOA PJ, EMPRESAPROP EP' +
        ', SITFUNC ST,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'40001'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA1,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'40571'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA2,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'50004'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA3,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'43660'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA4,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'43650'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA5,'
      '  (SELECT IDPESSOA, VALORPROVENTO'
      '   FROM   HISTRUBSAL'
      '   WHERE  (CODPROVDESC = '#39'50002'#39') AND'
      '          (MES         = '#39'1999/02'#39')) RUBRICA6'
      'WHERE'
      '  (PJ.IDPESSOA    = 21615) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'02/1999'#39','#39'MM/YYYY'#39')) AND'
      '  (EP.IDPESSOA      = PJ.IDGRUPO)  AND'
      '  (F.IDESTAB        = PJ.IDPESSOA) AND'
      '  (ST.TIPOSIT       <> '#39'D'#39') AND'
      '  (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (F.IDCARGO        = C.IDCARGO) AND'
      '  ((RUBRICA1.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA2.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA3.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA4.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA5.VALORPROVENTO IS NOT NULL)'
      '   OR (RUBRICA6.VALORPROVENTO IS NOT NULL)'
      '  ) AND'
      '  (F.IDPESSOA = RUBRICA1.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA2.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA3.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA4.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA5.IDPESSOA(+))'
      '  AND (F.IDPESSOA = RUBRICA6.IDPESSOA(+))'
      'GROUP BY'
      '  CC.NOME, CC.CODREDUZIDO, C.TITULO'
      'ORDER BY'
      '  C_CUSTO')
    ValidateWithMask = True
    Left = 21
    Top = 98
  end
  object ppGerencial6A: TppBDEPipeline
    DataSource = dsGerencial6A
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppGerencial6A'
    Left = 99
    Top = 122
    object ppGerencial6AppField1: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppGerencial6AppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ADMITIDOS'
      FieldName = 'ADMITIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial6AppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEMITIDOS'
      FieldName = 'DEMITIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsGerencial6A: TwwDataSource
    DataSet = qryGerencial6A
    Left = 99
    Top = 110
  end
  object qryGerencial6A: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE (CC.NOME,'#39#39','#39#39',CC.NOME) || DECODE(CC.CODREDUZIDO,'#39#39','#39#39',' +
        #39' ('#39'||'
      '    CC.CODREDUZIDO||'#39')'#39') AS C_CUSTO,'
      '  NVL(ADMITIDOS.NUMERO,0)       AS ADMITIDOS,'
      '  NVL(DEMITIDOS.NUMERO,0)       AS DEMITIDOS'
      'FROM'
      '  FUNCIONARIO F, CENTCUST CC, PESSOA PJ,'
      ''
      '  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, CENTCUST CC, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA      = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') ='
      '        TO_DATE('#39'12/1999'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB        = PJ.IDPESSOA)  AND'
      '     (ST.TIPOSIT      <> '#39'D'#39')        AND'
      '     (ST.IDSITFUNC     = F.IDSITFUNC)  AND'
      '     (CC.IDEMPRESA     = PJ.IDGRUPO)   AND'
      '     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '   GROUP BY'
      '     CC.CODCENTROCUSTO) ADMITIDOS,'
      ''
      '  (SELECT COUNT(F.IDPESSOA) AS NUMERO, CC.CODCENTROCUSTO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, CENTCUST CC, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA       = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') ='
      '        TO_DATE('#39'12/1999'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB         = PJ.IDPESSOA) AND'
      '     (ST.TIPOSIT        = '#39'D'#39')       AND'
      '     (ST.IDSITFUNC      = F.IDSITFUNC) AND'
      '     (CC.IDEMPRESA      = PJ.IDGRUPO)  AND'
      '     (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)'
      '   GROUP BY'
      '     CC.CODCENTROCUSTO) DEMITIDOS'
      'WHERE'
      '  (PJ.IDPESSOA                = 515) AND'
      '  (F.IDESTAB                  = PJ.IDPESSOA) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'12/1999'#39','#39'MM/YYYY'#39')) AND'
      '  (F.CODCENTROCUSTO           = CC.CODCENTROCUSTO) AND'
      '  ((DEMITIDOS.CODCENTROCUSTO IS NOT NULL)  OR'
      '   (ADMITIDOS.CODCENTROCUSTO IS NOT NULL)) AND'
      '  (F.CODCENTROCUSTO           = DEMITIDOS.CODCENTROCUSTO) AND'
      '  (F.CODCENTROCUSTO           = ADMITIDOS.CODCENTROCUSTO)'
      'ORDER BY'
      '  C_CUSTO')
    ValidateWithMask = True
    Left = 99
    Top = 98
  end
  object ppGerencial6B: TppBDEPipeline
    DataSource = dsGerencial6B
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppGerencial6B'
    Left = 179
    Top = 122
    object ppGerencial6BppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_ESTAGIARIOS'
      FieldName = 'NUM_ESTAGIARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppGerencial6BppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS_ANTERIOR'
      FieldName = 'POS_ANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial6BppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS_ATUAL'
      FieldName = 'POS_ATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsGerencial6B: TwwDataSource
    DataSet = qryGerencial6B
    Left = 179
    Top = 110
  end
  object qryGerencial6B: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  NVL(TOT_ESTAGIARIOS.NUMERO,0) AS NUM_ESTAGIARIOS,'
      '  TOT_EMPREGADOS_ANT.NUMERO     AS POS_ANTERIOR,'
      '  (TOT_EMPREGADOS_ANT.NUMERO+NVL(TOT_ADMITIDOS.NUMERO,0)) -'
      '    NVL(TOT_DEMITIDOS.NUMERO,0) AS POS_ATUAL'
      'FROM'
      '  FUNCIONARIO F, PESSOA PJ,'
      '  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, PESSOA PF, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA    = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <'
      '        TO_DATE('#39'04/2000'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB       = PJ.IDPESSOA) AND'
      '     (ST.TIPOSIT     <> '#39'D'#39')       AND'
      '     (ST.IDSITFUNC    = F.IDSITFUNC) AND'
      '     (F.IDPESSOA      = PF.IDPESSOA)'
      '   GROUP BY'
      '     PJ.IDPESSOA) TOT_EMPREGADOS_ANT,'
      ''
      '  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, PESSOA PF, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA    = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '        TO_DATE('#39'04/2000'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB      = PJ.IDPESSOA) AND'
      '     (ST.TIPOSIT    <> '#39'D'#39')       AND'
      '     (ST.IDSITFUNC   = F.IDSITFUNC) AND'
      '     (F.IDPESSOA     = PF.IDPESSOA) AND'
      '     (F.TIPOCONTRATO = '#39'G'#39')'
      '   GROUP BY'
      '     PJ.IDPESSOA) TOT_ESTAGIARIOS,'
      '  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, CENTCUST CC, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA       = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') ='
      '        TO_DATE('#39'04/2000'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB        = PJ.IDPESSOA) AND'
      '     (ST.TIPOSIT      <> '#39'D'#39')       AND'
      '     (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '     (CC.IDEMPRESA     = PJ.IDGRUPO)  AND'
      '     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '   GROUP BY'
      '     PJ.IDPESSOA) TOT_ADMITIDOS,'
      ''
      '  (SELECT PJ.IDPESSOA AS IDEMPRESA, COUNT(F.IDPESSOA) AS NUMERO'
      '   FROM'
      '     FUNCIONARIO F, SITFUNC ST, CENTCUST CC, PESSOA PJ'
      '   WHERE'
      '     (PJ.IDPESSOA       = 515) AND'
      '     (TO_DATE(TO_CHAR(F.DATADESLIGAMENTO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') ='
      '        TO_DATE('#39'04/2000'#39','#39'MM/YYYY'#39')) AND'
      '     (F.IDESTAB        = PJ.IDPESSOA) AND'
      '     (ST.TIPOSIT       = '#39'D'#39')       AND'
      '     (ST.IDSITFUNC     = F.IDSITFUNC) AND'
      '     (CC.IDEMPRESA     = PJ.IDGRUPO)  AND'
      '     (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '   GROUP BY'
      '     PJ.IDPESSOA) TOT_DEMITIDOS'
      'WHERE'
      '  (PJ.IDPESSOA                = 515) AND'
      '  (F.IDESTAB                  = PJ.IDPESSOA) AND'
      '  (TO_DATE(TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39'),'#39'MM/YYYY'#39') <='
      '     TO_DATE('#39'04/2000'#39','#39'MM/YYYY'#39')) AND'
      
        '  (PJ.IDPESSOA                = TOT_EMPREGADOS_ANT.IDEMPRESA) AN' +
        'D'
      
        '  (PJ.IDPESSOA                = TOT_ADMITIDOS.IDEMPRESA(+))   AN' +
        'D'
      
        '  (PJ.IDPESSOA                = TOT_DEMITIDOS.IDEMPRESA(+))   AN' +
        'D'
      '  (PJ.IDPESSOA                = TOT_ESTAGIARIOS.IDEMPRESA(+))')
    ValidateWithMask = True
    Left = 179
    Top = 98
  end
  object ppGerencial7: TppBDEPipeline
    DataSource = dsGerencial7
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial7'
    Left = 253
    Top = 121
  end
  object dsGerencial7: TwwDataSource
    DataSet = qryGerencial7
    Left = 253
    Top = 109
  end
  object qryGerencial7: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PF.NOME,'
      '  TEMPO_CASA.MATRICULA,'
      '  TEMPO_CASA.DTADMISSAO,'
      '  TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39')     AS DTHOJE,'
      '  MOD(TO_NUMBER(TEMPO_CASA.VALOR),12) AS MES,'
      '  TRUNC(TEMPO_CASA.VALOR/12,0) ANO,'
      '  TEMPO_CASA.VALOR'
      'FROM'
      
        '  PESSOA PF, FUNCIONARIO F, PESSOA PJ, FILIALPESSOA FP, EMPRESAP' +
        'ROP EP, SITFUNC ST,'
      '  (SELECT DISTINCT'
      '     IDPESSOA,'
      '     MATRICULA,'
      '     TO_CHAR(DATAADMISSAO,'#39'DD/MM/YYYY'#39') AS DTADMISSAO,'
      
        '     (((TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE     ,'#39'DD/MM/YYYY'#39'),7,10' +
        ')) -'
      
        '       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,'#39'DD/MM/YYYY'#39'),7,10)' +
        ')) * 12 +'
      
        '      (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE     ,'#39'DD/MM/YYYY'#39'),4,2))' +
        ' -'
      
        '       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,'#39'DD/MM/YYYY'#39'),4,2))' +
        ') +'
      '      DECODE('
      
        '        (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE     ,'#39'DD/MM/YYYY'#39'),1,2' +
        ')) -'
      
        '         TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,'#39'DD/MM/YYYY'#39'),1,2' +
        '))) /'
      '        DECODE(SUBSTR(TO_CHAR(SYSDATE     ,'#39'DD/MM/YYYY'#39'),1,2),'
      '               SUBSTR(TO_CHAR(DATAADMISSAO,'#39'DD/MM/YYYY'#39'),1,2),'
      '               1,'
      
        '               ABS(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE     ,'#39'DD/MM/' +
        'YYYY'#39'),1,2)) -'
      
        '                   TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,'#39'DD/MM/' +
        'YYYY'#39'),1,2)))),'
      '               -1,'
      '               -1,'
      '               0))) AS VALOR'
      '  FROM'
      '    FUNCIONARIO'
      '  WHERE'
      '    (TO_CHAR(DATAADMISSAO,'#39'MM/YYYY'#39') <= '#39'10/1999'#39')) TEMPO_CASA'
      'WHERE'
      '  (PJ.IDPESSOA       = 535) AND'
      '  (EP.IDPESSOA       = PJ.IDGRUPO)  AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND'
      '  (ST.TIPOSIT       <> '#39'D'#39')       AND'
      '  (ST.IDSITFUNC      = F.IDSITFUNC) AND'
      '  (F.IDESTAB         = PJ.IDPESSOA) AND'
      '  (PF.IDPESSOA       = F.IDPESSOA)  AND'
      '  (TO_CHAR(F.DATAADMISSAO,'#39'MM/YYYY'#39') <= '#39'10/1999'#39') AND'
      '  (TEMPO_CASA.VALOR <> 0) AND'
      '  (PF.IDPESSOA       = TEMPO_CASA.IDPESSOA)'
      'ORDER BY'
      '  VALOR DESC')
    ValidateWithMask = True
    Left = 253
    Top = 97
  end
  object ppGerencial1: TppBDEPipeline
    DataSource = dsGerencial1
    OpenDataSource = False
    RefreshAfterPost = True
    SkipWhenNoRecords = False
    UserName = 'Gerencial1'
    Left = 87
    Top = 51
    object ppGerencial1ppField1: TppField
      FieldAlias = 'PROVENTODESCONTO'
      FieldName = 'PROVENTODESCONTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField2: TppField
      FieldAlias = 'TIPOPROVDESC'
      FieldName = 'TIPOPROVDESC'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField3: TppField
      FieldAlias = 'CODRUBRICA'
      FieldName = 'CODRUBRICA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField4: TppField
      FieldAlias = 'TIPOTOT'
      FieldName = 'TIPOTOT'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField5: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField6: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField7: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField8: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField9: TppField
      FieldAlias = 'TOT_FOLHA'
      FieldName = 'TOT_FOLHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppGerencial1ppField10: TppField
      FieldAlias = 'TOT_PARCIAL'
      FieldName = 'TOT_PARCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsGerencial1: TwwDataSource
    DataSet = cdsGerencial1
    Left = 87
    Top = 39
  end
  object rpReciboTerceiros: TppReport
    AutoStop = False
    DataPipeline = ppReciboTerceiros
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 436
    Top = 49
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 67733
      mmPrintPosition = 0
      object ReciboTerceirosrpShape3: TppShape
        UserName = 'Shape1'
        mmHeight = 9790
        mmLeft = 15081
        mmTop = 43656
        mmWidth = 134673
        BandType = 0
      end
      object ReciboTerceirosrpLabel1: TppLabel
        OnPrint = ReciboTerceirosrpLabel1Print
        UserName = 'Label1'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 77523
        mmTop = 43656
        mmWidth = 9790
        BandType = 0
      end
      object ReciboTerceirosrpLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Recebi as importâncias abaixo citadas de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14552
        mmTop = 56356
        mmWidth = 66411
        BandType = 0
      end
      object ReciboTerceirosrpShape8: TppShape
        UserName = 'Shape2'
        mmHeight = 9790
        mmLeft = 149490
        mmTop = 43656
        mmWidth = 32808
        BandType = 0
      end
      object ReciboTerceirosrpLabel11: TppLabel
        UserName = 'Label3'
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 43656
        mmWidth = 32808
        BandType = 0
      end
      object ReciboTerceirosrpLabel16: TppLabel
        UserName = 'Label4'
        Caption = 'Recibo de Pagamento a Terceiros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 61119
        mmTop = 31221
        mmWidth = 83609
        BandType = 0
      end
      object ReciboTerceirosrpDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 48419
        mmWidth = 132557
        BandType = 0
      end
      object ReciboTerceirosrpDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CPFCGC'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 48419
        mmWidth = 30692
        BandType = 0
      end
      object ReciboTerceirosrpDBText11: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object ReciboTerceirosrpDBText12: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 8202
        mmWidth = 7938
        BandType = 0
      end
      object ReciboTerceirosrpDBText13: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 13758
        mmWidth = 38100
        BandType = 0
      end
      object ReciboTerceirosrpDBText14: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 19315
        mmWidth = 20108
        BandType = 0
      end
      object ReciboTerceirosrpDBText1: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 82286
        mmTop = 56356
        mmWidth = 17463
        BandType = 0
      end
      object rpReciboTerceirosLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 15081
        mmTop = 66940
        mmWidth = 166423
        BandType = 0
      end
      object ReciboTerceirosrpLabel3: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'referentes a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14552
        mmTop = 61648
        mmWidth = 19050
        BandType = 0
      end
      object rpReciboTerceirosLabel4: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Data de Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 10319
        mmWidth = 34131
        BandType = 0
      end
      object rpReciboTerceirosDBText1: TppDBText
        UserName = 'DBText8'
        DataField = 'DATA_REF'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 164571
        mmTop = 10319
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ReciboTerceirosrpDESCRICAO: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCRICAO'
        DataPipeline = ppReciboTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 1323
        mmWidth = 137848
        BandType = 4
      end
      object ReciboTerceirosrpDBText8: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOR'
        DataPipeline = ppReciboTerceiros
        DisplayFormat = 'R$ #,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154252
        mmTop = 1323
        mmWidth = 27517
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      AfterPrint = rpAlfabMensalSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object ppGroup11: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppReciboTerceiros
      NewPage = True
      ResetPageNo = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 120915
        mmPrintPosition = 0
        object ReciboTerceirosrpShape13: TppShape
          UserName = 'Shape3'
          mmHeight = 21431
          mmLeft = 15346
          mmTop = 69850
          mmWidth = 166423
          BandType = 5
          GroupNo = 0
        end
        object ReciboTerceirosrpLabel5: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'perfazendo um total de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 16404
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object ReciboTerceirosrpVlrAdiantamento: TppLabel
          OnPrint = ReciboTerceirosrpVlrAdiantamentoPrint
          UserName = 'Label8'
          AutoSize = False
          Caption = 'ReciboTerceirosrpVlrAdiantamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 11906
          mmLeft = 15081
          mmTop = 22490
          mmWidth = 166423
          BandType = 5
          GroupNo = 0
        end
        object ReciboTerceirosrpLabel14: TppLabel
          UserName = 'Label9'
          Caption = 'Data de recebimento:  _____ /_____ /_______'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 71438
          mmWidth = 74083
          BandType = 5
          GroupNo = 0
        end
        object ReciboTerceirosrpLabel13: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Assinatura do favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 109802
          mmTop = 84667
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object ReciboTerceirosrpLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 77258
          mmTop = 82286
          mmWidth = 99484
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppReciboTerceiros
          DisplayFormat = 'R$ #,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          Transparent = True
          mmHeight = 4233
          mmLeft = 52123
          mmTop = 16404
          mmWidth = 35454
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosLabel1: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'a ser creditado no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 39952
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosNOME_BANCO: TppDBText
          OnPrint = rpReciboTerceirosNOME_BANCOPrint
          UserName = 'DBText11'
          DataField = 'NOME_BANCO'
          DataPipeline = ppReciboTerceiros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 47890
          mmTop = 40217
          mmWidth = 132027
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosAGENCIA: TppDBText
          OnPrint = rpReciboTerceirosAGENCIAPrint
          UserName = 'DBText12'
          DataField = 'AGENCIA'
          DataPipeline = ppReciboTerceiros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 47890
          mmTop = 45773
          mmWidth = 132027
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosDBText3: TppDBText
          UserName = 'DBText13'
          DataField = 'CONTACORRENTE'
          DataPipeline = ppReciboTerceiros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 47890
          mmTop = 51329
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpFolhaPontoShape3: TppShape
          UserName = 'Shape4'
          mmHeight = 21431
          mmLeft = 15346
          mmTop = 96573
          mmWidth = 166423
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosLabel2: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Assinatura do responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 109802
          mmTop = 111654
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosLine2: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 77258
          mmTop = 109273
          mmWidth = 99484
          BandType = 5
          GroupNo = 0
        end
        object rpReciboTerceirosLabel3: TppLabel
          UserName = 'Label13'
          Caption = 'Data da autorização:  _____ /_____ /_______'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 98161
          mmWidth = 72761
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppReciboTerceiros: TppBDEPipeline
    DataSource = dsReciboTerceiros
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ReciboTerceiros'
    Left = 436
    Top = 36
  end
  object dsReciboTerceiros: TwwDataSource
    DataSet = qryReciboTerceiros
    Left = 436
    Top = 24
  end
  object qryReciboTerceiros: TwwQuery
    AfterOpen = qryAlfabMensalAfterOpen
    AfterScroll = qryAlfabMensalAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL AS EMPRESA,'
      '  DECODE(PF.TIPO,'#39'F'#39',PF.NOME,PF.RAZAOSOCIAL) AS NOME,'
      
        '  RTRIM(END.LOGRADOURO) ||'#39' N: '#39'|| END.NUMERO ||'#39', '#39'|| RTRIM(END' +
        '.COMPLEMENTO) ||'#39' - '#39'||'
      
        '    RTRIM(END.BAIRRO) ||'#39' - '#39'|| RTRIM(CIDADES.NOME) ||'#39' - '#39'|| EN' +
        'D.CODESTADO ||'#39' - CEP:  '#39'||'
      
        '    RTRIM(SUBSTR(END.CEP,1,5)||'#39'-'#39'|| SUBSTR(END.CEP,6,3)) AS END' +
        'ERECO,'
      '  MUNICIPAL.NUMDOCUMENTO AS CPFCGC,'
      '  CGC.CGC,'
      '  ('#39'01/08/2000'#39') AS DATA_REF,'
      
        '  RTRIM(DECODE(DECODE(ESTADUAL.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscri' +
        'ção'#39' ||'#39' '#39'||'
      '    ESTADUAL.SIGLADOCUMENTO ||'#39' '#39'||  ESTADUAL.NUMDOCUMENTO),'#39#39','
      
        '    DECODE(MUNICIPAL.SIGLADOCUMENTO,'#39'MUNICIPAL'#39','#39'Inscrição'#39' ||'#39' ' +
        #39'||'
      '    MUNICIPAL.SIGLADOCUMENTO ||'#39' '#39'||  MUNICIPAL.NUMDOCUMENTO),'
      
        '    DECODE(ESTADUAL.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' ||'#39' '#39'|' +
        '|'
      
        '    ESTADUAL.SIGLADOCUMENTO ||'#39' '#39'||  ESTADUAL.NUMDOCUMENTO))) AS' +
        ' ESTADUALMUNICIPAL,'
      '  SUBSTR(RP.DESCRPROVDESC,1,60) AS DESCRICAO,'
      '  HIST.VALOR'
      'FROM'
      
        '  PESSOA       PJ, PESSOA       PF, ENDPESS  END, ESTADO    ES, ' +
        'CIDADES,'
      
        '  RUBRICAXPESS RP, RUBRICAINDIV RI, DOCPESSOA DO, TIPODOCOFICIAL' +
        ' TDO,'
      '  (SELECT PJ.IDPESSOA,'
      '     RTRIM('#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO'
      
        '       ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'||SUBSTR(DO.NUM' +
        'DOCUMENTO,3,3) ||'#39'.'#39'||'
      
        '       SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENT' +
        'O,9,4) ||'#39'-'#39'||'
      '       SUBSTR(DO.NUMDOCUMENTO,13,2))) AS CGC'
      '   FROM PESSOA PJ, TIPODOCOFICIAL TDO, DOCPESSOA DO'
      '   WHERE (PJ.IDPESSOA        = DO.IDPESSOA)     AND'
      '         (DO.IDDOCUMENTO     = TDO.IDDOCUMENTO) AND'
      '         (TDO.SIGLADOCUMENTO = '#39'CGC:'#39')) CGC,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3)'
      '       ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '     TD.SIGLADOCUMENTO'
      '   FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '   WHERE (TD.CODDOCUMENTO = 7) AND (D.IDDOCUMENTO = TD.IDDOCUMEN' +
        'TO)) ESTADUAL,'
      
        '         (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD' +
        '.SIGLADOCUMENTO'
      '          FROM   DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '          WHERE (TD.CODDOCUMENTO = 8) AND (D.IDDOCUMENTO = TD.ID' +
        'DOCUMENTO)) MUNICIPAL,'
      
        '  (SELECT H.IDRUBRICA, H.IDPESSOA, H.IDPESSJUR, RI.IDFAVORECIDO,' +
        ' SUM(H.VALORPROVENTO) AS VALOR'
      
        '   FROM   RUBRICAXPESS RP, RUBRICAINDIV RI, HISTRUBSAL H, PESSOA' +
        ' PJ, PESSOA PF'
      '   WHERE'
      '     (RP.IDRUBRICA     = H.IDRUBRICA) AND'
      '     (RI.IDRUBRICA     = H.IDRUBRICA) AND'
      '     (RI.IDPESSOA      = H.IDPESSOA)  AND'
      '     (H.MES            = '#39'1999/03'#39') AND'
      '     (PJ.IDGRUPO       = H.IDPESSJUR) AND'
      '     (RI.IDFAVORECIDO  IS NOT NULL)   AND'
      '     (RI.FLGTPRUBMANUT = '#39'2'#39')       AND'
      '     (RI.IDFAVORECIDO  = PF.IDPESSOA)'
      
        '   GROUP BY H.IDRUBRICA, H.IDPESSOA, RI.IDFAVORECIDO, H.IDPESSJU' +
        'R) HIST'
      'WHERE'
      '  (RP.IDPESSOA      = 18) AND'
      '  (RP.IDRUBRICA     = HIST.IDRUBRICA)       AND'
      '  (RI.IDRUBRICA     = HIST.IDRUBRICA)       AND'
      '  (RI.IDPESSOA      = HIST.IDPESSOA)        AND'
      '  (PJ.IDGRUPO       = HIST.IDPESSJUR)       AND'
      '  (RI.IDFAVORECIDO  IS NOT NULL)            AND'
      '  (RI.FLGTPRUBMANUT = '#39'2'#39')                AND'
      '  (RI.IDFAVORECIDO  = PF.IDPESSOA)          AND'
      '  (PJ.IDPESSOA      = DO.IDPESSOA)          AND'
      '  (PJ.IDPESSOA      = CGC.IDPESSOA)         AND'
      '  (END.IDPESSOA     = PJ.IDPESSOA)          AND'
      '  (ES.CODESTADO     = END.CODESTADO)        AND'
      '  (DO.IDDOCUMENTO   = TDO.IDDOCUMENTO)      AND'
      '  (END.IDCIDADES    = CIDADES.IDCIDADES(+)) AND'
      '  (PJ.IDPESSOA      = ESTADUAL.IDPESSOA(+)) AND'
      '  (PJ.IDPESSOA      = MUNICIPAL.IDPESSOA(+))'
      'ORDER BY UPPER(NOME)')
    ValidateWithMask = True
    Left = 436
    Top = 12
  end
  object updSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCOFICIAL'
      'set'
      '  MOTIVOFOLHA = :MOTIVOFOLHA,'
      '  NOMERELAT = :NOMERELAT,'
      '  TOT_PAG_FUNC = :TOT_PAG_FUNC,'
      '  PAGINA_ATUAL = :PAGINA_ATUAL,'
      '  CODRUBRICA = :CODRUBRICA,'
      '  CODRUBRICACLIENTE = :CODRUBRICACLIENTE,'
      '  RUBRICA = :RUBRICA,'
      '  TIPORUBRICA = :TIPORUBRICA,'
      '  REFERENCIA = :REFERENCIA,'
      '  SEQRUBRICA = :SEQRUBRICA,'
      '  MES = :MES,'
      '  DATA = :DATA,'
      '  PROVENTO = :PROVENTO,'
      '  DESCONTO = :DESCONTO,'
      '  VALOR = :VALOR,'
      '  EMPRESA = :EMPRESA,'
      '  CGCCPF = :CGCCPF,'
      '  ESTADUALMUNICIPAL = :ESTADUALMUNICIPAL,'
      '  EMPREGADO = :EMPREGADO,'
      '  MATRICULA = :MATRICULA,'
      '  CENTROCUSTO = :CENTROCUSTO,'
      '  NOMECENTROCUSTO = :NOMECENTROCUSTO,'
      '  TITULO = :TITULO,'
      '  IDAGENCIAFGTS = :IDAGENCIAFGTS,'
      '  ENDERECO = :ENDERECO,'
      '  INIPERIODOFERIAS = :INIPERIODOFERIAS,'
      '  FIMPERIODOFERIAS = :FIMPERIODOFERIAS,'
      '  INIGOZOFERIAS = :INIGOZOFERIAS,'
      '  FIMGOZOFERIAS = :FIMGOZOFERIAS,'
      '  DIASDEFERIAS = :DIASDEFERIAS,'
      '  FLGABONO = :FLGABONO'
      'where'
      '  MOTIVOFOLHA = :OLD_MOTIVOFOLHA and'
      '  NOMERELAT = :OLD_NOMERELAT and'
      '  TOT_PAG_FUNC = :OLD_TOT_PAG_FUNC and'
      '  PAGINA_ATUAL = :OLD_PAGINA_ATUAL and'
      '  CODRUBRICA = :OLD_CODRUBRICA and'
      '  CODRUBRICACLIENTE = :OLD_CODRUBRICACLIENTE and'
      '  RUBRICA = :OLD_RUBRICA and'
      '  TIPORUBRICA = :OLD_TIPORUBRICA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA and'
      '  MES = :OLD_MES and'
      '  DATA = :OLD_DATA and'
      '  PROVENTO = :OLD_PROVENTO and'
      '  DESCONTO = :OLD_DESCONTO and'
      '  VALOR = :OLD_VALOR and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  CGCCPF = :OLD_CGCCPF and'
      '  ESTADUALMUNICIPAL = :OLD_ESTADUALMUNICIPAL and'
      '  EMPREGADO = :OLD_EMPREGADO and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  CENTROCUSTO = :OLD_CENTROCUSTO and'
      '  NOMECENTROCUSTO = :OLD_NOMECENTROCUSTO and'
      '  TITULO = :OLD_TITULO and'
      '  IDAGENCIAFGTS = :OLD_IDAGENCIAFGTS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  FIMPERIODOFERIAS = :OLD_FIMPERIODOFERIAS and'
      '  INIGOZOFERIAS = :OLD_INIGOZOFERIAS and'
      '  FIMGOZOFERIAS = :OLD_FIMGOZOFERIAS and'
      '  DIASDEFERIAS = :OLD_DIASDEFERIAS and'
      '  FLGABONO = :OLD_FLGABONO')
    InsertSQL.Strings = (
      'insert into TIPODOCOFICIAL'
      
        '  (MOTIVOFOLHA, NOMERELAT, TOT_PAG_FUNC, PAGINA_ATUAL, CODRUBRIC' +
        'A, CODRUBRICACLIENTE, '
      
        '   RUBRICA, TIPORUBRICA, REFERENCIA, SEQRUBRICA, MES, DATA, PROV' +
        'ENTO, DESCONTO, '
      
        '   VALOR, EMPRESA, CGCCPF, ESTADUALMUNICIPAL, EMPREGADO, MATRICU' +
        'LA, CENTROCUSTO, '
      
        '   NOMECENTROCUSTO, TITULO, IDAGENCIAFGTS, ENDERECO, INIPERIODOF' +
        'ERIAS, '
      
        '   FIMPERIODOFERIAS, INIGOZOFERIAS, FIMGOZOFERIAS, DIASDEFERIAS,' +
        ' FLGABONO)'
      'values'
      
        '  (:MOTIVOFOLHA, :NOMERELAT, :TOT_PAG_FUNC, :PAGINA_ATUAL, :CODR' +
        'UBRICA, '
      
        '   :CODRUBRICACLIENTE, :RUBRICA, :TIPORUBRICA, :REFERENCIA, :SEQ' +
        'RUBRICA, '
      
        '   :MES, :DATA, :PROVENTO, :DESCONTO, :VALOR, :EMPRESA, :CGCCPF,' +
        ' :ESTADUALMUNICIPAL, '
      
        '   :EMPREGADO, :MATRICULA, :CENTROCUSTO, :NOMECENTROCUSTO, :TITU' +
        'LO, :IDAGENCIAFGTS, '
      
        '   :ENDERECO, :INIPERIODOFERIAS, :FIMPERIODOFERIAS, :INIGOZOFERI' +
        'AS, :FIMGOZOFERIAS, '
      '   :DIASDEFERIAS, :FLGABONO)')
    DeleteSQL.Strings = (
      'delete from TIPODOCOFICIAL'
      'where'
      '  MOTIVOFOLHA = :OLD_MOTIVOFOLHA and'
      '  NOMERELAT = :OLD_NOMERELAT and'
      '  TOT_PAG_FUNC = :OLD_TOT_PAG_FUNC and'
      '  PAGINA_ATUAL = :OLD_PAGINA_ATUAL and'
      '  CODRUBRICA = :OLD_CODRUBRICA and'
      '  CODRUBRICACLIENTE = :OLD_CODRUBRICACLIENTE and'
      '  RUBRICA = :OLD_RUBRICA and'
      '  TIPORUBRICA = :OLD_TIPORUBRICA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA and'
      '  MES = :OLD_MES and'
      '  DATA = :OLD_DATA and'
      '  PROVENTO = :OLD_PROVENTO and'
      '  DESCONTO = :OLD_DESCONTO and'
      '  VALOR = :OLD_VALOR and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  CGCCPF = :OLD_CGCCPF and'
      '  ESTADUALMUNICIPAL = :OLD_ESTADUALMUNICIPAL and'
      '  EMPREGADO = :OLD_EMPREGADO and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  CENTROCUSTO = :OLD_CENTROCUSTO and'
      '  NOMECENTROCUSTO = :OLD_NOMECENTROCUSTO and'
      '  TITULO = :OLD_TITULO and'
      '  IDAGENCIAFGTS = :OLD_IDAGENCIAFGTS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  FIMPERIODOFERIAS = :OLD_FIMPERIODOFERIAS and'
      '  INIGOZOFERIAS = :OLD_INIGOZOFERIAS and'
      '  FIMGOZOFERIAS = :OLD_FIMGOZOFERIAS and'
      '  DIASDEFERIAS = :OLD_DIASDEFERIAS and'
      '  FLGABONO = :OLD_FLGABONO')
    Left = 443
    Top = 125
  end
  object rpGerencial: TppReport
    AutoStop = False
    DataPipeline = ppGerencial
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 18
    Top = 37
    Version = '5.5'
    mmColumnWidth = 197300
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpGerencialFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object ppGroup16: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppGerencial
      NewPage = True
      ResetPageNo = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGerencialGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 189177
        mmPrintPosition = 0
        object rpGerencialLabel8: TppLabel
          UserName = 'Label1'
          Caption = 'Relatórios Gerenciais da Folha de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          Transparent = True
          mmHeight = 6085
          mmLeft = 44979
          mmTop = 53446
          mmWidth = 109802
          BandType = 3
          GroupNo = 0
        end
        object rpGerencialLblMES: TppLabel
          UserName = 'Label2'
          Caption = 'Referente ao Mês de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          Transparent = True
          mmHeight = 6085
          mmLeft = 54240
          mmTop = 69056
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object rpGerencialMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 
            'RELAÇÃO DOS RELATÓRIOS IMPRESSOS:'#13#10#13#10'A) DEMONSTRATIVO GERAL DE D' +
            'ESPESAS COM PESSOAL'#13#10#13#10'B) RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR ' +
            'CENTRO DE CUSTO'#13#10#13#10'C) DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO' +
            #13#10#13#10'D) DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'#13#10#13#10'E) DISTRIBUIÇÃO DE' +
            ' GRATIFICAÇÕES POR CENTRO DE CUSTO'#13#10#13#10'F) CONTRATAÇÕES E DESLIGAM' +
            'ENTOS DE PESSOAL'#13#10#13#10'G) RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Lines.Strings = (
            'RELAÇÃO DOS RELATÓRIOS IMPRESSOS:'
            ''
            'A) DEMONSTRATIVO GERAL DE DESPESAS COM PESSOAL'
            ''
            'B) RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR CENTRO DE CUSTO'
            ''
            'C) DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO'
            ''
            'D) DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'
            ''
            'E) DISTRIBUIÇÃO DE GRATIFICAÇÕES POR CENTRO DE CUSTO'
            ''
            'F) CONTRATAÇÕES E DESLIGAMENTOS DE PESSOAL'
            ''
            'G) RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO')
          Transparent = True
          mmHeight = 64029
          mmLeft = 8996
          mmTop = 109273
          mmWidth = 138642
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpGerencialLabelSETOR: TppLabel
          UserName = 'Label3'
          Caption = 'SETOR RESPONSÁVEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 6085
          mmLeft = 70115
          mmTop = 82550
          mmWidth = 59531
          BandType = 3
          GroupNo = 0
        end
      end
      object rpGerencialGrpFootBnd: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 36777
        mmPrintPosition = 0
        object rpGerencialSubReport1: TppSubReport
          OnPrint = rpGerencialSubReport1Print
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport1HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialChildReport11Label1: TppLabel
                UserName = 'rpGerencialChildReport11Label1'
                Caption = 'DEMONSTRATIVO GERAL DE DESPESAS COM PESSOAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 62177
                mmTop = 7144
                mmWidth = 73025
                BandType = 0
              end
              object rpGerencialChildReport11Label2: TppLabel
                UserName = 'rpGerencialChildReport11Label2'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159279
                mmTop = 7938
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport11Label3: TppLabel
                UserName = 'rpGerencialChildReport11Label3'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 12171
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport11DBText1: TppDBText
                UserName = 'rpGerencialChildReport11DBText1'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport11DBText2: TppDBText
                UserName = 'rpGerencialChildReport11DBText2'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialChildReport11DBText3: TppDBText
                UserName = 'rpGerencialChildReport11DBText3'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport11DBText4: TppDBText
                UserName = 'rpGerencialChildReport11DBText4'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30163
                BandType = 0
              end
              object rpGerencialChildReport11Label4: TppLabel
                UserName = 'rpGerencialChildReport11Label4'
                Caption = 'Item: A'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160602
                mmTop = 16404
                mmWidth = 10319
                BandType = 0
              end
              object rpGerencialChildReport1Line2: TppLine
                UserName = 'rpGerencialChildReport1Line2'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 529
                mmLeft = 3175
                mmTop = 27517
                mmWidth = 190765
                BandType = 0
              end
              object rpGerencialChildReport1Label8: TppLabel
                UserName = 'rpGerencialChildReport1Label8'
                Caption = 'TOTAL DA FOLHA DE PAGAMENTO:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 62706
                mmTop = 21167
                mmWidth = 46831
                BandType = 0
              end
              object rpGerencialChildReport1DBText8: TppDBText
                UserName = 'rpGerencialChildReport1DBText8'
                DataField = 'TOT_FOLHA'
                DataPipeline = ppGerencial1
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 110331
                mmTop = 21167
                mmWidth = 21696
                BandType = 0
              end
              object rpGerencialChildReport1LabelRef: TppLabel
                UserName = 'rpGerencialChildReport1LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport1Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport1Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport1Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport1Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7938
                mmWidth = 7938
                BandType = 0
              end
            end
            object rpGerencialChildReport1DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object rpGerencialChildReport1RUBRICA: TppDBText
                UserName = 'rpGerencialChildReport1RUBRICA'
                DataField = 'RUBRICA'
                DataPipeline = ppGerencial1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 33073
                mmTop = 1058
                mmWidth = 104775
                BandType = 4
              end
              object rpGerencialChildReport1VALOR: TppDBText
                UserName = 'rpGerencialChildReport1VALOR'
                DataField = 'VALOR'
                DataPipeline = ppGerencial1
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 139171
                mmTop = 1058
                mmWidth = 28840
                BandType = 4
              end
              object rpGerencialChildReport1CODRUBRICA: TppDBText
                OnPrint = rpGerencialChildReport1CODRUBRICAPrint
                UserName = 'rpGerencialChildReport1CODRUBRICA'
                DataField = 'CODRUBRICA'
                DataPipeline = ppGerencial1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 7144
                mmTop = 1058
                mmWidth = 22490
                BandType = 4
              end
            end
            object rpGerencialChildReport1FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport7Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial1
              NewPage = True
              ResetPageNo = True
              UserName = 'rpGerencialChildReport7Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialChildReport1GroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11377
                mmPrintPosition = 0
                object rpGerencialChildReport1Label6: TppLabel
                  UserName = 'rpGerencialChildReport1Label6'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 794
                  mmWidth = 26988
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport1DBText6: TppDBText
                  UserName = 'rpGerencialChildReport1DBText6'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 31485
                  mmTop = 794
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelCODIGO: TppLabel
                  UserName = 'rpGerencialChildReport1LabelCODIGO'
                  Caption = 'Código'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 6350
                  mmWidth = 8731
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelRUBRICA: TppLabel
                  UserName = 'rpGerencialChildReport1LabelRUBRICA'
                  Caption = 'Rubrica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 33073
                  mmTop = 6350
                  mmWidth = 9790
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport1Line1: TppLine
                  UserName = 'rpGerencialChildReport1Line1'
                  Weight = 0.75
                  mmHeight = 529
                  mmLeft = 3175
                  mmTop = 11113
                  mmWidth = 190765
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelVALOR: TppLabel
                  UserName = 'rpGerencialChildReport1LabelVALOR'
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 161132
                  mmTop = 6350
                  mmWidth = 6879
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialChildReport1GroupFooterBand1: TppGroupFooterBand
                BeforePrint = rpGerencialChildReport1GroupFooterBand1BeforePrint
                mmBottomOffset = 0
                mmHeight = 24606
                mmPrintPosition = 0
                object rpGerencialChildReport1LabelT1: TppLabel
                  UserName = 'rpGerencialChildReport1LabelT1'
                  Caption = 'TOTAL DE DESPESAS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 123296
                  mmTop = 3440
                  mmWidth = 30163
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelT2: TppLabel
                  UserName = 'rpGerencialChildReport1LabelT2'
                  Caption = 'TOTAL DE ABATIMENTOS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 117211
                  mmTop = 7673
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1Line4: TppLine
                  UserName = 'rpGerencialChildReport1Line4'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 166423
                  mmTop = 12965
                  mmWidth = 27517
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelT3: TppLabel
                  UserName = 'rpGerencialChildReport1LabelT3'
                  Caption = 'DESPESA LÍQUIDA:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 127794
                  mmTop = 14817
                  mmWidth = 25665
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1TOTPROV: TppLabel
                  UserName = 'rpGerencialChildReport1TOTPROV'
                  AutoSize = False
                  Caption = 'rpGerencialChildReport1TOTPROV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 3440
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelTOTDESC: TppLabel
                  UserName = 'rpGerencialChildReport1LabelTOTDESC'
                  AutoSize = False
                  Caption = 'rpGerencialChildReport1LabelTOTDESC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 7673
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelTOTLIQ: TppLabel
                  UserName = 'rpGerencialChildReport1LabelTOTLIQ'
                  AutoSize = False
                  Caption = 'rpGerencialChildReport1LabelTOTLIQ'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 14817
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1Label9: TppLabel
                  UserName = 'rpGerencialChildReport1Label9'
                  Caption = 'PERCENTUAL DA FOLHA:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 119063
                  mmTop = 20108
                  mmWidth = 34396
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport1LabelTOT_PERCENT: TppLabel
                  UserName = 'rpGerencialChildReport1LabelTOT_PERCENT'
                  AutoSize = False
                  Caption = 'rpGerencialChildReport1LabelTOT_PERCENT'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 20108
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
            object rpGerencialChildReport7Group2: TppGroup
              BreakName = 'PROVENTODESCONTO'
              DataPipeline = ppGerencial1
              UserName = 'rpGerencialChildReport7Group2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialChildReport1GroupHeaderBand2: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 5556
                mmPrintPosition = 0
                object rpGerencialChildReport1PROVDESC: TppDBText
                  UserName = 'rpGerencialChildReport1PROVDESC'
                  AutoSize = True
                  DataField = 'PROVENTODESCONTO'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 1058
                  mmWidth = 32015
                  BandType = 3
                  GroupNo = 1
                end
              end
              object rpGerencialChildReport1GroupFooterBand2: TppGroupFooterBand
                AfterPrint = rpGerencialChildReport1GroupFooterBand2AfterPrint
                mmBottomOffset = 0
                mmHeight = 7408
                mmPrintPosition = 0
                object rpGerencialChildReport1Line3: TppLine
                  UserName = 'rpGerencialChildReport1Line3'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 529
                  mmLeft = 3175
                  mmTop = 6879
                  mmWidth = 190765
                  BandType = 5
                  GroupNo = 1
                end
                object rpGerencialChildReport1DBCalc1: TppDBCalc
                  UserName = 'rpGerencialChildReport1DBCalc1'
                  DataField = 'VALOR'
                  DataPipeline = ppGerencial1
                  DisplayFormat = '#,###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport7Group2
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 139171
                  mmTop = 1323
                  mmWidth = 28840
                  BandType = 5
                  GroupNo = 1
                end
                object rpGerencialChildReport1DBText4: TppDBText
                  UserName = 'rpGerencialChildReport1DBText4'
                  AutoSize = True
                  DataField = 'TIPOTOT'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 12171
                  BandType = 5
                  GroupNo = 1
                end
              end
            end
          end
        end
        object rpGerencialSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport5HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28046
              mmPrintPosition = 0
              object rpGerencialChildReport5Label1: TppLabel
                UserName = 'rpGerencialChildReport5Label1'
                Caption = 'RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 53181
                mmTop = 7144
                mmWidth = 91017
                BandType = 0
              end
              object rpGerencialChildReport5Label2: TppLabel
                UserName = 'rpGerencialChildReport5Label2'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159279
                mmTop = 7938
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport5Label3: TppLabel
                UserName = 'rpGerencialChildReport5Label3'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 12171
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport5Label10: TppLabel
                UserName = 'rpGerencialChildReport5Label10'
                Caption = 'Item: B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160602
                mmTop = 16404
                mmWidth = 10054
                BandType = 0
              end
              object rpGerencialChildReport2DBText4: TppDBText
                UserName = 'rpGerencialChildReport2DBText4'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport2DBText5: TppDBText
                UserName = 'rpGerencialChildReport2DBText5'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport2DBText6: TppDBText
                UserName = 'rpGerencialChildReport2DBText6'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport2DBText7: TppDBText
                UserName = 'rpGerencialChildReport2DBText7'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport2LabelRef: TppLabel
                UserName = 'rpGerencialChildReport2LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport5Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport5Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport2Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport2Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7938
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialChildReport5DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialChildReport5DBText6: TppDBText
                UserName = 'rpGerencialChildReport5DBText6'
                DataField = 'CARGO'
                DataPipeline = ppGerencial2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 78846
                BandType = 4
              end
              object rpGerencialChildReport5DBText7: TppDBText
                UserName = 'rpGerencialChildReport5DBText7'
                DataField = 'REMUNERACAO'
                DataPipeline = ppGerencial2
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 85725
                mmTop = 794
                mmWidth = 23813
                BandType = 4
              end
            end
            object rpGerencialChildReport5FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport5SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 8731
              mmPrintPosition = 0
              object rpGerencialChildReport5Line4: TppLine
                UserName = 'rpGerencialChildReport5Line4'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialChildReport5Label9: TppLabel
                UserName = 'rpGerencialChildReport5Label9'
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 1588
                mmWidth = 7938
                BandType = 7
              end
              object rpGerencialChildReport5DBCalc2: TppDBCalc
                UserName = 'rpGerencialChildReport5DBCalc2'
                DataField = 'REMUNERACAO'
                DataPipeline = ppGerencial2
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 12965
                mmTop = 1588
                mmWidth = 26988
                BandType = 7
              end
            end
            object rpGerencialChildReport5Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial2
              UserName = 'rpGerencialChildReport5Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialChildReport5GroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialChildReport5Label5: TppLabel
                  UserName = 'rpGerencialChildReport5Label5'
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 7144
                  mmWidth = 9260
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport5Line1: TppLine
                  UserName = 'rpGerencialChildReport5Line1'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport5Label6: TppLabel
                  UserName = 'rpGerencialChildReport5Label6'
                  Caption = 'Remuneração'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 91811
                  mmTop = 7144
                  mmWidth = 17727
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport5Label7: TppLabel
                  UserName = 'rpGerencialChildReport5Label7'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 26988
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport5DBText5: TppDBText
                  UserName = 'rpGerencialChildReport5DBText5'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial2
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 31485
                  mmTop = 2117
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport5Line2: TppLine
                  UserName = 'rpGerencialChildReport5Line2'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialChildReport5GroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 7144
                mmPrintPosition = 0
                object rpGerencialChildReport5Line3: TppLine
                  UserName = 'rpGerencialChildReport5Line3'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport5Label8: TppLabel
                  UserName = 'rpGerencialChildReport5Label8'
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 1058
                  mmWidth = 14288
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport5DBCalc1: TppDBCalc
                  UserName = 'rpGerencialChildReport5DBCalc1'
                  DataField = 'REMUNERACAO'
                  DataPipeline = ppGerencial2
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport5Group1
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 19050
                  mmTop = 1058
                  mmWidth = 26988
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSubReport3: TppSubReport
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 9525
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport4HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialChildReport4Label3: TppLabel
                UserName = 'rpGerencialChildReport4Label3'
                Caption = 'DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 64823
                mmTop = 7144
                mmWidth = 67733
                BandType = 0
              end
              object rpGerencialChildReport4Label4: TppLabel
                UserName = 'rpGerencialChildReport4Label4'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159544
                mmTop = 7408
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport4Label5: TppLabel
                UserName = 'rpGerencialChildReport4Label5'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154782
                mmTop = 11642
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport4Label9: TppLabel
                UserName = 'rpGerencialChildReport4Label9'
                Caption = 'Item: C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160867
                mmTop = 15875
                mmWidth = 10319
                BandType = 0
              end
              object rpGerencialChildReport3DBText12: TppDBText
                UserName = 'rpGerencialChildReport3DBText12'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport3DBText13: TppDBText
                UserName = 'rpGerencialChildReport3DBText13'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport3DBText14: TppDBText
                UserName = 'rpGerencialChildReport3DBText14'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport3DBText15: TppDBText
                UserName = 'rpGerencialChildReport3DBText15'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport3LabelRef: TppLabel
                UserName = 'rpGerencialChildReport3LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport4Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport4Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 11642
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport3Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport3Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 7408
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialChildReport4DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialChildReport4DBText5: TppDBText
                UserName = 'rpGerencialChildReport4DBText5'
                DataField = 'CARGO'
                DataPipeline = ppGerencial3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 78846
                BandType = 4
              end
              object rpGerencialChildReport4DBText7: TppDBText
                UserName = 'rpGerencialChildReport4DBText7'
                DataField = 'ATIVOS'
                DataPipeline = ppGerencial3
                DisplayFormat = '##00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 85725
                mmTop = 794
                mmWidth = 14552
                BandType = 4
              end
            end
            object rpGerencialChildReport4FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport4SummaryBand1: TppSummaryBand
              BeforePrint = rpGerencialChildReport4SummaryBand1BeforePrint
              mmBottomOffset = 0
              mmHeight = 16669
              mmPrintPosition = 0
              object rpGerencialChildReport4Line4: TppLine
                UserName = 'rpGerencialChildReport4Line4'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialChildReport4Label8: TppLabel
                UserName = 'rpGerencialChildReport4Label8'
                Caption = 'SubTotal:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 6615
                mmTop = 6350
                mmWidth = 13494
                BandType = 7
              end
              object rpGerencialChildReport4DBCalcSubTotal: TppDBCalc
                UserName = 'rpGerencialChildReport4DBCalcSubTotal'
                DataField = 'ATIVOS'
                DataPipeline = ppGerencial3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 21431
                mmTop = 6350
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport3Label6: TppLabel
                UserName = 'rpGerencialChildReport3Label6'
                Caption = 'Em Licença:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 2910
                mmTop = 1588
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport3LabelQuantTotLicenca: TppLabel
                UserName = 'rpGerencialChildReport3LabelQuantTotLicenca'
                AutoSize = False
                Caption = 'rpGerencialChildReport3LabelQuantTotLicenca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 21431
                mmTop = 1588
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport3Label14: TppLabel
                UserName = 'rpGerencialChildReport3Label14'
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 12171
                mmTop = 11113
                mmWidth = 7938
                BandType = 7
              end
              object rpGerencialChildReport3LabelTOTAL: TppLabel
                UserName = 'rpGerencialChildReport3LabelTOTAL'
                AutoSize = False
                Caption = 'rpGerencialChildReport3LabelTOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 21431
                mmTop = 11113
                mmWidth = 17198
                BandType = 7
              end
            end
            object rpGerencialChildReport4Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial3
              UserName = 'rpGerencialChildReport4Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialChildReport4GroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialChildReport4Label2: TppLabel
                  UserName = 'rpGerencialChildReport4Label2'
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 6879
                  mmWidth = 9260
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport4Line1: TppLine
                  UserName = 'rpGerencialChildReport4Line1'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport4Label7: TppLabel
                  UserName = 'rpGerencialChildReport4Label7'
                  Caption = 'Quantidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 85725
                  mmTop = 6879
                  mmWidth = 14552
                  BandType = 3
                  GroupNo = 0
                end
                object rpResFolLabelCENTROCUSTO: TppLabel
                  UserName = 'rpResFolLabelCENTROCUSTO'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 26988
                  BandType = 3
                  GroupNo = 0
                end
                object rpResFolDBTextNOMECENTROCUSTO: TppDBText
                  UserName = 'rpResFolDBTextNOMECENTROCUSTO'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 31485
                  mmTop = 2117
                  mmWidth = 8467
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport4Line2: TppLine
                  UserName = 'rpGerencialChildReport4Line2'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialChildReport4GroupFooterBand1: TppGroupFooterBand
                AfterPrint = rpGerencialChildReport4GroupFooterBand1AfterPrint
                mmBottomOffset = 0
                mmHeight = 11113
                mmPrintPosition = 0
                object rpGerencialChildReport4Line3: TppLine
                  UserName = 'rpGerencialChildReport4Line3'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport4Label1: TppLabel
                  UserName = 'rpGerencialChildReport4Label1'
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 5821
                  mmTop = 1058
                  mmWidth = 14288
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport4DBCalc1: TppDBCalc
                  UserName = 'rpGerencialChildReport4DBCalc1'
                  DataField = 'ATIVOS'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport4Group1
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 21431
                  mmTop = 1058
                  mmWidth = 17198
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport3Label13: TppLabel
                  UserName = 'rpGerencialChildReport3Label13'
                  Caption = 'Em Licença:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 2910
                  mmTop = 5556
                  mmWidth = 17198
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport3DBText1: TppDBText
                  UserName = 'rpGerencialChildReport3DBText1'
                  DataField = 'LICENCA'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 21431
                  mmTop = 5556
                  mmWidth = 17198
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSubReport4: TppSubReport
          OnPrint = rpGerencialSubReport4Print
          UserName = 'SubReport4'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 14288
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial4
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport2HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialChildReport2Label5: TppLabel
                UserName = 'rpGerencialChildReport2Label5'
                AutoSize = False
                Caption = 'Salário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 26458
                BandType = 0
              end
              object rpGerencialChildReport2Label6: TppLabel
                UserName = 'rpGerencialChildReport2Label6'
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 51858
                mmTop = 23283
                mmWidth = 16404
                BandType = 0
              end
              object rpGerencialChildReport2Line2: TppLine
                UserName = 'rpGerencialChildReport2Line2'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 27781
                mmWidth = 192617
                BandType = 0
              end
              object rpGerencialChildReport2Label1: TppLabel
                UserName = 'rpGerencialChildReport2Label1'
                Caption = 'RELATÓRIO DE DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 60590
                mmTop = 7144
                mmWidth = 75936
                BandType = 0
              end
              object rpGerencialChildReport2Label2: TppLabel
                UserName = 'rpGerencialChildReport2Label2'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159279
                mmTop = 7144
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport2Label3: TppLabel
                UserName = 'rpGerencialChildReport2Label3'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 11377
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport2Label8: TppLabel
                UserName = 'rpGerencialChildReport2Label8'
                Caption = 'Item: D'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160867
                mmTop = 15610
                mmWidth = 10054
                BandType = 0
              end
              object rpGerencialChildReport4DBText1: TppDBText
                UserName = 'rpGerencialChildReport4DBText1'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport4DBText2: TppDBText
                UserName = 'rpGerencialChildReport4DBText2'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport4DBText3: TppDBText
                UserName = 'rpGerencialChildReport4DBText3'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport4DBText4: TppDBText
                UserName = 'rpGerencialChildReport4DBText4'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport4LabelRef: TppLabel
                UserName = 'rpGerencialChildReport4LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport2Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport2Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport4Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport4Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialChildReport2DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpGerencialChildReport2DBText1: TppDBText
                UserName = 'rpGerencialChildReport2DBText1'
                DataField = 'SALARIOATUAL'
                DataPipeline = ppGerencial4
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 529
                mmWidth = 26458
                BandType = 4
              end
              object rpGerencialChildReport2DBText2: TppDBText
                UserName = 'rpGerencialChildReport2DBText2'
                DataField = 'NUM_FUNC'
                DataPipeline = ppGerencial4
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 51858
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
            end
            object rpGerencialChildReport2FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport2SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object rpGerencialChildReport2Line1: TppLine
                UserName = 'rpGerencialChildReport2Line1'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 529
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialChildReport2Label7: TppLabel
                UserName = 'rpGerencialChildReport2Label7'
                Caption = 'Número Total de Empregados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 2117
                mmWidth = 44186
                BandType = 7
              end
              object rpGerencialChildReport2DBCalc1: TppDBCalc
                UserName = 'rpGerencialChildReport2DBCalc1'
                DataField = 'NUM_FUNC'
                DataPipeline = ppGerencial4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 2117
                mmWidth = 15875
                BandType = 7
              end
            end
          end
        end
        object rpGerencialSubReport5: TppSubReport
          UserName = 'SubReport5'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 19050
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial5
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport6HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialChildReport6Label1: TppLabel
                UserName = 'rpGerencialChildReport6Label1'
                Caption = 'DISTRIBUIÇÃO DE GRATIFICAÇÕES POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 59796
                mmTop = 7144
                mmWidth = 77523
                BandType = 0
              end
              object rpGerencialChildReport6Label2: TppLabel
                UserName = 'rpGerencialChildReport6Label2'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159279
                mmTop = 7938
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport6Label3: TppLabel
                UserName = 'rpGerencialChildReport6Label3'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 12171
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport6Label4: TppLabel
                UserName = 'rpGerencialChildReport6Label4'
                Caption = 'Item: E'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160602
                mmTop = 16404
                mmWidth = 9790
                BandType = 0
              end
              object rpGerencialChildReport5DBText1: TppDBText
                UserName = 'rpGerencialChildReport5DBText1'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport5DBText2: TppDBText
                UserName = 'rpGerencialChildReport5DBText2'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport5DBText3: TppDBText
                UserName = 'rpGerencialChildReport5DBText3'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport5DBText4: TppDBText
                UserName = 'rpGerencialChildReport5DBText4'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport5LabelRef: TppLabel
                UserName = 'rpGerencialChildReport5LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport6Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport6Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport5Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport5Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7938
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialChildReport6DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialChildReport6DBText7: TppDBText
                UserName = 'rpGerencialChildReport6DBText7'
                DataField = 'NUM_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '##00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 794
                mmWidth = 14552
                BandType = 4
              end
              object rpGerencialChildReport6DBText8: TppDBText
                UserName = 'rpGerencialChildReport6DBText8'
                DataField = 'CARGO'
                DataPipeline = ppGerencial5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 83609
                BandType = 4
              end
              object rpGerencialChildReport6DBText9: TppDBText
                UserName = 'rpGerencialChildReport6DBText9'
                DataField = 'VAL_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 794
                mmWidth = 23813
                BandType = 4
              end
            end
            object rpGerencialChildReport6FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport6SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 8731
              mmPrintPosition = 0
              object rpGerencialChildReport6Line3: TppLine
                UserName = 'rpGerencialChildReport6Line3'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialChildReport6Label9: TppLabel
                UserName = 'rpGerencialChildReport6Label9'
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 78846
                mmTop = 1588
                mmWidth = 7938
                BandType = 7
              end
              object rpGerencialChildReport6DBCalc1: TppDBCalc
                UserName = 'rpGerencialChildReport6DBCalc1'
                DataField = 'NUM_GRATIF'
                DataPipeline = ppGerencial5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 1588
                mmWidth = 14552
                BandType = 7
              end
              object rpGerencialChildReport6DBCalc4: TppDBCalc
                UserName = 'rpGerencialChildReport6DBCalc4'
                DataField = 'VAL_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 1588
                mmWidth = 23813
                BandType = 7
              end
            end
            object rpGerencialChildReport6Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial5
              UserName = 'rpGerencialChildReport6Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialChildReport6GroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialChildReport6Label6: TppLabel
                  UserName = 'rpGerencialChildReport6Label6'
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 7144
                  mmWidth = 9260
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6Line1: TppLine
                  UserName = 'rpGerencialChildReport6Line1'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6Label7: TppLabel
                  UserName = 'rpGerencialChildReport6Label7'
                  Caption = 'Quantidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 90223
                  mmTop = 7144
                  mmWidth = 14552
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6Label8: TppLabel
                  UserName = 'rpGerencialChildReport6Label8'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 26988
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6DBText6: TppDBText
                  UserName = 'rpGerencialChildReport6DBText6'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 31750
                  mmTop = 2117
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6Line2: TppLine
                  UserName = 'rpGerencialChildReport6Line2'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialChildReport6Label11: TppLabel
                  UserName = 'rpGerencialChildReport6Label11'
                  Caption = 'Gratificações'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 118004
                  mmTop = 7144
                  mmWidth = 17198
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialChildReport6GroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 10319
                mmPrintPosition = 0
                object rpGerencialChildReport6Line4: TppLine
                  UserName = 'rpGerencialChildReport6Line4'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport6Label10: TppLabel
                  UserName = 'rpGerencialChildReport6Label10'
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 72496
                  mmTop = 1323
                  mmWidth = 14288
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport6DBCalc2: TppDBCalc
                  UserName = 'rpGerencialChildReport6DBCalc2'
                  DataField = 'NUM_GRATIF'
                  DataPipeline = ppGerencial5
                  DisplayFormat = '##00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport6Group1
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 90223
                  mmTop = 1323
                  mmWidth = 14552
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialChildReport6DBCalc3: TppDBCalc
                  UserName = 'rpGerencialChildReport6DBCalc3'
                  DataField = 'VAL_GRATIF'
                  DataPipeline = ppGerencial5
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport6Group1
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 111390
                  mmTop = 1323
                  mmWidth = 23813
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSubReport6: TppSubReport
          UserName = 'SubReport6'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 23813
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport6: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial6A
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialChildReport3HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28046
              mmPrintPosition = 0
              object rpGerencialChildReport3Label3: TppLabel
                UserName = 'rpGerencialChildReport3Label3'
                Caption = 'CONTRATAÇÕES E DESLIGAMENTOS DE PESSOAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 65617
                mmTop = 7144
                mmWidth = 66146
                BandType = 0
              end
              object rpGerencialChildReport3Label4: TppLabel
                UserName = 'rpGerencialChildReport3Label4'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 157163
                mmTop = 7144
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialChildReport3Label5: TppLabel
                UserName = 'rpGerencialChildReport3Label5'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 152400
                mmTop = 11377
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport3Label1: TppLabel
                UserName = 'rpGerencialChildReport3Label1'
                Caption = 'Cent. Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 17198
                BandType = 0
              end
              object rpGerencialChildReport3Label2: TppLabel
                UserName = 'rpGerencialChildReport3Label2'
                Caption = 'Contratações'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 59531
                mmTop = 23283
                mmWidth = 19579
                BandType = 0
              end
              object rpGerencialChildReport3Label7: TppLabel
                UserName = 'rpGerencialChildReport3Label7'
                Caption = 'Desligamentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 23283
                mmWidth = 21960
                BandType = 0
              end
              object rpGerencialChildReport3Line1: TppLine
                UserName = 'rpGerencialChildReport3Line1'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 3175
                mmTop = 27781
                mmWidth = 188648
                BandType = 0
              end
              object rpGerencialChildReport3Label12: TppLabel
                UserName = 'rpGerencialChildReport3Label12'
                Caption = 'Item: F'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 159015
                mmTop = 15610
                mmWidth = 9790
                BandType = 0
              end
              object rpGerencialChildReport6DBText1: TppDBText
                UserName = 'rpGerencialChildReport6DBText1'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport6DBText2: TppDBText
                UserName = 'rpGerencialChildReport6DBText2'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport6DBText3: TppDBText
                UserName = 'rpGerencialChildReport6DBText3'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport6DBText4: TppDBText
                UserName = 'rpGerencialChildReport6DBText4'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport6LabelRef: TppLabel
                UserName = 'rpGerencialChildReport6LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialChildReport3Calc2: TppSystemVariable
                UserName = 'rpGerencialChildReport3Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 166423
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport6Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport6Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 166423
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialChildReport3DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialChildReport3DBText5: TppDBText
                UserName = 'rpGerencialChildReport3DBText5'
                DataField = 'C_CUSTO'
                DataPipeline = ppGerencial6A
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 51329
                BandType = 4
              end
              object rpGerencialChildReport3DBText6: TppDBText
                UserName = 'rpGerencialChildReport3DBText6'
                DataField = 'ADMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 59531
                mmTop = 529
                mmWidth = 19579
                BandType = 4
              end
              object rpGerencialChildReport3DBText7: TppDBText
                UserName = 'rpGerencialChildReport3DBText7'
                DataField = 'DEMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 529
                mmWidth = 21960
                BandType = 4
              end
            end
            object rpGerencialChildReport3FooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport3SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 23548
              mmPrintPosition = 0
              object rpGerencialChildReport3Label8: TppLabel
                UserName = 'rpGerencialChildReport3Label8'
                Caption = 'Total de Funcionários (Posição Anterior) :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 60061
                BandType = 7
              end
              object rpGerencialChildReport3Label9: TppLabel
                UserName = 'rpGerencialChildReport3Label9'
                Caption = 'Total de Funcionários (Posição Atual) :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 7938
                mmTop = 12965
                mmWidth = 55298
                BandType = 7
              end
              object rpGerencialChildReport3Label10: TppLabel
                UserName = 'rpGerencialChildReport3Label10'
                Caption = 'Total Atual de Estagiários :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 24871
                mmTop = 18521
                mmWidth = 38365
                BandType = 7
              end
              object rpGerencialChildReport3Line2: TppLine
                UserName = 'rpGerencialChildReport3Line2'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 3175
                mmTop = 0
                mmWidth = 188648
                BandType = 7
              end
              object rpGerencialChildReport3Label11: TppLabel
                UserName = 'rpGerencialChildReport3Label11'
                Caption = 'Totais:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 2117
                mmWidth = 9790
                BandType = 7
              end
              object rpGerencialChildReport3DBText8: TppDBText
                UserName = 'rpGerencialChildReport3DBText8'
                DataField = 'POS_ANTERIOR'
                DataPipeline = ppGerencial6B
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 6879
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport3DBText9: TppDBText
                UserName = 'rpGerencialChildReport3DBText9'
                DataField = 'NUM_ESTAGIARIOS'
                DataPipeline = ppGerencial6B
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 18521
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport3DBText10: TppDBText
                UserName = 'rpGerencialChildReport3DBText10'
                DataField = 'POS_ATUAL'
                DataPipeline = ppGerencial6B
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 12965
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialChildReport6DBCalc5: TppDBCalc
                UserName = 'rpGerencialChildReport6DBCalc5'
                DataField = 'ADMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 59531
                mmTop = 1058
                mmWidth = 19579
                BandType = 7
              end
              object rpGerencialChildReport6DBCalc6: TppDBCalc
                UserName = 'rpGerencialChildReport6DBCalc6'
                DataField = 'DEMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 1058
                mmWidth = 21960
                BandType = 7
              end
            end
          end
        end
        object rpGerencialSubReport7: TppSubReport
          UserName = 'SubReport7'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 28575
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport7: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial7
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialHeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialLabel1: TppLabel
                UserName = 'rpGerencialLabel1'
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialLabel2: TppLabel
                UserName = 'rpGerencialLabel2'
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26723
                mmTop = 23283
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialLine1: TppLine
                UserName = 'rpGerencialLine1'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 27781
                mmWidth = 192617
                BandType = 0
              end
              object rpGerencialLabel3: TppLabel
                UserName = 'rpGerencialLabel3'
                Caption = 'RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 66675
                mmTop = 7144
                mmWidth = 64029
                BandType = 0
              end
              object rpGerencialLabel4: TppLabel
                UserName = 'rpGerencialLabel4'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 159279
                mmTop = 7144
                mmWidth = 8467
                BandType = 0
              end
              object rpGerencialLabel5: TppLabel
                UserName = 'rpGerencialLabel5'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 11377
                mmWidth = 13229
                BandType = 0
              end
              object rpGerencialChildReport1Label1: TppLabel
                UserName = 'rpGerencialChildReport1Label1'
                Caption = 'Admissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 123031
                mmTop = 23019
                mmWidth = 14817
                BandType = 0
              end
              object rpGerencialChildReport1Label2: TppLabel
                UserName = 'rpGerencialChildReport1Label2'
                Caption = 'Temp. Serv (Anos - Meses)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 23283
                mmWidth = 39952
                BandType = 0
              end
              object rpGerencialChildReport1Label3: TppLabel
                UserName = 'rpGerencialChildReport1Label3'
                Caption = 'Item: G'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160867
                mmTop = 15610
                mmWidth = 10319
                BandType = 0
              end
              object rpGerencialChildReport7DBText1: TppDBText
                UserName = 'rpGerencialChildReport7DBText1'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialChildReport7DBText2: TppDBText
                UserName = 'rpGerencialChildReport7DBText2'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialChildReport7DBText3: TppDBText
                UserName = 'rpGerencialChildReport7DBText3'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialChildReport7DBText4: TppDBText
                UserName = 'rpGerencialChildReport7DBText4'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 29898
                BandType = 0
              end
              object rpGerencialChildReport7LabelRef: TppLabel
                UserName = 'rpGerencialChildReport7LabelRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 91546
                mmTop = 11642
                mmWidth = 14023
                BandType = 0
              end
              object rpGerencialCalc2: TppSystemVariable
                UserName = 'rpGerencialCalc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialChildReport7Calc1: TppSystemVariable
                UserName = 'rpGerencialChildReport7Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialDBText5: TppDBText
                UserName = 'rpGerencialDBText5'
                DataField = 'MATRICULA'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 21167
                BandType = 4
              end
              object rpGerencialDBText6: TppDBText
                UserName = 'rpGerencialDBText6'
                DataField = 'NOME'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 26723
                mmTop = 794
                mmWidth = 92340
                BandType = 4
              end
              object rpGerencialChildReport1DBText1: TppDBText
                UserName = 'rpGerencialChildReport1DBText1'
                DataField = 'DTADMISSAO'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 123031
                mmTop = 794
                mmWidth = 22225
                BandType = 4
              end
              object rpGerencialChildReport1DBText2: TppDBText
                UserName = 'rpGerencialChildReport1DBText2'
                DataField = 'ANO'
                DataPipeline = ppGerencial7
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 170127
                mmTop = 794
                mmWidth = 10319
                BandType = 4
              end
              object rpGerencialChildReport1DBText3: TppDBText
                UserName = 'rpGerencialChildReport1DBText3'
                DataField = 'MES'
                DataPipeline = ppGerencial7
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 183886
                mmTop = 794
                mmWidth = 10319
                BandType = 4
              end
            end
            object rpGerencialFooterBand1: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialSummaryBand1: TppSummaryBand
              AfterPrint = rpAlfabMensalSmryBndAfterPrint
              mmBottomOffset = 0
              mmHeight = 10054
              mmPrintPosition = 0
              object rpGerencialLine2: TppLine
                UserName = 'rpGerencialLine2'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 1058
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialLabel7: TppLabel
                UserName = 'rpGerencialLabel7'
                Caption = 'Número Total de Empregados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 3440
                mmWidth = 44186
                BandType = 7
              end
              object rpGerencialDBCalc1: TppDBCalc
                UserName = 'rpGerencialDBCalc1'
                DataField = 'MES'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DBCalcType = dcCount
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 3440
                mmWidth = 15875
                BandType = 7
              end
            end
          end
        end
      end
    end
  end
  object ppGerencial: TppBDEPipeline
    DataSource = dsGerencial
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial'
    Left = 18
    Top = 24
    object ppGerencialppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField4: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsGerencial: TwwDataSource
    DataSet = qryGerencial
    Left = 18
    Top = 12
  end
  object qryGerencial: TwwQuery
    AfterScroll = qryGerencialAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL AS EMPRESA,'
      '  CGC.CGC,'
      '  ES.CODESTADO AS UF,'
      '  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'#39#39','
      '    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'#39#39','#39#39','
      '    '#39'Inscrição Municipal: '#39'|| MUNICIPAL.NUMDOCUMENTO),'
      
        '    '#39'Inscrição Estadual: '#39' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUA' +
        'LMUNICIPAL,'
      
        '  RTRIM(END.LOGRADOURO) ||'#39', '#39'|| END.NUMERO ||'#39#39'|| DECODE(END.CO' +
        'MPLEMENTO,'#39' '#39','#39' - '#39' ||'#39#39'||'
      
        '    RTRIM(END.COMPLEMENTO)) ||'#39' - '#39'|| RTRIM(END.BAIRRO) ||'#39' - '#39'|' +
        '| RTRIM(CIDADES.NOME) ||'#39' - CEP:'#39'||'
      
        '    RTRIM(SUBSTR(END.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(END.CEP,6,3)' +
        ') AS ENDERECO'
      'FROM'
      '  PESSOA PJ, ENDPESS END, CIDADES, FILIALPESSOA FP, ESTADO ES,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3)'
      '       ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '     UPPER(TD.SIGLADOCUMENTO)'
      '   FROM   DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '   WHERE (UPPER(RTRIM(TD.SIGLADOCUMENTO)) = '#39'ESTADUAL:'#39') AND (D.' +
        'IDDOCUMENTO = TD.IDDOCUMENTO)) ESTADUAL,'
      
        '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.' +
        'SIGLADOCUMENTO)'
      '   FROM   DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '   WHERE (UPPER(RTRIM(TD.SIGLADOCUMENTO)) = '#39'MUNICIPAL:'#39') AND (D' +
        '.IDDOCUMENTO = TD.IDDOCUMENTO)) MUNICIPAL,'
      '  (SELECT PJ.IDPESSOA,'
      '          RTRIM('#39'Inscrição '#39' || TDO.SIGLADOCUMENTO'
      
        '          ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'||SUBSTR(DO.' +
        'NUMDOCUMENTO,3,3) ||'#39'.'#39'||'
      
        '          SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUM' +
        'ENTO,9,4) ||'#39'-'#39'||'
      '          SUBSTR(DO.NUMDOCUMENTO,13,2))) AS CGC'
      '    FROM PESSOA PJ, TIPODOCOFICIAL TDO, DOCPESSOA DO'
      '    WHERE (PJ.IDPESSOA               = DO.IDPESSOA)     AND'
      '          (DO.IDDOCUMENTO            = TDO.IDDOCUMENTO) AND'
      '          (RTRIM(TDO.SIGLADOCUMENTO) = '#39'CGC:'#39')) CGC'
      'WHERE'
      '  (PJ.IDPESSOA = 21615) AND'
      '  (PJ.IDPESSOA  = FP.IDFILIALPESSOA) AND'
      '  (CGC.IDPESSOA = PJ.IDPESSOA) AND'
      '  (PJ.IDPESSOA            = END.IDPESSOA(+))       AND'
      '  (PJ.IDENDCOMERCIAL      = END.IDENDERECO(+))     AND'
      '  (END.IDCIDADES          = CIDADES.IDCIDADES(+))  AND'
      '  (CIDADES.IDESTADO       = ES.IDESTADO(+))        AND'
      '  (PJ.IDPESSOA            = ESTADUAL.IDPESSOA(+))  AND'
      '  (PJ.IDPESSOA            = MUNICIPAL.IDPESSOA(+))')
    ValidateWithMask = True
    Left = 18
  end
  object cdsGerencial1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PROVENTODESCONTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TIPOPROVDESC'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TIPOTOT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RUBRICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TOT_FOLHA'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PARCIAL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsGerencial1IndexCodigoCC'
        Fields = 'CODCENTROCUSTO;TIPOPROVDESC;CODRUBRICA'
      end
      item
        Name = 'cdsGerencial1IndexNomeCC'
        Fields = 'C_CUSTO;TIPOPROVDESC;CODRUBRICA'
      end>
    Params = <>
    ProviderName = 'dspGerencial1'
    StoreDefs = True
    AfterScroll = qryGerencialAfterScroll
    Left = 87
    Top = 26
  end
  object dspGerencial1: TDataSetProvider
    DataSet = qryGerencial1
    Constraints = True
    Left = 87
    Top = 13
  end
  object qryGerencial1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'123456789012'#39' AS PROVENTODESCONTO,'
      '  0 AS TIPOPROVDESC,'
      '  '#39'123456789012'#39' AS CODRUBRICA,'
      '  '#39'123456789012345678901234567890'#39' AS TIPOTOT,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA,'
      '  '#39'12345678901234567890'#39' AS CODCENTROCUSTO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS C_CUSTO,'
      '  0 AS VALOR,'
      '  0 AS TOT_FOLHA,'
      '  0 AS TOT_PARCIAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2) ')
    ValidateWithMask = True
    Left = 87
  end
end
