inherited RptRelatWeb: TRptRelatWeb
  Left = 267
  Top = 206
  Width = 249
  Height = 194
  Caption = ''
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cdsTestaPer: TClientDataSet [0]
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'DATALANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 76
    Top = 4
  end
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Left = 20
    Top = 4
  end
  inherited DevRptCM: TExtraOptions
    Left = 16
    Top = 52
  end
  inherited CrmRptCM: TCmRptManager
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    Left = 19
    Top = 100
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 75
    Top = 52
  end
  object cdsCotacaoMoeda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'DATALANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 75
    Top = 100
  end
  object cdsEmpresaProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 4
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = cdsEmpresaProp
    Left = 168
    Top = 48
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 167
    Top = 96
  end
end
