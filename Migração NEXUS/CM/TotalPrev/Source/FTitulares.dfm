inherited FrmTitulares: TFrmTitulares
  Left = 143
  Top = 158
  BorderIcons = []
  Caption = 'Titular(es)'
  ClientWidth = 590
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 590
    object dbGridTitulares: TwwDBGrid
      Left = 5
      Top = 5
      Width = 580
      Height = 224
      Selected.Strings = (
        'MATRICULA'#9'13'#9'Matrícula'
        'NOME'#9'45'#9'Nome do Titular'#9'F'
        'NUMDOCUMENTO'#9'18'#9'CPF')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTitulares
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      OnDblClick = dbGridTitularesDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 590
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryTitulares: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.IDTITULAR,'
      '  D.IDPESSOA,'
      '  0 AS IDRESPONSAVEL,'
      '  P.NOME,'
      '  P.NUMDOCUMENTO,'
      '  EL.MATRICULA'
      'FROM DEPENTIT D, PESSOA P, ELEGPATRO EL'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND D.IDTITULAR = EL.IDPESSOA'
      '  AND P.IDPESSOA = D.IDTITULAR'
      '  AND D.IDTITULAR <> D.IDPESSOA'
      ''
      'UNION'
      ''
      'SELECT'
      '  R.IDTITULAR,'
      '  R.IDPESSOA,'
      '  R.IDFAVORECIDO AS IDRESPONSAVEL,'
      '  P.NOME,'
      '  P.NUMDOCUMENTO,'
      '  EL.MATRICULA'
      'FROM RUBRICAINDIV R, PESSOA P, ELEGPATRO EL'
      'WHERE R.FLGPENSAOALIM = 1'
      '  AND R.IDFAVORECIDO = :IDPESSOA'
      '  AND R.IDTITULAR = EL.IDPESSOA'
      '  AND P.IDPESSOA = R.IDTITULAR'
      '  AND R.IDFAVORECIDO <> R.IDTITULAR'
      '  AND R.IDFAVORECIDO NOT IN (SELECT'
      #9#9#9#9'    D.IDPESSOA '
      #9#9#9'  '#9'  FROM DEPENTIT D'
      
        '                             WHERE D.IDPESSOA = :IDPESSOA AND D.' +
        'IDPESSOA <> D.IDTITULAR)'
      'UNION'
      ''
      'SELECT'
      '  B.IDTITULAR,'
      '  B.IDPESSOA,'
      '  B.IDRESPONSAVEL,'
      '  P.NOME,'
      '  P.NUMDOCUMENTO,'
      '  EL.MATRICULA'
      'FROM BFCIARIOTITPLAN B, PESSOA P, ELEGPATRO EL'
      'WHERE B.IDPESSOA = :IDPESSOA'
      '  AND B.IDTITULAR = EL.IDPESSOA'
      '  AND P.IDPESSOA = B.IDTITULAR'
      '  AND B.IDPESSOA <> B.IDTITULAR'
      '  AND B.IDPESSOA NOT IN (SELECT'
      #9#9#9'       D.IDPESSOA'
      #9#9#9'     FROM DEPENTIT D'
      
        '                          WHERE D.IDPESSOA = :IDPESSOA AND D.IDP' +
        'ESSOA <> D.IDTITULAR)'
      ''
      'UNION'
      ''
      'SELECT'
      '  B.IDTITULAR,'
      '  B.IDPESSOA,'
      '  B.IDRESPONSAVEL,'
      '  P.NOME,'
      '  P.NUMDOCUMENTO,'
      '  EL.MATRICULA'
      'FROM BFCIARIOTITPLAN B, PESSOA P, ELEGPATRO EL'
      'WHERE'
      '  B.IDRESPONSAVEL = :IDPESSOA'
      '  AND B.IDTITULAR = P.IDPESSOA'
      '  AND B.IDTITULAR = EL.IDPESSOA'
      '  AND B.IDRESPONSAVEL <> B.IDTITULAR'
      '  AND B.IDRESPONSAVEL NOT IN (SELECT'
      #9#9#9#9'    D.IDPESSOA'
      #9#9#9'  '#9'  FROM DEPENTIT D'
      
        '                             WHERE D.IDPESSOA = :IDPESSOA AND D.' +
        'IDPESSOA <> D.IDTITULAR)')
    ValidateWithMask = True
    Left = 408
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryTitularesMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTitularesNOME: TStringField
      DisplayLabel = 'Nome do Titular'
      DisplayWidth = 45
      FieldName = 'NOME'
      Size = 60
    end
    object qryTitularesNUMDOCUMENTO: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryTitularesIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryTitularesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryTitularesIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
  end
  object dsTitulares: TwwDataSource
    DataSet = qryTitulares
    Left = 336
    Top = 32
  end
end
