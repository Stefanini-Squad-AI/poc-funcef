inherited frmAgenda: TfrmAgenda
  Left = 30
  Top = 175
  Caption = 'Sua Agenda'
  ClientHeight = 329
  ClientWidth = 733
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 290
    object dbGrd: TwwDBGrid
      Left = 5
      Top = 5
      Width = 723
      Height = 280
      Selected.Strings = (
        'DATAREALOCOR'#9'16'#9'Data e Hora'
        'DESCRICAO'#9'40'#9'Tipo de Etapa'
        'NOME'#9'60'#9'Contra-Parte'
        'PROCJCJNUM'#9'25'#9'Processo'
        'ASSUNTO'#9'40'#9'Assunto'
        'VARA'#9'40'#9'Vara'
        'CIDADE'#9'50'#9'Cidade'
        'UF'#9'3'#9'UF')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds2
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
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
  inherited Dock971: TDock97
    Top = 290
    Width = 733
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = qryEtapa
    Left = 381
    Top = 8
  end
  object qryEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select ET.ASSUNTO, ET.DATAREALOCOR, ET.NUMSEQ, '
      '       ET.OBSERVETAPA, TP.DESCRICAO, PES.NOME, P.PROCJCJNUM,'
      '       VJ.DESCRICAO AS VARA, CID.NOME AS CIDADE, '
      '       ES.CODESTADO AS UF'
      
        'from PESSOA PES, processotrab P, etapaproctrab ET, tiporectrab T' +
        'P, '
      '        CIDADES CID, ESTADO ES, VARAJUSTICA VJ'
      'where ET.CODTIPORECURSO = TP.CODTIPORECURSO'
      'and   ET.NUMPROCTRAB = P.NumProcTrab'
      'and   P.IDADVOGCASA     =  :IdUsuario'
      'and  ET.DATAREALOCOR >= SysDate'
      'and  P.IDRECLAMANTE   = PES.IDPESSOA'
      'and  P.IDVARAJUSTICA   = VJ.IDVARAJUSTICA(+)'
      'and  P.IDCIDADES            = CID.IDCIDADES(+)'
      'and  CID.IDESTADO         = ES.IDESTADO(+)'
      'order by ET.DATAREALOCOR')
    ValidateWithMask = True
    Left = 428
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdUsuario'
        ParamType = ptUnknown
      end>
  end
end
