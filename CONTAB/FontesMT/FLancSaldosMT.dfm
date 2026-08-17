inherited frmLancSaldosMT: TfrmLancSaldosMT
  Left = 86
  Top = 101
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exibição de Lançamentos'
  ClientHeight = 393
  ClientWidth = 665
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 665
    Height = 355
    object dbgrdLancamentos: TwwDBGrid
      Left = 16
      Top = 171
      Width = 633
      Height = 166
      Selected.Strings = (
        'PLNPLANIL'#9'10'#9'Planilha'
        'PLNDATDIA'#9'10'#9'Data'
        'LACDEBCRE'#9'3'#9'D/C'
        'LACNUMLAN'#9'3'#9'N°'
        'LACVALOR'#9'14'#9'Valor'
        'LACNUMDOC'#9'11'#9'N° Documento'
        'NOMEMODULO'#9'50'#9'Sistema de Origem'
        'TIPDESCRICAO'#9'25'#9'Tipo de Operação'
        'HITCODHIST'#9'7'#9'Cód.Hist.'
        'LACHIST1'#9'40'#9'Histórico 1'
        'LACHIST2'#9'40'#9'Histórico 2'
        'LACHIST3'#9'40'#9'Histórico 3'
        'LACHIST4'#9'40'#9'Histórico 4'
        'LACHIST5'#9'40'#9'Histórico 5')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsLancamentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdLancamentosCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdLancamentosTopRowChanged
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 663
      Height = 161
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel1: TBevel
        Left = 1
        Top = 1
        Width = 654
        Height = 37
        Style = bsRaised
      end
      object Label1: TLabel
        Left = 16
        Top = 50
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label2: TLabel
        Left = 259
        Top = 50
        Width = 106
        Height = 13
        Caption = 'Sistema de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 131
        Height = 13
        Caption = 'Lançamentos da Conta'
      end
      object lblDesc: TLabel
        Left = 341
        Top = 16
        Width = 68
        Height = 13
        Caption = 'Período de '
      end
      object lblPeriodo: TLabel
        Left = 410
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 96
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 464
        Top = 49
        Width = 138
        Height = 13
        Caption = 'Código Histórico Padrão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object redValor: TRealEdit
        Left = 129
        Top = 63
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object cboValor: TComboBox
        Left = 16
        Top = 64
        Width = 109
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'maior ou igual a'
          'maior que'
          'igual a'
          'menor que'
          'menor ou igual a')
      end
      object dblkModulo: TwwDBLookupCombo
        Left = 259
        Top = 64
        Width = 192
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'NOMEMODULO')
        LookupTable = cdsModulo
        LookupField = 'IDMODULO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object btnFiltra: TBitBtn
        Left = 253
        Top = 107
        Width = 177
        Height = 26
        Caption = 'Selecionar &Lançamentos'
        TabOrder = 3
        OnClick = btnFiltraClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
          33333333330F803333333333330F803333333333330F803333333333308F8703
          3333333308F88870333333308F88888703333308F88888887033308F88888888
          870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
          FF03333337FFFFFF77333333337FFF7733333333333777333333}
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 15
        Top = 110
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'25'#9'Operação')
        LookupTable = cdsTipoOper
        LookupField = 'TIPCODIGO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkHist: TwwDBLookupCombo
        Left = 464
        Top = 64
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HITCODHIST'#9'4'#9'Cód.'
          'HITDESCR1'#9'200'#9'Descrição')
        LookupTable = cdsHist
        LookupField = 'HITCODHIST'
        Options = [loColLines]
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object mskConta: TMaskEdit
        Left = 152
        Top = 16
        Width = 113
        Height = 15
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = 'Conta'
      end
    end
    object btnPla: TBitBtn
      Left = 448
      Top = 103
      Width = 202
      Height = 43
      Caption = ' &Planilha / Lançamentos'
      TabOrder = 2
      OnClick = btnPlaClick
      Glyph.Data = {
        F6020000424DF602000000000000760000002800000021000000200000000100
        0400000000008002000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770077777788888770000000777777777777777700AF0777788000077000
        00007777777777777700FAFA07778000B0077000000077777777777700AFAFAF
        A07780F0000770000000777777777700FAFAFA88808880F00007700000007777
        777700AFAFAF8000000000F000077000000077777700FAFAFAF80777777770F0
        000770000000777700AFAFAFAF00F77FFFFFF0F00007700000007770FAFAFAFA
        FA0F70077FFFF0F00007700000007770AFAFAFAF000F00000000F0F000077000
        000077770AFAFA22F30003333330700000077000000077770FAF22AFA20F0000
        7FF70077777770000000777770FAFAF22A0F7777FF70F0777777700000007777
        70AFA22FAF20FFFFF7AFAF077777700000007777770AFAFA22FA000000FAFA07
        7777700000007777770FAF22AFA22FAF22AFAFA077777000000077777770FAFA
        F22AFA22FAF22AF077777000000077777770AFA22FAFAFAFA22FAFAF07777000
        0000777777770AFAFAFAFAF22AFA22FA077770000000777777770FAF55AFAFAF
        AF22AFAFA077700000007777777770FA55F555FA22FAFAFAF077700000007777
        777770AFA555A55FAFAFAFAFAF077000000077777777770AF55AA55AFAFAFAFA
        FA077000000077777777770FAF5555AFAFAFAFAF007770000000777777777770
        FA55FAFAFAFAFA00777770000000777777777770AFAFAFAFAFAF007777777000
        00007777777777770AFAFAFAFA0077777777700000007777777777770FAFAFAF
        0077777777777000000077777777777770FAFA00777777777777700000007777
        7777777770AF0077777777777777700000007777777777777700777777777777
        7777700000007777777777777777777777777777777770000000}
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 665
    Height = 38
    LimitToOneRow = False
    inherited tb97Fundo: TToolbar97
      Left = 437
      DockPos = 437
      inherited bbtnSair: TBitBtn
        Height = 32
        Caption = '&Voltar'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 32
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 403
  end
  object dsLancamentos: TwwDataSource
    DataSet = cdsLancamentos
    Left = 344
    Top = 264
  end
  object cdsLancamentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 248
  end
  object cdsHist: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 304
  end
  object sqlLancamentos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.LACNUMLAN, L.LACDEBCRE, L.LACNUMDOC, L.LACVALOR,'
      '   L.LACHIST1, L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5,'
      '   L.HITCODHIST, M.NOMEMODULO, T.TIPDESCRICAO, P.PLNCODIGO,'
      '   P.PLNPLANIL, P.PLNDATDIA, P.PEREXERCICIO, P.PERNUMERO'
      'FROM'
      '   LANCAMENTO L, MODULO M, TIPOPER T, PLANILHA P'
      'WHERE'
      '   (L.IDMODULO  = M.IDMODULO) AND'
      '   (L.TIPCODIGO = T.TIPCODIGO) AND'
      '   (L.PLNCODIGO = P.PLNCODIGO) AND'
      '   ((RTRIM(L.PLACONTA) = RTRIM(:CONTA)) AND'
      '   (L.PLANO       =:PLANO)) AND'
      '   (P.PERNUMERO    =:PERIODO) AND'
      '   (P.PEREXERCICIO =:EXERCICIO)'
      ' '
      ' ')
    ClientDataSet = cdsLancamentos
    Left = 496
    Top = 304
  end
  object sqlHist: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   HITCODHIST, HITDESCR1 '
      'FROM '
      '   HISTOPADRAO'
      'WHERE'
      '   IDPESSOA=:IDPESSOA'
      'ORDER BY '
      '   HITCODHIST')
    ClientDataSet = cdsHist
    Left = 413
    Top = 312
  end
  object cdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 613
    Top = 245
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   NOMEMODULO, IDMODULO '
      'FROM '
      '   MODULO'
      'ORDER BY '
      '   NOMEMODULO')
    ClientDataSet = cdsModulo
    Left = 549
    Top = 301
  end
  object sqlTipoOper: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   TIPDESCRICAO, TIPCODIGO '
      'FROM '
      '   TIPOPER'
      'ORDER BY '
      '   TIPDESCRICAO'
      '')
    ClientDataSet = cdsTipoOper
    Left = 421
    Top = 261
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 557
    Top = 245
  end
end
