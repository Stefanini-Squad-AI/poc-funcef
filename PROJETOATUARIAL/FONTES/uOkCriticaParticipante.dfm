inherited frmOkCriticaParticipante: TfrmOkCriticaParticipante
  Left = 45
  Top = 103
  HelpContext = 40157
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Crítica de Participante'
  ClientHeight = 295
  ClientWidth = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 448
    Height = 256
    object RadioGroupTipo: TRadioGroup
      Left = 1
      Top = 1
      Width = 446
      Height = 58
      Align = alTop
      Caption = 'Tipo de Crítica'
      ItemIndex = 0
      Items.Strings = (
        'Mapa de Totais'
        'Demonstrativo Analítico')
      TabOrder = 0
      OnClick = RadioGroupTipoClick
    end
    object CkLstBxGrupos: TCheckListBox
      Left = 1
      Top = 82
      Width = 446
      Height = 173
      Hint = 'Condição de Enquadramento na Crítica'
      Align = alBottom
      IntegralHeight = True
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 256
    Width = 448
    inherited tb97Fundo: TToolbar97
      Left = 179
      DockPos = 179
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 10
      DockPos = 10
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
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
    Left = 195
    Top = 10
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
  object wwQryGrupoCritica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC,'
      '        FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC,'
      '        FI_GRUPO_PARTICIPANTE.DS_CONDICAO_EQUADRAMENTO,'
      '        FI_GRUPO_PARTICIPANTE.DS_SQL_ENQUADRAMENTO'
      '    from  FI_GRUPO_PARTICIPANTE  FI_GRUPO_PARTICIPANTE,'
      '          FI_GRUPO_CRITICA       FI_GRUPO_CRITICA'
      '    where'
      
        '        FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC = FI_GRUPO_CRITICA' +
        '.CD_GRUPO_PARTIC'
      '    and FI_GRUPO_CRITICA.CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '    and FI_GRUPO_CRITICA.CD_PESSOA_ENTID   = :CD_PESSOA_ENTID'
      '    and FI_GRUPO_CRITICA.CD_PLANO          = :CD_PLANO'
      ''
      'order by FI_GRUPO_CRITICA.NR_ORDEM')
    ValidateWithMask = True
    Left = 252
    Top = 10
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
    object wwQryGrupoCriticaCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC'
    end
    object wwQryGrupoCriticaNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
    object wwQryGrupoCriticaDS_SQL_ENQUADRAMENTO: TMemoField
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = 'FI_GRUPO_PARTICIPANTE.DS_SQL_ENQUADRAMENTO'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQryGrupoCriticaDS_CONDICAO_EQUADRAMENTO: TMemoField
      FieldName = 'DS_CONDICAO_EQUADRAMENTO'
      Origin = 'FI_GRUPO_PARTICIPANTE.DS_CONDICAO_EQUADRAMENTO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object FQuery: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 302
    Top = 10
  end
  object qryCriaMapaTotal: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'create table TempTotal ( CD_GRUPO_PARTIC  Integer,'
      '                         NO_GRUPO_PARTIC  Char(60),'
      '                         DS_CONDICAO      Char(200))')
    ValidateWithMask = True
    Left = 280
    Top = 60
  end
  object qryCriaMapaDemonst: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'create table TempDemonst ( CD_GRUPO_PARTIC  Integer,'
      '                           NO_GRUPO_PARTIC  Char(60),'
      '                           NR_MATRICULA     Char(15),'
      '                           NO_PARTICIPANTE  Char(60),'
      '                           DS_VALOR         Char(80))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 310
    Top = 60
  end
  object qryDelMapaTotal: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'drop table TempTotal ')
    ValidateWithMask = True
    Left = 280
    Top = 90
  end
  object qryDelMapaDemonst: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'drop table TempDemonst')
    ValidateWithMask = True
    Left = 310
    Top = 90
  end
  object qryInsMapaTotal: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Insert into TempTotal '
      'values'
      '(:CD_GRUPO_PARTIC, :NO_GRUPO_PARTIC, :DS_CONDICAO)')
    ValidateWithMask = True
    Left = 280
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NO_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DS_CONDICAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsMapaDemonst: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Insert into TempDemonst'
      '(CD_GRUPO_PARTIC, NO_GRUPO_PARTIC, NR_MATRICULA,'
      ' NO_PARTICIPANTE, DS_VALOR)'
      'values'
      '(:CD_GRUPO_PARTIC, :NO_GRUPO_PARTIC, :NR_MATRICULA,'
      ' :NO_PARTICIPANTE, :DS_VALOR)'
      ' ')
    ValidateWithMask = True
    Left = 310
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_GRUPO_PARTIC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NO_PARTICIPANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_VALOR'
        ParamType = ptInput
      end>
  end
  object BdTemporario: TDatabase
    DatabaseName = 'BdTemporario'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 245
    Top = 91
  end
  object QryMapaTotal: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Select * from TempTotal ')
    ValidateWithMask = True
    Left = 280
    Top = 167
  end
  object QryMapaDemonst: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Select * from TempDemonst')
    ValidateWithMask = True
    Left = 310
    Top = 167
  end
end
