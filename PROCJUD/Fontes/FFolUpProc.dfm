inherited frmFolUpProc: TfrmFolUpProc
  Left = 170
  Top = 155
  Caption = 'FollowUp de Processos'
  ClientHeight = 377
  ClientWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 338
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 608
  end
  object pnSelecao: TPanel [2]
    Left = 0
    Top = 0
    Width = 608
    Height = 338
    Align = alClient
    TabOrder = 2
    object pnResult: TPanel
      Left = 1
      Top = 1
      Width = 606
      Height = 336
      Align = alClient
      TabOrder = 0
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 604
        Height = 334
        Selected.Strings = (
          'NUMPROCTRAB'#9'7'#9'Processo'
          'DATAREALOCOR'#9'15'#9'Data Prevista (Real)'
          'NUMSEQ'#9'5'#9'Etapa'
          'DESCRICAO'#9'43'#9'Tipo de Etapa (Andamento)'
          'ASSUNTO'#9'40'#9'Assunto (Resumido)'
          'NOME'#9'60'#9'Reclamante')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsEtp
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object dsEtp: TwwDataSource
    DataSet = qryEtapa
    Left = 220
    Top = 73
  end
  object qryEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    OnFilterRecord = qryEtapaFilterRecord
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
      'WHERE ( ETAPAPROCTRAB.NUMPROCTRAB = PROCESSOTRAB.NUMPROCTRAB )'
      '  AND'
      ' ( PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA ) '
      ' AND'
      ' ( ETAPAPROCTRAB.CODTIPORECURSO = TIPORECTRAB.CODTIPORECURSO )'
      'ORDER BY ETAPAPROCTRAB.NUMPROCTRAB,'
      '                   ETAPAPROCTRAB.DATAREALOCOR')
    ValidateWithMask = True
    Left = 319
    Top = 70
  end
end
