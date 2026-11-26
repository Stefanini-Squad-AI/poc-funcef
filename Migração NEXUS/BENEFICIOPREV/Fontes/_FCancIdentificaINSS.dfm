inherited frmCancIdentificaINSS: TfrmCancIdentificaINSS
  Left = 390
  Top = 165
  HelpContext = 160191
  Caption = 'Desfazer Identificação de Processos'
  ClientHeight = 451
  ClientWidth = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 627
    Height = 412
    object Label1: TLabel
      Left = 20
      Top = 26
      Width = 138
      Height = 13
      Caption = 'Nº do Processo INSS:   '
    end
    object Label2: TLabel
      Left = 16
      Top = 113
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 64
      Width = 590
      Height = 2
    end
    object Label3: TLabel
      Left = 16
      Top = 74
      Width = 82
      Height = 13
      Caption = 'Nº Proc. INSS'
    end
    object Label4: TLabel
      Left = 504
      Top = 74
      Width = 22
      Height = 13
      Caption = 'DIB'
    end
    object Label5: TLabel
      Left = 16
      Top = 361
      Width = 264
      Height = 13
      Caption = '"Novo" Nome (para retorno à TempConcINSS)'
    end
    object Bevel2: TBevel
      Left = 16
      Top = 352
      Width = 600
      Height = 2
    end
    object Panel2: TPanel
      Left = 16
      Top = 168
      Width = 604
      Height = 19
      BevelOuter = bvNone
      BorderWidth = 1
      Caption = 'Registros Identificados'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBgrdDetConc: TwwDBGrid
      Left = 16
      Top = 188
      Width = 609
      Height = 149
      Selected.Strings = (
        'MESREFERENCIA'#9'13'#9'Mês Ref.'
        'MESCOBRANCA'#9'13'#9'Mês Cobr.'
        'CODPROVDESC'#9'15'#9'Rubrica'
        'VALORINSS'#9'14'#9'Valor'
        'ESPECIE'#9'9'#9'Espécie'
        'CODSINONIMO'#9'13'#9'Código Sinônimo')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dtsDetConc
      ReadOnly = True
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object edtNumProcessoINSS: TEdit
      Left = 152
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnProcura: TBitBtn
      Left = 469
      Top = 16
      Width = 137
      Height = 33
      Caption = 'Busca Registros'
      TabOrder = 1
      OnClick = btnProcuraClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 128
      Width = 593
      Height = 21
      DataField = 'NOME'
      DataSource = dtsDetConc
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      DataField = 'NUMPROCINSS'
      DataSource = dtsDetConc
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 504
      Top = 88
      Width = 105
      Height = 21
      DataField = 'DIB'
      DataSource = dtsDetConc
      ReadOnly = True
      TabOrder = 6
    end
    object edtNovoNome: TEdit
      Left = 16
      Top = 376
      Width = 601
      Height = 21
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 627
    inherited tb97Fundo: TToolbar97
      Left = 415
      DockPos = 415
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 245
      DockPos = 245
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 11
  end
  object qryDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DCI.IDPESSOA,'
      '  DCI.MESREFERENCIA, DCI.MESCOBRANCA,'
      '  DCI.NUMPROCINSS, DCI.DIB,'
      '  DCI.IDRUBRICA, DCI.VALORINSS,'
      '  DCI.RMREAJ, DCI.APREAJ,'
      '  DCI.FLGMANUAL, DCI.FLGTRATADO,'
      '  DCI.ESPECIE,'
      '  DCI.OBSERVACAO,'
      ''
      '  DCI.CODCONCESSORINSS, DCI.CODMANTENEDORINSS, DCI.RUBRICAINSS,'
      ''
      '  PES.NOME,'
      ''
      '  PVD.CODPROVDESC,'
      '  DCI.CODSINONIMO,'
      '  DCI.DTINICIOCRED,  '
      '  DCI.DTFIMCRED'
      ''
      'FROM'
      '  DETCONCINSS DCI,'
      '  PESSOA      PES,'
      '  PROVDESC    PVD'
      ''
      'WHERE'
      '      DCI.NUMPROCINSS =:PNUMPROCINSS'
      '  AND DCI.IDPESSOA    = PES.IDPESSOA'
      '  AND DCI.IDRUBRICA   = PVD.IDPROVENTO')
    ValidateWithMask = True
    Left = 448
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qryDetConcMESREFERENCIA: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 13
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.DETCONCINSS.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDetConcMESCOBRANCA: TStringField
      DisplayLabel = 'Mês Cobr.'
      DisplayWidth = 13
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS.DETCONCINSS.MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryDetConcCODPROVDESC: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 15
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PROVDESC.CODPROVDESC'
      Size = 15
    end
    object qryDetConcVALORINSS: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.VALORINSS'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryDetConcESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 9
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS.DETCONCINSS.ESPECIE'
      FixedChar = True
      Size = 6
    end
    object qryDetConcCODSINONIMO: TFloatField
      DisplayLabel = 'Código Sinônimo'
      DisplayWidth = 13
      FieldName = 'CODSINONIMO'
      Origin = 'BASEDADOS.DETCONCINSS.CODSINONIMO'
    end
    object qryDetConcCODCONCESSORINSS: TStringField
      DisplayWidth = 10
      FieldName = 'CODCONCESSORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.CODCONCESSORINSS'
      Visible = False
      Size = 10
    end
    object qryDetConcCODMANTENEDORINSS: TStringField
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.CODMANTENEDORINSS'
      Visible = False
      Size = 10
    end
    object qryDetConcFLGMANUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS.DETCONCINSS.FLGMANUAL'
      Visible = False
    end
    object qryDetConcFLGTRATADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTRATADO'
      Origin = 'BASEDADOS.DETCONCINSS.FLGTRATADO'
      Visible = False
    end
    object qryDetConcOBSERVACAO: TStringField
      DisplayWidth = 200
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.DETCONCINSS.OBSERVACAO'
      Visible = False
      Size = 200
    end
    object qryDetConcIDRUBRICA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.DETCONCINSS.IDRUBRICA'
      Visible = False
    end
    object qryDetConcRMREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS.DETCONCINSS.RMREAJ'
      Visible = False
    end
    object qryDetConcAPREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS.DETCONCINSS.APREAJ'
      Visible = False
    end
    object qryDetConcIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.DETCONCINSS.IDPESSOA'
      Visible = False
    end
    object qryDetConcNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Visible = False
      Size = 60
    end
    object qryDetConcNUMPROCINSS: TStringField
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.DETCONCINSS.NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryDetConcDIB: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIB'
      Origin = 'BASEDADOS.DETCONCINSS.DIB'
      Visible = False
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryDetConcRUBRICAINSS: TFloatField
      FieldName = 'RUBRICAINSS'
      Origin = 'BASEDADOS.DETCONCINSS.RUBRICAINSS'
      Visible = False
    end
    object qryDetConcDTINICIOCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTINICIOCRED'
      Origin = 'BASEDADOS.DETCONCINSS.DTINICIOCRED'
      Visible = False
    end
    object qryDetConcDTFIMCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTFIMCRED'
      Origin = 'BASEDADOS.DETCONCINSS.DTFIMCRED'
      Visible = False
    end
  end
  object dtsDetConc: TwwDataSource
    DataSet = qryDetConc
    Left = 512
    Top = 216
  end
  object qryInsertTempConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TEMPCONCINSS'
      '('
      'IDPESSOA,'
      'NOME,'
      'CODRUBRICA1,'
      'VLRRUBRICA1,'
      'MOTIVO,'
      'MESPROCESSAMENTO,'
      'MESREFERENCIA,'
      'NUMPROCINSS,'
      'ESPECIE,'
      'CODCONCESSORINSS,'
      'CODMANTENEDORINSS,'
      'MATRICULA,'
      'RMREAJ,'
      'APREAJ,'
      'FLGMANUAL,'
      'DIB,'
      'OBS,'
      'CODSINONIMO,'
      'DTINICIOCRED, '
      'DTFIMCRED'
      ')'
      'VALUES'
      '('
      ':PIDPESSOA,'
      ':PNOME,'
      ':PCODRUBRICA1,'
      ':PVLRRUBRICA1,'
      ':PMOTIVO,'
      ':PMESPROCESSAMENTO,'
      ':PMESREFERENCIA,'
      ':PNUMPROCINSS,'
      ':PESPECIE,'
      ':PCODCONCESSORINSS,'
      ':PCODMANTENEDORINSS,'
      ':PMATRICULA,'
      ':PRMREAJ,'
      ':PAPREAJ,'
      ':PFLGMANUAL,'
      ':PDIB,'
      ':POBS,'
      ':PCODSINONIMO,'
      ':PDTINICIOCRED, '
      ':PDTFIMCRED'
      ')')
    ValidateWithMask = True
    Left = 296
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESPROCESSAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCONCESSORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PRMREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PAPREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDIB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODSINONIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTINICIOCRED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTFIMCRED'
        ParamType = ptUnknown
      end>
    object qryInsertTempConcIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".IDPESSOA'
    end
    object qryInsertTempConcNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NOME'
      Size = 60
    end
    object qryInsertTempConcCODRUBRICA1: TFloatField
      FieldName = 'CODRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA1'
    end
    object qryInsertTempConcCODRUBRICA2: TFloatField
      FieldName = 'CODRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA2'
    end
    object qryInsertTempConcCODRUBRICA3: TFloatField
      FieldName = 'CODRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA3'
    end
    object qryInsertTempConcCODRUBRICA4: TFloatField
      FieldName = 'CODRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA4'
    end
    object qryInsertTempConcVLRRUBRICA1: TFloatField
      FieldName = 'VLRRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA1'
    end
    object qryInsertTempConcVLRRUBRICA2: TFloatField
      FieldName = 'VLRRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA2'
    end
    object qryInsertTempConcVLRRUBRICA3: TFloatField
      FieldName = 'VLRRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA3'
    end
    object qryInsertTempConcVLRRUBRICA4: TFloatField
      FieldName = 'VLRRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA4'
    end
    object qryInsertTempConcDATALEITURA: TDateTimeField
      FieldName = 'DATALEITURA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DATALEITURA'
    end
    object qryInsertTempConcOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".OBS'
      Size = 200
    end
    object qryInsertTempConcMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MOTIVO'
      Size = 30
    end
    object qryInsertTempConcMESPROCESSAMENTO: TStringField
      FieldName = 'MESPROCESSAMENTO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESPROCESSAMENTO'
      FixedChar = True
      Size = 7
    end
    object qryInsertTempConcMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryInsertTempConcNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NUMPROCINSS'
      Size = 15
    end
    object qryInsertTempConcESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".ESPECIE'
      Size = 6
    end
    object qryInsertTempConcCODCONCESSORINSS: TStringField
      FieldName = 'CODCONCESSORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODCONCESSORINSS'
      Size = 8
    end
    object qryInsertTempConcCODMANTENEDORINSS: TStringField
      FieldName = 'CODMANTENEDORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODMANTENEDORINSS'
      Size = 8
    end
    object qryInsertTempConcMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MATRICULA'
      Size = 13
    end
    object qryInsertTempConcRMREAJ: TFloatField
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".RMREAJ'
    end
    object qryInsertTempConcAPREAJ: TFloatField
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".APREAJ'
    end
    object qryInsertTempConcFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".FLGMANUAL'
    end
    object qryInsertTempConcDIB: TDateTimeField
      FieldName = 'DIB'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DIB'
    end
  end
  object qryDeleteDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DETCONCINSS DCI'
      'WHERE       DCI.NUMPROCINSS =:PNUMPROCINSS')
    ValidateWithMask = True
    Left = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".IDPESSOA'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NOME'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'CODRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA1'
    end
    object FloatField3: TFloatField
      FieldName = 'CODRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA2'
    end
    object FloatField4: TFloatField
      FieldName = 'CODRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA3'
    end
    object FloatField5: TFloatField
      FieldName = 'CODRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA4'
    end
    object FloatField6: TFloatField
      FieldName = 'VLRRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA1'
    end
    object FloatField7: TFloatField
      FieldName = 'VLRRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA2'
    end
    object FloatField8: TFloatField
      FieldName = 'VLRRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA3'
    end
    object FloatField9: TFloatField
      FieldName = 'VLRRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA4'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATALEITURA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DATALEITURA'
    end
    object StringField2: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".OBS'
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'MOTIVO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MOTIVO'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'MESPROCESSAMENTO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESPROCESSAMENTO'
      FixedChar = True
      Size = 7
    end
    object StringField5: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object StringField6: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NUMPROCINSS'
      Size = 15
    end
    object StringField7: TStringField
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".ESPECIE'
      Size = 6
    end
    object StringField8: TStringField
      FieldName = 'CODCONCESSORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODCONCESSORINSS'
      Size = 8
    end
    object StringField9: TStringField
      FieldName = 'CODMANTENEDORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODMANTENEDORINSS'
      Size = 8
    end
    object StringField10: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MATRICULA'
      Size = 13
    end
    object FloatField10: TFloatField
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".RMREAJ'
    end
    object FloatField11: TFloatField
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".APREAJ'
    end
    object FloatField12: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".FLGMANUAL'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DIB'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DIB'
    end
  end
end
