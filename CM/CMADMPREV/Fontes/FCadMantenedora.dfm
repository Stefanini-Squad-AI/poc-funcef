inherited frmCadMantenedora: TfrmCadMantenedora
  Left = 205
  Top = 77
  HelpContext = 160087
  Caption = 'Cadastro de Mantenedora'
  ClientHeight = 422
  ClientWidth = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 446
    Height = 336
    object lblDescMant: TLabel
      Left = 40
      Top = 45
      Width = 129
      Height = 13
      Caption = 'Nome da Mantenedora'
    end
    object lblCodigo: TLabel
      Left = 40
      Top = 6
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 40
      Top = 83
      Width = 60
      Height = 13
      Caption = 'Sub-Conta'
    end
    object Label2: TLabel
      Left = 40
      Top = 123
      Width = 145
      Height = 13
      Caption = 'Plano Contábil Associado'
    end
    object SpeedButton1: TSpeedButton
      Left = 368
      Top = 177
      Width = 22
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label33: TLabel
      Left = 40
      Top = 163
      Width = 126
      Height = 13
      Caption = 'Tipo de Recebimento '
    end
    object sbtnCODTIPDESEMBPROV: TSpeedButton
      Left = 367
      Top = 214
      Width = 22
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbtnCODTIPDESEMBPROVClick
    end
    object Label32: TLabel
      Left = 40
      Top = 200
      Width = 120
      Height = 13
      Caption = 'Tipo de Desembolso '
    end
    object dbedtMantenedora: TwwDBEdit
      Left = 40
      Top = 59
      Width = 345
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtCodigo: TwwDBEdit
      Left = 40
      Top = 20
      Width = 121
      Height = 21
      DataField = 'CODMANTENEDORA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBCheckBox1: TDBCheckBox
      Left = 192
      Top = 23
      Width = 193
      Height = 17
      Caption = 'Própria Fundação'
      DataField = 'FLGFUNDACAO'
      DataSource = ds
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object rgrpLayout: TDBRadioGroup
      Left = 56
      Top = 246
      Width = 297
      Height = 72
      Caption = 'Modelo de Layout para Importação de Arquivo'
      DataField = 'NUMLAYOUT'
      DataSource = ds
      Items.Strings = (
        'Modelo 1'
        'Modelo 2')
      TabOrder = 3
      Values.Strings = (
        '1'
        '2')
      Visible = False
      OnClick = rgrpLayoutClick
    end
    object cmbSubConta: TwwDBLookupCombo
      Left = 40
      Top = 98
      Width = 348
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Sub-Conta'#9'F')
      DataField = 'CODSUBCONTA'
      DataSource = ds
      LookupTable = qrySubConta
      LookupField = 'CODSUBCONTA'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = cmbSubContaCloseUp
    end
    object cmbPlano: TwwDBLookupCombo
      Left = 40
      Top = 138
      Width = 348
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Plano Previdenciário'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = qryPlano
      LookupField = 'IDPLANOPREV'
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object EdTipoDesembCR: TEdit
      Tag = 1
      Left = 40
      Top = 177
      Width = 324
      Height = 21
      TabOrder = 6
    end
    object EdTipoDesembCP: TEdit
      Tag = 1
      Left = 40
      Top = 214
      Width = 324
      Height = 21
      TabOrder = 7
    end
    object btnImprimir1: TBitBtn
      Left = 172
      Top = 265
      Width = 153
      Height = 24
      Caption = '&Imprimir Modelo'
      Enabled = False
      TabOrder = 8
      Visible = False
      OnClick = btnImprimir1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btnImprimir2: TBitBtn
      Left = 172
      Top = 290
      Width = 153
      Height = 24
      Caption = '&Imprimir Modelo'
      Enabled = False
      TabOrder = 9
      Visible = False
      OnClick = btnImprimir2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  inherited Dock972: TDock97
    Width = 446
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 446
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 248
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
      DockPos = 79
    end
  end
  object treeTpReceb: TCMTreeView [3]
    Left = 397
    Top = 187
    Width = 345
    Height = 102
    PodeNavegar = True
    Mascara = '99.99.99'
    DataSource = dsTpReceb
    CampoChave = QryTpRecebCODTIPRECDES
    CampoDescricao = QryTpRecebDESCRICAO
    CampoTipo = QryTpRecebANASINT
    OnDblClick = treeTpRecebDblClick
    OnExit = treeTpRecebExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object treeTpPaga: TCMTreeView [4]
    Left = 389
    Top = 223
    Width = 345
    Height = 102
    PodeNavegar = True
    Mascara = '99.99.99'
    DataSource = dsTpPaga
    CampoChave = QryTpPagaCODTIPRECDES
    CampoDescricao = QryTpPagaDESCRICAO
    CampoTipo = QryTpPagaANASINT
    OnDblClick = treeTpPagaDblClick
    OnExit = treeTpPagaExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE CM.MANTENEDORA'
      'SET'
      '  CODMANTENEDORA = :CODMANTENEDORA,'
      '  NOME           = :NOME,'
      '  FLGFUNDACAO    = :FLGFUNDACAO,'
      '  NUMLAYOUT      = :NUMLAYOUT,'
      '  CODSUBCONTA    = :CODSUBCONTA,'
      '  IDEMPRESAPROP  = :IDEMPRESAPROP,'
      '  IDPLANOPREV    = :IDPLANOPREV,'
      '  CODTIPREC      = :CODTIPREC,'
      '  CODTIPDES      = :CODTIPDES'
      'WHERE'
      '  RTRIM(CODMANTENEDORA )= :OLD_CODMANTENEDORA')
    InsertSQL.Strings = (
      'INSERT INTO CM.MANTENEDORA'
      '  (CODMANTENEDORA, NOME, FLGFUNDACAO, NUMLAYOUT, CODSUBCONTA,'
      '  IDEMPRESAPROP, IDPLANOPREV, CODTIPREC, CODTIPDES)'
      'VALUES'
      
        '  (:CODMANTENEDORA, :NOME, :FLGFUNDACAO, :NUMLAYOUT, :CODSUBCONT' +
        'A,'
      '   :IDEMPRESAPROP, :IDPLANOPREV, :CODTIPREC, :CODTIPDES)'
      '')
    DeleteSQL.Strings = (
      'delete from CM.MANTENEDORA'
      'where'
      ' RTRIM(CODMANTENEDORA )= :OLD_CODMANTENEDORA')
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'MANTENEDORA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Mantenedora')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CM.MANTENEDORA')
    CamposChave.Strings = (
      'MANTENEDORA.CODMANTENEDORA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        '  CODMANTENEDORA, NOME, FLGFUNDACAO, NUMLAYOUT, CODSUBCONTA, IDE' +
        'MPRESAPROP,'
      '  IDPLANOPREV, CODTIPREC, CODTIPDES'
      'FROM'
      '  CM.MANTENEDORA'
      'WHERE'
      '  CODMANTENEDORA = :CODMANTENEDORA'
      'ORDER BY'
      '  NOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMANTENEDORA'
        ParamType = ptUnknown
        Value = '-1'
      end>
    object qryCODMANTENEDORA: TStringField
      FieldName = 'CODMANTENEDORA'
      Origin = 'MANTENEDORA.CODMANTENEDORA'
      Size = 10
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'MANTENEDORA.NOME'
      Size = 60
    end
    object qryFLGFUNDACAO: TFloatField
      FieldName = 'FLGFUNDACAO'
      Origin = 'MANTENEDORA.FLGFUNDACAO'
    end
    object qryNUMLAYOUT: TFloatField
      FieldName = 'NUMLAYOUT'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryCODTIPREC: TStringField
      FieldName = 'CODTIPREC'
      Origin = 'BASEDADOS.MANTENEDORA.CODTIPREC'
      FixedChar = True
      Size = 15
    end
    object qryCODTIPDES: TStringField
      FieldName = 'CODTIPDES'
      Origin = 'BASEDADOS.MANTENEDORA.CODTIPDES'
      FixedChar = True
      Size = 15
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 408
    Top = 63
  end
  object DsgnCM: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 360
    Top = 184
  end
  object rpModelo1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 287
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Modelo 1 de Layout para Importação de Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50006
        mmTop = 30692
        mmWidth = 97102
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 37835
        mmWidth = 197380
        BandType = 0
      end
      object rpCartaInadimplDBImage1: TppDBImage
        UserName = 'rpCartaInadimplDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 794
        mmTop = 529
        mmWidth = 39688
        BandType = 0
      end
      object rpCartaInadimplLabel1: TppLabel
        UserName = 'rpCartaInadimplLabel1'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 20902
        mmWidth = 5027
        BandType = 0
      end
      object rpCartaInadimplDBText1: TppDBText
        UserName = 'rpCartaInadimplDBText1'
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50006
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object rpCartaInadimplDBText2: TppDBText
        UserName = 'rpCartaInadimplDBText2'
        DataField = 'BAIRRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 16404
        mmWidth = 20108
        BandType = 0
      end
      object rpCartaInadimplDBText3: TppDBText
        UserName = 'rpCartaInadimplDBText3'
        DataField = 'CIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 63236
        mmTop = 16404
        mmWidth = 48419
        BandType = 0
      end
      object rpCartaInadimplDBText4: TppDBText
        UserName = 'rpCartaInadimplDBText4'
        DataField = 'CODESTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 16404
        mmWidth = 17198
        BandType = 0
      end
      object rpCartaInadimplDBText5: TppDBText
        UserName = 'rpCartaInadimplDBText5'
        DataField = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 11906
        mmWidth = 17198
        BandType = 0
      end
      object rpCartaInadimplDBText6: TppDBText
        UserName = 'rpCartaInadimplDBText6'
        DataField = 'LOGRADOURO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 11906
        mmWidth = 69586
        BandType = 0
      end
      object rpCartaInadimplDBText7: TppDBText
        UserName = 'rpCartaInadimplDBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42598
        mmTop = 6615
        mmWidth = 25929
        BandType = 0
      end
      object rpCartaInadimplDBText8: TppDBText
        UserName = 'rpCartaInadimplDBText8'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 42598
        mmTop = 265
        mmWidth = 133615
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Modelo 1...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine57: TppLine
        UserName = 'ppLine57'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel165: TppLabel
        UserName = 'ppLabel165'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
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
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
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
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 23
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 24
    Top = 221
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 24
    Top = 208
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
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
  object rpModelo2: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 335
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Modelo 2 de Layout para Importação de Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50006
        mmTop = 30692
        mmWidth = 97102
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 37835
        mmWidth = 197380
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'rpCartaInadimplDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 794
        mmTop = 529
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'rpCartaInadimplLabel1'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 20902
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'rpCartaInadimplDBText1'
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50006
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'rpCartaInadimplDBText2'
        DataField = 'BAIRRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 16404
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'rpCartaInadimplDBText3'
        DataField = 'CIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 63236
        mmTop = 16404
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'rpCartaInadimplDBText4'
        DataField = 'CODESTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 16404
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'rpCartaInadimplDBText5'
        DataField = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 11906
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'rpCartaInadimplDBText6'
        DataField = 'LOGRADOURO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 11906
        mmWidth = 69586
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'rpCartaInadimplDBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42598
        mmTop = 6615
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'rpCartaInadimplDBText8'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 42598
        mmTop = 265
        mmWidth = 133615
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Modelo 2...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine57'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel165'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc48'
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
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc49'
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
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA ||'#39' -  '#39'|| NOMESUBCONTA AS DESCRICAO,'
      #9#9' CODSUBCONTA,'
      '     IDPESSOA'
      'FROM SUBCONTA'
      'WHERE IDPESSOA =:IDPESSOA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 167
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREVCONTABIL'
      'WHERE NVL(ATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY NOME'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 207
  end
  object dsTpReceb: TwwDataSource
    DataSet = QryTpReceb
    Left = 326
    Top = 8
  end
  object QryTpReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   '
      '  TIPORECEBDESEMB'
      'WHERE  '
      '  IDPESSOA = :IDEMPRESA AND    '
      '  RECPAG = '#39'R'#39'                      AND   '
      '  ATIVO = '#39'S'#39
      'ORDER BY '
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 313
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object QryTpRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object QryTpRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryTpRecebANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
  object dsTpPaga: TwwDataSource
    DataSet = QryTpPaga
    Left = 271
    Top = 8
  end
  object QryTpPaga: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODTIPRECDES, DESCRICAO,  ANASINT'
      'FROM   '
      '  TIPORECEBDESEMB'
      'WHERE  '
      '  IDPESSOA = :IDEMPRESA AND    '
      '  RECPAG = '#39'P'#39
      'ORDER BY '
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 259
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object QryTpPagaCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object QryTpPagaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryTpPagaANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
end
