inherited FrmAlteraDocEmitidosMT: TFrmAlteraDocEmitidosMT
  Left = 193
  Top = 104
  BorderStyle = bsSingle
  Caption = 'Documentos Emitos via CNAB'
  ClientHeight = 432
  ClientWidth = 694
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 393
    object F: TwwDBGrid
      Left = 5
      Top = 5
      Width = 684
      Height = 383
      Cursor = crHandPoint
      ControlType.Strings = (
        'EMISBLOQ;CheckBox;S;N')
      Selected.Strings = (
        'EMISBLOQ'#9'4'#9'Emite'#9'F'
        'NOSSONUMERO'#9'11'#9'Nosso Número'#9'F'
        'NODOCUMENTO'#9'12'#9'Num. Doc'#9'F'
        'COMPLDOCUMENTO'#9'5'#9'Complt'#9'F'
        'DATAPROGRAMADA'#9'13'#9'Data Programada'#9'F'
        'RAZAOSOCIAL'#9'32'#9'Razão Social'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      DataSource = DsDocEmitidos
      DragCursor = crHourGlass
      KeyOptions = []
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = FCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 123
    Top = 139
  end
  object DsDocEmitidos: TwwDataSource
    DataSet = CdsDocEmitidos
    Left = 64
    Top = 264
  end
  object CdsDocEmitidos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 224
    Data = {
      470100009619E0BD01000000180000000800000000000300000047010B52415A
      414F534F4349414C0100490000000100055749445448020002003C000E444154
      4150524F4752414D41444108000800000000000B4E4F444F43554D454E544F08
      000400000000000E434F4D504C444F43554D454E544F01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      03000B4E4F53534F4E554D45524F010049000000010005574944544802000200
      140008454D4953424C4F5101004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020001000F434F4E54524F4C45
      52454D4553534108000400000000000C434F44444F43554D454E544F08000400
      0000000002000D44454641554C545F4F5244455202008200010000000300044C
      4349440400010009080000}
    object CdsDocEmitidosEMISBLOQ: TStringField
      DisplayLabel = 'Emite'
      DisplayWidth = 4
      FieldName = 'EMISBLOQ'
      OnChange = CdsDocEmitidosEMISBLOQChange
      FixedChar = True
      Size = 1
    end
    object CdsDocEmitidosNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso Número'
      DisplayWidth = 11
      FieldName = 'NOSSONUMERO'
    end
    object CdsDocEmitidosNODOCUMENTO: TFloatField
      DisplayLabel = 'Num. Doc'
      DisplayWidth = 12
      FieldName = 'NODOCUMENTO'
    end
    object CdsDocEmitidosCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Complt'
      DisplayWidth = 5
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDocEmitidosDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Programada'
      DisplayWidth = 13
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDocEmitidosRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 32
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDocEmitidosCONTROLEREMESSA: TFloatField
      FieldName = 'CONTROLEREMESSA'
      Visible = False
    end
    object CdsDocEmitidosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object SqlDocEmitidos: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  P.RAZAOSOCIAL, D.DATAPROGRAMADA, D.NODOCUMENTO, D.COMPLDOCUMEN' +
        'TO,'
      '  D.NOSSONUMERO, D.EMISBLOQ, D.CONTROLEREMESSA, D.CODDOCUMENTO'
      'FROM'
      '  PESSOA P,'
      '  DOCUMENTO D'
      'WHERE'
      '  (D.EMISBLOQ = '#39'S'#39') AND'
      '  (D.CONTROLEREMESSA = :CONTROLEREMESSA ) AND'
      '  (D.IDPESSOA = :IDPESSOA  ) AND'
      '  (D.STATUS <> '#39'2'#39') AND'
      '  (D.OPERACAO IN ('#39'2'#39','#39'3'#39')) AND'
      '  (D.IDFORCLI=P.IDPESSOA) AND'
      '  (D.RECPAG = :RECPAG )'
      'ORDER BY'
      'D.NODOCUMENTO'
      ''
      ' '
      ' ')
    ClientDataSet = CdsDocEmitidos
    Left = 448
    Top = 216
  end
end
