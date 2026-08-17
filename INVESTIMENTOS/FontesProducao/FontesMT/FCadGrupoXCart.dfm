inherited frmCadGrupoXCart: TfrmCadGrupoXCart
  Left = 74
  Top = 195
  HelpContext = 790014
  Caption = 'Manutenção'
  ClientHeight = 384
  ClientWidth = 785
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 785
    Height = 345
    inherited bvlSepTit: TBevel
      Width = 783
    end
    inherited pnlTitulo: TPanel
      Width = 783
      inherited lbNomDescricao: TfcLabel
        Width = 228
        Caption = 'Composição do Grupo'
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 93
      Width = 783
      Height = 251
      Align = alClient
      TabOrder = 1
      object pnlPortfolio: TPanel
        Left = 435
        Top = 1
        Width = 347
        Height = 249
        Align = alRight
        BevelInner = bvLowered
        BorderWidth = 2
        TabOrder = 1
        object Panel9: TPanel
          Left = 4
          Top = 4
          Width = 339
          Height = 34
          Align = alTop
          BevelInner = bvLowered
          Caption = 'CARTEIRAS DISPONÍVEIS'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgCartDisp: TwwDBGrid
          Left = 4
          Top = 38
          Width = 339
          Height = 207
          Selected.Strings = (
            'DESCCARTINVEST'#9'60'#9'Carteira')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCartDisp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = GridZebrado
          OnDblClick = dbgCartDispDblClick
          IndicatorColor = icBlack
          OnTopRowChanged = MudaLinha
        end
      end
      object pnlTipoInvestimento: TPanel
        Left = 1
        Top = 1
        Width = 347
        Height = 249
        Align = alLeft
        BevelInner = bvLowered
        BorderWidth = 1
        TabOrder = 0
        object Panel5: TPanel
          Left = 3
          Top = 3
          Width = 341
          Height = 34
          Align = alTop
          BevelInner = bvLowered
          Caption = 'CARTEIRAS DO GRUPO'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgGrupoXCart: TwwDBGrid
          Left = 3
          Top = 37
          Width = 341
          Height = 209
          Selected.Strings = (
            'DESCCARTINVEST'#9'60'#9'Carteira'#9'F'
            'IDGRUPOCARTEIRA'#9'10'#9'IDGRUPOCARTEIRA'
            'IDCARTEIRAINVEST'#9'10'#9'IDCARTEIRAINVEST'
            'IDGRUPOCARTXCART'#9'10'#9'IDGRUPOCARTXCART')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = GridZebrado
          OnDblClick = dbgGrupoXCartDblClick
          IndicatorColor = icBlack
          OnTopRowChanged = MudaLinha
        end
      end
      object pnlBotoes: TPanel
        Left = 348
        Top = 1
        Width = 87
        Height = 249
        Align = alClient
        Locked = True
        TabOrder = 2
        object btnPassaUm: TToolbarButton97
          Left = 1
          Top = 36
          Width = 85
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Flat = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333300333333333333333773333333333333070333
            333333333337F73333333333330770333333333333378F733333333333077703
            333333333337F8F733333333330777703333333333378F8F7333333333077777
            033333333337F8F8F7333333330777777033333333378F8F8F73333333077777
            703333333337F8F8F8733333330777770333333333378F8F8733333333077770
            333333333337F8F873333333330777033333333333378F873333333333077033
            333333333337F873333333333307033333333333333787333333333333003333
            3333333333377333333333333333333333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = btnPassaUmClick
        end
        object btnVoltaUm: TToolbarButton97
          Left = 1
          Top = 88
          Width = 85
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Flat = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333330033333333333333377333333333333070333
            33333333333787333333333330770333333333333378F7333333333307770333
            33333333378F873333333330777703333333333378F8F7333333330777770333
            333333378F8F8733333330777777033333333378F8F8F7333333307777770333
            3333337F8F8F8733333333077777033333333337F8F8F7333333333077770333
            333333337F8F873333333333077703333333333337F8F7333333333330770333
            33333333337F87333333333333070333333333333337F7333333333333300333
            3333333333337733333333333333333333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = btnVoltaUmClick
        end
        object btnPassaTodos: TToolbarButton97
          Left = 1
          Top = 140
          Width = 85
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Flat = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333330803300333333333378733773333333308033070333
            333333787337F73333333080330770333333337873378F733333308033077703
            333333787337F8F733333080330777703333337873378F8F7333308033077777
            033333787337F8F8F7333080330777777033337873378F8F8F73308033077777
            703333787337F8F8F8733080330777770333337873378F8F8733308033077770
            333333787337F8F873333080330777033333337873378F873333308033077033
            333333787337F873333330803307033333333378733787333333308033003333
            3333337873377333333333333333333333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = btnPassaTodosClick
        end
        object btnVoltaTodos: TToolbarButton97
          Left = 1
          Top = 192
          Width = 85
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Flat = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333330033080333333333377337873333333070330
            80333333333787337873333330770330803333333378F7337873333307770330
            80333333378F873378733330777703308033333378F8F7337873330777770330
            803333378F8F8733787330777777033080333378F8F8F7337873307777770330
            8033337F8F8F8733787333077777033080333337F8F8F7337873333077770330
            803333337F8F873378733333077703308033333337F8F7337873333330770330
            80333333337F87337873333333070330803333333337F7337873333333300330
            8033333333337733787333333333333333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          OnClick = btnVoltaTodosClick
        end
        object pnlEspacoSuperior: TPanel
          Left = 1
          Top = 1
          Width = 85
          Height = 36
          Align = alTop
          Color = clNavy
          TabOrder = 0
        end
      end
    end
    object pnlGrupo: TPanel
      Left = 1
      Top = 45
      Width = 783
      Height = 48
      Align = alTop
      TabOrder = 2
      object Label6: TLabel
        Left = 18
        Top = 4
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object dblGrupoAcesso: TwwDBLookupCombo
        Left = 18
        Top = 18
        Width = 412
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEGRUPO'#9'20'#9'Nome'#9'F')
        LookupTable = cdsGrupoAcesso
        LookupField = 'IDGRUPO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblGrupoAcessoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 785
    inherited tb97Fundo: TToolbar97
      Left = 613
      DockPos = 639
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 444
      DockPos = 470
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 363
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 48
    Top = 184
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 184
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.DESCCARTINVEST, G.IDGRUPO, G.IDCARTEIRAINVEST, G.IDGRUP' +
        'OACESSOXCART  '
      'FROM GRUPOACESSOXCART G, CARTEIRAINVEST C '
      'WHERE G.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST '
      '  AND G.IDGRUPO = 1'
      'ORDER BY C.DESCCARTINVEST ')
    Left = 72
    Top = 240
  end
  object dsCartDisp: TwwDataSource
    AutoEdit = False
    DataSet = cdsCartDisp
    Left = 576
    Top = 200
  end
  object cdsCartDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 200
  end
  object CMSqlParamsCartDisp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.DESCCARTINVEST, G.IDGRUPO, C.IDCARTEIRAINVEST, G.IDGRUP' +
        'OACESSOXCART '
      'FROM CARTEIRAINVEST C, '
      '     (SELECT IDGRUPOACESSOXCART, IDCARTEIRAINVEST, IDGRUPO '
      '      FROM GRUPOACESSOXCART '
      '      WHERE IDGRUPO = 1) G '
      'WHERE C.IDCARTEIRAINVEST = G.IDCARTEIRAINVEST(+) '
      '  AND G.IDGRUPO IS NULL '
      'ORDER BY C.DESCCARTINVEST'
      ' ')
    Left = 608
    Top = 256
  end
  object cdsGrupoAcesso: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 56
    Data = {
      B30100009619E0BD010000001800000003000B00000003000000A30007494447
      5255504F0800040000000000094E4F4D45475255504F01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      14000944455343524943414F0100490000000100055749445448020002002800
      02000D44454641554C545F4F5244455202008200010000000200044C43494404
      0001000908000000000000000000C057400F4154454E44494D454E544F303830
      30104154454E44494D454E544F20303830300000000000000000584012415445
      4E44494D454E544F504553534F414C134154454E44494D454E544F2050455353
      4F414C001000000000004053400941554449544F524941001000000000004056
      400E434F4E5441425F41444D5052455600100000000000C05140074745415041
      204900100000000000C056400547454154550010000000000040514005474543
      4F4500100000000000805340054745504C4F00100000000000405740114A5552
      49445F455354414749C152494F530000000000000040584008526F646F6C7068
      6F05546573746500100000000000405440055345434144}
  end
  object CMSqlParamsGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO, NOMEGRUPO, DESCRICAO '
      'FROM GRUPOACESSO '
      '--WHERE IDGRUPO = 1'
      'ORDER BY NOMEGRUPO ')
    Left = 448
    Top = 56
  end
end
