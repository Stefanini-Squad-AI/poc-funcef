inherited RptExtrato: TRptExtrato
  Left = 287
  Top = 215
  Width = 491
  Height = 152
  Caption = 'RptExtrato'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Pagamentos e Recebimentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Contrato'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT C.NOMECONTRATO,C.IDCONTRATO'
          'FROM CONTRATOCONTR C, CONTRATOUSUARIO U'
          'WHERE C.IDCONTRATO=U.IDCONTRATO'
          'ORDER BY C.NOMECONTRATO')
        LookupSettings.Chave = 'IDCONTRATO'
        LookupSettings.Display = 'NOMECONTRATO'
        LookupSettings.Descricao = 'Contrato'
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
        Caption = 'Favorecido'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT C.IDFORCLI,P.RAZAOSOCIAL'
          'FROM CONTRATOCONTR C,'
          '     CONTRATOUSUARIO U, PESSOA P'
          'WHERE C.IDCONTRATO = U.IDCONTRATO'
          '      AND C.IDFORCLI = P.IDPESSOA'
          'ORDER BY P.RAZAOSOCIAL')
        LookupSettings.Chave = 'IDFORCLI'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Favorecido'
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
        Caption = 'Processo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT C.CODCONTRATOEMPR'
          'FROM CONTRATOCONTR C, CONTRATOUSUARIO U'
          'WHERE C.IDCONTRATO=U.IDCONTRATO'
          'ORDER BY C.CODCONTRATOEMPR')
        LookupSettings.Chave = 'CODCONTRATOEMPR'
        LookupSettings.Display = 'CODCONTRATOEMPR'
        LookupSettings.Descricao = 'Processo'
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
        Caption = 'Num. Documento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Caption = 'Compl. Documento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Caption = 'Valor do Documento'
        Controle = tcEdit
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = ()
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
        Caption = 'Data de Vencimento'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 250
    FormWidth = 400
    Left = 448
  end
  inherited DevRptCM: TExtraOptions
    Left = 368
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpExtrato
    Left = 408
  end
  object spExtrato: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       OC.IDCONTRATO, '
      '       OC.IDOBJETO, '
      '       OC.IDITEM, '
      '       C.CODCONTRATOEMPR, '
      '       C.NOMECONTRATO,'
      '       C.DATAINICIO,'
      '       O.NOMEOBJETO, '
      '       I.NOME_ITEM, '
      '       OC.VALORTOTALOBJETO, '
      '       P.DATAVENCPARCELA, '
      '       P.QTDEPARCELA, '
      '       P.VALOROBJPARCELA, '
      '       P.VLRMOEDACORRENTE, '
      
        '       DECODE(P.NUMNOTAFISCAL, NULL, DECODE(D.NODOCUMENTO, NULL,' +
        ' '#39' '#39', D.NODOCUMENTO) || DECODE(D.COMPLDOCUMENTO, NULL, '#39' '#39', '#39'/'#39' ' +
        '|| D.COMPLDOCUMENTO), P.NUMNOTAFISCAL) AS NUMNOTAFISCAL, '
      '       C.RENOVACAO, '
      '       C.OBSERVACAO,'
      '       D.CODDOCUMENTO,'
      '       LANCTO.VALORENCARGO'
      'FROM PARCELAREALCONTR P, '
      '       OBJETOSXITEMCONTR OC, '
      '       ITEMCONTRATUAL I, '
      '       OBJETOCONTRATUAL O, '
      '       CONTRATOCONTR C, '
      '       DOCUMENTO D,'
      
        '      (SELECT SUM(DECODE(L.DEBCRE,'#39'D'#39',DECODE(D1.RECPAG,'#39'R'#39',L.VAL' +
        'OR,L.VALOR * -1),DECODE(D1.RECPAG,'#39'R'#39',L.VALOR * -1,L.VALOR)) ) A' +
        'S VALORENCARGO ,'
      #9'        D1.CODDOCUMENTO '
      '       FROM LANCTODOCUM L,  DOCUMENTO D1 '
      '       WHERE L.OPERACAO = 4 AND '
      '                      D1.CODDOCUMENTO = L.CODDOCUMENTO'
      '        GROUP BY D1.CODDOCUMENTO)  LANCTO'
      ''
      'WHERE P.IDCONTRATO  = OC.IDCONTRATO '
      '   AND P.IDOBJETO   = OC.IDOBJETO '
      '   AND P.IDITEM     = OC.IDITEM '
      '   AND C.IDCONTRATO = OC.IDCONTRATO '
      '   AND O.IDOBJETO   = OC.IDOBJETO '
      '   AND I.IDITEM     = OC.IDITEM '
      '   AND P.CODDOCUMENTO = D.CODDOCUMENTO'
      '   AND D.CODDOCUMENTO = LANCTO.CODDOCUMENTO(+)'
      '   AND D.CODDOCUMENTO = -1'
      ' '
      ' ')
    ClientDataSet = cdsExtrato
    Left = 368
    Top = 64
  end
  object cdsExtrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 64
    object cdsExtratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object cdsExtratoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object cdsExtratoIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object cdsExtratoCODCONTRATOEMPR: TStringField
      FieldName = 'CODCONTRATOEMPR'
    end
    object cdsExtratoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object cdsExtratoDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object cdsExtratoNOMEOBJETO: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object cdsExtratoNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object cdsExtratoVALORTOTALOBJETO: TFloatField
      FieldName = 'VALORTOTALOBJETO'
    end
    object cdsExtratoDATAVENCPARCELA: TDateTimeField
      FieldName = 'DATAVENCPARCELA'
    end
    object cdsExtratoQTDEPARCELA: TFloatField
      FieldName = 'QTDEPARCELA'
    end
    object cdsExtratoVALOROBJPARCELA: TFloatField
      FieldName = 'VALOROBJPARCELA'
    end
    object cdsExtratoVLRMOEDACORRENTE: TFloatField
      FieldName = 'VLRMOEDACORRENTE'
    end
    object cdsExtratoNUMNOTAFISCAL: TStringField
      FieldName = 'NUMNOTAFISCAL'
      Size = 44
    end
    object cdsExtratoRENOVACAO: TMemoField
      FieldName = 'RENOVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object cdsExtratoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object cdsExtratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsExtratoVALORENCARGO: TFloatField
      FieldName = 'VALORENCARGO'
    end
  end
  object rpExtrato: TppReport
    AutoStop = False
    DataPipeline = pplExtrato
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
    Left = 448
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplExtrato'
    object ppHeaderPgto: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppTitPagtoRec: TppLabel
        UserName = 'ppTitPagtoRec'
        AutoSize = False
        Caption = 'Extrato de Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8996
        mmWidth = 197115
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'Nome Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 0
      end
      object rpPgtoLb4: TppLabel
        UserName = 'rpPgtoLb4'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 247121
        mmTop = 18256
        mmWidth = 19050
        BandType = 0
      end
    end
    object ppDetailPgto: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpPgtoDBT1: TppDBText
        UserName = 'rpPgtoDBT1'
        DataField = 'NUMNOTAFISCAL'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 12965
        mmTop = 265
        mmWidth = 34131
        BandType = 4
      end
      object rpPgtoDBT5: TppDBText
        UserName = 'rpPgtoDBT5'
        DataField = 'DATAVENCPARCELA'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpPgtoDBT6: TppDBText
        UserName = 'rpPgtoDBT6'
        DataField = 'QTDEPARCELA'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object rpPgtoDBT7: TppDBText
        UserName = 'rpPgtoDBT7'
        DataField = 'VALOROBJPARCELA'
        DataPipeline = pplExtrato
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 108479
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRMOEDACORRENTE'
        DataPipeline = pplExtrato
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 265
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
        mmTop = 529
        mmWidth = 197115
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Contratos e Projetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
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
        mmLeft = 163777
        mmTop = 529
        mmWidth = 33867
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATO'
      DataPipeline = pplExtrato
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpPgtoLb1: TppLabel
          UserName = 'rpPgtoLb1'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2117
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpPgtoLb2: TppLabel
          UserName = 'rpPgtoLb2'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 47890
          mmTop = 2117
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CODCONTRATOEMPR'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplExtrato'
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6615
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
        end
        object rpPgtoDBT2: TppDBText
          UserName = 'rpPgtoDBT2'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplExtrato'
          mmHeight = 3969
          mmLeft = 47890
          mmTop = 6615
          mmWidth = 142875
          BandType = 3
          GroupNo = 0
        end
        object rpPgtoLine1: TppLine
          UserName = 'rpPgtoLine1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          mmHeight = 7408
          mmLeft = 11377
          mmTop = 1058
          mmWidth = 185473
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel7: TppLabel
            UserName = 'Label7'
            Caption = 'Total Pago para o Contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 97102
            mmTop = 3175
            mmWidth = 33073
            BandType = 5
            GroupNo = 0
          end
          object iTotPagoContr: TppDBCalc
            UserName = 'iTotPagoContr'
            DataField = 'VLRMOEDACORRENTE'
            DataPipeline = pplExtrato
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 132292
            mmTop = 3175
            mmWidth = 23019
            BandType = 5
            GroupNo = 0
          end
          object ppLabel11: TppLabel
            UserName = 'Label11'
            Caption = 'Total Devido do Contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 18785
            mmTop = 3175
            mmWidth = 30427
            BandType = 5
            GroupNo = 0
          end
          object iTotContr: TppDBCalc
            UserName = 'iTotContr'
            DataField = 'VALORTOTALOBJETO'
            DataPipeline = pplExtrato
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 49742
            mmTop = 3175
            mmWidth = 23019
            BandType = 5
            GroupNo = 0
          end
          object ppLabel12: TppLabel
            UserName = 'Label12'
            Caption = 'Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 162454
            mmTop = 3175
            mmWidth = 6879
            BandType = 5
            GroupNo = 0
          end
          object iVlrSaldoContr: TppVariable
            UserName = 'iVlrSaldoContr'
            AutoSize = False
            CalcOrder = 0
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 170392
            mmTop = 3175
            mmWidth = 21960
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDITEM'
      DataPipeline = pplExtrato
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOMEOBJETO'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplExtrato'
          mmHeight = 3175
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 96044
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOME_ITEM'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplExtrato'
          mmHeight = 3175
          mmLeft = 100806
          mmTop = 1323
          mmWidth = 96044
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Nr. Nota Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 12965
          mmTop = 5556
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 9525
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 56886
          mmTop = 5821
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 5821
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Valor Unit.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 5556
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142082
          mmTop = 6085
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object rpPgtoLine4: TppLine
          UserName = 'rpPgtoLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 7408
          mmLeft = 11377
          mmTop = 1323
          mmWidth = 185473
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel6: TppLabel
            UserName = 'Label6'
            Caption = 'Total Pago para o Objeto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 100277
            mmTop = 3175
            mmWidth = 30692
            BandType = 5
            GroupNo = 1
          end
          object iTotVlrPagoObj: TppDBCalc
            UserName = 'iTotVlrPagoObj'
            DataField = 'VLRMOEDACORRENTE'
            DataPipeline = pplExtrato
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 133086
            mmTop = 3175
            mmWidth = 23019
            BandType = 5
            GroupNo = 1
          end
          object ppLabel8: TppLabel
            UserName = 'Label8'
            Caption = 'Total Devido para o Objeto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 17198
            mmTop = 3175
            mmWidth = 32808
            BandType = 5
            GroupNo = 1
          end
          object itotVlrContObj: TppDBCalc
            UserName = 'itotVlrContObj'
            DataField = 'VALORTOTALOBJETO'
            DataPipeline = pplExtrato
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 50536
            mmTop = 3175
            mmWidth = 23019
            BandType = 5
            GroupNo = 1
          end
          object ppLabel9: TppLabel
            UserName = 'Label9'
            Caption = 'Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 163248
            mmTop = 3175
            mmWidth = 6879
            BandType = 5
            GroupNo = 1
          end
          object iVlrSaldoObj: TppVariable
            UserName = 'iVlrSaldoObj'
            AutoSize = False
            CalcOrder = 0
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 171186
            mmTop = 3175
            mmWidth = 21960
            BandType = 5
            GroupNo = 1
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061B
        47726F7570466F6F74657242616E64324265666F72655072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F75726365068070726F
        6365647572652047726F7570466F6F74657242616E64324265666F7265507269
        6E743B0D0A626567696E0D0A202069566C7253616C646F4F626A2E4173457874
        656E646564203A3D2069746F74566C72436F6E744F626A2E56616C7565202D20
        69546F74566C725061676F4F626A2E56616C75653B0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65061047726F7570466F6F74657242616E6432094576
        656E744E616D65060B4265666F72655072696E74074576656E74494402180001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061B47
        726F7570466F6F74657242616E64314265666F72655072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F75726365067C70726F63
        65647572652047726F7570466F6F74657242616E64314265666F72655072696E
        743B0D0A626567696E0D0A202069566C7253616C646F436F6E74722E41734578
        74656E646564203A3D2069746F74436F6E74722E56616C7565202D2069546F74
        5061676F436F6E74722E56616C75653B0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65061047726F7570466F6F74657242616E6431094576656E744E61
        6D65060B4265666F72655072696E74074576656E74494402180000}
    end
  end
  object pplExtrato: TppBDEPipeline
    DataSource = dsExtrato
    UserName = 'lExtrato'
    Left = 408
    Top = 64
    object pplExtratoppField1: TppField
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField2: TppField
      FieldAlias = 'IDOBJETO'
      FieldName = 'IDOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField3: TppField
      FieldAlias = 'IDITEM'
      FieldName = 'IDITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField4: TppField
      FieldAlias = 'CODCONTRATOEMPR'
      FieldName = 'CODCONTRATOEMPR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField5: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField6: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField7: TppField
      FieldAlias = 'NOMEOBJETO'
      FieldName = 'NOMEOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField8: TppField
      FieldAlias = 'NOME_ITEM'
      FieldName = 'NOME_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField9: TppField
      FieldAlias = 'VALORTOTALOBJETO'
      FieldName = 'VALORTOTALOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField10: TppField
      FieldAlias = 'DATAVENCPARCELA'
      FieldName = 'DATAVENCPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField11: TppField
      FieldAlias = 'QTDEPARCELA'
      FieldName = 'QTDEPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField12: TppField
      FieldAlias = 'VALOROBJPARCELA'
      FieldName = 'VALOROBJPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField13: TppField
      FieldAlias = 'VLRMOEDACORRENTE'
      FieldName = 'VLRMOEDACORRENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField14: TppField
      FieldAlias = 'NUMNOTAFISCAL'
      FieldName = 'NUMNOTAFISCAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField15: TppField
      FieldAlias = 'RENOVACAO'
      FieldName = 'RENOVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField16: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField17: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplExtratoppField18: TppField
      FieldAlias = 'VALORENCARGO'
      FieldName = 'VALORENCARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object dsExtrato: TwwDataSource
    DataSet = cdsExtrato
    Left = 328
    Top = 64
  end
end
