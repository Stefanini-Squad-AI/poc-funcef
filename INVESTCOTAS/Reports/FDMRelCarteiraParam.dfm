inherited RelCarteiraParam: TRelCarteiraParam
  Left = 497
  Top = 207
  Height = 251
  Caption = 'RelCarteiraParam'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Carteira de Investimento :'
        Controle = tcLookupCombo
        CampoBanco = 'DESCCARTINVEST'
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCCARTINVEST, IDCARTEIRAINVEST  '
          'FROM    CARTEIRAINVEST ')
        LookupSettings.Chave = 'IDCARTEIRAINVEST'
        LookupSettings.Display = 'DESCCARTINVEST'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '0'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CARTEIRAINVEST'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
  end
  inherited pplReport: TppBDEPipeline
    object pplReportppField1: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplReportppField2: TppField
      FieldAlias = 'DATAINICIAL'
      FieldName = 'DATAINICIAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplReportppField3: TppField
      FieldAlias = 'DATAULTFECH'
      FieldName = 'DATAULTFECH'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplReportppField4: TppField
      FieldAlias = 'DATAENCERRAMENTO'
      FieldName = 'DATAENCERRAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplReportppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplReportppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECVLR'
      FieldName = 'QTDDECVLR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplReportppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAINICIAL'
      FieldName = 'VLRCOTAINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplReportppField8: TppField
      FieldAlias = 'MOEDESC'
      FieldName = 'MOEDESC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object pplReportppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplReportppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXPERFORM'
      FieldName = 'PERCTXPERFORM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplReportppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXADM'
      FieldName = 'PERCTXADM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  inherited spl: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   C.DESCCARTINVEST, P.DATAINICIAL, P.DATAULTFECH, P.DATAENCERRA' +
        'MENTO, P.QTDDECQTD, P.QTDDECVLR, P.VLRCOTAINICIAL, '
      '   M.MOEDESC, P.MOECODIGO, P.PERCTXPERFORM, P.PERCTXADM'
      ''
      'FROM PARAMCOTAINVEST P, CARTEIRAINVEST C, MOEDA M'
      'WHERE '
      '    P.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST '
      'AND M.MOECODIGO(+)        = P.MOECODIGO ')
    ClientDataSet = cds
  end
  inherited cds: TCMClientDataSet
    Data = {
      F60100009619E0BD01000000180000000B0002000000030000001C010E444553
      4343415254494E564553540100490000000100055749445448020002003C000B
      44415441494E494349414C08000800000000000B44415441554C544645434808
      000800000000001044415441454E43455252414D454E544F0800080000000000
      09515444444543515444080004000000000009515444444543564C5208000400
      000000000E564C52434F5441494E494349414C0800040000000000074D4F4544
      4553430100490000000100055749445448020002001400094D4F45434F444947
      4F08000400000000000D504552435458504552464F524D080004000000000009
      50455243545841444D08000400000000000100044C4349440400010009080000
      004000002F4156202D2043617274656972612052656E64612056617269617665
      6C2050726F70726961202849424F56455350412900004EA445C9CC420000D85D
      4DC9CC4200000000000018400000000000002240000000000000F03F13494750
      2D4D20496E76657374696D656E746F730000000000E061400000000000000040
      000000000000F03F004050152D4156202D2043617274656972612052656E6461
      20566172696176656C2050726F7072696120284942582035302900004EA445C9
      CC420000AACA4AC9CC4200000000000020400000000000002840}
  end
  inherited rptReport: TppReport
    OnStartPage = rptReportStartPage
    BeforePrint = rptReportBeforePrint
    Left = 90
    DataPipelineName = 'pplReport'
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 31221
      inherited LblEmpresa: TppLabel [0]
      end
      inherited lblNomeRelatorio: TppLabel [1]
        Caption = 'Consulta de Carteiras de Investimentos - Parâmetros'
        mmWidth = 88477
      end
      inherited ppDBImage: TppDBImage
        DataPipelineName = 'ppLogoTipo'
      end
      inherited lblPeriodo: TppLabel
        Visible = False
      end
      inherited shpCabecalho: TppShape
        mmHeight = 11377
        mmTop = 19844
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Carteira de Investimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 26194
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 85461
        mmTop = 26194
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Casa decimal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 144463
        mmTop = 20902
        mmWidth = 18119
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 161396
        mmTop = 26194
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143140
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Fechamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 26194
        mmWidth = 16670
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Encerramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 122238
        mmTop = 26194
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 85196
        mmTop = 20902
        mmWidth = 57415
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 84931
        mmTop = 20108
        mmWidth = 794
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 142611
        mmTop = 19844
        mmWidth = 794
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 168540
        mmTop = 19844
        mmWidth = 794
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 84931
        mmTop = 25135
        mmWidth = 83608
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor da Cota Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 177007
        mmTop = 22754
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 26194
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Taxa de Performance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 207698
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Taxa de Administração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 261673
        mmTop = 22754
        mmWidth = 21431
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 101865
        mmTop = 25135
        mmWidth = 6350
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 120915
        mmTop = 25135
        mmWidth = 6350
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 159809
        mmTop = 25135
        mmWidth = 6350
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 197644
        mmTop = 20108
        mmWidth = 3175
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 225425
        mmTop = 19844
        mmWidth = 3175
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 258498
        mmTop = 20108
        mmWidth = 3175
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      inherited shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3260
        mmLeft = 2910
        mmTop = 529
        mmWidth = 81756
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAINICIAL'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 85461
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAULTFECH'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 529
        mmWidth = 16670
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAENCERRAMENTO'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 122238
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDDECQTD'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'QTDDECVLR'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRCOTAINICIAL'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 529
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MOEDESC'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PERCTXPERFORM'
        DataPipeline = pplReport
        DisplayFormat = '0.00 %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PERCTXADM'
        DataPipeline = pplReport
        DisplayFormat = '0.00 %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3175
        mmLeft = 265907
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 101865
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 120915
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 142611
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 159809
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 168540
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 84931
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 197644
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 225425
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 258498
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 278078
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
    end
  end
end
