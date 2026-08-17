object frameFollowUp: TframeFollowUp
  Left = 0
  Top = 0
  Width = 443
  Height = 277
  Align = alClient
  TabOrder = 0
  object dbgdFollowUp: TwwDBGrid
    Left = 0
    Top = 0
    Width = 443
    Height = 277
    Selected.Strings = (
      'NUMPROCTRAB'#9'7'#9'Processo'
      'DATAREALOCOR'#9'15'#9'Data Prevista (Real)'
      'NUMSEQ'#9'5'#9'Etapa'
      'DESCRICAO'#9'43'#9'Tipo de Etapa (Andamento)'
      'ASSUNTO'#9'40'#9'Assunto (Resumido)'
      'NOME'#9'60'#9'Contra Parte'#9'F')
    MemoAttributes = []
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = dsFollowUp
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    IndicatorColor = icBlack
  end
  object dsFollowUp: TwwDataSource
    DataSet = CdsFollowUp
    Left = 84
    Top = 43
  end
  object CdsFollowUp: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    OnFilterRecord = CdsFollowUpFilterRecord
    Left = 148
    Top = 43
  end
  object sqlFollowUp: TCMSqlParams
    SQL.Strings = (
      'SELECT ETAPAPROCTRAB.NUMPROCTRAB ,'
      ' ETAPAPROCTRAB.NUMSEQ ,'
      ' ETAPAPROCTRAB.DATAPREVOCORR ,'
      ' ETAPAPROCTRAB.DATAREALOCOR ,'
      ' ETAPAPROCTRAB.ASSUNTO ,'
      ' TIPORECTRAB.DESCRICAO ,'
      ' PROCESSOTRAB.IDRECLAMANTE ,'
      ' PESSOA.NOME'
      'FROM ETAPAPROCTRAB , PROCESSOTRAB ,'
      ' PESSOA, TIPORECTRAB '
      'WHERE'
      '  ETAPAPROCTRAB.NUMPROCTRAB = -1 and'
      ' ( ETAPAPROCTRAB.NUMPROCTRAB = PROCESSOTRAB.NUMPROCTRAB )'
      '  AND'
      ' ( PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA ) '
      ' AND'
      ' ( ETAPAPROCTRAB.CODTIPORECURSO = TIPORECTRAB.CODTIPORECURSO )'
      'ORDER BY ETAPAPROCTRAB.NUMPROCTRAB,'
      '                   ETAPAPROCTRAB.DATAREALOCOR')
    ClientDataSet = CdsFollowUp
    Left = 215
    Top = 43
  end
end
