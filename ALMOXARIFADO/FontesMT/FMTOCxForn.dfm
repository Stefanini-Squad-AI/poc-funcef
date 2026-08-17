inherited FrmMTOCxForn: TFrmMTOCxForn
  Left = 59
  Top = 39
  Caption = 'Item da O.C. por Fornecedor'
  ClientHeight = 431
  ClientWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 392
    object grdOC: TwwDBGrid
      Left = 1
      Top = 21
      Width = 668
      Height = 143
      Selected.Strings = (
        'NUMOC'#9'10'#9'O.C.'
        'CODARTIGO'#9'14'#9'Cod. Artigo'
        'PLANOPREV'#9'50'#9'Plano Previdenciário'#9'F'
        'DESCPROD'#9'30'#9'Decrição do Item'
        'QTDE'#9'10'#9'Quantidade ~ Solicitada'
        'QTDEPEDIDA'#9'10'#9'Quantidade~da Compra'
        'QTDEPENDENTE'#9'10'#9'Quantidade ~ Pendente'
        'VALORUN'#9'10'#9'Valor Unitário'
        'CODMEDIDA'#9'4'#9'Unid.'
        'NUMSOLCOMPRA'#9'10'#9'Num. S.C.'
        'CODALMOXARIFADO'#9'10'#9'Almox'
        'CODCENTRORESPON'#9'10'#9'C. Respon.'
        'UNIDNEGOC'#9'10'#9'Atividade'
        'CODTIPRECDES'#9'15'#9'Tipo Desemb.'
        'CODCOR'#9'5'#9'Cor'
        'CODTAMANHO'#9'3'#9'Tam.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Ctl3D = False
      DataSource = FrmMTRecebMerc.dsOC
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = grdOCTitleButtonClick
      OnDblClick = grdOCDblClick
      IndicatorColor = icBlack
    end
    object grdOCAnted: TwwDBGrid
      Left = 1
      Top = 244
      Width = 668
      Height = 147
      Selected.Strings = (
        'PLANPREV'#9'50'#9'Plan. Prev'
        'NUMSOLCOMPRA'#9'10'#9'Nº SCI'
        'NUMOC'#9'8'#9'O.C.'
        'CODARTIGO'#9'14'#9'Código Item'
        'DESCPROD'#9'30'#9'Descrição do Item'
        'QTDERECEBDEVOL'#9'10'#9'Quantidade'
        'VLRUNITARIO'#9'10'#9'Valor Unitário'
        'CODMEDIDA'#9'4'#9'Unid.'
        'VLRESTOQUE'#9'10'#9'Valor do Estoque'
        'CODCENTROCUSTO'#9'10'#9'Centro de Custo'
        'CODFISCAL'#9'4'#9'Código Fiscal'
        'DATAVALIDADE'#9'10'#9'Validade'
        'CODALMOXARIFADO'#9'10'#9'Almoxarifado'
        'CODCENTRORESPON'#9'10'#9'C.Respon.'
        'UNIDNEGOC'#9'10'#9'Atividade'
        'CODTIPRECDES'#9'15'#9'Tipo Desemb.'
        'CODCOR'#9'5'#9'Cor'
        'CODTAMANHO'#9'3'#9'Tam.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = FrmMTRecebMerc.dsDet
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = grdOCAntedTitleButtonClick
      OnDblClick = grdOCAntedDblClick
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 668
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Item de O.C. Existentes'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 1
      Top = 223
      Width = 668
      Height = 21
      Align = alBottom
      BevelInner = bvLowered
      Caption = 'Item de O.C. para Serem Atendidos'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 1
      Top = 164
      Width = 668
      Height = 59
      Align = alBottom
      TabOrder = 4
      object btAdicionar: TSpeedButton
        Left = 468
        Top = 13
        Width = 94
        Height = 33
        Anchors = [akRight, akBottom]
        Caption = '&Adicionar'
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000077777777770000007000000077777777770FFFF0700000007777
          7777770FFFF07000000077777777770FFFF07000000070000000770FFFF07000
          000070FFFFF0770FFFF07000000070F777F0770FF0F07000000070FFFFF0770F
          0A007000000070F887F07700AAA07000000070FFF000770AAAAA0000000070F8
          80A077700AA07000000070FFF0AA0770AA077000000070F7700AA00AA0777000
          000070FFF0000AAA007770000000700000777000777770000000777777777707
          777770000000}
        OnClick = btAdicionarClick
      end
      object btDeletar: TSpeedButton
        Left = 567
        Top = 13
        Width = 94
        Height = 33
        Anchors = [akRight, akBottom]
        Caption = '&Remover'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        OnClick = btDeletarClick
      end
      object Label1: TLabel
        Left = 18
        Top = 10
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dblkPlanoPrev: TwwDBLookupCombo
        Left = 16
        Top = 25
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = cdsPlanPrevContab
        LookupField = 'idplanoprev'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblkPlanoPrevChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 502
      DockPos = 543
    end
  end
  object sqlPlanPrevContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' IDPLANOPREV,'
      ' NOME '
      'FROM PLANPREVCONTABIL '
      'ORDER BY NOME')
    ClientDataSet = cdsPlanPrevContab
    Left = 353
    Top = 168
  end
  object cdsPlanPrevContab: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 168
    Data = {
      BF0100009619E0BD010000001800000002000A000000030000006C000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      44544802000200320002000D44454641554C545F4F5244455202008200010000
      000200044C434944040001000908000000000000000000002C401E42656E6566
      ED63696F20446566696E69646F2052464653412F524546455200000000000000
      0046401A4342545520436F6E747269627569E7E36F20446566696E6964610000
      000000000000F03F05434F4D554D0000000000000000444020464C554D495452
      454E5320436F6E747269627569E7E36F20446566696E69646100000000000000
      0008401B4D455452D420436F6E747269627569E7E36F20446566696E69646100
      000000000000804E401E4D4554524F464F5220436F6E747269627569E7E36F20
      446566696E696461000000000000008040401B524546455220436F6E74726962
      7569E7E36F20446566696E696461000000000000008042401B52464653412043
      6F6E747269627569E7E36F20446566696E696461000000000000000030400852
      6F646F6C70686F0000000000000000204011526F646F6C70686F206461205369
      6C7661}
  end
  object dsOC: TwwDataSource
    AutoEdit = False
    DataSet = CdsOC
    Left = 581
    Top = 36
  end
  object spOC: TCMSqlParams
    SQL.Strings = (
      'select      '
      '     SI.IDPLANOPREV,'
      '     SI.IDPATRO,'
      '     SI.IDPROGRAMA,'
      '     '
      ''
      '     I.NUMOC,'
      '     I.CODARTIGO,'
      '     I.CODMEDIDA,'
      '     I.IDPRODVARI,'
      '     I.IDITEMOC,'
      '     SI.NUMSOLCOMPRA,'
      
        '     SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI)' +
        ',1,60) AS DESCPROD,'

      '     I.QTDEPEDIDA, '
      '     I.VALORUN,'
      '     P.CODFISCALPADRAO,'
      '     P.CODGRUPOPROD,'
      '     A.CODCOR,'
      '     A.CODTAMANHO,'
      '     S.CODALMOXARIFADO,'
      '     S.UNIDNEGOC,'
      '     S.CODCENTRORESPON,'
      '     S.CODCENTROCUSTO,'
      '     S.CUSTOESTOQUE,'
      '     S.IDPESSOA,'
      '     G.CODTIPRECDES,'
      '     G.RECPAG,'
      '     I.IDRESERVAORCAMEN,'
      '     AL.CODCUSTEIO,'
      '     O.DATAOC,'
      '     '
      '     RP.FLGOK,'
      '     RP.IDPROCESSO,'
      '     CO.*,'
      '     '
      '     TT.TOTALIOC AS QTDE,'
      '     TP.TOTALPEND AS QTDEPENDENTE'
      '     '
      ''
      'from ITEMOC I, OC O, SCITEMOC SO, ITEMSOLI SI,'
      '     PRODUTO P, ARTIGO A, SOLICOMP S, GRUPPROD G,'
      
        '     CONVER CI, CONVER CS, PRODVARI PV, RADINSTPROCESSO RP, ALMO' +
        'X AL, COTACOES CO,'
      '    ('
      '     SELECT'
      '         SO.IDITEMSOLI,'
      '         SUM(SB.QTDEBAIXADA) AS QTDEBAIXADA'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          SOLIBAIXADAS SB,'
      '          ITEMOC I,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (O.IDFORCLI = -1)'
      '        AND (O.IDPESSOA = -1)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '        AND (SI.IDITEMSOLI = SB.IDITEMSOLI(+))'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMSOLI) SB,'
      '    ('
      '     SELECT'
      '         SO.IDITEMOC,'
      '         SUM(SB.QTDEBAIXADA * CS.FATOR / CI.FATOR) AS TOTALSB'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          SOLIBAIXADAS SB,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = -1)'
      '        AND (O.IDPESSOA = -1)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '        AND (SO.IDITEMSOLI = SB.IDITEMSOLI(+))'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMOC) TB,'
      '    ('
      '     SELECT'
      '         SO.IDITEMOC,'
      '         SUM(SI.QTDEPEDIDA * CS.FATOR / CI.FATOR) AS TOTALIOC'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = -1)'
      '        AND (O.IDPESSOA = -1)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI   = SO.IDITEMSOLI)'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMOC) TT,'
      '    '
      '     ('
      '     SELECT'
      '         SO.IDITEMOC,'
      '         SUM(SI.QTDEPENDENTE * CS.FATOR / CI.FATOR) AS TOTALPEND'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = -1)'
      '        AND (O.IDPESSOA = -1)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI   = SO.IDITEMSOLI)'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMOC) TP'
      ''
      'where (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '  and (O.IDFORCLI = -1)'
      '  AND (O.IDPESSOA = -1)'
      '  AND (O.NUMOC    = I.NUMOC)'
      '  AND (I.IDITEMOC = SO.IDITEMOC)'
      '  AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '  AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '  AND (I.IDITEMOC = SO.IDITEMOC)'
      '  AND (I.CODARTIGO     = A.CODARTIGO)'
      '  AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '  AND (SO.NUMSOLCOMPRA = S.NUMSOLCOMPRA)'
      '  AND (P.CODGRUPOPROD  = G.CODGRUPOPROD)'
      '  AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '  AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '  AND (I.IDPRODVARI    = PV.IDPRODVARI(+))'
      '  AND (RP.IDPROCESSO(+)= O.IDPROCESSO)'
      '  AND ((O.IDPROCESSO IS NULL) OR ((O.IDPROCESSO IS NOT NULL)))'
      '  AND (I.IDITEMOC = CO.IDITEMOC(+))'
      '  AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      '  AND (S.IDPESSOA = AL.IDPESSOA)'
      '  AND (SB.IDITEMSOLI(+)= SI.IDITEMSOLI)'
      '  AND (TB.IDITEMOC(+)  = SO.IDITEMOC)'
      '  AND (TT.IDITEMOC(+)     = I.IDITEMOC)'
      '  AND (TT.IDITEMOC(+)     = I.IDITEMOC)'
      '  AND (TP.IDITEMOC(+)     = I.IDITEMOC) '
      '  AND (SI.QTDEPENDENTE > 0)'
      '  AND (I.IDITEMOC = CO.IDITEMOC(+))'
      ''
      'ORDER BY O.NUMOC, DESCPROD')
    ClientDataSet = CdsOC
    Left = 576
    Top = 123
  end
  object CdsOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 556
    Top = 78
  end
end
