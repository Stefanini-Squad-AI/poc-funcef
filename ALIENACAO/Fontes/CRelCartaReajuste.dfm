inherited cfgRelCartaReajuste: TcfgRelCartaReajuste
  Left = 300
  Top = 140
  HelpContext = 1350039
  Caption = 'Emissão de Carta de Reajuste'
  ClientHeight = 305
  ClientWidth = 451
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 272
    object Label2: TLabel
      Left = 16
      Top = 221
      Width = 96
      Height = 13
      Caption = 'Utilizar o Modelo'
    end
    object DBcboModeloCarta: TwwDBLookupCombo
      Left = 16
      Top = 235
      Width = 419
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MODELOCARTA'#9'60'#9'MODELOCARTA')
      LookupTable = qryTemplate
      LookupField = 'IDCARTACOBRANCA'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object memReports: TMemo
      Left = 24
      Top = 264
      Width = 109
      Height = 21
      TabStop = False
      Color = clAqua
      Lines.Strings = (
        'memReports')
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 14
      Width = 419
      Height = 195
      Caption = 'Filtros'
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 70
        Width = 139
        Height = 13
        Caption = 'Condição de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 15
        Top = 122
        Width = 393
        Height = 62
        Caption = 'Reajuste'
        TabOrder = 2
        object lblMesVencimento: TLabel
          Left = 12
          Top = 17
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label9: TLabel
          Left = 324
          Top = 17
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cboMes: TComboBox
          Left = 10
          Top = 31
          Width = 271
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object DBspnAno: TwwDBSpinEdit
          Left = 323
          Top = 31
          Width = 57
          Height = 21
          EditorEnabled = False
          Increment = 1
          MaxValue = 2100
          MinValue = 1900
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      inline molProposta: TmolProposta
        Left = 7
        Top = 16
        Width = 405
        inherited edtNomProp: TEdit
          Width = 241
          TabStop = False
          TabOrder = 1
        end
        inherited btnBuscaProp: TBitBtn
          Left = 352
          TabOrder = 2
          OnClick = molProposta1btnBuscaPropClick
        end
        inherited btnLimpaProp: TBitBtn
          Left = 376
          TabOrder = 3
          OnClick = molPropostabtnLimpaPropClick
        end
        inherited edtNumProp: TEdit
          TabStop = False
          TabOrder = 0
        end
      end
      object dblcCondPag: TCMDBLookupCombo
        Left = 15
        Top = 85
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DSCCOND'#9'34'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
        LookupTable = qryCondPag
        LookupField = 'IDCONDINICIAL'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 279
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
    end
  end
  object pplconsulta: TppBDEPipeline
    DataSource = dsSql
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lconsulta'
    Left = 329
    Top = 2
  end
  object rptImprime: TppReport
    AutoStop = False
    DataPipeline = pplconsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rptImprime'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 361
    Top = 2
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplconsulta'
    object RpImprimeHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dsSql: TwwDataSource
    DataSet = qrySql
    Left = 295
    Top = 2
  end
  object qryTemplate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   FLGTIPOCARTA = '#39'A'#39)
    ValidateWithMask = True
    Left = 366
    Top = 229
    object qryTemplateIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryTemplateMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryTemplateIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryTemplateORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryTemplateFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 241
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qrySql: TwwQuery
    CachedUpdates = True
    OnCalcFields = qrySqlCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       P.RAZAOSOCIAL,'
      
        '       DECODE( E.LOGRADOURO, '#39#39', E.NUMERO, E.LOGRADOURO || '#39', '#39' ' +
        '|| E.NUMERO ) || '#39'  '#39' || E.COMPLEMENTO AS ENDERECO,'
      '       E.BAIRRO,'
      '       C.NOME AS CIDADE,'
      '       E.CEP,'
      '       C.CODESTADO,'
      '       CI.CONNUMERO AS NUMERO_CONTRATO,'
      '       CI.CONNOME AS NOME_CONTRATO,'
      '       PF.DSCTIPO AS CONDICAO_PAGAMENTO,'
      '       PF.VLRFINANC AS VALOR_FINANCIADO,'
      '       PF.NUMPARCELAS NUMERO_PARCELAS,'
      '       PF.PERIODO AS PERIODICIDADE_MESES,'
      '       PF.PRAZO,'
      '       PF.NUMPARCELA AS PARCELA_ATUAL,'
      '       PF.DATAVENCIMENTO,'
      '       PF.VLRPRESTACAO AS VALOR_PRESTACAO,'
      '       PF.VLRAMORTIZACAO AS VALOR_AMORTIZACAO,'
      '       PF.VLRPRESTATUALIZADA AS VALOR_PRESTACAO_ATUALIZADA,'
      '       PF.VLRRESIDUO AS VALOR_RESIDUO,'
      '       PF.VLRRESIDUOATUALI AS VALOR_RESIDUO_ATUALIZADO,'
      '       MPF.MOESIGLA  AS INDICE,'
      '       CM.COTVALOR FATOR_CORRECAO,'
      '       PF.FATORCORRECAO AS FATOR_ACUMULADO,'
      '       PF.PROX_NUMPARCELA AS PROX_PARCELA,'
      '       PF.PROX_DATAVENCIMENTO AS PROX_DATAVENCIMENTO,'
      '       PF.PROX_VLRPRESTACAO AS PROX_PRESTACAO,'
      '       PF.PROX_VLRAMORTIZACAO AS PROX_AMORTIZACAO,'
      '       PF.PROX_VLRPRESTATUALIZADA AS PROX_PREST_ATUALIZADA,'
      '       PF.PROX_VLRRESIDUO AS PROX_RESID,'
      '       PF.PROX_VLRRESIDUOATUALI AS PROX_RESID_ATUALIZADO'
      'FROM   ( SELECT DECODE( CP.TIPOCONDPAG, '#39'S'#39', '#39'Sinal'#39','
      '                                        '#39'P'#39', '#39'Parcelamento'#39','
      '                                        '#39'V'#39', '#39'Venda à Vista'#39','
      '                                        '#39'C'#39', '#39'Caução'#39','
      '                                        '#39'R'#39', '#39'Repactuação'#39','
      
        '                                        '#39'Cond. Inicial'#39' ) AS DSC' +
        'TIPO,'
      '                CP.TIPOCONDPAG,'
      '                CP.VLRFINANC,'
      '                CP.NUMPARCELAS,'
      '                CP.PERIODO,'
      '                CP.IDCONDINICIAL,'
      '                DECODE( CP.PRAZO, '#39'M'#39', '#39'Mês'#39', '#39'Ano'#39' ) AS PRAZO,'
      '                CP.IDCONTRATOIMOVEL,'
      '                CP.MESREFREAJUSTE,'
      '                PF.IDINDCORRECAO,'
      '                PF.NUMPARCELA,'
      '                PF.DATAVENCIMENTO,'
      '                PF.VLRPRESTACAO,'
      '                PF.VLRAMORTIZACAO,'
      '                PF.VLRPRESTATUALIZADA,'
      '                PF.VLRRESIDUO,'
      '                PF.VLRRESIDUOATUALI,'
      '                PF.FATORCORRECAO,'
      '                PF.FLGTIPOLANC,'
      '                PX.IDCONDPAGIMOVEL    AS PROX_IDCONDPAGIMOVEL,'
      '                PX.NUMPARCELA         AS PROX_NUMPARCELA,'
      '                PX.DATAVENCIMENTO     AS PROX_DATAVENCIMENTO,'
      '                PX.VLRPRESTACAO       AS PROX_VLRPRESTACAO,'
      '                PX.VLRAMORTIZACAO     AS PROX_VLRAMORTIZACAO,'
      
        '                PX.VLRPRESTATUALIZADA AS PROX_VLRPRESTATUALIZADA' +
        ','
      '                PX.VLRRESIDUO         AS PROX_VLRRESIDUO,'
      '                PX.VLRRESIDUOATUALI   AS PROX_VLRRESIDUOATUALI'
      '         FROM   CONDPAGIMOVEL  CP,'
      '                PARCFINANCIMOV PF,'
      '                ( SELECT PFX.IDCONDPAGIMOVEL,'
      '                         PFX.NUMPARCELA,'
      '                         PFX.DATAVENCIMENTO,'
      '                         PFX.VLRPRESTACAO,'
      '                         PFX.VLRAMORTIZACAO,'
      '                         PFX.VLRPRESTATUALIZADA,'
      '                         PFX.VLRRESIDUO,'
      '                         PFX.VLRRESIDUOATUALI'
      '                  FROM   PARCFINANCIMOV PFX'
      
        '                  WHERE  PFX.FLGTIPOLANC    IN ( 1, 2, 3, 4, 7, ' +
        '8, 9 ) ) PX,'
      '                ( SELECT   CY.IDCONTRATOIMOVEL,'
      '                           PW.DATAVENCIMENTO AS DATAFIM,'
      '                           MAX( PY.DATAVENCIMENTO ) AS DATAINI'
      '                  FROM     PARCFINANCIMOV PY,'
      '                           CONDPAGIMOVEL  CY,'
      '                           ( SELECT   CY2.IDCONTRATOIMOVEL,'
      '                                      PY2.DATAVENCIMENTO'
      '                             FROM     PARCFINANCIMOV PY2,'
      '                                      CONDPAGIMOVEL  CY2'
      
        '                             WHERE    CY2.IDCONDINICIAL    = PY2' +
        '.IDCONDPAGIMOVEL'
      '                               AND    PY2.NUMPARCELA       = 0'
      
        '                               AND    TO_CHAR( PY2.DATAVENCIMENT' +
        'O, '#39'YYYYMM'#39' ) = :ANOMES ) PW'
      
        '                  WHERE    CY.IDCONDINICIAL    = PY.IDCONDPAGIMO' +
        'VEL'
      '                    AND    PY.NUMPARCELA       = 0'
      
        '                    AND    PY.DATAVENCIMENTO   < PW.DATAVENCIMEN' +
        'TO'
      
        '                    AND    CY.IDCONTRATOIMOVEL = PW.IDCONTRATOIM' +
        'OVEL'
      '                  GROUP BY CY.IDCONTRATOIMOVEL,'
      '                           PW.DATAVENCIMENTO ) PD '
      
        '         WHERE  PF.DATAVENCIMENTO BETWEEN CP.DATAINI AND CP.DATA' +
        'FIM'
      
        '           AND  ( ( PF.DATAVENCIMENTO >= PD.DATAINI ) AND ( PF.D' +
        'ATAVENCIMENTO < PD.DATAFIM ) )'
      '           AND  CP.IDCONDINICIAL  = PF.IDCONDPAGIMOVEL'
      '           AND  PF.NUMPARCELA     <> 0'
      '           AND  PF.FLGTIPOLANC    IN ( 1, 2, 3, 4, 7, 8, 9 )'
      '           AND  PX.IDCONDPAGIMOVEL = CP.IDCONDINICIAL '
      '           AND  PX.NUMPARCELA      = PF.NUMPARCELA + 1'
      '           AND  PX.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL ) PF,'
      '     CONTRATOIMOVEL CI,'
      '     MOEDA          MPF,'
      '     COTACAOMOEDA   CM,'
      '     PESSOA         P,'
      '     ENDPESS        E,'
      '     CIDADES        C'
      'WHERE    ( PF.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '  AND    ( MPF.MOECODIGO(+)    = PF.IDINDCORRECAO    )'
      '  AND    ( CM.MOECODIGO (+)    = PF.IDINDCORRECAO    )'
      
        '  AND    ( CM.COTMESREF (+)    = TO_CHAR( ADD_MONTHS( PF.DATAVEN' +
        'CIMENTO, PF.MESREFREAJUSTE * ( -1 ) ), '#39'MMYYYY'#39' ) )'
      '  AND    ( P.IDPESSOA   (+)    = CI.IDLOCATARIO      )'
      '  AND    ( P.IDENDCORRESP      = E.IDENDERECO(+)     )'
      '  AND    ( E.IDCIDADES         = C.IDCIDADES (+)     )'
      '  AND    ( CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL   )'
      '  AND    ( PF.IDCONDINICIAL    = :IDCONDINICIAL      )'
      'ORDER BY CI.CONNUMERO,'
      '         PF.DATAVENCIMENTO,'
      '         PF.FLGTIPOLANC')
    ValidateWithMask = True
    Left = 260
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCONDINICIAL'
        ParamType = ptInput
      end>
    object qrySqlNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySqlRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qrySqlENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qrySqlBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qrySqlCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qrySqlCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrySqlCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qrySqlNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qrySqlNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qrySqlCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 13
    end
    object qrySqlVALOR_FINANCIADO: TFloatField
      FieldName = 'VALOR_FINANCIADO'
    end
    object qrySqlNUMERO_PARCELAS: TFloatField
      FieldName = 'NUMERO_PARCELAS'
    end
    object qrySqlPERIODICIDADE_MESES: TFloatField
      FieldName = 'PERIODICIDADE_MESES'
    end
    object qrySqlPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 3
    end
    object qrySqlPARCELA_ATUAL: TFloatField
      FieldName = 'PARCELA_ATUAL'
    end
    object qrySqlDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qrySqlVALOR_PRESTACAO: TFloatField
      FieldName = 'VALOR_PRESTACAO'
    end
    object qrySqlVALOR_AMORTIZACAO: TFloatField
      FieldName = 'VALOR_AMORTIZACAO'
    end
    object qrySqlVALOR_PRESTACAO_ATUALIZADA: TFloatField
      FieldName = 'VALOR_PRESTACAO_ATUALIZADA'
    end
    object qrySqlVALOR_RESIDUO: TFloatField
      FieldName = 'VALOR_RESIDUO'
    end
    object qrySqlVALOR_RESIDUO_ATUALIZADO: TFloatField
      FieldName = 'VALOR_RESIDUO_ATUALIZADO'
    end
    object qrySqlINDICE: TStringField
      FieldName = 'INDICE'
      Size = 10
    end
    object qrySqlFATOR_CORRECAO: TFloatField
      FieldName = 'FATOR_CORRECAO'
    end
    object qrySqlFATOR_ACUMULADO: TFloatField
      FieldName = 'FATOR_ACUMULADO'
    end
    object qrySqlPROX_PARCELA: TFloatField
      FieldName = 'PROX_PARCELA'
    end
    object qrySqlPROX_DATAVENCIMENTO: TDateTimeField
      FieldName = 'PROX_DATAVENCIMENTO'
    end
    object qrySqlPROX_PRESTACAO: TFloatField
      FieldName = 'PROX_PRESTACAO'
    end
    object qrySqlPROX_AMORTIZACAO: TFloatField
      FieldName = 'PROX_AMORTIZACAO'
    end
    object qrySqlPROX_PREST_ATUALIZADA: TFloatField
      FieldName = 'PROX_PREST_ATUALIZADA'
    end
    object qrySqlPROX_RESID: TFloatField
      FieldName = 'PROX_RESID'
    end
    object qrySqlPROX_RESID_ATUALIZADO: TFloatField
      FieldName = 'PROX_RESID_ATUALIZADO'
    end
    object qrySqlMesAno: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesAno'
      Size = 8
      Calculated = True
    end
    object qrySqlUltPrestacaoExtenso: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'UltPrestacaoExtenso'
      Size = 500
      Calculated = True
    end
    object qrySqlProxPrestacaoExtenso: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'ProxPrestacaoExtenso'
      Size = 500
      Calculated = True
    end
  end
  object Extenso: TExtensoCM
    CaracterAdicional = '*'
    DescricaoMoeda.Singular = 'Real'
    DescricaoMoeda.Plural = 'Reais'
    TamanhoLinha = 200
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 285
    Top = 205
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ),'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ) ) AS DSCCOND'
      ''
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN ('#39'S'#39','#39'P'#39','#39'V'#39','#39'R'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 354
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDSCCOND: TStringField
      DisplayLabel = 'Vencimento    Valor Finaciado   Nr. Parcelas'
      DisplayWidth = 34
      FieldName = 'DSCCOND'
      Size = 34
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
  end
end
