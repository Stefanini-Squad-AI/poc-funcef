object dtmLookCotas: TdtmLookCotas
  OldCreateOrder = False
  Left = 139
  Top = 152
  Height = 479
  Width = 538
  object CdsDadosFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 24
    object CdsDadosFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDadosFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDadosFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsDadosFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsDadosFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object CdsDadosFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsDadosFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object CdsDadosFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object CdsDadosFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsDadosFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object CdsDadosFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object CdsDadosFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsDadosFundacao: TwwDataSource
    DataSet = CdsDadosFundacao
    Left = 40
    Top = 80
  end
end
