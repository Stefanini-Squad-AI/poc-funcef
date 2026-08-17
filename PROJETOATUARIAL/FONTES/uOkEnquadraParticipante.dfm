inherited frmOkEnquadraParticipante: TfrmOkEnquadraParticipante
  Left = 344
  Top = 355
  HelpContext = 40155
  Caption = 'Associação de versão a processo'
  ClientHeight = 214
  ClientWidth = 338
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 338
    Height = 175
    object RadioGroupTipo: TRadioGroup
      Left = 35
      Top = 23
      Width = 270
      Height = 130
      Caption = 'Tipo de Enquadramento'
      ItemIndex = 0
      Items.Strings = (
        'Cálculo Atuarial'
        'Exportação de Cadastro'
        'Desfaz associação')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 175
    Width = 338
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 272
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 80
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 211
    Top = 91
  end
  object wwQryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '    FROM FI_PARTICIPANTE'
      '    where '
      '              CD_VERSAO  = :CD_VERSAO'
      '')
    ValidateWithMask = True
    Left = 227
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object wwQryParticipanteCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_PARTICIPANTE.CD_VERSAO'
    end
    object wwQryParticipanteCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_PARTICIPANTE.CD_PARTIC'
    end
    object wwQryParticipanteCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_PARTICIPANTE.CD_PESSOA_PATROC'
    end
    object wwQryParticipanteCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_PARTICIPANTE.CD_PESSOA_ENTID'
    end
    object wwQryParticipanteCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_PARTICIPANTE.CD_PLANO'
    end
    object wwQryParticipanteCD_TIPO_CAT_PROF_ESP: TFloatField
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_PARTICIPANTE.CD_TIPO_CAT_PROF_ESP'
    end
    object wwQryParticipanteNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = 'FI_PARTICIPANTE.NR_MATRICULA'
      Size = 15
    end
    object wwQryParticipanteNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PARTICIPANTE.NO_PESSOA'
      Size = 60
    end
    object wwQryParticipanteCD_ESTADO_CIVIL: TStringField
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'FI_PARTICIPANTE.CD_ESTADO_CIVIL'
      Size = 1
    end
    object wwQryParticipanteIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'FI_PARTICIPANTE.IR_SEXO'
      Size = 1
    end
    object wwQryParticipanteTP_PARTICIPANTE: TStringField
      FieldName = 'TP_PARTICIPANTE'
      Origin = 'FI_PARTICIPANTE.TP_PARTICIPANTE'
      Size = 1
    end
    object wwQryParticipanteIR_CONDICAO_TRABALHO: TStringField
      FieldName = 'IR_CONDICAO_TRABALHO'
      Origin = 'FI_PARTICIPANTE.IR_CONDICAO_TRABALHO'
      Size = 1
    end
    object wwQryParticipanteCD_GRUPO_CALCULO: TFloatField
      FieldName = 'CD_GRUPO_CALCULO'
      Origin = 'FI_PARTICIPANTE.CD_GRUPO_CALCULO'
    end
    object wwQryParticipanteDS_REGIONAL: TStringField
      FieldName = 'DS_REGIONAL'
      Origin = 'FI_PARTICIPANTE.DS_REGIONAL'
      Size = 60
    end
    object wwQryParticipanteCD_SITUACAO_PATROC: TFloatField
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_PARTICIPANTE.CD_SITUACAO_PATROC'
    end
    object wwQryParticipanteCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_PARTICIPANTE.CD_SITUACAO_FUNDACAO'
    end
    object wwQryParticipanteNR_CPF: TStringField
      FieldName = 'NR_CPF'
      Origin = 'FI_PARTICIPANTE.NR_CPF'
      Size = 11
    end
  end
  object wwQryAtuGrupoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update FI_PARTICIPANTE'
      'set'
      '   CD_GRUPO_CALCULO = :CD_GRUPO_CALCULO'
      'where'
      '  CD_VERSAO     = :CD_VERSAO  and'
      '  CD_PARTIC       = :CD_PARTIC'
      '')
    ValidateWithMask = True
    Left = 264
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object QryInsGrupoExport: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_GRUPO_EXPORT_PARTIC'
      '(CD_VERSAO, CD_PARTIC, CD_GRUPO_PARTIC,'
      ' CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO)'
      ''
      'values'
      '(:CD_VERSAO, :CD_PARTIC, :CD_GRUPO_PARTIC,'
      ' :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO)')
    ValidateWithMask = True
    Left = 301
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
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
  end
  object QryDelGrupoExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Delete from FI_GRUPO_EXPORT_PARTIC'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 330
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_GRUPO_CALCULO'
      'values'
      '(:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID,'
      ' :CD_PLANO, :NR_ORDEM)')
    ValidateWithMask = True
    Left = 306
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftInteger
        Name = 'NR_ORDEM'
        ParamType = ptUnknown
      end>
  end
  object QryPlanosVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 278
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object QryOrdemGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NR_ORDEM) as MAX_CD'
      'FROM FI_GRUPO_CALCULO'
      'WHERE CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 334
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryCalculoAtuarial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select distinct CD_GRUPO_PARTIC'
      'from  FI_OCOR_CALCULO_ATUARIAL'
      'where CD_PESSOA_ENTID  = :CD_PESSOA_ENTID  and '
      '      CD_PESSOA_PATROC   = :CD_PESSOA_PATROC and '
      '      CD_PLANO                      = :CD_PLANO         and '
      '      CD_VERSAO                   = :CD_VERSAO')
    ValidateWithMask = True
    Left = 245
    Top = 91
    ParamData = <
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
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
end
