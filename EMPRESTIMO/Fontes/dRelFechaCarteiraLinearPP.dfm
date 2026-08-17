inherited dtmRelFechaCarteiraLinearPP: TdtmRelFechaCarteiraLinearPP
  Left = 276
  Top = 240
  Width = 280
  Height = 167
  Caption = 'dtmRelFechaCarteiraLinearPP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplFechamentoCarteiraCaixa: TppBDEPipeline
    DataSource = dsFechamentoCarteiraCaixa
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 152
    Top = 56
    object pplFechamentoCarteiraCaixappField1: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplFechamentoCarteiraCaixappField2: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplFechamentoCarteiraCaixappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_ANT'
      FieldName = 'SALDO_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplFechamentoCarteiraCaixappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDO_ANT'
      FieldName = 'TOTALSALDO_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplFechamentoCarteiraCaixappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONCESSOES'
      FieldName = 'CONCESSOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplFechamentoCarteiraCaixappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCONCESSOES'
      FieldName = 'TOTALCONCESSOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplFechamentoCarteiraCaixappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_CR'
      FieldName = 'PARCELAS_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplFechamentoCarteiraCaixappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_CR'
      FieldName = 'TOTALPARC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplFechamentoCarteiraCaixappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_FP'
      FieldName = 'PARCELAS_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplFechamentoCarteiraCaixappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_FP'
      FieldName = 'TOTALPARC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplFechamentoCarteiraCaixappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_FB'
      FieldName = 'PARCELAS_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplFechamentoCarteiraCaixappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_FB'
      FieldName = 'TOTALPARC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplFechamentoCarteiraCaixappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_CR'
      FieldName = 'ENCARGOS_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplFechamentoCarteiraCaixappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_CR'
      FieldName = 'TOTALENC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplFechamentoCarteiraCaixappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_FP'
      FieldName = 'ENCARGOS_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplFechamentoCarteiraCaixappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_FP'
      FieldName = 'TOTALENC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplFechamentoCarteiraCaixappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_FB'
      FieldName = 'ENCARGOS_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplFechamentoCarteiraCaixappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_FB'
      FieldName = 'TOTALENC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplFechamentoCarteiraCaixappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_CR'
      FieldName = 'AMORTIZACAO_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplFechamentoCarteiraCaixappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_CR'
      FieldName = 'TOTALAMO_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplFechamentoCarteiraCaixappField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_FP'
      FieldName = 'AMORTIZACAO_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplFechamentoCarteiraCaixappField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_FP'
      FieldName = 'TOTALAMO_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplFechamentoCarteiraCaixappField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_FB'
      FieldName = 'AMORTIZACAO_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplFechamentoCarteiraCaixappField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_FB'
      FieldName = 'TOTALAMO_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplFechamentoCarteiraCaixappField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_CR'
      FieldName = 'QUITACAO_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplFechamentoCarteiraCaixappField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_CR'
      FieldName = 'TOTALQUI_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplFechamentoCarteiraCaixappField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_FP'
      FieldName = 'QUITACAO_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplFechamentoCarteiraCaixappField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_FP'
      FieldName = 'TOTALQUI_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplFechamentoCarteiraCaixappField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_FB'
      FieldName = 'QUITACAO_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplFechamentoCarteiraCaixappField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_FB'
      FieldName = 'TOTALQUI_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplFechamentoCarteiraCaixappField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_ECR'
      FieldName = 'PARCELAS_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplFechamentoCarteiraCaixappField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_ECR'
      FieldName = 'TOTALPARC_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplFechamentoCarteiraCaixappField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_EFP'
      FieldName = 'PARCELAS_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplFechamentoCarteiraCaixappField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_EFP'
      FieldName = 'TOTALPARC_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplFechamentoCarteiraCaixappField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS_EFB'
      FieldName = 'PARCELAS_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplFechamentoCarteiraCaixappField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC_EFB'
      FieldName = 'TOTALPARC_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplFechamentoCarteiraCaixappField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_ECR'
      FieldName = 'ENCARGOS_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplFechamentoCarteiraCaixappField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_ECR'
      FieldName = 'TOTALENC_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplFechamentoCarteiraCaixappField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_EFP'
      FieldName = 'ENCARGOS_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplFechamentoCarteiraCaixappField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_EFP'
      FieldName = 'TOTALENC_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplFechamentoCarteiraCaixappField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS_EFB'
      FieldName = 'ENCARGOS_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplFechamentoCarteiraCaixappField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC_EFB'
      FieldName = 'TOTALENC_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplFechamentoCarteiraCaixappField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_ECR'
      FieldName = 'AMORTIZACAO_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplFechamentoCarteiraCaixappField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_ECR'
      FieldName = 'TOTALAMO_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplFechamentoCarteiraCaixappField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_EFP'
      FieldName = 'AMORTIZACAO_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplFechamentoCarteiraCaixappField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_EFP'
      FieldName = 'TOTALAMO_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplFechamentoCarteiraCaixappField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO_EFB'
      FieldName = 'AMORTIZACAO_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplFechamentoCarteiraCaixappField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO_EFB'
      FieldName = 'TOTALAMO_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object pplFechamentoCarteiraCaixappField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_ECR'
      FieldName = 'QUITACAO_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplFechamentoCarteiraCaixappField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_ECR'
      FieldName = 'TOTALQUI_ECR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplFechamentoCarteiraCaixappField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_EFP'
      FieldName = 'QUITACAO_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object pplFechamentoCarteiraCaixappField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_EFP'
      FieldName = 'TOTALQUI_EFP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplFechamentoCarteiraCaixappField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO_EFB'
      FieldName = 'QUITACAO_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplFechamentoCarteiraCaixappField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI_EFB'
      FieldName = 'TOTALQUI_EFB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object pplFechamentoCarteiraCaixappField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_CR'
      FieldName = 'REC_PARC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object pplFechamentoCarteiraCaixappField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_CR'
      FieldName = 'TOT_REC_PARC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object pplFechamentoCarteiraCaixappField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_FP'
      FieldName = 'REC_PARC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplFechamentoCarteiraCaixappField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_FP'
      FieldName = 'TOT_REC_PARC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object pplFechamentoCarteiraCaixappField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_FB'
      FieldName = 'REC_PARC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplFechamentoCarteiraCaixappField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_FB'
      FieldName = 'TOT_REC_PARC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplFechamentoCarteiraCaixappField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABONADOS'
      FieldName = 'ABONADOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplFechamentoCarteiraCaixappField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ABONADOS'
      FieldName = 'TOT_ABONADOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object pplFechamentoCarteiraCaixappField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_ENC_CR'
      FieldName = 'REC_ENC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object pplFechamentoCarteiraCaixappField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_ENC_CR'
      FieldName = 'TOT_REC_ENC_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object pplFechamentoCarteiraCaixappField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_ENC_FP'
      FieldName = 'REC_ENC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplFechamentoCarteiraCaixappField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_ENC_FP'
      FieldName = 'TOT_REC_ENC_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object pplFechamentoCarteiraCaixappField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_ENC_FB'
      FieldName = 'REC_ENC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplFechamentoCarteiraCaixappField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_ENC_FB'
      FieldName = 'TOT_REC_ENC_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object pplFechamentoCarteiraCaixappField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_ATRAS_CR'
      FieldName = 'REC_PARC_ATRAS_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object pplFechamentoCarteiraCaixappField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_ATRAS_CR'
      FieldName = 'TOT_REC_PARC_ATRAS_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object pplFechamentoCarteiraCaixappField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_ATRAS_FP'
      FieldName = 'REC_PARC_ATRAS_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object pplFechamentoCarteiraCaixappField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_ATRAS_FP'
      FieldName = 'TOT_REC_PARC_ATRAS_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object pplFechamentoCarteiraCaixappField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_ATRAS_FB'
      FieldName = 'REC_PARC_ATRAS_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object pplFechamentoCarteiraCaixappField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_ATRAS_FB'
      FieldName = 'TOT_REC_PARC_ATRAS_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object pplFechamentoCarteiraCaixappField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AMORT_CR'
      FieldName = 'REC_AMORT_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object pplFechamentoCarteiraCaixappField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_AMORT_CR'
      FieldName = 'TOT_REC_AMORT_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object pplFechamentoCarteiraCaixappField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AMORT_FP'
      FieldName = 'REC_AMORT_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object pplFechamentoCarteiraCaixappField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_AMORT_FP'
      FieldName = 'TOT_REC_AMORT_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object pplFechamentoCarteiraCaixappField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AMORT_FB'
      FieldName = 'REC_AMORT_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object pplFechamentoCarteiraCaixappField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_AMORT_FB'
      FieldName = 'TOT_REC_AMORT_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object pplFechamentoCarteiraCaixappField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QUIT_CR'
      FieldName = 'REC_QUIT_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object pplFechamentoCarteiraCaixappField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_QUIT_CR'
      FieldName = 'TOT_REC_QUIT_CR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object pplFechamentoCarteiraCaixappField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QUIT_FP'
      FieldName = 'REC_QUIT_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object pplFechamentoCarteiraCaixappField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_QUIT_FP'
      FieldName = 'TOT_REC_QUIT_FP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object pplFechamentoCarteiraCaixappField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QUIT_FB'
      FieldName = 'REC_QUIT_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object pplFechamentoCarteiraCaixappField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_QUIT_FB'
      FieldName = 'TOT_REC_QUIT_FB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object pplFechamentoCarteiraCaixappField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_DEV'
      FieldName = 'SALDO_DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object pplFechamentoCarteiraCaixappField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDO_DEV'
      FieldName = 'TOTALSALDO_DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object pplFechamentoCarteiraCaixappField89: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 88
    end
    object pplFechamentoCarteiraCaixappField90: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 89
    end
  end
  object dsFechamentoCarteiraCaixa: TwwDataSource
    AutoEdit = False
    DataSet = qryFechamentoCarteiraPP
    Left = 152
    Top = 68
  end
  object rptFechaCarteiraLinearPP: TppReport
    AutoStop = False
    DataPipeline = pplFechamentoCarteiraCaixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 152
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplFechamentoCarteiraCaixa'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 165894
        mmTop = 35983
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo da Carteira (Visão Caixa - Linear)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 41804
        mmTop = 9525
        mmWidth = 160867
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 42333
        mmTop = 2381
        mmWidth = 160602
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = ppLabel13Print
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 18521
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 18521
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 35983
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 35983
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 43392
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 35983
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 43392
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30956
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 30956
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 30956
        mmWidth = 102659
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 30956
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 72231
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 72231
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        Pen.Color = clInfoBk
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 72231
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PARCELAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AMORTIZACAO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QUITACAO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTALPARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TOTALAMO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TOTALQUI_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TOTALENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText101'
        DataField = 'REC_PARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOT_REC_PARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TOT_REC_PARC_ATRAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'REC_PARC_ATRAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REC_ENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TOT_REC_ENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'SALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 2646
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'TOTALSALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 71438
        mmTop = 2646
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'REC_QUIT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 59267
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'TOT_REC_QUIT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 59267
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'REC_AMORT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TOT_REC_AMORT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 177271
        mmTop = 2646
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TOTALSALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 2646
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENCARGOS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor Anterior em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 20902
        mmTop = 2646
        mmWidth = 29104
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Prestações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 14552
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Prestações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 17992
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'PARCELAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'TOTALPARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Prestações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 21431
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'PARCELAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'TOTALPARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Encargos (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 24871
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Amortizações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 35190
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label101'
        Caption = 'Quitações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 45508
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Recebimentos no Mês (inclui Itens quitados)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 198173
        mmTop = 9260
        mmWidth = 51594
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 178065
        mmTop = 12700
        mmWidth = 89429
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Cobranças Geradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 37835
        mmTop = 9260
        mmWidth = 23019
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 8731
        mmTop = 12700
        mmWidth = 80169
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Prestações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 14552
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Prestações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 17992
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'REC_PARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'TOT_REC_PARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Prestações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 21431
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'REC_PARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'TOT_REC_PARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Prestações em Atraso (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 28310
        mmWidth = 40217
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Encargos (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 38629
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Amortizações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 48948
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quitações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 59267
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Valor Atual em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 2646
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Abonos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 24871
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'ABONADOS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'TOT_ABONADOS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'Encargos (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 28310
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Encargos (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 31750
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText102'
        DataField = 'ENCARGOS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'ENCARGOS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'TOTALENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'TOTALENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Amortizações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 38629
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Amortizações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 42069
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'AMORTIZACAO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'AMORTIZACAO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'TOTALAMO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'TOTALAMO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Quitações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 48948
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Quitações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 52388
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'QUITACAO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'QUITACAO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 53446
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'TOTALQUI_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'TOTALQUI_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 72761
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Cobranças Enviadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 123031
        mmTop = 9260
        mmWidth = 24077
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 95515
        mmTop = 12700
        mmWidth = 77788
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Prestações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 14552
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'PARCELAS_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'TOTALPARC_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 14552
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Prestações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 17992
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'PARCELAS_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'TOTALPARC_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 17992
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Prestações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 21431
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'PARCELAS_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText301'
        DataField = 'TOTALPARC_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 21431
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Encargos (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 24871
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText103'
        DataField = 'ENCARGOS_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'TOTALENC_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 24871
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Encargos (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 28310
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'ENCARGOS_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'TOTALENC_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 28310
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Encargos (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 31750
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'ENCARGOS_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText401'
        DataField = 'TOTALENC_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Amortizações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 35190
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'AMORTIZACAO_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'TOTALAMO_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Amortizações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 38629
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'AMORTIZACAO_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'TOTALAMO_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 38629
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Amortizações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 42069
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'AMORTIZACAO_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = 'TOTALAMO_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Quitações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 45508
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'QUITACAO_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'TOTALQUI_ECR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Quitações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 48948
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'QUITACAO_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'TOTALQUI_EFP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 48948
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Quitações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 52388
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = 'QUITACAO_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'TOTALQUI_EFB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Prestações em Atraso (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 31750
        mmWidth = 41275
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Prestações em Atraso (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 35190
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'REC_PARC_ATRAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'REC_PARC_ATRAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'TOT_REC_PARC_ATRAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 31750
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'TOT_REC_PARC_ATRAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 35190
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label201'
        Caption = 'Encargos (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 42069
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Encargos (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 45508
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'REC_ENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        DataField = 'REC_ENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText201'
        DataField = 'TOT_REC_ENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 42069
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        DataField = 'TOT_REC_ENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 45508
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Amortizações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 52388
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Amortizações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 55827
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        DataField = 'REC_AMORT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        DataField = 'REC_AMORT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 55827
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'TOT_REC_AMORT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 52388
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        DataField = 'TOT_REC_AMORT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 55827
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel49: TppLabel
        UserName = 'Label102'
        Caption = 'Quitações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 62706
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'Quitações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 66146
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        DataField = 'REC_QUIT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 62706
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        DataField = 'REC_QUIT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 66146
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        DataField = 'TOT_REC_QUIT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 62706
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        DataField = 'TOT_REC_QUIT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 3175
        mmLeft = 251090
        mmTop = 66146
        mmWidth = 16140
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23813
        BandType = 8
      end
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
        mmLeft = 98954
        mmTop = 3175
        mmWidth = 94986
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = pplFechamentoCarteiraCaixa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFechamentoCarteiraCaixa'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel51: TppLabel
          UserName = 'Label2'
          Caption = 'Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 794
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOMEPLANO'
          DataPipeline = pplFechamentoCarteiraCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 3969
          mmLeft = 11113
          mmTop = 794
          mmWidth = 139436
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = pplFechamentoCarteiraCaixa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFechamentoCarteiraCaixa'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel52: TppLabel
          UserName = 'Label13'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 6350
          mmTop = 0
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOMEPATRO'
          DataPipeline = pplFechamentoCarteiraCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 3969
          mmLeft = 30163
          mmTop = 0
          mmWidth = 144463
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplFechamentoCarteiraCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFechamentoCarteiraCaixa'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplFechamentoCarteiraCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 3704
          mmLeft = 12965
          mmTop = 0
          mmWidth = 139700
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Concessões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 2646
          mmLeft = 169598
          mmTop = 0
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 3969
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryFechamentoCarteiraPP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPATRO,'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39'         ' +
        '  AS NOMEPLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '   1000000 AS SALDO_ANT,'
      '   1000000 AS TOTALSALDO_ANT,'
      ''
      '   1000000 AS CONCESSOES,'
      '   1000000 AS TOTALCONCESSOES,'
      ''
      '   1000000 AS PARCELAS_CR,'
      '   1000000 AS TOTALPARC_CR,'
      '   1000000 AS PARCELAS_FP,'
      '   1000000 AS TOTALPARC_FP,'
      '   1000000 AS PARCELAS_FB,'
      '   1000000 AS TOTALPARC_FB,'
      ''
      '   1000000 AS ENCARGOS_CR,'
      '   1000000 AS TOTALENC_CR,'
      '   1000000 AS ENCARGOS_FP,'
      '   1000000 AS TOTALENC_FP,'
      '   1000000 AS ENCARGOS_FB,'
      '   1000000 AS TOTALENC_FB,'
      ''
      '   1000000 AS AMORTIZACAO_CR,'
      '   1000000 AS TOTALAMO_CR,'
      '   1000000 AS AMORTIZACAO_FP,'
      '   1000000 AS TOTALAMO_FP,'
      '   1000000 AS AMORTIZACAO_FB,'
      '   1000000 AS TOTALAMO_FB,'
      ''
      '   1000000 AS QUITACAO_CR,'
      '   1000000 AS TOTALQUI_CR,'
      '   1000000 AS QUITACAO_FP,'
      '   1000000 AS TOTALQUI_FP,'
      '   1000000 AS QUITACAO_FB,'
      '   1000000 AS TOTALQUI_FB,'
      ''
      ''
      '   1000000 AS PARCELAS_ECR,'
      '   1000000 AS TOTALPARC_ECR,'
      '   1000000 AS PARCELAS_EFP,'
      '   1000000 AS TOTALPARC_EFP,'
      '   1000000 AS PARCELAS_EFB,'
      '   1000000 AS TOTALPARC_EFB,'
      ''
      '   1000000 AS ENCARGOS_ECR,'
      '   1000000 AS TOTALENC_ECR,'
      '   1000000 AS ENCARGOS_EFP,'
      '   1000000 AS TOTALENC_EFP,'
      '   1000000 AS ENCARGOS_EFB,'
      '   1000000 AS TOTALENC_EFB,'
      ''
      '   1000000 AS AMORTIZACAO_ECR,'
      '   1000000 AS TOTALAMO_ECR,'
      '   1000000 AS AMORTIZACAO_EFP,'
      '   1000000 AS TOTALAMO_EFP,'
      '   1000000 AS AMORTIZACAO_EFB,'
      '   1000000 AS TOTALAMO_EFB,'
      ''
      '   1000000 AS QUITACAO_ECR,'
      '   1000000 AS TOTALQUI_ECR,'
      '   1000000 AS QUITACAO_EFP,'
      '   1000000 AS TOTALQUI_EFP,'
      '   1000000 AS QUITACAO_EFB,'
      '   1000000 AS TOTALQUI_EFB,'
      ''
      '   1000000 AS REC_PARC_CR,'
      '   1000000 AS TOT_REC_PARC_CR,'
      ''
      '   1000000 AS REC_PARC_FP,'
      '   1000000 AS TOT_REC_PARC_FP,'
      ''
      '   1000000 AS REC_PARC_FB,'
      '   1000000 AS TOT_REC_PARC_FB,'
      ''
      '   1000000 AS ABONADOS,'
      '   1000000 AS TOT_ABONADOS,'
      ''
      '   1000000 AS REC_ENC_CR,'
      '   1000000 AS TOT_REC_ENC_CR,'
      '   1000000 AS REC_ENC_FP,'
      '   1000000 AS TOT_REC_ENC_FP,'
      '   1000000 AS REC_ENC_FB,'
      '   1000000 AS TOT_REC_ENC_FB,'
      ''
      '   1000000 AS REC_PARC_ATRAS_CR,'
      '   1000000 AS TOT_REC_PARC_ATRAS_CR,'
      '   1000000 AS REC_PARC_ATRAS_FP,'
      '   1000000 AS TOT_REC_PARC_ATRAS_FP,'
      '   1000000 AS REC_PARC_ATRAS_FB,'
      '   1000000 AS TOT_REC_PARC_ATRAS_FB,'
      ''
      '   1000000 AS REC_AMORT_CR,'
      '   1000000 AS TOT_REC_AMORT_CR,'
      '   1000000 AS REC_AMORT_FP,'
      '   1000000 AS TOT_REC_AMORT_FP,'
      '   1000000 AS REC_AMORT_FB,'
      '   1000000 AS TOT_REC_AMORT_FB,'
      ''
      '   1000000 AS REC_QUIT_CR,'
      '   1000000 AS TOT_REC_QUIT_CR,'
      '   1000000 AS REC_QUIT_FP,'
      '   1000000 AS TOT_REC_QUIT_FP,'
      '   1000000 AS REC_QUIT_FB,'
      '   1000000 AS TOT_REC_QUIT_FB,'
      ''
      '   1000000 AS SALDO_DEV,'
      '   1000000 AS TOTALSALDO_DEV'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2'
      ''
      ' '
      ' ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 152
    Top = 88
    object qryFechamentoCarteiraPPDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryFechamentoCarteiraPPTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryFechamentoCarteiraPPSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qryFechamentoCarteiraPPTOTALSALDO_ANT: TFloatField
      FieldName = 'TOTALSALDO_ANT'
    end
    object qryFechamentoCarteiraPPCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryFechamentoCarteiraPPTOTALCONCESSOES: TFloatField
      FieldName = 'TOTALCONCESSOES'
    end
    object qryFechamentoCarteiraPPPARCELAS_CR: TFloatField
      FieldName = 'PARCELAS_CR'
    end
    object qryFechamentoCarteiraPPTOTALPARC_CR: TFloatField
      FieldName = 'TOTALPARC_CR'
    end
    object qryFechamentoCarteiraPPPARCELAS_FP: TFloatField
      FieldName = 'PARCELAS_FP'
    end
    object qryFechamentoCarteiraPPTOTALPARC_FP: TFloatField
      FieldName = 'TOTALPARC_FP'
    end
    object qryFechamentoCarteiraPPPARCELAS_FB: TFloatField
      FieldName = 'PARCELAS_FB'
    end
    object qryFechamentoCarteiraPPTOTALPARC_FB: TFloatField
      FieldName = 'TOTALPARC_FB'
    end
    object qryFechamentoCarteiraPPENCARGOS_CR: TFloatField
      FieldName = 'ENCARGOS_CR'
    end
    object qryFechamentoCarteiraPPTOTALENC_CR: TFloatField
      FieldName = 'TOTALENC_CR'
    end
    object qryFechamentoCarteiraPPENCARGOS_FP: TFloatField
      FieldName = 'ENCARGOS_FP'
    end
    object qryFechamentoCarteiraPPTOTALENC_FP: TFloatField
      FieldName = 'TOTALENC_FP'
    end
    object qryFechamentoCarteiraPPENCARGOS_FB: TFloatField
      FieldName = 'ENCARGOS_FB'
    end
    object qryFechamentoCarteiraPPTOTALENC_FB: TFloatField
      FieldName = 'TOTALENC_FB'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_CR: TFloatField
      FieldName = 'AMORTIZACAO_CR'
    end
    object qryFechamentoCarteiraPPTOTALAMO_CR: TFloatField
      FieldName = 'TOTALAMO_CR'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_FP: TFloatField
      FieldName = 'AMORTIZACAO_FP'
    end
    object qryFechamentoCarteiraPPTOTALAMO_FP: TFloatField
      FieldName = 'TOTALAMO_FP'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_FB: TFloatField
      FieldName = 'AMORTIZACAO_FB'
    end
    object qryFechamentoCarteiraPPTOTALAMO_FB: TFloatField
      FieldName = 'TOTALAMO_FB'
    end
    object qryFechamentoCarteiraPPQUITACAO_CR: TFloatField
      FieldName = 'QUITACAO_CR'
    end
    object qryFechamentoCarteiraPPTOTALQUI_CR: TFloatField
      FieldName = 'TOTALQUI_CR'
    end
    object qryFechamentoCarteiraPPQUITACAO_FP: TFloatField
      FieldName = 'QUITACAO_FP'
    end
    object qryFechamentoCarteiraPPTOTALQUI_FP: TFloatField
      FieldName = 'TOTALQUI_FP'
    end
    object qryFechamentoCarteiraPPQUITACAO_FB: TFloatField
      FieldName = 'QUITACAO_FB'
    end
    object qryFechamentoCarteiraPPTOTALQUI_FB: TFloatField
      FieldName = 'TOTALQUI_FB'
    end
    object qryFechamentoCarteiraPPPARCELAS_ECR: TFloatField
      FieldName = 'PARCELAS_ECR'
    end
    object qryFechamentoCarteiraPPTOTALPARC_ECR: TFloatField
      FieldName = 'TOTALPARC_ECR'
    end
    object qryFechamentoCarteiraPPPARCELAS_EFP: TFloatField
      FieldName = 'PARCELAS_EFP'
    end
    object qryFechamentoCarteiraPPTOTALPARC_EFP: TFloatField
      FieldName = 'TOTALPARC_EFP'
    end
    object qryFechamentoCarteiraPPPARCELAS_EFB: TFloatField
      FieldName = 'PARCELAS_EFB'
    end
    object qryFechamentoCarteiraPPTOTALPARC_EFB: TFloatField
      FieldName = 'TOTALPARC_EFB'
    end
    object qryFechamentoCarteiraPPENCARGOS_ECR: TFloatField
      FieldName = 'ENCARGOS_ECR'
    end
    object qryFechamentoCarteiraPPTOTALENC_ECR: TFloatField
      FieldName = 'TOTALENC_ECR'
    end
    object qryFechamentoCarteiraPPENCARGOS_EFP: TFloatField
      FieldName = 'ENCARGOS_EFP'
    end
    object qryFechamentoCarteiraPPTOTALENC_EFP: TFloatField
      FieldName = 'TOTALENC_EFP'
    end
    object qryFechamentoCarteiraPPENCARGOS_EFB: TFloatField
      FieldName = 'ENCARGOS_EFB'
    end
    object qryFechamentoCarteiraPPTOTALENC_EFB: TFloatField
      FieldName = 'TOTALENC_EFB'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_ECR: TFloatField
      FieldName = 'AMORTIZACAO_ECR'
    end
    object qryFechamentoCarteiraPPTOTALAMO_ECR: TFloatField
      FieldName = 'TOTALAMO_ECR'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_EFP: TFloatField
      FieldName = 'AMORTIZACAO_EFP'
    end
    object qryFechamentoCarteiraPPTOTALAMO_EFP: TFloatField
      FieldName = 'TOTALAMO_EFP'
    end
    object qryFechamentoCarteiraPPAMORTIZACAO_EFB: TFloatField
      FieldName = 'AMORTIZACAO_EFB'
    end
    object qryFechamentoCarteiraPPTOTALAMO_EFB: TFloatField
      FieldName = 'TOTALAMO_EFB'
    end
    object qryFechamentoCarteiraPPQUITACAO_ECR: TFloatField
      FieldName = 'QUITACAO_ECR'
    end
    object qryFechamentoCarteiraPPTOTALQUI_ECR: TFloatField
      FieldName = 'TOTALQUI_ECR'
    end
    object qryFechamentoCarteiraPPQUITACAO_EFP: TFloatField
      FieldName = 'QUITACAO_EFP'
    end
    object qryFechamentoCarteiraPPTOTALQUI_EFP: TFloatField
      FieldName = 'TOTALQUI_EFP'
    end
    object qryFechamentoCarteiraPPQUITACAO_EFB: TFloatField
      FieldName = 'QUITACAO_EFB'
    end
    object qryFechamentoCarteiraPPTOTALQUI_EFB: TFloatField
      FieldName = 'TOTALQUI_EFB'
    end
    object qryFechamentoCarteiraPPREC_PARC_CR: TFloatField
      FieldName = 'REC_PARC_CR'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_CR: TFloatField
      FieldName = 'TOT_REC_PARC_CR'
    end
    object qryFechamentoCarteiraPPREC_PARC_FP: TFloatField
      FieldName = 'REC_PARC_FP'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_FP: TFloatField
      FieldName = 'TOT_REC_PARC_FP'
    end
    object qryFechamentoCarteiraPPREC_PARC_FB: TFloatField
      FieldName = 'REC_PARC_FB'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_FB: TFloatField
      FieldName = 'TOT_REC_PARC_FB'
    end
    object qryFechamentoCarteiraPPABONADOS: TFloatField
      FieldName = 'ABONADOS'
    end
    object qryFechamentoCarteiraPPTOT_ABONADOS: TFloatField
      FieldName = 'TOT_ABONADOS'
    end
    object qryFechamentoCarteiraPPREC_ENC_CR: TFloatField
      FieldName = 'REC_ENC_CR'
    end
    object qryFechamentoCarteiraPPTOT_REC_ENC_CR: TFloatField
      FieldName = 'TOT_REC_ENC_CR'
    end
    object qryFechamentoCarteiraPPREC_ENC_FP: TFloatField
      FieldName = 'REC_ENC_FP'
    end
    object qryFechamentoCarteiraPPTOT_REC_ENC_FP: TFloatField
      FieldName = 'TOT_REC_ENC_FP'
    end
    object qryFechamentoCarteiraPPREC_ENC_FB: TFloatField
      FieldName = 'REC_ENC_FB'
    end
    object qryFechamentoCarteiraPPTOT_REC_ENC_FB: TFloatField
      FieldName = 'TOT_REC_ENC_FB'
    end
    object qryFechamentoCarteiraPPREC_PARC_ATRAS_CR: TFloatField
      FieldName = 'REC_PARC_ATRAS_CR'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_CR: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS_CR'
    end
    object qryFechamentoCarteiraPPREC_PARC_ATRAS_FP: TFloatField
      FieldName = 'REC_PARC_ATRAS_FP'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FP: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS_FP'
    end
    object qryFechamentoCarteiraPPREC_PARC_ATRAS_FB: TFloatField
      FieldName = 'REC_PARC_ATRAS_FB'
    end
    object qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FB: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS_FB'
    end
    object qryFechamentoCarteiraPPREC_AMORT_CR: TFloatField
      FieldName = 'REC_AMORT_CR'
    end
    object qryFechamentoCarteiraPPTOT_REC_AMORT_CR: TFloatField
      FieldName = 'TOT_REC_AMORT_CR'
    end
    object qryFechamentoCarteiraPPREC_AMORT_FP: TFloatField
      FieldName = 'REC_AMORT_FP'
    end
    object qryFechamentoCarteiraPPTOT_REC_AMORT_FP: TFloatField
      FieldName = 'TOT_REC_AMORT_FP'
    end
    object qryFechamentoCarteiraPPREC_AMORT_FB: TFloatField
      FieldName = 'REC_AMORT_FB'
    end
    object qryFechamentoCarteiraPPTOT_REC_AMORT_FB: TFloatField
      FieldName = 'TOT_REC_AMORT_FB'
    end
    object qryFechamentoCarteiraPPREC_QUIT_CR: TFloatField
      FieldName = 'REC_QUIT_CR'
    end
    object qryFechamentoCarteiraPPTOT_REC_QUIT_CR: TFloatField
      FieldName = 'TOT_REC_QUIT_CR'
    end
    object qryFechamentoCarteiraPPREC_QUIT_FP: TFloatField
      FieldName = 'REC_QUIT_FP'
    end
    object qryFechamentoCarteiraPPTOT_REC_QUIT_FP: TFloatField
      FieldName = 'TOT_REC_QUIT_FP'
    end
    object qryFechamentoCarteiraPPREC_QUIT_FB: TFloatField
      FieldName = 'REC_QUIT_FB'
    end
    object qryFechamentoCarteiraPPTOT_REC_QUIT_FB: TFloatField
      FieldName = 'TOT_REC_QUIT_FB'
    end
    object qryFechamentoCarteiraPPSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryFechamentoCarteiraPPTOTALSALDO_DEV: TFloatField
      FieldName = 'TOTALSALDO_DEV'
    end
    object qryFechamentoCarteiraPPNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object qryFechamentoCarteiraPPNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 50
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  NOMEPATRO = :NOMEPATRO,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  DESCTIPOEMPTMO = :DESCTIPOEMPTMO,'
      '  TCEDESCRICAO = :TCEDESCRICAO,'
      '  SALDO_ANT = :SALDO_ANT,'
      '  TOTALSALDO_ANT = :TOTALSALDO_ANT,'
      '  CONCESSOES = :CONCESSOES,'
      '  TOTALCONCESSOES = :TOTALCONCESSOES,'
      '  PARCELAS_CR = :PARCELAS_CR,'
      '  TOTALPARC_CR = :TOTALPARC_CR,'
      '  PARCELAS_FP = :PARCELAS_FP,'
      '  TOTALPARC_FP = :TOTALPARC_FP,'
      '  PARCELAS_FB = :PARCELAS_FB,'
      '  TOTALPARC_FB = :TOTALPARC_FB,'
      '  ENCARGOS_CR = :ENCARGOS_CR,'
      '  TOTALENC_CR = :TOTALENC_CR,'
      '  ENCARGOS_FP = :ENCARGOS_FP,'
      '  TOTALENC_FP = :TOTALENC_FP,'
      '  ENCARGOS_FB = :ENCARGOS_FB,'
      '  TOTALENC_FB = :TOTALENC_FB,'
      '  AMORTIZACAO_CR = :AMORTIZACAO_CR,'
      '  TOTALAMO_CR = :TOTALAMO_CR,'
      '  AMORTIZACAO_FP = :AMORTIZACAO_FP,'
      '  TOTALAMO_FP = :TOTALAMO_FP,'
      '  AMORTIZACAO_FB = :AMORTIZACAO_FB,'
      '  TOTALAMO_FB = :TOTALAMO_FB,'
      '  QUITACAO_CR = :QUITACAO_CR,'
      '  TOTALQUI_CR = :TOTALQUI_CR,'
      '  QUITACAO_FP = :QUITACAO_FP,'
      '  TOTALQUI_FP = :TOTALQUI_FP,'
      '  QUITACAO_FB = :QUITACAO_FB,'
      '  TOTALQUI_FB = :TOTALQUI_FB,'
      '  PARCELAS_ECR = :PARCELAS_ECR,'
      '  TOTALPARC_ECR = :TOTALPARC_ECR,'
      '  PARCELAS_EFP = :PARCELAS_EFP,'
      '  TOTALPARC_EFP = :TOTALPARC_EFP,'
      '  PARCELAS_EFB = :PARCELAS_EFB,'
      '  TOTALPARC_EFB = :TOTALPARC_EFB,'
      '  ENCARGOS_ECR = :ENCARGOS_ECR,'
      '  TOTALENC_ECR = :TOTALENC_ECR,'
      '  ENCARGOS_EFP = :ENCARGOS_EFP,'
      '  TOTALENC_EFP = :TOTALENC_EFP,'
      '  ENCARGOS_EFB = :ENCARGOS_EFB,'
      '  TOTALENC_EFB = :TOTALENC_EFB,'
      '  AMORTIZACAO_ECR = :AMORTIZACAO_ECR,'
      '  TOTALAMO_ECR = :TOTALAMO_ECR,'
      '  AMORTIZACAO_EFP = :AMORTIZACAO_EFP,'
      '  TOTALAMO_EFP = :TOTALAMO_EFP,'
      '  AMORTIZACAO_EFB = :AMORTIZACAO_EFB,'
      '  TOTALAMO_EFB = :TOTALAMO_EFB,'
      '  QUITACAO_ECR = :QUITACAO_ECR,'
      '  TOTALQUI_ECR = :TOTALQUI_ECR,'
      '  QUITACAO_EFP = :QUITACAO_EFP,'
      '  TOTALQUI_EFP = :TOTALQUI_EFP,'
      '  QUITACAO_EFB = :QUITACAO_EFB,'
      '  TOTALQUI_EFB = :TOTALQUI_EFB,'
      '  REC_PARC_CR = :REC_PARC_CR,'
      '  TOT_REC_PARC_CR = :TOT_REC_PARC_CR,'
      '  REC_PARC_FP = :REC_PARC_FP,'
      '  TOT_REC_PARC_FP = :TOT_REC_PARC_FP,'
      '  REC_PARC_FB = :REC_PARC_FB,'
      '  TOT_REC_PARC_FB = :TOT_REC_PARC_FB,'
      '  ABONADOS = :ABONADOS,'
      '  TOT_ABONADOS = :TOT_ABONADOS,'
      '  REC_ENC_CR = :REC_ENC_CR,'
      '  TOT_REC_ENC_CR = :TOT_REC_ENC_CR,'
      '  REC_ENC_FP = :REC_ENC_FP,'
      '  TOT_REC_ENC_FP = :TOT_REC_ENC_FP,'
      '  REC_ENC_FB = :REC_ENC_FB,'
      '  TOT_REC_ENC_FB = :TOT_REC_ENC_FB,'
      '  REC_PARC_ATRAS_CR = :REC_PARC_ATRAS_CR,'
      '  TOT_REC_PARC_ATRAS_CR = :TOT_REC_PARC_ATRAS_CR,'
      '  REC_PARC_ATRAS_FP = :REC_PARC_ATRAS_FP,'
      '  TOT_REC_PARC_ATRAS_FP = :TOT_REC_PARC_ATRAS_FP,'
      '  REC_PARC_ATRAS_FB = :REC_PARC_ATRAS_FB,'
      '  TOT_REC_PARC_ATRAS_FB = :TOT_REC_PARC_ATRAS_FB,'
      '  REC_AMORT_CR = :REC_AMORT_CR,'
      '  TOT_REC_AMORT_CR = :TOT_REC_AMORT_CR,'
      '  REC_AMORT_FP = :REC_AMORT_FP,'
      '  TOT_REC_AMORT_FP = :TOT_REC_AMORT_FP,'
      '  REC_AMORT_FB = :REC_AMORT_FB,'
      '  TOT_REC_AMORT_FB = :TOT_REC_AMORT_FB,'
      '  REC_QUIT_CR = :REC_QUIT_CR,'
      '  TOT_REC_QUIT_CR = :TOT_REC_QUIT_CR,'
      '  REC_QUIT_FP = :REC_QUIT_FP,'
      '  TOT_REC_QUIT_FP = :TOT_REC_QUIT_FP,'
      '  REC_QUIT_FB = :REC_QUIT_FB,'
      '  TOT_REC_QUIT_FB = :TOT_REC_QUIT_FB,'
      '  SALDO_DEV = :SALDO_DEV,'
      '  TOTALSALDO_DEV = :TOTALSALDO_DEV'
      'where'
      '  NOMEPATRO = :OLD_NOMEPATRO and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  DESCTIPOEMPTMO = :OLD_DESCTIPOEMPTMO and'
      '  TCEDESCRICAO = :OLD_TCEDESCRICAO and'
      '  SALDO_ANT = :OLD_SALDO_ANT and'
      '  TOTALSALDO_ANT = :OLD_TOTALSALDO_ANT and'
      '  CONCESSOES = :OLD_CONCESSOES and'
      '  TOTALCONCESSOES = :OLD_TOTALCONCESSOES and'
      '  PARCELAS_CR = :OLD_PARCELAS_CR and'
      '  TOTALPARC_CR = :OLD_TOTALPARC_CR and'
      '  PARCELAS_FP = :OLD_PARCELAS_FP and'
      '  TOTALPARC_FP = :OLD_TOTALPARC_FP and'
      '  PARCELAS_FB = :OLD_PARCELAS_FB and'
      '  TOTALPARC_FB = :OLD_TOTALPARC_FB and'
      '  ENCARGOS_CR = :OLD_ENCARGOS_CR and'
      '  TOTALENC_CR = :OLD_TOTALENC_CR and'
      '  ENCARGOS_FP = :OLD_ENCARGOS_FP and'
      '  TOTALENC_FP = :OLD_TOTALENC_FP and'
      '  ENCARGOS_FB = :OLD_ENCARGOS_FB and'
      '  TOTALENC_FB = :OLD_TOTALENC_FB and'
      '  AMORTIZACAO_CR = :OLD_AMORTIZACAO_CR and'
      '  TOTALAMO_CR = :OLD_TOTALAMO_CR and'
      '  AMORTIZACAO_FP = :OLD_AMORTIZACAO_FP and'
      '  TOTALAMO_FP = :OLD_TOTALAMO_FP and'
      '  AMORTIZACAO_FB = :OLD_AMORTIZACAO_FB and'
      '  TOTALAMO_FB = :OLD_TOTALAMO_FB and'
      '  QUITACAO_CR = :OLD_QUITACAO_CR and'
      '  TOTALQUI_CR = :OLD_TOTALQUI_CR and'
      '  QUITACAO_FP = :OLD_QUITACAO_FP and'
      '  TOTALQUI_FP = :OLD_TOTALQUI_FP and'
      '  QUITACAO_FB = :OLD_QUITACAO_FB and'
      '  TOTALQUI_FB = :OLD_TOTALQUI_FB and'
      '  PARCELAS_ECR = :OLD_PARCELAS_ECR and'
      '  TOTALPARC_ECR = :OLD_TOTALPARC_ECR and'
      '  PARCELAS_EFP = :OLD_PARCELAS_EFP and'
      '  TOTALPARC_EFP = :OLD_TOTALPARC_EFP and'
      '  PARCELAS_EFB = :OLD_PARCELAS_EFB and'
      '  TOTALPARC_EFB = :OLD_TOTALPARC_EFB and'
      '  ENCARGOS_ECR = :OLD_ENCARGOS_ECR and'
      '  TOTALENC_ECR = :OLD_TOTALENC_ECR and'
      '  ENCARGOS_EFP = :OLD_ENCARGOS_EFP and'
      '  TOTALENC_EFP = :OLD_TOTALENC_EFP and'
      '  ENCARGOS_EFB = :OLD_ENCARGOS_EFB and'
      '  TOTALENC_EFB = :OLD_TOTALENC_EFB and'
      '  AMORTIZACAO_ECR = :OLD_AMORTIZACAO_ECR and'
      '  TOTALAMO_ECR = :OLD_TOTALAMO_ECR and'
      '  AMORTIZACAO_EFP = :OLD_AMORTIZACAO_EFP and'
      '  TOTALAMO_EFP = :OLD_TOTALAMO_EFP and'
      '  AMORTIZACAO_EFB = :OLD_AMORTIZACAO_EFB and'
      '  TOTALAMO_EFB = :OLD_TOTALAMO_EFB and'
      '  QUITACAO_ECR = :OLD_QUITACAO_ECR and'
      '  TOTALQUI_ECR = :OLD_TOTALQUI_ECR and'
      '  QUITACAO_EFP = :OLD_QUITACAO_EFP and'
      '  TOTALQUI_EFP = :OLD_TOTALQUI_EFP and'
      '  QUITACAO_EFB = :OLD_QUITACAO_EFB and'
      '  TOTALQUI_EFB = :OLD_TOTALQUI_EFB and'
      '  REC_PARC_CR = :OLD_REC_PARC_CR and'
      '  TOT_REC_PARC_CR = :OLD_TOT_REC_PARC_CR and'
      '  REC_PARC_FP = :OLD_REC_PARC_FP and'
      '  TOT_REC_PARC_FP = :OLD_TOT_REC_PARC_FP and'
      '  REC_PARC_FB = :OLD_REC_PARC_FB and'
      '  TOT_REC_PARC_FB = :OLD_TOT_REC_PARC_FB and'
      '  ABONADOS = :OLD_ABONADOS and'
      '  TOT_ABONADOS = :OLD_TOT_ABONADOS and'
      '  REC_ENC_CR = :OLD_REC_ENC_CR and'
      '  TOT_REC_ENC_CR = :OLD_TOT_REC_ENC_CR and'
      '  REC_ENC_FP = :OLD_REC_ENC_FP and'
      '  TOT_REC_ENC_FP = :OLD_TOT_REC_ENC_FP and'
      '  REC_ENC_FB = :OLD_REC_ENC_FB and'
      '  TOT_REC_ENC_FB = :OLD_TOT_REC_ENC_FB and'
      '  REC_PARC_ATRAS_CR = :OLD_REC_PARC_ATRAS_CR and'
      '  TOT_REC_PARC_ATRAS_CR = :OLD_TOT_REC_PARC_ATRAS_CR and'
      '  REC_PARC_ATRAS_FP = :OLD_REC_PARC_ATRAS_FP and'
      '  TOT_REC_PARC_ATRAS_FP = :OLD_TOT_REC_PARC_ATRAS_FP and'
      '  REC_PARC_ATRAS_FB = :OLD_REC_PARC_ATRAS_FB and'
      '  TOT_REC_PARC_ATRAS_FB = :OLD_TOT_REC_PARC_ATRAS_FB and'
      '  REC_AMORT_CR = :OLD_REC_AMORT_CR and'
      '  TOT_REC_AMORT_CR = :OLD_TOT_REC_AMORT_CR and'
      '  REC_AMORT_FP = :OLD_REC_AMORT_FP and'
      '  TOT_REC_AMORT_FP = :OLD_TOT_REC_AMORT_FP and'
      '  REC_AMORT_FB = :OLD_REC_AMORT_FB and'
      '  TOT_REC_AMORT_FB = :OLD_TOT_REC_AMORT_FB and'
      '  REC_QUIT_CR = :OLD_REC_QUIT_CR and'
      '  TOT_REC_QUIT_CR = :OLD_TOT_REC_QUIT_CR and'
      '  REC_QUIT_FP = :OLD_REC_QUIT_FP and'
      '  TOT_REC_QUIT_FP = :OLD_TOT_REC_QUIT_FP and'
      '  REC_QUIT_FB = :OLD_REC_QUIT_FB and'
      '  TOT_REC_QUIT_FB = :OLD_TOT_REC_QUIT_FB and'
      '  SALDO_DEV = :OLD_SALDO_DEV and'
      '  TOTALSALDO_DEV = :OLD_TOTALSALDO_DEV')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (NOMEPATRO, NOMEPLANO, DESCTIPOEMPTMO, TCEDESCRICAO, SALDO_ANT' +
        ', TOTALSALDO_ANT, '
      
        '   CONCESSOES, TOTALCONCESSOES, PARCELAS_CR, TOTALPARC_CR, PARCE' +
        'LAS_FP, '
      
        '   TOTALPARC_FP, PARCELAS_FB, TOTALPARC_FB, ENCARGOS_CR, TOTALEN' +
        'C_CR, ENCARGOS_FP, '
      
        '   TOTALENC_FP, ENCARGOS_FB, TOTALENC_FB, AMORTIZACAO_CR, TOTALA' +
        'MO_CR, '
      
        '   AMORTIZACAO_FP, TOTALAMO_FP, AMORTIZACAO_FB, TOTALAMO_FB, QUI' +
        'TACAO_CR, '
      
        '   TOTALQUI_CR, QUITACAO_FP, TOTALQUI_FP, QUITACAO_FB, TOTALQUI_' +
        'FB, PARCELAS_ECR, '
      
        '   TOTALPARC_ECR, PARCELAS_EFP, TOTALPARC_EFP, PARCELAS_EFB, TOT' +
        'ALPARC_EFB, '
      
        '   ENCARGOS_ECR, TOTALENC_ECR, ENCARGOS_EFP, TOTALENC_EFP, ENCAR' +
        'GOS_EFB, '
      
        '   TOTALENC_EFB, AMORTIZACAO_ECR, TOTALAMO_ECR, AMORTIZACAO_EFP,' +
        ' TOTALAMO_EFP, '
      
        '   AMORTIZACAO_EFB, TOTALAMO_EFB, QUITACAO_ECR, TOTALQUI_ECR, QU' +
        'ITACAO_EFP, '
      
        '   TOTALQUI_EFP, QUITACAO_EFB, TOTALQUI_EFB, REC_PARC_CR, TOT_RE' +
        'C_PARC_CR, '
      
        '   REC_PARC_FP, TOT_REC_PARC_FP, REC_PARC_FB, TOT_REC_PARC_FB, A' +
        'BONADOS, '
      
        '   TOT_ABONADOS, REC_ENC_CR, TOT_REC_ENC_CR, REC_ENC_FP, TOT_REC' +
        '_ENC_FP, '
      
        '   REC_ENC_FB, TOT_REC_ENC_FB, REC_PARC_ATRAS_CR, TOT_REC_PARC_A' +
        'TRAS_CR, '
      
        '   REC_PARC_ATRAS_FP, TOT_REC_PARC_ATRAS_FP, REC_PARC_ATRAS_FB, ' +
        'TOT_REC_PARC_ATRAS_FB, '
      
        '   REC_AMORT_CR, TOT_REC_AMORT_CR, REC_AMORT_FP, TOT_REC_AMORT_F' +
        'P, REC_AMORT_FB, '
      
        '   TOT_REC_AMORT_FB, REC_QUIT_CR, TOT_REC_QUIT_CR, REC_QUIT_FP, ' +
        'TOT_REC_QUIT_FP, '
      '   REC_QUIT_FB, TOT_REC_QUIT_FB, SALDO_DEV, TOTALSALDO_DEV)'
      'values'
      
        '  (:NOMEPATRO, :NOMEPLANO, :DESCTIPOEMPTMO, :TCEDESCRICAO, :SALD' +
        'O_ANT, '
      
        '   :TOTALSALDO_ANT, :CONCESSOES, :TOTALCONCESSOES, :PARCELAS_CR,' +
        ' :TOTALPARC_CR, '
      
        '   :PARCELAS_FP, :TOTALPARC_FP, :PARCELAS_FB, :TOTALPARC_FB, :EN' +
        'CARGOS_CR, '
      
        '   :TOTALENC_CR, :ENCARGOS_FP, :TOTALENC_FP, :ENCARGOS_FB, :TOTA' +
        'LENC_FB, '
      
        '   :AMORTIZACAO_CR, :TOTALAMO_CR, :AMORTIZACAO_FP, :TOTALAMO_FP,' +
        ' :AMORTIZACAO_FB, '
      
        '   :TOTALAMO_FB, :QUITACAO_CR, :TOTALQUI_CR, :QUITACAO_FP, :TOTA' +
        'LQUI_FP, '
      
        '   :QUITACAO_FB, :TOTALQUI_FB, :PARCELAS_ECR, :TOTALPARC_ECR, :P' +
        'ARCELAS_EFP, '
      
        '   :TOTALPARC_EFP, :PARCELAS_EFB, :TOTALPARC_EFB, :ENCARGOS_ECR,' +
        ' :TOTALENC_ECR, '
      
        '   :ENCARGOS_EFP, :TOTALENC_EFP, :ENCARGOS_EFB, :TOTALENC_EFB, :' +
        'AMORTIZACAO_ECR, '
      
        '   :TOTALAMO_ECR, :AMORTIZACAO_EFP, :TOTALAMO_EFP, :AMORTIZACAO_' +
        'EFB, :TOTALAMO_EFB, '
      
        '   :QUITACAO_ECR, :TOTALQUI_ECR, :QUITACAO_EFP, :TOTALQUI_EFP, :' +
        'QUITACAO_EFB, '
      
        '   :TOTALQUI_EFB, :REC_PARC_CR, :TOT_REC_PARC_CR, :REC_PARC_FP, ' +
        ':TOT_REC_PARC_FP, '
      
        '   :REC_PARC_FB, :TOT_REC_PARC_FB, :ABONADOS, :TOT_ABONADOS, :RE' +
        'C_ENC_CR, '
      
        '   :TOT_REC_ENC_CR, :REC_ENC_FP, :TOT_REC_ENC_FP, :REC_ENC_FB, :' +
        'TOT_REC_ENC_FB, '
      
        '   :REC_PARC_ATRAS_CR, :TOT_REC_PARC_ATRAS_CR, :REC_PARC_ATRAS_F' +
        'P, :TOT_REC_PARC_ATRAS_FP, '
      
        '   :REC_PARC_ATRAS_FB, :TOT_REC_PARC_ATRAS_FB, :REC_AMORT_CR, :T' +
        'OT_REC_AMORT_CR, '
      
        '   :REC_AMORT_FP, :TOT_REC_AMORT_FP, :REC_AMORT_FB, :TOT_REC_AMO' +
        'RT_FB, '
      
        '   :REC_QUIT_CR, :TOT_REC_QUIT_CR, :REC_QUIT_FP, :TOT_REC_QUIT_F' +
        'P, :REC_QUIT_FB, '
      '   :TOT_REC_QUIT_FB, :SALDO_DEV, :TOTALSALDO_DEV)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  NOMEPATRO = :OLD_NOMEPATRO and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  DESCTIPOEMPTMO = :OLD_DESCTIPOEMPTMO and'
      '  TCEDESCRICAO = :OLD_TCEDESCRICAO and'
      '  SALDO_ANT = :OLD_SALDO_ANT and'
      '  TOTALSALDO_ANT = :OLD_TOTALSALDO_ANT and'
      '  CONCESSOES = :OLD_CONCESSOES and'
      '  TOTALCONCESSOES = :OLD_TOTALCONCESSOES and'
      '  PARCELAS_CR = :OLD_PARCELAS_CR and'
      '  TOTALPARC_CR = :OLD_TOTALPARC_CR and'
      '  PARCELAS_FP = :OLD_PARCELAS_FP and'
      '  TOTALPARC_FP = :OLD_TOTALPARC_FP and'
      '  PARCELAS_FB = :OLD_PARCELAS_FB and'
      '  TOTALPARC_FB = :OLD_TOTALPARC_FB and'
      '  ENCARGOS_CR = :OLD_ENCARGOS_CR and'
      '  TOTALENC_CR = :OLD_TOTALENC_CR and'
      '  ENCARGOS_FP = :OLD_ENCARGOS_FP and'
      '  TOTALENC_FP = :OLD_TOTALENC_FP and'
      '  ENCARGOS_FB = :OLD_ENCARGOS_FB and'
      '  TOTALENC_FB = :OLD_TOTALENC_FB and'
      '  AMORTIZACAO_CR = :OLD_AMORTIZACAO_CR and'
      '  TOTALAMO_CR = :OLD_TOTALAMO_CR and'
      '  AMORTIZACAO_FP = :OLD_AMORTIZACAO_FP and'
      '  TOTALAMO_FP = :OLD_TOTALAMO_FP and'
      '  AMORTIZACAO_FB = :OLD_AMORTIZACAO_FB and'
      '  TOTALAMO_FB = :OLD_TOTALAMO_FB and'
      '  QUITACAO_CR = :OLD_QUITACAO_CR and'
      '  TOTALQUI_CR = :OLD_TOTALQUI_CR and'
      '  QUITACAO_FP = :OLD_QUITACAO_FP and'
      '  TOTALQUI_FP = :OLD_TOTALQUI_FP and'
      '  QUITACAO_FB = :OLD_QUITACAO_FB and'
      '  TOTALQUI_FB = :OLD_TOTALQUI_FB and'
      '  PARCELAS_ECR = :OLD_PARCELAS_ECR and'
      '  TOTALPARC_ECR = :OLD_TOTALPARC_ECR and'
      '  PARCELAS_EFP = :OLD_PARCELAS_EFP and'
      '  TOTALPARC_EFP = :OLD_TOTALPARC_EFP and'
      '  PARCELAS_EFB = :OLD_PARCELAS_EFB and'
      '  TOTALPARC_EFB = :OLD_TOTALPARC_EFB and'
      '  ENCARGOS_ECR = :OLD_ENCARGOS_ECR and'
      '  TOTALENC_ECR = :OLD_TOTALENC_ECR and'
      '  ENCARGOS_EFP = :OLD_ENCARGOS_EFP and'
      '  TOTALENC_EFP = :OLD_TOTALENC_EFP and'
      '  ENCARGOS_EFB = :OLD_ENCARGOS_EFB and'
      '  TOTALENC_EFB = :OLD_TOTALENC_EFB and'
      '  AMORTIZACAO_ECR = :OLD_AMORTIZACAO_ECR and'
      '  TOTALAMO_ECR = :OLD_TOTALAMO_ECR and'
      '  AMORTIZACAO_EFP = :OLD_AMORTIZACAO_EFP and'
      '  TOTALAMO_EFP = :OLD_TOTALAMO_EFP and'
      '  AMORTIZACAO_EFB = :OLD_AMORTIZACAO_EFB and'
      '  TOTALAMO_EFB = :OLD_TOTALAMO_EFB and'
      '  QUITACAO_ECR = :OLD_QUITACAO_ECR and'
      '  TOTALQUI_ECR = :OLD_TOTALQUI_ECR and'
      '  QUITACAO_EFP = :OLD_QUITACAO_EFP and'
      '  TOTALQUI_EFP = :OLD_TOTALQUI_EFP and'
      '  QUITACAO_EFB = :OLD_QUITACAO_EFB and'
      '  TOTALQUI_EFB = :OLD_TOTALQUI_EFB and'
      '  REC_PARC_CR = :OLD_REC_PARC_CR and'
      '  TOT_REC_PARC_CR = :OLD_TOT_REC_PARC_CR and'
      '  REC_PARC_FP = :OLD_REC_PARC_FP and'
      '  TOT_REC_PARC_FP = :OLD_TOT_REC_PARC_FP and'
      '  REC_PARC_FB = :OLD_REC_PARC_FB and'
      '  TOT_REC_PARC_FB = :OLD_TOT_REC_PARC_FB and'
      '  ABONADOS = :OLD_ABONADOS and'
      '  TOT_ABONADOS = :OLD_TOT_ABONADOS and'
      '  REC_ENC_CR = :OLD_REC_ENC_CR and'
      '  TOT_REC_ENC_CR = :OLD_TOT_REC_ENC_CR and'
      '  REC_ENC_FP = :OLD_REC_ENC_FP and'
      '  TOT_REC_ENC_FP = :OLD_TOT_REC_ENC_FP and'
      '  REC_ENC_FB = :OLD_REC_ENC_FB and'
      '  TOT_REC_ENC_FB = :OLD_TOT_REC_ENC_FB and'
      '  REC_PARC_ATRAS_CR = :OLD_REC_PARC_ATRAS_CR and'
      '  TOT_REC_PARC_ATRAS_CR = :OLD_TOT_REC_PARC_ATRAS_CR and'
      '  REC_PARC_ATRAS_FP = :OLD_REC_PARC_ATRAS_FP and'
      '  TOT_REC_PARC_ATRAS_FP = :OLD_TOT_REC_PARC_ATRAS_FP and'
      '  REC_PARC_ATRAS_FB = :OLD_REC_PARC_ATRAS_FB and'
      '  TOT_REC_PARC_ATRAS_FB = :OLD_TOT_REC_PARC_ATRAS_FB and'
      '  REC_AMORT_CR = :OLD_REC_AMORT_CR and'
      '  TOT_REC_AMORT_CR = :OLD_TOT_REC_AMORT_CR and'
      '  REC_AMORT_FP = :OLD_REC_AMORT_FP and'
      '  TOT_REC_AMORT_FP = :OLD_TOT_REC_AMORT_FP and'
      '  REC_AMORT_FB = :OLD_REC_AMORT_FB and'
      '  TOT_REC_AMORT_FB = :OLD_TOT_REC_AMORT_FB and'
      '  REC_QUIT_CR = :OLD_REC_QUIT_CR and'
      '  TOT_REC_QUIT_CR = :OLD_TOT_REC_QUIT_CR and'
      '  REC_QUIT_FP = :OLD_REC_QUIT_FP and'
      '  TOT_REC_QUIT_FP = :OLD_TOT_REC_QUIT_FP and'
      '  REC_QUIT_FB = :OLD_REC_QUIT_FB and'
      '  TOT_REC_QUIT_FB = :OLD_TOT_REC_QUIT_FB and'
      '  SALDO_DEV = :OLD_SALDO_DEV and'
      '  TOTALSALDO_DEV = :OLD_TOTALSALDO_DEV')
    Left = 208
    Top = 64
  end
end
