object DtMdlSat: TDtMdlSat
  OldCreateOrder = True
  Left = 183
  Top = 127
  Height = 246
  Width = 526
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 489
    Top = 14
  end
  object wwQryTotReg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select count(*)  as totreg from'
      'fi_participante')
    ValidateWithMask = True
    Left = 27
    Top = 14
    object wwQryTotRegTOTREG: TFloatField
      FieldName = 'TOTREG'
    end
  end
  object wwQryTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from fi_tempo_participante a,'
      '              fi_tipo_tempo b'
      '         where a.cd_tipo_tempo = b.cd_tipo_tempo'
      '           and a.cd_versao   = :cd_versao'
      '           and a.cd_partic     = :cd_partic'
      '           and b.ir_dominio_sistema = :ir_dominio_sistema'
      '')
    ValidateWithMask = True
    Left = 142
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
        DataType = ftString
        Name = 'ir_dominio_sistema'
        ParamType = ptUnknown
      end>
    object wwQryTempoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_VERSAO'
    end
    object wwQryTempoCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_PARTIC'
    end
    object wwQryTempoCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO'
    end
    object wwQryTempoDT_TEMPO: TDateTimeField
      FieldName = 'DT_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.DT_TEMPO'
    end
    object wwQryTempoQT_DIA_TEMPO: TFloatField
      FieldName = 'QT_DIA_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_DIA_TEMPO'
    end
    object wwQryTempoQT_MES_TEMPO: TFloatField
      FieldName = 'QT_MES_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_MES_TEMPO'
    end
    object wwQryTempoQT_ANO_TEMPO: TFloatField
      FieldName = 'QT_ANO_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_ANO_TEMPO'
    end
    object wwQryTempoDS_TIPO_TEMPO: TStringField
      FieldName = 'DS_TIPO_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_ANO_TEMPO'
      Size = 60
    end
    object wwQryTempoIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_ANO_TEMPO'
      Size = 3
    end
  end
  object wwQryDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select   min(dt_nasc)            as data_nasc,'
      '         max(nr_anos_dependente) as idade'
      '    from fi_dependente'
      '    where'
      '         cd_versao     = :cd_versao'
      '    and  cd_partic     = :cd_partic')
    ValidateWithMask = True
    Left = 259
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
      end>
    object wwQryDependenteDATA_NASC: TDateTimeField
      FieldName = 'DATA_NASC'
      Origin = 'FI_DEPENDENTE.DT_NASC'
    end
    object wwQryDependenteIDADE: TFloatField
      FieldName = 'IDADE'
      Origin = 'FI_DEPENDENTE.NR_ANOS_DEPENDENTE'
    end
  end
  object wwQryOcorrTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from fi_ocorr_tabua a,'
      '              fi_tabua       b,'
      '              fi_tipo_tabua  c'
      '             where a.cd_tabua      = b.cd_tabua'
      '               and b.cd_tipo_tabua = c.cd_tipo_tabua'
      '               and a.cd_tabua      = :cd_tabua'
      '               and c.ir_dominio_sistema = :ir_dominio_sistema'
      '  order by nr_idade                                       ')
    ValidateWithMask = True
    Left = 363
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_tabua'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ir_dominio_sistema'
        ParamType = ptUnknown
      end>
    object wwQryOcorrTabuaCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'FI_OCORR_TABUA.CD_TABUA'
    end
    object wwQryOcorrTabuaNR_IDADE: TFloatField
      FieldName = 'NR_IDADE'
      Origin = 'FI_OCORR_TABUA.NR_IDADE'
    end
    object wwQryOcorrTabuaNR_L_X: TFloatField
      FieldName = 'NR_L_X'
      Origin = 'FI_OCORR_TABUA.NR_L_X'
    end
    object wwQryOcorrTabuaNR_P_X: TFloatField
      FieldName = 'NR_P_X'
      Origin = 'FI_OCORR_TABUA.NR_P_X'
    end
    object wwQryOcorrTabuaNR_D_X: TFloatField
      FieldName = 'NR_D_X'
      Origin = 'FI_OCORR_TABUA.NR_D_X'
    end
    object wwQryOcorrTabuaNR_Q_X: TFloatField
      FieldName = 'NR_Q_X'
      Origin = 'FI_OCORR_TABUA.NR_Q_X'
    end
    object wwQryOcorrTabuaNR_I_X: TFloatField
      FieldName = 'NR_I_X'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
    end
    object wwQryOcorrTabuaSG_TABUA: TStringField
      FieldName = 'SG_TABUA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
      Size = 15
    end
    object wwQryOcorrTabuaDS_TABUA: TStringField
      FieldName = 'DS_TABUA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
      Size = 50
    end
    object wwQryOcorrTabuaDT_REF_TABUA: TDateTimeField
      FieldName = 'DT_REF_TABUA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
    end
    object wwQryOcorrTabuaCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
    end
    object wwQryOcorrTabuaDS_TIPO_TABUA: TStringField
      FieldName = 'DS_TIPO_TABUA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
      Size = 40
    end
    object wwQryOcorrTabuaIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
      Size = 3
    end
  end
  object wwQryAtributoTabelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from '
      '              fi_tabela a,  '
      '              fi_atributo_tabela b'
      '      where'
      '              a.no_tabela  = b.no_tabela'
      '   '
      'order  by  a.no_tabela, b.no_atributo_tabela'
      '                                 ')
    ValidateWithMask = True
    Left = 32
    Top = 79
    object wwQryAtributoTabelasNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = 'FI_TABELA.NO_TABELA'
      Size = 60
    end
    object wwQryAtributoTabelasSQ_ATUALIZACAO: TFloatField
      FieldName = 'SQ_ATUALIZACAO'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
    end
    object wwQryAtributoTabelasNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 60
    end
    object wwQryAtributoTabelasDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 60
    end
    object wwQryAtributoTabelasTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 1
    end
    object wwQryAtributoTabelasNR_TAM_ATRIBUTO_TABELA: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
    end
    object wwQryAtributoTabelasIR_MANDATORIO: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 1
    end
    object wwQryAtributoTabelasIR_CARGA_OBRIGATORIA: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 1
    end
    object wwQryAtributoTabelasNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
    end
    object wwQryAtributoTabelasNO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 60
    end
    object wwQryAtributoTabelasNO_ATRIBUTO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
      Size = 60
    end
    object wwQryAtributoTabelasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'FI_TABELA.SQ_ATUALIZACAO'
    end
  end
  object wwQryPkTabelaSel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  b.no_tabela, '
      '            b.no_atributo_tabela'
      '     '
      '   from  fi_tabela a,'
      '          fi_pk_tabela b'
      ''
      '   where  a.no_tabela  = b.no_tabela'
      '     and   RTRIM(a.no_tabela)  =   :no_tabela')
    ValidateWithMask = True
    Left = 142
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end>
    object wwQryPkTabelaSelNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = 'FI_PK_TABELA.NO_TABELA'
      Size = 60
    end
    object wwQryPkTabelaSelNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = 'FI_PK_TABELA.NO_ATRIBUTO_TABELA'
      Size = 60
    end
  end
  object wwQryPkTabela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select   no_tabela,'
      '         no_atributo_tabela'
      '       '
      '   from   fi_atributo_tabela'
      ''
      '   where'
      
        '       no_tabela in (select distinct no_tabela from fi_atributo_' +
        'tabela'
      '                            where cd_grupo is not null )')
    ValidateWithMask = True
    Left = 258
    Top = 79
    object wwQryPkTabelaNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object wwQryPkTabelaNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
  end
  object wwQryComplQuery: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from '
      '            fi_atributo_tabela '
      '      where'
      '              RTRIM(no_tabela)  = :no_tabela'
      '')
    ValidateWithMask = True
    Left = 364
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end>
    object wwQryComplQueryNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object wwQryComplQueryNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwQryComplQueryDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwQryComplQueryTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".TP_ATRIBUTO'
      Size = 1
    end
    object wwQryComplQueryNR_TAM_ATRIBUTO_TABELA: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NR_TAM_ATRIBUTO_TABELA'
    end
    object wwQryComplQueryIR_MANDATORIO: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_MANDATORIO'
      Size = 1
    end
    object wwQryComplQueryIR_CARGA_OBRIGATORIA: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_CARGA_OBRIGATORIA'
      Size = 1
    end
    object wwQryComplQueryNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA_LOOKUP'
    end
    object wwQryComplQueryNO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA_LOOKUP'
      Size = 60
    end
    object wwQryComplQueryNO_ATRIBUTO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
      Size = 60
    end
    object wwQryComplQueryCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
    end
  end
  object wwQryPkFkTabela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  no_tabela,'
      '           no_atributo_tabela,'
      '          '#39'                               '#39' as no_tabela_fk, '
      
        '          '#39'                               '#39' as no_atributo_tabel' +
        'a_fk'
      '       '
      '   from  fi_pk_tabela'
      ''
      '   where RTRIM(no_tabela)  = :no_tabela  '
      '     and  RTRIM(no_atributo_tabela) = :no_atributo_tabela'
      ''
      'union'
      '        '
      'select  no_tabela, '
      '           no_atributo_tabela,'
      '           no_tabela_fk, '
      '           no_atributo_tabela_fk'
      '       '
      '   from  fi_fk_tabela b'
      ''
      '   where  RTRIM(no_tabela)  = :no_tabela  '
      '      and   RTRIM(no_atributo_tabela) = :no_atributo_tabela')
    ValidateWithMask = True
    Left = 22
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_atributo_tabela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_atributo_tabela'
        ParamType = ptUnknown
      end>
    object wwQryPkFkTabelaNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Size = 60
    end
    object wwQryPkFkTabelaNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwQryPkFkTabelaNO_TABELA_FK: TStringField
      FieldName = 'NO_TABELA_FK'
      Size = 60
    end
    object wwQryPkFkTabelaNO_ATRIBUTO_TABELA_FK: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_FK'
      Size = 60
    end
  end
  object wwQryRamificacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  no_tabela,'
      '           no_atributo_tabela,'
      '           no_tabela_fk, '
      '           no_atributo_tabela_fk'
      '       '
      '   from '
      '          fi_fk_tabela '
      ''
      '   where RTRIM(no_tabela_fk)  = :no_tabela_fk '
      '  and     RTRIM(no_tabela)  <> :no_tabela '
      '  and     RTRIM(no_atributo_tabela)  = :no_atributo_tabela_fk ')
    ValidateWithMask = True
    Left = 143
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'no_tabela_fk'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_atributo_tabela_fk'
        ParamType = ptUnknown
      end>
    object wwQryRamificacaoNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = 'FI_FK_TABELA.NO_TABELA'
      Size = 60
    end
    object wwQryRamificacaoNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = 'FI_FK_TABELA.NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwQryRamificacaoNO_TABELA_FK: TStringField
      FieldName = 'NO_TABELA_FK'
      Origin = 'FI_FK_TABELA.NO_TABELA_FK'
      Size = 60
    end
    object wwQryRamificacaoNO_ATRIBUTO_TABELA_FK: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_FK'
      Origin = 'FI_FK_TABELA.NO_ATRIBUTO_TABELA_FK'
      Size = 60
    end
  end
  object BdTmp: TDatabase
    DatabaseName = 'BdTmp'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 488
    Top = 80
  end
  object FQuery: TQuery
    DatabaseName = 'BaseDados'
    Left = 258
    Top = 144
  end
  object wwQryGrupoCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC,'
      '           FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC,'
      '           FI_GRUPO_PARTICIPANTE.DS_SQL_ENQUADRAMENTO'
      '    from  FI_GRUPO_PARTICIPANTE  FI_GRUPO_PARTICIPANTE,'
      '          FI_GRUPO_CALCULO       FI_GRUPO_CALCULO'
      '    where'
      
        '        FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC = FI_GRUPO_CALCULO' +
        '.CD_GRUPO_PARTIC'
      '    and FI_GRUPO_CALCULO.CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '    and FI_GRUPO_CALCULO.CD_PESSOA_ENTID   = :CD_PESSOA_ENTID'
      '    and FI_GRUPO_CALCULO.CD_PLANO          = :CD_PLANO'
      ''
      'order by FI_GRUPO_CALCULO.NR_ORDEM')
    ValidateWithMask = True
    Left = 365
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object wwQryGrupoCalculoDS_SQL_ENQUADRAMENTO: TMemoField
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_SQL_ENQUADRAMENTO'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQryGrupoCalculoCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
    end
    object wwQryGrupoCalculoNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'BASEDADOS."CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      FixedChar = True
      Size = 60
    end
  end
  object wwQryGrupoExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select   FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC, '
      '            FI_GRUPO_PARTICIPANTE.DS_SQL_ENQUADRAMENTO'
      '    from  FI_GRUPO_PARTICIPANTE  FI_GRUPO_PARTICIPANTE,'
      '          FI_GRUPO_EXPORTACAO    FI_GRUPO_EXPORTACAO'
      '    where'
      
        '        FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC = FI_GRUPO_EXPORTA' +
        'CAO.CD_GRUPO_PARTIC'
      
        '    and FI_GRUPO_EXPORTACAO.CD_PESSOA_PATROC  = :CD_PESSOA_PATRO' +
        'C'
      '    and FI_GRUPO_EXPORTACAO.CD_PESSOA_ENTID   = :CD_PESSOA_ENTID'
      '    and FI_GRUPO_EXPORTACAO.CD_PLANO          = :CD_PLANO'
      ''
      'order by FI_GRUPO_EXPORTACAO.NR_ORDEM'
      '')
    ValidateWithMask = True
    Left = 486
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object wwQryGrupoExportacaoDS_SQL_ENQUADRAMENTO: TMemoField
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_SQL_ENQUADRAMENTO'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQryGrupoExportacaoCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
    end
  end
end
