inherited frmMTExcluiEfetCxPeq: TfrmMTExcluiEfetCxPeq
  Left = 3
  Top = 2
  Caption = 'Exclui Efetivação de Caixa Pequeno'
  ClientHeight = 423
  ClientWidth = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 384
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object Label2: TLabel
      Left = 400
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Favorecido'
    end
    object Label3: TLabel
      Left = 400
      Top = 64
      Width = 166
      Height = 13
      Caption = 'Valor Total dos Lançamentos'
    end
    object Label4: TLabel
      Left = 584
      Top = 64
      Width = 33
      Height = 13
      Caption = 'Saldo'
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 81
      Height = 13
      Caption = 'Nº do Borderô'
    end
    object Label6: TLabel
      Left = 232
      Top = 64
      Width = 111
      Height = 13
      Caption = 'Data da Efetivação'
    end
    object Panel1: TPanel
      Left = 1
      Top = 113
      Width = 724
      Height = 270
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Lançamentos do Caixa Pequeno'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Grdlanc: TwwDBGrid
        Left = 0
        Top = 32
        Width = 508
        Height = 238
        Selected.Strings = (
          'IDLANCCXPEQ'#9'10'#9'Nº do Lançamento'#9'F'
          'NODOCUMENTO'#9'20'#9'Nº do Documento'#9'F'
          'DATALANC'#9'10'#9'Data'#9'F'
          'VLRLANC'#9'10'#9'Valor'#9'F'
          'PLACONTA'#9'18'#9'Conta'#9'F'
          'CODSUBCONTA'#9'10'#9'Sub-Conta'#9'F'
          'CODCENTRORESPON'#9'10'#9'Centro de~Responsabilidade'#9'F'
          'UNIDNEGOC'#9'10'#9'Atividade~Projeto'#9'F'
          'SUBDESPESA'#9'40'#9'Sub-Despesa - FDO'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLanc
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 508
        Top = 32
        Width = 216
        Height = 238
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 216
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Histórico'
          TabOrder = 0
        end
        object memHist: TDBMemo
          Left = 0
          Top = 31
          Width = 216
          Height = 207
          TabStop = False
          Align = alClient
          DataField = 'HISTLANCAMENTO'
          DataSource = dsLanc
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object edDataEfet: TDBEdit
      Left = 232
      Top = 80
      Width = 153
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATAEFETBORDERO'
      DataSource = dsBord
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edNumBord: TRealEdit
      Left = 16
      Top = 80
      Width = 185
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 0
      WordWrap = False
      OnExit = edNumBordExit
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object edSaldo: TRealEdit
      Left = 584
      Top = 80
      Width = 137
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0.00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edForn: TEdit
      Left = 400
      Top = 32
      Width = 321
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edValTot: TDBRealEdit
      Left = 400
      Top = 80
      Width = 169
      Height = 21
      Alignment = taRightJustify
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '0,00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'TOTAL'
      DataSource = dsTot
    end
    object edCxPeq: TEdit
      Left = 16
      Top = 32
      Width = 369
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 378
      DockPos = 378
      inherited sep1: TToolbarSep97
        Left = 180
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 95
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 182
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = '&Excluir'
        TabOrder = 2
        OnClick = BtnSelClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777087777
          7777777770D08777777777770DD5087777777770DD8050877777770DD8DD0508
          777770DD8DDDD050877770D8DDDDDD060877708DDDDDDDD06087770DDDDDDD8E
          06077770DDDDD8E6E00777770DDD8E6E6E07777770D8E6E6E0777777770E6E6E
          077777777770E6E07777777777770E0777777777777770777777}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsLanc: TwwDataSource
    AutoEdit = False
    DataSet = cdsLanc
    Left = 21
    Top = 192
  end
  object dsTot: TwwDataSource
    AutoEdit = False
    DataSet = cdsTot
    Left = 19
    Top = 240
  end
  object dsCP: TwwDataSource
    AutoEdit = False
    DataSet = cdsCP
    Left = 21
    Top = 336
  end
  object dsBord: TwwDataSource
    AutoEdit = False
    DataSet = cdsBord
    Left = 21
    Top = 288
  end
  object cdsLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 71
    Top = 191
  end
  object cdsTot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 71
    Top = 239
  end
  object cdsCP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 63
    Top = 335
  end
  object cdsBord: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 63
    Top = 287
  end
end
