inherited frmProcResgates: TfrmProcResgates
  Left = 238
  Caption = 'Processa Resgates'
  ClientHeight = 226
  ClientWidth = 353
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 187
    object Label2: TLabel
      Left = 118
      Top = 45
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
    end
    object ProgressBar1: TProgressBar
      Left = 6
      Top = 160
      Width = 341
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 0
    end
    object lbResgate: TPanel
      Left = 6
      Top = 133
      Width = 341
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edDataRef: TwwDBLookupCombo
      Left = 119
      Top = 61
      Width = 132
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DATAPEDIDO'#9'15'#9'Data do Pedido'#9'F')
      LookupTable = QryDatePedido
      LookupField = 'DATAPEDIDO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 105
      inherited sep1: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 163
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 403
  end
  object QryPedidoResg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      '  PED.VLRPEDIDO         , PED.IDPLANPREVCTBPATR ,       '
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      '  TPO.NATUREZAOPERACAO  ,'
      '  OPE.STACONFIRMA,'
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S'
      'FROM'
      
        '  PEDIDOFUNDO PED, OPERACAOFUNDO OPE, FUNDOINVEST FUN, TIPOOPERA' +
        'CAO TPO'
      'WHERE'
      
        '  (PED.DATAPEDIDO       = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ) ' +
        'AND'
      
        '  (PED.IDFUNDOINVEST    = FUN.IDFUNDOINVEST)                    ' +
        'AND'
      
        '  (PED.IDTIPOINVEST     = TPO.IDTIPOINVEST(+))                  ' +
        'AND'
      
        '  (PED.IDTIPOOPERACAO   = TPO.IDTIPOOPERACAO(+))                ' +
        'AND'
      
        '  (OPE.IDPEDIDOFUNDO(+) = PED.IDPEDIDOFUNDO)                    ' +
        'AND'
      
        '  (OPE.STACONFIRMA IS NULL)                                     ' +
        'AND'
      '  (TPO.NATUREZAOPERACAO = '#39'D'#39')'
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST, PED.DATAPEDIDO'
      ''
      ''
      ' ')
    ControlType.Strings = (
      'STATUS;CheckBox;S;N')
    ValidateWithMask = True
    Left = 59
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
    object QryPedidoResgSTATUS: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Size = 10
    end
    object QryPedidoResgDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryPedidoResgDATAPEDIDO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAPEDIDO'
    end
    object QryPedidoResgDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryPedidoResgVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 22
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###.00'
    end
    object QryPedidoResgIDPEDIDOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 20
      FieldName = 'IDPEDIDOFUNDO'
    end
    object QryPedidoResgCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 20
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryPedidoResgIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryPedidoResgIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryPedidoResgIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryPedidoResgIDFUNDOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryPedidoResgIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryPedidoResgTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryPedidoResgTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryPedidoResgMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryPedidoResgIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryPedidoResgIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryPedidoResgCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryPedidoResgSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryPedidoResgPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryPedidoResgPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryPedidoResgPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryPedidoResgQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryPedidoResgQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryPedidoResgSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryPedidoResgPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryPedidoResgPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryPedidoResgSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryPedidoResgIDTIPOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object QryPedidoResgIDTIPOOPERACAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryPedidoResgDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryPedidoResgNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPedidoResgIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object QryDatePedido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DATAPEDIDO FROM PEDIDOFUNDO '
      'ORDER BY DATAPEDIDO DESC')
    ControlType.Strings = (
      'STATUS;CheckBox;S;N')
    ValidateWithMask = True
    Left = 59
    Top = 81
  end
  object dsDatePedido: TwwDataSource
    DataSet = QryDatePedido
    Left = 144
    Top = 82
  end
end
