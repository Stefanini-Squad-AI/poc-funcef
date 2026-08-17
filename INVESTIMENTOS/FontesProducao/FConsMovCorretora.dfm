inherited frmConsMovCorretora: TfrmConsMovCorretora
  Left = -4
  Top = -4
  HelpContext = 790540
  Caption = 'Consulta'
  ClientHeight = 585
  ClientWidth = 804
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 546
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomDescricao: TfcLabel
        Left = 16
        Top = 8
        Width = 290
        Height = 24
        Caption = 'Movimentação por Corretora'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 42
      Width = 802
      Height = 503
      Align = alClient
      TabOrder = 1
      object pnlConsulta: TPanel
        Left = 1
        Top = 1
        Width = 800
        Height = 49
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 15
          Top = 6
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label1: TLabel
          Left = 131
          Top = 6
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object Label4: TLabel
          Left = 248
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Corretora de Valores'
        end
        object edDataIni: TCMDateTimePicker
          Left = 15
          Top = 21
          Width = 105
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
          TabOrder = 0
        end
        object edDataFim: TCMDateTimePicker
          Left = 131
          Top = 21
          Width = 105
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
          OnExit = edDataFimExit
        end
        object DbLkcCorretora: TwwDBLookupCombo
          Left = 248
          Top = 21
          Width = 324
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCORRETVALORES'#9'40'#9'Descrição'#9'F')
          LookupTable = QryCorretora
          LookupField = 'IDCORRETVALORES'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object dbgGrid: TwwDBGrid
        Left = 1
        Top = 50
        Width = 800
        Height = 452
        Selected.Strings = (
          'DATAOPERACAO'#9'10'#9'Data da~Operação'
          'SGLCORRETVALORES'#9'20'#9'Corretora~de Valores'
          'VLROPERRV'#9'18'#9'Valor Operado~BOVESPA'
          'TOPOSRV'#9'16'#9'Corretagem~BOVESPA'
          'QTDORDRV'#9'14'#9'Quantidade~BOVESPA'
          'PERCDEVRV'#9'10'#9'% de Dev.~BOVESPA'
          'TOTOPERBMF'#9'16'#9'Valor Operado~BM&F'
          'TOTAJUSTE'#9'16'#9'Valor de~Ajuste'
          'TOTCORRBMF'#9'14'#9'Corretagem~BM&F'
          'QTDORDBMF'#9'16'#9'Quantidade~BM&F'
          'PERCDEVBMF'#9'10'#9'% de Dev.~BM&F'
          'PERCENTUAL'#9'10'#9'%')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -8
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
        OnUpdateFooter = dbgGridUpdateFooter
        FooterColor = clMenu
        FooterCellColor = clMenu
      end
    end
  end
  inherited Dock971: TDock97
    Top = 546
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 482
      DockPos = 482
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 229
      DockPos = 229
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
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
      object bt_Imprime: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
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
    Left = 547
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CV.IDCORRETVALORES,'
      '   CV.SGLCORRETVALORES'
      'FROM'
      '   CORRETVALORES CV, OPERACAOINVEST OI'
      'WHERE'
      '    (CV.IDCORRETVALORES = OI.IDCORRETVALORES)               AND'
      '    (OI.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                             TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      'ORDER BY SGLCORRETVALORES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 487
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object QryCorretoraSGLCORRETVALORES: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretoraIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object QryMapaCorret: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   X.IDCORRETVALORES,X.SGLCORRETVALORES,SUM(X.TOTNEGATIVOS) AS T' +
        'OTNEGRV,SUM(X.TOTPOSITIVOS) AS TOPOSRV,SUM(X.TOTLIQUIDO) AS TOTL' +
        'IQRV,'
      
        '   SUM(X.VLROPERACAO) AS VLROPERRV,SUM(X.PERCENTUAL) AS PERCENTU' +
        'AL,SUM(X.TOTCORRBMF) AS TOTCORRBMF,'
      
        '   SUM(X.TOTDESPBMF) AS TOTDESPBMF,SUM(X.TOTAJNOR) AS TOTAJNOR,S' +
        'UM(X.TOTAJPOS) AS TOTAJPOS,'
      
        '   SUM(X.TOTOPERBMF) AS TOTOPERBMF,SUM(X.TOTAJNOR + X.TOTAJPOS) ' +
        'AS TOTAJUSTE,SUM(QTDORDBMF) AS QTDORDBMF,'
      '   SUM(QTDORDRV) AS QTDORDRV,PA.PERCDEVRV,PA.PERCDEVBMF'
      'FROM'
      '   PARAMINVEST PA,'
      '   (SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,ABS(SUM(NEG.TOTNEG' +
        'ATIVOS)) AS TOTNEGATIVOS,SUM(POS.TOTPOSITIVOS) AS TOTPOSITIVOS,'
      
        '       (SUM(NEG.TOTNEGATIVOS)+SUM(POS.TOTPOSITIVOS)) AS TOTLIQUI' +
        'DO,SUM(OI.VLROPERACAO) AS VLROPERACAO,((SUM(OI.VLROPERACAO)*100)' +
        '/TOT.TOTAL) AS PERCENTUAL,'
      
        '       0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJP' +
        'OS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0' +
        ' AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS T' +
        'OTNEGATIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao Corretagem%'#39'   ) OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao de Corretagem%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO DE CORRETAGEM%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO CORRETAGEM%'#39')) AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) NEG,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(nvl(DOP.VLRDESPOPER,0)) AS T' +
        'OTPOSITIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP, TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV  Lik' +
        'e '#39'%Corretagem%'#39') OR (TD.DESCTIPODESPINV  Like '#39'%CORRETAGEM%'#39')) ' +
        'AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) POS,'
      '       (SELECT'
      '           SUM(VLROPERACAO) AS TOTAL'
      '        FROM'
      '           OPERACAOINVEST'
      '        WHERE'
      '           (IDTIPOINVEST = 2) AND'
      '           (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '           (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '           (NOT IDCORRETVALORES IS NULL)) TOT'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 2) AND(NOT OI.IDCORRETVALORES IS NULL)' +
        ' AND'
      
        '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND (DA' +
        'TAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (NEG.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (POS.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES,TOT.TOTAL'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,' +
        '0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,SUM(CORRBMF.TOTCORRBMF) AS TOTCORRBMF,SUM' +
        '(DESPBMF.TOTDESPBMF) AS TOTDESPBMF,SUM(AJNORMAL.TOTAJNOR) AS TOT' +
        'AJNOR,'
      
        '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDR' +
        'V,0 AS PERCDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TCORRBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-14,-15)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) CORRBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TDESPBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-16,-17,-18)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) DESPBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TAJNOR'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-20,-21)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) AJNORMAL'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (CORRBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (DESPBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (AJNORMAL.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,' +
        '0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,SUM(ABS(OI.VLROPERACAO)) AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      
        '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND (ID' +
        'TIPOOPERACAO > 0) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,' +
        '0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,SUM(AJPOSICAO.TOTAJPOS) AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      '          OI.IDOPERACAOINVEST,'
      '          SUM(OI.VLROPERACAO) AS TOTAJPOS'
      '       FROM'
      '          OPERACAOINVEST OI'
      '       WHERE'
      
        '         (OI.IDTIPOINVEST = 8) AND(OI.IDTIPOOPERACAO IN (-10,-11' +
        ')) AND'
      
        '         (OI.DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      
        '         (OI.DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      '         (NOT OI.IDCORRETVALORES IS NULL)'
      '       GROUP BY OI.IDOPERACAOINVEST) AJPOSICAO'
      '    WHERE'
      '       (OI.IDTIPOINVEST = 8) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (AJPOSICAO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,' +
        '0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDBMF,0 AS QTDORDRV,0 AS PER' +
        'CDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=8) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (OI.IDCORRETVALORES = CV.IDCORRETVALORES)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,' +
        '0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDRV,0 AS PERCDEVRV,0 AS PER' +
        'CDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=2) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      '    GROUP BY OI.IDCORRETVALORES,CV.SGLCORRETVALORES'
      '   ) X'
      
        'GROUP BY X.IDCORRETVALORES,X.SGLCORRETVALORES,PA.PERCDEVRV,PA.PE' +
        'RCDEVBMF'
      ' ')
    PictureMasks.Strings = (
      'VLROPERACAO'#9'###,###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 641
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end>
    object QryMapaCorretIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryMapaCorretSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object QryMapaCorretTOTNEGRV: TFloatField
      FieldName = 'TOTNEGRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOPOSRV: TFloatField
      FieldName = 'TOPOSRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTLIQRV: TFloatField
      FieldName = 'TOTLIQRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretVLROPERRV: TFloatField
      FieldName = 'VLROPERRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTCORRBMF: TFloatField
      FieldName = 'TOTCORRBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTDESPBMF: TFloatField
      FieldName = 'TOTDESPBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTAJNOR: TFloatField
      FieldName = 'TOTAJNOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTAJPOS: TFloatField
      FieldName = 'TOTAJPOS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTOPERBMF: TFloatField
      FieldName = 'TOTOPERBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretTOTAJUSTE: TFloatField
      FieldName = 'TOTAJUSTE'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretQTDORDBMF: TFloatField
      FieldName = 'QTDORDBMF'
      DisplayFormat = '###,###,###,##0'
    end
    object QryMapaCorretQTDORDRV: TFloatField
      FieldName = 'QTDORDRV'
      DisplayFormat = '###,###,###,##0'
    end
    object QryMapaCorretPERCDEVRV: TFloatField
      FieldName = 'PERCDEVRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMapaCorretPERCDEVBMF: TFloatField
      FieldName = 'PERCDEVBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object DsMapaCorret: TwwDataSource
    DataSet = QryMapaCorret
    Left = 281
    Top = 6
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   X.DATAOPERACAO, X.IDCORRETVALORES, X.SGLCORRETVALORES,SUM(X.T' +
        'OTNEGATIVOS) AS TOTNEGRV,SUM(X.TOTPOSITIVOS) AS TOPOSRV,SUM(X.TO' +
        'TLIQUIDO) AS TOTLIQRV,'
      
        '   SUM(X.VLROPERACAO) AS VLROPERRV,SUM(X.PERCENTUAL) AS PERCENTU' +
        'AL,SUM(X.TOTCORRBMF) AS TOTCORRBMF,'
      
        '   SUM(X.TOTDESPBMF) AS TOTDESPBMF,SUM(X.TOTAJNOR) AS TOTAJNOR,S' +
        'UM(X.TOTAJPOS) AS TOTAJPOS,'
      
        '   SUM(X.TOTOPERBMF) AS TOTOPERBMF,SUM(X.TOTAJNOR + X.TOTAJPOS) ' +
        'AS TOTAJUSTE,SUM(QTDORDBMF) AS QTDORDBMF,'
      '   SUM(QTDORDRV) AS QTDORDRV,PA.PERCDEVRV,PA.PERCDEVBMF'
      'FROM'
      '   PARAMINVEST PA,'
      '   (SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,A' +
        'BS(SUM(NEG.TOTNEGATIVOS)) AS TOTNEGATIVOS,SUM(POS.TOTPOSITIVOS) ' +
        'AS TOTPOSITIVOS,'
      
        '       (SUM(NEG.TOTNEGATIVOS)+SUM(POS.TOTPOSITIVOS)) AS TOTLIQUI' +
        'DO,SUM(OI.VLROPERACAO) AS VLROPERACAO,((SUM(OI.VLROPERACAO)*100)' +
        '/TOT.TOTAL) AS PERCENTUAL,'
      
        '       0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJP' +
        'OS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0' +
        ' AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS T' +
        'OTNEGATIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao Corretagem%'#39'   ) OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao de Corretagem%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO DE CORRETAGEM%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO CORRETAGEM%'#39')) AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) NEG,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(nvl(DOP.VLRDESPOPER,0)) AS T' +
        'OTPOSITIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP, TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV  Lik' +
        'e '#39'%Corretagem%'#39') OR (TD.DESCTIPODESPINV  Like '#39'%CORRETAGEM%'#39')) ' +
        'AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) POS,'
      '       (SELECT'
      '           SUM(VLROPERACAO) AS TOTAL'
      '        FROM'
      '           OPERACAOINVEST'
      '        WHERE'
      '           (IDTIPOINVEST = 2) AND'
      '           (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '           (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '           (NOT IDCORRETVALORES IS NULL)) TOT'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 2) AND(NOT OI.IDCORRETVALORES IS NULL)' +
        ' AND'
      
        '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND (DA' +
        'TAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (NEG.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (POS.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES,TOT.TOTAL'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,SUM(CORRBMF.TOTCORRBMF) AS TOTCORRBMF,SUM' +
        '(DESPBMF.TOTDESPBMF) AS TOTDESPBMF,SUM(AJNORMAL.TOTAJNOR) AS TOT' +
        'AJNOR,'
      
        '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDR' +
        'V,0 AS PERCDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TCORRBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-14,-15)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) CORRBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TDESPBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-16,-17,-18)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) DESPBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TAJNOR'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-20,-21)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) AJNORMAL'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (CORRBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (DESPBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (AJNORMAL.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO,OI.IDCORRETVALORES,CV.SGLCORRETVALO' +
        'RES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,SUM(ABS(OI.VLROPERACAO)) AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      
        '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND (ID' +
        'TIPOOPERACAO > 0) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,SUM(AJPOSICAO.TOTAJPOS) AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      '          OI.IDOPERACAOINVEST,'
      '          SUM(OI.VLROPERACAO) AS TOTAJPOS'
      '       FROM'
      '          OPERACAOINVEST OI'
      '       WHERE'
      
        '         (OI.IDTIPOINVEST = 8) AND(OI.IDTIPOOPERACAO IN (-10,-11' +
        ')) AND'
      
        '         (OI.DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      
        '         (OI.DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      '         (NOT OI.IDCORRETVALORES IS NULL)'
      '       GROUP BY OI.IDOPERACAOINVEST) AJPOSICAO'
      '    WHERE'
      '       (OI.IDTIPOINVEST = 8) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (AJPOSICAO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALOR' +
        'ES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS ' +
        'TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDBMF,0 AS QTDORDRV,0 AS PER' +
        'CDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=8) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (OI.IDCORRETVALORES = CV.IDCORRETVALORES)'
      
        '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLC' +
        'ORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALOR' +
        'ES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS ' +
        'TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDRV,0 AS PERCDEVRV,0 AS PER' +
        'CDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=2) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      
        '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLC' +
        'ORRETVALORES'
      '   ) X'
      
        'GROUP BY X.DATAOPERACAO, X.IDCORRETVALORES, X.SGLCORRETVALORES, ' +
        'PA.PERCDEVRV, PA.PERCDEVBMF'
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end>
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da~Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qrySGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora~de Valores'
      DisplayWidth = 20
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object qryVLROPERRV: TFloatField
      DisplayLabel = 'Valor Operado~BOVESPA'
      DisplayWidth = 18
      FieldName = 'VLROPERRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTOPOSRV: TFloatField
      DisplayLabel = 'Corretagem~BOVESPA'
      DisplayWidth = 16
      FieldName = 'TOPOSRV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryQTDORDRV: TFloatField
      DisplayLabel = 'Quantidade~BOVESPA'
      DisplayWidth = 14
      FieldName = 'QTDORDRV'
      DisplayFormat = '###,###,###,###0'
    end
    object qryPERCDEVRV: TFloatField
      DisplayLabel = '% de Dev.~BOVESPA'
      DisplayWidth = 10
      FieldName = 'PERCDEVRV'
      DisplayFormat = '###,###,###0.000'
    end
    object qryTOTOPERBMF: TFloatField
      DisplayLabel = 'Valor Operado~BM&F'
      DisplayWidth = 16
      FieldName = 'TOTOPERBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTOTAJUSTE: TFloatField
      DisplayLabel = 'Valor de~Ajuste'
      DisplayWidth = 16
      FieldName = 'TOTAJUSTE'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryTOTCORRBMF: TFloatField
      DisplayLabel = 'Corretagem~BM&F'
      DisplayWidth = 14
      FieldName = 'TOTCORRBMF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryQTDORDBMF: TFloatField
      DisplayLabel = 'Quantidade~BM&F'
      DisplayWidth = 16
      FieldName = 'QTDORDBMF'
      DisplayFormat = '###,###,###,###0'
    end
    object qryPERCDEVBMF: TFloatField
      DisplayLabel = '% de Dev.~BM&F'
      DisplayWidth = 10
      FieldName = 'PERCDEVBMF'
      DisplayFormat = '###,###,###0.000'
    end
    object qryPERCENTUAL: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,###0.000'
      Precision = 4
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
    object qryTOTNEGRV: TFloatField
      FieldName = 'TOTNEGRV'
      Visible = False
    end
    object qryTOTLIQRV: TFloatField
      FieldName = 'TOTLIQRV'
      Visible = False
    end
    object qryTOTDESPBMF: TFloatField
      FieldName = 'TOTDESPBMF'
      Visible = False
    end
    object qryTOTAJNOR: TFloatField
      FieldName = 'TOTAJNOR'
      Visible = False
    end
    object qryTOTAJPOS: TFloatField
      FieldName = 'TOTAJPOS'
      Visible = False
    end
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 400
    Top = 168
  end
  object QryTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(X.TOTNEGATIVOS) AS TOTNEGRV,SUM(X.TOTPOSITIVOS) AS TOPOSR' +
        'V,SUM(X.TOTLIQUIDO) AS TOTLIQRV,'
      
        '   SUM(X.VLROPERACAO) AS VLROPERRV,SUM(X.PERCENTUAL) AS PERCENTU' +
        'AL,SUM(X.TOTCORRBMF) AS TOTCORRBMF,'
      
        '   SUM(X.TOTDESPBMF) AS TOTDESPBMF,SUM(X.TOTAJNOR) AS TOTAJNOR,S' +
        'UM(X.TOTAJPOS) AS TOTAJPOS,'
      
        '   SUM(X.TOTOPERBMF) AS TOTOPERBMF,SUM(X.TOTAJNOR + X.TOTAJPOS) ' +
        'AS TOTAJUSTE,SUM(QTDORDBMF) AS QTDORDBMF,'
      '   SUM(QTDORDRV) AS QTDORDRV'
      'FROM'
      '   PARAMINVEST PA,'
      '   (SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,A' +
        'BS(SUM(NEG.TOTNEGATIVOS)) AS TOTNEGATIVOS,SUM(POS.TOTPOSITIVOS) ' +
        'AS TOTPOSITIVOS,'
      
        '       (SUM(NEG.TOTNEGATIVOS)+SUM(POS.TOTPOSITIVOS)) AS TOTLIQUI' +
        'DO,SUM(OI.VLROPERACAO) AS VLROPERACAO,((SUM(OI.VLROPERACAO)*100)' +
        '/TOT.TOTAL) AS PERCENTUAL,'
      
        '       0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJP' +
        'OS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0' +
        ' AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS T' +
        'OTNEGATIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao Corretagem%'#39'   ) OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%Devolucao de Corretagem%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO DE CORRETAGEM%'#39') OR'
      
        '                                        (TD.DESCTIPODESPINV   Li' +
        'ke '#39'%DEVOLUCAO CORRETAGEM%'#39')) AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) NEG,'
      '       (SELECT'
      
        '           DOP.IDOPERACAOINVEST,SUM(nvl(DOP.VLRDESPOPER,0)) AS T' +
        'OTPOSITIVOS'
      '        FROM'
      '           CM.DESPOPERINVEST DOP, TIPODESPINVEST TD'
      '        WHERE'
      
        '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM' +
        ' OPERACAOINVEST'
      '                                    WHERE'
      
        '                                       (IDTIPOINVEST = 2) AND (D' +
        'ATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       (DATAOPERACAO <= TO_DATE(' +
        ':dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                       ((TD.DESCTIPODESPINV  Lik' +
        'e '#39'%Corretagem%'#39') OR (TD.DESCTIPODESPINV  Like '#39'%CORRETAGEM%'#39')) ' +
        'AND'
      
        '                                       (DOP.IDTIPODESPINVEST = T' +
        'D.IDTIPODESPINVEST))'
      '        GROUP BY DOP.IDOPERACAOINVEST) POS,'
      '       (SELECT'
      '           SUM(VLROPERACAO) AS TOTAL'
      '        FROM'
      '           OPERACAOINVEST'
      '        WHERE'
      '           (IDTIPOINVEST = 2) AND'
      '           (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '           (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '           (NOT IDCORRETVALORES IS NULL)) TOT'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 2) AND(NOT OI.IDCORRETVALORES IS NULL)' +
        ' AND'
      
        '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND (DA' +
        'TAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (NEG.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (POS.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES,TOT.TOTAL'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,SUM(CORRBMF.TOTCORRBMF) AS TOTCORRBMF,SUM' +
        '(DESPBMF.TOTDESPBMF) AS TOTDESPBMF,SUM(AJNORMAL.TOTAJNOR) AS TOT' +
        'AJNOR,'
      
        '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDR' +
        'V,0 AS PERCDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TCORRBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-14,-15)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) CORRBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TDESPBMF'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-16,-17,-18)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) DESPBMF,'
      '      (SELECT'
      
        '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TO' +
        'TAJNOR'
      '       FROM'
      '          CM.DESPOPERINVEST DOP,CM.TIPODESPINVEST TD'
      '       WHERE'
      
        '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM ' +
        'OPERACAOINVEST'
      '                                   WHERE'
      
        '                                      (IDTIPOINVEST = 8) AND (DA' +
        'TAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DATAOPERACAO <= TO_DATE(:' +
        'dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                      (DOP.IDTIPODESPINVEST  IN ' +
        '(-20,-21)) AND'
      
        '                                      (DOP.IDTIPODESPINVEST = TD' +
        '.IDTIPODESPINVEST))'
      '       GROUP BY DOP.IDOPERACAOINVEST) AJNORMAL'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (CORRBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (DESPBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (AJNORMAL.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO,OI.IDCORRETVALORES,CV.SGLCORRETVALO' +
        'RES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,SUM(ABS(OI.VLROPERACAO)) AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST = 8) AND (DATAOPERACAO >= TO_DATE(:dData' +
        'Ini,'#39'DD/MM/YYYY'#39')) AND'
      
        '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND (ID' +
        'TIPOOPERACAO > 0) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0' +
        ' AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,0 AS VLROPERA' +
        'CAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,SUM(AJPOSICAO.TOTAJPOS) AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVB' +
        'MF'
      '    FROM'
      '       OPERACAOINVEST OI, CORRETVALORES CV,'
      '      (SELECT'
      '          OI.IDOPERACAOINVEST,'
      '          SUM(OI.VLROPERACAO) AS TOTAJPOS'
      '       FROM'
      '          OPERACAOINVEST OI'
      '       WHERE'
      
        '         (OI.IDTIPOINVEST = 8) AND(OI.IDTIPOOPERACAO IN (-10,-11' +
        ')) AND'
      
        '         (OI.DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      
        '         (OI.DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      '         (NOT OI.IDCORRETVALORES IS NULL)'
      '       GROUP BY OI.IDOPERACAOINVEST) AJPOSICAO'
      '    WHERE'
      '       (OI.IDTIPOINVEST = 8) AND'
      '       (NOT OI.IDCORRETVALORES IS NULL) AND'
      '       (DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND'
      '       (AJPOSICAO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVAL' +
        'ORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALOR' +
        'ES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS ' +
        'TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDBMF,0 AS QTDORDRV,0 AS PER' +
        'CDEVRV,0 AS PERCDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=8) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (OI.IDCORRETVALORES = CV.IDCORRETVALORES)'
      
        '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLC' +
        'ORRETVALORES'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALOR' +
        'ES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS ' +
        'TOTLIQUIDO,0 AS VLROPERACAO,'
      
        '       0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTA' +
        'JNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,'
      
        '       COUNT(OI.IDORDMOVINV) AS QTDORDRV,0 AS PERCDEVRV,0 AS PER' +
        'CDEVBMF'
      '    FROM'
      '       ORDMOVINV OI,CORRETVALORES CV'
      '    WHERE'
      
        '       (OI.IDTIPOINVEST=2) AND (DATAORDMOVINV >= TO_DATE(:dDataI' +
        'ni,'#39'DD/MM/YYYY'#39')) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)'
      
        '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLC' +
        'ORRETVALORES'
      '   ) X'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 215
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end>
    object QryTotalTOTNEGRV: TFloatField
      FieldName = 'TOTNEGRV'
    end
    object QryTotalTOPOSRV: TFloatField
      FieldName = 'TOPOSRV'
    end
    object QryTotalTOTLIQRV: TFloatField
      FieldName = 'TOTLIQRV'
    end
    object QryTotalVLROPERRV: TFloatField
      FieldName = 'VLROPERRV'
    end
    object QryTotalPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object QryTotalTOTCORRBMF: TFloatField
      FieldName = 'TOTCORRBMF'
    end
    object QryTotalTOTDESPBMF: TFloatField
      FieldName = 'TOTDESPBMF'
    end
    object QryTotalTOTAJNOR: TFloatField
      FieldName = 'TOTAJNOR'
    end
    object QryTotalTOTAJPOS: TFloatField
      FieldName = 'TOTAJPOS'
    end
    object QryTotalTOTOPERBMF: TFloatField
      FieldName = 'TOTOPERBMF'
    end
    object QryTotalTOTAJUSTE: TFloatField
      FieldName = 'TOTAJUSTE'
    end
    object QryTotalQTDORDBMF: TFloatField
      FieldName = 'QTDORDBMF'
    end
    object QryTotalQTDORDRV: TFloatField
      FieldName = 'QTDORDRV'
    end
  end
  object dsTotal: TwwDataSource
    DataSet = QryTotal
    Left = 400
    Top = 215
  end
end
