inherited FrmListaRetencoesMT: TFrmListaRetencoesMT
  Left = 310
  Top = 240
  BorderIcons = [biSystemMenu]
  Caption = 'Retencoes e/ou Agregados'
  ClientHeight = 272
  ClientWidth = 617
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 233
    object GrdValCalc: TwwDBGrid
      Left = 1
      Top = 1
      Width = 615
      Height = 231
      ControlType.Strings = (
        'CONFIRMARETENCAO;CheckBox;S;N')
      Selected.Strings = (
        'HISTORICOCOMPL'#9'27'#9'Descrição do Lançamento'#9'F'
        'VLRRETIDO'#9'12'#9'Vlr. Calculado'#9'F'
        'CONFIRMARETENCAO'#9'3'#9'Ok'#9'F'
        'VALOR'#9'12'#9'Vlr. a Efetivar'#9'F'
        'NUMFATURA'#9'25'#9'Nº do Certificado\Documento'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = DsimpAgreg
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnCalcCellColors = GrdValCalcCalcCellColors
      OnCalcTitleAttributes = GrdValCalcCalcTitleAttributes
      IndicatorColor = icBlack
      OnFieldChanged = GrdValCalcFieldChanged
    end
  end
  inherited Dock971: TDock97
    Top = 233
    Width = 617
    object Label1: TLabel [0]
      Left = 8
      Top = 13
      Width = 114
      Height = 13
      Caption = 'Valor Líquido Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotal: TLabel [1]
      Left = 128
      Top = 13
      Width = 21
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'R$ '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 445
      DockPos = 503
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 276
      DockPos = 334
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 517
    Top = 127
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object DsimpAgreg: TwwDataSource
    DataSet = cdsImpAgreg
    Left = 97
    Top = 65
  end
  object sqlImpAgreg: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.HISTORICOCOMPL,'
      '  I.IDIMPOSTORETIDO,'
      '  I.NUMLANCTO,'
      '  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      '  TO_CHAR(D.NODOCUMENTO) || '#39'/'#39' || D.COMPLDOCUMENTO) AS NUMDOC,'
      '  D.CODDOCUMENTO,'
      '  0 AS VALOROUTRAMOEDA,'
      '  L.UNIDNEGOC,'
      '  L.ESTORNO,'
      '  I.VLRRETIDO AS VLRLIQUIDO,'
      '  I.VLRRETIDO AS VALOR,'
      '  I.VLRRETIDO AS VLRRETIDO,'
      '  TA.ACRESDECRES,'
      '  L.PLNCODIGO,'
      '  TA.CODALTERADOR,'
      '  L.DATALANCTO,'
      '  L.HISTORICOCOMPL,'
      '  T.FLGALTERARETENCAO,'
      '  L.NUMFATURA,'
      '  ('#39'S'#39') AS CONFIRMARETENCAO,'
      '  L.DEBCRE,'
      '  D.CODTIPDOC,'
      '  D.DATAPROGRAMADA,'
      '  D.OPERACAO,'
      '  D.IDFORCLI,'
      '  D.DATAEMISSAO'
      'FROM'
      
        '  IMPOSTORETIDO I, LANCTODOCUM L, TIPOAGRE T, DOCUMENTO D, TIPOA' +
        'LTERADOR TA'
      'WHERE'
      '  (T.FLGLANCAIMPOSTO = '#39'B'#39')                  AND'
      '  (I.NUMLANCTOORIGEM =  :NUMLANCTOORIGEM)     AND'
      '  (I.NUMLANCTO = L.NUMLANCTO(+))             AND'
      '  (L.CODALTERADOR = TA.CODALTERADOR(+))      AND'
      '  (T.CODTIPOCUSTAGREG  = I.CODTIPOCUSTAGREG) AND'
      '  (D.CODDOCUMENTO = I.CODDOCUMENTO)'
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsImpAgreg
    Left = 35
    Top = 65
  end
  object cdsImpAgreg: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 65
    Top = 65
    Data = {
      F70200009619E0BD010000001800000019000000000003000000F7020E484953
      544F5249434F434F4D504C0100490000000100055749445448020002003C000F
      4944494D504F53544F52455449444F0800040000000000094E554D4C414E4354
      4F0800040000000000064E554D444F4301004900000001000557494454480200
      02002C000C434F44444F43554D454E544F08000400000000000F56414C4F524F
      555452414D4F454441080004000000000009554E49444E45474F430800040000
      000000074553544F524E4F08000400000000000A564C524C49515549444F0800
      0400000000000556414C4F52080004000000000009564C5252455449444F0800
      0400000000000B41435245534445435245530100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020001000950
      4C4E434F4449474F08000400000000000C434F44414C54455241444F52080004
      00000000000A444154414C414E43544F080008000000000010484953544F5249
      434F434F4D504C5F310100490000000100055749445448020002003C0011464C
      47414C54455241524554454E43414F0100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000100094E554D46
      41545552410100490000000100055749445448020002003C0010434F4E464952
      4D41524554454E43414F01004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200010006444542435245010049
      00000002000753554254595045020049000A0046697865644368617200055749
      44544802000200010009434F44544950444F4308000400000000000E44415441
      50524F4752414D4144410800080000000000084F5045524143414F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000200084944464F52434C4908000400000000000B44415441454D49
      5353414F08000800000000000100044C4349440400010009080000}
    object cdsImpAgregHISTORICOCOMPL: TStringField
      DisplayLabel = 'Descrição do Lançamento'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object cdsImpAgregVLRRETIDO: TFloatField
      DisplayLabel = 'Vlr. Calculado'
      DisplayWidth = 12
      FieldName = 'VLRRETIDO'
      currency = True
    end
    object cdsImpAgregCONFIRMARETENCAO: TStringField
      DisplayLabel = 'Ok'
      DisplayWidth = 3
      FieldName = 'CONFIRMARETENCAO'
      FixedChar = True
      Size = 1
    end
    object cdsImpAgregVALOR: TFloatField
      DisplayLabel = 'Vlr. a Efetivar'
      DisplayWidth = 12
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsImpAgregNUMFATURA: TStringField
      DisplayLabel = 'Nº do Certificado\Documento'
      DisplayWidth = 25
      FieldName = 'NUMFATURA'
      Size = 60
    end
    object cdsImpAgregIDIMPOSTORETIDO: TFloatField
      FieldName = 'IDIMPOSTORETIDO'
      Visible = False
    end
    object cdsImpAgregNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object cdsImpAgregNUMDOC: TStringField
      FieldName = 'NUMDOC'
      Visible = False
      Size = 44
    end
    object cdsImpAgregCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object cdsImpAgregVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object cdsImpAgregUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object cdsImpAgregESTORNO: TFloatField
      FieldName = 'ESTORNO'
      Visible = False
    end
    object cdsImpAgregVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      Visible = False
    end
    object cdsImpAgregACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsImpAgregPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object cdsImpAgregCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object cdsImpAgregDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Visible = False
    end
    object cdsImpAgregHISTORICOCOMPL_1: TStringField
      FieldName = 'HISTORICOCOMPL_1'
      Visible = False
      Size = 60
    end
    object cdsImpAgregFLGALTERARETENCAO: TStringField
      FieldName = 'FLGALTERARETENCAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsImpAgregDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsImpAgregCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object cdsImpAgregDATAPROGRAMADA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAPROGRAMADA'
      Visible = False
    end
    object cdsImpAgregOPERACAO: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsImpAgregIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object cdsImpAgregDATAEMISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAEMISSAO'
      Visible = False
    end
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '  ACRESDECRES '
      'FROM '
      '  TIPOALTERADOR '
      'WHERE'
      '  RECPAG = :pRECPAG AND'
      '  CODALTERADOR = :pCODALTERADOR')
    ClientDataSet = cdsAux
    Left = 35
    Top = 95
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 65
    Top = 95
  end
end
