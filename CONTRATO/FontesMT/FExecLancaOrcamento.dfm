inherited frmExecLancaOrcamento: TfrmExecLancaOrcamento
  Left = 80
  Top = 156
  HelpContext = 120029
  Caption = 'Lançamentos Orçamentários'
  ClientHeight = 457
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 46
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Valor'
  end
  inherited pnlFundo: TPanel
    Width = 729
    Height = 418
    object Splitter1: TSplitter
      Left = 285
      Top = 40
      Width = 3
      Height = 377
      Cursor = crHSplit
      Beveled = True
    end
    object Panel1: TPanel
      Left = 1
      Top = 40
      Width = 284
      Height = 377
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 284
        Height = 17
        Align = alTop
        Caption = 'Contratos'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgContratos: TwwDBGrid
        Left = 0
        Top = 17
        Width = 284
        Height = 360
        Selected.Strings = (
          'CODCONTRATOEMPR'#9'15'#9'Código'#9'F'
          'NOMECONTRATO'#9'60'#9'Nome'#9'T')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsContratos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object Panel2: TPanel
      Left = 288
      Top = 40
      Width = 440
      Height = 377
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 440
        Height = 17
        Align = alTop
        Caption = 'Itens'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 17
        Width = 440
        Height = 110
        Selected.Strings = (
          'NOMEOBJETO'#9'26'#9'Objeto'
          'NOME_ITEM'#9'30'#9'Item')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dsItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 127
        Width = 440
        Height = 250
        Align = alClient
        AllowDelete = False
        AllowInsert = False
        ColCount = 1
        DataSource = dsValorItem
        PanelHeight = 41
        PanelWidth = 424
        TabOrder = 2
        RowCount = 6
        object Label2: TLabel
          Left = 172
          Top = 20
          Width = 9
          Height = 13
          Caption = 'X'
        end
        object Label3: TLabel
          Left = 288
          Top = 21
          Width = 8
          Height = 13
          Caption = '='
        end
        object Label4: TLabel
          Left = 8
          Top = 3
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label5: TLabel
          Left = 46
          Top = 3
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label7: TLabel
          Left = 185
          Top = 3
          Width = 39
          Height = 13
          Caption = 'Quant.'
        end
        object Label8: TLabel
          Left = 300
          Top = 3
          Width = 30
          Height = 13
          Caption = 'Total'
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 17
          Width = 25
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'MES'
          DataSource = dsValorItem
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 183
          Top = 17
          Width = 101
          Height = 21
          DataField = 'QTDE'
          DataSource = dsValorItem
          TabOrder = 1
          OnExit = DBEdit2Exit
        end
        object DBEdit4: TDBEdit
          Left = 298
          Top = 17
          Width = 121
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TOTAL'
          DataSource = dsValorItem
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 47
          Top = 17
          Width = 121
          Height = 21
          DataField = 'VALOR'
          DataSource = dsValorItem
          TabOrder = 0
          OnExit = DBEdit2Exit
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 10
        Top = 11
        Width = 59
        Height = 13
        Caption = 'Exercício:'
      end
      object dbSpnAno: TwwDBSpinEdit
        Left = 72
        Top = 8
        Width = 65
        Height = 21
        Increment = 1
        Value = 2007
        TabOrder = 0
        UnboundDataType = wwDefault
        OnExit = dbSpnAnoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 557
      DockPos = 613
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 307
      DockPos = 363
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 165
        OnClick = dbSpnAnoExit
      end
      object btnIntegra: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Integrar'
        Default = True
        TabOrder = 2
        OnClick = btnIntegraClick
        Glyph.Data = {
          7E010000424D7E01000000000000760000002800000016000000160000000100
          0400000000000801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888008888888888888888888888008888888888888888888888008888
          888000000000000088008888888877777777777088008888888F888888888870
          88008888888F88888888887088008888888F89988888887088008888888FFFFF
          FFFFFF8088008888888888888888888888008888888888888888088888008888
          88888888888000888800888000000008880000088800888FFFFFFF0888880888
          8800888F44444F08888808888800888FFFFFFF08888708888800888F44444F08
          000008888800888FFFFFFF08000078888800888F444F7788888888888800888F
          FFFF788888888888880088888888888888888888880088888888888888888888
          8800}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 411
  end
  object cdsLancaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 123
    Top = 304
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 137
    Top = 224
  end
  object sqlItens: TCMSqlParams
    SQL.Strings = (
      'SELECT distinct'
      '             O.IDCONTRATO,'
      '             C.CODCONTRATOEMPR,'
      '             C.NOMECONTRATO,'
      '             OC.NOMEOBJETO,'
      '             IC.NOME_ITEM,                             '
      '             O.IDOBJETO,                               '
      '             O.IDITEM                                 '
      '           FROM'
      '             OBJETOSXITEMCONTR O,                      '
      '             CONTRATOCONTR C,                          '
      '             OBJETOCONTRATUAL OC,                      '
      '             ITEMCONTRATUAL IC,                        '
      '             RATEIOCENTROCUSTO R,                      '
      '             CONTRATOXORCAMEN CRO                      '
      '           WHERE                                       '
      '                 OC.IDOBJETO = O.IDOBJETO              '
      '             AND IC.IDITEM = O.IDITEM                  '
      '             AND C.IDCONTRATO = O.IDCONTRATO           '
      '             AND R.IDCONTRATO = C.IDCONTRATO           '
      '             AND R.IDITEM     = IC.IDITEM              '
      '             AND R.IDCONTAORCAMEN IS NOT NULL          '
      '             AND O.IDCONTRATO = CRO.IDCONTRATO(+)      '
      '             AND O.IDOBJETO   = CRO.IDOBJETO(+)        '
      '             AND O.IDITEM     = CRO.IDITEM(+)'
      '             AND CRO.ANO(+)   = 2007')
    ClientDataSet = cdsItens
    Left = 339
    Top = 80
  end
  object sqlContratos: TCMSqlParams
    SQL.Strings = (
      'select'
      '   0 as idcontrato,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' as nomecontrato,'
      '   '#39'12345678901234567890'#39' as CODCONTRATOEMPR'
      'from'
      '  dual'
      'where'
      '  1 = 2'
      ''
      '')
    ClientDataSet = cdsContratos
    Left = 137
    Top = 176
  end
  object cdsItens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsItensAfterScroll
    Left = 475
    Top = 72
  end
  object dsContratos: TDataSource
    DataSet = cdsContratos
    Left = 202
    Top = 225
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 395
    Top = 72
  end
  object sqlValorItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '             R.IDRATEIOCCUSTO,'
      '             O.IDCONTRATO,'
      '             C.CODCONTRATOEMPR,'
      '             C.NOMECONTRATO,'
      '             OC.NOMEOBJETO,'
      '             IC.NOME_ITEM,                             '
      '             O.IDOBJETO,                               '
      '             O.IDITEM,                                 '
      '             CRO.ANO,'
      '             CRO.MES,'
      '             CRO.VALOR,'
      '             DECODE(CRO.QTDE,0,1,NVL(CRO.QTDE,1)) AS QTDE,'
      
        '             (CRO.VALOR*DECODE(CRO.QTDE,0,1,NVL(CRO.QTDE,1))) AS' +
        ' TOTAL'
      '           FROM'
      '             OBJETOSXITEMCONTR O,                      '
      '             CONTRATOCONTR C,                          '
      '             OBJETOCONTRATUAL OC,                      '
      '             ITEMCONTRATUAL IC,                        '
      '             RATEIOCENTROCUSTO R,                      '
      '             CONTRATOXORCAMEN CRO                      '
      '           WHERE                                       '
      '                 OC.IDOBJETO = O.IDOBJETO              '
      '             AND IC.IDITEM = O.IDITEM                  '
      '             AND C.IDCONTRATO = O.IDCONTRATO           '
      '             AND R.IDCONTRATO = C.IDCONTRATO           '
      '             AND R.IDITEM     = IC.IDITEM              '
      '             AND R.IDCONTAORCAMEN IS NOT NULL          '
      '             AND O.IDCONTRATO = CRO.IDCONTRATO(+)      '
      '             AND O.IDOBJETO   = CRO.IDOBJETO(+)        '
      '             AND O.IDITEM     = CRO.IDITEM(+)'
      '             AND CRO.ANO(+)   = 2007'
      ' '
      ' '
      ' ')
    ClientDataSet = cdsValorItem
    Left = 595
    Top = 96
  end
  object dsValorItem: TDataSource
    DataSet = cdsValorItem
    Left = 547
    Top = 112
  end
  object cdsValorItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 659
    Top = 80
  end
end
