inherited RelEventoCaixaCota: TRelEventoCaixaCota
  Caption = 'RelEventoCaixaCota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplReport: TppBDEPipeline
    object pplReportppField1: TppField
      FieldAlias = 'IDEVENTOCAIXACOTA'
      FieldName = 'IDEVENTOCAIXACOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplReportppField2: TppField
      FieldAlias = 'DESCCAIXACOTA'
      FieldName = 'DESCCAIXACOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplReportppField3: TppField
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplReportppField4: TppField
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplReportppField5: TppField
      FieldAlias = 'IDTIPODESPINVEST'
      FieldName = 'IDTIPODESPINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplReportppField6: TppField
      FieldAlias = 'STACAIXA'
      FieldName = 'STACAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplReportppField7: TppField
      FieldAlias = 'STACOTA'
      FieldName = 'STACOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplReportppField8: TppField
      FieldAlias = 'STAATIVOPASSIVO'
      FieldName = 'STAATIVOPASSIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplReportppField9: TppField
      FieldAlias = 'STACOTIZA'
      FieldName = 'STACOTIZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplReportppField10: TppField
      FieldAlias = 'STASOMADIMINUI'
      FieldName = 'STASOMADIMINUI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplReportppField11: TppField
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplReportppField12: TppField
      FieldAlias = 'STACPMF'
      FieldName = 'STACPMF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplReportppField13: TppField
      FieldAlias = 'FLGMANUALAUT'
      FieldName = 'FLGMANUALAUT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplReportppField14: TppField
      FieldAlias = 'STATUSCX'
      FieldName = 'STATUSCX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplReportppField15: TppField
      FieldAlias = 'STATUSCT'
      FieldName = 'STATUSCT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplReportppField16: TppField
      FieldAlias = 'APURACAO'
      FieldName = 'APURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplReportppField17: TppField
      FieldAlias = 'DESCTIPOINVEST'
      FieldName = 'DESCTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplReportppField18: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplReportppField19: TppField
      FieldAlias = 'DESCTIPODESPINV'
      FieldName = 'DESCTIPODESPINV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplReportppField20: TppField
      FieldAlias = 'NOMEREGRA'
      FieldName = 'NOMEREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplReportppField21: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  inherited spl: TCMSqlParams
    SQL.Strings = (
      
        'SELECT E.IDEVENTOCAIXACOTA, E.DESCCAIXACOTA, E.IDTIPOINVEST, E.I' +
        'DTIPOOPERACAO,'
      
        '       E.IDTIPODESPINVEST, E.STACAIXA, E.STACOTA, E.STAATIVOPASS' +
        'IVO, E.STACOTIZA,'
      '       E.STASOMADIMINUI, E.IDREGRA, E.STACPMF, E.FLGMANUALAUT,'
      ''
      
        '       DECODE(E.STACAIXA,'#39'S'#39', DECODE(E.STASOMADIMINUI,'#39'S'#39','#39'Soma'#39 +
        ','#39'Diminui'#39'),'#39#39') AS STATUSCX,'
      
        '       DECODE(E.STACOTA,'#39'S'#39', DECODE(E.STAATIVOPASSIVO,'#39'A'#39','#39'Ativo' +
        #39','#39'Passivo'#39'),'#39#39') AS STATUSCT,'
      ''
      
        '       DECODE(E.FLGMANUALAUT,'#39'M'#39','#39'Manual'#39','#39'Automático'#39') AS APURA' +
        'CAO,'
      
        '       TI.DESCTIPOINVEST, TP.DESCTIPOOPERACAO, TD.DESCTIPODESPIN' +
        'V, R.NOMEREGRA,'
      
        '       DECODE(TI.DESCTIPOINVEST||TP.DESCTIPOOPERACAO||TD.DESCTIP' +
        'ODESPINV,NULL, '#39' '#39','
      
        '       '#39'Tipo de Investimento : '#39'||TI.DESCTIPOINVEST||'#39' -  Tipo d' +
        'e Operação : '#39'||TP.DESCTIPOOPERACAO||'#39' -  Despesa : '#39'||TD.DESCTI' +
        'PODESPINV )AS TIPO'
      ''
      
        'FROM  EVENTOCAIXACOTA E, TIPOINVEST TI, TIPOOPERACAO TP, TIPODES' +
        'PINVEST TD, REGRA R'
      'WHERE '
      '     E.IDTIPOINVEST     = TI.IDTIPOINVEST(+)'
      'AND  E.IDTIPOINVEST     = TP.IDTIPOINVEST(+)'
      'AND  E.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+) '
      'AND  E.IDTIPODESPINVEST = TD.IDTIPODESPINVEST(+)'
      'AND  E.IDREGRA          = R.IDREGRA(+) '
      'ORDER BY E.DESCCAIXACOTA'
      ' '
      ''
      ' '
      ' '
      ' ')
  end
  inherited cds: TCMClientDataSet
    Active = False
  end
  inherited rptReport: TppReport
    DataPipelineName = 'pplReport'
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 29104
      inherited LblEmpresa: TppLabel [0]
      end
      inherited lblPeriodo: TppLabel [1]
        Visible = False
      end
      inherited lblNomeRelatorio: TppLabel [2]
        Caption = 'Consulta de Eventos de Caixa / Cota'
        mmWidth = 60960
      end
      inherited ppDBImage: TppDBImage [3]
        DataPipelineName = 'ppLogoTipo'
      end
      inherited shpCabecalho: TppShape
        mmHeight = 9790
        mmTop = 19314
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Evento Caixa / Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 23813
        mmWidth = 32851
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Apuração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 79640
        mmTop = 23813
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 23813
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 133086
        mmTop = 23813
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Ativo / Passivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 142346
        mmTop = 19579
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Cotiza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161132
        mmTop = 23813
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Somar / Diminuir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 112448
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 23813
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Regra de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 186002
        mmTop = 23813
        mmWidth = 28575
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 10583
      inherited shpDetalhe: TppShape
        Brush.Color = 14935011
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCAIXACOTA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 0
        mmWidth = 75406
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 6350
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'APURACAO'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 79640
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'STACAIXA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'STACOTA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'STAATIVOPASSIVO'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'STACOTIZA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 161132
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'STASOMADIMINUI'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 4022
        mmLeft = 112448
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'STACPMF'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 173567
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'NOMEREGRA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 186002
        mmTop = 0
        mmWidth = 97102
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TIPO'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 4763
        mmWidth = 280194
        BandType = 4
      end
    end
  end
end
