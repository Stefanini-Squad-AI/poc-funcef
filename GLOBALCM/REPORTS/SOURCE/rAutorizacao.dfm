inherited rptParamAutoriza: TrptParamAutoriza
  Left = 405
  Top = 210
  Width = 408
  Height = 308
  Caption = 'Autorização'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Usuário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDESPACESSO, NOMEUSUARIO'
          'FROM USUARIOSISTEMA'
          'ORDER BY NOMEUSUARIO')
        LookupSettings.Chave = 'nomeusuario'
        LookupSettings.Display = 'nomeusuario'
        LookupSettings.Descricao = 'Usuário'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'lkpUsu'
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
        Caption = 'Backup'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDBACKCTRL, '
          '   TRGDTINCLUSAO, '
          
            '   TO_CHAR(IDBACKCTRL) || '#39' - '#39' || (TO_CHAR(TRGDTINCLUSAO, '#39'dd/m' +
            'm/yyyy hh:mi:ss'#39')) as descricao'
          'FROM BACKCTRL'
          'ORDER BY IDBACKCTRL')
        LookupSettings.Chave = 'idbackctrl'
        LookupSettings.Display = 'descricao'
        LookupSettings.Descricao = 'Seq. / Descricao'
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
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'lkpBack'
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
    Formheight = 150
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpCompara
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object dsDifereAutoriza: TwwDataSource
    DataSet = cdsDifereAutoriza
    Left = 172
    Top = 75
  end
  object ppAutorizacao: TppBDEPipeline
    DataSource = dsDifereAutoriza
    CloseDataSource = True
    UserName = 'Autorizacao'
    Left = 228
    Top = 59
    object ppAutorizacaoppField1: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField2: TppField
      FieldAlias = 'IDESPACESSO'
      FieldName = 'IDESPACESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField3: TppField
      FieldAlias = 'IDOPERFUNC'
      FieldName = 'IDOPERFUNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField4: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField5: TppField
      FieldAlias = 'IDBACKCTRL'
      FieldName = 'IDBACKCTRL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField6: TppField
      FieldAlias = 'NOMEFUNCAO'
      FieldName = 'NOMEFUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField7: TppField
      FieldAlias = 'NOMEFUNCAOPAI'
      FieldName = 'NOMEFUNCAOPAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField8: TppField
      FieldAlias = 'NOMEOPERACAO'
      FieldName = 'NOMEOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppAutorizacaoppField9: TppField
      FieldAlias = 'NOMEMODULO'
      FieldName = 'NOMEMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object rpCompara: TppReport
    AutoStop = False
    DataPipeline = ppUsuario
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 195
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppUsuario'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório Comparativo de Autorizações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 60418
        mmTop = 8731
        mmWidth = 79206
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object pplabel: TppLabel
        UserName = 'label'
        Caption = 'Backup:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 15875
        mmWidth = 13758
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppBack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBack'
        mmHeight = 4191
        mmLeft = 101071
        mmTop = 15875
        mmWidth = 20955
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppSubReportFuncao: TppSubReport
        UserName = 'SubReportFuncao'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReportAutorizacao
        TraverseAllData = False
        DataPipelineName = 'ppDifereFuncao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDifereFuncao
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
          Left = 140
          Top = 68
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDifereFuncao'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object LblTitMembro: TppLabel
              UserName = 'Label2'
              Caption = 'Funções / Operações Canceladas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 529
              mmTop = 794
              mmWidth = 56049
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object DbtNomeMembro: TppDBText
              UserName = 'DbtNomeMembro'
              AutoSize = True
              DataField = 'nomefuncao'
              DataPipeline = ppDifereFuncao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDifereFuncao'
              mmHeight = 3598
              mmLeft = 34925
              mmTop = 0
              mmWidth = 17611
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DbtNomeMembro3'
              AutoSize = True
              DataField = 'NOMEFUNCAOPAI'
              DataPipeline = ppDifereFuncao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDifereFuncao'
              mmHeight = 3598
              mmLeft = 100277
              mmTop = 0
              mmWidth = 27940
              BandType = 4
            end
            object DbtDescrMembro: TppDBText
              UserName = 'DbtDescrMembro'
              AutoSize = True
              DataField = 'NOMEOPERACAO'
              DataPipeline = ppDifereFuncao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDifereFuncao'
              mmHeight = 3598
              mmLeft = 155840
              mmTop = 0
              mmWidth = 27390
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'TRGDTINCLUSAO'
              DataPipeline = ppDifereFuncao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDifereFuncao'
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'NOMEMODULO'
            DataPipeline = ppDifereFuncao
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDifereFuncao'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 11642
              mmPrintPosition = 0
              object ppLine3: TppLine
                UserName = 'Line3'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 3969
                mmLeft = 1058
                mmTop = 7408
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppShape1: TppShape
                UserName = 'Shape1'
                Brush.Color = 14342874
                ParentWidth = True
                mmHeight = 5292
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 3
                GroupNo = 0
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                Caption = 'Módulo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 529
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppDBText1: TppDBText
                UserName = 'DbtNomeMembro2'
                AutoSize = True
                DataField = 'NOMEMODULO'
                DataPipeline = ppDifereFuncao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDifereFuncao'
                mmHeight = 4022
                mmLeft = 15610
                mmTop = 794
                mmWidth = 25993
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Caption = 'Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 34660
                mmTop = 6615
                mmWidth = 12435
                BandType = 3
                GroupNo = 0
              end
              object ppLabel2: TppLabel
                UserName = 'Label1'
                Caption = 'Função Pai'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 100277
                mmTop = 6615
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppLabel3: TppLabel
                UserName = 'Label3'
                Caption = 'Operação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 155840
                mmTop = 6615
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                Caption = 'Data Alteração'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 529
                mmTop = 6615
                mmWidth = 32544
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppLine4: TppLine
                UserName = 'Line4'
                Weight = 0.75
                mmHeight = 3969
                mmLeft = 1058
                mmTop = 0
                mmWidth = 196057
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object ppSubReportAutorizacao: TppSubReport
        UserName = 'SubReportAutorizacao'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppAutorizacao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppAutorizacao
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
          Left = 140
          Top = 68
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAutorizacao'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLabel9: TppLabel
              UserName = 'Label2'
              Caption = 'Autorizações Canceladas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 529
              mmTop = 794
              mmWidth = 42460
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'NOMEOPERACAO'
              DataPipeline = ppAutorizacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppAutorizacao'
              mmHeight = 3598
              mmLeft = 159015
              mmTop = 794
              mmWidth = 27390
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              AutoSize = True
              DataField = 'NOMEFUNCAOPAI'
              DataPipeline = ppAutorizacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppAutorizacao'
              mmHeight = 3598
              mmLeft = 103452
              mmTop = 1323
              mmWidth = 27940
              BandType = 4
            end
            object DbtNomeVisao: TppDBText
              UserName = 'DbtNomeMembro1'
              AutoSize = True
              DataField = 'NOMEFUNCAO'
              DataPipeline = ppAutorizacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppAutorizacao'
              mmHeight = 3598
              mmLeft = 34660
              mmTop = 794
              mmWidth = 22818
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'TRGDTINCLUSAO'
              DataPipeline = ppAutorizacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppAutorizacao'
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 794
              mmWidth = 31485
              BandType = 4
            end
          end
          object ppGroup3: TppGroup
            BreakName = 'NOMEMODULO'
            DataPipeline = ppAutorizacao
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppAutorizacao'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 16404
              mmPrintPosition = 0
              object ppLine5: TppLine
                UserName = 'Line5'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 3969
                mmLeft = 0
                mmTop = 11906
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppShape2: TppShape
                UserName = 'Shape2'
                Brush.Color = 14342874
                ParentWidth = True
                mmHeight = 5292
                mmLeft = 0
                mmTop = 265
                mmWidth = 197300
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'Módulo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 1058
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                AutoSize = True
                DataField = 'NOMEMODULO'
                DataPipeline = ppAutorizacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAutorizacao'
                mmHeight = 4022
                mmLeft = 15610
                mmTop = 1058
                mmWidth = 25993
                BandType = 3
                GroupNo = 0
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 34660
                mmTop = 11113
                mmWidth = 12435
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label1'
                Caption = 'Função Pai'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 103452
                mmTop = 11113
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                Caption = 'Operação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 159015
                mmTop = 11113
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
              object ppLabel13: TppLabel
                UserName = 'Label13'
                Caption = 'Data Alteração'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 794
                mmTop = 11113
                mmWidth = 31485
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppLine6: TppLine
                UserName = 'Line6'
                Weight = 0.75
                mmHeight = 3969
                mmLeft = 0
                mmTop = 0
                mmWidth = 196057
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
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
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
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
    object ppGroup1: TppGroup
      BreakName = 'NOMEUSUARIO'
      DataPipeline = ppUsuario
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppUsuario'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object LblTitulo: TppLabel
          UserName = 'Label1'
          Caption = 'Usuário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 2646
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'NOMEUSUARIO'
          DataPipeline = ppUsuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppUsuario'
          mmHeight = 4191
          mmLeft = 15610
          mmTop = 2646
          mmWidth = 26712
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Descrição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 89165
          mmTop = 2646
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = ppUsuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppUsuario'
          mmHeight = 4191
          mmLeft = 107421
          mmTop = 2646
          mmWidth = 20955
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDifereFuncao: TppBDEPipeline
    DataSource = dsDifereFuncao
    CloseDataSource = True
    UserName = 'funcao'
    Left = 316
    Top = 139
    object ppDifereFuncaoppField1: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField2: TppField
      FieldAlias = 'IDFUNCAO'
      FieldName = 'IDFUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField3: TppField
      FieldAlias = 'NOMEFUNCAO'
      FieldName = 'NOMEFUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField4: TppField
      FieldAlias = 'NOMEFUNCAOPAI'
      FieldName = 'NOMEFUNCAOPAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField5: TppField
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField6: TppField
      FieldAlias = 'NOMEMODULO'
      FieldName = 'NOMEMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDifereFuncaoppField7: TppField
      FieldAlias = 'NOMEOPERACAO'
      FieldName = 'NOMEOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsDifereFuncao: TwwDataSource
    DataSet = cdsDifereFuncao
    Left = 316
    Top = 187
  end
  object cdsDifereFuncao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 56
  end
  object sqlDifereFuncao: TCMSqlParams
    SQL.Strings = (
      '    select fn.trgdtinclusao,'
      '           fn.idfuncao,'
      '           fn.nomefuncao,'
      '           fpai.nomefuncaopai,'
      '           fn.idmodulo,'
      '           m.nomemodulo,'
      '           op.nomeoperacao'
      
        '    from   funcaoback fn,  operacaoback op, modulo m, operfuncba' +
        'ck opf,'
      '         (select fn2.idfuncao, fpai.nomefuncao as nomefuncaopai'
      '          from funcaoback fn2, funcaoback fpai'
      '          where fn2.idfuncaopai = fpai.idfuncao'
      '            and fn2.idbackctrl = fpai.idbackctrl'
      '            and fpai.idbackctrl = -1'
      '            and fpai.idmodulo = fn2.idmodulo'
      '         ) fpai'
      '    where fn.idbackctrl  = -1'
      '      and op.idbackctrl     = -1'
      '      and opf.idbackctrl    = -1'
      '      and fn.idfuncao = opf.idfuncao'
      '      and fn.idfuncao = opf.idfuncao'
      '      and fn.idfuncao = fpai.idfuncao'
      '      and op.idoperacao = opf.idoperacao'
      '      and fn.idmodulo = m.idmodulo'
      
        '      and opf.idoperfunc not in (select idoperfunc from operfunc' +
        ' opf1)'
      '    order by m.nomemodulo, fn.nomefuncao, op.nomeoperacao'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsDifereFuncao
    Left = 24
    Top = 88
  end
  object cdsDifereAutoriza: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 56
  end
  object sqlDifereAutoriza: TCMSqlParams
    SQL.Strings = (
      '   select op.trgdtinclusao,'
      '         ab.idespacesso,'
      '         ab.idoperfunc,'
      '         ab.idpessoa,'
      '         ab.idbackctrl,'
      '         fn.nomefuncao,'
      '         fpai.nomefuncaopai,'
      '         op.nomeoperacao,'
      '         m.nomemodulo'
      '   from  autorizaback ab,'
      '         funcaoback fn,'
      '         operfuncback opf,'
      '         operacaoback op,'
      '         modulo m,'
      '         (select fn2.idfuncao, fpai.nomefuncao as nomefuncaopai'
      '          from funcaoback fn2, funcaoback fpai'
      '          where fn2.idfuncaopai = fpai.idfuncao'
      '            and fn2.idbackctrl = fpai.idbackctrl'
      '            and fpai.idbackctrl = -1'
      '            and fpai.idmodulo = fn2.idmodulo'
      '         ) fpai'
      '   where ab.idbackctrl = -1'
      '     and ab.idbackctrl = fn.idbackctrl'
      '     and fn.idbackctrl = opf.idbackctrl'
      '     and fn.idfuncao = fpai.idfuncao'
      '     and ab.idoperfunc = opf.idoperfunc'
      '     and opf.idfuncao = fn.idfuncao'
      '     and opf.idmodulo = fn.idmodulo'
      '     and fn.idmodulo = m.idmodulo'
      '     and opf.idoperacao = op.idoperacao'
      '     and ab.idespacesso = -1'
      '     and not exists'
      '            (select *'
      '             from autoriza a'
      '             where ab.idespacesso = a.idespacesso'
      '               and ab.idoperfunc  = a.idoperfunc'
      '               and ab.idpessoa    = a.idpessoa'
      '            )'
      '   order by m.nomemodulo, fn.nomefuncao'
      ''
      '')
    ClientDataSet = cdsDifereAutoriza
    Left = 104
    Top = 80
  end
  object cdsUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 8
  end
  object sqlUsuario: TCMSqlParams
    SQL.Strings = (
      'SELECT IDUSUARIO, NOMEUSUARIO, DESCRICAO'
      'FROM USUARIOSISTEMA')
    ClientDataSet = cdsUsuario
    Left = 360
    Top = 56
  end
  object dsUsuario: TwwDataSource
    DataSet = cdsUsuario
    Left = 292
    Top = 11
  end
  object ppUsuario: TppBDEPipeline
    DataSource = dsUsuario
    CloseDataSource = True
    UserName = 'usuario'
    Left = 292
    Top = 59
  end
  object sqlUsuarioAcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT IDESPACESSO'
      'FROM USUARIOSISTEMA U'
      'UNION'
      'SELECT IDESPACESSO'
      'FROM USUARIOSISTEMA U, GRUPOUSU G'
      'WHERE U.IDUSUARIO = G.IDUSUARIO')
    ClientDataSet = CdsUsuarioAcesso
    Left = 32
    Top = 128
  end
  object CdsUsuarioAcesso: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 176
    Data = {
      2B1000009619E0BD0100000018000000010098010000030000003B000B494445
      535041434553534F08000400000000000100044C434944040001000908000000
      0000000000000010400000000000000000264000000000000000004A40000000
      00000000804C4000000000000000004F40000000000000000050400000000000
      00004050400000000000000080504000000000000000C0504000000000000000
      0051400000000000000040514000000000000000805140000000000000004052
      4000000000000000C05240000000000000000053400000000000000080534000
      000000000000C053400000000000000000544000000000000000405440000000
      00000000C0544000000000000000005540000000000000008055400000000000
      0000C05540000000000000000056400000000000000040564000000000000000
      8056400000000000000000574000000000000000805740000000000000000058
      4000000000000000405840000000000000008058400000000000000000594000
      0000000000004059400000000000000080594000000000000000C05940000000
      00000000005A4000000000000000405A4000000000000000805A400000000000
      0000C05A4000000000000000005B4000000000000000405B4000000000000000
      805B4000000000000000C05B4000000000000000005C4000000000000000405C
      4000000000000000805C4000000000000000C05C4000000000000000405D4000
      000000000000805D4000000000000000C05D4000000000000000005E40000000
      00000000405E4000000000000000805E4000000000000000C05E400000000000
      0000005F4000000000000000405F4000000000000000805F4000000000000000
      C05F400000000000000000604000000000000000206040000000000000004060
      40000000000000006060400000000000000080604000000000000000A0604000
      000000000000C0604000000000000000E0604000000000000000006140000000
      0000000020614000000000000000406140000000000000008061400000000000
      0000A0614000000000000000C0614000000000000000E0614000000000000000
      0062400000000000000020624000000000000000406240000000000000006062
      400000000000000080624000000000000000A0624000000000000000C0624000
      000000000000E062400000000000000000634000000000000000206340000000
      0000000040634000000000000000606340000000000000008063400000000000
      0000A0634000000000000000C0634000000000000000E0634000000000000000
      0064400000000000000020644000000000000000406440000000000000008064
      4000000000000000A0644000000000000000C064400000000000000020654000
      0000000000004065400000000000000060654000000000000000806540000000
      00000000A0654000000000000000E06540000000000000000066400000000000
      0000206640000000000000004066400000000000000060664000000000000000
      80664000000000000000A0664000000000000000C0664000000000000000E066
      4000000000000000006740000000000000002067400000000000000040674000
      0000000000006067400000000000000080674000000000000000A06740000000
      00000000C0674000000000000000E06740000000000000000068400000000000
      0000206840000000000000004068400000000000000060684000000000000000
      80684000000000000000A0684000000000000000C0684000000000000000E068
      4000000000000000006940000000000000002069400000000000000040694000
      0000000000006069400000000000000080694000000000000000A06940000000
      00000000C0694000000000000000E0694000000000000000006A400000000000
      0000206A4000000000000000406A4000000000000000606A4000000000000000
      806A4000000000000000A06A4000000000000000C06A4000000000000000E06A
      4000000000000000006B4000000000000000206B4000000000000000406B4000
      000000000000606B4000000000000000806B4000000000000000D07040000000
      00000000E0704000000000000000F07040000000000000000071400000000000
      0000707140000000000000008071400000000000000090714000000000000000
      0072400000000000000010724000000000000000207240000000000000003072
      4000000000000000407240000000000000005072400000000000000060724000
      0000000000007072400000000000000080724000000000000000907240000000
      00000000A0724000000000000000B0724000000000000000C072400000000000
      0000D07240000000000000008073400000000000000090734000000000000000
      F073400000000000000020744000000000000000407440000000000000008074
      4000000000000000A0744000000000000000B0744000000000000000C0744000
      000000000000D0744000000000000000E0744000000000000000007540000000
      0000000010754000000000000000207540000000000000003075400000000000
      0000507540000000000000001077400000000000000040774000000000000000
      50774000000000000000A0774000000000000000B0774000000000000000C077
      4000000000000000D07740000000000000000078400000000000000010784000
      0000000000004078400000000000000050784000000000000000607840000000
      000000007078400000000000000080784000000000000000A078400000000000
      0000C0784000000000000000D078400000000000000000794000000000000000
      1079400000000000000020794000000000000000307940000000000000006079
      400000000000000080794000000000000000A0794000000000000000B0794000
      000000000000E0794000000000000000F0794000000000000000607A40000000
      00000000707A4000000000000000807A4000000000000000C07A400000000000
      0000F07A4000000000000000007B4000000000000000207B4000000000000000
      607B4000000000000000807B4000000000000000A07B4000000000000000C07B
      4000000000000000D07B4000000000000000E07B4000000000000000507C4000
      000000000000707C4000000000000000807C4000000000000000907C40000000
      00000000B07C4000000000000000C07C4000000000000000D07C400000000000
      0000207D4000000000000000307D4000000000000000407D4000000000000000
      507D4000000000000000607D4000000000000000907D4000000000000000A07D
      4000000000000000C07D4000000000000000D07D4000000000000000E07D4000
      000000000000F07D4000000000000000007E4000000000000000107E40000000
      00000000207E4000000000000000307E4000000000000000407E400000000000
      0000707E4000000000000000807E4000000000000000907E4000000000000000
      A07E4000000000000000B07E4000000000000000C07E4000000000000000E07E
      4000000000000000F07E4000000000000000007F4000000000000000107F4000
      000000000000307F4000000000000000407F4000000000000000507F40000000
      00000000607F4000000000000000907F4000000000000000A07F400000000000
      0000B07F4000000000000000C07F4000000000000000D07F4000000000000000
      E07F4000000000000000F07F4000000000000000008040000000000000000880
      4000000000000000108040000000000000001880400000000000000020804000
      0000000000003080400000000000000038804000000000000000488040000000
      0000000050804000000000000000608040000000000000006880400000000000
      0000708040000000000000007880400000000000000080804000000000000000
      888040000000000000009080400000000000000098804000000000000000A080
      4000000000000000A8804000000000000000B0804000000000000000B8804000
      000000000000C0804000000000000000C8804000000000000000D08040000000
      00000000D8804000000000000000E0804000000000000000E880400000000000
      0000F0804000000000000000F880400000000000000000814000000000000000
      0881400000000000000010814000000000000000188140000000000000002081
      4000000000000000288140000000000000003081400000000000000038814000
      0000000000004081400000000000000048814000000000000000508140000000
      0000000058814000000000000000608140000000000000006881400000000000
      0000708140000000000000007881400000000000000080814000000000000000
      888140000000000000009081400000000000000098814000000000000000A081
      4000000000000000A8814000000000000000B0814000000000000000B8814000
      000000000000C0814000000000000000C8814000000000000000D08140000000
      00000000D8814000000000000000E0814000000000000000E881400000000000
      0000F0814000000000000000F881400000000000000000824000000000000000
      0882400000000000000010824000000000000000188240000000000000003082
      4000000000000000388240000000000000004082400000000000000048824000
      0000000000005082400000000000000058824000000000000000608240000000
      0000000070824000000000000000788240000000000000008082400000000000
      0000888240000000000000009082400000000000000098824000000000000000
      A0824000000000000000A8824000000000000000B0824000000000000000B882
      4000000000000000C0824000000000000000D0824000000000000000D8824000
      000000000000E0824000000000000000E8824000000000000000F08240000000
      00000000F8824000000000000000008340000000000000000883400000000000
      0000188340000000000000002083400000000000000028834000000000000000
      3083400000000000000038834000000000000000408340000000000000005883
      4000000000000000608340000000000000006883400000000000000070834000
      0000000000008883400000000000000090834000000000000000988340000000
      00000000A0834000000000000000A8834000000000000000B083400000000000
      0000C0834000000000000000C8834000000000000000D0834000000000000000
      D8834000000000000000E0834000000000000000E8834000000000000000F083
      4000000000000000F88340000000000000000084400000000000000008844000
      0000000000001084400000000000000018844000000000000000208440000000
      0000000028844000000000000000308440000000000000003884400000000000
      0000408440000000000000004884400000000000000050844000000000000000
      5884400000000000000060844000000000000000688440000000000000007084
      4000000000000000788440000000000000008084400000000000000090844000
      000000000000A0844000000000000000A8844000000000000000B88440000000
      00000000C0844000000000000000C8844000000000000000D084400000000000
      0000D8844000000000000000888540}
  end
  object sqlBackup: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDBACKCTRL, '
      '   TRGDTINCLUSAO, '
      
        '   TO_CHAR(IDBACKCTRL) || '#39' - '#39' || (TO_CHAR(TRGDTINCLUSAO, '#39'dd/m' +
        'm/yyyy hh:mi:ss'#39')) as descricao'
      'FROM BACKCTRL'
      'WHERE IDBACKCTRL =  :IDBACKCTRL'
      ''
      ' ')
    ClientDataSet = cdsBackup
    Left = 120
    Top = 128
  end
  object cdsBackup: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 128
  end
  object dsBackup: TwwDataSource
    DataSet = cdsBackup
    Left = 124
    Top = 179
  end
  object ppBack: TppBDEPipeline
    DataSource = dsBackup
    CloseDataSource = True
    UserName = 'backup'
    Left = 180
    Top = 179
  end
end
