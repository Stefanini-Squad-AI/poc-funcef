inherited frmExecCargaFCRT: TfrmExecCargaFCRT
  Left = 44
  Top = 86
  Caption = 'Carga de Empréstimos'
  ClientHeight = 418
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 704
    Height = 385
    object DBGrid1: TDBGrid
      Left = 72
      Top = 8
      Width = 625
      Height = 193
      DataSource = dsContrato
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
    end
    object DBGrid2: TDBGrid
      Left = 72
      Top = 208
      Width = 625
      Height = 169
      DataSource = dsParcela
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 704
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
  object qryContrato: TwwQuery
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
    Left = 24
    Top = 104
    object qryContratoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 3
    end
    object qryContratoCOUNTOFCONVENIO: TIntegerField
      FieldName = 'COUNT OF CONVENIO'
    end
  end
  object tblContrato: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    TableName = 'aemccemc.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 24
    Top = 56
    object tblContratoMATRIC: TStringField
      FieldName = 'MATRIC'
      Size = 6
    end
    object tblContratoSEQ: TStringField
      FieldName = 'SEQ'
      Size = 2
    end
    object tblContratoPROTOC: TStringField
      FieldName = 'PROTOC'
      Size = 7
    end
    object tblContratoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tblContratoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 3
    end
    object tblContratoPARC_TOTAL: TStringField
      FieldName = 'PARC_TOTAL'
      Size = 2
    end
    object tblContratoDIGITO: TStringField
      FieldName = 'DIGITO'
      Size = 1
    end
    object tblContratoIENCARG: TStringField
      FieldName = 'IENCARG'
      Size = 2
    end
    object tblContratoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object tblContratoEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 6
    end
    object tblContratoAPROVACAO: TStringField
      FieldName = 'APROVACAO'
      Size = 6
    end
    object tblContratoCONCESSAO: TStringField
      FieldName = 'CONCESSAO'
      Size = 6
    end
    object tblContratoPRIM_VCTO: TStringField
      FieldName = 'PRIM_VCTO'
      Size = 6
    end
    object tblContratoULT_VCTO: TStringField
      FieldName = 'ULT_VCTO'
      Size = 6
    end
    object tblContratoULT_CAPIT: TStringField
      FieldName = 'ULT_CAPIT'
      Size = 6
    end
    object tblContratoCANCEL: TStringField
      FieldName = 'CANCEL'
      Size = 6
    end
    object tblContratoMOT_CANCEL: TStringField
      FieldName = 'MOT_CANCEL'
      Size = 1
    end
    object tblContratoAUT_ESPEC: TStringField
      FieldName = 'AUT_ESPEC'
      Size = 1
    end
    object tblContratoCONTAB: TStringField
      FieldName = 'CONTAB'
      Size = 1
    end
    object tblContratoULT_PARC: TStringField
      FieldName = 'ULT_PARC'
      Size = 2
    end
    object tblContratoCRED_APROV: TFloatField
      FieldName = 'CRED_APROV'
    end
    object tblContratoJUROS_APRO: TFloatField
      FieldName = 'JUROS_APRO'
    end
    object tblContratoCORR_MONET: TFloatField
      FieldName = 'CORR_MONET'
    end
    object tblContratoTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object tblContratoVLR_BRUTO: TFloatField
      FieldName = 'VLR_BRUTO'
    end
    object tblContratoCOTA_QUIT: TFloatField
      FieldName = 'COTA_QUIT'
    end
    object tblContratoSLD_FINANC: TFloatField
      FieldName = 'SLD_FINANC'
    end
    object tblContratoSLD_ABERTO: TFloatField
      FieldName = 'SLD_ABERTO'
    end
    object tblContratoPRIM_PARC: TFloatField
      FieldName = 'PRIM_PARC'
    end
    object tblContratoOUTR_PARC: TFloatField
      FieldName = 'OUTR_PARC'
    end
    object tblContratoNUM_FAT: TStringField
      FieldName = 'NUM_FAT'
      Size = 7
    end
    object tblContratoPATROC: TStringField
      FieldName = 'PATROC'
      Size = 1
    end
    object tblContratoCLS_PART: TStringField
      FieldName = 'CLS_PART'
      Size = 1
    end
    object tblContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 2
    end
    object tblContratoBRANCO: TStringField
      FieldName = 'BRANCO'
      Size = 5
    end
  end
  object dsContrato: TwwDataSource
    DataSet = tblContrato
    Left = 24
    Top = 8
  end
  object dsParcela: TwwDataSource
    DataSet = tblParcela
    Left = 24
    Top = 224
  end
  object wwQuery2: TwwQuery
    ValidateWithMask = True
    Left = 24
    Top = 320
  end
  object tblParcela: TwwTable
    DatabaseName = 'C:\projetoscm5\emprestimo'
    Filter = 'PROTOC = 0051620'
    Filtered = True
    TableName = 'aemcprpg.dbf'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 24
    Top = 272
  end
end
