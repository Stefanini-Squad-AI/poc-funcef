object DtmImportaTotalPrev: TDtmImportaTotalPrev
  OldCreateOrder = False
  Left = 66
  Top = 68
  Height = 641
  Width = 863
  object QrySitParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EV.IDSITPLANONOVO AS SITUACAONOPLANO,'
      '       EV.IDSITFUNCNOVO'#9' AS SITUACAONAPATROCINADORA,'
      '       EV.IDSITPARTNOVO  AS SITUACAONAFUNDACAO,'
      '       EV.DATAEVENTO'#9' AS DATASITUACAO,'
      '       SF.FLGINTERNO'#9' AS INDICADORSITUACAO,'
      '       SP.FLGINTERNO     AS FLGINTERNO '
      'FROM   EVENTOSPREV EV, SITFUNC SF, SITPART SP'
      'WHERE  EV.IDPESSOA   = :IDPESSOA'
      '  AND  SF.IDSITFUNC (+)  = EV.IDSITFUNCNOVO'
      '  AND  SP.IDSITPART (+) = EV.IDSITPARTNOVO'
      '  AND  EV.IDEVENTOSPREV IN'
      '           (SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV'
      '            WHERE IDPESSOA     = :IDPESSOA'
      '              AND IDPESSJUR    = :IDPESSJUR'
      '              AND DATAEVENTO = (SELECT MAX(DATAEVENTO)'
      '                                  FROM EVENTOSPREV'
      '       '#9#9'                  WHERE IDPESSOA  = :IDPESSOA'
      '        '#9#9#9'    AND IDPESSJUR = :IDPESSJUR'
      '                                    AND DATAEVENTO <= :DATAREF))'
      ' ')
    Left = 147
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end>
  end
  object QryCancelamento: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'EV.DATAEVENTO AS DATACANCELAMENTO'
      'FROM EVENTOSPREV EV'
      'WHERE EV.IDPESSOA = :IDPESSOA'
      '  AND EV.IDEVENTOSPREV IN'
      
        '        (SELECT MAX(E.IDEVENTOSPREV) FROM EVENTOSPREV E, EVENTOG' +
        'ERADOR EG'
      '         WHERE  E.IDPESSOA    = :IDPESSOA'
      '           AND  E.IDPLANOPREV = :IDPLANOPREV'
      '           AND  E.IDPESSJUR   = :IDPESSJUR'
      '           AND  EG.IDEVENTOGERADOR = E.IDEVENTOGERADOR'
      '           AND  EG.FLGINTERNO IN ('#39'DC'#39', '#39'CP'#39', '#39'CI'#39', '#39'CD'#39')'
      '           AND  E.DATAREGISTRO = (SELECT MAX(DATAREGISTRO)'
      
        '                                  FROM EVENTOSPREV E, EVENTOGERA' +
        'DOR EG'
      '     '#9#9#9#9'    WHERE E.IDPESSOA = :IDPESSOA'
      '     '#9#9#9#9'      AND E.IDPLANOPREV = :IDPLANOPREV'
      '     '#9#9#9#9'      AND E.IDPESSJUR = :IDPESSJUR'
      '     '#9#9#9#9'      AND E.DATAEVENTO  >= :DATAREF'
      '     '#9#9#9#9'      AND EG.IDEVENTOGERADOR = E.IDEVENTOGERADOR'
      
        '                                      AND EG.FLGINTERNO IN ('#39'DC'#39 +
        ','#39'CP'#39','#39'CI'#39','#39'CD'#39')))'
      ' ')
    Left = 237
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end>
  end
  object QryDemissao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'EV.DATAEVENTO'#9'AS DATACANCELAMENTO'
      'FROM EVENTOSPREV EV'
      'WHERE EV.IDPESSOA = :IDPESSOA'
      '  AND EV.IDEVENTOSPREV IN'
      
        '               (SELECT MAX(E.IDEVENTOSPREV) FROM EVENTOSPREV E, ' +
        'EVENTOGERADOR EG'
      '                WHERE E.IDPESSOA    = :IDPESSOA'
      '                  AND E.IDPLANOPREV = :IDPLANOPREV'
      '                  AND E.IDPESSJUR   = :IDPESSJUR'
      '                  AND EG.IDEVENTOGERADOR = E.IDEVENTOGERADOR'
      
        '                  AND EG.FLGINTERNO IN ('#39'DP'#39','#39'DC'#39','#39'DM'#39','#39'DS'#39','#39'DA'#39 +
        ')'
      '                  AND E.DATAREGISTRO = (SELECT MAX(DATAREGISTRO)'
      
        '                                        FROM EVENTOSPREV E, EVEN' +
        'TOGERADOR EG'
      
        '                                        WHERE E.IDPESSOA = :IDPE' +
        'SSOA'
      
        '                                          AND E.IDPLANOPREV =:ID' +
        'PLANOPREV'
      
        '                                          AND E.IDPESSJUR =:IDPE' +
        'SSJUR'
      
        '                                          AND E.DATAEVENTO  >= :' +
        'DATAREF'
      
        '                                          AND EG.IDEVENTOGERADOR' +
        ' = E.IDEVENTOGERADOR'
      
        '                                          AND EG.FLGINTERNO IN (' +
        #39'DP'#39','#39'DC'#39','#39'DM'#39','#39'DS'#39','#39'DA'#39')))'
      ''
      ' ')
    Left = 147
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end>
  end
  object QryDependente: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DP.IDPESSOA        AS IDDEPENDENTE,'
      '       P.NOME'#9#9'  AS NOME_DEP,'
      '       PF.SEXO'#9#9'  AS SEXO_DEP,'
      '       PF.DATANASC'#9'  AS DATANASCIMENTO_DEP,'
      '       DP.MATRICULA'#9'  AS MATRICULA_DEP,'
      '       P.NUMDOCUMENTO     AS CPF,'
      '       PF.ESTCIVIL'#9'  AS ESTADOCIVIL_DEP,'
      '       PF.DATAMORTE'#9'  AS DATAFALECIMENTO_DEP,'
      '       DECODE(PF.INICIOINVALIDEZ, NULL, 0, 1) AS INVALIDO_DEP,'
      '       D.FLGDESIGNADO'#9'  AS DESIGNADO,'
      '       D.IDSITDEPENDENTE  AS SITUACAODEPENDENTE,'
      
        '       DP.IDDEPENDENCIA'#9'  AS GRAUDEPENDENCIA,   PF.IDGRINSTR AS ' +
        'GRAUINSTRUCAO'
      'FROM PESSOA P, PESSOAFISICA PF, ELEGPATRO EL,'
      '     DEPENDENTE D, DEPENTIT DP'
      'WHERE EL.IDPESSOA  = :IDPESSOA'
      '  AND DP.IDTITULAR = EL.IDPESSOA'
      '  AND D.IDPESSOA   = DP.IDPESSOA'
      '  AND PF.IDPESSOA  = D.IDPESSOA'
      '  AND P.IDPESSOA   = D.IDPESSOA'
      
        '/*  AND ( ( (:DATAREF - PF.DATANASC) / 365.5 < :IDADE ) OR (PF.I' +
        'NICIOINVALIDEZ IS NOT NULL) ) -- linha alterada dinamicamente [1' +
        '9] */'
      'ORDER BY 1')
    Left = 48
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDADE'
        ParamType = ptUnknown
      end>
  end
  object QryDevolucaoFuncional: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDCARGOEXT, E.IDFUNCAO, E.MODOFUNCAO'
      'FROM EVOLFUNCPREV E'
      'WHERE IDPESSOA    = :IDPESSOA'
      '  AND DATAINICIO <= :DATAREF'
      '  AND ((DATAFINAL IS NULL) OR (DATAFINAL >= :DATAREF))')
    Left = 147
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end>
  end
  object QryBeneficios: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.DATAINICIOFUND   AS DATAINICIOBENEFICIO,'
      '       H.VALORINTEGRAL'#9'   AS VALORDOBENEFICIO,'
      '       BF.IDTPPAGTOBENEFIC AS DURACAO,'
      '       BF.IDBENEFICIO'#9'   AS BENEFICIO,'
      '       BF.IDSITBENEFICIO   AS SITUACAOBENEFICIO,'
      '       BF.DATAFINAL        AS DATAFINAL,'
      '       TIT.IDRESPONSAVEL   AS TITULAR,'
      '       PP.IDSITPLANOPREV   AS CD_SITUACAO_PLANO'
      'FROM BENEFBFCIARIO BF,'
      '     HSTBENEFBFCIARIO H,'
      '     BFCIARIOTITPLAN TIT,'
      '     BENEFICIO B,'
      '     PARTPREVPLAN PP'
      'WHERE H.MESREFERENCIA  = :ANOMESREF'
      '  AND BF.DATAINICIOFUND <= :DATAREF'
      '  AND ((BF.DATAFINAL IS NULL) OR (BF.DATAFINAL >= :DATAREF))'
      '  AND TIT.IDPESSOA     = :IDPESSOA'
      '  AND UPPER(B.NOME) NOT LIKE '#39'%ABONO%'#39
      '  AND UPPER(B.NOME) NOT LIKE '#39'%INSS%'#39
      '  AND H.FLGDEVOLUCAO   = 0'
      '  AND H.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      '  AND H.IDPESSJUR      = BF.IDPESSJUR'
      '  AND H.IDPLANOPREV    = BF.IDPLANOPREV'
      '  AND H.IDTITULAR      = BF.IDTITULAR'
      '  AND H.IDPESSOA       = BF.IDPESSOA'
      '  AND H.SEQPROPOSTA    = BF.SEQPROPOSTA'
      '  AND H.IDBENEFICIO    = BF.IDBENEFICIO'
      '  AND TIT.IDPESSJUR    = H.IDPESSJUR'
      '  AND TIT.IDPLANOPREV  = H.IDPLANOPREV'
      '  AND TIT.IDTITULAR    = H.IDTITULAR'
      '  AND TIT.IDPESSOA     = H.IDPESSOA'
      '  AND TIT.SEQPROPOSTA  = H.SEQPROPOSTA'
      '  AND TIT.IDBENEFICIO  = H.IDBENEFICIO'
      '  AND BF.IDBENEFICIO   = B.IDBENEFICIO'
      '  AND BF.IDPESSJUR     = PP.IDPESSJUR'
      '  AND ((PP.IDPLANOPREV = BF.IDPLANOPREV AND'
      '        BF.IDTITULAR = BF.IDPESSOA)'
      '       OR'
      '       (PP.IDPLANOPREV = BF.IDPLANOORIGEM AND'
      '        BF.IDTITULAR <> BF.IDPESSOA))'
      '  AND (PP.IDPESSOA = BF.IDTITULAR)')
    Left = 48
    Top = 114
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object QryRegional: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT REGIONAL.NOME AS REGIONAL'
      'FROM ELEGPATRO         ELEGPATRO ,'
      '     PESSOA            REGIONAL'
      'WHERE ELEGPATRO.IDESTAB = :IDESTAB'
      '  AND ELEGPATRO.IDESTAB = REGIONAL.IDPESSOA'
      ' ')
    Left = 237
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDESTAB'
        ParamType = ptInput
      end>
  end
  object QryInsTipoTempo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TIPO_TEMPO'
      '(CD_TIPO_TEMPO, DS_TIPO_TEMPO, IR_DOMINIO_SISTEMA)'
      'VALUES'
      '(:CD_TIPO_TEMPO, :DS_TIPO_TEMPO, :IR_DOMINIO_SISTEMA)')
    Left = 48
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_TIPO_TEMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_DOMINIO_SISTEMA'
        ParamType = ptUnknown
      end>
  end
  object QryInsTipoValor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TIPO_VALOR'
      '(CD_TIPO_VALOR, DS_TIPO_VALOR)'
      'VALUES'
      '(:CD_TIPO_VALOR, :DS_TIPO_VALOR)')
    Left = 48
    Top = 215
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_TIPO_VALOR'
        ParamType = ptUnknown
      end>
  end
  object QryInsEstadoCivil: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_ESTADO_CIVIL'
      '(CD_ESTADO_CIVIL, DS_ESTADO_CIVIL)'
      'VALUES'
      '(:CD_ESTADO_CIVIL, :DS_ESTADO_CIVIL)')
    Left = 48
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ESTADO_CIVIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_ESTADO_CIVIL'
        ParamType = ptUnknown
      end>
  end
  object QryUpdTipoTempo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_TIPO_TEMPO'
      'SET DS_TIPO_TEMPO = :DS_TIPO_TEMPO,'
      '    IR_DOMINIO_SISTEMA = :IR_DOMINIO_SISTEMA'
      'WHERE CD_TIPO_TEMPO = :CD_TIPO_TEMPO')
    Left = 147
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_TIPO_TEMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_DOMINIO_SISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdTipoValor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_TIPO_VALOR'
      'SET DS_TIPO_VALOR = :DS_TIPO_VALOR'
      'WHERE CD_TIPO_VALOR = :CD_TIPO_VALOR')
    Left = 147
    Top = 215
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_TIPO_VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_VALOR'
        ParamType = ptUnknown
      end>
  end
  object QryUpdEstadoCivil: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_ESTADO_CIVIL'
      'SET DS_ESTADO_CIVIL = :DS_ESTADO_CIVIL'
      'WHERE CD_ESTADO_CIVIL = :CD_ESTADO_CIVIL')
    Left = 147
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_ESTADO_CIVIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ESTADO_CIVIL'
        ParamType = ptUnknown
      end>
  end
  object QryInsTempoParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TEMPO_PARTICIPANTE'
      '(CD_VERSAO, CD_PARTIC, CD_TIPO_TEMPO, DT_TEMPO, QT_DIA_TEMPO,'
      ' QT_MES_TEMPO, QT_ANO_TEMPO)'
      'VALUES'
      
        '(:CD_VERSAO, :CD_PARTIC, :CD_TIPO_TEMPO, :DT_TEMPO, :QT_DIA_TEMP' +
        'O,'
      ' :QT_MES_TEMPO, :QT_ANO_TEMPO)')
    Left = 48
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_DIA_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_MES_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_ANO_TEMPO'
        ParamType = ptInput
      end>
  end
  object QryInsValorParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_VALOR_PARTICIPANTE'
      '(CD_VERSAO, CD_PARTIC, CD_TIPO_VALOR, VL_PARTICIPANTE)'
      'VALUES'
      '(:CD_VERSAO, :CD_PARTIC, :CD_TIPO_VALOR, :VL_PARTICIPANTE)')
    Left = 48
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_PARTICIPANTE'
        ParamType = ptInput
      end>
  end
  object QryUpdTempoParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_TEMPO_PARTICIPANTE'
      'SET DT_TEMPO = :DT_TEMPO,'
      '    QT_DIA_TEMPO = :QT_DIA_TEMPO,'
      '    QT_MES_TEMPO = :QT_MES_TEMPO,'
      '    QT_ANO_TEMPO = :QT_ANO_TEMPO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_TIPO_TEMPO = :CD_TIPO_TEMPO')
    Left = 147
    Top = 314
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_DIA_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_MES_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QT_ANO_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptInput
      end>
  end
  object QryUpdValorParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_VALOR_PARTICIPANTE'
      'SET VL_PARTICIPANTE = :VL_PARTICIPANTE'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_TIPO_VALOR = :CD_TIPO_VALOR')
    Left = 147
    Top = 361
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VL_PARTICIPANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end>
  end
  object QryInsParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_PARTICIPANTE'
      
        '(CD_VERSAO, CD_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLA' +
        'NO, NO_PESSOA,'
      
        ' NR_MATRICULA, NR_CPF, CD_ESTADO_CIVIL, IR_SEXO, DS_REGIONAL, CD' +
        '_SITUACAO_FUNDACAO,'
      
        ' CD_SITUACAO_PATROC, IR_FUNDACAO_ORIGEM, IR_PERTENCE_PATROCINADO' +
        'RA, IR_DIRETOR,'
      
        ' CD_PLANO_ANTERIOR, IR_MIGRACAO_PLANO, CD_TIPO_CAT_PROF_ESP, TP_' +
        'PARTICIPANTE,'
      ' CD_VINCULA_PARTIC, CD_OUTRA_FUNDACAO, IR_CONDICAO_TRABALHO)'
      'VALUES'
      '(:CD_VERSAO, :IDTITULAR, :PATROC, :CD_ENTID, :PLANO, :NOME,'
      
        ' :MATRICULA, :CPF, :ESTADO_CIVIL, :SEXO, :REGIONAL, :SITUACAO_FU' +
        'NDACAO,'
      
        ' :SITUACAO_PATROCINADORA, :IR_FUNDACAO_ORIGEM, :IR_PERTENCE_PATR' +
        'OCINADORA, :IR_DIRETOR,'
      
        ' :CD_PLANO_ANTERIOR, :IR_MIGRACAO_PLANO, :CD_TIPO_CAT_PROF_ESP, ' +
        ':TP_PARTICIPANTE,'
      ' :CD_VINCULA_PARTIC, :CD_OUTRA_FUNDACAO, :IR_CONDICAO_TRABALHO)')
    Left = 237
    Top = 167
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'patroc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cd_entid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'plano'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'matricula'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cpf'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADO_CIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SITUACAO_FUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SITUACAO_PATROCINADORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_FUNDACAO_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_PERTENCE_PATROCINADORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_DIRETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_MIGRACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_CAT_PROF_ESP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PARTICIPANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_VINCULA_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_OUTRA_FUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IR_CONDICAO_TRABALHO'
        ParamType = ptUnknown
      end>
  end
  object QryInsPessoa: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_PESSOA_JURIDICA'
      '(CD_PESSOA, NO_PESSOA)'
      ''
      'SELECT PE.IDPESSOA, PE.NOME'
      'FROM PESSOA PE,'
      '     PATRO  PA'
      'WHERE PE.IDPESSOA = PA.IDPESSOA'
      '  AND PE.IDPESSOA NOT IN'
      '      (SELECT CD_PESSOA FROM FI_PESSOA_JURIDICA)')
    Left = 327
    Top = 262
  end
  object QryInsPatroc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_PATROCINADORA'
      '(CD_PESSOA_PATROC, DT_REAJUSTE_SALARIO)'
      ''
      'SELECT PE.IDPESSOA , :DT_REAJUSTE_SALARIO'
      'FROM PESSOA PE,'
      '     PATRO  PA'
      'WHERE PE.IDPESSOA = PA.IDPESSOA'
      ' AND  PE.IDPESSOA NOT IN'
      ' (SELECT CD_PESSOA_PATROC FROM FI_PATROCINADORA)')
    Left = 237
    Top = 262
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_REAJUSTE_SALARIO'
        ParamType = ptInput
      end>
  end
  object QryPatroc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.IDPESSOA'
      'FROM PESSOA PE,'
      '     PATRO  PA'
      'WHERE PE.IDPESSOA = PA.IDPESSOA')
    Left = 237
    Top = 18
  end
  object QryInsDependencia: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_GRAU_DEPENDENCIA'
      '(CD_GRAU_DEPENDENCIA, DS_GRAU_DEPENDENCIA)'
      ''
      'SELECT IDDEPENDENCIA, DESCRICAO FROM DEPEN'
      'WHERE IDDEPENDENCIA NOT IN'
      '    (SELECT CD_GRAU_DEPENDENCIA'
      '     FROM FI_GRAU_DEPENDENCIA)')
    Left = 427
    Top = 215
  end
  object QryInsSitFundacao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_SITUACAO_FUNDACAO'
      '(CD_SITUACAO_FUNDACAO, DS_SITUACAO_FUNDACAO)'
      ''
      'SELECT IDSITPART, SUBSTR(DESCRICAO, 1, 35)'
      'FROM SITPART'
      'WHERE IDSITPART NOT IN'
      '    (SELECT CD_SITUACAO_FUNDACAO'
      '     FROM FI_SITUACAO_FUNDACAO)')
    Left = 427
    Top = 262
  end
  object QryInsPlano: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_PLANO_PATRONAL'
      '(CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO, NO_PLANO)'
      ''
      'SELECT :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV NOT IN'
      '    (SELECT CD_PLANO'
      '     FROM FI_PLANO_PATRONAL'
      '     WHERE CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '       AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID)')
    Left = 237
    Top = 314
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
  end
  object QryInsPlanoBeneficio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_PLANO_BENEFICIO'
      
        '(CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO, CD_TIPO_BENEF, CD_' +
        'GRUPO_BENEFICIO)'
      ''
      
        'SELECT :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, IDPLANOPREV, IDBENEF' +
        'ICIO, IDGRUPOBENEF'
      'FROM BENEFXGRUPO /*--RCM BENEFICIO*/'
      'WHERE IDBENEFICIO NOT IN'
      '    (SELECT CD_TIPO_BENEF'
      '     FROM FI_PLANO_BENEFICIO'
      '     WHERE CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '       AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '       AND CD_PLANO = IDPLANOPREV)'
      ' ')
    Left = 237
    Top = 361
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
  end
  object QryInsSitPatroc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_SITUACAO_PATROC'
      '(CD_SITUACAO_PATROC, DS_SITUACAO_PATROC)'
      ''
      'SELECT IDSITFUNC, DESCRICAO'
      'FROM SITFUNC'
      'WHERE IDSITFUNC NOT IN'
      ' (SELECT CD_SITUACAO_PATROC FROM FI_SITUACAO_PATROC)')
    Left = 327
    Top = 314
  end
  object QryInsDuracao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_DURACAO'
      '(CD_DURACAO, DS_DURACAO)'
      ''
      'SELECT IDTPPAGTOBENEFIC, NOME'
      'FROM TPPAGTOBENEFICIO'
      'WHERE IDTPPAGTOBENEFIC NOT IN'
      '    (SELECT CD_DURACAO FROM FI_DURACAO)')
    Left = 327
    Top = 361
  end
  object QryPlano: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV'
      'FROM PLANPREV')
    Left = 327
    Top = 18
  end
  object QryUpdParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_PARTICIPANTE'
      'SET NO_PESSOA = :NOME,'
      '    NR_MATRICULA = :MATRICULA,'
      '    NR_CPF = :CPF,'
      '    CD_ESTADO_CIVIL = :ESTADO_CIVIL,'
      '    IR_SEXO = :SEXO,'
      '    DS_REGIONAL = :REGIONAL,'
      '    CD_SITUACAO_FUNDACAO = :SITUACAO_FUNDACAO,'
      '    CD_SITUACAO_PATROC = :SITUACAO_PATROCINADORA,'
      '    IR_FUNDACAO_ORIGEM = :IR_FUNDACAO_ORIGEM,'
      '    IR_PERTENCE_PATROCINADORA = :IR_PERTENCE_PATROCINADORA,'
      '    IR_DIRETOR = :IR_DIRETOR,'
      '    CD_PLANO_ANTERIOR = :CD_PLANO_ANTERIOR,'
      '    IR_MIGRACAO_PLANO = :IR_MIGRACAO_PLANO,'
      '    CD_TIPO_CAT_PROF_ESP = :CD_TIPO_CAT_PROF_ESP,'
      '    TP_PARTICIPANTE = :TP_PARTICIPANTE,'
      '    CD_VINCULA_PARTIC = :CD_VINCULA_PARTIC,'
      '    CD_OUTRA_FUNDACAO = :CD_OUTRA_FUNDACAO,'
      '    IR_CONDICAO_TRABALHO = :IR_CONDICAO_TRABALHO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :IDTITULAR'
      ' ')
    Left = 327
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADO_CIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SITUACAO_FUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SITUACAO_PATROCINADORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_FUNDACAO_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_PERTENCE_PATROCINADORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_DIRETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_MIGRACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_CAT_PROF_ESP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PARTICIPANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_VINCULA_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_OUTRA_FUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IR_CONDICAO_TRABALHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object QryInsTipoBeneficio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TIPO_BENEFICIO'
      '(CD_TIPO_BENEF, SG_TIPO_BENEF, DS_TIPO_BENEF)'
      ''
      'SELECT IDBENEFICIO, SUBSTR(NOME, 1, 5), NOME'
      'FROM BENEFICIO'
      'WHERE IDBENEFICIO NOT IN'
      '    (SELECT CD_TIPO_BENEF FROM FI_TIPO_BENEFICIO)')
    Left = 427
    Top = 167
  end
  object QryInsDependente: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_DEPENDENTE'
      
        '(CD_VERSAO, CD_PARTIC, CD_DEPENDENTE, CD_GRAU_DEPENDENCIA, CD_DU' +
        'RACAO,'
      
        ' CD_SITUACAO_PLANO, NO_DEPENDENTE, CD_GRAU_INSTRUCAO, NR_MATRICU' +
        'LA,'
      ' DT_NASC, IR_SEXO, NR_ANOS_DEPENDENTE)'
      'VALUES'
      
        '(:CD_VERSAO, :CD_PARTIC, :CD_DEPENDENTE, :CD_GRAU_DEPENDENCIA, :' +
        'CD_DURACAO,'
      
        ' :CD_SITUACAO_PLANO, :NO_DEPENDENTE, :CD_GRAU_INSTRUCAO, :NR_MAT' +
        'RICULA,'
      ' :DT_NASC, :IR_SEXO, :NR_ANOS_DEPENDENTE)')
    Left = 237
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DURACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_SITUACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_NASC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_ANOS_DEPENDENTE'
        ParamType = ptInput
      end>
  end
  object QryUpdDependente: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_DEPENDENTE'
      'SET NO_DEPENDENTE = :NO_DEPENDENTE,'
      '    NR_MATRICULA = :NR_MATRICULA,'
      '    IR_SEXO = :IR_SEXO,'
      '    DT_NASC = :DT_NASC ,'
      '    NR_ANOS_DEPENDENTE = :NR_ANOS_DEPENDENTE,'
      '    CD_DURACAO = :CD_DURACAO,'
      '    CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '    CD_SITUACAO_PLANO = :CD_SITUACAO_PLANO,'
      '    CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_DEPENDENTE = :CD_DEPENDENTE ')
    Left = 327
    Top = 215
    ParamData = <
      item
        DataType = ftString
        Name = 'NO_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DT_NASC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_ANOS_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DURACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_SITUACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DEPENDENTE'
        ParamType = ptInput
      end>
  end
  object Regra: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 327
    Top = 66
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  1 FLGCONCESSAO,'
      '       PP.SEQPROPOSTA,'
      '       PP.IDPESSOA,'
      '       PP.IDPESSJUR,'
      '       PP.IDPLANOPREV,'
      '       PP.INSCRICAODATA,'
      '       PP.INSCRICAOTIPO,'
      '       PP.DTINICIOINSC,'
      '       PF.DATANASC,'
      '       PF.SEXO,'
      '       PF.DATAMORTE,'
      '       PP.IDPESSOA AS IDTITULAR,'
      '       EL.SALTOTAL,'
      '       EL.DATAADMISSAO,'
      '       EL.TEMPOSERVANTERIOR,'
      '       EL.TEMPONAOCREDITADO,'
      '       EL.TEMPOSERVTOTAL,'
      '       EL.DATADEMISSAO,'
      '       EL.FLGDIRETOR,'
      '       SP.FLGINTERNO,'
      '       EL.TEMPOSERVTOTMES,'
      '       EL.TEMPOSERVTOTDIA,'
      '       PP.IDPESSOA AS IDTITULAR,'
      '       :ANOMES     AS ANOMESREF,'
      '       :DATA       AS DATAREF'
      
        'FROM ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITPART SP' +
        ','
      '     SITFUNC SF, BENEFPLANOPART BPL'
      'WHERE  PP.IDPESSJUR   = :IDPESSJUR'
      '  AND  PP.IDPLANOPREV = :IDPLANOPREV'
      '  AND  PP.IDPESSOA    = :IDPESSOA'
      '  AND  PP.SEQPROPOSTA = 1 '
      '  AND  EL.IDPESSJUR   = PP.IDPESSJUR         '
      '  AND  EL.IDPESSOA    = PP.IDPESSOA          '
      '  AND  PF.IDPESSOA    = EL.IDPESSOA          '
      '  AND  EL.IDSITFUNC   = SF.IDSITFUNC(+)      '
      '  AND  PP.IDPESSJUR   = BPL.IDPESSJUR(+)     '
      '  AND  PP.IDPLANOPREV = BPL.IDPLANOPREV(+)   '
      '  AND  PP.IDPESSOA    = BPL.IDPESSOA(+)      '
      '  AND  PP.SEQPROPOSTA = BPL.SEQPROPOSTA(+)   '
      '  AND  SP.IDSITPART   = PP.IDSITPART '
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object QryVerifTempoRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FI_TEMPO_REGRA'
      'WHERE CD_TIPO_TEMPO = :CD_TIPO_TEMPO')
    Left = 427
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptInput
      end>
  end
  object QryVerifValorRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM FI_VALOR_REGRA'
      'WHERE  CD_TIPO_VALOR = :CD_TIPO_VALOR')
    Left = 427
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end>
  end
  object QryValorBeneficio_Antiga: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.DATAINICIOFUND'#9'AS DATAINICIOBENEFICIO,'
      '       H.VLBENEFPGTO'#9#9'AS VALORDOBENEFICIO,'
      '       H.IDBENEFICIO            AS BENEFICIO,'
      '       BF.IDSITBENEFICIO        AS SITBENEFICIO,'
      '       B.NOME                   AS NOMEBENEFICIO'
      'FROM BENEFBFCIARIO BF, HSTBENEFBFCIARIO H, BENEFICIO B'
      'WHERE BF.IDPESSJUR = :IDPESSJUR'
      '  AND BF.IDTITULAR = :IDTITULAR'
      '  AND BF.DATAINICIOFUND <= :DATAREF'
      '  AND ((BF.DATAFINAL IS NULL) OR (BF.DATAFINAL >= :DATAREF))'
      '  AND H.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      '  AND H.IDPESSJUR      = BF.IDPESSJUR'
      '  AND H.IDPLANOPREV    = BF.IDPLANOPREV'
      '  AND H.IDTITULAR      = BF.IDTITULAR'
      '  AND H.IDPESSOA       = BF.IDPESSOA'
      '  AND H.SEQPROPOSTA    = BF.SEQPROPOSTA'
      '  AND H.IDBENEFICIO    = BF.IDBENEFICIO'
      '  AND BF.IDBENEFICIO   = B.IDBENEFICIO'
      '  AND H.MESREFERENCIA  = :ANOMESREF'
      '  AND H.FLGDEVOLUCAO   = 0')
    Left = 427
    Top = 314
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptInput
      end>
  end
  object QryValorContribuicao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, VALORRECEBIDO, VALORBASE1, VALORBASE2'
      'FROM HSTCONTRIBPREV'
      'WHERE IDPESSJUR = :IDPESSJUR'
      '  AND IDPLANOPREV = :IDPLANOPREV'
      '  AND IDPESSOA = :IDPESSOA'
      '  AND MESREFERENCIA = (SELECT MAX(MESREFERENCIA)'
      '                       FROM HSTCONTRIBPREV'
      '                       WHERE IDPESSJUR = :IDPESSJUR'
      '                         AND IDPLANOPREV = :IDPLANOPREV'
      '                         AND IDPESSOA = :IDPESSOA'
      '                         AND MESREFERENCIA <= :ANOMES)')
    Left = 427
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end>
  end
  object QryUltimoSalario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(MES) AS DATA_ULTIMO_SALARIO'
      'FROM   HISTRUBSAL'
      'WHERE  IDPESSJUR = :PATROC'
      'AND    IDPESSOA  = :PARTIC'
      'AND    SUBSTR(MES,6,2) <> '#39'13'#39
      'AND    MES       <= :ANOMES'
      ' ')
    Left = 427
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PATROC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end>
  end
  object QryVerifTipoTempo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FI_TIPO_TEMPO'
      'WHERE CD_TIPO_TEMPO > :CD_TIPO_TEMPO')
    Left = 427
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptUnknown
      end>
  end
  object QryVerifTipoValor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FI_TIPO_VALOR'
      'WHERE CD_TIPO_VALOR > :CD_TIPO_VALOR')
    Left = 520
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_VALOR'
        ParamType = ptUnknown
      end>
  end
  object QryInsTempoRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TEMPO_REGRA'
      '(CD_TIPO_TEMPO, CD_PESSOA_ENTID, IR_IMPORTA)'
      'VALUES'
      '(:CD_TIPO_TEMPO, :CD_PESSOA_ENTID, :IR_IMPORTA)')
    Left = 520
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_IMPORTA'
        ParamType = ptUnknown
      end>
  end
  object QryUpdTempoRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_TEMPO_REGRA'
      'SET IR_IMPORTA = :IR_IMPORTA'
      'WHERE CD_TIPO_TEMPO = :CD_TIPO_TEMPO'
      '  AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID')
    Left = 520
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'IR_IMPORTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_TEMPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end>
  end
  object QryInsValorRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_VALOR_REGRA'
      '(CD_TIPO_VALOR, CD_PESSOA_ENTID, IR_IMPORTA)'
      'VALUES'
      '(:CD_TIPO_VALOR, :CD_PESSOA_ENTID, :IR_IMPORTA)')
    Left = 520
    Top = 214
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_IMPORTA'
        ParamType = ptUnknown
      end>
  end
  object QryUpdValorRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_VALOR_REGRA'
      'SET IR_IMPORTA = :IR_IMPORTA'
      'WHERE CD_TIPO_VALOR = :CD_TIPO_VALOR'
      '  AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID')
    Left = 520
    Top = 262
    ParamData = <
      item
        DataType = ftString
        Name = 'IR_IMPORTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end>
  end
  object QryValorSalario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(HIST.VALORPROVENTO, PP.SALPARTICIPACAO) AS ULTIMOSALA' +
        'RIO'
      'FROM PARTPREVPLAN PP,'
      '     (SELECT H.IDPESSOA, H.VALORPROVENTO'
      '      FROM HISTRUBSAL H, PATRO PT'
      '      WHERE H.IDPESSJUR = PT.IDPESSOA'
      '        AND H.IDRUBRICA  = PT.IDRUBSALPARTICIP'
      '        AND H.IDPESSJUR = :IDPESSJUR'
      '        AND H.IDPESSOA = :IDPESSOA'
      '        AND H.MES = :ANOMES) HIST'
      'WHERE HIST.IDPESSOA (+)  = PP.IDPESSOA'
      '  AND PP.IDPESSJUR = :IDPESSJUR'
      '  AND PP.IDPLANOPREV = :IDPLANOPREV'
      '  AND PP.IDPESSOA = :IDPESSOA'
      ' ')
    Left = 520
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object QryValorSalarioManut: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(HIST.VALORPROVENTO, PP.SALMANTIDO) AS ULTIMOSALARIO'
      'FROM PARTPREVPLAN PP,'
      '     (SELECT H.IDPESSOA, H.VALORPROVENTO'
      '      FROM HISTRUBSAL H, PATRO PT'
      '      WHERE H.IDPESSJUR = PT.IDPESSOA'
      '        AND H.IDRUBRICA  = PT.IDRUBSALMANUT'
      '        AND H.IDPESSJUR = :IDPESSJUR'
      '        AND H.IDPESSOA = :IDPESSOA'
      '        AND H.MES = :ANOMES) HIST'
      'WHERE HIST.IDPESSOA (+)  = PP.IDPESSOA'
      '  AND PP.IDPESSJUR = :IDPESSJUR'
      '  AND PP.IDPLANOPREV = :IDPLANOPREV'
      '  AND PP.IDPESSOA = :IDPESSOA ')
    Left = 520
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object QryValorSalarioManutParc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(HIST.VALORPROVENTO, PP.SALMANTIDO) AS ULTIMOSALARIO'
      'FROM PARTPREVPLAN PP,'
      '     (SELECT H.IDPESSOA, H.VALORPROVENTO'
      '      FROM HISTRUBSAL H, PATRO PT'
      '      WHERE H.IDPESSJUR = PT.IDPESSOA'
      '        AND H.IDRUBRICA  = PT.IDRUBSALMANUTPARC'
      '        AND H.IDPESSJUR = :IDPESSJUR'
      '        AND H.IDPESSOA = :IDPESSOA'
      '        AND H.MES = :ANOMES) HIST'
      'WHERE HIST.IDPESSOA (+)  = PP.IDPESSOA'
      '  AND PP.IDPESSJUR = :IDPESSJUR'
      '  AND PP.IDPLANOPREV = :IDPLANOPREV'
      '  AND PP.IDPESSOA = :IDPESSOA'
      ' '
      ' '
      ' ')
    Left = 520
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object QryValorBeneficio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.DATAINICIOFUND'#9'AS DATAINICIOBENEFICIO,'
      '       H.VALORINTEGRAL'#9#9'AS VALORDOBENEFICIO,'
      '       H.IDBENEFICIO            AS BENEFICIO,'
      '       BF.IDSITBENEFICIO        AS SITBENEFICIO,'
      '       BF.DATAFINAL             AS DATAFINAL,'
      '       B.NOME                   AS NOMEBENEFICIO'
      
        'FROM BENEFBFCIARIO BF, HSTBENEFBFCIARIO H, BFCIARIOTITPLAN TIT, ' +
        'BENEFICIO B'
      'WHERE H.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      '  AND H.IDPESSJUR      = BF.IDPESSJUR'
      '  AND H.IDPLANOPREV    = BF.IDPLANOPREV'
      '  AND H.IDTITULAR      = BF.IDTITULAR'
      '  AND H.IDPESSOA       = BF.IDPESSOA'
      '  AND H.SEQPROPOSTA    = BF.SEQPROPOSTA'
      '  AND H.IDBENEFICIO    = BF.IDBENEFICIO'
      '  AND H.IDPESSJUR      = TIT.IDPESSJUR'
      '  AND H.IDPLANOPREV    = TIT.IDPLANOPREV'
      '  AND H.IDTITULAR      = TIT.IDTITULAR'
      '  AND H.IDPESSOA       = TIT.IDPESSOA'
      '  AND H.SEQPROPOSTA    = TIT.SEQPROPOSTA'
      '  AND H.IDBENEFICIO    = TIT.IDBENEFICIO'
      '  AND BF.IDBENEFICIO   = B.IDBENEFICIO'
      '  AND H.FLGDEVOLUCAO   = 0'
      '  AND BF.DATAINICIOFUND <= :DATAREF'
      '  AND ((BF.DATAFINAL IS NULL) OR (BF.DATAFINAL >= :DATAREF))'
      '  AND H.MESREFERENCIA  = :ANOMESREF'
      '  AND BF.IDPESSOA = :IDPESSOA')
    Left = 327
    Top = 412
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.IDPLANOPREV        AS PLANO,'
      '       EL.IDPESSJUR          AS PATROCINADORA,'
      '       EL.IDESTAB            AS IDESTAB,'
      '       PP.IDPESSOA           AS IDTITULAR,'
      '       PP.DTINICIOINSC       AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO       AS DATAADMISSAO,'
      '       EL.DATADEMISSAO       AS DATADEMISSAO,'
      '       PF.DATANASC           AS DATANASCIMENTO,'
      '       P.NOME                AS NOME,'
      '       P.NUMDOCUMENTO        AS CPF,'
      '       PF.SEXO               AS SEXO,'
      '       PF.ESTCIVIL           AS ESTADOCIVIL,'
      '       EL.MATRICULA          AS MATRICULA,'
      '       EL.TEMPOSERVANTERIOR  AS TEMPOSERVICOANTERIOR,'
      '       EL.TEMPONAOCREDITADO  AS TEMPONAOCREDITADO,'
      '       PF.DATAMORTE          AS DATAFALECIMENTO,'
      '       PF.IDESTADO           AS NATURALIDADE,'
      '       PF.IDPAIS             AS NACIONALIDADE,'
      '       PF.NUMDEPIRRF         AS NUMDEPENIR,'
      '       PF.NUMDEPSALF         AS NUMDEPENSALARIOFAMILIA,'
      '       PF.TIPOSANG           AS TIPOSANGUINEO,'
      '       PF.IDGRINSTR          AS GRAUINSTRUCAO,'
      '       P.FLGINVALIDO         AS INVALIDO,'
      '       EL.CODVINCULAFUNC     AS VINCULACAOFUNCIONAL,'
      '       PP.FLGFITESPECIAL     AS SITUACAOESPECIAL,'
      '       PP.SEQPROPOSTA        AS SEQPROPOSTA,'
      '       EV.IDSITPARTNOVO      AS SITUACAOFUNDEVENTO,'
      
        '       PP.IDSITPART          AS SITUACAOFUNDACAO, EL.IDSITFUNC A' +
        'S SITUACAO_PATROCINADORA,'
      '       EL.FLGDIRETOR         AS IR_DIRETOR,'
      '       EL.IDCARGOEXT         AS CD_CARGO,'
      '       EL.IDPESSJURCEDIDO    AS PERTENCE_PATROCINADORA,'
      '       EL.CODVINCULAFUNC     AS CD_VINCULA_PARTIC'
      'FROM PESSOA P, PESSOAFISICA PF, PATRO PT, ELEGPATRO EL,'
      '     PARTPREVPLAN PP, EVENTOSPREV EV, SITFUNC SF, SITPART SP'
      'WHERE EV.IDPESSJUR(+) = EL.IDPESSJUR'
      '  AND EV.IDPESSOA(+)  = EL.IDPESSOA'
      '  AND SF.IDSITFUNC(+) = EV.IDSITFUNCNOVO'
      '  AND SP.IDSITPART(+) = EV.IDSITPARTNOVO'
      '  AND PP.IDPESSJUR = EL.IDPESSJUR'
      '  AND PP.IDPESSOA  = EL.IDPESSOA'
      '  AND PT.IDPESSOA  = EL.IDPESSJUR'
      '  AND P.IDPESSOA   = EL.IDPESSOA'
      '  AND PF.IDPESSOA  = EL.IDPESSOA'
      '  AND (EV.IDEVENTOSPREV IS NULL OR EV.IDEVENTOSPREV ='
      '           (SELECT MAX(IDEVENTOSPREV)'
      '            FROM EVENTOSPREV'
      '            WHERE DATAEVENTO = (SELECT MAX(DATAEVENTO)'
      '                                FROM EVENTOSPREV'
      '                                WHERE DATAEVENTO <= :DATAREF'
      '                                  AND IDPESSJUR = EV.IDPESSJUR'
      '                                  AND IDPESSOA  = EV.IDPESSOA)'
      '              AND IDPESSJUR  = EV.IDPESSJUR'
      '              AND IDPESSOA   = EV.IDPESSOA))'
      '  AND PP.INSCRICAODATA = (SELECT MAX(INSCRICAODATA)'
      '                          FROM PARTPREVPLAN'
      '                          WHERE IDPESSOA = PF.IDPESSOA)'
      
        '/*  AND EL.IDPESSJUR IN ()     -- linha alterada dinamicamente [' +
        '56] */'
      
        '/*  AND PP.IDPLANOPREV IN ()   -- linha alterada dinamicamente [' +
        '57] */'
      
        '/*  AND (EV.IDSITPARTNOVO IN (1,2) OR EV.IDSITPARTNOVO IS NULL) ' +
        ' -- linha alterada dinamicamente [58]*/'
      
        '/*  AND EL.SITFUNC IN ()         -- linha alterada dinamicamente' +
        ' [59] */'
      
        '/*  AND PP.SITPLANOPREV IN ()    -- linha alterada dinamicamente' +
        ' [60] */'
      ' ')
    Left = 48
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
  object QryPlanoAnterior: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, INSCRICAODATA'
      'FROM PARTPREVPLAN'
      'WHERE IDPESSJUR = :PATROCINADORA'
      '  AND IDPESSOA  = :IDTITULAR'
      'ORDER BY INSCRICAODATA DESC')
    Left = 237
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PATROCINADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryDibINSS: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT p.DATAINICIO'
      'FROM BENEFPLANPREV b, BENEFBFCIARIO p'
      'WHERE b.FLGREFERENCIA = 1'
      '  AND b.IDBENEFICIO = p.IDBENEFICIO'
      '  AND b.IDPLANOPREV = p.IDPLANOPREV'
      '  AND b.IDPLANOPREV = :IDPLANOPREV'
      '  AND b.IDPESSOA = :IDTITULAR')
    Left = 615
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryDibMigracao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAINICIO'
      'FROM BENEFBFCIARIO'
      'WHERE IDPLANOPREV = :IDPLANOPREV'
      '  AND IDPESSOA = :IDTITULAR ')
    Left = 615
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryPercFatorBeneficio1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VALORBASE1'
      'FROM BENEFPLANPREV b, BENEFPLANOPART p'
      'WHERE b.IDBENEFICIO = p.IDBENEFICIO'
      '  AND b.IDPLANOPREV = p.IDPLANOPREV'
      '  AND b.IDPLANOPREV = :IDPLANOPREV'
      '  AND b.IDPESSOA = :IDTITULAR'
      '  AND UPPER(NOMEVALORBASE1) like :DESCRICAO')
    Left = 615
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object QryReservaMigracao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT p.VALORRESERVA'
      'FROM RESERVAXPLANO r, RESERVAPART p'
      'WHERE r.FLGTRANSFERENCIA = 1'
      '  AND r.IDTIPORESERVA = p.IDTIPORESERVA'
      '  AND p.IDPLANOPREV = :IDPLANOPREV'
      '  AND p.IDPESSOA = :IDTITULAR')
    Left = 615
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryPercFatorBeneficio2: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VALORBASE2'
      'FROM BENEFPLANPREV b, BENEFPLANOPART p'
      'WHERE b.IDBENEFICIO = p.IDBENEFICIO'
      '  AND b.IDPLANOPREV = p.IDPLANOPREV'
      '  AND b.IDPLANOPREV = :IDPLANOPREV'
      '  AND b.IDPESSOA = :IDTITULAR'
      '  AND UPPER(NOMEVALORBASE2) like :DESCRICAO')
    Left = 615
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object QryPercFatorBeneficio3: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VALORBASE3'
      'FROM BENEFPLANPREV b, BENEFPLANOPART p'
      'WHERE b.IDBENEFICIO = p.IDBENEFICIO'
      '  AND b.IDPLANOPREV = p.IDPLANOPREV'
      '  AND b.IDPLANOPREV = :IDPLANOPREV'
      '  AND b.IDPESSOA = :IDTITULAR'
      '  AND UPPER(NOMEVALORBASE3) like :DESCRICAO')
    Left = 615
    Top = 214
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object QryDescrCargo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TITULO'
      'FROM CARGOEXT'
      'WHERE IDCARGOEXT = :CD_CARGO')
    Left = 520
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
  end
  object QryInsCargo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_TIPO_CATEG_PROF_ESPECIAL'
      '(CD_TIPO_CAT_PROF_ESP, DS_TIPO_CAT_PROF_ESP)'
      'VALUES'
      '(:CD_CARGO, :DS_CARGO)')
    Left = 615
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CARGO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdCargo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_TIPO_CATEG_PROF_ESPECIAL'
      'SET DS_TIPO_CAT_PROF_ESP = :DS_CARGO'
      'WHERE CD_TIPO_CAT_PROF_ESP = :CD_CARGO')
    Left = 615
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
  end
  object QryExDiretor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TITULO '
      'FROM CARGOEXT c, EVOLFUNCPREV e'
      'WHERE c.IDCARGOEXT = e.IDCARGOEXT'
      '  AND IDPESSOA = :IDTITULAR'
      '  AND DATAFINAL <= :DATA')
    Left = 615
    Top = 314
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 508
  end
  object QryInsSituacaoPlano: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_SITUACAO_PLANO'
      '(CD_SITUACAO_PLANO, DS_SITUACAO_PLANO)'
      ''
      'SELECT IDSITPLANOPREV, DESCRICAO'
      'FROM SITPLANOPREV'
      'WHERE IDSITPLANOPREV NOT IN'
      '    (SELECT CD_SITUACAO_PLANO FROM FI_SITUACAO_PLANO)')
    Left = 48
    Top = 412
  end
  object QryInsVinculoParticipante: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_VINCULA_PARTIC'
      '(CD_VINCULA_PARTIC, DS_VINCULA_PARTIC)'
      ''
      'SELECT CODVINCULAFUNC, DESCRICAO'
      'FROM VINCULAFUNC'
      'WHERE CODVINCULAFUNC NOT IN'
      '    (SELECT CD_VINCULA_PARTIC FROM FI_VINCULA_PARTIC)'
      ' ')
    Left = 147
    Top = 412
  end
  object QryInsOutrasFundacoes: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_OUTRA_FUNDACAO'
      '(CD_OUTRA_FUNDACAO, DS_OUTRA_FUNDACAO)'
      ''
      'SELECT IDPARAM, DESCRICAO'
      'FROM PARAMFLAGPESSOA'
      'WHERE IDPARAM NOT IN'
      '      (SELECT CD_OUTRA_FUNDACAO FROM FI_OUTRA_FUNDACAO)'
      ' ')
    Left = 48
    Top = 461
  end
  object QryPessoaParam: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARAM'
      'FROM PESSOAPARAM'
      'WHERE IDPESSOA = :IDPESSOA  ')
    Left = 147
    Top = 461
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryInsGrupoBeneficio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_GRUPO_BENEFICIO'
      '(CD_GRUPO_BENEFICIO, DS_GRUPO_BENEFICIO)'
      ''
      'SELECT IDGRUPOBENEF, DESCRICAO'
      'FROM GRUPOBENEF'
      'WHERE IDGRUPOBENEF NOT IN'
      '      (SELECT CD_GRUPO_BENEFICIO FROM FI_GRUPO_BENEFICIO)'
      ' '
      '')
    Left = 237
    Top = 461
  end
  object QryInsBeneficiario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_BENEFICIARIO'
      
        '(CD_VERSAO, CD_PARTIC, CD_BENEF_TITULAR, CD_BENEFICIARIO, CD_PES' +
        'SOA_ENTID,'
      
        ' CD_PESSOA_PATROC, CD_PLANO, CD_TIPO_BENEF, CD_GRAU_DEPENDENCIA,' +
        ' CD_DURACAO,'
      
        ' CD_SITUACAO_PLANO, CD_GRAU_INSTRUCAO, NO_BENEFICIARIO, NR_MATRI' +
        'CULA,'
      ' DT_NASC, IR_SEXO, NR_IDADE_BENEFICIARIO)'
      'VALUES'
      
        '(:CD_VERSAO, :CD_PARTIC, :CD_BENEF_TITULAR, :CD_BENEFICIARIO, :C' +
        'D_PESSOA_ENTID,'
      
        ' :CD_PESSOA_PATROC, :CD_PLANO, :CD_TIPO_BENEF, :CD_GRAU_DEPENDEN' +
        'CIA, :CD_DURACAO,'
      
        ' :CD_SITUACAO_PLANO, :CD_GRAU_INSTRUCAO, :NO_BENEFICIARIO, :NR_M' +
        'ATRICULA,'
      ' :DT_NASC, :IR_SEXO, :NR_IDADE_BENEFICIARIO)')
    Left = 327
    Top = 461
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEF_TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_BENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DURACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_SITUACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_NASC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_IDADE_BENEFICIARIO'
        ParamType = ptInput
      end>
  end
  object QryUpdBeneficiario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_BENEFICIARIO'
      'SET CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '    CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '    CD_PLANO = :CD_PLANO,'
      '    CD_TIPO_BENEF = :CD_TIPO_BENEF,'
      '    CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '    CD_DURACAO = :CD_DURACAO,'
      '    CD_SITUACAO_PLANO = :CD_SITUACAO_PLANO,'
      '    CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO,'
      '    NO_BENEFICIARIO = :NO_BENEFICIARIO,'
      '    NR_MATRICULA = :NR_MATRICULA,'
      '    DT_NASC = :DT_NASC,'
      '    IR_SEXO = :IR_SEXO,'
      '    NR_IDADE_BENEFICIARIO = :NR_IDADE_BENEFICIARIO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_BENEF_TITULAR = :CD_BENEF_TITULAR'
      '  AND CD_BENEFICIARIO = :CD_BENEFICIARIO')
    Left = 427
    Top = 461
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_BENEF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DURACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_SITUACAO_PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_NASC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IR_SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_IDADE_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEF_TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEFICIARIO'
        ParamType = ptInput
      end>
  end
  object QryInsValorBeneficiario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_VALOR_BENEFICIARIO'
      
        '(CD_VERSAO, CD_PARTIC, CD_BENEF_TITULAR, CD_BENEFICIARIO, CD_TIP' +
        'O_VALOR, VL_PARTICIPANTE)'
      'VALUES'
      
        '(:CD_VERSAO, :CD_PARTIC, :CD_BENEF_TITULAR, :CD_BENEFICIARIO, :C' +
        'D_TIPO_VALOR, :VL_PARTICIPANTE)')
    Left = 520
    Top = 461
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEF_TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_PARTICIPANTE'
        ParamType = ptInput
      end>
  end
  object QryUpdValorBeneficiario: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_VALOR_BENEFICIARIO'
      'SET VL_PARTICIPANTE = :VL_PARTICIPANTE'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_BENEF_TITULAR = :CD_BENEF_TITULAR'
      '  AND CD_BENEFICIARIO = :CD_BENEFICIARIO'
      '  AND CD_TIPO_VALOR = :CD_TIPO_VALOR'
      ''
      ' ')
    Left = 615
    Top = 461
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VL_PARTICIPANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEF_TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_VALOR'
        ParamType = ptInput
      end>
  end
  object QryInsGrauInstrucao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_GRAU_INSTRUCAO'
      '(CD_GRAU_INSTRUCAO, DS_GRAU_INSTRUCAO)'
      ''
      'SELECT IDGRINSTR, DESCRICAO FROM GRINSTR'
      'WHERE IDGRINSTR NOT IN'
      '    (SELECT CD_GRAU_INSTRUCAO'
      '     FROM FI_GRAU_INSTRUCAO)')
    Left = 147
    Top = 508
  end
  object qryTipoBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from fi_tipo_beneficio')
    ValidateWithMask = True
    Left = 236
    Top = 507
  end
end
