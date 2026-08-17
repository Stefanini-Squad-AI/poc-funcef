inherited frmConsLanContRV: TfrmConsLanContRV
  Left = 55
  Top = 167
  Caption = 'Consulta'
  ClientHeight = 425
  ClientWidth = 765
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 386
    inherited bvlSepTit: TBevel
      Width = 755
    end
    object Panel1: TPanel [1]
      Left = 5
      Top = 104
      Width = 755
      Height = 277
      Align = alClient
      TabOrder = 2
      object dbgLanContRV: TwwDBGrid
        Left = 1
        Top = 1
        Width = 753
        Height = 275
        Selected.Strings = (
          'INVESTIMENTO'#9'60'#9'Investimento'
          'PLNCODIGO'#9'10'#9'Código'
          'PLNPLANIL'#9'10'#9'Planilha'
          'HISTORICO'#9'80'#9'Histórico'
          'SALDOANT'#9'10'#9'Saldo Anterior'
          'SALDO'#9'10'#9'Saldo Atual'
          'VARIACAO'#9'10'#9'Variação'
          'LANCAMENTO'#9'10'#9'Valor do Lançamento'
          'DIF'#9'21'#9'Divergência')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLanCont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
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
    inherited pnlTitulo: TPanel
      Width = 755
      inherited lbNomDescricao: TfcLabel
        Width = 600
        Caption = 'Lançamentos Contábeis de Atualizações de Renda Variável'
      end
    end
    object pnlDados: TPanel
      Left = 5
      Top = 49
      Width = 755
      Height = 55
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 382
        Top = 6
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object Label2: TLabel
        Left = 18
        Top = 7
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object dtDataRef: TCMDateTimePicker
        Left = 382
        Top = 22
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
        OnExit = dtDataRefExit
      end
      object dblCarteira: TCMDBLookupCombo
        Left = 18
        Top = 22
        Width = 343
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblCarteiraExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 595
      DockPos = 1054
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 344
      DockPos = 800
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 166
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 3
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCARTINVEST, DATAULTFECH, IDCARTEIRAINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST IN (2,8)'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 321
    Top = 63
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object dsLanCont: TwwDataSource
    DataSet = qryLanCont
    Left = 304
    Top = 184
  end
  object updLanCont: TUpdateSQL
    Left = 304
    Top = 271
  end
  object qryLanCont: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DATA, INVESTIMENTO, CARTEIRA, PLNCODIGO, PLNPLANIL, HISTO' +
        'RICO,'
      '       SALDOANT, SALDO, VARIACAO, LANCAMENTO,'
      '       DECODE(VARIACAO, LANCAMENTO, '#39'Lançamento OK'#39','
      
        '              DECODE(ABS(VARIACAO-LANCAMENTO),0.01, '#39'Lançamento ' +
        'OK'#39','
      
        '                     DECODE(ABS(VARIACAO-LANCAMENTO),0.02, '#39'Lanç' +
        'amento OK'#39','#39'Lançamento Divergente'#39'))) AS DIF,'
      '       0 AS COR'
      
        'FROM (SELECT TB.DATAMOVCARTINV AS DATA, IV.DESCINVESTIMENTO AS I' +
        'NVESTIMENTO, CI.DESCCARTINVEST AS CARTEIRA,'
      '             TB.PLNCODIGO, PL.PLNPLANIL,'
      
        '             (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVA' +
        'LOR AS LANCAMENTO,'
      
        '             TRUNC(((TB.QTD * CA.VLRCONTABIL) / CA.QTDTITLOTE),2' +
        ') AS SALDOANT,'
      '             TB.SALDO,'
      
        '             ABS((TB.SALDO - TRUNC(((TB.QTD * CA.VLRCONTABIL) / ' +
        'CA.QTDTITLOTE),2))) AS VARIACAO'
      
        '      FROM LANCAMENTO LC, PLANILHA PL, INVESTIMENTO IV, CARTEIRA' +
        'INVEST CI,'
      
        '           (SELECT DATACOTACAO, IDINVESTIMENTO, VLRCONTABIL, QTD' +
        'TITLOTE'
      '            FROM COTACAOINVEST'
      
        '            WHERE DATACOTACAO || IDINVESTIMENTO IN (SELECT MAX(D' +
        'ATACOTACAO) || IDINVESTIMENTO'
      
        '                                                    FROM COTACAO' +
        'INVEST'
      
        '                                                    WHERE DATACO' +
        'TACAO < TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      
        '                                                    GROUP BY IDI' +
        'NVESTIMENTO)) CA,'
      ''
      
        '           (SELECT H1.PLNCODIGO, H1.DATAMOVCARTINV, H1.IDINVESTI' +
        'MENTO, H1.IDCARTEIRAINVEST, '
      
        '                   H1.SALDOQTDEINVCART AS QTD, H1.SALDOVLRINVCAR' +
        'T AS SALDO'
      '            FROM HISTCARTINV H1'
      '            WHERE (H1.IDTIPOINVEST = 2)'
      '              AND (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)'
      '              AND (H1.IDCARTEIRAGERENC IS NULL)'
      '              AND (H1.SALDOVLRINVCART IS NOT NULL)'
      '              AND (H1.PLNCODIGO IS NOT NULL)'
      '              AND ((H1.IDHISTCARTINV || H1.DATAMOVCARTINV) IN ('
      
        '                                    SELECT MAX(H2.IDHISTCARTINV)' +
        ' || MAX(H2.DATAMOVCARTINV)'
      '                                    FROM HISTCARTINV H2'
      '                                    WHERE (H2.IDTIPOINVEST = 2)'
      
        '                                      AND (H2.IDCARTEIRAINVEST =' +
        ' :IDCARTEIRAINVEST)'
      
        '                                      AND (H2.IDCARTEIRAGERENC I' +
        'S NULL)'
      
        '                                      AND (H2.TIPMOVCARTINV = '#39'A' +
        'TU'#39')'
      
        '                                      AND (H2.DATAMOVCARTINV = T' +
        'O_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                    GROUP BY H2.IDINVESTIMENTO, ' +
        'H2.IDCARTEIRAINVEST))) TB'
      ''
      '      WHERE TB.PLNCODIGO = LC.PLNCODIGO'
      '        AND TB.PLNCODIGO = PL.PLNCODIGO'
      '        AND TB.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '        AND TB.IDINVESTIMENTO = CA.IDINVESTIMENTO(+)'
      '        AND TB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '        AND LC.LACDEBCRE = '#39'D'#39')'
      'ORDER BY DATA, INVESTIMENTO')
    UpdateObject = updLanCont
    ValidateWithMask = True
    Left = 400
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryLanContINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryLanContPLNCODIGO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
    object qryLanContPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 10
      FieldName = 'PLNPLANIL'
    end
    object qryLanContHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 80
      FieldName = 'HISTORICO'
      Size = 80
    end
    object qryLanContSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 10
      FieldName = 'SALDOANT'
    end
    object qryLanContSALDO: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 10
      FieldName = 'SALDO'
    end
    object qryLanContVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 10
      FieldName = 'VARIACAO'
    end
    object qryLanContLANCAMENTO: TFloatField
      DisplayLabel = 'Valor do Lançamento'
      DisplayWidth = 10
      FieldName = 'LANCAMENTO'
    end
    object qryLanContDIF: TStringField
      DisplayLabel = 'Divergência'
      DisplayWidth = 21
      FieldName = 'DIF'
      Size = 21
    end
    object qryLanContCOR: TFloatField
      DisplayWidth = 10
      FieldName = 'COR'
      Visible = False
    end
    object qryLanContDATA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA'
      Visible = False
    end
    object qryLanContCARTEIRA: TStringField
      DisplayWidth = 60
      FieldName = 'CARTEIRA'
      Visible = False
      Size = 60
    end
  end
end
