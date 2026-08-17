object DtmImportacaoBase: TDtmImportacaoBase
  OldCreateOrder = True
  Left = 65532
  Top = 65532
  Height = 580
  Width = 808
  object qryInsHistParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_PARTICIPANTE'
      
        '(cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, cd_pla' +
        'no,'
      ' cd_tipo_cat_prof_esp, nr_matricula, no_pessoa, cd_estado_civil,'
      
        ' ir_sexo, tp_participante, ir_condicao_trabalho, cd_grupo_calcul' +
        'o,'
      ' ds_regional, cd_situacao_patroc, cd_situacao_fundacao, nr_cpf)'
      ''
      
        'Select cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, ' +
        'cd_plano,'
      
        '       cd_tipo_cat_prof_esp, nr_matricula, no_pessoa, cd_estado_' +
        'civil,'
      
        '       ir_sexo, tp_participante, ir_condicao_trabalho, cd_grupo_' +
        'calculo,'
      
        '       ds_regional, cd_situacao_patroc, cd_situacao_fundacao, nr' +
        '_cpf'
      'from FI_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 38
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_DEPENDENTE'
      
        '(cd_versao, cd_partic, cd_dependente, no_dependente, cd_grau_ins' +
        'trucao,'
      
        ' cd_grau_dependencia, cd_duracao, nr_matricula, dt_nasc, ir_sexo' +
        ','
      ' nr_anos_dependente, ir_e_titular_pensao)'
      ''
      
        'Select cd_versao, cd_partic, cd_dependente, no_dependente, cd_gr' +
        'au_instrucao,'
      
        '       cd_grau_dependencia, cd_duracao, nr_matricula, dt_nasc, i' +
        'r_sexo,'
      '       nr_anos_dependente, ir_e_titular_pensao'
      'from FI_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 128
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_BENEFICIO_CONCEDIDO'
      
        '(cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, cd_pla' +
        'no,'
      ' cd_tipo_benef)'
      ''
      
        'Select cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, ' +
        'cd_plano,'
      '       cd_tipo_benef'
      'from FI_BENEFICIO_CONCEDIDO'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 205
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_VALOR_PARTICIPANTE'
      '(cd_versao, cd_partic, cd_tipo_valor, vl_participante)'
      ''
      'Select cd_versao, cd_partic, cd_tipo_valor, vl_participante'
      'from FI_VALOR_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 272
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_TEMPO_PARTICIPANTE'
      '(cd_versao, cd_partic, cd_tipo_tempo, dt_tempo, qt_dia_tempo,'
      ' qt_mes_tempo, qt_ano_tempo)'
      ''
      
        'Select cd_versao, cd_partic, cd_tipo_tempo, dt_tempo, qt_dia_tem' +
        'po,'
      '       qt_mes_tempo, qt_ano_tempo'
      'from FI_TEMPO_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 337
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_PARTICIPANTE'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 38
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_DEPENDENTE'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 128
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_BENEFICIO_CONCEDIDO'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 205
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_VALOR_PARTICIPANTE'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 272
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_TEMPO_PARTICIPANTE'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 337
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistOcorCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_OCOR_CALCULO_ATUARIAL'
      '(dt_geracao, sq_ocor_calculo, cd_versao, cd_pessoa_patroc,'
      
        ' cd_pessoa_entid, cd_plano, cd_partic, cd_grupo_partic, cd_formu' +
        'la,'
      ' no_variavel, vl_calculo_atuarial, cd_tipo_benef)'
      ''
      'Select dt_geracao, sq_ocor_calculo, cd_versao, cd_pessoa_patroc,'
      
        '       cd_pessoa_entid, cd_plano, cd_partic, cd_grupo_partic, cd' +
        '_formula,'
      '       no_variavel, vl_calculo_atuarial, cd_tipo_benef'
      'from FI_OCOR_CALCULO_ATUARIAL'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 129
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistReferCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_REFER_CALCULO_ATUARIAL'
      
        '(dt_geracao, cd_versao, cd_pessoa_patroc, cd_pessoa_entid, cd_pl' +
        'ano,'
      ' cd_hipotese, dt_refer_calculo, ir_calculo_efetivado)'
      ''
      
        'Select dt_geracao, cd_versao, cd_pessoa_patroc, cd_pessoa_entid,' +
        ' cd_plano,'
      '       cd_hipotese, dt_refer_calculo, ir_calculo_efetivado'
      'from FI_REFER_CALCULO_ATUARIAL'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 47
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistOpcaoCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BK_OPCAO_CALC_GRUPO_PARTIC'
      '(cd_versao, dt_geracao, cd_pessoa_patroc, cd_pessoa_entid,'
      ' cd_plano, cd_grupo_partic)'
      ''
      'Select cd_versao, dt_geracao, cd_pessoa_patroc, cd_pessoa_entid,'
      '       cd_plano, cd_grupo_partic'
      'from FI_OPCAO_CALCULO_GRUPO_PARTIC'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 217
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelReferCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete FI_REFER_CALCULO_ATUARIAL'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 47
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelOcorCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete FI_OCOR_CALCULO_ATUARIAL'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 129
    Top = 179
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryDelOpcaoCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete FI_OPCAO_CALCULO_GRUPO_PARTIC'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 217
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdVersaoH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Update FI_VERSAO_BASE'
      'set IR_BASE_HISTORICA = '#39'S'#39
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 337
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_PARTICIPANTE'
      
        '(cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, cd_pla' +
        'no,'
      ' cd_tipo_cat_prof_esp, nr_matricula, no_pessoa, cd_estado_civil,'
      
        ' ir_sexo, tp_participante, ir_condicao_trabalho, cd_grupo_calcul' +
        'o,'
      ' ds_regional, cd_situacao_patroc, cd_situacao_fundacao, nr_cpf)'
      ''
      'values'
      ''
      
        '(:cd_versao, :cd_partic, :cd_pessoa_patroc, :cd_pessoa_entid, :c' +
        'd_plano,'
      
        ' :cd_tipo_cat_prof_esp, :nr_matricula, :no_pessoa, :cd_estado_ci' +
        'vil,'
      
        ' :ir_sexo, :tp_participante, :ir_condicao_trabalho, :cd_grupo_ca' +
        'lculo,'
      
        ' :ds_regional, :cd_situacao_patroc, :cd_situacao_fundacao, :nr_c' +
        'pf)'
      '')
    ValidateWithMask = True
    Left = 464
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tipo_cat_prof_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_estado_civil'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ir_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tp_participante'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ir_condicao_trabalho'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_grupo_calculo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ds_regional'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_situacao_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_situacao_fundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_cpf'
        ParamType = ptUnknown
      end>
  end
  object qryInsDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_DEPENDENTE'
      
        '(cd_versao, cd_partic, cd_dependente, no_dependente, cd_grau_ins' +
        'trucao,'
      
        ' cd_grau_dependencia, cd_duracao, nr_matricula, dt_nasc, ir_sexo' +
        ','
      ' nr_anos_dependente, ir_e_titular_pensao)'
      ''
      'values'
      ''
      '(:cd_versao, :cd_partic, :cd_dependente, :no_dependente, '
      ' :cd_grau_instrucao, :cd_grau_dependencia, :cd_duracao, '
      
        ' :nr_matricula, :dt_nasc, :ir_sexo, :nr_anos_dependente, :ir_e_t' +
        'itular_pensao)')
    ValidateWithMask = True
    Left = 538
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_dependente'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_dependente'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_grau_instrucao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_grau_dependencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_duracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dt_nasc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ir_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nr_anos_dependente'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ir_e_titular_pensao'
        ParamType = ptUnknown
      end>
  end
  object qryInsBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_BENEFICIO_CONCEDIDO'
      
        '(cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, cd_pla' +
        'no,'
      ' cd_tipo_benef)'
      ''
      'values'
      ''
      
        '(:cd_versao, :cd_partic, :cd_pessoa_patroc, :cd_pessoa_entid, :c' +
        'd_plano,'
      ' :cd_tipo_benef)')
    ValidateWithMask = True
    Left = 611
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tipo_benef'
        ParamType = ptUnknown
      end>
  end
  object qryInsValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_VALOR_PARTICIPANTE'
      '(cd_versao, cd_partic, cd_tipo_valor, vl_participante)'
      ''
      'values'
      ''
      '(:cd_versao, :cd_partic, :cd_tipo_valor, :vl_participante)')
    ValidateWithMask = True
    Left = 677
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tipo_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'vl_participante'
        ParamType = ptUnknown
      end>
  end
  object qryInsTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_TEMPO_PARTICIPANTE'
      '(cd_versao, cd_partic, cd_tipo_tempo, dt_tempo, qt_dia_tempo,'
      ' qt_mes_tempo, qt_ano_tempo)'
      ''
      'values'
      ''
      
        '(:cd_versao, :cd_partic, :cd_tipo_tempo, :dt_tempo, :qt_dia_temp' +
        'o,'
      ' :qt_mes_tempo, :qt_ano_tempo)')
    ValidateWithMask = True
    Left = 740
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tipo_tempo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dt_tempo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'qt_dia_tempo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'qt_mes_tempo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'qt_ano_tempo'
        ParamType = ptUnknown
      end>
  end
  object qryHistParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, ' +
        'cd_plano,'
      
        '       cd_tipo_cat_prof_esp, nr_matricula, no_pessoa, cd_estado_' +
        'civil,'
      
        '       ir_sexo, tp_participante, ir_condicao_trabalho, cd_grupo_' +
        'calculo,'
      
        '       ds_regional, cd_situacao_patroc, cd_situacao_fundacao, nr' +
        '_cpf'
      'from FI_BK_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 464
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryHistDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select cd_versao, cd_partic, cd_dependente, no_dependente, cd_gr' +
        'au_instrucao,'
      
        '       cd_grau_dependencia, cd_duracao, nr_matricula, dt_nasc, i' +
        'r_sexo,'
      '       nr_anos_dependente, ir_e_titular_pensao'
      'from FI_BK_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 538
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryHistBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select cd_versao, cd_partic, cd_pessoa_patroc, cd_pessoa_entid, ' +
        'cd_plano,'
      '        cd_tipo_benef'
      'from FI_BK_BENEFICIO_CONCEDIDO'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 611
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryHistValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select cd_versao, cd_partic, cd_tipo_valor, vl_participante'
      'from FI_BK_VALOR_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 677
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryHistTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select cd_versao, cd_partic, cd_tipo_tempo, dt_tempo, qt_dia_tem' +
        'po,'
      '       qt_mes_tempo, qt_ano_tempo'
      'from FI_BK_TEMPO_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 740
    Top = 90
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_PLANO_PATRONAL'
      '(CD_PLANO, NO_PLANO)'
      ''
      'Select IDPLANOPREV, NOME'
      'from PLANPREV')
    ValidateWithMask = True
    Left = 160
    Top = 285
  end
  object qryInsPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_PESSOA_JURIDICA'
      '(CD_PESSOA, NO_PESSOA)'
      ''
      'Select IDPESSOA, NOME'
      'from PESSOA'
      'where FLGPATROCINADORA = 1')
    ValidateWithMask = True
    Left = 30
    Top = 285
  end
  object qryInsPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_PESSOA_JURIDICA'
      '(CD_PESSOA)'
      ''
      'Select IDPESSOA'
      'from PESSOA'
      'where FLGPATROCINADORA = 1')
    ValidateWithMask = True
    Left = 97
    Top = 285
  end
  object qryInsSitFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_SITUACAO_FUNDACAO'
      '(CD_SITUACAO_FUNDACAO, DS_SITUACAO_FUNDACAO)'
      ''
      'Select IDSITFUNC, DESCRICAO'
      'from SITFUNC')
    ValidateWithMask = True
    Left = 240
    Top = 285
  end
  object qryInsSitPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_SITUACAO_PATROC'
      '(CD_SITUACAO_PATROC, DS_SITUACAO_PATROC)'
      ''
      'Select IDSITPART, DESCRICAO'
      'from SITPART')
    ValidateWithMask = True
    Left = 325
    Top = 285
  end
  object qryDelGrupoExportPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_GRUPO_EXPORT_PARTIC'
      ' where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 272
    Top = 105
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
end
