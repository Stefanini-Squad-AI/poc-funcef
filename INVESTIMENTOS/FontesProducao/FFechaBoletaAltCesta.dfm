inherited frmFechaBoletaAltCesta: TfrmFechaBoletaAltCesta
  Left = 291
  Top = 247
  HelpContext = 790316
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Processo'
  ClientHeight = 439
  ClientWidth = 792
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 400
    inherited bvlSepTit: TBevel
      Width = 790
    end
    object Bevel1: TBevel [1]
      Left = 1
      Top = 45
      Width = 790
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    inherited pnlTitulo: TPanel
      Width = 790
      inherited lbNomDescricao: TfcLabel
        Width = 354
        Caption = 'Fechamento de Alteração de Cesta'
      end
      object lblData: TfcLabel
        Left = 618
        Top = 8
        Width = 147
        Height = 22
        Anchors = [akTop, akRight]
        Caption = 'Dia dd/mm/yyyy'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taRightJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 84
      Width = 790
      Height = 315
      Align = alClient
      TabOrder = 1
      object pnlTitCestaAnterior: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '   Transferências a serem efetuadas'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgTransferencias: TwwDBGrid
        Left = 1
        Top = 24
        Width = 788
        Height = 290
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F'
          'SGLCUSTODIANTE'#9'21'#9'Custodiante'
          'QTDANT'#9'14'#9'Quantidade~Anterior'
          'QTDATU'#9'13'#9'Quantidade~Atual'
          'DIF'#9'15'#9'Quantidade~ a Transferir')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clBtnFace
        DataSource = dsTransfCesta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object pnlDatas: TPanel
      Left = 1
      Top = 48
      Width = 790
      Height = 36
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 130
        Height = 13
        Caption = 'Data para Fechamento'
      end
      object dblDataVigencia: TCMDBLookupCombo
        Left = 208
        Top = 7
        Width = 164
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DATAVIGENCIA'#9'18'#9'Data da Alteração de Vigência'#9'F')
        LookupTable = qryBuscaDatas
        LookupField = 'DATAVIGENCIA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblDataVigenciaCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 639
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 451
      DockPos = 470
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
        Caption = '&Fecha'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
    inline fraMsgAltCesta: TfraMensagem
      Width = 444
      Height = 38
      Align = alClient
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 444
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 288
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 286
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 289
          Width = 154
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 152
            Height = 34
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 3
  end
  object qryCestaAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCESTAOPCIND, C.DATAVIGENCIA, I.DESCINVESTIMENTO, C.QU' +
        'ANTIDADE,'
      
        '       C.IDCARTEIRAINVEST, I.IDINVESTIMENTO, I.IDEMISSOR, C.IDCU' +
        'STODIANTE'
      'FROM   CESTAOPCIND C, INVESTIMENTO I, ORDEMOPCIND O'
      'WHERE  C.DATAVIGENCIA   = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND  C.IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND  I.IDINVESTIMENTO = C.IDINVESTIMENTO'
      '  AND  O.IDCESTAOPCIND = C.IDCESTAOPCIND'
      'ORDER  BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 177
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end>
    object qryCestaAtualDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryCestaAtualQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryCestaAtualIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object qryCestaAtualDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Vigencia'
      DisplayWidth = 18
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object qryCestaAtualIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCestaAtualIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryCestaAtualIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryCestaAtualIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryCestaAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCESTAOPCIND, C.DATAVIGENCIA, I.DESCINVESTIMENTO, C.QU' +
        'ANTIDADE,'
      
        '       C.IDCARTEIRAINVEST, I.IDINVESTIMENTO, I.IDEMISSOR, C.IDCU' +
        'STODIANTE'
      'FROM CESTAOPCIND C, INVESTIMENTO I, ORDEMOPCIND O'
      'WHERE'
      '     C.DATAVIGENCIA  = (SELECT MAX(DATAVIGENCIA)'
      '                        FROM CESTAOPCIND'
      '                        WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      
        '                          AND DATAVIGENCIA < TO_DATE(:DATAVIGENC' +
        'IA,'#39'DD/MM/YYYY'#39'))'
      ' AND C.IDCESTAOPCIND = :IDCESTAOPCIND'
      ' AND I.IDINVESTIMENTO = C.IDINVESTIMENTO'
      ' AND O.IDCESTAOPCIND = C.IDCESTAOPCIND'
      'ORDER  BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 177
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end>
    object qryCestaAnteriorDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryCestaAnteriorQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryCestaAnteriorIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object qryCestaAnteriorDATAVIGENCIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object qryCestaAnteriorIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCestaAnteriorIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryCestaAnteriorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryCestaAnteriorIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryBuscaDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DATAVIGENCIA'
      'FROM CESTAOPCIND'
      'WHERE DATAVIGENCIA <= TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND IDBOLETA IS NULL'
      'ORDER BY DATAVIGENCIA DESC'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 177
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
        Value = '01/12/2003'
      end>
    object qryBuscaDatasDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Data da Alteração de Vigência'
      DisplayWidth = 18
      FieldName = 'DATAVIGENCIA'
    end
  end
  object qryTransfCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DESCINVESTIMENTO, SGLCUSTODIANTE, IDCUSTODIANTE, IDINVEST' +
        'IMENTO,'
      '       IDEMISSOR, IDCARTEIRAINVEST,'
      '       SUM(QTDANT) AS QTDANT, SUM(QTDATU) AS QTDATU,'
      '       (SUM(QTDANT) - SUM(QTDATU)) AS DIF'
      
        'FROM (SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      
        '             C.DATAVIGENCIA AS DTVGATU,           C.QUANTIDADE A' +
        'S QTDATU,'
      '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGANT, 0 AS QTDANT'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T'
      
        '      WHERE C.DATAVIGENCIA   = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY' +
        #39')'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE  = T.IDCUSTODIANTE'
      '        AND C.IDBOLETA IS NULL'
      ''
      '      UNION ALL'
      ''
      
        '      SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGATU, 0 AS QTDATU,'
      '             C.DATAVIGENCIA AS DTVGANT,'
      
        '             ROUND(DECODE(NVL(G.PARIDADE,0),0,C.QUANTIDADE,QUANT' +
        'IDADE*G.PARIDADE),0) AS QTDANT'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T,'
      
        '          (SELECT DISTINCT OD.PARIDADE, OI.IDINVESTIMENTO, DATAC' +
        'OM'
      '           FROM'
      
        '             OPERACAODIREITO OD, OPERDIREITOXINV OI, PARAMINVEST' +
        ' PI'
      '           WHERE'
      '             OD.DATACOM > (SELECT MAX(DATAVIGENCIA)'
      '                           FROM CESTAOPCIND'
      
        '                           WHERE DATAVIGENCIA < TO_DATE(:DATAVIG' +
        'ENCIA,'#39'DD/MM/YYYY'#39')) AND'
      '             OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO    AND'
      '             OD.IDTIPOOPERACAO    = PI.IDTIPOOPERDIRGRU     AND'
      
        '             OD.DATACOM           < TO_DATE(:DATAVIGENCIA,'#39'DD/MM' +
        '/YYYY'#39')) G'
      '      WHERE C.DATAVIGENCIA || C.IDCESTAOPCIND IN'
      
        '                       (SELECT MAX(DATAVIGENCIA) || MAX(IDCESTAO' +
        'PCIND)'
      '                        FROM CESTAOPCIND'
      
        '                        WHERE DATAVIGENCIA < TO_DATE(:DATAVIGENC' +
        'IA,'#39'DD/MM/YYYY'#39')'
      
        '                          AND IDCESTAOPCIND IN (SELECT IDCESTAOP' +
        'CIND'
      '                                                FROM CESTAOPCIND'
      
        '                                                WHERE DATAVIGENC' +
        'IA = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      
        '                                                  AND IDBOLETA I' +
        'S NULL'
      
        '                                                GROUP BY IDCESTA' +
        'OPCIND)'
      '                        GROUP BY IDCESTAOPCIND )'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE  = T.IDCUSTODIANTE'
      '        AND C.IDINVESTIMENTO = G.IDINVESTIMENTO(+)'
      '     )'
      
        'GROUP BY IDCARTEIRAINVEST, DESCINVESTIMENTO, IDINVESTIMENTO, IDE' +
        'MISSOR, SGLCUSTODIANTE, IDCUSTODIANTE'
      'HAVING (SUM(QTDANT) - SUM(QTDATU)) <> 0'
      'ORDER BY DESCINVESTIMENTO, SGLCUSTODIANTE'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 177
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryTransfCestaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryTransfCestaSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 21
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryTransfCestaQTDANT: TFloatField
      DisplayLabel = 'Quantidade~Anterior'
      DisplayWidth = 14
      FieldName = 'QTDANT'
      DisplayFormat = '###,###,###,##0'
    end
    object qryTransfCestaQTDATU: TFloatField
      DisplayLabel = 'Quantidade~Atual'
      DisplayWidth = 13
      FieldName = 'QTDATU'
      DisplayFormat = '###,###,###,##0'
    end
    object qryTransfCestaDIF: TFloatField
      DisplayLabel = 'Quantidade~ a Transferir'
      DisplayWidth = 15
      FieldName = 'DIF'
      DisplayFormat = '###,###,###,##0'
    end
    object qryTransfCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryTransfCestaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryTransfCestaIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryTransfCestaIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object dsTransfCesta: TwwDataSource
    AutoEdit = False
    DataSet = qryTransfCesta
    Left = 255
    Top = 216
  end
  object qryUpdBoletaCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CESTAOPCIND'
      'SET IDBOLETA = :IDBOLETA'
      'WHERE DATAVIGENCIA = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND IDCESTAOPCIND NOT IN (SELECT IDCESTAOPCIND'
      '                            FROM ORDEMOPCIND'
      
        '                            WHERE DATAORDEM = TO_DATE(:DATAVIGEN' +
        'CIA,'#39'DD/MM/YYYY'#39')'
      '                              AND IDCESTAOPCIND IS NOT NULL'
      
        '                              AND IDTIPOOPERACAO NOT IN (-90,-89' +
        ',-85,-84))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 177
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
  end
end
