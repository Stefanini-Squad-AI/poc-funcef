inherited frmGeraTxtContab: TfrmGeraTxtContab
  Left = 253
  Top = 227
  Caption = 'Integração com a Contabilidade'
  ClientHeight = 120
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 81
    object Label1: TLabel
      Left = 76
      Top = 16
      Width = 192
      Height = 13
      Caption = 'Período para Geração do Arquivo'
    end
    object Label2: TLabel
      Left = 76
      Top = 43
      Width = 17
      Height = 13
      Caption = 'De'
    end
    object Label3: TLabel
      Left = 176
      Top = 43
      Width = 8
      Height = 13
      Caption = 'a'
    end
    object EDtaInicio: TMaskEdit
      Left = 98
      Top = 39
      Width = 69
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = EDtaInicioExit
    end
    object EDtaFim: TMaskEdit
      Left = 193
      Top = 39
      Width = 69
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = EDtaFimEnter
      OnExit = EDtaFimEnter
    end
  end
  inherited Dock971: TDock97
    Top = 81
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 270
      inherited sep1: TToolbarSep97
        Left = 80
      end
      inherited sep3: TToolbarSep97
        Left = 163
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 103
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 459
  end
  object SprAltUltTxtContab: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SPRALTULTTXTCONTAB'
    Left = 408
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PULTTXTCONTAB'
        ParamType = ptInput
      end>
  end
  object SaveDialog1: TSaveDialog
    Left = 32
    Top = 208
  end
  object QryParam: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select ULTTXTCONTAB,DATAINICIAL'
      '           from ParametrosCafManut'
      '           where IdPessoa= 1')
    Left = 328
    Top = 208
    object QryParamULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
      Origin = 'PARAMETROSCAFMANUT.ULTTXTCONTAB'
    end
    object QryParamDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
      Origin = 'PARAMETROSCAFMANUT.ULTTXTCONTAB'
    end
  end
  object QryLancamento: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select L.* '
      '           from Lancamento L,'
      '                   Planilha P'
      '          where L.PlnCodigo = P.PlnCodigo and'
      '                     P.PlnDatDia Between :DtaInicio and :DtaFim'
      'order by  P.PlnDatDia,L.PlnCodigo                              ')
    Left = 256
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtaInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DtaFim'
        ParamType = ptUnknown
      end>
    object QryLancamentoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCAMENTO.PLNCODIGO'
    end
    object QryLancamentoLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Origin = 'LANCAMENTO.LACNUMLAN'
    end
    object QryLancamentoLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'LANCAMENTO.LACDEBCRE'
      Size = 1
    end
    object QryLancamentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LANCAMENTO.IDPESSOA'
    end
    object QryLancamentoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCAMENTO.CODCENTROCUSTO'
      Size = 10
    end
    object QryLancamentoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'LANCAMENTO.PLACONTA'
      Size = 18
    end
    object QryLancamentoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
    end
    object QryLancamentoLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Origin = 'LANCAMENTO.LACTIPO'
      Size = 1
    end
    object QryLancamentoLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Origin = 'LANCAMENTO.LACNUMDOC'
      Size = 15
    end
    object QryLancamentoLACHIST1: TStringField
      FieldName = 'LACHIST1'
      Origin = 'LANCAMENTO.LACHIST1'
      Size = 40
    end
    object QryLancamentoLACHIST2: TStringField
      FieldName = 'LACHIST2'
      Origin = 'LANCAMENTO.LACHIST2'
      Size = 40
    end
    object QryLancamentoLACHIST3: TStringField
      FieldName = 'LACHIST3'
      Origin = 'LANCAMENTO.LACHIST3'
      Size = 40
    end
    object QryLancamentoLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Origin = 'LANCAMENTO.LACHIST4'
      Size = 40
    end
    object QryLancamentoLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Origin = 'LANCAMENTO.LACHIST5'
      Size = 40
    end
    object QryLancamentoLACVALOR: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'LANCAMENTO.LACVALOR'
    end
    object QryLancamentoLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Origin = 'LANCAMENTO.LACTIPCONVOFICIAL'
      Size = 1
    end
    object QryLancamentoLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Origin = 'LANCAMENTO.LACVALOFICIAL'
    end
    object QryLancamentoLACTIPCONVGERENCIAL: TStringField
      FieldName = 'LACTIPCONVGERENCIAL'
      Origin = 'LANCAMENTO.LACTIPCONVGERENCIAL'
      Size = 1
    end
    object QryLancamentoLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Origin = 'LANCAMENTO.LACVALGERENCIAL'
    end
    object QryLancamentoLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN1'
      Size = 1
    end
    object QryLancamentoLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Origin = 'LANCAMENTO.LACVALGEREN1'
    end
    object QryLancamentoLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN2'
      Size = 1
    end
    object QryLancamentoLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Origin = 'LANCAMENTO.LACVALGEREN2'
    end
    object QryLancamentoLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Origin = 'LANCAMENTO.LACATOUTMOEDA'
      Size = 1
    end
    object QryLancamentoLACORIGEMAPLICACAO: TStringField
      FieldName = 'LACORIGEMAPLICACAO'
      Origin = 'LANCAMENTO.LACORIGEMAPLICACAO'
      Size = 1
    end
    object QryLancamentoLACMUTACOES: TStringField
      FieldName = 'LACMUTACOES'
      Origin = 'LANCAMENTO.LACMUTACOES'
      Size = 1
    end
    object QryLancamentoTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'LANCAMENTO.TIPCODIGO'
      Size = 2
    end
    object QryLancamentoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LANCAMENTO.PLNCODIGO'
    end
  end
  object SaveDialog2: TSaveDialog
    Left = 104
    Top = 208
  end
  object QryPlanilha: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from Planilha'
      '           where PlnDatDia Between :DtaInicio and :DtaFim'
      'order by  PlnDatDia,PlnCodigo ')
    Left = 176
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtaInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DtaFim'
        ParamType = ptUnknown
      end>
    object QryPlanilhaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'PLANILHA.PLNCODIGO'
    end
    object QryPlanilhaPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
      Origin = 'PLANILHA.PERNUMERO'
    end
    object QryPlanilhaUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PLANILHA.UNIDNEGOC'
    end
    object QryPlanilhaPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
      Origin = 'PLANILHA.PEREXERCICIO'
    end
    object QryPlanilhaSISCODORIGEM: TStringField
      FieldName = 'SISCODORIGEM'
      Origin = 'PLANILHA.SISCODORIGEM'
      Size = 1
    end
    object QryPlanilhaPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
      Origin = 'PLANILHA.PLNDATDIA'
    end
    object QryPlanilhaPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      Origin = 'PLANILHA.PLNPLANIL'
    end
    object QryPlanilhaPLNNUMLAN: TFloatField
      FieldName = 'PLNNUMLAN'
      Origin = 'PLANILHA.PLNNUMLAN'
    end
    object QryPlanilhaPLNTOTDEB: TFloatField
      FieldName = 'PLNTOTDEB'
      Origin = 'PLANILHA.PLNTOTDEB'
    end
    object QryPlanilhaPLNTOTCRE: TFloatField
      FieldName = 'PLNTOTCRE'
      Origin = 'PLANILHA.PLNTOTCRE'
    end
    object QryPlanilhaPLNTOTDEBOFICIAL: TFloatField
      FieldName = 'PLNTOTDEBOFICIAL'
      Origin = 'PLANILHA.PLNTOTDEBOFICIAL'
    end
    object QryPlanilhaPLNTOTCREOFICIAL: TFloatField
      FieldName = 'PLNTOTCREOFICIAL'
      Origin = 'PLANILHA.PLNTOTCREOFICIAL'
    end
    object QryPlanilhaPLNTOTDEBGERENCIAL: TFloatField
      FieldName = 'PLNTOTDEBGERENCIAL'
      Origin = 'PLANILHA.PLNTOTDEBGERENCIAL'
    end
    object QryPlanilhaPLNTOTCREGERENCIAL: TFloatField
      FieldName = 'PLNTOTCREGERENCIAL'
      Origin = 'PLANILHA.PLNTOTCREGERENCIAL'
    end
    object QryPlanilhaPLNTOTDEBGEREN1: TFloatField
      FieldName = 'PLNTOTDEBGEREN1'
      Origin = 'PLANILHA.PLNTOTDEBGEREN1'
    end
    object QryPlanilhaPLNTOTCREGEREN1: TFloatField
      FieldName = 'PLNTOTCREGEREN1'
      Origin = 'PLANILHA.PLNTOTCREGEREN1'
    end
    object QryPlanilhaPLNTOTDEBGEREN2: TFloatField
      FieldName = 'PLNTOTDEBGEREN2'
      Origin = 'PLANILHA.PLNTOTDEBGEREN2'
    end
    object QryPlanilhaPLNTOTCREGEREN2: TFloatField
      FieldName = 'PLNTOTCREGEREN2'
      Origin = 'PLANILHA.PLNTOTCREGEREN2'
    end
    object QryPlanilhaPLNEFETIVADO: TStringField
      FieldName = 'PLNEFETIVADO'
      Origin = 'PLANILHA.PLNEFETIVADO'
      Size = 1
    end
    object QryPlanilhaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PLANILHA.IDPESSOA'
    end
    object QryPlanilhaTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'PLANILHA.TIPCODIGO'
      Size = 2
    end
    object QryPlanilhaPLNEMUSO: TFloatField
      FieldName = 'PLNEMUSO'
      Origin = 'PLANILHA.PLNEMUSO'
    end
    object QryPlanilhaIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'PLANILHA.PLNCODIGO'
    end
  end
end
