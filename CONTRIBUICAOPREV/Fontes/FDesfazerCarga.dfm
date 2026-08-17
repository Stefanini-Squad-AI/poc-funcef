inherited frmDesfazerCarga: TfrmDesfazerCarga
  Left = 545
  Top = 304
  BorderStyle = bsSingle
  Caption = 'Benefício Saldado e FAB - Carga de Arquivo'
  ClientHeight = 207
  ClientWidth = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 168
    object dbgrdBenefSaldado: TwwDBGrid
      Left = 1
      Top = 1
      Width = 382
      Height = 166
      Selected.Strings = (
        'SEL'#9'3'#9'  '
        'IDCARGAARQUIVO'#9'13'#9'Id Carga'
        'QTDE_REGISTROS'#9'13'#9'Qtde de ~Registros'
        'DATAIMPORTACAO'#9'18'#9'Data Importação'
        'DATASALDAMENTO'#9'17'#9'Data Saldamento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsImportados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 168
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 212
      DockPos = 392
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
      DockPos = 291
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Width = 13
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 131
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryImportados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 SEL, COUNT(C.IDCARGAARQUIVO) QTDE_REGISTROS, '
      '            C.DATAIMPORTACAO, C.DATASALDAMENTO, C.IDCARGAARQUIVO'
      '  FROM CARGABENEFSALDFAB C, BENEFSALDFAB B'
      '  WHERE C.IDCARGAARQUIVO = B.IDCARGAARQUIVO'
      '    AND C.IDPESSOA = B.IDPESSOA'
      '    AND C.IDTITULAR = B.IDTITULAR'
      'GROUP BY C.IDCARGAARQUIVO, C.DATASALDAMENTO, C.DATAIMPORTACAO')
    UpdateObject = updImportados
    ControlType.Strings = (
      'SEL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 40
    Top = 24
    object qryImportadosSEL: TFloatField
      DisplayLabel = '  '
      DisplayWidth = 3
      FieldName = 'SEL'
    end
    object qryImportadosIDCARGAARQUIVO: TFloatField
      DisplayLabel = 'Id Carga'
      DisplayWidth = 13
      FieldName = 'IDCARGAARQUIVO'
      ReadOnly = True
    end
    object qryImportadosQTDE_REGISTROS: TFloatField
      DisplayLabel = 'Qtde de ~Registros'
      DisplayWidth = 13
      FieldName = 'QTDE_REGISTROS'
      ReadOnly = True
    end
    object qryImportadosDATAIMPORTACAO: TDateTimeField
      DisplayLabel = 'Data Importação'
      DisplayWidth = 18
      FieldName = 'DATAIMPORTACAO'
      ReadOnly = True
    end
    object qryImportadosDATASALDAMENTO: TDateTimeField
      DisplayLabel = 'Data Saldamento'
      DisplayWidth = 17
      FieldName = 'DATASALDAMENTO'
      ReadOnly = True
    end
  end
  object updImportados: TUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO CM.HSTALTBENEFSALDFAB'
      '(IDHSTALTBENEFSALDFAB, IDPESSOA, IDTITULAR, TIPO, '
      ' CAMPO, VALORANTERIOR, VALORALTERADO, MESREFERENCIA,'
      'TRIGGERUSERINCLUSAO)'
      'VALUES'
      
        '(CM.SEQHSTALTBENEFSALDFAB.NEXTVAL, :IDPESSOA, :IDTITULAR, :TIPO,' +
        ' '
      ' :CAMPO, :VALORANTERIOR, :VALORALTERADO, :MESREFERENCIA,'
      ':TRIGGERUSERINCLUSAO)')
    Left = 40
    Top = 136
  end
  object dsImportados: TDataSource
    DataSet = qryImportados
    Left = 40
    Top = 72
  end
  object qryHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM CM.HSTALTBENEFSALDFAB WHERE 1 = 2')
    UpdateObject = updHistorico
    ValidateWithMask = True
    Left = 121
    Top = 17
    object qryHistoricoIDHSTALTBENEFSALDFAB: TFloatField
      FieldName = 'IDHSTALTBENEFSALDFAB'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDHSTALTBENEFSALDFAB'
    end
    object qryHistoricoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDPESSOA'
    end
    object qryHistoricoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDTITULAR'
    end
    object qryHistoricoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoCAMPO: TStringField
      FieldName = 'CAMPO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.CAMPO'
    end
    object qryHistoricoVALORANTERIOR: TStringField
      FieldName = 'VALORANTERIOR'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.VALORANTERIOR'
      Size = 50
    end
    object qryHistoricoVALORALTERADO: TStringField
      FieldName = 'VALORALTERADO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.VALORALTERADO'
      Size = 50
    end
    object qryHistoricoMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.MESREFERENCIA'
      Size = 10
    end
  end
  object updHistorico: TUpdateSQL
    InsertSQL.Strings = (
      'insert into CM.HSTALTBENEFSALDFAB'
      '  (IDHSTALTBENEFSALDFAB, IDPESSOA, IDTITULAR, TIPO, CAMPO, '
      'VALORANTERIOR, '
      '   VALORALTERADO, MESREFERENCIA)'
      'values'
      '  (SEQHSTALTBENEFSALDFAB.NEXTVAL, :IDPESSOA, :IDTITULAR, :TIPO, '
      ':CAMPO, :VALORANTERIOR, '
      '   :VALORALTERADO, :MESREFERENCIA)')
    Left = 120
    Top = 64
  end
  object qryDesfazerCarga: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'DELETE FROM CM.CARGABENEFSALDFAB '
      ' WHERE '
      'IDCARGAARQUIVO = :IDCARGAARQUIVO')
    ValidateWithMask = True
    Left = 305
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGAARQUIVO'
        ParamType = ptUnknown
      end>
    object qryDesfazerCargaIDCARGABENEFSALDFAB: TFloatField
      FieldName = 'IDCARGABENEFSALDFAB'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.IDCARGABENEFSALDFAB'
    end
    object qryDesfazerCargaIDCARGAARQUIVO: TFloatField
      FieldName = 'IDCARGAARQUIVO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.IDCARGAARQUIVO'
    end
    object qryDesfazerCargaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.IDPESSOA'
    end
    object qryDesfazerCargaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.IDTITULAR'
    end
    object qryDesfazerCargaDATASALDAMENTO: TDateTimeField
      FieldName = 'DATASALDAMENTO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.DATASALDAMENTO'
    end
    object qryDesfazerCargaDATAIMPORTACAO: TDateTimeField
      FieldName = 'DATAIMPORTACAO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.DATAIMPORTACAO'
    end
    object qryDesfazerCargaPCS: TStringField
      FieldName = 'PCS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.PCS'
      Size = 30
    end
    object qryDesfazerCargaNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.NOMECARGO'
      Size = 30
    end
    object qryDesfazerCargaVALORCARGO: TFloatField
      FieldName = 'VALORCARGO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VALORCARGO'
    end
    object qryDesfazerCargaPERCENTATS: TFloatField
      FieldName = 'PERCENTATS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.PERCENTATS'
    end
    object qryDesfazerCargaVALORATS: TFloatField
      FieldName = 'VALORATS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VALORATS'
    end
    object qryDesfazerCargaVPGRATSEMADICTEMPSERV: TFloatField
      FieldName = 'VPGRATSEMADICTEMPSERV'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VPGRATSEMADICTEMPSERV'
    end
    object qryDesfazerCargaVPGIPTEMPOSERV: TFloatField
      FieldName = 'VPGIPTEMPOSERV'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VPGIPTEMPOSERV'
    end
    object qryDesfazerCargaVPGIPSEMSALCOMFUNC: TFloatField
      FieldName = 'VPGIPSEMSALCOMFUNC'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VPGIPSEMSALCOMFUNC'
    end
    object qryDesfazerCargaVPEXBH: TFloatField
      FieldName = 'VPEXBH'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VPEXBH'
    end
    object qryDesfazerCargaADICCOMP: TFloatField
      FieldName = 'ADICCOMP'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ADICCOMP'
    end
    object qryDesfazerCargaADICINCORP: TFloatField
      FieldName = 'ADICINCORP'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ADICINCORP'
    end
    object qryDesfazerCargaADICNOTURNO: TFloatField
      FieldName = 'ADICNOTURNO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ADICNOTURNO'
    end
    object qryDesfazerCargaADICINSALU: TFloatField
      FieldName = 'ADICINSALU'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ADICINSALU'
    end
    object qryDesfazerCargaADICPERI: TFloatField
      FieldName = 'ADICPERI'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ADICPERI'
    end
    object qryDesfazerCargaINCORPJUD: TFloatField
      FieldName = 'INCORPJUD'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.INCORPJUD'
    end
    object qryDesfazerCargaCODCARGOCOMIS: TFloatField
      FieldName = 'CODCARGOCOMIS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.CODCARGOCOMIS'
    end
    object qryDesfazerCargaNOMECARGOCOMIS: TStringField
      FieldName = 'NOMECARGOCOMIS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.NOMECARGOCOMIS'
      Size = 30
    end
    object qryDesfazerCargaVALORCARGOCOMIS: TFloatField
      FieldName = 'VALORCARGOCOMIS'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.VALORCARGOCOMIS'
    end
    object qryDesfazerCargaSALPART: TFloatField
      FieldName = 'SALPART'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.SALPART'
    end
    object qryDesfazerCargaBENEFICIOSALDADO: TFloatField
      FieldName = 'BENEFICIOSALDADO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.BENEFICIOSALDADO'
    end
    object qryDesfazerCargaPERCENTPBE: TFloatField
      FieldName = 'PERCENTPBE'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.PERCENTPBE'
    end
    object qryDesfazerCargaULTIMOMESPROC: TStringField
      FieldName = 'ULTIMOMESPROC'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.ULTIMOMESPROC'
      Size = 7
    end
    object qryDesfazerCargaDATAELEGIBILIDADE: TDateTimeField
      FieldName = 'DATAELEGIBILIDADE'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.DATAELEGIBILIDADE'
    end
  end
  object qryDesfazerBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'DELETE FROM CM.BENEFSALDFAB'
      ' WHERE '
      'IDCARGAARQUIVO = :IDCARGAARQUIVO')
    ValidateWithMask = True
    Left = 303
    Top = 73
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGAARQUIVO'
        ParamType = ptUnknown
      end>
    object qryDesfazerBenefIDBENEFSALDFAB: TFloatField
      FieldName = 'IDBENEFSALDFAB'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDBENEFSALDFAB'
    end
    object qryDesfazerBenefIDCARGAARQUIVO: TFloatField
      FieldName = 'IDCARGAARQUIVO'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDCARGAARQUIVO'
    end
    object qryDesfazerBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDPESSOA'
    end
    object qryDesfazerBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDTITULAR'
    end
    object qryDesfazerBenefMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.BENEFSALDFAB.MESREFERENCIA'
      Size = 7
    end
    object qryDesfazerBenefVALORINDICE: TFloatField
      FieldName = 'VALORINDICE'
      Origin = 'BASEDADOS.BENEFSALDFAB.VALORINDICE'
    end
    object qryDesfazerBenefINDICE: TStringField
      FieldName = 'INDICE'
      Origin = 'BASEDADOS.BENEFSALDFAB.INDICE'
      Size = 5
    end
    object qryDesfazerBenefINDICEACUMULADO: TFloatField
      FieldName = 'INDICEACUMULADO'
      Origin = 'BASEDADOS.BENEFSALDFAB.INDICEACUMULADO'
    end
    object qryDesfazerBenefBENEFSALDADO: TFloatField
      FieldName = 'BENEFSALDADO'
      Origin = 'BASEDADOS.BENEFSALDFAB.BENEFSALDADO'
    end
    object qryDesfazerBenefSALDOFAB: TFloatField
      FieldName = 'SALDOFAB'
      Origin = 'BASEDADOS.BENEFSALDFAB.SALDOFAB'
    end
  end
  object qryDesfazer: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT B.IDTITULAR, B.IDPESSOA,  C.IDCARGAARQUIVO'
      '  FROM CARGABENEFSALDFAB C, BENEFSALDFAB B'
      '  WHERE C.IDCARGAARQUIVO = :IDCARGAARQUIVO'
      '    AND C.IDCARGAARQUIVO = B.IDCARGAARQUIVO'
      '    AND C.IDPESSOA = B.IDPESSOA'
      '    AND C.IDTITULAR = B.IDTITULAR'
      ' group by  B.IDTITULAR, B.IDPESSOA,  C.IDCARGAARQUIVO')
    ValidateWithMask = True
    Left = 209
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGAARQUIVO'
        ParamType = ptUnknown
      end>
    object qryDesfazerIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDTITULAR'
    end
    object qryDesfazerIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFSALDFAB.IDPESSOA'
    end
    object qryDesfazerIDCARGAARQUIVO: TFloatField
      FieldName = 'IDCARGAARQUIVO'
      Origin = 'BASEDADOS.CARGABENEFSALDFAB.IDCARGAARQUIVO'
    end
  end
end
