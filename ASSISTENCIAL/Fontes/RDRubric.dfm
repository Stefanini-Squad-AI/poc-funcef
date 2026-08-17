inherited RptDRubric: TRptDRubric
  Left = 323
  Top = 200
  Width = 374
  Height = 194
  Caption = 'RptDRubric'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório de Segurados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Patrocinadora'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Patrocinadora'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 200
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = rpDRubric
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT /*+  INDEX (PESSOA IDXPESSOA)*/'
      '  DEPTO.CODREDUZIDO CODDEPTO,'
      '  CT.CODREDUZIDO,'
      '  '#39'623'#39' AS CODPROVDESC,'
      '  NVL(HS.VALORPROVENTO, HT.VALORESPERADO) AS VALOR,'
      '  0 AS VLRPATRO,'
      '  PP.INSCRICAONUMERO,'
      '  DT.NUMSEQUENCIA,'
      '  UPPER(PD.NOME) DEPENDENTE,'
      '  UPPER(PT.NOME) TITULAR'
      'FROM'
      '  HISTRUBSAL    HS,'
      '  PESSOA        PT,'
      '  PESSOA        PD,'
      '  DEPENTIT      DT,'
      '  HSTCONTRIBASS HT,'
      '  PARTPREVPLAN  PP,'
      '  PROVDESC      PV,'
      '  RUBRICAXPESS  RP,'
      '  CONTRIBASS    CB,'
      '  FUNCIONARIO   FO,'
      '  CENTCUST      CT,'
      ' (SELECT CODREDUZIDO,'
      '         CODCENTROCUSTO'
      '         FROM CENTCUST'
      '         WHERE STATUSGRUPOCDC = '#39'S'#39' AND'
      '               ATIVO = '#39'S'#39') DEPTO'
      'WHERE'
      '-- JOIN PESSOA COM HISTRUBSAL'
      '  (HS.CODPROVDESC = '#39'623'#39')                      AND'
      '  (HS.MES         = :MES1)                      AND'
      '  (HS.MESCOBRANCA = :MES1)                      AND'
      '  (HS.IDPESSJUR         = HS.IDPESSJUR)         AND'
      '  (HS.IDRUBRICA         = HS.IDRUBRICA)         AND'
      '  (HS.IDMOTIVO          = HS.IDMOTIVO)          AND'
      '  (HS.REFERENCIA        = HS.REFERENCIA)        AND'
      '  (HS.IDPESSOA          = PT.IDPESSOA)          AND'
      '  (HS.SEQRUBRICA        = HS.SEQRUBRICA)        AND'
      ''
      ''
      '-- JOIN DEPENTIT COM PESSOA'
      '  (DT.IDTITULAR         = PT.IDPESSOA)          AND'
      '  (DT.IDPESSOA          = PD.IDPESSOA)          AND'
      '  (DT.IDDEPENDENCIA     = DT.IDDEPENDENCIA)     AND'
      '-- JOIN HSTCONTRIBASS COM DEPENTIT'
      '  (HT.MES               = :MES2)                AND'
      '  (HT.SEQPROPOSTA       = HT.SEQPROPOSTA)       AND'
      '  (HT.IDMOTIVO          = HT.IDMOTIVO)          AND'
      '  (HT.IDPLANASS IN (3,11,13,14)) AND'
      '  (HT.MESCOBRANCA       = :MES1)                AND'
      '  (HT.IDPLANOPREV       = HT.IDPLANOPREV)       AND'
      '  (HT.IDPESSJUR         = HT.IDPESSJUR)         AND'
      '  (HT.IDCONTASS         = HT.IDCONTASS)         AND'
      '  (HT.IDTITULAR         = DT.IDTITULAR)         AND'
      '  (HT.IDDEPENDENTE      = DT.IDPESSOA)          AND'
      '  (HT.IDPAGADOR NOT IN (1,99))                  AND'
      '-- JOIN PARTPREVPLAN COM DEPENTIT'
      '  (PP.IDSITPART IN (4,13))                      AND'
      '  (PP.IDPESSJUR         = PP.IDPESSJUR)         AND'
      '  (PP.IDPESSOA          = HT.IDTITULAR)         AND'
      '  (PP.IDPLANOPREV       = PP.IDPLANOPREV)       AND'
      '  (PP.IDSITPART         = PP.IDSITPART)         AND'
      '  (PP.SEQPROPOSTA       = PP.SEQPROPOSTA)       AND'
      '-- JOIN CONTRIBASS COM HSTCONTRIBASS'
      '  (CB.IDPLANASS    = HT.IDPLANASS)      AND'
      '  (CB.IDCONTASS    = HT.IDCONTASS)      AND'
      '  (CB.IDREGRA      = HT.IDREGRA)        AND'
      '-- JOIN PROVDESC COM CONTRIBASS'
      '  (PV.IDPROVENTO   = CB.IDPROVENTO)     AND'
      '-- JOIN RUBRICAXPESS COM CONTRIBASS/HSTCONTRIBASS'
      '  (RP.IDRUBRICA    = CB.IDPROVENTO)     AND'
      '  (RP.IDPESSOA     = HT.IDPESSJUR)      AND'
      '-- JOIN FUNCIONARIO COM PESSOA'
      '  (FO.IDPESSOA          = PT.IDPESSOA)          AND'
      '-- JOIN CENTCUST COM FUNCIONARIO'
      '  (CT.CODCENTROCUSTO    = FO.CODCENTROCUSTO)    AND'
      '  (CT.IDEMPRESA         = FO.IDEMPRESA)         AND'
      '  (CT.IDUSUARIOINCLUSAO = CT.IDUSUARIOINCLUSAO) AND'
      '-- JOIN CENTCUST COM DEPTO'
      '  SUBSTR(CT.CODCENTROCUSTO,1,4) = RTRIM(DEPTO.CODCENTROCUSTO)'
      '--'
      '  AND UPPER(PD.NOME) = UPPER(PT.NOME)'
      '  AND INSCRICAONUMERO <> '#39'412139'#39
      ''
      
        '--ORDER BY CODDEPTO,CODREDUZIDO,TITULAR,NUMSEQUENCIA, CODPROVDES' +
        'C'
      ''
      'UNION'
      ''
      'SELECT /*+  INDEX (PESSOA IDXPESSOA)*/'
      '  DEPTO.CODREDUZIDO CODDEPTO,'
      '  CT.CODREDUZIDO,'
      '  RP.CODPROVDESC,'
      '  0 AS VALOR,'
      
        '  DECODE(QRYPATRO.VLRPATRO,NULL,0,QRYPATRO.VLRPATRO) AS VLRPATRO' +
        ','
      '  PP.INSCRICAONUMERO,'
      '  DT.NUMSEQUENCIA,'
      '  UPPER(PD.NOME) DEPENDENTE,'
      '  UPPER(PT.NOME) TITULAR'
      ''
      'FROM'
      '--  HISTRUBSAL    HS,'
      '  PESSOA        PT,'
      '  PESSOA        PD,'
      '  DEPENTIT      DT,'
      '  HSTCONTRIBASS HT,'
      '  PARTPREVPLAN  PP,'
      ' (SELECT VALORESPERADO AS VLRPATRO,'
      '         IDPLANOPREV,'
      '         IDPESSJUR,'
      '         IDTITULAR,'
      '         IDDEPENDENTE,'
      '         IDPLANASS,'
      '         MES,'
      '         MESCOBRANCA'
      '         FROM HSTCONTRIBASS'
      '         WHERE IDPAGADOR = 1'
      '         AND MESCOBRANCA = :MES1)     QRYPATRO,'
      '  PROVDESC      PV,'
      '  RUBRICAXPESS  RP,'
      '  CONTRIBASS    CB,'
      '  FUNCIONARIO   FO,'
      '  CENTCUST      CT,'
      ' (SELECT CODREDUZIDO,'
      '         CODCENTROCUSTO'
      '         FROM CENTCUST'
      '         WHERE STATUSGRUPOCDC = '#39'S'#39' AND'
      '               ATIVO = '#39'S'#39') DEPTO'
      'WHERE'
      ''
      '-- JOIN DEPENTIT COM PESSOA'
      '  (DT.IDTITULAR         = PT.IDPESSOA)          AND'
      '  (DT.IDPESSOA          = PD.IDPESSOA)          AND'
      '  (DT.IDDEPENDENCIA     = DT.IDDEPENDENCIA)     AND'
      ''
      '-- JOIN HSTCONTRIBASS COM DEPENTIT'
      '  (HT.MES               = :MES2)                AND'
      '  (HT.SEQPROPOSTA       = HT.SEQPROPOSTA)       AND'
      '  (HT.IDMOTIVO          = HT.IDMOTIVO)          AND'
      '  (HT.IDPLANASS IN (3,11,13,14)) AND'
      '  (HT.MESCOBRANCA       = :MES1)                AND'
      '  (HT.IDPLANOPREV       = HT.IDPLANOPREV)       AND'
      '  (HT.IDPESSJUR         = HT.IDPESSJUR)         AND'
      '  (HT.IDCONTASS         = HT.IDCONTASS)         AND'
      '  (HT.IDTITULAR         = DT.IDTITULAR)         AND'
      '  (HT.IDDEPENDENTE      = DT.IDPESSOA)          AND'
      '  (HT.IDPAGADOR NOT IN (1,99))                  AND'
      ''
      '-- JOIN PARTPREVPLAN COM DEPENTIT'
      '  (PP.IDSITPART IN (4,13))                      AND'
      '  (PP.IDPESSJUR         = PP.IDPESSJUR)         AND'
      '  (PP.IDPESSOA          = HT.IDTITULAR)         AND'
      '  (PP.IDPLANOPREV       = PP.IDPLANOPREV)       AND'
      '  (PP.IDSITPART         = PP.IDSITPART)         AND'
      '  (PP.SEQPROPOSTA       = PP.SEQPROPOSTA)       AND'
      ''
      '-- JOIN HSTCONTRIBASS COM QRYPATRO'
      '  (HT.IDTITULAR    =  QRYPATRO.IDTITULAR(+))    AND'
      '  (HT.IDPESSJUR    =  QRYPATRO.IDPESSJUR(+))    AND'
      '  (HT.IDDEPENDENTE =  QRYPATRO.IDDEPENDENTE(+)) AND'
      '  (HT.IDPLANOPREV  =  QRYPATRO.IDPLANOPREV(+))  AND'
      '  (HT.IDPLANASS    =  QRYPATRO.IDPLANASS(+))    AND'
      '  (HT.MES          =  QRYPATRO.MES(+))          AND'
      '  (HT.MESCOBRANCA  =  QRYPATRO.MESCOBRANCA(+))  AND'
      ''
      '-- JOIN CONTRIBASS COM HSTCONTRIBASS'
      '  (CB.IDPLANASS    = HT.IDPLANASS)      AND'
      '  (CB.IDCONTASS    = HT.IDCONTASS)      AND'
      '  (CB.IDREGRA      = HT.IDREGRA)        AND'
      ''
      '-- JOIN PROVDESC COM CONTRIBASS'
      '  (PV.IDPROVENTO   = CB.IDPROVENTO)     AND'
      ''
      '-- JOIN RUBRICAXPESS COM CONTRIBASS/HSTCONTRIBASS'
      '  (RP.IDRUBRICA    = CB.IDPROVENTO)     AND'
      '  (RP.IDPESSOA     = HT.IDPESSJUR)      AND'
      ''
      '-- JOIN FUNCIONARIO COM PESSOA'
      '  (FO.IDPESSOA          = PT.IDPESSOA)          AND'
      ''
      '-- JOIN CENTCUST COM FUNCIONARIO'
      '  (CT.CODCENTROCUSTO    = FO.CODCENTROCUSTO)    AND'
      '  (CT.IDEMPRESA         = FO.IDEMPRESA)         AND'
      '  (CT.IDUSUARIOINCLUSAO = CT.IDUSUARIOINCLUSAO) AND'
      ''
      '-- JOIN CENTCUST COM DEPTO'
      
        '  SUBSTR(CT.CODCENTROCUSTO,1,4) = RTRIM(DEPTO.CODCENTROCUSTO) AN' +
        'D'
      '--'
      
        '  QRYPATRO.VLRPATRO > 0                                       AN' +
        'D'
      '  INSCRICAONUMERO <> 412139'
      ''
      'ORDER BY CODDEPTO,CODREDUZIDO,TITULAR,NUMSEQUENCIA, CODPROVDESC'
      ' '
      '')
    ValidateWithMask = True
    Left = 11
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MES1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES1'
        ParamType = ptUnknown
      end>
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 305
    Top = 65
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 209
    Top = 120
  end
  object rpDRubric: TppReport
    AutoStop = False
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    ModalPreview = False
    Left = 307
    Top = 7
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48948
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        Caption = 'RELATORIO DEMONSTRATIVO DE RUBRICAS - ASSISTENCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 34660
        mmTop = 28575
        mmWidth = 128059
        BandType = 0
      end
      object rpRelRubricaAssLabel2: TppLabel
        UserName = 'rpRelRubricaAssLabel2'
        Caption = 'MÊS:  Maio/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 82021
        mmTop = 34660
        mmWidth = 33073
        BandType = 0
      end
      object rpRelRubricaAssLine1: TppLine
        UserName = 'rpRelRubricaAssLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 41275
        mmWidth = 197300
        BandType = 0
      end
      object rpRelRubricaAssLine2: TppLine
        UserName = 'rpRelRubricaAssLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 41010
        mmWidth = 197300
        BandType = 0
      end
      object rpRelRubricaAssLabel1: TppLabel
        UserName = 'rpRelRubricaAssLabel1'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 42863
        mmWidth = 11113
        BandType = 0
      end
      object rpRelRubricaAssLabel3: TppLabel
        UserName = 'rpRelRubricaAssLabel3'
        Caption = 'Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21960
        mmTop = 42863
        mmWidth = 8467
        BandType = 0
      end
      object rpRelRubricaAssLabel4: TppLabel
        UserName = 'rpRelRubricaAssLabel4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 42863
        mmWidth = 7144
        BandType = 0
      end
      object rpRelRubricaAssLabel5: TppLabel
        UserName = 'rpRelRubricaAssLabel5'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 42863
        mmWidth = 9790
        BandType = 0
      end
      object rpRelRubricaAssLabel6: TppLabel
        UserName = 'rpRelRubricaAssLabel6'
        Caption = 'Empregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 42863
        mmWidth = 14288
        BandType = 0
      end
      object rpRelRubricaAssLabel7: TppLabel
        UserName = 'rpRelRubricaAssLabel7'
        Caption = 'Saúde / Dental'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 42863
        mmWidth = 18521
        BandType = 0
      end
      object rpRelRubricaAssLine3: TppLine
        UserName = 'rpRelRubricaAssLine3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 47096
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'DBImage7'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpRelRubricaAssDBText1: TppDBText
        UserName = 'rpRelRubricaAssDBText1'
        DataField = 'INSCRICAONUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object rpRelRubricaAssDBText2: TppDBText
        UserName = 'rpRelRubricaAssDBText2'
        DataField = 'NUMSEQUENCIA'
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object rpRelRubricaAssDBText3: TppDBText
        UserName = 'rpRelRubricaAssDBText3'
        DataField = 'DEPENDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 0
        mmWidth = 83873
        BandType = 4
      end
      object rpRelRubricaAssDBText4: TppDBText
        UserName = 'rpRelRubricaAssDBText4'
        DataField = 'CODPROVDESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object rpRelRubricaAssDBText5: TppDBText
        UserName = 'rpRelRubricaAssDBText5'
        DataField = 'VALOR'
        DisplayFormat = 'R$ ###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpRelRubricaAssDBText6: TppDBText
        UserName = 'rpRelRubricaAssDBText6'
        DataField = 'VLRPATRO'
        DisplayFormat = 'R$ ###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object rpRelRubricaAssLabel20: TppLabel
        UserName = 'rpRelRubricaAssLabel20'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 198173
        BandType = 8
      end
      object ppCalc37: TppSystemVariable
        UserName = 'Calc37'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRelRubricaAssSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpRelRubricaAssGroup5: TppGroup
      BreakType = btCustomField
      UserName = 'rpRelRubricaAssGroup5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRubricaAssGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelRubricaAssGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 27252
        mmPrintPosition = 0
        object rpRelRubricaAssDBCalc3: TppDBCalc
          UserName = 'rpRelRubricaAssDBCalc3'
          DataField = 'VALOR'
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRelRubricaAssGroup5
          Transparent = True
          mmHeight = 3704
          mmLeft = 147638
          mmTop = 1588
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssDBCalc4: TppDBCalc
          UserName = 'rpRelRubricaAssDBCalc4'
          DataField = 'VLRPATRO'
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRelRubricaAssGroup5
          Transparent = True
          mmHeight = 3704
          mmLeft = 171980
          mmTop = 1588
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel11: TppLabel
          UserName = 'rpRelRubricaAssLabel11'
          Caption = 'Total Geral de Empregados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1588
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel12: TppLabel
          UserName = 'rpRelRubricaAssLabel12'
          Caption = 'Total Geral de Dependentes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 7144
          mmWidth = 41275
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLine6: TppLine
          UserName = 'rpRelRubricaAssLine6'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 142875
          mmTop = 6085
          mmWidth = 49477
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLine7: TppLine
          UserName = 'rpRelRubricaAssLine7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel13: TppLabel
          UserName = 'rpRelRubricaAssLabel13'
          Caption = 'Empregados Saúde:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 16933
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel14: TppLabel
          UserName = 'rpRelRubricaAssLabel14'
          Caption = 'Empregados Dental:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 23283
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel15: TppLabel
          UserName = 'rpRelRubricaAssLabel15'
          Caption = 'Dependentes Saúde:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 16933
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel16: TppLabel
          UserName = 'rpRelRubricaAssLabel16'
          Caption = 'Dependentes Dental:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 23283
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel17: TppLabel
          UserName = 'rpRelRubricaAssLabel17'
          Caption = 'Total Saúde:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 131234
          mmTop = 16933
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssLabel18: TppLabel
          UserName = 'rpRelRubricaAssLabel18'
          Caption = 'Total Dental:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 131234
          mmTop = 23283
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc4: TppVariable
          UserName = 'rpRelRubricaAssCalc4'
          CalcOrder = 0
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 42333
          mmTop = 1588
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc5: TppVariable
          UserName = 'rpRelRubricaAssCalc5'
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 167217
          mmTop = 7144
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc6: TppVariable
          UserName = 'rpRelRubricaAssCalc6'
          CalcOrder = 2
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 42333
          mmTop = 6879
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc7: TppVariable
          UserName = 'rpRelRubricaAssCalc7'
          CalcOrder = 3
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 24077
          mmTop = 16933
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc8: TppVariable
          UserName = 'rpRelRubricaAssCalc8'
          CalcOrder = 4
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 24077
          mmTop = 23283
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc9: TppVariable
          UserName = 'rpRelRubricaAssCalc9'
          CalcOrder = 5
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 87577
          mmTop = 16933
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc10: TppVariable
          UserName = 'rpRelRubricaAssCalc101'
          CalcOrder = 6
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 84402
          mmTop = 23283
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc11: TppVariable
          UserName = 'rpRelRubricaAssCalc11'
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153723
          mmTop = 16933
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object rpRelRubricaAssCalc12: TppVariable
          UserName = 'rpRelRubricaAssCalc12'
          CalcOrder = 8
          DataType = dtDouble
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153723
          mmTop = 23283
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRelRubricaAssGroup1: TppGroup
      BreakName = 'CODDEPTO'
      UserName = 'rpRelRubricaAssGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRubricaAssGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelRubricaAssGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpRelRubricaAssGroup2: TppGroup
      BreakName = 'CODREDUZIDO'
      NewPage = True
      UserName = 'rpRelRubricaAssGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRubricaAssGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object rpRelRubricaAssLabel8: TppLabel
          UserName = 'rpRelRubricaAssLabel8'
          Caption = 'Lotação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 264
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRelRubricaAssGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object rpRelRubricaAssDBCalc1: TppDBCalc
          UserName = 'rpRelRubricaAssDBCalc1'
          DataField = 'VALOR'
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRelRubricaAssGroup2
          Transparent = True
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 794
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object rpRelRubricaAssDBCalc2: TppDBCalc
          UserName = 'rpRelRubricaAssDBCalc2'
          DataField = 'VLRPATRO'
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRelRubricaAssGroup2
          Transparent = True
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 794
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpRelRubricaAssLabel9: TppLabel
          UserName = 'rpRelRubricaAssLabel9'
          Caption = 'Total de Empregados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 794
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object rpRelRubricaAssLabel10: TppLabel
          UserName = 'rpRelRubricaAssLabel10'
          Caption = 'Total de Dependentes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5821
          mmWidth = 32808
          BandType = 5
          GroupNo = 1
        end
        object rpRelRubricaAssLine4: TppLine
          UserName = 'rpRelRubricaAssLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 150284
          mmTop = 5292
          mmWidth = 42598
          BandType = 5
          GroupNo = 1
        end
        object rpRelRubricaAssCalc1: TppVariable
          UserName = 'rpRelRubricaAssCalc1'
          CalcOrder = 0
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 794
          mmWidth = 30427
          BandType = 5
          GroupNo = 2
        end
        object rpRelRubricaAssCalc2: TppVariable
          UserName = 'rpRelRubricaAssCalc2'
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 170921
          mmTop = 5821
          mmWidth = 30427
          BandType = 5
          GroupNo = 2
        end
        object rpRelRubricaAssCalc3: TppVariable
          UserName = 'rpRelRubricaAssCalc3'
          CalcOrder = 2
          DataType = dtInteger
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 6350
          mmWidth = 30427
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object rpRelRubricaAssGroup3: TppGroup
      BreakName = 'TITULAR'
      UserName = 'rpRelRubricaAssGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRubricaAssGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelRubricaAssGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
        object rpRelRubricaAssLine5: TppLine
          UserName = 'rpRelRubricaAssLine5'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 2646
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object rpRelRubricaAssGroup4: TppGroup
      BreakName = 'DEPENDENTE'
      UserName = 'rpRelRubricaAssGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRubricaAssGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelRubricaAssGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
