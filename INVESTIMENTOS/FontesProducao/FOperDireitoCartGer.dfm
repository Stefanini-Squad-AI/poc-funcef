inherited FrmOperDireitoCartGer: TFrmOperDireitoCartGer
  Left = -1
  Caption = 'Operação de Direitos das Carteiras Gerenciais'
  ClientWidth = 788
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    object PnlOrigem: TPanel
      Left = 5
      Top = 5
      Width = 778
      Height = 224
      Align = alClient
      TabOrder = 0
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 776
        Height = 24
        Align = alTop
        Caption = 'Origem'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgOrigemDirJur: TwwDBGrid
        Left = 1
        Top = 25
        Width = 776
        Height = 198
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'18'#9'Ação'
          'DESCCARTGERENC'#9'20'#9'Carteira'
          'QTDEDIREITO'#9'14'#9'Quantidade Base'
          'VALOREXERCIDO'#9'15'#9'Valor'
          'VLRREMUNERACAO'#9'10'#9'Remuneração'
          'IR'#9'10'#9'Valor do IR'
          'VLRLIQ'#9'13'#9'Valor Líquido'
          'SGLCUSTODIANTE'#9'15'#9'Custodiante'
          'SIGLAMOTBLOQ'#9'4'#9'Bloq.'
          'DATAREFERENCIA'#9'11'#9'Data Base'
          'QTDE'#9'13'#9'Quantidade Base')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemDivJurCart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object QryOrigemDivJurCart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CG.DESCCARTGERENC,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAGERENC CG,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO     AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        CG.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC      AND'
      '        HC.IDCARTEIRAINVEST   = CG.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE'
      
        '                                IDINVESTIMENTO IN (SELECT IDINVE' +
        'STIMENTO'
      
        '                                                    FROM OPERDIR' +
        'EITOXINV'
      
        '                                                    WHERE IDOPER' +
        'ACAODIREITO=:IDOPERACAODIREITO AND'
      
        '                                                          ORIGDE' +
        'ST = '#39'O'#39' )  AND DATAMOVCUSTOD <= :DATAAGE'
      '                           GROUP BY IDMOTIVOBLOQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTGERENC, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemDivJurCart
    ValidateWithMask = True
    Left = 31
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object QryOrigemDivJurCartDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 18
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemDivJurCartDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 20
      FieldName = 'DESCCARTGERENC'
      Size = 40
    end
    object QryOrigemDivJurCartQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 14
      FieldName = 'QTDEDIREITO'
      OnSetText = QryOrigemDivJurCartQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDivJurCartVALOREXERCIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOREXERCIDO'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 10
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartIR: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartVLRLIQ: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryOrigemDivJurCartSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QryOrigemDivJurCartDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemDivJurCartQTDE: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 13
      FieldName = 'QTDE'
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDivJurCartVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOrigemDivJurCartVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOrigemDivJurCartIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOrigemDivJurCartIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOrigemDivJurCartIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryOrigemDivJurCartPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurCartVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object UpdOrigemDivJurCart: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 80
  end
  object DsOrigemDivJurCart: TwwDataSource
    DataSet = QryOrigemDivJurCart
    Left = 190
    Top = 80
  end
end
