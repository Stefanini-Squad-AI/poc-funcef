inherited frmAcertaValorMT: TfrmAcertaValorMT
  Left = 412
  Top = 189
  HelpContext = 240019
  ActiveControl = edtDataRef
  Caption = 'Compensação de Valor Negativo'
  ClientHeight = 428
  ClientWidth = 720
  Constraints.MinHeight = 455
  Constraints.MinWidth = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 389
    object pcValoresNegativos: TPageControl
      Left = 2
      Top = 2
      Width = 716
      Height = 383
      ActivePage = tbsAcerto
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnChange = pcValoresNegativosChange
      object tbsAcerto: TTabSheet
        Caption = 'Compensa Acerto'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 708
          Height = 105
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 9
            Width = 86
            Height = 13
            Caption = 'Ano do Acerto:'
          end
          object btnTodas: TSpeedButton
            Left = 453
            Top = 4
            Width = 125
            Height = 27
            Hint = 'Marca todas as autorizações'
            AllowAllUp = True
            Anchors = [akTop, akRight]
            Caption = 'Marcar todas'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E668866666
              608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
              66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
              66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
              660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnTodasClick
          end
          object btnInverter: TSpeedButton
            Left = 579
            Top = 4
            Width = 125
            Height = 27
            Hint = 'Desmarca todas as autorizações'
            AllowAllUp = True
            Anchors = [akTop, akRight]
            Caption = 'Inverter seleção'
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnInverterClick
          end
          object Label5: TLabel
            Left = 217
            Top = 46
            Width = 333
            Height = 13
            Caption = 'Filtro de Pessoas (CPF entre aspas, separados por virgula)'
          end
          object udAcerto: TUpDown
            Left = 193
            Top = 6
            Width = 16
            Height = 21
            Associate = edtDataRef
            Min = 2002
            Max = 3000
            Position = 2005
            TabOrder = 0
            Thousands = False
            Wrap = False
          end
          object edtDataRef: TEdit
            Left = 96
            Top = 6
            Width = 97
            Height = 21
            TabOrder = 1
            Text = '2005'
          end
          object btnFiltra: TBitBtn
            Left = 212
            Top = 4
            Width = 129
            Height = 27
            Hint = 'Selecionar as pessoas com rendimentos negativos'
            Caption = '&Seleciona'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
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
          object chbProcIntegral: TCheckBox
            Left = 9
            Top = 56
            Width = 176
            Height = 18
            Caption = 'Todos os Meses Buscados'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object edFiltroCPF: TEdit
            Left = 217
            Top = 64
            Width = 472
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 105
          Width = 708
          Height = 250
          ControlType.Strings = (
            'FLGBUSCA;CheckBox;S;N')
          PictureMasks.Strings = (
            'VALOR'#9'#,##0.00'#9'T'#9'T')
          Selected.Strings = (
            'FLGBUSCA'#9'1'#9'Processa'
            'NOME'#9'40'#9'Nome'
            'IDHSTFOLHABENEF'#9'10'#9'Versão de Pagto'
            'IDINFORME'#9'10'#9'IdInforme'#9'F'
            'MES'#9'10'#9'Mês'
            'VALOR'#9'10'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBuscaDados
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
    Width = 720
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
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 116
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
