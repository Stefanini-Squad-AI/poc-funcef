inherited frmExecCargaFCRT: TfrmExecCargaFCRT
  Tag = 9999
  Left = 19
  Top = 92
  BorderStyle = bsSingle
  Caption = 'Carga de Empréstimos'
  ClientHeight = 410
  ClientWidth = 748
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 748
    Height = 377
    object Bevel3: TBevel
      Left = 168
      Top = 20
      Width = 145
      Height = 3
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 168
      Top = 44
      Width = 145
      Height = 3
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 168
      Top = 8
      Width = 3
      Height = 61
      Shape = bsLeftLine
    end
    object Bevel4: TBevel
      Left = 168
      Top = 68
      Width = 145
      Height = 3
      Shape = bsTopLine
    end
    object Bevel5: TBevel
      Left = 240
      Top = 8
      Width = 3
      Height = 61
      Shape = bsLeftLine
    end
    object Bevel6: TBevel
      Left = 312
      Top = 8
      Width = 3
      Height = 61
      Shape = bsLeftLine
    end
    object Label1: TLabel
      Left = 187
      Top = 5
      Width = 34
      Height = 13
      Caption = 'Início'
    end
    object Label2: TLabel
      Left = 253
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Término'
    end
    object lblConcessaoIni: TLabel
      Left = 179
      Top = 26
      Width = 51
      Height = 13
      Alignment = taCenter
      Caption = '00:00:00'
      Visible = False
    end
    object lblConcessaoFim: TLabel
      Left = 251
      Top = 26
      Width = 51
      Height = 13
      Alignment = taCenter
      Caption = '00:00:00'
      Visible = False
    end
    object lblParcelaIni: TLabel
      Left = 179
      Top = 50
      Width = 51
      Height = 13
      Alignment = taCenter
      Caption = '00:00:00'
      Visible = False
    end
    object lblParcelaFim: TLabel
      Left = 251
      Top = 50
      Width = 51
      Height = 13
      Alignment = taCenter
      Caption = '00:00:00'
      Visible = False
    end
    object Label3: TLabel
      Left = 368
      Top = 26
      Width = 67
      Height = 13
      Caption = 'Matrícula:  '
    end
    object Label4: TLabel
      Left = 368
      Top = 50
      Width = 67
      Height = 13
      Caption = 'Protocolo:  '
    end
    object Label5: TLabel
      Left = 492
      Top = 348
      Width = 185
      Height = 13
      Caption = 'EXCLUIR primeiros N registros:  '
      Enabled = False
    end
    object Label6: TLabel
      Left = 16
      Top = 330
      Width = 425
      Height = 13
      Caption = 
        'Carregar as parcelas para o Oracle antes de fazer a carga (p/ qr' +
        'yExiste02)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBgrdParcelas: TDBGrid
      Left = 16
      Top = 160
      Width = 537
      Height = 169
      DataSource = dsParcela
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
    object chkConcessao: TCheckBox
      Left = 16
      Top = 24
      Width = 145
      Height = 17
      Caption = 'Carregar Concessões'
      TabOrder = 2
    end
    object chkParcela: TCheckBox
      Left = 16
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Carregar Parcelas'
      TabOrder = 3
    end
    object edtMatricula: TEdit
      Left = 432
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtProtocolo: TEdit
      Left = 432
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '0051620'
    end
    object edtQuant: TEdit
      Left = 672
      Top = 344
      Width = 41
      Height = 21
      Enabled = False
      TabOrder = 7
    end
    object Button1: TBitBtn
      Left = 717
      Top = 345
      Width = 21
      Height = 20
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 344
      Width = 65
      Height = 25
      Caption = 'p/ Oracle'
      TabOrder = 8
      OnClick = BitBtn1Click
    end
    object DBgrdContratos: TDBGrid
      Left = 16
      Top = 80
      Width = 537
      Height = 73
      DataSource = dsContrato
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
    object Button2: TBitBtn
      Left = 96
      Top = 344
      Width = 65
      Height = 25
      Caption = 'Batimento'
      TabOrder = 9
      OnClick = Button2Click
    end
    object Button3: TBitBtn
      Left = 176
      Top = 344
      Width = 65
      Height = 25
      Caption = 'Preenche'
      TabOrder = 10
      OnClick = Button3Click
    end
    object Button4: TBitBtn
      Left = 256
      Top = 344
      Width = 65
      Height = 25
      Caption = 'Limpa'
      Enabled = False
      TabOrder = 11
      OnClick = Button4Click
    end
    object BitBtn2: TBitBtn
      Left = 336
      Top = 344
      Width = 65
      Height = 25
      Caption = 'Saldos'
      Enabled = False
      TabOrder = 12
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 416
      Top = 344
      Width = 65
      Height = 25
      Caption = 'Moeda'
      Enabled = False
      TabOrder = 13
      OnClick = BitBtn3Click
    end
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 748
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
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
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
    Top = 64
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
    Filter = 'PROTOC = 005278'
    Filtered = True
    TableName = 'aemccemc.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 584
    Top = 256
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
  object dsContrato: TwwDataSource
    AutoEdit = False
    DataSet = tblContratoFind
    Left = 688
    Top = 16
  end
  object dsParcela: TwwDataSource
    AutoEdit = False
    DataSet = tblParcela
    Left = 640
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
    Left = 640
    Top = 96
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
    Filter = 'MATRIC = 052969'
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
    TableName = 'aemcprpg.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 640
    Top = 240
    object tblParcelaMATRIC: TStringField
      DisplayWidth = 8
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblParcelaSEQ: TStringField
      DisplayWidth = 4
      FieldName = 'SEQ'
      Size = 2
    end
    object tblParcelaPROTOC: TStringField
      DisplayWidth = 9
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblParcelaTIPO: TStringField
      DisplayWidth = 5
      FieldName = 'TIPO'
      Size = 1
    end
    object tblParcelaNUM_PARCEL: TStringField
      DisplayWidth = 14
      FieldName = 'NUM_PARCEL'
      Size = 2
    end
    object tblParcelaSEQ_PGTO: TStringField
      DisplayWidth = 11
      FieldName = 'SEQ_PGTO'
      Size = 2
    end
    object tblParcelaDT_INCLU: TStringField
      DisplayWidth = 10
      FieldName = 'DT_INCLU'
      Size = 6
    end
    object tblParcelaCONTABIL: TStringField
      DisplayWidth = 10
      FieldName = 'CONTABIL'
      Size = 1
    end
    object tblParcelaFOLHA: TStringField
      DisplayWidth = 7
      FieldName = 'FOLHA'
      Size = 1
    end
    object tblParcelaDT_VCTO: TStringField
      DisplayWidth = 10
      FieldName = 'DT_VCTO'
      Size = 6
    end
    object tblParcelaDT_CAPIT: TStringField
      DisplayWidth = 10
      FieldName = 'DT_CAPIT'
      Size = 6
    end
    object tblParcelaVLR_PRINCI: TFloatField
      DisplayWidth = 12
      FieldName = 'VLR_PRINCI'
    end
    object tblParcelaVLR_JUR_CO: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_CO'
    end
    object tblParcelaVLR_CORR_M: TFloatField
      DisplayWidth = 14
      FieldName = 'VLR_CORR_M'
    end
    object tblParcelaVLR_TAXA: TFloatField
      DisplayWidth = 11
      FieldName = 'VLR_TAXA'
    end
    object tblParcelaVLR_JUR_AT: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_JUR_AT'
    end
    object tblParcelaCORR_MON_A: TFloatField
      DisplayWidth = 15
      FieldName = 'CORR_MON_A'
    end
    object tblParcelaTX_ADM: TFloatField
      DisplayWidth = 10
      FieldName = 'TX_ADM'
    end
    object tblParcelaJUR_INADI: TFloatField
      DisplayWidth = 11
      FieldName = 'JUR_INADI'
    end
    object tblParcelaCOR_MON_IN: TFloatField
      DisplayWidth = 14
      FieldName = 'COR_MON_IN'
    end
    object tblParcelaVLR_DESC_A: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_DESC_A'
    end
    object tblParcelaVLR_TOT_PG: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_TOT_PG'
    end
    object tblParcelaVLR_ULT_EN: TFloatField
      DisplayWidth = 13
      FieldName = 'VLR_ULT_EN'
    end
    object tblParcelaSEQ_ULT_PG: TStringField
      DisplayWidth = 13
      FieldName = 'SEQ_ULT_PG'
      Size = 2
    end
    object tblParcelaBRANCO: TStringField
      DisplayWidth = 9
      FieldName = 'BRANCO'
      Size = 1
    end
  end
  object qryInsertHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVEMPTMO'
      '('
      'IDHISTMOVEMPTMO,'
      'IDCONTRATOEMPTMO,'
      'IDITEMEMPTMO,'
      'HMETIPOMOV,'
      'HMEORIGEM,'
      'HMECENTRALIZA,'
      'HMEDESTACADO,'
      'HMEPARCELA,'
      'HMENUMPARCELAS,'
      'HMESEQCOBRANCA,'
      'HMEFORMACOBRANCA,'
      'HMETIPOFOLHA,'
      'HMEVLRPREVISTO,'
      'HMEVLREFETIVO,'
      'HMESALDODEV,'
      'HMEDATA,'
      'HMEDATAPREVISTA,'
      'HMEDATAVENCTO,'
      'HMEDATAEFETIVA,'
      'HMEDATAATUALIZA,'
      'HMEANOCOMPETENCIA,'
      'HMEMESCOMPETENCIA,'
      'HMEANOCOBRANCA,'
      'HMEMESCOBRANCA,'
      'FLGBAIXADO,'
      'FLGENVIO,'
      'IDRUBRICA,'
      'HMERECPAG'
      ')'
      'VALUES'
      '('
      ':PIDHISTMOVEMPTMO,'
      ':PIDCONTRATOEMPTMO,'
      ':PIDITEMEMPTMO,'
      ':PHMETIPOMOV,'
      '9,'
      ':PHMECENTRALIZA,'
      ':PHMEDESTACADO,'
      ':PHMEPARCELA,'
      ':PHMENUMPARCELAS,'
      ':PHMESEQCOBRANCA,'
      ':PHMEFORMACOBRANCA,'
      ':PHMETIPOFOLHA,'
      ':PHMEVLRPREVISTO,'
      ':PHMEVLREFETIVO,'
      ':PHMESALDODEV,'
      ':PHMEDATA,'
      ':PHMEDATAPREVISTA,'
      ':PHMEDATAVENCTO,'
      ':PHMEDATAEFETIVA,'
      ':PHMEDATAATUALIZA,'
      ':PHMEANOCOMPETENCIA,'
      ':PHMEMESCOMPETENCIA,'
      ':PHMEANOCOBRANCA,'
      ':PHMEMESCOBRANCA,'
      ':PFLGBAIXADO,'
      ':PFLGENVIO,'
      ':PIDRUBRICA,'
      ':PHMERECPAG'
      ')')
    ValidateWithMask = True
    Left = 688
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMECENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEDESTACADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMENUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMESEQCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMETIPOFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMEVLRPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end>
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
    Left = 640
    Top = 48
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
  object qryExisteParcelaBatimento: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT PROTOC'
      'FROM'
      '   "AEMCPRPG.DBF" PARCELA'
      'WHERE'
      '   PARCELA.PROTOC =:PPROTOC')
    ValidateWithMask = True
    Left = 640
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'PPROTOC'
        ParamType = ptInput
      end>
    object qryExisteParcelaBatimentoPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
  end
  object qrySomaEncargos: TwwQuery
    DatabaseName = 'C:\projetoscm5\emprestimo'
    SQL.Strings = (
      'SELECT'
      '   SUM(PARCELA.CORR_MON_A)'
      'FROM'
      '   "AEMCPRPG2.DBF" PARCELA'
      'WHERE'
      '       PARCELA.SEQ_PGTO    >= '#39'01'#39
      '   AND PARCELA.NUM_PARCEL  =:PNUM_PARCEL'
      '   AND PARCELA.PROTOC      =:PPROTOC')
    ValidateWithMask = True
    Left = 640
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUM_PARCEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPROTOC'
        ParamType = ptInput
      end>
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
    Left = 584
    Top = 112
  end
  object tblContratoFind: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    DefaultIndex = False
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
        Options = [ixNonMaintained]
      end>
    IndexFieldNames = 'PROTOC'
    IndexFiles.Strings = (
      'CONTRATO.NDX')
    StoreDefs = True
    TableName = 'aemccemc.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 696
    Top = 208
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
  object tblParcelaFind: TwwTable
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
    StoreDefs = True
    TableName = 'aemcprpg2.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 584
    Top = 64
    object tblParcelaFindMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblParcelaFindSEQ: TStringField
      FieldName = 'SEQ'
      Size = 2
    end
    object tblParcelaFindPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblParcelaFindTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tblParcelaFindNUM_PARCEL: TStringField
      FieldName = 'NUM_PARCEL'
      Size = 2
    end
    object tblParcelaFindSEQ_PGTO: TStringField
      FieldName = 'SEQ_PGTO'
      Size = 2
    end
    object tblParcelaFindDT_INCLU: TStringField
      FieldName = 'DT_INCLU'
      Size = 6
    end
    object tblParcelaFindCONTABIL: TStringField
      FieldName = 'CONTABIL'
      Size = 1
    end
    object tblParcelaFindFOLHA: TStringField
      FieldName = 'FOLHA'
      Size = 1
    end
    object tblParcelaFindDT_VCTO: TStringField
      FieldName = 'DT_VCTO'
      Size = 6
    end
    object tblParcelaFindDT_CAPIT: TStringField
      FieldName = 'DT_CAPIT'
      Size = 6
    end
    object tblParcelaFindVLR_PRINCI: TFloatField
      FieldName = 'VLR_PRINCI'
    end
    object tblParcelaFindVLR_JUR_CO: TFloatField
      FieldName = 'VLR_JUR_CO'
    end
    object tblParcelaFindVLR_CORR_M: TFloatField
      FieldName = 'VLR_CORR_M'
    end
    object tblParcelaFindVLR_TAXA: TFloatField
      FieldName = 'VLR_TAXA'
    end
    object tblParcelaFindVLR_JUR_AT: TFloatField
      FieldName = 'VLR_JUR_AT'
    end
    object tblParcelaFindCORR_MON_A: TFloatField
      FieldName = 'CORR_MON_A'
    end
    object tblParcelaFindTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object tblParcelaFindJUR_INADI: TFloatField
      FieldName = 'JUR_INADI'
    end
    object tblParcelaFindCOR_MON_IN: TFloatField
      FieldName = 'COR_MON_IN'
    end
    object tblParcelaFindVLR_DESC_A: TFloatField
      FieldName = 'VLR_DESC_A'
    end
    object tblParcelaFindVLR_TOT_PG: TFloatField
      FieldName = 'VLR_TOT_PG'
    end
    object tblParcelaFindVLR_ULT_EN: TFloatField
      FieldName = 'VLR_ULT_EN'
    end
    object tblParcelaFindSEQ_ULT_PG: TStringField
      FieldName = 'SEQ_ULT_PG'
      Size = 2
    end
    object tblParcelaFindBRANCO: TStringField
      FieldName = 'BRANCO'
      Size = 1
    end
  end
  object dsContratoFind: TwwDataSource
    AutoEdit = False
    DataSet = tblContratoFind
    Left = 584
    Top = 16
  end
  object qryExiste02: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*)'
      'FROM'
      '   AEMCPRPG'
      'WHERE'
      '       SEQ_PGTO    >:PSEQ'
      '   AND NUM_PARCEL  =:PNUM_PARCEL'
      '   AND PROTOC      =:PPROTOC')
    ValidateWithMask = True
    Left = 688
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUM_PARCEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPROTOC'
        ParamType = ptInput
      end>
  end
  object qryInsertParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParcela
    SQL.Strings = (
      'INSERT INTO AEMCPRPG'
      '('
      'MATRIC,'
      'SEQ,'
      'PROTOC,'
      'NUM_PARCEL,'
      'SEQ_PGTO,'
      'DT_INCLU,'
      'DT_VCTO,'
      'VLR_PRINCI,'
      'VLR_JUR_CO,'
      'VLR_CORR_M,'
      'VLR_TAXA,'
      'VLR_JUR_AT,'
      'CORR_MON_A'
      ')'
      'VALUES'
      '('
      ':MATRIC,'
      ':SEQ,'
      ':PROTOC,'
      ':NUM_PARCEL,'
      ':SEQ_PGTO,'
      ':DT_INCLU,'
      ':DT_VCTO,'
      ':VLR_PRINCI,'
      ':VLR_JUR_CO,'
      ':VLR_CORR_M,'
      ':VLR_TAXA,'
      ':VLR_JUR_AT,'
      ':CORR_MON_A'
      ')')
    ValidateWithMask = True
    Left = 584
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROTOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_PARCEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQ_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_INCLU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_VCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLR_PRINCI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLR_JUR_CO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLR_CORR_M'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLR_TAXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLR_JUR_AT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORR_MON_A'
        ParamType = ptUnknown
      end>
  end
  object qryContaCorrente: TwwQuery
    BeforeOpen = qryContaCorrenteBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   PES.IDPESSOA, CON.IDTIPOCONTREMPTMO,'
      
        '   DECODE(CON.IDPESSOA, CON.IDBENEF, '#39#39', EL.MATRICULA) AS MATRIC' +
        'TIT,'
      '   DP.MATRICULA,'
      '   SPP.IDSITPLANOPREV, SPP.DESCRICAO,'
      '   TCE.TCEDESCRICAO,'
      
        '   PES.NOME, DECODE(CON.IDPESSOA, CON.IDBENEF, '#39#39', PTIT.NOME) AS' +
        ' NOMETIT,'
      '   CON.DATAASSINATURA, CON.DATACREDITO, CON.NUMPARCELAS,'
      '   PARC.HMEPARCELA,'
      
        '   DECODE(NVL(PARC.HMEVLRPREVISTO, 0), 0, CON.VLRPARCELA, NVL(PA' +
        'RC.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO,'
      '   NVL(PARC.HMEVLREFETIVO, 0) AS HMEVLREFETIVO,'
      
        '   PARC.HMEDATAPREVISTA, PARC.HMEDATAVENCTO, PARC.HMEDATAEFETIVA' +
        ','
      
        '   DECODE( NVL(SLD_ANT.SLD_DEV_ANT, 0), 0, (NVL(SLD_ATU.SLD_DEV_' +
        'ATU, 0) + NVL(DEV_ATU.VLR_DEV_ATU, 0)), NVL(SLD_ANT.SLD_DEV_ANT,' +
        ' 0) ) AS VLR_ANT,'
      '   NVL(SLD_ANT.SLD_DEV_ANT, 0) AS SLD_DEV_ANT,'
      '   NVL(DEV_ANT.VLR_DEV_ANT, 0) AS VLR_DEV_ANT,'
      '   NVL(SLD_ATU.SLD_DEV_ATU, 0) AS SLD_DEV_ATU,'
      '   NVL(DEV_ATU.VLR_DEV_ATU, 0) AS VLR_DEV_ATU,'
      
        '   (NVL(SLD_ATU.SLD_DEV_ATU, 0) + NVL(DEV_ATU.VLR_DEV_ATU, 0)) A' +
        'S VLR_ATU,'
      '   NVL(VLR_PAGO.VLR_PAGO, 0) AS VLR_PAGO'
      'FROM'
      '   PESSOA PES, PESSOA PTIT, DEPENTIT DP,'
      '   CONTRATOEMPTMO CON,'
      
        '   PARTPREVPLAN PPP, ELEGPATRO EL, TIPOCONTREMPTMO TCE, SITPLANO' +
        'PREV SPP,'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO, HME.HMEPARCELA,'
      '      NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO,'
      '      HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          HMETIPOMOV             = 1'
      '      AND HME.HMECENTRALIZA      = 1'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      '      AND CON.FLGSITUACAO        <> '#39'C'#39
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   ) PARC,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'LR_DEV_ANT'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          HMETIPOMOV             IN (4)'
      '      AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      '      AND CON.FLGSITUACAO        <> '#39'C'#39
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND HME.HMEDATAPREVISTA    <=:PULTDIAMES'
      
        '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HMEDATAEFETIVA >:P' +
        'PRIMDIAMES) )'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) DEV_ANT,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS S' +
        'LD_DEV_ANT'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '   WHERE'
      '          ( (ITC.ITCTRATASALDODEV  = 2) OR ( HMETIPOMOV = 4 ) )'
      '      AND HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '      AND ( HME.HMEDATAPREVISTA    <=:PULTDIAMES )'
      
        '      AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO' +
        ' = 0) )'
      '      AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '      AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '      AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '      AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '      AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) SLD_ANT,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VL' +
        'R_PAGO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          HMETIPOMOV             IN (1, 2, 3, 4)'
      '      AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '      AND HME.FLGBAIXADO         IS NULL'
      
        '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0' +
        ') )                  '
      
        '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )                '
      '      AND CON.FLGSITUACAO        <> '#39'C'#39
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND HMEDATAPREVISTA        <:PPRIMDIAMES'
      '      AND HMEDATAEFETIVA         <:PPRIMDIAMES'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) VLR_PAGO,'
      '   ('
      
        '   SELECT                                                       ' +
        '                     '
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'LR_DEV_ATU'
      
        '   FROM                                                         ' +
        '                     '
      
        '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON                     ' +
        '                     '
      
        '   WHERE                                                        ' +
        '                     '
      
        '          HMETIPOMOV             IN (1, 2, 3, 4)                ' +
        '                     '
      '      AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')                    '
      
        '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0' +
        ') )                  '
      
        '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0' +
        ') )                  '
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND CON.FLGSITUACAO        <> '#39'C'#39'                         ' +
        '                   '
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND HMEDATAPREVISTA        <=:PULTDIAMES'
      
        '      AND ( (HMEDATAEFETIVA      IS NULL) OR (HMEDATAEFETIVA >:P' +
        'ULTDIAMES) )    '
      
        '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO         ' +
        '                     '
      
        '   GROUP BY                                                     ' +
        '                     '
      
        '      CON.IDCONTRATOEMPTMO                                      ' +
        '                     '
      '   ) DEV_ATU,'
      '   ('
      
        '   SELECT                                                       ' +
        '                     '
      
        '      CON.IDCONTRATOEMPTMO, NVL(HME.HMESALDODEV, 0) AS SLD_DEV_A' +
        'TU'
      
        '   FROM                                                         ' +
        '                     '
      
        '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,                    ' +
        '                     '
      
        '      (                                                         ' +
        '                     '
      
        '      SELECT /*+ INDEX(ITC) */                                  ' +
        '                     '
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO               '
      
        '      FROM                                                      ' +
        '                     '
      
        '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,                 ' +
        '                     '
      
        '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE' +
        '                     '
      
        '      WHERE                                                     ' +
        '                     '
      '             ( ITC.ITCTRATASALDODEV   <> 0 )'
      '         AND HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '         AND ( HME.HMEDATAATUALIZA    <=:PULTDIAMES )'
      
        '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )           '
      
        '         AND ( CON.FLGSITUACAO        <> '#39'C'#39' )                  ' +
        '                   '
      '         AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '         AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      
        '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) ' +
        '                     '
      
        '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) ' +
        '                     '
      
        '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) ' +
        '                     '
      
        '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )      ' +
        '                     '
      
        '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )      ' +
        '                     '
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) MAX'
      '   WHERE'
      '          ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '      AND ( CON.DATAASSINATURA   <=:PULTDIAMES )'
      '      AND ( CON.DATACREDITO      <=:PULTDIAMES )'
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '   ) SLD_ATU'
      'WHERE'
      '       PES.IDPESSOA          = CON.IDBENEF'
      '   AND CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '   AND EL.IDPESSOA           = CON.IDPESSOA'
      '   AND EL.IDPESSJUR          = CON.IDPATRO'
      '   AND PTIT.IDPESSOA         = EL.IDPESSOA'
      '   AND PTIT.IDPESSOA         = CON.IDPESSOA'
      '   AND DP.IDTITULAR          = CON.IDPESSOA'
      '   AND DP.IDPESSOA           = CON.IDBENEF'
      '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '   AND EL.IDPESSOA           = PPP.IDPESSOA'
      '   AND EL.IDPESSJUR          = PPP.IDPESSJUR'
      '   AND CON.IDPESSOA          = PPP.IDPESSOA'
      '   AND CON.IDPATRO           = PPP.IDPESSJUR'
      '   AND CON.IDPLANOPREV       = PPP.IDPLANOPREV'
      '   AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      '   AND CON.IDCONTRATOEMPTMO  = PARC.IDCONTRATOEMPTMO(+)'
      
        '   AND CON.IDCONTRATOEMPTMO  = SLD_ANT.IDCONTRATOEMPTMO(+)      ' +
        '                      '
      
        '   AND CON.IDCONTRATOEMPTMO  = DEV_ANT.IDCONTRATOEMPTMO(+)      ' +
        '                      '
      
        '   AND CON.IDCONTRATOEMPTMO  = VLR_PAGO.IDCONTRATOEMPTMO(+)     ' +
        '                      '
      '   AND CON.IDCONTRATOEMPTMO  = SLD_ATU.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = DEV_ATU.IDCONTRATOEMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PPRIMDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PPRIMDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PPRIMDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PULTDIAMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContaCorrenteIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContaCorrenteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContaCorrenteIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContaCorrenteMATRICTIT: TStringField
      FieldName = 'MATRICTIT'
      Size = 13
    end
    object qryContaCorrenteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContaCorrenteIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
    end
    object qryContaCorrenteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryContaCorrenteTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContaCorrenteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContaCorrenteNOMETIT: TStringField
      FieldName = 'NOMETIT'
      Size = 60
    end
    object qryContaCorrenteDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContaCorrenteDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContaCorrenteNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContaCorrenteHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryContaCorrenteHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryContaCorrenteHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryContaCorrenteHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryContaCorrenteHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryContaCorrenteHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryContaCorrenteVLR_ANT: TFloatField
      FieldName = 'VLR_ANT'
    end
    object qryContaCorrenteSLD_DEV_ANT: TFloatField
      FieldName = 'SLD_DEV_ANT'
    end
    object qryContaCorrenteVLR_DEV_ANT: TFloatField
      FieldName = 'VLR_DEV_ANT'
    end
    object qryContaCorrenteSLD_DEV_ATU: TFloatField
      FieldName = 'SLD_DEV_ATU'
    end
    object qryContaCorrenteVLR_DEV_ATU: TFloatField
      FieldName = 'VLR_DEV_ATU'
    end
    object qryContaCorrenteVLR_ATU: TFloatField
      FieldName = 'VLR_ATU'
    end
    object qryContaCorrenteVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
  end
  object tblContaCorrente: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'PROTOC = 0051620'
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
      end>
    IndexDefs = <
      item
        Name = 'tblParcelaIndex1'
      end>
    StoreDefs = True
    TableName = 'pemc83_2.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 584
    Top = 208
    object tblContaCorrenteMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 9
    end
    object tblContaCorrentePROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblContaCorrenteCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 38
    end
    object tblContaCorrentePREST: TStringField
      FieldName = 'PREST'
      Size = 14
    end
    object tblContaCorrenteDEBITO: TStringField
      FieldName = 'DEBITO'
      Size = 15
    end
    object tblContaCorrenteANTERIOR: TStringField
      FieldName = 'ANTERIOR'
      Size = 15
    end
    object tblContaCorrenteCREDMES: TStringField
      FieldName = 'CREDMES'
      Size = 15
    end
    object tblContaCorrenteFIL1: TStringField
      FieldName = 'FIL1'
      Size = 1
    end
    object tblContaCorrentePARC: TStringField
      FieldName = 'PARC'
      Size = 2
    end
    object tblContaCorrenteFIL3: TStringField
      FieldName = 'FIL3'
      Size = 1
    end
    object tblContaCorrenteDT_VCT: TStringField
      FieldName = 'DT_VCT'
      Size = 8
    end
    object tblContaCorrenteFIL2: TStringField
      FieldName = 'FIL2'
      Size = 1
    end
    object tblContaCorrenteDT_PGT: TStringField
      FieldName = 'DT_PGT'
      Size = 8
    end
    object tblContaCorrenteSALDO: TStringField
      FieldName = 'SALDO'
      Size = 15
    end
    object tblContaCorrenteCAMPO7: TStringField
      FieldName = 'CAMPO7'
      Size = 1
    end
  end
  object qryExisteContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*)'
      'FROM'
      '   CONTRATOEMPTMO'
      'WHERE'
      '   IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 600
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryExisteConcessao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*)'
      'FROM'
      '   HISTMOVEMPTMO'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HMEPARCELA       = 0')
    ValidateWithMask = True
    Left = 600
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryExisteParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*)'
      'FROM'
      '   HISTMOVEMPTMO'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HMEPARCELA       > 0')
    ValidateWithMask = True
    Left = 600
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO'
      'SET'
      '   MOECODIGO =:PMOECODIGO'
      'WHERE'
      '       IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '   AND IDTIPOCONTREMPTMO = 1')
    ValidateWithMask = True
    Left = 696
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
end
