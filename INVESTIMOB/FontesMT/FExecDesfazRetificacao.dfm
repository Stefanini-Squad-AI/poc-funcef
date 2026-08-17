inherited frmExecDesfazRetificacao: TfrmExecDesfazRetificacao
  HelpContext = 540072
  Caption = 'Desfazer Retificação de Reavaliação'
  ClientHeight = 141
  ClientWidth = 434
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 102
    inline molImovelouMestre: TmolImovelouMestre
      Left = 15
      Top = 16
      Width = 436
      inherited edtImovel: TEdit
        Width = 337
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 344
        OnClick = molImovelouMestrebtnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 368
        OnClick = molImovelouMestrebtnLimpaImovelClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 102
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 262
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 93
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65531
    Top = 259
  end
  object MS_Retifica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'M.IDIMOVEL'
      'M.NOME_IMOVEL'
      'M.IMOCODIGO'
      'R.DATAREAVALIACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'ID Imóvel'
      'Nome'
      'Código'
      'Data Movimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWBEMXIMOVEL M'
      'REAVALIAXREAVALIA R')
    CamposChave.Strings = (
      'M.IDIMOVEL'
      'M.NOME_IMOVEL'
      'R.DATAREAVALIACAO')
    Filtro.Strings = (
      'M.IDIMOVEL    = R.IDIMOVEL'
      'R.FLGRETIFICA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 320
    Top = 48
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   REAV.IDPESSOA,'
      '   REAV.IDREAVALIACAO AS IDRETIFICREAV,'
      '   VW.IDIMOVEL,'
      '   VW.IDBEM,'
      '   VW.DESBEM,'
      '   REAV.DATAREAVALIACAO,'
      '   REAV.VLRREAVALIA AS VLR_REAVALIA,'
      '   REAV.VIDAUTIL,'
      '   0 AS VLR_CONTABIL,'
      '   REAV.VIDAUTIL AS NOVAVIDAUTIL,'
      '   REAV.VLRREAVALIA AS NOVOVLR_REAVALIA,'
      '   ULT.DATAREAVALIACAO AS ULT_REAVALIACAO'
      'FROM'
      '   VWBEMXIMOVEL VW,'
      '   REAVALIAXREAVALIA REAV,'
      '   (SELECT IDIMOVEL, IDBEM, DATAREAVALIACAO'
      '    FROM   REAVALIAXREAVALIA REAV'
      '    WHERE  REAV.IDIMOVEL = :PIDIMOVEL'
      
        '      AND ( REAV.DATAREAVALIACAO = (SELECT MAX(R.DATAREAVALIACAO' +
        ')'
      '                                 FROM   REAVALIAXREAVALIA R'
      
        '                                 WHERE  R.IDIMOVEL = REAV.IDIMOV' +
        'EL'
      '                                 AND    R.IDBEM    = REAV.IDBEM'
      
        '                                 AND    R.DATAREAVALIACAO < :DDA' +
        'TAPROCESSO) )'
      '   ) ULT'
      'WHERE'
      '      ( VW.FLGATIVO   = 1 )'
      '  AND ( VW.BAIXATOTAL = '#39'N'#39' )'
      '  AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL = :PIDIMOVEL) )'
      '  AND ( REAV.IDIMOVEL = VW.IDIMOVEL )'
      '  AND ( REAV.IDBEM    = VW.IDBEM )'
      '  AND ( REAV.DATAREAVALIACAO = (SELECT MAX(R.DATAREAVALIACAO)'
      '                                FROM   REAVALIAXREAVALIA R'
      
        '                                WHERE  R.IDIMOVEL = REAV.IDIMOVE' +
        'L'
      '                                AND    R.IDBEM    = REAV.IDBEM'
      
        '                                AND    R.DATAREAVALIACAO <= :DDA' +
        'TAPROCESSO) )'
      '  AND REAV.IDIMOVEL = ULT.IDIMOVEL(+)'
      '  AND REAV.IDBEM    = ULT.IDBEM(+)'
      '  AND REAV.FLGRETIFICA = 1'
      'ORDER BY'
      '   VW.DESBEM'
      ''
      '')
    ValidateWithMask = True
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataProcesso'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DDATAPROCESSO'
        ParamType = ptInput
      end>
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemIDRETIFICREAV: TFloatField
      FieldName = 'IDRETIFICREAV'
    end
    object qryBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qryBemVLR_REAVALIA: TFloatField
      FieldName = 'VLR_REAVALIA'
    end
    object qryBemVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object qryBemVLR_CONTABIL: TFloatField
      FieldName = 'VLR_CONTABIL'
    end
    object qryBemNOVAVIDAUTIL: TFloatField
      FieldName = 'NOVAVIDAUTIL'
    end
    object qryBemNOVOVLR_REAVALIA: TFloatField
      FieldName = 'NOVOVLR_REAVALIA'
    end
    object qryBemULT_REAVALIACAO: TDateTimeField
      FieldName = 'ULT_REAVALIACAO'
    end
  end
  object dsBem: TwwDataSource
    DataSet = cdsBem
    Left = 160
    Top = 73
  end
  object updBem: TUpdateSQL
    Left = 160
    Top = 92
  end
  object dspBem: TDataSetProvider
    DataSet = qryBem
    Constraints = True
    Left = 160
    Top = 109
  end
  object cdsBem: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDRETIFICREAV'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDBEM'
        DataType = ftFloat
      end
      item
        Name = 'DESBEM'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATAREAVALIACAO'
        DataType = ftDateTime
      end
      item
        Name = 'VLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CONTABIL'
        DataType = ftFloat
      end
      item
        Name = 'NOVAVIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'NOVOVLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'ULT_REAVALIACAO'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'cdsBemIndex2'
        Fields = 'DESBEM'
      end>
    IndexName = 'cdsBemIndex2'
    Params = <>
    ProviderName = 'dspBem'
    StoreDefs = True
    Left = 160
    Top = 127
    object cdsBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsBemIDRETIFICREAV: TFloatField
      FieldName = 'IDRETIFICREAV'
    end
    object cdsBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object cdsBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object cdsBemDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object cdsBemVLR_REAVALIA: TFloatField
      FieldName = 'VLR_REAVALIA'
    end
    object cdsBemVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsBemVLR_CONTABIL: TFloatField
      FieldName = 'VLR_CONTABIL'
    end
    object cdsBemNOVAVIDAUTIL: TFloatField
      FieldName = 'NOVAVIDAUTIL'
    end
    object cdsBemNOVOVLR_REAVALIA: TFloatField
      FieldName = 'NOVOVLR_REAVALIA'
    end
    object cdsBemULT_REAVALIACAO: TDateTimeField
      FieldName = 'ULT_REAVALIACAO'
    end
  end
  object qryDeletaReavalia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALIAXREAVALIA'
      ' WHERE IDIMOVEL        = :PIDIMOVEL'
      '   AND DATAREAVALIACAO = :DDATAPROCESSO'
      '   AND FLGRETIFICA     = 1')
    ValidateWithMask = True
    Left = 312
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DDATAPROCESSO'
        ParamType = ptInput
      end>
  end
end
