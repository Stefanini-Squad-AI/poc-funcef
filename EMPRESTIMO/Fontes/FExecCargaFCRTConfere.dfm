inherited frmExecCargaFCRTConfere: TfrmExecCargaFCRTConfere
  Tag = 9999
  Left = 30
  Top = 124
  BorderStyle = bsSingle
  Caption = 'Carga de Empréstimos'
  ClientHeight = 397
  ClientWidth = 739
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 739
    Height = 364
    object DBGrid2: TDBGrid
      Left = 16
      Top = 275
      Width = 537
      Height = 75
      DataSource = dsCC
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
    object DBgrdParcelas: TDBGrid
      Left = 16
      Top = 253
      Width = 537
      Height = 92
      DataSource = dsParcela2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 8
      Width = 537
      Height = 121
      DataSource = dsContrato
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
    object DBgrdContratos: TDBGrid
      Left = 16
      Top = 136
      Width = 537
      Height = 217
      DataSource = dsParcela
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 739
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryContrato: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   "AEMCCEMC.DBF" CONTRATO'
      'WHERE'
      '   PROTOC =:PPROTOC')
    ValidateWithMask = True
    Left = 688
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'PPROTOC'
        ParamType = ptInput
      end>
    object qryContratoMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 6
    end
    object qryContratoSEQ: TStringField
      FieldName = 'SEQ'
      Size = 2
    end
    object qryContratoPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object qryContratoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryContratoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 3
    end
    object qryContratoPARC_TOTAL: TStringField
      FieldName = 'PARC_TOTAL'
      Size = 2
    end
    object qryContratoDIGITO: TStringField
      FieldName = 'DIGITO'
      Size = 1
    end
    object qryContratoIENCARG: TStringField
      FieldName = 'IENCARG'
      Size = 2
    end
    object qryContratoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryContratoEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 6
    end
    object qryContratoAPROVACAO: TStringField
      FieldName = 'APROVACAO'
      Size = 6
    end
    object qryContratoCONCESSAO: TStringField
      FieldName = 'CONCESSAO'
      Size = 6
    end
    object qryContratoPRIM_VCTO: TStringField
      FieldName = 'PRIM_VCTO'
      Size = 6
    end
    object qryContratoULT_VCTO: TStringField
      FieldName = 'ULT_VCTO'
      Size = 6
    end
    object qryContratoULT_CAPIT: TStringField
      FieldName = 'ULT_CAPIT'
      Size = 6
    end
    object qryContratoCANCEL: TStringField
      FieldName = 'CANCEL'
      Size = 6
    end
    object qryContratoMOT_CANCEL: TStringField
      FieldName = 'MOT_CANCEL'
      Size = 1
    end
    object qryContratoAUT_ESPEC: TStringField
      FieldName = 'AUT_ESPEC'
      Size = 1
    end
    object qryContratoCONTAB: TStringField
      FieldName = 'CONTAB'
      Size = 1
    end
    object qryContratoULT_PARC: TStringField
      FieldName = 'ULT_PARC'
      Size = 2
    end
    object qryContratoCRED_APROV: TFloatField
      FieldName = 'CRED_APROV'
    end
    object qryContratoJUROS_APRO: TFloatField
      FieldName = 'JUROS_APRO'
    end
    object qryContratoCORR_MONET: TFloatField
      FieldName = 'CORR_MONET'
    end
    object qryContratoTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object qryContratoVLR_BRUTO: TFloatField
      FieldName = 'VLR_BRUTO'
    end
    object qryContratoCOTA_QUIT: TFloatField
      FieldName = 'COTA_QUIT'
    end
    object qryContratoSLD_FINANC: TFloatField
      FieldName = 'SLD_FINANC'
    end
    object qryContratoSLD_ABERTO: TFloatField
      FieldName = 'SLD_ABERTO'
    end
    object qryContratoPRIM_PARC: TFloatField
      FieldName = 'PRIM_PARC'
    end
    object qryContratoOUTR_PARC: TFloatField
      FieldName = 'OUTR_PARC'
    end
    object qryContratoNUM_FAT: TStringField
      FieldName = 'NUM_FAT'
      Size = 7
    end
    object qryContratoPATROC: TStringField
      FieldName = 'PATROC'
      Size = 1
    end
    object qryContratoCLS_PART: TStringField
      FieldName = 'CLS_PART'
      Size = 1
    end
    object qryContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 2
    end
    object qryContratoBRANCO: TStringField
      FieldName = 'BRANCO'
      Size = 5
    end
  end
  object tblContrato: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'convenio = 046'
    Filtered = True
    TableName = 'aemccemc.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 616
    Top = 32
    object tblContratoMATRIC: TStringField
      DisplayWidth = 8
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblContratoSEQ: TStringField
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 2
    end
    object tblContratoPROTOC: TStringField
      DisplayWidth = 11
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblContratoTIPO: TStringField
      DisplayWidth = 5
      FieldName = 'TIPO'
      Size = 1
    end
    object tblContratoCONVENIO: TStringField
      DisplayWidth = 11
      FieldName = 'CONVENIO'
      Size = 3
    end
    object tblContratoPARC_TOTAL: TStringField
      DisplayWidth = 13
      FieldName = 'PARC_TOTAL'
      Size = 2
    end
    object tblContratoDIGITO: TStringField
      DisplayWidth = 7
      FieldName = 'DIGITO'
      Size = 1
    end
    object tblContratoIENCARG: TStringField
      DisplayWidth = 13
      FieldName = 'IENCARG'
      Size = 2
    end
    object tblContratoJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'JUROS'
    end
    object tblContratoEMISSAO: TStringField
      DisplayWidth = 9
      FieldName = 'EMISSAO'
      Size = 6
    end
    object tblContratoAPROVACAO: TStringField
      DisplayWidth = 13
      FieldName = 'APROVACAO'
      Size = 6
    end
    object tblContratoCONCESSAO: TStringField
      DisplayWidth = 13
      FieldName = 'CONCESSAO'
      Size = 6
    end
    object tblContratoPRIM_VCTO: TStringField
      DisplayWidth = 12
      FieldName = 'PRIM_VCTO'
      Size = 6
    end
    object tblContratoULT_VCTO: TStringField
      DisplayWidth = 11
      FieldName = 'ULT_VCTO'
      Size = 6
    end
    object tblContratoULT_CAPIT: TStringField
      DisplayWidth = 11
      FieldName = 'ULT_CAPIT'
      Size = 6
    end
    object tblContratoCANCEL: TStringField
      DisplayWidth = 8
      FieldName = 'CANCEL'
      Size = 6
    end
    object tblContratoMOT_CANCEL: TStringField
      DisplayWidth = 14
      FieldName = 'MOT_CANCEL'
      Size = 1
    end
    object tblContratoAUT_ESPEC: TStringField
      DisplayWidth = 12
      FieldName = 'AUT_ESPEC'
      Size = 1
    end
    object tblContratoCONTAB: TStringField
      DisplayWidth = 8
      FieldName = 'CONTAB'
      Size = 1
    end
    object tblContratoULT_PARC: TStringField
      DisplayWidth = 11
      FieldName = 'ULT_PARC'
      Size = 2
    end
    object tblContratoCRED_APROV: TFloatField
      DisplayWidth = 14
      FieldName = 'CRED_APROV'
    end
    object tblContratoJUROS_APRO: TFloatField
      DisplayWidth = 14
      FieldName = 'JUROS_APRO'
    end
    object tblContratoCORR_MONET: TFloatField
      DisplayWidth = 14
      FieldName = 'CORR_MONET'
    end
    object tblContratoTX_ADM: TFloatField
      DisplayWidth = 10
      FieldName = 'TX_ADM'
    end
    object tblContratoVLR_BRUTO: TFloatField
      DisplayWidth = 12
      FieldName = 'VLR_BRUTO'
    end
    object tblContratoCOTA_QUIT: TFloatField
      DisplayWidth = 12
      FieldName = 'COTA_QUIT'
    end
    object tblContratoSLD_FINANC: TFloatField
      DisplayWidth = 13
      FieldName = 'SLD_FINANC'
    end
    object tblContratoSLD_ABERTO: TFloatField
      DisplayWidth = 14
      FieldName = 'SLD_ABERTO'
    end
    object tblContratoPRIM_PARC: TFloatField
      DisplayWidth = 12
      FieldName = 'PRIM_PARC'
    end
    object tblContratoOUTR_PARC: TFloatField
      DisplayWidth = 13
      FieldName = 'OUTR_PARC'
    end
    object tblContratoNUM_FAT: TStringField
      DisplayWidth = 10
      FieldName = 'NUM_FAT'
      Size = 7
    end
    object tblContratoPATROC: TStringField
      DisplayWidth = 8
      FieldName = 'PATROC'
      Size = 1
    end
    object tblContratoCLS_PART: TStringField
      DisplayWidth = 11
      FieldName = 'CLS_PART'
      Size = 1
    end
    object tblContratoSIT_PART: TStringField
      DisplayWidth = 10
      FieldName = 'SIT_PART'
      Size = 2
    end
    object tblContratoBRANCO: TStringField
      DisplayWidth = 9
      FieldName = 'BRANCO'
      Size = 5
    end
  end
  object dsCC: TwwDataSource
    AutoEdit = False
    DataSet = tblContaCorrente
    Left = 568
    Top = 304
  end
  object dsParcela: TwwDataSource
    AutoEdit = False
    DataSet = tblParcela
    Left = 568
    Top = 80
  end
  object qryParcela: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   "AEMCPRPG.DBF" PARCELA,'
      '   "AEMCCEMC.DBF" CONTRATO'
      'WHERE'
      '       PARCELA.SEQ_PGTO >= '#39'01'#39
      '   AND PARCELA.NUM_PARCEL = '#39'01'#39
      '   AND (CONTRATO.CONVENIO = '#39'080'#39' OR CONTRATO.CONVENIO = '#39'090'#39')'
      '   AND CONTRATO.PROTOC = PARCELA.PROTOC'
      'ORDER BY'
      '   MATRIC, PROTOC, NUM_PARCEL, SEQ_PGTO'
      ' ')
    ValidateWithMask = True
    Left = 688
    Top = 216
    object qryParcelaMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 6
    end
    object qryParcelaSEQ: TStringField
      FieldName = 'SEQ'
      Size = 2
    end
    object qryParcelaPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object qryParcelaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryParcelaNUM_PARCEL: TStringField
      FieldName = 'NUM_PARCEL'
      Size = 2
    end
    object qryParcelaSEQ_PGTO: TStringField
      FieldName = 'SEQ_PGTO'
      Size = 2
    end
    object qryParcelaDT_INCLU: TStringField
      FieldName = 'DT_INCLU'
      Size = 6
    end
    object qryParcelaCONTABIL: TStringField
      FieldName = 'CONTABIL'
      Size = 1
    end
    object qryParcelaFOLHA: TStringField
      FieldName = 'FOLHA'
      Size = 1
    end
    object qryParcelaDT_VCTO: TStringField
      FieldName = 'DT_VCTO'
      Size = 6
    end
    object qryParcelaDT_CAPIT: TStringField
      FieldName = 'DT_CAPIT'
      Size = 6
    end
    object qryParcelaVLR_PRINCI: TFloatField
      FieldName = 'VLR_PRINCI'
    end
    object qryParcelaVLR_JUR_CO: TFloatField
      FieldName = 'VLR_JUR_CO'
    end
    object qryParcelaVLR_CORR_M: TFloatField
      FieldName = 'VLR_CORR_M'
    end
    object qryParcelaVLR_TAXA: TFloatField
      FieldName = 'VLR_TAXA'
    end
    object qryParcelaVLR_JUR_AT: TFloatField
      FieldName = 'VLR_JUR_AT'
    end
    object qryParcelaCORR_MON_A: TFloatField
      FieldName = 'CORR_MON_A'
    end
    object qryParcelaTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object qryParcelaJUR_INADI: TFloatField
      FieldName = 'JUR_INADI'
    end
    object qryParcelaCOR_MON_IN: TFloatField
      FieldName = 'COR_MON_IN'
    end
    object qryParcelaVLR_DESC_A: TFloatField
      FieldName = 'VLR_DESC_A'
    end
    object qryParcelaVLR_TOT_PG: TFloatField
      FieldName = 'VLR_TOT_PG'
    end
    object qryParcelaVLR_ULT_EN: TFloatField
      FieldName = 'VLR_ULT_EN'
    end
    object qryParcelaSEQ_ULT_PG: TStringField
      FieldName = 'SEQ_ULT_PG'
      Size = 2
    end
    object qryParcelaBRANCO: TStringField
      FieldName = 'BRANCO'
      Size = 1
    end
  end
  object tblParcela: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'protoc = 0002436'
    Filtered = True
    FieldDefs = <
      item
        Name = 'MATRIC'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SEQ'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROTOC'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUM_PARCEL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SEQ_PGTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DT_INCLU'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CONTABIL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FOLHA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_VCTO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DT_CAPIT'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'VLR_PRINCI'
        DataType = ftFloat
      end
      item
        Name = 'VLR_JUR_CO'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CORR_M'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TAXA'
        DataType = ftFloat
      end
      item
        Name = 'VLR_JUR_AT'
        DataType = ftFloat
      end
      item
        Name = 'CORR_MON_A'
        DataType = ftFloat
      end
      item
        Name = 'TX_ADM'
        DataType = ftFloat
      end
      item
        Name = 'JUR_INADI'
        DataType = ftFloat
      end
      item
        Name = 'COR_MON_IN'
        DataType = ftFloat
      end
      item
        Name = 'VLR_DESC_A'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TOT_PG'
        DataType = ftFloat
      end
      item
        Name = 'VLR_ULT_EN'
        DataType = ftFloat
      end
      item
        Name = 'SEQ_ULT_PG'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BRANCO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'tblParcelaIndex1'
      end>
    StoreDefs = True
    TableName = 'aemcprpg.DBF'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 616
    Top = 104
    object tblParcelaTIPO: TStringField
      DisplayLabel = 'tipo'
      DisplayWidth = 2
      FieldName = 'TIPO'
      Size = 1
    end
    object tblParcelaMATRIC: TStringField
      DisplayWidth = 8
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblParcelaPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblParcelaNUM_PARCEL: TStringField
      DisplayLabel = '# Par'
      DisplayWidth = 5
      FieldName = 'NUM_PARCEL'
      Size = 2
    end
    object tblParcelaSEQ_PGTO: TStringField
      DisplayLabel = 'seq'
      DisplayWidth = 3
      FieldName = 'SEQ_PGTO'
      Size = 2
    end
    object tblParcelaDT_VCTO: TStringField
      DisplayLabel = 'Dt_Venc'
      DisplayWidth = 8
      FieldName = 'DT_VCTO'
      Size = 6
    end
    object tblParcelaVLR_PRINCI: TFloatField
      DisplayLabel = 'Principal'
      DisplayWidth = 9
      FieldName = 'VLR_PRINCI'
    end
    object tblParcelaVLR_CORR_M: TFloatField
      DisplayLabel = 'CM'
      DisplayWidth = 8
      FieldName = 'VLR_CORR_M'
    end
    object tblParcelaVLR_TOT_PG: TFloatField
      DisplayLabel = 'Vlr_Pgto'
      DisplayWidth = 10
      FieldName = 'VLR_TOT_PG'
    end
    object tblParcelaCORR_MON_A: TFloatField
      DisplayLabel = 'CM_atraso'
      DisplayWidth = 10
      FieldName = 'CORR_MON_A'
    end
    object tblParcelaCOR_MON_IN: TFloatField
      DisplayWidth = 14
      FieldName = 'COR_MON_IN'
    end
    object tblParcelaVLR_ULT_EN: TFloatField
      DisplayLabel = 'Vlr_Ult'
      DisplayWidth = 9
      FieldName = 'VLR_ULT_EN'
    end
    object tblParcelaSEQ_ULT_PG: TStringField
      DisplayWidth = 13
      FieldName = 'SEQ_ULT_PG'
      Size = 2
    end
    object tblParcelaDT_CAPIT: TStringField
      DisplayLabel = 'Dt_Cap'
      DisplayWidth = 10
      FieldName = 'DT_CAPIT'
      Size = 6
    end
    object tblParcelaSEQ: TStringField
      DisplayLabel = 'seq'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 2
    end
    object tblParcelaFOLHA: TStringField
      DisplayWidth = 7
      FieldName = 'FOLHA'
      Size = 1
    end
    object tblParcelaDT_INCLU: TStringField
      DisplayLabel = 'Dt_Inc'
      DisplayWidth = 7
      FieldName = 'DT_INCLU'
      Size = 6
    end
    object tblParcelaCONTABIL: TStringField
      DisplayWidth = 10
      FieldName = 'CONTABIL'
      Size = 1
    end
    object tblParcelaBRANCO: TStringField
      DisplayWidth = 9
      FieldName = 'BRANCO'
      Size = 1
    end
    object tblParcelaVLR_JUR_CO: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_CO'
    end
    object tblParcelaVLR_TAXA: TFloatField
      DisplayWidth = 11
      FieldName = 'VLR_TAXA'
    end
    object tblParcelaVLR_JUR_AT: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_AT'
    end
    object tblParcelaTX_ADM: TFloatField
      DisplayWidth = 10
      FieldName = 'TX_ADM'
    end
    object tblParcelaJUR_INADI: TFloatField
      DisplayWidth = 11
      FieldName = 'JUR_INADI'
    end
    object tblParcelaVLR_DESC_A: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_DESC_A'
    end
  end
  object qryTipoContr: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT'
      '   CONVENIO, COUNT(CONVENIO)'
      'FROM'
      '   "AEMCCEMC.DBF" CONTRATO'
      'GROUP BY'
      '   CONVENIO'
      'ORDER BY'
      '   CONVENIO  ')
    ValidateWithMask = True
    Left = 688
    Top = 168
    object StringField1: TStringField
      DisplayWidth = 11
      FieldName = 'CONVENIO'
      Size = 3
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 8
      FieldName = 'COUNT OF CONVENIO'
    end
  end
  object qryDistinct: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT'
      '   PARCELA.PROTOC, count(disticnct(PARCELA.MATRIC))'
      'FROM'
      '   "AEMCPRPG.DBF" PARCELA'
      'group by'
      '   PARCELA.PROTOC'
      'having'
      '   count(disticnct(PARCELA.MATRIC)) > 1')
    ValidateWithMask = True
    Left = 688
    Top = 264
  end
  object tblContratoFind: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    FieldDefs = <
      item
        Name = 'MATRIC'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SEQ'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROTOC'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONVENIO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PARC_TOTAL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DIGITO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IENCARG'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'JUROS'
        DataType = ftFloat
      end
      item
        Name = 'EMISSAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'APROVACAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CONCESSAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PRIM_VCTO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ULT_VCTO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ULT_CAPIT'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CANCEL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MOT_CANCEL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AUT_ESPEC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTAB'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ULT_PARC'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CRED_APROV'
        DataType = ftFloat
      end
      item
        Name = 'JUROS_APRO'
        DataType = ftFloat
      end
      item
        Name = 'CORR_MONET'
        DataType = ftFloat
      end
      item
        Name = 'TX_ADM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_BRUTO'
        DataType = ftFloat
      end
      item
        Name = 'COTA_QUIT'
        DataType = ftFloat
      end
      item
        Name = 'SLD_FINANC'
        DataType = ftFloat
      end
      item
        Name = 'SLD_ABERTO'
        DataType = ftFloat
      end
      item
        Name = 'PRIM_PARC'
        DataType = ftFloat
      end
      item
        Name = 'OUTR_PARC'
        DataType = ftFloat
      end
      item
        Name = 'NUM_FAT'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'PATROC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CLS_PART'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SIT_PART'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BRANCO'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'CONTRATO.NDX'
        Fields = 'PROTOC'
        Options = [ixUnique, ixNonMaintained]
      end>
    IndexFiles.Strings = (
      'CONTRATO.NDX')
    IndexName = 'CONTRATO.NDX'
    StoreDefs = True
    TableName = 'aemccemc.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 688
    Top = 8
    object tblContratoFindMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblContratoFindSEQ: TStringField
      FieldName = 'SEQ'
      Size = 2
    end
    object tblContratoFindPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblContratoFindTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tblContratoFindCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 3
    end
    object tblContratoFindPARC_TOTAL: TStringField
      FieldName = 'PARC_TOTAL'
      Size = 2
    end
    object tblContratoFindDIGITO: TStringField
      FieldName = 'DIGITO'
      Size = 1
    end
    object tblContratoFindIENCARG: TStringField
      FieldName = 'IENCARG'
      Size = 2
    end
    object tblContratoFindJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object tblContratoFindEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 6
    end
    object tblContratoFindAPROVACAO: TStringField
      FieldName = 'APROVACAO'
      Size = 6
    end
    object tblContratoFindCONCESSAO: TStringField
      FieldName = 'CONCESSAO'
      Size = 6
    end
    object tblContratoFindPRIM_VCTO: TStringField
      FieldName = 'PRIM_VCTO'
      Size = 6
    end
    object tblContratoFindULT_VCTO: TStringField
      FieldName = 'ULT_VCTO'
      Size = 6
    end
    object tblContratoFindULT_CAPIT: TStringField
      FieldName = 'ULT_CAPIT'
      Size = 6
    end
    object tblContratoFindCANCEL: TStringField
      FieldName = 'CANCEL'
      Size = 6
    end
    object tblContratoFindMOT_CANCEL: TStringField
      FieldName = 'MOT_CANCEL'
      Size = 1
    end
    object tblContratoFindAUT_ESPEC: TStringField
      FieldName = 'AUT_ESPEC'
      Size = 1
    end
    object tblContratoFindCONTAB: TStringField
      FieldName = 'CONTAB'
      Size = 1
    end
    object tblContratoFindULT_PARC: TStringField
      FieldName = 'ULT_PARC'
      Size = 2
    end
    object tblContratoFindCRED_APROV: TFloatField
      FieldName = 'CRED_APROV'
    end
    object tblContratoFindJUROS_APRO: TFloatField
      FieldName = 'JUROS_APRO'
    end
    object tblContratoFindCORR_MONET: TFloatField
      FieldName = 'CORR_MONET'
    end
    object tblContratoFindTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object tblContratoFindVLR_BRUTO: TFloatField
      FieldName = 'VLR_BRUTO'
    end
    object tblContratoFindCOTA_QUIT: TFloatField
      FieldName = 'COTA_QUIT'
    end
    object tblContratoFindSLD_FINANC: TFloatField
      FieldName = 'SLD_FINANC'
    end
    object tblContratoFindSLD_ABERTO: TFloatField
      FieldName = 'SLD_ABERTO'
    end
    object tblContratoFindPRIM_PARC: TFloatField
      FieldName = 'PRIM_PARC'
    end
    object tblContratoFindOUTR_PARC: TFloatField
      FieldName = 'OUTR_PARC'
    end
    object tblContratoFindNUM_FAT: TStringField
      FieldName = 'NUM_FAT'
      Size = 7
    end
    object tblContratoFindPATROC: TStringField
      FieldName = 'PATROC'
      Size = 1
    end
    object tblContratoFindCLS_PART: TStringField
      FieldName = 'CLS_PART'
      Size = 1
    end
    object tblContratoFindSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 2
    end
    object tblContratoFindBRANCO: TStringField
      FieldName = 'BRANCO'
      Size = 5
    end
  end
  object dsParcela2: TwwDataSource
    AutoEdit = False
    DataSet = tblParcela2
    Left = 568
    Top = 200
  end
  object tblContaCorrente: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'PROTOC = 0050610'
    Filtered = True
    FieldDefs = <
      item
        Name = 'MATRIC'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 38
      end
      item
        Name = 'PREST'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'DEBITO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ANTERIOR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CREDMES'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FIL1'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PARC'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FIL3'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_VCT'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FIL2'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_PGT'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SALDO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CAMPO7'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PROTOC'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <
      item
        Name = 'tblParcelaIndex1'
      end>
    StoreDefs = True
    TableName = 'pemc83.DBF'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 616
    Top = 320
    object tblContaCorrenteMATRIC: TStringField
      DisplayWidth = 10
      FieldName = 'MATRIC'
      Size = 9
    end
    object tblContaCorrentePROTOC: TStringField
      DisplayWidth = 9
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblContaCorrentePREST: TStringField
      Alignment = taRightJustify
      DisplayWidth = 12
      FieldName = 'PREST'
      Size = 14
    end
    object tblContaCorrenteDEBITO: TStringField
      Alignment = taRightJustify
      DisplayWidth = 12
      FieldName = 'DEBITO'
      Size = 15
    end
    object tblContaCorrenteANTERIOR: TStringField
      Alignment = taRightJustify
      DisplayWidth = 12
      FieldName = 'ANTERIOR'
      Size = 15
    end
    object tblContaCorrenteCREDMES: TStringField
      Alignment = taRightJustify
      DisplayWidth = 12
      FieldName = 'CREDMES'
      Size = 15
    end
    object tblContaCorrenteSALDO: TStringField
      Alignment = taRightJustify
      DisplayWidth = 12
      FieldName = 'SALDO'
      Size = 15
    end
    object tblContaCorrenteCHAVE: TStringField
      Alignment = taRightJustify
      DisplayWidth = 40
      FieldName = 'CHAVE'
      Size = 38
    end
    object tblContaCorrenteFIL1: TStringField
      Alignment = taRightJustify
      DisplayWidth = 4
      FieldName = 'FIL1'
      Size = 1
    end
    object tblContaCorrentePARC: TStringField
      Alignment = taRightJustify
      DisplayWidth = 6
      FieldName = 'PARC'
      Size = 2
    end
    object tblContaCorrenteFIL3: TStringField
      Alignment = taRightJustify
      DisplayWidth = 4
      FieldName = 'FIL3'
      Size = 1
    end
    object tblContaCorrenteDT_VCT: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldName = 'DT_VCT'
      Size = 8
    end
    object tblContaCorrenteFIL2: TStringField
      Alignment = taRightJustify
      DisplayWidth = 4
      FieldName = 'FIL2'
      Size = 1
    end
    object tblContaCorrenteDT_PGT: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldName = 'DT_PGT'
      Size = 8
    end
    object tblContaCorrenteCAMPO7: TStringField
      Alignment = taRightJustify
      DisplayWidth = 8
      FieldName = 'CAMPO7'
      Size = 1
    end
  end
  object tblParcela2: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'PROTOC = 0045529'
    Filtered = True
    FieldDefs = <
      item
        Name = 'MATRIC'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SEQ'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROTOC'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUM_PARCEL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SEQ_PGTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DT_INCLU'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CONTABIL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FOLHA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_VCTO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DT_CAPIT'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'VLR_PRINCI'
        DataType = ftFloat
      end
      item
        Name = 'VLR_JUR_CO'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CORR_M'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TAXA'
        DataType = ftFloat
      end
      item
        Name = 'VLR_JUR_AT'
        DataType = ftFloat
      end
      item
        Name = 'CORR_MON_A'
        DataType = ftFloat
      end
      item
        Name = 'TX_ADM'
        DataType = ftFloat
      end
      item
        Name = 'JUR_INADI'
        DataType = ftFloat
      end
      item
        Name = 'COR_MON_IN'
        DataType = ftFloat
      end
      item
        Name = 'VLR_DESC_A'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TOT_PG'
        DataType = ftFloat
      end
      item
        Name = 'VLR_ULT_EN'
        DataType = ftFloat
      end
      item
        Name = 'SEQ_ULT_PG'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BRANCO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'tblParcelaIndex1'
      end>
    StoreDefs = True
    TableName = 'aemcprpg_diferenca.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 616
    Top = 224
    object StringField2: TStringField
      DisplayWidth = 8
      FieldName = 'MATRIC'
      Size = 6
    end
    object StringField3: TStringField
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 2
    end
    object StringField4: TStringField
      DisplayWidth = 9
      FieldName = 'PROTOC'
      Size = 7
    end
    object StringField5: TStringField
      DisplayWidth = 5
      FieldName = 'TIPO'
      Size = 1
    end
    object StringField6: TStringField
      DisplayWidth = 14
      FieldName = 'NUM_PARCEL'
      Size = 2
    end
    object StringField7: TStringField
      DisplayWidth = 11
      FieldName = 'SEQ_PGTO'
      Size = 2
    end
    object StringField8: TStringField
      DisplayWidth = 10
      FieldName = 'DT_INCLU'
      Size = 6
    end
    object StringField9: TStringField
      DisplayWidth = 10
      FieldName = 'CONTABIL'
      Size = 1
    end
    object StringField10: TStringField
      DisplayWidth = 7
      FieldName = 'FOLHA'
      Size = 1
    end
    object StringField11: TStringField
      DisplayWidth = 10
      FieldName = 'DT_VCTO'
      Size = 6
    end
    object StringField12: TStringField
      DisplayWidth = 10
      FieldName = 'DT_CAPIT'
      Size = 6
    end
    object FloatField1: TFloatField
      DisplayWidth = 12
      FieldName = 'VLR_PRINCI'
    end
    object FloatField2: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_CO'
    end
    object FloatField3: TFloatField
      DisplayWidth = 14
      FieldName = 'VLR_CORR_M'
    end
    object FloatField4: TFloatField
      DisplayWidth = 11
      FieldName = 'VLR_TAXA'
    end
    object FloatField5: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_AT'
    end
    object FloatField6: TFloatField
      DisplayWidth = 15
      FieldName = 'CORR_MON_A'
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'TX_ADM'
    end
    object FloatField8: TFloatField
      DisplayWidth = 11
      FieldName = 'JUR_INADI'
    end
    object FloatField9: TFloatField
      DisplayWidth = 14
      FieldName = 'COR_MON_IN'
    end
    object FloatField10: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_DESC_A'
    end
    object FloatField11: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_TOT_PG'
    end
    object FloatField12: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_ULT_EN'
    end
    object StringField13: TStringField
      DisplayWidth = 13
      FieldName = 'SEQ_ULT_PG'
      Size = 2
    end
    object StringField14: TStringField
      DisplayWidth = 9
      FieldName = 'BRANCO'
      Size = 1
    end
  end
  object dsContrato: TwwDataSource
    AutoEdit = False
    DataSet = tblContrato
    Left = 568
    Top = 8
  end
end
