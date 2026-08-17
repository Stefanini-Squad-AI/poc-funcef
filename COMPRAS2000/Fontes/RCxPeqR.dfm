inherited RptCxPeqR: TRptCxPeqR
  Left = 132
  Top = 179
  Width = 402
  Height = 164
  Caption = 'RptCxPeqR'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Caixa Pequeno Resumido'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Caixa Pequeno'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '      CP.IDCAIXAPEQUENO,'
          '      CP.DESCCAIXAPEQ,'
          '      CP.VLRTOTCAIXAPEQ,'
          '      P.RAZAOSOCIAL'
          'FROM'
          '      PESSOA P,'
          '      CAIXAPEQUENO CP,'
          '      USUARIOXCAIXAPEQ UXC'
          'WHERE'
          '        (CP.IDPESSOA = 1)'
          '    AND (UXC.IDUSUARIO = 1)'
          '    AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO)'
          '    AND (CP.IDFORCLI = P.IDPESSOA)'
          'ORDER BY CP.DESCCAIXAPEQ'
          '')
        LookupSettings.Chave = 'IDCAIXAPEQUENO'
        LookupSettings.Display = 'DESCCAIXAPEQ'
        LookupSettings.Descricao = 'Caixa Pequeno'
        LookupSettings.Tamanho = '60'
        CheckBoxSetings.ValueChecked = 'False'
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
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Nº do Borderô'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 130
    Left = 164
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = ppImpCxPeqR
    LabelEmpresa = ppLabel20
    LabelSistema = ppLabel57
  end
  object qryCxPeq: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      LA.IDCAIXAPEQUENO,'
      '      LA.IDLANCCXPEQ,'
      '      CC.NOME AS DESCCENTCUST,'
      '      RTRIM( SC.NOMESUBCONTA ) AS DESCSUBCONTA,'
      '      ( RTRIM(LA.PLACONTA) ||'#39' - '#39'|| PL.PLANOME ) AS DESCCONTA,'
      '      CR.NOME AS DESCCENTRESP,'
      '      UN.NOME AS ATIVPROJ,'
      '      LA.RECPAG,'
      '      TD.DESCRICAO AS TIPODESEMB,'
      
        '      ( RTRIM( IT.CODARTIGO ) || '#39' - '#39' || PR.DESCPROD ) AS DESCA' +
        'RTIGO,'
      '      IT.NUMSOLCOMPRA,'
      '      LA.NODOCUMENTO,'
      '      LA.DATALANC,'
      '      LA.VLRLANC,'
      '      LA.HISTLANCAMENTO,'
      '      LA.IDBORDEROCXPEQ,'
      '      BR.DATAEFETBORDERO'
      'FROM'
      '      LANCCAIXAPEQ LA,'
      '      ITEMSOLI IT,'
      '      BORDEROCAIXAPEQ BR,'
      '      TIPORECEBDESEMB TD,'
      '      CENTCUST CC,'
      '      CENTRESPON CR,'
      '      ARTIGO AR, '
      '      PRODUTO PR,'
      '      PLANOCONTA PL,'
      '      UNIDNEGOCIO UN,'
      '      SUBCONTA SC'
      'WHERE'
      '      (LA.IDBORDEROCXPEQ IS NULL )'
      '  AND (LA.IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)'
      '  AND (LA.IDBORDEROCXPEQ = BR.IDBORDEROCXPEQ(+))'
      '  AND (LA.CODTIPRECDES = TD.CODTIPRECDES)'
      '  AND (LA.RECPAG = TD.RECPAG)'
      '  AND (LA.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (LA.IDEMPRESA = CC.IDEMPRESA(+))'
      '  AND (LA.CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      '  AND (LA.IDEMPRESA = CR.IDEMPRESA(+)) '
      '  AND (LA.PLANO = PL.PLANO)'
      '  AND (LA.PLACONTA = PL.PLACONTA)'
      '  AND (LA.UNIDNEGOC = UN.UNIDNEGOC)'
      '  AND (LA.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (LA.IDITEMSOLI = IT.IDITEMSOLI(+))'
      '  AND (IT.CODARTIGO = AR.CODARTIGO(+))'
      '  AND (AR.CODPRODUTO = PR.CODPRODUTO(+))'
      'ORDER BY LA.DATALANC'
      '')
    ValidateWithMask = True
    Left = 33
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCAIXAPEQUENO'
        ParamType = ptUnknown
      end>
    object qryCxPeqIDLANCCXPEQ: TFloatField
      FieldName = 'IDLANCCXPEQ'
    end
    object qryCxPeqDESCCENTCUST: TStringField
      FieldName = 'DESCCENTCUST'
      Size = 30
    end
    object qryCxPeqDESCSUBCONTA: TStringField
      FieldName = 'DESCSUBCONTA'
      Size = 60
    end
    object qryCxPeqDESCCONTA: TStringField
      FieldName = 'DESCCONTA'
      Size = 61
    end
    object qryCxPeqDESCCENTRESP: TStringField
      FieldName = 'DESCCENTRESP'
      Size = 30
    end
    object qryCxPeqATIVPROJ: TStringField
      FieldName = 'ATIVPROJ'
      Size = 25
    end
    object qryCxPeqRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCxPeqTIPODESEMB: TStringField
      FieldName = 'TIPODESEMB'
      Size = 35
    end
    object qryCxPeqDESCARTIGO: TStringField
      FieldName = 'DESCARTIGO'
      Size = 57
    end
    object qryCxPeqNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryCxPeqNODOCUMENTO: TStringField
      FieldName = 'NODOCUMENTO'
    end
    object qryCxPeqDATALANC: TDateTimeField
      FieldName = 'DATALANC'
    end
    object qryCxPeqVLRLANC: TFloatField
      FieldName = 'VLRLANC'
    end
    object qryCxPeqHISTLANCAMENTO: TStringField
      FieldName = 'HISTLANCAMENTO'
      Size = 200
    end
    object qryCxPeqIDBORDEROCXPEQ: TFloatField
      FieldName = 'IDBORDEROCXPEQ'
    end
    object qryCxPeqDATAEFETBORDERO: TDateTimeField
      FieldName = 'DATAEFETBORDERO'
    end
    object qryCxPeqIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
    end
  end
  object dsCxPeq: TwwDataSource
    DataSet = qryCxPeq
    Left = 106
    Top = 68
  end
  object pplCxPeqR: TppBDEPipeline
    DataSource = dsCxPeq
    UserName = 'lCxPeqR'
    Left = 190
    Top = 68
    object pplCxPeqRppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLANCCXPEQ'
      FieldName = 'IDLANCCXPEQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplCxPeqRppField2: TppField
      FieldAlias = 'DESCCENTCUST'
      FieldName = 'DESCCENTCUST'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pplCxPeqRppField3: TppField
      FieldAlias = 'DESCSUBCONTA'
      FieldName = 'DESCSUBCONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplCxPeqRppField4: TppField
      FieldAlias = 'DESCCONTA'
      FieldName = 'DESCCONTA'
      FieldLength = 61
      DisplayWidth = 61
      Position = 3
    end
    object pplCxPeqRppField5: TppField
      FieldAlias = 'DESCCENTRESP'
      FieldName = 'DESCCENTRESP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object pplCxPeqRppField6: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 25
      DisplayWidth = 25
      Position = 5
    end
    object pplCxPeqRppField7: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pplCxPeqRppField8: TppField
      FieldAlias = 'TIPODESEMB'
      FieldName = 'TIPODESEMB'
      FieldLength = 35
      DisplayWidth = 35
      Position = 7
    end
    object pplCxPeqRppField9: TppField
      FieldAlias = 'DESCARTIGO'
      FieldName = 'DESCARTIGO'
      FieldLength = 57
      DisplayWidth = 57
      Position = 8
    end
    object pplCxPeqRppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSOLCOMPRA'
      FieldName = 'NUMSOLCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCxPeqRppField11: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object pplCxPeqRppField12: TppField
      FieldAlias = 'DATALANC'
      FieldName = 'DATALANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object pplCxPeqRppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANC'
      FieldName = 'VLRLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplCxPeqRppField14: TppField
      FieldAlias = 'HISTLANCAMENTO'
      FieldName = 'HISTLANCAMENTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 13
    end
    object pplCxPeqRppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBORDEROCXPEQ'
      FieldName = 'IDBORDEROCXPEQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCxPeqRppField16: TppField
      FieldAlias = 'DATAEFETBORDERO'
      FieldName = 'DATAEFETBORDERO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object pplCxPeqRppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCAIXAPEQUENO'
      FieldName = 'IDCAIXAPEQUENO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object ppImpCxPeqR: TppReport
    AutoStop = False
    DataPipeline = pplCxPeqR
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 279
    Top = 68
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCxPeqR'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object LbTituloCxPeqR: TppLabel
        UserName = 'LbTituloCxPeqR'
        Caption = 'Caixa Pequeno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 126736
        mmTop = 8731
        mmWidth = 30427
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppImpCxPeqResLabel1: TppLabel
        UserName = 'ppImpCxPeqResLabel1'
        Caption = 'Lanc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
      end
      object ppImpCxPeqResLabel2: TppLabel
        UserName = 'ppImpCxPeqResLabel2'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 17463
        mmWidth = 16669
        BandType = 0
      end
      object ppImpCxPeqResLabel3: TppLabel
        UserName = 'ppImpCxPeqResLabel3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 17463
        mmWidth = 6085
        BandType = 0
      end
      object ppImpCxPeqResLabel4: TppLabel
        UserName = 'ppImpCxPeqResLabel4'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 17463
        mmWidth = 12965
        BandType = 0
      end
      object ppImpCxPeqResLabel5: TppLabel
        UserName = 'ppImpCxPeqResLabel5'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
      end
      object ppImpCxPeqResLabel6: TppLabel
        UserName = 'ppImpCxPeqResLabel6'
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 17463
        mmWidth = 21167
        BandType = 0
      end
      object ppImpCxPeqResLabel7: TppLabel
        UserName = 'ppImpCxPeqResLabel7'
        Caption = 'Tipo Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 17463
        mmWidth = 25665
        BandType = 0
      end
      object ppImpCxPeqResLabel8: TppLabel
        UserName = 'ppImpCxPeqResLabel8'
        Caption = 'Atividade/Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 207169
        mmTop = 17463
        mmWidth = 24871
        BandType = 0
      end
      object ppImpCxPeqResLabel9: TppLabel
        UserName = 'ppImpCxPeqResLabel9'
        Caption = 'C.Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 17463
        mmWidth = 28840
        BandType = 0
      end
      object ppImpCxPeqResLine1: TppLine
        UserName = 'ppImpCxPeqResLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppImpCxPeqResDBText1: TppDBText
        UserName = 'ppImpCxPeqResDBText1'
        DataField = 'IDLANCCXPEQ'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppImpCxPeqResDBText2: TppDBText
        UserName = 'ppImpCxPeqResDBText2'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 794
        mmWidth = 24606
        BandType = 4
      end
      object ppImpCxPeqResDBText3: TppDBText
        UserName = 'ppImpCxPeqResDBText3'
        DataField = 'DATALANC'
        DataPipeline = pplCxPeqR
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppImpCxPeqResDBMemo1: TppDBMemo
        UserName = 'ppImpCxPeqResDBMemo1'
        CharWrap = False
        DataField = 'HISTLANCAMENTO'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3703
        mmLeft = 63765
        mmTop = 794
        mmWidth = 46567
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppImpCxPeqResDBText5: TppDBText
        UserName = 'ppImpCxPeqResDBText5'
        DataField = 'DESCCONTA'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 46038
        BandType = 4
      end
      object ppImpCxPeqResDBText6: TppDBText
        UserName = 'ppImpCxPeqResDBText6'
        DataField = 'TIPODESEMB'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 794
        mmWidth = 30163
        BandType = 4
      end
      object ppImpCxPeqResDBText7: TppDBText
        UserName = 'ppImpCxPeqResDBText7'
        DataField = 'ATIVPROJ'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 207169
        mmTop = 794
        mmWidth = 29898
        BandType = 4
      end
      object ppImpCxPeqResDBText4: TppDBText
        UserName = 'ppImpCxPeqResDBText4'
        DataField = 'VLRLANC'
        DataPipeline = pplCxPeqR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 111919
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppImpCxPeqResDBText8: TppDBText
        UserName = 'ppImpCxPeqResDBText8'
        DataField = 'DESCCENTRESP'
        DataPipeline = pplCxPeqR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 794
        mmWidth = 37835
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel57: TppLabel
        UserName = 'ppLabel57'
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
        mmWidth = 283369
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 3175
        mmWidth = 125942
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 251619
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppImpCxPeqRSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppImpCxPeqRDBCalc1: TppDBCalc
        UserName = 'ppImpCxPeqRDBCalc1'
        AutoSize = True
        DataField = 'VLRLANC'
        DataPipeline = pplCxPeqR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCxPeqR'
        mmHeight = 3175
        mmLeft = 105040
        mmTop = 794
        mmWidth = 22754
        BandType = 7
      end
      object ppImpCxPeqRLabel1: TppLabel
        UserName = 'ppImpCxPeqRLabel1'
        Caption = 'Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 81492
        mmTop = 794
        mmWidth = 8731
        BandType = 7
      end
      object ppImpCxPeqRLine1: TppLine
        UserName = 'ppImpCxPeqRLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
    end
  end
  object qryBord: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      DISTINCT'
      '      L.IDCAIXAPEQUENO,'
      '      B.DATAEFETBORDERO'
      'FROM'
      '      LANCCAIXAPEQ L,'
      '      BORDEROCAIXAPEQ B,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (L.IDBORDEROCXPEQ = :pIDBORD)'
      '    AND (L.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = L.IDCAIXAPEQUENO)'
      '    AND (L.IDBORDEROCXPEQ = B.IDBORDEROCXPEQ)'
      '')
    ValidateWithMask = True
    Left = 337
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDBORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryBordIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'LANCCAIXAPEQ.IDCAIXAPEQUENO'
    end
    object qryBordDATAEFETBORDERO: TDateTimeField
      FieldName = 'DATAEFETBORDERO'
      Origin = 'BORDEROCAIXAPEQ.DATAEFETBORDERO'
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
end
