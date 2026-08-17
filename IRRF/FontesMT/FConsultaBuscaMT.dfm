inherited frmConsultaBusca: TfrmConsultaBusca
  Left = 164
  Top = 150
  HelpContext = 240019
  ActiveControl = edCPF
  Caption = 'Consulta Busca da Dirf - Anual'
  ClientHeight = 428
  ClientWidth = 1010
  Constraints.MinHeight = 455
  Constraints.MinWidth = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1010
    Height = 389
    object pcValoresNegativos: TPageControl
      Left = 2
      Top = 2
      Width = 1006
      Height = 383
      ActivePage = tbsAcerto
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tbsAcerto: TTabSheet
        Caption = 'Consulta Busca da DIRF'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 998
          Height = 67
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 116
            Top = 24
            Width = 72
            Height = 13
            Caption = 'Beneficiário:'
          end
          object Label2: TLabel
            Left = 8
            Top = 24
            Width = 27
            Height = 13
            Caption = 'Ano:'
          end
          object Label3: TLabel
            Left = 568
            Top = 41
            Width = 36
            Height = 13
            Caption = 'Folha:'
          end
          object Label4: TLabel
            Left = 418
            Top = 41
            Width = 57
            Height = 13
            Caption = 'IdPessoa:'
          end
          object Label5: TLabel
            Left = 808
            Top = 41
            Width = 32
            Height = 13
            Caption = 'Data:'
          end
          object Label6: TLabel
            Left = 418
            Top = 17
            Width = 37
            Height = 13
            Caption = 'Nome:'
          end
          object Label7: TLabel
            Left = 792
            Top = 17
            Width = 71
            Height = 13
            Caption = 'Nascimento:'
          end
          object Bevel1: TBevel
            Left = 406
            Top = 1
            Width = 2
            Height = 64
          end
          object Label8: TLabel
            Left = 688
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Informe:'
          end
          object edCPF: TEdit
            Left = 190
            Top = 21
            Width = 104
            Height = 21
            TabOrder = 0
          end
          object btnFiltra: TBitBtn
            Left = 302
            Top = 17
            Width = 93
            Height = 27
            Hint = 'Selecionar as pessoas com rendimentos negativos'
            Caption = '&Seleciona'
            Default = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnFiltraClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
              55555575555555775F55509999999901055557F55555557F75F5001111111101
              105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
              01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
              8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
              0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
              0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
              05555555575FF777755555555500055555555555557775555555}
            NumGlyphs = 2
          end
          object edtDataRef: TEdit
            Left = 40
            Top = 21
            Width = 49
            Height = 21
            TabOrder = 2
            Text = '2005'
          end
          object udAcerto: TUpDown
            Left = 89
            Top = 21
            Width = 16
            Height = 21
            Associate = edtDataRef
            Min = 2002
            Max = 3000
            Position = 2005
            TabOrder = 3
            Thousands = False
            Wrap = False
          end
          object cbIdFolha: TComboBox
            Tag = 1
            Left = 605
            Top = 38
            Width = 76
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            OnChange = cbIdFolhaChange
          end
          object cbIdPessoa: TComboBox
            Left = 480
            Top = 38
            Width = 81
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 5
            OnChange = cbIdFolhaChange
          end
          object cbData: TComboBox
            Tag = 2
            Left = 841
            Top = 38
            Width = 105
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 6
            OnChange = cbIdFolhaChange
          end
          object btnLimpa: TBitBtn
            Left = 955
            Top = 35
            Width = 26
            Height = 25
            Enabled = False
            TabOrder = 7
            OnClick = btnLimpaClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033338833333333333333333F333333333333
              0000333911833333983333333388F333333F3333000033391118333911833333
              38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003333
              9118333911183333338F33838F338F33000033333913333391113333338FF833
              38F338F300003333333333333919333333388333338FFF830000333333333333
              3333333333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object edNome: TEdit
            Left = 480
            Top = 12
            Width = 305
            Height = 21
            ReadOnly = True
            TabOrder = 8
          end
          object edNascimento: TEdit
            Left = 864
            Top = 12
            Width = 81
            Height = 21
            ReadOnly = True
            TabOrder = 9
          end
          object cbIdInforme: TComboBox
            Tag = 3
            Left = 741
            Top = 38
            Width = 60
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
            OnChange = cbIdFolhaChange
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 67
          Width = 998
          Height = 288
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBuscaDados
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 1010
    inherited tb97Fundo: TToolbar97
      Left = 391
      DockPos = 391
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 113
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 113
        Caption = '&Processar'
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 116
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 394
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsBuscaDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 394
  end
  object SqlBuscaDados: TCMSqlParams
    SQL.Strings = (
      'SELECT T2.IDLANCIRRF,'
      
        '        T2.NOME, T2.NUMDOCUMENTO, T2.CODDIRF, T2.IDBENEFIRRF, '#39'N' +
        #39' AS FLGBUSCA, '
      '        T2.DATAPAGAMENTO, '
      '        T2.IDHSTFOLHABENEF, '
      '        T2.IDINFORME, '
      '        T2.ORD, T2.CODNATUREZA, T2.MES, T2.RENDBRUTO AS VALOR '
      '        ,T2.FONTEPAGADORA '
      ' FROM (SELECT T.IDLANCIRRF,  '
      '              T.NOME, T.NUMDOCUMENTO, T.CODDIRF, T.IDBENEFIRRF, '
      '              T.ORD, T.CODNATUREZA, T.MES, '
      '              T.DATAPAGAMENTO, '
      '              T.IDINFORME, '
      '              T.IDHSTFOLHABENEF, '
      '              t.fontepagadora, '
      
        '              (T.JAN1 + T.FEV1 + T.MAR1 + T.ABR1 + T.MAI1 + T.JU' +
        'N1 + '
      
        '               T.JUL1 + T.AGO1 + T.SET1 + T.OUT1 + T.NOV1 + T.DE' +
        'Z1) AS RENDBRUTO '
      '       FROM ( SELECT MIN(L.IDLANCIRRF) AS IDLANCIRRF, '
      '                     L.IDHSTFOLHABENEF, '
      
        '                     P.NOME, P.NUMDOCUMENTO, I.CODDIRF, L.IDBENE' +
        'FIRRF, '
      '                     TO_CHAR(L.DATAPAGAMENTO, '#39'MM'#39') AS ORD, '
      '                     TO_CHAR(L.DATAPAGAMENTO, '#39'MONTH'#39') AS MES, '
      '                     L.DATAPAGAMENTO, '
      '                     li.fontepagadora, '
      '                     LI.IDINFORME, '
      
        '                     DECODE(L.CODNATUREZA,'#39'7416'#39','#39'0561'#39',L.CODNAT' +
        'UREZA) AS CODNATUREZA, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '1'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS JAN1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '2'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS FEV1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '3'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS MAR1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '4'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS ABR1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '5'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS MAI1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '6'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS JUN1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '7'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS JUL1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '8'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS AGO1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'0' +
        '9'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS SET1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'1' +
        '0'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS OUT1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'1' +
        '1'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS NOV1, '
      
        '                     SUM(DECODE(TO_CHAR(L.datapagamento,'#39'MM'#39'),'#39'1' +
        '2'#39',DECODE(I.CODDIRF,'#39'2'#39',DECODE(I.FLGNATUREZA,'#39'N'#39',LI.VLRLANC*-1,L' +
        'I.VLRLANC),0),0)) AS DEZ1  '
      '              FROM INFORME I, LANCXINFORME LI, '
      '                   LANCIRRF L, NATURENDIMENTO N, PESSOA P '
      
        '              WHERE (I.IDINFORME                      = LI.IDINF' +
        'ORME) '
      
        '                AND (LI.IDLANCIRRF                    = L.IDLANC' +
        'IRRF) '
      
        '                AND (L.CODNATUREZA                    = N.CODNAT' +
        'UREZA) '
      '                AND (N.FLGUSADONADIRF                 = '#39'S'#39') '
      '                AND (I.CODDIRF                        = 2) '
      
        '                AND (P.IDPESSOA                       = L.IDBENE' +
        'FIRRF) '
      '                AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18)'
      '                AND 1 = 2'
      
        '                AND (L.datapagamento BETWEEN TO_DATE('#39'01/01/2005' +
        #39','#39'DD/MM/YYYY'#39') AND '
      
        '                                             TO_DATE('#39'31/12/2005' +
        #39','#39'DD/MM/YYYY'#39')) '
      
        ' GROUP BY L.IDHSTFOLHABENEF, LI.IDINFORME, LI.FONTEPAGADORA, L.D' +
        'ATAPAGAMENTO, P.NOME, P.NUMDOCUMENTO, '
      
        '          DECODE(L.CODNATUREZA,'#39'7416'#39','#39'0561'#39',L.CODNATUREZA),I.CO' +
        'DDIRF, L.IDBENEFIRRF, '
      
        '          TO_CHAR(L.DATAPAGAMENTO, '#39'MM'#39'),   TO_CHAR(L.DATAPAGAME' +
        'NTO, '#39'MONTH'#39')) T) T2 '
      ' WHERE (T2.RENDBRUTO < 0) '
      ' ORDER BY T2.NOME, '
      '          T2.ORD, '
      '          T2.CODDIRF'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsBuscaDados
    Left = 44
    Top = 394
  end
  object dsBuscaDados: TwwDataSource
    DataSet = cdsBuscaDados
    Left = 15
    Top = 394
  end
  object cdsInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 346
  end
  object sqlInforme: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'N'#39' FLGBUSCA, IDINFORME, CODINFORME, NOMEINFORME '
      'FROM INFORME'
      'ORDER BY IDINFORME'
      ' ')
    ClientDataSet = cdsInforme
    Left = 44
    Top = 346
  end
  object dsInforme: TwwDataSource
    DataSet = cdsInforme
    Left = 15
    Top = 346
  end
end
