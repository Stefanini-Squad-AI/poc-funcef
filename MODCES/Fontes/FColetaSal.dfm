inherited frmColetaSal: TfrmColetaSal
  Left = 122
  Top = 138
  Caption = 'Coleta de Dados para Pesquisa Salarial'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lstSalReal: TListBox [2]
    Left = 555
    Top = 183
    Width = 40
    Height = 30
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object lstSalNom: TListBox [3]
    Left = 339
    Top = 186
    Width = 40
    Height = 30
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object lstQtdeSal: TListBox [4]
    Left = 339
    Top = 231
    Width = 40
    Height = 30
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object ds2: TwwDataSource
    DataSet = tblHstben
    Left = 470
    Top = 72
  end
  object tblHstben: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,'
      '       RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,'
      '       RI.VALORRUBRICA, RI.IDRUBRICA'
      'FROM   RUBRICAINDIV RI, PROVDESC PD'
      'WHERE  RI.IDPESSOA = :IdPessoa'
      'AND    PD.FLGCONSTAFOLHA = 0'
      'AND    PD.IDBENEFSALAR IS NOT NULL'
      'AND    RI.IDRUBRICA = PD.IDPROVENTO'
      'UNION'
      'SELECT PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,'
      
        '       0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACA' +
        'LCULO,'
      '       H.VALORPROVENTO AS VALORRUBRICA, H.IDRUBRICA'
      'FROM   HISTRUBSAL H, PROVDESC PD'
      'WHERE  H.IDPESSOA = :IdPessoa'
      
        'AND    H.MES = (select max(h.mes) from histrubsal h, provdesc pd' +
        ', paramrh p'
      '                where h.idmotivo = p.idmotivo'
      '                and   h.idrubrica = pd.idprovento'
      '                and   pd.idbenefsalar is not null)'
      'AND    PD.FLGCONSTAFOLHA = 1'
      'AND    PD.IDBENEFSALAR IS NOT NULL'
      'AND    H.IDRUBRICA = PD.IDPROVENTO'
      'ORDER BY 2 DESC'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 521
    Top = 50
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object tblHstbenDESCRICAO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'PROVDESC.DESCRICAO'
      Size = 130
    end
    object tblHstbenANOMESINICIO: TStringField
      DisplayLabel = 'A Partir de'
      DisplayWidth = 7
      FieldName = 'ANOMESINICIO'
      Origin = 'RUBRICAINDIV.ANOMESINICIO'
      Size = 7
    end
    object tblHstbenPARCELAS: TFloatField
      DisplayLabel = 'Parcelas'
      DisplayWidth = 10
      FieldName = 'PARCELAS'
      Origin = 'RUBRICAINDIV.PARCELAS'
    end
    object tblHstbenNUMOCORRENCIAS: TFloatField
      DisplayLabel = 'Ocorridas'
      DisplayWidth = 10
      FieldName = 'NUMOCORRENCIAS'
      Origin = 'RUBRICAINDIV.NUMOCORRENCIAS'
    end
    object tblHstbenVALORC: TFloatField
      DisplayLabel = 'Valor Mensal'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'VALORC'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object tblHstbenFLGPERMANENTE: TFloatField
      DisplayLabel = 'Permanente?'
      DisplayWidth = 10
      FieldName = 'FLGPERMANENTE'
      Origin = 'RUBRICAINDIV.FLGPERMANENTE'
    end
    object tblHstbenIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'RUBRICAINDIV.IDREGRACALCULO'
    end
    object tblHstbenVALORRUBRICA: TFloatField
      FieldName = 'VALORRUBRICA'
      Origin = 'RUBRICAINDIV.VALORRUBRICA'
    end
    object tblHstbenIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
  end
end
